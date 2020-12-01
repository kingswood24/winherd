inherited fmMedBatchNoTreatments: TfmMedBatchNoTreatments
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'Batch No. Treatments'
  ClientHeight = 424
  ClientWidth = 1014
  Font.Height = -13
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 17
  inherited StatusBar: TdxStatusBar
    Top = 404
    Width = 1014
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = 'Totals'
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = 'Calculated Totals'
        Width = 400
      end>
  end
  object pMedBatchInfo: TPanel [1]
    Left = 0
    Top = 49
    Width = 1014
    Height = 64
    Align = alTop
    BevelOuter = bvNone
    Color = clInfoBk
    TabOrder = 5
    object lBatchNo: TcxLabel
      Left = 22
      Top = 8
      Caption = 'Batch No:'
      Style.TextColor = clNavy
      Style.TextStyle = [fsBold]
    end
    object lBatchNoInfo: TcxLabel
      Left = 132
      Top = 8
      Caption = 'lBatchNoInfo'
      Style.TextColor = clNavy
    end
    object lDrugName: TcxLabel
      Left = 22
      Top = 32
      Caption = 'Medicine Name:'
      Style.TextColor = clNavy
      Style.TextStyle = [fsBold]
    end
    object lDrugNameInfo: TcxLabel
      Left = 132
      Top = 32
      Caption = 'lDrugNameInfo'
      Style.TextColor = clNavy
    end
  end
  object MedBatchGrid: TcxGrid [2]
    Left = 0
    Top = 113
    Width = 1014
    Height = 291
    Align = alClient
    TabOrder = 6
    LookAndFeel.Kind = lfFlat
    object MedBatchGridDBTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      object MedBatchGridDBTableViewEventDate: TcxGridDBColumn
        Caption = 'Treatment Date'
        DataBinding.FieldName = 'EventDate'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 104
      end
      object MedBatchGridDBTableViewNatIDNum: TcxGridDBColumn
        Caption = 'Nat ID No'
        DataBinding.FieldName = 'NatIDNum'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 140
      end
      object MedBatchGridDBTableViewDateOfBirth: TcxGridDBColumn
        Caption = 'Date Of Birth'
        DataBinding.FieldName = 'DateOfBirth'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 104
      end
      object MedBatchGridDBTableViewSex: TcxGridDBColumn
        DataBinding.FieldName = 'Sex'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 70
      end
      object MedBatchGridDBTableViewBreed: TcxGridDBColumn
        DataBinding.FieldName = 'Breed'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
      end
      object MedBatchGridDBTableViewApplicRate: TcxGridDBColumn
        Caption = 'Applic. Rate'
        DataBinding.FieldName = 'RateApplic'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 82
      end
      object MedBatchGridDBTableViewNoDays: TcxGridDBColumn
        Caption = 'No. Days'
        DataBinding.FieldName = 'NoDays'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 74
      end
      object MedBatchGridDBTableViewNoTimes: TcxGridDBColumn
        Caption = 'No. Times'
        DataBinding.FieldName = 'NoTimes'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 74
      end
      object MedBatchGridDBTableViewAdminBy: TcxGridDBColumn
        Caption = 'Admin By'
        DataBinding.FieldName = 'AdminBy'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 140
      end
      object MedBatchGridDBTableViewPrescBy: TcxGridDBColumn
        Caption = 'Prescribed By'
        DataBinding.FieldName = 'PrescBy'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 140
      end
    end
    object MedBatchGridLevel: TcxGridLevel
      GridView = MedBatchGridDBTableView
    end
  end
  inherited ActionList: TActionList
    Left = 594
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
            Item = blbPrintGrid
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
    Left = 562
    DockControlHeights = (
      0
      0
      49
      0)
    object blbPrintGrid: TdxBarLargeButton
      Action = actPrint
      Category = 0
      Height = 45
      Width = 65
    end
  end
  object cpPrintGrid: TdxComponentPrinter
    CurrentLink = cpPrintGridLink
    Version = 0
    Left = 530
    Top = 9
    object cpPrintGridLink: TdxGridReportLink
      Active = True
      Component = MedBatchGrid
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.CreationDate = 44060.6938448958
      OptionsFormatting.LookAndFeelKind = lfFlat
      OptionsOnEveryPage.Footers = False
      OptionsOnEveryPage.Caption = False
      OptionsOnEveryPage.FilterBar = False
      OptionsView.Footers = False
      OptionsView.Caption = False
      OptionsView.ExpandButtons = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      BuiltInReportLink = True
    end
  end
end
