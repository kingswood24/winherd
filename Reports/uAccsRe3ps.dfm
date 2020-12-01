object fmAccsReps: TfmAccsReps
  Left = 341
  Top = 240
  BorderStyle = bsDialog
  Caption = 'Livestock Accounts'
  ClientHeight = 292
  ClientWidth = 403
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel4: TBevel
    Left = 30
    Top = 152
    Width = 156
    Height = 59
    Shape = bsFrame
  end
  object Bevel3: TBevel
    Left = 212
    Top = 152
    Width = 156
    Height = 59
    Shape = bsFrame
  end
  object Bevel2: TBevel
    Left = 212
    Top = 75
    Width = 156
    Height = 59
    Shape = bsFrame
  end
  object Bevel1: TBevel
    Left = 30
    Top = 75
    Width = 156
    Height = 59
    Shape = bsFrame
  end
  object RxSpeedButton1: TRxSpeedButton
    Left = 34
    Top = 79
    Width = 149
    Height = 52
    Caption = 'Management Profit and Loss'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    WordWrap = True
    OnClick = RxSpeedButton1Click
  end
  object RxSpeedButton2: TRxSpeedButton
    Left = 216
    Top = 79
    Width = 149
    Height = 52
    Caption = 'Management Balance Sheet'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    WordWrap = True
    OnClick = RxSpeedButton2Click
  end
  object RxSpeedButton3: TRxSpeedButton
    Left = 33
    Top = 156
    Width = 130
    Height = 52
    Caption = 'Profit Monitor Financial Report'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    WordWrap = True
    OnClick = RxSpeedButton3Click
  end
  object RxSpeedButton4: TRxSpeedButton
    Left = 216
    Top = 156
    Width = 149
    Height = 52
    Caption = 'Standard Accounts Reports'
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    Layout = blGlyphRight
    ParentFont = False
    WordWrap = True
    OnClick = RxSpeedButton4Click
  end
  object Label1: TLabel
    Left = 19
    Top = 226
    Width = 364
    Height = 26
    Alignment = taCenter
    Caption = 
      'Note: Please ensure the accounting period date range matches the' +
      ' Livestock Inventory period date range.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object RxSpeedButton8: TRxSpeedButton
    Left = 163
    Top = 156
    Width = 20
    Height = 52
    DropDownMenu = PopupMenu1
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    WordWrap = True
    OnClick = RxSpeedButton3Click
  end
  object RxSpeedButton7: TRxSpeedButton
    Left = 188
    Top = 128
    Width = 29
    Height = 25
    OnClick = RxSpeedButton7Click
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 403
    Height = 52
    AutoSize = True
    ButtonHeight = 48
    ButtonWidth = 8
    Caption = 'ToolBar1'
    Color = clBtnFace
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    Indent = 1
    ParentColor = False
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 1
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsDivider
    end
    object Exit: TRxSpeedButton
      Left = 9
      Top = 0
      Width = 62
      Height = 48
      Caption = 'Exit'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F333333337F333301111111110333337F333333337F33330111111111
        0333337F3333333F7F333301111111B10333337F333333737F33330111111111
        0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
        0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
        0333337F377777337F333301111111110333337F333333337F33330111111111
        0333337FFFFFFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
      ParentFont = False
      Transparent = True
      WordWrap = True
      OnClick = ExitClick
    end
    object ToolButton2: TToolButton
      Left = 71
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsDivider
    end
    object Panel1: TPanel
      Left = 79
      Top = 0
      Width = 128
      Height = 48
      BevelOuter = bvNone
      TabOrder = 0
      object lHerdFarm: TLabel
        Left = 3
        Top = 3
        Width = 75
        Height = 13
        Caption = 'Herd &Identity'
        FocusControl = HerdCombo
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object HerdCombo: TRxDBLookupCombo
        Left = 2
        Top = 19
        Width = 121
        Height = 23
        Hint = 'Herd Drop Down List'
        DropDownAlign = daRight
        DropDownCount = 8
        DropDownWidth = 310
        DisplayEmpty = 'Select Herd'
        EmptyValue = '0'
        LookupField = 'ID'
        LookupDisplay = 'HerdIdentity;Name'
        LookupSource = WinData.dsHerdDefaults
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnCloseUp = HerdComboCloseUp
      end
    end
    object ToolButton4: TToolButton
      Left = 207
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object RxSpeedButton6: TRxSpeedButton
      Left = 215
      Top = 0
      Width = 96
      Height = 48
      Caption = 'Update Figures'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
        0000066666666666668888860000666666846668777780666666886668777788
        0000666666644668FF7780666666688668FF77880000666844444468F7F78066
        6888888868F7F7880000666486644668FF7780666886688668FF778800006664
        86846668F7F780666886886668F7F7880000666486666668FF77806668866666
        68FF778800006666666666688888806666666666688888880000000000006668
        FF7F70888888886668FF7F780000877777706666888886877777786666888886
        00008FBFBF7066666666668F7F7F78666666666600008BFBFB70666666666687
        F7F778666666666600008FBFBF7066666666668F7F7F78666666666600008BFB
        FB70666666666687F7F778666666666600008FBF000066666666668F7F888866
        6666666600008BFB7F86666666666687F77F86666666666600008FBF78666666
        6666668F7F786666666666660000888886666666666666888886666666666666
        0000}
      NumGlyphs = 2
      ParentFont = False
      Transparent = True
      WordWrap = True
      OnClick = RxSpeedButton6Click
    end
    object ToolButton3: TToolButton
      Left = 311
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object RxSpeedButton5: TRxSpeedButton
      Left = 319
      Top = 0
      Width = 66
      Height = 48
      Caption = 'Help'
      Enabled = False
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
        6666666666666666666666660000666666660066666666666666668866666666
        0000666666008506666666666666888886666666000066660087F75066666666
        668887F7886666660000660087FF8775066666668887FF877886666600006087
        FF8808775066666887FF8888778866660000658F88005087750666688F888888
        8778866600006588005555087750666888888888887788660000650055555550
        87750668888888888887788600006585555B35550870066878888F7888887886
        0000665855557BB5508066668788887FF888886600006665855335BB55006666
        68788778FF888866000066665855BBB355506666668788FFF788886600006666
        6585555555006666666878888888886600006666665855550066666666668788
        8888666600006666666585006666666666666878886666660000666666665066
        6666666666666688666666660000666666666666666666666666666666666666
        0000}
      NumGlyphs = 2
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
  end
  object pbCollectData: TProgressBar
    Left = 16
    Top = 264
    Width = 369
    Height = 17
    Min = 0
    Max = 100
    TabOrder = 1
    Visible = False
  end
  object NLAccs: TTable
    TableName = 'nlaccs.db'
    Left = 374
    Top = 64
  end
  object Groups: TTable
    TableName = 'groups.db'
    Left = 373
    Top = 106
  end
  object PopupMenu1: TPopupMenu
    Left = 374
    Top = 146
    object LivestockClassification1: TMenuItem
      Caption = 'Livestock Summary'
      OnClick = LivestockClassification1Click
    end
  end
end
