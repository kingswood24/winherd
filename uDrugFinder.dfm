object fmDrugFinder: TfmDrugFinder
  Left = 465
  Top = 288
  Width = 820
  Height = 388
  Caption = 'Medicine Finder'
  Color = clBtnFace
  Constraints.MinHeight = 388
  Constraints.MinWidth = 350
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object BottomPanel: TPanel
    Left = 0
    Top = 301
    Width = 812
    Height = 56
    Align = alBottom
    TabOrder = 0
    object btnOK: TcxButton
      Left = 583
      Top = 8
      Width = 117
      Height = 36
      Anchors = [akRight, akBottom]
      Caption = 'Select'
      ModalResult = 1
      TabOrder = 0
      LookAndFeel.NativeStyle = True
    end
    object btnCancel: TcxButton
      Left = 709
      Top = 8
      Width = 85
      Height = 36
      Anchors = [akRight, akBottom]
      Caption = 'Cancel'
      Default = True
      ModalResult = 2
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = True
    end
    object cbUseExactMatch: TCheckBox
      Left = 8
      Top = 16
      Width = 129
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = 'Use Exact Match'
      TabOrder = 2
      Visible = False
      OnClick = actSearchExecute
    end
  end
  object DrugSearchGrid: TcxGrid
    Left = 0
    Top = 51
    Width = 812
    Height = 250
    Align = alClient
    BorderStyle = cxcbsNone
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    object DrugSearchGridTableView: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = DrugSearchGridTableViewFocusedRecordChanged
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.DataRowHeight = 22
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 32
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      object DrugSearchGridTableViewDrugName: TcxGridColumn
        Caption = 'Medicine Name'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 340
      end
      object DrugSearchGridTableViewVPANumber: TcxGridColumn
        Caption = 'VPA Number'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 140
      end
      object DrugSearchGridTableViewGroup: TcxGridColumn
        Caption = 'Group'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Grouping = False
        Options.Moving = False
        Width = 100
      end
      object DrugSearchGridTableViewMeatWD: TcxGridColumn
        Caption = 'Meat Withd.'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxTextEditProperties'
        OnGetDisplayText = DrugSearchGridTableViewWithdGetDisplayText
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Grouping = False
        Options.Moving = False
        Width = 90
      end
      object DrugSearchGridTableViewMilkWD: TcxGridColumn
        Caption = 'Milk Withd.'
        DataBinding.ValueType = 'Integer'
        PropertiesClassName = 'TcxTextEditProperties'
        OnGetDisplayText = DrugSearchGridTableViewWithdGetDisplayText
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Grouping = False
        Options.Moving = False
        Width = 90
      end
    end
    object DrugSearchGridLevel: TcxGridLevel
      GridView = DrugSearchGridTableView
    end
  end
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 812
    Height = 51
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 15
      Top = 16
      Width = 95
      Height = 17
      Caption = 'Medicine Name:'
    end
    object lSearchResultStatus: TLabel
      Left = 324
      Top = 16
      Width = 226
      Height = 20
      AutoSize = False
      Caption = 'No medicines found matching name.'
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object eSearchText: TEdit
      Left = 115
      Top = 13
      Width = 202
      Height = 25
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = eSearchTextChange
    end
    object btnRefreshDrugListing: TcxButton
      Left = 563
      Top = 9
      Width = 32
      Height = 30
      Hint = 'Click here to download latest drug file from our server.'
      Action = actRefreshDrugListing
      TabOrder = 1
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000530F0000530F00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        238FBB218BB72187B22187B22187B22187B22187B22187B22889B32A8AB32C8B
        B32F8CB4FF00FFFF00FFFF00FF248CB8259DCA2CACDB31AEDC35B0DC41B5DF4B
        B9E057BEE260C2E472C8E777CBE77ECDE983CFEA39A5CEFF00FFFF00FF248CB8
        30A5D04AB8E05BC0E36AC6E67BCDE886D1EA92D5EC97D7ED9DDAEEA2DCEFA8DE
        F0ADE0F139A5CEFF00FFFF00FF248CB837A8D164C3E580CEE98CD3EB96D7ED9B
        D9EEA1DBEFA6DDF0ACE0F1B1E2F2B7E4F3BCE6F439A5CEFF00FFFF00FF248CB8
        39A5CE7ECEE99DDAEEA2DCEFA8DEF0ACE0F1B2E2F2B7E4F3BDE7F4C1E8F5C6EA
        F6CBECF739A5CEFF00FFFF00FF248CB839A5CE9DDAEEA9DFF0AEE1F1B4E3F2B8
        E5F3BEE7F4C4E9F6C9ECF6CFEEF8D4F0F8DAF2FA39A5CEFF00FFFF00FF248CB8
        39A5CECFEEF8E6F8FCE6F8FCCEEEF7CDEDF7D1EFF8D6F1F9DCF3FAE1F5FBE7F8
        FCECFAFD39A5CEFF00FFFF00FF248CB839A5CE39A5CE39A5CE39A5CE29ADD6DA
        F3FAE6F8FC228835EBF9FDF0FBFEF5FDFEF7FEFE39A5CEFF00FFFF00FF248CB8
        2BADD836B1DD54BDE36EC7E769C5E539A5CE37AD514BCD6A22883539A5CE39A5
        CE39A5CE39A5CEFF00FFFF00FF248CB843B7DC80CEEA92D5ED9EDAEEA8DEF037
        AD514BCD6A37AD5137AD512288358CD3EA54BDE3FF00FFFF00FFFF00FF248CB8
        4EB8DBAADFF0C0E8F4E6F8FC37AD5137AD5137AD514BCD6A2288352288352288
        35FF00FFFF00FFFF00FFFF00FFFF00FF39A5CE39A5CE39A5CE39A5CE39A5CE39
        A5CE37AD514BCD6A228835FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF37AD514BCD6A228835FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF37AD5137AD5137AD51FF00FFFF00FFFF00FFFF00FFFF00FF}
      LookAndFeel.Kind = lfOffice11
    end
  end
  object btnClearSearch: TcxButton
    Left = 291
    Top = 12
    Width = 25
    Height = 26
    Action = actClearSearch
    TabOrder = 3
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00002EE4001B48FB00FF00FF001B48
      FB00002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00002EE4001B48FB00FF00FF00FF00FF001B48
      FB003E5EFF00002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00002EE4001B48FB00FF00FF00FF00FF00FF00FF001B48
      FB001B48FB003E5EFF00002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00002EE4001B48FB00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF003E5EFF001B48FB003E5EFF00002EE400FF00FF00FF00FF00FF00FF00FF00
      FF00002EE4001B48FB00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF001B48FB003E5EFF00002EE400FF00FF00FF00FF00002E
      E400002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF001B48FB003E5EFF00002EE400002EE400002E
      E400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF001B48FB001B48FB001B48FB00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF001B48FB003E5EFF001B48FB003E5EFF00002E
      E400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF001B48FB003E5EFF00002EE400FF00FF00FF00FF001B48
      FB00002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF001B48FB003E5EFF00002EE400FF00FF00FF00FF00FF00FF00FF00
      FF001B48FB00002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF001B48FB003E5EFF00002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF001B48FB00002EE400FF00FF00FF00FF00FF00FF00FF00FF001B48
      FB006482FF00002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00002EE400FF00FF00FF00FF001B48FB006482
      FF00002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF001B48FB001B48
      FB00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    LookAndFeel.Kind = lfOffice11
  end
  object ShowTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = ShowTimerTimer
    Left = 712
    Top = 10
  end
  object GetDrugListing: TLMDWebHTTPGet
    URL = 'http://www.kingswood.ie/download/winherd/druglisting.xml'
    DownloadDir = 'C:\Kingswood Herd Management\'
    DestinationName = 'druglisting.xml'
    DownloadParams.LoadImages = True
    DownloadParams.SizeLimit = 0
    OnProcessed = GetDrugListingProcessed
    InternetOptions.SocksProxy = False
    InternetOptions.SocksVersion = sv4
    InternetOptions.UseProxyAuth = False
    InternetOptions.UserAgent = 'DW'
    InternetOptions.ModemConnection = False
    InternetOptions.AutoDial = False
    InternetOptions.AutoClose = False
    InternetOptions.ForceInternetCheck = True
    Left = 681
    Top = 10
  end
  object ActionList: TActionList
    Images = HerdLookup.ImageList16x16
    Left = 742
    Top = 10
    object actSearch: TAction
      Caption = 'Match the up to the first 4 characters of medicine name'
      Visible = False
      OnExecute = actSearchExecute
      OnUpdate = actSearchUpdate
    end
    object actRefreshDrugListing: TAction
      OnExecute = actRefreshDrugListingExecute
    end
    object actClearSearch: TAction
      ImageIndex = 13
      OnExecute = actClearSearchExecute
    end
  end
end
