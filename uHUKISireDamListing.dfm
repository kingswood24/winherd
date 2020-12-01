object fmHUKISireDamListing: TfmHUKISireDamListing
  Left = 457
  Top = 178
  Width = 795
  Height = 557
  ActiveControl = cxGrid
  Caption = 'fmHUKISireDamListing'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gbListingType: TcxGroupBox
    Left = 0
    Top = 80
    Align = alTop
    ParentColor = False
    ParentFont = False
    Style.BorderStyle = ebs3D
    Style.Color = clWhite
    Style.Edges = []
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 0
    Height = 67
    Width = 787
    object teTagNo: TcxTextEdit
      Left = 80
      Top = 4
      ParentFont = False
      Style.BorderStyle = ebsNone
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfFlat
      Style.TextColor = clBlue
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.BorderStyle = ebsNone
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.BorderStyle = ebsNone
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 0
      Width = 130
    end
    object cxLabel1: TcxLabel
      Left = 5
      Top = 5
      Caption = 'Tag Number:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object lBreed: TcxLabel
      Left = 551
      Top = 5
      Caption = 'Breed:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object teBreed: TcxTextEdit
      Left = 590
      Top = 4
      ParentFont = False
      Style.BorderStyle = ebsNone
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfFlat
      Style.TextColor = clBlue
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.BorderStyle = ebsNone
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.BorderStyle = ebsNone
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 3
      Width = 28
    end
    object lName: TcxLabel
      Left = 213
      Top = 5
      Caption = 'Name:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object teName: TcxTextEdit
      Left = 252
      Top = 4
      ParentFont = False
      Style.BorderStyle = ebsNone
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfFlat
      Style.TextColor = clBlue
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.BorderStyle = ebsNone
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.BorderStyle = ebsNone
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 5
      Width = 166
    end
    object lAnimalNo: TcxLabel
      Left = 625
      Top = 5
      Caption = 'Animal No.:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object teAnimalNo: TcxTextEdit
      Left = 691
      Top = 4
      ParentFont = False
      Style.BorderStyle = ebsNone
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfFlat
      Style.TextColor = clBlue
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.BorderStyle = ebsNone
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.BorderStyle = ebsNone
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 7
      Width = 86
    end
    object lNoticeInfo: TcxLabel
      Left = 52
      Top = 28
      AutoSize = False
      Caption = 
        'This animal has not been found in your current HUKI listing. If ' +
        'you find the animal on the listing below, click on the update de' +
        'tails button to ensure the sire has the current information avai' +
        'lable from HUKI.'
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.WordWrap = True
      Style.BorderStyle = ebsNone
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      Height = 37
      Width = 653
    end
    object cxLabel2: TcxLabel
      Left = 423
      Top = 5
      Caption = 'HBN:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object teHBN: TcxTextEdit
      Left = 452
      Top = 4
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Style.BorderStyle = ebsNone
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfFlat
      Style.TextColor = clBlue
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.BorderStyle = ebsNone
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.BorderStyle = ebsNone
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 10
      Width = 95
    end
  end
  object cxGrid: TcxGrid
    Left = 0
    Top = 147
    Width = 787
    Height = 379
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    object cxGridDBTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.First.Visible = True
      NavigatorButtons.PriorPage.Visible = False
      NavigatorButtons.Prior.Visible = True
      NavigatorButtons.Next.Visible = True
      NavigatorButtons.NextPage.Visible = False
      NavigatorButtons.Last.Visible = True
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Delete.Visible = False
      NavigatorButtons.Edit.Visible = False
      NavigatorButtons.Post.Visible = False
      NavigatorButtons.Cancel.Visible = False
      NavigatorButtons.Refresh.Visible = False
      NavigatorButtons.SaveBookmark.Visible = False
      NavigatorButtons.GotoBookmark.Visible = False
      NavigatorButtons.Filter.Visible = False
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.FocusRect = False
      OptionsView.Navigator = True
      OptionsView.NavigatorOffset = 0
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 10
      Preview.Visible = True
      object cxGridDBTableViewRecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
      end
      object cxGridDBTableViewEARTAG: TcxGridDBColumn
        DataBinding.FieldName = 'EARTAG'
        Width = 128
      end
      object cxGridDBTableViewDOB: TcxGridDBColumn
        DataBinding.FieldName = 'DOB'
        Width = 89
      end
      object cxGridDBTableViewLINENO: TcxGridDBColumn
        Caption = 'Animal No.'
        DataBinding.FieldName = 'LINENO'
        Width = 80
      end
      object cxGridDBTableViewNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        SortIndex = 0
        SortOrder = soAscending
        Width = 195
      end
      object cxGridDBTableViewHBN: TcxGridDBColumn
        DataBinding.FieldName = 'HBN'
        Width = 104
      end
      object cxGridDBTableViewBREED: TcxGridDBColumn
        DataBinding.FieldName = 'BREED'
        Width = 50
      end
      object cxGridDBTableViewPREFIX: TcxGridDBColumn
        DataBinding.FieldName = 'PREFIX'
      end
      object cxGridDBTableViewID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        Hidden = True
      end
      object cxGridDBTableViewSRCODE: TcxGridDBColumn
        DataBinding.FieldName = 'SRCODE'
        Width = 65
      end
      object cxGridDBTableViewFLAG: TcxGridDBColumn
        DataBinding.FieldName = 'FLAG'
        Width = 49
      end
    end
    object cxGridLevel: TcxGridLevel
      GridView = cxGridDBTableView
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 46
    Align = alTop
    ParentFont = False
    Style.Edges = []
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -19
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 6
    Height = 34
    Width = 787
    object lListingType: TcxLabel
      Left = 10
      Top = 2
      Caption = 'lListingType'
    end
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Toolbar'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = blbClose
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbUpdate
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbHelp
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarStatic1
            Visible = True
          end>
        Name = 'Toolbar'
        OneOnRow = True
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    HotImages = ImageStore.ImageList16x16
    Images = ImageStore.ImageList16x16
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 464
    Top = 110
    DockControlHeights = (
      0
      0
      46
      0)
    object blbClose: TdxBarLargeButton
      Caption = 'Close'
      Category = 0
      Hint = 'Close'
      Visible = ivAlways
      OnClick = blbCloseClick
      Height = 42
      HotImageIndex = 0
      Width = 54
      SyncImageIndex = False
      ImageIndex = 0
    end
    object blbHelp: TdxBarLargeButton
      Caption = 'Help'
      Category = 0
      Enabled = False
      Hint = 'Help'
      Visible = ivAlways
      Height = 42
      HotImageIndex = 7
      Width = 54
    end
    object dxBarStatic1: TdxBarStatic
      Category = 0
      Visible = ivAlways
    end
    object blbUpdate: TdxBarLargeButton
      Caption = 'Update Details'
      Category = 0
      Hint = 'Update Details'
      Visible = ivAlways
      OnClick = blbUpdateClick
      Height = 42
      HotImageIndex = 5
      Width = 78
      SyncImageIndex = False
      ImageIndex = 5
    end
  end
  object mdListing: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 336
    Top = 208
    object mdListingID: TStringField
      FieldName = 'ID'
    end
    object mdListingPREFIX: TStringField
      DisplayLabel = 'Prefix'
      FieldName = 'PREFIX'
      Size = 30
    end
    object mdListingNAME: TStringField
      DisplayLabel = 'Name'
      FieldName = 'NAME'
      Size = 50
    end
    object mdListingBREED: TStringField
      DisplayLabel = 'Breed'
      FieldName = 'BREED'
      Size = 10
    end
    object mdListingHBN: TStringField
      FieldName = 'HBN'
    end
    object mdListingSRCODE: TStringField
      DisplayLabel = 'SRCode'
      FieldName = 'SRCODE'
      Size = 30
    end
    object mdListingFLAG: TStringField
      DisplayLabel = 'Flag'
      FieldName = 'FLAG'
      Size = 5
    end
    object mdListingEARTAG: TStringField
      DisplayLabel = 'Ear Tag'
      FieldName = 'EARTAG'
    end
    object mdListingDOB: TStringField
      DisplayLabel = 'Date Of Birth'
      FieldName = 'DOB'
      Size = 12
    end
    object mdListingLINENO: TStringField
      DisplayLabel = 'Line No.'
      FieldName = 'LINENO'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = mdListing
    Left = 366
    Top = 208
  end
  object UpdateAnimal: TQuery
    DatabaseName = 'Kingswd'
    Left = 440
    Top = 226
  end
  object QueryAnimal: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      
        'Select A.NatIDNum, A.AnimalNo, A.HerdBookNo, A.Name, A.PrimaryBr' +
        'eed, B.PedigreeBreed From Animals A'
      'Left Join Breeds B On (B.ID=A.PrimaryBreed)'
      'Where ID=:ID')
    Left = 440
    Top = 260
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
end
