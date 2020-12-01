inherited fmVetLinkSelect: TfmVetLinkSelect
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'Vet Link Drug Select'
  ClientHeight = 432
  ClientWidth = 935
  Font.Height = -13
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 17
  inherited StatusBar: TdxStatusBar
    Top = 412
    Width = 935
  end
  object pInfo: TPanel [1]
    Left = 0
    Top = 49
    Width = 935
    Height = 59
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    object lInfo: TcxLabel
      Left = 0
      Top = 0
      Align = alClient
      Caption = 
        'Please select the drug(s) below that you wish to use to treat/do' +
        'se animals.'#13#10'Once you have selected the drug(s) then click Close' +
        ' to then select the date and animals for this treatment/dose.'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
    end
  end
  object VetLinkGrid: TcxGrid [2]
    Left = 0
    Top = 108
    Width = 935
    Height = 304
    Align = alClient
    TabOrder = 6
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    object VetLinkDBTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object VetLinkDBTableViewSelected: TcxGridDBColumn
        DataBinding.FieldName = 'Selected'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Options.Filtering = False
        Width = 24
        IsCaptionAssigned = True
      end
      object VetLinkDBTableViewDate: TcxGridDBColumn
        Caption = 'Date'
        DataBinding.FieldName = 'PurchDate'
        Options.Editing = False
        SortIndex = 0
        SortOrder = soAscending
      end
      object VetLinkDBTableViewDrugName: TcxGridDBColumn
        Caption = 'Drug Name'
        DataBinding.FieldName = 'DrugDesc'
        HeaderGlyphAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 160
      end
      object VetLinkDBTableViewDrugQuantity: TcxGridDBColumn
        Caption = 'Qty'
        DataBinding.FieldName = 'DrugQuantity'
        Options.Editing = False
        Width = 60
      end
      object VetLinkDBTableViewWithdrawal: TcxGridDBColumn
        Caption = 'Withdrawal'
        DataBinding.FieldName = 'WithdrawalStr'
        Options.Editing = False
        Options.Filtering = False
        Width = 140
      end
      object VetLinkDBTableViewTagDesc: TcxGridDBColumn
        Caption = 'Animal Nos.'
        DataBinding.FieldName = 'TagDesc'
        HeaderGlyphAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 140
      end
      object VetLinkDBTableViewPurchDoseRate: TcxGridDBColumn
        Caption = 'Dose Rate'
        DataBinding.FieldName = 'PurchDoseRate'
        Options.Editing = False
        Options.Filtering = False
        Width = 120
      end
      object VetLinkDBTableViewNoDays: TcxGridDBColumn
        Caption = 'No. Days'
        DataBinding.FieldName = 'NoDays'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.AssignedValues.DisplayFormat = True
        Properties.DecimalPlaces = 0
        Visible = False
        Options.Editing = False
        Options.Filtering = False
        Width = 66
      end
      object VetLinkDBTableViewNoTimes: TcxGridDBColumn
        Caption = 'Times/Day'
        DataBinding.FieldName = 'NoTimes'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.AssignedValues.DisplayFormat = True
        Properties.DecimalPlaces = 0
        Visible = False
        Options.Editing = False
        Options.Filtering = False
        Width = 66
      end
      object VetLinkDBTableViewBatchNo: TcxGridDBColumn
        Caption = 'Batch No.'
        DataBinding.FieldName = 'BatchNo'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        HeaderGlyphAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 100
      end
      object VetLinkDBTableViewExpiryDate: TcxGridDBColumn
        Caption = 'Expiry'
        DataBinding.FieldName = 'ExpiryDate'
        HeaderGlyphAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 70
      end
    end
    object VetLinkLevel: TcxGridLevel
      GridView = VetLinkDBTableView
    end
  end
  inherited ActionList: TActionList
    Left = 468
    Top = 8
    object actDelete: TAction
      Caption = 'Delete'
      ImageIndex = 21
      OnExecute = actDeleteExecute
    end
    object actPrintGrid: TAction
      Caption = 'Print'
      ImageIndex = 33
      OnExecute = actPrintGridExecute
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
            Item = blbDelete
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
    Left = 498
    Top = 8
    DockControlHeights = (
      0
      0
      49
      0)
    object blbDelete: TdxBarLargeButton
      Action = actDelete
      Category = 0
      Height = 45
      Width = 65
    end
    object blbPrintGrid: TdxBarLargeButton
      Action = actPrintGrid
      Category = 0
      Height = 45
      Width = 65
    end
  end
  object cpPrintGrid: TdxComponentPrinter
    CurrentLink = PrintGridLink
    Version = 0
    Left = 528
    Top = 8
    object PrintGridLink: TdxGridReportLink
      Active = True
      Component = VetLinkGrid
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
      ReportDocument.CreationDate = 43111.6220382292
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
