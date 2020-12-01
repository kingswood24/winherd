object fmGridColourSelection: TfmGridColourSelection
  Left = 578
  Top = 374
  Width = 481
  Height = 400
  Caption = 'Grid Colour Selection'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 17
    Top = 12
    Caption = 'Grid Colour Selection'
    Style.LookAndFeel.NativeStyle = True
    Style.TextStyle = [fsBold]
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 0
    Height = 309
    Width = 431
    object cxGroupBox2: TcxGroupBox
      Left = 18
      Top = 22
      Caption = 'Beef Heifer Ages (In Months)'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = True
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Height = 85
      Width = 400
      object seFemaleMonthFrom: TcxSpinEdit
        Left = 116
        Top = 22
        Properties.AssignedValues.MinValue = True
        Properties.ImmediatePost = True
        Properties.MaxValue = 96
        Properties.OnChange = seFemaleMonthFromPropertiesChange
        Style.LookAndFeel.NativeStyle = True
        Style.TextStyle = []
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Value = 1
        Width = 41
      end
      object cxLabel1: TcxLabel
        Left = 10
        Top = 22
        Caption = 'Highlight Between'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object ccbFemaleColourBetween: TcxColorComboBox
        Left = 295
        Top = 22
        RepositoryItem = HerdLookup.erColourCombo
        Properties.ColorComboStyle = cxccsComboList
        Properties.CustomColors = <
          item
            Color = clRed
            Description = 'Red'
          end
          item
            Color = clMaroon
            Description = 'Maroon'
          end
          item
            Color = clBlue
            Description = 'Blue'
          end
          item
            Color = clPurple
            Description = 'Purple'
          end>
        Properties.ImmediatePost = True
        Properties.MaxMRUColors = 0
        Properties.NamingConvention = cxncNone
        Properties.PrepareList = cxplNone
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 2
        Width = 52
      end
      object cxLabel2: TcxLabel
        Left = 253
        Top = 22
        Caption = 'Colour'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cbFemaleBoldBetween: TcxCheckBox
        Left = 348
        Top = 22
        Caption = 'Bold'
        ParentFont = False
        Properties.Alignment = taRightJustify
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 4
        Width = 47
      end
      object seFemaleMonthTo: TcxSpinEdit
        Left = 198
        Top = 22
        Properties.ImmediatePost = True
        Properties.MaxValue = 96
        Properties.MinValue = 1
        Properties.OnChange = seFemaleMonthToPropertiesChange
        Style.LookAndFeel.NativeStyle = True
        Style.TextStyle = []
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 5
        Value = 1
        Width = 41
      end
      object cxLabel7: TcxLabel
        Left = 167
        Top = 24
        Caption = 'and '
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxLabel8: TcxLabel
        Left = 10
        Top = 52
        Caption = 'Highlight Over'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object seFemaleMonthOver: TcxSpinEdit
        Left = 116
        Top = 52
        Properties.ImmediatePost = True
        Properties.MaxValue = 96
        Properties.MinValue = 1
        Properties.OnChange = seFemaleMonthOverPropertiesChange
        Style.LookAndFeel.NativeStyle = True
        Style.TextStyle = []
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 8
        Value = 1
        Width = 41
      end
      object ccbFemaleColourOver: TcxColorComboBox
        Left = 295
        Top = 52
        RepositoryItem = HerdLookup.erColourCombo
        Properties.ColorComboStyle = cxccsComboList
        Properties.CustomColors = <
          item
            Color = clRed
            Description = 'Red'
          end
          item
            Color = clMaroon
            Description = 'Maroon'
          end
          item
            Color = clBlue
            Description = 'Blue'
          end
          item
            Color = clPurple
            Description = 'Purple'
          end>
        Properties.ImmediatePost = True
        Properties.MaxMRUColors = 0
        Properties.NamingConvention = cxncNone
        Properties.PrepareList = cxplNone
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 9
        Width = 52
      end
      object cxLabel9: TcxLabel
        Left = 253
        Top = 52
        Caption = 'Colour'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cbFemaleBoldOver: TcxCheckBox
        Left = 348
        Top = 52
        Caption = 'Bold'
        ParentFont = False
        Properties.Alignment = taRightJustify
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 11
        Width = 47
      end
    end
    object cxGroupBox3: TcxGroupBox
      Left = 18
      Top = 111
      Caption = 'Beef Bull Ages (In Months)'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = True
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 1
      Height = 85
      Width = 400
      object seBullMonthsFrom: TcxSpinEdit
        Left = 116
        Top = 22
        Properties.AssignedValues.MinValue = True
        Properties.ImmediatePost = True
        Properties.MaxValue = 96
        Properties.OnChange = seBullMonthsFromPropertiesChange
        Style.LookAndFeel.NativeStyle = True
        Style.TextStyle = []
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Value = 1
        Width = 41
      end
      object cxLabel3: TcxLabel
        Left = 10
        Top = 22
        Caption = 'Highlight Between '
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object ccbBullColourBetween: TcxColorComboBox
        Left = 295
        Top = 22
        RepositoryItem = HerdLookup.erColourCombo
        Properties.ColorComboStyle = cxccsComboList
        Properties.CustomColors = <
          item
            Color = clRed
            Description = 'Red'
          end
          item
            Color = clMaroon
            Description = 'Maroon'
          end
          item
            Color = clBlue
            Description = 'Blue'
          end
          item
            Color = clPurple
            Description = 'Purple'
          end>
        Properties.ImmediatePost = True
        Properties.MaxMRUColors = 0
        Properties.NamingConvention = cxncNone
        Properties.PrepareList = cxplNone
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 2
        Width = 52
      end
      object cbBullBoldBetween: TcxCheckBox
        Left = 348
        Top = 22
        Caption = 'Bold'
        ParentFont = False
        Properties.Alignment = taRightJustify
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 3
        Width = 47
      end
      object cxLabel4: TcxLabel
        Left = 252
        Top = 22
        Caption = 'Colour'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxLabel10: TcxLabel
        Left = 167
        Top = 24
        Caption = 'and '
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object seBullMonthsTo: TcxSpinEdit
        Left = 198
        Top = 22
        Properties.ImmediatePost = True
        Properties.MaxValue = 96
        Properties.MinValue = 1
        Properties.OnChange = seBullMonthsToPropertiesChange
        Style.LookAndFeel.NativeStyle = True
        Style.TextStyle = []
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 6
        Value = 1
        Width = 41
      end
      object seBullMonthsOver: TcxSpinEdit
        Left = 116
        Top = 52
        Properties.ImmediatePost = True
        Properties.MaxValue = 96
        Properties.MinValue = 1
        Properties.OnChange = seBullMonthsOverPropertiesChange
        Style.LookAndFeel.NativeStyle = True
        Style.TextStyle = []
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 7
        Value = 1
        Width = 41
      end
      object cxLabel11: TcxLabel
        Left = 10
        Top = 52
        Caption = 'Highlight Over'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object ccbBullColourOver: TcxColorComboBox
        Left = 295
        Top = 52
        RepositoryItem = HerdLookup.erColourCombo
        Properties.ColorComboStyle = cxccsComboList
        Properties.CustomColors = <
          item
            Color = clRed
            Description = 'Red'
          end
          item
            Color = clMaroon
            Description = 'Maroon'
          end
          item
            Color = clBlue
            Description = 'Blue'
          end
          item
            Color = clPurple
            Description = 'Purple'
          end>
        Properties.ImmediatePost = True
        Properties.MaxMRUColors = 0
        Properties.NamingConvention = cxncNone
        Properties.PrepareList = cxplNone
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 9
        Width = 52
      end
      object cxLabel12: TcxLabel
        Left = 253
        Top = 52
        Caption = 'Colour'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cbBullBoldOver: TcxCheckBox
        Left = 348
        Top = 52
        Caption = 'Bold'
        ParentFont = False
        Properties.Alignment = taRightJustify
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 11
        Width = 47
      end
    end
    object cxGroupBox4: TcxGroupBox
      Left = 18
      Top = 199
      Caption = 'Steer Ages (In Months)'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = True
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 2
      Height = 85
      Width = 400
      object seSteerMonthsFrom: TcxSpinEdit
        Left = 116
        Top = 24
        Properties.AssignedValues.MinValue = True
        Properties.ImmediatePost = True
        Properties.MaxValue = 96
        Properties.OnChange = seSteerMonthsFromPropertiesChange
        Style.LookAndFeel.NativeStyle = True
        Style.TextStyle = []
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Value = 1
        Width = 41
      end
      object cxLabel5: TcxLabel
        Left = 10
        Top = 22
        Caption = 'Highlight Between '
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object ccbSteerColourBetween: TcxColorComboBox
        Left = 295
        Top = 22
        RepositoryItem = HerdLookup.erColourCombo
        Properties.ColorComboStyle = cxccsComboList
        Properties.CustomColors = <
          item
            Color = clRed
            Description = 'Red'
          end
          item
            Color = clMaroon
            Description = 'Maroon'
          end
          item
            Color = clBlue
            Description = 'Blue'
          end
          item
            Color = clPurple
            Description = 'Purple'
          end>
        Properties.ImmediatePost = True
        Properties.MaxMRUColors = 0
        Properties.NamingConvention = cxncNone
        Properties.PrepareList = cxplNone
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 2
        Width = 52
      end
      object cbSteerBoldBetween: TcxCheckBox
        Left = 348
        Top = 22
        Caption = 'Bold'
        ParentFont = False
        Properties.Alignment = taRightJustify
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 3
        Width = 47
      end
      object cxLabel6: TcxLabel
        Left = 253
        Top = 22
        Caption = 'Colour'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object seSteerMonthsOver: TcxSpinEdit
        Left = 116
        Top = 52
        Properties.ImmediatePost = True
        Properties.MaxValue = 96
        Properties.MinValue = 1
        Properties.OnChange = seSteerMonthsOverPropertiesChange
        Style.LookAndFeel.NativeStyle = True
        Style.TextStyle = []
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 5
        Value = 1
        Width = 41
      end
      object cxLabel13: TcxLabel
        Left = 10
        Top = 52
        Caption = 'Highlight Over'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object ccbSteerColourOver: TcxColorComboBox
        Left = 295
        Top = 52
        RepositoryItem = HerdLookup.erColourCombo
        Properties.ColorComboStyle = cxccsComboList
        Properties.CustomColors = <
          item
            Color = clRed
            Description = 'Red'
          end
          item
            Color = clMaroon
            Description = 'Maroon'
          end
          item
            Color = clBlue
            Description = 'Blue'
          end
          item
            Color = clPurple
            Description = 'Purple'
          end>
        Properties.ImmediatePost = True
        Properties.MaxMRUColors = 0
        Properties.NamingConvention = cxncNone
        Properties.PrepareList = cxplNone
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 7
        Width = 52
      end
      object cxLabel14: TcxLabel
        Left = 253
        Top = 52
        Caption = 'Colour'
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cbSteerBoldOver: TcxCheckBox
        Left = 348
        Top = 52
        Caption = 'Bold'
        ParentFont = False
        Properties.Alignment = taRightJustify
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 9
        Width = 47
      end
      object cxLabel15: TcxLabel
        Left = 167
        Top = 24
        Caption = 'and '
        ParentFont = False
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object seSteerMonthsTo: TcxSpinEdit
        Left = 198
        Top = 22
        Properties.ImmediatePost = True
        Properties.MaxValue = 96
        Properties.MinValue = 1
        Properties.OnChange = seSteerMonthsToPropertiesChange
        Style.LookAndFeel.NativeStyle = True
        Style.TextStyle = []
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 11
        Value = 1
        Width = 41
      end
    end
  end
  object btnCancel: TcxButton
    Left = 370
    Top = 331
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    LookAndFeel.NativeStyle = True
  end
  object btnOK: TcxButton
    Left = 290
    Top = 331
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    LookAndFeel.NativeStyle = True
  end
end
