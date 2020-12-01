inherited fmMovementsEventReview: TfmMovementsEventReview
  Left = 407
  Top = 209
  Width = 656
  Height = 458
  Caption = 'Animal Data Review'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 402
    Width = 640
  end
  object pcAnimalData: TcxPageControl [1]
    Left = 0
    Top = 48
    Width = 640
    Height = 354
    ActivePage = tsPurchDetails
    Align = alClient
    Style = 9
    TabHeight = 28
    TabOrder = 5
    TabWidth = 120
    OnPageChanging = pcAnimalDataPageChanging
    ClientRectBottom = 354
    ClientRectRight = 640
    ClientRectTop = 29
    object tsPurchDetails: TcxTabSheet
      Caption = 'Purchase'
      ImageIndex = 3
      object dePurchaseDate: TcxDBDateEdit
        Left = 130
        Top = 32
        DataBinding.DataField = 'PurchDate'
        TabOrder = 0
        Width = 115
      end
      object cxLabel1: TcxLabel
        Left = 28
        Top = 32
        Caption = 'Purchase Date'
      end
      object teEventComment: TcxDBTextEdit
        Left = 130
        Top = 64
        DataBinding.DataField = 'Comment'
        Properties.MaxLength = 40
        TabOrder = 2
        Width = 238
      end
      object cxLabel2: TcxLabel
        Left = 28
        Top = 64
        Caption = 'Comment'
      end
      object cePrice: TcxDBCurrencyEdit
        Left = 130
        Top = 96
        DataBinding.DataField = 'Price'
        TabOrder = 4
        Width = 115
      end
      object cxLabel3: TcxLabel
        Left = 28
        Top = 96
        Caption = 'Price'
      end
      object seWeight: TcxDBSpinEdit
        Left = 130
        Top = 128
        DataBinding.DataField = 'Weight'
        Properties.DisplayFormat = '#.##'
        Properties.ValueType = vtFloat
        TabOrder = 6
        Width = 115
      end
      object cxLabel4: TcxLabel
        Left = 28
        Top = 128
        Caption = 'Weight (Kgs)'
      end
      object cxLabel5: TcxLabel
        Left = 28
        Top = 160
        Caption = 'Lot Number'
      end
      object teLotNo: TcxDBTextEdit
        Left = 130
        Top = 160
        DataBinding.DataField = 'LotNumber'
        TabOrder = 9
        Width = 131
      end
      object cbIgnorePurchaseEvent: TcxDBCheckBox
        Left = 28
        Top = 200
        Caption = 'Do not record purchase event for this animal'
        DataBinding.DataField = 'IgnorePurchaseEvent'
        Properties.Alignment = taLeftJustify
        Properties.ImmediatePost = True
        Properties.NullStyle = nssUnchecked
        TabOrder = 10
        Width = 244
      end
    end
    object tsAncestry: TcxTabSheet
      Caption = 'Ancestry'
      ImageIndex = 0
      object AncestryGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 640
        Height = 325
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        object AncestryGridTableView: TcxGridDBTableView
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
          DataController.DataSource = GridDataSource
          DataController.KeyFieldNames = 'ID'
          DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.DataRowHeight = 21
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 34
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 15
          object AncestryGridTableViewID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
          end
          object AncestryGridTableViewRefID: TcxGridDBColumn
            DataBinding.FieldName = 'RefID'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
          end
          object AncestryGridTableViewAnimalNo: TcxGridDBColumn
            Caption = 'Animal No.'
            DataBinding.FieldName = 'AnimalNo'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentVert = vaCenter
            SortIndex = 0
            SortOrder = soAscending
          end
          object AncestryGridTableViewNatIDNum: TcxGridDBColumn
            Caption = 'Nat Id. No.'
            DataBinding.FieldName = 'NatIDNum'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentVert = vaCenter
          end
          object AncestryGridTableViewSex: TcxGridDBColumn
            DataBinding.FieldName = 'Sex'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentVert = vaCenter
          end
          object AncestryGridTableViewDateOfBirth: TcxGridDBColumn
            Caption = 'Date of Birth'
            DataBinding.FieldName = 'DateOfBirth'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentVert = vaCenter
            Width = 78
          end
          object AncestryGridTableViewBreed: TcxGridDBColumn
            DataBinding.FieldName = 'Breed'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentVert = vaCenter
          end
          object AncestryGridTableViewLactNo: TcxGridDBColumn
            Caption = 'Lact No.'
            DataBinding.FieldName = 'LactNo'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentVert = vaCenter
            Width = 57
          end
          object AncestryGridTableViewColour: TcxGridDBColumn
            DataBinding.FieldName = 'Colour'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentVert = vaCenter
          end
          object AncestryGridTableViewName: TcxGridDBColumn
            DataBinding.FieldName = 'Name'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentVert = vaCenter
            Width = 140
          end
          object AncestryGridTableViewHerdBookNo: TcxGridDBColumn
            Caption = 'Herd Book No.'
            DataBinding.FieldName = 'HerdBookNo'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentVert = vaCenter
            Width = 80
          end
          object AncestryGridTableViewSireID: TcxGridDBColumn
            DataBinding.FieldName = 'SireID'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
          end
          object AncestryGridTableViewDamID: TcxGridDBColumn
            DataBinding.FieldName = 'DamID'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
          end
        end
        object AncestryGridLevel: TcxGridLevel
          GridView = AncestryGridTableView
        end
      end
    end
    object tsEvents: TcxTabSheet
      Caption = 'Events'
      ImageIndex = 1
      object EventGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 640
        Height = 325
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        object EventGridDBTableView: TcxGridDBTableView
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
          DataController.DataSource = GridDataSource
          DataController.KeyFieldNames = 'ID'
          DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.DataRowHeight = 21
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 34
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 15
          object EventGridDBTableViewID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
          end
          object EventGridDBTableViewRefID: TcxGridDBColumn
            DataBinding.FieldName = 'RefID'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
          end
          object EventGridDBTableViewEventType: TcxGridDBColumn
            Caption = 'Type'
            DataBinding.FieldName = 'EventType'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.Alignment.Vert = taVCenter
            RepositoryItem = HerdLookup.erLookupEventTypes
            HeaderAlignmentVert = vaCenter
          end
          object EventGridDBTableViewEventDate: TcxGridDBColumn
            Caption = 'Date'
            DataBinding.FieldName = 'EventDate'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentVert = vaCenter
            SortIndex = 0
            SortOrder = soDescending
            Width = 88
          end
          object EventGridDBTableViewEventDesc: TcxGridDBColumn
            Caption = 'Comment'
            DataBinding.FieldName = 'EventDesc'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentVert = vaCenter
          end
          object EventGridDBTableViewAnimalLactNo: TcxGridDBColumn
            Caption = 'Lact. No.'
            DataBinding.FieldName = 'AnimalLactNo'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentVert = vaCenter
            Width = 54
          end
        end
        object EventGridGridLevel: TcxGridLevel
          GridView = EventGridDBTableView
        end
      end
    end
    object tsLactations: TcxTabSheet
      Caption = 'Lactations'
      ImageIndex = 2
      object LactationGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 640
        Height = 325
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        object LactationGridDBTableView: TcxGridDBTableView
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
          DataController.DataSource = GridDataSource
          DataController.KeyFieldNames = 'ID'
          DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.DataRowHeight = 21
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 34
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 15
          object LactationGridDBTableViewID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            Hidden = True
          end
          object LactationGridDBTableViewRefID: TcxGridDBColumn
            DataBinding.FieldName = 'RefID'
            Visible = False
            Hidden = True
          end
          object LactationGridDBTableViewLactNo: TcxGridDBColumn
            Caption = 'Lact No.'
            DataBinding.FieldName = 'LactNo'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.Alignment.Horz = taCenter
            SortIndex = 0
            SortOrder = soDescending
            Width = 48
          end
          object LactationGridDBTableViewDY: TcxGridDBColumn
            Caption = 'Daily Yield'
            DataBinding.FieldName = 'DY'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.DisplayFormat = '#.##'
            Width = 52
          end
          object LactationGridDBTableViewDBPc: TcxGridDBColumn
            Caption = 'Daily BFat %'
            DataBinding.FieldName = 'DBPc'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.DisplayFormat = '#.##'
            Width = 52
          end
          object LactationGridDBTableViewDPPc: TcxGridDBColumn
            Caption = 'Daily Prot. %'
            DataBinding.FieldName = 'DPPc'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.DisplayFormat = '#.##'
            Width = 52
          end
          object LactationGridDBTableViewDLPc: TcxGridDBColumn
            Caption = 'Daily Lactose %'
            DataBinding.FieldName = 'DLPc'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.DisplayFormat = '#.##'
            Width = 59
          end
          object LactationGridDBTableViewCY: TcxGridDBColumn
            Caption = 'Cum. Yield'
            DataBinding.FieldName = 'CY'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.DisplayFormat = '#'
            Width = 52
          end
          object LactationGridDBTableViewCBPc: TcxGridDBColumn
            Caption = 'Cum. BFat %'
            DataBinding.FieldName = 'CBPc'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.DisplayFormat = '#.##'
            Width = 52
          end
          object LactationGridDBTableViewCPPc: TcxGridDBColumn
            Caption = 'Cum. Prot. %'
            DataBinding.FieldName = 'CPPc'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.DisplayFormat = '#.##'
            Width = 52
          end
          object LactationGridDBTableViewCLPc: TcxGridDBColumn
            Caption = 'Cum. Lactose %'
            DataBinding.FieldName = 'CLPc'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.DisplayFormat = '#.##'
            Width = 52
          end
          object LactationGridDBTableViewRecs: TcxGridDBColumn
            Caption = 'No. of Recordings'
            DataBinding.FieldName = 'Recs'
            PropertiesClassName = 'TcxSpinEditProperties'
            Width = 64
          end
          object LactationGridDBTableViewDIM: TcxGridDBColumn
            Caption = 'Days In Milk'
            DataBinding.FieldName = 'DIM'
            PropertiesClassName = 'TcxSpinEditProperties'
            Width = 45
          end
          object LactationGridDBTableViewY305: TcxGridDBColumn
            Caption = '305 Yield'
            DataBinding.FieldName = 'Y305'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.DisplayFormat = '#'
            Width = 56
          end
          object LactationGridDBTableViewBPc305: TcxGridDBColumn
            Caption = '305 Bfat % '
            DataBinding.FieldName = 'BPc305'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.DisplayFormat = '#.##'
            Width = 45
          end
          object LactationGridDBTableViewPPc305: TcxGridDBColumn
            Caption = '305 Prot. %'
            DataBinding.FieldName = 'PPc305'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.DisplayFormat = '#.##'
            Width = 45
          end
          object LactationGridDBTableViewLPc305: TcxGridDBColumn
            Caption = '305 Lactose %'
            DataBinding.FieldName = 'LPc305'
            PropertiesClassName = 'TcxSpinEditProperties'
            Properties.DisplayFormat = '#.##'
          end
        end
        object LactationGridLevel: TcxGridLevel
          GridView = LactationGridDBTableView
        end
      end
    end
  end
  inherited ActionList: TActionList
    Top = 316
    object actRemove: TAction
      Caption = 'Remove'
      ImageIndex = 21
      OnExecute = actRemoveExecute
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
            Item = blbRemove
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
    Left = 84
    Top = 378
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
    object blbRemove: TdxBarLargeButton
      Action = actRemove
      Category = 0
      Height = 44
      HotImageIndex = 21
      Width = 75
      SyncImageIndex = False
      ImageIndex = 21
    end
  end
  object GridDataSource: TDataSource
    Left = 322
    Top = 217
  end
end
