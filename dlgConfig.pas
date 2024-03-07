unit dlgConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin,
  Vcl.ExtCtrls, Vcl.ColorGrd, Vcl.ActnColorMaps, Vcl.ActnMan, VCLTee.TeCanvas,
  Vcl.Mask, Vcl.WinXCtrls;

type
  TConfigForm = class(TForm)
    btnCancel: TButton;
    btnOK: TButton;
    gbServerSettings: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    gbChannelSettings: TGroupBox;
    edtIP: TEdit;
    edtPort: TSpinEdit;
    gbCh1: TGroupBox;
    chbCh1: TCheckBox;
    cmbAD1: TComboBox;
    btnEnableAll: TButton;
    btnDisableAll: TButton;
    cmbTrigger1: TComboBox;
    gbCh2: TGroupBox;
    chbCh2: TCheckBox;
    cmbAD2: TComboBox;
    cmbTrigger2: TComboBox;
    gbCh3: TGroupBox;
    chbCh3: TCheckBox;
    cmbAD3: TComboBox;
    cmbTrigger3: TComboBox;
    gbCh4: TGroupBox;
    chbCh4: TCheckBox;
    cmbAD4: TComboBox;
    cmbTrigger4: TComboBox;
    gbCh5: TGroupBox;
    chbCh5: TCheckBox;
    cmbAD5: TComboBox;
    cmbTrigger5: TComboBox;
    gbCh6: TGroupBox;
    chbCh6: TCheckBox;
    cmbAD6: TComboBox;
    cmbTrigger6: TComboBox;
    gbCh7: TGroupBox;
    chbCh7: TCheckBox;
    cmbAD7: TComboBox;
    cmbTrigger7: TComboBox;
    gbCh8: TGroupBox;
    chbCh8: TCheckBox;
    cmbAD8: TComboBox;
    cmbTrigger8: TComboBox;
    gbCh9: TGroupBox;
    chbCh9: TCheckBox;
    cmbAD9: TComboBox;
    cmbTrigger9: TComboBox;
    gbCh10: TGroupBox;
    chbCh10: TCheckBox;
    cmbAD10: TComboBox;
    cmbTrigger10: TComboBox;
    gbCh11: TGroupBox;
    chbCh11: TCheckBox;
    cmbAD11: TComboBox;
    cmbTrigger11: TComboBox;
    gbCh12: TGroupBox;
    chbCh12: TCheckBox;
    cmbAD12: TComboBox;
    cmbTrigger12: TComboBox;
    gbCh13: TGroupBox;
    chbCh13: TCheckBox;
    cmbAD13: TComboBox;
    cmbTrigger13: TComboBox;
    gbCh14: TGroupBox;
    chbCh14: TCheckBox;
    cmbAD14: TComboBox;
    cmbTrigger14: TComboBox;
    gbCh15: TGroupBox;
    chbCh15: TCheckBox;
    cmbAD15: TComboBox;
    cmbTrigger15: TComboBox;
    gbCh16: TGroupBox;
    chbCh16: TCheckBox;
    cmbAD16: TComboBox;
    cmbTrigger16: TComboBox;
    gbCh17: TGroupBox;
    chbCh17: TCheckBox;
    cmbAD17: TComboBox;
    cmbTrigger17: TComboBox;
    gbCh18: TGroupBox;
    chbCh18: TCheckBox;
    cmbAD18: TComboBox;
    cmbTrigger18: TComboBox;
    gbCh19: TGroupBox;
    chbCh19: TCheckBox;
    cmbAD19: TComboBox;
    cmbTrigger19: TComboBox;
    gbCh20: TGroupBox;
    chbCh20: TCheckBox;
    cmbAD20: TComboBox;
    cmbTrigger20: TComboBox;
    gbCh21: TGroupBox;
    chbCh21: TCheckBox;
    cmbAD21: TComboBox;
    cmbTrigger21: TComboBox;
    gbCh22: TGroupBox;
    chbCh22: TCheckBox;
    cmbAD22: TComboBox;
    cmbTrigger22: TComboBox;
    gbCh23: TGroupBox;
    chbCh23: TCheckBox;
    cmbAD23: TComboBox;
    cmbTrigger23: TComboBox;
    gbCh24: TGroupBox;
    chbCh24: TCheckBox;
    cmbAD24: TComboBox;
    cmbTrigger24: TComboBox;
    gbCh25: TGroupBox;
    chbCh25: TCheckBox;
    cmbAD25: TComboBox;
    cmbTrigger25: TComboBox;
    gbCh26: TGroupBox;
    chbCh26: TCheckBox;
    cmbAD26: TComboBox;
    cmbTrigger26: TComboBox;
    gbCh27: TGroupBox;
    chbCh27: TCheckBox;
    cmbAD27: TComboBox;
    cmbTrigger27: TComboBox;
    gbCh28: TGroupBox;
    chbCh28: TCheckBox;
    cmbAD28: TComboBox;
    cmbTrigger28: TComboBox;
    gbCh29: TGroupBox;
    chbCh29: TCheckBox;
    cmbAD29: TComboBox;
    cmbTrigger29: TComboBox;
    gbCh30: TGroupBox;
    chbCh30: TCheckBox;
    cmbAD30: TComboBox;
    cmbTrigger30: TComboBox;
    gbCh31: TGroupBox;
    chbCh31: TCheckBox;
    cmbAD31: TComboBox;
    cmbTrigger31: TComboBox;
    gbCh32: TGroupBox;
    chbCh32: TCheckBox;
    cmbAD32: TComboBox;
    cmbTrigger32: TComboBox;
    gbOthers: TGroupBox;
    Label3: TLabel;
    edtThresholdD: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edtMinA: TEdit;
    edtMaxA: TEdit;
    Label6: TLabel;
    edtTriggerPos: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtBlockCount: TEdit;
    btnChColor8: TButtonColor;
    btnChColor7: TButtonColor;
    btnChColor6: TButtonColor;
    btnChColor5: TButtonColor;
    btnChColor4: TButtonColor;
    btnChColor3: TButtonColor;
    btnChColor2: TButtonColor;
    btnChColor1: TButtonColor;
    edtChName8: TEdit;
    edtChName1: TEdit;
    edtChName9: TEdit;
    edtChName17: TEdit;
    edtChName25: TEdit;
    edtChName2: TEdit;
    edtChName3: TEdit;
    edtChName4: TEdit;
    edtChName5: TEdit;
    edtChName6: TEdit;
    edtChName7: TEdit;
    edtChName15: TEdit;
    edtChName16: TEdit;
    edtChName14: TEdit;
    edtChName13: TEdit;
    edtChName12: TEdit;
    edtChName11: TEdit;
    edtChName10: TEdit;
    edtChName18: TEdit;
    edtChName19: TEdit;
    edtChName20: TEdit;
    edtChName21: TEdit;
    edtChName22: TEdit;
    edtChName23: TEdit;
    edtChName24: TEdit;
    edtChName32: TEdit;
    edtChName31: TEdit;
    edtChName30: TEdit;
    edtChName29: TEdit;
    edtChName28: TEdit;
    edtChName27: TEdit;
    edtChName26: TEdit;
    btnChColor9: TButtonColor;
    btnChColor17: TButtonColor;
    btnChColor25: TButtonColor;
    btnChColor10: TButtonColor;
    btnChColor18: TButtonColor;
    btnChColor26: TButtonColor;
    btnChColor11: TButtonColor;
    btnChColor19: TButtonColor;
    btnChColor27: TButtonColor;
    btnChColor20: TButtonColor;
    btnChColor12: TButtonColor;
    btnChColor13: TButtonColor;
    btnChColor14: TButtonColor;
    btnChColor15: TButtonColor;
    btnChColor16: TButtonColor;
    btnChColor24: TButtonColor;
    btnChColor23: TButtonColor;
    btnChColor22: TButtonColor;
    btnChColor21: TButtonColor;
    btnChColor28: TButtonColor;
    btnChColor29: TButtonColor;
    btnChColor30: TButtonColor;
    btnChColor31: TButtonColor;
    btnChColor32: TButtonColor;
    Label12: TLabel;
    edtSamplingPeriod: TEdit;
    Label13: TLabel;
    tglDemo: TToggleSwitch;
    Label14: TLabel;
    procedure CheckBoxClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBoxChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnEnableAllClick(Sender: TObject);
    procedure btnDisableAllClick(Sender: TObject);
    procedure ColorButtonClick(Sender: TObject);
    procedure edtChNameChange(Sender: TObject);
    procedure edtChNameExit(Sender: TObject);
    procedure tglDemoClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadSettingsFromConfigurator;
    procedure SaveSettingsToConfigurator;
  public
    { Public declarations }
  end;

