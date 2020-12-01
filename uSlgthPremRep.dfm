object fSlgthPremRep: TfSlgthPremRep
  Left = 195
  Top = 112
  Width = 486
  Height = 300
  Caption = 'fSlgthPremRep'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label2: TLabel
    Left = 72
    Top = 92
    Width = 17
    Height = 16
    Caption = 'To'
  end
  object Label3: TLabel
    Left = 250
    Top = 92
    Width = 32
    Height = 16
    Caption = 'From'
  end
  object Label4: TLabel
    Left = 16
    Top = 92
    Width = 31
    Height = 16
    Caption = 'Date'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 8
    Top = 70
    Width = 458
    Height = 180
    Shape = bsFrame
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1138
    Height = 54
    ButtonHeight = 47
    ButtonWidth = 71
    Caption = 'ToolBar1'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Images = WinData.WinDataImageList
    TabOrder = 0
    object sbExit: TRxSpeedButton
      Left = 0
      Top = 2
      Width = 58
      Height = 47
      Caption = '&Exit'
      Flat = True
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
    end
    object ToolButton1: TToolButton
      Left = 58
      Top = 2
      Width = 3
      Caption = 'ToolButton1'
      Style = tbsDivider
    end
    object sbView: TRxSpeedButton
      Left = 61
      Top = 2
      Width = 86
      Height = 47
      Caption = '&View'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF033373F3F3F3F3F3733330F0F0F0F0F
        03333F7F737373737FFF0000FFFFFFF0000377773FFFFFF7777F0FF800000008
        FF037F3F77777773FF7F0F9FFFFFFFF000037F7333333337777F0FFFFFFFFFFF
        FF0373FFFFFFFFFFFF7330000000000000333777777777777733333000000000
        3333333777777777F3333330FFFFFFF033333337F3FFFFF7F3333330F00000F0
        33333337F77777F7F3333330F0AAE0F033333337F7F337F7F3333330F0DAD0F0
        33333337F7FFF7F7F3333330F00000F033333337F7777737F3333330FFFFFFF0
        33333337FFFFFFF7F33333300000000033333337777777773333}
      NumGlyphs = 2
      OnClick = sbViewClick
    end
    object sbPrint: TRxSpeedButton
      Left = 147
      Top = 2
      Width = 86
      Height = 47
      Caption = '&Print'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
        000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
        FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
        FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
        0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
        05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
        55557F7777777555555500000005555555557777777555555555}
      NumGlyphs = 2
    end
    object ToolButton2: TToolButton
      Left = 233
      Top = 2
      Width = 4
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsDivider
    end
    object sbHelp: TRxSpeedButton
      Left = 237
      Top = 2
      Width = 58
      Height = 47
      Caption = '&Help'
      Flat = True
      Glyph.Data = {
        72010000424D7201000000000000760000002800000016000000150000000100
        040000000000FC00000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFF777
        FFFFFFFFFF00FFFFFF78844488FFFFFFFF00FFFFF70444664487FFFFFF00FFFF
        804444666C447FFFFF00FFF704444666EEC48FFFFF00FFF844444666EEC467FF
        FF00FFF844466666CCC468FFFF00FFF4466666CC588888FFFF00FFF4666688CC
        83BB38FFFF00F776666E777C88BB38FFFF007FF8666E777C588887FFFF00FFF7
        6666EE8683BB8FFFFF00FF778666666683BBBFFFFF00FFFFF866466483BBB7FF
        FF00FF777778666468BBBB7FFF00FF77777F77787F8BBBBFFF00FFFFFFFF7788
        3773BBB7FF00FFFFFF77773BBB83BBB7FF00FFFFFFF77F8BBB33BBB7FF00FFFF
        FF77FFF7BBBBBB7FFF00FFFFFFFFFFFF7BBBB7FFFF00}
    end
    object ToolButton3: TToolButton
      Left = 295
      Top = 2
      Width = 5
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsDivider
    end
    object Panel1: TPanel
      Left = 300
      Top = 2
      Width = 134
      Height = 47
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 5
        Top = 1
        Width = 87
        Height = 16
        Caption = 'Herd Identity'
      end
      object HerdCombo: TRxDBLookupCombo
        Left = 4
        Top = 20
        Width = 120
        Height = 23
        DropDownCount = 8
        EmptyValue = 'All Herds'
        LookupField = 'ID'
        LookupDisplay = 'HerdIdentity'
        LookupSource = WinData.dsHerdDefaults
        TabOrder = 0
      end
    end
  end
  object DateTo: TDateEdit
    Left = 290
    Top = 87
    Width = 121
    Height = 25
    NumGlyphs = 2
    TabOrder = 1
  end
  object DateFrom: TDateEdit
    Left = 96
    Top = 87
    Width = 121
    Height = 25
    NumGlyphs = 2
    TabOrder = 2
  end
  object rgSortOptions: TRadioGroup
    Left = 17
    Top = 142
    Width = 203
    Height = 88
    Caption = 'Sort Options'
    Items.Strings = (
      'National ID Number'
      'Animal Number'
      'Date Of Birth')
    TabOrder = 3
  end
  object rgSortOrder: TRadioGroup
    Left = 231
    Top = 142
    Width = 203
    Height = 88
    Caption = 'Sort Order'
    Items.Strings = (
      'Ascending'
      'Decending')
    TabOrder = 4
  end
  object QuickRep1: TQuickRep
    Left = 344
    Top = 382
    Width = 794
    Height = 1123
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
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      100
      2970
      100
      2100
      100
      100
      0)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object PageHeaderBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 102
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
        269.875
        1899.70833333333)
      BandType = rbPageHeader
      object QRLabel1: TQRLabel
        Left = 12
        Top = 10
        Width = 279
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.1458333333333
          31.75
          26.4583333333333
          738.1875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Eligible for Slaughter Premium'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
    end
    object ColumnHeaderBand1: TQRBand
      Left = 38
      Top = 140
      Width = 718
      Height = 40
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
        105.833333333333
        1899.70833333333)
      BandType = rbColumnHeader
    end
    object SummaryBand1: TQRBand
      Left = 38
      Top = 220
      Width = 718
      Height = 40
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
        105.833333333333
        1899.70833333333)
      BandType = rbSummary
    end
    object PageFooterBand1: TQRBand
      Left = 38
      Top = 260
      Width = 718
      Height = 40
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
        105.833333333333
        1899.70833333333)
      BandType = rbPageFooter
    end
    object QRSubDetail1: TQRSubDetail
      Left = 38
      Top = 180
      Width = 718
      Height = 40
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
        105.833333333333
        1899.70833333333)
      Master = QuickRep1
      PrintBefore = False
      PrintIfEmpty = True
    end
  end
  object MyTable: TTable
    DatabaseName = 'Kingswd'
    Left = 436
    Top = 116
  end
  object MyQuery: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * from '#39'+MyTable.TableName+'#39)
    Left = 408
    Top = 116
  end
end
