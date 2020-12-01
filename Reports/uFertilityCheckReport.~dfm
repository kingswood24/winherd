inherited fmFertilityCheckReport: TfmFertilityCheckReport
  Left = 510
  Top = 192
  Caption = 'Fertillity Check Report'
  ClientHeight = 435
  ClientWidth = 581
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited ToolBar1: TToolBar
    Width = 581
  end
  inherited GroupBox1: TGroupBox
    Left = 31
    Top = 82
    Caption = 'Fertillity Check Report'
    inherited LFromDate: TLabel
      Left = 70
      Top = 32
    end
    inherited LToDate: TLabel
      Left = 284
      Top = 32
    end
    inherited lWaitCaption: TLabel
      Left = 220
      Top = 156
    end
    object Label1: TLabel [3]
      Left = 70
      Top = 80
      Width = 44
      Height = 16
      Caption = 'Status'
    end
    object Label2: TLabel [4]
      Left = 70
      Top = 117
      Width = 42
      Height = 16
      Caption = 'Action'
    end
    inherited FromDate: TDateEdit
      Left = 155
      Top = 28
    end
    inherited ToDate: TDateEdit
      Left = 311
      Top = 28
    end
    inherited rgSortBy: TRadioGroup
      Left = 139
      Top = 218
      Width = 243
      Height = 105
      Caption = 'Sort By:'
      Columns = 2
      Items.Strings = (
        '&Animal No.'
        '&Nat. Id. No.'
        'Date Of &Birth'
        '&Even&t Date'
        '&Status'
        'A&ction')
    end
    inherited rgSortOrder: TRadioGroup
      Left = 392
      Top = 218
      Width = 116
      Height = 105
      Caption = 'Sort Order:'
    end
    inherited ProgBar: TProgressBar
      Left = 68
    end
    inherited cbUseFilter: TCheckBox
      Left = 320
      Width = 199
      Visible = False
    end
    object cmboFertilityStatus: TcxComboBox
      Left = 155
      Top = 78
      Properties.DropDownListStyle = lsFixedList
      Properties.ItemHeight = 21
      Style.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.Kind = lfStandard
      TabOrder = 7
      Width = 266
    end
    object cmboFertilityAction: TcxComboBox
      Left = 155
      Top = 115
      Properties.DropDownListStyle = lsFixedList
      Properties.ImmediatePost = True
      Properties.ItemHeight = 21
      Style.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.Kind = lfStandard
      TabOrder = 8
      Width = 266
    end
    object rgShow: TRadioGroup
      Left = 10
      Top = 218
      Width = 122
      Height = 106
      Caption = 'Show:'
      ItemIndex = 0
      Items.Strings = (
        '&Animal No.'
        '&Nat. Id. No.')
      TabOrder = 9
    end
  end
  inherited BaseReport: TQuickRep
    Left = 598
    Top = 70
    DataSet = GenQuery
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
      Height = 147
      Size.Values = (
        388.9375
        1899.70833333333)
      inherited ReportTitle: TQRLabel
        Size.Values = (
          92.6041666666667
          21.1666666666667
          21.1666666666667
          373.0625)
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
        Left = 402
        Size.Values = (
          44.9791666666667
          1063.625
          21.1666666666667
          145.520833333333)
        FontSize = 10
      end
      inherited qrlSortOrder: TQRLabel
        Left = 402
        Size.Values = (
          44.9791666666667
          1063.625
          63.5
          187.854166666667)
        FontSize = 10
      end
      inherited QRLabel32: TQRLabel
        Left = 346
        Size.Values = (
          44.9791666666667
          915.458333333333
          21.1666666666667
          134.9375)
        FontSize = 10
      end
      inherited QRLabel34: TQRLabel
        Left = 326
        Size.Values = (
          44.9791666666667
          862.541666666667
          63.5
          187.854166666667)
        FontSize = 10
      end
      inherited QRLabel19: TQRLabel
        Size.Values = (
          44.9791666666667
          21.1666666666667
          127
          227.541666666667)
        FontSize = 10
      end
      inherited qrlHerdIdentity: TQRLabel
        Size.Values = (
          44.9791666666667
          264.583333333333
          127
          142.875)
        FontSize = 10
      end
      object qrlAnimalNoNatID: TQRLabel
        Left = 3
        Top = 126
        Width = 57
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          7.9375
          333.375
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
        Left = 103
        Top = 126
        Width = 68
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          272.520833333333
          333.375
          179.916666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
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
        Left = 178
        Top = 126
        Width = 44
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          470.958333333333
          333.375
          116.416666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Lact No.'
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
        Left = 238
        Top = 126
        Width = 58
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          629.708333333333
          333.375
          153.458333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Event Date'
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
        Left = 302
        Top = 126
        Width = 36
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          799.041666666667
          333.375
          95.25)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Status'
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
        Left = 349
        Top = 126
        Width = 36
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          923.395833333333
          333.375
          95.25)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Action'
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
        Left = 434
        Top = 126
        Width = 49
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1148.29166666667
          333.375
          129.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Program'
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
        Left = 646
        Top = 126
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1709.20833333333
          333.375
          140.229166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PD Status'
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
      object QRLabel1: TQRLabel
        Left = 612
        Top = 101
        Width = 51
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1619.25
          267.229166666667
          134.9375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PD Event'
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
        Left = 582
        Top = 126
        Width = 58
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1539.875
          333.375
          153.458333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Event Date'
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
        Left = 344
        Top = 101
        Width = 115
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          910.166666666667
          267.229166666667
          304.270833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fertility Check Event'
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
      object QRShape1: TQRShape
        Left = 581
        Top = 117
        Width = 117
        Height = 5
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          13.2291666666667
          1537.22916666667
          309.5625
          309.5625)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 238
        Top = 117
        Width = 331
        Height = 5
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          13.2291666666667
          629.708333333333
          309.5625
          875.770833333333)
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    inherited SubDetailBand: TQRSubDetail
      Top = 185
      Height = 19
      BeforePrint = nil
      Size.Values = (
        50.2708333333333
        1899.70833333333)
      DataSet = GenQuery
      object qrdbAnimalNoNatID: TQRDBText
        Left = 3
        Top = 3
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          7.9375
          7.9375
          121.708333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'NatIdNum'
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
      object QRDBText3: TQRDBText
        Left = 103
        Top = 3
        Width = 57
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          272.520833333333
          7.9375
          150.8125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'DateOfBirth'
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
      object QRDBText4: TQRDBText
        Left = 178
        Top = 3
        Width = 25
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          470.958333333333
          7.9375
          66.1458333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'LactNo'
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
      object QRDBText5: TQRDBText
        Left = 238
        Top = 3
        Width = 50
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          629.708333333333
          7.9375
          132.291666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'EventDate'
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
      object QRDBText6: TQRDBText
        Left = 302
        Top = 3
        Width = 32
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          799.041666666667
          7.9375
          84.6666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'Status'
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
      object QRDBText7: TQRDBText
        Left = 349
        Top = 3
        Width = 32
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          923.395833333333
          7.9375
          84.6666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'Action'
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
      object QRDBText8: TQRDBText
        Left = 434
        Top = 3
        Width = 60
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1148.29166666667
          7.9375
          158.75)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'FertProgram'
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
      object QRDBText9: TQRDBText
        Left = 646
        Top = 1
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1709.20833333333
          2.64583333333333
          119.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'PDStatus'
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
      object QRDBText1: TQRDBText
        Left = 582
        Top = 1
        Width = 63
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1539.875
          2.64583333333333
          166.6875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'PDEventDate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText1Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    inherited SummaryBand: TQRBand
      Top = 204
      Size.Values = (
        148.166666666667
        1899.70833333333)
      inherited CountExpression: TQRExpr
        Size.Values = (
          44.9791666666667
          158.75
          63.5
          124.354166666667)
        FontSize = 10
      end
      inherited TotalLabel: TQRLabel
        Size.Values = (
          44.9791666666667
          42.3333333333333
          63.5
          108.479166666667)
        FontSize = 10
      end
    end
    inherited PageFooterBand: TQRBand
      Top = 260
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
    Left = 29
    Top = 54
    AutoSize = False
    Caption = 'Add Report As Favourite'
    Properties.OnChange = cbFavouritePropertiesChange
    TabOrder = 3
    Height = 23
    Width = 213
  end
  inherited GenQuery: TQuery
    Left = 0
    Top = 97
  end
end
