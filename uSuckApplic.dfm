object SuckApplic: TSuckApplic
  Left = 274
  Top = 217
  Width = 705
  Height = 575
  Caption = 'Suckler Premium Applications'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 697
    Height = 53
    ButtonHeight = 47
    ButtonWidth = 86
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
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
      Width = 58
      Height = 47
      Caption = 'E&xit'
      Flat = True
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
      ShowHint = False
      OnClick = sbExitClick
    end
    object ToolButton1: TToolButton
      Left = 66
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 0
      Style = tbsDivider
    end
    object sbSelect: TRxSpeedButton
      Left = 74
      Top = 2
      Width = 123
      Height = 47
      Caption = 'Select &Animals'
      Flat = True
      Glyph.Data = {
        42040000424D4204000000000000420000002800000020000000100000000100
        1000030000000004000000000000000000000000000000000000007C0000E003
        00001F000000E03DE03DE03DE03DE03DE03D0000E07FEF3DFF7FFF7FFF7FFF7F
        FF7FE07F0000E03DE03DE03DE03DE03DE03DEF3DEF3DEF3DFF7FE03DE03DE03D
        E03DEF3DEF3DE03DE03DE03DE03DE03DE03D0000E07FEF3DFF7FFF7FFF7FFF7F
        FF7FE07F0000E03DE03DE03DE03DE03DE03DEF3DEF3DEF3DFF7FE03DE03DE03D
        E03DEF3DEF3DE03DE03DE03DE03DE03DE03D0000E07FEF3DFF7FFF7FFF7FFF7F
        FF7FE07F0000E03DE03DE03DE03DE03DE03DEF3DEF3DEF3DFF7FE03DE03DE03D
        E03DEF3DEF3DE03DE03DE03DE03DE03DE03D0000E07FEF3DFF7FFF7FFF7FFF7F
        FF7FE07F0000E03DFF7FFF7FFF7FFF7FFF7FEF3DEF3DEF3DFF7FFF7FFF7FFF7F
        FF7FEF3DEF3D0000000000000000000000000000000000000000EF3DEF3D0000
        0000EF3D0000EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D
        EF3DEF3DEF3D0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000EF3D
        EF3DE07F0000EF3DFF7FE03DE03DE03DE03DE03DE03DE03DEF3DFF7FFF7FFF7F
        FF7FEF3DEF3D0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000EF3D
        E07FE07F0000EF3DFF7FE03DFF7FFF7FE03DFF7FFF7FFF7FEF3DEF3DFF7FFF7F
        EF3DEF3DEF3D0000FF7F00000000FF7F000000000000FF7F000000000000007C
        00000000EF3DEF3DFF7FEF3DEF3DE03DEF3DEF3DEF3DE03DEF3DEF3DEF3DEF3D
        FF7FEF3DEF3D0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000E03D007C007C
        007CE03DE03DEF3DFF7FE03DFF7FFF7FFF7FFF7FE03DFF7FEF3DFF7FEF3DEF3D
        EF3DFF7FFF7F0000FF7F0000000000000000FF7F0000FF7F0000007C007C007C
        007C007CE03DEF3DFF7FEF3DEF3DEF3DEF3DE03DEF3DE03DEF3DEF3DEF3DEF3D
        EF3DEF3DFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F007C007C007C007C
        007C007C007CEF3DFF7FE03DFF7FFF7FE03DFF7FFF7FFF7FEF3DEF3DEF3DEF3D
        EF3DEF3DEF3D0000FF7F00000000FF7F00000000000000000000E03D007C007C
        007CE03DE03DEF3DFF7FEF3DEF3DE03DEF3DEF3DEF3DEF3DEF3DE03DEF3DEF3D
        EF3DFF7FE03D0000FF7FFF7FFF7FFF7F0000FF7FFF7F0000E03DE03D007C007C
        007CE03DE03DEF3DFF7FE03DFF7FFF7FEF3DFF7FE03DEF3DE03DE03DEF3DEF3D
        EF3DFF7FE03D0000FF7F0000F75EFF7F0000FF7F0000E03DE03DEF3D007C007C
        007CE03DE03DEF3DFF7FEF3DEF3DE03DEF3DFF7FEF3DE03DFF7FEF3DEF3DEF3D
        EF3DE03DE03D0000FF7FFF7FFF7FFF7F00000000E03D007C007C007C007C007C
        E03DE03DE03DEF3DFF7FFF7FFF7FFF7FEF3DEF3DE03DEF3DEF3DEF3DEF3DEF3D
        E03DE03DE03D000000000000000000000000E03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DEF3DEF3DEF3DEF3DEF3DEF3DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03D}
      NumGlyphs = 2
      ShowHint = False
      OnClick = sbSelectClick
    end
    object ToolButton5: TToolButton
      Left = 197
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 4
      Style = tbsDivider
    end
    object sbSaveApplication: TRxSpeedButton
      Left = 205
      Top = 2
      Width = 123
      Height = 47
      Cursor = crHandPoint
      Caption = '&Save'
      Flat = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777777777777777777777770000777777777777777777777777F77777777777
        00007777744777777777777777788F7777777777000077774224777777777777
        778338F7777777770000777422224777777777777833338F7777777700007742
        222224777777777783333338F7777777000074222A22224777777778F338F333
        8F77777700007222A7A2224777777778F3878F338F77777700007A2A777A2224
        77777778F87778F338F77777000077A77777A222477777778777778F338F7777
        0000777777777A222477777777777778F338F77700007777777777A222477777
        777777778F338F77000077777777777A222477777777777778F338F700007777
        77777777A222477777777777778F338F00007777777777777A22477777777777
        7778F38F000077777777777777A247777777777777778F870000777777777777
        777A777777777777777778770000777777777777777777777777777777777777
        0000}
      NumGlyphs = 2
      OnClick = sbSaveApplicationClick
    end
    object ToolButton3: TToolButton
      Left = 328
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsDivider
    end
    object sbGridOptions: TRxSpeedButton
      Left = 336
      Top = 2
      Width = 76
      Height = 47
      DropDownMenu = pmSort
      Caption = 'Sort &Options'
      Flat = True
      NumGlyphs = 2
      ShowHint = False
      WordWrap = True
    end
    object ToolButton4: TToolButton
      Left = 412
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsDivider
    end
    object sbHelp: TRxSpeedButton
      Left = 420
      Top = 2
      Width = 58
      Height = 47
      Caption = '&Help'
      Flat = True
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
      ShowHint = False
      OnClick = sbHelpClick
    end
    object ToolButton8: TToolButton
      Left = 478
      Top = 2
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 3
      Style = tbsDivider
    end
    object Panel4: TPanel
      Left = 486
      Top = 2
      Width = 153
      Height = 47
      BevelOuter = bvNone
      TabOrder = 0
      object Label8: TLabel
        Left = 3
        Top = 4
        Width = 87
        Height = 16
        Caption = 'Herd I&dentity'
        FocusControl = cbHerdID
      end
      object cbHerdID: TRxDBLookupCombo
        Left = 0
        Top = 20
        Width = 120
        Height = 24
        DropDownCount = 8
        DisplayEmpty = 'Select Herd'
        EmptyValue = '0'
        LookupField = 'ID'
        LookupDisplay = 'HerdIdentity'
        TabOrder = 0
        OnChange = cbHerdIDChange
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 53
    Width = 697
    Height = 90
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Bevel2: TBevel
      Left = 173
      Top = 1
      Width = 524
      Height = 89
      Shape = bsFrame
    end
    object Bevel14: TBevel
      Left = 443
      Top = 24
      Width = 116
      Height = 36
    end
    object Bevel1: TBevel
      Left = 0
      Top = 1
      Width = 171
      Height = 89
      Shape = bsFrame
    end
    object Label4: TLabel
      Left = 14
      Top = 48
      Width = 95
      Height = 14
      Caption = 'Retention Date'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 14
      Top = 5
      Width = 120
      Height = 14
      Caption = 'Date Of Application'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 329
      Top = 62
      Width = 33
      Height = 16
      AutoSize = False
      Caption = 'Total'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label5: TLabel
      Left = 328
      Top = 13
      Width = 35
      Height = 14
      Caption = 'Cows'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 329
      Top = 37
      Width = 44
      Height = 14
      Caption = 'Heifers'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lHeiferRange: TLabel
      Left = 444
      Top = 6
      Width = 81
      Height = 14
      Caption = 'Heifer Range'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lMax: TLabel
      Left = 447
      Top = 33
      Width = 63
      Height = 18
      AutoSize = False
      Caption = 'Maximum'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Bevel11: TBevel
      Left = 323
      Top = 9
      Width = 2
      Height = 75
      Shape = bsLeftLine
    end
    object Label2: TLabel
      Left = 178
      Top = 9
      Width = 56
      Height = 30
      AutoSize = False
      Caption = 'Suckler Quota'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Bevel13: TBevel
      Left = 432
      Top = 9
      Width = 3
      Height = 75
      Shape = bsLeftLine
    end
    object lCowRange: TLabel
      Left = 575
      Top = 6
      Width = 72
      Height = 14
      Caption = 'Cow Range'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object lMin2: TLabel
      Left = 578
      Top = 33
      Width = 57
      Height = 18
      AutoSize = False
      Caption = 'Minimum'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Bevel15: TBevel
      Left = 571
      Top = 24
      Width = 116
      Height = 36
    end
    object RetentionDate: TEdit
      Left = 14
      Top = 63
      Width = 121
      Height = 20
      BorderStyle = bsNone
      Color = 12639424
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object ApplicDate: TDateEdit
      Left = 14
      Top = 19
      Width = 121
      Height = 23
      CheckOnExit = True
      DefaultToday = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      Weekends = [Sun, Sat]
      WeekendColor = clBlue
      YearDigits = dyFour
      TabOrder = 1
      Text = '16/01/2004'
      OnChange = ApplicDateChange
    end
    object TotalAnimals: TEdit
      Left = 382
      Top = 59
      Width = 42
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object eTotCows: TEdit
      Left = 382
      Top = 7
      Width = 42
      Height = 22
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object eTotHeif: TEdit
      Left = 382
      Top = 33
      Width = 42
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object eHMaxallowed: TEdit
      Left = 510
      Top = 32
      Width = 42
      Height = 20
      BorderStyle = bsNone
      Color = 12639424
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      Text = '0'
    end
    object eCMinAllowed: TEdit
      Left = 638
      Top = 33
      Width = 42
      Height = 20
      BorderStyle = bsNone
      Color = 12639424
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      Text = '0'
    end
    object pMilkQuota: TPanel
      Left = 175
      Top = 45
      Width = 146
      Height = 37
      BevelOuter = bvNone
      TabOrder = 7
      object Label11: TLabel
        Left = 3
        Top = 4
        Width = 64
        Height = 34
        AutoSize = False
        Caption = 'Milk Quota'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label7: TLabel
        Left = 42
        Top = 17
        Width = 32
        Height = 16
        Caption = '(Lts)'
      end
      object MilkQuota: TEdit
        Left = 74
        Top = 7
        Width = 70
        Height = 24
        TabOrder = 0
        OnChange = MilkQuotaChange
        OnExit = MilkQuotaExit
      end
    end
    object SuckQuota: TEdit
      Left = 234
      Top = 12
      Width = 63
      Height = 24
      TabOrder = 8
      OnExit = SuckQuotaExit
    end
  end
  object GridToolBar: TPanel
    Left = 0
    Top = 143
    Width = 91
    Height = 398
    Align = alLeft
    BevelInner = bvLowered
    TabOrder = 2
    object sbPreview: TRxSpeedButton
      Left = 2
      Top = 2
      Width = 87
      Height = 51
      Cursor = crHandPoint
      Caption = 'Pre&view'
      Flat = True
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
      OnClick = sbPreviewClick
    end
    object sbPrintApplic: TRxSpeedButton
      Left = 2
      Top = 52
      Width = 87
      Height = 51
      Cursor = crHandPoint
      Caption = '&Print'
      Flat = True
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
      OnClick = sbPreviewClick
    end
    object Bevel3: TBevel
      Left = 2
      Top = 49
      Width = 86
      Height = 4
      Shape = bsBottomLine
    end
    object sbRemove: TRxSpeedButton
      Left = 2
      Top = 118
      Width = 87
      Height = 50
      Cursor = crHandPoint
      Hint = 'Remove Selected Cow from Application'
      Caption = 'Remove &Cow'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        42040000424D4204000000000000420000002800000020000000100000000100
        1000030000000004000000000000000000000000000000000000007C0000E003
        00001F000000E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DFF7FFF7FE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D00000000E03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DFF7FEF3DEF3DFF7FE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03D00000000007C0000E03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DFF7FEF3DEF3DE03DEF3DFF7FE03DE03D
        E03DE03DE03DE03DE03DE03DE03D00000000007C007C007C0000E03DE03DE03D
        E03DE03DE03DE03DE03DE03DFF7FEF3DEF3DE03DE03DE03DEF3DFF7FFF7FFF7F
        FF7FFF7FFF7FE03DE03D00000000007C007C007C007C007C0000000000000000
        000000000000E03DFF7FEF3DEF3DE03DE03DE03DE03DE03DEF3DEF3DEF3DEF3D
        EF3DEF3DEF3D00000000007C007C007C007C007C007C007C007C007C007C007C
        007C007C0000EF3DEF3DE03DFF7FFF7FE03DE03DE03DE03DE03DFF7FFF7FFF7F
        FF7FFF7FEF3DE03DE03D00000000007C007C007C007C007C0000000000000000
        000000000000E03DE03DEF3DEF3DE03DFF7FFF7FE03DE03DEF3DEF3DEF3DEF3D
        EF3DEF3DEF3DE03DE03DE03DE03D00000000007C007C007C0000E03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DEF3DEF3DE03DFF7FFF7FEF3DFF7FE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03D00000000007C0000E03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DEF3DEF3DE03DEF3DFF7FE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D00000000E03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DEF3DEF3DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03D}
      NumGlyphs = 2
      ParentFont = False
      WordWrap = True
      OnClick = sbRemoveClick
    end
    object Bevel4: TBevel
      Left = 2
      Top = 114
      Width = 86
      Height = 5
      Shape = bsBottomLine
    end
    object sbDelHeifer: TRxSpeedButton
      Left = 2
      Top = 226
      Width = 87
      Height = 49
      Cursor = crHandPoint
      Hint = 'Remove Selected Heifer from Application'
      Caption = 'Remove Hei&fer'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        42040000424D4204000000000000420000002800000020000000100000000100
        1000030000000004000000000000000000000000000000000000007C0000E003
        00001F000000E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DFF7FFF7FE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D00000000E03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DFF7FEF3DEF3DFF7FE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03D00000000007C0000E03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DFF7FEF3DEF3DE03DEF3DFF7FE03DE03D
        E03DE03DE03DE03DE03DE03DE03D00000000007C007C007C0000E03DE03DE03D
        E03DE03DE03DE03DE03DE03DFF7FEF3DEF3DE03DE03DE03DEF3DFF7FFF7FFF7F
        FF7FFF7FFF7FE03DE03D00000000007C007C007C007C007C0000000000000000
        000000000000E03DFF7FEF3DEF3DE03DE03DE03DE03DE03DEF3DEF3DEF3DEF3D
        EF3DEF3DEF3D00000000007C007C007C007C007C007C007C007C007C007C007C
        007C007C0000EF3DEF3DE03DFF7FFF7FE03DE03DE03DE03DE03DFF7FFF7FFF7F
        FF7FFF7FEF3DE03DE03D00000000007C007C007C007C007C0000000000000000
        000000000000E03DE03DEF3DEF3DE03DFF7FFF7FE03DE03DEF3DEF3DEF3DEF3D
        EF3DEF3DEF3DE03DE03DE03DE03D00000000007C007C007C0000E03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DEF3DEF3DE03DFF7FFF7FEF3DFF7FE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03D00000000007C0000E03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DEF3DEF3DE03DEF3DFF7FE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D00000000E03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DEF3DEF3DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03DE03D
        E03DE03DE03D}
      NumGlyphs = 2
      ParentFont = False
      WordWrap = True
      OnClick = sbDelHeiferClick
    end
    object sbBlockRemove: TRxSpeedButton
      Left = 2
      Top = 301
      Width = 87
      Height = 55
      Caption = 'Remove &Next       Heifers'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      Margin = 0
      ParentFont = False
      WordWrap = True
      OnClick = sbBlockRemoveClick
    end
    object Bevel6: TBevel
      Left = 2
      Top = 222
      Width = 89
      Height = 5
      Shape = bsBottomLine
    end
    object Bevel10: TBevel
      Left = 2
      Top = 401
      Width = 86
      Height = 5
      Shape = bsBottomLine
    end
    object Bevel5: TBevel
      Left = 2
      Top = 164
      Width = 86
      Height = 5
      Shape = bsBottomLine
    end
    object Bevel7: TBevel
      Left = 2
      Top = 271
      Width = 89
      Height = 5
      Shape = bsBottomLine
    end
    object Bevel8: TBevel
      Left = 2
      Top = 297
      Width = 89
      Height = 5
      Shape = bsBottomLine
    end
    object Bevel9: TBevel
      Left = 2
      Top = 352
      Width = 89
      Height = 5
      Shape = bsBottomLine
    end
    object Bevel12: TBevel
      Left = 2
      Top = 98
      Width = 86
      Height = 5
      Shape = bsBottomLine
    end
    object eBlockRemove: TMaskEdit
      Left = 55
      Top = 319
      Width = 28
      Height = 20
      AutoSize = False
      EditMask = '99;1; '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      Text = '5 '
    end
  end
  object pGrids: TPanel
    Left = 91
    Top = 143
    Width = 606
    Height = 398
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 3
    object Splitter1: TSplitter
      Left = 2
      Top = 220
      Width = 606
      Height = 2
      Cursor = crHSplit
      Align = alNone
    end
    object CowGrid: TRxDBGrid
      Left = 0
      Top = 0
      Width = 606
      Height = 219
      Align = alTop
      DataSource = dsGetAnimals
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Verdana'
      TitleFont.Style = []
      MultiSelect = True
      Columns = <
        item
          Expanded = False
          FieldName = 'NatID'
          Title.Caption = 'National ID Number'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 145
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AnimalCode'
          Title.Caption = 'Animal Number'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 111
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LastCalving'
          Title.Caption = 'Last Calving Date'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 125
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOB'
          Title.Caption = 'Date of Birth'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Sex'
          Title.Caption = 'Status'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Verdana'
          Title.Font.Style = []
          Width = 67
          Visible = True
        end>
    end
    object HeiferGrid: TRxDBGrid
      Left = 0
      Top = 219
      Width = 606
      Height = 186
      Align = alTop
      DataSource = dsHeifers
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Verdana'
      TitleFont.Style = []
      MultiSelect = True
      Columns = <
        item
          Expanded = False
          FieldName = 'NatID'
          Title.Caption = 'National ID Number'
          Width = 145
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AnimalCode'
          Title.Caption = 'Animal Number'
          Width = 111
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Breed'
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOB'
          Title.Caption = 'Date of Birth'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Sex'
          Title.Caption = 'Status'
          Width = 70
          Visible = True
        end>
    end
  end
  object pmSort: TPopupMenu
    Left = 668
    Top = 158
    object NationalIDNumber1: TMenuItem
      Caption = '&National ID Number'
      Checked = True
      GroupIndex = 1
      Hint = 'sortnatid'
      RadioItem = True
      OnClick = NationalIDNumber1Click
    end
    object AnimalNumber1: TMenuItem
      Caption = '&Animal Number'
      GroupIndex = 1
      Hint = 'SortAnimalNo'
      RadioItem = True
      OnClick = AnimalNumber1Click
    end
    object DateOfBirth1: TMenuItem
      Caption = 'Date Of &Birth'
      GroupIndex = 1
      Hint = 'DOB'
      RadioItem = True
      OnClick = DateOfBirth1Click
    end
    object LastCalving: TMenuItem
      Caption = '&Last Calving Date'
      GroupIndex = 1
      Hint = 'lastcalving'
      RadioItem = True
      OnClick = LastCalvingClick
    end
    object N1: TMenuItem
      Caption = '-'
      GroupIndex = 2
    end
    object Ascending1: TMenuItem
      Caption = 'As&cending'
      Checked = True
      GroupIndex = 2
      Hint = 'asc'
      RadioItem = True
      OnClick = Ascending1Click
    end
    object Descending1: TMenuItem
      Caption = '&Descending'
      GroupIndex = 2
      Hint = 'desc'
      RadioItem = True
      OnClick = Ascending1Click
    end
  end
  object PremTable: TTable
    DatabaseName = 'Kingswd'
    Left = 642
    Top = 32
  end
  object dsPremSource: TDataSource
    DataSet = PremTable
    Left = 604
    Top = 2
  end
  object qApplics: TQuery
    DatabaseName = 'Kingswd'
    Left = 632
    Top = 2
  end
  object dsApplication: TDataSource
    DataSet = qApplics
    Left = 659
    Top = 2
  end
  object GenQuery: TQuery
    DatabaseName = 'Kingswd'
    Left = 615
    Top = 25
  end
  object dsGetAnimals: TDataSource
    DataSet = Cows
    Left = 668
    Top = 266
  end
  object qGetAnimals: TQuery
    AutoCalcFields = False
    DatabaseName = 'Kingswd'
    Left = 668
    Top = 194
  end
  object qHeifers: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT *'
      'FROM TempPrm.db P'
      'WHERE (P.DoB > :TWOYEAR)')
    Left = 630
    Top = 410
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TWOYEAR'
        ParamType = ptUnknown
      end>
  end
  object dsHeifers: TDataSource
    DataSet = Heifers
    Left = 556
    Top = 446
  end
  object Cows: TTable
    AfterDelete = CowsAfterDelete
    DatabaseName = 'Kingswd'
    Filter = 'Type = "C"'
    TableName = 'TempPrm'
    Left = 669
    Top = 231
  end
  object Heifers: TTable
    AfterDelete = HeifersAfterDelete
    DatabaseName = 'Kingswd'
    TableName = 'TempPrm.DB'
    Left = 555
    Top = 417
  end
end
