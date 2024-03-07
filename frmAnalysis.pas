unit frmAnalysis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.CheckLst, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.TeeProcs, VCLTee.Chart, VCLTee.Series, uConfig, ChildWin,
  System.ImageList, Vcl.ImgList;

type
  TAnalysisForm = class(TForm)
    toolsBar: TToolBar;
    pnlLeft: TPanel;
    pnlClient: TPanel;
    lstChannels: TCheckListBox;
    chartLog: TChart;
    Series1: TFastLineSeries;
    btnOpen: TToolButton;
    imgList: TImageList;
    btnSave: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure chartLogMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOpenClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);

  private
    { Private declarations }
    xBuf: array of Double;
    yBuf: array of Double;
  public
    { Public declarations }
    ChannelList: TChannelArray;

    procedure InitForm;

  end;


implementation

uses
  System.IOUtils;

{$R *.dfm}



procedure TAnalysisForm.btnOpenClick(Sender: TObject);
var
  OpenDlg: TOpenDialog;
  SelectedFileName: string;
  CsvFile, Values: TStringList;
  i, j: Integer;
  chCount: Integer;
  line: string;
  time: Integer;
begin
  //
  OpenDlg := TOpenDialog.Create(nil);
  CsvFile := TStringList.Create;
  Values := TStringList.Create;

  try
  OpenDlg.Filter := 'csv files|*.csv';
  OpenDlg.InitialDir := GetCurrentDir + '\ChannelData';

  if not TDirectory.Exists(OpenDlg.InitialDir) then TDirectory.CreateDirectory(OpenDlg.InitialDir);

  if OpenDlg.Execute then
  begin
    SelectedFileName := OpenDlg.FileName;

    CsvFile.LoadFromFile(SelectedFileName);
    if CsvFile.Count = 0 then Exit;

    //init channel list
    SetLength(ChannelList, 0);

    //get header line
    line := CsvFile[0];
    Values.CommaText := line;
    chCount := Values.Count - 1;
    SetLength(ChannelList, chCount);
    for i := 0 to chCount - 1 do
    begin
      ChannelList[i].Name := Values[i+1];
      ChannelList[i].DataCount := 0;
    end;

    if CsvFile.Count > 1 then
    begin
    for i := 1 to CsvFile.Count - 1 do
    begin
      line := CsvFile[i];
      Values.CommaText := line;

      time := StrToInt(Values[0]);
      for j := 0 to chCount - 1 do
      begin
        ChannelList[j].DataCount := ChannelList[j].DataCount + 1;
        ChannelList[j].Times[ChannelList[j].DataCount-1] := time;
        ChannelList[j].Data[ChannelList[j].DataCount - 1] := StrToFloat(Values[j+1]);
      end;

    end;
    end;
  end;
  finally
    OpenDlg.Free;
    CsvFile.Free;
    Values.Free;
  end;

  //init form again
  Self.Caption := ChangeFileExt(ExtractFileName(SelectedFileName), '');
  InitForm;

end;

procedure TAnalysisForm.btnSaveClick(Sender: TObject);
var
  SaveDlg: TSaveDialog;
  FileNameToSave: string;
  CsvFile: TStringList;
  dataLine: String;
  i, j: Integer;
begin
  //
  SaveDlg := TSaveDialog.Create(nil);
  CSVFile := TStringList.Create;

  try
  SaveDlg.Filter := 'csv files|*.csv';
  SaveDlg.InitialDir := GetCurrentDir + '\ChannelData';
  SaveDlg.FileName := Self.Caption + '.csv';

  if not TDirectory.Exists(SaveDlg.InitialDir) then TDirectory.CreateDirectory(SaveDlg.InitialDir);

  if SaveDlg.Execute then
  begin
    FileNameToSave := SaveDlg.FileName;

    //Add header line
    dataLine := 'Time,';

    if Length(ChannelList) = 1 then dataLine := dataLine + ChannelList[0].Name
    else if (Length(ChannelList)) > 1 then
    begin
      for i := 0 to Length(ChannelList) - 2 do
      begin
        dataLine := dataLine + ChannelList[i].Name + ','
      end;
      dataLine := dataLine + ChannelList[i].Name;
    end;

    CsvFIle.Add(dataLine);

    //Add data...
    dataLine := '';
    if ChannelList[0].DataCount > 0 then
    begin
    for i := 0 to ChannelList[0].DataCount do
    begin
      dataLine := IntToStr(ChannelList[0].Times[i]) + ',';
      if Length(ChannelList) = 1 then dataLine := dataLine + FloatToStr(ChannelList[0].Data[i])
      else if Length(ChannelList) > 1 then
      begin
        for j := 0 to Length(ChannelList) - 2 do
        begin
          dataLine := dataLine + FloatToStr(ChannelList[j].Data[i]) + ',';
        end;
        dataLine := dataLine + FloatToStr(ChannelList[j].Data[i]);
      end;
      CsvFile.Add(dataLine);
    end;
    end;

    //Save to file
    CsvFile.SaveToFile(FileNameToSave);

  end;
  finally
    SaveDlg.Free;
    CsvFile.Free;
  end;


