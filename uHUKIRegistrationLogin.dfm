object HUKIRegistrationLogin: THUKIRegistrationLogin
  Left = 368
  Top = 275
  BorderStyle = bsDialog
  Caption = 'HUK Registration Login'
  ClientHeight = 128
  ClientWidth = 314
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 128
    Width = 299
    Height = 9
    Shape = bsTopLine
  end
  object lErrorCode: TLabel
    Left = 8
    Top = 140
    Width = 34
    Height = 13
    Caption = 'Error: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lErrorMsg: TLabel
    Left = 8
    Top = 160
    Width = 299
    Height = 49
    AutoSize = False
    Caption = 'Error: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Bevel2: TBevel
    Left = 8
    Top = 88
    Width = 299
    Height = 5
    Shape = bsTopLine
  end
  object teHerdPrefix: TcxTextEdit
    Left = 105
    Top = 18
    Properties.CharCase = ecUpperCase
    Style.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.Kind = lfStandard
    TabOrder = 0
    Width = 117
  end
  object teSecurityPin: TcxTextEdit
    Left = 105
    Top = 48
    Properties.CharCase = ecUpperCase
    Properties.PasswordChar = '*'
    Style.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.Kind = lfStandard
    TabOrder = 1
    Width = 68
  end
  object cxLabel1: TcxLabel
    Left = 32
    Top = 20
    Caption = 'Herd Prefix'
  end
  object cxLabel2: TcxLabel
    Left = 32
    Top = 50
    Caption = 'Security Pin'
  end
  object btnLogin: TcxButton
    Left = 222
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Login'
    Default = True
    TabOrder = 4
    OnClick = btnLoginClick
    LookAndFeel.Kind = lfStandard
  end
  object pStatus: TPanel
    Left = 10
    Top = 8
    Width = 293
    Height = 114
    BevelOuter = bvNone
    TabOrder = 5
    object Label1: TLabel
      Left = 64
      Top = 24
      Width = 152
      Height = 16
      Caption = 'Logging into HUK server....'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
end
