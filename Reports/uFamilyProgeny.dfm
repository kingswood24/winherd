object Form1: TForm1
  Left = 319
  Top = 210
  Width = 814
  Height = 523
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 56
    Width = 806
    Height = 68
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 37
      Width = 75
      Height = 16
      Caption = 'Select Cow'
    end
    object Label2: TLabel
      Left = 262
      Top = 38
      Width = 250
      Height = 16
      Caption = 'Building family progeny, please wait...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object DBComboBoxEh1: TDBComboBoxEh
      Left = 96
      Top = 34
      Width = 161
      Height = 24
      EditButtons = <>
      TabOrder = 0
      Text = 'DBComboBoxEh1'
      Visible = True
    end
    object CheckBox1: TCheckBox
      Left = 15
      Top = 8
      Width = 239
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Include Animals Left Herd'
      TabOrder = 1
    end
  end
  object Dock971: TDock97
    Left = 0
    Top = 0
    Width = 806
    Height = 56
    object Toolbar971: TToolbar97
      Left = 0
      Top = 0
      Caption = 'Toolbar971'
      DockPos = 0
      FullSize = True
      TabOrder = 0
      object RxSpeedButton1: TRxSpeedButton
        Left = 0
        Top = 0
        Width = 63
        Height = 52
        Caption = 'Exit'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
          03333377777777777F333301111111110333337F333333337F33330111111111
          0333337F333333337F333301111111110333337F333333337F33330111111111
          0333337F333333337F333301111111110333337F333333337F33330111111111
          0333337F3333333F7F333301111111B10333337F333333737F33330111111111
          0333337F333333337F333301111111110333337F33FFFFF37F3333011EEEEE11
          0333337F377777F37F3333011EEEEE110333337F37FFF7F37F3333011EEEEE11
          0333337F377777337F333301111111110333337F333333337F33330111111111
          0333337FFFFFFFFF7F3333000000000003333377777777777333}
        NumGlyphs = 2
      end
    end
  end
  object TreeView1: TTreeView
    Left = 0
    Top = 124
    Width = 806
    Height = 353
    Align = alClient
    Indent = 19
    TabOrder = 2
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 477
    Width = 806
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object qMain: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select ID, NatIDNum, LactNo, Name From Animals'
      'Where AnimalDeleted = False'
      'And Inherd = :IsInHerd'
      'And HerdID = :HID ')
    Left = 163
    Top = 10
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IsInHerd'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HID'
        ParamType = ptUnknown
      end>
  end
  object dsMain: TDataSource
    DataSet = qMain
    Left = 195
    Top = 10
  end
  object qDecendants: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select ID, NatIDNum, LactNo, Name From Animals '
      'Where DamID =:DID')
    Left = 251
    Top = 10
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DID'
        ParamType = ptUnknown
      end>
  end
  object dsDecendant: TDataSource
    DataSet = qDecendants
    Left = 283
    Top = 10
  end
end
