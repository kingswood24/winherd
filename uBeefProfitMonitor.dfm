object fmBeefProfitMonitor: TfmBeefProfitMonitor
  Left = 313
  Top = 179
  Width = 843
  Height = 636
  Caption = 'Beef Profit Monitor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcProfitMonitor: TcxPageControl
    Left = 0
    Top = 48
    Width = 835
    Height = 537
    ActivePage = tsLiveStockMovements
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    LookAndFeel.Kind = lfFlat
    ParentFont = False
    Style = 9
    TabHeight = 32
    TabOrder = 4
    TabWidth = 250
    OnChange = pcProfitMonitorChange
    ClientRectBottom = 537
    ClientRectRight = 835
    ClientRectTop = 33
    object tsLiveStockMovements: TcxTabSheet
      Caption = 'Livestock Sales and Purchases Details'
      ImageIndex = 0
      object LSMovementsGrid: TcxGrid
        Left = 0
        Top = 69
        Width = 835
        Height = 394
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        object LSMovementsGridBandedTableView: TcxGridBandedTableView
          NavigatorButtons.ConfirmDelete = False
          FilterBox.CustomizeDialog = False
          OnCanFocusRecord = LSMovementsGridBandedTableViewCanFocusRecord
          OnCanSelectRecord = LSMovementsGridBandedTableViewCanSelectRecord
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnHorzSizing = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsCustomize.BandMoving = False
          OptionsCustomize.BandSizing = False
          OptionsCustomize.ColumnVertSizing = False
          OptionsCustomize.NestedBands = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.InvertSelect = False
          OptionsView.ScrollBars = ssVertical
          OptionsView.DataRowHeight = 28
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 32
          OptionsView.BandHeaderHeight = 32
          OptionsView.BandHeaderLineCount = 2
          Bands = <
            item
              Caption = 'Livestock'
              Width = 150
            end
            item
              Caption = 'Sales'
              Width = 240
            end
            item
              Caption = 'Purchases'
              Width = 240
            end>
          object LSMovementsGridBandedTableViewLSCategory: TcxGridBandedColumn
            Caption = 'Category'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Focusing = False
            Styles.Content = cxStyleStatic
            Styles.OnGetContentStyle = LSMovementsGridBandedTableViewLSCategoryStylesGetContentStyle
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object LSMovementsGridBandedTableViewSalesNumber: TcxGridBandedColumn
            Caption = 'Number'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = '#'
            Properties.EditFormat = '#'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 40
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object LSMovementsGridBandedTableViewSalesTotal: TcxGridBandedColumn
            Caption = 'Total €'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.EditFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 1
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object LSMovementsGridBandedTableViewSalesTotalLW: TcxGridBandedColumn
            Caption = 'Total LW (kg)'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.EditFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 1
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
          object LSMovementsGridBandedTableViewPurchasesNumber: TcxGridBandedColumn
            Caption = 'Number'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = '#'
            Properties.EditFormat = '#'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 40
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object LSMovementsGridBandedTableViewPurchasesTotal: TcxGridBandedColumn
            Caption = 'Total €'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.EditFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 2
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
          object LSMovementsGridBandedTableViewPurchasesTotalLW: TcxGridBandedColumn
            Caption = 'Total LW (kg)'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DisplayFormat = ',0.00;-,0.00'
            Properties.EditFormat = ',0.00;-,0.00'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Position.BandIndex = 2
            Position.ColIndex = 2
            Position.RowIndex = 0
          end
        end
        object LSMovementsGridLevel: TcxGridLevel
          GridView = LSMovementsGridBandedTableView
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 835
        Height = 69
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object cxButton1: TcxButton
          Left = 452
          Top = 20
          Width = 67
          Height = 21
          Caption = 'Get Data'
          TabOrder = 0
          Visible = False
          OnClick = cxButton1Click
          LookAndFeel.NativeStyle = True
        end
        object cxGroupBox1: TcxGroupBox
          Left = 5
          Top = 8
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Specify Movement Dates'
          Style.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.Kind = lfFlat
          TabOrder = 1
          Height = 55
          Width = 390
          object cxLabel1: TcxLabel
            Left = 17
            Top = 25
            Caption = 'Between'
          end
          object FromDate: TcxDateEdit
            Left = 65
            Top = 23
            Properties.ImmediatePost = True
            Properties.OnChange = FromDatePropertiesChange
            Style.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.Kind = lfFlat
            TabOrder = 1
            Width = 121
          end
          object cxLabel2: TcxLabel
            Left = 198
            Top = 25
            Caption = 'And'
          end
          object ToDate: TcxDateEdit
            Left = 237
            Top = 23
            Properties.ImmediatePost = True
            Properties.OnChange = FromDatePropertiesChange
            Style.LookAndFeel.Kind = lfFlat
            StyleDisabled.LookAndFeel.Kind = lfFlat
            StyleFocused.LookAndFeel.Kind = lfFlat
            StyleHot.LookAndFeel.Kind = lfFlat
            TabOrder = 3
            Width = 121
          end
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 463
        Width = 835
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object btnExportLivestockSalesAndPurchases: TcxButton
          Left = 16
          Top = 8
          Width = 75
          Height = 25
          Action = actExportLivestockSalesAndPurchases
          Default = True
          TabOrder = 0
          LookAndFeel.NativeStyle = True
        end
        object btnPrintLivestockSalesAndPurchases: TcxButton
          Left = 98
          Top = 8
          Width = 75
          Height = 25
          Action = actPrintLivestockSalesAndPurchases
          TabOrder = 1
          LookAndFeel.NativeStyle = True
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 69
        Width = 0
        Height = 394
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 3
      end
      object Panel4: TPanel
        Left = 835
        Top = 69
        Width = 0
        Height = 394
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 4
      end
      inline frmHerdID: TfrmHerdIDPanel
        Left = 179
        Top = 215
        Height = 42
        TabOrder = 5
        inherited pHerdId: TPanel
          Height = 42
          inherited HerdCombo: TcxLookupComboBox
            Top = 20
            Properties.OnChange = frmHerdIDHerdComboPropertiesChange
            Style.IsFontAssigned = True
            Width = 152
          end
          inherited cxLabel1: TcxLabel
            Top = 2
            Style.IsFontAssigned = True
          end
        end
      end
      object pFavourite: TPanel
        Left = 480
        Top = 222
        Width = 213
        Height = 26
        BevelOuter = bvNone
        TabOrder = 6
        object cbFavourite: TcxCheckBox
          Left = 1
          Top = 2
          AutoSize = False
          Caption = 'Add Report As Favourite'
          Properties.OnChange = cbFavouritePropertiesChange
          TabOrder = 0
          Height = 23
          Width = 213
        end
      end
    end
    object tsProfitMonitorSummary: TcxTabSheet
      Caption = 'Monthly Livestock Table'
      ImageIndex = 1
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 835
        Height = 72
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object cxLabel3: TcxLabel
          Left = 8
          Top = 18
          Caption = 'Produce Monthly Livestock Table to end of month'
        end
        object cmboMonth: TcxComboBox
          Left = 268
          Top = 18
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            'January'
            'February'
            'March'
            'April'
            'May'
            'June'
            'July'
            'August'
            'September'
            'October'
            'November'
            'December')
          Properties.OnChange = cmboMonthPropertiesChange
          Style.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.Kind = lfFlat
          TabOrder = 1
          Text = 'January'
          Width = 83
        end
        object cxLabel4: TcxLabel
          Left = 314
          Top = 52
          Caption = 'Livestock figures at end of month'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Tahoma'
          Style.Font.Style = []
          Style.IsFontAssigned = True
        end
        object cxLabel5: TcxLabel
          Left = 360
          Top = 18
          Caption = 'in the year'
        end
        object cmboYear: TcxComboBox
          Left = 424
          Top = 18
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            '')
          Properties.OnChange = cmboMonthPropertiesChange
          Style.LookAndFeel.Kind = lfFlat
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.Kind = lfFlat
          TabOrder = 4
          Width = 83
        end
        object cxButton6: TcxButton
          Left = 516
          Top = 18
          Width = 67
          Height = 21
          Caption = 'Get Data'
          TabOrder = 5
          Visible = False
          OnClick = cxButton6Click
          LookAndFeel.NativeStyle = True
        end
      end
      object LSSummary: TcxGrid
        Left = 0
        Top = 72
        Width = 835
        Height = 388
        Align = alClient
        TabOrder = 1
        LookAndFeel.Kind = lfFlat
        object LSSummaryTableView: TcxGridTableView
          NavigatorButtons.ConfirmDelete = False
          OnCanFocusRecord = LSSummaryTableViewCanFocusRecord
          OnCanSelectRecord = LSSummaryTableViewCanSelectRecord
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnHorzSizing = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.InvertSelect = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.DataRowHeight = 28
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 32
          object LSSummaryTableViewCategory: TcxGridColumn
            Caption = 'Category'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Styles.OnGetContentStyle = LSSummaryTableViewCategoryStylesGetContentStyle
            Styles.Header = cxStyleStatic
            Width = 150
          end
          object LSSummaryTableViewStart: TcxGridColumn
            Caption = 'Start'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = '#'
            Properties.EditFormat = '#'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Styles.Content = cxStyleStartMonth
            Width = 42
          end
          object LSSummaryTableViewEndJan: TcxGridColumn
            Caption = 'Jan'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = '#'
            Properties.EditFormat = '#'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 42
          end
          object LSSummaryTableViewEndFeb: TcxGridColumn
            Caption = 'Feb'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = '#'
            Properties.EditFormat = '#'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 42
          end
          object LSSummaryTableViewEndMar: TcxGridColumn
            Caption = 'Mar'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = '#'
            Properties.EditFormat = '#'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 42
          end
          object LSSummaryTableViewEndApr: TcxGridColumn
            Caption = 'Apr'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = '#'
            Properties.EditFormat = '#'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 42
          end
          object LSSummaryTableViewEndMay: TcxGridColumn
            Caption = 'May'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = '#'
            Properties.EditFormat = '#'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 42
          end
          object LSSummaryTableViewEndJun: TcxGridColumn
            Caption = 'Jun'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = '#'
            Properties.EditFormat = '#'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 42
          end
          object LSSummaryTableViewEndJul: TcxGridColumn
            Caption = 'Jul'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = '#'
            Properties.EditFormat = '#'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 42
          end
          object LSSummaryTableViewEndAug: TcxGridColumn
            Caption = 'Aug'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = '#'
            Properties.EditFormat = '#'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 42
          end
          object LSSummaryTableViewEndSep: TcxGridColumn
            Caption = 'Sep'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = '#'
            Properties.EditFormat = '#'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 42
          end
          object LSSummaryTableViewEndOct: TcxGridColumn
            Caption = 'Oct'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = '#'
            Properties.EditFormat = '#'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 42
          end
          object LSSummaryTableViewEndNov: TcxGridColumn
            Caption = 'Nov'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = '#'
            Properties.EditFormat = '#'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 42
          end
          object LSSummaryTableViewEndDec: TcxGridColumn
            Caption = 'Dec'
            DataBinding.ValueType = 'Integer'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = '#'
            Properties.EditFormat = '#'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 42
          end
          object LSSummaryTableViewTotal: TcxGridColumn
            Caption = 'Total'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DisplayFormat = '0.00;-0.00'
            Properties.EditFormat = '0.00;-0.00'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 55
          end
          object LSSummaryTableViewAverage: TcxGridColumn
            Caption = 'Average'
            DataBinding.ValueType = 'Float'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DisplayFormat = '0.00;-0.00'
            Properties.EditFormat = '0.00;-0.00'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 55
          end
        end
        object LSSummaryGridLevel: TcxGridLevel
          GridView = LSSummaryTableView
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 460
        Width = 835
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object btnExportProfitMonitorSummary: TcxButton
          Left = 16
          Top = 8
          Width = 75
          Height = 25
          Action = actExportProfitMonitorSummary
          Default = True
          TabOrder = 0
          LookAndFeel.NativeStyle = True
        end
        object btnPrintProfitMonitorSummary: TcxButton
          Left = 98
          Top = 8
          Width = 75
          Height = 25
          Action = actPrintProfitMonitorSummary
          TabOrder = 1
          LookAndFeel.NativeStyle = True
        end
      end
    end
  end
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 585
    Width = 835
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Font.Charset = DEFAULT_CHARSET
        PanelStyle.Font.Color = clRed
        PanelStyle.Font.Height = -11
        PanelStyle.Font.Name = 'MS Sans Serif'
        PanelStyle.Font.Style = [fsBold]
        PanelStyle.ParentFont = False
        Width = 300
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object BarManager: TdxBarManager
    AllowReset = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        Caption = 'TopToolbar'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 604
        FloatTop = 357
        FloatClientWidth = 23
        FloatClientHeight = 22
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemLinks = <
          item
            Item = blbExit
            Visible = True
          end
          item
            BeginGroup = True
            Item = BarControlContainerForHerdID
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarControlContainerItem1
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbHelp
            Visible = True
          end>
        Name = 'TopToolbar'
        OneOnRow = True
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = True
        UseRestSpace = True
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    HotImages = ImageStore.ImageList16x16
    Images = ImageStore.ImageList16x16
    PopupMenuLinks = <>
    UseSystemFont = False
    Left = 646
    Top = 6
    DockControlHeights = (
      0
      0
      48
      0)
    object blbExit: TdxBarLargeButton
      Action = actExit
      Category = 0
      PaintStyle = psCaptionGlyph
      Height = 44
      HotImageIndex = 0
      Width = 65
      SyncImageIndex = False
      ImageIndex = 0
    end
    object BarControlContainerForHerdID: TdxBarControlContainerItem
      Category = 0
      Visible = ivAlways
      Control = frmHerdID
    end
    object blbHelp: TdxBarLargeButton
      Action = actHelp
      Category = 0
      Height = 44
      HotImageIndex = 7
      Width = 65
      SyncImageIndex = False
      ImageIndex = 7
    end
    object dxBarControlContainerItem1: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = pFavourite
    end
  end
  object ActionList: TActionList
    Images = ImageStore.ImageList16x16
    Left = 614
    Top = 5
    object actExit: TAction
      Caption = 'Exit'
      OnExecute = actExitExecute
    end
    object actHelp: TAction
      Caption = 'Help'
      ImageIndex = 7
    end
    object actExportLivestockSalesAndPurchases: TAction
      Caption = 'Export'
      OnExecute = actExportLivestockSalesAndPurchasesExecute
    end
    object actPrintLivestockSalesAndPurchases: TAction
      Caption = 'Print'
      OnExecute = actPrintLivestockSalesAndPurchasesExecute
    end
    object actExportProfitMonitorSummary: TAction
      Caption = 'Export'
      OnExecute = actExportProfitMonitorSummaryExecute
    end
    object actPrintProfitMonitorSummary: TAction
      Caption = 'Print'
      OnExecute = actPrintProfitMonitorSummaryExecute
    end
  end
  object QueryEvents: TQuery
    DatabaseName = 'Kingswd'
    Left = 740
    Top = 3
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 576
    Top = 2
    object cxStyleNormal: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyleStatic: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyleHeader: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyleStartMonth: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clInfoBk
      TextColor = clInfoText
    end
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = dxComponentPrinterProfitMonitorSummary
    PreviewOptions.VisibleOptions = [pvoPageBackground, pvoPageSetup, pvoPrint, pvoPrintStyles, pvoReportFileOperations]
    PreviewOptions.WindowState = wsMaximized
    PrintTitle = 'Kingswood Grid Print'
    Version = 0
    Left = 708
    Top = 1
    object dxComponentPrinterLSMovements: TdxGridReportLink
      Active = True
      Component = LSMovementsGrid
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageFooter.LeftTitle.Strings = (
        'Kingswood Computing Ltd., Tel. No.: +353 1 4596677')
      PrinterPage.PageFooter.RightTitle.Strings = (
        'Kingswood Herd')
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.CreationDate = 43364.4924902199
      ReportDocument.Creator = 'Kingswood Computing Ltd.'
      ReportDocument.Description = 'Kingswood Computing Ltd.'
      ReportDocument.IsCaptionAssigned = True
      ReportTitle.AdjustOnReportScale = True
      ReportTitle.Font.Charset = ANSI_CHARSET
      ReportTitle.Font.Color = clBlack
      ReportTitle.Font.Height = -15
      ReportTitle.Font.Name = 'Tahoma'
      ReportTitle.Font.Style = [fsBold]
      ReportTitle.Text = 'Beef Profit Monitor - Livestock Sales and Purchases Details'
      ReportTitle.TextAlignX = taLeft
      OptionsOnEveryPage.FilterBar = False
      OptionsView.FilterBar = False
      BuiltInReportLink = True
      IsDesignerCaptionAssigned = True
    end
    object dxComponentPrinterProfitMonitorSummary: TdxGridReportLink
      Active = True
      Component = LSSummary
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageFooter.LeftTitle.Strings = (
        'Kingswood Computing Ltd., Tel. No.: +353 1 4596677')
      PrinterPage.PageFooter.RightTitle.Strings = (
        'Kingswood Herd')
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'Monthly Livestock Table'
      ReportDocument.CreationDate = 43364.4924902199
      ReportDocument.Creator = 'Kingswood Computing Ltd.'
      ReportDocument.Description = 'Kingswood Computing Ltd.'
      ReportTitle.AdjustOnReportScale = True
      ReportTitle.Font.Charset = ANSI_CHARSET
      ReportTitle.Font.Color = clBlack
      ReportTitle.Font.Height = -15
      ReportTitle.Font.Name = 'Tahoma'
      ReportTitle.Font.Style = [fsBold]
      ReportTitle.Text = 'Beef Profit Monitor - Monthly Livestock Table'
      ReportTitle.TextAlignX = taLeft
      OptionsOnEveryPage.FilterBar = False
      OptionsView.FilterBar = False
      BuiltInReportLink = True
      IsDesignerCaptionAssigned = True
    end
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.xls'
    Filter = 'Excel File|*.xls'
    Left = 676
    Top = 4
  end
  object DataTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = DataTimerTimer
    Left = 766
    Top = 219
  end
end
