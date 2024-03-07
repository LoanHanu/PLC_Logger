unit LogWin;

interface

uses Winapi.Windows, System.Classes, System.SysUtils,
  Vcl.Graphics, Vcl.Forms, Vcl.Controls, Vcl.Dialogs,
  Vcl.StdCtrls, VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.TeeProcs,
  VCLTee.Chart, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, System.ImageList,
  Vcl.ImgList, Vcl.CheckLst, VCLTee.Series, SyncObjs, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdModBusClient, Vcl.WinXPanels,
  frmAnalysis;

type
  TViewSettings = record
    SeriesVisible: array of Boolean;
    FullPeriod: Boolean;
    DtStart: TDateTime;
    DtFinish: TDateTime;
    LimitRecord: Boolean;
    LimitRecordCount: Integer;
  end;

type
//  PLCData = record
//    xusec: UInt32;
//    chdata: array [1..32] of Int16;
//  end;
//
//  { the plc data class }
//  TPLCDataSet = class
//    public
//      { the data }
//      PLCDataSeries: array [0..100000] of PLCData;
//      { the count }
//      PLCDCount: Integer;
//      { the data offset }
//      choff: array [0..31] of Single;
//      { the factor }
//      chfact: array [0..31] of Single;
//      { the color }
//      chcolor: array [0..31] of TColor;
//    public
//      function getData(channel : integer; index :Integer): Single;
//  end;

  TLoadThread = class(TThread)
  private
    fForm: TForm;
  protected
    procedure Execute; override;
  public
    constructor Create(f: TForm);
  end;


type
  TLogChild = class(TForm)
    pnlLeft: TPanel;
    chartLog: TChart;
    pnlClient: TPanel;
    tlbTools: TToolBar;
    btnConfig: TToolButton;
    ilTools: TImageList;
    btnStart: TToolButton;
    chklstSeriesSelect: TCheckListBox;
    Series0: TLineSeries;
    btnPause: TToolButton;
    btnStop: TToolButton;
    demoTimer: TTimer;
    loadTimer: TTimer;
    SeriesCh5: TFastLineSeries;
    SeriesCh6: TFastLineSeries;
    SeriesCh7: TFastLineSeries;
    SeriesCh8: TFastLineSeries;
    SeriesCh9: TFastLineSeries;
    SeriesCh10: TFastLineSeries;
    SeriesCh11: TFastLineSeries;
    SeriesCh13: TFastLineSeries;
    SeriesCh14: TFastLineSeries;
    SeriesCh15: TFastLineSeries;
    SeriesCh16: TFastLineSeries;
    SeriesCh17: TFastLineSeries;
    SeriesCh18: TFastLineSeries;
    SeriesCh19: TFastLineSeries;
    SeriesCh20: TFastLineSeries;
    SeriesCh21: TFastLineSeries;
    SeriesCh22: TFastLineSeries;
    SeriesCh23: TFastLineSeries;
    SeriesCh24: TFastLineSeries;
    SeriesCh25: TFastLineSeries;
    SeriesCh26: TFastLineSeries;
    SeriesCh27: TFastLineSeries;
    SeriesCh28: TFastLineSeries;
    SeriesCh29: TFastLineSeries;
    SeriesCh30: TFastLineSeries;
    SeriesCh32: TFastLineSeries;
    lblTimeOnMousePos: TLabel;
    btnTriggerSetup: TToolButton;
    mModbusClient: TIdModBusClient;
    SeriesCh4: TFastLineSeries;
    SeriesCh12: TFastLineSeries;
    SeriesCh31: TFastLineSeries;
    SeriesCh1: TFastLineSeries;
    SeriesCh2: TFastLineSeries;
    SeriesCh3: TFastLineSeries;
    btnAnalyze: TToolButton;
    pnlState: TStackPanel;
    lblElapsedTime: TLabel;
    lblState: TLabel;
    lblMode: TLabel;
    elapsedTimer: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure chklstSeriesSelectDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormShow(Sender: TObject);
    procedure btnConfigClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnPauseClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure demoTimerProc(Sender: TObject);
    procedure loadTiemrProc(Sender: TObject);
    procedure elapsedTimerPorc(Sender: TObject);
    procedure chartLogMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure chartLogMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure chartLogMouseLeave(Sender: TObject);
    procedure btnTriggerSetupClick(Sender: TObject);
    procedure btnAnalyzeClick(Sender: TObject);
  private
    { load the data from the device }
    procedure LoadData();
    { clear the chart }
    procedure clearChart;

    { load from config }
    procedure LoadConfig;

    { create the ini file }
    procedure creatIni();
    procedure loadIni();
    procedure saveIni();
    procedure setIsLoading(value: Boolean);

  private
    { Private-Deklarationen }
    fIniFilePath: String;
    fViewSettings: TViewSettings;
