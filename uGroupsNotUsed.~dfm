inherited fmGroupsNotUsed: TfmGroupsNotUsed
  Width = 485
  Height = 524
  Caption = 'Groups Not Used'
  Font.Height = -13
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 17
  inherited StatusBar: TdxStatusBar
    Top = 473
    Width = 477
  end
  object pInfo: TPanel [1]
    Left = 0
    Top = 49
    Width = 477
    Height = 68
    Align = alTop
    Color = clInfoBk
    TabOrder = 5
    object lInfo: TcxLabel
      Left = 1
      Top = 1
      Align = alClient
      Caption = 
        'The groups below are not being used i.e. there are no animals in' +
        ' the group.'#13#10#13#10'Click the Deleted Selected button above to delete' +
        ' all selected groups'
      ParentColor = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.BorderColor = clInfoBk
      Style.Color = clInfoBk
      Style.TextColor = clNavy
    end
  end
  object GroupsNotUsedGrid: TcxGrid [2]
    Left = 0
    Top = 117
    Width = 477
    Height = 356
    Align = alClient
    TabOrder = 6
    LookAndFeel.Kind = lfFlat
    object GroupsNotUsedGridDBTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '0'
          Kind = skCount
          FieldName = 'ID'
          Column = GroupsNotUsedGridDBTableViewSelected
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      OptionsView.Indicator = True
      object GroupsNotUsedGridDBTableViewSelected: TcxGridDBColumn
        DataBinding.FieldName = 'Selected'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.NullStyle = nssUnchecked
        HeaderAlignmentVert = vaCenter
        MinWidth = 60
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 60
      end
      object GroupsNotUsedGridDBTableViewGroupCode: TcxGridDBColumn
        Caption = 'Code'
        DataBinding.FieldName = 'GroupCode'
        HeaderAlignmentVert = vaCenter
        MinWidth = 100
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 100
      end
      object GroupsNotUsedGridDBTableViewGroupDesc: TcxGridDBColumn
        Caption = 'Description'
        DataBinding.FieldName = 'GroupDesc'
        HeaderAlignmentVert = vaCenter
        MinWidth = 200
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 200
      end
      object GroupsNotUsedGridDBTableViewGroupType: TcxGridDBColumn
        Caption = 'Type'
        DataBinding.FieldName = 'GroupType'
        HeaderAlignmentVert = vaCenter
        MinWidth = 80
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 80
      end
    end
    object GroupsNotUsedGridLevel: TcxGridLevel
      GridView = GroupsNotUsedGridDBTableView
    end
  end
  inherited ActionList: TActionList
    Left = 419
    Top = 10
    object actDeleteSelected: TAction
      Caption = 'Delete '#13#10'Selected'
      ImageIndex = 21
      OnExecute = actDeleteSelectedExecute
    end
    object actSelectAll: TAction
      Caption = 'Select All'
      ImageIndex = 39
      OnExecute = actSelectAllExecute
    end
    object actDeselectAll: TAction
      Caption = 'Deselect All'
      ImageIndex = 40
      OnExecute = actDeselectAllExecute
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
            Item = blbSave
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbSelectDeSelectAll
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
    Left = 387
    Top = 10
    DockControlHeights = (
      0
      0
      49
      0)
    object blbSave: TdxBarLargeButton
      Action = actDeleteSelected
      Category = 0
      Height = 45
      Width = 85
    end
    object blbSelectDeSelectAll: TdxBarLargeButton
      Action = actSelectAll
      Category = 0
      Height = 45
      Width = 65
    end
  end
end
