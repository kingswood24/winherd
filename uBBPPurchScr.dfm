object fBBPPurchScr: TfBBPPurchScr
  Left = 403
  Top = 29
  Width = 967
  Height = 776
  Caption = 'Purchase Input Group'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = True
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
    Width = 959
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
      Width = 75
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
      OnClick = sbExitClick
    end
    object ToolButton1: TToolButton
      Left = 83
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 2
      Style = tbsDivider
    end
    object bUpdateDBs: TRxSpeedButton
      Left = 91
      Top = 2
      Width = 127
      Height = 47
      Caption = '&Save To Register'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
        00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
        00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
        F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
        F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
        F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
        FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
        0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
        0033333337FFFFFF773333333000000003333333377777777333}
      NumGlyphs = 2
      OnClick = bUpdateDBsClick
    end
    object ToolButton7: TToolButton
      Left = 218
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 3
      Style = tbsDivider
    end
    object sbCrushData: TRxSpeedButton
      Left = 226
      Top = 2
      Width = 107
      Height = 47
      Alignment = taLeftJustify
      Caption = 'Crush Data'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
        6666666666666666666666660000666666666666666666666666666666666666
        0000666666666666666666666666666666666666000066666666668866666666
        66666666886666660000666666666F44866666666666666F8886666600006666
        66666F44486666666666666F8888666600006668888887444486666668888888
        88888666000066F44444444444486666F888888888888866000066F444444444
        44448666F888888888888886000066F44444444444446666F888888888888866
        000066F44444444444466666F888888888888666000066FFFFFFFF4444666666
        FFFFFFFF888866660000666666666F44466666666666666F8886666600006666
        66666F44666666666666666F886666660000666666666FF6666666666666666F
        F666666600006666666666666666666666666666666666660000666666666666
        6666666666666666666666660000666666666666666666666666666666666666
        0000}
      NumGlyphs = 2
      ParentFont = False
      Spacing = 0
      WordWrap = True
      OnClick = sbCrushDataClick
    end
    object CfDivider: TToolButton
      Left = 333
      Top = 2
      Width = 8
      Caption = 'CfDivider'
      ImageIndex = 3
      Style = tbsDivider
    end
    object bDelete: TRxSpeedButton
      Left = 341
      Top = 2
      Width = 71
      Height = 47
      Caption = '&Delete'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
        05555777775555557F5555000555555505555577755555557555}
      NumGlyphs = 2
      OnClick = bDeleteClick
    end
    object ToolButton4: TToolButton
      Left = 412
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 1
      Style = tbsDivider
    end
    object bCalc: TRxSpeedButton
      Left = 420
      Top = 2
      Width = 62
      Height = 47
      Caption = '&Calc'
      Flat = True
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        2000000000000008000000000000000000000000000000000000007F7F000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000007F7F00007F7F00007F7F007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF00007F7F00007F7F000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000007F7F00007F7F00007F7F007F7F
        7F00007F7F00FFFFFF00007F7F00FFFFFF00007F7F00FFFFFF00007F7F00FFFF
        FF00007F7F00FFFFFF00007F7F007F7F7F00007F7F00007F7F00007F7F00007F
        7F0000000000FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FFFF
        FF0000000000FFFFFF0000000000007F7F00007F7F00007F7F00007F7F00FFFF
        FF007F7F7F00FFFFFF007F7F7F00007F7F007F7F7F00007F7F007F7F7F00007F
        7F007F7F7F00007F7F007F7F7F00FFFFFF00FFFFFF00FFFFFF00000000000000
        00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000000000000000000000000000007F7F007F7F7F007F7F
        7F007F7F7F007F7F7F00007F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF0000000000FFFF
        FF00FFFFFF00BFBFBF0000000000000000000000000000000000000000000000
        000000000000BFBFBF00FFFFFF00FFFFFF0000000000007F7F007F7F7F00FFFF
        FF00007F7F00FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
        7F007F7F7F00007F7F00FFFFFF00FFFFFF007F7F7F00FFFFFF0000000000FFFF
        FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000000000000000000000000000007F7F007F7F7F00FFFF
        FF007F7F7F00007F7F00007F7F00007F7F00007F7F00007F7F00007F7F00007F
        7F00007F7F007F7F7F007F7F7F007F7F7F007F7F7F00FFFFFF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000007F7F007F7F7F00007F
        7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7F00007F7F00007F7F000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000007F7F00007F7F00007F7F007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
        7F007F7F7F007F7F7F007F7F7F007F7F7F00007F7F00007F7F00007F7F00007F
        7F00007F7F000000000000000000000000000000000000000000000000000000
        00000000000000000000007F7F00007F7F00007F7F00007F7F00007F7F00007F
        7F00007F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
        7F007F7F7F007F7F7F00FFFFFF00007F7F00007F7F00007F7F00007F7F00007F
        7F00007F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000007F7F00007F7F00007F7F00007F7F00007F7F00007F
        7F00007F7F007F7F7F00FFFFFF00007F7F00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF007F7F7F00FFFFFF00007F7F00007F7F00007F7F00007F7F00007F
        7F00007F7F0000000000FFFFFF00000000000000000000000000000000000000
        0000FFFFFF0000000000007F7F00007F7F00007F7F00007F7F00007F7F00007F
        7F00007F7F007F7F7F00FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F
        7F00FFFFFF007F7F7F00FFFFFF00007F7F00007F7F00007F7F00007F7F00007F
        7F00007F7F0000000000FFFFFF000000000000FF000000FF0000FFFF00000000
        0000FFFFFF0000000000007F7F00007F7F00007F7F00007F7F00007F7F00007F
        7F00007F7F007F7F7F00FFFFFF007F7F7F00FFFFFF00007F7F00007F7F007F7F
        7F00FFFFFF007F7F7F00FFFFFF00007F7F00007F7F00007F7F00007F7F00007F
        7F00007F7F0000000000FFFFFF0000000000FF00FF0000FF0000FF00FF000000
        0000FFFFFF0000000000007F7F00007F7F00007F7F00007F7F00007F7F00007F
        7F00007F7F007F7F7F00FFFFFF007F7F7F00FFFFFF00FFFFFF00FFFFFF007F7F
        7F00FFFFFF007F7F7F00FFFFFF00007F7F00007F7F00007F7F00007F7F00007F
        7F00007F7F0000000000FFFFFF00000000000000000000000000000000000000
        0000FFFFFF0000000000007F7F00007F7F00007F7F00007F7F00007F7F00007F
        7F00007F7F007F7F7F00FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F
        7F00007F7F007F7F7F00FFFFFF00007F7F00007F7F00007F7F00007F7F00007F
        7F00007F7F0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000007F7F00007F7F00007F7F00007F7F00007F7F00007F
        7F00007F7F007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF007F7F7F00FFFFFF00007F7F00007F7F00007F7F00007F7F00007F
        7F00007F7F000000000000000000000000000000000000000000000000000000
        00000000000000000000007F7F00007F7F00007F7F00007F7F00007F7F00007F
        7F00007F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
        7F007F7F7F007F7F7F00007F7F00007F7F00007F7F00007F7F00}
      NumGlyphs = 2
      OnClick = bCalcClick
    end
    object ToolButton6: TToolButton
      Left = 482
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 3
      Style = tbsDivider
    end
    object RxSpeedButton3: TRxSpeedButton
      Left = 490
      Top = 2
      Width = 77
      Height = 47
      DropDownMenu = pmOptions
      Caption = 'Options'
      Flat = True
    end
    object ToolButton2: TToolButton
      Left = 567
      Top = 2
      Width = 4
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsDivider
    end
    object RxSpeedButton2: TRxSpeedButton
      Left = 571
      Top = 2
      Width = 75
      Height = 47
      Caption = 'Accounts'
      Flat = True
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555500000
        55555555000BB3B30555555030BB3303305555030BB0B3B3330555033BBBB333
        330550B3B3BB3BB3B33050B3B33BBBBB333050B3B33BBBBB3B3050B3B333BB0B
        33B050B33333BBB3B3B050BB33333333BB05550B33B3333BB305550BB33330BB
        B0555550BB33B3BB0555555500B3333055555555550000055555}
      OnClick = RxSpeedButton2Click
    end
    object ToolButton5: TToolButton
      Left = 646
      Top = 2
      Width = 3
      Caption = 'ToolButton5'
      ImageIndex = 2
      Style = tbsDivider
    end
    object sbHelp: TRxSpeedButton
      Left = 649
      Top = 2
      Width = 51
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
      OnClick = sbHelpClick
    end
  end
  object pPurchGrp: TPanel
    Left = 0
    Top = 53
    Width = 959
    Height = 200
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label5: TLabel
      Left = 10
      Top = 4
      Width = 58
      Height = 28
      Caption = 'Purchase'#13#10'Group'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 274
      Top = 4
      Width = 58
      Height = 28
      Caption = 'Date Of'#13#10'Purchase'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 10
      Top = 44
      Width = 51
      Height = 14
      Caption = 'Supplier'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 10
      Top = 76
      Width = 36
      Height = 14
      Caption = 'Buyer'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 545
      Top = 44
      Width = 23
      Height = 14
      Caption = 'Sex'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 545
      Top = 4
      Width = 70
      Height = 28
      Caption = 'Number In Group'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label23: TLabel
      Left = 274
      Top = 44
      Width = 76
      Height = 14
      Alignment = taCenter
      Caption = 'Mart Weight'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label24: TLabel
      Left = 274
      Top = 76
      Width = 61
      Height = 14
      Alignment = taCenter
      Caption = 'Mart Cost'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label25: TLabel
      Left = 274
      Top = 164
      Width = 105
      Height = 33
      AutoSize = False
      Caption = 'Transport And'#13#10'Commission p/h'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label26: TLabel
      Left = 545
      Top = 76
      Width = 22
      Height = 14
      Caption = 'VAT'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label27: TLabel
      Left = 10
      Top = 106
      Width = 48
      Height = 14
      Caption = 'Herd ID'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label28: TLabel
      Left = 274
      Top = 106
      Width = 77
      Height = 14
      Caption = 'Batch Group'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label29: TLabel
      Left = 274
      Top = 139
      Width = 24
      Height = 14
      Caption = 'Pen'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object Label30: TLabel
      Left = 545
      Top = 132
      Width = 110
      Height = 28
      Caption = 'Current Lactation'#13#10'Number'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label31: TLabel
      Left = 10
      Top = 139
      Width = 60
      Height = 14
      Caption = 'Comment'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label32: TLabel
      Left = 545
      Top = 172
      Width = 63
      Height = 14
      Alignment = taCenter
      Caption = 'Shrinkage'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object dbPurchGrpCode: TDBText
      Left = 82
      Top = 173
      Width = 105
      Height = 21
      Color = 12639424
      DataField = 'PurchGrpCode'
      DataSource = dsPurchGrpHeader
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 10
      Top = 164
      Width = 58
      Height = 28
      Caption = 'Purchase'#13#10'Group'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object dbcbSex: TDBComboBox
      Left = 670
      Top = 40
      Width = 85
      Height = 22
      Style = csDropDownList
      Color = clTeal
      DataField = 'Sex'
      DataSource = dsPurchGrpHeader
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ItemHeight = 14
      Items.Strings = (
        'Mixed'
        'Steer'
        'Bull'
        'Female')
      ParentFont = False
      TabOrder = 5
      OnChange = dbcbSexChange
    end
    object dbPurchGrpNum: TDBEdit
      Left = 670
      Top = 8
      Width = 85
      Height = 22
      Color = clTeal
      DataField = 'Number'
      DataSource = dsPurchGrpHeader
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object dbPurchGrpMartWt: TDBEdit
      Left = 403
      Top = 40
      Width = 105
      Height = 22
      DataField = 'MartWeight'
      DataSource = dsPurchGrpHeader
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object dbPurchGrpMartCost: TDBEdit
      Left = 403
      Top = 72
      Width = 105
      Height = 22
      DataField = 'MartCost'
      DataSource = dsPurchGrpHeader
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object HerdLookup: TRxDBLookupCombo
      Left = 82
      Top = 104
      Width = 160
      Height = 23
      DropDownCount = 8
      DropDownWidth = 300
      EscapeClear = False
      Color = clTeal
      DataField = 'HerdID'
      DataSource = dsPurchGrpHeader
      DisplayEmpty = '<Add>'
      EmptyValue = '0'
      EmptyItemColor = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      LookupField = 'ID'
      LookupDisplay = 'HerdIdentity'
      LookupSource = WinData.dsHerdDefaults
      ParentFont = False
      TabOrder = 9
      OnChange = HerdLookupChange
    end
    object DBCheckBox1: TDBCheckBox
      Left = 545
      Top = 106
      Width = 139
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Use For Breeding'
      DataField = 'Breeding'
      DataSource = dsPurchGrpHeader
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      OnClick = DBCheckBox1Click
    end
    object dbPurchGrpLactation: TDBEdit
      Left = 670
      Top = 136
      Width = 85
      Height = 22
      DataField = 'LactationNumber'
      DataSource = dsPurchGrpHeader
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
      OnChange = dbPurchGrpLactationChange
    end
    object Supplier: TRxDBLookupCombo
      Left = 82
      Top = 40
      Width = 160
      Height = 23
      Hint = 'Place Purchased'
      DropDownCount = 8
      Color = clTeal
      DataField = 'SupplierID'
      DataSource = dsPurchGrpHeader
      DisplayEmpty = '<Add>'
      EmptyValue = '0'
      EmptyItemColor = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      LookupField = 'ID'
      LookupDisplay = 'Name'
      LookupSource = WinData.dsQuerySuppliers
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnChange = SupplierChange
      OnCloseUp = SupplierCloseUp
    end
    object Buyers: TRxDBLookupCombo
      Left = 82
      Top = 72
      Width = 160
      Height = 23
      Hint = 'Purchasing Individual'
      DropDownCount = 8
      DataField = 'BuyerID'
      DataSource = dsPurchGrpHeader
      DisplayEmpty = '<Add>'
      EmptyValue = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      LookupField = 'ID'
      LookupDisplay = 'Name'
      LookupSource = WinData.dsBuyers
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnChange = BuyersChange
      OnCloseUp = BuyersCloseUp
    end
    object dbPurchGrpDesc: TDBEdit
      Left = 82
      Top = 136
      Width = 171
      Height = 22
      DataField = 'EventDesc'
      DataSource = dsPurchGrpHeader
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnChange = dbPurchGrpDescChange
    end
    object dbdPurchGrpDate: TDBDateEdit
      Left = 403
      Top = 8
      Width = 105
      Height = 23
      DataField = 'PurchaseDate'
      DataSource = dsPurchGrpHeader
      CheckOnExit = True
      Color = clTeal
      DefaultToday = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Weekends = [Sun, Sat]
      WeekendColor = clBlue
      YearDigits = dyFour
      OnExit = dbdPurchGrpDateExit
    end
    object OtherCosts: TCurrencyEdit
      Left = 403
      Top = 173
      Width = 105
      Height = 21
      TabStop = False
      AutoSize = False
      BorderStyle = bsNone
      Color = 12639424
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 15
    end
    object dbPurchGrpVar: TDBEdit
      Left = 670
      Top = 173
      Width = 105
      Height = 21
      TabStop = False
      BorderStyle = bsNone
      Color = 12639424
      DataField = 'TagWtVsMartWtVar'
      DataSource = dsPurchGrpHeader
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 16
    end
    object dbPurchGrpVAT: TDBEdit
      Left = 670
      Top = 72
      Width = 85
      Height = 22
      DataField = 'VAT'
      DataSource = dsPurchGrpHeader
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnExit = dbPurchGrpVATExit
    end
    object dbcbGroupNum: TRxDBLookupCombo
      Left = 403
      Top = 104
      Width = 105
      Height = 23
      Hint = 'Batch Number'
      DropDownCount = 8
      DropDownWidth = 300
      DataField = 'GroupID'
      DataSource = dsPurchGrpHeader
      DisplayEmpty = '<Add>'
      EmptyValue = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      LookupField = 'ID'
      LookupDisplay = 'Code;Description'
      LookupSource = dsBatchNum
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
      OnChange = dbcbGroupNumChange
      OnCloseUp = dbcbGroupNumCloseUp
      OnDropDown = dbcbGroupNumDropDown
    end
    object dbcbPenNum: TRxDBLookupCombo
      Left = 403
      Top = 136
      Width = 105
      Height = 23
      Hint = 'Pen Number'
      DropDownCount = 8
      DropDownWidth = 300
      DataField = 'PenID'
      DataSource = dsPurchGrpHeader
      DisplayEmpty = '<Add>'
      EmptyValue = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      LookupField = 'ID'
      LookupDisplay = 'Code;Description'
      LookupSource = dsPenNum
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      Visible = False
      OnChange = dbcbPenNumChange
      OnCloseUp = dbcbPenNumCloseUp
      OnDropDown = dbcbPenNumDropDown
    end
    object PurchBatchNum: TRxDBLookupCombo
      Left = 82
      Top = 10
      Width = 125
      Height = 23
      DropDownCount = 8
      DropDownWidth = 300
      EscapeClear = False
      Color = clTeal
      DisplayEmpty = '<Add>'
      EmptyValue = '0'
      EmptyItemColor = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      LookupField = 'ID'
      LookupDisplay = 'Code; Description'
      LookupSource = dsPurchGrpNum
      ParentFont = False
      TabOrder = 0
      OnChange = PurchBatchNumChange
      OnCloseUp = PurchBatchNumCloseUp
      OnDropDown = PurchBatchNumDropDown
      OnExit = PurchBatchNumExit
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 673
    Width = 959
    Height = 72
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    object UpdateProgress: TProgressBar
      Left = 2
      Top = 55
      Width = 955
      Height = 15
      Align = alBottom
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 0
      Visible = False
    end
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 955
      Height = 53
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object lTotalWt: TLabel
        Left = 323
        Top = 31
        Width = 69
        Height = 13
        Alignment = taCenter
        Caption = 'Total Weight'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 558
        Top = 31
        Width = 109
        Height = 13
        Alignment = taCenter
        Caption = 'Total Cost Into Pen'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 558
        Top = 6
        Width = 88
        Height = 13
        Alignment = taCenter
        Caption = 'Total Mart Price'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object lTotalNum: TLabel
        Left = 323
        Top = 6
        Width = 101
        Height = 13
        Alignment = taCenter
        Caption = 'Number In Batch '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object dbtActualNumber: TDBText
        Left = 432
        Top = 6
        Width = 97
        Height = 17
        Color = 12639424
        DataField = 'ActualNumber'
        DataSource = dsPurchGrpHeader
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object dbtTotWeight: TDBText
        Left = 432
        Top = 31
        Width = 97
        Height = 17
        Color = 12639424
        DataField = 'TotWeight'
        DataSource = dsPurchGrpHeader
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object dbtTotMartPrice: TDBText
        Left = 685
        Top = 6
        Width = 97
        Height = 17
        Color = 12639424
        DataField = 'TotMartPrice'
        DataSource = dsPurchGrpHeader
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object dbtTotCostIntoPen: TDBText
        Left = 685
        Top = 31
        Width = 97
        Height = 17
        Color = 12639424
        DataField = 'TotCostIntoPen'
        DataSource = dsPurchGrpHeader
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object sbDeleteCurrent: TRxSpeedButton
        Left = 244
        Top = 0
        Width = 66
        Height = 53
        Caption = 'Delete'
        Flat = True
        OnClick = sbDeleteCurrentClick
      end
      object DBNavigator: TKwDBNavigator
        Left = 0
        Top = 0
        Width = 244
        Height = 53
        Hint = 
          'Click on the buttons to navigate  through the Purchase Groups:'#13#10 +
          '                            '#13#10'First; Prior; Next; Last; Insert; ' +
          'Delete; Post; Cancel.'
        DataSource = dsPurchGrpHeader
        VisibleButtons = [kwnbFirst, kwnbPrior, kwnbNext, kwnbLast]
        Flat = True
        Ctl3D = False
        Captions.Strings = (
          '&Save'
          '&Cancel'
          '&Add'
          '&Delete'
          '&Edit'
          '&Refresh'
          '&First'
          '&Prev.'
          '&Next'
          '&Last')
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
  end
  object RxSplitter1: TRxSplitter
    Left = 0
    Top = 317
    Width = 959
    Height = 0
    ControlFirst = pPurchGrp
    Align = alTop
  end
  object gData: TDBGridEh
    Left = 0
    Top = 317
    Width = 959
    Height = 356
    Align = alClient
    DataSource = dsPurchGrpData
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = 'Verdana'
    FooterFont.Style = []
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghEnterAsTab]
    ParentFont = False
    PopupMenu = pmGridColumns
    TabOrder = 3
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    UseMultiTitle = True
    VTitleMargin = 4
    OnColEnter = gDataColEnter
    OnColExit = gDataColExit
    OnGetCellParams = gDataGetCellParams
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NatIDNum'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        Footers = <>
        Title.Caption = 'Nat ID No.'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
      end
      item
        EditButtons = <>
        FieldName = 'DateOfBirth'
        Footers = <>
        Title.Caption = 'Date Of Birth'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 96
      end
      item
        EditButtons = <>
        FieldName = 'Sex'
        Footers = <>
        PickList.Strings = (
          'Steer'
          'Bull'
          'Female')
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
      end
      item
        EditButtons = <>
        FieldName = 'BreedName'
        Footers = <>
        Title.Caption = 'Breed'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 130
      end
      item
        EditButtons = <>
        FieldName = 'AnimalNo'
        Footers = <>
        Title.Caption = 'Animal No.'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'ColourName'
        Footers = <>
        Title.Caption = 'Colour'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 130
      end
      item
        EditButtons = <>
        FieldName = 'TBTestDate'
        Footers = <>
        Title.Caption = 'TB Test Date'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 103
      end
      item
        EditButtons = <>
        FieldName = 'Weight'
        Footers = <>
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
      end
      item
        EditButtons = <>
        FieldName = 'LotNo'
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = 'EventDesc'
        Footers = <>
        Title.Caption = 'Comment'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'Grade'
        Footers = <>
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
      end
      item
        EditButtons = <>
        FieldName = 'MartPrice'
        Footers = <>
        Title.Caption = 'Mart Price'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'CostIntoPen'
        Footers = <>
        Title.Caption = 'Cost Into Pen'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'EventDate'
        Footers = <>
        Title.Caption = 'Purchase Date'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 101
      end
      item
        EditButtons = <>
        FieldName = 'SupplierName'
        Footers = <>
        Title.Caption = 'Supplier'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 150
      end
      item
        EditButtons = <>
        FieldName = 'BuyerName'
        Footers = <>
        Title.Caption = 'Buyer'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
      end
      item
        EditButtons = <>
        FieldName = 'BatchName'
        Footers = <>
        Title.Caption = 'Batch Group'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 82
      end
      item
        Checkboxes = False
        EditButtons = <>
        FieldName = 'Breeding'
        Footers = <>
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
        Width = 73
      end
      item
        EditButtons = <>
        FieldName = 'LactationNumber'
        Footers = <>
        Title.Caption = 'Lact. No.'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
      end
      item
        EditButtons = <>
        FieldName = 'BuyerCosts'
        Footers = <>
        Title.Caption = 'Costs | Buyer'
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
      end
      item
        EditButtons = <>
        FieldName = 'SupplierCosts'
        Footers = <>
        Title.Caption = 'Costs | Supplier '
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Verdana'
        Title.Font.Style = []
      end>
  end
  object pBarcode: TPanel
    Left = 0
    Top = 253
    Width = 959
    Height = 64
    Align = alTop
    TabOrder = 6
    OnClick = pBarcodeClick
    object Label7: TLabel
      Left = 4
      Top = 11
      Width = 99
      Height = 16
      Caption = 'Enter Barcode:'
    end
    object Label9: TLabel
      Left = 4
      Top = 39
      Width = 609
      Height = 16
      Caption = 
        'Click into the "Scan Barcode" box to begin scanning either the a' +
        'nimal tag or DOB/Sex/Breed'
    end
    object teBarcode: TcxTextEdit
      Left = 103
      Top = 7
      Style.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.Kind = lfStandard
      TabOrder = 0
      OnExit = teBarcodeExit
      Width = 243
    end
    object imgBarcode: TcxImage
      Left = 350
      Top = 7
      Picture.Data = {
        0A544A504547496D616765E5590000FFD8FFE000104A46494600010101006000
        600000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
        0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
        3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
        3232323232323232323232323232323232323232323232323232323232323232
        32323232323232323232323232FFC000110800F001B103012200021101031101
        FFC4001F0000010501010101010100000000000000000102030405060708090A
        0BFFC400B5100002010303020403050504040000017D01020300041105122131
        410613516107227114328191A1082342B1C11552D1F02433627282090A161718
        191A25262728292A3435363738393A434445464748494A535455565758595A63
        6465666768696A737475767778797A838485868788898A92939495969798999A
        A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
        D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
        01010101010101010000000000000102030405060708090A0BFFC400B5110002
        0102040403040705040400010277000102031104052131061241510761711322
        328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
        292A35363738393A434445464748494A535455565758595A636465666768696A
        737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
        A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
        E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00CEFD
        A43FE461D13FEBD1FF00F43ADFFDA43FE45FD13FEBE9FF00F40AC0FDA43FE461
        D13FEBD1FF00F43ADFFDA43FE45FD13FEBE9FF00F40A00F4EF037FC93EF0DFFD
        82AD7FF452D7CC9F1ABFE4AE6B9FF6C3FF0044475F4DF81BFE49F786FF00EC15
        6BFF00A296BE64F8D5FF0025735CFF00B61FFA223A048F5DFD9D7FE49F5FFF00
        D8564FFD1515607ED2DFF32C7FDBDFFED1ADFF00D9D7FE49F5FF00FD8564FF00
        D1515607ED2DFF0032C7FDBDFF00ED1A03A9ED9A17FC8BDA67FD7A45FF00A00A
        F03FF9BAAFFB7BFF00DB7AF7CD0BFE45ED33FEBD22FF00D005781FFCDD57FDBD
        FF00EDBD008F74F167FC89BAE7FD83EE3FF45B57C3F5F7078B3FE44DD73FEC1F
        71FF00A2DABE1FA068FA2FE3FF00FC93ED03FEBE93FF00453579CFC0EFF92ABA
        6FFD729FFF0045B57A37C7FF00F927DA07FD7D27FE8A6AF39F81DFF25574DFFA
        E53FFE8B6A03A07C71FF0092ABA97FD7283FF45AD70365FF001FF6FF00F5D57F
        98AEFBE38FFC955D4BFEB941FF00A2D6B81B2FF8FF00B7FF00AEABFCC5303EF1
        AF22FDA2BFE49F587FD8563FFD152D7AED7917ED15FF0024FAC3FEC2B1FF00E8
        A969091E45F057FE4AE687FF006DFF00F44495D77C41FF00938FD07FEBEF4FFF
        00D18B5C8FC15FF92B9A1FFDB7FF00D112575DF107FE4E3F41FF00AFBD3FFF00
        462D31F53E8CAF81EBEF8AF81E9023ED9F037FC93EF0DFFD82AD7FF452D7896B
        3FF27551FF00D7DDB7FE93A57B6F81BFE49F786FFEC156BFFA296BC4B59FF93A
        A8FF00EBEEDBFF0049D281213F680FF9283A17FD7A27FE8D6AD8FDA4FF00E3C3
        C3BFF5D67FE4958FFB407FC941D0BFEBD13FF46B56C7ED27FF001E1E1DFF00AE
        B3FF0024A00F9F2BB6F843FF00255741FF00AEAFFF00A2DAB89AEDBE10FF00C9
        55D07FEBABFF00E8B6A651DB7C41FF00938FD07FEBEF4FFF00D18B47ED21FF00
        230E89FF005E8FFF00A1D1F107FE4E3F41FF00AFBD3FFF00462D1FB487FC8C3A
        27FD7A3FFE874846FF00ED21FF0022FE89FF005F4FFF00A051F107FE4DC341FF
        00AF5B0FFD16B47ED21FF22FE89FF5F4FF00FA051F107FE4DC341FFAF5B0FF00
        D16B408EBFE0AFFC923D0FFEDBFF00E8F92BBEAE07E0AFFC923D0FFEDBFF00E8
        F92BBEA00F03FDA5BFE658FF00B7BFFDA35E075EF9FB4B7FCCB1FF006F7FFB46
        BC0E98D1F45EB1FF0026AB1FFD7ADBFF00E94256FF00C05FF92630FF00D7DCDF
        CC5606B1FF0026AB1FFD7ADBFF00E94256FF00C05FF92630FF00D7DCDFCC5211
        C8FED2DFF32C7FDBDFFED1AC0FD9D7FE4A0DFF00FD82A4FF00D1B156FF00ED2D
        FF0032C7FDBDFF00ED1AC0FD9D7FE4A0DFFF00D82A4FFD1B1503E87AEFC6AFF9
        247AE7FDB0FF00D1F1D7CC9E06FF009283E1BFFB0ADAFF00E8D5AFA6FE357FC9
        23D73FED87FE8F8EBE64F037FC941F0DFF00D856D7FF0046AD3047A6FC6EFF00
        92C3E1EFFAF4B6FF00D2892B43F696FF009963FEDEFF00F68D67FC6EFF0092C3
        E1EFFAF4B6FF00D2892B43F696FF009963FEDEFF00F68D203DB342FF00917B4C
        FF00AF48BFF4015A159FA17FC8BDA67FD7A45FFA00AD0A093E73F883FF00271F
        A0FF00D7DE9FFF00A316BE8CAF9CFE20FF00C9C7E83FF5F7A7FF00E8C5AFA328
        1B3C4BF690FF00917F44FF00AFA7FF00D02BD3BC0DFF0024FBC37FF60AB5FF00
        D14B5E63FB487FC8BFA27FD7D3FF00E815E9DE06FF00927DE1BFFB055AFF00E8
        A5A03A1E25ACFF00C9D547FF005F76DFFA4E95EF9AEFFC8BDA9FFD7A4BFF00A0
        1AF03D67FE4EAA3FFAFBB6FF00D274AF7CD77FE45ED4FF00EBD25FFD00D00CF8
        5EBD77F675FF0092837FFF0060A93FF46C55E455EBBFB3AFFC941BFF00FB0549
        FF00A362A6365FD1BFE4EAA4FF00AFBB9FFD277A5F881FF2721A0FFD7DE9FF00
        FA3169346FF93AA93FEBEEE7FF0049DE97E207FC9C8683FF005F7A7FFE8C5A40
        7D1F45145007CDFF00B487FC8C3A27FD7A3FFE875BFF00B487FC8BFA27FD7D3F
        FE81581FB487FC8C3A27FD7A3FFE875BFF00B487FC8BFA27FD7D3FFE81401E9D
        E06FF927DE1BFF00B055AFFE8A5AF993E357FC95CD73FED87FE888EBE9BF037F
        C93EF0DFFD82AD7FF452D7CC9F1ABFE4AE6B9FF6C3FF0044474091EBBFB3AFFC
        93EBFF00FB0AC9FF00A2A2AC0FDA5BFE658FFB7BFF00DA35BFFB3AFF00C93EBF
        FF00B0AC9FFA2A2AC0FDA5BFE658FF00B7BFFDA340753DB342FF00917B4CFF00
        AF48BFF4015E07FF003755FF006F7FFB6F5EF9A17FC8BDA67FD7A45FFA00AF03
        FF009BAAFF00B7BFFDB7A011EE9E2CFF0091375CFF00B07DC7FE8B6AF87EBEE0
        F167FC89BAE7FD83EE3FF45B57C3F40D1F45FC7FFF00927DA07FD7D27FE8A6AF
        39F81DFF0025574DFF00AE53FF00E8B6AF46F8FF00FF0024FB40FF00AFA4FF00
        D14D5E73F03BFE4AAE9BFF005CA7FF00D16D40740F8E3FF255752FFAE507FE8B
        5AE06CBFE3FEDFFEBAAFF315DF7C71FF0092ABA97FD7283FF45AD70365FF001F
        F6FF00F5D57F98A607DE35E45FB457FC93EB0FFB0AC7FF00A2A5AF5DAF22FDA2
        BFE49F587FD8563FFD152D2123C8BE0AFF00C95CD0FF00EDBFFE8892BAEF883F
        F271FA0FFD7DE9FF00FA316B91F82BFF00257343FF00B6FF00FA224AEBBE20FF
        00C9C7E83FF5F7A7FF00E8C5A63EA7D195F03D7DF15F03D2047DB3E06FF927DE
        1BFF00B055AFFE8A5AF12D67FE4EAA3FFAFBB6FF00D274AF6DF037FC93EF0DFF
        00D82AD7FF00452D7896B3FF0027551FFD7DDB7FE93A502427ED01FF00250742
        FF00AF44FF00D1AD5B1FB49FFC787877FEBACFFC92B1FF00680FF9283A17FD7A
        27FE8D6AD8FDA4FF00E3C3C3BFF5D67FE49401F3E576DF087FE4AAE83FF5D5FF
        00F45B57135DB7C21FF92ABA0FFD757FFD16D4CA3B6F883FF271FA0FFD7DE9FF
        00FA3168FDA43FE461D13FEBD1FF00F43A3E20FF00C9C7E83FF5F7A7FF00E8C5
        A3F690FF00918744FF00AF47FF00D0E908DFFDA43FE45FD13FEBE9FF00F40A3E
        20FF00C9B8683FF5EB61FF00A2D68FDA43FE45FD13FEBE9FFF0040A3E20FFC9B
        8683FF005EB61FFA2D6811D7FC15FF009247A1FF00DB7FFD1F2577D5C0FC15FF
        009247A1FF00DB7FFD1F2577D401E07FB4B7FCCB1FF6F7FF00B46BC0EBDF3F69
        6FF9963FEDEFFF0068D781D31A3E8BD63FE4D563FF00AF5B7FFD284ADFF80BFF
        0024C61FFAFB9BF98AC0D63FE4D563FF00AF5B7FFD284ADFF80BFF0024C61FFA
        FB9BF98A42391FDA5BFE658FFB7BFF00DA3581FB3AFF00C941BFFF00B0549FFA
        362ADFFDA5BFE658FF00B7BFFDA3581FB3AFFC941BFF00FB0549FF00A362A07D
        0F5DF8D5FF00248F5CFF00B61FFA3E3AF993C0DFF2507C37FF00615B5FFD1AB5
        F4DFC6AFF9247AE7FDB0FF00D1F1D7CC9E06FF009283E1BFFB0ADAFF00E8D5A6
        08F4DF8DDFF2587C3DFF005E96DFFA5125687ED2DFF32C7FDBDFFED1ACFF008D
        DFF2587C3DFF005E96DFFA5125687ED2DFF32C7FDBDFFED1A407B6685FF22F69
        9FF5E917FE802B42B3F42FF917B4CFFAF48BFF004015A14127CE7F107FE4E3F4
        1FFAFBD3FF00F462D7D195F39FC41FF938FD07FEBEF4FF00FD18B5F465036789
        7ED21FF22FE89FF5F4FF00FA057A7781BFE49F786FFEC156BFFA296BCC7F690F
        F917F44FFAFA7FFD02BD3BC0DFF24FBC37FF0060AB5FFD14B40743C4B59FF93A
        A8FF00EBEEDBFF0049D2BDF35DFF00917B53FF00AF497FF4035E07ACFF00C9D5
        47FF005F76DFFA4E95EF9AEFFC8BDA9FFD7A4BFF00A01A019F0BD7AEFECEBFF2
        506FFF00EC1527FE8D8ABC8ABD77F675FF0092837FFF0060A93FF46C54C6CBFA
        37FC9D549FF5F773FF00A4EF4BF103FE4E4341FF00AFBD3FFF00462D268DFF00
        275527FD7DDCFF00E93BD2FC40FF009390D07FEBEF4FFF00D18B480FA3E8A28A
        00F9BFF690FF00918744FF00AF47FF00D0EB7FF690FF00917F44FF00AFA7FF00
        D02B03F690FF00918744FF00AF47FF00D0EB7FF690FF00917F44FF00AFA7FF00
        D02803D3BC0DFF0024FBC37FF60AB5FF00D14B5F327C6AFF0092B9AE7FDB0FFD
        111D7D37E06FF927DE1BFF00B055AFFE8A5AF993E357FC95CD73FED87FE888E8
        123D77F675FF00927D7FFF0061593FF4545581FB4B7FCCB1FF006F7FFB46B7FF
        00675FF927D7FF00F61593FF004545581FB4B7FCCB1FF6F7FF00B4680EA7B668
        5FF22F699FF5E917FE802BC0FF00E6EABFEDEFFF006DEBDF342FF917B4CFFAF4
        8BFF004015E07FF3755FF6F7FF00B6F4023DD3C59FF226EB9FF60FB8FF00D16D
        5F0FD7DC1E2CFF0091375CFF00B07DC7FE8B6AF87E81A3E8BF8FFF00F24FB40F
        FAFA4FFD14D5E73F03BFE4AAE9BFF5CA7FFD16D5E8DF1FFF00E49F681FF5F49F
        FA29ABCE7E077FC955D37FEB94FF00FA2DA80E81F1C7FE4AAEA5FF005CA0FF00
        D16B5C0D97FC7FDBFF00D755FE62BBEF8E3FF255752FFAE507FE8B5AE06CBFE3
        FEDFFEBAAFF314C0FBC6BC8BF68AFF00927D61FF006158FF00F454B5EBB5E45F
        B457FC93EB0FFB0AC7FF00A2A5A4247917C15FF92B9A1FFDB7FF00D112575DF1
        07FE4E3F41FF00AFBD3FFF00462D723F057FE4AE687FF6DFFF0044495D77C41F
        F938FD07FEBEF4FF00FD18B4C7D4FA32BE07AFBE2BE07A408FB67C0DFF0024FB
        C37FF60AB5FF00D14B5E25ACFF00C9D547FF005F76DFFA4E95EDBE06FF00927D
        E1BFFB055AFF00E8A5AF12D67FE4EAA3FF00AFBB6FFD274A0484FDA03FE4A0E8
        5FF5E89FFA35AB63F693FF008F0F0EFF00D759FF0092563FED01FF00250742FF
        00AF44FF00D1AD5B1FB49FFC787877FEBACFFC92803E7CAEDBE10FFC955D07FE
        BABFFE8B6AE26BB6F843FF00255741FF00AEAFFF00A2DA99476DF107FE4E3F41
        FF00AFBD3FFF00462D1FB487FC8C3A27FD7A3FFE8747C41FF938FD07FEBEF4FF
        00FD18B47ED21FF230E89FF5E8FF00FA1D211BFF00B487FC8BFA27FD7D3FFE81
        47C41FF9370D07FEBD6C3FF45AD1FB487FC8BFA27FD7D3FF00E8147C41FF0093
        70D07FEBD6C3FF0045AD023AFF0082BFF248F43FFB6FFF00A3E4AEFAB81F82BF
        F248F43FFB6FFF00A3E4AEFA803C0FF696FF009963FEDEFF00F68D781D7BE7ED
        2DFF0032C7FDBDFF00ED1AF03A6347D17AC7FC9AAC7FF5EB6FFF00A5095BFF00
        017FE498C3FF005F737F31581AC7FC9AAC7FF5EB6FFF00A5095BFF00017FE498
        C3FF005F737F31484723FB4B7FCCB1FF006F7FFB46B03F675FF92837FF00F60A
        93FF0046C55BFF00B4B7FCCB1FF6F7FF00B46B03F675FF0092837FFF0060A93F
        F46C540FA1EBBF1ABFE491EB9FF6C3FF0047C75F32781BFE4A0F86FF00EC2B6B
        FF00A356BE9BF8D5FF00248F5CFF00B61FFA3E3AF993C0DFF2507C37FF00615B
        5FFD1AB4C11E9BF1BBFE4B0F87BFEBD2DBFF004A24AD0FDA5BFE658FFB7BFF00
        DA359FF1BBFE4B0F87BFEBD2DBFF004A24AD0FDA5BFE658FFB7BFF00DA3480F6
        CD0BFE45ED33FEBD22FF00D00568567E85FF0022F699FF005E917FE802B42824
        F9CFE20FFC9C7E83FF005F7A7FFE8C5AFA32BE73F883FF00271FA0FF00D7DE9F
        FF00A316BE8CA06CF12FDA43FE45FD13FEBE9FFF0040AF4EF037FC93EF0DFF00
        D82AD7FF00452D798FED21FF0022FE89FF005F4FFF00A057A7781BFE49F786FF
        00EC156BFF00A29680E87896B3FF0027551FFD7DDB7FE93A57BE6BBFF22F6A7F
        F5E92FFE806BC0F59FF93AA8FF00EBEEDBFF0049D2BDF35DFF00917B53FF00AF
        497FF4034033E17AF5DFD9D7FE4A0DFF00FD82A4FF00D1B1579157AEFECEBFF2
        506FFF00EC1527FE8D8A98D97F46FF0093AA93FEBEEE7FF49DE97E207FC9C868
        3FF5F7A7FF00E8C5A4D1BFE4EAA4FF00AFBB9FFD277A5F881FF2721A0FFD7DE9
        FF00FA316901F47D1451401F37FED21FF230E89FF5E8FF00FA1D6FFED21FF22F
        E89FF5F4FF00FA05607ED21FF230E89FF5E8FF00FA1D6FFED21FF22FE89FF5F4
        FF00FA05007A7781BFE49F786FFEC156BFFA296BE64F8D5FF25735CFFB61FF00
        A223AFA6FC0DFF0024FBC37FF60AB5FF00D14B5F327C6AFF0092B9AE7FDB0FFD
        111D0247AEFECEBFF24FAFFF00EC2B27FE8A8AB03F696FF9963FEDEFFF0068D6
        FF00ECEBFF0024FAFF00FEC2B27FE8A8AB03F696FF009963FEDEFF00F68D01D4
        F6CD0BFE45ED33FEBD22FF00D005781FFCDD57FDBDFF00EDBD7BE685FF0022F6
        99FF005E917FE802BC0FFE6EABFEDEFF00F6DE8047BA78B3FE44DD73FEC1F71F
        FA2DABE1FAFB83C59FF226EB9FF60FB8FF00D16D5F0FD0347D17F1FF00FE49F6
        81FF005F49FF00A29ABCE7E077FC955D37FEB94FFF00A2DABD1BE3FF00FC93ED
        03FEBE93FF00453579CFC0EFF92ABA6FFD729FFF0045B501D03E38FF00C955D4
        BFEB941FFA2D6B81B2FF008FFB7FFAEABFCC577DF1C7FE4AAEA5FF005CA0FF00
        D16B5C0D97FC7FDBFF00D755FE62981F78D7917ED15FF24FAC3FEC2B1FFE8A96
        BD76BC8BF68AFF00927D61FF006158FF00F454B4848F22F82BFF00257343FF00
        B6FF00FA224AEBBE20FF00C9C7E83FF5F7A7FF00E8C5AE47E0AFFC95CD0FFEDB
        FF00E8892BAEF883FF00271FA0FF00D7DE9FFF00A31698FA9F4657C0F5F7C57C
        0F4811F6CF81BFE49F786FFEC156BFFA296BC4B59FF93AA8FF00EBEEDBFF0049
        D2BDB7C0DFF24FBC37FF0060AB5FFD14B5E25ACFFC9D547FF5F76DFF00A4E940
        909FB407FC941D0BFEBD13FF0046B56C7ED27FF1E1E1DFFAEB3FF24AC7FDA03F
        E4A0E85FF5E89FFA35AB63F693FF008F0F0EFF00D759FF00925007CF95DB7C21
        FF0092ABA0FF00D757FF00D16D5C4D76DF087FE4AAE83FF5D5FF00F45B5328ED
        BE20FF00C9C7E83FF5F7A7FF00E8C5A3F690FF00918744FF00AF47FF00D0E8F8
        83FF00271FA0FF00D7DE9FFF00A3168FDA43FE461D13FEBD1FFF0043A4237FF6
        90FF00917F44FF00AFA7FF00D028F883FF0026E1A0FF00D7AD87FE8B5A3F690F
        F917F44FFAFA7FFD028F883FF26E1A0FFD7AD87FE8B5A0475FF057FE491E87FF
        006DFF00F47C95DF5703F057FE491E87FF006DFF00F47C95DF500781FED2DFF3
        2C7FDBDFFED1AF03AF7CFDA5BFE658FF00B7BFFDA35E074C68FA2F58FF009355
        8FFEBD6DFF00F4A12B7FE02FFC93187FEBEE6FE62B0358FF0093558FFEBD6DFF
        00F4A12B7FE02FFC93187FEBEE6FE62908E47F696FF9963FEDEFFF0068D607EC
        EBFF002506FF00FEC1527FE8D8AB7FF696FF009963FEDEFF00F68D607ECEBFF2
        506FFF00EC1527FE8D8A81F43D77E357FC923D73FED87FE8F8EBE64F037FC941
        F0DFFD856D7FF46AD7D37F1ABFE491EB9FF6C3FF0047C75F32781BFE4A0F86FF
        00EC2B6BFF00A3569823D37E377FC961F0F7FD7A5B7FE94495A1FB4B7FCCB1FF
        006F7FFB46B3FE377FC961F0F7FD7A5B7FE94495A1FB4B7FCCB1FF006F7FFB46
        901ED9A17FC8BDA67FD7A45FFA00AD0ACFD0BFE45ED33FEBD22FFD005685049F
        39FC41FF00938FD07FEBEF4FFF00D18B5F4657CE7F107FE4E3F41FFAFBD3FF00
        F462D7D1940D9E25FB487FC8BFA27FD7D3FF00E815E9DE06FF00927DE1BFFB05
        5AFF00E8A5AF31FDA43FE45FD13FEBE9FF00F40AF4EF037FC93EF0DFFD82AD7F
        F452D01D0F12D67FE4EAA3FF00AFBB6FFD274AF7CD77FE45ED4FFEBD25FF00D0
        0D781EB3FF0027551FFD7DDB7FE93A57BE6BBFF22F6A7FF5E92FFE8068067C2F
        5EBBFB3AFF00C941BFFF00B0549FFA362AF22AF5DFD9D7FE4A0DFF00FD82A4FF
        00D1B1531B2FE8DFF275527FD7DDCFFE93BD2FC40FF9390D07FEBEF4FF00FD18
        B49A37FC9D549FF5F773FF00A4EF4BF103FE4E4341FF00AFBD3FFF00462D203E
        8FA28A2803E6FF00DA43FE461D13FEBD1FFF0043ADFF00DA43FE45FD13FEBE9F
        FF0040AC0FDA43FE461D13FEBD1FFF0043ADFF00DA43FE45FD13FEBE9FFF0040
        A00F4EF037FC93EF0DFF00D82AD7FF00452D7CC9F1ABFE4AE6B9FF006C3FF444
        75F4DF81BFE49F786FFEC156BFFA296BE64F8D5FF25735CFFB61FF00A223A048
        F5DFD9D7FE49F5FF00FD8564FF00D1515607ED2DFF0032C7FDBDFF00ED1ADFFD
        9D7FE49F5FFF00D8564FFD1515607ED2DFF32C7FDBDFFED1A03A9ED9A17FC8BD
        A67FD7A45FFA00AF03FF009BAAFF00B7BFFDB7AF7CD0BFE45ED33FEBD22FFD00
        5781FF00CDD57FDBDFFEDBD008F74F167FC89BAE7FD83EE3FF0045B57C3F5F70
        78B3FE44DD73FEC1F71FFA2DABE1FA068FA2FE3FFF00C93ED03FEBE93FF45357
        9CFC0EFF0092ABA6FF00D729FF00F45B57A37C7FFF00927DA07FD7D27FE8A6AF
        39F81DFF0025574DFF00AE53FF00E8B6A03A07C71FF92ABA97FD7283FF0045AD
        70365FF1FF006FFF005D57F98AEFBE38FF00C955D4BFEB941FFA2D6B81B2FF00
        8FFB7FFAEABFCC5303EF1AF22FDA2BFE49F587FD8563FF00D152D7AED7917ED1
        5FF24FAC3FEC2B1FFE8A969091E45F057FE4AE687FF6DFFF0044495D77C41FF9
        38FD07FEBEF4FF00FD18B5C8FC15FF0092B9A1FF00DB7FFD112575DF107FE4E3
        F41FFAFBD3FF00F462D31F53E8CAF81EBEF8AF81E9023ED9F037FC93EF0DFF00
        D82AD7FF00452D7896B3FF0027551FFD7DDB7FE93A57B6F81BFE49F786FF00EC
        156BFF00A296BC4B59FF0093AA8FFEBEEDBFF49D281213F680FF009283A17FD7
        A27FE8D6AD8FDA4FFE3C3C3BFF005D67FE4958FF00B407FC941D0BFEBD13FF00
        46B56C7ED27FF1E1E1DFFAEB3FF24A00F9F2BB6F843FF255741FFAEAFF00FA2D
        AB89AEDBE10FFC955D07FEBABFFE8B6A651DB7C41FF938FD07FEBEF4FF00FD18
        B47ED21FF230E89FF5E8FF00FA1D1F107FE4E3F41FFAFBD3FF00F462D1FB487F
        C8C3A27FD7A3FF00E874846FFED21FF22FE89FF5F4FF00FA051F107FE4DC341F
        FAF5B0FF00D16B47ED21FF0022FE89FF005F4FFF00A051F107FE4DC341FF00AF
        5B0FFD16B408EBFE0AFF00C923D0FF00EDBFFE8F92BBEAE07E0AFF00C923D0FF
        00EDBFFE8F92BBEA00F03FDA5BFE658FFB7BFF00DA35E075EF9FB4B7FCCB1FF6
        F7FF00B46BC0E98D1F45EB1FF26AB1FF00D7ADBFFE94256FFC05FF0092630FFD
        7DCDFCC5606B1FF26AB1FF00D7ADBFFE94256FFC05FF0092630FFD7DCDFCC521
        1C8FED2DFF0032C7FDBDFF00ED1AC0FD9D7FE4A0DFFF00D82A4FFD1B156FFED2
        DFF32C7FDBDFFED1AC0FD9D7FE4A0DFF00FD82A4FF00D1B1503E87AEFC6AFF00
        9247AE7FDB0FFD1F1D7CC9E06FF9283E1BFF00B0ADAFFE8D5AFA6FE357FC923D
        73FED87FE8F8EBE64F037FC941F0DFFD856D7FF46AD3047A6FC6EFF92C3E1EFF
        00AF4B6FFD2892B43F696FF9963FEDEFFF0068D67FC6EFF92C3E1EFF00AF4B6F
        FD2892B43F696FF9963FEDEFFF0068D203DB342FF917B4CFFAF48BFF004015A1
        59FA17FC8BDA67FD7A45FF00A00AD0A093E73F883FF271FA0FFD7DE9FF00FA31
        6BE8CAF9CFE20FFC9C7E83FF005F7A7FFE8C5AFA3281B3C4BF690FF917F44FFA
        FA7FFD02BD3BC0DFF24FBC37FF0060AB5FFD14B5E63FB487FC8BFA27FD7D3FFE
        815E9DE06FF927DE1BFF00B055AFFE8A5A03A1E25ACFFC9D547FF5F76DFF00A4
        E95EF9AEFF00C8BDA9FF00D7A4BFFA01AF03D67FE4EAA3FF00AFBB6FFD274AF7
        CD77FE45ED4FFEBD25FF00D00D00CF85EBD77F675FF92837FF00F60A93FF0046
        C55E455EBBFB3AFF00C941BFFF00B0549FFA362A6365FD1BFE4EAA4FFAFBB9FF
        00D277A5F881FF002721A0FF00D7DE9FFF00A3169346FF0093AA93FEBEEE7FF4
        9DE97E207FC9C8683FF5F7A7FF00E8C5A407D1F45145007CDFFB487FC8C3A27F
        D7A3FF00E875BFFB487FC8BFA27FD7D3FF00E81581FB487FC8C3A27FD7A3FF00
        E875BFFB487FC8BFA27FD7D3FF00E81401E9DE06FF00927DE1BFFB055AFF00E8
        A5AF993E357FC95CD73FED87FE888EBE9BF037FC93EF0DFF00D82AD7FF00452D
        7CC9F1ABFE4AE6B9FF006C3FF44474091EBBFB3AFF00C93EBFFF00B0AC9FFA2A
        2AC0FDA5BFE658FF00B7BFFDA35BFF00B3AFFC93EBFF00FB0AC9FF00A2A2AC0F
        DA5BFE658FFB7BFF00DA340753DB342FF917B4CFFAF48BFF004015E07FF3755F
        F6F7FF00B6F5EF9A17FC8BDA67FD7A45FF00A00AF03FF9BAAFFB7BFF00DB7A01
        1EE9E2CFF91375CFFB07DC7FE8B6AF87EBEE0F167FC89BAE7FD83EE3FF0045B5
        7C3F40D1F45FC7FF00F927DA07FD7D27FE8A6AF39F81DFF25574DFFAE53FFE8B
        6AF46F8FFF00F24FB40FFAFA4FFD14D5E73F03BFE4AAE9BFF5CA7FFD16D40740
        F8E3FF00255752FF00AE507FE8B5AE06CBFE3FEDFF00EBAAFF00315DF7C71FF9
        2ABA97FD7283FF0045AD70365FF1FF006FFF005D57F98A607DE35E45FB457FC9
        3EB0FF00B0AC7FFA2A5AF5DAF22FDA2BFE49F587FD8563FF00D152D2123C8BE0
        AFFC95CD0FFEDBFF00E8892BAEF883FF00271FA0FF00D7DE9FFF00A316B91F82
        BFF257343FFB6FFF00A224AEBBE20FFC9C7E83FF005F7A7FFE8C5A63EA7D195F
        03D7DF15F03D2047DB3E06FF00927DE1BFFB055AFF00E8A5AF12D67FE4EAA3FF
        00AFBB6FFD274AF6DF037FC93EF0DFFD82AD7FF452D7896B3FF27551FF00D7DD
        B7FE93A502427ED01FF250742FFAF44FFD1AD5B1FB49FF00C787877FEBACFF00
        C92B1FF680FF009283A17FD7A27FE8D6AD8FDA4FFE3C3C3BFF005D67FE49401F
        3E576DF087FE4AAE83FF005D5FFF0045B57135DB7C21FF0092ABA0FF00D757FF
        00D16D4CA3B6F883FF00271FA0FF00D7DE9FFF00A3168FDA43FE461D13FEBD1F
        FF0043A3E20FFC9C7E83FF005F7A7FFE8C5A3F690FF918744FFAF47FFD0E908D
        FF00DA43FE45FD13FEBE9FFF0040A3E20FFC9B8683FF005EB61FFA2D68FDA43F
        E45FD13FEBE9FF00F40A3E20FF00C9B8683FF5EB61FF00A2D6811D7FC15FF924
        7A1FFDB7FF00D1F2577D5C0FC15FF9247A1FFDB7FF00D1F2577D401E07FB4B7F
        CCB1FF006F7FFB46BC0EBDF3F696FF009963FEDEFF00F68D781D31A3E8BD63FE
        4D563FFAF5B7FF00D284ADFF0080BFF24C61FF00AFB9BF98AC0D63FE4D563FFA
        F5B7FF00D284ADFF0080BFF24C61FF00AFB9BF98A42391FDA5BFE658FF00B7BF
        FDA3581FB3AFFC941BFF00FB0549FF00A362ADFF00DA5BFE658FFB7BFF00DA35
        81FB3AFF00C941BFFF00B0549FFA362A07D0F5DF8D5FF248F5CFFB61FF00A3E3
        AF993C0DFF002507C37FF615B5FF00D1AB5F4DFC6AFF009247AE7FDB0FFD1F1D
        7CC9E06FF9283E1BFF00B0ADAFFE8D5A608F4DF8DDFF002587C3DFF5E96DFF00
        A5125687ED2DFF0032C7FDBDFF00ED1ACFF8DDFF002587C3DFF5E96DFF00A512
        5687ED2DFF0032C7FDBDFF00ED1A407B6685FF0022F699FF005E917FE802B42B
        3F42FF00917B4CFF00AF48BFF4015A14127CE7F107FE4E3F41FF00AFBD3FFF00
        462D7D195F39FC41FF00938FD07FEBEF4FFF00D18B5F4650367897ED21FF0022
        FE89FF005F4FFF00A057A7781BFE49F786FF00EC156BFF00A296BCC7F690FF00
        917F44FF00AFA7FF00D02BD3BC0DFF0024FBC37FF60AB5FF00D14B40743C4B59
        FF0093AA8FFEBEEDBFF49D2BDF35DFF917B53FFAF497FF004035E07ACFFC9D54
        7FF5F76DFF00A4E95EF9AEFF00C8BDA9FF00D7A4BFFA01A019F0BD7AEFECEBFF
        002506FF00FEC1527FE8D8ABC8ABD77F675FF92837FF00F60A93FF0046C54C6C
        BFA37FC9D549FF005F773FFA4EF4BF103FE4E4341FFAFBD3FF00F462D268DFF2
        75527FD7DDCFFE93BD2FC40FF9390D07FEBEF4FF00FD18B480FA3E8A28A00F9B
        FF00690FF918744FFAF47FFD0EB7FF00690FF917F44FFAFA7FFD02B03F690FF9
        18744FFAF47FFD0EB7FF00690FF917F44FFAFA7FFD02803D3BC0DFF24FBC37FF
        0060AB5FFD14B5F327C6AFF92B9AE7FDB0FF00D111D7D37E06FF00927DE1BFFB
        055AFF00E8A5AF993E357FC95CD73FED87FE888E8123D77F675FF927D7FF00F6
        1593FF004545581FB4B7FCCB1FF6F7FF00B46B7FF675FF00927D7FFF0061593F
        F4545581FB4B7FCCB1FF006F7FFB4680EA7B6685FF0022F699FF005E917FE802
        BC0FFE6EABFEDEFF00F6DEBDF342FF00917B4CFF00AF48BFF4015E07FF003755
        FF006F7FFB6F4023DD3C59FF00226EB9FF0060FB8FFD16D5F0FD7DC1E2CFF913
        75CFFB07DC7FE8B6AF87E81A3E8BF8FF00FF0024FB40FF00AFA4FF00D14D5E73
        F03BFE4AAE9BFF005CA7FF00D16D5E8DF1FF00FE49F681FF005F49FF00A29ABC
        E7E077FC955D37FEB94FFF00A2DA80E81F1C7FE4AAEA5FF5CA0FFD16B5C0D97F
        C7FDBFFD755FE62BBEF8E3FF00255752FF00AE507FE8B5AE06CBFE3FEDFF00EB
        AAFF00314C0FBC6BC8BF68AFF927D61FF6158FFF00454B5EBB5E45FB457FC93E
        B0FF00B0AC7FFA2A5A4247917C15FF0092B9A1FF00DB7FFD112575DF107FE4E3
        F41FFAFBD3FF00F462D723F057FE4AE687FF006DFF00F44495D77C41FF00938F
        D07FEBEF4FFF00D18B4C7D4FA32BE07AFBE2BE07A408FB67C0DFF24FBC37FF00
        60AB5FFD14B5E25ACFFC9D547FF5F76DFF00A4E95EDBE06FF927DE1BFF00B055
        AFFE8A5AF12D67FE4EAA3FFAFBB6FF00D274A0484FDA03FE4A0E85FF005E89FF
        00A35AB63F693FF8F0F0EFFD759FF92563FED01FF250742FFAF44FFD1AD5B1FB
        49FF00C787877FEBACFF00C92803E7CAEDBE10FF00C955D07FEBABFF00E8B6AE
        26BB6F843FF255741FFAEAFF00FA2DA99476DF107FE4E3F41FFAFBD3FF00F462
        D1FB487FC8C3A27FD7A3FF00E8747C41FF00938FD07FEBEF4FFF00D18B47ED21
        FF00230E89FF005E8FFF00A1D211BFFB487FC8BFA27FD7D3FF00E8147C41FF00
        9370D07FEBD6C3FF0045AD1FB487FC8BFA27FD7D3FFE8147C41FF9370D07FEBD
        6C3FF45AD023AFF82BFF00248F43FF00B6FF00FA3E4AEFAB81F82BFF00248F43
        FF00B6FF00FA3E4AEFA803C0FF00696FF9963FEDEFFF0068D781D7BE7ED2DFF3
        2C7FDBDFFED1AF03A6347D17AC7FC9AAC7FF005EB6FF00FA5095BFF017FE498C
        3FF5F737F31581AC7FC9AAC7FF005EB6FF00FA5095BFF017FE498C3FF5F737F3
        1484723FB4B7FCCB1FF6F7FF00B46B03F675FF0092837FFF0060A93FF46C55BF
        FB4B7FCCB1FF006F7FFB46B03F675FF92837FF00F60A93FF0046C540FA1EBBF1
        ABFE491EB9FF006C3FF47C75F32781BFE4A0F86FFEC2B6BFFA356BE9BF8D5FF2
        48F5CFFB61FF00A3E3AF993C0DFF002507C37FF615B5FF00D1AB4C11E9BF1BBF
        E4B0F87BFEBD2DBFF4A24AD0FDA5BFE658FF00B7BFFDA359FF001BBFE4B0F87B
        FEBD2DBFF4A24AD0FDA5BFE658FF00B7BFFDA3480F6CD0BFE45ED33FEBD22FFD
        00568567E85FF22F699FF5E917FE802B42824F9CFE20FF00C9C7E83FF5F7A7FF
        00E8C5AFA32BE73F883FF271FA0FFD7DE9FF00FA316BE8CA06CF12FDA43FE45F
        D13FEBE9FF00F40AF4EF037FC93EF0DFFD82AD7FF452D798FED21FF22FE89FF5
        F4FF00FA057A7781BFE49F786FFEC156BFFA29680E87896B3FF27551FF00D7DD
        B7FE93A57BE6BBFF0022F6A7FF005E92FF00E806BC0F59FF0093AA8FFEBEEDBF
        F49D2BDF35DFF917B53FFAF497FF004034033E17AF5DFD9D7FE4A0DFFF00D82A
        4FFD1B1579157AEFECEBFF002506FF00FEC1527FE8D8A98D97F46FF93AA93FEB
        EEE7FF0049DE97E207FC9C8683FF005F7A7FFE8C5A4D1BFE4EAA4FFAFBB9FF00
        D277A5F881FF002721A0FF00D7DE9FFF00A316901F47D1451401F37FED21FF00
        230E89FF005E8FFF00A1D6FF00ED21FF0022FE89FF005F4FFF00A05607ED21FF
        00230E89FF005E8FFF00A1D6FF00ED21FF0022FE89FF005F4FFF00A05007A778
        1BFE49F786FF00EC156BFF00A296BE64F8D5FF0025735CFF00B61FFA223AFA6F
        C0DFF24FBC37FF0060AB5FFD14B5F327C6AFF92B9AE7FDB0FF00D111D0247AEF
        ECEBFF0024FAFF00FEC2B27FE8A8AB03F696FF009963FEDEFF00F68D6FFECEBF
        F24FAFFF00EC2B27FE8A8AB03F696FF9963FEDEFFF0068D01D4F6CD0BFE45ED3
        3FEBD22FFD005781FF00CDD57FDBDFFEDBD7BE685FF22F699FF5E917FE802BC0
        FF00E6EABFEDEFFF006DE8047BA78B3FE44DD73FEC1F71FF00A2DABE1FAFB83C
        59FF00226EB9FF0060FB8FFD16D5F0FD0347D17F1FFF00E49F681FF5F49FFA29
        ABCE7E077FC955D37FEB94FF00FA2DABD1BE3FFF00C93ED03FEBE93FF453579C
        FC0EFF0092ABA6FF00D729FF00F45B501D03E38FFC955D4BFEB941FF00A2D6B8
        1B2FF8FF00B7FF00AEABFCC577DF1C7FE4AAEA5FF5CA0FFD16B5C0D97FC7FDBF
        FD755FE62981F78D7917ED15FF0024FAC3FEC2B1FF00E8A96BD76BC8BF68AFF9
        27D61FF6158FFF00454B4848F22F82BFF257343FFB6FFF00A224AEBBE20FFC9C
        7E83FF005F7A7FFE8C5AE47E0AFF00C95CD0FF00EDBFFE8892BAEF883FF271FA
        0FFD7DE9FF00FA31698FA9F4657C0F5F7C57C0F4811F6CF81BFE49F786FF00EC
        156BFF00A296BC4B59FF0093AA8FFEBEEDBFF49D2BDB7C0DFF0024FBC37FF60A
        B5FF00D14B5E25ACFF00C9D547FF005F76DFFA4E940909FB407FC941D0BFEBD1
        3FF46B56C7ED27FF001E1E1DFF00AEB3FF0024AC7FDA03FE4A0E85FF005E89FF
        00A35AB63F693FF8F0F0EFFD759FF925007CF95DB7C21FF92ABA0FFD757FFD16
        D5C4D76DF087FE4AAE83FF005D5FFF0045B5328EDBE20FFC9C7E83FF005F7A7F
        FE8C5A3F690FF918744FFAF47FFD0E8F883FF271FA0FFD7DE9FF00FA3168FDA4
        3FE461D13FEBD1FF00F43A4237FF00690FF917F44FFAFA7FFD028F883FF26E1A
        0FFD7AD87FE8B5A3F690FF00917F44FF00AFA7FF00D028F883FF0026E1A0FF00
        D7AD87FE8B5A0475FF00057FE491E87FF6DFFF0047C95DF5703F057FE491E87F
        F6DFFF0047C95DF500781FED2DFF0032C7FDBDFF00ED1AF03AF7CFDA5BFE658F
        FB7BFF00DA35E074C68FA2F58FF93558FF00EBD6DFFF004A12B7FE02FF00C931
        87FEBEE6FE62B0358FF93558FF00EBD6DFFF004A12B7FE02FF00C93187FEBEE6
        FE62908E47F696FF009963FEDEFF00F68D607ECEBFF2506FFF00EC1527FE8D8A
        B7FF00696FF9963FEDEFFF0068D607ECEBFF002506FF00FEC1527FE8D8A81F43
        D77E357FC923D73FED87FE8F8EBE64F037FC941F0DFF00D856D7FF0046AD7D37
        F1ABFE491EB9FF006C3FF47C75F32781BFE4A0F86FFEC2B6BFFA3569823D37E3
        77FC961F0F7FD7A5B7FE94495A1FB4B7FCCB1FF6F7FF00B46B3FE377FC961F0F
        7FD7A5B7FE94495A1FB4B7FCCB1FF6F7FF00B46901ED9A17FC8BDA67FD7A45FF
        00A00AD0ACFD0BFE45ED33FEBD22FF00D005685049F39FC41FF938FD07FEBEF4
        FF00FD18B5F4657CE7F107FE4E3F41FF00AFBD3FFF00462D7D1940D9E25FB487
        FC8BFA27FD7D3FFE815E9DE06FF927DE1BFF00B055AFFE8A5AF31FDA43FE45FD
        13FEBE9FFF0040AF4EF037FC93EF0DFF00D82AD7FF00452D01D0F12D67FE4EAA
        3FFAFBB6FF00D274AF7CD77FE45ED4FF00EBD25FFD00D781EB3FF27551FF00D7
        DDB7FE93A57BE6BBFF0022F6A7FF005E92FF00E8068067C2F5EBBFB3AFFC941B
        FF00FB0549FF00A362AF22AF5DFD9D7FE4A0DFFF00D82A4FFD1B1531B2FE8DFF
        00275527FD7DDCFF00E93BD2FC40FF009390D07FEBEF4FFF00D18B49A37FC9D5
        49FF005F773FFA4EF4BF103FE4E4341FFAFBD3FF00F462D203E8FA28A2803E6F
        FDA43FE461D13FEBD1FF00F43ADFFDA43FE45FD13FEBE9FF00F40AC0FDA43FE4
        61D13FEBD1FF00F43ADFFDA43FE45FD13FEBE9FF00F40A00F4EF037FC93EF0DF
        FD82AD7FF452D7CC9F1ABFE4AE6B9FF6C3FF0044475F4DF81BFE49F786FF00EC
        156BFF00A296BE64F8D5FF0025735CFF00B61FFA223A048F5DFD9D7FE49F5FFF
        00D8564FFD1515607ED2DFF32C7FDBDFFED1ADFF00D9D7FE49F5FF00FD8564FF
        00D1515607ED2DFF0032C7FDBDFF00ED1A03A9ED9A17FC8BDA67FD7A45FF00A0
        0AF03FF9BAAFFB7BFF00DB7AF7CD0BFE45ED33FEBD22FF00D005781FFCDD57FD
        BDFF00EDBD008F74F167FC89BAE7FD83EE3FF45B57C3F5F7078B3FE44DD73FEC
        1F71FF00A2DABE1FA068FA2FE3FF00FC93ED03FEBE93FF00453579CFC0EFF92A
        BA6FFD729FFF0045B57A37C7FF00F927DA07FD7D27FE8A6AF39F81DFF25574DF
        FAE53FFE8B6A03A07C71FF0092ABA97FD7283FF45AD70365FF001FF6FF00F5D5
        7F98AEFBE38FFC955D4BFEB941FF00A2D6B81B2FF8FF00B7FF00AEABFCC5303E
        F1AF22FDA2BFE49F587FD8563FFD152D7AED7917ED15FF0024FAC3FEC2B1FF00
        E8A969091E45F057FE4AE687FF006DFF00F44495D77C41FF00938FD07FEBEF4F
        FF00D18B5C8FC15FF92B9A1FFDB7FF00D112575DF107FE4E3F41FF00AFBD3FFF
        00462D31F53E8CAF81EBEF8AF81E9023ED9F037FC93EF0DFFD82AD7FF452D789
        6B3FF27551FF00D7DDB7FE93A57B6F81BFE49F786FFEC156BFFA296BC4B59FF9
        3AA8FF00EBEEDBFF0049D281213F680FF9283A17FD7A27FE8D6AD8FDA4FF00E3
        C3C3BFF5D67FE4958FFB407FC941D0BFEBD13FF46B56C7ED27FF001E1E1DFF00
        AEB3FF0024A00F9F2BB6F843FF00255741FF00AEAFFF00A2DAB89AEDBE10FF00
        C955D07FEBABFF00E8B6A651DB7C41FF00938FD07FEBEF4FFF00D18B47ED21FF
        00230E89FF005E8FFF00A1D1F107FE4E3F41FF00AFBD3FFF00462D1FB487FC8C
        3A27FD7A3FFE874846FF00ED21FF0022FE89FF005F4FFF00A051F107FE4DC341
        FF00AF5B0FFD16B47ED21FF22FE89FF5F4FF00FA051F107FE4DC341FFAF5B0FF
        00D16B408EBFE0AFFC923D0FFEDBFF00E8F92BBEAE07E0AFFC923D0FFEDBFF00
        E8F92BBEA00F03FDA5BFE658FF00B7BFFDA35E075EF9FB4B7FCCB1FF006F7FFB
        46BC0E98D1F45EB1FF0026AB1FFD7ADBFF00E94256FF00C05FF92630FF00D7DC
        DFCC5606B1FF0026AB1FFD7ADBFF00E94256FF00C05FF92630FF00D7DCDFCC52
        11C8FED2DFF32C7FDBDFFED1AC0FD9D7FE4A0DFF00FD82A4FF00D1B156FF00ED
        2DFF0032C7FDBDFF00ED1AC0FD9D7FE4A0DFFF00D82A4FFD1B1503E87AEFC6AF
        F9247AE7FDB0FF00D1F1D7CC9E06FF009283E1BFFB0ADAFF00E8D5AFA6FE357F
        C923D73FED87FE8F8EBE64F037FC941F0DFF00D856D7FF0046AD3047A6FC6EFF
        0092C3E1EFFAF4B6FF00D2892B43F696FF009963FEDEFF00F68D67FC6EFF0092
        C3E1EFFAF4B6FF00D2892B43F696FF009963FEDEFF00F68D203DB342FF00917B
        4CFF00AF48BFF4015A159FA17FC8BDA67FD7A45FFA00AD0A093E73F883FF0027
        1FA0FF00D7DE9FFF00A316BE8CAF9CFE20FF00C9C7E83FF5F7A7FF00E8C5AFA3
        281B3C4BF690FF00917F44FF00AFA7FF00D02BD3BC0DFF0024FBC37FF60AB5FF
        00D14B5E63FB487FC8BFA27FD7D3FF00E815E9DE06FF00927DE1BFFB055AFF00
        E8A5A03A1E25ACFF00C9D547FF005F76DFFA4E95EF9AEFFC8BDA9FFD7A4BFF00
        A01AF03D67FE4EAA3FFAFBB6FF00D274AF7CD77FE45ED4FF00EBD25FFD00D00C
        F85EBD77F675FF0092837FFF0060A93FF46C55E455EBBFB3AFFC941BFF00FB05
        49FF00A362A6365FD1BFE4EAA4FF00AFBB9FFD277A5F881FF2721A0FFD7DE9FF
        00FA3169346FF93AA93FEBEEE7FF0049DE97E207FC9C8683FF005F7A7FFE8C5A
        407D1F45145007CDFF00B487FC8C3A27FD7A3FFE875BFF00B487FC8BFA27FD7D
        3FFE81581FB487FC8C3A27FD7A3FFE875BFF00B487FC8BFA27FD7D3FFE81401E
        9DE06FF927DE1BFF00B055AFFE8A5AF993E357FC95CD73FED87FE888EBE9BF03
        7FC93EF0DFFD82AD7FF452D7CC9F1ABFE4AE6B9FF6C3FF0044474091EBBFB3AF
        FC93EBFF00FB0AC9FF00A2A2AC0FDA5BFE658FFB7BFF00DA35BFFB3AFF00C93E
        BFFF00B0AC9FFA2A2AC0FDA5BFE658FF00B7BFFDA340753DB342FF00917B4CFF
        00AF48BFF4015E07FF003755FF006F7FFB6F5EF9A17FC8BDA67FD7A45FFA00AF
        03FF009BAAFF00B7BFFDB7A011EE9E2CFF0091375CFF00B07DC7FE8B6AF87EBE
        E0F167FC89BAE7FD83EE3FF45B57C3F40D1F45FC7FFF00927DA07FD7D27FE8A6
        AF39F81DFF0025574DFF00AE53FF00E8B6AF46F8FF00FF0024FB40FF00AFA4FF
        00D14D5E73F03BFE4AAE9BFF005CA7FF00D16D40740F8E3FF255752FFAE507FE
        8B5AE06CBFE3FEDFFEBAAFF315DF7C71FF0092ABA97FD7283FF45AD70365FF00
        1FF6FF00F5D57F98A607DE35E45FB457FC93EB0FFB0AC7FF00A2A5AF5DAF22FD
        A2BFE49F587FD8563FFD152D2123C8BE0AFF00C95CD0FF00EDBFFE8892BAEF88
        3FF271FA0FFD7DE9FF00FA316B91F82BFF00257343FF00B6FF00FA224AEBBE20
        FF00C9C7E83FF5F7A7FF00E8C5A63EA7D195F03D7DF15F03D2047DB3E06FF927
        DE1BFF00B055AFFE8A5AF12D67FE4EAA3FFAFBB6FF00D274AF6DF037FC93EF0D
        FF00D82AD7FF00452D7896B3FF0027551FFD7DDB7FE93A502427ED01FF002507
        42FF00AF44FF00D1AD5B1FB49FFC787877FEBACFFC92B1FF00680FF9283A17FD
        7A27FE8D6AD8FDA4FF00E3C3C3BFF5D67FE49401F3E576DF087FE4AAE83FF5D5
        FF00F45B57135DB7C21FF92ABA0FFD757FFD16D4CA3B6F883FF271FA0FFD7DE9
        FF00FA3168FDA43FE461D13FEBD1FF00F43A3E20FF00C9C7E83FF5F7A7FF00E8
        C5A3F690FF00918744FF00AF47FF00D0E908DFFDA43FE45FD13FEBE9FF00F40A
        3E20FF00C9B8683FF5EB61FF00A2D68FDA43FE45FD13FEBE9FFF0040A3E20FFC
        9B8683FF005EB61FFA2D6811D7FC15FF009247A1FF00DB7FFD1F2577D5C0FC15
        FF009247A1FF00DB7FFD1F2577D401E07FB4B7FCCB1FF6F7FF00B46BC0EBDF3F
        696FF9963FEDEFFF0068D781D31A3E8BD63FE4D563FF00AF5B7FFD284ADFF80B
        FF0024C61FFAFB9BF98AC0D63FE4D563FF00AF5B7FFD284ADFF80BFF0024C61F
        FAFB9BF98A42391FDA5BFE658FFB7BFF00DA3581FB3AFF00C941BFFF00B0549F
        FA362ADFFDA5BFE658FF00B7BFFDA3581FB3AFFC941BFF00FB0549FF00A362A0
        7D0F5DF8D5FF00248F5CFF00B61FFA3E3AF993C0DFF2507C37FF00615B5FFD1A
        B5F4DFC6AFF9247AE7FDB0FF00D1F1D7CC9E06FF009283E1BFFB0ADAFF00E8D5
        A608F4DF8DDFF2587C3DFF005E96DFFA5125687ED2DFF32C7FDBDFFED1ACFF00
        8DDFF2587C3DFF005E96DFFA5125687ED2DFF32C7FDBDFFED1A407B6685FF22F
        699FF5E917FE802B42B3F42FF917B4CFFAF48BFF004015A14127CE7F107FE4E3
        F41FFAFBD3FF00F462D7D195F39FC41FF938FD07FEBEF4FF00FD18B5F4650367
        897ED21FF22FE89FF5F4FF00FA057A7781BFE49F786FFEC156BFFA296BCC7F69
        0FF917F44FFAFA7FFD02BD3BC0DFF24FBC37FF0060AB5FFD14B40743C4B59FF9
        3AA8FF00EBEEDBFF0049D2BDF35DFF00917B53FF00AF497FF4035E07ACFF00C9
        D547FF005F76DFFA4E95EF9AEFFC8BDA9FFD7A4BFF00A01A019F0BD7AEFECEBF
        F2506FFF00EC1527FE8D8ABC8ABD77F675FF0092837FFF0060A93FF46C54C6CB
        FA37FC9D549FF5F773FF00A4EF4BF103FE4E4341FF00AFBD3FFF00462D268DFF
        00275527FD7DDCFF00E93BD2FC40FF009390D07FEBEF4FFF00D18B480FA3E8A2
        8A00F9BFF690FF00918744FF00AF47FF00D0EB7FF690FF00917F44FF00AFA7FF
        00D02B03F690FF00918744FF00AF47FF00D0EB7FF690FF00917F44FF00AFA7FF
        00D02803D3BC0DFF0024FBC37FF60AB5FF00D14B5F327C6AFF0092B9AE7FDB0F
        FD111D7D37E06FF927DE1BFF00B055AFFE8A5AF993E357FC95CD73FED87FE888
        E8123D77F675FF00927D7FFF0061593FF4545581FB4B7FCCB1FF006F7FFB46B7
        FF00675FF927D7FF00F61593FF004545581FB4B7FCCB1FF6F7FF00B4680EA7B6
        685FF22F699FF5E917FE802BC0FF00E6EABFEDEFFF006DEBDF342FF917B4CFFA
        F48BFF004015E07FF3755FF6F7FF00B6F4023DD3C59FF226EB9FF60FB8FF00D1
        6D5F0FD7DC1E2CFF0091375CFF00B07DC7FE8B6AF87E81A3E8BF8FFF00F24FB4
        0FFAFA4FFD14D5E73F03BFE4AAE9BFF5CA7FFD16D5E8DF1FFF00E49F681FF5F4
        9FFA29ABCE7E077FC955D37FEB94FF00FA2DA80E81F1C7FE4AAEA5FF005CA0FF
        00D16B5C0D97FC7FDBFF00D755FE62BBEF8E3FF255752FFAE507FE8B5AE06CBF
        E3FEDFFEBAAFF314C0FBC6BC8BF68AFF00927D61FF006158FF00F454B5EBB5E4
        5FB457FC93EB0FFB0AC7FF00A2A5A4247917C15FF92B9A1FFDB7FF00D112575D
        F107FE4E3F41FF00AFBD3FFF00462D723F057FE4AE687FF6DFFF0044495D77C4
        1FF938FD07FEBEF4FF00FD18B4C7D4FA32BE07AFBE2BE07A408FB67C0DFF0024
        FBC37FF60AB5FF00D14B5E25ACFF00C9D547FF005F76DFFA4E95EDBE06FF0092
        7DE1BFFB055AFF00E8A5AF12D67FE4EAA3FF00AFBB6FFD274A0484FDA03FE4A0
        E85FF5E89FFA35AB63F693FF008F0F0EFF00D759FF0092563FED01FF00250742
        FF00AF44FF00D1AD5B1FB49FFC787877FEBACFFC92803E7CAEDBE10FFC955D07
        FEBABFFE8B6AE26BB6F843FF00255741FF00AEAFFF00A2DA99476DF107FE4E3F
        41FF00AFBD3FFF00462D1FB487FC8C3A27FD7A3FFE8747C41FF938FD07FEBEF4
        FF00FD18B47ED21FF230E89FF5E8FF00FA1D211BFF00B487FC8BFA27FD7D3FFE
        8147C41FF9370D07FEBD6C3FF45AD1FB487FC8BFA27FD7D3FF00E8147C41FF00
        9370D07FEBD6C3FF0045AD023AFF0082BFF248F43FFB6FFF00A3E4AEFAB81F82
        BFF248F43FFB6FFF00A3E4AEFA803C0FF696FF009963FEDEFF00F68D781D7BE7
        ED2DFF0032C7FDBDFF00ED1AF03A6347D17AC7FC9AAC7FF5EB6FFF00A5095BFF
        00017FE498C3FF005F737F31581AC7FC9AAC7FF5EB6FFF00A5095BFF00017FE4
        98C3FF005F737F31484723FB4B7FCCB1FF006F7FFB46B03F675FF92837FF00F6
        0A93FF0046C55BFF00B4B7FCCB1FF6F7FF00B46B03F675FF0092837FFF0060A9
        3FF46C540FA1EBBF1ABFE491EB9FF6C3FF0047C75F32781BFE4A0F86FF00EC2B
        6BFF00A356BE9BF8D5FF00248F5CFF00B61FFA3E3AF993C0DFF2507C37FF0061
        5B5FFD1AB4C11E9BF1BBFE4B0F87BFEBD2DBFF004A24AD0FDA5BFE658FFB7BFF
        00DA359FF1BBFE4B0F87BFEBD2DBFF004A24AD0FDA5BFE658FFB7BFF00DA3480
        F6CD0BFE45ED33FEBD22FF00D00568567E85FF0022F699FF005E917FE802B428
        24F9CFE20FFC9C7E83FF005F7A7FFE8C5AFA32BE73F883FF00271FA0FF00D7DE
        9FFF00A316BE8CA06CF12FDA43FE45FD13FEBE9FFF0040AF4EF037FC93EF0DFF
        00D82AD7FF00452D798FED21FF0022FE89FF005F4FFF00A057A7781BFE49F786
        FF00EC156BFF00A29680E87896B3FF0027551FFD7DDB7FE93A57BE6BBFF22F6A
        7FF5E92FFE806BC0F59FF93AA8FF00EBEEDBFF0049D2BDF35DFF00917B53FF00
        AF497FF4034033E17AF5DFD9D7FE4A0DFF00FD82A4FF00D1B1579157AEFECEBF
        F2506FFF00EC1527FE8D8A98D97F46FF0093AA93FEBEEE7FF49DE97E207FC9C8
        683FF5F7A7FF00E8C5A4D1BFE4EAA4FF00AFBB9FFD277A5F881FF2721A0FFD7D
        E9FF00FA316901F47D1451401F37FED21FF230E89FF5E8FF00FA1D6FFED21FF2
        2FE89FF5F4FF00FA05607ED21FF230E89FF5E8FF00FA1D6FFED21FF22FE89FF5
        F4FF00FA05007A7781BFE49F786FFEC156BFFA296BE64F8D5FF25735CFFB61FF
        00A223AFA6FC0DFF0024FBC37FF60AB5FF00D14B5F327C6AFF0092B9AE7FDB0F
        FD111D0247AEFECEBFF24FAFFF00EC2B27FE8A8AB03F696FF9963FEDEFFF0068
        D6FF00ECEBFF0024FAFF00FEC2B27FE8A8AB03F696FF009963FEDEFF00F68D01
        D4F6CD0BFE45ED33FEBD22FF00D005781FFCDD57FDBDFF00EDBD7BE685FF0022
        F699FF005E917FE802BC0FFE6EABFEDEFF00F6DE8047BA78B3FE44DD73FEC1F7
        1FFA2DABE1FAFB83C59FF226EB9FF60FB8FF00D16D5F0FD0347D17F1FF00FE49
        F681FF005F49FF00A29ABCE7E077FC955D37FEB94FFF00A2DABD1BE3FF00FC93
        ED03FEBE93FF00453579CFC0EFF92ABA6FFD729FFF0045B501D03E38FF00C955
        D4BFEB941FFA2D6B81B2FF008FFB7FFAEABFCC577DF1C7FE4AAEA5FF005CA0FF
        00D16B5C0D97FC7FDBFF00D755FE62981F78D7917ED15FF24FAC3FEC2B1FFE8A
        96BD76BC8BF68AFF00927D61FF006158FF00F454B4848F22F82BFF00257343FF
        00B6FF00FA224AEBBE20FF00C9C7E83FF5F7A7FF00E8C5AE47E0AFFC95CD0FFE
        DBFF00E8892BAEF883FF00271FA0FF00D7DE9FFF00A31698FA9F4657C0F5F7C5
        7C0F4811F6CF81BFE49F786FFEC156BFFA296BC4B59FF93AA8FF00EBEEDBFF00
        49D2BDB7C0DFF24FBC37FF0060AB5FFD14B5E25ACFFC9D547FF5F76DFF00A4E9
        40909FB407FC941D0BFEBD13FF0046B56C7ED27FF1E1E1DFFAEB3FF24AC7FDA0
        3FE4A0E85FF5E89FFA35AB63F693FF008F0F0EFF00D759FF00925007CF95DB7C
        21FF0092ABA0FF00D757FF00D16D5C4D76DF087FE4AAE83FF5D5FF00F45B5328
        EDBE20FF00C9C7E83FF5F7A7FF00E8C5A3F690FF00918744FF00AF47FF00D0E8
        F883FF00271FA0FF00D7DE9FFF00A3168FDA43FE461D13FEBD1FFF0043A4237F
        F690FF00917F44FF00AFA7FF00D028F883FF0026E1A0FF00D7AD87FE8B5A3F69
        0FF917F44FFAFA7FFD028F883FF26E1A0FFD7AD87FE8B5A0475FF057FE491E87
        FF006DFF00F47C95DF5703F057FE491E87FF006DFF00F47C95DF500781FED2DF
        F32C7FDBDFFED1AF03AF7CFDA5BFE658FF00B7BFFDA35E074C68FA2F58FF0093
        558FFEBD6DFF00F4A12B7FE02FFC93187FEBEE6FE62B0358FF0093558FFEBD6D
        FF00F4A12B7FE02FFC93187FEBEE6FE62908E47F696FF9963FEDEFFF0068D607
        ECEBFF002506FF00FEC1527FE8D8AB7FF696FF009963FEDEFF00F68D607ECEBF
        F2506FFF00EC1527FE8D8A81F43D77E357FC923D73FED87FE8F8EBE64F037FC9
        41F0DFFD856D7FF46AD7D37F1ABFE491EB9FF6C3FF0047C75F32781BFE4A0F86
        FF00EC2B6BFF00A3569823D37E377FC961F0F7FD7A5B7FE94495A1FB4B7FCCB1
        FF006F7FFB46B3FE377FC961F0F7FD7A5B7FE94495A1FB4B7FCCB1FF006F7FFB
        46901ED9A17FC8BDA67FD7A45FFA00AD0ACFD0BFE45ED33FEBD22FFD00568504
        9F39FC41FF00938FD07FEBEF4FFF00D18B5F4657CE7F107FE4E3F41FFAFBD3FF
        00F462D7D1940D9E25FB487FC8BFA27FD7D3FF00E815E9DE06FF00927DE1BFFB
        055AFF00E8A5AF31FDA43FE45FD13FEBE9FF00F40AF4EF037FC93EF0DFFD82AD
        7FF452D01D0F12D67FE4EAA3FF00AFBB6FFD274AF7CD77FE45ED4FFEBD25FF00
        D00D781EB3FF0027551FFD7DDB7FE93A57BE6BBFF22F6A7FF5E92FFE8068067C
        2F5EBBFB3AFF00C941BFFF00B0549FFA362AF22AF5DFD9D7FE4A0DFF00FD82A4
        FF00D1B1531B2FE8DFF275527FD7DDCFFE93BD2FC40FF9390D07FEBEF4FF00FD
        18B49A37FC9D549FF5F773FF00A4EF4BF103FE4E4341FF00AFBD3FFF00462D20
        3E8FA28A2803E6FF00DA43FE461D13FEBD1FFF0043ADFF00DA43FE45FD13FEBE
        9FFF0040AC0FDA43FE461D13FEBD1FFF0043ADFF00DA43FE45FD13FEBE9FFF00
        40A00F4EF037FC93EF0DFF00D82AD7FF00452D7CC9F1ABFE4AE6B9FF006C3FF4
        4475F4DF81BFE49F786FFEC156BFFA296BE64F8D5FF25735CFFB61FF00A223A0
        48F5DFD9D7FE49F5FF00FD8564FF00D1515607ED2DFF0032C7FDBDFF00ED1ADF
        FD9D7FE49F5FFF00D8564FFD1515607ED2DFF32C7FDBDFFED1A03A9ED9A17FC8
        BDA67FD7A45FFA00AF2FFF008575AFFF00C2F5FF0084B7CBB7FECAF3FCCDDE68
        DF8F2767DDFAD7A6E932F93E16B1948C84B28DB1EB8406BC321F895F157C6133
        4FE1AD14416793B4C76C1D7E86493E527E98FA5008F76D7ACE5D43C3BA9D9400
        19AE2D258A30C70373210327EA6BE64FF850BE38FF009F7B1FFC0A15D23FC52F
        891E0AD4ED478C74C592D2739DAF0AA31507E6D8E876EE19E873DBD6BDF74CD4
        6D757D2ED751B293CCB6B9896589BD548C8FA1A0363CFBE2BF82758F17F84B4A
        D3B49485AE2DA757904926D181195E0FD4D71FF0C7E13F8A3C2BE3BB3D5F5386
        D56D2249558C738639642071F535EE77D79069DA7DCDF5D3ECB7B689A695BFBA
        AA0927F215F3FC1F10BE2978F352BB97C1B6BF67B085F0116384851D833CBC16
        EF81EBD2802EFC4EF84FE28F1578EEF357D321B56B4952255324E14E55003C7D
        457296DF027C6D15D43234165B55D58FFA48E80D6ECFF10FE29780F52B497C63
        6A2E2C666C1468E10180EA15E2E0377C1FCABE81B1BC8351D3EDAFAD5F7DBDCC
        4B344DFDE560083F91A00B15E7FF0017FC23AAF8CFC256BA7690913DC477C93B
        0964D83688E453CFD585751E29F1041E16F0C5FEB7728648ED23DC101C6F6242
        AAE7B658819F7AF0BD33C5DF19FC6225D4B404DB62F2108B1C36EB1AE3A85694
        64FE679A00B9F0DBE1278ABC31E3FD3358D4A1B55B4B7F37CC31CE18FCD13A8E
        3EAC2BA0F167C3AF106B1F18F4BF135A476E74DB69ED24919A501B11B82D81F4
        15CC3FC45F899E01D6EC9BC6F009EC6EB23CA290025411B991A2FE2191C13DFA
        77AFA1229639E149A260F1C8A19587420F20D003EBE54FF850BE38FF009F7B1F
        FC0A15F55D79DFC48F8ADA7782206B2B5F2EF35B65F96DF3F2C391C3498FC3E5
        EA7DBAD008EBFC31613E95E12D1B4EBA0A2E2D2C608250A72032C6AA707BF22B
        CD351F875E20B9F8EA9E2D8E3B7FECA13C3216328DF858550FCBF506AB7C1BF8
        87E25F17F89750B1D6EEE39A186D0CA8AB02A156DEA3B01D89AF69A00F1EF8B1
        F0EBC41E2FF16E97A8E931DBB5BDB5BAC7219250A722466E07D0D68FC65F036B
        5E36B5D223D1A385DAD5E5693CD94270C1718FC8D7A85717F123E205A7813423
        2FC936A9700ADA5B13D4F776FF00647EA703DC007847FC285F1C7FCFBD8FFE05
        0AE9BE1F7C20F167877C77A56ADA84368B696D2334852E031C1461C0FA915E8D
        F0D22F1BDE69CBABF8BB5877170B982C05B429B54F219CAA039F419E3BFA0EFE
        80B9F39FC41FF938FD07FEBEF4FF00FD18B47ED21FF230E89FF5E8FF00FA1D1F
        107FE4E3F41FFAFBD3FF00F462D1FB487FC8C3A27FD7A3FF00E8740CF41F8C7E
        0AD67C6BA4E996FA3A42F25BCECF279B204182B8A3C5BE0AD6758F83BA57866D
        1213A95B4168922B4802E63401B07EA2BD2E8A04729F0DB41BEF0C78034CD1F5
        2545BBB7F37CC11B6E1F34AEC39FA30AEAEBC8FE237C49D522D7ADBC21E083E7
        6B924816699115C447FB80302B9EEC4F0A3DF38F45F0D58EB161A3451EBDAB1D
        4F516F9A5944491A29FEEA8551C0F53C9F6E8011C0FC67F016B9E37FEC4FEC68
        E07FB1F9FE6F9B284C6FF2F18F5FBA6BCA7FE142F8E3FE7DEC7FF02857D575E6
        3F13BE29CBE10BCB6D1344B58EF75BB900ED7059620C70A368E599BB0CFA1EE2
        81DC7EA3E0AD66E7E052784A3487FB54410A15320D995995CFCDF406B57E15F8
        6752F0978263D2B5558D6E9679242237DC304F1CD79AB6BDF1D6284DDB69AE62
        0379416B0938F4DA3E6FC3AD771F0B3E28AF8EE29EC6FE08ADB58B65DEC91676
        4A99C6E50724609008C9EA0F7C000CAF8E1E0AF10F8C3FB07FB074FF00B5FD97
        ED1E77EFA38F6EEF2F6FDF619CED3D3D2B23E0BFC3DF14F84FC63777FADE97F6
        5B6934F7855FED113E5CC919030AC4F453F957BA535DD63467760A8A32CCC700
        0F53405CE4FE27E8BA8788BE1D6ABA56956FF68BD9FC9F2E2DEA9BB6CA8C7962
        00E013D6BC2BC29F08BC73A6F8C744BFBBD0FCBB6B6D4209A67FB5C076A2C8A5
        8E03E4F00F4AEBFC79F1EFEC1A8FD83C2496F72216226BC9D4B46E7D1002323F
        DAEFDB8E6BD43C03AEDDF897C0FA5EB17E22175728CD208976AE43B2F0327B01
        401C1FC4CF875E20F14FC43D2359D323B76B3B58218E4324A15B2B2BB1C0FA30
        AB7F19FC05AE78DFFB13FB1A381FEC7E7F9BE6CA131BFCBC63D7EE9AF55A4242
        A96620003249ED405CABA5DBC969A4595B4B812450246D839190A01AB75E29A9
        FC41F13F8D7C7ABE1FF87F7696D656B9175A8342922B0C805FE653F28E831CB1
        F6E9EC76304D6B630C3717925E4C8B87B891555A43EA428007E02811E4FE2CF8
        75E20D63E31E97E26B48EDCE9B6D3DA492334A03623705B03E82BD828AF069F5
        3F8EC2E25F2AC7F77BCECFDCDB74CF1DE819D77C63F056B3E35D274CB7D1D217
        92DE76793CD9020C15C576DE18B09F4AF0968DA75D0517169630412853901963
        55383DF915E217BE21F8E3A758CF7B796EB0DB411992591A1B6C2A81926BA6F8
        2DE34F1478CEE756975BB959AD2D92358CAC0A9F3B13DC019E07EA280391D67F
        E4EAA3FF00AFBB6FFD274AF7CD77FE45ED4FFEBD25FF00D00D781EB3FF002755
        1FFD7DDB7FE93A57BE6BBFF22F6A7FF5E92FFE8068067C2F5EBBFB3AFF00C941
        BFFF00B0549FFA362AF22AF5DFD9D7FE4A0DFF00FD82A4FF00D1B1531B2FE8DF
        F275527FD7DDCFFE93BD2FC40FF9390D07FEBEF4FF00FD18B49A37FC9D549FF5
        F773FF00A4EF4BF103FE4E4341FF00AFBD3FFF00462D203E8FA28A2803E6FF00
        DA43FE461D13FEBD1FFF0043ADFF00DA43FE45FD13FEBE9FFF0040AF4EF10782
        BC3BE299E19F5BD323BC9215291B33BAED04E71F29153F883C2BA278A60860D6
        EC12F23858BC6ACECBB491827E522815C83C0DFF0024FBC37FF60AB5FF00D14B
        5F327C6AFF0092B9AE7FDB0FFD111D7D6765676FA7D8DBD95A4622B6B789628A
        3049DA8A30073E800AE7757F871E11D7B549B53D53458AE6F26DBE64AD2382D8
        50A380C074005008E2FF00675FF927D7FF00F61593FF004545581FB4B7FCCB1F
        F6F7FF00B46BD9F40F0DE91E17B17B2D16C96D2D9E532B46ACCD9720027E627B
        28FCAA1F10F84340F15FD9BFB734E4BCFB36EF2773B2ECDD8DDF748EBB47E540
        5F52D688A1FC39A72B0054DA44082382360ABF1C51C312C5122A46A30AAA3000
        F402921863B78238225DB1C6A1117D001802BC47E23FC57D56E35E7F07F82D24
        6BCF33C896EA21990C9D0A47E98EEDEA0E318C9044FF00B41F88F4A1E1B83C3E
        258E6D4DEE52631A904C0A01E5BD09CE00EE09AEFF00E1A69D73A57C38D0ACEF
        159275B60CCADD57712C01F70180AE1FC03F04A2D3AE935BF16CABA86A4584AB
        6DB8BC68FD72E4FDF6CFE1F5AF63A0652D5F4E8F57D16FF4C958AC7796F25BBB
        0EA03A9527F5AF01F04789EEFE0D6AD7DE1AF16584E967712F9D15C42370CE36
        EF5FEF29017A7231D2BDBBC63E238BC25E13D435B910486DA3FDDC64E37B9215
        47D32467DB35E27E0BF036AFF16273E29F186A970FA7191960851B064C1C10A3
        A220231C72707A75A006F8DFC4F77F19B56B1F0D784AC277B3B797CF96E271B1
        738237B7F75402DD7939E99E2BDFF48D3A3D2345B1D32162D159DBC76E8CDD48
        450A09FCABC0BC69E06D5BE13DC0F14F83B53B84D3848AB3C0EDB8C793801874
        7424E39E46475EB5ED9E0EF11C5E2DF09E9FADC68233731FEF23073B1C12AC3E
        99071ED8A00E1FF682BA6B7F86E910CE2E6FE288FD02BBFF00EC95D3FC2EB65B
        4F863E1F8D0001AD049C7AB92C7F56AE4BF688467F87966C3A26A71B1FA79728
        FEB5D97C377593E1B7874A9C816318FC40C1FD4501D0E33F688B7593C03653E0
        6F8B514C1F631C808FCF1F9576DF0EEE8DE7C39F0F4CC496FB044849EA76AEDC
        FE95C77ED08EABF0E6004E0B6A3101EE76487FA5757F0C6368FE19F8795BA9B3
        56FC0E48FE740743ACAF2DF08FC23B6B1F14EA1E26F1008EEEF66BC966B5B727
        72420B92AEDFDE7C7E03DCF4F52A2811F3D7C0EFF92A5E27FF00AE32FF00E8F5
        AFA16BE7AF81DFF254BC4FFF005C65FF00D1EB5F42D0366478A3C4569E14F0E5
        EEB37B9315B26420383231E1547B9240FD6BE5FD13C65A56ADF1024F14F8E8DC
        5D08FE682D60883A0607E55C12308BD71CE4F5EF9F4CFDA3EFA58BC3BA358A92
        239EE9E57C1EA51703FF00433F95741E05F84FE17D3FC2B60FA8E976BA8DFDC4
        2B34D35C26F19619DAA0F000CE3DE8036BC27F13FC2FE31B9369A6DE3C77B824
        5B5CA796EC0775EA1BE80E7DABB1AF9BBE30F842D3C05AD68FE23F0D0FB07992
        9FDD464E239530C1973D88EA3A71EF5F436957C353D1ECAFC2EC1756F1CDB7D3
        72838FD6803E7EF883FF00271FA0FF00D7DE9FFF00A3168FDA43FE461D13FEBD
        1FFF0043AF6DBEF05787753F1041AEDE6991CBA9C0C8F1DC177054A1CA9C038E
        08F4A3C41E0AF0EF8A67867D6F4C8EF24854A46CCEEBB4139C7CA4501737EBCD
        FE2FFC427F05E82969A7B0FED7BF0CB0B67FD42743263D7B0F7E7B62BD22BE6A
        F88BA74BE32FDA023F0F4B334510F22DC38E4AC7E5895B1EFF00337E34022BFC
        2CF1BF837C1705C6A1AB2DFDD6B974C43CC900711A67A062D9249E49FA0ED93F
        42786FC55A378B74EFB768D7A971129C3AE36BC67D194F23FAF6AC98FE16F822
        3B11683C3764D185D9B9949908F5DF9DD9F7CD78FF00852D65F875F1F9BC3D69
        3BC9A7DD3792431E591D37A67DD4E067EBEB4C0FA3EBE76B668DFF006A790EA7
        8C8B8611799D37083F77FF00B2E3DF15F44D7937C55F85171E29BC5F10E81288
        B5A8D543C45B609B6FDD60DFC2E381CF1C0E98A407ACD7CDFA33C50FED452AE9
        81444F793ABAA7427C96327FE3C18FE1516B5AE7C65D0FC3931D62E5ECACA34F
        2DAE6430798D938015972C58FA8E78273C135ABFB3EF84E79AFAEFC5F7AA4A00
        D05AB3F25DCFFAC7FC07CB9EF96F4A00FA02B91F897A1EA7E24F045D691A41C5
        D5CC91264BEC509BC16DC7D319C8EFEF5D751408F01F1E7C3BD2BC07F07E78ED
        80B8D425B9845C5EBAE19F9FBABFDD5F6FCF35E8FF00083FE495683FF5CA4FFD
        18F591F1EBFE498CDFF5F70FF335AFF083FE495683FF005CA4FF00D18F40CEDE
        BC2BE3A7C459AD19BC21A54DE5BC880EA1329C10AC32221F50413EC40EE6BDD6
        BE5DF08786E0F88BF18F5A7D5D99ED229E7BA9A2DC41900936AC791C81C8FC06
        2804749F0EBE24F803C13A043A72A5F8BB9B0F7B77F651877FC189DA338031EA
        71926BDCF4CD52C75AD3A1D434DBA8EE6D265DD1CB19C83FE07D41E4572BAAFC
        28F066A7A5CD64BA1DA5A3BA109716D1849236C70C08EB8F43C1EF5E6FF00AFE
        F34CF147883C253C9E6450879860F0AF1C823623EBB87FDF22803DF68A2B8AF8
        AFE2893C29E00BDBBB7729797045ADBB0382AEE0E587B850C47B81408F33F897
        E2DD43E20F89E3F01785BF796C26DB73329F96575EB923FE59A75CF723D867D8
        BC1BE15B3F06F866DB47B4C3796374D2E306590FDE63FD3D0002B85F80DE1487
        4AF087F6F4D1837FAA1621C8E52107017F120B1F5F97D2BD66819F39EB3FF275
        51FF00D7DDB7FE93A57BE6BBFF0022F6A7FF005E92FF00E806A84BE0AF0ECFE2
        61E23974C8DB570CAE2E77BE72AA141C671D001D2B726863B88248255DD1C8A5
        1D7D411822803E0AAF5DFD9D7FE4A0DFFF00D82A4FFD1B157B27FC2A0F017FD0
        BB0FFDFE97FF008AAD5D03C09E19F0BDF3DEE8BA5476972F1189A4591DB28482
        47CC4F751F950173C5746FF93AA93FEBEEE7FF0049DE97E207FC9C8683FF005F
        7A7FFE8C5AF6C8BC15E1D83C4C7C4716991AEAE599CDCEF7CE594A938CE3A123
        A52DEF82BC3BA9F8860D76F34C8E5D4E078DE3B82EE0A9439538071C11E9405C
        E8A8A28A0647452ED3E946D3E94122514BB4FA51B4FA5002514BB4FA51B4FA50
        067EB778FA7E81A8DEC7F7EDED65957EAAA4FF004AF997E12F8DBC33E0DB9D47
        51D720BC9B529F090CB1461F6A725B92C392719FA57D4D3DBC7736F2413C6B24
        32A94746190CA460823D315CE7FC2B8F06FF00D0AFA57FE032D0338FFF008683
        F067FCF1D57FF01D7FF8BAF46D0F59B5F1068969AB590905B5D47E646245C363
        DC64D64FFC2B8F06FF00D0AFA57FE032D74165616DA759C567656F1DBDB44BB6
        38A350AAA3D00A00E5FE27787EEBC4DF0F754D36C50BDD9559614071BD91836D
        FA90081EE457917C30F8C161E12D097C37E21B4B9892D1E4F2668932572C58A3
        AF0410C5B9E7AE30315F466D3E9585AC782BC37AFDC0B8D5744B2BA9C0C79AF1
        0DE47A161C91F5A00F10F89FF17EC7C5DA13786FC3D69732A5DC91F9B34A982D
        860C11146492582F3ED8C1CD7AEFC31F0FDD7867E1EE97A6DEA14BB0AD2CC84F
        DC6762DB7EA0100FB835A5A3F82BC37A05C1B8D2B44B2B59C8C79A910DE07A06
        3C81F4ADDDA7D280388F8B3A0CFE22F873A9DA5A44D2DD4416E2245E4B146048
        03B9DBB801EB5E6FF0D7E33685A0783AD745D756EE39EC8B22491C7BD5D0B123
        BE4119C63D857BFED3E95CE6A7E00F0A6B178F797FE1FB19AE1F9797CB0ACE7D
        4918C9F73401E17F14BE215B7C486D27C3DE1AB5BB9C7DA3CC25D369924236A8
        55CF60CD927D6BE87D134D5D1F41D3B4C520AD9DB470023BED50B9FD2AAE8DE0
        FF000FF87A569748D1ACED2661B4CB1C63791E9BBAE3DAB6B69F4A004A29769F
        4A369F4A047CF3F03BFE4A9789FF00EB8CBFFA3D6BE85ACFB1F0FE8FA5DD4B75
        A7E916169712822496DEDD237704E4E48009E79AD1DA7D2819E69F1AFC1F79E2
        AF08452E9B0B4F7DA7CBE72C28B969108C32A8F5E871DF6E3AD71FE08F8F3A76
        9BE1DB6D33C4767762E6CE358526B640E2445181B812086C0C77CF5E2BDEF69F
        4AC2D43C13E19D56E9AEAFFC3FA6DC5C37DE964B642CDF538E6803E7DF15F887
        54F8D9E2CB0D2742D3E68B4FB663B5A4192A1B1BA5971C280070327DB24E2BE9
        7B3B58EC6C6DECE1188A0896241FECA8C0FE551699A369DA35B7D9B4CD3EDACA
        0CE4A5BC4A809F538EA6AEED3E94009452ED3E946D3E94084AF9FF00E3168DAB
        7863C7B65E3ED2A0F3211E5B4CE14911CA98501FFD965DA33F51E99FA0769F4A
        6C90ACD1B472C6AF1B0C32B00411E845033C7A2FDA2BC3474B12CBA66A4B7DB3
        9B755429BFD03EEE99EF8CFB5731F0D34DD6BC7DF14A4F1DEA56A61B189DA457
        C108CE17624684F5DA3049FF00679E4D7B31F87BE103379A7C31A4EFDDBBFE3D
        5319FA6315D0C36F1DBC290C31247120DAA8800551E800E9400EAA9A9EA765A3
        69B3EA3A8DC25BDA40BBE495CF007F53D801C9357369F4AA3AAE89A76B96AB6D
        AAD8C17902B6F11CEA19777AE0F7E6811F3CCF36B5F1E3C6CB6F1092CBC3962D
        927AF9699FBC7B191BB0EC3E849FA274DD36D347D32DF4EB08561B5B78C471C6
        BD80FEBEF4DD2F45D3B44B4369A5D85BD9DB962E6382308A58F5381DF81F955D
        DA7D28189452ED3E946D3E9408F30F8F5FF24C66FF00AFB87F99AD7F841FF24A
        B41FFAE527FE8C7AEA757D134ED7AC0D8EAB671DDDA960C6293A6474352E9BA5
        DA691A7C361A7DB25BDA42088E24E8A09CF1F89340CB35F34EAEDAAFC1CF8B37
        7AD25899F49D41E4298E16489D83B206ECCA40FC87635F4BED3E955EF74EB4D4
        AD5AD6FAD20BAB77FBD14F18753F5078A00F1FD63F689D0934991B47D3EFA5D4
        19711ADCC6A91A1F56218938F41D7D475A87E03784F53B69F52F166AD0C91497
        E9E5DB89170D22B30767C7A12171EBCFB57A6DB7807C27677093DBF86F4B4950
        E55C5AA654FA8E3AD743B4818028012BC53F690661E1CD1532769BB7247B84FF
        00EB9AF6CDA7D2A8EA5A2699ACC691EA9A659DF2467722DD40B2853EA03038A0
        0CCF01AAA7C3DF0D85000FECBB63F898949AE829905B456B6F15BDBC290C1120
        48E38D42AA28180001C00076A9369F4A004A29769F4A369F4A042514BB4FA51B
        4FA5002528EA28DA7D280A7340C7D145140CFFD9}
      Properties.ShowFocusRect = False
      Properties.Stretch = True
      Style.Edges = []
      TabOrder = 1
      Height = 23
      Width = 29
    end
    object btnSearchForAnimal: TcxButton
      Left = 423
      Top = 7
      Width = 93
      Height = 26
      Caption = 'Find Animal'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnSearchForAnimalClick
      Colors.Normal = 16629124
      LookAndFeel.Kind = lfOffice11
    end
  end
  object pWarningPanel: TPanel
    Left = 398
    Top = 374
    Width = 317
    Height = 77
    BevelInner = bvRaised
    BevelOuter = bvNone
    BorderWidth = 1
    Color = clRed
    TabOrder = 7
    Visible = False
    object lWarningPanelLabel: TcxLabel
      Left = 2
      Top = 2
      Align = alClient
      Caption = 'lWarningPanelLabel'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
    end
  end
  object pDelete: TPanel
    Left = 400
    Top = 459
    Width = 301
    Height = 189
    BorderStyle = bsSingle
    TabOrder = 5
    object Label1: TLabel
      Left = 24
      Top = 21
      Width = 241
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Caption = 'Please select desired option:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object rbDelete: TRadioGroup
      Left = 12
      Top = 52
      Width = 267
      Height = 85
      ItemIndex = 0
      Items.Strings = (
        '&Cancel'
        'Delete Selected &Row in Grid'
        'Delete Entire Purchase Input &Group')
      TabOrder = 0
    end
    object bOK: TButton
      Left = 108
      Top = 152
      Width = 75
      Height = 23
      Caption = 'OK'
      TabOrder = 1
      OnClick = bOKClick
    end
  end
  object tPurchGrpHeader: TTable
    BeforeInsert = tPurchGrpHeaderBeforeInsert
    BeforePost = tPurchGrpHeaderBeforePost
    BeforeDelete = tPurchGrpHeaderBeforeDelete
    DatabaseName = 'Kingswd'
    TableName = 'PurchGrpHeader.db'
    Left = 158
    Top = 419
    object tPurchGrpHeaderID: TAutoIncField
      FieldName = 'ID'
    end
    object tPurchGrpHeaderPurchGroupID: TIntegerField
      FieldName = 'PurchGroupID'
    end
    object tPurchGrpHeaderPurchGrpCode: TStringField
      FieldName = 'PurchGrpCode'
      Size = 6
    end
    object tPurchGrpHeaderPurchaseDate: TDateField
      FieldName = 'PurchaseDate'
    end
    object tPurchGrpHeaderSupplierID: TIntegerField
      FieldName = 'SupplierID'
    end
    object tPurchGrpHeaderSupplierCosts: TFloatField
      FieldName = 'SupplierCosts'
      currency = True
    end
    object tPurchGrpHeaderBuyerID: TIntegerField
      FieldName = 'BuyerID'
    end
    object tPurchGrpHeaderBuyerCosts: TFloatField
      FieldName = 'BuyerCosts'
      currency = True
    end
    object tPurchGrpHeaderSex: TStringField
      FieldName = 'Sex'
      Size = 10
    end
    object tPurchGrpHeaderNumber: TSmallintField
      FieldName = 'Number'
    end
    object tPurchGrpHeaderMartWeight: TFloatField
      FieldName = 'MartWeight'
      DisplayFormat = '##,##0.0kg'
    end
    object tPurchGrpHeaderMartCost: TFloatField
      FieldName = 'MartCost'
      currency = True
    end
    object tPurchGrpHeaderVAT: TFloatField
      FieldName = 'VAT'
      DisplayFormat = '#0.00%'
    end
    object tPurchGrpHeaderHerdID: TIntegerField
      FieldName = 'HerdID'
    end
    object tPurchGrpHeaderGroupID: TIntegerField
      FieldName = 'GroupID'
    end
    object tPurchGrpHeaderPenID: TIntegerField
      FieldName = 'PenID'
    end
    object tPurchGrpHeaderBreeding: TBooleanField
      FieldName = 'Breeding'
    end
    object tPurchGrpHeaderLactationNumber: TSmallintField
      FieldName = 'LactationNumber'
    end
    object tPurchGrpHeaderEventDesc: TStringField
      FieldName = 'EventDesc'
      Size = 30
    end
    object tPurchGrpHeaderOfficePhase1: TBooleanField
      FieldName = 'OfficePhase1'
    end
    object tPurchGrpHeaderTagWtVsMartWtVar: TFloatField
      FieldName = 'TagWtVsMartWtVar'
      DisplayFormat = '#0.00%'
    end
    object tPurchGrpHeaderDataPosted: TBooleanField
      FieldName = 'DataPosted'
    end
    object tPurchGrpHeaderTotWeight: TFloatField
      FieldName = 'TotWeight'
      DisplayFormat = '##,##0.0kg'
    end
    object tPurchGrpHeaderTotMartPrice: TFloatField
      FieldName = 'TotMartPrice'
      currency = True
    end
    object tPurchGrpHeaderTotCostIntoPen: TFloatField
      FieldName = 'TotCostIntoPen'
      currency = True
    end
    object tPurchGrpHeaderActualNumber: TSmallintField
      FieldName = 'ActualNumber'
    end
  end
  object dsPurchGrpHeader: TDataSource
    DataSet = tPurchGrpHeader
    Left = 74
    Top = 366
  end
  object tPurchGrpData: TTable
    AfterPost = tPurchGrpDataAfterPost
    AfterDelete = tPurchGrpDataAfterDelete
    OnNewRecord = tPurchGrpDataNewRecord
    DatabaseName = 'Kingswd'
    IndexName = 'iPurchGrpHeaderID'
    MasterFields = 'ID'
    MasterSource = dsPurchGrpHeader
    TableName = 'PurchGrpData.db'
    Left = 190
    Top = 418
    object tPurchGrpDataID: TAutoIncField
      FieldName = 'ID'
    end
    object tPurchGrpDataSeqNum: TSmallintField
      FieldName = 'SeqNum'
    end
    object tPurchGrpDataNatIDNum: TStringField
      FieldName = 'NatIDNum'
      OnGetText = tPurchGrpDataNatIDNumGetText
      OnSetText = tPurchGrpDataNatIDNumSetText
      OnValidate = tPurchGrpDataNatIDNumValidate
    end
    object tPurchGrpDataAnimalNo: TStringField
      FieldName = 'AnimalNo'
      OnGetText = tPurchGrpDataAnimalNoGetText
      OnSetText = tPurchGrpDataAnimalNoSetText
      OnValidate = tPurchGrpDataAnimalNoValidate
      Size = 10
    end
    object tPurchGrpDataPrimaryBreed: TIntegerField
      FieldName = 'PrimaryBreed'
    end
    object tPurchGrpDataWeight: TFloatField
      FieldName = 'Weight'
      DisplayFormat = '##0.0'
    end
    object tPurchGrpDataEventDesc: TStringField
      FieldName = 'EventDesc'
      Size = 30
    end
    object tPurchGrpDataGrade: TStringField
      FieldName = 'Grade'
      Size = 15
    end
    object tPurchGrpDataColour: TIntegerField
      FieldName = 'Colour'
      KeyFields = 'Colour'
    end
    object tPurchGrpDataMartPrice: TFloatField
      DisplayWidth = 15
      FieldName = 'MartPrice'
      currency = True
    end
    object tPurchGrpDataCostIntoPen: TFloatField
      FieldName = 'CostIntoPen'
      currency = True
    end
    object tPurchGrpDataDateOfBirth: TDateField
      DisplayWidth = 12
      FieldName = 'DateOfBirth'
      OnSetText = tPurchGrpDataDateOfBirthSetText
      OnValidate = tPurchGrpDataDateOfBirthValidate
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tPurchGrpDataTBTestDate: TDateField
      DisplayWidth = 10
      FieldName = 'TBTestDate'
      OnSetText = tPurchGrpDataTBTestDateSetText
      OnValidate = tPurchGrpDataTBTestDateValidate
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tPurchGrpDataEventDate: TDateField
      FieldName = 'EventDate'
      OnSetText = tPurchGrpDataEventDateSetText
      OnValidate = tPurchGrpDataEventDateValidate
      DisplayFormat = 'dd/mm/yyyy'
    end
    object tPurchGrpDataSupplierID: TIntegerField
      FieldName = 'SupplierID'
    end
    object tPurchGrpDataBuyerID: TIntegerField
      FieldName = 'BuyerID'
    end
    object tPurchGrpDataGroupID: TIntegerField
      FieldName = 'GroupID'
    end
    object tPurchGrpDataPenID: TIntegerField
      FieldName = 'PenID'
    end
    object tPurchGrpDataBreeding: TBooleanField
      FieldName = 'Breeding'
      OnValidate = tPurchGrpDataBreedingValidate
    end
    object tPurchGrpDataLactationNumber: TSmallintField
      FieldName = 'LactationNumber'
    end
    object tPurchGrpDataSupplierCosts: TFloatField
      FieldName = 'SupplierCosts'
      currency = True
    end
    object tPurchGrpDataBuyerCosts: TFloatField
      FieldName = 'BuyerCosts'
      currency = True
    end
    object tPurchGrpDataBreedName: TStringField
      FieldKind = fkLookup
      FieldName = 'BreedName'
      LookupDataSet = WinData.Breeds
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'PrimaryBreed'
      Size = 30
      Lookup = True
    end
    object tPurchGrpDataBatchName: TStringField
      FieldKind = fkLookup
      FieldName = 'BatchName'
      LookupDataSet = qBatchNum
      LookupKeyFields = 'ID'
      LookupResultField = 'Code'
      KeyFields = 'GroupID'
      Size = 40
      Lookup = True
    end
    object tPurchGrpDataPenName: TStringField
      FieldKind = fkLookup
      FieldName = 'PenName'
      LookupDataSet = qPenNum
      LookupKeyFields = 'ID'
      LookupResultField = 'Code'
      KeyFields = 'PenID'
      Size = 30
      Lookup = True
    end
    object tPurchGrpDataColourName: TStringField
      FieldKind = fkLookup
      FieldName = 'ColourName'
      LookupDataSet = WinData.qAnimalColours
      LookupKeyFields = 'ID'
      LookupResultField = 'Description'
      KeyFields = 'Colour'
      Size = 30
      Lookup = True
    end
    object tPurchGrpDataSupplierName: TStringField
      FieldKind = fkLookup
      FieldName = 'SupplierName'
      LookupDataSet = WinData.Suppliers
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'SupplierID'
      Size = 30
      Lookup = True
    end
    object tPurchGrpDataBuyerName: TStringField
      FieldKind = fkLookup
      FieldName = 'BuyerName'
      LookupDataSet = WinData.Buyers
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'BuyerID'
      Size = 30
      Lookup = True
    end
    object tPurchGrpDataPurchGrpHeaderID: TIntegerField
      FieldName = 'PurchGrpHeaderID'
    end
    object tPurchGrpDataFirstPrem: TBooleanField
      FieldName = 'FirstPrem'
      OnValidate = tPurchGrpDataFirstPremValidate
    end
    object tPurchGrpDataSecondPrem: TBooleanField
      FieldName = 'SecondPrem'
      OnValidate = tPurchGrpDataSecondPremValidate
    end
    object tPurchGrpDataBullPrem: TBooleanField
      FieldName = 'BullPrem'
      OnValidate = tPurchGrpDataBullPremValidate
    end
    object tPurchGrpDataMatched: TBooleanField
      FieldName = 'Matched'
    end
    object tPurchGrpDatacGroupID: TIntegerField
      FieldName = 'cGroupID'
    end
    object tPurchGrpDataSex: TStringField
      FieldName = 'Sex'
      OnValidate = tPurchGrpDataSexValidate
      Size = 15
    end
    object tPurchGrpDataAID: TIntegerField
      FieldName = 'AID'
    end
    object tPurchGrpDataEID: TIntegerField
      FieldName = 'EID'
    end
    object tPurchGrpDataSearchNatID: TStringField
      FieldName = 'SearchNatID'
    end
    object tPurchGrpDataLotNo: TStringField
      FieldName = 'LotNo'
      Size = 10
    end
  end
  object dsPurchGrpData: TDataSource
    DataSet = tPurchGrpData
    Left = 38
    Top = 430
  end
  object qGeneral: TQuery
    DatabaseName = 'Kingswd'
    DataSource = dsPurchGrpData
    Left = 190
    Top = 370
  end
  object dsGeneral: TDataSource
    DataSet = qGeneral
    Left = 38
    Top = 396
  end
  object qBatchNum: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * '
      'From "Grps.db"'
      'Where (GroupType = "Batch")'
      'Order By Description')
    Left = 246
    Top = 370
  end
  object qPenNum: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * From "Grps.db"'
      'Where (GroupType = "Pen")')
    Left = 218
    Top = 370
  end
  object qPurchGrpNum: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * From "Grps.db"'
      'Where (GroupType = "Purchase")')
    Left = 162
    Top = 370
  end
  object dsBatchNum: TDataSource
    DataSet = qBatchNum
    Left = 38
    Top = 360
  end
  object dsPenNum: TDataSource
    DataSet = qPenNum
    Left = 74
    Top = 402
  end
  object dsPurchGrpNum: TDataSource
    DataSet = qPurchGrpNum
    Left = 72
    Top = 432
  end
  object LookUpPurchGrpData: TTable
    OnNewRecord = tPurchGrpDataNewRecord
    DatabaseName = 'Kingswd'
    ReadOnly = True
    TableName = 'PurchGrpData.db'
    Left = 222
    Top = 418
  end
  object cwfOpen: TOpenDialog
    DefaultExt = '*.dat'
    Filter = 'All Files (*.*)|*.*|Text Files (*.txt)|*.txt'
    InitialDir = 'C:\Windows\Desktop'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Select Crush File'
    Left = 120
    Top = 368
  end
  object Parser: TSPParser
    Sepchar = ','
    CharSearch = True
    Left = 320
    Top = 416
  end
  object pmOptions: TPopupMenu
    Left = 512
    Top = 55
    object miMatchtoCrushFile: TMenuItem
      Caption = 'Match to Crush File'
      OnClick = miMatchtoCrushFileClick
    end
    object miAutomaticGridUpdates: TMenuItem
      Caption = 'Automatic Grid Updates'
      OnClick = miAutomaticGridUpdatesClick
    end
    object CustomizeGridColumns1: TMenuItem
      Caption = 'Customize Grid Columns'
      OnClick = CustomizeGridColumns1Click
    end
  end
  object pmGridColumns: TPopupMenu
    Left = 312
    Top = 360
  end
  object ErrorTimer: TTimer
    Enabled = False
    Interval = 750
    OnTimer = ErrorTimerTimer
    Left = 678
    Top = 410
  end
end
