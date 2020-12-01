object fmCMMSFileImport: TfmCMMSFileImport
  Left = 566
  Top = 394
  BorderStyle = bsDialog
  Caption = 'CMMS File Import'
  ClientHeight = 202
  ClientWidth = 349
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 14
    Top = 73
    Width = 224
    Height = 13
    Caption = '2) Select Purchase File (Movements In)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 14
    Top = 16
    Width = 205
    Height = 13
    Caption = '1) Select Sale File (Movements Out)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnPurchFile: TButton
    Left = 306
    Top = 91
    Width = 25
    Height = 22
    Caption = '...'
    TabOrder = 0
    OnClick = btnPurchFileClick
  end
  object tePurchFile: TEdit
    Left = 14
    Top = 91
    Width = 289
    Height = 21
    Color = clMenu
    ReadOnly = True
    TabOrder = 1
    OnDblClick = btnPurchFileClick
  end
  object btnSaleFile: TButton
    Left = 306
    Top = 34
    Width = 25
    Height = 22
    Caption = '...'
    TabOrder = 2
    OnClick = btnSaleFileClick
  end
  object teSaleFile: TEdit
    Left = 14
    Top = 34
    Width = 289
    Height = 21
    Color = clMenu
    ReadOnly = True
    TabOrder = 3
    OnDblClick = btnSaleFileClick
  end
  object pBarCurrent: TProgressBar
    Left = 16
    Top = 128
    Width = 289
    Height = 16
    Min = 0
    Max = 100
    Smooth = True
    TabOrder = 4
    Visible = False
  end
  object Button3: TButton
    Left = 230
    Top = 163
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 5
    OnClick = Button3Click
  end
  object btnImportSalePurch: TButton
    Left = 140
    Top = 163
    Width = 75
    Height = 25
    Caption = 'Import'
    TabOrder = 6
    OnClick = btnImportSalePurchClick
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.txt'
    Filter = 'CMMS File|*.txt'
    InitialDir = 'C:\'
    Left = 258
    Top = 4
  end
  object QueryAnimals: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select ID, NatIDNum, SearchNatID, HerdID, LactNo From Animals')
    Left = 18
    Top = 154
  end
  object Parser: TSPParser
    Sepchar = ','
    CharSearch = True
    Left = 230
    Top = 5
  end
end
