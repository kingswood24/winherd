object fmFertilityBenchmarking: TfmFertilityBenchmarking
  Left = 363
  Top = 182
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'DARD Dairy Fertility Benchmark Upload'
  ClientHeight = 505
  ClientWidth = 795
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TcxPageControl
    Left = 0
    Top = 79
    Width = 795
    Height = 426
    ActivePage = tsRawData
    Align = alClient
    HotTrack = True
    ImageBorder = 4
    Images = ImageStore.ImageList16x16
    LookAndFeel.Kind = lfUltraFlat
    NavigatorPosition = npLeftTop
    Style = 9
    TabOrder = 0
    TabSlants.Positions = [spRight]
    OnPageChanging = PageControlPageChanging
    ClientRectBottom = 426
    ClientRectRight = 795
    ClientRectTop = 30
    object tsRawData: TcxTabSheet
      Caption = 'Raw Data'
      ImageIndex = 4
      object Grid: TcxGrid
        Left = 0
        Top = 0
        Width = 795
        Height = 396
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
        object GridDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsOutputTable
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          object GridDBTableView1AnimalNo: TcxGridDBColumn
            Caption = 'Animal Number'
            DataBinding.FieldName = 'AnimalNo'
            Width = 97
          end
          object GridDBTableView1NatIDNum: TcxGridDBColumn
            Caption = 'National ID Number'
            DataBinding.FieldName = 'NatIDNum'
            Width = 116
          end
          object GridDBTableView1LactNo: TcxGridDBColumn
            Caption = 'Lactation Number'
            DataBinding.FieldName = 'LactNo'
            Width = 74
          end
          object GridDBTableView1CalvingDate: TcxGridDBColumn
            Caption = 'Calving Date'
            DataBinding.FieldName = 'CalvingDate'
            Width = 91
          end
          object GridDBTableView1PDDate: TcxGridDBColumn
            Caption = 'Pregnant'
            DataBinding.FieldName = 'PDDate'
            Width = 76
          end
          object GridDBTableView1SDate1: TcxGridDBColumn
            Caption = 'Service 1'
            DataBinding.FieldName = 'SDate1'
            Width = 79
          end
          object GridDBTableView1SDate2: TcxGridDBColumn
            Caption = 'Service 2'
            DataBinding.FieldName = 'SDate2'
            Width = 80
          end
          object GridDBTableView1SDate3: TcxGridDBColumn
            Caption = 'Service 3'
            DataBinding.FieldName = 'SDate3'
            Width = 84
          end
          object GridDBTableView1SDate4: TcxGridDBColumn
            Caption = 'Service 4'
            DataBinding.FieldName = 'SDate4'
            Width = 80
          end
          object GridDBTableView1SDate5: TcxGridDBColumn
            Caption = 'Service 5'
            DataBinding.FieldName = 'SDate5'
            Width = 80
          end
        end
        object BandedTableView: TcxGridDBBandedTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.PriorPage.Visible = False
          NavigatorButtons.NextPage.Visible = False
          NavigatorButtons.Insert.Visible = False
          NavigatorButtons.Delete.Visible = False
          NavigatorButtons.Edit.Visible = False
          NavigatorButtons.Post.Visible = False
          NavigatorButtons.Cancel.Visible = False
          NavigatorButtons.Refresh.Visible = False
          NavigatorButtons.Filter.Visible = False
          FilterBox.CustomizeDialog = False
          DataController.DataSource = dsOutputTable
          DataController.KeyFieldNames = 'ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = 'Total Animals: #'
              Kind = skCount
              FieldName = 'AID'
              Column = BandedTableViewAnimalNo
            end>
          DataController.Summary.SummaryGroups = <>
          Filtering.MRUItemsList = False
          Filtering.ColumnMRUItemsList = False
          OptionsBehavior.IncSearch = True
          OptionsBehavior.IncSearchItem = BandedTableViewAnimalNo
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.BandSizing = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.InvertSelect = False
          OptionsView.Navigator = True
          OptionsView.NavigatorOffset = 0
          OptionsView.Footer = True
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 20
          Styles.BandHeader = cxStyle1
          Bands = <
            item
              Caption = 'Season Breeding Events For Period'
              Options.HoldOwnColumnsOnly = True
              Options.Moving = False
              Options.Sizing = False
              Styles.Header = cxStyle2
            end
            item
              Caption = 'Animal Identity'
              Options.HoldOwnColumnsOnly = True
              Options.Moving = False
              Options.Sizing = False
              Position.BandIndex = 0
              Position.ColIndex = 0
            end
            item
              Caption = 'Calving'
              Options.HoldOwnColumnsOnly = True
              Options.Moving = False
              Options.Sizing = False
              Position.BandIndex = 0
              Position.ColIndex = 1
              Width = 84
            end
            item
              Caption = 'PD Status'
              Options.HoldOwnColumnsOnly = True
              Options.Moving = False
              Options.Sizing = False
              Position.BandIndex = 0
              Position.ColIndex = 2
              Width = 70
            end
            item
              Caption = 'Service Dates'
              HeaderAlignmentVert = vaTop
              Options.HoldOwnColumnsOnly = True
              Options.Moving = False
              Options.Sizing = False
              Position.BandIndex = 0
              Position.ColIndex = 3
            end>
          object BandedTableViewAnimalNo: TcxGridDBBandedColumn
            Caption = 'Animal No'
            DataBinding.FieldName = 'SortAnimalNo'
            OnGetDisplayText = BandedTableViewAnimalNoGetDisplayText
            MinWidth = 120
            SortIndex = 0
            SortOrder = soAscending
            Width = 120
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object BandedTableViewNatIDNum: TcxGridDBBandedColumn
            Caption = 'Nat ID No'
            DataBinding.FieldName = 'SortNatID'
            OnGetDisplayText = BandedTableViewNatIDNumGetDisplayText
            Width = 120
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object BandedTableViewLactNo: TcxGridDBBandedColumn
            Caption = 'Lact No'
            DataBinding.FieldName = 'LactNo'
            Width = 45
            Position.BandIndex = 1
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object BandedTableViewCalvingDate: TcxGridDBBandedColumn
            Caption = ' Date'
            DataBinding.FieldName = 'CalvingDate'
            Width = 775
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object BandedTableViewPregnant: TcxGridDBBandedColumn
            DataBinding.FieldName = 'Pregnant'
            OnGetDisplayText = BandedTableViewPregnantGetDisplayText
            Width = 40
            Position.BandIndex = 3
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object BandedTableViewSDate1: TcxGridDBBandedColumn
            Caption = '1'
            DataBinding.FieldName = 'SDate1'
            HeaderAlignmentHorz = taCenter
            Width = 68
            Position.BandIndex = 4
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object BandedTableViewSDate2: TcxGridDBBandedColumn
            Caption = '2'
            DataBinding.FieldName = 'SDate2'
            HeaderAlignmentHorz = taCenter
            Width = 68
            Position.BandIndex = 4
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object BandedTableViewSDate3: TcxGridDBBandedColumn
            Caption = '3'
            DataBinding.FieldName = 'SDate3'
            HeaderAlignmentHorz = taCenter
            Width = 68
            Position.BandIndex = 4
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object BandedTableViewSDate4: TcxGridDBBandedColumn
            Caption = '4'
            DataBinding.FieldName = 'SDate4'
            HeaderAlignmentHorz = taCenter
            Width = 68
            Position.BandIndex = 4
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object BandedTableViewSDate5: TcxGridDBBandedColumn
            Caption = '5'
            DataBinding.FieldName = 'SDate5'
            HeaderAlignmentHorz = taCenter
            Width = 68
            Position.BandIndex = 4
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
          object BandedTableViewHiddenNatIDNum: TcxGridDBBandedColumn
            Caption = 'Nat ID Num'
            DataBinding.FieldName = 'NatIDNum'
            Visible = False
            Hidden = True
            Position.BandIndex = 1
            Position.ColIndex = 3
            Position.RowIndex = 0
          end
          object BandedTableViewHiddenAnimalNo: TcxGridDBBandedColumn
            Caption = 'Animal No'
            DataBinding.FieldName = 'AnimalNo'
            Visible = False
            Hidden = True
            Position.BandIndex = 1
            Position.ColIndex = 4
            Position.RowIndex = 0
          end
        end
        object GridLevel1: TcxGridLevel
          GridView = BandedTableView
        end
      end
      object pSeasonInfo: TPanel
        Left = 134
        Top = 78
        Width = 275
        Height = 29
        BevelOuter = bvNone
        TabOrder = 1
        object SeasonCombo: TcxComboBox
          Left = 144
          Top = 4
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownRows = 5
          Properties.DropDownSizeable = True
          Properties.DropDownWidth = 90
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Revertable = True
          Properties.OnChange = SeasonComboPropertiesChange
          Style.BorderStyle = ebsFlat
          Style.Edges = [bLeft, bTop, bRight, bBottom]
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 0
          Width = 121
        end
        object cxLabel1: TcxLabel
          Left = 6
          Top = 6
          Caption = 'Select Breeding Start Year'
        end
      end
    end
    object tsXMLData: TcxTabSheet
      Caption = 'XML Data'
      ImageIndex = 5
      TabVisible = False
      object XMLData: TcxMemo
        Left = 0
        Top = 0
        Align = alClient
        ParentFont = False
        Properties.ReadOnly = True
        Properties.ScrollBars = ssVertical
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        TabOrder = 0
        Height = 396
        Width = 795
      end
    end
  end
  object pFavourite: TPanel
    Left = 424
    Top = 188
    Width = 167
    Height = 31
    BevelOuter = bvNone
    TabOrder = 5
    object cbFavourite: TcxCheckBox
      Left = 1
      Top = 5
      AutoSize = False
      Caption = 'Add Report As Favourite'
      Properties.OnChange = cbFavouritePropertiesChange
      TabOrder = 0
      Height = 21
      Width = 164
    end
  end
  object CalvingQuery: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      
        'Insert into tmp00001 ( AID, AnimalNo, SortAnimalNo, NatIDNum, So' +
        'rtNatIDNum, CalvingDate, LactNo )'
      
        'Select ID, AnimalNo, SortAnimalNo, NatIDNum, SortNatID, Max(E.Ev' +
        'entDate) CalvingDate, E.AnimalLactNo'
      'From Animals A, Events E'
      'Where (E.AnimalID=A.ID)'
      'And(A.Sex="Female")'
      'And (A.AnimalDeleted=False)'
      'And (A.LactNo > 0)'
      'And (E.EventType = 5)'
      'And ( E.EventDate Between :ADate1 And :ADate2)'
      'And (ID > 0)'
      'And (AnimalNo <> "")'
      
        'And Not ( ID IN ( Select E2.AnimalID From Events E2 Where ( E2.E' +
        'ventType=11)))'
      
        'Group By ID, AnimalNo, SortAnimalNo, NatIDNum, SortNatID, E.Anim' +
        'alLactNo'
      ''
      ''
      '')
    Left = 32
    Top = 210
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'ADate1'
        ParamType = ptUnknown
        Value = '01/01/2001'
      end
      item
        DataType = ftDateTime
        Name = 'ADate2'
        ParamType = ptUnknown
        Value = '01/01/2001'
      end>
  end
  object dsOutputTable: TDataSource
    Left = 34
    Top = 304
  end
  object ServiceQuery: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      
        'Select E.EventDate, A.AnimalNo BullNo, A.Name, A.HerdBookNo, B.C' +
        'ode '
      'From Events E'
      'Left Join Services S ON (E.ID=S.EventID)'
      'Left Join Animals A ON (A.ID=S.ServiceBull)'
      'Left Join Breeds B ON (B.ID=A.PrimaryBreed)'
      'Where ( E.AnimalID = :AID )'
      'And ( E.AnimalLactNo = :ALactNo )'
      'And ( E.EventType = 2 )'
      'And ( E.EventDate > :ADate )'
      'And ( E.EventDate Between :AFromDate and :AToDate) '
      'Order By E.EventDate ')
    Left = 32
    Top = 270
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ALactNo'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'ADate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AFromDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AToDate'
        ParamType = ptUnknown
      end>
  end
  object PregDiagQuery: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select P.PregnancyStatus From PregnancyDiag P'
      'Left Join Events E On (P.EventID=E.ID)'
      'Where ( E.AnimalID = :AID )'
      'And ( E.AnimalLactNo = :ALactNo )'
      'And ( EventType = 3 )')
    Left = 32
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptUnknown
        Value = '110'
      end
      item
        DataType = ftInteger
        Name = 'ALactNo'
        ParamType = ptUnknown
        Value = '9'
      end>
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 34
    Top = 180
    object cxStyle1: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = ANSI_CHARSET
      Font.Color = 16735067
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = 10049566
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clPurple
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
        Caption = 'Main'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 214
        FloatTop = 193
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = blbExit
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbView
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbCreateFile
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbViewFile
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbReviewFiles
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarControlContainerItem
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbHelp
            Visible = True
          end>
        Name = 'Custom 1'
        OneOnRow = True
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = True
      end
      item
        Caption = 'Filter'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 44
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 24
        FloatClientHeight = 24
        ItemLinks = <
          item
            Item = dxBarControlContainerItem1
            Visible = True
          end>
        Name = 'Filter'
        OneOnRow = True
        Row = 1
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'Main'
      'Filter')
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    HotImages = ImageStore.HotImageList16x16
    Images = ImageStore.ImageList16x16
    DisabledImages = ImageStore.DisabledImageList16x16
    LookAndFeel.Kind = lfStandard
    MenusShowRecentItemsFirst = False
    NotDocking = [dsNone]
    PopupMenuLinks = <>
    ShowHint = False
    SunkenBorder = True
    UseSystemFont = True
    Left = 76
    Top = 180
    DockControlHeights = (
      0
      0
      79
      0)
    object blbExit: TdxBarLargeButton
      Action = actClose
      Category = 0
      Height = 40
      HotImageIndex = 0
      LargeImageIndex = 0
      Width = 65
    end
    object blbView: TdxBarLargeButton
      Action = actLoadData
      Category = 0
      Height = 40
      HotImageIndex = 1
      LargeImageIndex = 1
      Width = 75
    end
    object blbCreateFile: TdxBarLargeButton
      Action = actCreateFile
      Category = 0
      HotImageIndex = 3
      LargeImageIndex = 3
      Width = 75
    end
    object blbViewFile: TdxBarLargeButton
      Caption = 'View File Data'
      Category = 0
      Enabled = False
      Hint = 'View File Data'
      Visible = ivAlways
      OnClick = blbViewFileClick
      Height = 40
      HotImageIndex = 2
      LargeImageIndex = 2
      Width = 75
    end
    object BarCombo: TdxBarCombo
      Align = iaClient
      Caption = 'Select Breeding Start Year'
      Category = 1
      Hint = 'Select Breeding Start Year'
      Visible = ivAlways
      OnChange = BarComboChange
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333FFFFFFFFFFFFFFF000000000000000077777777777777770FF7FF7FF7FF
        7FF07FF7FF7FF7F37F3709F79F79F7FF7FF077F77F77F7FF7FF7077777777777
        777077777777777777770FF7FF7FF7FF7FF07FF7FF7FF7FF7FF709F79F79F79F
        79F077F77F77F77F77F7077777777777777077777777777777770FF7FF7FF7FF
        7FF07FF7FF7FF7FF7FF709F79F79F79F79F077F77F77F77F77F7077777777777
        777077777777777777770FFFFF7FF7FF7FF07F33337FF7FF7FF70FFFFF79F79F
        79F07FFFFF77F77F77F700000000000000007777777777777777CCCCCC8888CC
        CCCC777777FFFF777777CCCCCCCCCCCCCCCC7777777777777777}
      ReadOnly = True
      ShowCaption = True
      Width = 100
      DropDownCount = 5
      ItemIndex = -1
    end
    object blbHelp: TdxBarLargeButton
      Caption = 'Help'
      Category = 0
      Enabled = False
      Hint = 'Help'
      Visible = ivAlways
      Height = 40
      HotImageIndex = 7
      LargeImageIndex = 6
      Width = 75
      SyncImageIndex = False
      ImageIndex = 7
    end
    object dxBarControlContainerItem1: TdxBarControlContainerItem
      Align = iaClient
      Category = 0
      Description = 'Season Information'
      Visible = ivAlways
      Control = pSeasonInfo
    end
    object blbReviewFiles: TdxBarLargeButton
      Action = actReviewFiles
      Category = 0
      HotImageIndex = 5
      Width = 75
      SyncImageIndex = False
      ImageIndex = 5
    end
    object dxBarControlContainerItem: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = pFavourite
    end
  end
  object ActionList1: TActionList
    Left = 74
    Top = 210
    object actLoadData: TAction
      Caption = 'Load Data'
      OnExecute = actLoadDataExecute
    end
    object actCreateFile: TAction
      Caption = 'Create File'
      OnExecute = actCreateFileExecute
    end
    object actClose: TAction
      Caption = 'Close'
      OnExecute = actCloseExecute
    end
    object actReviewFiles: TAction
      Caption = 'Review Files'
      OnExecute = actReviewFilesExecute
    end
  end
  object LoadDataTimer: TTimer
    Enabled = False
    Interval = 250
    OnTimer = LoadDataTimerTimer
    Left = 74
    Top = 239
  end
  object CalcCalvingHistory: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * from tmp00001 where AID = :AID')
    Left = 78
    Top = 279
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AID'
        ParamType = ptUnknown
      end>
  end
  object qDeleteRecords: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Delete From Tmp00001 where AID = :AID and ID <> :ID')
    Left = 76
    Top = 317
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
end
