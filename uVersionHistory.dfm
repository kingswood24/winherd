object fmVersionHistory: TfmVersionHistory
  Left = 431
  Top = 319
  BorderStyle = bsDialog
  Caption = 'Kingswood Herd Program Additions'
  ClientHeight = 351
  ClientWidth = 512
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object RichEdit: TRichEditWithLinks
    Left = 10
    Top = 10
    Width = 489
    Height = 271
    Color = clInfoBk
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      'RichEdit')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 1
    OnHyperlinkClicked = RichEditHyperlinkClicked
  end
  object Panel1: TPanel
    Left = 0
    Top = 318
    Width = 512
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object cbDoNotShowOnProgramStartup: TCheckBox
      Left = 8
      Top = 2
      Width = 181
      Height = 21
      Caption = 'Do not show on program startup'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Button1: TButton
      Left = 427
      Top = 4
      Width = 75
      Height = 25
      Caption = '&Close'
      Default = True
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object cxButton1: TcxButton
    Left = 82
    Top = 287
    Width = 68
    Height = 25
    Action = actNext
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object cxButton2: TcxButton
    Left = 10
    Top = 287
    Width = 68
    Height = 25
    Action = actPrevious
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object ActionList1: TActionList
    Left = 396
    Top = 124
    object actNext: TAction
      Caption = 'Next >'
      OnExecute = actNextExecute
      OnUpdate = actNextUpdate
    end
    object actPrevious: TAction
      Caption = '< Previous'
      OnExecute = actPreviousExecute
      OnUpdate = actPreviousUpdate
    end
  end
end
