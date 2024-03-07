unit dlgTriggerSetting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TTriggerSettingForm = class(TForm)
    Label1: TLabel;
    cbxChannels: TComboBox;
    Label2: TLabel;
    cbxTriggerType: TComboBox;
    edtTriggerPosition: TEdit;
    Label3: TLabel;
    btnCancel: TButton;
    btnOK: TButton;
    procedure FormShow(Sender: TObject);
    procedure cbxChannelsChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TriggerSettingForm: TTriggerSettingForm;

implementation

uses
  uConfig;

{$R *.dfm}

procedure TTriggerSettingForm.btnCancelClick(Sender: TObject);
begin
  //
end;

procedure TTriggerSettingForm.btnOKClick(Sender: TObject);
begin
  //
end;

procedure TTriggerSettingForm.cbxChannelsChange(Sender: TObject);
var
  cbxChannels: TComboBox;
  i, chNum: Integer;
begin
  //
  cbxChannels := Sender as TComboBox;
  for i := 1 to 32 do
  begin
    if CompareStr(cbxChannels.Text, Configurator.ChannelList[i].Name)=0 then
    begin
      chNum := Configurator.ChannelList[i].Number;
      if Configurator.ChannelList[i].IsActive then
      begin
        if Configurator.ChannelList[i].SignalType = TSignalType.D then  //when digital channel
        begin
          cbxTriggerType.Items.Clear;
          cbxTriggerType.Items.Add('Manual');
          cbxTriggerType.Items.Add('Low');
          cbxTriggerType.Items.Add('High');
          cbxTriggerType.Items.Add('Rising');
          cbxTriggerType.Items.Add('Falling');
          cbxTriggerType.ItemIndex := 0;

          edtTriggerPosition.Enabled := False;
        end
        else if Configurator.ChannelList[i].SignalType = TSignalType.A then //when analog channel
        begin
          cbxTriggerType.Items.Clear;
          cbxTriggerType.Items.Add('Manual');
          cbxTriggerType.Items.Add('Low');
          cbxTriggerType.Items.Add('High');
          cbxTriggerType.Items.Add('Rising');
          cbxTriggerType.Items.Add('Falling');
          cbxTriggerType.ItemIndex := 0;

          edtTriggerPosition.Enabled := True;
        end;

      end;

      break;
    end;

  end;

end;

procedure TTriggerSettingForm.FormShow(Sender: TObject);
var
  i: Integer;
begin
  //init ui
  for i := 1 to 32 do
  begin
    if Configurator.ChannelList[i].IsActive then
      cbxChannels.Items.Add(Configurator.ChannelList[i].Name);
  end;

//  if cbxChannels.Items.Count > 0 then
//    cbxChannels.ItemIndex := 0;

end;

end.
