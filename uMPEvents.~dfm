object MPEvents: TMPEvents
  Left = 595
  Top = 230
  Width = 445
  Height = 491
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'MPEvents'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object pAnimal: TPanel
    Left = 20
    Top = 69
    Width = 385
    Height = 370
    BevelInner = bvSpace
    BevelOuter = bvLowered
    TabOrder = 1
    object lNo: TLabel
      Left = 8
      Top = 24
      Width = 94
      Height = 16
      Caption = 'Animal No/Code'
    end
    object Label3: TLabel
      Left = 8
      Top = 59
      Width = 27
      Height = 16
      Caption = 'Date'
    end
    object lComment: TLabel
      Left = 8
      Top = 333
      Width = 56
      Height = 16
      Caption = 'Comment'
    end
    object pVet: TPanel
      Left = 80
      Top = 90
      Width = 381
      Height = 98
      BevelOuter = bvNone
      TabOrder = 8
      Visible = False
      object Label8: TLabel
        Left = 6
        Top = 66
        Width = 23
        Height = 16
        Caption = 'Vet '
      end
      object Label18: TLabel
        Left = 6
        Top = 6
        Width = 75
        Height = 16
        Caption = 'Date Of Birth'
      end
      object Label19: TLabel
        Left = 6
        Top = 36
        Width = 27
        Height = 16
        Caption = 'Date'
      end
      object Vet: TRxDBLookupCombo
        Left = 124
        Top = 66
        Width = 200
        Height = 23
        DropDownCount = 8
        DropDownWidth = 300
        DataField = 'VetID'
        DataSource = WinData.dsDisbudding
        DisplayEmpty = '<Add>'
        EmptyValue = '0'
        LookupField = 'ID'
        LookupDisplay = 'Name;AdminCode'
        LookupSource = WinData.dsLookupMediAdmin
        TabOrder = 2
        OnChange = VetChange
        OnCloseUp = VetCloseUp
      end
      object lDOB: TcxLabel
        Left = 124
        Top = 4
        AutoSize = False
        Caption = 'lDOB'
        ParentColor = False
        Properties.Alignment.Vert = taVCenter
        Style.BorderStyle = ebsFlat
        Style.Color = 14540253
        Height = 23
        Width = 125
      end
      object DBDateEdit2: TDBDateEdit
        Left = 124
        Top = 34
        Width = 121
        Height = 24
        DataField = 'EventDate'
        DataSource = WinData.EventSource
        NumGlyphs = 2
        TabOrder = 0
        Weekends = [Sun, Sat]
        WeekendColor = clBlue
        YearDigits = dyFour
        OnChange = MPEDateChange
      end
    end
    object pConScore: TPanel
      Left = 2
      Top = 85
      Width = 380
      Height = 172
      BevelOuter = bvNone
      TabOrder = 3
      Visible = False
      object Label1: TLabel
        Left = 6
        Top = 9
        Width = 92
        Height = 16
        Caption = 'Condition Score'
      end
      object Label20: TLabel
        Left = 6
        Top = 39
        Width = 101
        Height = 34
        AutoSize = False
        Caption = 'Associated Event Type'
        WordWrap = True
      end
      object Score: TDBEdit
        Left = 124
        Top = 4
        Width = 45
        Height = 24
        DataField = 'Score'
        TabOrder = 0
        OnChange = DonorDamComboChange
        OnEnter = DonorDamComboChange
      end
      object cmboAssociatedEventType: TRxDBLookupCombo
        Left = 124
        Top = 38
        Width = 181
        Height = 23
        DropDownCount = 8
        DropDownWidth = 400
        DataField = 'AssociatedEventType'
        DisplayEmpty = '<None>'
        EmptyValue = '0'
        LookupField = 'EventType'
        LookupDisplay = 'Description'
        TabOrder = 1
        OnChange = DonorDamComboChange
      end
      object lMobility: TcxLabel
        Left = 5
        Top = 79
        Caption = 'Mobility'
      end
      object lCleanliness: TcxLabel
        Left = 5
        Top = 111
        Caption = 'Cleanliness'
      end
      object lAbrasions: TcxLabel
        Left = 5
        Top = 142
        Caption = 'Abrasions'
      end
      object dbcbAbrasions: TcxDBCheckBox
        Left = 120
        Top = 142
        Properties.NullStyle = nssUnchecked
        TabOrder = 5
        Width = 22
      end
      object dbceMobility: TcxDBCurrencyEdit
        Left = 124
        Top = 76
        Properties.AssignedValues.DisplayFormat = True
        Style.BorderStyle = ebs3D
        TabOrder = 6
        Width = 45
      end
      object dbceCleanliness: TcxDBCurrencyEdit
        Left = 124
        Top = 111
        Properties.AssignedValues.DisplayFormat = True
        Style.BorderStyle = ebs3D
        TabOrder = 7
        Width = 45
      end
    end
    object pBullInOut: TPanel
      Left = 2
      Top = 257
      Width = 381
      Height = 35
      BevelOuter = bvNone
      TabOrder = 6
      object lBull: TLabel
        Left = 6
        Top = 9
        Width = 36
        Height = 16
        Caption = 'Bull In'
      end
      object BullInOut: TRxDBLookupCombo
        Left = 124
        Top = 5
        Width = 145
        Height = 23
        DropDownCount = 8
        DropDownWidth = 300
        DataField = 'BullID'
        DataSource = WinData.dsBullInOut
        LookupField = 'ID'
        LookupDisplay = 'AnimalNo;NatIDNum'
        LookupSource = dsBullInOut
        TabOrder = 0
        OnChange = BullInOutChange
      end
    end
    object pIntExam: TPanel
      Left = 6
      Top = 83
      Width = 381
      Height = 162
      BevelOuter = bvNone
      TabOrder = 5
      object Label9: TLabel
        Left = 6
        Top = 8
        Width = 81
        Height = 16
        Caption = 'Exam Method'
      end
      object Label10: TLabel
        Left = 6
        Top = 40
        Width = 82
        Height = 16
        Caption = 'Exam Reason'
      end
      object Label11: TLabel
        Left = 6
        Top = 72
        Width = 107
        Height = 16
        Caption = 'Main Exam Result'
        WordWrap = True
      end
      object Label12: TLabel
        Left = 6
        Top = 104
        Width = 85
        Height = 16
        Caption = 'Second Result'
        WordWrap = True
      end
      object Label13: TLabel
        Left = 6
        Top = 136
        Width = 69
        Height = 16
        Caption = 'Third Result'
        WordWrap = True
      end
      object cbExamReason: TRxDBLookupCombo
        Left = 124
        Top = 38
        Width = 146
        Height = 23
        DropDownCount = 8
        DropDownWidth = 300
        DataField = 'Reason'
        DataSource = WinData.dsIntExam
        DisplayEmpty = '<Add>'
        EmptyValue = '0'
        LookupField = 'ID'
        LookupDisplay = 'LookupCode;Description'
        LookupSource = WinData.dsExamReason
        TabOrder = 0
        OnChange = DonorDamComboChange
        OnCloseUp = cbExamReasonCloseUp
      end
      object cbMainResult: TRxDBLookupCombo
        Left = 124
        Top = 71
        Width = 146
        Height = 23
        DropDownCount = 8
        DropDownWidth = 300
        DataField = 'MainResult'
        DataSource = WinData.dsIntExam
        DisplayEmpty = '<Add>'
        EmptyValue = '0'
        LookupField = 'ID'
        LookupDisplay = 'Description;LookupCode'
        LookupSource = WinData.dsResCodes
        TabOrder = 1
        OnChange = DonorDamComboChange
        OnCloseUp = cbMainResultCloseUp
      end
      object cbResult2: TRxDBLookupCombo
        Left = 124
        Top = 104
        Width = 146
        Height = 23
        DropDownCount = 8
        DropDownWidth = 400
        DataField = 'Result2'
        DataSource = WinData.dsIntExam
        DisplayEmpty = '<Add>'
        EmptyValue = '0'
        LookupField = 'ID'
        LookupDisplay = 'Description;LookupCode'
        LookupSource = WinData.dsResCodes
        TabOrder = 2
        OnChange = DonorDamComboChange
        OnCloseUp = cbMainResultCloseUp
      end
      object cbResult3: TRxDBLookupCombo
        Left = 124
        Top = 136
        Width = 146
        Height = 23
        DropDownCount = 8
        DropDownWidth = 400
        DataField = 'Result3'
        DataSource = WinData.dsIntExam
        DisplayEmpty = '<Add>'
        EmptyValue = '0'
        LookupField = 'ID'
        LookupDisplay = 'Description;LookupCode'
        LookupSource = WinData.dsResCodes
        TabOrder = 3
        OnChange = DonorDamComboChange
        OnCloseUp = cbMainResultCloseUp
      end
      object RxDBLookupCombo1: TRxDBLookupCombo
        Left = 124
        Top = 5
        Width = 146
        Height = 23
        DropDownCount = 8
        DropDownWidth = 300
        DataField = 'Method'
        DataSource = WinData.dsIntExam
        DisplayEmpty = '<Add>'
        EmptyValue = '0'
        LookupField = 'ID'
        LookupDisplay = 'LookupCode;Description'
        LookupSource = WinData.dsExamMethod
        TabOrder = 4
        OnChange = DonorDamComboChange
        OnCloseUp = RxDBLookupCombo1CloseUp
      end
    end
    object pEmbryo: TPanel
      Left = 6
      Top = 79
      Width = 381
      Height = 130
      BevelOuter = bvNone
      TabOrder = 4
      object Label4: TLabel
        Left = 6
        Top = 7
        Width = 72
        Height = 16
        Caption = 'ET1 Number'
      end
      object Label5: TLabel
        Left = 6
        Top = 42
        Width = 114
        Height = 16
        Caption = 'Donor Dam Number'
      end
      object Label6: TLabel
        Left = 6
        Top = 74
        Width = 72
        Height = 16
        Caption = 'Sire Number'
        WordWrap = True
      end
      object Label7: TLabel
        Left = 6
        Top = 106
        Width = 76
        Height = 16
        Caption = 'Embryo Type'
      end
      object ET1Number: TDBEdit
        Left = 124
        Top = 5
        Width = 121
        Height = 24
        DataField = 'ET1Number'
        TabOrder = 0
        OnChange = DonorDamComboChange
      end
      object DonorDamCombo: TRxDBLookupCombo
        Left = 124
        Top = 39
        Width = 146
        Height = 23
        DropDownCount = 8
        DropDownWidth = 300
        DataField = 'DonorDamID'
        DisplayEmpty = '<None>'
        EmptyValue = '0'
        LookupField = 'ID'
        LookupDisplay = 'AnimalNo;NatIDNum'
        LookupSource = dsDam
        TabOrder = 1
        OnChange = DonorDamComboChange
      end
      object SireCombo: TRxDBLookupCombo
        Left = 124
        Top = 72
        Width = 146
        Height = 23
        DropDownCount = 8
        DropDownWidth = 300
        DataField = 'SireID'
        DisplayEmpty = '<None>'
        EmptyValue = '0'
        LookupField = 'ID'
        LookupDisplay = 'AnimalNo;NatIDNum'
        LookupSource = dsSire
        TabOrder = 2
        OnChange = DonorDamComboChange
      end
      object EmbryoType: TRxDBLookupCombo
        Left = 124
        Top = 105
        Width = 181
        Height = 23
        DropDownCount = 8
        DropDownWidth = 400
        DataField = 'EmbryoType'
        DisplayEmpty = '<None>'
        EmptyValue = '0'
        LookupField = 'ID'
        LookupDisplay = 'Description;LookupCode'
        LookupSource = dsLookupEmbryo
        TabOrder = 3
        OnChange = DonorDamComboChange
      end
    end
    object pDiagProb: TPanel
      Left = 34
      Top = 284
      Width = 376
      Height = 32
      BevelOuter = bvNone
      TabOrder = 2
      object Label2: TLabel
        Left = 6
        Top = 7
        Width = 71
        Height = 16
        Caption = 'Illness Code'
      end
      object illnessCode: TRxDBLookupCombo
        Left = 124
        Top = 5
        Width = 145
        Height = 23
        DropDownCount = 8
        DataField = 'ICode'
        LookupField = 'ID'
        LookupDisplay = 'Description'
        LookupSource = dsIllnessCode
        TabOrder = 0
        OnChange = DonorDamComboChange
      end
    end
    object MPEDate: TDBDateEdit
      Left = 126
      Top = 55
      Width = 121
      Height = 24
      DataField = 'EventDate'
      DataSource = WinData.EventSource
      NumGlyphs = 2
      TabOrder = 1
      Weekends = [Sun, Sat]
      WeekendColor = clBlue
      YearDigits = dyFour
      OnChange = MPEDateChange
    end
    object dbComment: TDBEdit
      Left = 126
      Top = 329
      Width = 217
      Height = 24
      DataField = 'EventDesc'
      DataSource = WinData.EventSource
      TabOrder = 9
      OnChange = dbCommentChange
    end
    object SearchForAnimal: TComboEdit
      Left = 126
      Top = 19
      Width = 215
      Height = 25
      ButtonHint = 'Search for Animals'
      CharCase = ecUpperCase
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33FFF00000003333333333333FFBF0000000333333333333FBFFFE0000003333
        3333333FFBFB360000003333333333BFFFF3370000003333333444FBFF333600
        000033333344834FB33331000000333334847F84333336000000333334484F84
        3333300000003333348F7448333336000000333344FFF7433333300000003344
        8F8444333333300000003448F7433333333330000000348F7733333333333000
        000034F77433333333333F000000344443333333333330000000333333333333
        333337000000}
      MaxLength = 10
      NumGlyphs = 1
      TabOrder = 0
      OnButtonClick = SearchForAnimalButtonClick
      OnChange = SearchForAnimalChange
    end
    object pMilkTemperament: TPanel
      Left = 2
      Top = 84
      Width = 381
      Height = 33
      BevelOuter = bvNone
      TabOrder = 10
      object dbcbMilkTempScore: TcxDBLookupComboBox
        Left = 125
        Top = 5
        DataBinding.DataField = 'Score'
        DataBinding.DataSource = WinData.dsMilkTemperament
        Properties.DropDownAutoSize = True
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownSizeable = True
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'Description'
          end
          item
            FieldName = 'Score'
          end>
        Properties.ListOptions.AnsiSort = True
        Properties.ListOptions.CaseInsensitive = True
        Properties.ListOptions.GridLines = glHorizontal
        Properties.ListSource = WinData.dsMilkTemperamentScores
        Properties.MaxLength = 0
        Properties.Revertable = True
        TabOrder = 0
        Width = 145
      end
      object lMilkTempScore: TcxLabel
        Left = 4
        Top = 7
        Caption = 'Score:'
      end
    end
    object pJohnesEvent: TPanel
      Left = 4
      Top = 254
      Width = 380
      Height = 33
      BevelOuter = bvNone
      TabOrder = 11
      object dbcbJohnesResult: TcxDBLookupComboBox
        Left = 125
        Top = 5
        Properties.DropDownAutoSize = True
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownRows = 3
        Properties.DropDownSizeable = True
        Properties.ImmediatePost = True
        Properties.ListColumns = <>
        Properties.ListOptions.AnsiSort = True
        Properties.ListOptions.CaseInsensitive = True
        Properties.ListOptions.GridLines = glHorizontal
        Properties.MaxLength = 0
        Properties.Revertable = True
        Properties.OnChange = dbcbJohnesResultPropertiesChange
        TabOrder = 0
        Width = 145
      end
      object cxLabel1: TcxLabel
        Left = 4
        Top = 7
        Caption = 'Result:'
      end
    end
    object pWeanings: TPanel
      Left = 84
      Top = 85
      Width = 381
      Height = 104
      BevelOuter = bvNone
      TabOrder = 7
      object Label14: TLabel
        Left = 6
        Top = 8
        Width = 43
        Height = 16
        Caption = 'Docility'
      end
      object Label15: TLabel
        Left = 6
        Top = 40
        Width = 67
        Height = 16
        Caption = 'Calf Quality'
      end
      object Label16: TLabel
        Left = 6
        Top = 71
        Width = 82
        Height = 16
        Caption = 'Actual Weight'
      end
      object Label17: TLabel
        Left = 204
        Top = 71
        Width = 14
        Height = 16
        Caption = 'on'
      end
      object Docility: TcxDBLookupComboBox
        Left = 124
        Top = 5
        Constraints.MaxHeight = 23
        DataBinding.DataField = 'Docility'
        DataBinding.DataSource = WinData.dsWeaning
        Properties.DropDownAutoSize = True
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownSizeable = True
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            Width = 85
            FieldName = 'Description'
          end
          item
            Width = 45
            FieldName = 'Score'
          end
          item
            MinWidth = 0
            Width = 0
            FieldName = 'ListType'
          end>
        Properties.ListOptions.AnsiSort = True
        Properties.ListOptions.CaseInsensitive = True
        Properties.ListOptions.GridLines = glHorizontal
        Properties.ListSource = WinData.dsWeaningScores
        Properties.MaxLength = 0
        Properties.ReadOnly = False
        Properties.Revertable = True
        Properties.OnInitPopup = DocilityPropertiesInitPopup
        Style.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.Kind = lfStandard
        TabOrder = 0
        Width = 145
      end
      object Quality: TcxDBLookupComboBox
        Left = 124
        Top = 38
        Constraints.MaxHeight = 23
        DataBinding.DataField = 'Quality'
        DataBinding.DataSource = WinData.dsWeaning
        Properties.DropDownAutoSize = True
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownSizeable = True
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            Width = 85
            FieldName = 'Description'
          end
          item
            Caption = 'Score'
            Width = 45
            FieldName = 'Score'
          end
          item
            MinWidth = 0
            Width = 0
            FieldName = 'ListType'
          end>
        Properties.ListOptions.AnsiSort = True
        Properties.ListOptions.CaseInsensitive = True
        Properties.ListOptions.GridLines = glHorizontal
        Properties.ListSource = WinData.dsWeaningScores
        Properties.MaxLength = 0
        Properties.Revertable = True
        Properties.OnInitPopup = QualityPropertiesInitPopup
        Style.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.Kind = lfStandard
        TabOrder = 1
        Width = 145
      end
      object DBEdit1: TDBEdit
        Left = 124
        Top = 71
        Width = 71
        Height = 23
        Constraints.MaxHeight = 23
        DataField = 'Weight'
        DataSource = WinData.dsWeaning
        TabOrder = 2
      end
      object DBDateEdit1: TDBDateEdit
        Left = 228
        Top = 71
        Width = 115
        Height = 23
        DataField = 'WeighingDate'
        DataSource = WinData.dsWeaning
        Constraints.MaxHeight = 23
        NumGlyphs = 2
        TabOrder = 3
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 437
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
    object sbExit: TRxSpeedButton
      Left = 8
      Top = 2
      Width = 58
      Height = 45
      Caption = 'E&xit'
      Flat = True
      NumGlyphs = 2
      OnClick = sbExitClick
    end
    object ToolButton1: TToolButton
      Left = 66
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 0
      Style = tbsDivider
    end
    object MPENav: TKwDBNavigator
      Left = 74
      Top = 2
      Width = 243
      Height = 45
      DataSource = WinData.EventSource
      VisibleButtons = [kwnbPost, kwnbCancel, kwnbDelete]
      Flat = True
      TabOrder = 0
      BeforeAction = MPENavBeforeAction
      OnClick = MPENavClick
    end
    object ToolButton2: TToolButton
      Left = 317
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsDivider
    end
    object sbHelp: TRxSpeedButton
      Left = 325
      Top = 2
      Width = 58
      Height = 45
      Caption = '&Help'
      Flat = True
      OnClick = sbHelpClick
    end
  end
  object qDam: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT Distinct ID,  AnimalNo, SortAnimalNo, NatIDNum'
      'FROM Animals '
      'WHERE (Sex = "Female")'
      'AND (Breeding=True)'
      'AND ID <> :ID'
      'ORDER BY SortAnimalNo')
    Left = 371
    Top = 107
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object qSire: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT Distinct ID,  AnimalNo, SortAnimalNo, NatIDNum'
      'FROM Animals '
      'WHERE (Sex = "Bull")'
      'AND (Breeding=True)'
      'ORDER BY SortAnimalNo')
    Left = 371
    Top = 135
  end
  object dsDam: TDataSource
    DataSet = qDam
    Left = 399
    Top = 107
  end
  object dsSire: TDataSource
    DataSet = qSire
    Left = 399
    Top = 135
  end
  object qLookupEmbryo: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select ID, Description, LookupCode'
      'From GenLook'
      'Where ListType = 17')
    Left = 371
    Top = 163
  end
  object dsLookupEmbryo: TDataSource
    DataSet = qLookupEmbryo
    Left = 399
    Top = 163
  end
  object qIllnessCode: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select ID, Description, LookupCode'
      'From GenLook'
      'Where ListType = 13')
    Left = 371
    Top = 79
  end
  object dsIllnessCode: TDataSource
    DataSet = qIllnessCode
    Left = 399
    Top = 79
  end
  object qBullInOut: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT Distinct ID,  AnimalNo, SortAnimalNo, NatIDNum'
      'FROM Animals '
      'WHERE (Sex = "Bull")'
      'AND (Breeding=True)'
      'AND HerdID <> :NoneHerdID'
      'ORDER BY SortAnimalNo')
    Left = 371
    Top = 191
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NoneHerdID'
        ParamType = ptUnknown
      end>
  end
  object dsBullInOut: TDataSource
    DataSet = qBullInOut
    Left = 399
    Top = 191
  end
end