var
  ConfigForm: TConfigForm;

implementation

{$R *.dfm}
{$Optimization off}

uses
  StrUtils, uConfig, uModbusManager;

procedure TConfigForm.btnDisableAllClick(Sender: TObject);
var
  chNum: Integer;
  chbCh: TCheckBox;
  cmbAD: TComboBox;
  cmbTrigger: TComboBox;
  btnChColor: TButtonColor;
  edtChName: TEdit;
begin
  for chNum := 1 to 32 do
  begin
    chbCh := TCheckBox(FindComponent('chbCh' + IntToStr(chNum)));
    cmbAD := TComboBox(FindComponent('cmbAD' + IntToStr(chNum)));
    cmbTrigger := TComboBox(FindComponent('cmbTrigger' + IntToStr(chNum)));
    btnChColor := TButtonColor(FindComponent('btnChColor' + IntToStr(chNum)));
    edtChName := TEdit(FindComponent('edtChName' + IntToStr(chNum)));

    if Assigned(chbCh) then
    begin
      chbCh.Checked := False;
    end;

    if Assigned(cmbAD) then
    begin
      cmbAD.Enabled := False;
    end;

    if Assigned(cmbTrigger) then
    begin
      cmbTrigger.Enabled := False;
    end;

    if Assigned(btnChColor) then
    begin
      btnChColor.Enabled := False;
    end;

    if Assigned(edtChName) then
    begin
      edtChName.Enabled := False;
    end;

  end;
