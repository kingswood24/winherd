object fSuckSubstitute: TfSuckSubstitute
  Left = 499
  Top = 251
  Width = 429
  Height = 396
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  ActiveControl = EligibleAnimals
  Caption = 'Suckler Cow Replacement'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 24
    Top = 70
    Width = 371
    Height = 283
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 15
      Top = 97
      Width = 89
      Height = 32
      Caption = 'Replacement Animal'
      WordWrap = True
    end
    object Label3: TLabel
      Left = 15
      Top = 51
      Width = 82
      Height = 32
      Caption = 'Animal to be Replaced'
      WordWrap = True
    end
    object Label6: TLabel
      Left = 15
      Top = 239
      Width = 61
      Height = 16
      Caption = 'Comment'
    end
    object Label7: TLabel
      Left = 15
      Top = 148
      Width = 120
      Height = 16
      Caption = 'Replacement Date'
    end
    object Label8: TLabel
      Left = 15
      Top = 194
      Width = 73
      Height = 16
      Caption = 'Description'
    end
    object lApplicDate: TLabel
      Left = 254
      Top = 10
      Width = 5
      Height = 16
      Color = 12906181
      ParentColor = False
    end
    object Label5: TLabel
      Left = 23
      Top = 10
      Width = 229
      Height = 16
      Caption = 'For Suckler Application applied on:'
      Color = 12906181
      ParentColor = False
    end
    object Comment: TDBEdit
      Left = 164
      Top = 236
      Width = 185
      Height = 24
      DataField = 'Comment'
      DataSource = WinData.dsSuckReplace
      TabOrder = 0
    end
    object ReplacementDate: TDBDateEdit
      Left = 164
      Top = 144
      Width = 121
      Height = 24
      DataField = 'ReplaceDate'
      DataSource = WinData.dsSuckReplace
      NumGlyphs = 2
      TabOrder = 1
      YearDigits = dyFour
    end
    object EligibleAnimals: TRxDBLookupCombo
      Left = 164
      Top = 97
      Width = 155
      Height = 23
      DropDownCount = 8
      DropDownWidth = 350
      DataField = 'NewAID'
      DataSource = WinData.dsSuckReplace
      DisplayEmpty = '<Select Animal>'
      LookupField = 'ID'
      LookupDisplay = 'NatIDNum;LactNo'
      LookupSource = dsEligible
      TabOrder = 2
      OnChange = EligibleAnimalsCloseUp
      OnCloseUp = EligibleAnimalsCloseUp
    end
    object AnimalReplaced: TEdit
      Left = 164
      Top = 51
      Width = 155
      Height = 24
      Color = 12906181
      TabOrder = 3
    end
    object Description: TDBComboBox
      Left = 164
      Top = 191
      Width = 145
      Height = 24
      Style = csDropDownList
      DataField = 'Description'
      DataSource = WinData.dsSuckReplace
      ItemHeight = 16
      TabOrder = 4
      OnChange = DescriptionChange
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 421
    Height = 53
    ButtonHeight = 47
    Caption = 'ToolBar1'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsDivider
    end
    object sbExit: TRxSpeedButton
      Left = 8
      Top = 2
      Width = 60
      Height = 47
      Caption = '&Exit'
      Flat = True
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
      OnClick = sbExitClick
    end
    object ToolButton2: TToolButton
      Left = 68
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsDivider
    end
    object dbnSuckReplace: TKwDBNavigator
      Left = 76
      Top = 2
      Width = 186
      Height = 47
      DataSource = WinData.dsSuckReplace
      VisibleButtons = [kwnbPost, kwnbCancel]
      Flat = True
      Ctl3D = False
      Captions.Strings = (
        '&Save'
        '&Cancel'
        '&Add'
        '&Delete'
        '&Edit'
        '&Refresh'
        '&First'
        '&Prev.'
        '&Next'
        '&Last'
        '')
      ParentCtl3D = False
      TabOrder = 0
      BeforeAction = dbnSuckReplaceBeforeAction
      OnClick = dbnSuckReplaceClick
    end
    object ToolButton4: TToolButton
      Left = 262
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsDivider
    end
    object sbHelp: TRxSpeedButton
      Left = 270
      Top = 2
      Width = 76
      Height = 47
      Caption = '&Help'
      Enabled = False
      Flat = True
      Glyph.Data = {
        72010000424D7201000000000000760000002800000016000000150000000100
        040000000000FC00000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFF777
        FFFFFFFFFF00FFFFFF78844488FFFFFFFF00FFFFF70444664487FFFFFF00FFFF
        804444666C447FFFFF00FFF704444666EEC48FFFFF00FFF844444666EEC467FF
        FF00FFF844466666CCC468FFFF00FFF4466666CC588888FFFF00FFF4666688CC
        83BB38FFFF00F776666E777C88BB38FFFF007FF8666E777C588887FFFF00FFF7
        6666EE8683BB8FFFFF00FF778666666683BBBFFFFF00FFFFF866466483BBB7FF
        FF00FF777778666468BBBB7FFF00FF77777F77787F8BBBBFFF00FFFFFFFF7788
        3773BBB7FF00FFFFFF77773BBB83BBB7FF00FFFFFFF77F8BBB33BBB7FF00FFFF
        FF77FFF7BBBBBB7FFF00FFFFFFFFFFFF7BBBB7FFFF00}
      OnClick = sbHelpClick
    end
    object ToolButton3: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 3
      Style = tbsDivider
    end
  end
  object qEligible: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select A.ID, A.AnimalNo, A.NatIDNum, A.LactNo From Animals A'
      
        'Where  NOT (A.ID IN (Select s.AnimalID From SAppliedFor S where ' +
        'ApplicationID = 1))')
    Left = 352
    Top = 146
  end
  object dsEligible: TDataSource
    DataSet = qEligible
    Left = 380
    Top = 146
  end
end
