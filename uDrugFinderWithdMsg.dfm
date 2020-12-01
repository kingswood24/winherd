object fmDrugFinderWithdMsg: TfmDrugFinderWithdMsg
  Left = 647
  Top = 249
  BorderStyle = bsDialog
  Caption = 'Withdrawal Period Confirmation'
  ClientHeight = 326
  ClientWidth = 692
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 17
  object pDefault: TPanel
    Left = 0
    Top = 0
    Width = 692
    Height = 216
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object lInformation: TcxLabel
      Left = 0
      Top = 69
      Align = alClient
      AutoSize = False
      Caption = 
        'Although Kingswood have taken great care in checking the accurac' +
        'y of these withdrawal periods,'#13#10'it is important that you check w' +
        'ith your vet or look up the latest information on the HPRA websi' +
        'te '#13#10'to ensure that the withdrawal periods are up to date.'
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Height = 78
      Width = 692
    end
    object lReponsibilityMsg: TcxLabel
      Left = 0
      Top = 172
      Align = alBottom
      AutoSize = False
      Caption = 
        'It is your responsibilty to ensure the accuracy of these withdra' +
        'wal periods.'
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -19
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold, fsItalic]
      Style.IsFontAssigned = True
      Height = 44
      Width = 692
    end
    object pDrugInfo: TPanel
      Left = 0
      Top = 0
      Width = 692
      Height = 69
      Align = alTop
      BevelOuter = bvNone
      Color = clInfoBk
      TabOrder = 2
      object lDrugName: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        AutoSize = False
        Caption = 'lDrugName'
        ParentColor = False
        ParentFont = False
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Style.Color = clInfoBk
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -16
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Height = 38
        Width = 692
      end
      object lMilkHead: TcxLabel
        Left = 383
        Top = 40
        AutoSize = False
        Caption = 'Milk:'
        ParentFont = False
        Properties.Alignment.Vert = taVCenter
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -16
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        Height = 24
        Width = 43
      end
      object lMilkDays: TcxLabel
        Left = 431
        Top = 40
        Caption = 'lMilkDays'
        ParentFont = False
        Properties.Alignment.Vert = taVCenter
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -16
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object lMeatHead: TcxLabel
        Left = 181
        Top = 40
        AutoSize = False
        Caption = 'Meat:'
        ParentFont = False
        Properties.Alignment.Vert = taVCenter
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -16
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        Height = 24
        Width = 47
      end
      object lMeatDays: TcxLabel
        Left = 232
        Top = 40
        Caption = 'lMeatDays'
        ParentFont = False
        Properties.Alignment.Vert = taVCenter
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -16
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
    end
    object lPeriodMsg: TcxLabel
      Left = 0
      Top = 147
      Align = alBottom
      AutoSize = False
      Caption = 
        'NOTE : These withdrawal periods are subject to change and are va' +
        'lid as of January 2018.'
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      Height = 25
      Width = 692
    end
    object lHPRALink: TcxLabel
      Left = 570
      Top = 96
      Cursor = crHandPoint
      Caption = 'HPRA'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -15
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      OnClick = lHPRALinkClick
    end
  end
  object btnYes: TcxButton
    Left = 200
    Top = 270
    Width = 114
    Height = 42
    Caption = 'Yes'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2B9348FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF2B934831A6482B9348FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF399B6131A64831A64831A6482B9348FF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      2B934831A64837B75533A15831A6482B9348FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF3F946631A64837B7552F8D582F8D5837B75543
      A14637B755FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2B9348
      37B7552F8D58FF00FFFF00FF2F8D5837B7552B9348FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF2F8D58FF00FFFF00FFFF00FFFF00FF2F
      8D5837B7552B9348FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2F8D5837B75537B755FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FF2F8D5831A648FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2F8D5831A648FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF2F8D5831A648FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2F8D
      5831A648FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FF2F8D5831A648FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FF2F8D58FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    LookAndFeel.Kind = lfOffice11
  end
  object btnNo: TcxButton
    Left = 376
    Top = 270
    Width = 114
    Height = 42
    Caption = 'No'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 1
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000320B0000320B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FF002EE41B48FBFF00FF1B48FB002EE4FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FF002EE41B48FBFF00FFFF00FF1B48FB
      3E5EFF002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF002E
      E41B48FBFF00FFFF00FFFF00FF1B48FB1B48FB3E5EFF002EE4FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF002EE41B48FBFF00FFFF00FFFF00FFFF00FFFF00FF
      3E5EFF1B48FB3E5EFF002EE4FF00FFFF00FFFF00FFFF00FF002EE41B48FBFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB3E5EFF002EE4FF
      00FFFF00FF002EE4002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF1B48FB3E5EFF002EE4002EE4002EE4FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB1B
      48FB1B48FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF1B48FB3E5EFF1B48FB3E5EFF002EE4FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB3E5EFF002EE4FF
      00FFFF00FF1B48FB002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF1B48FB3E5EFF002EE4FF00FFFF00FFFF00FFFF00FF1B48FB002EE4FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB3E5EFF002EE4FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF1B48FB002EE4FF00FFFF00FFFF00FFFF00FF1B48FB
      6482FF002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FF002EE4FF00FFFF00FF1B48FB6482FF002EE4FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB1B48FB
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    LookAndFeel.Kind = lfOffice11
  end
  object lConfirmation: TcxLabel
    Left = 0
    Top = 216
    Align = alTop
    AutoSize = False
    Caption = '  Do you want to use the specified withdrawal periods?  '
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Height = 42
    Width = 692
  end
end
