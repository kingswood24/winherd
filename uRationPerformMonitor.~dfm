inherited RationPerformMonitor: TRationPerformMonitor
  Left = 255
  Top = 231
  Caption = 'Milk / Feed Performance'
  ClientHeight = 245
  ClientWidth = 545
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  inherited ToolBar1: TToolBar
    Width = 545
    inherited sbView: TRxSpeedButton
      Font.Color = 1979867
      Font.Style = [fsBold]
      ParentFont = False
      OnMouseLeave = sbViewMouseLeave
    end
    inherited sbPrint: TRxSpeedButton
      OnClick = sbViewClick
    end
    inherited pHerdID: TPanel
      inherited cbHerdIdentity: TRxDBLookupCombo
        DisplayEmpty = '<All Herds>'
      end
    end
  end
  inherited GroupBox1: TGroupBox
    Width = 481
    Height = 153
    Caption = ''
    inherited lWaitCaption: TLabel
      Top = 84
    end
    inherited rgSortBy: TRadioGroup
      Left = 10
      Top = 106
      Width = 23
      Height = 15
      Visible = False
    end
    inherited ProgBar: TProgressBar
      Left = 48
      Top = 104
      Max = 170
    end
    inherited cbDichromatic: TCheckBox [8]
      Left = 376
    end
    inherited cbUseFilter: TCheckBox [9]
      Left = 272
      Width = 201
    end
  end
  inherited BaseReport: TQuickRep
    Left = 684
    Top = 74
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Values = (
      100
      2970
      100
      2100
      100
      100
      0)
    inherited PageHeaderBand: TQRBand
      Height = 79
      Size.Values = (
        209.020833333333
        1899.70833333333)
      inherited ReportTitle: TQRLabel
        Width = 293
        Size.Values = (
          92.6041666666667
          21.1666666666667
          21.1666666666667
          775.229166666667)
        Caption = 'Milk / Feed Performance'
        FontSize = 22
      end
      inherited DateTimeLabel: TQRSysData
        Size.Values = (
          44.9791666666667
          1518.70833333333
          21.1666666666667
          346.604166666667)
        FontSize = 10
      end
      inherited PageNumLabel: TQRSysData
        Size.Values = (
          44.9791666666667
          1653.64583333333
          71.4375
          211.666666666667)
        FontSize = 10
      end
      inherited qrlSortBy: TQRLabel
        Left = 443
        Top = 27
        Enabled = False
        Size.Values = (
          44.9791666666667
          1172.10416666667
          71.4375
          145.520833333333)
        FontSize = 10
      end
      inherited qrlSortOrder: TQRLabel
        Left = 443
        Top = 45
        Enabled = False
        Size.Values = (
          44.9791666666667
          1172.10416666667
          119.0625
          187.854166666667)
        FontSize = 10
      end
      inherited QRLabel32: TQRLabel
        Left = 387
        Top = 27
        Enabled = False
        Size.Values = (
          44.9791666666667
          1023.9375
          71.4375
          134.9375)
        FontSize = 10
      end
      inherited QRLabel34: TQRLabel
        Left = 367
        Top = 45
        Enabled = False
        Size.Values = (
          44.9791666666667
          971.020833333333
          119.0625
          187.854166666667)
        FontSize = 10
      end
      inherited QRLabel19: TQRLabel
        Left = 352
        Top = 8
        Size.Values = (
          44.9791666666667
          931.333333333333
          21.1666666666667
          227.541666666667)
        FontSize = 10
      end
      inherited qrlHerdIdentity: TQRLabel
        Left = 444
        Top = 8
        Size.Values = (
          44.9791666666667
          1174.75
          21.1666666666667
          142.875)
        FontSize = 10
      end
    end
    inherited SubDetailBand: TQRSubDetail
      Top = 117
      Height = 24
      Enabled = False
      Size.Values = (
        63.5
        1899.70833333333)
    end
    inherited SummaryBand: TQRBand
      Top = 141
      Height = 784
      Size.Values = (
        2074.33333333333
        1899.70833333333)
      inherited CountExpression: TQRExpr
        Left = 52
        Top = 8
        Enabled = False
        Size.Values = (
          44.9791666666667
          137.583333333333
          21.1666666666667
          124.354166666667)
        FontSize = 10
      end
      inherited TotalLabel: TQRLabel
        Left = 8
        Top = 8
        Enabled = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          21.1666666666667
          108.479166666667)
        FontSize = 10
      end
      object lAvgDailyYieldCpt: TQRLabel
        Left = 50
        Top = 125
        Width = 164
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          132.291666666667
          330.729166666667
          433.916666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Avg. Daily Yield'
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
      object lAvgDailyProteinCpt: TQRLabel
        Left = 50
        Top = 189
        Width = 164
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          132.291666666667
          500.0625
          433.916666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Avg. Daily Protein'
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
      object lTotalCowsCpt: TQRLabel
        Left = 50
        Top = 88
        Width = 164
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          132.291666666667
          232.833333333333
          433.916666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Total Cows'
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
      object lTotalCows: TQRLabel
        Left = 255
        Top = 88
        Width = 8
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          674.6875
          232.833333333333
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAvgDailyYield: TQRLabel
        Left = 255
        Top = 125
        Width = 8
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          674.6875
          330.729166666667
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = lAvgDailyYieldPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAvgDailyProtein: TQRLabel
        Left = 255
        Top = 189
        Width = 8
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          674.6875
          500.0625
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = lAvgDailyBFatPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAvgDailyBFatCpt: TQRLabel
        Left = 50
        Top = 157
        Width = 164
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          132.291666666667
          415.395833333333
          433.916666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Avg. Daily Butterfat'
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
      object lAvgDailyBFat: TQRLabel
        Left = 255
        Top = 157
        Width = 8
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          674.6875
          415.395833333333
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = lAvgDailyBFatPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAvgCumYieldCpt: TQRLabel
        Left = 50
        Top = 241
        Width = 164
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          132.291666666667
          637.645833333333
          433.916666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Avg. Cum. Yield'
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
      object lCumProtPercCpt: TQRLabel
        Left = 50
        Top = 305
        Width = 164
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          132.291666666667
          806.979166666667
          433.916666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Avg. Cum. Protein'
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
      object lAvgCumYield: TQRLabel
        Left = 255
        Top = 241
        Width = 8
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          674.6875
          637.645833333333
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = lAvgDailyYieldPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAvgCumProtPerc: TQRLabel
        Left = 255
        Top = 305
        Width = 8
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          674.6875
          806.979166666667
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = lAvgDailyBFatPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAvgCumBfatPercCpt: TQRLabel
        Left = 50
        Top = 273
        Width = 164
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          132.291666666667
          722.3125
          433.916666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Avg. Cum. Butterfat'
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
      object lAvgCumBfatPerc: TQRLabel
        Left = 255
        Top = 273
        Width = 8
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          674.6875
          722.3125
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = lAvgDailyBFatPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lPregRateToFirstServiceCpt: TQRLabel
        Left = 50
        Top = 365
        Width = 239
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          132.291666666667
          965.729166666667
          632.354166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '(%) Pregnancy rate to first'
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
      object lPregRateToFirstService: TQRLabel
        Left = 304
        Top = 365
        Width = 8
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          804.333333333333
          965.729166666667
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = lAvgDailyBFatPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 50
        Top = 381
        Width = 239
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          132.291666666667
          1008.0625
          632.354166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'service (in last year)'
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
      object lCowsCulledForInfertCpt: TQRLabel
        Left = 50
        Top = 413
        Width = 215
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          132.291666666667
          1092.72916666667
          568.854166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Cows Culled for Infertility'
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
      object lCowsCulledForInfert: TQRLabel
        Left = 304
        Top = 413
        Width = 8
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          804.333333333333
          1092.72916666667
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = lAvgDailyBFatPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lTotalCowsCulledCpt: TQRLabel
        Left = 50
        Top = 445
        Width = 127
        Height = 36
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          95.25
          132.291666666667
          1177.39583333333
          336.020833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Total Cows Culled (in last year)'
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
      object lTotalCowsCulled: TQRLabel
        Left = 304
        Top = 445
        Width = 8
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          804.333333333333
          1177.39583333333
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = lAvgDailyBFatPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lHomeGrownFeedPercCpt: TQRLabel
        Left = 50
        Top = 502
        Width = 215
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          132.291666666667
          1328.20833333333
          568.854166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Farm Grown Feeds in Ration (%)'
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
      object lHomeGrownFeedPerc: TQRLabel
        Left = 304
        Top = 502
        Width = 8
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          804.333333333333
          1328.20833333333
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = lAvgDailyBFatPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lCowsInMilkCpt: TQRLabel
        Left = 50
        Top = 534
        Width = 207
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          132.291666666667
          1412.875
          547.6875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Cows In Milk'
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
      object lCowsInMilk: TQRLabel
        Left = 304
        Top = 534
        Width = 8
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          804.333333333333
          1412.875
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAvgLactDaysCpt: TQRLabel
        Left = 50
        Top = 566
        Width = 207
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          132.291666666667
          1497.54166666667
          547.6875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Stage of Lactation (days)'
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
      object lAvgLactDays: TQRLabel
        Left = 304
        Top = 566
        Width = 8
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          804.333333333333
          1497.54166666667
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lAvgFeedCostPerTonneCpt: TQRLabel
        Left = 50
        Top = 606
        Width = 215
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          132.291666666667
          1603.375
          568.854166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Concentrate Cost Per Tonne'
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
      object lAvgFeedCostPerTonne: TQRLabel
        Left = 338
        Top = 606
        Width = 8
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          894.291666666667
          1603.375
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = lAvgFeedCostPerTonnePrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lTotalFeedCostPerKgCpt: TQRLabel
        Left = 50
        Top = 638
        Width = 191
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          132.291666666667
          1688.04166666667
          505.354166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Total Feed Cost Per Kg.'
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
      object lTotalFeedCostPerKg: TQRLabel
        Left = 338
        Top = 638
        Width = 8
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          894.291666666667
          1688.04166666667
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = lAvgFeedCostPerTonnePrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lConcentrateFedPerLactCpt: TQRLabel
        Left = 50
        Top = 670
        Width = 279
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          132.291666666667
          1772.70833333333
          738.1875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Concentrate Fed Per Lactation (Tonne)'
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
      object lConcentrateFedPerLact: TQRLabel
        Left = 338
        Top = 670
        Width = 8
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          894.291666666667
          1772.70833333333
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = lConcentrateFedPerLactPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lConcentrateFedAnimalDayCpt: TQRLabel
        Left = 50
        Top = 702
        Width = 239
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          132.291666666667
          1857.375
          632.354166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Concentrate Fed/Animal/Day (Kg)'
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
      object lConcentrateFedAnimalDay: TQRLabel
        Left = 338
        Top = 702
        Width = 8
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          894.291666666667
          1857.375
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = lAvgDailyYieldPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lConcentrateFedDryCowCpt: TQRLabel
        Left = 50
        Top = 734
        Width = 255
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          132.291666666667
          1942.04166666667
          674.6875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Concentrate Fed/Dry Cow/Day (Kg)'
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
      object lConcentrateFedDryCow: TQRLabel
        Left = 338
        Top = 734
        Width = 8
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          894.291666666667
          1942.04166666667
          21.1666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = lAvgDailyYieldPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    inherited PageFooterBand: TQRBand
      Top = 925
      Size.Values = (
        76.7291666666667
        1899.70833333333)
      inherited CompanyNameLabel: TQRLabel
        Size.Values = (
          44.9791666666667
          21.1666666666667
          21.1666666666667
          463.020833333333)
        FontSize = 10
      end
      inherited ProgramVersionLabel: TQRLabel
        Size.Values = (
          44.9791666666667
          1365.25
          21.1666666666667
          513.291666666667)
        FontSize = 10
      end
    end
  end
  object cbFavourite: TcxCheckBox [3]
    Left = 31
    Top = 55
    AutoSize = False
    Caption = 'Add Report As Favourite'
    Properties.OnChange = cbFavouritePropertiesChange
    TabOrder = 3
    Height = 23
    Width = 213
  end
end
