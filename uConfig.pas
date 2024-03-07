unit uConfig;

interface

uses
  Vcl.Graphics;
const
  ConfigFile = 'config.xml';

  AddressChannelSelection = 1;
  AddressChannelType = 3;
  AddressChannelTrigger = 5;
  AddressTriggerPosition = 13;
  AddressThresholdD = 14;
  AddressMinimalA = 15;
  AddressMaximumA = 16;
  AddressSamplingPeriod = 17;
  AddressBlockCount = 18;
  AddressData = 100;



type
  TTriggerType = (X=0, L=1, H=2, R=3, F=4, C=5); // None, Low, High, Rising, Falling, Compound

  TSignalType = (D=0, A=1); //Digital / Analogue

  TRegArray = array of Word; //register array

  TChannel = record
    Number: integer;
    Name: string;
    IsActive: boolean;
    SignalType: TSignalType;
    TriggerType: TTriggerType;
    Data: array[0..100000] of Double;
    Times: array[0..100000] of UInt32;
    DataCount: Integer;
    Color: TColor;
    idxToRead: Integer;
  end;

  TChannelArray = array of TChannel;



  TConfigurator = class
  private
    { flag for demo }
    mIsDemo: Boolean;

    {server settings}
    mServerIP: string;
    mServerPort: Integer;

    {channel settings}
    mRegChannelSelection: TRegArray;
    mRegChannelType: TRegArray;
    mRegChannelTrigger: TRegArray;

    {others}
    mRegTriggerPosition: Word;
    mRegThresholdD : Word;
    mRegMinimalA: Int16;
    mRegMaximumA: Word;

    mBlockCount: Word; // count of blocks for one time reading via Modbus
    mSamplingPeriod: Word; //sampling period in "ms"

    mDSigCount: Integer; // count of active digital signals
    mASigCount: Integer; // count of active analog signals

    mDRegCount: Integer; // count of registers for digital signals
    mARegCount: Integer; // count of registers for analog signals
    mRegCount: Integer; // total count of registers for one block per sample

  public

    { channel config }
    ChannelList: array[1..32] of TChannel; //channel settings
    ActiveDChNumbers: array of Integer;  //store active digital channel numbers
    ActiveAChNumbers: array of Integer;  //store active analog channel numbers
    CloneChannels: TChannelArray;
    IsDataUpdated: Boolean;

    constructor Create;
    destructor Destroy;

    procedure SaveConfig; //save config to file
    procedure LoadConfig; //load config from file

    property IsDemo: Boolean read mIsDemo write mIsDemo;

    property ServerIP: string read mServerIP write mServerIP;
    property ServerPort: Integer read mServerPort write mServerPort;

    property RegChSelection: TRegArray read mRegChannelSelection write mRegChannelSelection;
    property RegChType: TRegArray read mRegChannelType write mRegChannelType;
    property RegChTrigger: TRegArray read mRegChannelTrigger write mRegChannelTrigger;

    property RegTriggerPosition: Word read mRegTriggerPosition write mRegTriggerPosition;
    property RegThresholdD: Word read mRegThresholdD write mRegThresholdD;
    property RegMinimalA: Int16 read mRegMinimalA write mRegMinimalA;
    property RegMaximumA: Word read mRegMaximumA write mRegMaximumA;

    property BlockCount: Word read mBlockCount write mBlockCount;
    property SamplingPeriod: Word read mSamplingPeriod write mSamplingPeriod;

    property DSigCount: Integer read mDSigCount write mDSigCount;
    property ASigCount: Integer read mASigCount write mASigCount;

    property DRegCount: Integer read mDRegCount write mDRegCount;
    property ARegCount: Integer read mARegCount write mARegCount;
    property RegCount: Integer read mRegCount write mRegCount;

  end;

var
  Configurator: TConfigurator;


implementation

uses
  SysUtils, Xml.XMLDoc, Xml.XMLIntf, MAIN;

constructor TConfigurator.Create;
  var
    i : integer;
  begin
    mIsDemo := True; //demo mode is default

    mServerIP := '127.0.0.1';
    mServerPort := 502;

    SetLength(mRegChannelSelection, 2);
    mRegChannelSelection[0] := $FFFF;
    mRegChannelSelection[1] := $FFFF;

    SetLength(mRegChannelType, 2);
    mRegChannelType[0] := 0;
    mRegChannelType[1] := 0;

    SetLength(mRegChannelTrigger, 8);
    for i := 0 to 7 do
    begin
      mRegChannelTrigger[i] := 0;
    end;

    for i := 1 to 32 do
    begin
      ChannelList[i].Number := i;
      ChannelList[i].IsActive := True;
      ChannelList[i].Name := 'Channel' + IntToStr(i);
      ChannelList[i].SignalType := TSignalType.D;
      ChannelList[i].TriggerType := TTriggerType.X;
      ChannelList[i].Color := clBlack;
      ChannelList[i].DataCount := 0;
      ChannelList[i].idxToRead := -1;
    end;

    mRegTriggerPosition := 10;
    mRegThresholdD := 24;
    mRegMinimalA := -10;
    mRegMaximumA := 10;

    mBlockCount := 30; //default 30 blocks
    mSamplingPeriod := 1; // default 1ms

    mDSigCount := 0;
    mASigCount := 0;

    SetLength(ActiveDChNumbers, 0);
    SetLength(ActiveAChNumbers, 0);

    IsDataUpdated := False;

  end;

