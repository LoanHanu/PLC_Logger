program PLCLogger;

uses
  Forms,
  Main in 'Main.pas' {MainForm},
  LogWin in 'LogWin.pas' {LogChild},
  about in 'about.pas' {AboutBox},
  ChildWin in 'ChildWin.pas' {MDIChild},
  DualList in 'c:\program files (x86)\embarcadero\studio\22.0\ObjRepos\DE\DelphiWin32\DualList.PAS' {DualListDlg},
  OKCANCL2 in 'c:\program files (x86)\embarcadero\studio\22.0\ObjRepos\DE\DelphiWin32\OKCANCL2.PAS' {OKRightDlg},
  uConfig in 'uConfig.pas',
  dlgConfig in 'dlgConfig.pas' {ConfigForm},
  uModbusManager in 'uModbusManager.pas',
  uPLCData in 'uPLCData.pas',
  dlgTriggerSetting in 'dlgTriggerSetting.pas' {TriggerSettingForm},
  frmAnalysis in 'frmAnalysis.pas' {AnalysisForm},
  dlgAnalyzeConfig in 'dlgAnalyzeConfig.pas' {AnalyzeConfigForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TConfigForm, ConfigForm);
  Application.CreateForm(TTriggerSettingForm, TriggerSettingForm);
  Application.CreateForm(TAnalyzeConfigForm, AnalyzeConfigForm);
  Application.Run;
end.
