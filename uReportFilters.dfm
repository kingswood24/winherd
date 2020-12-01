inherited fmReportFilters: TfmReportFilters
  Left = 476
  Top = 193
  Cursor = crHandPoint
  VertScrollBar.Range = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Report Filters'
  ClientHeight = 435
  ClientWidth = 352
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 415
    Width = 352
  end
  object cxReportGrid: TcxGrid [1]
    Left = 0
    Top = 49
    Width = 352
    Height = 366
    Cursor = crHandPoint
    Align = alClient
    BorderStyle = cxcbsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = 7623229
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
    object cxReportGridView: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      FilterBox.CustomizeDialog = False
      OnFocusedRecordChanged = cxReportGridViewFocusedRecordChanged
      DataController.Options = [dcoAssignGroupingValues]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Filtering.MRUItemsList = False
      Filtering.ColumnMRUItemsList = False
      OptionsBehavior.PostponedSynchronization = False
      OptionsBehavior.AlwaysShowEditor = True
      OptionsBehavior.CopyCaptionsToClipboard = False
      OptionsBehavior.DragHighlighting = False
      OptionsBehavior.DragOpening = False
      OptionsBehavior.DragScrolling = False
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.ColumnHeaderHints = False
      OptionsBehavior.CopyPreviewToClipboard = False
      OptionsBehavior.ExpandMasterRowOnDblClick = False
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnHorzSizing = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsCustomize.DataRowSizing = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.FocusRect = False
      OptionsView.ScrollBars = ssVertical
      OptionsView.ShowEditButtons = gsebAlways
      OptionsView.DataRowHeight = 35
      OptionsView.ExpandButtonsForEmptyDetails = False
      OptionsView.GridLines = glNone
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      Styles.Background = WinData.ReportFilterStyle
      Styles.Content = WinData.ReportFilterStyle
      object cxReportGridViewReportName: TcxGridColumn
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 340
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Styles.Content = WinData.ReportFilterStyle
        Width = 340
      end
    end
    object cxReportGridLevel: TcxGridLevel
      GridView = cxReportGridView
    end
  end
  inherited ActionList: TActionList
    Left = 140
    Top = 5
  end
  inherited BarManager: TdxBarManager
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Main'
        Color = 16629124
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 579
        FloatTop = 231
        FloatClientWidth = 55
        FloatClientHeight = 78
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
            Visible = False
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
    Style = bmsEnhanced
    Left = 170
    Top = 5
    DockControlHeights = (
      0
      0
      49
      0)
    inherited bClose: TdxBarLargeButton
      AutoGrayScale = False
    end
    inherited bHelp: TdxBarLargeButton
      Visible = ivNever
      AutoGrayScale = False
    end
  end
end
