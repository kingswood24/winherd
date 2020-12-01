object fmAIMHerdRecImport: TfmAIMHerdRecImport
  Left = 497
  Top = 377
  BorderStyle = bsDialog
  ClientHeight = 99
  ClientWidth = 562
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 25
  object lProgress: TcxLabel
    Left = 0
    Top = 0
    Align = alTop
    AutoSize = False
    Caption = 'Updating Kingswood Herd..'
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Style.TextStyle = [fsBold]
    Height = 52
    Width = 562
  end
  object pbImportProgress: TcxProgressBar
    Left = 0
    Top = 52
    TabStop = False
    Align = alClient
    Properties.BarStyle = cxbsLEDs
    Properties.BeginColor = 9432559
    Properties.OverloadBeginColor = 9432559
    Properties.OverloadEndColor = 1413781
    Properties.PeakColor = 1413781
    Style.BorderStyle = ebsNone
    TabOrder = 1
    Width = 562
  end
  object StartTimer: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = StartTimerTimer
    Left = 520
    Top = 10
  end
end
