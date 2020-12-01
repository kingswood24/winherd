object fmSiemensSMS: TfmSiemensSMS
  Left = 360
  Top = 283
  Width = 340
  Height = 129
  Caption = 'Kingswood Herd - Siemens Phone Link'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 8
    Width = 36
    Height = 13
    Caption = 'Status: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lStatus: TLabel
    Left = 44
    Top = 8
    Width = 63
    Height = 13
    Caption = 'Please wait...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 6
    Top = 24
    Width = 318
    Height = 7
    Shape = bsTopLine
  end
  object Button1: TButton
    Left = 226
    Top = 66
    Width = 97
    Height = 25
    Caption = 'Cancel'
    ModalResult = 1
    TabOrder = 0
    OnClick = Button1Click
  end
  object ProgressBar: TProgressBar
    Left = 6
    Top = 31
    Width = 318
    Height = 23
    Hint = 'Processing SMS messages...'
    Min = 0
    Max = 100
    ParentShowHint = False
    Smooth = True
    Step = 1
    ShowHint = True
    TabOrder = 1
    Visible = False
  end
  object Comm: TVaComm
    Baudrate = br19200
    PortNum = 1
    MonitorEvents = [ceBreak, ceCts, ceDsr, ceError, ceRing, ceRlsd, ceData, ceTxEmpty, ceEvent]
    ReadBufSize = 8192
    FlowControl = fcXonXoff
    OnData = CommData
    Left = 144
    Top = 66
  end
  object GSMTimer: TTimer
    Interval = 4000
    OnTimer = GSMTimerTimer
    Left = 74
    Top = 64
  end
  object ReceiveTimer: TTimer
    Interval = 8000
    OnTimer = ReceiveTimerTimer
    Left = 102
    Top = 64
  end
  object MessageParser: TSPParser
    Sepchar = ' '
    SepString = '+CMGL:'
    CharSearch = False
    Left = 8
    Top = 60
  end
  object MsgStats: TSPParser
    Sepchar = ','
    SepString = '#13#10'
    CharSearch = True
    Left = 36
    Top = 62
  end
end
