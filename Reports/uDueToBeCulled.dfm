inherited fmDueToBeCulled: TfmDueToBeCulled
  Left = 270
  Top = 211
  Caption = 'Due to be Culled'
  ClientHeight = 359
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 16
  inherited ToolBar1: TToolBar
    inherited sbView: TRxSpeedButton
      Font.Color = 1979867
      Font.Style = [fsBold]
      ParentFont = False
      OnMouseLeave = sbViewMouseLeave
    end
  end
  inherited GroupBox1: TGroupBox
    Left = 34
    Top = 81
    Height = 253
    Caption = 'Filter Options'
    inherited LFromDate: TLabel
      Left = 55
      Top = 44
    end
    inherited LToDate: TLabel
      Left = 315
      Top = 44
    end
    inherited lWaitCaption: TLabel
      Left = 214
      Top = 112
    end
    inherited FromDate: TDateEdit
      Left = 137
      Top = 40
    end
    inherited ToDate: TDateEdit
      Left = 343
      Top = 40
    end
    inherited rgSortBy: TRadioGroup
      Left = 54
      Top = 140
    end
    inherited rgSortOrder: TRadioGroup
      Left = 270
      Top = 140
    end
    inherited ProgBar: TProgressBar
      Left = 62
      Top = 80
      Width = 397
    end
    inherited cbUseFilter: TCheckBox
      Left = 330
      Top = 14
      Width = 181
    end
    inherited cbDichromatic: TCheckBox
      Left = 404
      Top = 232
      Visible = False
    end
  end
  inherited BaseReport: TQuickRep
    Left = 92
    Top = 360
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
    ReportTitle = 'Due To Be Culled'
    inherited PageHeaderBand: TQRBand
      Size.Values = (
        325.4375
        1899.70833333333)
      inherited ReportTitle: TQRLabel
        Width = 211
        Size.Values = (
          92.6041666666667
          21.1666666666667
          21.1666666666667
          558.270833333333)
        Caption = 'Due To Be Culled'
        Font.Style = [fsItalic, fsUnderline]
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
        Left = 328
        Size.Values = (
          44.9791666666667
          867.833333333333
          21.1666666666667
          145.520833333333)
        FontSize = 10
      end
      inherited qrlSortOrder: TQRLabel
        Left = 328
        Size.Values = (
          44.9791666666667
          867.833333333333
          63.5
          187.854166666667)
        FontSize = 10
      end
      inherited QRLabel32: TQRLabel
        Left = 272
        Size.Values = (
          44.9791666666667
          719.666666666667
          21.1666666666667
          134.9375)
        FontSize = 10
      end
      inherited QRLabel34: TQRLabel
        Left = 252
        Size.Values = (
          44.9791666666667
          666.75
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
      object QRLabel1: TQRLabel
        Left = 10
        Top = 103
        Width = 71
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          26.4583333333333
          272.520833333333
          187.854166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Animal No.'
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
        Left = 118
        Top = 103
        Width = 71
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          312.208333333333
          272.520833333333
          187.854166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nat. Id. No.'
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
        Left = 261
        Top = 103
        Width = 82
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          690.5625
          272.520833333333
          216.958333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date Of Birth'
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
        Left = 452
        Top = 103
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1195.91666666667
          272.520833333333
          156.104166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cull Date'
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
        Left = 544
        Top = 103
        Width = 62
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1439.33333333333
          272.520833333333
          164.041666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Comment'
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
      object QRLabel6: TQRLabel
        Left = 366
        Top = 103
        Width = 57
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          968.375
          272.520833333333
          150.8125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Lact. No.'
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
    end
    inherited SubDetailBand: TQRSubDetail
      Height = 22
      Size.Values = (
        58.2083333333333
        1899.70833333333)
      DataSet = GenQuery
      PrintIfEmpty = False
      object QRDBText1: TQRDBText
        Left = 10
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
          26.4583333333333
          7.9375
          150.8125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'AnimalNo'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 450
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
          1190.625
          7.9375
          158.75)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'EventDate'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 260
        Top = 3
        Width = 68
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          687.916666666667
          7.9375
          179.916666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'DateOfBirth'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 118
        Top = 3
        Width = 58
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          312.208333333333
          7.9375
          153.458333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'NatIdNum'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 542
        Top = 3
        Width = 63
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1434.04166666667
          7.9375
          166.6875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'EventDesc'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText6: TQRDBText
        Left = 377
        Top = 3
        Width = 42
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
          111.125)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GenQuery
        DataField = 'LactNo'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    inherited SummaryBand: TQRBand
      Top = 183
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
      Top = 239
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
  inherited GenQuery: TQuery
    SQL.Strings = (
      
        'Select A.ID, A.AnimalNo, A.SortAnimalNo, A.NatIdNum, A.SortNatID' +
        ', A.DateOfBirth, E.EventDate, E.EventDesc From Animals A'
      'Left Join Events E On (E.AnimalID=A.ID)'
      'Where (E.EventType = 24)'
      'And (A.InHerd=True)'
      'And (A.AnimalDeleted = False)'
      'And (A.HerdID=:AHerdID)'
      'And (E.EventDate Between :AFromDate AND :AToDate)')
    Left = 514
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AHerdID'
        ParamType = ptUnknown
        Value = 3
      end
      item
        DataType = ftDateTime
        Name = 'AFromDate'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'AToDate'
        ParamType = ptUnknown
      end>
  end
end
