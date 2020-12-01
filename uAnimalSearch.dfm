inherited fmAnimalSearch: TfmAnimalSearch
  Left = 556
  Top = 303
  Width = 354
  Height = 438
  Caption = 'Animal Search'
  Font.Height = -13
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 17
  inherited StatusBar: TdxStatusBar
    Top = 387
    Width = 346
  end
  object pSearchHeader: TPanel [1]
    Left = 0
    Top = 49
    Width = 346
    Height = 98
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    object rgSearchBy: TcxRadioGroup
      Left = 0
      Top = 21
      Align = alTop
      Alignment = alCenterCenter
      Caption = 'Search By'
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = 'Animal Number'
        end
        item
          Caption = 'Part Nat. ID'
        end>
      Properties.OnChange = rgSearchByPropertiesChange
      Style.BorderStyle = ebsNone
      TabOrder = 1
      Height = 39
      Width = 346
    end
    object lSearchByHeader: TcxLabel
      Left = 0
      Top = 0
      Align = alTop
      Caption = '  Search By:'
      Properties.Alignment.Horz = taLeftJustify
      Properties.Alignment.Vert = taVCenter
    end
    object teSearchText: TcxTextEdit
      Left = 15
      Top = 60
      Properties.OnChange = teSearchTextPropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 0
      Text = 'teSearchText'
      Width = 302
    end
  end
  object AnimalSearchGrid: TcxGrid [2]
    Left = 0
    Top = 147
    Width = 346
    Height = 240
    Align = alClient
    TabOrder = 6
    object AnimalSearchGridDBTableView: TcxGridDBTableView
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
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object AnimalSearchGridDBTableViewAnimalNo: TcxGridDBColumn
        Caption = 'Animal No.'
        Visible = False
        Width = 125
      end
      object AnimalSearchGridDBTableViewNatIDNum: TcxGridDBColumn
        Caption = 'Nat ID Num.'
        Visible = False
        Width = 180
      end
      object AnimalSearchGridDBTableViewSortAnimalNo: TcxGridDBColumn
        Caption = 'Animal No'
        OnGetDisplayText = AnimalSearchGridDBTableViewSortAnimalNoGetDisplayText
        Width = 120
      end
      object AnimalSearchGridDBTableViewSortNatID: TcxGridDBColumn
        Caption = 'Nat. ID Num'
        OnGetDisplayText = AnimalSearchGridDBTableViewSortNatIDGetDisplayText
        Width = 180
      end
    end
    object AnimalSearchGridLevel: TcxGridLevel
      GridView = AnimalSearchGridDBTableView
    end
  end
  inherited ActionList: TActionList
    Left = 328
    object actSelect: TAction
      Caption = 'Select'
      ImageIndex = 8
      OnExecute = actSelectExecute
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
    Left = 296
    DockControlHeights = (
      0
      0
      49
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actSelect
      Category = 0
      Height = 45
      Width = 65
    end
  end
end
