object fmMilkTankRead: TfmMilkTankRead
  Left = 231
  Top = 59
  Width = 1119
  Height = 780
  Caption = 'Milk Tank Recording System'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object Panel4: TPanel
    Left = 201
    Top = 57
    Width = 910
    Height = 670
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel4'
    TabOrder = 2
    object Splitter2: TSplitter
      Left = 0
      Top = 567
      Width = 910
      Height = 3
      Cursor = crVSplit
      Align = alBottom
      Beveled = True
      Visible = False
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 910
      Height = 30
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 5
        Width = 117
        Height = 16
        BiDiMode = bdLeftToRight
        Caption = 'Milk Statements'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsUnderline]
        ParentBiDiMode = False
        ParentFont = False
      end
      object StatementRecCount: TDBStatusLabel
        Left = 427
        Top = 9
        Width = 126
        Height = 13
        Style = lsRecordNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 384
        Top = 9
        Width = 40
        Height = 13
        Caption = 'Record'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object StatementNav: TDBNavigator
        Left = 146
        Top = 4
        Width = 210
        Height = 23
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit]
        Flat = True
        Hints.Strings = (
          'First'
          'Previous'
          'Next'
          'Last'
          'Insert'
          'Delete'
          'Edit'
          'Save'
          'Cancel'
          'Refresh')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = StatementNavClick
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 255
      Width = 910
      Height = 30
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 1
      object Label2: TLabel
        Left = 8
        Top = 5
        Width = 123
        Height = 16
        Caption = 'Bulk Tank Details'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object BulkTankRecCount: TDBStatusLabel
        Left = 427
        Top = 9
        Width = 120
        Height = 13
        Style = lsRecordNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 384
        Top = 9
        Width = 40
        Height = 13
        Caption = 'Record'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object BulkNav: TDBNavigator
        Left = 146
        Top = 4
        Width = 210
        Height = 23
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit]
        Flat = True
        Hints.Strings = (
          'First'
          'Previous'
          'Next'
          'Last'
          'Insert'
          'Delete'
          'Edit'
          'Save'
          'Cancel'
          'Refresh')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = BulkNavClick
      end
    end
    object pErrors: TPanel
      Left = 0
      Top = 570
      Width = 910
      Height = 100
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      Caption = 'pErrors'
      TabOrder = 2
      Visible = False
      object Label9: TLabel
        Left = 5
        Top = 5
        Width = 99
        Height = 16
        Caption = 'Errors on disk'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object mErrors: TMemo
        Left = 2
        Top = 29
        Width = 906
        Height = 69
        Align = alBottom
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Lines.Strings = (
          '')
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
      end
      object Button1: TButton
        Left = 119
        Top = 7
        Width = 75
        Height = 18
        Caption = 'Close'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = Button1Click
      end
    end
    object cxgMilkStatement: TcxGrid
      Left = 0
      Top = 30
      Width = 910
      Height = 225
      Align = alTop
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      LookAndFeel.Kind = lfFlat
      object cxgMilkStatementDBTableView: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.KeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skSum
            FieldName = 'LiqMilkProd'
            Column = cxgMilkStatementDBTableViewLiqMilkProd
          end
          item
            Kind = skSum
            FieldName = 'PrcPerLtrLiq'
            Column = cxgMilkStatementDBTableViewPrcPerLtrLiq
          end
          item
            Kind = skSum
            FieldName = 'ProcMilkProd'
            Column = cxgMilkStatementDBTableViewProcMilkProd
          end
          item
            Kind = skSum
            FieldName = 'PrcPerLtrProc'
            Column = cxgMilkStatementDBTableViewPrcPerLtrProc
          end
          item
            Kind = skSum
            FieldName = 'GrossValMilk'
            Column = cxgMilkStatementDBTableViewGrossValMilk
          end
          item
            Kind = skSum
            FieldName = 'NetValMilk'
            Column = cxgMilkStatementDBTableViewNetValMilk
          end
          item
            Kind = skSum
            FieldName = 'AvgPerFat'
            Column = cxgMilkStatementDBTableViewAvgPerFat
          end
          item
            Kind = skSum
            FieldName = 'AvgPerProtein'
            Column = cxgMilkStatementDBTableViewAvgPerProtein
          end
          item
            Kind = skSum
            FieldName = 'AvgPerLac'
            Column = cxgMilkStatementDBTableViewAvgPerLac
          end
          item
            Kind = skSum
            FieldName = 'AvgPerSolid'
            Column = cxgMilkStatementDBTableViewAvgPerProtein
          end
          item
            Kind = skSum
            FieldName = 'AvgPerLac'
            Column = cxgMilkStatementDBTableViewAvgPerLac
          end
          item
            Kind = skSum
            FieldName = 'AvgPerSolid'
            Column = cxgMilkStatementDBTableViewAvgPerSolid
          end
          item
            Kind = skSum
            FieldName = 'AvgSCC'
            Column = cxgMilkStatementDBTableViewAvgSCC
          end
          item
            Kind = skSum
            FieldName = '1TCB'
            Column = cxgMilkStatementDBTableViewDBColumn1TCB
          end
          item
            Kind = skSum
            FieldName = '2TCB'
            Column = cxgMilkStatementDBTableViewDBColumn2TCB
          end
          item
            Kind = skSum
            FieldName = '3TCB'
            Column = cxgMilkStatementDBTableViewDBColumn3TCB
          end>
        DataController.Summary.SummaryGroups = <
          item
            Links = <
              item
                Column = cxgMilkStatementDBTableViewCalMthEnd
              end>
            SummaryItems = <>
          end>
        OptionsBehavior.DragHighlighting = False
        OptionsBehavior.DragOpening = False
        OptionsBehavior.DragScrolling = False
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.ColumnHeaderHints = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnHorzSizing = False
        OptionsCustomize.ColumnMoving = False
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        OptionsView.HeaderHeight = 65
        object cxgMilkStatementDBTableViewCalMthEnd: TcxGridDBColumn
          Caption = 'Calendar Month'#13#10#13#10'(End Date)'
          DataBinding.FieldName = 'CalMthEnd'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 95
        end
        object cxgMilkStatementDBTableViewDateStart: TcxGridDBColumn
          Caption = 'Date Milk Supplied From'#13#10#13#10'(Start Of Period)'
          DataBinding.FieldName = 'DateStart'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 101
        end
        object cxgMilkStatementDBTableViewDateEnd: TcxGridDBColumn
          Caption = 'Date Milk Supplied To'#13#10#13#10'(End of Period)'
          DataBinding.FieldName = 'DateEnd'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Width = 100
        end
        object cxgMilkStatementDBTableViewLiqMilkProd: TcxGridDBColumn
          Caption = 'Liquid Milk Produced In Period'#13#10'(Litres)'
          DataBinding.FieldName = 'LiqMilkProd'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 81
        end
        object cxgMilkStatementDBTableViewPrcPerLtrLiq: TcxGridDBColumn
          Caption = 'Unit Price Paid For Liquid Milk'#13#10'(Per Litre)'
          DataBinding.FieldName = 'PrcPerLtrLiq'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 78
        end
        object cxgMilkStatementDBTableViewProcMilkProd: TcxGridDBColumn
          Caption = 'Processing Milk Produced In Period'#13#10'(Litres)'
          DataBinding.FieldName = 'ProcMilkProd'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 85
        end
        object cxgMilkStatementDBTableViewPrcPerLtrProc: TcxGridDBColumn
          Caption = 'Unit Price Paid For Processing Milk'#13#10'(Per Litre)'
          DataBinding.FieldName = 'PrcPerLtrProc'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 95
        end
        object cxgMilkStatementDBTableViewGrossValMilk: TcxGridDBColumn
          Caption = 'Gross Value of all milk for period'
          DataBinding.FieldName = 'GrossValMilk'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 84
        end
        object cxgMilkStatementDBTableViewNetValMilk: TcxGridDBColumn
          Caption = 'Net Value Received After All Deductions Paid'
          DataBinding.FieldName = 'NetValMilk'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 104
        end
        object cxgMilkStatementDBTableViewAvgPerFat: TcxGridDBColumn
          Caption = 'Average Fat for period'#13#10'(%)'
          DataBinding.FieldName = 'AvgPerFat'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 74
        end
        object cxgMilkStatementDBTableViewAvgPerProtein: TcxGridDBColumn
          Caption = 'Average Protein For period'#13#10'(%)'
          DataBinding.FieldName = 'AvgPerProtein'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 81
        end
        object cxgMilkStatementDBTableViewAvgPerLac: TcxGridDBColumn
          Caption = 'Average Lactose For Period'#13#10'(%)'
          DataBinding.FieldName = 'AvgPerLac'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 82
        end
        object cxgMilkStatementDBTableViewAvgPerSolid: TcxGridDBColumn
          Caption = 'Average Solids Non Fat For Period'#13#10'(%)'
          DataBinding.FieldName = 'AvgPerSolid'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 90
        end
        object cxgMilkStatementDBTableViewAvgSCC: TcxGridDBColumn
          Caption = 'Average SCC For Period'
          DataBinding.FieldName = 'AvgSCC'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 74
        end
        object cxgMilkStatementDBTableViewDBColumn1TCB: TcxGridDBColumn
          Caption = '1st TCB for Period'
          DataBinding.FieldName = '1TCB'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 74
        end
        object cxgMilkStatementDBTableViewDBColumn2TCB: TcxGridDBColumn
          Caption = '2 TBC for Period'
          DataBinding.FieldName = '2TCB'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 74
        end
        object cxgMilkStatementDBTableViewDBColumn3TCB: TcxGridDBColumn
          Caption = '3rd TBC for Period'
          DataBinding.FieldName = '3TCB'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 75
        end
        object cxgMilkStatementDBTableViewAvgTherm: TcxGridDBColumn
          Caption = 'Avearge Thermoduric Count for Period'
          DataBinding.FieldName = 'AvgTherm'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 95
        end
      end
      object cxgMilkStatementLevel1: TcxGridLevel
        GridView = cxgMilkStatementDBTableView
      end
    end
    object cxgBulkTankDetails: TcxGrid
      Left = 0
      Top = 285
      Width = 910
      Height = 282
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      LookAndFeel.Kind = lfFlat
      object cxgBulkTankDetailsDBTableView: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = WinData.dsMilkTank
        DataController.KeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skSum
            FieldName = 'AmtCollect'
            Column = cxgBulkTankDetailsDBTableViewAmtCollect
          end
          item
            Kind = skSum
            FieldName = 'PerFat'
            Column = cxgBulkTankDetailsDBTableViewPerFat
          end
          item
            FieldName = 'PerProtein'
            Column = cxgBulkTankDetailsDBTableViewPerProtein
          end
          item
            Kind = skSum
            FieldName = 'PerLac'
            Column = cxgBulkTankDetailsDBTableViewPerLac
          end
          item
            Kind = skSum
            FieldName = 'PerSolid'
            Column = cxgBulkTankDetailsDBTableViewPerSolid
          end
          item
            Kind = skSum
            FieldName = 'SCC'
            Column = cxgBulkTankDetailsDBTableViewSCC
          end
          item
            Kind = skSum
            FieldName = 'TCB'
            Column = cxgBulkTankDetailsDBTableViewTCB
          end
          item
            Kind = skSum
            FieldName = 'Thermoduric'
            Column = cxgBulkTankDetailsDBTableViewThermoduric
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.DragHighlighting = False
        OptionsBehavior.DragOpening = False
        OptionsBehavior.DragScrolling = False
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.ColumnHeaderHints = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnMoving = False
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.GroupFooters = gfAlwaysVisible
        OptionsView.HeaderHeight = 65
        object cxgBulkTankDetailsDBTableViewDateCollected: TcxGridDBColumn
          Caption = 'Date Collected'
          DataBinding.FieldName = 'DateCollected'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
        end
        object cxgBulkTankDetailsDBTableViewAmtCollect: TcxGridDBColumn
          Caption = 'Amount Collected'#13#10#13#10'(Litres)'
          DataBinding.FieldName = 'AmtCollect'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
        end
        object cxgBulkTankDetailsDBTableViewPerFat: TcxGridDBColumn
          Caption = 'Fat for tank'#13#10#13#10'(%)'
          DataBinding.FieldName = 'PerFat'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
        end
        object cxgBulkTankDetailsDBTableViewPerProtein: TcxGridDBColumn
          Caption = 'Protein for Tank'#13#10#13#10'(%)'
          DataBinding.FieldName = 'PerProtein'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
        end
        object cxgBulkTankDetailsDBTableViewPerLac: TcxGridDBColumn
          Caption = 'Lactose for Tank'#13#10#13#10'(%)'
          DataBinding.FieldName = 'PerLac'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
        end
        object cxgBulkTankDetailsDBTableViewPerSolid: TcxGridDBColumn
          Caption = 'Solids Non Fat for Tank'#13#10#13#10'(%)'
          DataBinding.FieldName = 'PerSolid'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 83
        end
        object cxgBulkTankDetailsDBTableViewSCC: TcxGridDBColumn
          Caption = 'SCC for Tank'
          DataBinding.FieldName = 'SCC'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
        end
        object cxgBulkTankDetailsDBTableViewTCB: TcxGridDBColumn
          Caption = 'TBC for Tank'
          DataBinding.FieldName = 'TCB'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
        end
        object cxgBulkTankDetailsDBTableViewThermoduric: TcxGridDBColumn
          Caption = 'Thermoduric for Tank'
          DataBinding.FieldName = 'Thermoduric'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
          Options.Filtering = False
          Width = 95
        end
      end
      object cxgBulkTankDetailsLevel1: TcxGridLevel
        GridView = cxgBulkTankDetailsDBTableView
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1111
    Height = 57
    ButtonHeight = 51
    ButtonWidth = 86
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    TabOrder = 0
    object ToolButton3: TToolButton
      Left = 0
      Top = 2
      Width = 9
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsDivider
    end
    object sbExit: TRxSpeedButton
      Left = 9
      Top = 2
      Width = 58
      Height = 51
      Caption = 'E&xit'
      Flat = True
      NumGlyphs = 2
      OnClick = sbExitClick
    end
    object ToolButton1: TToolButton
      Left = 67
      Top = 2
      Width = 5
      Caption = 'ToolButton1'
      ImageIndex = 0
      Style = tbsDivider
    end
    object sbImport: TRxSpeedButton
      Left = 72
      Top = 2
      Width = 108
      Height = 51
      Caption = '&Read File'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbImportClick
    end
    object ToolButton2: TToolButton
      Left = 180
      Top = 2
      Width = 5
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsDivider
      Visible = False
    end
    object sbOptions: TRxSpeedButton
      Left = 185
      Top = 2
      Width = 91
      Height = 51
      DropDownMenu = pmAllowEdit
      Caption = '&Options'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object ToolButton5: TToolButton
      Left = 276
      Top = 2
      Width = 5
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsDivider
    end
    object sbSave: TRxSpeedButton
      Left = 281
      Top = 2
      Width = 88
      Height = 51
      Caption = '&Save'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbSaveClick
    end
    object ToolButton4: TToolButton
      Left = 369
      Top = 2
      Width = 5
      Caption = 'ToolButton4'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object sbReview: TRxSpeedButton
      Left = 374
      Top = 2
      Width = 97
      Height = 51
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Re&view Recordings'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      WordWrap = True
      OnClick = sbReviewClick
    end
    object ToolButton6: TToolButton
      Left = 471
      Top = 2
      Width = 5
      Caption = 'ToolButton6'
      Enabled = False
      ImageIndex = 3
      Style = tbsDivider
    end
    object sbHelp: TRxSpeedButton
      Left = 476
      Top = 2
      Width = 72
      Height = 51
      Caption = '&Help'
      Flat = True
      OnClick = sbHelpClick
    end
    object ToolButton7: TToolButton
      Left = 548
      Top = 2
      Width = 5
      Caption = 'ToolButton7'
      ImageIndex = 4
      Style = tbsDivider
    end
  end
  object pDetails: TPanel
    Left = 0
    Top = 57
    Width = 201
    Height = 670
    Align = alLeft
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object pProgress: TPanel
      Left = 2
      Top = 434
      Width = 197
      Height = 43
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lStatus: TLabel
        Left = 5
        Top = 3
        Width = 79
        Height = 13
        Caption = 'Reading file...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object ProgressBar1: TProgressBar
        Left = 6
        Top = 18
        Width = 169
        Height = 15
        Min = 0
        Max = 100
        TabOrder = 0
      end
    end
    object gbFilter: TGroupBox
      Left = 2
      Top = 289
      Width = 197
      Height = 145
      Align = alTop
      Caption = 'Filter Statements'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object lMonth: TLabel
        Left = 54
        Top = 36
        Width = 34
        Height = 13
        Caption = 'Month'
      end
      object lYear: TLabel
        Left = 119
        Top = 36
        Width = 26
        Height = 13
        Caption = 'Year'
      end
      object Label11: TLabel
        Left = 15
        Top = 54
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = 'From:'
      end
      object Label14: TLabel
        Left = 30
        Top = 80
        Width = 19
        Height = 13
        Alignment = taRightJustify
        Caption = 'To:'
      end
      object lFilterBy: TLabel
        Left = 14
        Top = 19
        Width = 115
        Height = 13
        Caption = 'Calender Month End'
      end
      object sbFilter: TSpeedButton
        Left = 56
        Top = 110
        Width = 128
        Height = 25
        Caption = '&Apply Filter'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Layout = blGlyphRight
        NumGlyphs = 2
        ParentFont = False
        OnClick = sbFilterClick
      end
      object cbFromYear: TComboBox
        Left = 120
        Top = 52
        Width = 65
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = '2003'
        Items.Strings = (
          '2000'
          '2001'
          '2002'
          '2003'
          '2004')
      end
      object cbFromMonth: TComboBox
        Left = 54
        Top = 52
        Width = 60
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Text = 'Jan'
        Items.Strings = (
          'Jan'
          'Feb'
          'Mar'
          'Apr'
          'May'
          'June'
          'July'
          'Aug'
          'Sept'
          'Oct'
          'Nov'
          'Dec')
      end
      object cbToYear: TComboBox
        Left = 120
        Top = 77
        Width = 65
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        Text = '2003'
        Items.Strings = (
          '2000'
          '2001'
          '2002'
          '2003'
          '2004')
      end
      object cbToMonth: TComboBox
        Left = 54
        Top = 77
        Width = 60
        Height = 21
        ItemHeight = 13
        TabOrder = 3
        Text = 'June'
        Items.Strings = (
          'Jan'
          'Feb'
          'Mar'
          'Apr'
          'May'
          'June'
          'July'
          'Aug'
          'Sept'
          'Oct'
          'Nov'
          'Dec')
      end
      object ToDate: TDateEdit
        Left = 54
        Top = 77
        Width = 121
        Height = 21
        NumGlyphs = 2
        TabOrder = 4
        Visible = False
      end
      object FromDate: TDateEdit
        Left = 54
        Top = 51
        Width = 121
        Height = 21
        NumGlyphs = 2
        TabOrder = 5
        Visible = False
      end
    end
    object rgFilterBy: TRadioGroup
      Left = 2
      Top = 251
      Width = 197
      Height = 38
      Align = alTop
      Caption = 'Filter By:'
      Columns = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'S&tatements   '
        'Tan&k')
      ParentFont = False
      TabOrder = 2
      OnClick = rgFilterByClick
    end
    object pOwner: TPanel
      Left = 2
      Top = 2
      Width = 197
      Height = 249
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 3
      object Label4: TLabel
        Left = 8
        Top = 4
        Width = 106
        Height = 16
        Caption = 'Details on File '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 8
        Top = 187
        Width = 90
        Height = 13
        Caption = 'Statement Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 8
        Top = 148
        Width = 81
        Height = 13
        Caption = 'Milk Company'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 8
        Top = 59
        Width = 70
        Height = 13
        Caption = 'Farm Owner'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 8
        Top = 24
        Width = 56
        Height = 13
        Caption = 'File Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object eMilkCo: TEdit
        Left = 8
        Top = 163
        Width = 180
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object eStatementDate: TEdit
        Left = 8
        Top = 201
        Width = 114
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object mOwner: TMemo
        Left = 8
        Top = 72
        Width = 180
        Height = 73
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object eFileName: TEdit
        Left = 8
        Top = 36
        Width = 180
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object cbEditCheque: TCheckBox
        Left = 8
        Top = 226
        Width = 144
        Height = 17
        Caption = 'Edit Disk Contents'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        Visible = False
        OnClick = cbEditChequeClick
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 727
    Width = 1111
    Height = 19
    Panels = <
      item
        Width = 400
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object OpenDialog: TOpenDialog
    Filter = 'Bulk Tank File (.txt)|*.txt'
    Left = 576
    Top = 17
  end
  object Parser: TSPParser
    Sepchar = '^'
    CharSearch = True
    Left = 610
    Top = 18
  end
  object pmAllowEdit: TPopupMenu
    Left = 252
    Top = 22
    object pmiAllowManualEdit: TMenuItem
      Caption = 'Allow Manual Entry'
      OnClick = pmiAllowManualEditClick
    end
  end
end
