unit uModbusManager;

interface

uses
  System.Classes, IdModbusClient;

type
TCaptureThread = class(TThread)
  private

  protected
    procedure Execute; override;
  public
    constructor Create();
  end;


TModbusManager = class
  private
//    mModBusClient: TIdModBusClient;
//    iDSig, iASig: Integer; // count of Active D/A signals
//    iDReg, iAReg: Integer; // count of D/A registers for Active channels for one sample period
//    regCount: Integer;  // count of registers for one sample
//    mBlocks: Integer;
    mRegArray: array[0..10200] of Word; //can support max 300 blocks -> 34 * 300 = 10200

  public
    IsConnected: Boolean;

  public
    constructor Create;
    destructor Destroy;
    procedure WriteConfig(mModBusClient: TIdModBusClient);
    procedure ReadData(mModBusClient: TIdModBusClient; blocks: Integer);
    procedure WriteDemoData(mModBusClient: TIdModBusClient; cycle: Integer);
//  procedure CalRegCount;


end;

var
  ModbusManager: TModbusManager;

implementation

uses
  System.Math, System.SysUtils, uConfig, uPLCData;

constructor TModbusManager.Create;
begin
//  mModBusClient := TIdMOdBusClient.Create(nil);
//  mBlocks := 30;
//  regCount := 0;
end;

destructor TModbusManager.Destroy;
begin
//  mModbusClient.Destroy;
//  if mModbusClient.Connected then
//    mModbusClient.Disconnect;

//  mModbusClient.Free;
end;

procedure TModbusManager.WriteConfig(mModBusClient: TIdModBusClient);
begin
  mModBusClient.Port := Configurator.ServerPort;
  mModBusClient.Host := Configurator.ServerIP;

  try
  mModBusClient.WriteRegisters(AddressChannelSelection, Configurator.RegChSelection);
  mModBusClient.WriteRegisters(AddressChannelType, Configurator.RegChType);
  mModBusClient.WriteRegisters(AddressChannelTrigger, Configurator.RegChTrigger);
  mModBusClient.WriteRegister(AddressTriggerPosition, Configurator.RegTriggerPosition);
  mModBusClient.WriteRegister(AddressThresholdD, Configurator.RegThresholdD);
  mModBusClient.WriteRegister(AddressMinimalA, Configurator.RegMinimalA);
  mModBusClient.WriteRegister(AddressMaximumA, Configurator.RegMaximumA);
  mModBusClient.WriteRegister(AddressBlockCount, Configurator.BlockCount);
  mModBusClient.WriteRegister(AddressSamplingPeriod, Configurator.SamplingPeriod);
  except
  on E: Exception do
    raise E;
  end;

  if mModbusClient.Connected then
    mModbusClient.Disconnect;

//  WriteDemoData; // write demo data to Arduino for testing

end;

procedure TModbusManager.WriteDemoData(mModBusClient: TIdModBusClient; cycle: Integer);
var
  blocks: Integer;
  I: Integer;
begin
  mModBusClient.Port := Configurator.ServerPort;
  mModBusClient.Host := Configurator.ServerIP;

  blocks := 30;

  for I := 0 to 29 do
  begin
    mModBusClient.WriteRegister(AddressData + 4 * I, 0);
    mModBusClient.WriteRegister(AddressData + 4 * I + 1, I+ cycle * blocks);
//    mModBusClient.WriteRegister(AddressData + 4 * I + 2, Random(65535));
//    mModBusClient.WriteRegister(AddressData + 4 * I + 3, Random(65535));
  end;

  if mModbusClient.Connected then
    mModbusClient.Disconnect;

end;

procedure TModbusManager.ReadData(mModBusClient: TIdModBusClient; blocks: Integer);
var
  i, j, iShift: Integer;
//  tempPlcData: PLCData;
  tempRegs: array of Word;
  reg, bufReg : Word;
  timeStamp: UInt32;
begin
  //
  if not (Configurator.RegCount = 0) then
  begin
    mModBusClient.Port := Configurator.ServerPort;
    mModBusClient.Host := Configurator.ServerIP;

    mModBusClient.ReadHoldingRegisters(AddressData, blocks * Configurator.RegCount, mRegArray);

    //process data: append to PLCDataSet
    SetLength(tempRegs, Configurator.RegCount);
    for i := 0 to (blocks-1) do
    begin
      //copy one block
      for j := 0 to Configurator.RegCount-1 do
      begin
        tempRegs[j] := mRegArray[i*Configurator.RegCount + j];
      end;

      timeStamp := tempRegs[0] * 65536 + tempRegs[1];
