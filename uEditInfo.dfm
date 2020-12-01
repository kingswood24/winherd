object fEditInfo: TfEditInfo
  Left = 416
  Top = 308
  VertScrollBar.Visible = False
  BorderStyle = bsDialog
  ClientHeight = 201
  ClientWidth = 476
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pEditInfo: TPanel
    Left = 0
    Top = 52
    Width = 476
    Height = 149
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label12: TLabel
      Left = 297
      Top = 23
      Width = 23
      Height = 13
      Caption = 'Price'
    end
    object Label13: TLabel
      Left = 297
      Top = 53
      Width = 34
      Height = 13
      Caption = 'Weight'
    end
    object lComment: TLabel
      Left = 12
      Top = 83
      Width = 45
      Height = 13
      Caption = 'Comment'
    end
    object lDate: TLabel
      Left = 12
      Top = 23
      Width = 46
      Height = 13
      Caption = 'Sale Date'
    end
    object Label1: TLabel
      Left = 297
      Top = 113
      Width = 35
      Height = 13
      Caption = 'Lot No.'
    end
    object lCullingReason: TLabel
      Left = 12
      Top = 53
      Width = 70
      Height = 13
      Caption = 'Culling Reason'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lGrade: TLabel
      Left = 297
      Top = 83
      Width = 29
      Height = 13
      Caption = 'Grade'
    end
    object DBEdit1: TDBEdit
      Left = 348
      Top = 20
      Width = 68
      Height = 21
      DataField = 'Price'
      DataSource = dsCurrTableData
      TabOrder = 3
    end
    object DBEdit2: TDBEdit
      Left = 348
      Top = 50
      Width = 68
      Height = 21
      DataField = 'Weight'
      DataSource = dsCurrTableData
      TabOrder = 4
    end
    object dbeComment: TDBEdit
      Left = 98
      Top = 80
      Width = 176
      Height = 21
      DataField = 'Comment'
      DataSource = dsCurrTableData
      TabOrder = 2
    end
    object DBDateEdit1: TDBDateEdit
      Left = 98
      Top = 20
      Width = 90
      Height = 21
      Hint = 'Sale Date'
      DataSource = dsCurrTableData
      NumGlyphs = 2
      TabOrder = 0
      YearDigits = dyFour
    end
    object DBEdit4: TDBEditEh
      Left = 348
      Top = 110
      Width = 68
      Height = 21
      DataField = 'LotNumber'
      DataSource = dsCurrTableData
      EditButtons = <>
      TabOrder = 6
      Visible = True
    end
    object cmboCulling: TRxDBLookupCombo
      Left = 98
      Top = 50
      Width = 177
      Height = 21
      DropDownCount = 8
      DropDownWidth = 300
      DataField = 'CullingReason'
      DisplayEmpty = '<None>'
      EmptyValue = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      LookupField = 'ID'
      LookupDisplay = 'Description'
      LookupSource = WinData.dsCulling
      ParentFont = False
      TabOrder = 1
    end
    object dbeGrade: TDBEdit
      Left = 348
      Top = 80
      Width = 68
      Height = 21
      DataField = 'Grade'
      DataSource = dsCurrTableData
      TabOrder = 5
    end
  end
  object Dock971: TDock97
    Left = 0
    Top = 0
    Width = 476
    Height = 52
    AllowDrag = False
    object Toolbar971: TToolbar97
      Left = 0
      Top = 0
      Caption = 'Toolbar971'
      DefaultDock = Dock971
      DockPos = 0
      FullSize = True
      TabOrder = 0
      object RxSpeedButton1: TRxSpeedButton
        Left = 9
        Top = 0
        Width = 61
        Height = 48
        Hint = 'Exit'
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
        OnClick = RxSpeedButton1Click
      end
      object ToolbarSep971: TToolbarSep97
        Left = 70
        Top = 0
      end
      object ToolbarSep972: TToolbarSep97
        Left = 237
        Top = 0
      end
      object ToolbarSep974: TToolbarSep97
        Left = 0
        Top = 0
        SizeHorz = 9
        SizeVert = 9
      end
      object Panel1: TPanel
        Left = 76
        Top = 0
        Width = 161
        Height = 48
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object KwDBNavigator1: TKwDBNavigator
          Left = 0
          Top = 0
          Width = 160
          Height = 48
          DataSource = dsCurrTableData
          VisibleButtons = [kwnbPost, kwnbCancel]
          Align = alLeft
          Flat = True
          Hints.Strings = (
            'Save'
            'Cancel')
          TabOrder = 0
          OnClick = KwDBNavigator1Click
        end
      end
    end
  end
  object dsCurrTableData: TDataSource
    DataSet = fKImport.CurrTableData
    Left = 292
    Top = 10
  end
end
