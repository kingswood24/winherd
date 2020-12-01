inherited fmBlockEventEdit: TfmBlockEventEdit
  Left = 900
  Top = 192
  Width = 931
  Height = 535
  Caption = 'Block Event Edit'
  Font.Height = -13
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 17
  inherited StatusBar: TdxStatusBar
    Top = 484
    Width = 923
  end
  object BlockEventEditGrid: TcxGrid [1]
    Left = 0
    Top = 125
    Width = 923
    Height = 359
    Align = alClient
    TabOrder = 5
    LookAndFeel.Kind = lfFlat
    object BlockEventEditGridDBTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object BlockEventEditGridDBTableViewSelected: TcxGridDBColumn
        DataBinding.FieldName = 'Selected'
        PropertiesClassName = 'TcxCheckBoxProperties'
        MinWidth = 30
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 30
      end
      object BlockEventEditGridDBTableViewNumAnimals: TcxGridDBColumn
        Caption = 'No. Of Animals'
        DataBinding.FieldName = 'NoAnimals'
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.ShowEditButtons = isebAlways
        Options.Grouping = False
        Options.Moving = False
        Width = 100
      end
      object BlockEventEditGridDBTableViewEventType: TcxGridDBColumn
        Caption = 'Event Type'
        DataBinding.FieldName = 'EventType'
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.ShowEditButtons = isebAlways
        Options.Grouping = False
        Options.Moving = False
        Width = 100
      end
      object BlockEventEditGridDBTableViewEventDate: TcxGridDBColumn
        Caption = 'Event Date'
        DataBinding.FieldName = 'EventDate'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.ShowEditButtons = isebAlways
        Options.Grouping = False
        Options.Moving = False
        Width = 100
      end
      object BlockEventEditGridDBTableViewEventDesc: TcxGridDBColumn
        Caption = 'Description'
        DataBinding.FieldName = 'EventDesc'
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.ShowEditButtons = isebAlways
        Options.Grouping = False
        Options.Moving = False
        Width = 150
      end
    end
    object BlockEventEditGridLevel: TcxGridLevel
      GridView = BlockEventEditGridDBTableView
    end
  end
  object gbFilterEvents: TcxGroupBox [2]
    Left = 0
    Top = 49
    Align = alTop
    Caption = 'Filter Events'
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    TabOrder = 6
    Height = 76
    Width = 923
    object lEventType: TcxLabel
      Left = 20
      Top = 30
      Caption = 'Event Type : '
    end
    object cmboEventType: TcxComboBox
      Left = 103
      Top = 29
      Properties.DropDownListStyle = lsFixedList
      TabOrder = 1
      Width = 121
    end
    object lFromDate: TcxLabel
      Left = 256
      Top = 30
      Caption = 'Date From:'
    end
    object deDateFrom: TcxDateEdit
      Left = 330
      Top = 29
      TabOrder = 3
      Width = 121
    end
    object lToDate: TcxLabel
      Left = 462
      Top = 30
      Caption = 'Date To:'
    end
    object deDateTo: TcxDateEdit
      Left = 522
      Top = 29
      TabOrder = 5
      Width = 121
    end
    object btnApplyFilter: TcxButton
      Left = 659
      Top = 24
      Width = 101
      Height = 31
      Action = actApplyFilter
      TabOrder = 6
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0041879B00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF001D6E850041879B00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF001D6E850091C3D20041879B00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF001D6E850091C3D2001D6E8500FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF001D6E850091C3D2001D6E8500FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF001D6E850091C3D20041879B001D6E
        8500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF001D6E850091C3D2005799AC00468DA1003A85
        99001D6E8500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF001D6E850091C3D20061A0B2005497AA00468DA1003A85
        99002A778C001D6E8500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF001D6E850091C3D20076AFC0005998AB003F8194003A8094003A85
        99002C7B9000217389001D6E8500FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF001D6E850097C7D50075ABBA003B77890047869C006FB1CD00117B9C002266
        79001E6376001E6B81001E6E84001D6E8500FF00FF00FF00FF00FF00FF00FF00
        FF001F6D83002673890046A5BC00A4FFFF0045D0FD008AD7FD0045A8E3000022
        AC001725AC00397092002B6E8200185C7000FF00FF00FF00FF00FF00FF00FF00
        FF006BA7B9002673890032A5CD00A4EBFB008AF5FD0045C5F6000022BF000000
        BE000000CC001725AC005D8E9C006BA7B900FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00AA521000586957004077870067C5F6001E4DD200191ECA000000
        D9000000DE000000C5008D8DD300FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00C0733100AC410000B74C00007E604C00412E99007084E800191E
        CA000000CF007171CF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0074474700DCA37200ECA54400AF6810009F7153003838C4003838
        C4008D8DDD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00B99E980097655400CBBABA00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      LookAndFeel.Kind = lfOffice11
    end
  end
  inherited ActionList: TActionList
    object actApplyFilter: TAction
      Caption = 'Apply Filter'
      ImageIndex = 34
      OnExecute = actApplyFilterExecute
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
    DockControlHeights = (
      0
      0
      49
      0)
  end
end
