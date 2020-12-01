inherited DairyHerdHealthCert: TDairyHerdHealthCert
  Left = 291
  Top = 245
  Caption = 'Dairy Herd Health Cert.'
  ClientHeight = 285
  ClientWidth = 515
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited ToolBar1: TToolBar
    Width = 515
    inherited sbView: TRxSpeedButton
      Font.Color = 1979867
      Font.Style = [fsBold]
      ParentFont = False
      OnMouseLeave = sbViewMouseLeave
    end
  end
  inherited GroupBox1: TGroupBox
    Left = 27
    Width = 464
    Height = 178
    Caption = 'Sort Options'
    inherited LFromDate: TLabel
      Left = 24
      Top = 66
      Visible = False
    end
    inherited LToDate: TLabel
      Left = 284
      Top = 66
      Visible = False
    end
    inherited lWaitCaption: TLabel
      Top = 237
    end
    inherited FromDate: TDateEdit
      Left = 106
      Top = 62
      Visible = False
    end
    inherited ToDate: TDateEdit
      Left = 314
      Top = 76
      Visible = False
    end
    inherited rgSortBy: TRadioGroup
      Left = 29
      Top = 44
    end
    inherited rgSortOrder: TRadioGroup
      Top = 44
    end
    inherited ProgBar: TProgressBar
      Top = 205
    end
    inherited cbUseFilter: TCheckBox
      Left = 244
      Top = 13
      Width = 179
    end
    inherited cbDichromatic: TCheckBox
      Left = 314
      Top = 181
      Visible = False
    end
  end
  inherited BaseReport: TQuickRep
    Left = 96
    Top = 314
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
      Height = 171
      Size.Values = (
        452.4375
        1899.70833333333)
      inherited ReportTitle: TQRLabel
        Top = 4
        Width = 564
        Size.Values = (
          92.6041666666667
          21.1666666666667
          10.5833333333333
          1492.25)
        Caption = 'Inspection of Cows Under Regulation 9 853/2004'
        Font.Height = -27
        Font.Style = [fsBold, fsItalic]
        FontSize = 20
      end
      inherited DateTimeLabel: TQRSysData
        Left = 575
        Top = 42
        Size.Values = (
          44.9791666666667
          1521.35416666667
          111.125
          346.604166666667)
        FontSize = 10
      end
      inherited PageNumLabel: TQRSysData
        Left = 627
        Top = 61
        Width = 81
        Size.Values = (
          44.9791666666667
          1658.9375
          161.395833333333
          214.3125)
        Font.Charset = ANSI_CHARSET
        Font.Height = -11
        Font.Name = 'Verdana'
        ParentFont = False
        FontSize = 8
      end
      inherited qrlSortBy: TQRLabel
        Left = 63
        Top = 88
        Width = 39
        Size.Values = (
          44.9791666666667
          166.6875
          232.833333333333
          103.1875)
        Caption = 'Empty'
        FontSize = 10
      end
      inherited qrlSortOrder: TQRLabel
        Left = 85
        Top = 106
        Width = 39
        Size.Values = (
          44.9791666666667
          224.895833333333
          280.458333333333
          103.1875)
        Caption = 'Empty'
        FontSize = 10
      end
      inherited QRLabel32: TQRLabel
        Left = 8
        Top = 88
        Width = 55
        Size.Values = (
          44.9791666666667
          21.1666666666667
          232.833333333333
          145.520833333333)
        Font.Charset = ANSI_CHARSET
        Font.Height = -12
        Font.Name = 'Verdana'
        FontSize = 9
      end
      inherited QRLabel34: TQRLabel
        Left = 8
        Top = 106
        Width = 77
        Size.Values = (
          44.9791666666667
          21.1666666666667
          280.458333333333
          203.729166666667)
        Font.Charset = ANSI_CHARSET
        Font.Height = -12
        Font.Name = 'Verdana'
        FontSize = 9
      end
      inherited QRLabel19: TQRLabel
        Top = 42
        Width = 94
        Size.Values = (
          44.9791666666667
          21.1666666666667
          111.125
          248.708333333333)
        Font.Charset = ANSI_CHARSET
        Font.Height = -12
        Font.Name = 'Verdana'
        FontSize = 9
      end
      object QRLabel13: TQRLabel [8]
        Left = 8
        Top = 61
        Width = 228
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          161.395833333333
          603.25)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Name & Address of Dairy Farmer: '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object lOwnerName: TQRLabel [9]
        Left = 233
        Top = 61
        Width = 39
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          616.479166666667
          161.395833333333
          103.1875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Empty'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel2: TQRLabel [10]
        Left = 136
        Top = 152
        Width = 169
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          359.833333333333
          402.166666666667
          447.145833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'National Identity Number'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel [11]
        Left = 16
        Top = 152
        Width = 105
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          42.3333333333333
          402.166666666667
          277.8125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Animal Number'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel6: TQRLabel [12]
        Left = 327
        Top = 153
        Width = 121
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          865.1875
          404.8125
          320.145833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Date Of Birth'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      inherited qrlHerdIdentity: TQRLabel
        Left = 102
        Top = 42
        Width = 39
        Size.Values = (
          44.9791666666667
          269.875
          111.125
          103.1875)
        Caption = 'Empty'
        FontSize = 10
      end
      object qrlFilteredDate: TQRLabel
        Left = 641
        Top = 42
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1695.97916666667
          111.125
          174.625)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date/Time:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    inherited SubDetailBand: TQRSubDetail
      Top = 209
      Height = 20
      Size.Values = (
        52.9166666666667
        1899.70833333333)
      DataSet = GenQuery
      object QRDBText2: TQRDBText
        Left = 16
        Top = 2
        Width = 60
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          42.3333333333333
          5.29166666666667
          158.75)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'AnimalNo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText1: TQRDBText
        Left = 136
        Top = 2
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          359.833333333333
          5.29166666666667
          174.625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'NatIDNum'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 327
        Top = 2
        Width = 77
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          865.1875
          5.29166666666667
          203.729166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'DateOfBirth'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    inherited SummaryBand: TQRBand
      Top = 229
      Height = 125
      Size.Values = (
        330.729166666667
        1899.70833333333)
      inherited CountExpression: TQRExpr
        Left = 100
        Size.Values = (
          44.9791666666667
          264.583333333333
          63.5
          124.354166666667)
        FontSize = 10
      end
      inherited TotalLabel: TQRLabel
        Width = 81
        Size.Values = (
          44.9791666666667
          42.3333333333333
          63.5
          214.3125)
        Caption = 'Total Cows:'
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 100
        Top = 56
        Width = 60
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          264.583333333333
          148.166666666667
          158.75)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SIGNED:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel11: TQRLabel
        Left = 436
        Top = 56
        Width = 110
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1153.58333333333
          148.166666666667
          291.041666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(Dairy Farmer)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape3: TQRShape
        Left = 155
        Top = 62
        Width = 279
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          410.104166666667
          164.041666666667
          738.1875)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel12: TQRLabel
        Left = 228
        Top = 88
        Width = 40
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          603.25
          232.833333333333
          105.833333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape4: TQRShape
        Left = 264
        Top = 96
        Width = 135
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          698.5
          254
          357.1875)
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    inherited PageFooterBand: TQRBand
      Top = 354
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
    Left = 23
    Top = 54
    AutoSize = False
    Caption = 'Add Report As Favourite'
    Properties.OnChange = cbFavouritePropertiesChange
    TabOrder = 3
    Height = 23
    Width = 213
  end
  inherited QRTextFilter1: TQRTextFilter
    Top = 110
  end
  inherited QRCSVFilter1: TQRCSVFilter
    Top = 142
  end
  inherited QRHTMLFilter1: TQRHTMLFilter
    Top = 174
  end
  inherited QRExcelFilter1: TQRExcelFilter
    Top = 206
  end
  inherited QRRTFFilter1: TQRRTFFilter
    Top = 238
  end
  inherited GenQuery: TQuery
    SQL.Strings = (
      
        'SELECT Distinct(A.ID), A.NatIDNum, A.SortNatID, A.AnimalNo A.Dat' +
        'eOfBirth FROM Animals A WHERE (A.Sex = "Female") AND (A.InHerd=T' +
        'RUE) AND (A.LactNo>0) AND (A.AnimalDeleted=FALSE) AND (A.HerdID ' +
        '= :AHerdID) ORDER By %s %s')
    Left = 0
    Top = 78
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AHerdID'
        ParamType = ptUnknown
      end>
  end
end