end;

procedure TConfigForm.btnEnableAllClick(Sender: TObject);
var
  chNum: Integer;
  chbCh: TCheckBox;
  cmbAD: TComboBox;
  cmbTrigger: TComboBox;
  btnChColor: TButtonColor;
  edtChName: TEdit;
begin
  for chNum := 1 to 32 do
  begin
    chbCh := TCheckBox(FindComponent('chbCh' + IntToStr(chNum)));
    cmbAD := TComboBox(FindComponent('cmbAD' + IntToStr(chNum)));
    cmbTrigger := TComboBox(FindComponent('cmbTrigger' + IntToStr(chNum)));
    btnChColor := TButtonColor(FindComponent('btnChColor' + IntToStr(chNum)));
    edtChName := TEdit(FindComponent('edtChName' + IntToStr(chNum)));

    if Assigned(chbCh) then
    begin
      chbCh.Checked := True;
    end;

    if Assigned(cmbAD) then
    begin
      cmbAD.Enabled := True;
    end;

    if Assigned(cmbTrigger) then
    begin
      cmbTrigger.Enabled := True;
    end;

    if Assigned(btnChColor) then
    begin
      btnChColor.Enabled := True;
    end;

    if Assigned(edtChName) then
    begin
      edtChName.Enabled := True;
    end;

  end;

end;


procedure TConfigForm.CheckBoxClick(Sender: TObject);
var
  chbCh: TCheckBox;
  cmbAD: TComboBox;
  cmbTrigger: TComboBox;
  btnChColor: TButtonColor;
  edtChName: TEdit;
  chNum: Integer;
  strChbName: string;
