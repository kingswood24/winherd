object fmSelectBuyer: TfmSelectBuyer
  Left = 595
  Top = 344
  BorderStyle = bsSingle
  Caption = 'Select Buyer'
  ClientHeight = 126
  ClientWidth = 308
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 17
  object lcboBuyers: TcxLookupComboBox
    Left = 21
    Top = 44
    Properties.DropDownListStyle = lsFixedList
    Properties.KeyFieldNames = 'ID'
    Properties.ListColumns = <
      item
        FieldName = 'Name'
      end>
    Properties.OnChange = lcboBuyersPropertiesChange
    TabOrder = 0
    Width = 263
  end
  object lSelectBuyer: TcxLabel
    Left = 21
    Top = 20
    Caption = 'Select Buyer:'
  end
  object btnOK: TcxButton
    Left = 135
    Top = 80
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = btnOKClick
    LookAndFeel.Kind = lfOffice11
  end
  object btnCancel: TcxButton
    Left = 215
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btnOKClick
    LookAndFeel.Kind = lfOffice11
  end
end
