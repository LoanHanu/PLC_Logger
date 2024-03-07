object TriggerSettingForm: TTriggerSettingForm
  Left = 0
  Top = 0
  Caption = 'TriggerSettingForm'
  ClientHeight = 233
  ClientWidth = 560
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 21
  object Label1: TLabel
    Left = 24
    Top = 32
    Width = 110
    Height = 21
    Caption = 'Trigger Channel'
  end
  object Label2: TLabel
    Left = 66
    Top = 80
    Width = 68
    Height = 21
    Caption = 'Condition'
  end
  object Label3: TLabel
    Left = 495
    Top = 80
    Width = 13
    Height = 21
    Caption = '%'
  end
  object cbxChannels: TComboBox
    Left = 160
    Top = 29
    Width = 161
    Height = 29
    TabOrder = 0
    OnChange = cbxChannelsChange
  end
  object cbxTriggerType: TComboBox
    Left = 160
    Top = 77
    Width = 161
    Height = 29
    TabOrder = 1
  end
  object edtTriggerPosition: TEdit
    Left = 368
    Top = 77
    Width = 121
    Height = 29
    TabOrder = 2
    Text = '0'
  end
  object btnCancel: TButton
    Left = 128
    Top = 176
    Width = 113
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
    OnClick = btnCancelClick
  end
  object btnOK: TButton
    Left = 320
    Top = 176
    Width = 113
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 4
    OnClick = btnOKClick
  end
end
