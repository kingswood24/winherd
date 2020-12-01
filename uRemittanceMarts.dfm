object fmRemittanceMarts: TfmRemittanceMarts
  Left = 350
  Top = 307
  Width = 423
  Height = 127
  Caption = 'Select Slaughter Plant'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 16
  object Button1: TButton
    Left = 236
    Top = 50
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object Button2: TButton
    Left = 316
    Top = 50
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object cmbMartNames: TcxComboBox
    Left = 20
    Top = 14
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownSizeable = True
    Properties.ImmediatePost = True
    Properties.OnChange = cmbMartNamesChange
    Style.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.Kind = lfStandard
    TabOrder = 2
    Width = 377
  end
end
