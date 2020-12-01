inherited fmFertilityTreatmentsReport: TfmFertilityTreatmentsReport
  Left = 475
  Top = 225
  Caption = 'Veterinary '#39'Due To'#39' List'
  ClientHeight = 391
  ClientWidth = 577
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited ToolBar1: TToolBar
    Width = 577
  end
  inherited GroupBox1: TGroupBox
    Width = 509
    Height = 285
    Caption = 'Filter Options'
    inherited LFromDate: TLabel
      Left = 56
      Top = 59
      Width = 87
      Caption = 'Due Between'
    end
    inherited LToDate: TLabel
      Left = 297
      Top = 59
      Width = 25
      Caption = 'And'
    end
    inherited lWaitCaption: TLabel
      Left = 214
      Top = 284
      Visible = False
    end
    object Label1: TLabel [3]
      Left = 56
      Top = 102
      Width = 98
      Height = 16
      Caption = 'Treatment Due'
    end
    inherited FromDate: TDateEdit
      Left = 164
      Top = 59
    end
    inherited ToDate: TDateEdit
      Left = 333
      Top = 59
    end
    inherited rgSortBy: TRadioGroup
      Left = 52
      Top = 144
      Width = 207
      Height = 115
      Items.Strings = (
        '&Animal Number'
        '&National Identity Number'
        '&Event Date'
        '&Treatment'
        '&Due Date')
    end
    inherited rgSortOrder: TRadioGroup
      Left = 266
      Top = 144
      Height = 115
    end
    inherited ProgBar: TProgressBar
      Left = 58
      Top = 288
      Visible = False
    end
    inherited cbUseFilter: TCheckBox
      Left = 56
      Top = 24
      Width = 175
    end
    inherited cbDichromatic: TCheckBox
      Left = 402
      Top = 132
    end
    object LookupReminders: TcxLookupComboBox
      Left = 164
      Top = 100
      RepositoryItem = HerdLookup.erLookupHealthReminder
      Properties.ListColumns = <>
      Style.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.Kind = lfStandard
      TabOrder = 7
      Width = 281
    end
  end
  inherited BaseReport: TQuickRep
    Left = 170
    Top = 466
    Width = 1123
    Height = 794
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
    ReportTitle = 'Fertility Treatment Action List'
    inherited PageHeaderBand: TQRBand
      Width = 1047
      Height = 167
      Size.Values = (
        441.854166666667
        2770.1875)
      inherited ReportTitle: TQRLabel
        Left = 5
        Top = 3
        Width = 283
        Size.Values = (
          92.6041666666667
          13.2291666666667
          7.9375
          748.770833333333)
        Caption = 'Veterinary '#39'Due To'#39' List'
        FontSize = 22
      end
      inherited DateTimeLabel: TQRSysData
        Left = 910
        Top = 10
        Size.Values = (
          44.9791666666667
          2407.70833333333
          26.4583333333333
          346.604166666667)
        FontSize = 10
      end
      inherited PageNumLabel: TQRSysData
        Left = 961
        Top = 29
        Size.Values = (
          44.9791666666667
          2542.64583333333
          76.7291666666667
          211.666666666667)
        FontSize = 10
      end
      inherited qrlSortBy: TQRLabel
        Left = 270
        Top = 58
        Height = 35
        Size.Values = (
          92.6041666666667
          714.375
          153.458333333333
          145.520833333333)
        FontSize = 10
      end
      inherited qrlSortOrder: TQRLabel
        Left = 270
        Top = 75
        Height = 35
        Size.Values = (
          92.6041666666667
          714.375
          198.4375
          187.854166666667)
        FontSize = 10
      end
      inherited QRLabel32: TQRLabel
        Left = 214
        Top = 58
        Size.Values = (
          44.9791666666667
          566.208333333333
          153.458333333333
          134.9375)
        FontSize = 10
      end
      inherited QRLabel34: TQRLabel
        Left = 194
        Top = 74
        Size.Values = (
          44.9791666666667
          513.291666666667
          195.791666666667
          187.854166666667)
        FontSize = 10
      end
      inherited QRLabel19: TQRLabel
        Left = 6
        Top = 58
        Size.Values = (
          44.9791666666667
          15.875
          153.458333333333
          227.541666666667)
        FontSize = 10
      end
      inherited qrlHerdIdentity: TQRLabel
        Left = 98
        Top = 58
        Size.Values = (
          44.9791666666667
          259.291666666667
          153.458333333333
          142.875)
        FontSize = 10
      end
      object QRShape2: TQRShape
        Left = 0
        Top = 120
        Width = 1047
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.3958333333333
          0
          317.5
          2770.1875)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel8: TQRLabel
        Left = 56
        Top = 134
        Width = 57
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.0208333333333
          148.166666666667
          354.541666666667
          150.8125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Tag Number'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel9: TQRLabel
        Left = 161
        Top = 134
        Width = 33
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          425.979166666667
          354.541666666667
          87.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel12: TQRLabel
        Left = 216
        Top = 134
        Width = 75
        Height = 29
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          76.7291666666667
          571.5
          354.541666666667
          198.4375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Program'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel17: TQRLabel
        Left = 923
        Top = 134
        Width = 50
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.0208333333333
          2442.10416666667
          354.541666666667
          132.291666666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Admin. By'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel18: TQRLabel
        Left = 4
        Top = 134
        Width = 48
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.0208333333333
          10.5833333333333
          354.541666666667
          127)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Animal No'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel20: TQRLabel
        Left = 377
        Top = 134
        Width = 56
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          997.479166666667
          354.541666666667
          148.166666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Comment'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object lDueType: TQRLabel
        Left = 609
        Top = 134
        Width = 88
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1611.3125
          354.541666666667
          232.833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Treatment Due '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel22: TQRLabel
        Left = 841
        Top = 134
        Width = 52
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          2225.14583333333
          354.541666666667
          137.583333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Due Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape3: TQRShape
        Left = 7
        Top = 46
        Width = 1034
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.1666666666667
          18.5208333333333
          121.708333333333
          2735.79166666667)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object lVaccine: TQRLabel
        Left = 311
        Top = 134
        Width = 54
        Height = 29
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          76.7291666666667
          822.854166666667
          354.541666666667
          142.875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Vaccine'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    inherited SubDetailBand: TQRSubDetail
      Top = 205
      Width = 1047
      Height = 20
      Size.Values = (
        52.9166666666667
        2770.1875)
      DataSet = mdFertilityData
      object QRDBText4: TQRDBText
        Left = 56
        Top = 3
        Width = 47
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          148.166666666667
          7.9375
          124.354166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = mdFertilityData
        DataField = 'NatIDNum'
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
        Left = 161
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
          425.979166666667
          7.9375
          132.291666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        DataSet = mdFertilityData
        DataField = 'EventDate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Mask = 'dd/mm/yy'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 216
        Top = 3
        Width = 56
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          571.5
          7.9375
          148.166666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = mdFertilityData
        DataField = 'HealthDesc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText7Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText9: TQRDBText
        Left = 924
        Top = 3
        Width = 44
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2444.75
          7.9375
          116.416666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        DataSet = mdFertilityData
        DataField = 'AdminBy'
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
      object QRDBText11: TQRDBText
        Left = 4
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
          10.5833333333333
          7.9375
          121.708333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = mdFertilityData
        DataField = 'AnimalNo'
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
      object QRDBText12: TQRDBText
        Left = 377
        Top = 3
        Width = 220
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          997.479166666667
          7.9375
          582.083333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = mdFertilityData
        DataField = 'EventDesc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText12Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText13: TQRDBText
        Left = 609
        Top = 3
        Width = 220
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1611.3125
          7.9375
          582.083333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = mdFertilityData
        DataField = 'ReminderDesc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText13Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText1: TQRDBText
        Left = 841
        Top = 3
        Width = 76
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2225.14583333333
          7.9375
          201.083333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = mdFertilityData
        DataField = 'EventDate'
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
      object qrdbVaccine: TQRDBText
        Left = 311
        Top = 3
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          822.854166666667
          7.9375
          108.479166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = mdFertilityData
        DataField = 'Vaccine'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText7Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    inherited SummaryBand: TQRBand
      Top = 225
      Width = 1047
      Size.Values = (
        148.166666666667
        2770.1875)
      inherited CountExpression: TQRExpr
        Top = 14
        Size.Values = (
          44.9791666666667
          158.75
          37.0416666666667
          124.354166666667)
        FontSize = 10
      end
      inherited TotalLabel: TQRLabel
        Top = 14
        Size.Values = (
          44.9791666666667
          42.3333333333333
          37.0416666666667
          108.479166666667)
        FontSize = 10
      end
    end
    inherited PageFooterBand: TQRBand
      Top = 281
      Width = 1047
      Size.Values = (
        76.7291666666667
        2770.1875)
      inherited CompanyNameLabel: TQRLabel
        Size.Values = (
          44.9791666666667
          21.1666666666667
          21.1666666666667
          463.020833333333)
        FontSize = 10
      end
      inherited ProgramVersionLabel: TQRLabel
        Left = 848
        Top = 4
        Size.Values = (
          44.9791666666667
          2243.66666666667
          10.5833333333333
          513.291666666667)
        FontSize = 10
      end
    end
  end
  object cbFavourite: TcxCheckBox [3]
    Left = 29
    Top = 55
    AutoSize = False
    Caption = 'Add Report As Favourite'
    Properties.OnChange = cbFavouritePropertiesChange
    TabOrder = 3
    Height = 23
    Width = 213
  end
  inherited GenQuery: TQuery
    Left = 544
    Top = 100
  end
  object mdFertilityData: TdxMemData
    Indexes = <>
    Persistent.Data = {5665728FC2F5285C8FFE3F00000000}
    SortOptions = [soCaseInsensitive]
    Left = 544
    Top = 134
    object mdFertilityDatasd: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'sd'
      Calculated = True
    end
  end
end
