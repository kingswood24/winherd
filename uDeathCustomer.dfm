object fDeathCustomer: TfDeathCustomer
  Left = 366
  Top = 258
  Width = 306
  Height = 138
  Caption = 'Customer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 16
    Width = 207
    Height = 16
    Caption = 'Please select place of disposal '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 124
    Top = 68
    Width = 75
    Height = 25
    Caption = 'Select'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
  end
  object CustomerD: TRxDBLookupCombo
    Left = 12
    Top = 36
    Width = 273
    Height = 23
    DropDownCount = 8
    EmptyValue = '0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    LookupField = 'ID'
    LookupDisplay = 'Name'
    LookupSource = WinData.dsCustomers
    ParentFont = False
    TabOrder = 1
  end
  object Button2: TButton
    Left = 208
    Top = 68
    Width = 75
    Height = 25
    Caption = 'Cancel'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 2
  end
end