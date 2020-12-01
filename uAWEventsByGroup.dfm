object fmAWEventsByGroup: TfmAWEventsByGroup
  Left = 386
  Top = 151
  Width = 1033
  Height = 659
  Caption = 'Animal Welfare Events'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object EventPageControl: TcxPageControl
    Left = 0
    Top = 48
    Width = 1025
    Height = 223
    ActivePage = tsCalfSurveyEvent
    Align = alTop
    Color = clBtnFace
    LookAndFeel.Kind = lfFlat
    ParentColor = False
    Style = 9
    TabHeight = 28
    TabOrder = 0
    TabWidth = 130
    OnChange = EventPageControlChange
    OnPageChanging = EventPageControlPageChanging
    ClientRectBottom = 223
    ClientRectRight = 1025
    ClientRectTop = 29
    object tsDisbudding: TcxTabSheet
      Tag = 1
      Caption = 'Disbudding Event'
      ImageIndex = 0
      object btnReadGuidelines: TcxButton
        Left = 523
        Top = 163
        Width = 109
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Read Guidelines'
        TabOrder = 3
        Visible = False
        OnClick = btnReadGuidelinesClick
        LookAndFeel.Kind = lfFlat
      end
      object deEventDate: TcxDateEdit
        Left = 128
        Top = 20
        Properties.ImmediatePost = True
        Properties.PostPopupValueOnTab = True
        Properties.OnCloseUp = deEventDatePropertiesCloseUp
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 0
        OnExit = deEventDateExit
        Width = 131
      end
      object EventDateLabel: TcxLabel
        Left = 26
        Top = 23
        Caption = 'Date'
      end
      object VeterinarianLabel: TcxLabel
        Left = 26
        Top = 63
        Caption = 
          'Veterinarian                                                    ' +
          '                      (If required, see guidelines) '
      end
      object cmboVeterinarian: TcxLookupComboBox
        Left = 128
        Top = 60
        RepositoryItem = HerdLookup.erMediAdminLookup
        Properties.ListColumns = <>
        Properties.OnCloseUp = EventComboExitOrCloseUp
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 1
        OnExit = EventComboExitOrCloseUp
        Width = 175
      end
      object teComment: TcxTextEdit
        Left = 128
        Top = 100
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 2
        OnExit = teCommentExit
        Width = 199
      end
      object CommentLabel: TcxLabel
        Left = 26
        Top = 103
        Caption = 'Comment'
      end
      object btnNotApplicable: TcxButton
        Left = 12
        Top = 174
        Width = 279
        Height = 25
        Caption = 'Disbudding is not applicable for selected animal(s)'
        TabOrder = 7
        OnClick = btnNotApplicableClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000320B0000320B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FF002EE41B48FBFF00FF1B48FB002EE4FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF002EE41B48FBFF00FFFF00FF1B48FB
          3E5EFF002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF002E
          E41B48FBFF00FFFF00FFFF00FF1B48FB1B48FB3E5EFF002EE4FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF002EE41B48FBFF00FFFF00FFFF00FFFF00FFFF00FF
          3E5EFF1B48FB3E5EFF002EE4FF00FFFF00FFFF00FFFF00FF002EE41B48FBFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB3E5EFF002EE4FF
          00FFFF00FF002EE4002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF1B48FB3E5EFF002EE4002EE4002EE4FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB1B
          48FB1B48FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF1B48FB3E5EFF1B48FB3E5EFF002EE4FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB3E5EFF002EE4FF
          00FFFF00FF1B48FB002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF1B48FB3E5EFF002EE4FF00FFFF00FFFF00FFFF00FF1B48FB002EE4FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB3E5EFF002EE4FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF1B48FB002EE4FF00FFFF00FFFF00FFFF00FF1B48FB
          6482FF002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FF002EE4FF00FFFF00FF1B48FB6482FF002EE4FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB1B48FB
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        LookAndFeel.NativeStyle = True
      end
    end
    object tsCastration: TcxTabSheet
      Tag = 2
      Caption = 'Castration Event'
      ImageIndex = 1
    end
    object tsMealFeeding: TcxTabSheet
      Tag = 3
      Caption = 'Meal Feeding Event'
      ImageIndex = 2
    end
    object tsWeaning: TcxTabSheet
      Tag = 4
      Caption = 'Weaning Event'
      Color = clBtnFace
      ImageIndex = 3
      ParentColor = False
      OnShow = tsWeaningShow
      object ActualWeightLabel: TLabel
        Left = 26
        Top = 63
        Width = 208
        Height = 13
        Caption = 'Actual Weight                                           on'
      end
      object deWeightDate: TcxDateEdit
        Left = 300
        Top = 60
        Properties.OnCloseUp = deWeightDateExit
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 0
        OnExit = deWeightDateExit
        Width = 121
      end
      object ceWeight: TcxCurrencyEdit
        Left = 110
        Top = 60
        Properties.DisplayFormat = '0.00;0.00'
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 1
        OnExit = ceWeightExit
        Width = 77
      end
    end
    object tsCalfSurveyEvent: TcxTabSheet
      Tag = 5
      Caption = 'Calf Survey'
      Color = 15458522
      ImageIndex = 6
      ParentColor = False
      object DocilityLabel: TLabel
        Left = 26
        Top = 126
        Width = 56
        Height = 13
        Caption = 'Calf Docility'
      end
      object CalfQualityLabel: TLabel
        Left = 26
        Top = 158
        Width = 56
        Height = 13
        Caption = 'Calf Quality'
      end
      object CalfVitalityLabel: TLabel
        Left = 26
        Top = 62
        Width = 54
        Height = 13
        Caption = 'Calf Vitality'
      end
      object CalfSizeLabel: TLabel
        Left = 26
        Top = 94
        Width = 41
        Height = 13
        Caption = 'Calf Size'
      end
      object CalfScourLabel: TLabel
        Left = 374
        Top = 62
        Width = 49
        Height = 13
        Caption = 'Calf Scour'
      end
      object CalfPneumoniaLabel: TLabel
        Left = 374
        Top = 94
        Width = 74
        Height = 13
        Caption = 'Calf Pneumonia'
      end
      object cmboCalfDocility: TcxLookupComboBox
        Left = 130
        Top = 122
        RepositoryItem = HerdLookup.erCalfDocilityLookup
        Properties.DropDownListStyle = lsFixedList
        Properties.ListColumns = <>
        Properties.OnCloseUp = EventComboExitOrCloseUp
        Properties.OnInitPopup = FilterList1PropertiesInitPopup
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 0
        OnExit = EventComboExitOrCloseUp
        Width = 175
      end
      object cmboCalfQuality: TcxLookupComboBox
        Left = 130
        Top = 154
        RepositoryItem = HerdLookup.erCalfQualityLookup
        Properties.DropDownListStyle = lsFixedList
        Properties.ListColumns = <>
        Properties.OnCloseUp = EventComboExitOrCloseUp
        Properties.OnInitPopup = FilterList2PropertiesInitPopup
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 1
        OnExit = EventComboExitOrCloseUp
        Width = 175
      end
      object cmboCalfVitality: TcxLookupComboBox
        Left = 130
        Top = 58
        RepositoryItem = HerdLookup.erCalfVitalityLookup
        Properties.DropDownListStyle = lsFixedList
        Properties.ListColumns = <>
        Properties.OnCloseUp = EventComboExitOrCloseUp
        Properties.OnInitPopup = FilterList2PropertiesInitPopup
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 2
        OnExit = EventComboExitOrCloseUp
        Width = 175
      end
      object cmboCalfSize: TcxLookupComboBox
        Left = 130
        Top = 90
        RepositoryItem = HerdLookup.erCalfSizeLookup
        Properties.DropDownListStyle = lsFixedList
        Properties.ListColumns = <>
        Properties.OnCloseUp = EventComboExitOrCloseUp
        Properties.OnInitPopup = FilterList2PropertiesInitPopup
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 3
        OnExit = EventComboExitOrCloseUp
        Width = 175
      end
      object cmboCalfScour: TcxLookupComboBox
        Left = 478
        Top = 58
        RepositoryItem = HerdLookup.erCalfScourLookup
        Properties.DropDownListStyle = lsFixedList
        Properties.ListColumns = <>
        Properties.OnCloseUp = EventComboExitOrCloseUp
        Properties.OnInitPopup = FilterList1PropertiesInitPopup
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 4
        OnExit = EventComboExitOrCloseUp
        Width = 175
      end
      object cmboCalfPneumonia: TcxLookupComboBox
        Left = 478
        Top = 90
        RepositoryItem = HerdLookup.erCalfPneumoniaLookup
        Properties.DropDownListStyle = lsFixedList
        Properties.ListColumns = <>
        Properties.OnCloseUp = EventComboExitOrCloseUp
        Properties.OnInitPopup = FilterList2PropertiesInitPopup
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 5
        OnExit = EventComboExitOrCloseUp
        Width = 175
      end
    end
    object tsGuidelines: TcxTabSheet
      Caption = 'Guidelines'
      ImageIndex = 4
      TabVisible = False
    end
    object tsDamEvent: TcxTabSheet
      Tag = 6
      Caption = 'Dam Survey'
      Color = 15458522
      ImageIndex = 4
      ParentColor = False
      object MilkAbilityLabel: TLabel
        Left = 26
        Top = 62
        Width = 87
        Height = 13
        Caption = 'Cow Milking Ability'
      end
      object CowQualityLabel: TLabel
        Left = 26
        Top = 94
        Width = 58
        Height = 13
        Caption = 'Cow Docility'
      end
      object cmboCowMilkAbility: TcxLookupComboBox
        Left = 130
        Top = 58
        RepositoryItem = HerdLookup.erDamMilkAbilityLookup
        Properties.DropDownListStyle = lsFixedList
        Properties.ListColumns = <>
        Properties.OnCloseUp = EventComboExitOrCloseUp
        Properties.OnInitPopup = FilterList1PropertiesInitPopup
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 0
        OnExit = EventComboExitOrCloseUp
        Width = 175
      end
      object cmboCowDocility: TcxLookupComboBox
        Left = 130
        Top = 90
        RepositoryItem = HerdLookup.erDamDocilityLookup
        Properties.DropDownListStyle = lsFixedList
        Properties.ListColumns = <>
        Properties.OnCloseUp = EventComboExitOrCloseUp
        Properties.OnInitPopup = FilterList2PropertiesInitPopup
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 1
        OnExit = EventComboExitOrCloseUp
        Width = 175
      end
    end
    object tsStockBullEvent: TcxTabSheet
      Tag = 7
      Caption = 'Stock Bull Survey'
      Color = 15458522
      ImageIndex = 5
      ParentColor = False
      object BullFunctionalityLabel: TLabel
        Left = 26
        Top = 62
        Width = 80
        Height = 13
        Caption = 'Bull Functionality'
      end
      object BullDocilityLabel: TLabel
        Left = 26
        Top = 94
        Width = 53
        Height = 13
        Caption = 'Bull Docility'
      end
      object cmboBullFunctionality: TcxLookupComboBox
        Left = 128
        Top = 58
        RepositoryItem = HerdLookup.erBullFunctionalityLookup
        Properties.DropDownListStyle = lsFixedList
        Properties.ListColumns = <>
        Properties.OnCloseUp = EventComboExitOrCloseUp
        Properties.OnInitPopup = FilterList1PropertiesInitPopup
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 0
        OnExit = EventComboExitOrCloseUp
        Width = 175
      end
      object cmboBullDocility: TcxLookupComboBox
        Left = 128
        Top = 90
        RepositoryItem = HerdLookup.erBullDocilityLookup
        Properties.DropDownListStyle = lsFixedList
        Properties.ListColumns = <>
        Properties.OnCloseUp = EventComboExitOrCloseUp
        Properties.OnInitPopup = FilterList2PropertiesInitPopup
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 1
        OnExit = EventComboExitOrCloseUp
        Width = 175
      end
    end
  end
  object EventGrid: TcxGrid
    Left = 0
    Top = 279
    Width = 1025
    Height = 329
    Align = alClient
    TabOrder = 5
    LookAndFeel.Kind = lfFlat
    object EventGridDBTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = EventGridDBTableViewFocusedRecordChanged
      OnInitEdit = EventGridDBTableViewInitEdit
      DataController.DataSource = dsEventDataTable
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.DataRowHeight = 21
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 32
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      object EventGridDBTableViewRecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
      end
      object EventGridDBTableViewSelected: TcxGridDBColumn
        DataBinding.FieldName = 'Selected'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ImmediatePost = True
        HeaderAlignmentVert = vaCenter
        Width = 47
      end
      object EventGridDBTableViewID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
      end
      object EventGridDBTableViewAnimalNo: TcxGridDBColumn
        Caption = 'Animal No'
        DataBinding.FieldName = 'AnimalNo'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 72
      end
      object EventGridDBTableViewSortAnimalNo: TcxGridDBColumn
        DataBinding.FieldName = 'SortAnimalNo'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
      end
      object EventGridDBTableViewNatIDNum: TcxGridDBColumn
        Caption = 'Nat ID Num'
        DataBinding.FieldName = 'NatIDNum'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 127
      end
      object EventGridDBTableViewSex: TcxGridDBColumn
        DataBinding.FieldName = 'Sex'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
      end
      object EventGridDBTableViewSortNatID: TcxGridDBColumn
        DataBinding.FieldName = 'SortNatID'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
      end
      object EventGridDBTableViewDateOfBirth: TcxGridDBColumn
        Caption = 'Date Of Birth'
        DataBinding.FieldName = 'DateOfBirth'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 73
      end
      object EventGridDBTableViewLactNo: TcxGridDBColumn
        Caption = 'Lact. No.'
        DataBinding.FieldName = 'LactNo'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 54
      end
      object EventGridDBTableViewDamNatID: TcxGridDBColumn
        Caption = 'Dam Nat. Id. No.'
        DataBinding.FieldName = 'DamNatID'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
      end
      object EventGridDBTableViewEventDate: TcxGridDBColumn
        Caption = 'Date'
        DataBinding.FieldName = 'EventDate'
        HeaderAlignmentVert = vaCenter
        Width = 84
      end
      object EventGridDBTableViewCalfVitality: TcxGridDBColumn
        Caption = 'Vitality'
        DataBinding.FieldName = 'CalfVitality'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ListColumns = <>
        RepositoryItem = HerdLookup.erCalfVitalityLookup
        HeaderAlignmentVert = vaCenter
        Width = 100
      end
      object EventGridDBTableViewCalfSize: TcxGridDBColumn
        Caption = 'Size'
        DataBinding.FieldName = 'CalfSize'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ListColumns = <>
        RepositoryItem = HerdLookup.erCalfSizeLookup
        HeaderAlignmentVert = vaCenter
        Width = 85
      end
      object EventGridDBTableViewCalfDocility: TcxGridDBColumn
        Caption = 'Docility'
        DataBinding.FieldName = 'CalfDocility'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
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
          end
          item
            FieldName = 'ListType'
          end>
        Properties.ListOptions.AnsiSort = True
        Properties.ListOptions.CaseInsensitive = True
        Properties.ListOptions.GridLines = glHorizontal
        Properties.OnInitPopup = FilterList1PropertiesInitPopup
        RepositoryItem = HerdLookup.erCalfDocilityLookup
        HeaderAlignmentVert = vaCenter
        Width = 85
      end
      object EventGridDBTableViewCalfQuality: TcxGridDBColumn
        Caption = 'Quality'
        DataBinding.FieldName = 'CalfQuality'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
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
          end
          item
            MinWidth = 0
            Width = 0
            FieldName = 'ListType'
          end>
        Properties.ListOptions.AnsiSort = True
        Properties.ListOptions.CaseInsensitive = True
        Properties.ListOptions.GridLines = glHorizontal
        Properties.OnInitPopup = FilterList2PropertiesInitPopup
        RepositoryItem = HerdLookup.erCalfQualityLookup
        HeaderAlignmentVert = vaCenter
        Width = 85
      end
      object EventGridDBTableViewCalfScour: TcxGridDBColumn
        Caption = 'Scour'
        DataBinding.FieldName = 'CalfScour'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ListColumns = <>
        RepositoryItem = HerdLookup.erCalfScourLookup
        HeaderAlignmentVert = vaCenter
        Width = 100
      end
      object EventGridDBTableViewCalfPneumonia: TcxGridDBColumn
        Caption = 'Pneumonia'
        DataBinding.FieldName = 'CalfPneumonia'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ListColumns = <>
        RepositoryItem = HerdLookup.erCalfPneumoniaLookup
        HeaderAlignmentVert = vaCenter
        Width = 100
      end
      object EventGridDBTableViewCalfWeight: TcxGridDBColumn
        Caption = 'Actual Weight'
        DataBinding.FieldName = 'CalfWeight'
        HeaderAlignmentVert = vaCenter
        Width = 80
      end
      object EventGridDBTableViewWeightDate: TcxGridDBColumn
        Caption = 'Weighing Date'
        DataBinding.FieldName = 'WeightDate'
        HeaderAlignmentVert = vaCenter
        Width = 73
      end
      object EventGridDBTableViewVeterinarian: TcxGridDBColumn
        DataBinding.FieldName = 'Veterinarian'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ListColumns = <>
        RepositoryItem = HerdLookup.erMediAdminLookup
        HeaderAlignmentVert = vaCenter
        Width = 140
      end
      object EventGridDBTableViewEventDesc: TcxGridDBColumn
        Caption = 'Comment'
        DataBinding.FieldName = 'EventDesc'
        HeaderAlignmentVert = vaCenter
        Width = 180
      end
      object EventGridDBTableViewDamSortNatIDNo: TcxGridDBColumn
        DataBinding.FieldName = 'DamSortNatIDNo'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
      end
      object EventGridDBTableViewDisbuddingDate: TcxGridDBColumn
        Caption = 'Disbudding Date'
        DataBinding.FieldName = 'DisbuddingDate'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
      end
      object EventGridDBTableViewCastrationDate: TcxGridDBColumn
        Caption = 'Castration Date'
        DataBinding.FieldName = 'CastrationDate'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
      end
      object EventGridDBTableViewMealFeedingDate: TcxGridDBColumn
        Caption = 'Meal Feeding Date'
        DataBinding.FieldName = 'MealFeedingDate'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
      end
      object EventGridDBTableViewWeaningDate: TcxGridDBColumn
        Caption = 'Weaning Date'
        DataBinding.FieldName = 'WeaningDate'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
      end
      object EventGridDBTableViewICBFDamMilkAbility: TcxGridDBColumn
        Caption = 'Milk Ability'
        DataBinding.FieldName = 'ICBFDamMilkAbility'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'Description'
          end
          item
            FieldName = 'Score'
          end
          item
            MinWidth = 0
            Width = 20
            FieldName = 'ListType'
          end>
        Properties.OnInitPopup = FilterList1PropertiesInitPopup
        RepositoryItem = HerdLookup.erDamMilkAbilityLookup
        HeaderAlignmentVert = vaCenter
        Width = 85
      end
      object EventGridDBTableViewICBFDamDocility: TcxGridDBColumn
        Caption = 'Docility'
        DataBinding.FieldName = 'ICBFDamDocility'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'Description'
          end
          item
            FieldName = 'Score'
          end
          item
            MinWidth = 0
            Width = 0
            FieldName = 'ListType'
          end>
        Properties.OnInitPopup = FilterList2PropertiesInitPopup
        RepositoryItem = HerdLookup.erDamDocilityLookup
        HeaderAlignmentVert = vaCenter
        Width = 85
      end
      object EventGridDBTableViewICBFStockBullFunctionality: TcxGridDBColumn
        Caption = 'Functionality'
        DataBinding.FieldName = 'ICBFSBFunctionality'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'Description'
          end
          item
            FieldName = 'Score'
          end
          item
            MinWidth = 0
            Width = 0
            FieldName = 'ListType'
          end>
        Properties.OnInitPopup = FilterList1PropertiesInitPopup
        RepositoryItem = HerdLookup.erBullFunctionalityLookup
        HeaderAlignmentVert = vaCenter
        Width = 85
      end
      object EventGridDBTableViewICBFStockBullDocility: TcxGridDBColumn
        Caption = 'Docility'
        DataBinding.FieldName = 'ICBFSBDocility'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'Description'
          end
          item
            FieldName = 'Score'
          end
          item
            MinWidth = 0
            Width = 0
            FieldName = 'ListType'
          end>
        Properties.OnInitPopup = FilterList2PropertiesInitPopup
        RepositoryItem = HerdLookup.erBullDocilityLookup
        HeaderAlignmentVert = vaCenter
        Width = 85
      end
      object EventGridDBTableViewExistingEventID: TcxGridDBColumn
        DataBinding.FieldName = 'ExistingEventID'
        Visible = False
        Width = 20
        IsCaptionAssigned = True
      end
    end
    object EventGridLevel: TcxGridLevel
      GridView = EventGridDBTableView
    end
  end
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 608
    Width = 1025
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 150
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 150
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 271
    Width = 1025
    Height = 8
    HotZoneClassName = 'TcxSimpleStyle'
    AlignSplitter = salTop
    Control = EventPageControl
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Main'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 341
        FloatTop = 322
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = blbClose
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbSelectAll
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton3
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbSave
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton2
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbReviewWelfareEvents
            Visible = True
          end
          item
            BeginGroup = True
            Item = btnGrpWelfHelp
            Visible = True
          end>
        Name = 'Main'
        OneOnRow = True
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        UseRecentItems = False
        UseRestSpace = True
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    HotImages = HerdLookup.ImageList16x16
    Images = HerdLookup.ImageList16x16
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 606
    Top = 10
    DockControlHeights = (
      0
      0
      48
      0)
    object blbClose: TdxBarLargeButton
      Caption = 'Close'
      Category = 0
      Hint = 'Close'
      Visible = ivAlways
      OnClick = blbCloseClick
      Height = 44
      HotImageIndex = 0
      Width = 65
      SyncImageIndex = False
      ImageIndex = 0
    end
    object btnGrpWelfHelp: TdxBarLargeButton
      Caption = 'Help'
      Category = 0
      Hint = 'Help'
      Visible = ivAlways
      OnClick = btnGrpWelfHelpClick
      Height = 44
      HotImageIndex = 7
      Width = 65
      SyncImageIndex = False
      ImageIndex = 7
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = 'Add Group'
      Category = 0
      Hint = 'Add Group'
      Visible = ivNever
      Height = 44
      HotImageIndex = 1
      Width = 72
      SyncImageIndex = False
      ImageIndex = 1
    end
    object blbSave: TdxBarLargeButton
      Caption = 'Save'
      Category = 0
      Hint = 'Save'
      Visible = ivAlways
      OnClick = blbSaveClick
      Height = 44
      HotImageIndex = 8
      Width = 65
      SyncImageIndex = False
      ImageIndex = 8
    end
    object blbSelectAll: TdxBarLargeButton
      Caption = 'Select All'
      Category = 0
      Hint = 'Select All'
      Visible = ivAlways
      OnClick = blbSelectAllClick
      Height = 44
      HotImageIndex = 5
      Width = 72
      SyncImageIndex = False
      ImageIndex = 5
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Caption = 'De-select All'
      Category = 0
      Hint = 'De-select All'
      Visible = ivAlways
      OnClick = dxBarLargeButton3Click
      Height = 44
      HotImageIndex = 3
      Width = 72
      SyncImageIndex = False
      ImageIndex = 3
    end
    object blbReviewWelfareEvents: TdxBarLargeButton
      Caption = 'Review Welfare Events'
      Category = 0
      Hint = 'Review Welfare Events'
      Visible = ivAlways
      OnClick = blbReviewWelfareEventsClick
      Height = 44
      HotImageIndex = 10
      Width = 125
      SyncImageIndex = False
      ImageIndex = 10
    end
  end
  object dsEventDataTable: TDataSource
    DataSet = EventDataTable
    Left = 576
    Top = 10
  end
  object EventDataTable: TTable
    AfterPost = EventDataTableAfterPost
    DatabaseName = 'Kingswd'
    TableName = 'tEventDataTable'
    Left = 636
    Top = 10
    object EventDataTableID: TIntegerField
      FieldName = 'ID'
    end
    object EventDataTableAnimalNo: TStringField
      FieldName = 'AnimalNo'
      Size = 10
    end
    object EventDataTableSortAnimalNo: TStringField
      FieldName = 'SortAnimalNo'
      Size = 10
    end
    object EventDataTableNatIDNum: TStringField
      FieldName = 'NatIDNum'
    end
    object EventDataTableSortNatID: TStringField
      FieldName = 'SortNatID'
    end
    object EventDataTableDateOfBirth: TDateTimeField
      FieldName = 'DateOfBirth'
    end
    object EventDataTableLactNo: TIntegerField
      FieldName = 'LactNo'
    end
    object EventDataTableDamNatID: TStringField
      FieldName = 'DamNatID'
    end
    object EventDataTableEventDate: TDateTimeField
      FieldName = 'EventDate'
    end
    object EventDataTableEventDesc: TStringField
      FieldName = 'EventDesc'
      Size = 30
    end
    object EventDataTableVeterinarian: TIntegerField
      FieldName = 'Veterinarian'
    end
    object EventDataTableSortDamNatIDNo: TStringField
      FieldName = 'SortDamNatIDNo'
    end
    object EventDataTableHerdID: TIntegerField
      FieldName = 'HerdID'
    end
    object EventDataTableSelected: TBooleanField
      FieldName = 'Selected'
      OnChange = EventDataTableSelectedChange
    end
    object EventDataTableCalfDocility: TIntegerField
      FieldName = 'CalfDocility'
    end
    object EventDataTableCalfQuality: TIntegerField
      FieldName = 'CalfQuality'
    end
    object EventDataTableCalfWeight: TFloatField
      FieldName = 'CalfWeight'
    end
    object EventDataTableWeightDate: TDateTimeField
      FieldName = 'WeightDate'
    end
    object EventDataTableSex: TStringField
      FieldName = 'Sex'
      Size = 6
    end
    object EventDataTableDisbuddingDate: TDateTimeField
      FieldName = 'DisbuddingDate'
    end
    object EventDataTableCastrationDate: TDateTimeField
      FieldName = 'CastrationDate'
    end
    object EventDataTableMealFeedingDate: TDateTimeField
      FieldName = 'MealFeedingDate'
    end
    object EventDataTableWeaningDate: TDateTimeField
      FieldName = 'WeaningDate'
    end
    object EventDataTableICBFDamEventDate: TDateTimeField
      FieldName = 'ICBFDamEventDate'
    end
    object EventDataTableICBFDamMilkAbility: TIntegerField
      FieldName = 'ICBFDamMilkAbility'
    end
    object EventDataTableICBFDamDocility: TIntegerField
      FieldName = 'ICBFDamDocility'
    end
    object EventDataTableIICBFSBEventDate: TDateTimeField
      FieldName = 'ICBFSBEventDate'
    end
    object EventDataTableICBFSBFunctionality: TIntegerField
      FieldName = 'ICBFSBFunctionality'
    end
    object EventDataTableICBFSBDocility: TIntegerField
      FieldName = 'ICBFSBDocility'
    end
    object EventDataTableICBFCalfSurveyDate: TDateField
      FieldName = 'ICBFCalfSurveyDate'
    end
    object EventDataTableLastCalvingDate: TDateTimeField
      FieldName = 'LastCalvingDate'
    end
    object EventDataTableCalfVitality: TIntegerField
      FieldName = 'CalfVitality'
    end
    object EventDataTableCalfSize: TIntegerField
      FieldName = 'CalfSize'
    end
    object EventDataTableCalfScour: TIntegerField
      FieldName = 'CalfScour'
    end
    object EventDataTableCalfPneumonia: TIntegerField
      FieldName = 'CalfPneumonia'
    end
    object EventDataTableExistingEventID: TIntegerField
      FieldName = 'ExistingEventID'
    end
  end
end
