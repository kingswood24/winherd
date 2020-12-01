object UpdateAnimalNo: TUpdateAnimalNo
  Left = 309
  Top = 213
  Width = 480
  Height = 250
  Caption = 'Update Animal Number facility'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 441
    Height = 41
    AutoSize = False
    Caption = 
      'Click the begin button to update the animal number field with la' +
      'st four digits of National Identity Number. Update will only wor' +
      'k for animals with blank animal numbers.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object lDigitFormatNote: TLabel
    Left = 16
    Top = 150
    Width = 4
    Height = 13
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 56
    Width = 181
    Height = 13
    Caption = 'Select Herd for update process '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 102
    Width = 169
    Height = 13
    Caption = 'Select Animal Number format'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object cbHerds: TComboBox
    Left = 16
    Top = 72
    Width = 403
    Height = 21
    Style = csDropDownList
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 0
    OnChange = cbHerdsChange
  end
  object Button1: TButton
    Left = 344
    Top = 119
    Width = 75
    Height = 23
    Caption = 'Begin'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 188
    Width = 441
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 2
    Visible = False
  end
  object cmbFormatType: TComboBox
    Left = 16
    Top = 120
    Width = 321
    Height = 21
    Style = csDropDownList
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 3
    OnChange = cmbFormatTypeChange
    Items.Strings = (
      '4 Digit'
      '5 Digit (Includes check digit)')
  end
end