begin
  chbCh := Sender as TCheckBox;

  if Assigned(chbCh) then
  begin
    strChbName := chbCh.Name;
    if StartsStr('chbCh', strChbName) then  // if checkbox for channel selection
    begin
      chNum := chbCh.Tag;

      cmbAD := TComboBox(FindComponent('cmbAD' + IntToStr(chNum)));
      cmbTrigger := TComboBox(FindComponent('cmbTrigger' + IntToStr(chNum)));
      btnChColor := TButtonColor(FindComponent('btnChColor' + IntToStr(chNum)));
      edtChName := TEdit(FindComponent('edtChName' + IntToStr(chNum)));

      if Assigned(cmbAD) then
      begin
        cmbAD.Enabled := chbCh.Checked;
      end;

      if Assigned(cmbTrigger) then
      begin
        cmbTrigger.Enabled := chbCh.Checked;
      end;

      if Assigned(btnChColor) then
      begin
        btnChColor.Enabled := chbCh.Checked;
      end;

      if Assigned(edtChName) then
      begin
        edtChName.Enabled := chbCh.Checked;
      end;
    end;
  end;
end;

procedure TConfigForm.ColorButtonClick(Sender: TObject);
var
  chColor: TColor;
  btnChColor: TButtonColor;
  btnName: string;
  chNum: Integer;
begin
  btnChColor := Sender as TButtonColor;

  if Assigned(btnChColor) then
  begin
    btnName := btnChColor.Name;
    if StartsStr('btnChColor', btnName) then
    begin
      chNum := btnChColor.Tag;
//      Configurator.ChannelList[chNum].Color := btnChColor.SymbolColor;
    end;
  end;



end;

procedure TConfigForm.ComboBoxChange(Sender: TObject);
var
  comboBox: TComboBox;
  chNum: Integer;
begin
//  comboBox := Sender as TComboBox;
//
//  { AD combobox }
//  if StartsStr('cmbAD', comboBox.Name) then   //not working ??
//  begin
//    chNum := comboBox.Tag;
//    { set register }
//  end;
//
//  { Trigger Combobox }
//  if StartsText('cmbTrigger', 'cmbTrigger10') then    //not working ??
//  begin
//    chNum := comboBox.Tag;
//    { set register }
//  end;

end;

procedure TConfigForm.edtChNameExit(Sender: TObject);
var
  edtChName, edtOther: TEdit;
  strEdtName: string;
  chNum: Integer;
  i: Integer;
begin
  //
  edtChName := Sender as TEdit;
  if Assigned(edtChName) then
  begin
    strEdtName := edtChName.Name;

    if StartsStr('edtChName', strEdtName) then
    begin
      chNum := edtChName.Tag;

      for i := 1 to 32 do
      begin
        if i = chNum then
          continue;

        edtOther := TEdit(FindComponent('edtChName' + IntToStr(i)));

        if CompareStr(edtChName.Text, edtOther.Text) = 0 then
        begin
          ShowMessage('There is same channel name. Please enter other name...');
          edtChName.Text := '';
        end;

      end;
    end;

  end;
end;

procedure TConfigForm.edtChNameChange(Sender: TObject);
var
  edtChName: TEdit;
  strEdtName: string;
  chNum: Integer;
begin
  //
  edtChName := Sender as TEdit;
  if Assigned(edtChName) then
  begin
    strEdtName := edtChName.Name;

    if StartsStr('edtChName', strEdtName) then
    begin
      chNum := edtChName.Tag;
    end;

  end;
end;

procedure TConfigForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ModalResult = mrOK then   //save settings to configurator
  begin
    SaveSettingsToConfigurator;
//    ModbusManager.WriteConfig();
  end;
end;

procedure TConfigForm.FormCreate(Sender: TObject);
var
  chNum: Integer;
  chbCh: TCheckBox;
  cmbAD: TComboBox;
  cmbTrigger: TComboBox;
  btnChColor: TButtonColor;
  edtChName: TEdit;
