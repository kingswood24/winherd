inherited fmAnimalEventTransfer: TfmAnimalEventTransfer
  Left = 510
  Top = 215
  Width = 587
  Height = 409
  Caption = 'Animal Event Transfer'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox4: TcxGroupBox [0]
    Left = 26
    Top = 72
    Caption = 'Events for Animal: '
    Style.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 6
    Height = 249
    Width = 517
    object GridEvents: TcxGrid
      Left = 22
      Top = 22
      Width = 471
      Height = 177
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = False
      object GridEventsDBTableView: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        NavigatorButtons.First.Visible = True
        NavigatorButtons.PriorPage.Visible = True
        NavigatorButtons.Prior.Visible = True
        NavigatorButtons.Next.Visible = True
        NavigatorButtons.NextPage.Visible = True
        NavigatorButtons.Last.Visible = True
        NavigatorButtons.Insert.Visible = True
        NavigatorButtons.Delete.Visible = True
        NavigatorButtons.Edit.Visible = True
        NavigatorButtons.Post.Visible = True
        NavigatorButtons.Cancel.Visible = True
        NavigatorButtons.Refresh.Visible = True
        NavigatorButtons.SaveBookmark.Visible = True
        NavigatorButtons.GotoBookmark.Visible = True
        NavigatorButtons.Filter.Visible = True
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.DataRowHeight = 21
        OptionsView.GridLines = glHorizontal
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object GridEventsDBTableViewEventDate: TcxGridDBColumn
          Caption = 'Event Date'
          DataBinding.FieldName = 'EventDate'
          Width = 85
        end
        object GridEventsDBTableViewEventType: TcxGridDBColumn
          Caption = 'Event Type'
          DataBinding.FieldName = 'EventType'
          RepositoryItem = HerdLookup.erLookupEventTypes
          Width = 105
        end
        object GridEventsDBTableViewAnimalLactNo: TcxGridDBColumn
          Caption = 'Lact. No.'
          DataBinding.FieldName = 'AnimalLactNo'
          Width = 52
        end
        object GridEventsDBTableViewEventDesc: TcxGridDBColumn
          Caption = 'Comment'
          DataBinding.FieldName = 'EventDesc'
          Width = 194
        end
      end
      object GridEventsLevel: TcxGridLevel
        GridView = GridEventsDBTableView
      end
    end
    object cxButton4: TcxButton
      Left = 388
      Top = 206
      Width = 105
      Height = 25
      Caption = '<< Back'
      Default = True
      TabOrder = 1
      OnClick = cxButton4Click
      LookAndFeel.Kind = lfOffice11
    end
  end
  object gbTransferEvents: TcxGroupBox [1]
    Left = 26
    Top = 72
    Caption = 'Animal Event Transfer'
    Style.LookAndFeel.Kind = lfFlat
    Style.TextStyle = [fsBold]
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 5
    Height = 250
    Width = 517
    object cxButton1: TcxButton
      Left = 388
      Top = 206
      Width = 101
      Height = 25
      Caption = 'Transfer Events'
      Default = True
      TabOrder = 0
      OnClick = cxButton1Click
      LookAndFeel.Kind = lfOffice11
    end
    object cxGroupBox2: TcxGroupBox
      Left = 26
      Top = 26
      Caption = 'Select the animal to transfer the events from'
      Style.LookAndFeel.Kind = lfFlat
      Style.TextStyle = [fsBold]
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 1
      Height = 79
      Width = 463
      object cmboSoldAnimals: TcxLookupComboBox
        Left = 22
        Top = 40
        Properties.DropDownAutoSize = True
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownSizeable = True
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            Caption = 'Nat. Id. No.'
            FieldName = 'NatIDNum'
          end
          item
            Caption = 'Animal No.'
            FieldName = 'AnimalNo'
          end
          item
            Caption = 'Sex'
            FieldName = 'Sex'
          end
          item
            Caption = 'Date Of Birth'
            FieldName = 'DateOfBirth'
          end
          item
            Caption = 'Sale Date'
            FieldName = 'SaleDate'
          end
          item
            Caption = 'Purchase Date'
            FieldName = 'PurchDate'
          end>
        Properties.ListOptions.AnsiSort = True
        Properties.ListOptions.CaseInsensitive = True
        Properties.ListOptions.GridLines = glNone
        Properties.ListSource = dsSoldAnimals
        Properties.Revertable = True
        Properties.OnEditValueChanged = cmboSoldAnimalsPropertiesEditValueChanged
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 0
        Width = 341
      end
      object cxLabel1: TcxLabel
        Left = 20
        Top = 20
        Caption = 
          'Select from a list of animals that have been moved off your herd' +
          '. '
      end
      object btnViewEvents: TcxButton
        Left = 372
        Top = 38
        Width = 71
        Height = 23
        Caption = 'View events'
        Enabled = False
        TabOrder = 2
        OnClick = btnViewEventsClick
        LookAndFeel.Kind = lfOffice11
      end
    end
    object cxGroupBox3: TcxGroupBox
      Left = 26
      Top = 114
      Caption = 'Select the animal to transfer the events to'
      Style.LookAndFeel.Kind = lfFlat
      Style.TextStyle = [fsBold]
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 2
      Height = 81
      Width = 463
      object cmboInHerdAnimals: TcxLookupComboBox
        Left = 22
        Top = 40
        Properties.DropDownAutoSize = True
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownSizeable = True
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            Caption = 'Nat Id. No.'
            FieldName = 'NatIDNum'
          end
          item
            Caption = 'Animal No.'
            FieldName = 'AnimalNo'
          end
          item
            Caption = 'Sex'
            FieldName = 'Sex'
          end
          item
            Caption = 'Date Of Birth'
            FieldName = 'DateOfBirth'
          end
          item
            Caption = 'Purchase Date'
            FieldName = 'PurchDate'
          end>
        Properties.ListOptions.AnsiSort = True
        Properties.ListOptions.CaseInsensitive = True
        Properties.ListOptions.GridLines = glNone
        Properties.ListSource = dsInHerdAnimals
        Properties.Revertable = True
        Properties.OnEditValueChanged = cmboSoldAnimalsPropertiesEditValueChanged
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 0
        Width = 341
      end
      object cxLabel2: TcxLabel
        Left = 22
        Top = 20
        Caption = 'Select from a list of animals that are currently on your herd. '
      end
      object btnViewEvents2: TcxButton
        Left = 372
        Top = 38
        Width = 71
        Height = 23
        Caption = 'View events'
        Enabled = False
        TabOrder = 2
        OnClick = btnViewEvents2Click
        LookAndFeel.Kind = lfOffice11
      end
    end
  end
  inherited StatusBar: TdxStatusBar
    Top = 355
    Width = 579
  end
  inherited ActionList: TActionList
    Left = 213
    Top = 10
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
    Left = 183
    Top = 10
    DockControlHeights = (
      0
      0
      48
      0)
    inherited bClose: TdxBarLargeButton
      Height = 44
    end
  end
  object mdSoldAnimals: TdxMemData
    Indexes = <
      item
        FieldName = 'ID'
        SortOptions = []
      end
      item
        FieldName = 'NatIDNum'
        SortOptions = []
      end>
    SortOptions = []
    Left = 126
    Top = 10
    object mdSoldAnimalsID: TIntegerField
      FieldName = 'ID'
    end
    object mdSoldAnimalsAnimalNo: TStringField
      FieldName = 'AnimalNo'
      Size = 10
    end
    object mdSoldAnimalsSortAnimalNo: TStringField
      FieldName = 'SortAnimalNo'
      Size = 10
    end
    object mdSoldAnimalsNatIDNum: TStringField
      FieldName = 'NatIDNum'
    end
    object mdSoldAnimalsSortNatIDNum: TStringField
      FieldName = 'SortNatIDNum'
    end
    object mdSoldAnimalsSaleDate: TDateTimeField
      FieldName = 'SaleDate'
    end
    object mdSoldAnimalsPurchDate: TDateTimeField
      FieldName = 'PurchDate'
    end
    object mdSoldAnimalsLactNo: TIntegerField
      FieldName = 'LactNo'
    end
    object mdSoldAnimalsSex: TStringField
      FieldName = 'Sex'
      Size = 6
    end
    object mdSoldAnimalsDateOfBirth: TDateTimeField
      FieldName = 'DateOfBirth'
    end
  end
  object dsSoldAnimals: TDataSource
    DataSet = mdSoldAnimals
    Left = 154
    Top = 10
  end
  object mdInherdAnimals: TdxMemData
    Indexes = <
      item
        FieldName = 'ID'
        SortOptions = []
      end
      item
        FieldName = 'NatIDNum'
        SortOptions = []
      end>
    SortOptions = []
    Left = 243
    Top = 10
    object mdInherdAnimalsID: TIntegerField
      FieldName = 'ID'
    end
    object mdInherdAnimalsNatIDNum: TStringField
      FieldName = 'NatIDNum'
    end
    object mdInherdAnimalsSortNatID: TStringField
      FieldName = 'SortNatID'
    end
    object mdInherdAnimalsAnimalNo: TStringField
      FieldName = 'AnimalNo'
      Size = 10
    end
    object mdInherdAnimalsSortAnimalNo: TStringField
      FieldName = 'SortAnimalNo'
      Size = 10
    end
    object mdInherdAnimalsSex: TStringField
      FieldName = 'Sex'
      Size = 6
    end
    object mdInherdAnimalsDateOfBirth: TDateTimeField
      FieldName = 'DateOfBirth'
    end
    object mdInherdAnimalsPurchDate: TDateTimeField
      FieldName = 'PurchDate'
    end
    object mdInherdAnimalsLactNo: TIntegerField
      FieldName = 'LactNo'
    end
  end
  object dsInHerdAnimals: TDataSource
    DataSet = mdInherdAnimals
    Left = 272
    Top = 10
  end
end