//      tempPlcData.xusec := timeStamp; //calc time from the first two regs

      if not (Configurator.DSigCount = 0) then
      begin
      for j := 1 to Configurator.DSigCount do //
      begin
        if j < 16 then reg := tempRegs[2];
        if j > 15 then reg := tempRegs[3];
        iShift := j mod 16;
        iShift := 15 - iShift;
        bufReg := 1 shl iShift;
        bufReg := reg and bufReg;
        bufReg := bufReg shr iShift;

        //adding data to PLCData
//        tempPlcData.chdata[Configurator.ActiveDChNumbers[j]] := bufReg;

        //adding data to Configurator's channel list
        Configurator.ChannelList[Configurator.ActiveDChNumbers[j]].DataCount := Configurator.ChannelList[Configurator.ActiveDChNumbers[j]].DataCount + 1;
//        SetLength(Configurator.ChannelList[Configurator.ActiveDChNumbers[j]].Times, Configurator.ChannelList[Configurator.ActiveDChNumbers[j]].DataCount);
//        SetLength(Configurator.ChannelList[Configurator.ActiveDChNumbers[j]].Data, Configurator.ChannelList[Configurator.ActiveDChNumbers[j]].DataCount);
        Configurator.ChannelList[Configurator.ActiveDChNumbers[j]].Times[Configurator.ChannelList[Configurator.ActiveDChNumbers[j]].DataCount - 1] := timeStamp;
        Configurator.ChannelList[Configurator.ActiveDChNumbers[j]].Data[Configurator.ChannelList[Configurator.ActiveDChNumbers[j]].DataCount - 1] := bufReg;

      end;
      end;

      if not (Configurator.ASigCount = 0) then
      begin
      for j := 1 to Configurator.ASigCount do
      begin
        reg := tempRegs[2 + Configurator.DRegCount + j];

//        tempPlcData.chdata[Configurator.ActiveAChNumbers[j]] := reg;

        //adding data to chlist
        Configurator.ChannelList[Configurator.ActiveAChNumbers[j]].DataCount := Configurator.ChannelList[Configurator.ActiveAChNumbers[j]].DataCount + 1;
//        SetLength(Configurator.ChannelList[Configurator.ActiveAChNumbers[j]].Times, Configurator.ChannelList[Configurator.ActiveAChNumbers[j]].DataCount);
//        SetLength(Configurator.ChannelList[Configurator.ActiveAChNumbers[j]].Data, Configurator.ChannelList[Configurator.ActiveAChNumbers[j]].DataCount);
        Configurator.ChannelList[Configurator.ActiveAChNumbers[j]].Times[Configurator.ChannelList[Configurator.ActiveAChNumbers[j]].DataCount] := timeStamp;
        Configurator.ChannelList[Configurator.ActiveAChNumbers[j]].Data[Configurator.ChannelList[Configurator.ActiveAChNumbers[j]].DataCount] := reg;
      end;
      end;

//      PLCDS.PLCDCount := PLCDS.PLCDCount + 1;
//      PLCDS.PLCDataSeries[PLCDS.PLCDCount - 1] := tempPlcData;
    end;

//    PLCDS.isUpdated := True; // set isUpdated to True

    Configurator.IsDataUpdated := True;

  end;
end;



//procedure ModbusManager.CalRegCount;
//var
//  chNum: Integer;
//  regnum, shift, regLength : Integer;
//  reg, bufReg: Word;
//begin
//  regLength := 16;
//  iDSig := 0; iASig := 0; iDReg := 0; iAReg := 0;
//  for chNum := 0 to 31 do
//  begin
//    regnum := chNum div regLength;
//    shift := regLength - chNum mod regLength-1;
//
//    reg := Configurator.RegChSelection[regnum];
//    bufReg := 1 shl shift;
//    bufReg := reg and bufReg;
//    bufReg := bufReg shr shift;
//
//    if bufReg = 1 then
//    begin
//      reg := Configurator.RegChType[regnum];
//      bufReg := 1 shl shift;
//      bufReg := reg and bufReg;
//      bufReg := bufReg shr shift;
//
//      if bufReg = 0 then
//        iDSig := iDSig + 1
//      else if bufReg = 1 then
//        iASig := iASig + 1;
//    end;
//
//  end;
//
//  { iDReg }
//  if iDSig = 0 then
//    iDReg := 0
//  else if (iDSig > 0) and (iDSig < 17) then
//    iDReg := 1
//  else if iDSig > 16 then
//    iDReg := 2
//  else
//    iDReg := 0;
//
//  { iAReg }
//  iAReg := iASig;
//
//  regCount := iDReg + iAReg + 2; //additional 2 is for time stamp
//end;

constructor TCaptureThread.Create;
begin
  //
end;

procedure TCaptureThread.Execute;
begin
  //
end;

initialization
  ModbusManager := TModbusManager.Create;

finalization
  ModbusManager.Destroy;


end.
