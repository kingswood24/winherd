object fmNBASVenNoUpdate: TfmNBASVenNoUpdate
  Left = 297
  Top = 263
  BorderStyle = bsDialog
  Caption = 'NBAS Ven No Update'
  ClientHeight = 103
  ClientWidth = 243
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 12
    Width = 57
    Height = 13
    Caption = 'Enter Code '
  end
  object Label2: TLabel
    Left = 117
    Top = 27
    Width = 6
    Height = 13
    Caption = '_'
  end
  object Label3: TLabel
    Left = 190
    Top = 27
    Width = 6
    Height = 13
    Caption = '_'
  end
  object ePermitType: TEdit
    Left = 200
    Top = 28
    Width = 19
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 1
    TabOrder = 0
  end
  object Button1: TButton
    Left = 86
    Top = 64
    Width = 69
    Height = 25
    Caption = '&Update'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 164
    Top = 64
    Width = 69
    Height = 25
    Caption = '&Close'
    TabOrder = 2
    OnClick = Button2Click
  end
  object eVenNoRange: TEdit
    Left = 16
    Top = 28
    Width = 97
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
  end
  object eSerialNoAllocs: TEdit
    Left = 126
    Top = 28
    Width = 59
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 4
  end
end