object fmCrushAnimalReview: TfmCrushAnimalReview
  Left = 255
  Top = 219
  BorderStyle = bsDialog
  ClientHeight = 237
  ClientWidth = 476
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 23
  object cxLabel1: TcxLabel
    Left = 42
    Top = 65
    Caption = 'Nat. Id. No.'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object cxLabel2: TcxLabel
    Left = 42
    Top = 30
    Caption = 'Farm Tag'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object cxLabel3: TcxLabel
    Left = 42
    Top = 100
    Caption = 'Weight'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object cxLabel4: TcxLabel
    Left = 41
    Top = 135
    Caption = 'Date of Weighing'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object lNatIDNum: TcxLabel
    Left = 224
    Top = 65
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object lFarmTag: TcxLabel
    Left = 224
    Top = 30
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object lDateOfWeighing: TcxLabel
    Left = 223
    Top = 135
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object lWeight: TcxLabel
    Left = 224
    Top = 100
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clGreen
    Style.Font.Height = -16
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object cxButton1: TcxButton
    Left = 152
    Top = 186
    Width = 165
    Height = 33
    Caption = 'OK'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 8
    LookAndFeel.Kind = lfStandard
  end
end
