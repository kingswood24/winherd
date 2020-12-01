object fmActionWarningReminderParams: TfmActionWarningReminderParams
  Left = 529
  Top = 235
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Actions\Warnings\Reminders Parameters'
  ClientHeight = 181
  ClientWidth = 396
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 20
    Top = 14
    Width = 359
    Height = 124
    Caption = 'Action Parameters'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object lServiceWithin: TcxLabel
      Left = 45
      Top = 24
      Caption = 'Action due within no. of days'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object seActionWithinDays: TcxSpinEdit
      Left = 253
      Top = 23
      ParentFont = False
      Properties.ImmediatePost = True
      Properties.MaxValue = 120
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      Value = 4
      Width = 41
    end
    object cxLabel1: TcxLabel
      Left = 45
      Top = 89
      Caption = 'Days before calving for drying off'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object seDaysforDryingOff: TcxSpinEdit
      Left = 253
      Top = 88
      ParentFont = False
      Properties.ImmediatePost = True
      Properties.MaxValue = 120
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 2
      Value = 70
      Width = 41
    end
    object cxLabel2: TcxLabel
      Left = 45
      Top = 56
      Caption = 'Days after calving for first service'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object seDaysForFirstService: TcxSpinEdit
      Left = 253
      Top = 55
      ParentFont = False
      Properties.ImmediatePost = True
      Properties.MaxValue = 120
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 1
      Value = 42
      Width = 41
    end
  end
  object cxButton1: TcxButton
    Left = 220
    Top = 146
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object cxButton2: TcxButton
    Left = 302
    Top = 146
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object cbShowOnStartup: TcxCheckBox
    Left = 22
    Top = 148
    Caption = 'Show Report On Program Startup'
    TabOrder = 3
    OnClick = cbShowOnStartupClick
    Width = 187
  end
end
