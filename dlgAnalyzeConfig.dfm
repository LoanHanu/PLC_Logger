object AnalyzeConfigForm: TAnalyzeConfigForm
  Left = 0
  Top = 0
  Caption = 'AnalyzeConfig'
  ClientHeight = 386
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object btnClone: TButton
    Left = 264
    Top = 135
    Width = 105
    Height = 25
    Caption = 'Clone'
    ModalResult = 1
    TabOrder = 0
    OnClick = btnCloneClick
  end
  object btnCancel: TButton
    Left = 264
    Top = 200
    Width = 105
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 153
    Height = 386
    Align = alLeft
    TabOrder = 2
    object pnlChannels: TStackPanel
      Left = 0
      Top = 0
      Width = 109
      Height = 29
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      AutoSize = True
      ControlCollection = <>
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 5
      TabOrder = 0
    end
  end
end
