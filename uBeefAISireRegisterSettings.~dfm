inherited fmBeefAISireRegisterSettings: TfmBeefAISireRegisterSettings
  Width = 468
  Height = 318
  Caption = 'Beef AI Sire Register Settings'
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 267
    Width = 460
  end
  object cxGroupBox1: TcxGroupBox [1]
    Left = 18
    Top = 54
    Caption = 'Settings'
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 5
    Height = 193
    Width = 415
    object BeefAISireXYValueGrid: TcxGrid
      Left = 2
      Top = 16
      Width = 411
      Height = 175
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = True
      object BeefAISireXYValueGridDBTableView: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsMemData
        DataController.KeyFieldNames = 'RecId'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnHorzSizing = False
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Inserting = False
        OptionsView.DataRowHeight = 22
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 22
        OptionsView.Indicator = True
        OptionsView.IndicatorWidth = 15
        object BeefAISireXYValueGridDBTableViewItem: TcxGridDBColumn
          DataBinding.FieldName = 'Item'
          HeaderAlignmentVert = vaCenter
          Options.Editing = False
          Options.Focusing = False
          Styles.Content = cxStyle1
          Width = 200
        end
        object BeefAISireXYValueGridDBTableViewData: TcxGridDBColumn
          DataBinding.FieldName = 'Data'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.Alignment.Horz = taRightJustify
          HeaderAlignmentVert = vaCenter
          Width = 120
        end
      end
      object BeefAISireXYValueGridLevel: TcxGridLevel
        GridView = BeefAISireXYValueGridDBTableView
      end
    end
  end
  inherited ActionList: TActionList
    Left = 2
    Top = 240
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
    Left = 32
    Top = 240
    DockControlHeights = (
      0
      0
      49
      0)
    inherited bClose: TdxBarLargeButton
      Hint = 'Click Close to exit and save any changes'
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 264
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clWindowText
    end
  end
  object MemData: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F020000001E000000010005004974656D0004000000
      030005004461746100}
    SortOptions = []
    Left = 418
    Top = 112
    object MemDataItem: TStringField
      FieldName = 'Item'
      Size = 30
    end
    object MemDataData: TIntegerField
      FieldName = 'Data'
    end
  end
  object dsMemData: TDataSource
    DataSet = MemData
    Left = 418
    Top = 82
  end
end
