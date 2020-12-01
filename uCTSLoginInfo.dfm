object fmCTSLoginInfo: TfmCTSLoginInfo
  Left = 343
  Top = 309
  Width = 536
  Height = 287
  Caption = 'CTS WebServices User Information'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TcxPageControl
    Left = 6
    Top = 10
    Width = 507
    Height = 189
    ActivePage = tsCTSUserSetup
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = True
    TabHeight = 26
    TabOrder = 0
    TabWidth = 125
    ClientRectBottom = 185
    ClientRectLeft = 4
    ClientRectRight = 503
    ClientRectTop = 32
    object tsCTSUserSetup: TcxTabSheet
      Caption = 'CTS User Setup'
      ImageIndex = 0
      object gbCTSUser: TcxGroupBox
        Left = 18
        Top = 18
        Caption = 'CTS User Setup'
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Transparent = True
        Height = 103
        Width = 463
        object Label6: TLabel
          Left = 14
          Top = 32
          Width = 48
          Height = 13
          Caption = 'Username'
          Transparent = True
        end
        object Label7: TLabel
          Left = 14
          Top = 62
          Width = 46
          Height = 13
          Caption = 'Password'
          Transparent = True
        end
        object Label8: TLabel
          Left = 216
          Top = 62
          Width = 86
          Height = 13
          Caption = 'Confirm Password'
          Transparent = True
        end
        object teCTSUsername: TcxTextEdit
          Left = 70
          Top = 30
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          Width = 125
        end
        object teCTSPassword: TcxTextEdit
          Left = 70
          Top = 60
          Properties.EchoMode = eemPassword
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 1
          Width = 125
        end
        object teCTSConfirmPassword: TcxTextEdit
          Left = 318
          Top = 60
          Properties.EchoMode = eemPassword
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 2
          Width = 125
        end
      end
      object cbCTSDefault: TcxCheckBox
        Left = 18
        Top = 126
        Caption = ' Default'
        Properties.ImmediatePost = True
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 1
        Transparent = True
        OnClick = cbCTSDefaultClick
        Width = 69
      end
    end
    object tsSISUserSetup: TcxTabSheet
      Caption = 'SIS User Setup'
      ImageIndex = 1
      object gbSISUser: TcxGroupBox
        Left = 18
        Top = 18
        Caption = 'CTS User Setup'
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Transparent = True
        Height = 103
        Width = 463
        object Label1: TLabel
          Left = 33
          Top = 32
          Width = 48
          Height = 13
          Caption = 'Username'
          Transparent = True
        end
        object Label2: TLabel
          Left = 14
          Top = 62
          Width = 66
          Height = 13
          Caption = 'Email Address'
          Transparent = True
        end
        object teSISUsername: TcxTextEdit
          Left = 92
          Top = 30
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          Width = 125
        end
        object teSISEmailAddress: TcxTextEdit
          Left = 92
          Top = 60
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 1
          Width = 225
        end
      end
      object cbSISDefault: TcxCheckBox
        Left = 18
        Top = 126
        Caption = ' Default'
        Properties.ImmediatePost = True
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 1
        Transparent = True
        OnClick = cbSISDefaultClick
        Width = 69
      end
    end
  end
  object cxButton1: TcxButton
    Left = 352
    Top = 210
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    LookAndFeel.NativeStyle = True
  end
  object cxButton2: TcxButton
    Left = 434
    Top = 210
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    LookAndFeel.NativeStyle = True
  end
end
