object fmAPHISWSCredentials: TfmAPHISWSCredentials
  Left = 455
  Top = 337
  BorderStyle = bsDialog
  Caption = 'APHIS Web Service Login Details'
  ClientHeight = 280
  ClientWidth = 539
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object gbAPHISCredentials: TcxGroupBox
    Left = 24
    Top = 26
    Caption = 'Enter your APHIS Credentials'
    Style.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 0
    Height = 219
    Width = 489
    object tbGatewayId: TcxTextEdit
      Left = 166
      Top = 100
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 2
      Width = 183
    end
    object tbPassword: TcxTextEdit
      Left = 166
      Top = 70
      Properties.EchoMode = eemPassword
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 1
      Width = 183
    end
    object cxLabel1: TcxLabel
      Left = 88
      Top = 102
      AutoSize = False
      Caption = 'Gateway Id.:'
      Properties.Alignment.Horz = taRightJustify
      Height = 17
      Width = 75
    end
    object cxLabel2: TcxLabel
      Left = 88
      Top = 72
      AutoSize = False
      Caption = 'Password:'
      Properties.Alignment.Horz = taRightJustify
      Height = 17
      Width = 75
    end
    object tbCustomerId: TcxTextEdit
      Left = 166
      Top = 40
      Properties.MaxLength = 12
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 0
      Width = 183
    end
    object cxLabel3: TcxLabel
      Left = 88
      Top = 42
      AutoSize = False
      Caption = 'Customer Id.:'
      Properties.Alignment.Horz = taRightJustify
      Height = 17
      Width = 75
    end
    object btnSave: TcxButton
      Left = 296
      Top = 166
      Width = 75
      Height = 25
      Caption = 'Save'
      Default = True
      ModalResult = 1
      TabOrder = 6
      LookAndFeel.NativeStyle = True
    end
    object btnCancel: TcxButton
      Left = 380
      Top = 166
      Width = 75
      Height = 25
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 7
      LookAndFeel.NativeStyle = True
    end
  end
end
