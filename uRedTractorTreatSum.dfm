inherited fmRedTractorHealthCodeSummary: TfmRedTractorHealthCodeSummary
  Left = 655
  Top = 278
  Width = 555
  Height = 447
  Caption = 'Disease Summary'
  Font.Height = -13
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 17
  inherited StatusBar: TdxStatusBar
    Top = 396
    Width = 547
  end
  object HealthCodeGrid: TcxGrid [1]
    Left = 0
    Top = 154
    Width = 547
    Height = 242
    Align = alClient
    TabOrder = 5
    LookAndFeel.Kind = lfFlat
    object HealthCodeGridDBTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsView.GroupByBox = False
      object HealthCodeGridDBTableViewReason: TcxGridDBColumn
        Caption = 'Reason'
        SortIndex = 0
        SortOrder = soAscending
        Width = 300
      end
      object HealthCodeGridDBTableViewNoTreats: TcxGridDBColumn
        Caption = 'No. Treatments'
        Width = 130
      end
    end
    object HealthCodeGridLevel: TcxGridLevel
      GridView = HealthCodeGridDBTableView
    end
  end
  object InfoPanel: TPanel [2]
    Left = 0
    Top = 49
    Width = 547
    Height = 105
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 6
    object lInfo: TcxLabel
      Left = 0
      Top = 0
      Align = alTop
      AutoSize = False
      Caption = 
        'Below are the number of health incidents by disease type within ' +
        'the following date range :'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Height = 55
      Width = 547
    end
    object btnApply: TcxButton
      Left = 406
      Top = 60
      Width = 75
      Height = 25
      Action = actApply
      TabOrder = 1
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF002B934800FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF002B93480031A648002B934800FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00399B610031A6480031A6480031A648002B934800FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF002B93480031A6480037B7550033A1580031A648002B934800FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF003F94
        660031A6480037B755002F8D58002F8D580037B7550043A1460037B75500FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF002B93
        480037B755002F8D5800FF00FF00FF00FF002F8D580037B755002B934800FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF002F8D5800FF00FF00FF00FF00FF00FF00FF00FF002F8D580037B755002B93
        4800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF002F8D580037B7
        550037B75500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF002F8D
        580031A64800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF002F8D580031A64800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF002F8D580031A64800FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF002F8D580031A64800FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF002F8D580031A64800FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF002F8D5800FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      LookAndFeel.Kind = lfOffice11
    end
    object DateFrom: TcxDateEdit
      Left = 98
      Top = 61
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 2
      Width = 121
    end
    object DateTo: TcxDateEdit
      Left = 277
      Top = 61
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 3
      Width = 121
    end
    object lDateFrom: TcxLabel
      Left = 51
      Top = 62
      AutoSize = False
      Caption = 'From:'
      Style.TextStyle = [fsBold]
      Height = 21
      Width = 44
    end
    object lDateTo: TcxLabel
      Left = 248
      Top = 63
      Caption = 'To:'
      Style.TextStyle = [fsBold]
    end
  end
  inherited ActionList: TActionList
    Left = 372
    Top = 10
    object actPrint: TAction
      Caption = 'Print'
      ImageIndex = 33
      OnExecute = actPrintExecute
    end
    object actApply: TAction
      Caption = 'Apply'
      ImageIndex = 8
      OnExecute = actApplyExecute
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
    Left = 402
    Top = 10
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
  object dxComponentPrinter: TdxComponentPrinter
    CurrentLink = dxComponentPrinterLink
    PrintTitle = 'Kingswood Grid Print'
    Version = 0
    Left = 342
    Top = 10
    object dxComponentPrinterLink: TdxGridReportLink
      Active = True
      Component = HealthCodeGrid
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
      ReportDocument.CreationDate = 42277.6599542014
      OptionsOnEveryPage.Footers = False
      OptionsOnEveryPage.FilterBar = False
      OptionsView.Footers = False
      OptionsView.ExpandButtons = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      BuiltInReportLink = True
    end
  end
end
