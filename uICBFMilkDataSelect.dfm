object ICBFMilkDataSelect: TICBFMilkDataSelect
  Left = 298
  Top = 288
  BorderStyle = bsDialog
  Caption = 'ICBF Milk Data Import'
  ClientHeight = 127
  ClientWidth = 490
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object rgImportType: TcxRadioGroup
    Left = 20
    Top = 8
    Caption = 'Select the type of data you want to import from ICBF'
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = 'Milk Recordings and Lactation History'
      end
      item
        Caption = 'Milk Recordings Only'
      end
      item
        Caption = 'Lactation History Only'
      end
      item
        Caption = 'Do Nothing'
      end>
    ItemIndex = 0
    Style.LookAndFeel.Kind = lfFlat
    Style.TextStyle = []
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 0
    Height = 75
    Width = 453
  end
  object cxButton1: TcxButton
    Left = 396
    Top = 92
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
end
