inherited fmBeefAISireRegister: TfmBeefAISireRegister
  Left = 360
  Top = 205
  Width = 807
  Height = 603
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Beef AI Sire Register'
  OldCreateOrder = True
  Position = poDesigned
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 547
    Width = 791
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 250
      end>
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Tahoma'
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 525
    Width = 791
    Height = 22
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 5
    object heDownload: TcxHyperLinkEdit
      Left = 4
      Top = 2
      TabStop = False
      Properties.ReadOnly = True
      Properties.SingleClick = True
      Properties.Prefix = ''
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.Edges = []
      TabOrder = 0
      Text = 'Download Latest AI Sire Register'
      OnClick = heDownloadClick
      Width = 167
    end
    object ProgressBar: TcxProgressBar
      Left = 552
      Top = 0
      Align = alRight
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 1
      Visible = False
      Width = 239
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 40
    Width = 791
    Height = 74
    Align = alTop
    TabOrder = 6
    object cxGroupBox1: TcxGroupBox
      Left = 6
      Top = 6
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Search For Animals '
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 0
      Height = 56
      Width = 579
      object cmboSearchField: TcxComboBox
        Left = 65
        Top = 22
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownSizeable = True
        Properties.ImmediatePost = True
        Properties.ImmediateUpdateText = True
        Properties.Items.Strings = (
          'Code'
          'Name')
        Properties.OnChange = cmboSearchFieldPropertiesChange
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 0
        Text = 'Code'
        Width = 121
      end
      object cxLabel3: TcxLabel
        Left = 22
        Top = 24
        Caption = 'Column'
      end
      object cxLabel4: TcxLabel
        Left = 207
        Top = 24
        Caption = 'Search Text'
      end
      object teSearchText: TcxTextEdit
        Left = 276
        Top = 22
        Properties.CharCase = ecUpperCase
        Properties.OnChange = teSearchTextPropertiesChange
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 3
        Width = 201
      end
      object btnSearch: TcxButton
        Left = 486
        Top = 22
        Width = 77
        Height = 21
        Caption = 'Search'
        TabOrder = 4
        OnClick = btnSearchClick
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = True
      end
    end
  end
  object SpreadSheet: TcxSpreadSheet [3]
    Left = 0
    Top = 114
    Width = 791
    Height = 411
    BufferedPaint = True
    ExcelProtectionStyle = False
    R1C1ReferenceStyle = True
    RowsAutoHeight = False
    ReadOnly = True
    Align = alClient
    AutoRecalc = False
    DefaultStyle.Font.Name = 'MS Sans Serif'
    HeaderFont.Charset = ANSI_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'Tahoma'
    HeaderFont.Style = []
    PainterType = ptOfficeXPStyle
    OnActiveCellChanging = SpreadSheetActiveCellChanging
    OnCustomPaint = SpreadSheetCustomPaint
    OnTopLeftChanging = SpreadSheetTopLeftChanging
    OnClick = SpreadSheetClick
  end
  inherited ActionList: TActionList
    Left = 90
    Top = 146
    object actOptions: TAction
      Caption = 'Options'
      ImageIndex = 26
    end
    object actUpdateSettings: TAction
      Caption = 'Update Settings'
      OnExecute = actUpdateSettingsExecute
    end
    object actAddSire: TAction
      Caption = 'Add Sire'
      ImageIndex = 9
      OnExecute = actAddSireExecute
    end
  end
  inherited BarManager: TdxBarManager
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Tahoma'
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Main'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 353
        FloatTop = 250
        FloatClientWidth = 23
        FloatClientHeight = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemLinks = <
          item
            Item = bClose
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton2
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton1
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = bHelp
            UserGlyph.Data = {00000000}
            Visible = True
          end>
        Name = 'Main'
        OneOnRow = True
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = True
        Visible = True
        WholeRow = True
        BackgroundBitmap.Data = {00000000}
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    UseSystemFont = False
    Left = 56
    Top = 146
    DockControlHeights = (
      0
      0
      40
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'Options'
      Category = 0
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = dxBarPopupMenu1
      OnClick = dxBarLargeButton1Click
      LargeImageIndex = 26
    end
    object bbUpdateSettings: TdxBarButton
      Action = actUpdateSettings
      Category = 0
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = actAddSire
      Category = 0
      HotImageIndex = 9
      Width = 75
      SyncImageIndex = False
      ImageIndex = 9
    end
  end
  object GetAllBulls: TLMDWebHTTPGet
    URL = 
      'http://www.icbf.com/services/evaluations/files/Allbull_SBVstars_' +
      '270109.xls'
    DownloadDir = 'C:\Kingswood Herd Management\'
    DestinationName = 'Allbull_SBVstars_270109.xls'
    DownloadParams.LoadImages = True
    DownloadParams.SizeLimit = 0
    OnProgress = GetAllBullsProgress
    OnProcessed = GetAllBullsProcessed
    InternetOptions.SocksProxy = False
    InternetOptions.SocksVersion = sv4
    InternetOptions.UseProxyAuth = False
    InternetOptions.UserAgent = 'DW'
    InternetOptions.ModemConnection = False
    InternetOptions.AutoDial = False
    InternetOptions.AutoClose = False
    Left = 326
    Top = 8
  end
  object dxBarPopupMenu1: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Item = bbUpdateSettings
        Visible = True
      end>
    UseOwnFont = False
    Left = 416
    Top = 146
  end
  object GetSerNo: TLMDWebHTTPGet
    URL = 'http://www.kingswood.ie/serno.snv'
    DownloadDir = 'C:\Kingswood Herd Management\Web\'
    DestinationName = 'serno.snv'
    DownloadParams.LoadImages = True
    DownloadParams.SizeLimit = 0
    OnProcessed = GetSerNoProcessed
    InternetOptions.SocksProxy = False
    InternetOptions.SocksVersion = sv4
    InternetOptions.UseProxyAuth = False
    InternetOptions.UserAgent = 'DW'
    InternetOptions.ModemConnection = False
    InternetOptions.AutoDial = False
    InternetOptions.AutoClose = False
    Left = 356
    Top = 8
  end
  object GetWebUpdate: TLMDWebHTTPGet
    URL = 'http://www.kingswood.ie/webupdate.ini'
    DownloadDir = 'C:\Kingswood Herd Management\Web\'
    DestinationName = 'webupdate.ini'
    DownloadParams.LoadImages = True
    DownloadParams.SizeLimit = 0
    OnProcessed = GetWebUpdateProcessed
    InternetOptions.SocksProxy = False
    InternetOptions.SocksVersion = sv4
    InternetOptions.UseProxyAuth = False
    InternetOptions.UserAgent = 'DW'
    InternetOptions.ModemConnection = False
    InternetOptions.AutoDial = False
    InternetOptions.AutoClose = False
    Left = 386
    Top = 8
  end
end
