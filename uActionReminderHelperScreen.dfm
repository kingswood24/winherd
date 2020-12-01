object ActionReminderHelperScreen: TActionReminderHelperScreen
  Left = 299
  Top = 256
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderStyle = bsDialog
  Caption = 'ActionReminderHelperScreen'
  ClientHeight = 159
  ClientWidth = 288
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
  object Button1: TButton
    Left = 16
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Build'
    TabOrder = 0
    OnClick = Button1Click
  end
  object QuickRep1: TQuickRep
    Left = 132
    Top = 174
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
      'REPORTTITLE'
      'QRSTRINGSBAND1'
      'LOOPBANDFIRSTSERVICEWITH4DAYS'
      'LOOPBANDLREPEATSERVICEWITH4DAYS'
      'LOOPBANDNOHEATSERVICE61DAYSCALVED'
      'LOOPBANDNOHEATSERVICE42TO60DAYSCALVED'
      'LOOPBAND3MORESERVICESRECORDED'
      'LOOPBANDSMISSEDHEATUNUSUALCYCLE'
      'LOOPBANDCOWSCALVEDLESSTHANVWP'
      'LOOPBANDCONSIDERPDAFTERSERVICEXDAYS'
      'LOOPBANDCOWSNOTPREGNANT')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      #39#39
      '0'
      '0'
      '0'
      '0'
      '0'
      '0'
      '0'
      '0'
      '0')
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
    PreviewInitialState = wsNormal
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 49
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        129.645833333333
        1899.70833333333)
      BandType = rbPageHeader
      object QRLabel1: TQRLabel
        Left = 14
        Top = 10
        Width = 110
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          37.0416666666667
          26.4583333333333
          291.041666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'AgriSearch '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
    end
    object LoopBandFirstServiceWith4Days: TQRLoopBand
      Left = 38
      Top = 87
      Width = 718
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = LoopBandFirstServiceWith4DaysBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333
        1899.70833333333)
      Master = QuickRep1
      PrintCount = 0
      PrintBefore = False
      object DataLabel: TQRLabel
        Left = 12
        Top = 9
        Width = 93
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          31.75
          23.8125
          246.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Action List:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRShape1: TQRShape
        Left = 0
        Top = 36
        Width = 719
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.5833333333333
          0
          95.25
          1902.35416666667)
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object LoopBandlRepeatServiceWith4Days: TQRLoopBand
      Left = 38
      Top = 127
      Width = 718
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = LoopBandlRepeatServiceWith4DaysBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333
        1899.70833333333)
      Master = QuickRep1
      PrintCount = 0
      PrintBefore = False
    end
    object LoopBandNoHeatService61DaysCalved: TQRLoopBand
      Left = 38
      Top = 167
      Width = 718
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = LoopBandNoHeatService61DaysCalvedBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333
        1899.70833333333)
      Master = QuickRep1
      PrintCount = 0
      PrintBefore = False
    end
    object LoopBandNoHeatService42To60DaysCalved: TQRLoopBand
      Left = 38
      Top = 207
      Width = 718
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = LoopBandNoHeatService42To60DaysCalvedBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333
        1899.70833333333)
      Master = QuickRep1
      PrintCount = 0
      PrintBefore = False
    end
    object LoopBand3MoreServicesRecorded: TQRLoopBand
      Left = 38
      Top = 247
      Width = 718
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = LoopBand3MoreServicesRecordedBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333
        1899.70833333333)
      Master = QuickRep1
      PrintCount = 0
      PrintBefore = False
    end
    object LoopBandsMissedHeatUnusualCycle: TQRLoopBand
      Left = 38
      Top = 287
      Width = 718
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = LoopBandsMissedHeatUnusualCycleBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333
        1899.70833333333)
      Master = QuickRep1
      PrintCount = 0
      PrintBefore = False
    end
    object LoopBandCowsCalvedLessThanVWP: TQRLoopBand
      Left = 38
      Top = 327
      Width = 718
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = LoopBandCowsCalvedLessThanVWPBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333
        1899.70833333333)
      Master = QuickRep1
      PrintCount = 0
      PrintBefore = False
    end
    object LoopBandConsiderPDAfterServiceXDays: TQRLoopBand
      Left = 38
      Top = 367
      Width = 718
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = LoopBandConsiderPDAfterServiceXDaysBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333
        1899.70833333333)
      Master = QuickRep1
      PrintCount = 0
      PrintBefore = False
    end
    object LoopBandCowsNotPregnant: TQRLoopBand
      Left = 38
      Top = 407
      Width = 718
      Height = 40
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = LoopBandCowsNotPregnantBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333
        1899.70833333333)
      Master = QuickRep1
      PrintCount = 0
      PrintBefore = False
    end
  end
  object Parser: TSPParser
    Sepchar = ','
    CharSearch = True
    Left = 248
    Top = 4
  end
end