destructor TConfigurator.Destroy;
begin
  //
end;

procedure TConfigurator.SaveConfig;
var
  XDoc: TXMLDocument;
  RootNode, CatNode, ValueNode: IXMLNode;
  i: Integer;

begin
  XDoc := TXMLDocument.Create(MainForm);
  XDoc.Active := True;
  RootNode := XDoc.AddChild('Config');

  { Server Settings }
  CatNode := RootNode.AddChild('Server');
  ValueNode := CatNode.AddChild('IP');
  ValueNode.Text := ServerIP;
  ValueNode := CatNode.AddChild('Port');
  ValueNode.Text := IntToStr(ServerPort);

  { Regs for Channels...}
  CatNode := RootNode.AddChild('ChannelRegs');
  ValueNode := CatNode.AddChild('RegChannelSelection0');
  ValueNode.Text := IntToStr(RegChSelection[0]);
  ValueNode := CatNode.AddChild('RegChannelSelection1');
  ValueNode.Text := IntToStr(RegChSelection[1]);
  ValueNode := CatNode.AddChild('RegChannelType0');
  ValueNode.Text := IntToStr(RegChType[0]);
  ValueNode := CatNode.AddChild('RegChannelType1');
  ValueNode.Text := IntToStr(RegChType[1]);
  for i := 0 to 7 do
  begin
    ValueNode := CatNode.AddChild('RegChannelTrigger' + IntToStr(i));
    ValueNode.Text := IntToStr(RegChTrigger[i]);
  end;

  { channel }
  CatNode := RootNode.AddChild('Channels');
  for i := 1 to 32 do
  begin
    CatNode.AddChild('ChNumber' + IntToStr(i)).Text := IntToStr(ChannelList[i].Number);
    CatNode.AddChild('ChName' + IntToStr(i)).Text := ChannelList[i].Name;
    CatNode.AddChild('ChIsActive' + IntToStr(i)).Text := BoolToStr(ChannelList[i].IsActive);
    CatNode.AddChild('ChSignalType' + IntToStr(i)).Text := IntToStr(Integer(ChannelList[i].SignalType));
    CatNode.AddChild('ChTriggerType' + IntToStr(i)).Text := IntToStr(Integer(ChannelList[i].TriggerType));
    CatNode.AddChild('ChColor' + IntToStr(i)).Text := IntToStr(ChannelList[i].Color);
  end;

  {Others}
  CatNode := RootNode.AddChild('Others');
  ValueNode := CatNode.AddChild('TriggerPosition');
  ValueNode.Text := IntToStr(RegTriggerPosition);
  ValueNode := CatNode.AddChild('ThresholdD');
  ValueNode.Text := IntToStr(RegThresholdD);
  ValueNode := CatNode.AddChild('MinimalA');
  ValueNode.Text := IntToStr(RegMinimalA);
  ValueNode := CatNode.AddChild('MaximumA');
  ValueNode.Text := IntToStr(RegMaximumA);
  CatNode.AddChild('DSigCount').Text := IntToStr(DSigCount);
  CatNode.AddChild('ASigCount').Text := IntToStr(ASigCount);
  CatNode.AddChild('DRegCount').Text := IntToStr(DRegCount);
  CatNode.AddChild('ARegCount').Text := IntToStr(ARegCount);
  CatNode.AddChild('RegCount').Text := IntToStr(RegCount);
  CatNode.AddChild('BlockCount').Text := IntToStr(BlockCount);
  CatNode.AddChild('SamplingPeriod').Text := IntToStr(SamplingPeriod);

  //
  if FileExists(ConfigFile) then
  begin
      DeleteFile(ConfigFile);
  end;

  XDoc.SaveToFile(ConfigFile);
  XDoc.Free;
end;

procedure TConfigurator.LoadConfig;
var
  XDoc: TXMLDocument;
  RootNode, CatNode, ValueNode: IXMLNode;
  i: Integer;
  txt: string;
