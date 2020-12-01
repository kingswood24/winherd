object fmPrinterSetup: TfmPrinterSetup
  Left = 301
  Top = 185
  Width = 283
  Height = 374
  Caption = 'Printer Setup'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox: TcxListBox
    Left = 22
    Top = 28
    Width = 215
    Height = 255
    ItemHeight = 13
    Style.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 0
  end
  object cxButton1: TcxButton
    Left = 22
    Top = 288
    Width = 107
    Height = 25
    Caption = 'Set as Default'
    TabOrder = 1
    OnClick = cxButton1Click
    LookAndFeel.NativeStyle = True
  end
  object cxLabel1: TcxLabel
    Left = 22
    Top = 10
    Caption = 'Default Printer:'
  end
  object lDefaultPrinter: TcxLabel
    Left = 96
    Top = 10
    Caption = 'lDefaultPrinter'
  end
  object btnPrinterHandle: TcxButton
    Left = 132
    Top = 288
    Width = 107
    Height = 25
    Caption = 'Printer Info'
    TabOrder = 4
    OnClick = btnPrinterHandleClick
    LookAndFeel.NativeStyle = True
  end
end
