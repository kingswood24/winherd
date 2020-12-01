object fmEmailClient: TfmEmailClient
  Left = 270
  Top = 249
  Width = 421
  Height = 202
  Caption = 'Kingswood Email Client'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object rgEmailClient: TcxRadioGroup
    Left = 24
    Top = 12
    Caption = 'Select your preferred Email Client'
    Properties.Items = <
      item
        Caption = 'Outlook Express, MS Outlook or Windows Mail'
      end
      item
        Caption = 'GMail / Hotmail / Windows Live'
      end>
    Properties.OnChange = rgEmailClientPropertiesChange
    Style.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 0
    Height = 101
    Width = 359
  end
  object btnOK: TcxButton
    Left = 222
    Top = 126
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
  end
  object btnCancel: TcxButton
    Left = 304
    Top = 126
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    LookAndFeel.Kind = lfOffice11
  end
  object btnGMailSettings: TcxButton
    Left = 24
    Top = 126
    Width = 101
    Height = 25
    Caption = 'Mail Settings'
    Default = True
    TabOrder = 3
    OnClick = btnGMailSettingsClick
    LookAndFeel.Kind = lfOffice11
  end
end
