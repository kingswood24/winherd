object fNotification: TfNotification
  Left = 427
  Top = 315
  BorderStyle = bsDialog
  Caption = 'Version History'
  ClientHeight = 278
  ClientWidth = 510
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 245
    Width = 510
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object cbShowAgain: TCheckBox
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
  object RichEdit: TRichEditWithLinks
    Left = 10
    Top = 10
    Width = 489
    Height = 199
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
  object cxButton1: TcxButton
    Left = 82
    Top = 212
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
    Top = 212
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
