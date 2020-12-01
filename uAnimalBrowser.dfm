object fmAnimalBrowser: TfmAnimalBrowser
  Left = 325
  Top = 154
  Width = 958
  Height = 595
  Caption = 'Parlour Events'
  Color = clWhite
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
  object pSearchAnimal: TPanel
    Left = 0
    Top = 0
    Width = 950
    Height = 198
    Align = alTop
    BevelOuter = bvNone
    Color = 15987699
    TabOrder = 0
    object teSearchAnimalTag: TcxTextEdit
      Left = 248
      Top = 28
      Constraints.MinHeight = 43
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.OnChange = teSearchAnimalTagPropertiesChange
      Style.BorderColor = clGray
      Style.BorderStyle = ebsThick
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -21
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.Shadow = False
      Style.IsFontAssigned = True
      StyleFocused.BorderColor = clRed
      TabOrder = 0
      OnKeyDown = teSearchAnimalTagKeyDown
      Width = 252
    end
    object btnFind: TcxButton
      Left = 530
      Top = 25
      Width = 97
      Height = 49
      Cursor = crHandPoint
      Action = actFindAnimal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Colors.Normal = 16629124
      LookAndFeel.Kind = lfFlat
    end
    object btnClear: TcxButton
      Left = 641
      Top = 25
      Width = 97
      Height = 49
      Cursor = crHandPoint
      Action = actClearAnimalSearch
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Colors.Normal = 16629124
      LookAndFeel.Kind = lfFlat
    end
    object AnimalGrid: TcxGrid
      Left = 12
      Top = 76
      Width = 488
      Height = 114
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      LookAndFeel.Kind = lfFlat
      object AnimalTableView: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        NavigatorButtons.First.Visible = True
        NavigatorButtons.PriorPage.Visible = True
        NavigatorButtons.Prior.Visible = True
        NavigatorButtons.Next.Visible = True
        NavigatorButtons.NextPage.Visible = True
        NavigatorButtons.Last.Visible = True
        NavigatorButtons.Insert.Visible = True
        NavigatorButtons.Delete.Visible = True
        NavigatorButtons.Edit.Visible = True
        NavigatorButtons.Post.Visible = True
        NavigatorButtons.Cancel.Visible = True
        NavigatorButtons.Refresh.Visible = True
        NavigatorButtons.SaveBookmark.Visible = True
        NavigatorButtons.GotoBookmark.Visible = True
        NavigatorButtons.Filter.Visible = True
        OnFocusedRecordChanged = AnimalTableViewFocusedRecordChanged
        DataController.DataSource = dsQueryAnimals
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.DataRowHeight = 54
        OptionsView.GridLines = glHorizontal
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 38
        OptionsView.IndicatorWidth = 22
        Styles.Content = cxStyle2
        Styles.Inactive = SelectedRecord
        Styles.Selection = SelectedRecord
        Styles.Header = cxStyle1
        object AnimalTableViewID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          Visible = False
          HeaderAlignmentVert = vaCenter
          Hidden = True
        end
        object AnimalTableViewNatIdNum: TcxGridDBColumn
          Caption = 'Nat. Id. No.'
          DataBinding.FieldName = 'NatIdNum'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentVert = vaCenter
          Width = 174
        end
        object AnimalTableViewDateOfBirth: TcxGridDBColumn
          Caption = 'DOB'
          DataBinding.FieldName = 'DateOfBirth'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentVert = vaCenter
          Width = 90
        end
        object AnimalTableViewSex: TcxGridDBColumn
          DataBinding.FieldName = 'Sex'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          OnGetDisplayText = AnimalTableViewSexGetDisplayText
          HeaderAlignmentVert = vaCenter
          Width = 39
        end
        object AnimalTableViewCode: TcxGridDBColumn
          Caption = 'Breed'
          DataBinding.FieldName = 'Code'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentVert = vaCenter
          Width = 55
        end
        object AnimalTableViewAnimalNo: TcxGridDBColumn
          Caption = 'Animal No.'
          DataBinding.FieldName = 'AnimalNo'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentVert = vaCenter
          Width = 97
        end
      end
      object AnimalGridLevel: TcxGridLevel
        GridView = AnimalTableView
      end
    end
    object gbAnimalDetail: TcxGroupBox
      Left = 528
      Top = 76
      ParentFont = False
      Style.BorderStyle = ebsNone
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfOffice11
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.Kind = lfOffice11
      TabOrder = 4
      Height = 116
      Width = 288
      object lSearchWarning: TcxLabel
        Left = 2
        Top = 18
        Align = alClient
        Caption = 'No animal found to match your search.'
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -12
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = [fsBold]
        Style.TextColor = clRed
        Style.IsFontAssigned = True
      end
      object lHAnimalNo: TcxLabel
        Left = 8
        Top = 10
        Caption = 'Animal No:'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object lHNatIDNum: TcxLabel
        Left = 8
        Top = 30
        Caption = 'Nat ID Num:'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object lHDateOfBirth: TcxLabel
        Left = 8
        Top = 50
        Caption = 'Date Of Birth:'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object lHBreed: TcxLabel
        Left = 8
        Top = 70
        Caption = 'Breed:'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object lHLactNoSex: TcxLabel
        Left = 8
        Top = 90
        Caption = 'Lact No:'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object lAnimalNo: TcxLabel
        Left = 105
        Top = 9
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Height = 19
        Width = 150
      end
      object lNatIDNum: TcxLabel
        Left = 105
        Top = 29
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Height = 19
        Width = 150
      end
      object lDateOfBirth: TcxLabel
        Left = 105
        Top = 49
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Height = 19
        Width = 150
      end
      object lBreed: TcxLabel
        Left = 105
        Top = 69
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Height = 19
        Width = 150
      end
      object lLactNoSex: TcxLabel
        Left = 105
        Top = 89
        AutoSize = False
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Height = 19
        Width = 150
      end
    end
    object cxLabel10: TcxLabel
      Left = 10
      Top = 1
      Caption = 'Search By:'
      ParentFont = False
      Style.StyleController = WinData.TouchScreenLabelStyleController
      Style.TextColor = 6316128
      Transparent = True
    end
    object cbSearchOn: TcxComboBox
      Left = 13
      Top = 28
      Constraints.MinHeight = 43
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'Jumbo'
        'Part Nat. ID')
      Properties.OnChange = cbSearchOnPropertiesChange
      Style.BorderColor = clGray
      Style.BorderStyle = ebsThick
      Style.StyleController = WinData.TouchScreenEditStyleController
      Style.ButtonStyle = btsFlat
      StyleFocused.BorderColor = clRed
      TabOrder = 6
      Width = 170
    end
    object cxLabel1: TcxLabel
      Left = 249
      Top = 1
      Caption = 'Search Text:'
      ParentFont = False
      Style.StyleController = WinData.TouchScreenLabelStyleController
      Style.TextColor = 6316128
      Transparent = True
    end
  end
  object pcAnimalEvents: TcxPageControl
    Left = 0
    Top = 198
    Width = 950
    Height = 306
    ActivePage = tsVeterinary
    Align = alClient
    Color = 15987699
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    LookAndFeel.Kind = lfUltraFlat
    ParentColor = False
    ParentFont = False
    Style = 9
    TabHeight = 45
    TabOrder = 1
    TabWidth = 240
    OnDrawTabEx = pcAnimalEventsDrawTabEx
    OnPageChanging = pcAnimalEventsPageChanging
    ClientRectBottom = 306
    ClientRectRight = 950
    ClientRectTop = 46
    object tsVeterinary: TcxTabSheet
      Caption = 'Veterinary'
      ImageIndex = 0
      object VeterinaryGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 950
        Height = 260
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        object VeterinaryGridDBTableView: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.First.Visible = True
          NavigatorButtons.PriorPage.Visible = True
          NavigatorButtons.Prior.Visible = True
          NavigatorButtons.Next.Visible = True
          NavigatorButtons.NextPage.Visible = True
          NavigatorButtons.Last.Visible = True
          NavigatorButtons.Insert.Visible = True
          NavigatorButtons.Delete.Visible = True
          NavigatorButtons.Edit.Visible = True
          NavigatorButtons.Post.Visible = True
          NavigatorButtons.Cancel.Visible = True
          NavigatorButtons.Refresh.Visible = True
          NavigatorButtons.SaveBookmark.Visible = True
          NavigatorButtons.GotoBookmark.Visible = True
          NavigatorButtons.Filter.Visible = True
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.InvertSelect = False
          OptionsView.DataRowHeight = 54
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 38
          OptionsView.IndicatorWidth = 22
          Styles.Content = WinData.TouchScreenInactiveGridStyle
          Styles.Inactive = WinData.TouchScreenInactiveGridStyle
          Styles.Selection = SelectedRecord
          Styles.Header = cxStyle1
        end
        object VeterinaryGridLevel: TcxGridLevel
          GridView = VeterinaryGridDBTableView
        end
      end
    end
    object tsHeats: TcxTabSheet
      Caption = 'Heat/Bulling'
      ImageIndex = 1
      object HeatBullingGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 950
        Height = 260
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        object HeatBullingGridDBTableView: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.First.Visible = True
          NavigatorButtons.PriorPage.Visible = True
          NavigatorButtons.Prior.Visible = True
          NavigatorButtons.Next.Visible = True
          NavigatorButtons.NextPage.Visible = True
          NavigatorButtons.Last.Visible = True
          NavigatorButtons.Insert.Visible = True
          NavigatorButtons.Delete.Visible = True
          NavigatorButtons.Edit.Visible = True
          NavigatorButtons.Post.Visible = True
          NavigatorButtons.Cancel.Visible = True
          NavigatorButtons.Refresh.Visible = True
          NavigatorButtons.SaveBookmark.Visible = True
          NavigatorButtons.GotoBookmark.Visible = True
          NavigatorButtons.Filter.Visible = True
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.InvertSelect = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.DataRowHeight = 54
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 38
          OptionsView.IndicatorWidth = 22
          Styles.Content = WinData.TouchScreenInactiveGridStyle
          Styles.Inactive = WinData.TouchScreenInactiveGridStyle
          Styles.Selection = SelectedRecord
          Styles.Header = cxStyle1
        end
        object HeatBullingGridLevel: TcxGridLevel
          GridView = HeatBullingGridDBTableView
        end
      end
    end
    object tsService: TcxTabSheet
      Caption = 'AI Service'
      ImageIndex = 3
      object ServiceGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 915
        Height = 268
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        object ServiceGridDBTableView: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.First.Visible = True
          NavigatorButtons.PriorPage.Visible = True
          NavigatorButtons.Prior.Visible = True
          NavigatorButtons.Next.Visible = True
          NavigatorButtons.NextPage.Visible = True
          NavigatorButtons.Last.Visible = True
          NavigatorButtons.Insert.Visible = True
          NavigatorButtons.Delete.Visible = True
          NavigatorButtons.Edit.Visible = True
          NavigatorButtons.Post.Visible = True
          NavigatorButtons.Cancel.Visible = True
          NavigatorButtons.Refresh.Visible = True
          NavigatorButtons.SaveBookmark.Visible = True
          NavigatorButtons.GotoBookmark.Visible = True
          NavigatorButtons.Filter.Visible = True
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.InvertSelect = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.DataRowHeight = 54
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 38
          OptionsView.IndicatorWidth = 22
          Styles.Content = WinData.TouchScreenInactiveGridStyle
          Styles.Inactive = WinData.TouchScreenInactiveGridStyle
          Styles.Selection = SelectedRecord
          Styles.Header = cxStyle1
        end
        object ServiceGridLevel: TcxGridLevel
          GridView = ServiceGridDBTableView
        end
      end
    end
    object tsDryOff: TcxTabSheet
      Caption = 'Dry Off'
      ImageIndex = 2
      object DryOffGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 915
        Height = 260
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        object DryOffGridDBTableView: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.First.Visible = True
          NavigatorButtons.PriorPage.Visible = True
          NavigatorButtons.Prior.Visible = True
          NavigatorButtons.Next.Visible = True
          NavigatorButtons.NextPage.Visible = True
          NavigatorButtons.Last.Visible = True
          NavigatorButtons.Insert.Visible = True
          NavigatorButtons.Delete.Visible = True
          NavigatorButtons.Edit.Visible = True
          NavigatorButtons.Post.Visible = True
          NavigatorButtons.Cancel.Visible = True
          NavigatorButtons.Refresh.Visible = True
          NavigatorButtons.SaveBookmark.Visible = True
          NavigatorButtons.GotoBookmark.Visible = True
          NavigatorButtons.Filter.Visible = True
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.InvertSelect = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.DataRowHeight = 54
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 38
          OptionsView.IndicatorWidth = 22
          Styles.Content = WinData.TouchScreenInactiveGridStyle
          Styles.Inactive = WinData.TouchScreenInactiveGridStyle
          Styles.Selection = SelectedRecord
          Styles.Header = cxStyle1
        end
        object DryOffGridLevel: TcxGridLevel
          GridView = DryOffGridDBTableView
        end
      end
    end
  end
  object pEventOptions: TPanel
    Left = 0
    Top = 504
    Width = 950
    Height = 60
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    TabOrder = 2
    object btnClose: TcxButton
      Left = 842
      Top = 1
      Width = 97
      Height = 49
      Cursor = crHandPoint
      Action = actClose
      Anchors = [akRight, akBottom]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Colors.Normal = 16629124
      LookAndFeel.Kind = lfFlat
    end
    object btnAddEvent: TcxButton
      Left = 8
      Top = 5
      Width = 97
      Height = 48
      Cursor = crHandPoint
      Action = actAddEvent
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Colors.Normal = 16629124
      LookAndFeel.Kind = lfFlat
    end
    object btnDeleteEvent: TcxButton
      Left = 114
      Top = 5
      Width = 101
      Height = 48
      Cursor = crHandPoint
      Action = actDeleteEvent
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Colors.Normal = 16629124
      LookAndFeel.Kind = lfFlat
    end
    object cxButton1: TcxButton
      Left = 222
      Top = 5
      Width = 153
      Height = 48
      Cursor = crHandPoint
      Action = actViewHistory
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Colors.Normal = 16629124
      LookAndFeel.Kind = lfFlat
    end
  end
  object QueryAnimals: TQuery
    AfterOpen = QueryAnimalsAfterOpen
    AfterScroll = QueryAnimalsAfterScroll
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select A.ID, A.NatIdNum, A.SearchNatId, A.AnimalNo,'
      '       A.DateOfBirth, A.Sex, A.LactNo, B.Code, A.HerdID'
      'From Animals A'
      'Left Join Breeds B ON (A.PrimaryBreed=B.Id)'
      'Where SUBSTRING(A.SearchNatId FROM 8) Like :SearchNo'
      'And (A.InHerd=True)'
      'And (A.AnimalDeleted=False)'
      ' ')
    Left = 728
    Top = 6
    ParamData = <
      item
        DataType = ftString
        Name = 'SearchNo'
        ParamType = ptInput
        Value = '"%20%"'
      end>
  end
  object ActionList: TActionList
    Left = 788
    Top = 6
    object actFindAnimal: TAction
      Caption = 'Find'
      OnExecute = actFindAnimalExecute
    end
    object actClearAnimalSearch: TAction
      Caption = 'Clear'
      OnExecute = actClearAnimalSearchExecute
    end
    object actAddEvent: TAction
      Caption = 'Add'
      OnExecute = actAddEventExecute
    end
    object actDeleteEvent: TAction
      Caption = 'Delete'
      OnExecute = actDeleteEventExecute
      OnUpdate = actDeleteEventUpdate
    end
    object actViewHistory: TAction
      Caption = 'View History'
      OnExecute = actViewHistoryExecute
    end
    object actClose: TAction
      Caption = 'Close'
      OnExecute = actCloseExecute
    end
  end
  object dsQueryAnimals: TDataSource
    DataSet = QueryAnimals
    Left = 758
    Top = 6
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 698
    Top = 6
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6316128
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TextColor = clHighlightText
    end
    object SelectedRecord: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16629124
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TextColor = clWindow
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
    end
  end
end
