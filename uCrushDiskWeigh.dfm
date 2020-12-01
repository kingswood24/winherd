object fmCrushDiskWeigh: TfmCrushDiskWeigh
  Left = 313
  Top = 174
  ActiveControl = CrushGrid
  BorderStyle = bsDialog
  Caption = 'Crush Disk Weighings'
  ClientHeight = 524
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object CrushGrid: TDBGridEh
    Left = 0
    Top = 91
    Width = 628
    Height = 336
    Align = alClient
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = 'Verdana'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    OnDblClick = CrushGridDblClick
    OnGetCellParams = CrushGridGetCellParams
    Columns = <
      item
        EditButtons = <>
        FieldName = 'cfNatIDNum'
        Footers = <>
        Title.Caption = 'National ID Number'
        Width = 138
      end
      item
        EditButtons = <>
        FieldName = 'cfAnimalNo'
        Footers = <>
        Title.Caption = 'Animal No.'
        Width = 79
      end
      item
        DisplayFormat = '#.##Kg'
        EditButtons = <>
        FieldName = 'cfWeight'
        Footers = <>
        Title.Caption = 'Weight (Kg)'
        Width = 85
      end
      item
        DisplayFormat = 'dd/mm/yyyy'
        EditButtons = <>
        FieldName = 'cfWeighDate'
        Footers = <>
        Title.Caption = 'Weighing Date'
        Width = 100
      end
      item
        DropDownBox.ListSource = WinData.dsLookupGroups
        EditButtons = <>
        FieldName = 'PenName'
        Footers = <>
        LookupDisplayFields = 'Description'
        Width = 192
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 628
    Height = 56
    ButtonHeight = 49
    ButtonWidth = 86
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Width = 9
      Caption = 'ToolButton1'
      Style = tbsDivider
    end
    object sbExit: TRxSpeedButton
      Left = 9
      Top = 2
      Width = 75
      Height = 49
      Hint = 'Close Livestock Reconciliation'
      Caption = 'E&xit'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbExitClick
    end
    object ToolButton2: TToolButton
      Left = 84
      Top = 2
      Width = 5
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsDivider
    end
    object sbLoad: TRxSpeedButton
      Left = 89
      Top = 2
      Width = 96
      Height = 49
      Caption = 'Read File'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbLoadClick
    end
    object ToolButton4: TToolButton
      Left = 185
      Top = 2
      Width = 5
      Caption = 'ToolButton4'
      ImageIndex = 1
      Style = tbsDivider
    end
    object sbRecord: TRxSpeedButton
      Left = 190
      Top = 2
      Width = 99
      Height = 49
      Hint = 
        'Print/View '#13#10'--------------------------------------------------'#13 +
        #10'1) Animals not found'#13#10'2) Animals not searched'#13#10'3) Animals found'
      Caption = 'Record'
      Enabled = False
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbRecordClick
    end
    object ToolButton3: TToolButton
      Left = 289
      Top = 2
      Width = 5
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsDivider
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 505
    Width = 628
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object Panel2: TPanel
    Left = 0
    Top = 56
    Width = 628
    Height = 35
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object Label4: TLabel
      Left = 276
      Top = 9
      Width = 76
      Height = 16
      Caption = 'Select Pen '
    end
    object Pen: TRxDBLookupCombo
      Left = 352
      Top = 6
      Width = 257
      Height = 23
      DropDownCount = 8
      DisplayEmpty = '<Add New Pen>'
      EmptyValue = '0'
      LookupField = 'ID'
      LookupDisplay = 'Description'
      LookupSource = WinData.dsLookupGroups
      TabOrder = 0
      OnCloseUp = PenCloseUp
    end
    object cbEditData: TDBCheckBoxEh
      Left = 16
      Top = 8
      Width = 97
      Height = 17
      Caption = 'Edit File Data'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TabStop = True
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnClick = cbEditDataClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 427
    Width = 628
    Height = 78
    Align = alBottom
    TabOrder = 4
    object Bevel4: TBevel
      Left = 1
      Top = 1
      Width = 626
      Height = 30
      Align = alTop
      Shape = bsFrame
    end
    object Bevel6: TBevel
      Left = 137
      Top = 4
      Width = 12
      Height = 25
      Shape = bsLeftLine
    end
    object Label1: TLabel
      Left = 13
      Top = 9
      Width = 39
      Height = 13
      Caption = 'On File'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 150
      Top = 9
      Width = 54
      Height = 13
      Caption = 'Recorded'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 289
      Top = 4
      Width = 12
      Height = 25
      Shape = bsLeftLine
    end
    object Label2: TLabel
      Left = 295
      Top = 7
      Width = 184
      Height = 13
      Caption = '* Animals not found in database'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Edit1: TEditEx
      Left = 61
      Top = 8
      Width = 57
      Height = 17
      BorderStyle = bsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = 'Edit1'
      Alignment = taRightJustify
    end
    object Edit2: TEditEx
      Left = 213
      Top = 8
      Width = 57
      Height = 17
      BorderStyle = bsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = 'Edit1'
      Alignment = taRightJustify
    end
    object NavBar: TKwDBNavigator
      Left = 1
      Top = 34
      Width = 352
      Height = 42
      VisibleButtons = [kwnbFirst, kwnbPrior, kwnbNext, kwnbLast]
      Flat = True
      TabOrder = 2
    end
  end
  object Parser: TSPParser
    Sepchar = ','
    CharSearch = True
    Left = 432
    Top = 65532
  end
  object cwfOpen: TOpenDialog
    DefaultExt = '*.dat'
    Filter = 'All Files (*.*)|*.*|Text Files (*.txt)|*.txt'
    InitialDir = 'A:\'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Select Crush File'
    Left = 400
  end
  object CrushTable: TTable
    DatabaseName = 'Kingswd'
    TableName = 'tCrush'
    Left = 368
    object CrushTableID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object CrushTableAnimalID: TIntegerField
      FieldName = 'AnimalID'
    end
    object CrushTablecfNatIDNum: TStringField
      FieldName = 'cfNatIDNum'
    end
    object CrushTableSortNatID: TStringField
      FieldName = 'SortNatID'
    end
    object CrushTablecfAnimalNo: TStringField
      FieldName = 'cfAnimalNo'
      Size = 10
    end
    object CrushTablecfWeight: TFloatField
      FieldName = 'cfWeight'
    end
    object CrushTablecfWeighDate: TDateField
      FieldName = 'cfWeighDate'
    end
    object CrushTableRecorded: TBooleanField
      FieldName = 'Recorded'
    end
    object CrushTableLactNo: TIntegerField
      FieldName = 'LactNo'
    end
    object CrushTableHerdID: TIntegerField
      FieldName = 'HerdID'
    end
    object CrushTablePenID: TIntegerField
      FieldName = 'PenID'
    end
    object CrushTablePenname: TStringField
      FieldKind = fkLookup
      FieldName = 'Penname'
      LookupDataSet = WinData.LookupGroups
      LookupKeyFields = 'ID'
      LookupResultField = 'Description'
      KeyFields = 'PenID'
      Size = 30
      Lookup = True
    end
  end
  object GroupLinks: TTable
    BeforePost = GroupLinksBeforePost
    DatabaseName = 'Kingswd'
    IndexFieldNames = 'GroupID;AnimalID'
    TableName = 'GrpLinks.db'
    Left = 336
  end
end
