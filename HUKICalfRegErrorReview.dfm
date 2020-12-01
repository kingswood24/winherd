object fmHUKICalfRegErrorReview: TfmHUKICalfRegErrorReview
  Left = 231
  Top = 221
  Width = 583
  Height = 363
  Caption = 'Calf Registration - Review'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxMemo1: TcxMemo
    Left = 0
    Top = 0
    Align = alTop
    Lines.Strings = (
      '')
    Properties.ReadOnly = True
    Properties.ScrollBars = ssBoth
    Style.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.Kind = lfStandard
    TabOrder = 0
    Height = 263
    Width = 575
  end
  object cxButton1: TcxButton
    Left = 460
    Top = 282
    Width = 75
    Height = 25
    Caption = 'Close'
    Default = True
    ModalResult = 1
    TabOrder = 1
    LookAndFeel.Kind = lfStandard
  end
end
