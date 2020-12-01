object fmUpdateSyncBulls: TfmUpdateSyncBulls
  Left = 470
  Top = 285
  BorderStyle = bsDialog
  Caption = 'Update Sync Bulls'
  ClientHeight = 183
  ClientWidth = 389
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object gbUpdateSyncBulls: TcxGroupBox
    Left = 26
    Top = 24
    Caption = 'Update Sync Bulls'
    Style.BorderStyle = ebsFlat
    TabOrder = 0
    Height = 131
    Width = 343
    object seNoBulls: TcxSpinEdit
      Left = 223
      Top = 44
      Properties.DisplayFormat = '0'
      Properties.EditFormat = '0'
      Style.BorderStyle = ebsFlat
      TabOrder = 0
      Width = 63
    end
    object lInfo: TcxLabel
      Left = 39
      Top = 46
      Caption = 'Specify max number of bulls : '
    end
    object btnUpdate: TcxButton
      Left = 130
      Top = 92
      Width = 75
      Height = 25
      Caption = 'Update'
      TabOrder = 2
      OnClick = btnUpdateClick
      LookAndFeel.Kind = lfOffice11
    end
    object btnClose: TcxButton
      Left = 210
      Top = 92
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 3
      OnClick = btnCloseClick
      LookAndFeel.Kind = lfOffice11
    end
  end
end
