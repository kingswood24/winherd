inherited fmCalvingEvent: TfmCalvingEvent
  Left = 546
  Top = 122
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'Calving'
  ClientHeight = 705
  ClientWidth = 776
  Font.Height = -13
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 17
  inherited StatusBar: TdxStatusBar
    Top = 685
    Width = 776
  end
  object pCalvingHeader: TPanel [1]
    Left = 0
    Top = 49
    Width = 776
    Height = 218
    Align = alTop
    TabOrder = 0
    object lAnimalNoNatIDNo: TcxLabel
      Left = 15
      Top = 36
      AutoSize = False
      Caption = 'Dam Nat ID Num.:'
      Height = 21
      Width = 107
    end
    object lCalvingDate: TcxLabel
      Left = 15
      Top = 72
      Caption = 'Calving Date:'
    end
    object lBullUsed: TcxLabel
      Left = 15
      Top = 108
      Caption = 'Bull Used:'
    end
    object lGeneticDam: TcxLabel
      Left = 15
      Top = 144
      Caption = 'Gen/Donor Dam:'
    end
    object lCalvingSurvey: TcxLabel
      Left = 396
      Top = 72
      Caption = 'Calving Survey:'
    end
    object lCurrentGroup: TcxLabel
      Left = 15
      Top = 180
      Caption = 'Current Group:'
    end
    object lComment: TcxLabel
      Left = 396
      Top = 180
      Caption = 'Comment:'
    end
    object lSireName: TcxLabel
      Left = 396
      Top = 108
      Caption = 'Sire Name:'
    end
    object lDamName: TcxLabel
      Left = 396
      Top = 144
      Caption = 'Dam Name:'
    end
    object lSireNameText: TcxLabel
      Left = 502
      Top = 108
      AutoSize = False
      Caption = 'lSireNameText'
      Style.TextColor = clBlue
      Style.TextStyle = [fsBold]
      Height = 21
      Width = 220
    end
    object lDamNameText: TcxLabel
      Left = 502
      Top = 144
      AutoSize = False
      Caption = 'lDamNameText'
      Style.TextColor = clRed
      Style.TextStyle = [fsBold]
      Height = 21
      Width = 220
    end
    object dbCalvingHeaderComment: TcxDBTextEdit
      Left = 506
      Top = 180
      DataBinding.DataField = 'CalvingComment'
      DataBinding.DataSource = dsCalvingHeader
      Properties.OnChange = dbCalvingHeaderCommentPropertiesChange
      TabOrder = 21
      Width = 218
    end
    object dbCalvingGroupID: TcxDBLookupComboBox
      Left = 124
      Top = 176
      DataBinding.DataField = 'CalvingGroupID'
      DataBinding.DataSource = dsCalvingHeader
      Properties.ListColumns = <>
      Properties.OnChange = dbCalvingGroupIDPropertiesChange
      TabOrder = 13
      Width = 218
    end
    object dbCalvingSurvey: TcxDBLookupComboBox
      Left = 506
      Top = 70
      DataBinding.DataField = 'CalvingSurvey'
      DataBinding.DataSource = dsCalvingHeader
      Properties.ListColumns = <>
      Properties.OnChange = dbCalvingSurveyPropertiesChange
      TabOrder = 15
      Width = 218
    end
    object lGeneticDamNumberText: TcxLabel
      Left = 123
      Top = 144
      AutoSize = False
      Caption = 'lGeneticDamNumberText'
      Style.TextColor = clGreen
      Style.TextStyle = [fsBold]
      Height = 21
      Width = 220
    end
    object dbCalvingDate: TcxDBDateEdit
      Left = 124
      Top = 70
      DataBinding.DataField = 'CalvingDate'
      DataBinding.DataSource = dsCalvingHeader
      ParentFont = False
      Properties.InputKind = ikStandard
      Properties.OnChange = dbCalvingDatePropertiesChange
      Properties.OnCloseUp = dbCalvingDatePropertiesCloseUp
      Properties.OnInitPopup = dbCalvingDatePropertiesInitPopup
      Style.Color = clTeal
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWhite
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextColor = clWhite
      Style.IsFontAssigned = True
      TabOrder = 5
      OnEnter = dbCalvingDateEnter
      Width = 121
    end
    object dbBullUsed: TcxDBLookupComboBox
      Left = 124
      Top = 106
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.DropDownWidth = 200
      Properties.ListColumns = <>
      Properties.OnCloseUp = OnBullUsedChange_CloseUp
      Properties.OnPopup = dbBullUsedPropertiesPopup
      Style.Color = clTeal
      Style.TextColor = clWhite
      TabOrder = 9
      Width = 150
    end
    object lProjected: TcxLabel
      Left = 247
      Top = 72
      Caption = 'Projected:'
    end
    object lProjectedDateText: TcxLabel
      Left = 307
      Top = 72
      AutoSize = False
      Caption = 'dd/mm/yy'
      Style.TextColor = clNavy
      Style.TextStyle = [fsBold]
      Height = 21
      Width = 74
    end
    object lDamSireHeader: TcxLabel
      Left = 15
      Top = 0
      Caption = 'Dam/Sire Details'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextStyle = [fsBold, fsUnderline]
      Style.IsFontAssigned = True
    end
    object teSearchAnimalText: TcxTextEdit
      Left = 124
      Top = 34
      ParentFont = False
      Properties.ReadOnly = True
      Properties.OnChange = teSearchAnimalTextPropertiesChange
      Style.Color = clTeal
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWhite
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 1
      Text = 'teSearchAnimalText'
      Width = 150
    end
    object btnSearchForAnimal: TcxButton
      Left = 277
      Top = 34
      Width = 38
      Height = 25
      Action = actSearchForAnimal
      TabOrder = 2
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000420B0000420B00000000000000000000FF00FF2173B5
        636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF2173B5218CEF2173B5636B73FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF31A5FF52BDFF
        218CEF2173B5636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF31A5FF52BDFF218CEF2173B5636B73FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        31A5FF52BDFF218CEF2173B5636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF31A5FF52BDFF218CEF5A6B73FF
        00FFD5B9B4D6ADA5D6ADA5D6ADA5D5B9B4FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF31A5FF31A5FF4A4239B69B8BF0E2C0F9EFC8FDF2CBFEF4CCECD8
        C2D6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBB9F88F3
        E3B6FCF3D1FEF6CDFEF7CFFEF9D0FDF7D2F5E6C2D6ADA5FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFD5B9B4EFE1B5FAEDBDFFF1C1FFF3C2FFF5C4FFF7C5FFFA
        C7FDF8D2D6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6ADA5EFE3B6FB
        ECBEFDEFBFFEF1C1FFF2C2FFF4C4FFF7C5FFF9C7EEE2BBD6ADA5FF00FFFF00FF
        FF00FFFF00FFFF00FFD6ADA5EDE1B4F6E9BEFCF1D3FCF0C9FEF0C1FFF1C2FFF4
        C3FFF6C5F6E9C2CBAF9CFF00FFFF00FFFF00FFFF00FFFF00FFD6ADA5EBDEB2F2
        E6BBFCF2D7FCF1D3FCEEC0FEEFC2FFF2C2FEF2C2EFE1BBD2B3A3FF00FFFF00FF
        FF00FFFF00FFFF00FFD5B9B4E4D8B0EDE1B6F3E7BCF8EBC0F9EBBCFBEDBEFAEC
        BDF5E9BAD6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6ADA5EA
        DFBCECE0B6F0E3B6F1E5B7F2E5B7EFE3B5F5E7BCD5B9B4FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFD6ADA5E0D4B5EADEB4EBDEB1E8DBB1D6AD
        A5D5B9B4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFD5B9B4D6ADA5D6ADA5D9B7A3FF00FFFF00FFFF00FFFF00FF}
      LookAndFeel.Kind = lfOffice11
    end
  end
  object pCalvingFooter: TPanel [2]
    Left = 0
    Top = 577
    Width = 776
    Height = 108
    Align = alClient
    TabOrder = 8
    object CalvingDetailGrid: TcxGrid
      Left = 1
      Top = 1
      Width = 774
      Height = 106
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      object CalvingDetailGridDBTableView: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        OnFocusedRecordChanged = CalvingDetailGridDBTableViewFocusedRecordChanged
        DataController.DataSource = dsCalvingDetail
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnMoving = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 30
        OptionsView.Indicator = True
        object CalvingDetailGridDBTableViewAnimalNo: TcxGridDBColumn
          Caption = 'Calf Number'
          DataBinding.FieldName = 'CalfAnimalNo'
          HeaderAlignmentVert = vaCenter
          Width = 100
        end
        object CalvingDetailGridDBTableViewCalfNatID: TcxGridDBColumn
          Caption = 'National ID'
          DataBinding.FieldName = 'CalfNatID'
          HeaderAlignmentVert = vaCenter
          Width = 180
        end
        object CalvingDetailGridDBTableViewCalfPedigreeName: TcxGridDBColumn
          Caption = 'Name'
          DataBinding.FieldName = 'CalfPedigreeName'
          HeaderAlignmentVert = vaCenter
          Width = 250
        end
        object CalvingDetailGridDBTableViewCalfSex: TcxGridDBColumn
          Caption = 'Sex'
          DataBinding.FieldName = 'CalfSex'
          HeaderAlignmentVert = vaCenter
          Width = 80
        end
        object CalvingDetailGridDBTableViewCalfBirthWeight: TcxGridDBColumn
          Caption = 'Birth Weight Kgs.'
          DataBinding.FieldName = 'CalfBirthWeight'
          HeaderAlignmentVert = vaCenter
          Width = 117
        end
      end
      object CalvingDetailGridLevel: TcxGridLevel
        GridView = CalvingDetailGridDBTableView
      end
    end
  end
  object pCalvingDetail: TPanel [3]
    Left = 0
    Top = 267
    Width = 776
    Height = 256
    Align = alTop
    Constraints.MaxHeight = 256
    TabOrder = 1
    object pDeadCalf: TPanel
      Left = 378
      Top = 176
      Width = 368
      Height = 74
      BevelOuter = bvNone
      TabOrder = 25
      object lMortalityReason: TcxLabel
        Left = 18
        Top = 6
        Caption = 'Mortality:'
      end
      object dbCalfMortality: TcxDBLookupComboBox
        Left = 128
        Top = 4
        Properties.ListColumns = <>
        Properties.OnChange = dbCalfMortalityPropertiesChange
        TabOrder = 1
        Width = 218
      end
      object lDisposalPlace: TcxLabel
        Left = 18
        Top = 42
        Caption = 'Disposal Place:'
      end
      object dbDisposalPlace: TcxDBLookupComboBox
        Left = 128
        Top = 40
        Properties.ListColumns = <>
        Properties.OnChange = dbDisposalPlacePropertiesChange
        TabOrder = 3
        Width = 218
      end
    end
    object pLiveCalf: TPanel
      Left = 378
      Top = 108
      Width = 368
      Height = 107
      BevelOuter = bvNone
      TabOrder = 10
      object dbCalfIsBreeding: TcxDBCheckBox
        Left = 16
        Top = 4
        Caption = 'Used for Breeding'
        TabOrder = 0
        Width = 137
      end
      object dbCalfIsPedigree: TcxDBCheckBox
        Left = 172
        Top = 4
        Caption = 'Pedigree'
        TabOrder = 1
        Width = 125
      end
      object lCalfBirthWeight: TcxLabel
        Left = 18
        Top = 40
        Caption = 'Birth Weight:'
      end
      object dbCalfBirthWeight: TcxDBCurrencyEdit
        Left = 128
        Top = 38
        TabOrder = 3
        Width = 76
      end
      object lKgsInfo: TcxLabel
        Left = 206
        Top = 40
        Caption = '( Kgs )'
      end
      object lAssignToGroup: TcxLabel
        Left = 18
        Top = 76
        Caption = 'Assign To Group:'
      end
      object dbCalfGroupID: TcxDBLookupComboBox
        Left = 128
        Top = 74
        Properties.ListColumns = <>
        TabOrder = 6
        Width = 218
      end
    end
    object lCalfIsRegistered: TcxLabel
      Left = 1
      Top = 1
      Align = alTop
      Caption = 'Calf Is Registered'
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -19
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object lCalfMortality: TcxLabel
      Left = 14
      Top = 38
      Caption = 'Status:'
    end
    object lCalfNatID: TcxLabel
      Left = 14
      Top = 74
      Caption = 'Nat. Id. No./Tag:'
    end
    object dbCalfNatID: TDBEdit
      Left = 124
      Top = 72
      Width = 145
      Height = 25
      CharCase = ecUpperCase
      Color = clTeal
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnEnter = dbCalfNatIDEnter
      OnMouseDown = dbCalfNatIDMouseDown
    end
    object btnTagType: TcxButton
      Left = 272
      Top = 71
      Width = 75
      Height = 25
      Action = actTagType
      TabOrder = 3
      LookAndFeel.Kind = lfOffice11
    end
    object cmboCalfNatID: TcxDBLookupComboBox
      Left = 125
      Top = 72
      Properties.DropDownListStyle = lsFixedList
      Properties.ImmediatePost = True
      Properties.ListColumns = <>
      Properties.OnChange = cmboCalfNatIDPropertiesChange
      Style.Color = clTeal
      Style.TextColor = clWhite
      TabOrder = 2
      Width = 145
    end
    object lAnimalNo: TcxLabel
      Left = 14
      Top = 110
      Caption = 'F.B./Jumbo:'
    end
    object dbCalfAnimalNo: TcxDBTextEdit
      Left = 124
      Top = 108
      TabOrder = 4
      Width = 121
    end
    object lCalfSex: TcxLabel
      Left = 14
      Top = 146
      Caption = 'Sex:'
    end
    object dbCalfSex: TcxDBComboBox
      Left = 124
      Top = 144
      Properties.OnChange = dbCalfSexPropertiesChange
      TabOrder = 5
      Width = 83
    end
    object lCalfBreed: TcxLabel
      Left = 14
      Top = 182
      Caption = 'Breed:'
    end
    object lCalfBreedText: TcxLabel
      Left = 120
      Top = 180
      AutoSize = False
      Caption = 'lCalfBreedText'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      Height = 24
      Width = 230
    end
    object dbCalfBreed: TcxDBLookupComboBox
      Left = 127
      Top = 180
      ParentFont = False
      Properties.ListColumns = <>
      Properties.OnChange = dbCalfBreedPropertiesChange
      Style.Color = clTeal
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWhite
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 6
      Width = 116
    end
    object lCalfColour: TcxLabel
      Left = 14
      Top = 218
      Caption = 'Colour:'
    end
    object dbCalfColour: TcxDBLookupComboBox
      Left = 124
      Top = 216
      Properties.ListColumns = <>
      Properties.OnChange = dbCalfColourPropertiesChange
      TabOrder = 7
      Width = 116
    end
    object lProjectedCalfSex: TcxLabel
      Left = 211
      Top = 146
      Caption = 'Projected:'
    end
    object lProjectedCalfSexText: TcxLabel
      Left = 275
      Top = 146
      AutoSize = False
      Caption = 'M or F'
      Style.TextColor = clNavy
      Style.TextStyle = [fsBold]
      Height = 21
      Width = 47
    end
    object lCalfName: TcxLabel
      Left = 396
      Top = 74
      Caption = 'Calf Name:'
    end
    object dbCalfName: TcxDBTextEdit
      Left = 506
      Top = 72
      TabOrder = 8
      Width = 218
    end
    object btnCalfPedName: TcxButton
      Left = 725
      Top = 72
      Width = 38
      Height = 25
      Action = actCalfPedName
      TabOrder = 9
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000D40E0000D40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB84E00B2
        4C00AD4900FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC65300C45300
        C25200C05100BE5000BC4F00BA4E00B84E00B24C00B04B00AA4800A446009E43
        00984100964000FF00FFC85400DD7700DA7600CC6F00BE6700BE6700D2D2D2BB
        4F00D2D2D2BE6700BE6700C56B00D37300DA7600984100FF00FFCB5600E07900
        FEFEFDFBFBFAF5F5F4EEEEEDEBEBEABD5000F1F1F0EFEFEEF2F2F1F7F7F6FCFC
        FBDE78009E4300FF00FFCD5600E47B00FEFEFDFEFEFDFBFBFAF5F5F4F1F1F0BF
        5000F1F1F0F4F4F3F9F9F8FEFEFDFEFEFDE17A00A44600FF00FFCF5700E77D00
        FEFEFDC9C9C9C9C9C9C9C9C9F1F1F0C15100F1F1F0C9C9C9C9C9C9C9C9C9FEFE
        FDE67C00AA4800FF00FFD15800EB7F00FEFEFDFEFEFDFEFEFDFEFEFDF1F1F0C3
        5200F1F1F0FEFEFDFEFEFDFEFEFDFEFEFDE97E00B04B00FF00FFD35900EE8100
        FEFEFDC9C9C9C9C9C9C9C9C9F1F1F0C55300F1F1F0C9C9C9C9C9C9C9C9C9FEFE
        FDEC7F00B54D00FF00FFD55A00F28300FEFEFDFEFEFDFEFEFDFEFEFDF1F1F0C7
        5400F1F1F0FEFEFDFEFEFDFEFEFDFEFEFDF18200B94E00FF00FFD75B00F58400
        FEFEFDC9C9C9C9C9C9C9C9C9F1F1F0C95500F1F1F0C9C9C9C9C9C9C9C9C9FEFE
        FDF48300BC4F00FF00FFD95C00F78500FEFEFDFEFEFDFEFEFDFEFEFDF1F1F0CC
        5600F1F1F0FEFEFDFEFEFDFEFEFDFEFEFDF78500BE5000FF00FFFF00FFDA5C00
        D85B00D65A00D45900D25900D05800FF00FFCC5600CA5500C85400C65300C453
        00C25200FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      LookAndFeel.Kind = lfOffice11
    end
    object lCalfNatIDNumOptions: TcxLabel
      Left = 396
      Top = 39
      Caption = 'Calf Nat ID Number Options:'
    end
    object dbStatus: TcxDBComboBox
      Left = 124
      Top = 36
      DataBinding.DataField = 'Mortality'
      DataBinding.DataSource = dsCalvingDetail
      Properties.OnChange = dbStatusPropertiesChange
      Properties.OnCloseUp = dbStatusPropertiesCloseUp
      Properties.OnInitPopup = dbStatusPropertiesInitPopup
      TabOrder = 0
      Width = 145
    end
    object lCalfHeader: TcxLabel
      Left = 15
      Top = 0
      Caption = 'Calf Details'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextStyle = [fsBold, fsUnderline]
      Style.IsFontAssigned = True
    end
    object lCalfNatIDNumOptionsText: TcxLabel
      Left = 571
      Top = 39
      Caption = 'lCalfNatIDNumOptionsText'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextStyle = []
      Style.IsFontAssigned = True
    end
  end
  object pAddRemoveCancelCalf: TPanel [4]
    Left = 0
    Top = 523
    Width = 776
    Height = 54
    Align = alTop
    TabOrder = 2
    object btnAddCalf: TcxButton
      Left = 120
      Top = 8
      Width = 218
      Height = 38
      Action = actAddCalf
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Colors.Default = clGreen
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8C5A828DA2828DA2828DA2864C164FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88BA8706F30106F301
        06F30139CB36FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF89
        B88709E6010AE70109E6013BC436FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F1F2A2BDD98DB5E26991
        D2D0D6DEFFFFFF8AB68810DB0511DC0610DB053FBD38FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF7F7F8A6B6C6D6DBE095A7B9A4B5C6A5B5CB759DD4
        6793D359A88D3AA76243AB6A74B3734DB54731D62731D62731D62739C43072AF
        6E72AF6E72AF6E78AE74FFFFFFFFFFFFFFFFFFC8CFD504243C022845011D3338
        59768BB3E15888D25888D22AA34456D64E55D54D56D64E55D54D55D54D56D64E
        55D54D55D54D56D64E55D54D55D54D2BBD1DFFFFFFFFFFFFFFFFFFABB6C10B20
        30153B5A071C2C30495DACCDEB5888D25888D22E9C4679D87678D77579D87678
        D77578D77579D87678D77578D77579D87678D77578D7753AB72CFFFFFFFFFFFF
        FFFFFFB9C3CD587A985F819F3F627F6686A3A3C4E65787D15081CF3296489ADF
        9D99DE9C9ADF9D99DE9C99DE9C9ADF9D99DE9C99DE9C9ADF9D99DE9C99DE9C49
        B33BFFFFFFFFFFFFFFFFFFF8F8F9A8C2DDB2CFECB5D1EDB8D2ED6A94D45182D0
        3467C53C847D6AAA906BA9936EAC957BBA90BBE9C6BBE9C6BBE9C696CB988BB2
        898BB2898BB28977A570FFFFFFFFFFFFFFFFFFFFFFFFE2E5E8B0CEEBBBD4EDBA
        D3ED5180CC3669C63265C44E7FCE5888D25483CD5888D2659AA4D3F3E4D4F4E5
        D3F3E497BD99FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7DB
        DEB4D0ECC2D8EFC6DBF0648ED13769C63265C44B7CCD5888D25483CD5888D264
        97A4D4F2E6D5F3E6D4F2E697BC9AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFC9CED77099D8CADDF2CEE0F391B0DF3A6DC73467C53F71C95888
        D25584CE5888D26897A5D6F2E6D6F2E6D6F2E699B99AFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFC7CFD79FAEC29BAABE4D6FA3CFE0F2D4E3F4CADBF03B6CC6
        6585B41A33663C6ABE5685D05889D354859889B18B8CB0868CB08685A37DFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFA9BBD14A71AF2F569A3C52767392BDB4CBEBDB
        E8F6DFEBF77A9DDA6B91CB40444A5B75A04170BB416CB05078B56E95C9ABC0D3
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9C6D56189C1466DAC2D54984370
        B84977CC5F88D2DFEBF7E4EEF8D5E2F44A78CBAEC4E87198D709307C1B428A38
        5FA15B82BA7AA1D2CBD2DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7AA1D26086BE
        456DAB2E55984973B5638BD47296D7D5E2F3EAF1F9F0F6FBD0DDF24573C93265
        C44171BE2C53972D54974F76B0769DCDBBC6D1FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFD0D6DD96B1D086ABD794B1D5BAC8D787AADE8CAADF9DB7E4D2DFF3F5F8FD
        F9FCFEBBCDEC3468C55686D08FB6E184AAD887ACD8A9BFD7FBFBFBFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7DCE1A6C2DE96B8E3A8C0E7B7
        CBEBC8D7EFEBF1FAFBFCFEF3F7FB79A2DBA8C8E9ADCBEBABC9E7E4E7EAFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEE2E5B2CEEBBDD6
        EFA8C7E9C0D3EECDDCF1D4E1F3E0E9F7F4F8FCF2F7FBC3D8EFB5C5D5B6CEE6C3
        D9F0AFC9E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        B5C1CEC2D9EFD7DCE2FFFFFFD6DBE0B7C4D3B7C6D7B8C6D7BBC6D3CCD2D9FBFB
        FBFFFFFFFFFFFFBBCAD9BAD3EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFB2C0CFBCCAD9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDB0CCE9FAFAFBFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3CDD7E5E8EAFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2D8DEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      LookAndFeel.Kind = lfOffice11
      Spacing = 12
    end
    object btnRemoveCalf: TcxButton
      Left = 417
      Top = 8
      Width = 218
      Height = 38
      Action = actRemoveCalf
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFD3D3E0A6A6CFFFFFFFFFFFFFFFFFFFFFFFFFD5D5
        E1A9A9D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1D1DF1616E91011F59394CFFFFFFF
        FFFFFFD4D4E02426EA0D0EF49393CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F8F8D0D5DABCBFD41717E21E21F024
        28EF2326EE9595CDD5D5E12F32E32529F02428EF1417ED9494CEFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4DAE094BAE38EB5E12941
        D02529E7343AEA3339E93339E93136E83438E03339E9343AEA3339E93339E933
        35D7FFFFFFFFFFFFFFFFFFEBECEE678BAC92A6B84F7496789CBE82A6D85989D2
        5483CE79A1D85B89D2364BD14249E5444BE5444BE5444BE5444BE5444BE5444B
        E5444BE5454AD7E0E0E8FFFFFFFFFFFFFFFFFFBFC7CF031B2D0127450216252E
        4B649BC0E65888D25888D25787D15683CD5686D13B50CF5058E0525BE1535CE2
        525BE1525BE1535CE24E53D4E0E0E8FFFFFFFFFFFFFFFFFFFFFFFFABB6C20924
        39143B5908263E304A61B1D1EC5887D15888D25888D24F7FCC4A7BCC4C73CC4F
        58D7616CDF626DE0616CDF616CDF616BDF8788C8FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCCD3DA8DAFCF97B6D57696B38BA9C696B8E15888D24577CB5787D15888
        D23C64C25966D4707CDD707CDD717DDE707CDD707CDD717DDE6873DB9A9BC9FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFB9C8D8B3CFECB7D2EDBAD3EE5D8AD04879CC
        3366C45182D04A72CB6472D3818EDF818EDF818EDF818EDF808EDF818EDF818E
        DF818EDF7683DB9B9CC8FFFFFFFFFFFFFFFFFFFFFFFFE3E5E7B0CEEBBDD5EEBF
        D7EE5482CD3669C63265C44C7DCD2F49BD5F69CD909FE08F9EDF8F9EDF7079CD
        767AC28B9ADE909FE08F9EDF8F9EDF5257C1FFFFFFFFFFFFFFFFFFFFFFFFD5D9
        DEA7C5E8C4DAF0C8DCF17399D5396BC73265C44879CC5888D22539B36A75CD9E
        AFE27982CDE1E1E7FEFEFF8083C09BABE19EAFE25F66C3DEDEE6FFFFFFFFFFFF
        FFFFFFFFFFFFCACFD75B88D1CCDFF2D0E1F3A5BFE53B6DC64979CC396BC75484
        D15583CE273BB14C58BB879FCCFFFFFFFFFFFFFEFEFF8286C05E65BEDEDEE6FF
        FFFFFFFFFFF6F7F796ADC96E90C06C819D546E90D0E1F3D5E4F4D7E5F44977CA
        607EAD0D162C2C529D5585D05A8BD35D8ACF7CA4D8F7F8F8FFFFFFFFFFFFFFFF
        FFF7F7F8FFFFFFFFFFFFFBFBFB86A5CC476FAD2F569A53719C688FCC90AEE0DC
        E9F7E1ECF899B4E2638DD2838B94829CC12B57A32D559A4068A8638AC28CAED7
        F6F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99B3D16087BF466DAC2D54982F5B
        A94F7CCE6189D2E1EBF7E6EFF8E7EFF9638AD2789AD85681CF153E8B173E8633
        5B9D557CB6789FD0B2C0CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81A6D46087BE
        476FAC4067A7618AC66A91D6779AD9BDD0EDEAF2F9F2F7FCEDF3FA688DD33265
        C44274C84E75B2375E9F4D74AE799FCFC4CDD7FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF4F5F6BBC6D2A8B9CCB7C3D0E1E7EC8EB0E094B1E2A3BBE6C3D4EFF1F6FC
        FBFDFEDAE4F53B6EC8729DD997BDE5A2C3E5A6BBD1C8D0D9FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB7C7D6A7C7E99FBEE6AFC6E9BF
        D2EDCFDCF1E9F0F9FAFBFDF6F9FC9CBCE5AFCDEAB7D2EDAFCCEBC5D0DAFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBD2D9BBD4EDBAD3
        EDB1C5D9B9D0ECCDDCF1D3E0F3DBE6F6ECF2FAE5EEF9BFD1E3D3D8DEBBC8D6C1
        D8EFB2CFEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        B3C0CEBFD6EDF5F6F6FFFFFFF9F9FAD0D5DBC3CAD2C5CBD3D2D7DCF6F6F7FFFF
        FFFFFFFFFFFFFFD1D8DEBED6EFF5F5F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFB3C1CEC3CDD7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFC8E0F2F3F4FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6DBDFF1F2F3FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F1F2FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      LookAndFeel.Kind = lfOffice11
      Spacing = 12
    end
  end
  object tvBullList: TcxTreeView [5]
    Left = 124
    Top = 180
    Width = 107
    Height = 28
    Style.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 9
    OnMouseDown = tvBullListMouseDown
    RowSelect = True
  end
  inherited ActionList: TActionList
    OnExecute = ActionListExecute
    Left = 699
    inherited actClose: TAction
      Caption = '&Close'
      ShortCut = 16451
    end
    inherited actHelp: TAction
      Caption = '&Help'
      ShortCut = 16456
      OnExecute = actHelpExecute
    end
    object actSaveCalvings: TAction
      Caption = '&Save Calvings'
      ImageIndex = 8
      ShortCut = 16467
      OnExecute = actSaveCalvingsExecute
    end
    object actCalvingOptions: TAction
      Caption = 'Calving &Options'
      ImageIndex = 26
      ShortCut = 16463
      OnExecute = actCalvingOptionsExecute
    end
    object actDeleteCalving: TAction
      Caption = '&Delete Calving'
      ImageIndex = 21
      ShortCut = 16452
      OnExecute = actDeleteCalvingExecute
    end
    object actCalvingSurvey: TAction
      Caption = 'Calving S&urvey'
      ImageIndex = 5
      ShortCut = 16469
      OnExecute = actCalvingSurveyExecute
    end
    object actTagType: TAction
      Caption = 'Tag Type'
      OnExecute = actTagTypeExecute
    end
    object actCalfPedName: TAction
      OnExecute = actCalfPedNameExecute
    end
    object actAddCalf: TAction
      Caption = 'Add Twin'
      OnExecute = actAddCalfExecute
      OnUpdate = actAddCalfUpdate
    end
    object actRemoveCalf: TAction
      Caption = 'Remove Calf'
      OnExecute = actRemoveCalfExecute
      OnUpdate = actRemoveCalfUpdate
    end
    object actSearchForAnimal: TAction
      OnExecute = actSearchForAnimalExecute
    end
  end
  inherited BarManager: TdxBarManager
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Main'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 353
        FloatTop = 250
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = bClose
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = bSaveCalvings
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = bDeleteCalving
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = bCalvingOptions
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = bCalvingSurvey
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = bHelp
            UserGlyph.Data = {00000000}
            Visible = True
          end>
        Name = 'Main'
        OneOnRow = True
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
        BackgroundBitmap.Data = {00000000}
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 553
    DockControlHeights = (
      0
      0
      49
      0)
    inherited bClose: TdxBarLargeButton
      AutoGrayScale = False
    end
    inherited bHelp: TdxBarLargeButton
      AutoGrayScale = False
    end
    object bSaveCalvings: TdxBarLargeButton
      Action = actSaveCalvings
      Category = 0
      AutoGrayScale = False
      Height = 45
      Width = 100
    end
    object bCalvingOptions: TdxBarLargeButton
      Action = actCalvingOptions
      Category = 0
      AutoGrayScale = False
      Height = 45
    end
    object bDeleteCalving: TdxBarLargeButton
      Action = actDeleteCalving
      Category = 0
      AutoGrayScale = False
      Height = 45
    end
    object bCalvingSurvey: TdxBarLargeButton
      Action = actCalvingSurvey
      Category = 0
      AutoGrayScale = False
      Height = 45
    end
  end
  object mdCalvingHeader: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 610
    Top = 9
  end
  object mdCalvingDetail: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforeClose = mdCalvingDetailBeforeClose
    BeforeInsert = mdCalvingDetailBeforeInsert
    BeforeCancel = mdCalvingDetailBeforeCancel
    BeforeDelete = mdCalvingDetailBeforeDelete
    Left = 670
    Top = 9
  end
  object dsCalvingHeader: TDataSource
    DataSet = mdCalvingHeader
    Left = 582
    Top = 9
  end
  object dsCalvingDetail: TDataSource
    DataSet = mdCalvingDetail
    Left = 641
    Top = 9
  end
  object RemovedCalves: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 727
    Top = 9
    object RemovedCalvesId: TIntegerField
      FieldName = 'Id'
    end
    object RemovedCalvesNatIdNo: TStringField
      FieldName = 'NatIdNo'
    end
  end
end
