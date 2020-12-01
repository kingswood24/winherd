object fRetagScr: TfRetagScr
  Left = 472
  Top = 301
  Width = 318
  Height = 233
  Caption = 'Retag'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 7
    Top = 72
    Width = 96
    Height = 16
    Caption = 'Animal Number'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 7
    Top = 104
    Width = 58
    Height = 16
    Caption = 'New Tag'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 7
    Top = 136
    Width = 51
    Height = 16
    Caption = 'Old Tag'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 7
    Top = 168
    Width = 47
    Height = 16
    Caption = 'Remark'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 310
    Height = 53
    ButtonHeight = 45
    ButtonWidth = 86
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    TabOrder = 0
    object ToolButton3: TToolButton
      Left = 0
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsDivider
    end
    object RxSpeedButton1: TRxSpeedButton
      Left = 8
      Top = 2
      Width = 59
      Height = 45
      Caption = '&Exit'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333388888888888F333301111111110333338F333333338F33330111111111
        0333338F333333338F333301111111110333338F333333338F33330111111111
        0333338F333333338F333301111111110333338F333333338F33330111111111
        0333338F3333333F8F333301111111B10333338F333333838F33330111111111
        0333338F333333338F333301111111110333338F33FFFFF38F3333011EEEEE11
        0333338F388888F38F3333011EEEEE110333338F38FFF8F38F3333011EEEEE11
        0333338F388888338F333301111111110333338F333333338F33330111111111
        0333338FFFFFFFFF8F3333000000000003333388888888888333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = RxSpeedButton1Click
    end
    object ToolButton2: TToolButton
      Left = 67
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsDivider
    end
  end
  object AnimalNo: TDBEditEh
    Left = 120
    Top = 68
    Width = 89
    Height = 22
    Color = 14869218
    EditButtons = <>
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    Flat = True
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    Text = 'AnimalNo'
    Visible = True
  end
  object NewTag: TDBEditEh
    Left = 120
    Top = 100
    Width = 152
    Height = 22
    AlwaysShowBorder = True
    Color = 14869218
    EditButtons = <>
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    Flat = True
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    Text = 'NewTag'
    Visible = True
  end
  object OldTag: TDBEditEh
    Left = 120
    Top = 132
    Width = 152
    Height = 22
    AlwaysShowBorder = True
    Color = 14869218
    EditButtons = <>
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    Flat = True
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    Text = 'OldTag'
    Visible = True
  end
  object Remark: TDBEditEh
    Left = 120
    Top = 164
    Width = 177
    Height = 22
    AlwaysShowBorder = True
    Color = 14869218
    EditButtons = <>
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    Flat = True
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    Text = 'Remark'
    Visible = True
  end
  object qRetag: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select AF.OldItem, AF.Remark'
      'From afdoa AF'
      'Where (AF.AID=:ID)'
      'AND AF.ItemChanged =:Item ')
    Left = 224
    Top = 52
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Item'
        ParamType = ptUnknown
      end>
  end
end
