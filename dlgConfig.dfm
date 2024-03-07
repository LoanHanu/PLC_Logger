object ConfigForm: TConfigForm
  Left = 0
  Top = 0
  Caption = 'ConfigForm'
  ClientHeight = 712
  ClientWidth = 1012
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object Label14: TLabel
    Left = 836
    Top = 8
    Width = 89
    Height = 21
    Caption = 'DemoMode: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object btnCancel: TButton
    Left = 596
    Top = 679
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 0
  end
  object btnOK: TButton
    Left = 716
    Top = 679
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object gbServerSettings: TGroupBox
    Left = 8
    Top = 8
    Width = 305
    Height = 81
    Caption = 'Server Settings'
    TabOrder = 2
    object Label1: TLabel
      Left = 24
      Top = 20
      Width = 48
      Height = 15
      Caption = 'Server IP:'
    end
    object Label2: TLabel
      Left = 12
      Top = 49
      Width = 60
      Height = 15
      Caption = 'Server Port:'
    end
    object edtIP: TEdit
      Left = 104
      Top = 17
      Width = 137
      Height = 23
      TabOrder = 0
      Text = '0.0.0.0'
    end
    object edtPort: TSpinEdit
      Left = 104
      Top = 46
      Width = 137
      Height = 24
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 0
    end
  end
  object gbChannelSettings: TGroupBox
    Left = 8
    Top = 95
    Width = 996
    Height = 434
    Caption = 'Channel Settings'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object gbCh1: TGroupBox
      Left = 3
      Top = 16
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        1       '
      TabOrder = 0
      object chbCh1: TCheckBox
        Tag = 1
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = CheckBoxClick
      end
      object cmbAD1: TComboBox
        Tag = 1
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        TabOrder = 1
        Text = 'D'
        OnChange = ComboBoxChange
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger1: TComboBox
        Tag = 1
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object btnChColor1: TButtonColor
        Tag = 32
        Left = 93
        Top = 18
        Width = 20
        Height = 24
        TabOrder = 3
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
      object edtChName1: TEdit
        Left = 5
        Top = 48
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 4
        Text = 'Edit2'
      end
    end
    object btnEnableAll: TButton
      Left = 305
      Top = 376
      Width = 75
      Height = 25
      Caption = 'Enable All'
      TabOrder = 1
      OnClick = btnEnableAllClick
    end
    object btnDisableAll: TButton
      Left = 569
      Top = 376
      Width = 75
      Height = 25
      Caption = 'Disable All'
      TabOrder = 2
      OnClick = btnDisableAllClick
    end
    object gbCh2: TGroupBox
      Left = 122
      Top = 16
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        2       '
      TabOrder = 3
      object chbCh2: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD2: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger2: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object btnChColor2: TButtonColor
        Tag = 32
        Left = 93
        Top = 18
        Width = 20
        Height = 24
        TabOrder = 3
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
      end
      object edtChName2: TEdit
        Left = 5
        Top = 48
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 4
        Text = 'Edit2'
      end
    end
    object gbCh3: TGroupBox
      Left = 241
      Top = 16
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        3       '
      TabOrder = 4
      object chbCh3: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD3: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger3: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object btnChColor3: TButtonColor
        Tag = 32
        Left = 93
        Top = 18
        Width = 20
        Height = 24
        TabOrder = 3
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
      end
      object edtChName3: TEdit
        Left = 5
        Top = 48
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 4
        Text = 'Edit2'
      end
    end
    object gbCh4: TGroupBox
      Left = 360
      Top = 16
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        4       '
      TabOrder = 5
      object chbCh4: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD4: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger4: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object btnChColor4: TButtonColor
        Tag = 32
        Left = 90
        Top = 18
        Width = 20
        Height = 24
        TabOrder = 3
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
      end
      object edtChName4: TEdit
        Left = 5
        Top = 48
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 4
        Text = 'Edit2'
      end
    end
    object gbCh5: TGroupBox
      Left = 479
      Top = 16
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        5       '
      TabOrder = 6
      object chbCh5: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD5: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger5: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object btnChColor5: TButtonColor
        Tag = 32
        Left = 90
        Top = 18
        Width = 20
        Height = 24
        TabOrder = 3
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
      end
      object edtChName5: TEdit
        Left = 5
        Top = 48
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 4
        Text = 'Edit2'
      end
    end
    object gbCh6: TGroupBox
      Left = 598
      Top = 16
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        6       '
      TabOrder = 7
      object chbCh6: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD6: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger6: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object btnChColor6: TButtonColor
        Tag = 32
        Left = 90
        Top = 18
        Width = 20
        Height = 24
        TabOrder = 3
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
      end
      object edtChName6: TEdit
        Left = 5
        Top = 48
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 4
        Text = 'Edit2'
      end
    end
    object gbCh7: TGroupBox
      Left = 717
      Top = 16
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        7       '
      TabOrder = 8
      object chbCh7: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD7: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger7: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object btnChColor7: TButtonColor
        Tag = 32
        Left = 93
        Top = 18
        Width = 20
        Height = 24
        TabOrder = 3
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
      end
      object edtChName7: TEdit
        Left = 5
        Top = 48
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 4
        Text = 'Edit2'
      end
    end
    object gbCh8: TGroupBox
      Left = 836
      Top = 16
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        8       '
      TabOrder = 9
      object chbCh8: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD8: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger8: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object btnChColor8: TButtonColor
        Tag = 32
        Left = 93
        Top = 18
        Width = 20
        Height = 24
        TabOrder = 3
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
      end
      object edtChName8: TEdit
        Left = 5
        Top = 48
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 4
        Text = 'edtChName8'
      end
    end
    object gbCh9: TGroupBox
      Left = 3
      Top = 100
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        9       '
      TabOrder = 10
      object chbCh9: TCheckBox
        Tag = 9
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD9: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger9: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object edtChName9: TEdit
        Left = 5
        Top = 48
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 3
        Text = 'Edit2'
      end
      object btnChColor9: TButtonColor
        Tag = 32
        Left = 93
        Top = 18
        Width = 20
        Height = 24
        TabOrder = 4
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
    end
    object gbCh10: TGroupBox
      Left = 122
      Top = 100
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        10       '
      TabOrder = 11
      object chbCh10: TCheckBox
        Tag = 10
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD10: TComboBox
        Tag = 10
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger10: TComboBox
        Tag = 10
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object edtChName10: TEdit
        Left = 3
        Top = 48
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 3
        Text = 'Edit2'
      end
      object btnChColor10: TButtonColor
        Tag = 32
        Left = 93
        Top = 18
        Width = 20
        Height = 24
        TabOrder = 4
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
    end
    object gbCh11: TGroupBox
      Left = 241
      Top = 100
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        11       '
      TabOrder = 12
      object chbCh11: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD11: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger11: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object edtChName11: TEdit
        Left = 5
        Top = 49
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 3
        Text = 'Edit2'
      end
      object btnChColor11: TButtonColor
        Tag = 32
        Left = 93
        Top = 19
        Width = 20
        Height = 24
        TabOrder = 4
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
    end
    object gbCh12: TGroupBox
      Left = 360
      Top = 100
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        12       '
      TabOrder = 13
      object chbCh12: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD12: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger12: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object edtChName12: TEdit
        Left = 5
        Top = 49
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 3
        Text = 'Edit2'
      end
      object btnChColor12: TButtonColor
        Tag = 32
        Left = 93
        Top = 19
        Width = 20
        Height = 24
        TabOrder = 4
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
    end
    object gbCh13: TGroupBox
      Left = 479
      Top = 100
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        13       '
      TabOrder = 14
      object chbCh13: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD13: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger13: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object edtChName13: TEdit
        Left = 5
        Top = 49
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 3
        Text = 'Edit2'
      end
      object btnChColor13: TButtonColor
        Tag = 32
        Left = 93
        Top = 19
        Width = 20
        Height = 24
        TabOrder = 4
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
    end
    object gbCh14: TGroupBox
      Left = 598
      Top = 100
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        14       '
      TabOrder = 15
      object chbCh14: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD14: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger14: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object edtChName14: TEdit
        Left = 5
        Top = 49
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 3
        Text = 'Edit2'
      end
      object btnChColor14: TButtonColor
        Tag = 32
        Left = 93
        Top = 19
        Width = 20
        Height = 24
        TabOrder = 4
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
    end
    object gbCh15: TGroupBox
      Left = 717
      Top = 100
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        15       '
      TabOrder = 16
      object chbCh15: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD15: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger15: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object edtChName15: TEdit
        Left = 5
        Top = 49
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 3
        Text = 'Edit2'
      end
      object btnChColor15: TButtonColor
        Tag = 32
        Left = 93
        Top = 19
        Width = 20
        Height = 24
        TabOrder = 4
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
    end
    object gbCh16: TGroupBox
      Left = 836
      Top = 100
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        16       '
      TabOrder = 17
      object chbCh16: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD16: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger16: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object edtChName16: TEdit
        Left = 3
        Top = 49
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 3
        Text = 'Edit2'
      end
      object btnChColor16: TButtonColor
        Tag = 32
        Left = 93
        Top = 19
        Width = 20
        Height = 24
        TabOrder = 4
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
    end
    object gbCh17: TGroupBox
      Left = 3
      Top = 181
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        17       '
      TabOrder = 18
      object chbCh17: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD17: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger17: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object edtChName17: TEdit
        Left = 5
        Top = 48
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 3
        Text = 'Edit2'
      end
      object btnChColor17: TButtonColor
        Tag = 32
        Left = 93
        Top = 18
        Width = 20
        Height = 24
        TabOrder = 4
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
    end
    object gbCh18: TGroupBox
      Left = 122
      Top = 181
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        18       '
      TabOrder = 19
      object chbCh18: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD18: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger18: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object edtChName18: TEdit
        Left = 3
        Top = 49
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 3
        Text = 'Edit2'
      end
      object btnChColor18: TButtonColor
        Tag = 32
        Left = 93
        Top = 19
        Width = 20
        Height = 24
        TabOrder = 4
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
    end
    object gbCh19: TGroupBox
      Left = 241
      Top = 181
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        19       '
      TabOrder = 20
      object chbCh19: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD19: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger19: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object edtChName19: TEdit
        Left = 5
        Top = 49
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 3
        Text = 'Edit2'
      end
      object btnChColor19: TButtonColor
        Tag = 32
        Left = 93
        Top = 19
        Width = 20
        Height = 24
        TabOrder = 4
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
    end
    object gbCh20: TGroupBox
      Left = 360
      Top = 181
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        20       '
      TabOrder = 21
      object chbCh20: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD20: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger20: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object edtChName20: TEdit
        Left = 5
        Top = 49
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 3
        Text = 'Edit2'
      end
      object btnChColor20: TButtonColor
        Tag = 32
        Left = 96
        Top = 19
        Width = 20
        Height = 24
        TabOrder = 4
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
    end
    object gbCh21: TGroupBox
      Left = 479
      Top = 181
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        21       '
      TabOrder = 22
      object chbCh21: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD21: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger21: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object edtChName21: TEdit
        Left = 5
        Top = 49
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 3
        Text = 'Edit2'
      end
      object btnChColor21: TButtonColor
        Tag = 32
        Left = 93
        Top = 19
        Width = 20
        Height = 24
        TabOrder = 4
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
    end
    object gbCh22: TGroupBox
      Left = 598
      Top = 181
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        22       '
      TabOrder = 23
      object chbCh22: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD22: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger22: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object edtChName22: TEdit
        Left = 5
        Top = 49
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 3
        Text = 'Edit2'
      end
      object btnChColor22: TButtonColor
        Tag = 32
        Left = 93
        Top = 19
        Width = 20
        Height = 24
        TabOrder = 4
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
    end
    object gbCh23: TGroupBox
      Left = 717
      Top = 181
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        23       '
      TabOrder = 24
      object chbCh23: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD23: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger23: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object edtChName23: TEdit
        Left = 5
        Top = 49
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 3
        Text = 'Edit2'
      end
      object btnChColor23: TButtonColor
        Tag = 32
        Left = 93
        Top = 19
        Width = 20
        Height = 24
        TabOrder = 4
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
    end
    object gbCh24: TGroupBox
      Left = 836
      Top = 181
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        24       '
      TabOrder = 25
      object chbCh24: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD24: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger24: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object edtChName24: TEdit
        Left = 3
        Top = 49
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 3
        Text = 'Edit2'
      end
      object btnChColor24: TButtonColor
        Tag = 32
        Left = 93
        Top = 19
        Width = 20
        Height = 24
        TabOrder = 4
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
    end
    object gbCh25: TGroupBox
      Left = 3
      Top = 262
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        25       '
      TabOrder = 26
      object chbCh25: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD25: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger25: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object edtChName25: TEdit
        Left = 5
        Top = 48
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 3
        Text = 'Edit2'
        OnChange = edtChNameChange
      end
      object btnChColor25: TButtonColor
        Tag = 32
        Left = 93
        Top = 18
        Width = 20
        Height = 24
        TabOrder = 4
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
    end
    object gbCh26: TGroupBox
      Left = 122
      Top = 262
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        26       '
      TabOrder = 27
      object chbCh26: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD26: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger26: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object edtChName26: TEdit
        Left = 5
        Top = 49
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 3
        Text = 'Edit2'
      end
      object btnChColor26: TButtonColor
        Tag = 32
        Left = 93
        Top = 19
        Width = 20
        Height = 24
        TabOrder = 4
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
    end
    object gbCh27: TGroupBox
      Left = 241
      Top = 262
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        27       '
      TabOrder = 28
      object chbCh27: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD27: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger27: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object edtChName27: TEdit
        Left = 5
        Top = 49
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 3
        Text = 'Edit2'
      end
      object btnChColor27: TButtonColor
        Tag = 32
        Left = 93
        Top = 19
        Width = 20
        Height = 24
        TabOrder = 4
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
    end
    object gbCh28: TGroupBox
      Left = 360
      Top = 262
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        28       '
      TabOrder = 29
      object chbCh28: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD28: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger28: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object edtChName28: TEdit
        Left = 5
        Top = 49
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 3
        Text = 'Edit2'
      end
      object btnChColor28: TButtonColor
        Tag = 32
        Left = 93
        Top = 19
        Width = 20
        Height = 24
        TabOrder = 4
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
    end
    object gbCh29: TGroupBox
      Left = 479
      Top = 262
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        29       '
      TabOrder = 30
      object chbCh29: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD29: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger29: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object edtChName29: TEdit
        Left = 5
        Top = 49
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 3
        Text = 'Edit2'
      end
      object btnChColor29: TButtonColor
        Tag = 32
        Left = 93
        Top = 19
        Width = 20
        Height = 24
        TabOrder = 4
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
    end
    object gbCh30: TGroupBox
      Left = 598
      Top = 262
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        30       '
      TabOrder = 31
      object chbCh30: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD30: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger30: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object edtChName30: TEdit
        Left = 5
        Top = 49
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 3
        Text = 'Edit2'
      end
      object btnChColor30: TButtonColor
        Tag = 32
        Left = 93
        Top = 19
        Width = 20
        Height = 24
        TabOrder = 4
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
    end
    object gbCh31: TGroupBox
      Left = 717
      Top = 262
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        31       '
      TabOrder = 32
      object chbCh31: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD31: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger31: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object edtChName31: TEdit
        Left = 5
        Top = 49
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 3
        Text = 'Edit2'
      end
      object btnChColor31: TButtonColor
        Tag = 32
        Left = 93
        Top = 19
        Width = 20
        Height = 24
        TabOrder = 4
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
    end
    object gbCh32: TGroupBox
      Left = 836
      Top = 262
      Width = 116
      Height = 75
      Margins.Right = 0
      Caption = '        32       '
      TabOrder = 33
      object chbCh32: TCheckBox
        Left = 3
        Top = 21
        Width = 17
        Height = 17
        Margins.Right = 0
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cmbAD32: TComboBox
        Left = 23
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 1
        Text = 'D'
        Items.Strings = (
          'D'
          'A')
      end
      object cmbTrigger32: TComboBox
        Left = 58
        Top = 18
        Width = 32
        Height = 25
        Margins.Right = 0
        ItemIndex = 0
        TabOrder = 2
        Text = 'X'
        Items.Strings = (
          'X'
          'L'
          'H'
          'R'
          'F'
          'C')
      end
      object edtChName32: TEdit
        Left = 5
        Top = 49
        Width = 108
        Height = 20
        BorderStyle = bsNone
        TabOrder = 3
        Text = 'Edit2'
      end
      object btnChColor32: TButtonColor
        Tag = 32
        Left = 93
        Top = 19
        Width = 20
        Height = 24
        TabOrder = 4
        StyleElements = [seFont, seClient]
        StyleName = 'Windows'
        OnClick = ColorButtonClick
      end
    end
  end
  object gbOthers: TGroupBox
    Left = 8
    Top = 544
    Width = 779
    Height = 121
    Caption = 'Others'
    TabOrder = 4
    object Label3: TLabel
      Left = 12
      Top = 16
      Width = 68
      Height = 15
      Caption = 'Threshold-D:'
    end
    object Label4: TLabel
      Left = 281
      Top = 16
      Width = 37
      Height = 15
      Caption = 'Min-A:'
    end
    object Label5: TLabel
      Left = 529
      Top = 16
      Width = 39
      Height = 15
      Caption = 'Max-A:'
    end
    object Label6: TLabel
      Left = 12
      Top = 45
      Width = 61
      Height = 15
      Caption = 'Trigger Pos:'
    end
    object Label7: TLabel
      Left = 213
      Top = 16
      Width = 7
      Height = 15
      Caption = 'V'
    end
    object Label8: TLabel
      Left = 213
      Top = 48
      Width = 10
      Height = 15
      Caption = '%'
    end
    object Label9: TLabel
      Left = 452
      Top = 16
      Width = 7
      Height = 15
      Caption = 'V'
    end
    object Label10: TLabel
      Left = 715
      Top = 16
      Width = 7
      Height = 15
      Caption = 'V'
    end
    object Label11: TLabel
      Left = 247
      Top = 45
      Width = 65
      Height = 15
      Caption = 'BlockCount:'
    end
    object Label12: TLabel
      Left = 482
      Top = 45
      Width = 87
      Height = 15
      Caption = 'SamplingPeriod:'
    end
    object Label13: TLabel
      Left = 714
      Top = 48
      Width = 16
      Height = 15
      Caption = 'ms'
    end
    object edtThresholdD: TEdit
      Left = 86
      Top = 11
      Width = 121
      Height = 23
      TabOrder = 0
      Text = '24'
    end
    object edtMinA: TEdit
      Left = 325
      Top = 11
      Width = 121
      Height = 23
      TabOrder = 1
      Text = '-10'
    end
    object edtMaxA: TEdit
      Left = 588
      Top = 11
      Width = 121
      Height = 23
      TabOrder = 2
      Text = '10'
    end
    object edtTriggerPos: TEdit
      Left = 86
      Top = 40
      Width = 121
      Height = 23
      TabOrder = 3
      Text = '10'
    end
    object edtBlockCount: TEdit
      Left = 324
      Top = 40
      Width = 121
      Height = 23
      TabOrder = 4
      Text = '30'
    end
    object edtSamplingPeriod: TEdit
      Left = 587
      Top = 40
      Width = 121
      Height = 23
      TabOrder = 5
      Text = '1'
    end
  end
  object tglDemo: TToggleSwitch
    Left = 931
    Top = 8
    Width = 73
    Height = 20
    State = tssOn
    StyleName = 'Windows'
    TabOrder = 5
    ThumbColor = clMenuHighlight
    OnClick = tglDemoClick
  end
end
