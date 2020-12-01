inherited fmMovementsInHealthDefaultsGrid: TfmMovementsInHealthDefaultsGrid
  Left = 394
  Top = 228
  Width = 639
  Height = 309
  Caption = 'Default Treatment Templates'
  OldCreateOrder = True
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 258
    Width = 631
  end
  object HealthDefaultsGrid: TcxGrid [1]
    Left = 0
    Top = 49
    Width = 631
    Height = 209
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    object HealthDefaultsGridDBTableView: TcxGridDBTableView
      OnDblClick = HealthDefaultsGridDBTableViewDblClick
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsmdDefaultVeterinary
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 35
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      object HealthDefaultsGridDBTableViewDrugID: TcxGridDBColumn
        Caption = 'Drug Name'
        DataBinding.FieldName = 'DrugID'
        RepositoryItem = HerdLookup.erMedicineLookup
        HeaderAlignmentVert = vaCenter
        SortIndex = 0
        SortOrder = soDescending
        Width = 160
      end
      object HealthDefaultsGridDBTableViewApplicRate: TcxGridDBColumn
        Caption = 'Applic. Rate'
        DataBinding.FieldName = 'ApplicRate'
        HeaderAlignmentVert = vaCenter
        Width = 78
      end
      object HealthDefaultsGridDBTableViewKgsApplicRate: TcxGridDBColumn
        Caption = 'Applic. Rate Per Kgs'
        DataBinding.FieldName = 'ApplicRatePerKgs'
        HeaderAlignmentVert = vaCenter
        Width = 121
      end
      object HealthDefaultsGridDBTableViewCrushTreatment: TcxGridDBColumn
        Caption = 'Crush Treatment'
        DataBinding.FieldName = 'CrushTreatment'
        HeaderAlignmentVert = vaCenter
        Width = 104
      end
      object HealthDefaultsGridDBTableViewDefaultDrugDescComment: TcxGridDBColumn
        Caption = 'Use Drug Name as Comment'
        DataBinding.FieldName = 'UseDrugNameForComment'
        PropertiesClassName = 'TcxCheckBoxProperties'
        HeaderAlignmentVert = vaCenter
        Width = 124
      end
    end
    object HealthDefaultsGridLevel: TcxGridLevel
      GridView = HealthDefaultsGridDBTableView
    end
  end
  inherited ActionList: TActionList
    Left = 422
    Top = 10
    object actAdd: TAction
      Caption = 'Add'
      ImageIndex = 9
      OnExecute = actAddExecute
    end
    object actRemove: TAction
      Caption = 'Remove'
      ImageIndex = 10
      OnExecute = actRemoveExecute
      OnUpdate = actRemoveUpdate
    end
    object actEdit: TAction
      Caption = 'Edit'
      ImageIndex = 12
      OnExecute = actEditExecute
      OnUpdate = actEditUpdate
    end
  end
  inherited BarManager: TdxBarManager
    Font.Charset = ANSI_CHARSET
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
            Item = dxBarLargeButton1
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
            Item = dxBarLargeButton3
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
    UseSystemFont = False
    Left = 452
    Top = 10
    DockControlHeights = (
      0
      0
      49
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actAdd
      Category = 0
      Height = 45
      Width = 65
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = actEdit
      Category = 0
      Height = 45
      Width = 65
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Action = actRemove
      Category = 0
      Height = 45
      Width = 65
    end
  end
  object dsmdDefaultVeterinary: TDataSource
    DataSet = DefaultHealthEvents
    Left = 392
    Top = 10
  end
  object DefaultHealthEvents: TTable
    AfterPost = DefaultHealthEventsAfterPost
    AfterDelete = DefaultHealthEventsAfterDelete
    OnNewRecord = DefaultHealthEventsNewRecord
    DatabaseName = 'Kingswd'
    TableName = 'DefaultHealthEvents'
    Left = 362
    Top = 10
    object DefaultHealthEventsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object DefaultHealthEventsDrugID: TIntegerField
      FieldName = 'DrugID'
    end
    object DefaultHealthEventsApplicRate: TFloatField
      FieldName = 'ApplicRate'
    end
    object DefaultHealthEventsApplicRatePerKgs: TFloatField
      FieldName = 'ApplicRatePerKgs'
    end
    object DefaultHealthEventsUseDrugNameForComment: TBooleanField
      FieldName = 'UseDrugNameForComment'
    end
    object DefaultHealthEventsCrushTreatment: TBooleanField
      FieldName = 'CrushTreatment'
    end
  end
end
