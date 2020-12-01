inherited fmNewUIBullingEvent: TfmNewUIBullingEvent
  Left = 463
  Top = 184
  Anchors = []
  BorderStyle = bsDialog
  Caption = 'Heat/Bulling'
  ClientHeight = 409
  ClientWidth = 542
  OldCreateOrder = True
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 25
  inherited btnAddEvent: TcxButton
    Left = 252
    Top = 323
    Anchors = []
  end
  inherited cxButton1: TcxButton
    Left = 397
    Top = 324
    Anchors = []
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
    object lPlannedBull: TcxLabel
      Left = 34
      Top = 120
      Caption = 'Planned Bull:'
      ParentFont = False
      Style.StyleController = WinData.TouchScreenLabelStyleController
    end
    object lObservedBy: TcxLabel
      Left = 34
      Top = 190
      Caption = 'Observed By:'
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
    object cmboPlannedBull: TcxLookupComboBox
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
    object cmboObservedBy: TcxLookupComboBox
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
    Left = 510
    Top = 8
  end
end
