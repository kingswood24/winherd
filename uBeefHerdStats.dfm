inherited fmBeefHerdStats: TfmBeefHerdStats
  Left = 557
  Top = 450
  Width = 442
  Height = 375
  Caption = 'fmBeefHerdStats'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 319
    Width = 426
  end
  object cxGroupBox1: TcxGroupBox [1]
    Left = 14
    Top = 54
    Caption = 'Select Period'
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 5
    Height = 65
    Width = 401
    object deFromDate: TcxDateEdit
      Left = 66
      Top = 24
      EditValue = 39600d
      Properties.OnChange = deFromDatePropertiesChange
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Width = 121
    end
    object deToDate: TcxDateEdit
      Left = 236
      Top = 24
      EditValue = 39627d
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 1
      Width = 121
    end
    object cxLabel1: TcxLabel
      Left = 30
      Top = 24
      Caption = 'From '
    end
    object cxLabel2: TcxLabel
      Left = 210
      Top = 24
      Caption = 'To'
    end
  end
  object cxButton1: TcxButton [2]
    Left = 334
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Output'
    TabOrder = 6
    OnClick = cxButton1Click
  end
  object cxGroupBox2: TcxGroupBox [3]
    Left = 14
    Top = 124
    Caption = 'Filter By Sex'
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 7
    Height = 65
    Width = 401
    object cxLabel3: TcxLabel
      Left = 30
      Top = 24
      Caption = 'Sex '
    end
    object cmboSex: TcxComboBox
      Left = 66
      Top = 24
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'All'
        'Bulls'
        'Females'
        'Steers')
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 1
      Text = 'All'
      Width = 121
    end
  end
  object gbResults: TcxGroupBox [4]
    Left = 18
    Top = 232
    Caption = 'Results'
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 8
    Visible = False
    Height = 65
    Width = 401
    object cxLabel4: TcxLabel
      Left = 8
      Top = 26
      Caption = 'Total Animal Days'
    end
    object teTotalAnimalDays: TcxTextEdit
      Left = 100
      Top = 26
      Style.Color = clBtnFace
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 1
      Width = 41
    end
    object cxLabel5: TcxLabel
      Left = 150
      Top = 26
      Caption = 'Total Animals'
    end
    object teTotalAnimals: TcxTextEdit
      Left = 220
      Top = 26
      Style.Color = clBtnFace
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 3
      Width = 41
    end
    object cxLabel6: TcxLabel
      Left = 270
      Top = 28
      Caption = 'Average Days'
    end
    object teAvgDays: TcxTextEdit
      Left = 346
      Top = 26
      Style.Color = clBtnFace
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 5
      Width = 41
    end
  end
  object ProgressBar: TcxProgressBar [5]
    Left = 10
    Top = 200
    Properties.BeginColor = clBlue
    Properties.EndColor = clBlue
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 9
    Visible = False
    Width = 305
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
    Left = 65530
    Top = 228
    DockControlHeights = (
      0
      0
      42
      0)
  end
  inherited ActionList: TActionList
    Left = 65530
    Top = 216
  end
end