begin
  //init controls
  for chNum := 1 to 32 do
  begin
    chbCh := TCheckBox(FindComponent('chbCh' + IntToStr(chNum)));
    cmbAD := TComboBox(FindComponent('cmbAD' + IntToStr(chNum)));
    cmbTrigger := TComboBox(FindComponent('cmbTrigger' + IntToStr(chNum)));
    btnChColor := TButtonColor(FindComponent('btnChColor' + IntToStr(chNum)));
    edtChName := TEdit(FindComponent('edtChName' + IntToStr(chNum)));

    if Assigned(chbCh) then
    begin
      chbCh.Tag := chNum;
      chbCh.Checked := True;
      chbCh.OnClick := CheckBoxClick;
    end;

    if Assigned(cmbAD) then
    begin
      cmbAD.Items.Clear;
      cmbAD.Items.Add('D');
      cmbAD.Items.Add('A');
      cmbAD.Tag := chNum;
      cmbAD.ItemIndex := 0;
      cmbAD.OnChange := ComboBoxChange;
    end;

    if Assigned(cmbTrigger) then
    begin
      cmbTrigger.Items.Clear;
      cmbTrigger.Items.Add('X');
      cmbTrigger.Items.Add('L');
      cmbTrigger.Items.Add('H');
      cmbTrigger.Items.Add('R');
      cmbTrigger.Items.Add('F');
      cmbTrigger.Items.Add('C');
      cmbTrigger.Tag := chNum;
      cmbTrigger.ItemIndex := 0;
      cmbTrigger.OnChange := ComboBoxChange;
      cmbTrigger.Visible := False;
    end;

    if Assigned(btnChColor) then
    begin
      btnChColor.Tag := chNum;
      btnChColor.SymbolColor := clBlack;
      btnChColor.OnClick := ColorButtonClick;
    end;

    if Assigned(edtChName) then
    begin
      edtChName.Tag := chNum;
      edtChName.Text := 'Channel' + IntToStr(chNum);
//      edtChName.OnChange := edtChNameChange;
      edtChName.OnExit := edtChNameExit;
    end;

  end;

end;

procedure TConfigForm.FormShow(Sender: TObject);
begin
  //load settings from configurator
  LoadSettingsFromConfigurator;
end;

procedure TConfigForm.LoadSettingsFromConfigurator;
var
  chNum: Integer;
  chbCh: TCheckBox;
  cmbAD: TComboBox;
  cmbTrigger: TComboBox;
  btnChColor: TButtonColor;
  edtChName: TEdit;
  regnum, shift, regLength, idx : integer;
  reg, bufReg: Word;
begin
  { server setting }
  edtIP.Text := Configurator.ServerIP;
  edtPort.Text := IntToStr(Configurator.ServerPort);

  { channel settings}
  regLength := 16;
  for chNum := 1 to 32 do
  begin
    chbCh := TCheckBox(FindComponent('chbCh' + IntToStr(chNum)));
    cmbAD := TComboBox(FindComponent('cmbAD' + IntToStr(chNum)));
    cmbTrigger := TComboBox(FindComponent('cmbTrigger' + IntToStr(chNum)));
    btnChColor := TButtonColor(FindComponent('btnChColor' + IntToStr(chNum)));
    edtChName := TEdit(FindComponent('edtChName' + IntToStr(chNum)));

    if Assigned(chbCh) then
    begin
//      regnum := (chNum-1) div regLength;
//      shift := regLength - (chNum-1) mod regLength-1;
//      reg := Configurator.RegChSelection[regnum];
//
//      bufReg := 1 shl shift;
//      bufReg := reg and bufReg;
//      bufReg := bufReg shr shift;
//
//      if bufReg = 1 then
//        chbCh.Checked := True
//      else if bufReg = 0 then
//        chbCh.Checked := False;

      chbCh.Checked := Configurator.ChannelList[chNum].IsActive;

    end;

    if Assigned(cmbAD) then
    begin
