object fmCrushDiskPurch: TfmCrushDiskPurch
  Left = -4
  Top = -4
  Width = 1032
  Height = 742
  ActiveControl = ToolBar1
  Caption = 'Crush Disk Purchase '
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolButton5: TToolButton
    Left = 241
    Top = 2
    Width = 1
    Caption = #7
    ImageIndex = 2
    Style = tbsDivider
  end
  object ToolButton2: TToolButton
    Left = 316
    Top = 2
    Width = 4
    Caption = '�Z�'#6#1
    ImageIndex = 3
    Style = tbsDivider
  end
  object CrushGrid: TDBGridEh
    Left = 135
    Top = 82
    Width = 889
    Height = 549
    Align = alClient
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghClearSelection]
    ParentFont = False
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    OnDblClick = CrushGridDblClick
    OnGetCellParams = CrushGridGetCellParams
    OnTitleClick = CrushGridTitleClick
    Columns = <
      item
        EditButtons = <>
        Footers = <>
        Title.Caption = 'National ID'
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.TitleButton = True
        Width = 217
      end
      item
        EditButtons = <>
        Footers = <>
        Title.Caption = 'Animal No'
        Title.TitleButton = True
        Width = 114
      end
      item
        DisplayFormat = '#0.00 Kg'
        EditButtons = <>
        Footers = <>
        Title.Caption = 'Weight (Kg)'
        Title.TitleButton = True
        Width = 131
      end
      item
        DblClickNextVal = True
        EditButtons = <>
        Footers = <>
        Title.Caption = 'Weighing Date'
        Title.TitleButton = True
        Width = 137
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 689
    Width = 1024
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Width = 120
      end
      item
        Width = 120
      end
      item
        Width = 120
      end
      item
        Width = 120
      end>
    SimplePanel = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1024
    Height = 56
    ButtonHeight = 50
    ButtonWidth = 86
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object ToolButton3: TToolButton
      Left = 0
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsDivider
    end
    object sbExit: TRxSpeedButton
      Left = 8
      Top = 2
      Width = 65
      Height = 50
      Caption = 'E&xit'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbExitClick
    end
    object ToolButton1: TToolButton
      Left = 73
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 2
      Style = tbsDivider
    end
    object sbImport: TRxSpeedButton
      Left = 81
      Top = 2
      Width = 68
      Height = 50
      Caption = '&Read File'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbImportClick
    end
    object CfDivider: TToolButton
      Left = 149
      Top = 2
      Width = 8
      Caption = 'CfDivider'
      ImageIndex = 3
      Style = tbsDivider
    end
    object sbSave: TRxSpeedButton
      Left = 157
      Top = 2
      Width = 68
      Height = 50
      Caption = 'Save'
      Enabled = False
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      OnClick = sbSaveClick
    end
    object sbCancel: TRxSpeedButton
      Left = 225
      Top = 2
      Width = 68
      Height = 50
      Caption = 'Cancel'
      Enabled = False
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      OnClick = sbCancelClick
    end
    object ToolButton7: TToolButton
      Left = 293
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 5
      Style = tbsDivider
    end
    object sbPrint: TRxSpeedButton
      Left = 301
      Top = 2
      Width = 68
      Height = 50
      Caption = 'Print'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      OnClick = sbPrintClick
    end
    object ToolButton4: TToolButton
      Left = 369
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsDivider
    end
    object sbHelp: TRxSpeedButton
      Left = 377
      Top = 2
      Width = 68
      Height = 50
      Caption = '&Help'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbHelpClick
    end
    object ToolButton6: TToolButton
      Left = 445
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 4
      Style = tbsDivider
    end
  end
  object QuickRep1: TQuickRep
    Left = 188
    Top = -534
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Frame.Width = 2
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
    object PageHeaderBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 123
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
        325.4375
        1899.70833333333)
      BandType = rbPageHeader
      object QRLabel1: TQRLabel
        Left = 8
        Top = 1
        Width = 303
        Height = 38
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          100.541666666667
          21.1666666666667
          2.64583333333333
          801.6875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Crush Weighing System'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -32
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 24
      end
      object QRLabel2: TQRLabel
        Left = 8
        Top = 104
        Width = 125
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          275.166666666667
          330.729166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'National ID Number'
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
      object QRLabel3: TQRLabel
        Left = 160
        Top = 104
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          423.333333333333
          275.166666666667
          264.583333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Animal Number'
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
      object QRLabel4: TQRLabel
        Left = 288
        Top = 104
        Width = 75
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          762
          275.166666666667
          198.4375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Weight (Kg)'
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
        Left = 400
        Top = 104
        Width = 95
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1058.33333333333
          275.166666666667
          251.354166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Weighing Date'
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
        Left = 600
        Top = 24
        Width = 67
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1587.5
          63.5
          177.270833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDate
        Text = 'Date:'
        Transparent = False
        FontSize = 10
      end
      object QRSysData2: TQRSysData
        Left = 600
        Top = 8
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1587.5
          21.1666666666667
          211.666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Text = 'Page:'
        Transparent = False
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 8
        Top = 43
        Width = 89
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          113.770833333333
          235.479166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Group Name: '
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
      object qrGroupName: TQRLabel
        Left = 96
        Top = 43
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          254
          113.770833333333
          193.145833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lGroupName'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 8
        Top = 60
        Width = 42
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          158.75
          111.125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Filter: '
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
      object qrFilter: TQRLabel
        Left = 50
        Top = 60
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          132.291666666667
          158.75
          193.145833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lGroupName'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape1: TQRShape
        Left = 40
        Top = 88
        Width = 649
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.8125
          105.833333333333
          232.833333333333
          1717.14583333333)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel9: TQRLabel
        Left = 581
        Top = 72
        Width = 108
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1537.22916666667
          190.5
          285.75)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '* Animals not matched'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object SummaryBand1: TQRBand
      Left = 38
      Top = 181
      Width = 718
      Height = 37
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        97.8958333333333
        1899.70833333333)
      BandType = rbSummary
      object QRSysData3: TQRSysData
        Left = 16
        Top = 8
        Width = 110
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          42.3333333333333
          21.1666666666667
          291.041666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDetailCount
        Text = 'Total:'
        Transparent = False
        FontSize = 10
      end
      object QRExpr1: TQRExpr
        Left = 288
        Top = 8
        Width = 89
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          762
          21.1666666666667
          235.479166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Master = QuickRep1
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'SUM(cfWeight)'
        Mask = '#,###,###.## Kg'
        FontSize = 10
      end
    end
    object DetailBand1: TQRBand
      Left = 38
      Top = 161
      Width = 718
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = DetailBand1BeforePrint
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        52.9166666666667
        1899.70833333333)
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 8
        Top = 2
        Width = 68
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          5.29166666666667
          179.916666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'cfNatIDNum'
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText2: TQRDBText
        Left = 160
        Top = 2
        Width = 64
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          423.333333333333
          5.29166666666667
          169.333333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'cfAnimalNo'
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText3: TQRDBText
        Left = 288
        Top = 2
        Width = 48
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          762
          5.29166666666667
          127)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'cfWeight'
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText4: TQRDBText
        Left = 400
        Top = 2
        Width = 71
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1058.33333333333
          5.29166666666667
          187.854166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'cfWeighDate'
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object PageFooterBand1: TQRBand
      Left = 38
      Top = 218
      Width = 718
      Height = 28
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
        74.0833333333333
        1899.70833333333)
      BandType = rbPageFooter
      object QRLabel6: TQRLabel
        Left = 8
        Top = 4
        Width = 156
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          10.5833333333333
          412.75)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Kingswood Computing Ltd.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object VerNo: TQRLabel
        Left = 552
        Top = 4
        Width = 156
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1460.5
          10.5833333333333
          412.75)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Kingswood Computing Ltd.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 56
    Width = 1024
    Height = 26
    Align = alTop
    BevelInner = bvLowered
    Color = 13565951
    TabOrder = 4
    Visible = False
    object Label3: TLabel
      Left = 5
      Top = 5
      Width = 94
      Height = 16
      Caption = 'Group Name:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object lGroupName: TLabel
      Left = 102
      Top = 5
      Width = 193
      Height = 13
      AutoSize = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 82
    Width = 135
    Height = 549
    Align = alLeft
    TabOrder = 5
    object GroupBox2: TGroupBox
      Left = 4
      Top = 220
      Width = 127
      Height = 225
      Caption = 'Crush File Editing'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object sbEdit: TRxSpeedButton
        Left = 8
        Top = 25
        Width = 111
        Height = 45
        AllowAllUp = True
        GroupIndex = 2
        Caption = 'Edit Crush Data'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = True
        OnClick = sbEditClick
      end
      object sbViewInfo: TRxSpeedButton
        Left = 7
        Top = 86
        Width = 111
        Height = 45
        Caption = 'View Crush Record'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        OnClick = sbViewInfoClick
      end
    end
    object rgShowAnimals: TRadioGroup
      Left = 4
      Top = 4
      Width = 127
      Height = 199
      Caption = 'Show Animals'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'Not Matched'
        'Matched'
        'All ')
      ParentFont = False
      TabOrder = 1
      OnClick = rgShowAnimalsClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 631
    Width = 1024
    Height = 58
    Align = alBottom
    TabOrder = 6
    object RecordNo: TDBStatusLabel
      Left = 620
      Top = 10
      Width = 67
      Height = 13
      Style = lsRecordNo
      CalcRecCount = True
    end
    object Label4: TLabel
      Left = 572
      Top = 10
      Width = 45
      Height = 13
      Caption = 'Record:'
    end
    object Label2: TLabel
      Left = 569
      Top = 32
      Width = 312
      Height = 13
      Alignment = taCenter
      Caption = '* Animals displayed in red have not yet been matched'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object NavBar: TKwDBNavigator
      Left = 137
      Top = 6
      Width = 428
      Height = 49
      VisibleButtons = [kwnbFirst, kwnbPrior, kwnbNext, kwnbLast]
      Flat = True
      TabOrder = 0
    end
  end
  object cwfOpen: TOpenDialog
    DefaultExt = '*.dat'
    Filter = 'All Files (*.*)|*.*|Text Files (*.txt)|*.txt'
    InitialDir = 'C:\Kingswood Herd Management\PDA Import Files'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Select Crush File'
    Left = 168
    Top = 120
  end
  object LookupCrushDiskTrans: TTable
    DatabaseName = 'Kingswd'
    TableName = 'CrushDiskTrans'
    Left = 240
    Top = 152
  end
  object Parser: TSPParser
    Sepchar = ','
    CharSearch = True
    Left = 272
    Top = 120
  end
  object QRTextFilter1: TQRTextFilter
    Left = 674
    Top = 580
  end
  object QRCSVFilter1: TQRCSVFilter
    Separator = ','
    Left = 642
    Top = 586
  end
  object QRHTMLFilter1: TQRHTMLFilter
    Left = 606
    Top = 590
  end
  object QRExcelFilter1: TQRExcelFilter
    Left = 590
    Top = 584
  end
  object QRRTFFilter1: TQRRTFFilter
    Left = 540
    Top = 552
  end
  object QRWMFFilter1: TQRWMFFilter
    Enhanced = False
    Left = 584
    Top = 552
  end
end
