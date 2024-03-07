unit dlgAnalyzeConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst,
  Vcl.ExtCtrls, Vcl.WinXPanels, frmAnalysis;

type
  TAnalyzeConfigForm = class(TForm)
    btnClone: TButton;
    btnCancel: TButton;
    pnlChannels: TStackPanel;
    ScrollBox1: TScrollBox;
    procedure btnCloneClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBoxClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
//    AnalysisForm: TAnalysisForm;
  public
    { Public declarations }

  end;

var
  AnalyzeConfigForm: TAnalyzeConfigForm;

implementation

uses MAIN, uConfig;


{$R *.dfm}

procedure TAnalyzeConfigForm.btnCancelClick(Sender: TObject);
begin
  //
end;

procedure TAnalyzeConfigForm.btnCloneClick(Sender: TObject);
var
  i, chNum, count: Integer;
  checkBox: TCheckBox;
  formName: string;
begin
  //Clone data of selected channels
  count := 0;
  SetLength(Configurator.CloneChannels, count);
  for i := 0 to pnlChannels.ControlCount-1 do
  begin
    checkBox :=pnlChannels.Controls[i] as TCheckBox;
    if Assigned(checkBox) then
    begin
    if checkBox.Checked then
    begin
      chNum := checkBox.Tag;
      count := count + 1;
      SetLength(Configurator.CloneChannels, count);
      count := Length(Configurator.CloneChannels);
      Configurator.CloneChannels[count - 1] := Configurator.ChannelList[chNum];
    end;
    end;
  end;

  if count = 0 then
  begin
    SHowMessage('You have not selected any channel...');
    Self.ModalResult := mrCancel;
    Exit;
  end
  else
  begin
    //show analysis form
    formName := 'Analyze_';
    for i := 0 to count do
    begin
      formName := formName + Configurator.CloneChannels[i].Name + '_';
    end;
    MainForm.CreateAnalysisChild(formName, Configurator.CloneChannels);
    Self.ModalResult := mrOK;
  end;

end;

procedure TAnalyzeConfigForm.CheckBoxClick(Sender: TObject);
var
  checkBox: TCheckBox;
begin
  //
  checkBox := Sender as TCheckBox;
  if checkBox.Checked then
  begin
    checkBox.Checked := True;
  end;
end;

procedure TAnalyzeConfigForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
  child: TControl;
begin
  if Self.ModalResult = mrOK then
  begin

  end
  else if Self.ModalResult = mrCancel then
  begin

  end;
  //clear pnlChannels
  while pnlChannels.ControlCount > 0 do
  begin
    child := pnlChannels.Controls[0];
    pnlChannels.RemoveControl(child);
    child.Free;
  end;



end;

procedure TAnalyzeConfigForm.FormShow(Sender: TObject);
var
  i: Integer;
  chbChannel: TCheckBox;
begin
  //
  for i := 1 to 32 do
  begin
    if Configurator.ChannelList[i].IsActive then
    begin
      chbChannel := TCheckBox.Create(Self);
      chbChannel.Name := Configurator.ChannelList[i].Name;
      chbChannel.Caption := chbChannel.Name;
      chbChannel.Tag := Configurator.ChannelList[i].Number;
      chbChannel.OnClick := CheckBoxClick;
      pnlChannels.InsertControl(chbChannel);
    end;

  end;

end;

end.
