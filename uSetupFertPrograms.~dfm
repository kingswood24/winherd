inherited fmSetupFertPrograms: TfmSetupFertPrograms
  Left = 379
  Top = 233
  VertScrollBar.Range = 0
  ActiveControl = GridPrograms
  BorderStyle = bsDialog
  Caption = 'Setup Fertility Programs'
  ClientHeight = 331
  ClientWidth = 756
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 311
    Width = 756
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 340
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Tahoma'
  end
  object GridPrograms: TcxGrid [1]
    Left = 0
    Top = 65
    Width = 341
    Height = 210
    Align = alLeft
    TabOrder = 5
    OnEnter = GridProgramsEnter
    OnExit = GridProgramsExit
    LookAndFeel.Kind = lfFlat
    object GridProgramsDBTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = GridProgramsDBTableViewFocusedRecordChanged
      DataController.DataSource = WinData.dsFertPrograms
      DataController.KeyFieldNames = 'ID'
      DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.AlwaysShowEditor = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnHorzSizing = False
      OptionsCustomize.ColumnMoving = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.DataRowHeight = 21
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 21
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      OptionsView.NewItemRow = True
      OptionsView.NewItemRowInfoText = 'Type here to add a new program'
      OptionsView.NewItemRowSeparatorColor = clGray
      OptionsView.NewItemRowSeparatorWidth = 3
      Styles.Inactive = RowActiveStyle
      Styles.Selection = RowActiveStyle
      Styles.NewItemRowInfoText = NewRowStyle
      object GridProgramsDBTableViewID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Hidden = True
      end
      object GridProgramsDBTableViewDescription: TcxGridDBColumn
        DataBinding.FieldName = 'Description'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentVert = vaCenter
        SortIndex = 0
        SortOrder = soAscending
        Width = 240
      end
      object GridProgramsDBTableViewCode: TcxGridDBColumn
        Caption = 'Code (optional)'
        DataBinding.FieldName = 'Code'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentVert = vaCenter
        Width = 80
      end
      object GridProgramsDBTableViewStartDay: TcxGridDBColumn
        Caption = 'Days After PD To Start'
        DataBinding.FieldName = 'StartDay'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Hidden = True
        Width = 55
      end
    end
    object GridProgramsLevel: TcxGridLevel
      GridView = GridProgramsDBTableView
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 42
    Width = 756
    Height = 23
    Align = alTop
    TabOrder = 6
    object Label1: TLabel
      Left = 2
      Top = 2
      Width = 115
      Height = 16
      Caption = 'Fertility Programs'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 342
      Top = 2
      Width = 204
      Height = 16
      Caption = 'Associated Fertility Treatments'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel [3]
    Left = 0
    Top = 278
    Width = 756
    Height = 33
    Align = alBottom
    TabOrder = 7
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 64
      Top = 40
      TabOrder = 0
      Visible = False
      Width = 67
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 66
      Top = 42
      TabOrder = 1
      Visible = False
      Width = 205
    end
    object cxLabel2: TcxLabel
      Left = 4
      Top = 36
      Caption = 'Description'
      Visible = False
    end
    object cxLabel1: TcxLabel
      Left = 26
      Top = 42
      Caption = 'Code'
      Visible = False
    end
    object cxLabel3: TcxLabel
      Left = 162
      Top = 42
      Caption = 'Days From Preg. Diag Date '
      Visible = False
    end
    object cxDBSpinEdit1: TcxDBSpinEdit
      Left = 308
      Top = 40
      TabOrder = 5
      Visible = False
      Width = 65
    end
    object btnRemoveProgram: TcxButton
      Left = 4
      Top = 4
      Width = 112
      Height = 25
      Caption = 'Remove Program'
      TabOrder = 6
      OnClick = btnRemoveProgramClick
      LookAndFeel.Kind = lfOffice11
    end
    object btnRemoveTreatment: TcxButton
      Left = 346
      Top = 4
      Width = 112
      Height = 25
      Caption = 'Remove Treatment'
      TabOrder = 7
      OnClick = btnRemoveTreatmentClick
      LookAndFeel.Kind = lfOffice11
    end
  end
  object GridTreatments: TcxGrid [4]
    Left = 341
    Top = 65
    Width = 415
    Height = 210
    Align = alClient
    TabOrder = 8
    OnEnter = GridTreatmentsEnter
    OnExit = GridTreatmentsExit
    LookAndFeel.Kind = lfFlat
    object GridTreatmentsDBTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = GridProgramsDBTableViewFocusedRecordChanged
      DataController.DataSource = WinData.dsFertTreatments
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.AlwaysShowEditor = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnHorzSizing = False
      OptionsCustomize.ColumnMoving = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.DataRowHeight = 21
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 21
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      OptionsView.NewItemRow = True
      OptionsView.NewItemRowInfoText = 'Type here to add an associated treatment'
      OptionsView.NewItemRowSeparatorColor = clGray
      OptionsView.NewItemRowSeparatorWidth = 3
      Styles.Inactive = RowActiveStyle
      Styles.Selection = RowActiveStyle
      Styles.NewItemRowInfoText = NewRowStyle
      object GridTreatmentsDBTableViewID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Hidden = True
      end
      object GridTreatmentsDBTableViewParentProgram: TcxGridDBColumn
        DataBinding.FieldName = 'ParentProgram'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Hidden = True
      end
      object GridTreatmentsDBTableViewDescription: TcxGridDBColumn
        DataBinding.FieldName = 'Description'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.DropDownListStyle = lsEditList
        Properties.DropDownSizeable = True
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'Description'
        Properties.ListColumns = <
          item
            Width = 240
            FieldName = 'Description'
          end>
        Properties.ListOptions.AnsiSort = True
        Properties.ListOptions.CaseInsensitive = True
        Properties.ListOptions.ColumnSorting = False
        Properties.ListOptions.GridLines = glHorizontal
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = HerdLookup.dsQueryFertTreatments
        Properties.PostPopupValueOnTab = True
        Properties.Revertable = True
        HeaderAlignmentVert = vaCenter
        Width = 240
      end
      object GridTreatmentsDBTableViewStartDay: TcxGridDBColumn
        Caption = 'Day'
        DataBinding.FieldName = 'StartDay'
        HeaderAlignmentVert = vaCenter
        SortIndex = 0
        SortOrder = soAscending
        Width = 68
      end
      object GridTreatmentsDBTableViewCode: TcxGridDBColumn
        Caption = 'Code (optional)'
        DataBinding.FieldName = 'Code'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentVert = vaCenter
        Width = 80
      end
    end
    object GridTreatmentsLevel: TcxGridLevel
      GridView = GridTreatmentsDBTableView
    end
  end
  object dxBarDockControl1: TdxBarDockControl [5]
    Left = 0
    Top = 275
    Width = 756
    Height = 3
    Align = dalBottom
    BarManager = BarManager
    Visible = False
  end
  inherited ActionList: TActionList
    Left = 354
    Top = 160
    inherited actHelp: TAction
      OnExecute = actHelpExecute
    end
    object actSave: TAction
      Caption = 'Save'
      ImageIndex = 8
      OnExecute = actSaveExecute
      OnUpdate = actSaveUpdate
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
            Item = dxBarLargeButton2
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
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Custom 1'
        DockControl = dxBarDockControl1
        DockedDockControl = dxBarDockControl1
        DockedLeft = 0
        DockedTop = 0
        FloatLeft = 416
        FloatTop = 654
        FloatClientWidth = 168
        FloatClientHeight = 130
        ItemLinks = <
          item
            Item = dxBarStatic1
            UserGlyph.Data = {00000000}
            Visible = True
          end>
        Name = 'Custom 1'
        OneOnRow = True
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        UseRestSpace = True
        Visible = False
        WholeRow = True
        BackgroundBitmap.Data = {00000000}
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 356
    Top = 128
    DockControlHeights = (
      0
      0
      42
      0)
    object dxBarColorCombo1: TdxBarColorCombo
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF000101A6
        000202B4000404E4FFFFFFFF000101A6000202B4000404E4FFFFFFFF000EF9A7
        0030FABC00C0FCE4FFFFFFFF0000F9A70000FABC0000FCE4FFFFFFFF000001A7
        000002BC000004E4FFFFFFFF000001A7000002BC000004E4FFFFFFFF000001A7
        000002BC000004E4FFFFFFFF000001A7000002BC000004E4FFFFFFFF000001A7
        000002BC000004E4FFFFFFFF0000F9A70000FABC0000FCE4FFFFFFFF000EF9A7
        0030FABC00C0FCE4FFFFFFFF000101A6000202B4000404E4FFFFFFFF000101A6
        000202B4000404E4FFFFFFFF5201F9075202FA075204FC07FFFFFFFF070056FF
        070072FF0700D2FFFFFFFFFFFF5207FFFF5207FFFF5207FFFFFF}
      Width = 100
      Color = clBlack
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'Sheet'
      Category = 0
      Enabled = False
      Hint = 'Sheet'
      Visible = ivAlways
      OnClick = dxBarLargeButton1Click
    end
    object dxBarStatic1: TdxBarStatic
      Category = 0
      Visible = ivAlways
      Width = 168
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = actSave
      Category = 0
      Width = 55
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 700
    Top = 4
    object NewRowStyle: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clBlue
    end
    object RowActiveStyle: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13789506
      TextColor = clHighlightText
    end
  end
end
