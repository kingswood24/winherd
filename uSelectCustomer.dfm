object Form1: TForm1
  Left = 225
  Top = 190
  Width = 299
  Height = 158
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 16
    Width = 215
    Height = 16
    Caption = 'Please select a burial location:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Customers: TRxDBLookupCombo
    Left = 12
    Top = 40
    Width = 243
    Height = 24
    DropDownCount = 8
    DataField = 'Customer'
    DataSource = WinData.dsSaleDeath
    DisplayEmpty = '<Add>'
    EmptyValue = '0'
    LookupField = 'ID'
    LookupDisplay = 'Mame; Address 1'
    LookupSource = WinData.dsCustomers
    TabOrder = 0
  end
  object Button1: TButton
    Left = 104
    Top = 84
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = Button1Click
  end
end
