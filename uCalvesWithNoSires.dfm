inherited fmCalvesNoSires: TfmCalvesNoSires
  Left = 587
  Top = 234
  Width = 722
  Caption = 'Calves With No Sire Selected'
  Font.Height = -13
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 17
  inherited StatusBar: TdxStatusBar
    Width = 714
  end
  object pInfo: TPanel [1]
    Left = 0
    Top = 49
    Width = 714
    Height = 84
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    object lInfo: TcxLabel
      Left = 0
      Top = 0
      Align = alClient
      Caption = 
        'Below are a listing of calves to be registered that do not have ' +
        'a sire selected.'#13#10'Please select the Calf Sire from the list prov' +
        'ided.'#13#10'If the Calf Sire is unknown then select the UNKNWN calf s' +
        'ire. This will create a sire with a breed based '#13#10'on the dam and' +
        ' calf breed.'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
    end
  end
  object AnimalGrid: TcxGrid [2]
    Left = 0
    Top = 133
    Width = 714
    Height = 200
    Align = alClient
    TabOrder = 6
    LookAndFeel.Kind = lfFlat
    object AnimalGridDBTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 25
      OptionsView.Indicator = True
      object AnimalGridDBTableViewCalfNumber: TcxGridDBColumn
        Caption = 'Calf Number'
        DataBinding.FieldName = 'AnimalNo'
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 120
      end
      object AnimalGridDBTableViewCalfNatID: TcxGridDBColumn
        Caption = 'Calf Nat ID.'
        DataBinding.FieldName = 'NatIDNum'
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 170
      end
      object AnimalGridDBTableViewDateOfBirth: TcxGridDBColumn
        Caption = 'Birth Date'
        DataBinding.FieldName = 'DateOfBirth'
        Width = 120
      end
      object AnimalGridDBTableViewCalfBreed: TcxGridDBColumn
        Caption = 'Calf Breed'
        DataBinding.FieldName = 'BreedName'
        Width = 160
      end
      object AnimalGridDBTableViewCalfSireCode: TcxGridDBColumn
        Caption = 'Calf Sire'
        DataBinding.FieldName = 'SireID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ListColumns = <>
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 100
      end
    end
    object AnimalGridLevel: TcxGridLevel
      GridView = AnimalGridDBTableView
    end
  end
  inherited ActionList: TActionList
    Left = 352
    Top = 10
    object actSave: TAction [0]
      Caption = 'Save'
      ImageIndex = 8
      OnExecute = actSaveExecute
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
    Left = 322
    Top = 10
    DockControlHeights = (
      0
      0
      49
      0)
    inherited bClose: TdxBarLargeButton
      Height = 45
      Width = 65
    end
    inherited bHelp: TdxBarLargeButton
      Height = 45
      Width = 65
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actSave
      Category = 0
      Height = 45
      Width = 65
    end
  end
end
