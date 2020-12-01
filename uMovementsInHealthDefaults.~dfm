inherited fmMovementsInHealthDefaults: TfmMovementsInHealthDefaults
  Left = 396
  Top = 264
  Width = 488
  Height = 320
  Caption = 'Treatment Template'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 269
    Width = 480
  end
  object cxGroupBox1: TcxGroupBox [1]
    Left = 40
    Top = 76
    Caption = 'Dosage Details'
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 5
    Height = 106
    Width = 401
    object cmboDrug: TcxDBLookupComboBox
      Left = 102
      Top = 26
      RepositoryItem = HerdLookup.erMedicineLookup
      DataBinding.DataField = 'DrugID'
      Properties.ListColumns = <>
      Properties.OnChange = cmboDrugPropertiesChange
      Properties.OnInitPopup = cmboDrugPropertiesInitPopup
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Width = 263
    end
    object cxLabel1: TcxLabel
      Left = 34
      Top = 28
      Caption = 'Drug Name'
    end
    object cxLabel2: TcxLabel
      Left = 28
      Top = 60
      Caption = 'Applic. Rate '
    end
    object teApplicRate: TcxDBTextEdit
      Left = 102
      Top = 60
      DataBinding.DataField = 'ApplicRate'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 3
      Width = 79
    end
    object lDoseUnit: TcxLabel
      Left = 186
      Top = 62
      AutoSize = False
      Height = 17
      Width = 67
    end
    object tePerKgs: TcxDBTextEdit
      Left = 286
      Top = 60
      DataBinding.DataField = 'ApplicRatePerKgs'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 5
      Width = 43
    end
    object cxLabel3: TcxLabel
      Left = 332
      Top = 62
      Caption = '(Kgs) '
    end
    object cxLabel5: TcxLabel
      Left = 262
      Top = 62
      Caption = 'Per'
    end
  end
  object cxGroupBox2: TcxGroupBox [2]
    Left = 40
    Top = 188
    Caption = 'Preferences'
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 6
    Height = 49
    Width = 401
    object cbDefaultCommentToDrugDesc: TcxDBCheckBox
      Left = 200
      Top = 20
      Caption = 'Use Drug Name as Comment'
      DataBinding.DataField = 'UseDrugNameForComment'
      Properties.Alignment = taRightJustify
      Properties.DisplayGrayed = 'False'
      Properties.ValueGrayed = 'False'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Width = 166
    end
    object dbcbCrushTreatment: TcxDBCheckBox
      Left = 24
      Top = 20
      Caption = 'Crush Treatment'
      DataBinding.DataField = 'CrushTreatment'
      Properties.Alignment = taRightJustify
      Properties.DisplayGrayed = 'False'
      Properties.ValueGrayed = 'False'
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 1
      Width = 117
    end
  end
  inherited ActionList: TActionList
    Left = 6
    Top = 66
    object actCancel: TAction
      Caption = 'Cancel'
      ImageIndex = 11
      OnExecute = actCancelExecute
      OnUpdate = actCancelUpdate
    end
    object actSave: TAction
      Caption = 'Save'
      ImageIndex = 18
      OnExecute = actSaveExecute
      OnUpdate = actSaveUpdate
    end
    object actDelete: TAction
      Caption = 'Delete'
      ImageIndex = 10
      OnExecute = actDeleteExecute
    end
    object actAdd: TAction
      Caption = 'Add'
      OnExecute = actAddExecute
      OnUpdate = actAddUpdate
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
            Item = dxBarLargeButton4
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
    Left = 6
    Top = 100
    DockControlHeights = (
      0
      0
      49
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actSave
      Category = 0
      Height = 45
      Width = 65
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = actCancel
      Category = 0
      Height = 45
      Width = 65
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Action = actDelete
      Category = 0
      Height = 45
      Width = 65
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Action = actAdd
      Category = 0
      Height = 45
      HotImageIndex = 9
      Width = 65
      SyncImageIndex = False
      ImageIndex = 9
    end
  end
end
