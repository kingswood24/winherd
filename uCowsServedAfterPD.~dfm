inherited fmCowsServedAfterPD: TfmCowsServedAfterPD
  Left = 722
  Top = 297
  Width = 524
  Height = 406
  Caption = 'Cows Served After Positive PD'
  Font.Height = -12
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited StatusBar: TdxStatusBar
    Top = 355
    Width = 516
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
  end
  object AnimalGrid: TcxGrid [1]
    Left = 0
    Top = 90
    Width = 516
    Height = 265
    Align = alClient
    TabOrder = 5
    LookAndFeel.Kind = lfFlat
    object AnimalGridDBTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
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
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.GroupByBox = False
      object AnimalGridDBTableViewAnimalNo: TcxGridDBColumn
        Caption = 'Animal No'
        DataBinding.FieldName = 'AnimalNo'
        Width = 90
      end
      object AnimalGridDBTableViewNatIDNum: TcxGridDBColumn
        DataBinding.FieldName = 'NatIDNum'
        Width = 150
      end
      object AnimalGridDBTableViewPregDiagDate: TcxGridDBColumn
        Caption = 'PD Date'
        DataBinding.FieldName = 'PDDate'
        Width = 90
      end
      object AnimalGridDBTableViewServiceDate: TcxGridDBColumn
        Caption = 'Service Date'
        DataBinding.FieldName = 'ServiceDate'
        Width = 90
      end
    end
    object AnimalGridLevel: TcxGridLevel
      GridView = AnimalGridDBTableView
    end
  end
  object pInfo: TPanel [2]
    Left = 0
    Top = 49
    Width = 516
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 6
    object lInfo: TcxLabel
      Left = 0
      Top = 0
      Align = alClient
      Caption = 
        'Cows listed below have been found with service events after a po' +
        'sitive PD.'#13#10'The PD results have been changed to negative.'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
    end
  end
  inherited ActionList: TActionList
    Left = 427
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
    Left = 397
    DockControlHeights = (
      0
      0
      49
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actPrint
      Category = 0
      Height = 45
      Width = 65
    end
  end
  object AnimalGridPrint: TdxComponentPrinter
    CurrentLink = AnimalGridPrintLink
    PrintTitle = 'Kingswood Grid Print'
    Version = 0
    Left = 368
    Top = 9
    object AnimalGridPrintLink: TdxGridReportLink
      Active = True
      Component = AnimalGrid
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.CreationDate = 43622.5133223958
      OptionsOnEveryPage.FilterBar = False
      OptionsView.ExpandButtons = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      BuiltInReportLink = True
    end
  end
end