begin
  if not FileExists(ConfigFile) then
  begin
    Exit;
  end;

  XDoc := TXMLDocument.Create(MainForm);
  XDoc.Active := True;

  XDoc.LoadFromFile(ConfigFile);
  RootNode := XDoc.ChildNodes['Config'];

  {Server settings}
  CatNode := RootNode.ChildNodes['Server'];
  ServerIP := CatNode.ChildNodes['IP'].Text;
  ServerPort := StrToInt(CatNode.ChildNodes['Port'].Text);

  {ChannelRegs}
  CatNode := RootNode.ChildNodes['ChannelRegs'];
  RegChSelection[0] := StrToInt(CatNode.ChildNodes['RegChannelSelection0'].Text);
  RegChSelection[1] := StrToInt(CatNode.ChildNodes['RegChannelSelection1'].Text);
  RegChType[0] := StrToInt(CatNode.ChildNodes['RegChannelType0'].Text);
  RegChType[1] := StrToInt(CatNode.ChildNodes['RegChannelType1'].Text);
  for i := 0 to 7 do
  begin
    RegChTrigger[i] := StrToInt(CatNode.ChildNodes['RegChannelTrigger' + IntToStr(i)].Text);
  end;

  { channel }
  CatNode := RootNode.ChildNodes['Channels'];
  for i := 1 to 32 do
  begin
    txt := CatNode.ChildNodes['ChNumber' + IntToStr(i)].Text;
    ChannelList[i].Number := StrToInt(CatNode.ChildNodes['ChNumber' + IntToStr(i)].Text);
    txt := CatNode.ChildNodes['ChName' + IntToStr(i)].Text;
    ChannelList[i].Name := CatNode.ChildNodes['ChName' + IntToStr(i)].Text;
    txt := CatNode.ChildNodes['ChIsActive' + IntToStr(i)].Text;
    ChannelList[i].IsActive := StrToBool(CatNode.ChildNodes['ChIsActive' + IntToStr(i)].Text);
    txt := CatNode.ChildNodes['ChSignalType' + IntToStr(i)].Text;
    ChannelList[i].SignalType := TSignalType(StrToInt(CatNode.ChildNodes['ChSignalType' + IntToStr(i)].Text));
    txt :=  CatNode.ChildNodes['ChTriggerType' + IntToStr(i)].Text;
    ChannelList[i].TriggerType := TTriggerType(StrToInt(CatNode.ChildNodes['ChTriggerType' + IntToStr(i)].Text));
    txt :=  CatNode.ChildNodes['ChColor' + IntToStr(i)].Text;
    ChannelList[i].Color := StrToInt(CatNode.ChildNodes['ChColor' + IntToStr(i)].Text);
  end;

  {Others}
  CatNode := RootNode.ChildNodes['Others'];
  RegTriggerPosition := StrToInt(CatNode.ChildNodes['TriggerPosition'].Text);
  RegThresholdD := StrToInt(CatNode.ChildNodes['ThresholdD'].Text);
  RegMinimalA := StrToInt(CatNode.ChildNodes['MinimalA'].Text);
  RegMaximumA := StrToInt(CatNode.ChildNodes['MaximumA'].Text);
  DSigCount := StrToInt(CatNode.ChildNodes['DSigCount'].Text);
  ASigCount := StrToInt(CatNode.ChildNodes['ASigCount'].Text);
  DRegCount := StrToInt(CatNode.ChildNodes['DRegCount'].Text);
  ARegCount := StrToInt(CatNode.ChildNodes['ARegCount'].Text);
  RegCount := StrToInt(CatNode.ChildNodes['RegCount'].Text);
  BlockCount := StrToInt(CatNode.ChildNodes['BlockCount'].Text);
  SamplingPeriod := StrToInt(CatNode.ChildNodes['SamplingPeriod'].Text);

  //calc extra
  ASigCount := 0;
  DSigCount := 0;
  SetLength(ActiveDChNumbers, 0);
  SetLength(ActiveAChNumbers, 0);
  for i := 1 to 32 do
  begin
    if ChannelList[i].IsActive then
    begin
      if ChannelList[i].SignalType = TSignalType.A then
      begin
        ASigCount := ASigCount + 1;
        SetLength(ActiveAChNumbers, ASigCount+1);
        ActiveAChNumbers[ASigCount] := i;
      end
      else if ChannelList[i].SignalType = TSignalType.D then
      begin
        DSigCount := DSigCount + 1;
        SetLength(ActiveDChNumbers, DSigCount+1);
        ActiveDChNumbers[DSigCount] := i;
      end;
    end;

  end;

  XDoc.Free;
end;

initialization
  Configurator := TConfigurator.Create;

finalization
  Configurator.Free;



end.
