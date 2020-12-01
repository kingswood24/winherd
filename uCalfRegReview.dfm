object fmCalfRegReview: TfmCalfRegReview
  Left = 267
  Top = 151
  Width = 1074
  Height = 605
  Caption = 'Calf Registration Review'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object dbgRegCalves: TDBGridEh
    Left = 0
    Top = 132
    Width = 1066
    Height = 416
    Hint = 'Click on grid titles to sort grid data'
    Align = alClient
    DataSource = dsGridData
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = 'Verdana'
    FooterFont.Style = []
    HorzScrollBar.Tracking = True
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghClearSelection, dghRowHighlight]
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    TitleHeight = 30
    VertScrollBar.Tracking = True
    OnGetCellParams = dbgRegCalvesGetCellParams
    OnTitleClick = dbgRegCalvesTitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NatIDNum'
        Footers = <>
        Title.Caption = 'Nat ID Num'
        Title.Hint = 'Click to sort Nat ID Num by Ascending/Descending order'
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Width = 145
      end
      item
        EditButtons = <>
        FieldName = 'AnimalNo'
        Footers = <>
        Title.Caption = 'Animal No'
        Title.Hint = 'Click to sort Animal No by Ascending/Descending order'
        Width = 85
      end
      item
        EditButtons = <>
        FieldName = 'DateOfBirth'
        Footers = <>
        Title.Caption = 'Date of Birth'
        Width = 94
      end
      item
        EditButtons = <>
        FieldName = 'Sex'
        Footers = <>
        Width = 67
      end
      item
        EditButtons = <>
        FieldName = 'CBreedCode'
        Footers = <>
        Title.Caption = 'Breed Code'
        Width = 82
      end
      item
        EditButtons = <>
        FieldName = 'DamNatID'
        Footers = <>
        Title.Caption = 'Dam Nat ID Num'
        Width = 145
      end
      item
        EditButtons = <>
        FieldName = 'SireAnimalNo'
        Footers = <>
        Title.Caption = 'Sire No'
        Width = 85
      end
      item
        EditButtons = <>
        FieldName = 'Status'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'ActionDate'
        Footers = <>
        Title.Caption = 'Date'
      end
      item
        EditButtons = <>
        FieldName = 'EmailCount'
        Footers = <>
        Title.Caption = 'Email Count'
        Width = 84
      end
      item
        EditButtons = <>
        FieldName = 'CardReceived'
        Footers = <>
        Title.Caption = 'Card Received'
        Width = 65
        OnUpdateData = dbgRegCalvesColumns10UpdateData
      end>
  end
  object Dock971: TDock97
    Left = 0
    Top = 0
    Width = 1066
    Height = 52
    object Toolbar971: TToolbar97
      Left = 0
      Top = 0
      Caption = 'Toolbar971'
      DockPos = 0
      FullSize = True
      TabOrder = 0
      object sbExit: TRxSpeedButton
        Left = 0
        Top = 0
        Width = 53
        Height = 48
        Hint = 'Exit from Calf Registration Review'
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Caption = 'Exit'
        Flat = True
        OnClick = sbExitClick
      end
      object ToolbarSep971: TToolbarSep97
        Left = 287
        Top = 0
      end
      object ToolbarSep973: TToolbarSep97
        Left = 589
        Top = 0
        Visible = False
      end
      object sbPreview: TRxSpeedButton
        Left = 59
        Top = 0
        Width = 80
        Height = 48
        Hint = 'Clear the filter selection'
        Caption = 'Preview'
        Flat = True
        OnClick = sbPreviewClick
      end
      object ToolbarSep975: TToolbarSep97
        Left = 53
        Top = 0
      end
      object sbUnRegCalf: TRxSpeedButton
        Left = 145
        Top = 0
        Width = 142
        Height = 48
        Hint = 'Clear the filter selection'
        Caption = 'DeRegister Calf '
        Flat = True
        OnClick = sbUnRegCalfClick
      end
      object ToolbarSep972: TToolbarSep97
        Left = 139
        Top = 0
      end
      object DBNavigator1: TDBNavigator
        Left = 293
        Top = 0
        Width = 296
        Height = 48
        DataSource = dsGridData
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Align = alLeft
        Flat = True
        TabOrder = 0
      end
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 52
    Width = 1066
    Height = 80
    Align = alTop
    Caption = 'Filter:'
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 45
      Width = 89
      Height = 16
      Caption = 'Date of Birth '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 104
      Top = 45
      Width = 38
      Height = 16
      Caption = 'From'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 270
      Top = 45
      Width = 17
      Height = 16
      Caption = 'To'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object sbDOBFilter: TRxSpeedButton
      Left = 418
      Top = 28
      Width = 75
      Height = 43
      Caption = 'Apply Dates'
      Layout = blGlyphRight
      WordWrap = True
      OnClick = sbDOBFilterClick
    end
    object FromDate: TDateEdit
      Left = 144
      Top = 39
      Width = 121
      Height = 23
      Hint = 'Only animals born on or after this date will be shown'
      NumGlyphs = 2
      TabOrder = 0
    end
    object ToDate: TDateEdit
      Left = 290
      Top = 39
      Width = 121
      Height = 23
      Hint = 'Only animals born on or before this date will be shown.'
      NumGlyphs = 2
      TabOrder = 1
    end
    object cbAllCalves: TCheckBox
      Left = 6
      Top = 19
      Width = 375
      Height = 17
      Hint = 
        '|This option will show all calves registered with Bandon regardl' +
        'ess of whether a card has been received'
      Alignment = taLeftJustify
      Caption = 'Show All Registered Calves (with or without Cards)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = cbAllCalvesClick
    end
    object GroupBox2: TGroupBox
      Left = 502
      Top = 9
      Width = 339
      Height = 64
      Caption = 'Cards in total:'
      TabOrder = 3
      object Label6: TLabel
        Left = 10
        Top = 29
        Width = 66
        Height = 16
        Caption = 'Received'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 154
        Top = 29
        Width = 89
        Height = 16
        Caption = 'Outstanding'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object eReceived: TEdit
        Left = 80
        Top = 27
        Width = 65
        Height = 24
        Hint = 'Total number of animals with cards received'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object eOutstanding: TEdit
        Left = 245
        Top = 27
        Width = 65
        Height = 24
        Hint = 'Total number of animals not yet received cards'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 548
    Width = 1066
    Height = 23
    Panels = <
      item
        Width = 210
      end
      item
        Width = 0
      end
      item
        Width = 170
      end
      item
        Style = psOwnerDraw
        Width = 50
      end>
    SimplePanel = False
    OnDrawPanel = StatusBar1DrawPanel
  end
  object dsGridData: TDataSource
    DataSet = TempTable
    Left = 72
    Top = 454
  end
  object TempTable: TTable
    DatabaseName = 'Kingswd'
    TableName = 'RegCalves.DB'
    Left = 44
    Top = 454
    object TempTableID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object TempTableCalfID: TIntegerField
      FieldName = 'CalfID'
    end
    object TempTableNatIDNum: TStringField
      FieldName = 'NatIDNum'
    end
    object TempTableSortNatID: TStringField
      FieldName = 'SortNatID'
    end
    object TempTableAnimalNo: TStringField
      FieldName = 'AnimalNo'
      Size = 10
    end
    object TempTableSortAnimalNo: TStringField
      FieldName = 'SortAnimalNo'
      Size = 10
    end
    object TempTableDateOfBirth: TDateField
      FieldName = 'DateOfBirth'
    end
    object TempTableColour: TStringField
      FieldName = 'Colour'
      Size = 30
    end
    object TempTableCBreed: TStringField
      FieldName = 'CBreed'
      Size = 30
    end
    object TempTableCBreedCode: TStringField
      FieldName = 'CBreedCode'
      Size = 6
    end
    object TempTableSex: TStringField
      FieldName = 'Sex'
      Size = 10
    end
    object TempTableCardReceived: TBooleanField
      FieldName = 'CardReceived'
      OnChange = TempTableCardReceivedChange
      DisplayValues = 'ü;'
    end
    object TempTableDamNatID: TStringField
      FieldName = 'DamNatID'
    end
    object TempTableSireAnimalNo: TStringField
      FieldName = 'SireAnimalNo'
    end
    object TempTableRecModified: TBooleanField
      FieldName = 'RecModified'
    end
    object TempTableRegisteredWithBandon: TBooleanField
      FieldName = 'RegisteredWithBandon'
    end
    object TempTableStatus: TIntegerField
      FieldName = 'Status'
      OnGetText = TempTableStatusGetText
    end
    object TempTableEmailCount: TStringField
      FieldName = 'EmailCount'
      Size = 3
    end
    object TempTableActionDate: TDateField
      FieldName = 'ActionDate'
    end
  end
  object dxMemData1: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 278
    Top = 194
  end
end
