object fmClearHerdPassword: TfmClearHerdPassword
  Left = 470
  Top = 283
  BorderStyle = bsNone
  Caption = 'fmClearHerdPassword'
  ClientHeight = 119
  ClientWidth = 253
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pClearPass: TPanel
    Left = 0
    Top = 0
    Width = 253
    Height = 119
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label4: TLabel
      Left = 15
      Top = 14
      Width = 195
      Height = 13
      Caption = 'Enter password before continuing '
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object ClearPass: TEdit
      Left = 16
      Top = 34
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 10
      PasswordChar = '*'
      TabOrder = 0
    end
    object Button3: TButton
      Left = 75
      Top = 75
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 1
    end
    object Button4: TButton
      Left = 157
      Top = 75
      Width = 75
      Height = 25
      Caption = 'Cancel'
      Default = True
      ModalResult = 2
      TabOrder = 2
    end
  end
end
