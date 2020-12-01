inherited fmSireBreedDifferToCalfBreed: TfmSireBreedDifferToCalfBreed
  Left = 653
  Top = 240
  Width = 788
  Height = 402
  Caption = 'Sire Breed Inconsistent To Calf Breed'
  Font.Height = -13
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 17
  inherited StatusBar: TdxStatusBar
    Top = 351
    Width = 780
  end
  object pInfo: TPanel [1]
    Left = 0
    Top = 49
    Width = 780
    Height = 47
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    object lInfo: TcxLabel
      Left = 0
      Top = 0
      Align = alClient
      Caption = 
        'Below are a listing of calves to be registered with a sire breed' +
        ' inconsistent with the calf breed.'#13#10'Click on each calf, select t' +
        'he correct sire breed code in the drop-down-list at the bottom o' +
        'f the screen and then click Update.'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
    end
  end
  object AnimalGrid: TcxGrid [2]
    Left = 0
    Top = 96
    Width = 780
    Height = 168
    Align = alClient
    TabOrder = 6
    LookAndFeel.Kind = lfFlat
    object AnimalGridDBTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = AnimalGridDBTableViewFocusedRecordChanged
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
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Width = 120
      end
      object AnimalGridDBTableViewCalfNatID: TcxGridDBColumn
        Caption = 'Calf Nat ID.'
        DataBinding.FieldName = 'NatIDNum'
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Width = 170
      end
      object AnimalGridDBTableViewDateOfBirth: TcxGridDBColumn
        Caption = 'Birth Date'
        DataBinding.FieldName = 'DateOfBirth'
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Width = 120
      end
      object AnimalGridDBTableViewCalfBreed: TcxGridDBColumn
        Caption = 'Calf Breed'
        DataBinding.FieldName = 'BreedCode'
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Width = 100
      end
      object AnimalGridDBTableViewCalfSireCode: TcxGridDBColumn
        Caption = 'Sire'
        DataBinding.FieldName = 'SireNo'
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
        Width = 100
      end
      object AnimalGridDBTableViewSireBreed: TcxGridDBColumn
        Caption = 'Sire Breed'
        DataBinding.FieldName = 'SireBreedCode'
        Options.Editing = False
        Options.Filtering = False
        Width = 100
      end
      object AnimalGridDBTableViewSireID: TcxGridDBColumn
        DataBinding.FieldName = 'SireID'
        Visible = False
      end
    end
    object AnimalGridLevel: TcxGridLevel
      GridView = AnimalGridDBTableView
    end
  end
  object pFixCalves: TPanel [3]
    Left = 0
    Top = 264
    Width = 780
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 7
    object lChangeSireBreed: TcxLabel
      Left = 154
      Top = 13
      Caption = 'Change Sire Breed for Calf/Calves:'
    end
    object lcmboBreeds: TcxLookupComboBox
      Left = 361
      Top = 12
      Properties.ListColumns = <>
      Properties.OnChange = lcmboBreedsPropertiesChange
      Style.BorderStyle = ebsFlat
      TabOrder = 1
      Width = 100
    end
    object btnUpdate: TcxButton
      Left = 466
      Top = 11
      Width = 100
      Height = 25
      Action = actUpdate
      TabOrder = 2
      LookAndFeel.Kind = lfOffice11
    end
  end
  object Panel1: TPanel [4]
    Left = 0
    Top = 310
    Width = 780
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 8
    object lInfo2: TcxLabel
      Left = 0
      Top = 0
      Align = alClient
      Caption = 
        'NOTE: If more than one calf is showing for a sire, changing the ' +
        'sire breed of one calf and clicking Update will also '#13#10'update th' +
        'e sire breed of the other calf/calves.'
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
  end
  inherited ActionList: TActionList
    Left = 188
    Top = 10
    object actUpdate: TAction
      Caption = 'Update'
      OnExecute = actUpdateExecute
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
    Left = 158
    Top = 10
    DockControlHeights = (
      0
      0
      49
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'Save'
      Category = 0
      Visible = ivAlways
      Height = 45
      LargeImageIndex = 8
      Width = 65
    end
  end
end
