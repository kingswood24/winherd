object fmAnimalBrowserEventBase: TfmAnimalBrowserEventBase
  Left = 365
  Top = 214
  Width = 556
  Height = 409
  Caption = 'fmAnimalBrowserEventBase'
  Color = 15987699
  Font.Charset = ANSI_CHARSET
  Font.Color = 6316128
  Font.Height = -19
  Font.Name = 'Segoe UI'
  Font.Style = [fsBold]
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 25
  object btnAddEvent: TcxButton
    Left = 271
    Top = 283
    Width = 118
    Height = 58
    Cursor = crHandPoint
    Action = actSave
    Anchors = [akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindow
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Colors.Normal = 6409593
    LookAndFeel.Kind = lfFlat
  end
  object cxButton1: TcxButton
    Left = 399
    Top = 281
    Width = 118
    Height = 58
    Cursor = crHandPoint
    Action = actCancel
    Anchors = [akRight, akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindow
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Colors.Normal = 4951795
    LookAndFeel.Kind = lfFlat
  end
  object ActionList: TActionList
    Left = 488
    Top = 14
    object actSave: TAction
      Caption = 'Save'
      OnExecute = actSaveExecute
    end
    object actCancel: TAction
      Caption = 'Cancel'
      OnExecute = actCancelExecute
    end
  end
end
