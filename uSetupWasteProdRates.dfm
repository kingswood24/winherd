object fmSetupWasteProdRates: TfmSetupWasteProdRates
  Left = 653
  Top = 225
  Width = 452
  Height = 449
  ActiveControl = nbScroll
  Caption = 'Animal Waste Production Rates'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label8: TLabel
    Left = 36
    Top = 321
    Width = 149
    Height = 16
    Caption = 'Calves up to 6 months'
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 436
    Height = 53
    ButtonHeight = 45
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 0
      Style = tbsDivider
    end
    object sbExit: TRxSpeedButton
      Left = 8
      Top = 2
      Width = 58
      Height = 45
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
      InitPause = 0
      NumGlyphs = 2
      ShowHint = False
      WordWrap = True
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
    object nbScroll: TKwDBNavigator
      Left = 74
      Top = 2
      Width = 270
      Height = 45
      DataSource = DataSource1
      VisibleButtons = [kwnbPost, kwnbCancel, kwnbDelete]
      Flat = True
      Ctl3D = True
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
        '&Last'
        '')
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object ToolButton5: TToolButton
      Left = 344
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsDivider
    end
    object sbHelp: TRxSpeedButton
      Left = 352
      Top = 2
      Width = 58
      Height = 45
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
      InitPause = 0
      ShowHint = False
      WordWrap = True
    end
  end
  object pMainDetails: TPanel
    Left = 24
    Top = 71
    Width = 393
    Height = 322
    BevelInner = bvLowered
    TabOrder = 1
    object Label4: TLabel
      Left = 161
      Top = 9
      Width = 79
      Height = 26
      Alignment = taCenter
      Caption = 'Nitrogen Kg/Head/Yr'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label2: TLabel
      Left = 25
      Top = 70
      Width = 78
      Height = 13
      Caption = 'Suckler Cows'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 25
      Top = 160
      Width = 111
      Height = 13
      Caption = 'Cattle over 2 Years'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 25
      Top = 130
      Width = 93
      Height = 13
      Caption = 'Cattle 1-2 Years'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 25
      Top = 100
      Width = 108
      Height = 13
      Caption = 'Cattle 0-12 Months'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 25
      Top = 190
      Width = 87
      Height = 13
      Caption = 'Mt Ewe && Lamb'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 25
      Top = 220
      Width = 96
      Height = 13
      Caption = 'Low Ewe && Lamb'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 25
      Top = 250
      Width = 61
      Height = 13
      Caption = 'Mt. Hogget'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 25
      Top = 280
      Width = 66
      Height = 13
      Caption = 'Low Hogget'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 25
      Top = 40
      Width = 66
      Height = 13
      Caption = 'Dairy Cows'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 263
      Top = 9
      Width = 80
      Height = 26
      Alignment = taCenter
      Caption = 'Phosphorus Kg/Head/Yr'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object NPDairyCow: TDBEdit
      Left = 166
      Top = 40
      Width = 71
      Height = 21
      DataField = 'NPDairyCow'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object NPSucklerCow: TDBEdit
      Left = 166
      Top = 70
      Width = 71
      Height = 21
      DataField = 'NPSucklerCow'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object NPCattle2YrsPlus: TDBEdit
      Left = 166
      Top = 160
      Width = 71
      Height = 21
      DataField = 'NPCattle2YrsPlus'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object NPCattle1to2Yrs: TDBEdit
      Left = 166
      Top = 130
      Width = 71
      Height = 21
      DataField = 'NPCattle1to2Yrs'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object NPCattle6to12Mths: TDBEdit
      Left = 166
      Top = 100
      Width = 71
      Height = 21
      DataField = 'NPCattle0to12Mths'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object NPMTEweLamb: TDBEdit
      Left = 166
      Top = 190
      Width = 71
      Height = 21
      DataField = 'NPMTEweLamb'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
    end
    object NPLowEweLamb: TDBEdit
      Left = 166
      Top = 220
      Width = 71
      Height = 21
      DataField = 'NPLowEweLamb'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
    end
    object NPMTHogget: TDBEdit
      Left = 166
      Top = 250
      Width = 71
      Height = 21
      DataField = 'NPMTHogget'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
    end
    object NPLowHogget: TDBEdit
      Left = 166
      Top = 280
      Width = 71
      Height = 21
      DataField = 'NPLowHogget'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
    end
    object PPDairyCow: TDBEdit
      Left = 267
      Top = 40
      Width = 71
      Height = 21
      DataField = 'PPDairyCow'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object PPSucklerCow: TDBEdit
      Left = 267
      Top = 70
      Width = 71
      Height = 21
      DataField = 'PPSucklerCow'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object PPCattle2YrsPlus: TDBEdit
      Left = 267
      Top = 160
      Width = 71
      Height = 21
      DataField = 'PPCattle2YrsPlus'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object PPCattle1to2Yrs: TDBEdit
      Left = 267
      Top = 130
      Width = 71
      Height = 21
      DataField = 'PPCattle1to2Yrs'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object PPCattle6to12Mths: TDBEdit
      Left = 267
      Top = 100
      Width = 71
      Height = 21
      DataField = 'PPCattle0to12Mths'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object PPMTEweLamb: TDBEdit
      Left = 267
      Top = 190
      Width = 71
      Height = 21
      DataField = 'PPMTEweLamb'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object PPLowEweLamb: TDBEdit
      Left = 267
      Top = 220
      Width = 71
      Height = 21
      DataField = 'PPLowEweLamb'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
    end
    object PPMTHogget: TDBEdit
      Left = 267
      Top = 250
      Width = 71
      Height = 21
      DataField = 'PPMTHogget'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
    end
    object PPLowHogget: TDBEdit
      Left = 267
      Top = 280
      Width = 71
      Height = 21
      DataField = 'PPLowHogget'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 17
    end
  end
  object pNIMainDetails: TPanel
    Left = 24
    Top = 71
    Width = 393
    Height = 322
    BevelInner = bvLowered
    TabOrder = 2
    object Label6: TLabel
      Left = 161
      Top = 9
      Width = 79
      Height = 26
      Alignment = taCenter
      Caption = 'Nitrogen Kg/Head/Yr'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label7: TLabel
      Left = 25
      Top = 70
      Width = 121
      Height = 13
      Caption = 'Older Cattle (>2 Yrs)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 25
      Top = 160
      Width = 121
      Height = 13
      Caption = 'Bull Beef (0-13 Mths)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 25
      Top = 100
      Width = 89
      Height = 13
      Caption = 'Cattle (1-2 Yrs)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label17: TLabel
      Left = 25
      Top = 130
      Width = 83
      Height = 13
      Caption = 'Cattle (0-1 Yr)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 25
      Top = 190
      Width = 121
      Height = 13
      Caption = 'Bull Beef (6-13 Mths)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 25
      Top = 220
      Width = 109
      Height = 13
      Caption = 'Calves (6-12 Mths)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 25
      Top = 250
      Width = 102
      Height = 13
      Caption = 'Calves (0-6 Mths)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label22: TLabel
      Left = 25
      Top = 40
      Width = 66
      Height = 13
      Caption = 'Dairy Cows'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object DBEdit1: TDBEdit
      Left = 166
      Top = 40
      Width = 71
      Height = 21
      DataField = 'NINPDairyCows'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 166
      Top = 70
      Width = 71
      Height = 21
      DataField = 'NINPCattleOver24Mths'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 166
      Top = 160
      Width = 71
      Height = 21
      DataField = 'NINPBullBeef0To13Mths'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object DBEdit4: TDBEdit
      Left = 166
      Top = 130
      Width = 71
      Height = 21
      DataField = 'NINPCattle0To12Mths'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 166
      Top = 100
      Width = 71
      Height = 21
      DataField = 'NINPCattle12To24Mths'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object DBEdit6: TDBEdit
      Left = 166
      Top = 190
      Width = 71
      Height = 21
      DataField = 'NINPBullBeef6To13Mths'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 166
      Top = 220
      Width = 71
      Height = 21
      DataField = 'NINPCalves6To12Mths'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object DBEdit8: TDBEdit
      Left = 166
      Top = 250
      Width = 71
      Height = 21
      DataField = 'NINPCalves0To6Mths'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
  end
  object DataSource1: TDataSource
    DataSet = WinData.pDefs
    Left = 96
    Top = 360
  end
end