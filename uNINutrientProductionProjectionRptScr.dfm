object fmNINutrientProductionProjectionRptScr: TfmNINutrientProductionProjectionRptScr
  Left = 475
  Top = 190
  Width = 769
  Height = 601
  ActiveControl = ComboHerd
  Caption = 'Livestock Nutrient Production'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 761
    Height = 53
    ButtonHeight = 48
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
      Height = 48
      Hint = 'Click Here To Exit'
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
      Left = 66
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 0
      Style = tbsDivider
    end
    object sbView: TRxSpeedButton
      Left = 74
      Top = 2
      Width = 86
      Height = 48
      Hint = 'Click Here To View This Report On Screen'
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
      OnMouseLeave = sbViewMouseLeave
      OnClick = sbViewClick
    end
    object sbPrint: TRxSpeedButton
      Left = 160
      Top = 2
      Width = 86
      Height = 48
      Hint = 'Click Here To Print This Report'
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
    end
    object ToolButton4: TToolButton
      Left = 246
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 4
      Style = tbsDivider
    end
    object sbWasteProdRates: TRxSpeedButton
      Left = 254
      Top = 2
      Width = 90
      Height = 48
      Caption = 'Waste Production Rates'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      OnClick = sbWasteProdRatesClick
    end
    object ToolButton3: TToolButton
      Left = 344
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 4
      Style = tbsDivider
    end
    object sbHelp: TRxSpeedButton
      Left = 352
      Top = 2
      Width = 58
      Height = 48
      Hint = 'Click Here For Help'
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
    end
    object ToolButton5: TToolButton
      Left = 410
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsDivider
    end
    object Panel1: TPanel
      Left = 418
      Top = 2
      Width = 127
      Height = 48
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 2
        Top = 2
        Width = 87
        Height = 16
        Caption = 'Herd I&dentity'
        FocusControl = ComboHerd
      end
      object ComboHerd: TRxDBLookupCombo
        Left = 4
        Top = 20
        Width = 120
        Height = 23
        DropDownCount = 8
        DisplayEmpty = 'Select Herd'
        EmptyValue = '0'
        LookupField = 'ID'
        LookupDisplay = 'HerdIdentity'
        LookupSource = WinData.dsHerdDefaults
        TabOrder = 0
        OnChange = ComboHerdChange
      end
    end
  end
  object p: TPanel
    Left = 0
    Top = 53
    Width = 761
    Height = 517
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object lProgBar: TLabel
      Left = 113
      Top = 482
      Width = 172
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Date 1 compiling'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object lPleaseWait: TLabel
      Left = 170
      Top = 461
      Width = 405
      Height = 18
      AutoSize = False
      Caption = 'Please wait while the information is being processed....'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label13: TLabel
      Left = 346
      Top = 415
      Width = 124
      Height = 13
      Alignment = taRightJustify
      Caption = 'Area Of Holding (Ha):'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 6
      Top = 397
      Width = 745
      Height = 2
      Shape = bsTopLine
    end
    object Bevel2: TBevel
      Left = 4
      Top = 100
      Width = 745
      Height = 6
      Shape = bsTopLine
    end
    object pb: TProgressBar
      Left = 293
      Top = 477
      Width = 235
      Height = 21
      Min = 0
      Max = 100
      TabOrder = 4
      Visible = False
    end
    object seForageArea: TcxSpinEdit
      Left = 476
      Top = 409
      Properties.ImmediatePost = True
      Properties.ValueType = vtFloat
      Style.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.Kind = lfStandard
      TabOrder = 3
      Width = 70
    end
    object cxLabel4: TcxLabel
      Left = 38
      Top = 65
      Caption = 'Are you keeping calves for part year?'
      FocusControl = cmboPartYear
      Style.TextStyle = [fsBold]
    end
    object cmboPartYear: TcxComboBox
      Left = 326
      Top = 66
      TabStop = False
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'No'
        'Yes')
      Properties.OnEditValueChanged = cmboPartYearPropertiesEditValueChanged
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 1
      Width = 79
    end
    object cxLabel13: TcxLabel
      Left = 246
      Top = 40
      Caption = 'For Year'
      FocusControl = cmboPartYear
      Style.TextStyle = [fsBold]
    end
    object cmboYear: TcxComboBox
      Left = 326
      Top = 36
      TabStop = False
      Properties.DropDownListStyle = lsFixedList
      Properties.OnEditValueChanged = cmboYearPropertiesEditValueChanged
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 0
      Width = 79
    end
    object pForecast: TPanel
      Left = 7
      Top = 104
      Width = 746
      Height = 287
      BevelOuter = bvNone
      TabOrder = 2
      object lAmountNonBovine: TLabel
        Left = 152
        Top = 262
        Width = 309
        Height = 13
        Alignment = taRightJustify
        Caption = 'Amount of N/P produced by non-bovine animals year:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object ceFebDCows: TcxCurrencyEdit
        Left = 122
        Top = 72
        Constraints.MaxHeight = 21
        EditValue = '0'
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfFlat
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 6
        OnExit = ceFebDCowsExit
        Width = 48
      end
      object cxLabel1: TcxLabel
        Left = 185
        Top = 26
        AutoSize = False
        Caption = 'Older Cattle (>2 Yrs)'
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Height = 48
        Width = 56
      end
      object ceFebOlderCattleOver24Mths: TcxCurrencyEdit
        Left = 188
        Top = 72
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 7
        OnExit = ceFebDCowsExit
        Width = 48
      end
      object cxLabel2: TcxLabel
        Left = 126
        Top = 26
        AutoSize = False
        Caption = 'Dairy Cows'
        ParentFont = False
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Height = 31
        Width = 39
      end
      object cxLabel3: TcxLabel
        Left = 250
        Top = 26
        AutoSize = False
        Caption = 'Cattle (1-2 Yrs) '
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Height = 40
        Width = 59
      end
      object ceFebCattle1224Mths: TcxCurrencyEdit
        Left = 254
        Top = 72
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 8
        OnExit = ceFebDCowsExit
        Width = 48
      end
      object ceAprDCows: TcxCurrencyEdit
        Left = 122
        Top = 100
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 14
        OnExit = ceAprDCowsExit
        Width = 48
      end
      object ceAprOlderCattleOver24Mths: TcxCurrencyEdit
        Left = 188
        Top = 100
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 15
        OnExit = ceAprDCowsExit
        Width = 48
      end
      object ceAprCattle1224Mths: TcxCurrencyEdit
        Left = 254
        Top = 100
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 16
        OnExit = ceAprDCowsExit
        Width = 48
      end
      object ceJunDCows: TcxCurrencyEdit
        Left = 122
        Top = 128
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 22
        OnExit = ceJunDCowsExit
        Width = 48
      end
      object ceJunOlderCattleOver24Mths: TcxCurrencyEdit
        Left = 188
        Top = 128
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 23
        OnExit = ceJunDCowsExit
        Width = 48
      end
      object ceJunCattle1224Mths: TcxCurrencyEdit
        Left = 254
        Top = 128
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 24
        OnExit = ceJunDCowsExit
        Width = 48
      end
      object ceAugDCows: TcxCurrencyEdit
        Left = 122
        Top = 160
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 30
        OnExit = ceAugDCowsExit
        Width = 48
      end
      object ceAugOlderCattleOver24Mths: TcxCurrencyEdit
        Left = 188
        Top = 160
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 31
        OnExit = ceAugDCowsExit
        Width = 48
      end
      object ceAugCattle1224Mths: TcxCurrencyEdit
        Left = 254
        Top = 160
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 32
        OnExit = ceAugDCowsExit
        Width = 48
      end
      object ceOctDCows: TcxCurrencyEdit
        Left = 122
        Top = 188
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 38
        OnExit = ceOctDCowsExit
        Width = 48
      end
      object ceOctOlderCattleOver24Mths: TcxCurrencyEdit
        Left = 188
        Top = 188
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 39
        OnExit = ceOctDCowsExit
        Width = 48
      end
      object ceOctCattle1224Mths: TcxCurrencyEdit
        Left = 254
        Top = 188
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 40
        OnExit = ceOctDCowsExit
        Width = 48
      end
      object ceDecDCows: TcxCurrencyEdit
        Left = 122
        Top = 216
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 46
        OnExit = ceDecDCowsExit
        Width = 48
      end
      object ceDecOlderCattleOver24Mths: TcxCurrencyEdit
        Left = 188
        Top = 216
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 47
        OnExit = ceDecDCowsExit
        Width = 48
      end
      object ceDecCattle1224Mths: TcxCurrencyEdit
        Left = 254
        Top = 216
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 48
        OnExit = ceDecDCowsExit
        Width = 48
      end
      object ceFebTotalForecast: TcxCurrencyEdit
        Left = 654
        Top = 71
        TabStop = False
        Constraints.MaxHeight = 21
        EditValue = 0
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '#.##'
        Properties.Nullable = False
        Properties.ReadOnly = True
        Style.Color = clInfoBk
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 58
        Width = 76
      end
      object lForecastType: TcxLabel
        Left = 634
        Top = 25
        AutoSize = False
        Caption = '%s (+/-)'
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Height = 19
        Width = 115
      end
      object ceAprTotalForecast: TcxCurrencyEdit
        Left = 654
        Top = 99
        TabStop = False
        Constraints.MaxHeight = 21
        EditValue = 0
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '#.##'
        Properties.Nullable = False
        Properties.ReadOnly = True
        Style.Color = clInfoBk
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 60
        Width = 76
      end
      object ceJunTotalForecast: TcxCurrencyEdit
        Left = 654
        Top = 127
        TabStop = False
        Constraints.MaxHeight = 21
        EditValue = 0
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '#.##'
        Properties.Nullable = False
        Properties.ReadOnly = True
        Style.Color = clInfoBk
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 61
        Width = 76
      end
      object ceAugTotalForecast: TcxCurrencyEdit
        Left = 654
        Top = 159
        TabStop = False
        Constraints.MaxHeight = 21
        EditValue = 0
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '#.##'
        Properties.Nullable = False
        Properties.ReadOnly = True
        Style.Color = clInfoBk
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 62
        Width = 76
      end
      object ceOctTotalForecast: TcxCurrencyEdit
        Left = 654
        Top = 187
        TabStop = False
        Constraints.MaxHeight = 21
        EditValue = 0
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '#.##'
        Properties.Nullable = False
        Properties.ReadOnly = True
        Style.Color = clInfoBk
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 63
        Width = 76
      end
      object ceDecTotalForecast: TcxCurrencyEdit
        Left = 654
        Top = 215
        TabStop = False
        Constraints.MaxHeight = 21
        EditValue = 0
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '#.##'
        Properties.Nullable = False
        Properties.ReadOnly = True
        Style.Color = clInfoBk
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 64
        Width = 76
      end
      object cxLabel7: TcxLabel
        Left = 256
        Top = 3
        Caption = 'Forecast Purchases/Sales (+/-)'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object cxLabel6: TcxLabel
        Left = 635
        Top = 39
        AutoSize = False
        Caption = 'Based on livestock Purchase/Sales'
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Height = 31
        Width = 111
      end
      object ceFebBullBeef013Mths: TcxCurrencyEdit
        Left = 320
        Top = 72
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 9
        OnExit = ceFebDCowsExit
        Width = 48
      end
      object ceAprBullBeef013Mths: TcxCurrencyEdit
        Left = 320
        Top = 100
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 17
        OnExit = ceAprDCowsExit
        Width = 48
      end
      object ceJunBullBeef013Mths: TcxCurrencyEdit
        Left = 320
        Top = 128
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 25
        OnExit = ceJunDCowsExit
        Width = 48
      end
      object ceAugBullBeef013Mths: TcxCurrencyEdit
        Left = 320
        Top = 160
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 33
        OnExit = ceAugDCowsExit
        Width = 48
      end
      object ceOctBullBeef013Mths: TcxCurrencyEdit
        Left = 320
        Top = 188
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 41
        OnExit = ceOctDCowsExit
        Width = 48
      end
      object ceDecBullBeef013Mths: TcxCurrencyEdit
        Left = 320
        Top = 216
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 49
        OnExit = ceDecDCowsExit
        Width = 48
      end
      object cxLabel8: TcxLabel
        Left = 310
        Top = 26
        AutoSize = False
        Caption = 'Bull Beef (0-13 Mths)'
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Height = 46
        Width = 67
      end
      object ceFebCattle012Mths: TcxCurrencyEdit
        Left = 452
        Top = 72
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 11
        OnExit = ceFebDCowsExit
        Width = 48
      end
      object ceAprCattle012Mths: TcxCurrencyEdit
        Left = 452
        Top = 100
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 19
        OnExit = ceAprDCowsExit
        Width = 48
      end
      object ceJunCattle012Mths: TcxCurrencyEdit
        Left = 452
        Top = 128
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 27
        OnExit = ceJunDCowsExit
        Width = 48
      end
      object ceAugCattle012Mths: TcxCurrencyEdit
        Left = 452
        Top = 160
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 35
        OnExit = ceAugDCowsExit
        Width = 48
      end
      object ceOctCattle012Mths: TcxCurrencyEdit
        Left = 452
        Top = 188
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 43
        OnExit = ceOctDCowsExit
        Width = 48
      end
      object ceDecCattle012Mths: TcxCurrencyEdit
        Left = 452
        Top = 216
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 51
        OnExit = ceDecDCowsExit
        Width = 48
      end
      object cxLabel9: TcxLabel
        Left = 446
        Top = 26
        AutoSize = False
        Caption = 'Cattle (0-1 Yr)'
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Height = 33
        Width = 58
      end
      object ceFebBullBeef613Mths: TcxCurrencyEdit
        Left = 386
        Top = 72
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 10
        OnExit = ceFebDCowsExit
        Width = 48
      end
      object ceAprBullBeef613Mths: TcxCurrencyEdit
        Left = 386
        Top = 100
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 18
        OnExit = ceAprDCowsExit
        Width = 48
      end
      object ceJunBullBeef613Mths: TcxCurrencyEdit
        Left = 386
        Top = 128
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 26
        OnExit = ceJunDCowsExit
        Width = 48
      end
      object ceAugBullBeef613Mths: TcxCurrencyEdit
        Left = 386
        Top = 160
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 34
        OnExit = ceAugDCowsExit
        Width = 48
      end
      object ceOctBullBeef613Mths: TcxCurrencyEdit
        Left = 386
        Top = 188
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 42
        OnExit = ceOctDCowsExit
        Width = 48
      end
      object ceDecBullBeef613Mths: TcxCurrencyEdit
        Left = 386
        Top = 216
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 50
        OnExit = ceDecDCowsExit
        Width = 48
      end
      object cxLabel10: TcxLabel
        Left = 379
        Top = 26
        AutoSize = False
        Caption = 'Bull Beef (6-13 Mths)'
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Height = 48
        Width = 68
      end
      object ceFebCalves06Mths: TcxCurrencyEdit
        Left = 583
        Top = 71
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 13
        OnExit = ceFebDCowsExit
        Width = 48
      end
      object ceAprCalves06Mths: TcxCurrencyEdit
        Left = 583
        Top = 99
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 21
        OnExit = ceAprDCowsExit
        Width = 48
      end
      object ceJunCalves06Mths: TcxCurrencyEdit
        Left = 583
        Top = 127
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 29
        OnExit = ceJunDCowsExit
        Width = 48
      end
      object ceAugCalves06Mths: TcxCurrencyEdit
        Left = 583
        Top = 159
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 37
        OnExit = ceAugDCowsExit
        Width = 48
      end
      object ceOctCalves06Mths: TcxCurrencyEdit
        Left = 583
        Top = 187
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 45
        OnExit = ceOctDCowsExit
        Width = 48
      end
      object ceDecCalves06Mths: TcxCurrencyEdit
        Left = 583
        Top = 215
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 53
        OnExit = ceDecDCowsExit
        Width = 48
      end
      object ceFebCalves612Mths: TcxCurrencyEdit
        Left = 518
        Top = 72
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 12
        OnExit = ceFebDCowsExit
        Width = 48
      end
      object ceAprCalves612Mths: TcxCurrencyEdit
        Left = 518
        Top = 100
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 20
        OnExit = ceAprDCowsExit
        Width = 48
      end
      object ceJunCalves612Mths: TcxCurrencyEdit
        Left = 518
        Top = 128
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 28
        OnExit = ceJunDCowsExit
        Width = 48
      end
      object ceAugCalves612Mths: TcxCurrencyEdit
        Left = 518
        Top = 160
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 36
        OnExit = ceAugDCowsExit
        Width = 48
      end
      object ceOctCalves612Mths: TcxCurrencyEdit
        Left = 518
        Top = 188
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 44
        OnExit = ceOctDCowsExit
        Width = 48
      end
      object ceDecCalves612Mths: TcxCurrencyEdit
        Left = 518
        Top = 216
        Constraints.MaxHeight = 21
        EditValue = '0'
        Properties.Alignment.Horz = taRightJustify
        Properties.AssignedValues.DisplayFormat = True
        Properties.AssignedValues.EditFormat = True
        Properties.DecimalPlaces = 0
        Properties.Nullable = False
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 52
        OnExit = ceDecDCowsExit
        Width = 48
      end
      object cxLabel5: TcxLabel
        Left = 509
        Top = 26
        AutoSize = False
        Caption = 'Calves (6-12 Mths)'
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Height = 46
        Width = 61
      end
      object cxLabel11: TcxLabel
        Left = 579
        Top = 25
        AutoSize = False
        Caption = 'Calves (0-6 Mths)'
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Height = 46
        Width = 61
      end
      object deDate1: TcxDateEdit
        Left = 9
        Top = 72
        TabStop = False
        Constraints.MaxHeight = 21
        ParentFont = False
        Properties.ReadOnly = False
        Properties.OnEditValueChanged = deDate1PropertiesEditValueChanged
        Style.BorderStyle = ebsFlat
        Style.Color = clWindow
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfFlat
        Style.ButtonTransparency = ebtAlways
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 0
        Width = 101
      end
      object deDate2: TcxDateEdit
        Left = 9
        Top = 100
        TabStop = False
        Constraints.MaxHeight = 21
        ParentFont = False
        Properties.ReadOnly = True
        Style.BorderStyle = ebsFlat
        Style.Color = clInfoBk
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfFlat
        Style.ButtonTransparency = ebtHideInactive
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 1
        OnEditing = deDate2Editing
        Width = 101
      end
      object deDate3: TcxDateEdit
        Left = 9
        Top = 128
        TabStop = False
        Constraints.MaxHeight = 21
        ParentFont = False
        Properties.ReadOnly = True
        Style.Color = clInfoBk
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfFlat
        Style.ButtonTransparency = ebtHideInactive
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 2
        OnEditing = deDate2Editing
        Width = 101
      end
      object deDate4: TcxDateEdit
        Left = 9
        Top = 160
        TabStop = False
        Constraints.MaxHeight = 21
        ParentFont = False
        Properties.ReadOnly = True
        Style.Color = clInfoBk
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfFlat
        Style.ButtonTransparency = ebtHideInactive
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 3
        OnEditing = deDate2Editing
        Width = 101
      end
      object deDate5: TcxDateEdit
        Left = 9
        Top = 188
        TabStop = False
        Constraints.MaxHeight = 21
        ParentFont = False
        Properties.ReadOnly = True
        Style.Color = clInfoBk
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfFlat
        Style.ButtonTransparency = ebtHideInactive
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 4
        OnEditing = deDate2Editing
        Width = 101
      end
      object deDate6: TcxDateEdit
        Left = 9
        Top = 216
        TabStop = False
        Constraints.MaxHeight = 21
        ParentFont = False
        Properties.ReadOnly = True
        Style.Color = clInfoBk
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfFlat
        Style.ButtonTransparency = ebtHideInactive
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 5
        OnEditing = deDate2Editing
        Width = 101
      end
      object cxLabel12: TcxLabel
        Left = 10
        Top = 26
        AutoSize = False
        Caption = 'Ascending Dates'
        ParentFont = False
        Properties.WordWrap = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Verdana'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Height = 43
        Width = 83
      end
      object seAvgNonBovineProduction: TcxSpinEdit
        Left = 469
        Top = 257
        Properties.ImmediatePost = True
        Properties.ValueType = vtFloat
        Style.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.Kind = lfStandard
        TabOrder = 54
        Width = 70
      end
    end
    object cbFavourite: TcxCheckBox
      Left = 9
      Top = 6
      AutoSize = False
      Caption = 'Add Report As Favourite'
      Properties.OnChange = cbFavouritePropertiesChange
      TabOrder = 7
      Height = 21
      Width = 212
    end
  end
  object GenQuery: TQuery
    DatabaseName = 'Kingswd'
    Left = 38
    Top = 438
  end
end