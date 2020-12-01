object EventDesc: TEventDesc
  Left = 433
  Top = 305
  BorderStyle = bsDialog
  Caption = 'Detailed Event Description'
  ClientHeight = 288
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lEventCommentDesc: TLabel
    Left = 16
    Top = 8
    Width = 174
    Height = 16
    Caption = 'Detailed Event Description'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 320
    Top = 16
    Width = 78
    Height = 14
    Caption = 'Up to 240 Chars'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Button1: TButton
    Left = 239
    Top = 250
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object Button2: TButton
    Left = 319
    Top = 250
    Width = 75
    Height = 25
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object Button3: TButton
    Left = 159
    Top = 250
    Width = 75
    Height = 25
    Caption = '&Clear'
    TabOrder = 2
    OnClick = Button3Click
  end
  object dbmEventDesc: TDBMemo
    Left = 16
    Top = 32
    Width = 385
    Height = 209
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object dsEventDesc: TDataSource
    Left = 16
    Top = 248
  end
end
