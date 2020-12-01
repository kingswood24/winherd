inherited fmTestHealth: TfmTestHealth
  Caption = 'fmTestHealth'
  Font.Height = -13
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 17
  object lDrugUsed: TcxLabel [1]
    Left = 34
    Top = 86
    AutoSize = False
    Caption = 'Drug Used'
    Height = 21
    Width = 70
  end
  object lApplicRate: TcxLabel [2]
    Left = 34
    Top = 130
    AutoSize = False
    Caption = 'Applic Rate'
    Height = 21
    Width = 70
  end
  object cmboDrugUsed: TcxLookupComboBox [3]
    Left = 130
    Top = 84
    Properties.DropDownListStyle = lsFixedList
    Properties.ListColumns = <>
    Properties.OnChange = cmboDrugUsedPropertiesChange
    Style.BorderStyle = ebsFlat
    TabOrder = 7
    Width = 145
  end
  object ceApplicRate: TcxCurrencyEdit [4]
    Left = 130
    Top = 128
    Properties.OnChange = ceApplicRatePropertiesChange
    Style.BorderStyle = ebsFlat
    TabOrder = 8
    Width = 73
  end
  object lBatchNo: TcxLabel [5]
    Left = 33
    Top = 176
    AutoSize = False
    Caption = 'Batch No'
    Height = 21
    Width = 70
  end
  object cmboBatchNo: TcxLookupComboBox [6]
    Left = 129
    Top = 174
    Properties.DropDownListStyle = lsFixedList
    Properties.ListColumns = <>
    Properties.OnChange = cmboBatchNoPropertiesChange
    Style.BorderStyle = ebsFlat
    TabOrder = 10
    Width = 145
  end
  inherited ActionList: TActionList
    Left = 396
    Top = 8
    object actSave: TAction
      Caption = 'Save'
      ImageIndex = 8
      OnExecute = actSaveExecute
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
            Item = lbSave
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
    Left = 366
    Top = 8
    DockControlHeights = (
      0
      0
      49
      0)
    inherited bClose: TdxBarLargeButton
      Height = 45
      Width = 65
    end
    inherited bHelp: TdxBarLargeButton
      Height = 45
      Width = 65
    end
    object lbSave: TdxBarLargeButton
      Action = actSave
      Category = 0
      Height = 45
      Width = 65
    end
  end
end
