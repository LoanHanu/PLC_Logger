unit MAIN;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.Menus, Vcl.StdCtrls, Vcl.Dialogs, Vcl.Buttons, Winapi.Messages,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdActns, Vcl.ActnList, Vcl.ToolWin,
  Vcl.ImgList, System.ImageList, System.Actions,
  LogWin, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdModBusClient, uConfig;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    FileCloseItem: TMenuItem;
    Window1: TMenuItem;
    Help1: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    WindowCascadeItem: TMenuItem;
    WindowTileItem: TMenuItem;
    WindowArrangeItem: TMenuItem;
    HelpAboutItem: TMenuItem;
    OpenDialog: TOpenDialog;
    FileSaveItem: TMenuItem;
    FileSaveAsItem: TMenuItem;
    Edit1: TMenuItem;
    CutItem: TMenuItem;
    CopyItem: TMenuItem;
    PasteItem: TMenuItem;
    WindowMinimizeItem: TMenuItem;
    StatusBar: TStatusBar;
    ActionList1: TActionList;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    FileNew1: TAction;
    FileSave1: TAction;
    FileExit1: TAction;
    FileOpen1: TAction;
    FileSaveAs1: TAction;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowArrangeAll1: TWindowArrange;
    WindowMinimizeAll1: TWindowMinimizeAll;
    HelpAbout1: TAction;
    FileClose1: TWindowClose;
    WindowTileVertical1: TWindowTileVertical;
    WindowTileItem2: TMenuItem;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton9: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ImageList1: TImageList;
    btnLogWin: TToolButton;
    btn1: TToolButton;
    FileLogging: TMenuItem;
    N2: TMenuItem;
    FileLogging1: TAction;
    FileConfig1: TAction;
    N3: TMenuItem;
    FileConfig11: TMenuItem;
    N4: TMenuItem;
    TriggerSetupItem: TMenuItem;
    StartItem: TMenuItem;
    PauseItem: TMenuItem;
    N5: TMenuItem;
    StopItem: TMenuItem;
    EditTriggerSetup: TAction;
    EditStart: TAction;
    EditPause: TAction;
    EditStop: TAction;
    N6: TMenuItem;
    AnalyzeItem: TMenuItem;
    EditAnalyze: TAction;
    mModBusClient: TIdModBusClient;
    procedure FileNew1Execute(Sender: TObject);
    procedure FileOpen1Execute(Sender: TObject);
    procedure HelpAbout1Execute(Sender: TObject);
    procedure FileExit1Execute(Sender: TObject);
    procedure FileLogging1Execute(Sender: TObject);
    procedure FileConfig1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditTriggerSetupExecute(Sender: TObject);
    procedure EditStartExecute(Sender: TObject);
    procedure EditPauseExecute(Sender: TObject);
    procedure EditStopExecute(Sender: TObject);
    procedure EditAnalyzeExecute(Sender: TObject);
  private
    { Private-Deklarationen }


    procedure CreateMDIChild(const Name: string);
    procedure CreateLOGChild(const Name: string);
  public
    { Public-Deklarationen }
    LogChild : TLogChild;
    isLogChildVisible : Boolean;
  public
    procedure CreateAnalysisChild(const formName: string ; const Channels: TChannelArray);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}
{$Optimization off}

uses CHILDWIN, About, dlgConfig, dlgTriggerSetting, uModbusManager, frmAnalysis;

procedure TMainForm.CreateMDIChild(const Name: string);
var
  Child: TMDIChild;
begin
  { ein neues untergeordnetes MDI-Fenster erstellen }
  Child := TMDIChild.Create(Application);
  Child.Caption := Name;
//  if FileExists(Name) then
//  begin
//   Child.Memo1.Lines.LoadFromFile(Name);
//  end;
end;

procedure TMainForm.EditAnalyzeExecute(Sender: TObject);
begin
  //
end;

procedure TMainForm.EditPauseExecute(Sender: TObject);
begin
  //
end;

procedure TMainForm.EditStartExecute(Sender: TObject);
begin
  //
end;

procedure TMainForm.EditStopExecute(Sender: TObject);
begin
  //
end;

procedure TMainForm.EditTriggerSetupExecute(Sender: TObject);
begin
  //
  if (TriggerSettingForm.ShowModal) = mrOK then
  begin

  end;
end;

procedure TMainForm.CreateLOGChild(const Name: string);
begin
  if not isLogChildVisible then begin
    { ein neues untergeordnetes MDI-Fenster erstellen }
//    if not Assigned(LogChild) then
//    begin
//      LogChild := TLogChild.Create(MainForm);
//      LogChild.Caption := Name;
//    end;
    //if FileExists(Name) then Child.Memo1.Lines.LoadFromFile(Name);

    LogChild := TLogChild.Create(Application);
    LogChild.Caption := Name;

    isLogChildVisible := True;
  end else begin
    LogChild.Close;
    isLogChildVisible := False;
  end;
end;

procedure TMainForm.CreateAnalysisChild(const formName: string ; const Channels: TChannelArray);
var
  ChildHandle: THandle;
begin
  //
  // Obtain the handle of the main form
  ChildHandle := MainForm.ClientHandle;

  with TAnalysisForm.CreateParented(ChildHandle) do
  begin
    Caption := formName;
    ChannelList := Channels;
    Show;
    InitForm; // gives exception when closing
  end;

end;

procedure TMainForm.FileNew1Execute(Sender: TObject);
begin
  CreateMDIChild('NONAME' + IntToStr(MDIChildCount + 1));
end;

procedure TMainForm.FileOpen1Execute(Sender: TObject);
begin
  if OpenDialog.Execute then
    CreateMDIChild(OpenDialog.FileName);
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Save config
  Configurator.SaveConfig;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  //Load config
  Configurator.LoadConfig;

  LogChild := nil;
end;

procedure TMainForm.HelpAbout1Execute(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TMainForm.FileConfig1Execute(Sender: TObject);
begin
  if (ConfigForm.ShowModal) = mrOK then
  begin
    ModbusManager.WriteConfig(mModbusClient);
//    ShowMessage('Configuration changes saved...');
  end;
end;

procedure TMainForm.FileExit1Execute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FileLogging1Execute(Sender: TObject);
begin
  { create the log window }
  CreateLogChild('LOGWIN' + IntToStr(MDIChildCount + 1));
end;

end.