//    channelAxes: array of TChartAxis;
    demoTimerCount: Integer;
    fCriticalSection:TCriticalSection; //for thread sync
    xBuf: array of Double;
    yBuf: array of Double;
    isStarted: Boolean;
    elapsedTimerCount: Integer;
    StartTime, EndTime: TDateTime;
    ElapsedTime: TTime;


//    HintWindow: THintWindow;
//    mouseX, mouseY: Integer;

  public
    fLoadThread: TLoadThread;
    fIsLoading: Boolean;
    fLoadPosition: Integer;
    fLoadCount: Integer;
    fDtStart: TDateTime;
    fDtFinish: TDateTime;
    { the plc data }
//    PLCDS:  TPLCDataSet;
    cycle: Integer;

//    AnalysisForm: TAnalysisForm;
  end;

implementation

//{$Optimization off}

uses
  System.Math, DateUtils, IniFiles, uConfig, uPLCData, Main, dlgConfig,
  dlgTriggerSetting, uModbusManager, dlgAnalyzeConfig;


const
  DEFAULT_RECORD_LIMIT = 5000;

  INI_FILE_NAME = 'settings.ini';
  //INI_FILE_NAME = 'databaseView.ini';
  INI_SECT_NAME = 'PLCSETTINGS';
  INI_KEY_SERIALS_VISIBLE = 'SerialsVisible';
  INI_KEY_CH_OFFSET = 'ChannelOffset';
  INI_KEY_CH_FACTOR = 'ChannelFactor';
  INI_KEY_CH_COLOR = 'ChannelColor';
  INI_KEY_FULL_PERIOD = 'FullPeriod';
  INI_KEY_DT_START = 'DtStart';
  INI_KEY_DT_FINISH = 'DtFinish';
  INI_KEY_RECORD_LIMIT = 'RecordLimit';
  INI_KEY_RECORD_LIMIT_COUNT= 'RecordLimitCount';

function dtStr(dt: TDateTime): String;
begin
  Result := FormatDateTime('yyyy-mm-dd hh:nn:ss', dt);
end;

//{ the plc data class }
//function TPLCDataSet.getData(channel : integer; index: Integer): Single;
//begin
//  { do the math }
//  result := PLCDataSeries[index].chdata[channel] *chfact[channel] +choff[channel];
//end;

{$R *.dfm}

procedure TLogChild.FormClose(Sender: TObject; var Action: TCloseAction);

begin
  Action := caFree;

  MainForm.isLogChildVisible := False;
end;

procedure TLogChild.FormCreate(Sender: TObject);
var
  I,J: Integer;
begin
  Caption := 'Log Window';
  SetLength(fViewSettings.SeriesVisible, chartLog.SeriesCount);

  { create the init file by default }
  creatIni();
  { load the setting }
  loadIni();

  { clear out the points }
//  for I := 0 to chartLog.SeriesCount -1 do
//  begin
//    chartLog[I].Clear;
//    chartLog[I].Visible := fViewSettings.SeriesVisible[i];
//    chklstSeriesSelect.Items.Add(chartLog[I].Title);
//    chklstSeriesSelect.Checked[I] := chartLog[I].Visible;
//  end;

  { create demo data }
//  for i := 0 to 9999 do
//  begin
//    PLCDS.PLCDataSeries[i].xusec := i;
//    for j := 0 to 17 do
//    begin
//      PLCDS.PLCDataSeries[i].chdata[j] := i;
//    end;
//  end;
//  PLCDS.PLCDCount := 10000;

  With chartLog do
  begin
    BufferedDisplay := True;

