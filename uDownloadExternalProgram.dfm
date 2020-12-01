object fmDownloadExternalProgram: TfmDownloadExternalProgram
  Left = 743
  Top = 416
  BorderStyle = bsDialog
  ClientHeight = 98
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object pbDownloadAttachment: TcxProgressBar
    Left = 42
    Top = 30
    AutoSize = False
    Style.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.Kind = lfOffice11
    TabOrder = 0
    Height = 31
    Width = 331
  end
  object GetDownloadAttachment: TLMDWebHTTPGet
    DownloadParams.SizeLimit = 0
    OnProgress = GetDownloadAttachmentProgress
    OnProcessed = GetDownloadAttachmentProcessed
    InternetOptions.SocksProxy = False
    InternetOptions.SocksVersion = sv4
    InternetOptions.UseProxyAuth = False
    InternetOptions.UserAgent = 'Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)'
    InternetOptions.ModemConnection = False
    InternetOptions.AutoDial = False
    InternetOptions.AutoClose = False
    Left = 374
    Top = 30
  end
end
