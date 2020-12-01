inherited fmNewUIServiceEvent: TfmNewUIServiceEvent
  Height = 443
  Caption = 'AI Service'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 25
  inherited btnAddEvent: TcxButton
    Top = 323
  end
  inherited cxButton1: TcxButton
    Top = 323
  end
  object gbAnimalHeatBulling: TGroupBox [2]
    Left = 24
    Top = 19
    Width = 492
    Height = 282
    Caption = 'Animal Tag No.'
    TabOrder = 2
    object lEventDate: TcxLabel
      Left = 34
      Top = 50
      Caption = 'Date:'
      ParentFont = False
      Style.StyleController = WinData.TouchScreenLabelStyleController
    end
    object lBullUsed: TcxLabel
      Left = 34
      Top = 120
      Caption = 'Bull Used:'
      ParentFont = False
      Style.StyleController = WinData.TouchScreenLabelStyleController
    end
    object lInseminator: TcxLabel
      Left = 34
      Top = 190
      Caption = 'Inseminator:'
      ParentFont = False
      Style.StyleController = WinData.TouchScreenLabelStyleController
    end
    object deEventDate: TcxDateEdit
      Left = 178
      Top = 40
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.BorderStyle = ebsThick
      Style.Edges = [bLeft, bTop, bRight, bBottom]
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.StyleController = WinData.TouchScreenEditStyleController
      Style.ButtonStyle = btsFlat
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.BorderColor = clRed
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      TabOrder = 0
      Height = 43
      Width = 195
    end
    object cmboBullUsed: TcxLookupComboBox
      Left = 178
      Top = 110
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Code'
        end>
      Properties.ListSource = HerdLookup.dsPlannedBull
      Style.BorderStyle = ebsThick
      Style.Edges = [bLeft, bTop, bRight, bBottom]
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.StyleController = WinData.TouchScreenEditStyleController
      Style.ButtonStyle = btsFlat
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.BorderColor = clRed
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      TabOrder = 1
      Height = 43
      Width = 270
    end
    object cmboInseminator: TcxLookupComboBox
      Left = 178
      Top = 180
      AutoSize = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Description'
        end>
      Properties.ListSource = WinData.dsObservedBy
      Style.BorderStyle = ebsThick
      Style.Edges = [bLeft, bTop, bRight, bBottom]
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.StyleController = WinData.TouchScreenEditStyleController
      Style.ButtonStyle = btsFlat
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.BorderColor = clRed
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      TabOrder = 2
      Height = 43
      Width = 271
    end
  end
  inherited ActionList: TActionList
    Left = 517
    Top = 70
  end
  object dsBullUsed: TDataSource
    DataSet = HerdLookup.qServiceBullUsed
    Left = 518
    Top = 40
  end
end
