inherited fmTagReplacementForm: TfmTagReplacementForm
  Left = 431
  Top = 197
  ActiveControl = nil
  Caption = 'Tag Replacement Form'
  Font.Name = 'Tahoma'
  OldCreateOrder = True
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  object GroupBox2: TGroupBox [0]
    Tag = 1
    Left = 32
    Top = 82
    Width = 521
    Height = 345
    Caption = 'Replacement Tag(s) Order Confirmation'
    TabOrder = 3
    object btnPreview: TcxButton
      Left = 398
      Top = 306
      Width = 113
      Height = 29
      Caption = '&Preview/Print'
      Default = True
      TabOrder = 8
      OnClick = btnPreviewClick
      LookAndFeel.Kind = lfFlat
    end
    object cePairCost: TcxCurrencyEdit
      Left = 238
      Top = 80
      Properties.OnChange = ceSingleCostPropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 4
      Width = 71
    end
    object teNoOfSingles: TcxTextEdit
      Left = 130
      Top = 50
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 0
      Text = '0'
      Width = 71
    end
    object cxLabel2: TcxLabel
      Left = 26
      Top = 50
      Caption = 'No. of singles:'
    end
    object cxLabel3: TcxLabel
      Left = 26
      Top = 80
      Caption = 'No. of pairs:'
    end
    object cxLabel4: TcxLabel
      Left = 210
      Top = 50
      Caption = '@'
    end
    object cxLabel5: TcxLabel
      Left = 210
      Top = 80
      Caption = '@'
    end
    object teNoOfPairs: TcxTextEdit
      Left = 130
      Top = 80
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 3
      Text = '0'
      Width = 71
    end
    object ceSingleCost: TcxCurrencyEdit
      Left = 238
      Top = 50
      Properties.OnChange = ceSingleCostPropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 1
      Width = 71
    end
    object cxLabel6: TcxLabel
      Left = 314
      Top = 50
      Caption = 'each = '
    end
    object cxLabel7: TcxLabel
      Left = 314
      Top = 80
      Caption = 'each = '
    end
    object ceTotalSingleTagsCost: TcxCurrencyEdit
      Left = 370
      Top = 50
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 2
      Width = 71
    end
    object ceTotalPairTagsCost: TcxCurrencyEdit
      Left = 370
      Top = 80
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 5
      Width = 71
    end
    object cxLabel8: TcxLabel
      Left = 280
      Top = 114
      Caption = 'Plus P && P = '
    end
    object cePostageCost: TcxCurrencyEdit
      Left = 370
      Top = 114
      Properties.OnChange = ceSingleCostPropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 6
      Width = 71
    end
    object cxLabel9: TcxLabel
      Left = 296
      Top = 144
      Caption = 'Total Due'
    end
    object ceTotalDue: TcxCurrencyEdit
      Left = 370
      Top = 144
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 7
      Width = 71
    end
    object btnBack: TcxButton
      Left = 280
      Top = 306
      Width = 113
      Height = 29
      Caption = '<< &Back'
      TabOrder = 9
      OnClick = btnBackClick
      LookAndFeel.Kind = lfFlat
    end
    object lWarning: TcxLabel
      Left = 75
      Top = 228
      Caption = 'Warning: Update current prices if necessary.'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
  end
  inherited GroupBox1: TGroupBox [1]
    Top = 82
    Height = 345
    Caption = 'Replacement Tag(s)'
    inherited LFromDate: TLabel
      Left = 46
      Top = 356
      Width = 60
      Visible = False
    end
    inherited LToDate: TLabel
      Left = 306
      Top = 356
      Width = 15
      Visible = False
    end
    inherited lWaitCaption: TLabel
      Left = 212
      Top = 422
      Visible = False
    end
    inherited FromDate: TDateEdit
      Left = 128
      Top = 352
      TabOrder = 4
      Visible = False
    end
    inherited ToDate: TDateEdit
      Left = 334
      Top = 352
      TabOrder = 5
      Visible = False
    end
    inherited rgSortBy: TRadioGroup
      Left = 54
      Top = 448
      TabOrder = 6
      Visible = False
    end
    inherited rgSortOrder: TRadioGroup
      Left = 262
      Top = 448
      TabOrder = 7
      Visible = False
    end
    inherited ProgBar: TProgressBar
      Left = 60
      Top = 390
      TabOrder = 8
      Visible = False
    end
    inherited cbUseFilter: TCheckBox
      Left = 232
      Top = 350
      TabOrder = 9
      Visible = False
    end
    inherited cbDichromatic: TCheckBox
      Left = 350
      Top = 348
      TabOrder = 11
      Visible = False
    end
    object cmboTags: TcxLookupComboBox
      Left = 165
      Top = 32
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'NatIDNum'
      Properties.ListColumns = <
        item
          Caption = 'Tag No.'
          SortOrder = soAscending
          FieldName = 'NatIDNum'
        end
        item
          MinWidth = 0
          Width = 0
          FieldName = 'HerdID'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glHorizontal
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = WinData.AnimalSourceByID
      Properties.OnInitPopup = cmboTagsPropertiesInitPopup
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 0
      Width = 287
    end
    object cxLabel1: TcxLabel
      Left = 74
      Top = 32
      Caption = 'Select Tag'
    end
    object ReplacementTagsGrid: TcxGrid
      Left = 54
      Top = 96
      Width = 397
      Height = 159
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      LookAndFeel.Kind = lfFlat
      object ReplacementTagsGridDBTableView: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = dsmdReplacementTagList
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GridLines = glHorizontal
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object ReplacementTagsGridDBTableViewRecId: TcxGridDBColumn
          DataBinding.FieldName = 'RecId'
          Visible = False
        end
        object ReplacementTagsGridDBTableViewSortTagNo: TcxGridDBColumn
          Caption = 'Tag No'
          DataBinding.FieldName = 'SortNatID'
          OnGetDisplayText = ReplacementTagsGridDBTableViewSortTagNoGetDisplayText
          Options.Editing = False
          Options.Filtering = False
          Width = 257
        end
        object ReplacementTagsGridDBTableViewQty: TcxGridDBColumn
          Caption = 'Quantity'
          DataBinding.FieldName = 'Qty'
          PropertiesClassName = 'TcxSpinEditProperties'
          Properties.AssignedValues.MinValue = True
          Properties.ImmediatePost = True
          Properties.MaxValue = 2
          Options.Filtering = False
          Width = 64
        end
        object ReplacementTagsGridDBTableViewTagNo: TcxGridDBColumn
          Caption = 'Tag No.'
          DataBinding.FieldName = 'TagNo'
          Visible = False
          Options.Editing = False
          Options.Filtering = False
          Width = 257
        end
      end
      object ReplacementTagsGridLevel: TcxGridLevel
        GridView = ReplacementTagsGridDBTableView
      end
    end
    object btnAddTag: TcxButton
      Left = 376
      Top = 60
      Width = 75
      Height = 25
      Caption = '&Add Tag'
      TabOrder = 1
      OnClick = btnAddTagClick
      LookAndFeel.Kind = lfFlat
    end
    object btnNext: TcxButton
      Left = 398
      Top = 306
      Width = 113
      Height = 29
      Caption = '&Next >>'
      Default = True
      TabOrder = 3
      OnClick = btnNextClick
      LookAndFeel.Kind = lfFlat
    end
    object btnRemoveTag: TcxButton
      Left = 346
      Top = 260
      Width = 105
      Height = 25
      Caption = '&Remove Tag'
      TabOrder = 12
      OnClick = btnRemoveTagClick
      LookAndFeel.Kind = lfFlat
    end
  end
  inherited ToolBar1: TToolBar [2]
    inherited sbView: TRxSpeedButton
      Font.Color = 1979867
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    inherited sbPrint: TRxSpeedButton
      Visible = False
    end
    inherited ToolButton3: TToolButton
      Visible = False
    end
    inherited sbHelp: TRxSpeedButton
      Visible = False
    end
    inherited ToolButton5: TToolButton
      Visible = False
    end
    inherited pHerdID: TPanel
      inherited Label7: TLabel
        Width = 73
      end
    end
  end
  inherited BaseReport: TQuickRep
    Left = 696
    Top = 72
    AfterPrint = BaseReportAfterPrint
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
      Height = 277
      Size.Values = (
        732.895833333333
        1899.70833333333)
      inherited ReportTitle: TQRLabel
        Width = 355
        Size.Values = (
          92.6041666666667
          21.1666666666667
          21.1666666666667
          939.270833333333)
        Caption = 'Replacement Tag Order Form'
        Font.Color = clBlack
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
        Left = 496
        Top = 22
        Enabled = False
        Size.Values = (
          44.9791666666667
          1312.33333333333
          58.2083333333333
          145.520833333333)
        FontSize = 10
      end
      inherited qrlSortOrder: TQRLabel
        Left = 496
        Top = 38
        Enabled = False
        Size.Values = (
          44.9791666666667
          1312.33333333333
          100.541666666667
          187.854166666667)
        FontSize = 10
      end
      inherited QRLabel32: TQRLabel
        Left = 440
        Top = 22
        Enabled = False
        Size.Values = (
          44.9791666666667
          1164.16666666667
          58.2083333333333
          134.9375)
        FontSize = 10
      end
      inherited QRLabel34: TQRLabel
        Left = 420
        Top = 38
        Enabled = False
        Size.Values = (
          44.9791666666667
          1111.25
          100.541666666667
          187.854166666667)
        FontSize = 10
      end
      inherited QRLabel19: TQRLabel
        Top = 56
        Size.Values = (
          44.9791666666667
          21.1666666666667
          148.166666666667
          227.541666666667)
        FontSize = 10
      end
      inherited qrlHerdIdentity: TQRLabel
        Left = 98
        Top = 56
        Size.Values = (
          44.9791666666667
          259.291666666667
          148.166666666667
          142.875)
        Font.Color = clBlack
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 8
        Top = 77
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
          203.729166666667
          111.125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Name:'
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
      object QRLabel2: TQRLabel
        Left = 8
        Top = 98
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          259.291666666667
          145.520833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Address:'
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
        Left = 8
        Top = 164
        Width = 98
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          433.916666666667
          259.291666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Telephone No.:'
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
      object qrmAddress: TQRMemo
        Left = 67
        Top = 98
        Width = 255
        Height = 61
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          161.395833333333
          177.270833333333
          259.291666666667
          674.6875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlName: TQRLabel
        Left = 54
        Top = 77
        Width = 49
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          142.875
          203.729166666667
          129.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlName'
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
      object qrlTelephoneNo: TQRLabel
        Left = 110
        Top = 164
        Width = 90
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          291.041666666667
          433.916666666667
          238.125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlTelephoneNo'
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
      object QRShape1: TQRShape
        Left = 8
        Top = 240
        Width = 701
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.5208333333333
          21.1666666666667
          635
          1854.72916666667)
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel4: TQRLabel
        Left = 8
        Top = 252
        Width = 99
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          666.75
          261.9375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tag Numbers(s)'
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
      object QRLabel8: TQRLabel
        Left = 406
        Top = 106
        Width = 31
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1074.20833333333
          280.458333333333
          82.0208333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Visa:'
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
      object QRLabel9: TQRLabel
        Left = 406
        Top = 124
        Width = 70
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1074.20833333333
          328.083333333333
          185.208333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Mastercard:'
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
      object QRLabel10: TQRLabel
        Left = 406
        Top = 142
        Width = 62
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1074.20833333333
          375.708333333333
          164.041666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Lasercard:'
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
      object QRShape2: TQRShape
        Left = 489
        Top = 108
        Width = 17
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1293.8125
          285.75
          44.9791666666667)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 489
        Top = 126
        Width = 17
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1293.8125
          333.375
          44.9791666666667)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 489
        Top = 144
        Width = 17
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          1293.8125
          381
          44.9791666666667)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Left = 518
        Top = 106
        Width = 89
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1370.54166666667
          280.458333333333
          235.479166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Card Number:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 406
        Top = 174
        Width = 104
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1074.20833333333
          460.375
          275.166666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Card Expiry Date:'
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
      object QRLabel13: TQRLabel
        Left = 518
        Top = 148
        Width = 122
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1370.54166666667
          391.583333333333
          322.791666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Card Holder Name:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape6: TQRShape
        Left = 518
        Top = 165
        Width = 193
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.1458333333333
          1370.54166666667
          436.5625
          510.645833333333)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 518
        Top = 123
        Width = 193
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.1458333333333
          1370.54166666667
          325.4375
          510.645833333333)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = 406
        Top = 191
        Width = 100
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.1458333333333
          1074.20833333333
          505.354166666667
          264.583333333333)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel16: TQRLabel
        Left = 406
        Top = 82
        Width = 93
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1074.20833333333
          216.958333333333
          246.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Card Payment Only'
        Color = 14540253
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    inherited SubDetailBand: TQRSubDetail
      Top = 315
      Height = 24
      Font.Color = clBlack
      Size.Values = (
        63.5
        1899.70833333333)
      DataSet = mdReplacementTagListReview
      object QRDBText1: TQRDBText
        Left = 8
        Top = 4
        Width = 38
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
          100.541666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = mdReplacementTagListReview
        DataField = 'TagNo'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    inherited SummaryBand: TQRBand
      Top = 339
      Height = 316
      Size.Values = (
        836.083333333333
        1899.70833333333)
      object QRShape9: TQRShape [0]
        Left = 120
        Top = 55
        Width = 77
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.1458333333333
          317.5
          145.520833333333
          203.729166666667)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape7: TQRShape [1]
        Left = 120
        Top = 25
        Width = 77
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.1458333333333
          317.5
          66.1458333333333
          203.729166666667)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      inherited CountExpression: TQRExpr
        Left = 100
        Top = 218
        Enabled = False
        Size.Values = (
          44.9791666666667
          264.583333333333
          576.791666666667
          124.354166666667)
        Font.Color = clBlack
        FontSize = 10
      end
      inherited TotalLabel: TQRLabel
        Left = 56
        Top = 218
        Enabled = False
        Size.Values = (
          44.9791666666667
          148.166666666667
          576.791666666667
          108.479166666667)
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 22
        Top = 186
        Width = 60
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          58.2083333333333
          492.125
          158.75)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Signature:'
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
      object QRLabel7: TQRLabel
        Left = 326
        Top = 186
        Width = 32
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          862.541666666667
          492.125
          84.6666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date:'
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
      object QRSysData1: TQRSysData
        Left = 364
        Top = 186
        Width = 99
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          963.083333333333
          492.125
          261.9375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDate
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Date/Time:'
        Transparent = False
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 36
        Top = 29
        Width = 80
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          95.25
          76.7291666666667
          211.666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'No. of singles'
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
      object QRLabel15: TQRLabel
        Left = 36
        Top = 59
        Width = 71
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          95.25
          156.104166666667
          187.854166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'No. of pairs:'
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
      object qrlNoOfSingles: TQRLabel
        Left = 140
        Top = 29
        Width = 37
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          370.416666666667
          76.7291666666667
          97.8958333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0000000.00'
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
      object qrlNoOfPairs: TQRLabel
        Left = 140
        Top = 59
        Width = 37
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          370.416666666667
          156.104166666667
          97.8958333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '0000000.00'
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
      object QRLabel18: TQRLabel
        Left = 204
        Top = 29
        Width = 14
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          539.75
          76.7291666666667
          37.0416666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '@'
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
      object QRLabel20: TQRLabel
        Left = 204
        Top = 59
        Width = 14
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          539.75
          156.104166666667
          37.0416666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '@'
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
      object QRShape10: TQRShape
        Left = 224
        Top = 25
        Width = 77
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.1458333333333
          592.666666666667
          66.1458333333333
          203.729166666667)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape11: TQRShape
        Left = 224
        Top = 55
        Width = 77
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.1458333333333
          592.666666666667
          145.520833333333
          203.729166666667)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlSingleCost: TQRLabel
        Left = 228
        Top = 29
        Width = 68
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          603.25
          76.7291666666667
          179.916666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0000000.00'
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
      object qrlPairCost: TQRLabel
        Left = 228
        Top = 59
        Width = 68
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          603.25
          156.104166666667
          179.916666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0000000.00'
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
      object QRLabel23: TQRLabel
        Left = 311
        Top = 31
        Width = 41
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          822.854166666667
          82.0208333333333
          108.479166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'each ='
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
      object QRLabel24: TQRLabel
        Left = 311
        Top = 59
        Width = 41
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          822.854166666667
          156.104166666667
          108.479166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'each ='
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
      object QRShape12: TQRShape
        Left = 358
        Top = 25
        Width = 77
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.1458333333333
          947.208333333333
          66.1458333333333
          203.729166666667)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape13: TQRShape
        Left = 358
        Top = 55
        Width = 77
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.1458333333333
          947.208333333333
          145.520833333333
          203.729166666667)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlSingleTotal: TQRLabel
        Left = 362
        Top = 29
        Width = 68
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          957.791666666667
          76.7291666666667
          179.916666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0000000.00'
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
      object qrlPairTotal: TQRLabel
        Left = 362
        Top = 59
        Width = 68
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          957.791666666667
          156.104166666667
          179.916666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0000000.00'
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
      object QRShape14: TQRShape
        Left = 358
        Top = 85
        Width = 77
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.1458333333333
          947.208333333333
          224.895833333333
          203.729166666667)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 358
        Top = 115
        Width = 77
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.1458333333333
          947.208333333333
          304.270833333333
          203.729166666667)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel27: TQRLabel
        Left = 264
        Top = 89
        Width = 87
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          698.5
          235.479166666667
          230.1875)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Plus P && P ='
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
      object QRLabel28: TQRLabel
        Left = 295
        Top = 119
        Width = 56
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          780.520833333333
          314.854166666667
          148.166666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Due'
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
      object qrlPostAndPackage: TQRLabel
        Left = 362
        Top = 89
        Width = 68
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          957.791666666667
          235.479166666667
          179.916666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0000000.00'
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
      object qrlTotalDue: TQRLabel
        Left = 362
        Top = 119
        Width = 68
        Height = 17
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          957.791666666667
          314.854166666667
          179.916666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '0000000.00'
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
      object QRShape16: TQRShape
        Left = 6
        Top = 251
        Width = 701
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.5208333333333
          15.875
          664.104166666667
          1854.72916666667)
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape17: TQRShape
        Left = 10
        Top = 156
        Width = 701
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.5208333333333
          26.4583333333333
          412.75
          1854.72916666667)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel5: TQRLabel
        Left = 4
        Top = 269
        Width = 714
        Height = 42
        Frame.Color = clNavy
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          111.125
          10.5833333333333
          711.729166666667
          1889.125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          'Please return with Payment to: Eurotags, Mullinahone Co-op, Mull' +
          'inahone, Co. Tipperary. Tel: 052-(91)53102,                 Fax:' +
          ' 052-(91)53512, Email: eurotags@mull-coop.ie. All tag prices inc' +
          'lude VAT @ 23%.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRLabel5Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    inherited PageFooterBand: TQRBand
      Top = 655
      Height = 46
      Size.Values = (
        121.708333333333
        1899.70833333333)
      inherited CompanyNameLabel: TQRLabel
        Width = 398
        Size.Values = (
          44.9791666666667
          21.1666666666667
          21.1666666666667
          1053.04166666667)
        Caption = 'Generated by Kingswood Herd - Farm Recording Made Easy.'
        Font.Color = clBlack
        ParentFont = False
        FontSize = 10
      end
      inherited ProgramVersionLabel: TQRLabel
        Size.Values = (
          44.9791666666667
          1365.25
          21.1666666666667
          513.291666666667)
        Font.Color = clBlack
        ParentFont = False
        FontSize = 10
      end
      object QRLabel17: TQRLabel
        Left = 8
        Top = 24
        Width = 183
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          63.5
          484.1875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tel. No.: 00 353 1 4596677'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
  object cbFavourite: TcxCheckBox [4]
    Left = 30
    Top = 55
    AutoSize = False
    Caption = 'Add Report As Favourite'
    Properties.OnChange = cbFavouritePropertiesChange
    TabOrder = 4
    Height = 23
    Width = 188
  end
  inherited GenQuery: TQuery
    SQL.Strings = (
      'select * from animals where NatIDNum <> '#39#39
      'And Inherd=True'
      'And AnimalDeleted=False')
    Left = 556
    Top = 152
  end
  object mdReplacementTagList: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F0400000014000000010006005461674E6F00040000
      000300040051747900040000000300070048657264494400080000000B000A00
      4F726465724461746500}
    SortOptions = []
    SortedField = 'SortNatID'
    OnNewRecord = mdReplacementTagListNewRecord
    Left = 556
    Top = 208
    object mdReplacementTagListTagNo: TStringField
      FieldName = 'TagNo'
    end
    object mdReplacementTagListSortNatID: TStringField
      FieldName = 'SortNatID'
    end
    object mdReplacementTagListQty: TIntegerField
      FieldName = 'Qty'
    end
    object mdReplacementTagListHerdID: TIntegerField
      FieldName = 'HerdID'
    end
    object mdReplacementTagListOrderDate: TDateTimeField
      FieldName = 'OrderDate'
    end
  end
  object dsmdReplacementTagList: TDataSource
    DataSet = mdReplacementTagList
    Left = 556
    Top = 238
  end
  object mdReplacementTagListReview: TdxMemData
    Indexes = <>
    SortOptions = []
    SortedField = 'SortNatID'
    Left = 556
    Top = 180
    object StringField1: TStringField
      FieldName = 'TagNo'
    end
    object mdReplacementTagListReviewSortNatID: TStringField
      FieldName = 'SortNatID'
    end
    object IntegerField1: TIntegerField
      FieldName = 'Qty'
    end
    object IntegerField2: TIntegerField
      FieldName = 'HerdID'
    end
  end
end
