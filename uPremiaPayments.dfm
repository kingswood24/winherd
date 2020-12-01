object PremiaPayments: TPremiaPayments
  Left = 230
  Top = 139
  Width = 784
  Height = 554
  Caption = 'Premia Payments'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PrintScale = poPrintToFit
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object p: TPanel
    Left = 0
    Top = 52
    Width = 776
    Height = 475
    Align = alClient
    BevelOuter = bvNone
    Color = 13157523
    TabOrder = 1
    object Bevel2: TBevel
      Left = 264
      Top = 343
      Width = 512
      Height = 2
      Shape = bsBottomLine
    end
    object Bevel3: TBevel
      Left = 775
      Top = -51
      Width = 1
      Height = 395
      Shape = bsLeftLine
    end
    object Label11: TLabel
      Left = 515
      Top = 169
      Width = 115
      Height = 15
      Caption = 'Payment Comments'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object gbApplied: TGroupBox
      Left = 0
      Top = 341
      Width = 776
      Height = 134
      Align = alBottom
      Color = 13681328
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsUnderline]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      object lFirst: TLabel
        Left = 14
        Top = 37
        Width = 51
        Height = 15
        Caption = 'First Age '
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lSecond: TLabel
        Left = 14
        Top = 68
        Width = 66
        Height = 15
        Caption = 'Second Age'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lBull: TLabel
        Left = 14
        Top = 97
        Width = 21
        Height = 15
        Caption = 'Bull'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 140
        Top = 0
        Width = 42
        Height = 15
        Caption = 'Applied'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 331
        Top = 0
        Width = 55
        Height = 15
        Caption = 'Payable €'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label27: TLabel
        Left = 535
        Top = 0
        Width = 49
        Height = 30
        Alignment = taCenter
        Caption = 'Balance Due €'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label8: TLabel
        Left = 219
        Top = 0
        Width = 73
        Height = 30
        Alignment = taCenter
        Caption = 'Total Due €'#13#10'Exc. Top-ups'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 436
        Top = 0
        Width = 46
        Height = 30
        Caption = 'Already Payed €'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Edit7: TEdit
        Tag = 7
        Left = 136
        Top = 36
        Width = 50
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 3
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = '0'
        OnChange = Edit7Change
      end
      object Edit8: TEdit
        Tag = 8
        Left = 136
        Top = 66
        Width = 50
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = '0'
        OnChange = Edit8Change
      end
      object Edit9: TEdit
        Tag = 9
        Left = 136
        Top = 96
        Width = 50
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Text = '0'
        OnChange = Edit9Change
      end
      object Edit10: TEdit
        Tag = 10
        Left = 525
        Top = 35
        Width = 66
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        Text = '0'
      end
      object Edit12: TEdit
        Tag = 12
        Left = 525
        Top = 95
        Width = 66
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        Text = '0'
      end
      object Edit11: TEdit
        Tag = 11
        Left = 525
        Top = 65
        Width = 66
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        Text = '0'
      end
      object Edit13: TEdit
        Tag = 13
        Left = 223
        Top = 36
        Width = 66
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        Text = '0'
      end
      object Edit14: TEdit
        Tag = 14
        Left = 223
        Top = 66
        Width = 66
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        Text = '0'
      end
      object Edit15: TEdit
        Tag = 15
        Left = 223
        Top = 96
        Width = 66
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        Text = '0'
      end
      object Edit1: TEdit
        Tag = 13
        Left = 427
        Top = 35
        Width = 66
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
        Text = '0'
      end
      object Edit2: TEdit
        Tag = 14
        Left = 427
        Top = 65
        Width = 66
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
        Text = '0'
      end
      object Edit3: TEdit
        Tag = 15
        Left = 427
        Top = 95
        Width = 66
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clGreen
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
        Text = '0'
      end
      object DBEdit6: TDBEdit
        Tag = 4
        Left = 325
        Top = 35
        Width = 73
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        OnChange = DBEdit6Change
      end
      object DBEdit8: TDBEdit
        Tag = 5
        Left = 325
        Top = 65
        Width = 73
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
        OnChange = DBEdit6Change
      end
      object DBEdit11: TDBEdit
        Tag = 6
        Left = 325
        Top = 95
        Width = 73
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 14
        OnChange = DBEdit6Change
      end
    end
    object Panel4: TPanel
      Left = 276
      Top = 3
      Width = 497
      Height = 335
      Align = alClient
      Caption = 'Panel4'
      Color = 13693899
      TabOrder = 1
      object Label10: TLabel
        Left = 13
        Top = 44
        Width = 110
        Height = 15
        Caption = 'Previous Payments'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 8
        Top = 4
        Width = 152
        Height = 22
        Caption = 'Payment History'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LookUpPayments: TRxDBLookupCombo
        Left = 13
        Top = 66
        Width = 126
        Height = 22
        DropDownCount = 8
        DisplayEmpty = 'Select Payment'
        EmptyValue = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        LookupField = 'ID'
        LookupDisplay = 'PayDate'
        LookupSource = dsPrevPayments
        ParentFont = False
        TabOrder = 0
        OnCloseUp = LookUpPaymentsCloseUp
      end
      object PayComment2: TDBMemo
        Left = 185
        Top = 41
        Width = 257
        Height = 66
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object PayGrid: TStringGrid
        Left = 7
        Top = 116
        Width = 484
        Height = 215
        ColCount = 6
        DefaultColWidth = 60
        DefaultRowHeight = 19
        FixedColor = 14194518
        RowCount = 10
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goColMoving, goTabs]
        ParentFont = False
        TabOrder = 2
        ColWidths = (
          60
          60
          61
          60
          60
          60)
        RowHeights = (
          19
          19
          19
          19
          19
          19
          19
          19
          19
          19)
      end
    end
    object RxSplitter1: TRxSplitter
      Left = 0
      Top = 338
      Width = 776
      Height = 3
      ControlFirst = gbApplied
      Align = alBottom
      BevelWidth = 2
      Enabled = False
    end
    object RxSplitter2: TRxSplitter
      Left = 273
      Top = 3
      Width = 3
      Height = 335
      ControlFirst = Panel4
      Align = alLeft
      BevelWidth = 2
      Enabled = False
    end
    object RxSplitter4: TRxSplitter
      Left = 773
      Top = 3
      Width = 3
      Height = 335
      Align = alRight
      BevelWidth = 2
      Enabled = False
    end
    object RxSplitter5: TRxSplitter
      Left = 0
      Top = 0
      Width = 776
      Height = 3
      Align = alTop
      BevelWidth = 2
      Enabled = False
    end
    object Panel2: TPanel
      Left = 0
      Top = 3
      Width = 273
      Height = 335
      Align = alLeft
      Color = 13157523
      TabOrder = 6
      object Bevel1: TBevel
        Left = 10
        Top = 219
        Width = 254
        Height = 2
        Shape = bsBottomLine
      end
      object Label23: TLabel
        Left = 7
        Top = 81
        Width = 95
        Height = 15
        Caption = 'Payment Ref. No.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 8
        Top = 230
        Width = 113
        Height = 15
        Caption = 'Payment Comments'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Bevel6: TBevel
        Left = 10
        Top = 111
        Width = 254
        Height = 2
        Shape = bsBottomLine
      end
      object Label12: TLabel
        Left = 8
        Top = 50
        Width = 77
        Height = 15
        Caption = 'Payment Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object Bevel5: TBevel
        Left = 10
        Top = 35
        Width = 254
        Height = 2
        Shape = bsBottomLine
      end
      object Label3: TLabel
        Left = 8
        Top = 4
        Width = 136
        Height = 22
        Caption = 'Enter Payment'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lF: TLabel
        Left = 7
        Top = 124
        Width = 51
        Height = 15
        Caption = 'First Age '
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lS: TLabel
        Left = 7
        Top = 157
        Width = 66
        Height = 15
        Caption = 'Second Age'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lB: TLabel
        Left = 7
        Top = 189
        Width = 21
        Height = 15
        Caption = 'Bull'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit4: TDBEdit
        Left = 121
        Top = 78
        Width = 109
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object PayComment: TDBMemo
        Left = 7
        Top = 247
        Width = 250
        Height = 81
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object PaymentDate: TDBDateEdit
        Left = 121
        Top = 46
        Width = 109
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 2
        YearDigits = dyFour
      end
      object DBEdit7: TDBEdit
        Tag = 1
        Left = 122
        Top = 120
        Width = 67
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object DBEdit9: TDBEdit
        Tag = 2
        Left = 122
        Top = 152
        Width = 67
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object DBEdit10: TDBEdit
        Tag = 3
        Left = 122
        Top = 184
        Width = 67
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
    end
  end
  object Dock971: TDock97
    Left = 0
    Top = 0
    Width = 776
    Height = 52
    Color = 13681328
    object Toolbar971: TToolbar97
      Left = 0
      Top = 0
      Caption = 'Toolbar971'
      Color = 13681328
      DockPos = 0
      FullSize = True
      TabOrder = 0
      object sbExit: TRxSpeedButton
        Left = 0
        Top = 0
        Width = 53
        Height = 48
        Caption = '&Exit'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        Transparent = True
        OnClick = sbExitClick
      end
      object sbSave: TRxSpeedButton
        Left = 209
        Top = 0
        Width = 90
        Height = 48
        Caption = '&Save'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        Transparent = True
        OnClick = sbSaveClick
      end
      object sbCancel: TRxSpeedButton
        Left = 299
        Top = 0
        Width = 90
        Height = 48
        Caption = '&Cancel'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        Transparent = True
        OnClick = sbCancelClick
      end
      object sbHelp: TRxSpeedButton
        Left = 607
        Top = 0
        Width = 82
        Height = 48
        Caption = '&Help'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        Transparent = True
      end
      object ToolbarSep971: TToolbarSep97
        Left = 389
        Top = 0
      end
      object ToolbarSep974: TToolbarSep97
        Left = 689
        Top = 0
      end
      object sbDefaults: TRxSpeedButton
        Left = 395
        Top = 0
        Width = 65
        Height = 48
        Caption = 'Defaults'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666666666666666666666660000666666666666666666666FFFFFFFFFFFF666
          000066000000000000666666888888888888F666000066877777777770666666
          8F6666666668F6660000668FFFFFFFFF706666668F6FF6FFFF68F6660000668F
          44F4444F706666668F8868888668F6660000668FFFFFFFFF706666668F6FF6FF
          FF68F6660000668F44F4444F706666668F8868888668F6660000668FFFFFFFFF
          706666668F6666666668F6660000668FFFFFFF0F706666668F6FF6668F68F66F
          0000668F00FFF0B0706664668F88FF68F8F8F6F80000668F0F0F0B0F00064466
          8F8F8F8F8F888F880000668FF0B0B0F0FBF044668FF8F8F8F8F6F88800006688
          880F0F0FBFBF446688888F8F86666688000066666660B0FBFBFB4466666668F8
          66666F880000666666660FBFBFB044666666668FFFFFF8880000666666666000
          0006446666666668888886880000666666666666666666666666666666666666
          0000}
        NumGlyphs = 2
        ParentFont = False
        Transparent = True
        OnClick = sbDefaultsClick
      end
      object ToolbarSep973: TToolbarSep97
        Left = 203
        Top = 0
      end
      object ToolbarSep976: TToolbarSep97
        Left = 460
        Top = 0
      end
      object ToolbarSep975: TToolbarSep97
        Left = 601
        Top = 0
      end
      object ToolbarSep972: TToolbarSep97
        Left = 53
        Top = 0
      end
      object Panel1: TPanel
        Left = 466
        Top = 4
        Width = 135
        Height = 40
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        object Label1: TLabel
          Left = 5
          Top = 0
          Width = 73
          Height = 16
          Caption = 'Herd Identity'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object HerdCombo: TRxDBLookupCombo
          Left = 4
          Top = 16
          Width = 128
          Height = 23
          DropDownCount = 8
          EmptyValue = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          LookupField = 'ID'
          LookupDisplay = 'HerdIdentity'
          LookupSource = WinData.dsHerdDefaults
          ParentFont = False
          TabOrder = 0
        end
      end
      object Panel3: TPanel
        Left = 59
        Top = 1
        Width = 144
        Height = 45
        BevelOuter = bvNone
        Color = 13681328
        TabOrder = 1
        object RxSpeedButton2: TRxSpeedButton
          Left = 4
          Top = 1
          Width = 140
          Height = 22
          Alignment = taLeftJustify
          DropDownMenu = pmPremType
          Caption = '&Premium Type'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777FFFFFFFFFFF000077777700000000000777777788888888888F
            00007777778777777777077777778F777777778F00007777778FFFFFFFF70777
            77778F7FFFFFF78F00007777718F777777F707777778FF888888778F00007777
            711FFFFFFFF7077777F88F7FFFFFF78F000077711111777777F70777F8888888
            8888778F00007887711FFFFFFFF7077787788F7FFFFFF78F00007177718F7777
            77F70778F7788F888888778F00007177778FFFFFFFF70778F7778F7FFFFFF78F
            00007177778F777777F70778F7778F888888778F00007887778FFFFFFFF70778
            7F778F7FFFF7778F00007717778F7777FFF7077787F78F888877FF8F00007771
            778FFFFFF000077778778F777778888700007777778FFFFFF7F8777777778F77
            7778F87700007777778FFFFFF787777777778FFFFFF887770000777777888888
            8877777777778888888877770000777777777777777777777777777777777777
            0000}
          Layout = blGlyphRight
          Margin = 5
          NumGlyphs = 2
          ParentFont = False
          Transparent = True
        end
        object ApplicDate: TRxDBLookupCombo
          Left = 4
          Top = 24
          Width = 141
          Height = 21
          DropDownCount = 8
          DropDownWidth = 300
          EmptyValue = '0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnCloseUp = ApplicDateCloseUp
        end
      end
    end
  end
  object pmPremType: TPopupMenu
    Left = 290
    Top = 56
    object SpecialBeefPremium1: TMenuItem
      Caption = 'Special &Beef Premium'
      Checked = True
      GroupIndex = 1
      RadioItem = True
      OnClick = SpecialBeefPremium1Click
    end
    object SucklerCowPremium1: TMenuItem
      Caption = 'Suckler &Cow Premium'
      GroupIndex = 1
      RadioItem = True
      OnClick = SucklerCowPremium1Click
    end
    object SlaughterPremium1: TMenuItem
      Caption = '&Slaughter Premium'
      GroupIndex = 1
      RadioItem = True
      OnClick = SlaughterPremium1Click
    end
  end
  object qPrevPayments: TQuery
    Active = True
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * From PremiaPayments P')
    Left = 738
    Top = 168
    object qPrevPaymentsID: TIntegerField
      FieldName = 'ID'
      Origin = 'KINGSWD."PremiaPayments.DB".ID'
    end
    object qPrevPaymentsApplicID: TIntegerField
      FieldName = 'ApplicID'
      Origin = 'KINGSWD."PremiaPayments.DB".ApplicID'
    end
    object qPrevPaymentsPayDate: TDateField
      FieldName = 'PayDate'
      Origin = 'KINGSWD."PremiaPayments.DB".PayDate'
    end
    object qPrevPaymentsPayRefNo: TStringField
      FieldName = 'PayRefNo'
      Origin = 'KINGSWD."PremiaPayments.DB".PayRefNo'
      Size = 30
    end
    object qPrevPaymentsPayOrdNo: TStringField
      FieldName = 'PayOrdNo'
      Origin = 'KINGSWD."PremiaPayments.DB".PayOrdNo'
      Size = 30
    end
    object qPrevPaymentsBeefReduct: TCurrencyField
      FieldName = 'BeefReduct'
      Origin = 'KINGSWD."PremiaPayments.DB".BeefReduct'
    end
    object qPrevPaymentsPayType: TIntegerField
      FieldName = 'PayType'
      Origin = 'KINGSWD."PremiaPayments.DB".PayType'
    end
    object qPrevPaymentsFirst_Amt: TCurrencyField
      FieldName = 'First_Amt'
      Origin = 'KINGSWD."PremiaPayments.DB".First_Amt'
    end
    object qPrevPaymentsSecond_Amt: TCurrencyField
      FieldName = 'Second_Amt'
      Origin = 'KINGSWD."PremiaPayments.DB".Second_Amt'
    end
    object qPrevPaymentsBull_Amt: TCurrencyField
      FieldName = 'Bull_Amt'
      Origin = 'KINGSWD."PremiaPayments.DB".Bull_Amt'
    end
    object qPrevPaymentsFirst_Clm: TIntegerField
      FieldName = 'First_Clm'
      Origin = 'KINGSWD."PremiaPayments.DB".First_Clm'
    end
    object qPrevPaymentsSecond_Clm: TIntegerField
      FieldName = 'Second_Clm'
      Origin = 'KINGSWD."PremiaPayments.DB".Second_Clm'
    end
    object qPrevPaymentsBull_Clm: TIntegerField
      FieldName = 'Bull_Clm'
      Origin = 'KINGSWD."PremiaPayments.DB".Bull_Clm'
    end
    object qPrevPaymentsSuckCowHeif_Amt: TCurrencyField
      FieldName = 'SuckCowHeif_Amt'
      Origin = 'KINGSWD."PremiaPayments.DB".SuckCowHeif_Amt'
    end
    object qPrevPaymentsSuckHeifTopUp_Amt: TCurrencyField
      FieldName = 'SuckHeifTopUp_Amt'
      Origin = 'KINGSWD."PremiaPayments.DB".SuckHeifTopUp_Amt'
    end
    object qPrevPaymentsSuckCowHeif_Clm: TIntegerField
      FieldName = 'SuckCowHeif_Clm'
      Origin = 'KINGSWD."PremiaPayments.DB".SuckCowHeif_Clm'
    end
    object qPrevPaymentsSuckHeifTopUp_Clm: TIntegerField
      FieldName = 'SuckHeifTopUp_Clm'
      Origin = 'KINGSWD."PremiaPayments.DB".SuckHeifTopUp_Clm'
    end
    object qPrevPaymentsSlght_Amt: TCurrencyField
      FieldName = 'Slght_Amt'
      Origin = 'KINGSWD."PremiaPayments.DB".Slght_Amt'
    end
    object qPrevPaymentsSlghtHeifTopUp_Amt: TCurrencyField
      FieldName = 'SlghtHeifTopUp_Amt'
      Origin = 'KINGSWD."PremiaPayments.DB".SlghtHeifTopUp_Amt'
    end
    object qPrevPaymentsSlght_Clm: TIntegerField
      FieldName = 'Slght_Clm'
      Origin = 'KINGSWD."PremiaPayments.DB".Slght_Clm'
    end
    object qPrevPaymentsSlghtHeifTopUp_Clm: TIntegerField
      FieldName = 'SlghtHeifTopUp_Clm'
      Origin = 'KINGSWD."PremiaPayments.DB".SlghtHeifTopUp_Clm'
    end
    object qPrevPaymentsPenalty_Amt: TCurrencyField
      FieldName = 'Penalty_Amt'
      Origin = 'KINGSWD."PremiaPayments.DB".Penalty_Amt'
    end
    object qPrevPaymentsRunning_Amt: TCurrencyField
      FieldName = 'Running_Amt'
      Origin = 'KINGSWD."PremiaPayments.DB".Running_Amt'
    end
    object qPrevPaymentsPayable_Amt: TCurrencyField
      FieldName = 'Payable_Amt'
      Origin = 'KINGSWD."PremiaPayments.DB".Payable_Amt'
    end
    object qPrevPaymentsBalanceDue: TCurrencyField
      FieldName = 'BalanceDue'
      Origin = 'KINGSWD."PremiaPayments.DB".BalanceDue'
    end
    object qPrevPaymentsComment: TBlobField
      FieldName = 'Comment'
      Origin = 'KINGSWD."PremiaPayments.DB".Comment'
      BlobType = ftBlob
      Size = 220
    end
  end
  object dsPrevPayments: TDataSource
    DataSet = qPrevPayments
    Left = 738
    Top = 196
  end
  object PaymentTable: TTable
    AfterPost = PaymentTableAfterPost
    DatabaseName = 'Kingswd'
    TableName = 'PremiaPayments.DB'
    Left = 738
    Top = 224
    object PaymentTableID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object PaymentTableApplicID: TIntegerField
      FieldName = 'ApplicID'
    end
    object PaymentTablePayDate: TDateField
      FieldName = 'PayDate'
    end
    object PaymentTablePayRefNo: TStringField
      FieldName = 'PayRefNo'
      Size = 30
    end
    object PaymentTablePayOrdNo: TStringField
      FieldName = 'PayOrdNo'
      Size = 30
    end
    object PaymentTableBeefReduct: TCurrencyField
      FieldName = 'BeefReduct'
    end
    object PaymentTableFirst_Amt: TCurrencyField
      FieldName = 'First_Amt'
    end
    object PaymentTableSecond_Amt: TCurrencyField
      FieldName = 'Second_Amt'
    end
    object PaymentTableBull_Amt: TCurrencyField
      FieldName = 'Bull_Amt'
    end
    object PaymentTableFirst_Clm: TIntegerField
      FieldName = 'First_Clm'
    end
    object PaymentTableSecond_Clm: TIntegerField
      FieldName = 'Second_Clm'
    end
    object PaymentTableBull_Clm: TIntegerField
      FieldName = 'Bull_Clm'
    end
    object PaymentTableSuckCowHeif_Amt: TCurrencyField
      FieldName = 'SuckCowHeif_Amt'
    end
    object PaymentTableSuckHeifTopUp_Amt: TCurrencyField
      FieldName = 'SuckHeifTopUp_Amt'
    end
    object PaymentTableSuckCowHeif_Clm: TIntegerField
      FieldName = 'SuckCowHeif_Clm'
    end
    object PaymentTableSuckHeifTopUp_Clm: TIntegerField
      FieldName = 'SuckHeifTopUp_Clm'
    end
    object PaymentTableSlght_Amt: TCurrencyField
      FieldName = 'Slght_Amt'
    end
    object PaymentTableSlghtHeifTopUp_Amt: TCurrencyField
      FieldName = 'SlghtHeifTopUp_Amt'
    end
    object PaymentTableSlght_Clm: TIntegerField
      FieldName = 'Slght_Clm'
    end
    object PaymentTableSlghtHeifTopUp_Clm: TIntegerField
      FieldName = 'SlghtHeifTopUp_Clm'
    end
    object PaymentTablePenalty_Amt: TCurrencyField
      FieldName = 'Penalty_Amt'
    end
    object PaymentTableRunning_Amt: TCurrencyField
      FieldName = 'Running_Amt'
    end
    object PaymentTablePayable_Amt: TCurrencyField
      FieldName = 'Payable_Amt'
    end
    object PaymentTableBalanceDue: TCurrencyField
      FieldName = 'BalanceDue'
    end
    object PaymentTableComment: TBlobField
      FieldName = 'Comment'
      BlobType = ftBlob
      Size = 220
    end
    object PaymentTablePayType: TIntegerField
      FieldName = 'PayType'
    end
  end
  object dsPaymentTable: TDataSource
    DataSet = PaymentTable
    Left = 738
    Top = 251
  end
end