//      regnum := (chNum-1) div regLength;
//      shift := regLength - (chNum-1) mod regLength-1;
//      reg := Configurator.RegChType[regnum];
//
//      bufReg := 1 shl shift;
//      bufReg := reg and bufReg;
//      bufReg := bufReg shr shift;
//
//      cmbAD.ItemIndex := bufReg;

      cmbAD.ItemIndex := Integer(Configurator.ChannelList[chNum].SignalType);

    end;

    if Assigned(cmbTrigger) then  // 6 state: X, L, H, R, F, C
    begin
//      idx := cmbTrigger.ItemIndex;
//
//      regNum := (chNum-1) div 4;
//      shift := regLength - ((chNum-1) mod 4) * 4 - 4;
//      reg := Configurator.RegChTrigger[regNum];
//
//      bufReg := $000F shl shift;
//      bufReg := reg and bufReg;
//      bufReg := bufReg shr shift;
//
//      cmbTrigger.ItemIndex := bufReg;

      cmbTrigger.ItemIndex := Integer(Configurator.ChannelList[chNum].TriggerType);
    end;

    if Assigned(btnChColor) then
    begin
      btnChColor.SymbolColor := Configurator.ChannelList[chNum].Color;
    end;

    if Assigned(edtChName) then
    begin
      edtChName.Text := Configurator.ChannelList[chNum].Name;
    end;

  end;

  { others }
  edtTriggerPos.Text := IntToStr(Configurator.RegTriggerPosition);
  edtThresholdD.Text := IntToStr(Configurator.RegThresholdD);
  edtMinA.Text := IntToStr(Configurator.RegMinimalA);
  edtMaxA.Text := IntToStr(Configurator.RegMaximumA);
  edtBlockCount.Text := IntToStr(Configurator.BlockCount);
  edtSamplingPeriod.Text := IntToStr(Configurator.SamplingPeriod);

  if Configurator.IsDemo then
    tglDemo.State := tssOn
  else
    tglDemo.State := tssOff;

end;

procedure TConfigForm.SaveSettingsToConfigurator;
var
  chNum: Integer;
  chbCh: TCheckBox;
  cmbAD: TComboBox;
  cmbTrigger: TComboBox;
  btnChColor: TButtonColor;
  edtChName: TEdit;
  regnum, shift, regLength, idx : integer;
  reg, bufReg: Word;
  cbxText: string;
