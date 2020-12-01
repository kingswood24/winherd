inherited fmPDAAnimalPurch: TfmPDAAnimalPurch
  Left = 256
  Top = 174
  Width = 404
  Height = 418
  Caption = 'PDA Animal Setup'
  OldCreateOrder = True
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 362
    Width = 388
    Visible = False
  end
  object PageControl: TcxPageControl [1]
    Left = 0
    Top = 44
    Width = 388
    Height = 318
    ActivePage = cxTabSheet1
    Align = alClient
    Constraints.MinHeight = 289
    Constraints.MinWidth = 379
    TabOrder = 5
    ClientRectBottom = 314
    ClientRectLeft = 4
    ClientRectRight = 384
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Caption = 'Setup Animal'
      ImageIndex = 0
      object cxGroupBox1: TcxGroupBox
        Left = 0
        Top = 0
        Align = alClient
        Caption = 'Animal Information'
        TabOrder = 0
        Height = 290
        Width = 380
        object dbeAnimalNumber: TcxDBTextEdit
          Left = 150
          Top = 64
          DataBinding.DataField = 'AnimalNumber'
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 10
          Style.StyleController = EditStyleController
          TabOrder = 0
          Width = 85
        end
        object dbeNationalIdentityNo: TcxDBTextEdit
          Left = 150
          Top = 94
          DataBinding.DataField = 'NationalID'
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.MaxLength = 20
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 137
        end
        object cxLabel1: TcxLabel
          Left = 14
          Top = 97
          Caption = 'National Identity No.'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel2: TcxLabel
          Left = 14
          Top = 67
          Caption = 'Animal Number'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object lcmbBreeds: TcxDBLookupComboBox
          Left = 150
          Top = 184
          DataBinding.DataField = 'CalfBreed'
          ParentFont = False
          Properties.DropDownAutoSize = True
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownSizeable = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              Width = 210
              FieldName = 'Name'
            end
            item
              Width = 110
              FieldName = 'Code'
            end>
          Style.StyleController = EditStyleController
          TabOrder = 4
          Width = 165
        end
        object cmbSex: TcxDBComboBox
          Left = 150
          Top = 154
          DataBinding.DataField = 'Sex'
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownSizeable = True
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items.Strings = (
            'Bull'
            'Female'
            'Steer')
          Properties.Sorted = True
          Style.StyleController = EditStyleController
          TabOrder = 5
          Width = 103
        end
        object cxLabel3: TcxLabel
          Left = 14
          Top = 157
          Caption = 'Sex'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object lcmbColours: TcxDBLookupComboBox
          Left = 150
          Top = 214
          DataBinding.DataField = 'CalfColour'
          ParentFont = False
          Properties.DropDownAutoSize = True
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownSizeable = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              Width = 210
              FieldName = 'Description'
            end
            item
              Caption = 'Code'
              Width = 110
              FieldName = 'LookUpCode'
            end>
          Style.StyleController = EditStyleController
          TabOrder = 7
          Width = 165
        end
        object cxLabel4: TcxLabel
          Left = 14
          Top = 187
          Caption = 'Breed'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel5: TcxLabel
          Left = 14
          Top = 217
          Caption = 'Colour'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Style.TransparentBorder = False
          StyleFocused.BorderColor = clMenu
          Transparent = True
        end
        object dbdeDOB: TcxDBDateEdit
          Left = 150
          Top = 124
          DataBinding.DataField = 'DateOfBirth'
          ParentFont = False
          Properties.ImmediatePost = True
          Style.StyleController = EditStyleController
          TabOrder = 10
          Width = 121
        end
        object cxLabel6: TcxLabel
          Left = 14
          Top = 127
          Caption = 'Date Of Birth'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object lcmbHerdIdentity: TcxDBLookupComboBox
          Left = 150
          Top = 34
          DataBinding.DataField = 'HerdID'
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.DropDownAutoSize = True
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownSizeable = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              Caption = 'Herd Identity'
              FieldName = 'HerdIdentity'
            end>
          Style.StyleController = EditStyleController
          TabOrder = 12
          Width = 121
        end
        object cxLabel7: TcxLabel
          Left = 14
          Top = 37
          Caption = 'Herd Identity'
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.StyleController = LabelStyleController
          Transparent = True
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Setup Purchase'
      ImageIndex = 1
      object cxGroupBox2: TcxGroupBox
        Left = 0
        Top = 0
        Align = alClient
        Caption = 'Purchase Information'
        TabOrder = 0
        Height = 290
        Width = 380
        object cxLabel8: TcxLabel
          Left = 14
          Top = 68
          Caption = 'Supplier'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object lcmbSuppliers: TcxDBLookupComboBox
          Left = 150
          Top = 65
          DataBinding.DataField = 'SupplierID'
          ParentFont = False
          Properties.DropDownAutoSize = True
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownSizeable = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'Name'
            end>
          Style.StyleController = EditStyleController
          TabOrder = 1
          Width = 165
        end
        object cxLabel9: TcxLabel
          Left = 14
          Top = 98
          Caption = 'Buyer'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object lcmbBuyers: TcxDBLookupComboBox
          Left = 150
          Top = 95
          DataBinding.DataField = 'BuyerID'
          ParentFont = False
          Properties.DropDownAutoSize = True
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownSizeable = True
          Properties.ImmediatePost = True
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'Name'
            end>
          Style.StyleController = EditStyleController
          TabOrder = 3
          Width = 165
        end
        object cxLabel10: TcxLabel
          Left = 14
          Top = 128
          Caption = 'Price'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel11: TcxLabel
          Left = 14
          Top = 158
          Caption = 'Weight'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object dbcePrice: TcxDBCurrencyEdit
          Left = 150
          Top = 125
          DataBinding.DataField = 'PurchasePrice'
          Properties.Alignment.Horz = taRightJustify
          TabOrder = 6
          Width = 90
        end
        object dbteWeight: TcxDBTextEdit
          Left = 150
          Top = 155
          DataBinding.DataField = 'Weight'
          Properties.Alignment.Horz = taRightJustify
          TabOrder = 7
          Width = 90
        end
        object cxLabel12: TcxLabel
          Left = 244
          Top = 158
          Caption = 'Kgs'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object cxLabel13: TcxLabel
          Left = 14
          Top = 39
          Caption = 'Date of Purchase'
          ParentFont = False
          Style.StyleController = LabelStyleController
          Transparent = True
        end
        object dePurchDate: TcxDBDateEdit
          Left = 150
          Top = 36
          DataBinding.DataField = 'Date'
          Properties.ImmediatePost = True
          TabOrder = 10
          Width = 123
        end
      end
    end
  end
  inherited BarManager: TdxBarManager
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        Caption = 'Main'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = blbExit
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbSave
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            Item = blbCancel
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbHelp
            UserGlyph.Data = {00000000}
            Visible = True
          end>
        Name = 'Main1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        UseRecentItems = False
        UseRestSpace = True
        Visible = True
        WholeRow = True
        BackgroundBitmap.Data = {00000000}
      end>
    Categories.ItemsVisibles = (
      2
      2)
    Categories.Visibles = (
      True
      True)
    Left = 94
    Top = 298
    DockControlHeights = (
      0
      0
      44
      0)
    inherited blbExit: TdxBarLargeButton
      Action = actExit
      PaintStyle = psCaptionGlyph
      ImageIndex = 0
    end
    inherited blbHelp: TdxBarLargeButton
      Action = actHelp
      PaintStyle = psCaptionGlyph
      ImageIndex = 7
    end
    inherited blbDelete: TdxBarLargeButton
      ImageIndex = 10
    end
    inherited blbEdit: TdxBarLargeButton
      ImageIndex = 12
    end
    inherited blbSave: TdxBarLargeButton
      Action = actSave
      PaintStyle = psCaptionGlyph
      Width = 85
      ImageIndex = 18
    end
    inherited blbCancel: TdxBarLargeButton
      Action = actCancel
      PaintStyle = psCaptionGlyph
      Width = 85
      ImageIndex = 11
    end
    inherited blbFirst: TdxBarLargeButton
      ImageIndex = 14
    end
    inherited blbNext: TdxBarLargeButton
      ImageIndex = 16
    end
    inherited blbPrior: TdxBarLargeButton
      ImageIndex = 17
    end
    inherited blbLast: TdxBarLargeButton
      ImageIndex = 15
    end
  end
  inherited ActionList: TActionList
    Left = 122
    Top = 298
    inherited actSave: TAction
      Caption = 'Save'
    end
    inherited actLast: TAction
      Caption = '/'
    end
  end
  inherited LookAndFeelController: TcxLookAndFeelController
    Left = 38
    Top = 298
  end
  inherited EditStyleController: TcxEditStyleController
    Style.TransparentBorder = False
    Style.IsFontAssigned = True
    Left = 66
    Top = 298
  end
  inherited StyleRepository: TcxStyleRepository
    Left = 150
    Top = 298
  end
  inherited GridViewRepository: TcxGridViewRepository
    Left = 178
    Top = 298
  end
  inherited LabelStyleController: TcxEditStyleController
    Style.BorderStyle = ebsNone
    Style.TransparentBorder = False
    Style.IsFontAssigned = True
    Left = 206
    Top = 298
  end
end
