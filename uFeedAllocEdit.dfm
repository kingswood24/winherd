object fmFeedAllocEdit: TfmFeedAllocEdit
  Left = 430
  Top = 240
  BorderStyle = bsSingle
  Caption = 'Feed Allocation '
  ClientHeight = 329
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Bevel1: TBevel
    Left = 27
    Top = 77
    Width = 382
    Height = 224
    Shape = bsFrame
  end
  object Label3: TLabel
    Left = 74
    Top = 104
    Width = 100
    Height = 16
    Caption = 'Allocation Date'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object lNoDays: TLabel
    Left = 74
    Top = 256
    Width = 54
    Height = 16
    Caption = 'No Days'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 74
    Top = 180
    Width = 60
    Height = 16
    Caption = 'Qty/Cost'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label4: TLabel
    Left = 74
    Top = 142
    Width = 69
    Height = 16
    Caption = 'Feed Type'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label5: TLabel
    Left = 74
    Top = 218
    Width = 93
    Height = 16
    Caption = 'End Allocation'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 438
    Height = 53
    ButtonHeight = 47
    ButtonWidth = 86
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    TabOrder = 0
    object ToolButton3: TToolButton
      Left = 0
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsDivider
    end
    object sbExit: TRxSpeedButton
      Left = 8
      Top = 2
      Width = 58
      Height = 47
      Caption = 'E&xit'
      Flat = True
      NumGlyphs = 2
      OnClick = sbExitClick
    end
    object ToolButton2: TToolButton
      Left = 66
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsDivider
    end
    object Nav: TKwDBNavigator
      Left = 74
      Top = 2
      Width = 146
      Height = 47
      DataSource = WinData.dsFeedEvents
      VisibleButtons = [kwnbPost, kwnbCancel]
      Flat = True
      Ctl3D = False
      Captions.Strings = (
        '&Save'
        '&Cancel'
        '&Add'
        '&Delete'
        '')
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = NavClick
    end
    object ToolButton1: TToolButton
      Left = 220
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 2
      Style = tbsDivider
    end
    object sbHelp: TRxSpeedButton
      Left = 228
      Top = 2
      Width = 58
      Height = 47
      Caption = '&Help'
      Enabled = False
      Flat = True
    end
  end
  object DBDateEdit1: TDBDateEdit
    Left = 203
    Top = 100
    Width = 121
    Height = 24
    DataField = 'AllocDate'
    DataSource = WinData.dsFeedEvents
    NumGlyphs = 2
    TabOrder = 1
    OnChange = DBDateEdit1Change
  end
  object DBDateEdit2: TDBDateEdit
    Left = 203
    Top = 214
    Width = 121
    Height = 24
    DataField = 'EndDate'
    DataSource = WinData.dsFeedEvents
    NumGlyphs = 2
    TabOrder = 5
    OnChange = DBDateEdit2Change
  end
  object DBEdit1: TDBEdit
    Left = 203
    Top = 176
    Width = 70
    Height = 24
    DataField = 'QuantDay'
    DataSource = WinData.dsFeedEvents
    TabOrder = 3
    OnChange = DBEdit1Change
  end
  object FeedType: TRxDBLookupCombo
    Left = 203
    Top = 138
    Width = 151
    Height = 23
    DropDownCount = 6
    DropDownWidth = 300
    DataField = 'FeedType'
    DataSource = WinData.dsFeedEvents
    EmptyValue = '0'
    LookupField = 'ID'
    LookupDisplay = 'Name;Description'
    LookupSource = WinData.dsFeedTypes
    TabOrder = 2
    OnChange = FeedTypeChange
  end
  object DBEdit2: TDBEdit
    Left = 278
    Top = 176
    Width = 70
    Height = 24
    Color = 12639424
    DataField = 'CostDay'
    DataSource = WinData.dsFeedEvents
    ReadOnly = True
    TabOrder = 4
    OnChange = DBEdit2Change
  end
  object dbeNoDays: TDBEdit
    Left = 203
    Top = 252
    Width = 70
    Height = 24
    Color = 12639424
    DataField = 'NoDays'
    DataSource = WinData.dsFeedEvents
    ReadOnly = True
    TabOrder = 6
    OnChange = DBEdit2Change
  end
end
