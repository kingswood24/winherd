inherited fmEditAnimalsByGrid: TfmEditAnimalsByGrid
  Left = 454
  Top = 310
  Width = 634
  Caption = 'Edit Animals'
  Font.Height = -13
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 17
  inherited StatusBar: TdxStatusBar
    Width = 626
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
  end
  object AnimalGrid: TcxGrid [1]
    Left = 0
    Top = 49
    Width = 626
    Height = 284
    Align = alClient
    TabOrder = 5
    LookAndFeel.Kind = lfFlat
    object AnimalGridDBTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      object AnimalGridDBTableViewSortNatID: TcxGridDBColumn
        Caption = 'Nat ID No.'
        DataBinding.FieldName = 'SortNatID'
        OnGetDisplayText = AnimalGridDBTableViewSortNatIDGetDisplayText
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Grouping = False
        Width = 160
      end
      object AnimalGridDBTableViewSortAnimalNo: TcxGridDBColumn
        Caption = 'Animal No.'
        DataBinding.FieldName = 'SortAnimalNo'
        Visible = False
        OnGetDisplayText = AnimalGridDBTableViewSortAnimalNoGetDisplayText
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Grouping = False
        Width = 100
      end
      object AnimalGridDBTableViewAnimalNo: TcxGridDBColumn
        Caption = 'Animal No.'
        DataBinding.FieldName = 'AnimalNo'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Grouping = False
        Width = 100
      end
      object AnimalGridDBTableViewTransponderNo: TcxGridDBColumn
        Caption = 'Transponder'
        DataBinding.FieldName = 'TransponderNo'
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Grouping = False
        Width = 120
      end
      object AnimalGridDBTableViewDateOfBirth: TcxGridDBColumn
        Caption = 'Date Of Birth'
        DataBinding.FieldName = 'DateOfBirth'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Grouping = False
        Width = 90
      end
      object AnimalGridDBTableViewSex: TcxGridDBColumn
        DataBinding.FieldName = 'Sex'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Grouping = False
      end
      object AnimalGridDBTableViewBreed: TcxGridDBColumn
        DataBinding.FieldName = 'Breed'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Grouping = False
      end
      object AnimalGridDBTableViewNatID: TcxGridDBColumn
        Caption = 'Nat ID No.'
        DataBinding.FieldName = 'NatIDNum'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Grouping = False
        Width = 160
      end
    end
    object AnimalGridLevel: TcxGridLevel
      GridView = AnimalGridDBTableView
    end
  end
  inherited ActionList: TActionList
    Left = 584
    object actSave: TAction
      Caption = 'Save'
      ImageIndex = 8
      OnExecute = actSaveExecute
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
        UseOwnFont = False
        Visible = True
        WholeRow = True
        BackgroundBitmap.Data = {00000000}
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 552
    DockControlHeights = (
      0
      0
      49
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actSave
      Category = 0
      Height = 45
      Width = 65
    end
  end
end
