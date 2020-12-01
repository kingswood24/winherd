inherited fmSireAnalysis: TfmSireAnalysis
  Left = 402
  Top = 190
  Width = 1201
  Height = 616
  Caption = 'Sire Analysis'
  Font.Height = -13
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 17
  inherited StatusBar: TdxStatusBar
    Top = 565
    Width = 1193
  end
  object SireGrid: TcxGrid [1]
    Left = 0
    Top = 49
    Width = 320
    Height = 516
    Align = alLeft
    TabOrder = 5
    LookAndFeel.Kind = lfFlat
    object SireGridDBBandedTableView: TcxGridDBBandedTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = SireGridDBBandedTableViewFocusedRecordChanged
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.BandMoving = False
      OptionsCustomize.BandSizing = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 40
      Styles.BandHeader = BandStyle
      Bands = <
        item
          Caption = 'Sires'
          Width = 280
        end>
      object SireGridDBBandedTableViewSireNo: TcxGridDBBandedColumn
        Caption = 'Sire Code'
        DataBinding.FieldName = 'SireNo'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 74
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object SireGridDBBandedTableViewSortSireNo: TcxGridDBBandedColumn
        Caption = 'Sire No.'
        DataBinding.FieldName = 'SortSireNo'
        OnGetDisplayText = SireGridDBBandedTableViewSortSireNoGetDisplayText
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 110
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object SireGridDBBandedTableViewCalfCount: TcxGridDBBandedColumn
        Caption = 'Calf Count'
        DataBinding.FieldName = 'CalfCount'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 80
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object SireGridDBBandedTableViewAvgCalfWeighGain: TcxGridDBBandedColumn
        Caption = 'Progeny Gain Per Day'
        DataBinding.FieldName = 'AvgCalfWeighGain'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '0.00'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        SortIndex = 0
        SortOrder = soDescending
        Width = 106
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
    end
    object SireGridLevel: TcxGridLevel
      GridView = SireGridDBBandedTableView
    end
  end
  object CalfGrid: TcxGrid [2]
    Left = 320
    Top = 49
    Width = 873
    Height = 516
    Align = alClient
    TabOrder = 6
    LookAndFeel.Kind = lfFlat
    object CalfGridDBBandedTableView: TcxGridDBBandedTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Filter.OnChanged = CalfGridDBBandedTableViewDataControllerFilterChanged
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'CalfID'
          Column = CalfGridDBBandedTableViewSortCalfNo
        end
        item
          Format = '0.00'
          Kind = skAverage
          FieldName = 'AvgWeighGain'
          Column = CalfGridDBBandedTableViewAvgWeighGain
        end
        item
          Format = '0'
          Kind = skAverage
          OnGetText = GetColdDeadWtFooterText
          FieldName = 'ColdDeadWt'
          Column = CalfGridDBBandedTableViewColdDeadWt
        end
        item
          Format = '0.#'
          Kind = skAverage
          OnGetText = GetKillOutFooterText
          FieldName = 'KillOut'
          Column = CalfGridDBBandedTableViewKillOut
        end
        item
          Format = '0'
          Kind = skAverage
          OnGetText = GetSaleWeightFooterText
          FieldName = 'SaleWeight'
          Column = CalfGridDBBandedTableViewLiveWeight
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.BandMoving = False
      OptionsCustomize.BandSizing = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 40
      Styles.BandHeader = BandStyle
      Bands = <
        item
          Caption = 'Calves'
        end>
      object CalfGridDBBandedTableViewCalfNo: TcxGridDBBandedColumn
        Caption = 'Calf No.'
        DataBinding.FieldName = 'CalfNo'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Styles.Content = GridStyle
        Width = 100
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object CalfGridDBBandedTableViewSortCalfNo: TcxGridDBBandedColumn
        Caption = 'Calf No.'
        DataBinding.FieldName = 'SortCalfNo'
        PropertiesClassName = 'TcxTextEditProperties'
        OnGetDisplayText = CalfGridDBBandedTableViewSortCalfNoGetDisplayText
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Styles.Content = GridStyle
        Width = 80
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object CalfGridDBBandedTableViewCalfNatID: TcxGridDBBandedColumn
        Caption = 'National ID'
        DataBinding.FieldName = 'CalfNatID'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Styles.Content = GridStyle
        Width = 160
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object CalfGridDBBandedTableViewSortCalfNatID: TcxGridDBBandedColumn
        Caption = 'National ID'
        DataBinding.FieldName = 'SortCalfNatID'
        PropertiesClassName = 'TcxTextEditProperties'
        OnGetDisplayText = CalfGridDBBandedTableViewSortCalfNatIDGetDisplayText
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Styles.Content = GridStyle
        Width = 140
        Position.BandIndex = 0
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object CalfGridDBBandedTableViewDateOfBirth: TcxGridDBBandedColumn
        Caption = 'Date Of Birth'
        DataBinding.FieldName = 'DateOfBirth'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Styles.Content = GridStyle
        Width = 80
        Position.BandIndex = 0
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object CalfGridDBBandedTableViewSex: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Sex'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Styles.Content = GridStyle
        Width = 70
        Position.BandIndex = 0
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object CalfGridDBBandedTableViewBreed: TcxGridDBBandedColumn
        Caption = 'Breed'
        DataBinding.FieldName = 'BreedCode'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Styles.Content = GridStyle
        Width = 70
        Position.BandIndex = 0
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object CalfGridDBBandedTableViewADetailSep: TcxGridDBBandedColumn
        MinWidth = 4
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Styles.Content = SepStyle
        Styles.Header = SepStyle
        Width = 4
        Position.BandIndex = 0
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object CalfGridDBBandedTableViewSaleDate: TcxGridDBBandedColumn
        Caption = 'Sales Date'
        DataBinding.FieldName = 'SaleDate'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Width = 80
        Position.BandIndex = 0
        Position.ColIndex = 8
        Position.RowIndex = 0
      end
      object CalfGridDBBandedTableViewLiveWeight: TcxGridDBBandedColumn
        Caption = 'Live Weight'
        DataBinding.FieldName = 'SaleWeight'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '0'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Width = 50
        Position.BandIndex = 0
        Position.ColIndex = 9
        Position.RowIndex = 0
      end
      object CalfGridDBBandedTableViewColdDeadWt: TcxGridDBBandedColumn
        Caption = 'Dead Weight'
        DataBinding.FieldName = 'ColdDeadWt'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = '0'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Width = 50
        Position.BandIndex = 0
        Position.ColIndex = 10
        Position.RowIndex = 0
      end
      object CalfGridDBBandedTableViewKillOut: TcxGridDBBandedColumn
        Caption = 'Kill Out'
        DataBinding.FieldName = 'KillOut'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '0.#'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.Grouping = False
        Width = 50
        Position.BandIndex = 0
        Position.ColIndex = 11
        Position.RowIndex = 0
      end
      object CalfGridDBBandedTableViewGrade: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Grade'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.FilteringMRUItemsList = False
        Options.IncSearch = False
        Options.Grouping = False
        Width = 70
        Position.BandIndex = 0
        Position.ColIndex = 12
        Position.RowIndex = 0
      end
      object CalfGridDBBandedTableViewSaleInfoSep: TcxGridDBBandedColumn
        MinWidth = 4
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Styles.Content = SepStyle
        Styles.Header = SepStyle
        Width = 4
        Position.BandIndex = 0
        Position.ColIndex = 13
        Position.RowIndex = 0
      end
      object CalfGridDBBandedTableViewAvgWeighGain: TcxGridDBBandedColumn
        Caption = 'Weight Gain Per Day'
        DataBinding.FieldName = 'AvgWeighGain'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '0.00'
        HeaderAlignmentVert = vaCenter
        MinWidth = 86
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Width = 86
        Position.BandIndex = 0
        Position.ColIndex = 14
        Position.RowIndex = 0
      end
    end
    object CalfGridLevel: TcxGridLevel
      GridView = CalfGridDBBandedTableView
    end
  end
  object pFavourite: TPanel [3]
    Left = 153
    Top = 6
    Width = 176
    Height = 37
    BevelOuter = bvNone
    TabOrder = 7
    object cbFavourite: TcxCheckBox
      Left = 4
      Top = 6
      Caption = 'Add Report As Favourite'
      ParentFont = False
      Properties.OnChange = cbFavouritePropertiesChange
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      Width = 167
    end
  end
  inherited ActionList: TActionList
    Left = 916
    Top = 11
    object actPrintSireGrid: TAction
      Caption = 'Print Sire Grid'
      OnExecute = actPrintSireGridExecute
    end
    object actPrintCalfGrid: TAction
      Caption = 'Print Calf Grid'
      OnExecute = actPrintCalfGridExecute
    end
    object actPrint: TAction
      Caption = 'Print'
      ImageIndex = 33
      OnExecute = actPrintExecute
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
            Item = blbPrint
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarControlContainerItem1
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
    Left = 884
    Top = 11
    DockControlHeights = (
      0
      0
      49
      0)
    object blbPrint: TdxBarLargeButton
      Action = actPrint
      Category = 0
      Height = 45
      Width = 65
    end
    object blbPrintSireGrid: TdxBarLargeButton
      Action = actPrintSireGrid
      Category = 0
    end
    object blbPrintCalfGrid: TdxBarLargeButton
      Action = actPrintCalfGrid
      Category = 0
    end
    object dxBarControlContainerItem1: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = pFavourite
    end
  end
  object cpPrintGrid: TdxComponentPrinter
    CurrentLink = pglCalfGrid
    Version = 0
    Left = 948
    Top = 11
    object pglSireGrid: TdxGridReportLink
      Active = True
      Component = SireGrid
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'Sire Grid'
      ReportDocument.CreationDate = 43334.4770407176
      OptionsOnEveryPage.BandHeaders = False
      OptionsOnEveryPage.Footers = False
      OptionsView.Footers = False
      OptionsView.BandHeaders = False
      OptionsView.ExpandButtons = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      BuiltInReportLink = True
    end
    object pglCalfGrid: TdxGridReportLink
      Active = True
      Component = CalfGrid
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'Calves'
      ReportDocument.CreationDate = 43334.4770407176
      OptionsOnEveryPage.Footers = False
      OptionsView.ExpandButtons = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      BuiltInReportLink = True
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 980
    Top = 10
    object BandStyle: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clMenu
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object GridStyle: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
    end
    object SepStyle: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
    end
  end
  object pmPrintGrid: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Item = blbPrintSireGrid
        Visible = True
      end
      item
        Item = blbPrintCalfGrid
        Visible = True
      end>
    UseOwnFont = False
    Left = 1010
    Top = 10
  end
end
