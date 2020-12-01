object fmUpdateHealthUnits: TfmUpdateHealthUnits
  Left = 503
  Top = 363
  BorderStyle = bsDialog
  Caption = 'Update Health Units'
  ClientHeight = 161
  ClientWidth = 435
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
  object btnUpdate: TcxButton
    Left = 87
    Top = 103
    Width = 93
    Height = 25
    Caption = 'Update'
    TabOrder = 0
    OnClick = btnUpdateClick
    LookAndFeel.Kind = lfOffice11
  end
  object btnCancel: TcxButton
    Left = 249
    Top = 103
    Width = 100
    Height = 25
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = btnCancelClick
    LookAndFeel.Kind = lfOffice11
  end
  object deDateFrom: TcxDateEdit
    Left = 94
    Top = 66
    ParentFont = False
    Properties.ImmediatePost = True
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 2
    Width = 100
  end
  object deDateTo: TcxDateEdit
    Left = 264
    Top = 66
    ParentFont = False
    Properties.ImmediatePost = True
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 3
    Width = 100
  end
  object lDateFrom: TcxLabel
    Left = 50
    Top = 67
    Caption = 'From:'
  end
  object lDateTo: TcxLabel
    Left = 238
    Top = 67
    Caption = 'To:'
  end
  object lInfo: TcxLabel
    Left = 10
    Top = 4
    AutoSize = False
    Caption = 'lInfo'
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Height = 49
    Width = 417
  end
  object ProgressBar: TcxProgressBar
    Left = 10
    Top = 136
    ParentFont = False
    Properties.BarStyle = cxbsLEDs
    Properties.BeginColor = clBlue
    Properties.EndColor = clBlue
    Properties.OverloadValue = 10
    Properties.ShowText = False
    Properties.ShowTextStyle = cxtsPosition
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 7
    Width = 417
  end
end
