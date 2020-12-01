object fmHUKIFarmEvents: TfmHUKIFarmEvents
  Left = 578
  Top = 269
  Width = 359
  Height = 284
  ActiveControl = deStartDate
  Caption = 'Milk Rec Company File Export'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 124
    Width = 49
    Height = 13
    Caption = 'Warnings:'
  end
  object Bevel1: TBevel
    Left = 8
    Top = 110
    Width = 327
    Height = 10
    Shape = bsTopLine
  end
  object cxButton1: TcxButton
    Left = 154
    Top = 74
    Width = 89
    Height = 25
    Caption = '&Begin Export'
    Default = True
    TabOrder = 0
    OnClick = cxButton1Click
    LookAndFeel.Kind = lfStandard
  end
  object cxLabel1: TcxLabel
    Left = 10
    Top = 36
    Caption = 'Enter a date to export events from: '
  end
  object deStartDate: TcxDateEdit
    Left = 204
    Top = 38
    Style.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.Kind = lfStandard
    TabOrder = 2
    Width = 125
  end
  object mWarnings: TcxMemo
    Left = 8
    Top = 140
    Lines.Strings = (
      '')
    Properties.ReadOnly = True
    Properties.ScrollBars = ssBoth
    Style.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 3
    Height = 101
    Width = 327
  end
  object cxClose: TcxButton
    Left = 248
    Top = 74
    Width = 79
    Height = 25
    Caption = '&Close'
    TabOrder = 4
    OnClick = cxCloseClick
    LookAndFeel.Kind = lfStandard
  end
  object cxLabel2: TcxLabel
    Left = 10
    Top = 6
    Caption = 'Last Millk Recording Date Entered: '
  end
  object deMilkRecordingDate: TcxDateEdit
    Left = 204
    Top = 6
    Enabled = False
    Style.BorderStyle = ebs3D
    Style.LookAndFeel.Kind = lfStandard
    Style.ButtonStyle = btsFlat
    Style.ButtonTransparency = ebtInactive
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.Kind = lfStandard
    TabOrder = 6
    Width = 125
  end
  object GenQuery: TQuery
    DatabaseName = 'Kingswd'
    Left = 168
    Top = 120
  end
  object SaveDialog: TSaveDialog
    FileName = 'UNI2FOX.CIS'
    InitialDir = 'A:\'
    Title = 'CIS Farm Events'
    Left = 200
    Top = 120
  end
end
