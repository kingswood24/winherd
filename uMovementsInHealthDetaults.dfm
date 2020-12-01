inherited fmMovementsInHealth: TfmMovementsInHealth
  Left = 396
  Top = 264
  Width = 463
  Height = 332
  Caption = 'Movements In - Health'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 276
    Width = 447
  end
  object cxGroupBox1: TcxGroupBox [1]
    Left = 24
    Top = 122
    Caption = 'Dosage Details'
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 5
    Height = 131
    Width = 401
    object cxDBLookupComboBox1: TcxDBLookupComboBox
      Left = 92
      Top = 60
      Properties.ListColumns = <>
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Width = 263
    end
    object Drug: TcxLabel
      Left = 20
      Top = 30
      Caption = 'Date'
    end
    object cxLabel1: TcxLabel
      Left = 20
      Top = 62
      Caption = 'Drug'
    end
    object cxDateEdit1: TcxDateEdit
      Left = 92
      Top = 26
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 3
      Width = 121
    end
    object cxLabel2: TcxLabel
      Left = 20
      Top = 94
      Caption = 'Applic. Rate '
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 92
      Top = 94
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 5
      Width = 121
    end
    object lDoseUnit: TcxLabel
      Left = 222
      Top = 96
      Caption = 'Dose Unit'
    end
  end
  object cxGroupBox2: TcxGroupBox [2]
    Left = 22
    Top = 52
    Caption = 'Animal Details'
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 6
    Height = 59
    Width = 401
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 92
      Top = 24
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Width = 159
    end
    object cxLabel7: TcxLabel
      Left = 20
      Top = 26
      Caption = 'Nat. Id. No.'
    end
    object cxLabel4: TcxLabel
      Left = 260
      Top = 26
      Caption = 'Weight '
    end
    object cxDBTextEdit3: TcxDBTextEdit
      Left = 306
      Top = 24
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 3
      Width = 59
    end
    object cxLabel3: TcxLabel
      Left = 368
      Top = 26
      Caption = '(Kgs) '
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
            Item = dxBarLargeButton1
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton2
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton3
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
    Left = 65522
    Top = 84
    DockControlHeights = (
      0
      0
      42
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actSave
      Category = 0
      Width = 55
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = actCancel
      Category = 0
      Width = 55
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Action = actDelete
      Category = 0
      Width = 55
    end
  end
  inherited ActionList: TActionList
    Left = 65526
    Top = 28
    object actCancel: TAction
      Caption = 'Cancel'
      ImageIndex = 11
    end
    object actSave: TAction
      Caption = 'Save'
      ImageIndex = 18
    end
    object actDelete: TAction
      Caption = 'Delete'
      ImageIndex = 10
    end
  end
end
