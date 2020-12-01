object fmICBFEventExportStatus: TfmICBFEventExportStatus
  Left = 352
  Top = 284
  BorderStyle = bsDialog
  Caption = 'ICBF Event Recording System'
  ClientHeight = 131
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lWait: TLabel
    Left = 33
    Top = 14
    Width = 360
    Height = 16
    Caption = 'Please wait... listing all events since last registration. '
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object lNoEvents: TLabel
    Left = 35
    Top = 14
    Width = 356
    Height = 70
    Caption = 
      'No new events have been found since last registration. '#13#10#13#10'To in' +
      'clude earlier events, change the From/To dates and '#13#10'click "Relo' +
      'ad Events" button'
    FocusControl = btnNoEventsOK
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object btnNoEventsOK: TButton
    Left = 175
    Top = 94
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 0
    OnClick = btnNoEventsOKClick
  end
end
