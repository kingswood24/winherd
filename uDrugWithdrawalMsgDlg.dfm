object DrugWithdrawalMsgDlg: TDrugWithdrawalMsgDlg
  Left = 320
  Top = 283
  BorderStyle = bsDialog
  Caption = 'Kingswood Herd '
  ClientHeight = 153
  ClientWidth = 452
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Image1: TImage
    Left = 10
    Top = 7
    Width = 32
    Height = 32
  end
  object TreeList: TcxTreeList
    Left = 60
    Top = 46
    Width = 373
    Height = 57
    BorderStyle = cxcbsNone
    Bands = <
      item
        Options.Customizing = False
        Options.Moving = False
        Options.Sizing = False
      end>
    BufferedPaint = False
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
    OptionsBehavior.ConfirmDelete = False
    OptionsBehavior.Sorting = False
    OptionsBehavior.ShowHourGlass = False
    OptionsCustomizing.BandCustomizing = False
    OptionsCustomizing.BandHorzSizing = False
    OptionsCustomizing.BandMoving = False
    OptionsCustomizing.BandVertSizing = False
    OptionsCustomizing.ColumnCustomizing = False
    OptionsCustomizing.ColumnHorzSizing = False
    OptionsCustomizing.ColumnMoving = False
    OptionsCustomizing.ColumnVertSizing = False
    OptionsData.CancelOnExit = False
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsSelection.CellSelect = False
    OptionsSelection.HideFocusRect = False
    OptionsSelection.HideSelection = True
    OptionsSelection.InvertSelect = False
    OptionsView.ScrollBars = ssNone
    OptionsView.Buttons = False
    OptionsView.ColumnAutoWidth = True
    OptionsView.Headers = False
    OptionsView.ShowRoot = False
    OptionsView.TreeLineStyle = tllsNone
    OptionsView.UseImageIndexForSelected = False
    OptionsView.UseNodeColorForIndent = False
    Styles.Background = HeadingStyle
    TabOrder = 0
    TabStop = False
    Data = {
      02000400DE0000000F00000044617461436F6E74726F6C6C6572310200000012
      000000546378537472696E6756616C7565547970651200000054637853747269
      6E6756616C7565547970650300000000000A0000004576656E74204461746501
      00001B000000446179732053696E63652054726561746D656E7420426567616E
      3A010000150000004D696C6B205769746864726177616C20446174653A010300
      000000000000100000000000000000000000FFFFFFFF01000000100000000000
      000000000000FFFFFFFF02000000100000000000000000000000FFFFFFFF}
    object MasterColumn: TcxTreeListColumn
      Styles.Content = HeadingStyle
      DataBinding.ValueType = 'String'
      Options.CellEndEllipsis = False
      Options.Sizing = False
      Options.Customizing = False
      Options.Editing = False
      Options.Focusing = False
      Options.IncSearch = False
      Options.Moving = False
      Options.Sorting = False
      Options.TabStop = False
      Width = 180
      Position.ColIndex = 0
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
    object DetailColumn: TcxTreeListColumn
      Styles.Content = WarningStyle
      DataBinding.ValueType = 'String'
      Options.CellEndEllipsis = False
      Options.Sizing = False
      Options.Customizing = False
      Options.Editing = False
      Options.Focusing = False
      Options.IncSearch = False
      Options.Moving = False
      Options.Sorting = False
      Options.TabStop = False
      Width = 320
      Position.ColIndex = 1
      Position.RowIndex = 0
      Position.BandIndex = 0
    end
  end
  object lWarning: TcxLabel
    Left = 58
    Top = 14
    Caption = 'WARNING!'
    ParentFont = False
    Style.StyleController = WarningEditStyle
  end
  object cxLabel1: TcxLabel
    Left = 143
    Top = 14
    Caption = 'Please check following drug dates before entering calving'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object btnOK: TcxButton
    Left = 192
    Top = 116
    Width = 76
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
    LookAndFeel.Kind = lfStandard
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 10
    Top = 104
    object WarningStyle: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clRed
    end
    object HeadingStyle: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWindowText
    end
  end
  object WarningEditStyle: TcxEditStyleController
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.HotTrack = False
    Style.TextColor = clRed
    Style.TextStyle = [fsBold]
    Style.TransparentBorder = False
    Style.IsFontAssigned = True
    Left = 10
    Top = 72
  end
end
