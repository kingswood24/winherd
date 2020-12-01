object fMilkRecSysScr: TfMilkRecSysScr
  Left = 286
  Top = 146
  Width = 494
  Height = 517
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Monthly Summary Analysis'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnActivate = MilkRecDateExit
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 29
    Top = 81
    Width = 174
    Height = 14
    Caption = 'Select Milk Recording Month'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object rgMeasure2: TRadioGroup
    Left = 29
    Top = 346
    Width = 430
    Height = 35
    BiDiMode = bdRightToLeft
    Caption = 'Milk Recordings In '
    Columns = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Kilograms'
      'Gallons')
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 9
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1294
    Height = 53
    ButtonHeight = 47
    ButtonWidth = 86
    Color = clBtnFace
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    ParentColor = False
    TabOrder = 0
    object ToolButton2: TToolButton
      Left = 0
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsDivider
    end
    object sbExit: TRxSpeedButton
      Left = 8
      Top = 2
      Width = 57
      Height = 47
      Hint = 'Click Here To Exit'
      Caption = 'E&xit'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        42040000424D4204000000000000420000002800000020000000100000000100
        1000030000000004000000000000000000000000000000000000007C0000E003
        00001F000000E03DE03D00000000000000000000000000000000000000000000
        E03DE03DE03DE03DE03DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DFF7FEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003CE07F003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DEF3DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DFF7FFF7FFF7FFF7FFF7FE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003CFF03FF03FF03FF03FF03003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DEF3DEF3DEF3DEF3DEF3DFF7FE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003CFF03FF03FF03FF03FF03003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DEF3DFF7FFF7FFF7FEF3DFF7FE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003CFF03FF03FF03FF03FF03003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DEF3DEF3DEF3DEF3DEF3DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FEF3D
        FF7FE03DE03DE03DE03D00000000000000000000000000000000000000000000
        E03DE03DE03DE03DE03DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D
        E03DE03DE03D}
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbExitClick
    end
    object ToolButton1: TToolButton
      Left = 65
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 0
      Style = tbsDivider
    end
    object sbView: TRxSpeedButton
      Left = 73
      Top = 2
      Width = 62
      Height = 47
      Hint = 'View'
      Caption = '&View'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 1979867
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      Glyph.Data = {
        42040000424D4204000000000000420000002800000020000000100000000100
        1000030000000004000000000000000000000000000000000000007C0000E003
        00001F000000E03D000000000000000000000000000000000000000000000000
        0000E03DE03DE03DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D
        EF3DFF7FE03DE03D0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        0000E03DE03DE03DEF3DE03DFF7FE03DFF7FE03DFF7FE03DFF7FE03DFF7FE03D
        EF3DE03DE03DE03DE03D0000FF7F0000FF7F0000FF7F0000FF7F0000FF7F0000
        E03DE03DE03DE03DFF7FEF3DFF7FEF3DE03DEF3DE03DEF3DE03DEF3DE03DEF3D
        FF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
        00000000E03DEF3DEF3DEF3DEF3DE03DFF7FFF7FFF7FFF7FFF7FFF7FEF3DEF3D
        EF3DEF3DFF7F0000FF7FFF7FF75E0000000000000000000000000000F75EFF7F
        FF7F0000E03DEF3DFF7FE03DFF7FEF3DEF3DEF3DEF3DEF3DEF3DEF3DE03DFF7F
        FF7FEF3DFF7F0000FF7F007CFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
        00000000E03DEF3DFF7FEF3DE03DE03DE03DE03DE03DE03DE03DE03DEF3DEF3D
        EF3DEF3DFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7F0000E03DEF3DE03DFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FEF3DE03DE03D000000000000000000000000000000000000000000000000
        0000E03DE03DE03DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D
        EF3DE03DE03DE03DE03DE03D000000000000000000000000000000000000E03D
        E03DE03DE03DE03DE03DE03DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DFF7F
        E03DE03DE03DE03DE03DE03D0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000E03D
        E03DE03DE03DE03DE03DE03DEF3DFF7FE03DFF7FFF7FFF7FFF7FFF7FEF3DFF7F
        E03DE03DE03DE03DE03DE03D0000FF7F00000000000000000000FF7F0000E03D
        E03DE03DE03DE03DE03DE03DEF3DFF7FEF3DEF3DEF3DEF3DEF3DFF7FEF3DFF7F
        E03DE03DE03DE03DE03DE03D0000FF7F0000E003E003FF030000FF7F0000E03D
        E03DE03DE03DE03DE03DE03DEF3DFF7FEF3DFF7FE03DE03DEF3DFF7FEF3DFF7F
        E03DE03DE03DE03DE03DE03D0000FF7F00001F7CE0031F7C0000FF7F0000E03D
        E03DE03DE03DE03DE03DE03DEF3DFF7FEF3DFF7FFF7FFF7FEF3DFF7FEF3DFF7F
        E03DE03DE03DE03DE03DE03D0000FF7F00000000000000000000FF7F0000E03D
        E03DE03DE03DE03DE03DE03DEF3DFF7FEF3DEF3DEF3DEF3DEF3DE03DEF3DFF7F
        E03DE03DE03DE03DE03DE03D0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000E03D
        E03DE03DE03DE03DE03DE03DEF3DFF7FFF7FFF7FFF7FFF7FFF7FFF7FEF3DFF7F
        E03DE03DE03DE03DE03DE03D000000000000000000000000000000000000E03D
        E03DE03DE03DE03DE03DE03DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DE03D
        E03DE03DE03D}
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbViewClick
    end
    object sbPrint: TRxSpeedButton
      Left = 135
      Top = 2
      Width = 62
      Height = 47
      Hint = 'Print'
      Caption = '&Print'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        42040000424D4204000000000000420000002800000020000000100000000100
        1000030000000004000000000000000000000000000000000000007C0000E003
        00001F0000000F3C0F3C0F3C0F3C0F3C0F3C0000000000000000000000000000
        0000000000000F3C0F3C0F3C0F3C0F3CFF7FEF3DEF3DEF3DEF3DEF3DEF3DEF3D
        EF3DEF3DEF3D0F3C0F3C0F3C0F3C000000000000FF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7F00000F3C0F3C0F3CFF7FEF3DEF3DEF3DFF7F0F3CFF7FFF7FFF7FFF7F
        0F3C0F3CEF3D0F3C0F3C000000000000FF7F0000FF7F0000000000000000FF7F
        FF7FFF7F00000F3CFF7FEF3DEF3DEF3DFF7FEF3DFF7FEF3DEF3DEF3DEF3D0F3C
        0F3C0F3CEF3D000000000000FF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7F0000EF3DEF3DEF3DFF7FEF3DFF7FEF3DFF7F0F3CFF7FFF7FFF7FFF7F
        FF7FFF7FEF3D0000FF7F0000FF7F0000FF7F0000FF7F00000000000000000000
        0000FF7F0000EF3DFF7FEF3DFF7FEF3DFF7FEF3DFF7FEF3DEF3DEF3DEF3DEF3D
        EF3D0F3CEF3D0000FF7F0000FF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7F0000EF3DFF7FEF3DFF7FEF3DFF7FEF3DFF7F0F3CFF7FFF7FFF7FFF7F
        FF7FFF7FEF3D0000FF7F0000FF7F0000FF7F0000FF7F00000000000000000000
        0000FF7F0000EF3DFF7FEF3DFF7FEF3DFF7FEF3DFF7FEF3DEF3DEF3DEF3DEF3D
        EF3D0F3CEF3D0000FF7F0000FF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7F0000EF3DFF7FEF3DFF7FEF3DFF7FEF3DFF7F0F3CFF7FFF7FFF7F0F3C
        0F3C0F3CEF3D0000FF7F0000FF7F0000FF7F0000FF7F000000000000FF7FFF7F
        FF7FFF7F0000EF3DFF7FEF3DFF7FEF3DFF7FEF3DFF7FEF3DEF3DEF3D0F3C0F3C
        FF7FFF7FEF3D0000FF7F0000FF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7F0000
        000000000000EF3DFF7FEF3DFF7FEF3DFF7FEF3DFF7F0F3CFF7FFF7F0F3CEF3D
        EF3DEF3DEF3D0000FF7F0000FF7F0000FF7F0000FF7F00000000FF7FFF7F0000
        FF7F00000F3CEF3DFF7FEF3DFF7FEF3DFF7FEF3DFF7FEF3DEF3D0F3C0F3CEF3D
        FF7FEF3D0F3C0000FF7F0000FF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7F0000
        00000F3C0F3CEF3DFF7FEF3DFF7FEF3DFF7FEF3DFF7FFF7FFF7FFF7FFF7FEF3D
        EF3D0F3C0F3C0000FF7F0000FF7F0000FF7F0000000000000000000000000000
        0F3C0F3C0F3CEF3DFF7FEF3DFF7FEF3DFF7FEF3DEF3DEF3DEF3DEF3DEF3DEF3D
        0F3C0F3C0F3C0000FF7F0000FF7F00000000000000000000000000000F3C0F3C
        0F3C0F3C0F3CEF3DFF7FEF3DFF7FEF3DEF3DEF3DEF3DEF3DEF3DEF3D0F3C0F3C
        0F3C0F3C0F3C0000FF7F00000000000000000000000000000F3C0F3C0F3C0F3C
        0F3C0F3C0F3CEF3DFF7FEF3DEF3DEF3DEF3DEF3DEF3DEF3D0F3C0F3C0F3C0F3C
        0F3C0F3C0F3C00000000000000000000000000000F3C0F3C0F3C0F3C0F3C0F3C
        0F3C0F3C0F3CEF3DEF3DEF3DEF3DEF3DEF3DEF3D0F3C0F3C0F3C0F3C0F3C0F3C
        0F3C0F3C0F3C}
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbViewClick
    end
    object ToolButton4: TToolButton
      Left = 197
      Top = 2
      Width = 7
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsDivider
    end
    object sbSortBy: TRxSpeedButton
      Left = 204
      Top = 2
      Width = 74
      Height = 47
      DropDownMenu = pmSort
      Caption = '&Sort Options'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object ToolButton3: TToolButton
      Left = 278
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsDivider
    end
    object sbHelp: TRxSpeedButton
      Left = 286
      Top = 2
      Width = 53
      Height = 47
      Hint = 'Click Here For Help'
      Caption = '&Help'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        DE030000424DDE03000000000000420000002800000016000000150000000100
        1000030000009C03000000000000000000000000000000000000007C0000E003
        00001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FBD775A6B5A6B5B6B9C73
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F5A6B
        11422D258C00CC000F003121554A9C73FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7F955207000B000F009008CB094F091300110050255A67FF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F734E06006D0090087208B2082C0A
        8D121412B9101500CF147B6FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F5A6B0700
        4C00900892087300EF09AD0E1113981BBE1ABD101300D135FE7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7F31460A008F0892085308F308AC0EED0E52133B1B3F1E3F15
        D60868015967FF7FFF7FFF7FFF7FFF7FFF7FDE7B0C210F005108720813091209
        6F0ED00E55121E0DFF00BE00B700A901934EFF7FFF7FFF7FFF7FFF7FFF7FBD77
        AC1010002E09AE09D00D5611381119115B08F724D24932562F5608464F3EFF7F
        FF7FFF7FFF7FFF7FFF7FDD7BAE106D018A0E2F0E57111A26FE2D9F21FD106B41
        806A407F407F8366F039FF7FFF7FFF7FFF7FBD77396718630D194B02CB0E0C13
        94239D43DF4A3F363E194F3D485E08770777465A3242FF7FFF7FFF7FFF7F7B6F
        9C73BD7734424902CC0A2D0FB423FE439F4B5F363E19F528913DD149CE492B2D
        185FFF7FFF7FFF7FFF7F9C73FF7FFF7F7B6B6A12CB0A0C0F0F17B627F9333727
        B4118845806A237B207BCC66DE7BFF7FFF7FFF7FFF7F9C73DE7B7B6F7B6F903A
        8A02EC0AAF0E530E30132E134E0A8A49826A237F207F0A77DE7BFF7FFF7FFF7F
        FF7F9C73FF7F9C739C739C739136AA02CF01B3084D0A0E0A9300AE396066037B
        237F007F3473FF7FFF7FFF7FFF7F9C73DE7B7B6F7B6F7B6F7B6BF6522E2A8C01
        AB018D01B0000A124856A072247F227F04777A73FF7FFF7FFF7F9C73DE7B7B6F
        7B6F7B6F7B6F5A6B9C73D552B5529552524AD55A9C736B66E272237F207F0673
        BC7BFF7FFF7F9C73FF7F9C739C739C739C739C73DE7B39671767915A295A4362
        136B176B00620277207B207F5577FF7FFF7F9C73FF7F9C739C739C739C737B6F
        3967F75EB1624066207F427FE8720F46023DA372237B207F7577FF7FFF7F9C73
        FF7FFF7FFF7FFF7FFF7FDE7B5A6B3967BC776A62007F237F227F8066445A237B
        237B007B787BFF7FFF7F9C739C739C739C739C739C737B6F1867FF7FFF7F9C77
        EC72207F207F247F247F207F207B0F73FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FDE7F54770B77247F247F0A775477DE7FFF7FFF7F
        FF7F}
      ParentFont = False
    end
    object ToolButton5: TToolButton
      Left = 339
      Top = 2
      Width = 5
      Caption = 'ToolButton5'
      ImageIndex = 2
      Style = tbsDivider
    end
    object Panel1: TPanel
      Left = 344
      Top = 2
      Width = 132
      Height = 47
      BevelOuter = bvNone
      TabOrder = 0
      object Label7: TLabel
        Left = 3
        Top = 2
        Width = 87
        Height = 16
        Caption = 'Herd I&dentity'
        FocusControl = HerdCombo
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object HerdCombo: TRxDBLookupCombo
        Left = 4
        Top = 20
        Width = 113
        Height = 23
        DropDownCount = 8
        EmptyValue = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        LookupField = 'ID'
        LookupDisplay = 'HerdIdentity'
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object MilkRecDate: TRxDBLookupCombo
    Left = 29
    Top = 99
    Width = 145
    Height = 23
    DropDownCount = 8
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    LookupField = 'RecordingDate'
    LookupDisplay = 'RecordingDate'
    LookupSource = dsMilkRecDate
    ParentFont = False
    TabOrder = 1
    OnExit = MilkRecDateExit
  end
  object rgType: TRadioGroup
    Left = 29
    Top = 129
    Width = 430
    Height = 38
    Caption = 'Include '
    Columns = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    Items.Strings = (
      '&Whole Herd'
      '&Select By Batch')
    ParentFont = False
    TabOrder = 2
    OnClick = rgTypeClick
  end
  object Groups: TRxDBGrid
    Left = 29
    Top = 169
    Width = 430
    Height = 124
    Hint = 'Double Click To Select/Deselect Group'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = GroupsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Selected'
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Wingdings'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'ü'
        Title.Font.Charset = SYMBOL_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = 15
        Title.Font.Name = 'Wingdings'
        Title.Font.Style = []
        Width = 30
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Code'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 56
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 304
        Visible = True
      end>
  end
  object rgMeasure: TRadioGroup
    Left = 29
    Top = 294
    Width = 430
    Height = 52
    BiDiMode = bdRightToLeft
    Caption = 'Select Reporting Criteria:'
    Columns = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'Yield'
      'Butter Fat %'
      'Protein %'
      'Solids')
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 4
  end
  object gbRepTypes: TGroupBox
    Left = 29
    Top = 381
    Width = 430
    Height = 63
    Caption = 'Summary Report By'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object cbLact: TCheckBox
      Left = 20
      Top = 19
      Width = 129
      Height = 17
      Caption = 'Lactation'
      TabOrder = 0
    end
    object cbCalvingMonth: TCheckBox
      Left = 20
      Top = 39
      Width = 130
      Height = 17
      Caption = 'Calving Month'
      TabOrder = 1
    end
    object cbDailyYield: TCheckBox
      Left = 189
      Top = 19
      Width = 122
      Height = 17
      Caption = 'Daily Yield'
      TabOrder = 2
    end
    object cbMilkRecRpt: TCheckBox
      Left = 189
      Top = 39
      Width = 214
      Height = 17
      Caption = 'Detailed Monthly Comparsion'
      TabOrder = 3
    end
  end
  object pbMilk: TProgressBar
    Left = 29
    Top = 449
    Width = 430
    Height = 21
    Min = 0
    Max = 100
    Smooth = True
    Step = 1
    TabOrder = 6
  end
  object Panel3: TPanel
    Left = 229
    Top = 81
    Width = 229
    Height = 45
    BevelInner = bvSpace
    BevelOuter = bvLowered
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    object Label2: TLabel
      Left = 7
      Top = 6
      Width = 114
      Height = 28
      Caption = 'No. Lactation'#39's In Summary Report'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object seNumLact: TRxSpinEdit
      Left = 139
      Top = 9
      Width = 49
      Height = 24
      MaxValue = 10
      MinValue = 3
      Value = 6
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
    end
  end
  object qrMilkRep1: TQuickRep
    Left = 171
    Top = 539
    Width = 1123
    Height = 794
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poLandscape
    Page.PaperSize = A4
    Page.Values = (
      100
      2100
      100
      2970
      100
      100
      0)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object QRBand7: TQRBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 134
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        354.541666666667
        2770.1875)
      BandType = rbTitle
      object QRLabel281: TQRLabel
        Left = 28
        Top = 34
        Width = 37
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          74.0833333333333
          89.9583333333333
          97.8958333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Name:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel282: TQRLabel
        Left = 28
        Top = 54
        Width = 84
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          74.0833333333333
          142.875
          222.25)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Client Number:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel283: TQRLabel
        Left = 28
        Top = 94
        Width = 30
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          74.0833333333333
          248.708333333333
          79.375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Year:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel284: TQRLabel
        Left = 28
        Top = 74
        Width = 39
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          74.0833333333333
          195.791666666667
          103.1875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Month:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRSysData4: TQRSysData
        Left = 955
        Top = 13
        Width = 77
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2526.77083333333
          34.3958333333333
          203.729166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Page:'
        Transparent = False
        FontSize = 9
      end
      object QRLabel285: TQRLabel
        Left = 28
        Top = 4
        Width = 227
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.1458333333333
          74.0833333333333
          10.5833333333333
          600.604166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Summary of Lactation'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object lName1: TQRLabel
        Left = 70
        Top = 34
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          185.208333333333
          89.9583333333333
          119.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lName1'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lName2: TQRLabel
        Left = 192
        Top = 34
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          508
          89.9583333333333
          119.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lName2'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAdd1: TQRLabel
        Left = 294
        Top = 34
        Width = 34
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          777.875
          89.9583333333333
          89.9583333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lAdd1'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAdd2: TQRLabel
        Left = 394
        Top = 34
        Width = 34
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1042.45833333333
          89.9583333333333
          89.9583333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lAdd2'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAdd3: TQRLabel
        Left = 494
        Top = 34
        Width = 34
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1307.04166666667
          89.9583333333333
          89.9583333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lAdd3'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAdd4: TQRLabel
        Left = 594
        Top = 34
        Width = 34
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1571.625
          89.9583333333333
          89.9583333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lAdd4'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lMonth: TQRLabel
        Left = 72
        Top = 74
        Width = 40
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          190.5
          195.791666666667
          105.833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lMonth'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lYear: TQRLabel
        Left = 73
        Top = 94
        Width = 31
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          193.145833333333
          248.708333333333
          82.0208333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lYear'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 28
        Top = 112
        Width = 76
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          74.0833333333333
          296.333333333333
          201.083333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Reporting By;'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object lRecordIn: TQRLabel
        Left = 108
        Top = 112
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          285.75
          296.333333333333
          145.520833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lRecordIn'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object ChildBand1: TQRChildBand
      Left = 38
      Top = 172
      Width = 1047
      Height = 450
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = ChildBand1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1190.625
        2770.1875)
      ParentBand = QRBand7
      object QRLabel286: TQRLabel
        Left = 90
        Top = 46
        Width = 61
        Height = 29
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          76.7291666666667
          238.125
          121.708333333333
          161.395833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Lactation Number:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel287: TQRLabel
        Left = 226
        Top = 28
        Width = 68
        Height = 48
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          127
          597.958333333333
          74.0833333333333
          179.916666666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Number Of Cows And Hfrs.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel288: TQRLabel
        Left = 466
        Top = 10
        Width = 97
        Height = 50
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          132.291666666667
          1232.95833333333
          26.4583333333333
          256.645833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Average Yield Per Day Last Month'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel289: TQRLabel
        Left = 346
        Top = 10
        Width = 97
        Height = 50
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          132.291666666667
          915.458333333333
          26.4583333333333
          256.645833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Average Yield Per Day This Month'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel290: TQRLabel
        Left = 706
        Top = 10
        Width = 55
        Height = 50
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          132.291666666667
          1867.95833333333
          26.4583333333333
          145.520833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Mean Yield To Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel291: TQRLabel
        Left = 586
        Top = 10
        Width = 70
        Height = 50
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          132.291666666667
          1550.45833333333
          26.4583333333333
          185.208333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Mean Difference In Yield'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel292: TQRLabel
        Left = 826
        Top = 26
        Width = 94
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          89.9583333333333
          2185.45833333333
          68.7916666666667
          248.708333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Average Daily Yield To Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object l1: TQRLabel
        Left = 375
        Top = 59
        Width = 36
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          992.1875
          156.104166666667
          95.25)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(Gals)'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object l2: TQRLabel
        Left = 496
        Top = 59
        Width = 36
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1312.33333333333
          156.104166666667
          95.25)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(Gals)'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel295: TQRLabel
        Left = 611
        Top = 59
        Width = 21
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1616.60416666667
          156.104166666667
          55.5625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(%)'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object l3: TQRLabel
        Left = 716
        Top = 59
        Width = 36
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1894.41666666667
          156.104166666667
          95.25)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(Gals)'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object l4: TQRLabel
        Left = 851
        Top = 59
        Width = 36
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2251.60416666667
          156.104166666667
          95.25)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(Gals)'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lLact1: TQRLabel
        Left = 115
        Top = 87
        Width = 8
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          304.270833333333
          230.1875
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lLact2: TQRLabel
        Left = 115
        Top = 113
        Width = 8
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          304.270833333333
          298.979166666667
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '2'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lLact3: TQRLabel
        Left = 115
        Top = 139
        Width = 8
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          304.270833333333
          367.770833333333
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '3'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object llCowsHfrs1: TQRLabel
        Left = 261
        Top = 87
        Width = 8
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          690.5625
          230.1875
          21.1666666666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object llCowsHfrs2: TQRLabel
        Left = 261
        Top = 113
        Width = 8
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          690.5625
          298.979166666667
          21.1666666666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object llCowsHfrs3: TQRLabel
        Left = 261
        Top = 139
        Width = 8
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          690.5625
          367.770833333333
          21.1666666666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAYPDTM1: TQRLabel
        Left = 346
        Top = 87
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          915.458333333333
          230.1875
          256.645833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAYPDTM2: TQRLabel
        Left = 346
        Top = 113
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          915.458333333333
          298.979166666667
          256.645833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAYPDTM3: TQRLabel
        Left = 346
        Top = 139
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          915.458333333333
          367.770833333333
          256.645833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAYPDLM1: TQRLabel
        Left = 466
        Top = 87
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1232.95833333333
          230.1875
          256.645833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAYPDLM2: TQRLabel
        Left = 466
        Top = 113
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1232.95833333333
          298.979166666667
          256.645833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAYPDLM3: TQRLabel
        Left = 466
        Top = 139
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1232.95833333333
          367.770833333333
          256.645833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lMeanDiff1: TQRLabel
        Left = 586
        Top = 87
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1550.45833333333
          230.1875
          185.208333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lMeanDiff2: TQRLabel
        Left = 586
        Top = 113
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1550.45833333333
          298.979166666667
          185.208333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lMeanDiff3: TQRLabel
        Left = 586
        Top = 139
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1550.45833333333
          367.770833333333
          185.208333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lMeanToDate1: TQRLabel
        Left = 706
        Top = 87
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1867.95833333333
          230.1875
          145.520833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lMeanToDate2: TQRLabel
        Left = 706
        Top = 113
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1867.95833333333
          298.979166666667
          145.520833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lMeanToDate3: TQRLabel
        Left = 706
        Top = 139
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1867.95833333333
          367.770833333333
          145.520833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAvgDYield1: TQRLabel
        Left = 826
        Top = 87
        Width = 94
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2185.45833333333
          230.1875
          248.708333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAvgDYield2: TQRLabel
        Left = 826
        Top = 113
        Width = 94
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2185.45833333333
          298.979166666667
          248.708333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAvgDYield3: TQRLabel
        Left = 826
        Top = 139
        Width = 94
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2185.45833333333
          367.770833333333
          248.708333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape9: TQRShape
        Left = 23
        Top = 78
        Width = 1000
        Height = 3
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          7.9375
          60.8541666666667
          206.375
          2645.83333333333)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 0
        Top = 358
        Width = 1047
        Height = 3
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          7.9375
          0
          947.208333333333
          2770.1875)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel301: TQRLabel
        Left = 115
        Top = 396
        Width = 98
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          304.270833333333
          1047.75
          259.291666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Recorded'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lTotalAnimalsInMilk: TQRLabel
        Left = 231
        Top = 396
        Width = 69
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          611.1875
          1047.75
          182.5625)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAvgYPDayTM: TQRLabel
        Left = 346
        Top = 396
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          915.458333333333
          1047.75
          256.645833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAvgYPDayLM: TQRLabel
        Left = 466
        Top = 396
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1232.95833333333
          1047.75
          256.645833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lMeanDiff: TQRLabel
        Left = 586
        Top = 396
        Width = 65
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1550.45833333333
          1047.75
          171.979166666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lMeanToDate: TQRLabel
        Left = 706
        Top = 396
        Width = 65
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1867.95833333333
          1047.75
          171.979166666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAvgDailyYieldToDate: TQRLabel
        Left = 826
        Top = 396
        Width = 94
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2185.45833333333
          1047.75
          248.708333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lLact4: TQRLabel
        Left = 115
        Top = 165
        Width = 8
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          304.270833333333
          436.5625
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '4'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object llCowsHfrs4: TQRLabel
        Left = 261
        Top = 165
        Width = 8
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          690.5625
          436.5625
          21.1666666666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAYPDTM4: TQRLabel
        Left = 346
        Top = 165
        Width = 97
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          915.458333333333
          436.5625
          256.645833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAYPDLM4: TQRLabel
        Left = 466
        Top = 165
        Width = 97
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1232.95833333333
          436.5625
          256.645833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lMeanDiff4: TQRLabel
        Left = 586
        Top = 165
        Width = 70
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1550.45833333333
          436.5625
          185.208333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lMeanToDate4: TQRLabel
        Left = 706
        Top = 165
        Width = 55
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1867.95833333333
          436.5625
          145.520833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAvgDYield4: TQRLabel
        Left = 826
        Top = 165
        Width = 94
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2185.45833333333
          436.5625
          248.708333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lLact5: TQRLabel
        Left = 115
        Top = 191
        Width = 8
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          304.270833333333
          505.354166666667
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '5'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object llCowsHfrs5: TQRLabel
        Left = 261
        Top = 191
        Width = 8
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          690.5625
          505.354166666667
          21.1666666666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAYPDTM5: TQRLabel
        Left = 346
        Top = 191
        Width = 97
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          915.458333333333
          505.354166666667
          256.645833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAYPDLM5: TQRLabel
        Left = 466
        Top = 191
        Width = 97
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1232.95833333333
          505.354166666667
          256.645833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lMeanDiff5: TQRLabel
        Left = 586
        Top = 191
        Width = 70
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1550.45833333333
          505.354166666667
          185.208333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lMeanToDate5: TQRLabel
        Left = 706
        Top = 191
        Width = 55
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1867.95833333333
          505.354166666667
          145.520833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAvgDYield5: TQRLabel
        Left = 826
        Top = 191
        Width = 94
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2185.45833333333
          505.354166666667
          248.708333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lLact6: TQRLabel
        Left = 115
        Top = 217
        Width = 8
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          304.270833333333
          574.145833333333
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '6'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object llCowsHfrs6: TQRLabel
        Left = 261
        Top = 217
        Width = 8
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          690.5625
          574.145833333333
          21.1666666666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAYPDTM6: TQRLabel
        Left = 346
        Top = 217
        Width = 97
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          915.458333333333
          574.145833333333
          256.645833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAYPDLM6: TQRLabel
        Left = 466
        Top = 217
        Width = 97
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1232.95833333333
          574.145833333333
          256.645833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lMeanDiff6: TQRLabel
        Left = 586
        Top = 217
        Width = 70
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1550.45833333333
          574.145833333333
          185.208333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lMeanToDate6: TQRLabel
        Left = 706
        Top = 217
        Width = 55
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1867.95833333333
          574.145833333333
          145.520833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAvgDYield6: TQRLabel
        Left = 826
        Top = 217
        Width = 94
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2185.45833333333
          574.145833333333
          248.708333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lLact7: TQRLabel
        Left = 115
        Top = 243
        Width = 8
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          304.270833333333
          642.9375
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '7'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object llCowsHfrs7: TQRLabel
        Left = 261
        Top = 243
        Width = 8
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          690.5625
          642.9375
          21.1666666666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAYPDTM7: TQRLabel
        Left = 346
        Top = 243
        Width = 97
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          915.458333333333
          642.9375
          256.645833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAYPDLM7: TQRLabel
        Left = 466
        Top = 243
        Width = 97
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1232.95833333333
          642.9375
          256.645833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lMeanDiff7: TQRLabel
        Left = 586
        Top = 243
        Width = 70
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1550.45833333333
          642.9375
          185.208333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lMeanToDate7: TQRLabel
        Left = 706
        Top = 243
        Width = 55
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1867.95833333333
          642.9375
          145.520833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAvgDYield7: TQRLabel
        Left = 826
        Top = 243
        Width = 94
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2185.45833333333
          642.9375
          248.708333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lLact8: TQRLabel
        Left = 115
        Top = 269
        Width = 8
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          304.270833333333
          711.729166666667
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '8'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object llCowsHfrs8: TQRLabel
        Left = 261
        Top = 269
        Width = 8
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          690.5625
          711.729166666667
          21.1666666666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAYPDTM8: TQRLabel
        Left = 346
        Top = 269
        Width = 97
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          915.458333333333
          711.729166666667
          256.645833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAYPDLM8: TQRLabel
        Left = 466
        Top = 269
        Width = 97
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1232.95833333333
          711.729166666667
          256.645833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lMeanDiff8: TQRLabel
        Left = 586
        Top = 269
        Width = 70
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1550.45833333333
          711.729166666667
          185.208333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lMeanToDate8: TQRLabel
        Left = 706
        Top = 269
        Width = 55
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1867.95833333333
          711.729166666667
          145.520833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAvgDYield8: TQRLabel
        Left = 826
        Top = 269
        Width = 94
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2185.45833333333
          711.729166666667
          248.708333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lLact9: TQRLabel
        Left = 115
        Top = 295
        Width = 8
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          304.270833333333
          780.520833333333
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '9'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object llCowsHfrs9: TQRLabel
        Left = 261
        Top = 295
        Width = 8
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          690.5625
          780.520833333333
          21.1666666666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAYPDTM9: TQRLabel
        Left = 346
        Top = 295
        Width = 97
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          915.458333333333
          780.520833333333
          256.645833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAYPDLM9: TQRLabel
        Left = 466
        Top = 295
        Width = 97
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1232.95833333333
          780.520833333333
          256.645833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lMeanDiff9: TQRLabel
        Left = 586
        Top = 295
        Width = 70
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1550.45833333333
          780.520833333333
          185.208333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lMeanToDate9: TQRLabel
        Left = 706
        Top = 295
        Width = 55
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1867.95833333333
          780.520833333333
          145.520833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAvgDYield9: TQRLabel
        Left = 826
        Top = 295
        Width = 94
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2185.45833333333
          780.520833333333
          248.708333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lLact10: TQRLabel
        Left = 115
        Top = 321
        Width = 40
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          304.270833333333
          849.3125
          105.833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '10 or >'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object llCowsHfrs10: TQRLabel
        Left = 261
        Top = 321
        Width = 8
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          690.5625
          849.3125
          21.1666666666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAYPDTM10: TQRLabel
        Left = 346
        Top = 321
        Width = 97
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          915.458333333333
          849.3125
          256.645833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAYPDLM10: TQRLabel
        Left = 466
        Top = 321
        Width = 97
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1232.95833333333
          849.3125
          256.645833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lMeanDiff10: TQRLabel
        Left = 586
        Top = 321
        Width = 70
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1550.45833333333
          849.3125
          185.208333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lMeanToDate10: TQRLabel
        Left = 706
        Top = 321
        Width = 55
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1867.95833333333
          849.3125
          145.520833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAvgDYield10: TQRLabel
        Left = 826
        Top = 321
        Width = 94
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2185.45833333333
          849.3125
          248.708333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object PageFooterBand1: TQRBand
      Left = 38
      Top = 622
      Width = 1047
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        74.0833333333333
        2770.1875)
      BandType = rbPageFooter
      object QRLabel309: TQRLabel
        Left = 21
        Top = 4
        Width = 175
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          55.5625
          10.5833333333333
          463.020833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Kingswood Computing Ltd.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object VerLabel4: TQRLabel
        Left = 713
        Top = 4
        Width = 321
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1886.47916666667
          10.5833333333333
          849.3125)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Herd Management'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object cbFavourite: TcxCheckBox
    Left = 29
    Top = 54
    AutoSize = False
    Caption = 'Add Report As Favourite'
    ParentFont = False
    Properties.OnChange = cbFavouritePropertiesChange
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 10
    Height = 23
    Width = 213
  end
  object MyQuery: TQuery
    DatabaseName = 'Kingswd'
    Left = 486
    Top = 10
  end
  object qRecDate: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select Distinct ID, RecordingDate From MDT'
      'Where RecordingDate > : '
      'Order By RecordingDate Desc')
    Left = 163
    Top = 131
    ParamData = <
      item
        DataType = ftUnknown
        ParamType = ptUnknown
      end>
    object qRecDateID: TIntegerField
      FieldName = 'ID'
      Origin = 'KINGSWD."MDT.DB".ID'
    end
    object qRecDateRecordingDate: TDateField
      FieldName = 'RecordingDate'
      Origin = 'KINGSWD."MDT.DB".RecordingDate'
    end
  end
  object dsMilkRecDate: TDataSource
    DataSet = qRecDate
    Left = 191
    Top = 131
  end
  object qMilkSys: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * From TMilk')
    Left = 460
    Top = 117
  end
  object qHerdCount: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select Count(AnimalID) MACount'
      'From MilkDiskTrans'
      'Where DateOfRecording=:RecDate')
    Left = 460
    Top = 89
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'RecDate'
        ParamType = ptUnknown
      end>
  end
  object pmSort: TPopupMenu
    Left = 459
    Top = 61
    object AnimalNumber1: TMenuItem
      Caption = '&Animal No.'
      Checked = True
      GroupIndex = 1
      Hint = 'SortAnimalNo'
      RadioItem = True
      OnClick = NationalIDNumber1Click
    end
    object NationalIDNumber1: TMenuItem
      Caption = '&Sire No.'
      GroupIndex = 1
      Hint = 'SireNo'
      RadioItem = True
      OnClick = NationalIDNumber1Click
    end
    object LactationNumber1: TMenuItem
      Caption = '&Lactation No.'
      GroupIndex = 1
      Hint = 'lactno'
      RadioItem = True
      OnClick = NationalIDNumber1Click
    end
    object DateOfCalving1: TMenuItem
      Caption = '&Date Of Calving'
      GroupIndex = 1
      Hint = 'calvingdate'
      RadioItem = True
      OnClick = NationalIDNumber1Click
    end
    object DaysInMilk1: TMenuItem
      Caption = 'Days &In Milk'
      GroupIndex = 1
      Hint = 'daysinmilk'
      RadioItem = True
      OnClick = NationalIDNumber1Click
    end
    object CumulativeYield1: TMenuItem
      Caption = '&Cumulative Yield'
      GroupIndex = 1
      Hint = 'cumyield'
      RadioItem = True
      OnClick = NationalIDNumber1Click
    end
    object AvgYieldPerDay1: TMenuItem
      Caption = 'Avg Yield Per Day'
      GroupIndex = 1
      RadioItem = True
      OnClick = NationalIDNumber1Click
    end
    object N1: TMenuItem
      Caption = '-'
      GroupIndex = 1
    end
    object Ascending1: TMenuItem
      Caption = 'Ascending'
      Checked = True
      GroupIndex = 2
      Hint = 'asc'
      RadioItem = True
      OnClick = NationalIDNumber1Click
    end
    object Decending1: TMenuItem
      Caption = 'Decending'
      GroupIndex = 2
      Hint = 'desc'
      RadioItem = True
      OnClick = NationalIDNumber1Click
    end
  end
  object dsGroups: TDataSource
    DataSet = qGroups
    Left = 74
    Top = 217
  end
  object qGroups: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * From Grps where GroupType = "Feed"')
    Left = 46
    Top = 217
  end
  object LookupEvents: TTable
    DatabaseName = 'Kingswd'
    TableName = 'Events.DB'
    Left = 456
    Top = 203
  end
  object QRTextFilter1: TQRTextFilter
    Top = 243
  end
  object QRCSVFilter1: TQRCSVFilter
    Separator = ','
    Top = 275
  end
  object QRHTMLFilter1: TQRHTMLFilter
    Top = 307
  end
  object QRExcelFilter1: TQRExcelFilter
    Top = 339
  end
  object QRRTFFilter1: TQRRTFFilter
    Top = 371
  end
  object QRWMFFilter1: TQRWMFFilter
    Enhanced = False
    Top = 403
  end
  object qAnimals: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      ''
      '')
    Left = 368
    Top = 339
  end
end
