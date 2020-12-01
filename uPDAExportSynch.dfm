object PDAExportSynch: TPDAExportSynch
  Left = 371
  Top = 414
  Width = 415
  Height = 190
  Caption = 'Kingswood PDA Export '
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 48
    Width = 377
    Height = 17
    AutoSize = False
    Caption = 'Label1'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 16
    Top = 113
    Width = 373
    Height = 18
    Shape = bsTopLine
  end
  object Label2: TLabel
    Left = 16
    Top = 16
    Width = 66
    Height = 13
    Caption = 'Exporting...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 121
    Width = 352
    Height = 26
    Caption = 
      'The export might take a long time depending on what reports'#13#10'are' +
      ' exported.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object ProgressBar1: TProgressBar
    Left = 16
    Top = 88
    Width = 377
    Height = 17
    Min = 0
    Max = 100
    Smooth = True
    Step = 3
    TabOrder = 0
    Visible = False
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 250
    OnTimer = Timer1Timer
    Left = 368
    Top = 8
  end
end
