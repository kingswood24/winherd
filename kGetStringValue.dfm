object fmkGetStringValue: TfmkGetStringValue
  Left = 635
  Top = 370
  Width = 288
  Height = 139
  Caption = 'fmkGetStringValue'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CaptionLabel: TLabel
    Left = 16
    Top = 8
    Width = 69
    Height = 13
    Caption = 'Select AI Date'
  end
  object BtnOK: TcxButton
    Left = 99
    Top = 62
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    LookAndFeel.NativeStyle = True
  end
  object cxButton2: TcxButton
    Left = 179
    Top = 62
    Width = 75
    Height = 25
    Caption = '&Cancel'
    TabOrder = 1
    LookAndFeel.NativeStyle = True
  end
  object cmboStringValues: TcxComboBox
    Left = 14
    Top = 30
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownSizeable = True
    Properties.ImmediatePost = True
    Properties.ImmediateUpdateText = True
    Properties.Revertable = True
    Properties.Sorted = True
    Properties.OnChange = cmboStringValuesPropertiesChange
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 2
    Width = 239
  end
end
