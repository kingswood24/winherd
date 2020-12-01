object fExtSiresFilt: TfExtSiresFilt
  Left = 195
  Top = 107
  Width = 703
  Height = 476
  Caption = 'Sire Selection Conformation'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object extmain: TPanel
    Left = 9
    Top = 80
    Width = 675
    Height = 353
    TabOrder = 0
    object ext1: TPanel
      Left = 3
      Top = 4
      Width = 333
      Height = 219
      BevelInner = bvLowered
      TabOrder = 0
      object Label49: TLabel
        Left = 166
        Top = 5
        Width = 35
        Height = 13
        Caption = 'FROM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label50: TLabel
        Left = 263
        Top = 5
        Width = 17
        Height = 13
        Caption = 'TO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label34: TLabel
        Left = 16
        Top = 29
        Width = 42
        Height = 13
        Caption = 'Stature'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label35: TLabel
        Left = 16
        Top = 56
        Width = 69
        Height = 13
        Caption = 'Chest Width'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label36: TLabel
        Left = 16
        Top = 81
        Width = 67
        Height = 13
        Caption = 'Body Depth'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label37: TLabel
        Left = 16
        Top = 107
        Width = 58
        Height = 13
        Caption = 'Angularity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label27: TLabel
        Left = 16
        Top = 133
        Width = 69
        Height = 13
        Caption = 'Rump Angle'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label28: TLabel
        Left = 16
        Top = 158
        Width = 69
        Height = 13
        Caption = 'Rump Width'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label29: TLabel
        Left = 16
        Top = 181
        Width = 55
        Height = 13
        Caption = 'Reliability'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label30: TLabel
        Left = 16
        Top = 192
        Width = 88
        Height = 13
        Caption = '(Conformation)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 6
        Top = 4
        Width = 56
        Height = 16
        Caption = 'General'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Fromstat: TRxSpinEdit
        Left = 152
        Top = 26
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = -200
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object ToStat: TRxSpinEdit
        Left = 251
        Top = 26
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = 500
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object FromChestWidth: TRxSpinEdit
        Left = 152
        Top = 52
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = -200
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object ToChestWidth: TRxSpinEdit
        Left = 251
        Top = 52
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = 200
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object FromBodyDepth: TRxSpinEdit
        Left = 152
        Top = 78
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = -300
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object ToBodyDepth: TRxSpinEdit
        Left = 251
        Top = 78
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = 300
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object FromAngularity: TRxSpinEdit
        Left = 152
        Top = 104
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = -600
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object ToAngularity: TRxSpinEdit
        Left = 251
        Top = 104
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = 600
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object FromRumpAngle: TRxSpinEdit
        Left = 152
        Top = 130
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = -250
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object ToRumpAngle: TRxSpinEdit
        Left = 251
        Top = 130
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = 250
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object FromRumpWidth: TRxSpinEdit
        Left = 152
        Top = 156
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = -300
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object ToRumpWidth: TRxSpinEdit
        Left = 251
        Top = 156
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = 250
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
      object FromReliaConf: TRxSpinEdit
        Left = 152
        Top = 183
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 100
        MinValue = -100
        ValueType = vtFloat
        Value = -100
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
      end
      object ToReliaConf: TRxSpinEdit
        Left = 251
        Top = 183
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = 100
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
      end
    end
    object extp2: TPanel
      Left = 3
      Top = 225
      Width = 333
      Height = 114
      BevelInner = bvLowered
      TabOrder = 1
      object Label39: TLabel
        Left = 16
        Top = 28
        Width = 74
        Height = 13
        Caption = 'Rear Leg Set'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label40: TLabel
        Left = 16
        Top = 55
        Width = 128
        Height = 13
        Caption = 'Rear Legs / Rear View'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label41: TLabel
        Left = 16
        Top = 83
        Width = 60
        Height = 13
        Caption = 'Foot Angle'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 6
        Top = 4
        Width = 84
        Height = 16
        Caption = 'Feet && Legs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object FromRearLegSet: TRxSpinEdit
        Left = 152
        Top = 25
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = -999
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object ToRearLegSet: TRxSpinEdit
        Left = 251
        Top = 24
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = 998
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object FromRearLegView: TRxSpinEdit
        Left = 152
        Top = 52
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = -999
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object ToRearLegView: TRxSpinEdit
        Left = 251
        Top = 52
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = 998
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object FromFootAngle: TRxSpinEdit
        Left = 152
        Top = 80
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = -99
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object ToFootAngle: TRxSpinEdit
        Left = 251
        Top = 80
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = 998
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
    end
    object Panel1: TPanel
      Left = 338
      Top = 4
      Width = 333
      Height = 189
      BevelInner = bvLowered
      TabOrder = 2
      object Label65: TLabel
        Left = 16
        Top = 30
        Width = 63
        Height = 13
        Caption = 'Fore Udder'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label66: TLabel
        Left = 16
        Top = 55
        Width = 65
        Height = 13
        Caption = 'Rear Udder'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label67: TLabel
        Left = 16
        Top = 81
        Width = 83
        Height = 13
        Caption = 'Udder Support'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label43: TLabel
        Left = 16
        Top = 107
        Width = 72
        Height = 13
        Caption = 'Udder Depth'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label44: TLabel
        Left = 16
        Top = 132
        Width = 88
        Height = 13
        Caption = 'Teat Placement'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label45: TLabel
        Left = 16
        Top = 158
        Width = 67
        Height = 13
        Caption = 'Teat Length'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 6
        Top = 4
        Width = 44
        Height = 16
        Caption = 'Udder'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 166
        Top = 5
        Width = 35
        Height = 13
        Caption = 'FROM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 263
        Top = 5
        Width = 17
        Height = 13
        Caption = 'TO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object FromForeUdder: TRxSpinEdit
        Left = 152
        Top = 26
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = -500
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object ToForeUdder: TRxSpinEdit
        Left = 251
        Top = 26
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = 500
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object FromRearUdder: TRxSpinEdit
        Left = 152
        Top = 52
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 9999
        MinValue = -9999
        ValueType = vtFloat
        Value = -999
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object ToRearUdder: TRxSpinEdit
        Left = 251
        Top = 52
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -9999
        ValueType = vtFloat
        Value = 998
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object FromUdderSupp: TRxSpinEdit
        Left = 152
        Top = 78
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = -999
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object ToUdderSupp: TRxSpinEdit
        Left = 251
        Top = 78
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = 998
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object FromUdderDepth: TRxSpinEdit
        Left = 152
        Top = 104
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = -999
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object ToUdderDepth: TRxSpinEdit
        Left = 251
        Top = 104
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = 998
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object FromTeatPlace: TRxSpinEdit
        Left = 152
        Top = 130
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = -250
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object ToTeatPlace: TRxSpinEdit
        Left = 251
        Top = 130
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = 300
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object FromTeatlen: TRxSpinEdit
        Left = 152
        Top = 156
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = -200
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object ToTeatlen: TRxSpinEdit
        Left = 251
        Top = 156
        Width = 70
        Height = 22
        Decimal = 1
        MaxValue = 999
        MinValue = -999
        ValueType = vtFloat
        Value = 200
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 695
    Height = 53
    ButtonHeight = 45
    ButtonWidth = 86
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    TabOrder = 1
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
      Height = 45
      Hint = 'Click Here To Exit'
      Caption = 'E&xit'
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000020000000100000000100
        1000000000000004000000000000000000000000000000000000E03DE03D0000
        0000000000000000000000000000000000000000E03DE03DE03DE03DE03DEF3D
        EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DFF7FE03DE03DE03DE03D0000
        003C003C003C003C003C003C003C003C003C0000E03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03D0000
        003C003C003C003C003C003C003C003C003C0000E03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03D0000
        003C003C003C003C003C003C003C003C003C0000E03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03D0000
        003C003C003C003C003C003C003C003C003C0000E03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03D0000
        003C003C003C003C003C003C003C003C003C0000E03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03D0000
        003C003C003C003C003C003C003C003C003C0000E03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03DE03DE03DE03DFF7FEF3DFF7FE03DE03DE03DE03D0000
        003C003C003C003C003C003C003CE07F003C0000E03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03DE03DE03DEF3DE03DEF3DFF7FE03DE03DE03DE03D0000
        003C003C003C003C003C003C003C003C003C0000E03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03D0000
        003C003C003C003C003C003C003C003C003C0000E03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DFF7FFF7FFF7FFF7FFF7FE03DEF3DFF7FE03DE03DE03DE03D0000
        003C003CFF03FF03FF03FF03FF03003C003C0000E03DE03DE03DE03DE03DEF3D
        FF7FE03DEF3DEF3DEF3DEF3DEF3DFF7FE03DEF3DFF7FE03DE03DE03DE03D0000
        003C003CFF03FF03FF03FF03FF03003C003C0000E03DE03DE03DE03DE03DEF3D
        FF7FE03DEF3DFF7FFF7FFF7FEF3DFF7FE03DEF3DFF7FE03DE03DE03DE03D0000
        003C003CFF03FF03FF03FF03FF03003C003C0000E03DE03DE03DE03DE03DEF3D
        FF7FE03DEF3DEF3DEF3DEF3DEF3DE03DE03DEF3DFF7FE03DE03DE03DE03D0000
        003C003C003C003C003C003C003C003C003C0000E03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03D0000
        003C003C003C003C003C003C003C003C003C0000E03DE03DE03DE03DE03DEF3D
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FEF3DFF7FE03DE03DE03DE03D0000
        0000000000000000000000000000000000000000E03DE03DE03DE03DE03DEF3D
        EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DE03DE03DE03D}
      NumGlyphs = 2
      OnClick = sbExitClick
    end
    object sbView: TRxSpeedButton
      Left = 66
      Top = 2
      Width = 86
      Height = 45
      Hint = 'Click Here To View This Report On Screen'
      Caption = '&View'
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000020000000100000000100
        1000000000000004000000000000000000000000000000000000E03D00000000
        00000000000000000000000000000000000000000000E03DE03DE03DEF3DEF3D
        EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DFF7FE03DE03D0000FF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000E03DE03DE03DEF3DE03D
        FF7FE03DFF7FE03DFF7FE03DFF7FE03DFF7FE03DEF3DE03DE03DE03DE03D0000
        FF7F0000FF7F0000FF7F0000FF7F0000FF7F0000E03DE03DE03DE03DFF7FEF3D
        FF7FEF3DE03DEF3DE03DEF3DE03DEF3DE03DEF3DFF7FFF7FFF7F000000000000
        0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000E03DEF3DEF3DEF3D
        EF3DE03DFF7FFF7FFF7FFF7FFF7FFF7FEF3DEF3DEF3DEF3DFF7F0000FF7FFF7F
        F75E0000000000000000000000000000F75EFF7FFF7F0000E03DEF3DFF7FE03D
        FF7FEF3DEF3DEF3DEF3DEF3DEF3DEF3DE03DFF7FFF7FEF3DFF7F0000FF7F007C
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000E03DEF3DFF7FEF3D
        E03DE03DE03DE03DE03DE03DE03DE03DEF3DEF3DEF3DEF3DFF7F0000FF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000E03DEF3DE03DFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FEF3DE03DE03D00000000
        00000000000000000000000000000000000000000000E03DE03DE03DEF3DEF3D
        EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DE03DE03DE03DE03DE03D
        000000000000000000000000000000000000E03DE03DE03DE03DE03DE03DE03D
        EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DFF7FE03DE03DE03DE03DE03DE03D
        0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000E03DE03DE03DE03DE03DE03DE03D
        EF3DFF7FE03DFF7FFF7FFF7FFF7FFF7FEF3DFF7FE03DE03DE03DE03DE03DE03D
        0000FF7F00000000000000000000FF7F0000E03DE03DE03DE03DE03DE03DE03D
        EF3DFF7FEF3DEF3DEF3DEF3DEF3DFF7FEF3DFF7FE03DE03DE03DE03DE03DE03D
        0000FF7F0000E003E003FF030000FF7F0000E03DE03DE03DE03DE03DE03DE03D
        EF3DFF7FEF3DFF7FE03DE03DEF3DFF7FEF3DFF7FE03DE03DE03DE03DE03DE03D
        0000FF7F00001F7CE0031F7C0000FF7F0000E03DE03DE03DE03DE03DE03DE03D
        EF3DFF7FEF3DFF7FFF7FFF7FEF3DFF7FEF3DFF7FE03DE03DE03DE03DE03DE03D
        0000FF7F00000000000000000000FF7F0000E03DE03DE03DE03DE03DE03DE03D
        EF3DFF7FEF3DEF3DEF3DEF3DEF3DE03DEF3DFF7FE03DE03DE03DE03DE03DE03D
        0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000E03DE03DE03DE03DE03DE03DE03D
        EF3DFF7FFF7FFF7FFF7FFF7FFF7FFF7FEF3DFF7FE03DE03DE03DE03DE03DE03D
        000000000000000000000000000000000000E03DE03DE03DE03DE03DE03DE03D
        EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DE03DE03DE03DE03D}
      NumGlyphs = 2
      OnClick = sbViewClick
    end
    object sbPrint: TRxSpeedButton
      Left = 152
      Top = 2
      Width = 86
      Height = 45
      Hint = 'Click Here To Print This Report'
      Caption = '&Print'
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000020000000100000000100
        10000000000000040000000000000000000000000000000000000F3C0F3C0F3C
        0F3C0F3C0F3C00000000000000000000000000000000000000000F3C0F3C0F3C
        0F3C0F3CFF7FEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D0F3C0F3C0F3C
        0F3C000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000F3C0F3C0F3C
        FF7FEF3DEF3DEF3DFF7F0F3CFF7FFF7FFF7FFF7F0F3C0F3CEF3D0F3C0F3C0000
        00000000FF7F0000FF7F0000000000000000FF7FFF7FFF7F00000F3CFF7FEF3D
        EF3DEF3DFF7FEF3DFF7FEF3DEF3DEF3DEF3D0F3C0F3C0F3CEF3D000000000000
        FF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000EF3DEF3DEF3D
        FF7FEF3DFF7FEF3DFF7F0F3CFF7FFF7FFF7FFF7FFF7FFF7FEF3D0000FF7F0000
        FF7F0000FF7F0000FF7F000000000000000000000000FF7F0000EF3DFF7FEF3D
        FF7FEF3DFF7FEF3DFF7FEF3DEF3DEF3DEF3DEF3DEF3D0F3CEF3D0000FF7F0000
        FF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000EF3DFF7FEF3D
        FF7FEF3DFF7FEF3DFF7F0F3CFF7FFF7FFF7FFF7FFF7FFF7FEF3D0000FF7F0000
        FF7F0000FF7F0000FF7F000000000000000000000000FF7F0000EF3DFF7FEF3D
        FF7FEF3DFF7FEF3DFF7FEF3DEF3DEF3DEF3DEF3DEF3D0F3CEF3D0000FF7F0000
        FF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000EF3DFF7FEF3D
        FF7FEF3DFF7FEF3DFF7F0F3CFF7FFF7FFF7F0F3C0F3C0F3CEF3D0000FF7F0000
        FF7F0000FF7F0000FF7F000000000000FF7FFF7FFF7FFF7F0000EF3DFF7FEF3D
        FF7FEF3DFF7FEF3DFF7FEF3DEF3DEF3D0F3C0F3CFF7FFF7FEF3D0000FF7F0000
        FF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7F0000000000000000EF3DFF7FEF3D
        FF7FEF3DFF7FEF3DFF7F0F3CFF7FFF7F0F3CEF3DEF3DEF3DEF3D0000FF7F0000
        FF7F0000FF7F0000FF7F00000000FF7FFF7F0000FF7F00000F3CEF3DFF7FEF3D
        FF7FEF3DFF7FEF3DFF7FEF3DEF3D0F3C0F3CEF3DFF7FEF3D0F3C0000FF7F0000
        FF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7F000000000F3C0F3CEF3DFF7FEF3D
        FF7FEF3DFF7FEF3DFF7FFF7FFF7FFF7FFF7FEF3DEF3D0F3C0F3C0000FF7F0000
        FF7F0000FF7F00000000000000000000000000000F3C0F3C0F3CEF3DFF7FEF3D
        FF7FEF3DFF7FEF3DEF3DEF3DEF3DEF3DEF3DEF3D0F3C0F3C0F3C0000FF7F0000
        FF7F00000000000000000000000000000F3C0F3C0F3C0F3C0F3CEF3DFF7FEF3D
        FF7FEF3DEF3DEF3DEF3DEF3DEF3DEF3D0F3C0F3C0F3C0F3C0F3C0000FF7F0000
        0000000000000000000000000F3C0F3C0F3C0F3C0F3C0F3C0F3CEF3DFF7FEF3D
        EF3DEF3DEF3DEF3DEF3DEF3D0F3C0F3C0F3C0F3C0F3C0F3C0F3C000000000000
        00000000000000000F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3CEF3DEF3DEF3D
        EF3DEF3DEF3DEF3D0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C}
      NumGlyphs = 2
      OnClick = sbViewClick
    end
    object ToolButton1: TToolButton
      Left = 238
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 0
      Style = tbsDivider
    end
    object sbHelp: TRxSpeedButton
      Left = 246
      Top = 2
      Width = 58
      Height = 45
      Hint = 'Click Here For Help'
      Caption = '&Help'
      Enabled = False
      Flat = True
      Glyph.Data = {
        D2030000424DD203000000000000360000002800000016000000150000000100
        1000000000009C03000000000000000000000000000000000000FF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FBD775A6B5A6B5B6B9C73FF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F5A6B11422D258C00CC000F003121
        554A9C73FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F95520700
        0B000F009008CB094F091300110050255A67FF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7F734E06006D0090087208B2082C0A8D121412B9101500CF147B6F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F5A6B07004C00900892087300EF09AD0E
        1113981BBE1ABD101300D135FE7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F31460A00
        8F0892085308F308AC0EED0E52133B1B3F1E3F15D60868015967FF7FFF7FFF7F
        FF7FFF7FFF7FDE7B0C210F0051087208130912096F0ED00E55121E0DFF00BE00
        B700A901934EFF7FFF7FFF7FFF7FFF7FFF7FBD77AC1010002E09AE09D00D5611
        381119115B08F724D24932562F5608464F3EFF7FFF7FFF7FFF7FFF7FFF7FDD7B
        AE106D018A0E2F0E57111A26FE2D9F21FD106B41806A407F407F8366F039FF7F
        FF7FFF7FFF7FBD77396718630D194B02CB0E0C1394239D43DF4A3F363E194F3D
        485E08770777465A3242FF7FFF7FFF7FFF7F7B6F9C73BD7734424902CC0A2D0F
        B423FE439F4B5F363E19F528913DD149CE492B2D185FFF7FFF7FFF7FFF7F9C73
        FF7FFF7F7B6B6A12CB0A0C0F0F17B627F9333727B4118845806A237B207BCC66
        DE7BFF7FFF7FFF7FFF7F9C73DE7B7B6F7B6F903A8A02EC0AAF0E530E30132E13
        4E0A8A49826A237F207F0A77DE7BFF7FFF7FFF7FFF7F9C73FF7F9C739C739C73
        9136AA02CF01B3084D0A0E0A9300AE396066037B237F007F3473FF7FFF7FFF7F
        FF7F9C73DE7B7B6F7B6F7B6F7B6BF6522E2A8C01AB018D01B0000A124856A072
        247F227F04777A73FF7FFF7FFF7F9C73DE7B7B6F7B6F7B6F7B6F5A6B9C73D552
        B5529552524AD55A9C736B66E272237F207F0673BC7BFF7FFF7F9C73FF7F9C73
        9C739C739C739C73DE7B39671767915A295A4362136B176B00620277207B207F
        5577FF7FFF7F9C73FF7F9C739C739C739C737B6F3967F75EB1624066207F427F
        E8720F46023DA372237B207F7577FF7FFF7F9C73FF7FFF7FFF7FFF7FFF7FDE7B
        5A6B3967BC776A62007F237F227F8066445A237B237B007B787BFF7FFF7F9C73
        9C739C739C739C739C737B6F1867FF7FFF7F9C77EC72207F207F247F247F207F
        207B0F73FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        DE7F54770B77247F247F0A775477DE7FFF7FFF7FFF7F}
    end
  end
  object cbAllSires: TCheckBox
    Left = 10
    Top = 59
    Width = 91
    Height = 17
    Alignment = taLeftJustify
    Caption = 'All AI Bulls'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = cbAllSiresClick
  end
end
