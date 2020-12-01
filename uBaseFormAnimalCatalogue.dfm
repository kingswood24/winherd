inherited fmBaseFormAnimalCatalogue: TfmBaseFormAnimalCatalogue
  Left = 382
  Top = 152
  Width = 607
  Height = 483
  Caption = ''
  Constraints.MinHeight = 430
  Constraints.MinWidth = 607
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 432
    Width = 599
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
    ParentFont = True
  end
  object GridCatalogueAnimals: TcxGrid [1]
    Left = 18
    Top = 168
    Width = 551
    Height = 243
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 5
    LookAndFeel.Kind = lfFlat
    object GridCatalogueAnimalsDBTableView: TcxGridDBTableView
      OnDblClick = GridCatalogueAnimalsDBTableViewDblClick
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsCatalogueAnimals
      DataController.KeyFieldNames = 'ID'
      DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoFocusTopRowAfterSorting]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.DataRowHeight = 22
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Styles.ContentEven = cxStyleContentEven
      Styles.ContentOdd = cxStyleContentOdd
      object GridCatalogueAnimalsDBTableViewRecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
        Hidden = True
        Options.Editing = False
        Options.Filtering = False
      end
      object GridCatalogueAnimalsDBTableViewID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        Hidden = True
        Options.Editing = False
        Options.Filtering = False
        Styles.Content = cxStyleContentOdd
      end
      object GridCatalogueAnimalsDBTableViewSelected: TcxGridDBColumn
        DataBinding.FieldName = 'Selected'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayGrayed = 'False'
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        Properties.ValueGrayed = 'False'
        Options.Filtering = False
        Width = 47
      end
      object GridCatalogueAnimalsDBTableViewSortAnimalNo: TcxGridDBColumn
        Tag = 1
        Caption = 'Animal No.'
        DataBinding.FieldName = 'SortAnimalNo'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        OnGetDisplayText = GridCatalogueAnimalsDBTableViewSortAnimalNoGetDisplayText
        Options.Editing = False
        Options.Filtering = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 78
      end
      object GridCatalogueAnimalsDBTableViewName: TcxGridDBColumn
        Tag = 1
        DataBinding.FieldName = 'Name'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 214
      end
      object GridCatalogueAnimalsDBTableViewHerdBookNo: TcxGridDBColumn
        Tag = 1
        DataBinding.FieldName = 'HerdBookNo'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 98
      end
      object GridCatalogueAnimalsDBTableViewSortNatID: TcxGridDBColumn
        Tag = 1
        Caption = 'Nat. Id. No.'
        DataBinding.FieldName = 'SortNatID'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        OnGetDisplayText = GridCatalogueAnimalsDBTableViewSortNatIDGetDisplayText
        Options.Editing = False
        Options.Filtering = False
      end
      object GridCatalogueAnimalsDBTableViewSex: TcxGridDBColumn
        DataBinding.FieldName = 'Sex'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 61
      end
      object GridCatalogueAnimalsDBTableViewDateOfBirth: TcxGridDBColumn
        Caption = 'Date of Birth'
        DataBinding.FieldName = 'DateOfBirth'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Vert = taVCenter
        Options.Editing = False
        Width = 83
      end
      object GridCatalogueAnimalsDBTableViewAnimalNo: TcxGridDBColumn
        DataBinding.FieldName = 'AnimalNo'
        Visible = False
        Hidden = True
        Options.Editing = False
      end
      object GridCatalogueAnimalsDBTableViewNatIdNum: TcxGridDBColumn
        DataBinding.FieldName = 'NatIdNum'
        Visible = False
        Hidden = True
        Options.Editing = False
      end
    end
    object GridCatalogueAnimalsLevel: TcxGridLevel
      GridView = GridCatalogueAnimalsDBTableView
    end
  end
  object cxGroupBox1: TcxGroupBox [2]
    Left = 18
    Top = 110
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Search For Animals '
    Style.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 6
    Height = 56
    Width = 551
    object cmboSearchColumns: TcxComboBox
      Left = 65
      Top = 22
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.OnEditValueChanged = cmboSearchColumnsPropertiesEditValueChanged
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 0
      Width = 121
    end
    object cxLabel1: TcxLabel
      Left = 22
      Top = 24
      Caption = 'Column'
    end
    object cxLabel2: TcxLabel
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
    object btnSearchAssist: TcxButton
      Left = 486
      Top = 22
      Width = 53
      Height = 21
      Action = actClearSearch
      TabOrder = 4
      LookAndFeel.Kind = lfFlat
    end
  end
  object cxGroupBox2: TcxGroupBox [3]
    Left = 18
    Top = 52
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Include Options'
    Style.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 7
    Height = 53
    Width = 551
    object cbIncludeAnimalsLeftHerd: TcxCheckBox
      Left = 46
      Top = 22
      Caption = 'Animals Left Herd'
      Properties.Alignment = taRightJustify
      Properties.OnChange = cbIncludeLeftHerdPropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 0
      Width = 121
    end
  end
  inherited ActionList: TActionList
    Left = 14
    Top = 336
    object actClearSearch: TAction
      Caption = 'Reset'
      OnExecute = actClearSearchExecute
    end
    object actView: TAction
      Caption = 'View'
      ImageIndex = 19
    end
    object actContinueSearch: TAction
      Caption = 'Continue'
      OnExecute = actContinueSearchExecute
    end
  end
  inherited BarManager: TdxBarManager
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
        ItemLinks = <
          item
            Item = bClose
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
        UseOwnFont = False
        Visible = True
        WholeRow = True
        BackgroundBitmap.Data = {00000000}
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 46
    Top = 336
    DockControlHeights = (
      0
      0
      48
      0)
    inherited bClose: TdxBarLargeButton
      Height = 44
    end
    inherited bHelp: TdxBarLargeButton
      Height = 44
    end
  end
  object mdCatalogueAnimals: TdxMemData
    Indexes = <>
    SortOptions = []
    OnNewRecord = mdCatalogueAnimalsNewRecord
    Left = 294
    Top = 180
    object mdCatalogueAnimalsID: TIntegerField
      FieldName = 'ID'
      Visible = False
    end
    object mdCatalogueAnimalsNatIdNum: TStringField
      DisplayLabel = 'Nat. Id. No.'
      FieldName = 'NatIdNum'
    end
    object mdCatalogueAnimalsSortNatID: TStringField
      FieldName = 'SortNatID'
    end
    object mdCatalogueAnimalsAnimalNo: TStringField
      DisplayLabel = 'Animal No.'
      FieldName = 'AnimalNo'
      Size = 10
    end
    object mdCatalogueAnimalsSortAnimalNo: TStringField
      FieldName = 'SortAnimalNo'
      Size = 10
    end
    object mdCatalogueAnimalsName: TStringField
      FieldName = 'Name'
      Size = 40
    end
    object mdCatalogueAnimalsSex: TStringField
      FieldName = 'Sex'
      Size = 6
    end
    object mdCatalogueAnimalsDateOfBirth: TDateField
      FieldName = 'DateOfBirth'
    end
    object mdCatalogueAnimalsHerdBookNo: TStringField
      DisplayLabel = 'Herdbook No.'
      FieldName = 'HerdBookNo'
      Size = 30
    end
    object mdCatalogueAnimalsSelected: TBooleanField
      FieldName = 'Selected'
    end
  end
  object dsCatalogueAnimals: TDataSource
    DataSet = mdCatalogueAnimals
    Left = 336
    Top = 182
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 8
    Top = 154
    object cxStyleContentOdd: TcxStyle
      AssignedValues = [svColor]
      Color = 15462874
    end
    object cxStyleContentEven: TcxStyle
      AssignedValues = [svColor]
      Color = clWindow
    end
  end
end