//    AutoRepaint := False;

    { setup chart's zoom and panning }
    AllowPanning := pmHorizontal; //panning in only x-direction
    Panning.MouseWheel := pmwNone;
    ScrollMouseButton := mbRight;

    Zoom.Allow := True;
    Zoom.MouseButton := mbLeft; //zoom in X axis by drag of left mouse button
    Zoom.MouseWheel := pmwNormal;

//    Zoom.Animated := True;
//    Zoom.AnimatedSteps := 7;
//    AnimatedZoomFactor := 2.0;

    Legend.Hide(); // hide legend

    {set time range}
    BottomAxis.Automatic := False;
    BottomAxis.AutomaticMaximum := False;
    BottomAxis.AutomaticMinimum := False;
    BottomAxis.Minimum := 0;
    BottomAxis.Maximum := 1000.000;

    Self.Height := 600;  //to prevent floating point overflow exception
  end;

  With demoTimer do
  begin
    Interval := 1;
    OnTimer := demoTimerProc;
    Enabled := False;
  end;

  With loadTimer do
  begin
    Interval := 30;
    OnTimer := loadTiemrProc;
    Enabled := False;
  end;

  With elapsedTimer do
  begin
    Interval := 30;
    OnTimer := elapsedTimerPorc;
    Enabled := False;
  end;

  isStarted := False;

  fCriticalSection := TCriticalSection.Create;

//  HintWindow := THintWindow.Create(Self);
//  HintWindow.Color := clInfoBk;
//  HintWindow.BorderColor := clBlack;


end;

procedure TLogChild.FormDestroy(Sender: TObject);
begin
  //
//  HintWindow.Free;
end;

procedure TLogChild.demoTimerProc(Sender: TObject);
var
  chNum: Integer;
  newVal, lastVal: Double;
  lastIndex: Integer;
  midTime: Double;
//  tmpPlcData: PLCData;
begin
  //
  demoTimerCount := demoTimerCount + 1; //increase timer count

  for chNum := 1 to 32 do
  begin
    if Configurator.ChannelList[chNum].IsActive then
    begin
//      tmpPlcData.xusec := demoTimerCount;

      if (Configurator.ChannelList[chNum].SignalType = TSignalType.D) then
      begin
//        tmpPlcData.chdata[chNum] := Random(2);
        newVal := Random(2);

        if  demoTimerCount > 1 then
        begin
          lastIndex:= chartLog[chNum].YValues.Count;
          lastVal:= chartLog[chNum].YValues.Last;
          if not (lastVal = newVal) then
          begin
            midTime := demoTimerCount - 0.5;
            chartLog[chNum].AddXY(midTime, lastVal);
            chartLog[chNum].AddXY(midTime, newVal);
          end;
        end;

        chartLog[chNum].AddXY(demoTimerCount, newVal);
        Configurator.ChannelList[chNum].DataCount := Configurator.ChannelList[chNum].DataCount + 1;
        Configurator.ChannelList[chNum].Times[Configurator.ChannelList[chNum].DataCount] := demoTimerCount;
        Configurator.ChannelList[chNum].Data[Configurator.ChannelList[chNum].DataCount] := newVal;
      end
      else if Configurator.ChannelList[chNum].SignalType = TSignalType.A then
      begin
//        tmpPlcData.chdata[chNum] := RandomRange(-10, 11);
        newVal := RandomRange(-10, 11);
        chartLog[chNum].AddXY(demoTimerCount, newVal);
        Configurator.ChannelList[chNum].DataCount := Configurator.ChannelList[chNum].DataCount + 1;
        Configurator.ChannelList[chNum].Times[Configurator.ChannelList[chNum].DataCount] := demoTimerCount;
        Configurator.ChannelList[chNum].Data[Configurator.ChannelList[chNum].DataCount] := newVal;
      end;
    end;
  end;

//  fCriticalSection.Enter;
//  PLCDS.PLCDCount := PLCDS.PLCDCount + 1;
//  PLCDS.PLCDataSeries[PLCDS.PLCDCount - 1] := tmpPlcData;
//  PLCDS.isUpdated := True;
//  fCriticalSection.Leave;
end;

procedure TLogChild.loadTiemrProc(Sender: TObject);
begin
  try
  ModbusManager.WriteDemoData(mModbusClient, cycle); //this is for testing, pls make it comment when you connect to real modbus server
  cycle := cycle + 1; //this is also for testing with Modbus Simulator

  ModbusManager.ReadData(mModbusClient, 30); //read
  LoadData;                   //load

  except
    on E: Exception do
    begin
      Self.loadTimer.Enabled := False; //stop loading
      Self.btnStart.Enabled := False;  //disable play button
      ShowMessage('Can not connect to modbus server!');
    end;

  end;


end;

procedure TLogChild.elapsedTimerPorc(Sender: TObject);
begin
  //
  EndTime := Now;
  ElapsedTime := EndTime - StartTime;

//  Self.elapsedTimerCount := elapsedTimerCount + 1;
//  Self.lblElapsedTime.Caption := 'Elapsed: ' + FormatDateTime('hh:nn:ss.zzz', ElapsedTime) + '    ';
  Self.lblElapsedTime.Caption := 'Elapsed: ' + IntToStr(MilliSecondsBetween(EndTime, StartTime)) + ' ms   ';
end;

procedure TlogChild.LoadConfig;
var
  i, sigCount: Integer;
  chTitle: String;
  axis: TChartAxis;
  axisIdx : Integer;
  margin: Double;
  itemIndex: Integer;
begin
  //init
  axisIdx := 0;
  margin := 0.1;
  chklstSeriesSelect.Items.Clear;
  clearChart;

  //origin left axis
  With chartLog.Axes.Left do
  begin
    StartPosition:=0;
    EndPosition:=0.1;
    Title.Caption:='               .'; // to make axis title shown
    Title.Font.Style:=[fsBold];
    Title.Angle := 0;
//    Title.Position := TAxisTitlePosition.tpEnd;
//    Title.Visible := False;
//    Visible := False;
//    Axis.Visible := False;
  end;

  //set count of channel axes
  sigCount := Configurator.DSigCount + Configurator.ASigCount;
  if sigCount = 0 then
    Exit;

//  SetLength(channelAxes, sigCount);
//  Self.chartLog.Height := 100* sigCount;
  margin := 100.0 / sigCount / 10;
  //load...
  for i := 1 to 32 do
  begin
    if Configurator.ChannelList[i].IsActive then
    begin
      chTitle := Configurator.ChannelList[i].Name;
      if Configurator.ChannelList[i].SignalType = TSignalType.D then
        chTitle := chTitle + '_D'
      else if Configurator.ChannelList[i].SignalType = TSignalType.A then
        chTitle := chTitle + '_A'
      else
        chTitle := chTitle + '_NONE';
      itemIndex := chklstSeriesSelect.Items.Add(chTitle);
      chklstSeriesSelect.Checked[itemIndex] := True;
      chklstSeriesSelect.ItemEnabled[itemIndex] := False;

      chartLog[i].Visible := True;  //set i-th series visible
//      chartLog[i].Title := Configurator.ChannelList[i].Name;
      chartLog[i].Title := chTitle;

      axis := TChartAxis.Create(chartLog);
      chartLog[i].CustomVertAxis := axis;
      chartLog[i].Color := Configurator.ChannelList[i].Color;

      with axis do
      begin
        Axis.Color:=clBlack ;
        Title.Caption := chTitle;
//        Title.Visible := False; //
        Title.Color := Configurator.ChannelList[i].Color;
        Title.Font.Style:=[fsBold];
        Title.Angle := 0;
        Title.Width := 100;
        PositionPercent := 0; //percentage of Chart rectangle
        StartPosition:= axisIdx * (100 / sigCount);
        EndPosition:= (axisIdx + 1) * (100/ sigCount) - margin;
      end;

//      channelAxes[axisIdx] := axis;
      axisIdx := axisIdx + 1;

    end;
  end;

  if Configurator.IsDemo then
    lblMode.Caption := 'CaptureMode: DemoDevice   '
  else
    lblMode.Caption := 'CaptureMode: Controllino   ';
end;

procedure TLogChild.FormShow(Sender: TObject);
begin
  // load from config
  LoadConfig;
end;

procedure TLogChild.LoadData();
var
  I,j,recCount: Integer;
  S: String;
  dtDiff: TDateTime;
  fDtStart : Integer;
  fDtFinish : integer;
  midTime: Double;
  k: Integer;
begin

  fCriticalSection.Enter;

//  chartLog.LockDrawing;
  chartLog.AutoRepaint := False;
  for I := 1 to 32 do
  begin
    if Configurator.ChannelList[I].IsActive and (Configurator.ChannelList[I].DataCount > 0) then
    begin
      k := 0;
      SetLength(xBuf, 0);
      SetLength(yBuf, 0);
      for j := Configurator.ChannelList[I].idxToRead to Configurator.ChannelList[I].DataCount - 1 do
      begin
        if (Configurator.ChannelList[I].SignalType = TSignalType.D) and (j > 0) then
        begin
          if not (Configurator.ChannelList[I].Data[j] = Configurator.ChannelList[I].Data[j-1]) then
          begin
            midTime := (Configurator.ChannelList[I].Times[j] + Configurator.ChannelList[I].Times[j-1]) / 2.0;
//            chartLog[I].AddXY(midTime, Configurator.ChannelList[I].Data[j-1]);
//            chartLog[I].AddXY(midTime, Configurator.ChannelList[I].Data[j]);
            SetLength(xBuf, k+2);
            SetLength(yBuf, k+2);
            xBuf[k] := midTime;
            yBuf[k] := Configurator.ChannelList[I].Data[j-1];
            xBuf[k+1] := midTime;
            yBuf[k+1] := Configurator.ChannelList[I].Data[j];
            k := k + 2;
          end;
        end;
//          chartLog[I].AddXY(Configurator.ChannelList[I].Times[j], Configurator.ChannelList[I].Data[j]);
        SetLength(xBuf, k+1);
        SetLength(yBuf, k+1);
        xBuf[k] := Configurator.ChannelList[I].Times[j];
        yBuf[k] := Configurator.ChannelList[I].Data[j];
        k := k + 1;
      end;
      TFastLineSeries(chartLog[I]).AutoRepaint := False;
      chartLog[I].AddArray(xBuf, yBuf);
      TFastLineSeries(chartLog[I]).AutoRepaint := True;
      Configurator.ChannelList[I].idxToRead := Configurator.ChannelList[I].DataCount;
    end;
  end;
//  chartLog.UnlockDrawing;
  chartLog.AutoRepaint := True;
//  chartLog.Draw; //take so long...
//  chartLog.Repaint;

  fCriticalSection.Leave;

////////////////////////////////////////////////////////////////////////////////
//  fCriticalSection.Enter;
////  for I := 1 to 32 do
////  begin
////    chartLog[I].BeginUpdate;
////  end;
//  if PLCDS.isUpdated and (PLCDS.idxLastData < PLCDS.PLCDCount-1) then
//  begin
//    chartLog.LockDrawing;
////    chartLog.AutoRepaint := False;
////    chartLog.BufferedDisplay := True;
////    pnlClient.DoubleBuffered := True;
//    for I := PLCDS.idxLastData+1 to PLCDS.PLCDCount-1 do
//    begin
//      for j := 1 to 32 do
//      begin
//        if Configurator.ChannelList[j].IsActive then
//        begin
////          chartLog[j].BeginUpdate;
//          if (Configurator.ChannelList[j].SignalType = TSignalType.D) and (I > 0) then
//          begin
//            if not (PLCDS.PLCDataSeries[I-1].chdata[j] = PLCDS.PLCDataSeries[I].chdata[j]) then //when level change, need to interpolate
//            begin
//              midTime := (PLCDS.PLCDataSeries[I-1].xusec + PLCDS.PLCDataSeries[I].xusec) / 2.0;
//              chartLog[j].AddXY(midTime, PLCDS.PLCDataSeries[I-1].chdata[j]);
//              chartLog[j].AddXY(midTime, PLCDS.PLCDataSeries[I].chdata[j]);
//            end;
//          end;
//
//          chartLog[j].AddXY(PLCDS.PLCDataSeries[I].xusec, PLCDS.PLCDataSeries[I].chdata[j]);
//
////          chartLog[j].EndUpdate;
//        end;
//      end;
//    end;
//
//    PLCDS.idxLastData := PLCDS.PLCDCount;
//    PLCDS.isUpdated := False;  //set PLCDS.isUpdated false
//
////    pnlClient.DoubleBuffered := False;
////    chartLog.Draw;
//    chartLog.UnlockDrawing;
//  end;
////  for I := 1 to 32 do
////  begin
////    chartLog[I].EndUpdate;
////  end;
//
//  fCriticalSection.Leave;

///////////////////////////////////////////////////////////////////////////////
//  setIsLoading(True);
//
//  recCount := PLCDS.PLCDCount;
//  for I := 0 to PLCDS.PLCDCount - 1 do
//  begin
//    for j := 1 to chartLog.SeriesCount -1 do
//    begin
//      chartLog[j].AddXY(PLCDS.PLCDataSeries[I].xusec, PLCDS.getData(j, i));
//    end;
//  end;
//
//  if recCount > 0 then
//  begin
//    fDtStart := PLCDS.PLCDataSeries[0].xusec;
//    fDtFinish := PLCDS.PLCDataSeries[PLCDS.PLCDCount -1].xusec;
//    dtDiff := fDtFinish - fDtStart;
//  end
//  else
//  begin
//    //ShowMessage('It is none records in selected time period');
//    fDtStart := 0;
//    fDtFinish := 1000;
//    dtDiff := 0;
//  end;
//
//
//  if fDtFinish < chartLog.BottomAxis.Minimum  then
//  begin
//    chartLog.BottomAxis.Minimum := fDtStart;
//    chartLog.BottomAxis.Maximum := fDtFinish;
//  end
//  else
//  begin
//    chartLog.BottomAxis.Maximum := fDtFinish;
//    chartLog.BottomAxis.Minimum := fDtStart;
//  end;
//
//  setIsLoading(False);
//  { save the setting }
//  saveIni;
//
//  for I := 0 to chklstSeriesSelect.Count -1 do
//  begin
//    chartLog[I].Visible := fViewSettings.SeriesVisible[I];
//  end;
end;

procedure TLogChild.setIsLoading(value: Boolean);
begin
  fIsLoading := value;
//  btLoad.Enabled := not fIsLoading;
end;

procedure TLogChild.btnAnalyzeClick(Sender: TObject);
var
  ChildHandle: THandle;
begin
  if AnalyzeConfigForm.ShowModal = mrOK then //show analysis form
  begin
//    MainForm.CreateAnalysisChild('Analyze...', Configurator.CloneChannels);

    // Obtain the handle of the main form
//    ChildHandle := MainForm.ClientHandle;
//
//    with TAnalysisForm.CreateParented(ChildHandle) do
//    begin
//      Caption := Name;
//      ChannelList := Configurator.CloneChannels;
//      Show;
//      InitForm; // gives violation exception when closing analysis child form
//    end;

  end;
end;

procedure TLogChild.btnConfigClick(Sender: TObject);
begin
  //config view
  if (ConfigForm.ShowModal) = mrOK then
  begin
    LoadConfig;
//    ShowMessage('Configuration changes saved...');
    //send config to arduino using ModbusManager
    if not Configurator.IsDemo then
    begin
      try
        ModbusManager.WriteConfig(mModbusClient);
        Self.btnStart.Enabled := True;
      except
      on E: Exception do
      begin
        ShowMessage('Can not connect to modbus server!');
        Self.btnStart.Enabled := False;
      end;
      end;
    end
    else
      Self.btnStart.Enabled := True;

  end;
end;

procedure TLogChild.btnPauseClick(Sender: TObject);
begin
  //pause recording...

end;

procedure TLogChild.btnStartClick(Sender: TObject);
var
  i: Integer;
begin
  //start recording...
  if Configurator.IsDemo then
  begin
    LoadConfig; //clear and re-load

    PLCDS.PLCDCount := 0;
    demoTimerCount := 0;
    elapsedTimerCount := 0;
    Randomize;

    demoTimer.Enabled := True;

    isStarted := True;
  end
  else
  begin
    LoadConfig;
    PLCDS.PLCDCount := 0;
    elapsedTimerCount := 0;

    for i := 1 to 32 do
    begin
      if Configurator.ChannelList[i].IsActive then
      begin
        Configurator.ChannelList[i].DataCount := 0;
        Configurator.ChannelList[i].idxToRead := 0;
      end;
    end;

    cycle := 0;
    loadTimer.Enabled := True;

    isStarted := True;
  end;

  if isStarted then
  begin
    lblState.Caption := 'CaptureState: Started...   ';
    StartTime := Now;
    elapsedTimer.Enabled := True;
  end;


end;

procedure TLogChild.btnStopClick(Sender: TObject);
begin
  //stop recording...
  if Configurator.IsDemo then
  begin
    demoTimer.Enabled := False;
    demoTimerCount := 0;
    isStarted := False;
  end
  else
  begin
    loadTimer.Enabled := False;
    isStarted := False;
  end;

  if not isStarted then
    lblState.Caption := 'CaptureState: Stoped!   ';
    elapsedTimer.Enabled := False;
end;

procedure TLogChild.btnTriggerSetupClick(Sender: TObject);
begin
  if (TriggerSettingForm.ShowModal) = mrOK then
  begin

  end;
end;

procedure TLogChild.chartLogMouseLeave(Sender: TObject);
begin
  //
//  HintWindow.ReleaseHandle;
end;

procedure TLogChild.chartLogMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  chartX, chartY: Integer;
  timeValue, voltageValue: Double;
  activeSeries: TChartSeries;
  dataIndex: Integer;
  relPoint: TPoint;
begin
  timeValue := chartLog.BottomAxis.CalcPosPoint(X);
  lblTimeOnMousePos.Caption := Format('Time: %.3f ms   ', [timeValue]); // FloatToStr(timeValue) + ' ms     ';

  relPoint := chartLog.ScreenToClient(Point(X, Y));

//  activeSeries := chartLog.SeriesList.Clicked(X, Y, dataIndex);
//  if Assigned(activeSeries) then
//  begin
//    dataIndex := activeSeries.Clicked(X, Y);
//    if dataIndex <> -1 then
//    begin
//      chartLog.ParentShowHint := True;

      // Convert mouse coordinates to chart coordinates
//      relPoint := chartLog.ScreenToClient(Point(X, Y));
//      chartX := Round(chartLog.BottomAxis.CalcPosPoint(X));
//      chartY := Round(chartLog.LeftAxis.CalcPosPoint(Y));

      // Retrieve time and voltage values from your data based on chart coordinates
//      timeValue := chartLog.BottomAxis.CalcPosPoint(X);
//      lblTimeOnMousePos.Caption := FloatToStr(timeValue) + ' ms     ';
//      voltageValue := chartY; // Retrieve voltage value based on chartY

      // Display the time and voltage values as a tooltip
//      HintWindow.ActivateHint(Rect(X - 50, Y - 50, X + 50, Y + 50), Format('Time: %.2f'#13#10'Voltage: %.2f', [timeValue, voltageValue]));

      // Store mouse coordinates for further use (if needed)
//      mouseX := X;
//      mouseY := Y;
//    end
//    else
//    begin
//      chartLog.ParentShowHint := False;
//      HintWindow.ReleaseHandle;
//    end;
//  end;

end;

procedure TLogChild.chartLogMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  X: double;
  Delta: Double;
  oldMin, oldMax: Double;
  relPoint: TPoint;
begin
  oldMin := chartLog.Axes.Bottom.Minimum;
  oldMax := chartLog.Axes.Bottom.Maximum;
  // Get the X-coordinate of the mouse position
  relPoint := chartLog.ScreenToClient(MousePos);
  X := chartLog.BottomAxis.CalcPosPoint(relPoint.X);

  // Calculate the delta for zooming in or out
  if WheelDelta > 0 then
    Delta := (oldMax - oldMin) / 10  // Increase zoom by 10%
  else
    Delta := -(oldMax - oldMin) / 10;  // Decrease zoom by 10%

  // Adjust the axis limits to keep the mouse position fixed
  chartLog.Axes.Bottom.Minimum := oldMin + Delta * (X - oldMin) / (oldMax - oldMin);
  chartLog.Axes.Bottom.Maximum := oldMax - Delta * (oldMax - X) / (oldMax - oldMin);

  Handled := True;

end;

procedure TLogChild.chklstSeriesSelectDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  Flags: Longint;
begin
  with (Control as TCheckListBox) do
  begin
    // modifying the Canvas.Brush.Color here will adjust the item color
    //Canvas.Brush.Color := PLCDS.chcolor[Index];
    //case Index of
    //  0: Canvas.Brush.Color := $00F9F9F9;
    //  1: Canvas.Brush.Color := $00EFEFEF;
    //  2: Canvas.Brush.Color := $00E5E5E5;
    //end;
    //Canvas.FillRect(Rect);
    // modifying the Canvas.Font.Color here will adjust the item font color
    Canvas.Font.Color := PLCDS.chcolor[Index];
    //case Index of
    //  0: Canvas.Font.Color := clRed;
    //  1: Canvas.Font.Color := clGreen;
    //  2: Canvas.Font.Color := clBlue;
    //end;
    Flags := DrawTextBiDiModeFlags(DT_SINGLELINE or DT_VCENTER or DT_NOPREFIX);
    if not UseRightToLeftAlignment then
      Inc(Rect.Left, 2)
    else
      Dec(Rect.Right, 2);
    DrawText(Canvas.Handle, Items[Index], Length(Items[Index]), Rect, Flags);
  end;
end;

procedure TLogChild.clearChart;
var
  I: Integer;
begin
  for I := 1 to chartLog.SeriesCount -1 do
  begin
    chartLog[I].Visible := False;
    chartLog[I].Clear;
    chartLog[I].Legend.Visible := False; //hide legend
  end;
end;

{ create the ini file }
procedure TLogChild.creatIni();
var
  hFile: Cardinal;
begin
  fIniFilePath := ExtractFilePath(Application.ExeName) + INI_FILE_NAME;
  if not FileExists(fIniFilePath) then
  begin
    hFile := CreateFile(PChar(fIniFilePath), 0, 0, nil, CREATE_NEW, 0, 0);
    CloseHandle(hFile);
  end;
end;

procedure TLogChild.loadIni();
var
  iniFile: TIniFile;
  I: Integer;
  sKey: String;
begin
  iniFile := TIniFile.Create(fIniFilePath);
  for I := 0 to Length(fViewSettings.SeriesVisible) - 1 do
  begin
    sKey := INI_KEY_SERIALS_VISIBLE + IntToStr(I);
    fViewSettings.SeriesVisible[i] := iniFile.ReadBool(INI_SECT_NAME, sKey, True);
  end;
  { read the channel configuration }
  for I := 0 to Length(fViewSettings.SeriesVisible) - 1 do
  begin
    sKey := INI_KEY_CH_OFFSET + IntToStr(I);
    PLCDS.choff[i] := iniFile.ReadFloat(INI_SECT_NAME, sKey, i+1);
    sKey := INI_KEY_CH_FACTOR + IntToStr(I);
    PLCDS.chfact[i] := iniFile.ReadFloat(INI_SECT_NAME, sKey, 1);
    sKey := INI_KEY_CH_COLOR + IntToStr(I);
    PLCDS.chcolor[i] := iniFile.ReadInteger(INI_SECT_NAME, sKey, chartLog[i].Color);
  end;
  fViewSettings.FullPeriod := iniFile.ReadBool(INI_SECT_NAME, INI_KEY_FULL_PERIOD, True);
  fViewSettings.DtStart := iniFile.ReadDateTime(INI_SECT_NAME, INI_KEY_DT_START, 0);
  fViewSettings.DtFinish := iniFile.ReadDateTime(INI_SECT_NAME, INI_KEY_DT_FINISH, Now );
  fViewSettings.LimitRecord := iniFile.ReadBool(INI_SECT_NAME, INI_KEY_RECORD_LIMIT, True);
  fViewSettings.LimitRecordCount := iniFile.ReadInteger(INI_SECT_NAME, INI_KEY_RECORD_LIMIT_COUNT, DEFAULT_RECORD_LIMIT);;
  { clean up }
  iniFile.Free;
end;

procedure TLogChild.saveIni();
var
  iniFile: TIniFile;
  I: Integer;
  sKey: String;
begin
  iniFile := TIniFile.Create(fIniFilePath);
  for I := 0 to Length(fViewSettings.SeriesVisible) - 1 do
  begin
    sKey := INI_KEY_SERIALS_VISIBLE + IntToStr(I);
    iniFile.WriteBool(INI_SECT_NAME, sKey, fViewSettings.SeriesVisible[i]);
  end;
  { read the channel configuration }
  for I := 0 to Length(fViewSettings.SeriesVisible) - 1 do
  begin
    sKey := INI_KEY_CH_OFFSET + IntToStr(I);
    iniFile.WriteFloat(INI_SECT_NAME, sKey, PLCDS.choff[i]);
    sKey := INI_KEY_CH_FACTOR + IntToStr(I);
    iniFile.WriteFloat(INI_SECT_NAME, sKey, PLCDS.chfact[i]);
    sKey := INI_KEY_CH_COLOR + IntToStr(I);
    iniFile.WriteInteger(INI_SECT_NAME, sKey, PLCDS.chcolor[i]);
  end;
  iniFile.WriteBool(INI_SECT_NAME, INI_KEY_FULL_PERIOD, fViewSettings.FullPeriod);
  iniFile.WriteDateTime(INI_SECT_NAME, INI_KEY_DT_START, fViewSettings.DtStart);
  iniFile.WriteDateTime(INI_SECT_NAME, INI_KEY_DT_FINISH, fViewSettings.DtFinish );
  iniFile.WriteBool(INI_SECT_NAME, INI_KEY_RECORD_LIMIT, fViewSettings.LimitRecord);
  iniFile.WriteInteger(INI_SECT_NAME, INI_KEY_RECORD_LIMIT_COUNT, fViewSettings.LimitRecordCount);
  iniFile.Free;
end;


{ TLoadThread }

constructor TLoadThread.Create(f: TForm);
begin
  inherited Create(False);
  fForm := f;
end;

procedure TLoadThread.Execute;
begin
  inherited;
  (fForm as TLogChild).LoadData;
end;

end.
