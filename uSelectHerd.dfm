object fmSelectHerd: TfmSelectHerd
  Left = 456
  Top = 444
  Width = 294
  Height = 125
  Caption = 'Select Herd to Record Events'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  object HerdCombo: TRxDBLookupCombo
    Left = 20
    Top = 21
    Width = 243
    Height = 25
    DropDownCount = 8
    DisplayEmpty = 'Select Herd'
    EmptyValue = '0'
    LookupField = 'ID'
    LookupDisplay = 'HerdIdentity;Name'
    LookupSource = WinData.dsHerdDefaults
    TabOrder = 0
    OnChange = HerdComboCloseUp
    OnCloseUp = HerdComboCloseUp
  end
  object Button1: TButton
    Left = 96
    Top = 62
    Width = 78
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 184
    Top = 62
    Width = 78
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
