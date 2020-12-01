object fmFileAttachmentImport: TfmFileAttachmentImport
  Left = 696
  Top = 351
  BorderStyle = bsDialog
  Caption = 'fmFileAttachmentImport'
  ClientHeight = 304
  ClientWidth = 461
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object Bevel1: TBevel
    Left = 14
    Top = 245
    Width = 429
    Height = 9
    Shape = bsTopLine
  end
  object cxLabel1: TcxLabel
    Left = 14
    Top = 8
    Caption = 'cxLabel1'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object btnOK: TcxButton
    Left = 256
    Top = 255
    Width = 90
    Height = 32
    Action = actImport
    Default = True
    ModalResult = 1
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
  end
  object btnCancel: TcxButton
    Left = 354
    Top = 255
    Width = 90
    Height = 32
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    LookAndFeel.Kind = lfOffice11
  end
  object cbIncludeAllFiles: TcxCheckBox
    Left = 14
    Top = 218
    Caption = 'Show files that have already been imported'
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 3
    OnClick = cbIncludeAllFilesClick
    Width = 363
  end
  object cxListView1: TcxListView
    Left = 16
    Top = 30
    Width = 431
    Height = 185
    Columns = <>
    ParentFont = False
    ReadOnly = True
    RowSelect = True
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 4
    ViewStyle = vsReport
  end
  object btnDelete: TcxButton
    Left = 14
    Top = 255
    Width = 123
    Height = 32
    Action = actMarkFileAsRead
    TabOrder = 5
    LookAndFeel.Kind = lfOffice11
  end
  object ActionList1: TActionList
    Left = 167
    Top = 257
    object actImport: TAction
      Caption = 'Import'
      OnUpdate = actImportUpdate
    end
    object actMarkFileAsRead: TAction
      Caption = 'Mark File As Read'
      OnExecute = actMarkFileAsReadExecute
      OnUpdate = actMarkFileAsReadUpdate
    end
  end
end
