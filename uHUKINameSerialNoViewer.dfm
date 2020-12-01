object fmHUKINameSerialNoViewer: TfmHUKINameSerialNoViewer
  Left = 331
  Top = 137
  Width = 354
  Height = 576
  Caption = 'HUKI - Name Serial Number Viewer'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 346
    Height = 55
    ButtonHeight = 49
    ButtonWidth = 86
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    TabOrder = 0
    object ToolButton2: TToolButton
      Left = 0
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsDivider
    end
    object sbExit: TRxSpeedButton
      Left = 8
      Top = 2
      Width = 56
      Height = 49
      Hint = 'Click Here To Exit'
      Caption = 'E&xit'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        42040000424D4204000000000000420000002800000020000000100000000100
        1000030000000004000000000000000000000000000000000000007C0000E003
        00001F000000E03DE03D00000000000000000000000000000000000000000000
        E03DE03DE03DE03DE03DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DFF7FEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003CE07F003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DEF3DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DFF7FFF7FFF7FFF7FFF7FE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003CFF03FF03FF03FF03FF03003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DEF3DEF3DEF3DEF3DEF3DFF7FE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003CFF03FF03FF03FF03FF03003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DEF3DFF7FFF7FFF7FEF3DFF7FE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003CFF03FF03FF03FF03FF03003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DEF3DEF3DEF3DEF3DEF3DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FEF3D
        FF7FE03DE03DE03DE03D00000000000000000000000000000000000000000000
        E03DE03DE03DE03DE03DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D
        E03DE03DE03D}
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbExitClick
    end
    object ToolButton6: TToolButton
      Left = 64
      Top = 2
      Width = 4
      Caption = 'ToolButton6'
      ImageIndex = 5
      Style = tbsDivider
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 55
    Width = 346
    Height = 490
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.First.Visible = True
      NavigatorButtons.PriorPage.Visible = False
      NavigatorButtons.Prior.Visible = True
      NavigatorButtons.Next.Visible = True
      NavigatorButtons.NextPage.Visible = False
      NavigatorButtons.Last.Visible = True
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Delete.Visible = False
      NavigatorButtons.Edit.Visible = False
      NavigatorButtons.Post.Visible = False
      NavigatorButtons.Cancel.Visible = False
      NavigatorButtons.Refresh.Visible = False
      NavigatorButtons.SaveBookmark.Visible = False
      NavigatorButtons.GotoBookmark.Visible = False
      NavigatorButtons.Filter.Visible = False
      DataController.DataSource = DataSource1
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.KeyFieldNames = 'RecId'
      DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoSortByDisplayText]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = cxGrid1DBTableView1Name
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.FocusRect = False
      OptionsView.Navigator = True
      OptionsView.NavigatorOffset = 0
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      Preview.Visible = True
      object cxGrid1DBTableView1RecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
      end
      object cxGrid1DBTableView1Name: TcxGridDBColumn
        DataBinding.FieldName = 'Name'
        SortIndex = 0
        SortOrder = soAscending
        Width = 214
      end
      object cxGrid1DBTableView1SerialNo: TcxGridDBColumn
        Caption = 'Serial No'
        DataBinding.FieldName = 'SerialNo'
        Width = 67
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object XMLSerialNoData: TdxMemData
    Indexes = <>
    SortOptions = [soDesc]
    SortedField = 'Name'
    Left = 324
    Top = 146
    object XMLSerialNoDataName: TStringField
      FieldName = 'Name'
      Size = 40
    end
    object XMLSerialNoDataSerialNo: TIntegerField
      FieldName = 'SerialNo'
    end
  end
  object DataSource1: TDataSource
    DataSet = XMLSerialNoData
    Left = 324
    Top = 184
  end
end