end;

procedure TAnalysisForm.chartLogMouseWheel(Sender: TObject; Shift: TShiftState;
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

procedure TAnalysisForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  //clear chart
  for i := chartLog.SeriesCount -1 downto 0 do
  begin
    chartLog.Series[i].Clear;
    if Assigned(chartLog.Series[i].CustomVertAxis) then chartLog.Series[i].CustomVertAxis.Free;
    chartLog.Series[i].Free;
  end;

  chartLog.ClearChart;
  chartLog.Free;
  lstChannels.Items.Clear;

  //
  Action := caFree;

end;

procedure TAnalysisForm.FormCreate(Sender: TObject);
begin
  //
//  Self.Caption := 'Analyze...';
end;

procedure TAnalysisForm.InitForm;
var
  i, j, k, idx, chCount: Integer;
  chartSeries: TChartSeries;
  chartAxis: TChartAxis;
  margin: Double;
  midTime: Double;
begin
  //clear logChart
  chartLog.ClearChart;
  lstChannels.Items.Clear;

  //init chartLog
  With chartLog do
  begin
    BufferedDisplay := True;
    View3D := False;

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

  //add formal series
  chartSeries := TFastLineSeries.Create(chartLog);
  chartSeries.Name := 'Series0';
  chartLog.AddSeries(chartSeries);

  //add channel series
  chCount := Length(Self.ChannelList);
  if chCount = 0 then
    Exit;

  margin := 100.0 / chCount / 10;
  k := 0;
  for i := 0 to chCount-1 do
  begin
    idx := lstChannels.Items.Add(ChannelList[i].Name);
    lstChannels.Checked[idx] := True;
    lstChannels.ItemEnabled[idx] := False;

    chartSeries := TFastLineSeries.Create(chartLog);
    chartLog.AddSeries(chartSeries);
    chartSeries.Name := ChannelList[i].Name;
    chartSeries.Color := ChannelList[i].Color;
    chartSeries.Legend.Visible := False;
    TFastLineSeries(chartSeries).FastPen := True;

    chartAxis := TChartAxis.Create(chartLog);
    chartSeries.CustomVertAxis := chartAxis;
    with chartAxis do
      begin
        Axis.Color:=clBlack ;
        Title.Caption := ChannelList[i].Name;
//        Title.Visible := False; //
//        Title.Color := ChannelList[i].Color;
        Title.Font.Style:=[fsBold];
        Title.Angle := 0;
        Title.Width := 100;
        PositionPercent := 0; //percentage of Chart rectangle
        StartPosition:= i * (100 / chCount);
        EndPosition:= (i + 1) * (100/ chCount) - margin;
      end;

    //add data to series
    if ChannelList[i].DataCount > 0 then
    begin
      k := 0;
      SetLength(xBuf, 0);
      SetLength(yBuf, 0);
      for j := 0 to ChannelList[i].DataCount - 1 do
      begin
        if (ChannelList[i].SignalType = TSignalType.D) and (j > 0) then
        begin
          if not (ChannelList[i].Data[j] = ChannelList[i].Data[j-1]) then
          begin
            midTime := (ChannelList[i].Times[j] + ChannelList[i].Times[j-1]) / 2.0;
            SetLength(xBuf, k+2);
            SetLength(yBuf, k+2);
            xBuf[k] := midTime;
            yBuf[k] := ChannelList[i].Data[j-1];
            xBuf[k+1] := midTime;
            yBuf[k+1] := ChannelList[i].Data[j];
            k := k + 2;
          end;
        end;
        SetLength(xBuf, k+1);
        SetLength(yBuf, k+1);
        xBuf[k] := ChannelList[i].Times[j];
        yBuf[k] := ChannelList[i].Data[j];
        k := k + 1;
      end;
      TFastLineSeries(chartSeries).AutoRepaint := False;
      chartSeries.AddArray(xBuf, yBuf);
      TFastLineSeries(chartSeries).AutoRepaint := True;
    end;

  end;
end;

end.
