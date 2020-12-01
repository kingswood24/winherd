inherited fmFertTreatmentsReview: TfmFertTreatmentsReview
  Left = 484
  Top = 99
  Width = 876
  Height = 639
  Caption = 'Fertility Treatment Chart '
  OldCreateOrder = True
  Position = poDefault
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 588
    Width = 868
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = ANSI_CHARSET
        PanelStyle.Font.Color = clRed
        PanelStyle.Font.Height = -13
        PanelStyle.Font.Name = 'Tahoma'
        PanelStyle.Font.Style = [fsBold]
        PanelStyle.ParentFont = False
        Width = 250
      end>
    Font.Charset = ANSI_CHARSET
    Font.Height = -16
    Font.Name = 'Tahoma'
  end
  object SpreadSheet: TcxSpreadSheet [1]
    Left = 0
    Top = 154
    Width = 868
    Height = 393
    ExcelProtectionStyle = False
    Align = alClient
    DefaultStyle.Font.Name = 'MS Sans Serif'
    DefaultStyle.WordBreak = True
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = []
    PainterType = ptOfficeXPStyle
    ShowHeaders = False
    OnCustomPaint = SpreadSheetCustomPaint
    OnTopLeftChanging = SpreadSheetTopLeftChanging
  end
  object pFilter: TPanel [2]
    Left = 0
    Top = 52
    Width = 868
    Height = 102
    Align = alTop
    TabOrder = 6
    object lStartDate: TLabel
      Left = 14
      Top = 62
      Width = 50
      Height = 13
      Caption = 'Start Date'
      Visible = False
    end
    object Label2: TLabel
      Left = 14
      Top = 30
      Width = 34
      Height = 13
      Caption = 'Display'
    end
    object deStartDate: TcxDateEdit
      Left = 82
      Top = 62
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 0
      Visible = False
      Width = 143
    end
    object cmboDisplayCows: TcxComboBox
      Left = 82
      Top = 30
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.Items.Strings = (
        'Currently on Program'
        'Served Cows'
        'Pregnant Cows'
        'Culled Cows'
        'All Cows')
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
      Properties.OnChange = cmboDisplayCowsPropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 1
      Text = 'Currently on Program'
      Width = 185
    end
    object rgDateSelection: TcxRadioGroup
      Left = 274
      Top = 25
      Caption = 'Select Period to Report'
      Properties.Items = <
        item
          Caption = 'Prior 14 Days'
        end
        item
          Caption = 'Today + 14 Days'
        end>
      Properties.OnChange = rgDateSelectionPropertiesChange
      ItemIndex = 1
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 2
      Height = 68
      Width = 175
    end
    object cbFavourite: TcxCheckBox
      Left = 10
      Top = 3
      AutoSize = False
      Caption = 'Add Report As Favourite'
      Properties.OnChange = cbFavouritePropertiesChange
      TabOrder = 3
      Height = 23
      Width = 213
    end
  end
  object pActions: TPanel [3]
    Left = 0
    Top = 547
    Width = 868
    Height = 41
    Align = alBottom
    TabOrder = 7
    Visible = False
  end
  inherited ActionList: TActionList
    Left = 104
    Top = 144
    inherited actHelp: TAction
      OnExecute = actHelpExecute
    end
    object actPreview: TAction
      Caption = 'Preview'
      ImageIndex = 19
      OnExecute = actPreviewExecute
    end
    object actFertPrograms: TAction
      Caption = '&Fertility Programs'
      ImageIndex = 22
      OnExecute = actFertProgramsExecute
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
            Item = blbPreview
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
    Left = 132
    Top = 144
    DockControlHeights = (
      0
      0
      52
      0)
    inherited bClose: TdxBarLargeButton
      Height = 48
    end
    inherited bHelp: TdxBarLargeButton
      Height = 48
    end
    object blbBuildChart: TdxBarLargeButton
      Caption = 'Build Chart'
      Category = 0
      Hint = 'Build Chart'
      Visible = ivAlways
      OnClick = blbBuildChartClick
    end
    object blbPreview: TdxBarLargeButton
      Action = actPreview
      Category = 0
      Height = 48
      HotImageIndex = 19
      Width = 75
      SyncImageIndex = False
      ImageIndex = 19
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actFertPrograms
      Category = 0
      Height = 48
      HotImageIndex = 22
      SyncImageIndex = False
      ImageIndex = 22
    end
  end
  object QueryNotPregCows: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      
        'Select A.AnimalNo, A.SortAnimalNo, F.ProgramID, F.StartDate, FP.' +
        'Description From FertProgAdmin F'
      'INNER JOIN Animals  A ON (A.ID=F.AnimalID)'
      'Left Join  FertPrograms FP ON (FP.ID=F.ProgramID)'
      'Where A.InHerd=True'
      'And A.Sex = "Female"'
      'And A.Breeding=True'
      'And A.AnimalDeleted=False'
      'And F.ProgramID>0'
      'AND NOT (A.ID IN (SELECT E.AnimalID FROM Events E'
      '                         WHERE (A.ID=E.AnimalID)'
      '                         AND   (A.LactNo=E.AnimalLactNo)'
      '                         AND   (E.EventType = 24)))'
      ''
      'Order By SortAnimalNo')
    Left = 212
    Top = 270
  end
  object QueryServicedCows: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select A.AnimalNo, A.SortAnimalNo, E2.EventDate From Animals  A'
      'Left Join Events E2 ON (E2.AnimalID=A.ID)'
      'Where  (E2.EventType = 2)'
      'AND  (A.LactNo=E2.AnimalLactNo)'
      'And A.InHerd=True'
      'And A.Sex = "Female"'
      'And A.Breeding=True'
      'And A.AnimalDeleted=False'#9#9#9#9#9#9#9#9' '
      ''
      'And not (A.ID IN (SELECT E.AnimalID FROM Events E'
      #9#9#9#9#9#9#9#9' WHERE (A.ID=E.AnimalID)'
      #9#9#9#9#9#9#9#9' AND   (A.LactNo=E.AnimalLactNo)'
      #9#9#9#9#9#9#9#9' AND   (E.EventType = 3)'
      #9#9#9#9#9#9#9#9' AND   (E.EventDate>=E2.EventDate)))'
      'Order By SortAnimalNo'
      '')
    Left = 246
    Top = 272
  end
  object QueryCulledCows: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select A.AnimalNo, A.SortAnimalNo From Animals  A'
      'Left Join CowFertility C ON (C.AnimalID=A.ID)'
      'Where  (C.Culled = True)'
      'And A.InHerd=True'
      'And A.Sex = "Female"'
      'And A.Breeding=True'
      'And A.AnimalDeleted=False'#9#9#9#9#9#9#9#9' '
      'Order By SortAnimalNo')
    Left = 278
    Top = 272
  end
  object QueryPregnantCows: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select A.AnimalNo, A.SortAnimalNo From Animals  A'
      'WHERE (A.ID IN (SELECT E.AnimalID FROM Events E '
      
        '                         LEFT JOIN PregnancyDiag P ON (E.ID=P.Ev' +
        'entID) '
      '                         WHERE (A.ID=E.AnimalID)    '
      '                         AND   (A.LactNo=E.AnimalLactNo)  '
      '                         AND   (E.EventType = 3)'
      '                         AND   (P.PregnancyStatus=True)))'
      'And A.InHerd=True'
      'And A.Sex = "Female"'
      'And A.Breeding=True'
      'And A.AnimalDeleted=False'#9#9#9#9#9#9#9#9' '
      'Order By SortAnimalNo'
      '')
    Left = 318
    Top = 272
  end
  object ComponentPrinter: TdxComponentPrinter
    CurrentLink = ComponentPrinterdxcplFertilityTreatmentChart
    PreviewOptions.VisibleOptions = [pvoPageSetup, pvoPrint, pvoPageMargins]
    PrintTitle = 'Fertility Treatment Chart'
    Version = 0
    Left = 382
    Top = 164
    object ComponentPrinterdxcplFertilityTreatmentChart: TdxSpreadSheetReportLink
      Component = SpreadSheet
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageFooter.LeftTitle.Strings = (
        'Kingswood Computing Ltd.')
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'Fertility Treatment Chart'
      ReportDocument.Creator = 'Kingswood Computing Ltd.'
      ReportTitle.Text = 'Fertility Treatment Chart'
      HeadersOnEveryPage = True
      OptionsView = [ssovGridLines]
      RowAutoHeight = True
      Transparent = False
      BuiltInReportLink = True
    end
  end
  object ChartTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = ChartTimerTimer
    Left = 484
    Top = 114
  end
end
