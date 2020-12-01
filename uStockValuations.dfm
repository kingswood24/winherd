inherited fmStockValuationReport: TfmStockValuationReport
  Left = 393
  Top = 142
  Caption = 'Livestock Valuation Report'
  ClientHeight = 542
  ClientWidth = 583
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited ToolBar1: TToolBar
    Width = 583
    inherited sbView: TRxSpeedButton
      Font.Color = 1979867
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited sbHelp: TRxSpeedButton
      Width = 8
      Enabled = False
      Visible = False
      OnClick = nil
    end
    inherited ToolButton5: TToolButton
      Left = 262
      Style = tbsSeparator
    end
    inherited pHerdID: TPanel
      Left = 270
      Width = 288
      inherited Label7: TLabel
        Left = 153
        Top = 0
      end
      object btnSummary: TRxSpeedButton [1]
        Left = 2
        Top = 0
        Width = 80
        Height = 45
        Caption = 'Summary'
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000430B0000430B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFC9762BA24F22A24F22A24F22A24F22A24F22A2
          4F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22FF00FFC9762B
          FEFEFDFEFEFDFEFEFDFEFEFDFBFBFAF8F8F7F5F5F4F1F1F0EEEEEDEBEBEAE8E8
          E7DEDEDED2D2D2A24F22FF00FFC9762BFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFB
          FBFAF8F8F7F5F5F4F1F1F0EEEEEDEBEBEAE8E8E7DEDEDEA24F22FF00FFC9762B
          FEFEFDCE6363FEFEFDFEFEFDCE6363CE6363FBFBFACE6363CE6363F1F1F0CE63
          63CE6363E8E8E7A24F22FF00FFC9762BFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFE
          FEFDFEFEFDFBFBFAF8F8F7F5F5F4F1F1F0EEEEEDEBEBEAA24F22FF00FFC9762B
          FEFEFDCE6363FEFEFDFEFEFDFF9C9CFF9C9CFEFEFDFF9C9CFF9C9CF8F8F7FF9C
          9CFF9C9CEEEEEDA24F22FF00FFC9762BFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFE
          FEFDFEFEFDFEFEFDFEFEFDFDFDFCF8F8F7F5F5F4F1F1F0A24F22FF00FFC9762B
          FEFEFD9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
          9C9C9C9CF6F6F5A24F22FF00FFC9762BFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFE
          FEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFDFDFCFAFAF9A24F22FF00FFC9762B
          FEFEFDFEFEFDFEFEFDFEFEFDFF9C9CFF9C9CFEFEFDFF9C9CFF9C9CFEFEFDFF9C
          9CFF9C9CFDFDFCA24F22FF00FFC9762BFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFE
          FEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDA24F22FF00FFC9762B
          D06F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01D06F
          01D06F01D06F01A24F22FF00FFCE6300ED9733ED9733ED9733ED9733ED9733ED
          9733ED9733F6CA9AED9733F6CA9AED9733306DF97F7488CE6300FF00FFFF00FF
          DA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B
          0DDA7B0DDA7B0DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        OnClick = btnSummaryClick
      end
      object btnHelp: TRxSpeedButton [2]
        Left = 87
        Top = 0
        Width = 59
        Height = 45
        Caption = '&Help'
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000D30E0000D30E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFE7D6CEDEC6BDDEC6BDDEC6BDDEC6BDDEC6BDE7D6CEFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE7D6CEE7CEC6EFDED6F7E7D6F7
          E7D6EFDED6EFDED6EFDED6DEC6BDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          E7D6CEF7E7D6F7F7F7E7E7E7CEB5A5D6AD94DEC6BDEFF7F7F7EFEFEFDED6DEC6
          BDFF00FFFF00FFFF00FFFF00FFE7D6CEF7E7DEF7FFFFCE9C84B54A10BD6339D6
          AD9CC65A21BD5221D6AD9CF7FFFFF7DED6DEC6BDFF00FFFF00FFFF00FFEFDED6
          F7FFFFC67B5ABD4A10C65218C6A594FFFFFFDE9473BD4A10B54A10CE9C84F7FF
          FFEFDED6E7D6CEFF00FFF7E7E7F7F7F7D6AD94BD4A10CE6331CE6329CE6B39DE
          8C6BCE6329CE6331C65A29B54A10DEC6BDF7EFE7DEC6BDFF00FFF7EFE7F7F7F7
          C66331C65A29CE6B31CE5A21CE8C6BF7E7DECE6B39C65A21CE6331C65218C67B
          52F7FFFFEFDED6E7D6CEF7EFE7EFDED6C65A21CE6331CE6331CE5A21C6846BFF
          FFFFEFAD94C64A10CE6331CE6329C65A29F7EFEFEFDED6DEC6BDF7EFE7F7DECE
          CE5A21CE6331CE6331CE6329C65221CEB5A5FFFFFFE79C7BC65218CE6329C65A
          29F7EFEFEFDED6DEC6BDF7EFE7F7EFE7DE6B31D66B31CE6329C65A21C65218BD
          4A10DECEC6FFFFFFD67342CE5A21CE6B39FFF7F7EFDED6DEC6BDF7E7E7FFFFFF
          F79C6BE76329CE8C6BEFE7DED67B52BD3100D69C7BFFFFFFDE8C63CE5218E79C
          73FFFFFFEFDED6E7D6CEF7EFE7F7EFEFFFEFDEFF8C4ADE845AEFFFFFFFFFFFE7
          BDA5F7FFFFEFFFFFE77339E77339FFEFEFF7E7DEDEC6BDFF00FFFF00FFEFDED6
          FFFFFFFFEFCEFFB573EFAD84EFE7DEEFF7F7EFE7DEF7A57BFF8C4AFFDECEFFFF
          FFEFDED6E7D6CEFF00FFFF00FFF7EFEFEFDED6FFFFFFFFFFFFFFF7C6FFDEADFF
          CE94FFCE94FFD6ADFFF7F7FFFFFFEFDED6DEC6BDFF00FFFF00FFFF00FFFF00FF
          F7EFEFEFDED6F7E7E7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE7DEEFDED6DEC6
          BDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF7EFE7F7F7EFF7EFEFF7EFEFF7
          EFEFF7EFEFF7EFEFF7EFEFF7EFE7FF00FFFF00FFFF00FFFF00FF}
        OnClick = btnHelpClick
      end
      inherited cbHerdIdentity: TRxDBLookupCombo
        Left = 151
        Top = 16
      end
    end
    object ToolButton4: TToolButton
      Left = 558
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 4
      Style = tbsSeparator
    end
  end
  inherited GroupBox1: TGroupBox
    Height = 433
    Caption = 'Livestock Valuation Report'
    Font.Height = -12
    ParentFont = False
    object Bevel1: TBevel [0]
      Left = 57
      Top = 20
      Width = 413
      Height = 78
      Shape = bsFrame
    end
    inherited LFromDate: TLabel
      Left = 86
      Top = 49
      Width = 35
      Height = 14
      Caption = ' From'
      Visible = False
    end
    inherited LToDate: TLabel
      Left = 244
      Top = 44
      Width = 15
      Height = 14
      Visible = False
    end
    inherited lWaitCaption: TLabel
      Left = 229
      Top = 320
      Width = 85
      Height = 14
      Font.Height = -12
    end
    object Bevel2: TBevel [4]
      Left = 57
      Top = 225
      Width = 413
      Height = 47
      Shape = bsFrame
    end
    inherited FromDate: TDateEdit
      Left = 98
      Top = 32
      Visible = False
    end
    inherited ToDate: TDateEdit
      Left = 352
      Top = 32
      Width = 109
      OnChange = ToDateChange
    end
    inherited rgSortBy: TRadioGroup
      Left = 57
      Top = 342
      Width = 204
      Height = 69
      Font.Height = -12
      Items.Strings = (
        '&Animal No'
        'Date Of &Birth'
        '&Purchase Date')
      ParentFont = False
      TabOrder = 6
    end
    inherited rgSortOrder: TRadioGroup
      Left = 266
      Top = 342
      Width = 204
      Height = 69
      Font.Height = -12
      ParentFont = False
      TabOrder = 7
    end
    inherited ProgBar: TProgressBar
      Left = 65
      Top = 288
      Smooth = True
      TabOrder = 8
    end
    inherited cbUseFilter: TCheckBox
      Left = 368
      Top = -19
      Width = 175
      TabOrder = 9
      Visible = False
    end
    inherited cbDichromatic: TCheckBox
      Left = 408
      Top = -16
      TabOrder = 10
    end
    object lPurchDateFilter: TcxLabel
      Left = 67
      Top = 33
      Caption = 'Value stock as on date:'
    end
    object cxLabel3: TcxLabel
      Left = 67
      Top = 238
      Caption = 'Sex'
    end
    object cmboSex: TcxComboBox
      Left = 110
      Top = 238
      RepositoryItem = HerdLookup.erSexCombo
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.Items.Strings = (
        'All'
        'Female'
        'Bull'
        'Steer')
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
      Properties.OnChange = cmboSexPropertiesChange
      Style.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.Kind = lfStandard
      TabOrder = 3
      Width = 121
    end
    object cxLabel4: TcxLabel
      Left = 242
      Top = 238
      Caption = 'Age'
    end
    object cmboAge: TcxComboBox
      Left = 278
      Top = 238
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.Items.Strings = (
        ''
        'Under'
        'Over')
      Properties.OnChange = cmboAgePropertiesChange
      Style.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.Kind = lfStandard
      TabOrder = 4
      Width = 67
    end
    object seMonths: TcxSpinEdit
      Left = 358
      Top = 238
      Enabled = False
      Properties.ImmediatePost = True
      Properties.MinValue = 1
      Properties.OnChange = seMonthsPropertiesChange
      Style.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.Kind = lfStandard
      TabOrder = 5
      Value = 30
      Width = 49
    end
    object cxLabel5: TcxLabel
      Left = 410
      Top = 240
      Caption = 'Months'
    end
    object ParamGrid: TcxGrid
      Left = 59
      Top = 110
      Width = 412
      Height = 103
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      LookAndFeel.Kind = lfFlat
      object ParamGridDBTableView: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsMemData
        DataController.KeyFieldNames = 'Sex'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnHorzSizing = False
        OptionsCustomize.ColumnMoving = False
        OptionsCustomize.ColumnSorting = False
        OptionsSelection.HideSelection = True
        OptionsSelection.UnselectFocusedRecordOnExit = False
        OptionsView.GridLines = glHorizontal
        OptionsView.GroupByBox = False
        Styles.OnGetContentStyle = ParamGridDBTableViewStylesGetContentStyle
        object ParamGridDBTableViewRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
        end
        object ParamGridDBTableViewSex: TcxGridDBColumn
          DataBinding.FieldName = 'Sex'
          Options.Editing = False
          Options.Focusing = False
          Width = 70
        end
        object ParamGridDBTableViewDLWG: TcxGridDBColumn
          DataBinding.FieldName = 'DLWG'
          Width = 65
        end
        object ParamGridDBTableViewDLWGUM: TcxGridDBColumn
          Caption = 'DLWG (UM)'
          DataBinding.FieldName = 'DLWGUM'
          Width = 90
        end
        object ParamGridDBTableViewDLWGOM: TcxGridDBColumn
          Caption = 'DLWG (OM)'
          DataBinding.FieldName = 'DLWGOM'
          Width = 90
        end
        object ParamGridDBTableViewKILLOUTPERC: TcxGridDBColumn
          DataBinding.FieldName = 'KILLOUTPERC'
        end
        object ParamGridDBTableViewAVGPKG: TcxGridDBColumn
          Caption = 'Sale Price/Kg'
          DataBinding.FieldName = 'AVGPKG'
          Width = 100
        end
        object ParamGridDBTableViewAVGPKGUM: TcxGridDBColumn
          Caption = 'Sale Price/Kg (UM)'
          DataBinding.FieldName = 'AVGPKGUM'
          Width = 125
        end
        object ParamGridDBTableViewAVGPKGOM: TcxGridDBColumn
          Caption = 'Sale Price/Kg (OM)'
          DataBinding.FieldName = 'AVGPKGOM'
          Width = 125
        end
      end
      object ParamGridLevel: TcxGridLevel
        GridView = ParamGridDBTableView
      end
    end
  end
  object cbFavourite: TcxCheckBox [2]
    Left = 30
    Top = 54
    AutoSize = False
    Caption = 'Add Report As Favourite'
    Properties.OnChange = cbFavouritePropertiesChange
    TabOrder = 3
    Height = 23
    Width = 212
  end
  object cbFilter: TcxCheckBox [3]
    Left = 388
    Top = 54
    Caption = 'Apply Main Grid Filter'
    Properties.OnChange = cbFilterPropertiesChange
    TabOrder = 4
    Width = 166
  end
  object qrpLivestockValSummary: TQuickRep [4]
    Left = 618
    Top = 78
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = qrpLivestockValSummaryBeforePrint
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
    ReportTitle = 'Livestock Valuation Summary'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 74
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
        195.791666666667
        1899.70833333333)
      BandType = rbTitle
      object QRSysData1: TQRSysData
        Left = 603
        Top = 8
        Width = 106
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1595.4375
          21.1666666666667
          280.458333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Date/Time:'
        Transparent = False
        FontSize = 8
      end
      object QRSysData2: TQRSysData
        Left = 643
        Top = 27
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1701.27083333333
          71.4375
          174.625)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Page:'
        Transparent = False
        FontSize = 8
      end
      object qrlLivestockValSumTitle: TQRLabel
        Left = 4
        Top = 2
        Width = 352
        Height = 35
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          92.6041666666667
          10.5833333333333
          5.29166666666667
          931.333333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Livestock Valuation Summary'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -29
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 22
      end
      object QRLabel30: TQRLabel
        Left = 3
        Top = 42
        Width = 129
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          7.9375
          111.125
          341.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Value stock as on date:'
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
      object qrlPurchDateSummary: TQRLabel
        Left = 135
        Top = 42
        Width = 63
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          357.1875
          111.125
          166.6875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlPurchDate'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel33: TQRLabel
        Left = 267
        Top = 42
        Width = 74
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          706.4375
          111.125
          195.791666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Herd Identity:'
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
      object qrlHerdIdentitySummary: TQRLabel
        Left = 345
        Top = 42
        Width = 45
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          912.8125
          111.125
          119.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlHerdID'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape8: TQRShape
        Left = 4
        Top = 60
        Width = 710
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.3958333333333
          10.5833333333333
          158.75
          1878.54166666667)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlTotalAnimalsHead: TQRLabel
        Left = 448
        Top = 42
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1185.33333333333
          111.125
          209.020833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Animals:'
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
      object qrlTotalAnimalsDetail: TQRLabel
        Left = 532
        Top = 42
        Width = 100
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1407.58333333333
          111.125
          264.583333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlTotalAnimalsDetail'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object qrCostsBand: TQRBand
      Left = 38
      Top = 112
      Width = 718
      Height = 231
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
        611.1875
        1899.70833333333)
      BandType = rbDetail
      object qrlCostsTitle: TQRLabel
        Left = 6
        Top = 8
        Width = 51
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          15.875
          21.1666666666667
          134.9375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Costs'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object qrlPurchasePrice: TQRLabel
        Left = 200
        Top = 50
        Width = 90
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          529.166666666667
          132.291666666667
          238.125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Purchase Price'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlPurchaseCosts: TQRLabel
        Left = 200
        Top = 80
        Width = 94
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          529.166666666667
          211.666666666667
          248.708333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Purchase Costs'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlVetCosts: TQRLabel
        Left = 200
        Top = 110
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          529.166666666667
          291.041666666667
          156.104166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Vet Costs'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlFeedCosts: TQRLabel
        Left = 200
        Top = 140
        Width = 68
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          529.166666666667
          370.416666666667
          179.916666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Feed Costs'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlFarmCosts: TQRLabel
        Left = 200
        Top = 170
        Width = 69
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          529.166666666667
          449.791666666667
          182.5625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Farm Costs'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlTotalCostsHead: TQRLabel
        Left = 560
        Top = 26
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1481.66666666667
          68.7916666666667
          87.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total'
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
      object qrlAverageCostsHead: TQRLabel
        Left = 430
        Top = 24
        Width = 54
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1137.70833333333
          63.5
          142.875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Average'
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
      object qrlTotalCostsSum: TQRLabel
        Left = 200
        Top = 200
        Width = 67
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          529.166666666667
          529.166666666667
          177.270833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Costs'
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
      object qrdbTotPurchPrice: TQRDBText
        Left = 514
        Top = 52
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1359.95833333333
          137.583333333333
          211.666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'SumPurchPrice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatQRDBFloatValue
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbTotPurchCosts: TQRDBText
        Left = 514
        Top = 82
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1359.95833333333
          216.958333333333
          211.666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'SumPurchCosts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatQRDBFloatValue
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbTotVetCosts: TQRDBText
        Left = 514
        Top = 112
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1359.95833333333
          296.333333333333
          211.666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'SumVetCosts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatQRDBFloatValue
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbTotFeedCosts: TQRDBText
        Left = 514
        Top = 142
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1359.95833333333
          375.708333333333
          211.666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'SumFeedCosts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatQRDBFloatValue
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbTotFarmCosts: TQRDBText
        Left = 514
        Top = 172
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1359.95833333333
          455.083333333333
          211.666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'SumFarmCosts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatQRDBFloatValue
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbTotTotalCosts: TQRDBText
        Left = 514
        Top = 202
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1359.95833333333
          534.458333333333
          211.666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'SumTotalCosts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatQRDBFloatValue
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbAvgPurchPrice: TQRDBText
        Left = 405
        Top = 50
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1071.5625
          132.291666666667
          211.666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'AvgPurchPrice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatQRDBFloatValue
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbAvgPurchCosts: TQRDBText
        Left = 405
        Top = 80
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1071.5625
          211.666666666667
          211.666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'AvgPurchCosts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatQRDBFloatValue
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbAvgVetCosts: TQRDBText
        Left = 405
        Top = 110
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1071.5625
          291.041666666667
          211.666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'AvgVetCosts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatQRDBFloatValue
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbAvgFeedCosts: TQRDBText
        Left = 405
        Top = 140
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1071.5625
          370.416666666667
          211.666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'AvgFeedCosts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatQRDBFloatValue
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbAvgFarmCosts: TQRDBText
        Left = 405
        Top = 170
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1071.5625
          449.791666666667
          211.666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'AvgFarmCosts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatQRDBFloatValue
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbAvgTotalCosts: TQRDBText
        Left = 405
        Top = 200
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1071.5625
          529.166666666667
          211.666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'AvgTotalCosts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatQRDBFloatValue
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrRealValBand: TQRBand
      Left = 38
      Top = 343
      Width = 718
      Height = 368
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
        973.666666666667
        1899.70833333333)
      BandType = rbSummary
      object qrlRelValTitle: TQRLabel
        Left = 6
        Top = 8
        Width = 143
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          15.875
          21.1666666666667
          378.354166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Realisable Value'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object qrlRelPurchWeight: TQRLabel
        Left = 200
        Top = 48
        Width = 101
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          529.166666666667
          127
          267.229166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Purchase Weight'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlRelValDaysOnFarm: TQRLabel
        Left = 200
        Top = 78
        Width = 86
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          529.166666666667
          206.375
          227.541666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Days On Farm'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlRelValEstWeighGain: TQRLabel
        Left = 190
        Top = 168
        Width = 145
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          502.708333333333
          444.5
          383.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '* Estimated Weight Gain'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlNetRelValue: TQRLabel
        Left = 184
        Top = 198
        Width = 136
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          486.833333333333
          523.875
          359.833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '** Net Realisable Value'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel39: TQRLabel
        Left = 560
        Top = 24
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1481.66666666667
          63.5
          87.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total'
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
      object QRLabel44: TQRLabel
        Left = 430
        Top = 22
        Width = 54
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1137.70833333333
          58.2083333333333
          142.875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Average'
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
      object QRShape9: TQRShape
        Left = 0
        Top = 223
        Width = 718
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.3958333333333
          0
          590.020833333333
          1899.70833333333)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel31: TQRLabel
        Left = 278
        Top = 236
        Width = 418
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          735.541666666667
          624.416666666667
          1105.95833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          '* Based on                                                 x est' +
          'imated                                         (DLWG)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel35: TQRLabel
        Left = 272
        Top = 261
        Width = 291
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          719.666666666667
          690.5625
          769.9375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          '** Based on estimated               x                          x' +
          ' Kill Out %'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrdbTotNetRelValue: TQRDBText
        Left = 514
        Top = 198
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1359.95833333333
          523.875
          211.666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'SumNetRelVal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatQRDBFloatValue
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbAvgPurchWeight: TQRDBText
        Left = 405
        Top = 48
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1071.5625
          127
          211.666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'AvgPurchWeight'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatQRDBFloatValue
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbAvgDaysOnFarm: TQRDBText
        Left = 405
        Top = 78
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1071.5625
          206.375
          211.666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'AvgDaysOnFarm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatQRDBFloatValue
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbAvgEstWeighGain: TQRDBText
        Left = 405
        Top = 168
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1071.5625
          444.5
          211.666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'AvgDLWG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatQRDBFloatValue
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbAvgNetRelValue: TQRDBText
        Left = 405
        Top = 198
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1071.5625
          523.875
          211.666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'AvgNetRelVal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatQRDBFloatValue
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlLastWeight: TQRLabel
        Left = 200
        Top = 108
        Width = 71
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          529.166666666667
          285.75
          187.854166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Last Weight'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbLastWeight: TQRDBText
        Left = 405
        Top = 108
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1071.5625
          285.75
          211.666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'AvgLastWeight'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatQRDBFloatValue
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlDaysSinceLastWeight: TQRLabel
        Left = 200
        Top = 138
        Width = 155
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          529.166666666667
          365.125
          410.104166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Days Since Last Weighing'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrdbDaysSinceLastWeight: TQRDBText
        Left = 405
        Top = 138
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1071.5625
          365.125
          211.666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'AvgDaysSinceLastWeight'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatQRDBFloatValue
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel36: TQRLabel
        Left = 200
        Top = 138
        Width = 155
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          529.166666666667
          365.125
          410.104166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Days Since Last Weighing'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlEstPricePerKg: TQRLabel
        Left = 12
        Top = 261
        Width = 117
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          31.75
          690.5625
          309.5625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Estimated Sale Price/Kg:'
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
      object qrdbEstPricePerKg: TQRDBText
        Left = 134
        Top = 261
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          354.541666666667
          690.5625
          211.666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'AvgEstPriceKg'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatQRDBFloatValue
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlEstKillOut: TQRLabel
        Left = 12
        Top = 286
        Width = 92
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          31.75
          756.708333333333
          243.416666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Average Kill Out%:'
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
      object qrdbEstKillOut: TQRDBText
        Left = 109
        Top = 286
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          288.395833333333
          756.708333333333
          211.666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'AvgKillOut'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatQRDBFloatValue
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel37: TQRLabel
        Left = 333
        Top = 236
        Width = 141
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          881.0625
          624.416666666667
          373.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Days Since Last Weighing'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel38: TQRLabel
        Left = 535
        Top = 236
        Width = 120
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1415.52083333333
          624.416666666667
          317.5)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Daily Live Weight Gain'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel40: TQRLabel
        Left = 381
        Top = 261
        Width = 39
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1008.0625
          690.5625
          103.1875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Weight'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel41: TQRLabel
        Left = 432
        Top = 260
        Width = 72
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1143
          687.916666666667
          190.5)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Sale Price/Kg'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel42: TQRLabel
        Left = 517
        Top = 261
        Width = 51
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1367.89583333333
          690.5625
          134.9375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Kill Out %'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel43: TQRLabel
        Left = 12
        Top = 236
        Width = 157
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          31.75
          624.416666666667
          415.395833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Estimated Daily Liveweight Gain:'
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
      object qrdbAvgDailyLiveWeigh: TQRDBText
        Left = 174
        Top = 236
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          460.375
          624.416666666667
          211.666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataField = 'AvgEstWeightGain'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = FormatQRDBFloatValue
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
  inherited BaseReport: TQuickRep
    Left = 34
    Top = 1002
    Width = 1123
    Height = 794
    BeforePrint = BaseReportBeforePrint
    DataSet = GenQuery
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Orientation = poLandscape
    Page.Values = (
      100
      2100
      100
      2970
      100
      100
      0)
    ReportTitle = 'Livestock Valuation Report'
    inherited PageHeaderBand: TQRBand
      Width = 1047
      Height = 143
      Size.Values = (
        378.354166666667
        2770.1875)
      inherited ReportTitle: TQRLabel
        Left = 4
        Top = 2
        Width = 321
        Size.Values = (
          92.6041666666667
          10.5833333333333
          5.29166666666667
          849.3125)
        Caption = 'Livestock Valuation Report'
        FontSize = 22
      end
      inherited DateTimeLabel: TQRSysData
        Left = 931
        Width = 106
        Size.Values = (
          44.9791666666667
          2463.27083333333
          21.1666666666667
          280.458333333333)
        Font.Height = -11
        ParentFont = False
        FontSize = 8
      end
      inherited PageNumLabel: TQRSysData
        Left = 971
        Width = 66
        Size.Values = (
          44.9791666666667
          2569.10416666667
          71.4375
          174.625)
        Font.Height = -11
        ParentFont = False
        FontSize = 8
      end
      inherited qrlSortBy: TQRLabel
        Left = 413
        Top = 6
        Width = 46
        Size.Values = (
          44.9791666666667
          1092.72916666667
          15.875
          121.708333333333)
        Font.Height = -11
        FontSize = 8
      end
      inherited qrlSortOrder: TQRLabel
        Left = 413
        Top = 22
        Width = 61
        Size.Values = (
          44.9791666666667
          1092.72916666667
          58.2083333333333
          161.395833333333)
        Font.Height = -11
        FontSize = 8
      end
      inherited QRLabel32: TQRLabel
        Left = 366
        Top = 6
        Width = 43
        Size.Values = (
          44.9791666666667
          968.375
          15.875
          113.770833333333)
        Font.Height = -11
        FontSize = 8
      end
      inherited QRLabel34: TQRLabel
        Left = 346
        Top = 22
        Width = 62
        Size.Values = (
          44.9791666666667
          915.458333333333
          58.2083333333333
          164.041666666667)
        Font.Height = -11
        FontSize = 8
      end
      inherited QRLabel19: TQRLabel
        Left = 272
        Top = 42
        Width = 74
        Size.Values = (
          44.9791666666667
          719.666666666667
          111.125
          195.791666666667)
        Font.Height = -11
        FontSize = 8
      end
      inherited qrlHerdIdentity: TQRLabel
        Left = 350
        Top = 42
        Width = 45
        Size.Values = (
          44.9791666666667
          926.041666666667
          111.125
          119.0625)
        Font.Height = -11
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 2
        Top = 112
        Width = 47
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.0833333333333
          5.29166666666667
          296.333333333333
          124.354166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Animal No.'
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
      object QRLabel2: TQRLabel
        Left = 60
        Top = 112
        Width = 57
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.0833333333333
          158.75
          296.333333333333
          150.8125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nat. Id. No.'
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
      object QRLabel3: TQRLabel
        Left = 164
        Top = 112
        Width = 55
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.0833333333333
          433.916666666667
          296.333333333333
          145.520833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Date of Birth'
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
        Left = 397
        Top = 86
        Width = 93
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1050.39583333333
          227.541666666667
          246.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Purchase Details'
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
      object QRLabel5: TQRLabel
        Left = 344
        Top = 112
        Width = 25
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.0833333333333
          910.166666666667
          296.333333333333
          66.1458333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date'
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
        Left = 410
        Top = 112
        Width = 29
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.0833333333333
          1084.79166666667
          296.333333333333
          76.7291666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Price'
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
        Left = 496
        Top = 112
        Width = 39
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.0833333333333
          1312.33333333333
          296.333333333333
          103.1875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Weight'
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
      object QRLabel8: TQRLabel
        Left = 608
        Top = 86
        Width = 87
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1608.66666666667
          227.541666666667
          230.1875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'On Farm Details'
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
        Left = 552
        Top = 112
        Width = 47
        Height = 29
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          76.7291666666667
          1460.5
          296.333333333333
          124.354166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Days On Farm'
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
      object QRLabel10: TQRLabel
        Left = 610
        Top = 112
        Width = 41
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.0833333333333
          1613.95833333333
          296.333333333333
          108.479166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Vet. Costs'
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
        Left = 732
        Top = 28
        Width = 91
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1936.75
          74.0833333333333
          240.770833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Sale Information'
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
        Left = 706
        Top = 40
        Width = 25
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1867.95833333333
          105.833333333333
          66.1458333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date'
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
      object QRLabel13: TQRLabel
        Left = 762
        Top = 40
        Width = 29
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2016.125
          105.833333333333
          76.7291666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Price'
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
        Left = 856
        Top = 38
        Width = 39
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2264.83333333333
          100.541666666667
          103.1875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Weight'
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
      object QRLabel15: TQRLabel
        Left = 714
        Top = 112
        Width = 41
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.0833333333333
          1889.125
          296.333333333333
          108.479166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Farm Costs'
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
      object QRLabel16: TQRLabel
        Left = 662
        Top = 112
        Width = 41
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.0833333333333
          1751.54166666667
          296.333333333333
          108.479166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Feed Costs'
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
      object QRLabel17: TQRLabel
        Left = 256
        Top = 112
        Width = 37
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.0833333333333
          677.333333333333
          296.333333333333
          97.8958333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Breed Code'
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
      object QRLabel18: TQRLabel
        Left = 298
        Top = 112
        Width = 45
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.0833333333333
          788.458333333333
          296.333333333333
          119.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Colour Code'
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
      object QRLabel20: TQRLabel
        Left = 452
        Top = 112
        Width = 34
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.0833333333333
          1195.91666666667
          296.333333333333
          89.9583333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Costs'
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
      object QRLabel21: TQRLabel
        Left = 802
        Top = 38
        Width = 34
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2121.95833333333
          100.541666666667
          89.9583333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Costs'
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
      object QRDBText11: TQRDBText
        Left = 704
        Top = 59
        Width = 44
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1862.66666666667
          156.104166666667
          116.416666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'SaleDate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Mask = 'dd/mm/yy'
        OnPrint = QRDBText4Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText12: TQRDBText
        Left = 750
        Top = 59
        Width = 46
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1984.375
          156.104166666667
          121.708333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'SalePrice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '#.##'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText17: TQRDBText
        Left = 788
        Top = 57
        Width = 50
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2084.91666666667
          150.8125
          132.291666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'SaleCosts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '#.##'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText13: TQRDBText
        Left = 840
        Top = 59
        Width = 55
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2222.5
          156.104166666667
          145.520833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'SaleWeight'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '#.##'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel22: TQRLabel
        Left = 789
        Top = 112
        Width = 41
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.0833333333333
          2087.5625
          296.333333333333
          108.479166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Total Costs'
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
      object QRShape1: TQRShape
        Left = 344
        Top = 98
        Width = 195
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.3958333333333
          910.166666666667
          259.291666666667
          515.9375)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 562
        Top = 98
        Width = 187
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.3958333333333
          1486.95833333333
          259.291666666667
          494.770833333333)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 6
        Top = 76
        Width = 1035
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.3958333333333
          15.875
          201.083333333333
          2738.4375)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel23: TQRLabel
        Left = 964
        Top = 112
        Width = 81
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.0833333333333
          2550.58333333333
          296.333333333333
          214.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Net Realisable Value'
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
      object QRLabel24: TQRLabel
        Left = 408
        Top = 42
        Width = 36
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1079.5
          111.125
          95.25)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DLWG:'
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
      object qrlDLWG: TQRLabel
        Left = 448
        Top = 42
        Width = 44
        Height = 17
        Enabled = False
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1185.33333333333
          111.125
          116.416666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlDLWG'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape25: TQRShape
        Left = 840
        Top = 85
        Width = 4
        Height = 57
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          150.8125
          2222.5
          224.895833333333
          10.5833333333333)
        Pen.Style = psDot
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel26: TQRLabel
        Left = 890
        Top = 112
        Width = 32
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.0833333333333
          2354.79166666667
          296.333333333333
          84.6666666666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Kill Out%'
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
      object QRLabel27: TQRLabel
        Left = 847
        Top = 112
        Width = 38
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.0833333333333
          2241.02083333333
          296.333333333333
          100.541666666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DLWG'
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
      object QRLabel28: TQRLabel
        Left = 925
        Top = 96
        Width = 36
        Height = 44
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          116.416666666667
          2447.39583333333
          254
          95.25)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Sale Price / Kg'
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
      object QRLabel29: TQRLabel
        Left = 222
        Top = 112
        Width = 27
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.0833333333333
          587.375
          296.333333333333
          71.4375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Sex'
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
      object qrlValueStockOnDate: TQRLabel
        Left = 8
        Top = 42
        Width = 129
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          111.125
          341.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Value stock as on date:'
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
      object qrlPurchDate: TQRLabel
        Left = 140
        Top = 42
        Width = 63
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          370.416666666667
          111.125
          166.6875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlPurchDate'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlNonPurchasedAnimals: TQRLabel
        Left = 8
        Top = 62
        Width = 273
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          164.041666666667
          722.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Red Indicates animals that have no purchase information'
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
    inherited SubDetailBand: TQRSubDetail
      Top = 181
      Width = 1047
      Height = 18
      Font.Height = -11
      Size.Values = (
        47.625
        2770.1875)
      DataSet = GenQuery
      object QRDBText1: TQRDBText
        Left = 2
        Top = 2
        Width = 46
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          5.29166666666667
          5.29166666666667
          121.708333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'AnimalNo'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 60
        Top = 2
        Width = 46
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          158.75
          5.29166666666667
          121.708333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'NatIdNum'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 256
        Top = 2
        Width = 35
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          677.333333333333
          5.29166666666667
          92.6041666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'BreedCode'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 344
        Top = 2
        Width = 45
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          910.166666666667
          5.29166666666667
          119.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'PurchDate'
        Mask = 'dd/mm/yy'
        OnPrint = QRDBText4Print
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 430
        Top = 2
        Width = 57
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1137.70833333333
          5.29166666666667
          150.8125)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'PurchCosts'
        Mask = '0.00;-0.00'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 474
        Top = 2
        Width = 62
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1254.125
          5.29166666666667
          164.041666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'PurchWeight'
        Mask = '#.##'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 552
        Top = 2
        Width = 43
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1460.5
          5.29166666666667
          113.770833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'DaysOnFarm'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 652
        Top = 2
        Width = 43
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1725.08333333333
          5.29166666666667
          113.770833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'FeedCosts'
        Mask = '0.00;-0.00'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText9: TQRDBText
        Left = 601
        Top = 2
        Width = 43
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1590.14583333333
          5.29166666666667
          113.770833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'HealthCosts'
        Mask = '0.00;-0.00'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 704
        Top = 2
        Width = 43
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1862.66666666667
          5.29166666666667
          113.770833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'FixedCosts'
        Mask = '0.00;-0.00'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText14: TQRDBText
        Left = 164
        Top = 2
        Width = 57
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          433.916666666667
          5.29166666666667
          150.8125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'DateOfBirth'
        Mask = 'dd/mm/yy'
        OnPrint = QRDBText4Print
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText15: TQRDBText
        Left = 298
        Top = 2
        Width = 35
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          788.458333333333
          5.29166666666667
          92.6041666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'ColourCode'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText16: TQRDBText
        Left = 387
        Top = 2
        Width = 53
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1023.9375
          5.29166666666667
          140.229166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'PurchPrice'
        Mask = '0.00;-0.00'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText18: TQRDBText
        Left = 769
        Top = 2
        Width = 52
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          2034.64583333333
          5.29166666666667
          137.583333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'TotalCosts'
        Mask = '0.00;-0.00'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrdbNetRelValue: TQRDBText
        Left = 985
        Top = 2
        Width = 55
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          2606.14583333333
          5.29166666666667
          145.520833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'NETREALISABLEVALUE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape4: TQRShape
        Left = 840
        Top = 0
        Width = 4
        Height = 57
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          150.8125
          2222.5
          0
          10.5833333333333)
        Pen.Style = psDot
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBText20: TQRDBText
        Left = 850
        Top = 2
        Width = 32
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          2248.95833333333
          5.29166666666667
          84.6666666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'DLWG'
        Mask = '#.##'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText21: TQRDBText
        Left = 923
        Top = 2
        Width = 36
        Height = 15
        Hint = 'AvgPricePerKg'
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          2442.10416666667
          5.29166666666667
          95.25)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'AvgPricePerKg'
        Mask = '#.##'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText22: TQRDBText
        Left = 891
        Top = 2
        Width = 27
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          2357.4375
          5.29166666666667
          71.4375)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'KillOutPerc'
        Mask = '0.00'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText23: TQRDBText
        Left = 222
        Top = 2
        Width = 27
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          587.375
          5.29166666666667
          71.4375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'Sex'
        OnPrint = QRDBText23Print
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    inherited SummaryBand: TQRBand
      Top = 199
      Width = 1047
      Height = 266
      ForceNewPage = True
      Size.Values = (
        703.791666666667
        2770.1875)
      inherited CountExpression: TQRExpr
        Left = 78
        Top = 53
        Width = 36
        Size.Values = (
          44.9791666666667
          206.375
          140.229166666667
          95.25)
        Font.Height = -11
        Font.Name = 'Arial'
        FontSize = 8
      end
      inherited TotalLabel: TQRLabel
        Left = 34
        Top = 53
        Width = 38
        Size.Values = (
          44.9791666666667
          89.9583333333333
          140.229166666667
          100.541666666667)
        Alignment = taRightJustify
        Caption = 'Totals:'
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        FontSize = 8
      end
      object QRExpr1: TQRExpr
        Left = 985
        Top = 6
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2606.14583333333
          15.875
          145.520833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = SubDetailBand
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'AVERAGE(NETREALISABLEVALUE)'
        Mask = '0.00;-0.00'
        FontSize = 8
      end
      object QRLabel25: TQRLabel
        Left = 23
        Top = 6
        Width = 50
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          60.8541666666667
          15.875
          132.291666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Average:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
        Left = 541
        Top = 24
        Width = 53
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1431.39583333333
          63.5
          140.229166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = SubDetailBand
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'AVERAGE(DaysOnFarm)'
        Mask = '0.00;-0.00'
        FontSize = 8
      end
      object QRExpr3: TQRExpr
        Left = 591
        Top = 6
        Width = 53
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1563.6875
          15.875
          140.229166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = SubDetailBand
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'AVERAGE(HealthCosts)'
        Mask = '0.00;-0.00'
        FontSize = 8
      end
      object QRExpr4: TQRExpr
        Left = 643
        Top = 24
        Width = 53
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1701.27083333333
          63.5
          140.229166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = SubDetailBand
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'AVERAGE(FeedCosts)'
        Mask = '0.00;-0.00'
        FontSize = 8
      end
      object QRExpr5: TQRExpr
        Left = 755
        Top = 24
        Width = 65
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1997.60416666667
          63.5
          171.979166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = SubDetailBand
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'AVERAGE(TotalCosts)'
        Mask = '0.00;-0.00'
        FontSize = 8
      end
      object QRShape5: TQRShape
        Left = 840
        Top = 1
        Width = 4
        Height = 57
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          150.8125
          2222.5
          2.64583333333333
          10.5833333333333)
        Pen.Style = psDot
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRExpr6: TQRExpr
        Left = 892
        Top = 53
        Width = 148
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          2360.08333333333
          140.229166666667
          391.583333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = SubDetailBand
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'SUM(NETREALISABLEVALUE)'
        Mask = '0.00;-0.00'
        FontSize = 8
      end
      object QRExpr7: TQRExpr
        Left = 769
        Top = 69
        Width = 52
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          2034.64583333333
          182.5625
          137.583333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = SubDetailBand
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'SUM(TotalCosts)'
        Mask = '0.00;-0.00'
        FontSize = 8
      end
      object QRExpr8: TQRExpr
        Left = 652
        Top = 69
        Width = 43
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1725.08333333333
          182.5625
          113.770833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = SubDetailBand
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'SUM(FeedCosts)'
        Mask = '0.00;-0.00'
        FontSize = 8
      end
      object QRExpr9: TQRExpr
        Left = 601
        Top = 53
        Width = 43
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1590.14583333333
          140.229166666667
          113.770833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = SubDetailBand
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'SUM(HealthCosts)'
        Mask = '0.00;-0.00'
        FontSize = 8
      end
      object QRExpr10: TQRExpr
        Left = 387
        Top = 53
        Width = 53
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1023.9375
          140.229166666667
          140.229166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = SubDetailBand
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'SUM(PurchPrice)'
        Mask = '0.00;-0.00'
        FontSize = 8
      end
      object QRExpr11: TQRExpr
        Left = 430
        Top = 69
        Width = 57
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1137.70833333333
          182.5625
          150.8125)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = SubDetailBand
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'SUM(PurchCosts)'
        Mask = '0.00;-0.00'
        FontSize = 8
      end
      object QRExpr12: TQRExpr
        Left = 694
        Top = 6
        Width = 53
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1836.20833333333
          15.875
          140.229166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = SubDetailBand
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'AVERAGE(FixedCosts)'
        Mask = '0.00;-0.00'
        FontSize = 8
      end
      object QRExpr13: TQRExpr
        Left = 704
        Top = 53
        Width = 43
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1862.66666666667
          140.229166666667
          113.770833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = SubDetailBand
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'SUM(FixedCosts)'
        Mask = '0.00;-0.00'
        FontSize = 8
      end
      object QRExpr14: TQRExpr
        Left = 923
        Top = 6
        Width = 36
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2442.10416666667
          15.875
          95.25)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = SubDetailBand
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'AVERAGE(AvgPricePerKg)'
        Mask = '0.00;-0.00'
        FontSize = 8
      end
      object QRExpr15: TQRExpr
        Left = 483
        Top = 6
        Width = 53
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1277.9375
          15.875
          140.229166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = SubDetailBand
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'AVERAGE(PurchWeight)'
        Mask = '0.00;-0.00'
        FontSize = 8
      end
      object QRExpr16: TQRExpr
        Left = 430
        Top = 24
        Width = 53
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1137.70833333333
          63.5
          140.229166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = SubDetailBand
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'AVERAGE(PurchCosts)'
        Mask = '0.00;-0.00'
        FontSize = 8
      end
      object QRExpr17: TQRExpr
        Left = 387
        Top = 2
        Width = 53
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1023.9375
          5.29166666666667
          140.229166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = SubDetailBand
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'AVERAGE(PurchPrice)'
        Mask = '0.00;-0.00'
        FontSize = 8
      end
      object QRShape6: TQRShape
        Left = 6
        Top = 38
        Width = 1035
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.3958333333333
          15.875
          100.541666666667
          2738.4375)
        Pen.Style = psDot
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 6
        Top = 93
        Width = 1035
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.3958333333333
          15.875
          246.0625
          2738.4375)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlNotes1: TQRLabel
        Left = 16
        Top = 125
        Width = 593
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          42.3333333333333
          330.729166666667
          1568.97916666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          '1. Formula for calculating Net Realisable Value is [Purchase Wei' +
          'ght + (Days on Farm x DLWG)] x Kill Out % x Sale Price/Kg.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlNotes2: TQRLabel
        Left = 16
        Top = 148
        Width = 552
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          42.3333333333333
          391.583333333333
          1460.5)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          '2. Where Purchase Weight is not available this formula becomes [' +
          'Age(Days) x DLWG] x Kill Out % x Sale Price/Kg.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlNotes3: TQRLabel
        Left = 16
        Top = 171
        Width = 444
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          42.3333333333333
          452.4375
          1174.75)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          '3. Animal details in red (complete line) indicates that no Purch' +
          'ase Event details are available.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlNotes4: TQRLabel
        Left = 16
        Top = 194
        Width = 368
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          42.3333333333333
          513.291666666667
          973.666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          '4. Net Realisable Value in red indicates that no Purchase Weight' +
          ' is available.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlNote5: TQRLabel
        Left = 16
        Top = 240
        Width = 467
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          42.3333333333333
          635
          1235.60416666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          '6. Sale Price/Kg (Sale Price / Cold Dead Weight) value is estima' +
          'ted from sales in the last 30 days.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlNote6: TQRLabel
        Left = 16
        Top = 217
        Width = 557
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          42.3333333333333
          574.145833333333
          1473.72916666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          '5. DLWG ( (Sale Weight - Purchase Weight (if available) / Days o' +
          'n Farm) is estimated from sales in the last 30 days.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object lNotes: TQRLabel
        Left = 16
        Top = 103
        Width = 32
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          42.3333333333333
          272.520833333333
          84.6666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Notes:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    inherited PageFooterBand: TQRBand
      Top = 465
      Width = 1047
      Size.Values = (
        76.7291666666667
        2770.1875)
      inherited CompanyNameLabel: TQRLabel
        Left = 10
        Width = 151
        Size.Values = (
          44.9791666666667
          26.4583333333333
          21.1666666666667
          399.520833333333)
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        FontSize = 8
      end
      inherited ProgramVersionLabel: TQRLabel
        Left = 875
        Width = 167
        Size.Values = (
          44.9791666666667
          2315.10416666667
          21.1666666666667
          441.854166666667)
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        FontSize = 8
      end
    end
  end
  inherited QRTextFilter1: TQRTextFilter
    Left = 2
  end
  inherited QRCSVFilter1: TQRCSVFilter
    Left = 2
  end
  inherited QRHTMLFilter1: TQRHTMLFilter
    Left = 2
  end
  inherited QRExcelFilter1: TQRExcelFilter
    Left = 2
  end
  inherited QRRTFFilter1: TQRRTFFilter
    Left = 2
  end
  inherited QRWMFFilter1: TQRWMFFilter
    Left = 2
  end
  inherited GenQuery: TQuery
    Left = 556
    Top = 208
  end
  object MemData: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F080000000800000001000400536578000800000006
      000700444C5747554D000800000006000700444C57474F4D0008000000060009
      00415647504B47554D000800000006000900415647504B474F4D000800000006
      000500444C5747000800000006000700415647504B47000800000006000C004B
      494C4C4F55545045524300}
    SortOptions = []
    Left = 556
    Top = 117
    object MemDataSex: TStringField
      FieldName = 'Sex'
      ReadOnly = True
      Size = 8
    end
    object MemDataDLWGUM: TFloatField
      FieldName = 'DLWGUM'
      DisplayFormat = '#.##'
    end
    object MemDataDLWGOM: TFloatField
      FieldName = 'DLWGOM'
      DisplayFormat = '#.##'
    end
    object MemDataAVGPKGUM: TFloatField
      FieldName = 'AVGPKGUM'
      DisplayFormat = '#.##'
    end
    object MemDataAVGPKGOM: TFloatField
      FieldName = 'AVGPKGOM'
      DisplayFormat = '#.##'
    end
    object MemDataDLWG: TFloatField
      FieldName = 'DLWG'
      DisplayFormat = '#.##'
    end
    object MemDataAVGPKG: TFloatField
      FieldName = 'AVGPKG'
      DisplayFormat = '#.##'
    end
    object MemDataKILLOUTPERC: TFloatField
      DisplayLabel = 'Kill Out %'
      FieldName = 'KILLOUTPERC'
      DisplayFormat = '0.00%'
      EditFormat = '0.00'
    end
  end
  object dsMemData: TDataSource
    DataSet = MemData
    Left = 556
    Top = 147
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 556
    Top = 178
    object cxStyleDisabled: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clBtnFace
      TextColor = clBtnShadow
    end
  end
end