begin
  { server settings }
  Configurator.ServerIP := edtIP.Text;
  Configurator.ServerPort := StrToInt(edtPort.Text);

  {demo flag}
  Configurator.IsDemo := tglDemo.IsOn;

  { channel settings }
  regLength := 16;
  Configurator.ASigCount := 0; //init again
  Configurator.DSigCount := 0;
  SetLength(Configurator.ActiveAChNumbers, 0);
  SetLength(Configurator.ActiveDChNumbers, 0);
  for chNum := 1 to 32 do
  begin
    chbCh := TCheckBox(FindComponent('chbCh' + IntToStr(chNum)));
    cmbAD := TComboBox(FindComponent('cmbAD' + IntToStr(chNum)));
    cmbTrigger := TComboBox(FindComponent('cmbTrigger' + IntToStr(chNum)));
    btnChColor := TButtonColor(FindComponent('btnChColor' + IntToStr(chNum)));
    edtChName := TEdit(FindComponent('edtChName' + IntToStr(chNum)));

    {channel selection}
    if Assigned(chbCh) then
    begin
      regnum := (chNum-1) div regLength;
      shift := regLength - (chNum-1) mod regLength-1;
      reg := Configurator.RegChSelection[regnum];
      if chbCh.Checked then  //active channel
      begin
        bufReg := 1 shl shift;
        bufReg := reg or bufReg;
        reg := bufReg;
        Configurator.RegChSelection[regnum] := reg;
      end
      else
      begin
        bufReg := 1 shl shift;
        bufReg := reg and (not bufReg);
        reg := bufReg;
        Configurator.RegChSelection[regnum] := reg;
      end;

      Configurator.ChannelList[chNum].IsActive := chbCh.Checked;

    end;

    { channel type: A or D }
    if Assigned(cmbAD) then
    begin
      idx := cmbAD.ItemIndex;
      cbxText := cmbAD.Text;
      regnum := (chNum-1) div regLength;
      shift := regLength - (chNum-1) mod regLength-1;
      reg := Configurator.RegChType[regnum];
      if CompareStr(cbxText, 'A') = 0 then //if analog
      begin
        bufReg := 1 shl shift;
        bufReg := reg or bufReg;
        reg := bufReg;
        Configurator.RegChType[regnum] := reg;

        if chbCh.Checked then //if active
        begin
          Configurator.ASigCount := Configurator.ASigCount + 1;
          SetLength(Configurator.ActiveAChNumbers, Configurator.ASigCount + 1);
          Configurator.ActiveAChNumbers[Configurator.ASigCount] := chNum;
        end;
      end
      else if CompareStr(cbxText, 'D') = 0 then  //if digital signal, ...
      begin
        bufReg := 1 shl shift;
        bufReg := reg and (not bufReg);
        reg := bufReg;
        Configurator.RegChType[regnum] := reg;

        if chbCh.Checked then //if active, ...
        begin
          Configurator.DSigCount := Configurator.DSigCount + 1;
          SetLength(Configurator.ActiveDChNumbers, Configurator.DSigCount + 1);
          Configurator.ActiveDChNumbers[Configurator.DSigCount] := chNum;
        end;
      end;

      Configurator.ChannelList[chNum].SignalType := TSignalType(cmbAD.ItemIndex);
    end;

    { channel trigger }
    if Assigned(cmbTrigger) then  // 6 state: X, L, H, R, F, C
    begin
      idx := cmbTrigger.ItemIndex;
      cbxText := cmbTrigger.Text;
      regNum := (chNum-1) div 4;
      shift := regLength - ((chNum-1) mod 4) * 4 - 4;
      reg := Configurator.RegChTrigger[regNum];

      bufReg := $000F shl shift;
      reg := reg and (not bufReg);  //clear bits
      bufReg := idx shl shift;
      reg := reg or bufReg; //write bits
      Configurator.RegChTrigger[regnum] := reg;

      Configurator.ChannelList[chNum].TriggerType := TTriggerType(cmbTrigger.ItemIndex);
    end;

    { channel color }
    if Assigned(btnChColor) then
    begin
      Configurator.ChannelList[chNum].Color := btnChColor.SymbolColor;
    end;

    { channel name }
    if Assigned(edtChName) then
    begin
      Configurator.ChannelList[chNum].Name := edtChName.Text;
    end;

  end;

  { others }
  Configurator.RegTriggerPosition := StrToInt(edtTriggerPos.Text);
  Configurator.RegThresholdD := StrToInt(edtThresholdD.Text);
  Configurator.RegMinimalA := StrToInt(edtMinA.Text);
  Configurator.RegMaximumA := StrToInt(edtMaxA.Text);

  { block count }
  Configurator.BlockCount := StrToInt(edtBlockCount.Text);

  { Sampling Period }
  COnfigurator.SamplingPeriod := StrToInt(edtSamplingPeriod.Text);

  //calc digital reg count and analog reg count
  { DRegCount }
  if Configurator.DSigCount = 0 then
    Configurator.DRegCount := 0
  else if (Configurator.DSigCount > 0) and (Configurator.DSigCount < 17) then
    Configurator.DRegCount := 1
  else if Configurator.DSigCount > 16 then
    Configurator.DRegCount := 2
  else
    Configurator.DRegCount := 0;

  { ARegCount }
  Configurator.ARegCount := Configurator.ASigCount;
  { total reg count }
  Configurator.RegCount := Configurator.DRegCount + Configurator.ARegCount + 2; //additional 2 is for time stamp



end;

procedure TConfigForm.tglDemoClick(Sender: TObject);
begin
  //
//  if tglDemo.State = tssOn then
//    Configurator.IsDemo := True
//  else if tglDemo.State = tssOff then
//    Configurator.IsDemo := False;

end;

end.
