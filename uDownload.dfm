object Download: TDownload
  Left = 468
  Top = 251
  ActiveControl = memo1
  BorderStyle = bsDialog
  Caption = 'Kingswood Herd Download'
  ClientHeight = 338
  ClientWidth = 252
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF002222
    2222222222222222222222222222222222222222222222222222222222222222
    22222222222222222222222222222222222222222222222222222222222222F2
    2222F2111122F2222F2222F2222222F22222F2711222F2222F2222F2222222F2
    2222F2211222F2222F2222F22222FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF22F2
    2222F2811222F2222F2222F2222FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2222
    22222221122222222222222222222222222222211222FFFFFF22222222222222
    222FFF1111FFFFFFFFF2222222222F22222FFF1121FFFFFFFFFF2F2222222FFF
    22FFFF1221FFFFFFFFFFFFF22222FFFFFFFFF112211FFFF2FFFFFFFF2222FFFF
    FF22F122221227F2222F2FFFFF2FFFFF22222222222222222222FFFFFFF2FFFF
    222222222222222222222FFFFFFFFF2F222222222222222222222FFFFFFFF222
    22222222222222222222FFFFFFFFF7222222222222222222222FFFFFFFFFF222
    22222222222222222222FFFFFFFFF7222222222222222222222FFFFFFFFFF222
    22222222222222222FFFFFFFFFFFFF2222222222222222222FFFFFFFFFFFFFF2
    22222222222222FFFFFFFFFFFFFFFFF222222222222222FFFFFFFFFFFFFFFFFF
    22222222222222FFFFFFFFFFFFFFFFFFF272222222722FFFFFFFFFFFFFFFFFFF
    FFFFFF2272FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Bevel3: TBevel
    Left = 248
    Top = 133
    Width = 220
    Height = 22
    Shape = bsFrame
    Visible = False
  end
  object Bevel1: TBevel
    Left = 16
    Top = 247
    Width = 220
    Height = 22
    Shape = bsFrame
    Visible = False
  end
  object Bevel4: TBevel
    Left = 16
    Top = 217
    Width = 220
    Height = 22
    Shape = bsFrame
    Visible = False
  end
  object Bevel2: TBevel
    Left = 16
    Top = 185
    Width = 220
    Height = 22
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 256
    Top = 139
    Width = 67
    Height = 14
    Caption = 'Transfer rate:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    Visible = False
  end
  object Label2: TLabel
    Left = 24
    Top = 190
    Width = 42
    Height = 14
    Caption = 'File size:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
  end
  object Label3: TLabel
    Left = 24
    Top = 251
    Width = 92
    Height = 14
    Caption = 'Est. time remaining:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    Visible = False
  end
  object lTranferRate: TLabel
    Left = 360
    Top = 139
    Width = 4
    Height = 14
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object lFileSize: TLabel
    Left = 128
    Top = 190
    Width = 4
    Height = 14
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lEstTime: TLabel
    Left = 128
    Top = 251
    Width = 4
    Height = 14
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label4: TLabel
    Left = 24
    Top = 221
    Width = 63
    Height = 14
    Caption = 'Elapsed time:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Layout = tlCenter
    Visible = False
  end
  object lElapsedTime: TLabel
    Left = 128
    Top = 221
    Width = 4
    Height = 14
    Caption = '-'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object sbCancel: TRxSpeedButton
    Left = 16
    Top = 290
    Width = 220
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    OnClick = sbCancelClick
  end
  object memo1: TMemo
    Left = 16
    Top = 12
    Width = 220
    Height = 131
    TabStop = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object ProgressBar: TProgressBar
    Left = 16
    Top = 154
    Width = 220
    Height = 16
    Min = 0
    Max = 100
    Smooth = True
    TabOrder = 1
    Visible = False
  end
  object Memo2: TMemo
    Left = 16
    Top = 362
    Width = 220
    Height = 49
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      'NOTE: When download completes, '
      'Kingswood Herd will shutdown and '
      'restart with the new downloaded '
      'version')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 2
    Visible = False
  end
  object Unzip: TUnzipFile
    IndexofItem = 0
    Options = [OverWriteFlag]
    wUnzipSubOptions = []
    Left = 138
    Top = 30
  end
  object Start: TTimer
    Enabled = False
    OnTimer = StartTimer
    Left = 180
    Top = 34
  end
  object MailSender: TNMSMTP
    Port = 25
    ReportLevel = 0
    OnInvalidHost = MailSenderInvalidHost
    PostMessage.ToAddress.Strings = (
      'info@kingswood.ie')
    EncodeType = uuMime
    ClearParams = False
    SubType = mtPlain
    Charset = 'us-ascii'
    OnHeaderIncomplete = MailSenderHeaderIncomplete
    OnAuthenticationFailed = MailSenderAuthenticationFailed
    Left = 176
    Top = 72
  end
  object HTTPGet: TLMDWebHTTPGet
    DownloadDir = 'C:\Kingswood Herd Management\Web\'
    DownloadParams.SizeLimit = 0
    OnProgress = HTTPGetProgress
    OnProcessed = HTTPGetProcessed
    InternetOptions.SocksProxy = False
    InternetOptions.SocksVersion = sv4
    InternetOptions.UseProxyAuth = False
    InternetOptions.UserAgent = 'Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)'
    InternetOptions.ModemConnection = False
    InternetOptions.AutoDial = False
    InternetOptions.AutoClose = False
    Left = 34
    Top = 46
  end
end
