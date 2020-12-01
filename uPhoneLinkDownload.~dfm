object fmPhoneLinkDownload: TfmPhoneLinkDownload
  Left = 411
  Top = 179
  Width = 403
  Height = 467
  Caption = 'Phone Link Download'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 170
    Height = 13
    Caption = 'Select animals for information'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 33
    Width = 89
    Height = 13
    Caption = 'Search National ID'
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 414
    Width = 395
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object AnimalGrid: TDBGridEh
    Left = 24
    Top = 56
    Width = 345
    Height = 257
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = AnimalGridDblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'SELECTED'
        Footers = <>
        Title.Caption = 'ü'
        Title.Font.Charset = SYMBOL_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Wingdings'
        Title.Font.Style = [fsBold]
        Width = 20
      end
      item
        EditButtons = <>
        FieldName = 'NATIDNUM'
        Footers = <>
        Title.Caption = 'National Identity Number'
        Width = 186
      end>
  end
  object Button1: TButton
    Left = 200
    Top = 378
    Width = 81
    Height = 25
    Caption = 'Download'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 289
    Top = 378
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 3
    OnClick = Button2Click
  end
  object ProgressBar: TProgressBar
    Left = 26
    Top = 352
    Width = 343
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 4
  end
  object eNatIDSearch: TEdit
    Left = 116
    Top = 29
    Width = 169
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 20
    TabOrder = 5
    OnChange = eNatIDSearchChange
  end
  object Button3: TButton
    Left = 293
    Top = 29
    Width = 73
    Height = 22
    Caption = 'Clear Search'
    TabOrder = 6
  end
  object Button4: TButton
    Left = 24
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Reset'
    TabOrder = 7
    OnClick = Button4Click
  end
  object OxygenSMS1: TOxygenSMS
    ComNumber = 1
    ConnectionMode = 1
    Model = 0
    AutoDeleteMessages = False
    AutoDeleteReports = False
    SendTimeOut = 17
    Left = 72
    Top = 376
  end
end
