inherited fmConformationGradeAnalysis: TfmConformationGradeAnalysis
  Left = 324
  Top = 159
  VertScrollBar.Range = 0
  BorderStyle = bsSingle
  Caption = 'Conformation Grade Percentage Analysis'
  ClientHeight = 567
  ClientWidth = 714
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 547
    Width = 714
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
  end
  object gbDateFilter: TGroupBox [1]
    Left = 22
    Top = 75
    Width = 674
    Height = 59
    Caption = 'Date Filter'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object DateFrom: TcxDateEdit
      Left = 178
      Top = 21
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Width = 121
    end
    object DateTo: TcxDateEdit
      Left = 403
      Top = 21
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Width = 121
    end
    object lDateFrom: TcxLabel
      Left = 103
      Top = 21
      Caption = 'Date From:'
    end
    object lDateTo: TcxLabel
      Left = 370
      Top = 21
      Caption = 'To:'
    end
  end
  object ProgressBar: TProgressBar [2]
    Left = 24
    Top = 472
    Width = 532
    Height = 16
    Constraints.MaxHeight = 18
    Min = 0
    Max = 100
    Smooth = True
    TabOrder = 7
  end
  object cbFavourite: TcxCheckBox [3]
    Left = 22
    Top = 51
    AutoSize = False
    Caption = 'Add Report As Favourite'
    Properties.OnChange = cbFavouritePropertiesChange
    TabOrder = 8
    Height = 23
    Width = 213
  end
  object cbFilter: TcxCheckBox [4]
    Left = 548
    Top = 51
    AutoSize = False
    Caption = 'Apply Animal Grid Filter'
    Properties.OnChange = cbFavouritePropertiesChange
    TabOrder = 9
    Height = 23
    Width = 149
  end
  object SaleGradeGrid: TcxGrid [5]
    Left = 22
    Top = 138
    Width = 673
    Height = 351
    TabOrder = 6
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    object SaleGradeGridDBTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          OnGetText = SaleGradeGridDBTableViewTcxGridDBDataFooterSummaryGetText
          FieldName = 'UP'
          Column = SaleGradeGridDBTableViewUP
        end
        item
          Kind = skSum
          OnGetText = SaleGradeGridDBTableViewTcxGridDBDataFooterSummaryGetText
          FieldName = 'UE'
          Column = SaleGradeGridDBTableViewUE
        end
        item
          Kind = skSum
          OnGetText = SaleGradeGridDBTableViewTcxGridDBDataFooterSummaryGetText
          FieldName = 'UM'
          Column = SaleGradeGridDBTableViewUM
        end
        item
          Kind = skSum
          OnGetText = SaleGradeGridDBTableViewTcxGridDBDataFooterSummaryGetText
          FieldName = 'RP'
          Column = SaleGradeGridDBTableViewRP
        end
        item
          Kind = skSum
          OnGetText = SaleGradeGridDBTableViewTcxGridDBDataFooterSummaryGetText
          FieldName = 'RE'
          Column = SaleGradeGridDBTableViewRE
        end
        item
          Kind = skSum
          OnGetText = SaleGradeGridDBTableViewTcxGridDBDataFooterSummaryGetText
          FieldName = 'RM'
          Column = SaleGradeGridDBTableViewRM
        end
        item
          Kind = skSum
          OnGetText = SaleGradeGridDBTableViewTcxGridDBDataFooterSummaryGetText
          FieldName = 'OP'
          Column = SaleGradeGridDBTableViewOP
        end
        item
          Kind = skSum
          OnGetText = SaleGradeGridDBTableViewTcxGridDBDataFooterSummaryGetText
          FieldName = 'OE'
          Column = SaleGradeGridDBTableViewOE
        end
        item
          Kind = skSum
          OnGetText = SaleGradeGridDBTableViewTcxGridDBDataFooterSummaryGetText
          FieldName = 'OM'
          Column = SaleGradeGridDBTableViewOM
        end
        item
          Kind = skSum
          OnGetText = SaleGradeGridDBTableViewTcxGridDBDataFooterSummaryGetText
          FieldName = 'PP'
          Column = SaleGradeGridDBTableViewPP
        end
        item
          Kind = skSum
          OnGetText = SaleGradeGridDBTableViewTcxGridDBDataFooterSummaryGetText
          FieldName = 'EE'
          Column = SaleGradeGridDBTableViewEE
        end
        item
          Kind = skSum
          OnGetText = SaleGradeGridDBTableViewTcxGridDBDataFooterSummaryGetText
          FieldName = 'EM'
          Column = SaleGradeGridDBTableViewEM
        end
        item
          Kind = skSum
          OnGetText = SaleGradeGridDBTableViewTcxGridDBDataFooterSummaryGetText
          FieldName = 'EP'
          Column = SaleGradeGridDBTableViewEP
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.DataRowHeight = 21
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 28
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      object SaleGradeGridDBTableViewBreedCode: TcxGridDBColumn
        Caption = 'Breed'
        DataBinding.FieldName = 'BreedCode'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Filtering = False
        Width = 53
      end
      object SaleGradeGridDBTableViewEP: TcxGridDBColumn
        Caption = 'E+'
        DataBinding.FieldName = 'EP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#.##'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 45
      end
      object SaleGradeGridDBTableViewEE: TcxGridDBColumn
        Caption = 'E='
        DataBinding.FieldName = 'EE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#.##'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 45
      end
      object SaleGradeGridDBTableViewEM: TcxGridDBColumn
        Caption = 'E-'
        DataBinding.FieldName = 'EM'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#.##'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 45
      end
      object SaleGradeGridDBTableViewUP: TcxGridDBColumn
        Caption = 'U+'
        DataBinding.FieldName = 'UP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#.##'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Filtering = False
        Styles.Header = cxStyle1
        Width = 45
      end
      object SaleGradeGridDBTableViewUE: TcxGridDBColumn
        Caption = 'U='
        DataBinding.FieldName = 'UE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#.##'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Filtering = False
        Styles.Header = cxStyle1
        Width = 45
      end
      object SaleGradeGridDBTableViewUM: TcxGridDBColumn
        Caption = 'U-'
        DataBinding.FieldName = 'UM'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#.##'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Filtering = False
        Styles.Header = cxStyle1
        Width = 45
      end
      object SaleGradeGridDBTableViewRP: TcxGridDBColumn
        Caption = 'R+'
        DataBinding.FieldName = 'RP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#.##'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Filtering = False
        Styles.Header = cxStyle1
        Width = 45
      end
      object SaleGradeGridDBTableViewRE: TcxGridDBColumn
        Caption = 'R='
        DataBinding.FieldName = 'RE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#.##'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Filtering = False
        Styles.Header = cxStyle1
        Width = 45
      end
      object SaleGradeGridDBTableViewRM: TcxGridDBColumn
        Caption = 'R-'
        DataBinding.FieldName = 'RM'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#.##'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Filtering = False
        Styles.Header = cxStyle1
        Width = 45
      end
      object SaleGradeGridDBTableViewOP: TcxGridDBColumn
        Caption = 'O+'
        DataBinding.FieldName = 'OP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#.##'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Filtering = False
        Styles.Header = cxStyle1
        Width = 45
      end
      object SaleGradeGridDBTableViewOE: TcxGridDBColumn
        Caption = 'O='
        DataBinding.FieldName = 'OE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#.##'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Filtering = False
        Styles.Header = cxStyle1
        Width = 45
      end
      object SaleGradeGridDBTableViewOM: TcxGridDBColumn
        Caption = 'O-'
        DataBinding.FieldName = 'OM'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#.##'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Filtering = False
        Styles.Header = cxStyle1
        Width = 45
      end
      object SaleGradeGridDBTableViewPP: TcxGridDBColumn
        Caption = 'P+'
        DataBinding.FieldName = 'PP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = '#.##'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Filtering = False
        Styles.Header = cxStyle1
        Width = 45
      end
    end
    object SaleGradeGridLevel: TcxGridLevel
      GridView = SaleGradeGridDBTableView
    end
  end
  object pInfo: TPanel [6]
    Left = 22
    Top = 497
    Width = 577
    Height = 41
    BevelOuter = bvNone
    TabOrder = 10
    object lInfoMain: TcxLabel
      Left = 0
      Top = 0
      Align = alClient
      Caption = 
        'There were a total of               sales in the selected period' +
        '. Of these,                sales had blank or invalid grades.'#13#10'T' +
        'he analysis is based on               sales with valid grades.'
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object lInfoTotal: TcxLabel
      Left = 113
      Top = 4
      AutoSize = False
      Caption = 'Total'
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      Height = 17
      Width = 41
    end
    object lInfoInvalid: TcxLabel
      Left = 354
      Top = 4
      AutoSize = False
      Caption = 'Invalid'
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      Height = 17
      Width = 43
    end
    object lInfoValid: TcxLabel
      Left = 271
      Top = 19
      AutoSize = False
      Caption = 'Valid'
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      Height = 17
      Width = 41
    end
  end
  object btnInvalidGrades: TcxButton [7]
    Left = 607
    Top = 496
    Width = 89
    Height = 43
    Action = actInvalidGrades
    Caption = 'Invalid '#13#10'Grades'
    TabOrder = 11
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00AEAEAE00999C9E00999C9E00999C9E00999C9E00999C9E00999C9E00999C
      9E00999C9E00999C9E00999C9E00999C9E00999C9E00FF00FF00FF00FF00FF00
      FF00AEAEAE00F7F7F700F4F4F400F2F2F200EFEFEF00EDEDED00EAEAEA00E8E8
      E800E2E2E200DDDDDD00D7D7D700D2D2D2009C9FA100FF00FF00FF00FF00FF00
      FF00AEAEAE00F9F9F900F7F7F700F4F4F400F2F2F200EFEFEF00EDEDED00EAEA
      EA00E8E8E8009B9B9B009B9B9B00D7D7D7009C9FA100FF00FF00FF00FF00FF00
      FF00AEAEAE00FCFCFC00F9F9F900F7F7F700F4F4F400F2F2F200EFEFEF00EDED
      ED00EAEAEA00E8E8E800E2E2E200DDDDDD009C9FA100FF00FF00FF00FF00FF00
      FF00AEAEAE00FEFEFE009B9B9B009B9B9B00F7F7F7009B9B9B009B9B9B009B9B
      9B00EDEDED009B9B9B009B9B9B00E2E2E2009C9FA100FF00FF00FF00FF00FF00
      FF00AEAEAE00FFFFFF00FEFEFE00FCFCFC00F9F9F900F7F7F700F4F4F400F2F2
      F200EFEFEF00EDEDED00EAEAEA00E8E8E8009C9FA100FF00FF00FF00FF00FF00
      FF00AEAEAE00FFFFFF009B9B9B009B9B9B00FCFCFC009B9B9B009B9B9B009B9B
      9B00F2F2F2009B9B9B009B9B9B00EAEAEA009C9FA100FF00FF00FF00FF00FF00
      FF00AEAEAE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FAFAFA00F8F8
      F800F5F5F500F3F3F300F0F0F000EDEDED009C9FA100FF00FF00FF00FF00FF00
      FF00AEAEAE00FFFFFF009B9B9B009B9B9B00FFFFFF009B9B9B009B9B9B009B9B
      9B00F8F8F8009B9B9B009B9B9B00F0F0F0009C9FA100FF00FF00FF00FF00FF00
      FF00AEAEAE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFD
      FD00FAFAFA00F8F8F800F5F5F500EAEAEA009C9FA100FF00FF00FF00FF00FF00
      FF00AEAEAE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFDFD00EAEAEA00E2E2E200DDDDDD009C9FA100FF00FF00FF00FF00FF00
      FF00AEAEAE00FFFFFF009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
      9B00FFFFFF00A8A9AA009C9FA1009C9FA1009C9FA100FF00FF00FF00FF00FF00
      FF00AEAEAE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A8A9AA00FFFFFF00E6E6E6009C9FA100FF00FF00FF00FF00FF00
      FF00AEAEAE00FFFFFF009B9B9B009B9B9B009B9B9B00FFFFFF009B9B9B009B9B
      9B00FFFFFF00A8A9AA00E6E6E6009B9D9D00FF00FF00FF00FF00FF00FF00FF00
      FF00AEAEAE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00A8A9AA009B9D9D00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00AEAEAE009B9B9C009B9B9C009B9B9C009B9B9C009B9B9C009B9B9C009B9B
      9C009B9B9C009C9FA100FF00FF00FF00FF00FF00FF00FF00FF00}
    LookAndFeel.Kind = lfOffice11
  end
  inherited ActionList: TActionList
    Left = 429
    Top = 10
    object actGenerate: TAction
      Caption = 'Generate'
      ImageIndex = 5
      OnExecute = actGenerateExecute
    end
    object actPrint: TAction
      Caption = 'Print'
      ImageIndex = 20
      OnExecute = actPrintExecute
    end
    object actInvalidGrades: TAction
      Caption = 'Invalid Grades'
      ImageIndex = 20
      OnExecute = actInvalidGradesExecute
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
            Item = blbPreview
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
        UseOwnFont = False
        Visible = True
        WholeRow = True
        BackgroundBitmap.Data = {00000000}
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    LargeIcons = True
    UseSystemFont = False
    Left = 397
    Top = 10
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
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actGenerate
      Category = 0
      Height = 44
      HotImageIndex = 5
      Width = 65
      SyncImageIndex = False
      ImageIndex = 5
    end
    object blbPreview: TdxBarLargeButton
      Action = actPrint
      Category = 0
      Height = 44
      Width = 65
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 365
    Top = 10
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
    end
  end
  object ComponentPrinter: TdxComponentPrinter
    CurrentLink = ComponentPrinterLink
    PreviewOptions.VisibleOptions = [pvoPageBackground, pvoPageSetup, pvoPreferences, pvoPrint, pvoPrintStyles, pvoReportFileOperations, pvoPageMargins]
    PreviewOptions.WindowState = wsMaximized
    PrintTitle = 'Kingswood Grid Print'
    Version = 0
    Left = 461
    Top = 10
    object ComponentPrinterLink: TdxGridReportLink
      Active = True
      Component = SaleGradeGrid
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageHeader.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageHeader.Font.Color = clBlack
      PrinterPage.PageHeader.Font.Height = -16
      PrinterPage.PageHeader.Font.Name = 'Tahoma'
      PrinterPage.PageHeader.Font.Style = [fsBold]
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.CreationDate = 43838.511071713
      ReportDocument.Creator = 'Kingswood Computing Ltd.'
      ReportDocument.IsCaptionAssigned = True
      OptionsFormatting.LookAndFeelKind = lfFlat
      OptionsOnEveryPage.Footers = False
      OptionsOnEveryPage.Caption = False
      OptionsOnEveryPage.FilterBar = False
      OptionsSize.AutoWidth = True
      OptionsView.Caption = False
      OptionsView.ExpandButtons = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      BuiltInReportLink = True
    end
  end
end
