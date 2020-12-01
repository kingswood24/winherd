object ProgressIndicator: TProgressIndicator
  Left = 557
  Top = 453
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'ProgressIndicator'
  ClientHeight = 30
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 0
    Width = 395
    Height = 30
    Align = alClient
    Min = 0
    Max = 100
    TabOrder = 0
  end
end
