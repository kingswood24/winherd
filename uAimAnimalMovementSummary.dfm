object fmAimAnimalMovementSummary: TfmAimAnimalMovementSummary
  Left = 415
  Top = 279
  ActiveControl = ListBox
  BorderStyle = bsDialog
  Caption = 'AIM Animal Movement Import Summary'
  ClientHeight = 444
  ClientWidth = 732
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 17
  object Bevel1: TBevel
    Left = 14
    Top = 393
    Width = 702
    Height = 9
    Shape = bsTopLine
  end
  object btnClose: TcxButton
    Left = 619
    Top = 402
    Width = 99
    Height = 32
    Caption = 'Close'
    Default = True
    ModalResult = 1
    TabOrder = 2
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = True
  end
  object ListBox: TcxListBox
    Left = 14
    Top = 34
    Width = 171
    Height = 343
    ItemHeight = 26
    ListStyle = lbOwnerDrawVariable
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 0
    OnClick = ListBoxClick
  end
  object Memo: TcxMemo
    Left = 192
    Top = 34
    Lines.Strings = (
      'Memo')
    Properties.ReadOnly = True
    Properties.ScrollBars = ssBoth
    TabOrder = 1
    Height = 343
    Width = 523
  end
  object cxLabel7: TcxLabel
    Left = 14
    Top = 12
    Caption = 'Imported '
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object cxLabel8: TcxLabel
    Left = 192
    Top = 12
    Caption = 'Details'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
end
