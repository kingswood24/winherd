object NBASRep31B: TNBASRep31B
  Left = 146
  Top = -3
  Width = 882
  Height = 711
  Caption = 'NBASRep31B'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object NBAS31B: TQuickRep
    Left = 20
    Top = -208
    Width = 816
    Height = 1056
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
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
    OnStartPage = NBAS31BStartPage
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
    ReportTitle = 'NBAS 31B'
    SnapToGrid = True
    Units = Inches
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object DetailBand1: TQRBand
      Left = 48
      Top = 505
      Width = 720
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = DetailBand1AfterPrint
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.1458333333333
        1905)
      BandType = rbDetail
      object QRLabel30: TQRLabel
        Left = 68
        Top = 5
        Width = 12
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          179.916666666667
          13.2291666666667
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
        Font.Style = [fsBold]
        OnPrint = QRLabel30Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText1: TQRDBText
        Left = 92
        Top = 5
        Width = 58
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          243.416666666667
          13.2291666666667
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
    end
    object QRBand4: TQRBand
      Left = 48
      Top = 530
      Width = 720
      Height = 255
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
        674.6875
        1905)
      BandType = rbPageFooter
      object QRShape15: TQRShape
        Left = 2
        Top = 12
        Width = 716
        Height = 108
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          285.75
          5.29166666666667
          31.75
          1894.41666666667)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape17: TQRShape
        Left = 447
        Top = 92
        Width = 271
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.0833333333333
          1182.6875
          243.416666666667
          717.020833333333)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel42: TQRLabel
        Left = 456
        Top = 98
        Width = 30
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1206.5
          259.291666666667
          79.375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date'
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
      object QRLabel40: TQRLabel
        Left = 12
        Top = 20
        Width = 217
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          31.75
          52.9166666666667
          574.145833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SELLER'#39'S/SOURCE DECLARATION'
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
      object QRMemo1: TQRMemo
        Left = 12
        Top = 36
        Width = 673
        Height = 50
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          132.291666666667
          31.75
          95.25
          1780.64583333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          
            'I undertake (i) to move the cattle directly from the holdng spec' +
            'ified above, (ii) only to move cattle listed above, (iii) to'
          
            'ensure that all animals moved will comply with all animal health' +
            '/movement regulations, (iv) not to move any cattle that show'
          'any visible signs of disease or ill health.')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape16: TQRShape
        Left = 2
        Top = 92
        Width = 381
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.0833333333333
          5.29166666666667
          243.416666666667
          1008.0625)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel41: TQRLabel
        Left = 7
        Top = 98
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          18.5208333333333
          259.291666666667
          121.708333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Signed'
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
      object QRSysData1: TQRSysData
        Left = 492
        Top = 98
        Width = 36
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1301.75
          259.291666666667
          95.25)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDate
        Transparent = False
        FontSize = 10
      end
      object QRLabel43: TQRLabel
        Left = 4
        Top = 137
        Width = 201
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          10.5833333333333
          362.479166666667
          531.8125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Instructions for completion of form.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel44: TQRLabel
        Left = 4
        Top = 152
        Width = 223
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          10.5833333333333
          402.166666666667
          590.020833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '1.  Completed form should be posted to'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel47: TQRLabel
        Left = 6
        Top = 185
        Width = 265
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          15.875
          489.479166666667
          701.145833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '2.  CMMS clearance certificate will be valid for'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel48: TQRLabel
        Left = 277
        Top = 185
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          732.895833333333
          489.479166666667
          121.708333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '30 days'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel49: TQRLabel
        Left = 328
        Top = 185
        Width = 107
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          867.833333333334
          489.479166666667
          283.104166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'from date of issue.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel50: TQRLabel
        Left = 6
        Top = 228
        Width = 563
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          15.875
          603.25
          1489.60416666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          'Tick this box only if you require a separate permit for each of ' +
          'the individual animals listed above'
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
      object QRShape18: TQRShape
        Left = 576
        Top = 214
        Width = 53
        Height = 29
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          76.7291666666667
          1524
          566.208333333333
          140.229166666667)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel35: TQRLabel
        Left = 232
        Top = 152
        Width = 387
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          613.833333333333
          402.166666666667
          1023.9375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          'Cattle Movement Notification Agency, Freepost Clonakilty, Co. Co' +
          'rk'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel37: TQRLabel
        Left = 6
        Top = 167
        Width = 692
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          15.875
          441.854166666667
          1830.91666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          'faxed to 023 8832891. CMMS clearance cert will issue on date of ' +
          'receipt of application form or if fax recieved before 3 pm.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object QRBand2: TQRBand
      Left = 48
      Top = 48
      Width = 720
      Height = 457
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
        1209.14583333333
        1905)
      BandType = rbPageHeader
      object QRLabel3: TQRLabel
        Left = 2
        Top = 105
        Width = 512
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          5.29166666666667
          277.8125
          1354.66666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          'COMPLETE THIS FORM AND FORWARD TO THE PERMIT AGENCY IN FREEPOST ' +
          'ENVELOPE PROVIDED.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel4: TQRLabel
        Left = 613
        Top = 107
        Width = 83
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          1621.89583333333
          283.104166666667
          219.604166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NBAS 31 B'
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
        Left = 1
        Top = 241
        Width = 359
        Height = 179
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          473.604166666667
          2.64583333333333
          637.645833333333
          949.854166666667)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 363
        Top = 241
        Width = 355
        Height = 179
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          473.604166666667
          960.4375
          637.645833333333
          939.270833333333)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Left = 370
        Top = 245
        Width = 183
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          978.958333333333
          648.229166666667
          484.1875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DESTINATION DETAILS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel12: TQRLabel
        Left = 377
        Top = 273
        Width = 79
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          87.3125
          997.479166666667
          722.3125
          209.020833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'HERD NUMBER'
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
      object lBuyerherdNo: TQRLabel
        Left = 465
        Top = 280
        Width = 250
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1230.3125
          740.833333333333
          661.458333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'lBuyerherdNo'
        Color = clWhite
        OnPrint = lSellerHerdNoPrint
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 377
        Top = 314
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          997.479166666667
          830.791666666667
          209.020833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NAME'
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
      object lBuyerName: TQRLabel
        Left = 465
        Top = 314
        Width = 250
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1230.3125
          830.791666666667
          661.458333333333)
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
        Left = 377
        Top = 345
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          997.479166666667
          912.8125
          209.020833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'ADDRESS'
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
      object lBuyerAdd1: TQRLabel
        Left = 465
        Top = 345
        Width = 250
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1230.3125
          912.8125
          661.458333333333)
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
        Left = 465
        Top = 366
        Width = 250
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1230.3125
          968.375
          661.458333333333)
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
        Left = 465
        Top = 393
        Width = 250
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1230.3125
          1039.8125
          661.458333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'lBuyerTelNo'
        Color = clWhite
        OnPrint = lBuyerTelNoPrint
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 377
        Top = 393
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          997.479166666667
          1039.8125
          209.020833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'TELEPHONE'
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
      object lSellerHerdNo: TQRLabel
        Left = 105
        Top = 280
        Width = 250
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          277.8125
          740.833333333333
          661.458333333333)
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
        OnPrint = lSellerHerdNoPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 19
        Top = 273
        Width = 79
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          87.3125
          50.2708333333333
          722.3125
          209.020833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'HERD NUMBER'
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
      object QRLabel5: TQRLabel
        Left = 10
        Top = 245
        Width = 144
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          26.4583333333333
          648.229166666667
          381)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SOURCE DETAILS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel7: TQRLabel
        Left = 19
        Top = 314
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          50.2708333333333
          830.791666666667
          209.020833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NAME'
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
      object lSellerName: TQRLabel
        Left = 105
        Top = 314
        Width = 250
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          277.8125
          830.791666666667
          661.458333333333)
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
        Left = 19
        Top = 345
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          50.2708333333333
          912.8125
          209.020833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'ADDRESS'
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
      object lSellerAdd1: TQRLabel
        Left = 105
        Top = 345
        Width = 250
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          277.8125
          912.8125
          661.458333333333)
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
        Left = 105
        Top = 366
        Width = 250
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          277.8125
          968.375
          661.458333333333)
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
        Left = 105
        Top = 393
        Width = 250
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          277.8125
          1039.8125
          661.458333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'lSellerTelNo'
        Color = clWhite
        OnPrint = lBuyerTelNoPrint
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 19
        Top = 393
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          50.2708333333333
          1039.8125
          209.020833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'TELEPHONE'
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
      object QRLabel10: TQRLabel
        Left = 162
        Top = 245
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
          648.229166666667
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
      object QRShape5: TQRShape
        Left = -2
        Top = 129
        Width = 720
        Height = 111
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          293.6875
          -5.29166666666667
          341.3125
          1905)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 1
        Top = 132
        Width = 713
        Height = 104
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          275.166666666667
          2.64583333333333
          349.25
          1886.47916666667)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel16: TQRLabel
        Left = 8
        Top = 137
        Width = 17
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          362.479166666667
          44.9791666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Do'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel17: TQRLabel
        Left = 26
        Top = 137
        Width = 28
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          68.7916666666667
          362.479166666667
          74.0833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NOT'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel18: TQRLabel
        Left = 58
        Top = 137
        Width = 598
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          153.458333333333
          362.479166666667
          1582.20833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          'use this form if you are selling the animals. Do use this form i' +
          'f you are moving the cattle to another location for'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel19: TQRLabel
        Left = 6
        Top = 157
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          15.875
          415.395833333333
          119.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'feeding.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel20: TQRLabel
        Left = 6
        Top = 173
        Width = 684
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          15.875
          457.729166666667
          1809.75)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          'therefore use this form where the ownership of the animal(s) dos' +
          'en'#39't change- just the location. E.g. a move for further feeding.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel21: TQRLabel
        Left = 30
        Top = 197
        Width = 182
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          79.375
          521.229166666667
          481.541666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tick this box if proposed movement is'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel22: TQRLabel
        Left = 218
        Top = 197
        Width = 16
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          576.791666666667
          521.229166666667
          42.3333333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel23: TQRLabel
        Left = 238
        Top = 197
        Width = 47
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          629.708333333333
          521.229166666667
          124.354166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'a another'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel24: TQRLabel
        Left = 154
        Top = 217
        Width = 130
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          407.458333333333
          574.145833333333
          343.958333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'holding for further feeding.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape7: TQRShape
        Left = 290
        Top = 193
        Width = 37
        Height = 38
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          100.541666666667
          767.291666666667
          510.645833333333
          97.8958333333333)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel25: TQRLabel
        Left = 350
        Top = 197
        Width = 182
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          926.041666666667
          521.229166666667
          481.541666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tick this box if proposed movement is'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel26: TQRLabel
        Left = 538
        Top = 197
        Width = 32
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1423.45833333333
          521.229166666667
          84.6666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'FROM'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel27: TQRLabel
        Left = 574
        Top = 197
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1518.70833333333
          521.229166666667
          209.020833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'a holding where'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel28: TQRLabel
        Left = 394
        Top = 217
        Width = 258
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1042.45833333333
          574.145833333333
          682.625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'feeding has taken place- back to the holding of origin.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape8: TQRShape
        Left = 658
        Top = 193
        Width = 37
        Height = 38
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          100.541666666667
          1740.95833333333
          510.645833333333
          97.8958333333333)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel29: TQRLabel
        Left = 8
        Top = 425
        Width = 477
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          21.1666666666667
          1124.47916666667
          1262.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ENTER THE EARTAG NUMBER OF EACH ANIMAL IN THE SPACES PROVIDED'
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
      object QRShape2: TQRShape
        Left = 0
        Top = 1
        Width = 718
        Height = 90
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          238.125
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
        Height = 86
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          227.541666666667
          7.9375
          10.5833333333333
          1883.83333333333)
        Shape = qrsRectangle
        VertAdjust = 0
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
        Width = 391
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
          1034.52083333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Department Of Agriculture and Food.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 18
      end
      object QRLabel2: TQRLabel
        Left = 8
        Top = 48
        Width = 617
        Height = 36
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          95.25
          21.1666666666667
          127
          1632.47916666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          'Application form for CMMS compliance certificate for the movemen' +
          't of cattle from a single holding to/from another holding for fe' +
          'eding purposes.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
    end
  end
end
