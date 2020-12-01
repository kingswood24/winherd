object fmNokiaSettings: TfmNokiaSettings
  Left = 438
  Top = 326
  BorderStyle = bsSingle
  Caption = 'Nokia Phone Link - Settings'
  ClientHeight = 163
  ClientWidth = 271
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 271
    Height = 144
    Align = alClient
    Shape = bsFrame
  end
  object TestConnection: TRxSpeedButton
    Left = 18
    Top = 98
    Width = 107
    Height = 25
    Caption = 'Test Connection'
    OnClick = TestConnectionClick
  end
  object Label1: TLabel
    Left = 34
    Top = 23
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = 'COM Port'
  end
  object Label2: TLabel
    Left = 34
    Top = 52
    Width = 86
    Height = 13
    Alignment = taRightJustify
    Caption = 'Connection Via'
  end
  object RxSpeedButton1: TRxSpeedButton
    Left = 144
    Top = 98
    Width = 107
    Height = 25
    Caption = 'Close'
    ModalResult = 1
    OnClick = RxSpeedButton1Click
  end
  object ConnectMode: TComboBox
    Left = 134
    Top = 50
    Width = 93
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = 'DLR-3'
    OnChange = ConnectModeChange
    Items.Strings = (
      'DAU-9P'
      'DLR-3'
      'InfraRed')
  end
  object COM: TComboBox
    Left = 134
    Top = 18
    Width = 93
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = '1'
    OnChange = COMChange
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5')
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 144
    Width = 271
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object SMS: TOxygenSMS
    ComNumber = 0
    ConnectionMode = 0
    Model = 0
    AutoDeleteMessages = False
    AutoDeleteReports = False
    SendTimeOut = 17
    Left = 8
    Top = 32
  end
end
