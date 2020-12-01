object fmElectronicWeighingSettings: TfmElectronicWeighingSettings
  Left = 534
  Top = 318
  Width = 472
  Height = 332
  Caption = 'Electronic Weighing Settings'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object gbOptions: TcxGroupBox
    Left = 18
    Top = 55
    Caption = 'Equipment Options'
    Style.LookAndFeel.Kind = lfFlat
    Style.TextStyle = [fsBold]
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 0
    Height = 232
    Width = 427
    object cmboManufacturer: TcxComboBox
      Left = 23
      Top = 48
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'asd')
      Properties.OnChange = cmboManufacturerPropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 0
      Width = 380
    end
    object lManufacturer: TcxLabel
      Left = 21
      Top = 26
      Caption = 'Select Equipment Manufacturer '
    end
    object lOutputDirectory: TcxLabel
      Left = 21
      Top = 81
      Caption = 'Default Output Directory '
    end
    object teOutputDirectory: TcxTextEdit
      Left = 23
      Top = 103
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 3
      Width = 363
    end
    object cbExportFileOnClose: TcxCheckBox
      Left = 19
      Top = 138
      Caption = 'Export Animal Information to Electronic Equipment on close'
      Properties.MultiLine = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 4
      Width = 379
    end
    object btnFindDirectory: TcxButton
      Left = 388
      Top = 103
      Width = 21
      Height = 25
      Caption = '...'
      TabOrder = 5
      OnClick = btnFindDirectoryClick
      LookAndFeel.Kind = lfFlat
    end
    object btnOK: TcxButton
      Left = 336
      Top = 190
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 6
      LookAndFeel.NativeStyle = True
    end
    object cbExportDateOfBirthTruTest: TcxCheckBox
      Left = 19
      Top = 166
      Caption = 'Export Animal Date of Birth'
      Properties.MultiLine = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 7
      Width = 295
    end
    object cbExportLastWeightTruTest: TcxCheckBox
      Left = 19
      Top = 194
      Caption = 'Export Animal Last Weight'
      Properties.MultiLine = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 8
      Width = 295
    end
  end
  object lInformation: TcxLabel
    Left = 18
    Top = 9
    AutoSize = False
    Caption = 
      'Before you can use the Electronic Weighings facility you must se' +
      'lect '#13#10'the Equipment Manufacturer and the Default Output Directo' +
      'ry.'
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Height = 41
    Width = 427
  end
  object ShellBrowserDialog: TcxShellBrowserDialog
    LookAndFeel.Kind = lfFlat
    Path = 'C:\'
    Left = 318
    Top = 239
  end
end
