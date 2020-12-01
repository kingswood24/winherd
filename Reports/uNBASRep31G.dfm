object NBASRep31G: TNBASRep31G
  Left = 304
  Top = 364
  Width = 857
  Height = 561
  VertScrollBar.Position = 613
  Caption = 'NBASRep31G'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object NBAS31G: TQuickRep
    Left = 15
    Top = -17
    Width = 816
    Height = 1056
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = NBAS31GBeforePrint
    DataSet = fmCMMSPermits.CMMSAnimals
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
    OnStartPage = NBAS31GStartPage
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Letter
    Page.Values = (
      127
      2794
      127
      2159
      127
      127
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
    ReportTitle = 'NBAS 31G'
    SnapToGrid = True
    Units = Inches
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object DetailBand1: TQRBand
      Left = 48
      Top = 532
      Width = 720
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = DetailBand1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.5625
        1905)
      BandType = rbDetail
      object lNumberCaption: TQRLabel
        Left = 6
        Top = 1
        Width = 12
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          15.875
          2.64583333333333
          31.75)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = lNumberCaptionPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText1: TQRDBText
        Left = 41
        Top = 2
        Width = 58
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          108.479166666667
          5.29166666666667
          153.458333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = fmCMMSPermits.CMMSAnimals
        DataField = 'NatIdNum'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape11: TQRShape
        Left = 566
        Top = 0
        Width = 3
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          1497.54166666667
          0
          7.9375)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape13: TQRShape
        Left = 564
        Top = -1
        Width = 2
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          1492.25
          -2.64583333333333
          5.29166666666667)
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape14: TQRShape
        Left = 25
        Top = 0
        Width = 3
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          66.1458333333333
          0
          7.9375)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape18: TQRShape
        Left = 562
        Top = 0
        Width = 1
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          1486.95833333333
          0
          2.64583333333333)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object lDateOfMovement: TQRLabel
        Left = 577
        Top = 2
        Width = 123
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1526.64583333333
          5.29166666666667
          325.4375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DateOfMovement'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand4: TQRBand
      Left = 48
      Top = 553
      Width = 720
      Height = 109
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
        288.395833333333
        1905)
      BandType = rbPageFooter
      object QRShape15: TQRShape
        Left = 2
        Top = 6
        Width = 345
        Height = 100
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          264.583333333333
          5.29166666666667
          15.875
          912.8125)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 2
        Top = 25
        Width = 344
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.64583333333333
          5.29166666666667
          66.1458333333333
          910.166666666667)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel24: TQRLabel
        Left = 8
        Top = 8
        Width = 122
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          21.1666666666667
          21.1666666666667
          322.791666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(a) Dealer Declaration'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel25: TQRLabel
        Left = 8
        Top = 28
        Width = 337
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.4375
          21.1666666666667
          74.0833333333333
          891.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          'I declare that the above listed animals departed my holding on t' +
          'he date given.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape16: TQRShape
        Left = 2
        Top = 74
        Width = 344
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.64583333333333
          5.29166666666667
          195.791666666667
          910.166666666667)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel26: TQRLabel
        Left = 8
        Top = 58
        Width = 124
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          21.1666666666667
          153.458333333333
          328.083333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DEALER SIGNATURE'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel27: TQRLabel
        Left = 8
        Top = 82
        Width = 64
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          21.1666666666667
          216.958333333333
          169.333333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SIGN HERE:-'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape6: TQRShape
        Left = 374
        Top = 6
        Width = 345
        Height = 100
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          264.583333333333
          989.541666666667
          15.875
          912.8125)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 374
        Top = 25
        Width = 344
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.64583333333333
          989.541666666667
          66.1458333333333
          910.166666666667)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel28: TQRLabel
        Left = 380
        Top = 8
        Width = 195
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1005.41666666667
          21.1666666666667
          515.9375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'New Owner'#39's / Buyer'#39's Declaration'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel29: TQRLabel
        Left = 380
        Top = 28
        Width = 337
        Height = 27
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          71.4375
          1005.41666666667
          74.0833333333333
          891.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          'I declare that the above listed animals arrived on my holding on' +
          ' the date given.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape17: TQRShape
        Left = 374
        Top = 74
        Width = 344
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.64583333333333
          989.541666666667
          195.791666666667
          910.166666666667)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel30: TQRLabel
        Left = 380
        Top = 58
        Width = 230
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1005.41666666667
          153.458333333333
          608.541666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NEW OWNER'#39'S / BUYER'#39'S SIGNATURE'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel31: TQRLabel
        Left = 380
        Top = 82
        Width = 64
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1005.41666666667
          216.958333333333
          169.333333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SIGN HERE:-'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object QRBand2: TQRBand
      Left = 48
      Top = 48
      Width = 720
      Height = 484
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
        1280.58333333333
        1905)
      BandType = rbPageHeader
      object QRLabel17: TQRLabel
        Left = 6
        Top = 115
        Width = 655
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.1875
          15.875
          304.270833333333
          1733.02083333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          '                                            This form is only to' +
          ' be used to report the onward movement of an animal from a regis' +
          'tered dealers premises.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRShape2: TQRShape
        Left = 0
        Top = 1
        Width = 718
        Height = 111
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          293.6875
          0
          2.64583333333333
          1899.70833333333)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape1: TQRShape
        Left = 3
        Top = 4
        Width = 712
        Height = 105
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          277.8125
          7.9375
          10.5833333333333
          1883.83333333333)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel4: TQRLabel
        Left = 567
        Top = 9
        Width = 85
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          1500.1875
          23.8125
          224.895833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NBAS 31 G'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 13
      end
      object QRShape3: TQRShape
        Left = 0
        Top = 264
        Width = 355
        Height = 179
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          473.604166666667
          0
          698.5
          939.270833333333)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 365
        Top = 264
        Width = 355
        Height = 179
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          473.604166666667
          965.729166666667
          698.5
          939.270833333333)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Left = 370
        Top = 270
        Width = 227
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          978.958333333333
          714.375
          600.604166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'BUYER/DESTINATION DETAILS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel12: TQRLabel
        Left = 367
        Top = 298
        Width = 76
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          87.3125
          971.020833333333
          788.458333333333
          201.083333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'HERD NUMBER'
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
      object lBuyerherdNo: TQRLabel
        Left = 448
        Top = 305
        Width = 263
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1185.33333333333
          806.979166666667
          695.854166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'lBuyerherdNo'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 367
        Top = 339
        Width = 76
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          971.020833333333
          896.9375
          201.083333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NAME'
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
      object lBuyerName: TQRLabel
        Left = 448
        Top = 339
        Width = 263
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1185.33333333333
          896.9375
          695.854166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'lBuyerName'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 367
        Top = 370
        Width = 76
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          971.020833333333
          978.958333333333
          201.083333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'ADDRESS'
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
      object lBuyerAdd1: TQRLabel
        Left = 448
        Top = 370
        Width = 263
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1185.33333333333
          978.958333333333
          695.854166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'lBuyerAdd1'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lBuyerAdd2: TQRLabel
        Left = 448
        Top = 391
        Width = 263
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1185.33333333333
          1034.52083333333
          695.854166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'lBuyerAdd2'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lBuyerTelNo: TQRLabel
        Left = 448
        Top = 418
        Width = 263
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1185.33333333333
          1105.95833333333
          695.854166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'lBuyerTelNo'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 367
        Top = 418
        Width = 76
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          971.020833333333
          1105.95833333333
          201.083333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'TELEPHONE'
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
      object lSellerHerdNoSect1: TQRLabel
        Left = 100
        Top = 303
        Width = 73
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          264.583333333333
          801.6875
          193.145833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'lSellerHerdNoSect1'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 3
        Top = 298
        Width = 90
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          87.3125
          7.9375
          788.458333333333
          238.125)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DEALER HERD NUMBER'
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
      object QRLabel5: TQRLabel
        Left = 10
        Top = 270
        Width = 128
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          26.4583333333333
          714.375
          338.666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DEALER DETAILS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel7: TQRLabel
        Left = 3
        Top = 339
        Width = 90
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          7.9375
          896.9375
          238.125)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NAME'
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
      object lSellerName: TQRLabel
        Left = 98
        Top = 339
        Width = 248
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          259.291666666667
          896.9375
          656.166666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'lSellerName'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 3
        Top = 370
        Width = 90
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          7.9375
          978.958333333333
          238.125)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'ADDRESS'
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
      object lSellerAdd1: TQRLabel
        Left = 98
        Top = 370
        Width = 248
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          259.291666666667
          978.958333333333
          656.166666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'lSellerAdd1'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lSellerAdd2: TQRLabel
        Left = 98
        Top = 391
        Width = 248
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          259.291666666667
          1034.52083333333
          656.166666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'lSellerAdd2'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lSellerTelNo: TQRLabel
        Left = 98
        Top = 418
        Width = 248
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          259.291666666667
          1105.95833333333
          656.166666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'lSellerTelNo'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 3
        Top = 418
        Width = 90
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          7.9375
          1105.95833333333
          238.125)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'TELEPHONE'
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
      object QRLabel10: TQRLabel
        Left = 162
        Top = 270
        Width = 104
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          428.625
          714.375
          275.166666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(Current Location)'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRImage11: TQRImage
        Left = 660
        Top = 15
        Width = 52
        Height = 63
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          166.6875
          1746.25
          39.6875
          137.583333333333)
        Center = True
        Picture.Data = {
          07544269746D6170560C0000424D560C00000000000036040000280000002500
          000034000000010008000000000020080000C40E0000C40E0000000100000000
          0000FFFFFF00CCFFFF0099FFFF0066FFFF0033FFFF0000FFFF00FFCCFF00CCCC
          FF0099CCFF0066CCFF0033CCFF0000CCFF00FF99FF00CC99FF009999FF006699
          FF003399FF000099FF00FF66FF00CC66FF009966FF006666FF003366FF000066
          FF00FF33FF00CC33FF009933FF006633FF003333FF000033FF00FF00FF00CC00
          FF009900FF006600FF003300FF000000FF00FFFFCC00CCFFCC0099FFCC0066FF
          CC0033FFCC0000FFCC00FFCCCC00CCCCCC0099CCCC0066CCCC0033CCCC0000CC
          CC00FF99CC00CC99CC009999CC006699CC003399CC000099CC00FF66CC00CC66
          CC009966CC006666CC003366CC000066CC00FF33CC00CC33CC009933CC006633
          CC003333CC000033CC00FF00CC00CC00CC009900CC006600CC003300CC000000
          CC00FFFF9900CCFF990099FF990066FF990033FF990000FF9900FFCC9900CCCC
          990099CC990066CC990033CC990000CC9900FF999900CC999900999999006699
          99003399990000999900FF669900CC6699009966990066669900336699000066
          9900FF339900CC33990099339900663399003333990000339900FF009900CC00
          990099009900660099003300990000009900FFFF6600CCFF660099FF660066FF
          660033FF660000FF6600FFCC6600CCCC660099CC660066CC660033CC660000CC
          6600FF996600CC99660099996600669966003399660000996600FF666600CC66
          660099666600666666003366660000666600FF336600CC336600993366006633
          66003333660000336600FF006600CC0066009900660066006600330066000000
          6600FFFF3300CCFF330099FF330066FF330033FF330000FF3300FFCC3300CCCC
          330099CC330066CC330033CC330000CC3300FF993300CC993300999933006699
          33003399330000993300FF663300CC6633009966330066663300336633000066
          3300FF333300CC33330099333300663333003333330000333300FF003300CC00
          330099003300660033003300330000003300FFFF0000CCFF000099FF000066FF
          000033FF000000FF0000FFCC0000CCCC000099CC000066CC000033CC000000CC
          0000FF990000CC99000099990000669900003399000000990000FF660000CC66
          000099660000666600003366000000660000FF330000CC330000993300006633
          00003333000000330000FF000000CC0000009900000066000000330000000000
          EE000000DD000000BB000000AA00000088000000770000005500000044000000
          22000000110000EE000000DD000000BB000000AA000000880000007700000055
          0000004400000022000000110000EE000000DD000000BB000000AA0000008800
          00007700000055000000440000002200000011000000EEEEEE00DDDDDD00BBBB
          BB00AAAAAA008888880077777700555555004444440022222200111111000000
          00000000000000000000000000F5F50000000000000000000000000000000000
          000000000000000000000000000000000000F62BF7F8F8F8F7F6000000000000
          00000000000000000000000000000000000000000000000000F65656F9F8F7F8
          F856F82BF50000F5F5F500000000000000000000000000000000000000000000
          002B56F85656F7F7F7F7F7F9562B2BF756F70000000000000000000000000000
          000000000000000000F55656F8F8F8F7F7F7F8F9FAF9F856F956F60000000000
          000000000000000000000000000000000000F8F8F7F7F8F8F7F8F95656F9F9FA
          56562B00000000000000000000000000000000000000000000F656F7F7F7F8F8
          F7F956F75656F9FAF9F8F8F50000000000000000000000000000000000000000
          F5F8F8F7F7F7F756F956F7F7F85656F9F956F9F6000000000000000000000000
          00000000000000002B562BF7F7F7F756FAF7F7F7F75656F9F956F9F800000000
          000000000000000000000000000000F556F7F7F7F7F7F8F9F9F8F7F7F7F8F9F9
          F8565656F60000000000000000000000000000000000002BF8F85656F7F75656
          5656F7F7F7F7F9F95656F9562B0000000000000000000000000000000000F5F8
          F8565656F8F8FAF8F8F956F7F7F756F9F9F9F9F9F8F500000000000000000000
          0000000000002B56F856F856F8F8F7F856F956F7F7F7F756F9F95656562B0000
          00000000000000000000000000F5F956F7565656F8F8002BF9F95656F8F7F756
          5656F9F9F9F7000000000000000000000000000000F556F9F8F7F8F7562B00F5
          F8F956F9F8F7F7F7F9565656F956F60000000000000000000000000000F5F856
          56F7F7F7F8F50000F6FA565656F7F7F756F9565656562B000000000000000000
          0000000000F6F8F856F8F7F8F70000002BF856F95656F7F7F756F9F9F956F8F5
          00000000000000000000000000F6F8F856F7F7F82B000000F6F756FA5656F8F7
          F75656F9F9F9F9F6000000000000000000000000002BF95656F7F7F8F5000000
          2B2BF7F8F9F9F9F7F7F85656FAF956F700000000000000000000000000F781FA
          56F7F8F8F50000002BF72B2BF9F95656F7F75656F9F95656F600000000000000
          0000000000F7FBFA56F7F8F7F5000000F6F7F72BF7F9F9F9F8F7F856F9F9F956
          2B000000000000000000000000F781FA56F7F8F7000000002BF7F72B2BF9FA56
          56F8F75656F9F9F8F8F50000000000000000000000F881FA56F7F82BF5000000
          F6F72B2B2BF856FA56F8F7F7F9F8F8F9F9F60000000000000000000000F7FBFA
          56F7562B000000002B2BF72B2BF7F856F956F8F756F956F9F9F7F50000000000
          0000000000F781FA56F7F82B000000002BF7F72B2BF7F7F7FAF956F7F8F9F956
          F956F5000000000000000000002BF9F956F7F8F7F5000000F6F7F72B2BF7F8F7
          F8F9F9F8F756F95656F92B00000000000000000000F6F9F956F8F7F800000000
          F6F7F72B2BF7F72B2BF9F9F9F7F8FAF956F9F800000000000000000000F656F9
          56F8F8F8F5000000F6F7F72B2BF8F7F7F7F756FAF8F856F9F9F956F600000000
          000000000000F8F956F8F8F8F50000002BF7F72BF7F7F7F72BF7F7F9F9F8F856
          F956F8F700000000000000000000F7FAF956F7562B000000F6F7F72B2BF7F72B
          2B2BF7F8FA56F856F8565656F5000000000000000000F6F956F9F8F8F8F50000
          F6F7F72B2BF8F7F72BF7F7F856F956F856F9F9F92B000000000000000000F5F9
          FAFAF8F756F60000F6F7F72B2BF7F72BF72BF7F7F7F9FAF856F9F9FAF8F50000
          000000000000F5F8818156F7F8F700002BF7F72B2BF8F7F72BF7F72BF7F7F9F9
          F8F9FAFAF9F6000000000000000000F6FAFAFAF8F756F600F6F7F72B2BF7F7F7
          F7F7F7F8F82BF8F9F856FAFAF9F500000000000000000000F88181F9F7F8F700
          F6F7F72B2BF7F72BF72BF72BF8F7F85656565656F92B00000000000000000000
          F6FA81F9F8F7562BF6F7F72BF7F7F8F72B2BF82BF7F7F8F7F65656F85656F500
          0000000000000000002BF95656F8F8F8F7F72B2B2BF7F7F7F8F8F856F8F7F8F7
          00F5F95656F9F600000000000000000000F5F8F856F8F7F856F72B2BF7F8F956
          56F9F9F9FAF9F9562B2B56F856F9F70000000000000000000000F656F9F8F7F8
          F956F8F7F9F9F9F9F9F9F9F9F9F9F9FA56F8F7F7F8F9F8000000000000000000
          0000F556F9F856F956FAF9F956F9F9565656F9F9F9F9F9F9F8F7F7F8F9F8F800
          00000000000000000000002B565656F856F9F9F95656F95656F956F9F9F9F9F9
          56F7F85656F9F800000000000000000000000000F556F9F8F9F9F956565656F9
          F9F7F856FAF9F9F9F9F8F85656F8F50000000000000000000000000000F556F9
          F9565656565656F956F85656F9F8F8565656F8F72BF500000000000000000000
          0000000000F5F8F8F8F956F9F9F8F7F8FAF956F8F8562BF6F5F5F50000000000
          000000000000000000000000F656F82BF85656F9F9F8F856565656F72BF50000
          00000000000000000000000000000000000000002BFAF7F7F85656F8F8F9F9F8
          F8562BF50000000000000000000000000000000000000000000000002BF9F8F8
          F9F9F7F756FAF856F8F500000000000000000000000000000000000000000000
          00000000F5F8F9F95656565656F856F8F5000000000000000000000000000000
          00000000000000000000000000F52BF856F8F956F856F7000000000000000000
          00000000000000000000000000000000000000000000002BFAF8F8F8562B0000
          0000000000000000000000000000000000000000000000000000000000000000
          F7F956562B000000000000000000000000000000000000000000000000000000
          000000000000000000F6562B0000000000000000000000000000000000000000
          0000}
      end
      object QRLabel1: TQRLabel
        Left = 7
        Top = 9
        Width = 337
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.0833333333333
          18.5208333333333
          23.8125
          891.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Department Of Agriculture and Food.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object QRLabel2: TQRLabel
        Left = 8
        Top = 76
        Width = 269
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.0208333333333
          21.1666666666667
          201.083333333333
          711.729166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          'Form for reporting the move-on of animals from a Registered Deal' +
          'ers premises.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 7
        Top = 113
        Width = 162
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          18.5208333333333
          298.979166666667
          428.625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'When to use this form: -'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel16: TQRLabel
        Left = 7
        Top = 151
        Width = 316
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          18.5208333333333
          399.520833333333
          836.083333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Conditions attached to the use of this form: -'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel18: TQRLabel
        Left = 22
        Top = 172
        Width = 621
        Height = 52
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          137.583333333333
          58.2083333333333
          455.083333333333
          1643.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          '1    If the animal moved into the dealers herd on a CMMS Complia' +
          'nce Certificate then it must move onward                        ' +
          '                                            '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel19: TQRLabel
        Left = 70
        Top = 188
        Width = 255
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.2083333333333
          185.208333333333
          497.416666666667
          674.6875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'within the validity period of the permit,'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel20: TQRLabel
        Left = 22
        Top = 228
        Width = 596
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          89.9583333333333
          58.2083333333333
          603.25
          1576.91666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          '2    If the animal was purchased at a Mart it can be moved onwar' +
          'd once, to another herd, using this form.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRShape5: TQRShape
        Left = 0
        Top = 447
        Width = 720
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          0
          1182.6875
          1905)
        Brush.Color = 14802911
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel21: TQRLabel
        Left = 8
        Top = 449
        Width = 124
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          1187.97916666667
          328.083333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Calf Movement Details'
        Color = 14802911
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape9: TQRShape
        Left = 0
        Top = 466
        Width = 720
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          0
          1232.95833333333
          1905)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel22: TQRLabel
        Left = 8
        Top = 468
        Width = 83
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          21.1666666666667
          1238.25
          219.604166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TAG NUMBER'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel23: TQRLabel
        Left = 582
        Top = 468
        Width = 101
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1539.875
          1238.25
          267.229166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date of Movement'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape10: TQRShape
        Left = 566
        Top = 448
        Width = 3
        Height = 38
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          100.541666666667
          1497.54166666667
          1185.33333333333
          7.9375)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape12: TQRShape
        Left = 564
        Top = 448
        Width = 2
        Height = 38
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          100.541666666667
          1492.25
          1185.33333333333
          5.29166666666667)
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape19: TQRShape
        Left = 562
        Top = 448
        Width = 1
        Height = 38
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          100.541666666667
          1486.95833333333
          1185.33333333333
          2.64583333333333)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QrEan: TQrEan
        Left = 184
        Top = 34
        Width = 323
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          89.9583333333333
          486.833333333333
          89.9583333333333
          854.604166666667)
        BackgroundColor = clWhite
        Transparent = False
        ShowLabels = True
        StartStopLines = True
        TypBarCode = bcCode39Standard
        LinesColor = clBlack
        Ean13AddUp = True
        FontAutoSize = False
        Security = False
        DemoVersion = False
        BarCode = '160241'
        Angle = 0
        AutoSize = False
        DisableEditor = False
        OnBeforePrint = QrEanBeforePrint
      end
      object QRLabel32: TQRLabel
        Left = 328
        Top = 189
        Width = 298
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625
          867.833333333334
          500.0625
          788.458333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'otherwise a new CMMS Compliance Certificate is'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel33: TQRLabel
        Left = 22
        Top = 206
        Width = 57
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625
          58.2083333333333
          545.041666666667
          150.8125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = ' required.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object lSellerHerdNoSect2: TQRLabel
        Left = 174
        Top = 303
        Width = 15
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          460.375
          801.6875
          39.6875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '85'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lSellerHerdNoSect3: TQRLabel
        Left = 190
        Top = 303
        Width = 73
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          502.708333333333
          801.6875
          193.145833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'lSellerHerdNo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
end
