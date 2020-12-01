object fmNokiaSMS: TfmNokiaSMS
  Left = 404
  Top = 359
  Width = 371
  Height = 152
  VertScrollBar.Visible = False
  Caption = 'Kingswood Herd - Nokia Phone Link'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Status: TLabel
    Left = 12
    Top = 9
    Width = 189
    Height = 13
    Caption = 'Initializing Nokia Interface, please wait...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 12
    Top = 26
    Width = 340
    Height = 7
    Shape = bsTopLine
  end
  object CancelButton: TBitBtn
    Left = 256
    Top = 70
    Width = 96
    Height = 25
    Hint = 'Cancel'
    Caption = 'Cancel'
    Default = True
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 99
    Width = 363
    Height = 19
    Panels = <
      item
        Text = 'COM Port:'
        Width = 70
      end
      item
        Text = 'Connection Type: '
        Width = 165
      end
      item
        Text = 'Status: '
        Width = 50
      end>
    SimplePanel = False
  end
  object ProgressBar: TProgressBar
    Left = 12
    Top = 37
    Width = 340
    Height = 23
    Hint = 'Processing SMS messages...'
    Min = 0
    Max = 100
    ParentShowHint = False
    Smooth = True
    Step = 1
    ShowHint = True
    TabOrder = 0
    Visible = False
  end
  object Timer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerTimer
    Left = 106
    Top = 72
  end
  object SMS: TOxygenSMS
    ComNumber = 0
    ConnectionMode = 0
    Model = 0
    AutoDeleteMessages = False
    AutoDeleteReports = False
    SendTimeOut = 17
    Left = 16
    Top = 64
  end
end
