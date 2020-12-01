object fmBalanceSheet: TfmBalanceSheet
  Left = 291
  Top = 253
  Width = 960
  Height = 553
  VertScrollBar.Position = 162
  Caption = 'BalanceSheet'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object qrBalSheet: TQuickRep
    Left = 34
    Top = 70
    Width = 794
    Height = 1123
    Frame.Color = 11579568
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Frame.Width = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
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
    OnStartPage = qrBalSheetStartPage
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
    object GroupFooterBand1: TQRBand
      Left = 38
      Top = 143
      Width = 718
      Height = 53
      Frame.Color = 11579568
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        140.229166666667
        1899.70833333333)
      BandType = rbGroupFooter
      object QRLabel3: TQRLabel
        Left = 8
        Top = 5
        Width = 103
        Height = 15
        Frame.Color = 11579568
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          21.1666666666667
          13.2291666666667
          272.520833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Fixed Assets'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 8
        Top = 25
        Width = 87
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          21.1666666666667
          66.1458333333333
          230.1875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Current Assets'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 140
        Top = 36
        Width = 47
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          370.416666666667
          95.25
          124.354166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Livestock'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object lCAdjust: TQRLabel
        Left = 349
        Top = 36
        Width = 41
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          923.395833333333
          95.25
          108.479166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lCAdjust'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape16: TQRShape
        Left = 0
        Top = 57
        Width = 718
        Height = 1
        Frame.Color = 11842740
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.64583333333333
          0
          150.8125
          1899.70833333333)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrexp2: TQRExpr
        Left = 480
        Top = 5
        Width = 99
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1270
          13.2291666666667
          261.9375)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        Master = QRSubDetail1
        OnPrint = qrexp2Print
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'SUM(qFA.Balance)'
        FontSize = 8
      end
      object QRShape1: TQRShape
        Left = 312
        Top = 1
        Width = 78
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.64583333333333
          825.5
          2.64583333333333
          206.375)
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object GroupHeaderBand1: TQRBand
      Left = 38
      Top = 84
      Width = 718
      Height = 40
      Frame.Color = 11579568
      Frame.DrawTop = True
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
      BandType = rbGroupHeader
      object QRLabel2: TQRLabel
        Left = 8
        Top = 22
        Width = 73
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          21.1666666666667
          58.2083333333333
          193.145833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fixed Assets'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 8
        Top = 4
        Width = 53
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          21.1666666666667
          10.5833333333333
          140.229166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = ' ASSETS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object GroupFooterBand2: TQRBand
      Left = 38
      Top = 215
      Width = 718
      Height = 74
      Frame.Color = 11579568
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = GroupFooterBand2BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        195.791666666667
        1899.70833333333)
      BandType = rbGroupFooter
      object QRLabel5: TQRLabel
        Left = 8
        Top = 5
        Width = 117
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          21.1666666666667
          13.2291666666667
          309.5625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Current Assets'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 8
        Top = 25
        Width = 71
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          21.1666666666667
          66.1458333333333
          187.854166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Assets'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 8
        Top = 52
        Width = 62
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          21.1666666666667
          137.583333333333
          164.041666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'LIABILITIES'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRExpr1: TQRExpr
        Left = 480
        Top = 5
        Width = 101
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1270
          13.2291666666667
          267.229166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        Master = QRSubDetail2
        OnPrint = QRExpr1Print
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'SUM(qCA.Balance)'
        FontSize = 8
      end
      object LTotalAssets: TQRLabel
        Left = 506
        Top = 25
        Width = 75
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1338.79166666667
          66.1458333333333
          198.4375)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'LTotalAssets'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape2: TQRShape
        Left = 312
        Top = 1
        Width = 78
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.64583333333333
          825.5
          2.64583333333333
          206.375)
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object GroupFooterBand3: TQRBand
      Left = 38
      Top = 308
      Width = 718
      Height = 66
      Frame.Color = 11579568
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        174.625
        1899.70833333333)
      BandType = rbGroupFooter
      object QRLabel8: TQRLabel
        Left = 7
        Top = 5
        Width = 84
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          18.5208333333333
          13.2291666666667
          222.25)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Liabilities'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 7
        Top = 41
        Width = 55
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          18.5208333333333
          108.479166666667
          145.520833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Net Worth'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRExpr2: TQRExpr
        Left = 486
        Top = 5
        Width = 95
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1285.875
          13.2291666666667
          251.354166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        Master = QRSubDetail3
        OnPrint = QRExpr2Print
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'SUM(qLI.Balance)'
        FontSize = 8
      end
      object lNetWorth: TQRLabel
        Left = 526
        Top = 39
        Width = 55
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1391.70833333333
          103.1875
          145.520833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lNetWorth'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = lNetWorthPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape3: TQRShape
        Left = 312
        Top = 1
        Width = 78
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.64583333333333
          825.5
          2.64583333333333
          206.375)
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 46
      Frame.Color = 11579568
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        121.708333333333
        1899.70833333333)
      BandType = rbPageHeader
      object QRLabel1: TQRLabel
        Left = 18
        Top = 7
        Width = 269
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.1458333333333
          47.625
          18.5208333333333
          711.729166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Management Balance Sheet'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsItalic, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object QRSysData1: TQRSysData
        Left = 649
        Top = 9
        Width = 56
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1717.14583333333
          23.8125
          148.166666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDate
        Text = 'Date:'
        Transparent = False
        FontSize = 8
      end
      object QRSysData2: TQRSysData
        Left = 639
        Top = 27
        Width = 66
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1690.6875
          71.4375
          174.625)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Text = 'Page:'
        Transparent = False
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 351
        Top = 27
        Width = 33
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          928.6875
          71.4375
          87.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'From:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object lFromDate: TQRLabel
        Left = 384
        Top = 27
        Width = 57
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1016
          71.4375
          150.8125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lFromDate'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 454
        Top = 27
        Width = 18
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1201.20833333333
          71.4375
          47.625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'To:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object lToDate: TQRLabel
        Left = 474
        Top = 27
        Width = 42
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1254.125
          71.4375
          111.125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lToDate'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 38
      Top = 124
      Width = 718
      Height = 19
      Frame.Color = 11579568
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.2708333333333
        1899.70833333333)
      Master = qrBalSheet
      DataSet = qFA
      FooterBand = GroupFooterBand1
      HeaderBand = GroupHeaderBand1
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText3: TQRDBText
        Left = 140
        Top = 3
        Width = 28
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          370.416666666667
          7.9375
          74.0833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qFA
        DataField = 'Name'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 349
        Top = 3
        Width = 40
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          923.395833333333
          7.9375
          105.833333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qFA
        DataField = 'Balance'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object QRSubDetail2: TQRSubDetail
      Left = 38
      Top = 196
      Width = 718
      Height = 19
      Frame.Color = 11579568
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.2708333333333
        1899.70833333333)
      Master = qrBalSheet
      DataSet = qCA
      FooterBand = GroupFooterBand2
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText1: TQRDBText
        Left = 140
        Top = 3
        Width = 28
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          370.416666666667
          7.9375
          74.0833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qCA
        DataField = 'Name'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 349
        Top = 3
        Width = 40
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          923.395833333333
          7.9375
          105.833333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qCA
        DataField = 'Balance'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object QRSubDetail3: TQRSubDetail
      Left = 38
      Top = 289
      Width = 718
      Height = 19
      Frame.Color = 11579568
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.2708333333333
        1899.70833333333)
      Master = qrBalSheet
      DataSet = qLI
      FooterBand = GroupFooterBand3
      PrintBefore = False
      PrintIfEmpty = True
      object Name: TQRDBText
        Left = 140
        Top = 3
        Width = 28
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          370.416666666667
          7.9375
          74.0833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qLI
        DataField = 'Name'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object Balance: TQRDBText
        Left = 349
        Top = 3
        Width = 40
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          923.395833333333
          7.9375
          105.833333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qLI
        DataField = 'Balance'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object PageFooterBand1: TQRBand
      Left = 38
      Top = 374
      Width = 718
      Height = 20
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
        52.9166666666667
        1899.70833333333)
      BandType = rbPageFooter
      object QRLabel70: TQRLabel
        Left = 3
        Top = 1
        Width = 203
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625
          7.9375
          2.64583333333333
          537.104166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Kingswood Computing Ltd.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel71: TQRLabel
        Left = 511
        Top = 1
        Width = 203
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625
          1352.02083333333
          2.64583333333333
          537.104166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Herd Management'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
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
  object qCA: TQuery
    DatabaseName = 'Accs'
    SQL.Strings = (
      'SELECT DISTINCT Id, Name, Balance'
      'FROM nlaccs '
      'WHERE Category = "CA"'
      'AND Name <> '#39#39
      'AND Balance <> 0'
      'ORDER BY NAME')
    Left = 5
    Top = 28
    object qCAId: TIntegerField
      FieldName = 'Id'
      Origin = 'ACCS."nlaccs.DB".ID'
    end
    object qCAName: TStringField
      FieldName = 'Name'
      Origin = 'ACCS."nlaccs.DB".Name'
      Size = 30
    end
    object qCABalance: TFloatField
      FieldName = 'Balance'
      Origin = 'ACCS."nlaccs.DB".Balance'
      currency = True
    end
  end
  object qFA: TQuery
    DatabaseName = 'Accs'
    SQL.Strings = (
      'SELECT DISTINCT Id, Name, Balance'
      'FROM nlaccs '
      'WHERE Category = "FA"'
      'AND Name <> '#39#39
      'AND Balance <> 0'
      'ORDER BY NAME')
    Left = 1
    Top = 66
    object qFAId: TIntegerField
      FieldName = 'Id'
      Origin = 'ACCS."nlaccs.DB".ID'
    end
    object qFAName: TStringField
      FieldName = 'Name'
      Origin = 'ACCS."nlaccs.DB".Name'
      Size = 30
    end
    object qFABalance: TFloatField
      FieldName = 'Balance'
      Origin = 'ACCS."nlaccs.DB".Balance'
      currency = True
    end
  end
  object qLI: TQuery
    DatabaseName = 'Accs'
    SQL.Strings = (
      'SELECT DISTINCT Id, Name, Balance'
      'FROM nlaccs '
      'WHERE Category = "LI"'
      'AND Name <> '#39#39
      'AND Balance <> 0'
      'ORDER BY NAME')
    Left = 3
    Top = 100
    object qLIId: TIntegerField
      FieldName = 'Id'
      Origin = 'ACCS."nlaccs.DB".ID'
    end
    object qLIName: TStringField
      FieldName = 'Name'
      Origin = 'ACCS."nlaccs.DB".Name'
      Size = 30
    end
    object qLIBalance: TFloatField
      FieldName = 'Balance'
      Origin = 'ACCS."nlaccs.DB".Balance'
      currency = True
    end
  end
  object QRTextFilter1: TQRTextFilter
    Left = 88
    Top = 8
  end
  object QRCSVFilter1: TQRCSVFilter
    Separator = ','
    Left = 88
    Top = 40
  end
  object QRHTMLFilter1: TQRHTMLFilter
    Left = 88
    Top = 72
  end
  object QRExcelFilter1: TQRExcelFilter
    Left = 88
    Top = 104
  end
  object QRRTFFilter1: TQRRTFFilter
    Left = 88
    Top = 136
  end
  object QRWMFFilter1: TQRWMFFilter
    Enhanced = False
    Left = 88
    Top = 168
  end
end
