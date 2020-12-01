inherited fmRedTractorDrugCollation: TfmRedTractorDrugCollation
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'Annual Drug Collation'
  ClientHeight = 416
  ClientWidth = 682
  Font.Height = -13
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 17
  inherited StatusBar: TdxStatusBar
    Top = 396
    Width = 682
  end
  object DrugCollationGrid: TcxGrid [1]
    Left = 0
    Top = 117
    Width = 682
    Height = 279
    Align = alClient
    TabOrder = 5
    LookAndFeel.Kind = lfFlat
    object DrugCollationGridDBTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      OptionsView.Indicator = True
      object DrugCollationGridDBTableViewDrugName: TcxGridDBColumn
        Caption = 'Product Name '
        DataBinding.FieldName = 'DrugName'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 400
      end
      object DrugCollationGridDBTableViewQuantity: TcxGridDBColumn
        Caption = 'Total quantity used '
        DataBinding.FieldName = 'Quantity'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 150
      end
    end
    object DrugCollationGridLevel: TcxGridLevel
      GridView = DrugCollationGridDBTableView
    end
  end
  object gbFilterBy: TcxGroupBox [2]
    Left = 0
    Top = 49
    Align = alTop
    Caption = 'Filter By:'
    Style.BorderStyle = ebsFlat
    TabOrder = 6
    Height = 68
    Width = 682
    object lDateFrom: TcxLabel
      Left = 8
      Top = 28
      Caption = 'Date From:'
    end
    object lDateTo: TcxLabel
      Left = 205
      Top = 28
      Caption = 'Date To:'
    end
    object deDateFrom: TcxDateEdit
      Left = 81
      Top = 28
      Properties.ReadOnly = False
      Style.BorderStyle = ebsFlat
      TabOrder = 2
      Width = 120
    end
    object deDateTo: TcxDateEdit
      Left = 262
      Top = 28
      Style.BorderStyle = ebsFlat
      TabOrder = 3
      Width = 120
    end
    object lDrugType: TcxLabel
      Left = 386
      Top = 28
      Caption = 'Drug Type:'
    end
    object lcmboDrugType: TcxLookupComboBox
      Left = 459
      Top = 28
      RepositoryItem = HerdLookup.erMedicineGroupLookup
      Properties.ListColumns = <>
      Style.BorderStyle = ebsFlat
      TabOrder = 5
      Width = 120
    end
    object btnApply: TcxButton
      Left = 590
      Top = 27
      Width = 75
      Height = 25
      Action = actApplyFilter
      TabOrder = 6
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0041879B00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF001D6E850041879B00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF001D6E850091C3D20041879B00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF001D6E850091C3D2001D6E8500FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF001D6E850091C3D2001D6E8500FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF001D6E850091C3D20041879B001D6E
        8500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF001D6E850091C3D2005799AC00468DA1003A85
        99001D6E8500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF001D6E850091C3D20061A0B2005497AA00468DA1003A85
        99002A778C001D6E8500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF001D6E850091C3D20076AFC0005998AB003F8194003A8094003A85
        99002C7B9000217389001D6E8500FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF001D6E850097C7D50075ABBA003B77890047869C006FB1CD00117B9C002266
        79001E6376001E6B81001E6E84001D6E8500FF00FF00FF00FF00FF00FF00FF00
        FF001F6D83002673890046A5BC00A4FFFF0045D0FD008AD7FD0045A8E3000022
        AC001725AC00397092002B6E8200185C7000FF00FF00FF00FF00FF00FF00FF00
        FF006BA7B9002673890032A5CD00A4EBFB008AF5FD0045C5F6000022BF000000
        BE000000CC001725AC005D8E9C006BA7B900FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00AA521000586957004077870067C5F6001E4DD200191ECA000000
        D9000000DE000000C5008D8DD300FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00C0733100AC410000B74C00007E604C00412E99007084E800191E
        CA000000CF007171CF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0074474700DCA37200ECA54400AF6810009F7153003838C4003838
        C4008D8DDD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00B99E980097655400CBBABA00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      LookAndFeel.Kind = lfOffice11
    end
  end
  inherited ActionList: TActionList
    Left = 422
    object actPrint: TAction
      Caption = 'Print'
      ImageIndex = 33
      OnExecute = actPrintExecute
    end
    object actApplyFilter: TAction
      Caption = 'Apply'
      ImageIndex = 34
      OnExecute = actApplyFilterExecute
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
    Left = 392
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
  object PrintGrid: TdxComponentPrinter
    CurrentLink = PrintGridLink
    Version = 0
    Left = 362
    Top = 9
    object PrintGridLink: TdxGridReportLink
      Active = True
      Component = DrugCollationGrid
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
      ReportDocument.CreationDate = 43048.5992022801
      OptionsOnEveryPage.FilterBar = False
      OptionsView.ExpandButtons = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      BuiltInReportLink = True
    end
  end
end
