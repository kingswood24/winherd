object EventFilter: TEventFilter
  Left = 471
  Top = 199
  Width = 958
  Height = 546
  Caption = 'Event Diary'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object EventGrid: TcxGrid
    Left = 0
    Top = 230
    Width = 950
    Height = 224
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
    object EventGridTableView: TcxGridDBTableView
      OnDblClick = EventGridTableViewDblClick
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.First.Visible = True
      NavigatorButtons.PriorPage.Visible = False
      NavigatorButtons.Prior.Visible = True
      NavigatorButtons.Next.Visible = True
      NavigatorButtons.NextPage.Visible = False
      NavigatorButtons.Last.Visible = True
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Delete.Visible = False
      NavigatorButtons.Edit.Visible = False
      NavigatorButtons.Post.Visible = False
      NavigatorButtons.Cancel.Visible = False
      NavigatorButtons.Refresh.Visible = False
      NavigatorButtons.SaveBookmark.Visible = False
      NavigatorButtons.GotoBookmark.Visible = False
      NavigatorButtons.Filter.Visible = False
      FilterBox.CustomizeDialog = False
      DataController.DataSource = EventsQuerySource
      DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare, fcoIgnoreNull]
      DataController.Filter.AutoDataSetFilter = True
      DataController.KeyFieldNames = 'ID'
      DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoSortByDisplayText, dcoFocusTopRowAfterSorting, dcoGroupsAlwaysExpanded, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = 'Total: #'
          Kind = skCount
          FieldName = 'ID'
          Column = EventGridTableViewEventType
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.Summary.Options = [soNullIgnore]
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnHiding = True
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsCustomize.DataRowSizing = True
      OptionsCustomize.GroupRowSizing = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.Navigator = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.DataRowHeight = 21
      OptionsView.Footer = True
      OptionsView.FooterAutoHeight = True
      OptionsView.GridLines = glHorizontal
      OptionsView.HeaderHeight = 26
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      Preview.Visible = True
      Styles.Group = cxStyle1
      object EventGridTableViewEventType: TcxGridDBColumn
        Caption = 'Event Type'
        DataBinding.FieldName = 'EventType'
        HeaderAlignmentVert = vaCenter
        Options.SortByDisplayText = isbtOn
        Width = 110
      end
      object EventGridTableViewEventDate: TcxGridDBColumn
        Caption = 'Event Date'
        DataBinding.FieldName = 'EventDate'
        HeaderAlignmentVert = vaCenter
        Width = 90
      end
      object EventGridTableViewEventDesc: TcxGridDBColumn
        Caption = 'Comment'
        DataBinding.FieldName = 'EventDesc'
        HeaderAlignmentVert = vaCenter
        Width = 150
      end
      object EventGridTableViewAnimalLactNo: TcxGridDBColumn
        Caption = 'Lact No.'
        DataBinding.FieldName = 'AnimalLactNo'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.SortByDisplayText = isbtOn
        Width = 60
      end
      object EventGridTableViewAnimalNo: TcxGridDBColumn
        Caption = 'Animal No.'
        DataBinding.FieldName = 'SortAnimalNo'
        HeaderAlignmentVert = vaCenter
        Options.SortByDisplayText = isbtOff
        Width = 90
      end
      object EventGridTableViewNatIDNum: TcxGridDBColumn
        Caption = 'Nat. Id. No.'
        DataBinding.FieldName = 'SortNatID'
        HeaderAlignmentVert = vaCenter
        Options.SortByDisplayText = isbtOff
        Width = 130
      end
      object EventGridTableViewHiddenAnimalNo: TcxGridDBColumn
        DataBinding.FieldName = 'AnimalNo'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Hidden = True
      end
      object EventGridTableViewHiddenNatIDNum: TcxGridDBColumn
        DataBinding.FieldName = 'NatIDNum'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Hidden = True
      end
      object EventGridTableViewID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        Hidden = True
      end
      object EventGridTableViewHerdId: TcxGridDBColumn
        DataBinding.FieldName = 'HerdId'
        Visible = False
        Hidden = True
      end
    end
    object EventGridLevel: TcxGridLevel
      GridView = EventGridTableView
    end
  end
  object pEventTypes: TPanel
    Left = 54
    Top = 301
    Width = 209
    Height = 50
    BevelOuter = bvNone
    TabOrder = 2
    object cbEventTypes: TcxCheckComboBox
      Left = 4
      Top = 60
      ParentFont = False
      Properties.Delimiter = '|'
      Properties.DropDownSizeable = True
      Properties.ImmediatePopup = True
      Properties.ImmediatePost = True
      Properties.Items = <>
      Properties.OnCloseUp = cbEventTypesPropertiesCloseUp
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Width = 211
    end
    object cxLabel2: TcxLabel
      Left = 4
      Top = 2
      Caption = 'Select the event types to filter'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object cmboEventTypeFilter: TcxComboBox
      Left = 4
      Top = 22
      Constraints.MinHeight = 22
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.ItemHeight = 21
      Properties.OnChange = cmboEventTypeFilterPropertiesChange
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfFlat
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 2
      Width = 201
    end
  end
  object pDateFilter: TPanel
    Left = 505
    Top = 303
    Width = 364
    Height = 44
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    object Label1: TLabel
      Left = 6
      Top = 2
      Width = 87
      Height = 13
      Caption = 'Event Date From '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 137
      Top = 2
      Width = 12
      Height = 13
      Caption = 'To'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object deDateFrom: TcxDateEdit
      Left = 6
      Top = 18
      Constraints.MaxHeight = 21
      Properties.ButtonGlyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFACACABA0A0A0A0A0A0A0A0A0A0A0
        A0ACACABFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAC
        ACABC3C1C1E9E7E6E9E7E6E9E7E6E9E7E6C3C1C1A0A0A0FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFC1C1C1C7C6C6E9E7E6FFFFFFFCFCFCFFFFFFFFFF
        FFE9E7E6C3C1C1ACACABABACAC989B9C989B9C989B9C989B9C989B9CC1C1C1E9
        E7E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E7E6A0A0A0ABACAC65B9DF
        67BCE356B5E165BCE35AB7E1C1C1C1E9E7E6FFFFFFFFFFFF5C5C5C8080808080
        80808080E9E7E6A0A0A0ABACAC61B7DEFFFFFF5AB5DEFFFFFF5AB5DEC1C1C1E9
        E7E6FFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFE9E7E6A0A0A0ABACAC5AB5DE
        5AB5DE5AB5DE5AB5DE5AB5DEC1C1C1E9E7E6FFFFFFFFFFFF808080FFFFFFFFFF
        FFFFFFFFE9E7E6A0A0A0ABACAC6ABCE1FFFFFF5AB5DEFFFFFF5AB5DEC1C1C1C1
        C1C1E9E7E6FFFFFF808080FFFFFFFFFFFFE9E7E6C3C1C1ACACABABACAC62B8DF
        5AB5DE5AB5DE5AB5DE5AB5DE5AB5DEC1C1C1C1C1C1E9E7E6E9E7E6E9E7E6E9E7
        E6C8C7C6A0A0A0FF00FFABACAC6DBFE3FFFFFF5AB5DEFFFFFF5AB5DEFFFFFFBA
        DCE9C1C1C1ACACABACACABA0A0A0A0A0A0ACACABFF00FFFF00FFABACAC63B8DE
        5AB5DE5AB5DE5AB5DE5AB5DE5AB5DE5AB5DE5AB5DE5AB5DE5AB5DE5AB5DE4AAE
        DC989B9CFF00FFFF00FFABACACEEEEEDEEEEEDEEEEEDEEEEEDEEEEEDEEEEEDEE
        EEEDEEEEEDEEEEEDEEEEEDEEEEEDEEEEED989B9CFF00FFFF00FFABACACEEEEED
        2EC2312EC2312EC2312EC2312EC2312CBC2E29B52B26AF2823A92521A322EEEE
        ED989B9CFF00FFFF00FFABACACEEEEED2EC2312EC2312EC2312EC2312EC2312E
        C2312CBC2E29B52B26AF2823A925EEEEED989B9CFF00FFFF00FFABACACEEEEED
        EEEEEDEEEEEDEEEEEDEEEEEDEEEEEDEEEEEDEEEEEDEEEEEDEEEEEDEEEEEDEEEE
        ED989B9CFF00FFFF00FFABACAC9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B
        9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9BFF00FFFF00FF}
      Properties.ImmediatePost = True
      Properties.PostPopupValueOnTab = True
      Properties.SaveTime = False
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Width = 123
    end
    object deDateTo: TcxDateEdit
      Left = 137
      Top = 18
      Constraints.MaxHeight = 21
      Properties.ButtonGlyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFACACABA0A0A0A0A0A0A0A0A0A0A0
        A0ACACABFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFAC
        ACABC3C1C1E9E7E6E9E7E6E9E7E6E9E7E6C3C1C1A0A0A0FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFC1C1C1C7C6C6E9E7E6FFFFFFFCFCFCFFFFFFFFFF
        FFE9E7E6C3C1C1ACACABABACAC989B9C989B9C989B9C989B9C989B9CC1C1C1E9
        E7E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E7E6A0A0A0ABACAC65B9DF
        67BCE356B5E165BCE35AB7E1C1C1C1E9E7E6FFFFFFFFFFFF5C5C5C8080808080
        80808080E9E7E6A0A0A0ABACAC61B7DEFFFFFF5AB5DEFFFFFF5AB5DEC1C1C1E9
        E7E6FFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFE9E7E6A0A0A0ABACAC5AB5DE
        5AB5DE5AB5DE5AB5DE5AB5DEC1C1C1E9E7E6FFFFFFFFFFFF808080FFFFFFFFFF
        FFFFFFFFE9E7E6A0A0A0ABACAC6ABCE1FFFFFF5AB5DEFFFFFF5AB5DEC1C1C1C1
        C1C1E9E7E6FFFFFF808080FFFFFFFFFFFFE9E7E6C3C1C1ACACABABACAC62B8DF
        5AB5DE5AB5DE5AB5DE5AB5DE5AB5DEC1C1C1C1C1C1E9E7E6E9E7E6E9E7E6E9E7
        E6C8C7C6A0A0A0FF00FFABACAC6DBFE3FFFFFF5AB5DEFFFFFF5AB5DEFFFFFFBA
        DCE9C1C1C1ACACABACACABA0A0A0A0A0A0ACACABFF00FFFF00FFABACAC63B8DE
        5AB5DE5AB5DE5AB5DE5AB5DE5AB5DE5AB5DE5AB5DE5AB5DE5AB5DE5AB5DE4AAE
        DC989B9CFF00FFFF00FFABACACEEEEEDEEEEEDEEEEEDEEEEEDEEEEEDEEEEEDEE
        EEEDEEEEEDEEEEEDEEEEEDEEEEEDEEEEED989B9CFF00FFFF00FFABACACEEEEED
        2EC2312EC2312EC2312EC2312EC2312CBC2E29B52B26AF2823A92521A322EEEE
        ED989B9CFF00FFFF00FFABACACEEEEED2EC2312EC2312EC2312EC2312EC2312E
        C2312CBC2E29B52B26AF2823A925EEEEED989B9CFF00FFFF00FFABACACEEEEED
        EEEEEDEEEEEDEEEEEDEEEEEDEEEEEDEEEEEDEEEEEDEEEEEDEEEEEDEEEEEDEEEE
        ED989B9CFF00FFFF00FFABACAC9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B
        9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9BFF00FFFF00FF}
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Width = 123
    end
    object btnFilterByDate: TcxButton
      Left = 266
      Top = 16
      Width = 93
      Height = 23
      Caption = 'Apply Date Filter'
      TabOrder = 2
      OnClick = btnFilterByDateClick
      Layout = blGlyphRight
      LookAndFeel.Kind = lfOffice11
    end
  end
  object pMultipleEventDeletion: TPanel
    Left = 0
    Top = 108
    Width = 950
    Height = 122
    Align = alTop
    BevelOuter = bvNone
    Color = clAppWorkSpace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    object btnDeleteAllDiaryEvents: TcxButton
      Left = 402
      Top = 85
      Width = 89
      Height = 29
      Caption = 'Delete All'
      TabOrder = 0
      OnClick = btnDeleteAllDiaryEventsClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00002EE4001B48FB00FF00FF001B48
        FB00002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00002EE4001B48FB00FF00FF00FF00FF001B48
        FB003E5EFF00002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00002EE4001B48FB00FF00FF00FF00FF00FF00FF001B48
        FB001B48FB003E5EFF00002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00002EE4001B48FB00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF003E5EFF001B48FB003E5EFF00002EE400FF00FF00FF00FF00FF00FF00FF00
        FF00002EE4001B48FB00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF001B48FB003E5EFF00002EE400FF00FF00FF00FF00002E
        E400002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF001B48FB003E5EFF00002EE400002EE400002E
        E400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF001B48FB001B48FB001B48FB00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF001B48FB003E5EFF001B48FB003E5EFF00002E
        E400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF001B48FB003E5EFF00002EE400FF00FF00FF00FF001B48
        FB00002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF001B48FB003E5EFF00002EE400FF00FF00FF00FF00FF00FF00FF00
        FF001B48FB00002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF001B48FB003E5EFF00002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF001B48FB00002EE400FF00FF00FF00FF00FF00FF00FF00FF001B48
        FB006482FF00002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00002EE400FF00FF00FF00FF001B48FB006482
        FF00002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF001B48FB001B48
        FB00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = True
    end
    object cxLabel7: TcxLabel
      Left = 218
      Top = 53
      Caption = 'Event Type:'
    end
    object cxLabel8: TcxLabel
      Left = 10
      Top = 53
      Caption = 'Event Date:'
    end
    object deEventDate: TcxDateEdit
      Left = 82
      Top = 53
      Properties.ButtonGlyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00ACACAB00A0A0
        A000A0A0A000A0A0A000A0A0A000ACACAB00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00ACACAB00C3C1C100E9E7
        E600E9E7E600E9E7E600E9E7E600C3C1C100A0A0A000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00C1C1C100C7C6C600E9E7E600FFFF
        FF00FCFCFC00FFFFFF00FFFFFF00E9E7E600C3C1C100ACACAB00ABACAC00989B
        9C00989B9C00989B9C00989B9C00989B9C00C1C1C100E9E7E600FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9E7E600A0A0A000ABACAC0065B9
        DF0067BCE30056B5E10065BCE3005AB7E100C1C1C100E9E7E600FFFFFF00FFFF
        FF005C5C5C00808080008080800080808000E9E7E600A0A0A000ABACAC0061B7
        DE00FFFFFF005AB5DE00FFFFFF005AB5DE00C1C1C100E9E7E600FFFFFF00FFFF
        FF0080808000FFFFFF00FFFFFF00FFFFFF00E9E7E600A0A0A000ABACAC005AB5
        DE005AB5DE005AB5DE005AB5DE005AB5DE00C1C1C100E9E7E600FFFFFF00FFFF
        FF0080808000FFFFFF00FFFFFF00FFFFFF00E9E7E600A0A0A000ABACAC006ABC
        E100FFFFFF005AB5DE00FFFFFF005AB5DE00C1C1C100C1C1C100E9E7E600FFFF
        FF0080808000FFFFFF00FFFFFF00E9E7E600C3C1C100ACACAB00ABACAC0062B8
        DF005AB5DE005AB5DE005AB5DE005AB5DE005AB5DE00C1C1C100C1C1C100E9E7
        E600E9E7E600E9E7E600E9E7E600C8C7C600A0A0A000FF00FF00ABACAC006DBF
        E300FFFFFF005AB5DE00FFFFFF005AB5DE00FFFFFF00BADCE900C1C1C100ACAC
        AB00ACACAB00A0A0A000A0A0A000ACACAB00FF00FF00FF00FF00ABACAC0063B8
        DE005AB5DE005AB5DE005AB5DE005AB5DE005AB5DE005AB5DE005AB5DE005AB5
        DE005AB5DE005AB5DE004AAEDC00989B9C00FF00FF00FF00FF00ABACAC00EEEE
        ED00EEEEED00EEEEED00EEEEED00EEEEED00EEEEED00EEEEED00EEEEED00EEEE
        ED00EEEEED00EEEEED00EEEEED00989B9C00FF00FF00FF00FF00ABACAC00EEEE
        ED002EC231002EC231002EC231002EC231002EC231002CBC2E0029B52B0026AF
        280023A9250021A32200EEEEED00989B9C00FF00FF00FF00FF00ABACAC00EEEE
        ED002EC231002EC231002EC231002EC231002EC231002EC231002CBC2E0029B5
        2B0026AF280023A92500EEEEED00989B9C00FF00FF00FF00FF00ABACAC00EEEE
        ED00EEEEED00EEEEED00EEEEED00EEEEED00EEEEED00EEEEED00EEEEED00EEEE
        ED00EEEEED00EEEEED00EEEEED00989B9C00FF00FF00FF00FF00ABACAC009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B
        9B009B9B9B009B9B9B009B9B9B009B9B9B00FF00FF00FF00FF00}
      Properties.OnChange = deEventDatePropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 3
      Width = 121
    end
    object lbMulitpleDeleteInstruction: TcxLabel
      Left = 10
      Top = 22
      AutoSize = False
      Caption = 
        'You can delete multiple events by selecting an event date and/or' +
        ' by specifying the type of event.'
      ParentFont = False
      Properties.WordWrap = True
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Height = 27
      Width = 611
    end
    object cbAllowGroupDeletion: TcxCheckBox
      Left = 8
      Top = 2
      Caption = 'Allow Block Event Deletion'
      ParentFont = False
      Properties.OnChange = cbAllowGroupDeletionPropertiesChange
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfFlat
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 5
      Width = 299
    end
    object btnResetDiaryFilter: TcxButton
      Left = 10
      Top = 85
      Width = 79
      Height = 29
      Caption = 'Reset'
      TabOrder = 6
      OnClick = btnResetDiaryFilterClick
      LookAndFeel.Kind = lfFlat
      LookAndFeel.NativeStyle = True
    end
    object cmboDeletableEventTypes: TcxComboBox
      Left = 290
      Top = 52
      Constraints.MinHeight = 22
      Properties.DropDownListStyle = lsFixedList
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.ItemHeight = 21
      Properties.OnChange = cmboDeletableEventTypesPropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 7
      Width = 201
    end
  end
  object pEventActions: TPanel
    Left = 0
    Top = 454
    Width = 950
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    object btnDeleteSelectedEvents: TcxButton
      Left = 8
      Top = 6
      Width = 199
      Height = 33
      Caption = 'Delete Selected Events!'
      TabOrder = 0
      OnClick = btnDeleteSelectedEventsClick
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000830B0000830B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF00A4EB0088C80088C80088C80088C800
        88C80088C80088C80088C80088C80088C80088C80088C80088C80088C80088C8
        0088C80088C80088C8FF00FFFF00FFFF00FFFF00FF2DBCFF18C7EC14BFE414BF
        E414BFE414BFE414BFE414BFE414BFE414BFE414BFE414BFE414BFE414BFE414
        BFE414BFE414BFE414BFE414BFE414BFE40088C8FF00FFFF00FFFF00FF78CCE8
        47DFF518C7EC18C7EC18C7EC18C7EC18C7EC18C7EC18C7EC08BDC640404008BD
        C618C7EC18C7EC18C7EC18C7EC18C7EC18C7EC18C7EC13B9DD00A4EBFF00FFFF
        00FFFF00FFFF00FF2DBCFF40D6F039CEEC39CDEC38CDEC38CCEB37CCEB37CBEB
        40404031001040404035CAEA35C9EA35C9EA35C9EA35C9EA36CAEA18C7EC0088
        C8FF00FFFF00FFFF00FFFF00FFFF00FF78CCE848E0F53ACEEC3ACEEC39CEEC39
        CDEC38CDEB38CCEB08BDC640404008BDC636CBEB36CAEA35CAEA35CAEA35CAEA
        36CAEA13B9DD00A4EBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2DBCFF41D7
        F13ACFED3ACFEC3ACEEC39CDEC38CDEB38CCEB37CBEB37CBEA37CBEB36CAEA36
        CAEA36CAEA36CAEA18C7EC0088C8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF78CCE866E5F83BD0ED3BCFED3ACFEC3ACEEC39CEEC38CDEB31001037CB
        EB37CBEA36CAEA36CAEA36CAEA36CAEA13B9DD00A4EBFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF2DBCFF41D7F13CD0ED3BD0ED3BCFED3ACEEC
        08BDC631001008BDC637CBEB37CBEA36CBEA36CAEA18C7EC0088C8FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF78CCE866E5F83CD0ED3C
        D0ED3BD0ED3BCFED089CAD310010089CAD37CCEB37C9E937CBEA36CBEA13B9DD
        00A4EBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF2DBCFF42D8F13DD1ED3CD0ED3BCFED086B73310010086B7338CCEB37CCEB37
        CBEB18C7EC008DCEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF78CCE866E5F83DD1ED3CD0ED3CD0ED10424A3100101042
        4A38CDEB38CCEB37CCEB13B9DD00A4EBFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2DBCFF42D8F13DD1ED3CD0ED
        31001031001040404038CDEC38CCEB18C7EC008DCEFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF78CCE866
        E5F83DD1ED3CD0ED31001031001040404039CDEC38CDEB13B9DD00A4EBFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF2DBCFF42D8F13CD0ED08525231001008525239CDEC18C7EC00
        8FD2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF78CCE866E5F83CD0ED3BCFED3ACFEC3ACE
        EC39CDEC13B9DD00A4EBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2DBCFF41D7F1
        3BCFED3ACFEC3ACEEC18C7EC0093D8FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF78CCE866E5F83BCFED3ACFEC3ACEEC13B9DD00A4EBFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF2DBCFF40D6F03ACEEC18C7EC009AE2FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF78CCE848E0F53ACEEC13B9
        DD00A4EBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        2DBCFF40D6F0009DE6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF78CCE847DFF500A4EBFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2DBCFFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      LookAndFeel.NativeStyle = True
    end
    object cxLabel34: TcxLabel
      Left = 212
      Top = 2
      AutoSize = False
      Caption = 
        'Note: You can select multiple events by using the Ctrl or Shift ' +
        'keys in combination with the mouse click within the diary grid.'
      ParentColor = False
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Properties.WordWrap = True
      Style.Color = clInfoBk
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Height = 39
      Width = 341
    end
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 495
    Width = 950
    Height = 20
    Panels = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object pHerdId: TPanel
    Left = 308
    Top = 300
    Width = 159
    Height = 48
    BevelOuter = bvNone
    TabOrder = 1
    object cxLabel1: TcxLabel
      Left = 4
      Top = 2
      Caption = 'Herd Identity'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object HerdCombo: TRxDBLookupCombo
      Left = 4
      Top = 20
      Width = 149
      Height = 21
      DropDownCount = 8
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      LookupField = 'ID'
      LookupDisplay = 'HerdIdentity;Name'
      ParentFont = False
      TabOrder = 1
      OnChange = HerdComboChange
    end
  end
  object BarManager: TdxBarManager
    AllowReset = False
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
        FloatLeft = 296
        FloatTop = 222
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = blbExit
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton1
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbExport
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbHelp
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarControlContainerItem1
            Visible = True
          end>
        Name = 'Main'
        OneOnRow = True
        RotateWhenVertical = False
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = True
      end
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Bottom'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 52
        DockingStyle = dsTop
        FloatLeft = 276
        FloatTop = 213
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxBarControlContainerItem2
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarControlContainerItem3
            Visible = True
          end>
        Name = 'Bottom'
        OneOnRow = True
        Row = 1
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = True
      end>
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    HotImages = ImageStore.ImageList16x16
    Images = ImageStore.ImageList16x16
    DisabledImages = ImageStore.DisabledImageList16x16
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = True
    MenusShowRecentItemsFirst = False
    NotDocking = [dsNone]
    PopupMenuLinks = <>
    Style = bmsStandard
    SunkenBorder = True
    UseSystemFont = True
    Left = 760
    Top = 12
    DockControlHeights = (
      0
      0
      108
      0)
    object blbExit: TdxBarLargeButton
      Action = actExit
      Category = 0
      PaintStyle = psCaptionGlyph
      Height = 48
      HotImageIndex = 0
      Width = 55
      SyncImageIndex = False
      ImageIndex = 0
    end
    object blbHelp: TdxBarLargeButton
      Caption = 'Help'
      Category = 0
      Hint = 'Help'
      Visible = ivAlways
      PaintStyle = psCaptionGlyph
      Height = 48
      HotImageIndex = 7
      Width = 55
      SyncImageIndex = False
      ImageIndex = 7
    end
    object dxBarControlContainerItem1: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = pHerdId
    end
    object dxBarControlContainerItem2: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = pEventTypes
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actPrintGrid
      Category = 0
      Height = 48
      HotImageIndex = 19
      Width = 75
      SyncImageIndex = False
      ImageIndex = 19
    end
    object dxBarControlContainerItem3: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = pDateFilter
    end
    object blbExport: TdxBarLargeButton
      Caption = 'Export'
      Category = 0
      Hint = 'Export'
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = dxBarPopupMenu1
      Height = 48
      HotImageIndex = 3
      Width = 75
      SyncImageIndex = False
      ImageIndex = 3
    end
    object bbExportToExcelFile: TdxBarButton
      Action = actExportToExcelFile
      Category = 0
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = 'Feed Event Diary'
      Category = 0
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F3F2CED4CFB7C2B7A7B7A4A1
        B29EA1B3A0A8B9A9B7C3B7CED4CFF2F3F2FFFFFFFFFFFFFFFFFFEBEDEC92B29C
        5EAA733C8F5A409D5A41A05940934040903B40903B419443419C5041A15A43A2
        5D5FAA7493B49DECEEED55B18040AD723EAA7194B6CD40A97440AD723FAB7041
        A76540A25A42A055419F5342A25740A66240AC6F3FAC7156B28197BFAE43BA8A
        3CB38989B6D73CAE8D3CB7863CB58539A48040A5863CB7853DB6823DB57F3DB4
        7D3DB47D40B37D99C1AFFFFFFFEFF1F09EBDBC7FA9DA378FAA3EB78B45B69B6F
        B8A46BBDAA4EB4833CAC713EA7687EB2846AA97085AF7AF6F6F6FFFFFFFFFFFF
        ADB9C83B6FC93768B85373A3A5B4DB9BB7D59BC8C9B6DBC55B9D5D74B28789BD
        9999BCA7BFCBC3FFFFFFFFFFFF909FAE5B88D03A6FCA467ACD6D94D7D3E3F2B5
        CEECACBEC7F5F6F5ECEDEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0F1F1A0B6D1
        4473C04074C985A5D8AFC2DDB1C7E54374CBADB6C7FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFCACFD599B7E09DBAE1A6B6CCEFEFF0A2ADBF627FB28A
        9DBFF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5F5F6FAFAFA
        FFFFFFF3F3F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Height = 48
      LargeGlyph.Data = {
        E6040000424DE604000000000000360000002800000014000000140000000100
        180000000000B004000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDF3EECFE3D1B9D9BCA9
        CDA59EC59799C2919AC4959FCBA2A9D1ACB9DABCCFE3D1EDF3EEFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFD1E9D98BC69B58AC6D409D5941A05941A05941994A408F
        38408F3840903941923D41994B419F5741A05941A05958AC6D8BC69BD2E9D9FF
        FFFF8ACBA641A96C40A96B4DA2796F8EAB3F9F6E40A96B40A96B40A360419D52
        419B4D419B4D419B4D419C4E41A15940A76540A96B40A96B41A96C8BCBA754BB
        8B3EB27C3EB27C58B99393C0D53EB07E3EB27C3EB27C3EB27C3EB27C3EB0773F
        AD7140AC6C40AA6841AA6641A96440AC6A3FB0763EB27C55BB8CE7F6F082D2B3
        43BD8F53B0AA7CADD53AA69B3CBB8C3CBB8C3DAA883C9D86509F983CBB8C3CBB
        8C3CBB8C3CBA8A3CAD733CAD733CAC7059B076E8F5EFFFFFFFFFFFFFF6FBFAAE
        D4E175A1D83683B23BAC8945B9945DBDAE6BBB9C73BFB355B28243AC743CA362
        3EA1608EBD9866A56DB6D4BC86B07BFFFFFFFFFFFFFFFFFFFFFFFF9FBDE6396E
        C9396BBD3457958399B6B1BDF093B5C69DC7CCD3EADE97BF9D449C5266B37B7A
        C39183C79AA6DBBEDBEBDEFFFFFFFFFFFFD6DCE3B3C5DE5484D13A6FCA457ACC
        3367C3BBCEE7BED0EAC3D8F09FC6D5C8EAD8C2DDC7DEECDDF7FBF8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFBCCAD96990CA4076CB386DC94A7ECF6B93D6DE
        EAF6BFD4EE7BA0DBA7BFE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFEFF3F88BA4CD90B1DF456DB35181CCB2C6E391A7CA8CA6D05F88
        CC3469C7B5C8EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFEDF2F9A6C0E3B9D2EE99B7E0D2DFF0FFFFFFEBEFF68AA2CE7796CCB2C5E9
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF6F9FDFEFEFEFFFFFFF7FAFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF}
      Width = 95
    end
  end
  object ActionList1: TActionList
    Images = ImageStore.ImageList16x16
    Left = 700
    Top = 12
    object actExit: TAction
      Caption = 'Exit'
      ImageIndex = 0
      OnExecute = actExitExecute
    end
    object actHelp: TAction
      Caption = 'Help'
      ImageIndex = 7
    end
    object actPrintGrid: TAction
      Caption = 'Preview'
      ImageIndex = 19
      OnExecute = actPrintGridExecute
    end
    object actExportToExcelFile: TAction
      Caption = 'Export To Excel File'
      ImageIndex = 30
      OnExecute = actExportToExcelFileExecute
    end
    object actDeleteDiaryEvents: TAction
    end
    object actDeleteEvents: TAction
      Caption = 'Delete Selected Events!'
      ImageIndex = 29
      OnExecute = actDeleteEventsExecute
    end
  end
  object EventsQuery: TQuery
    BeforeOpen = EventsQueryBeforeOpen
    DatabaseName = 'Kingswd'
    ParamCheck = False
    SQL.Strings = (
      
        'Select E.ID, E.EventType, E.EventDate, E.EventDesc, E.AnimalLact' +
        'No, E.HerdID,'
      'E.AnimalID, A.AnimalNo, A.NatIDNum, A.SortAnimalNo, A.SortNatID '
      'From Events E'
      'Left Join Animals A ON (A.ID=E.AnimalID)')
    Left = 850
    Top = 12
    object EventsQueryID: TIntegerField
      FieldName = 'ID'
      Origin = 'KINGSWD."Events.DB".ID'
    end
    object EventsQueryEventType: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'EventType'
      Origin = 'KINGSWD."Events.DB".EventType'
    end
    object EventsQueryEventDate: TDateField
      FieldName = 'EventDate'
      Origin = 'KINGSWD."Events.DB".EventDate'
    end
    object EventsQueryEventDesc: TStringField
      FieldName = 'EventDesc'
      Origin = 'KINGSWD."Events.DB".EventDesc'
      Size = 30
    end
    object EventsQueryAnimalLactNo: TSmallintField
      FieldName = 'AnimalLactNo'
      Origin = 'KINGSWD."Events.DB".AnimalLactNo'
    end
    object EventsQueryAnimalNo: TStringField
      FieldName = 'AnimalNo'
      Origin = 'KINGSWD."Animals.DB".AnimalNo'
      Size = 10
    end
    object EventsQueryNatIDNum: TStringField
      FieldName = 'NatIDNum'
      Origin = 'KINGSWD."Animals.DB".NatIDNum'
    end
    object EventsQuerySortAnimalNo: TStringField
      FieldName = 'SortAnimalNo'
      Origin = 'KINGSWD."Animals.DB".SortAnimalNo'
      OnGetText = EventsQuerySortAnimalNoGetText
      Size = 10
    end
    object EventsQuerySortNatID: TStringField
      FieldName = 'SortNatID'
      Origin = 'KINGSWD."Animals.DB".SortNatID'
      OnGetText = EventsQuerySortNatIDGetText
    end
    object EventsQueryEventTypeDesc: TStringField
      FieldKind = fkCalculated
      FieldName = 'EventTypeDesc'
      Size = 30
      Calculated = True
    end
    object EventsQueryAnimalID: TIntegerField
      FieldName = 'AnimalID'
      Origin = 'KINGSWD."Events.DB".AnimalID'
    end
    object EventsQueryHerdID: TIntegerField
      FieldName = 'HerdID'
      Origin = 'KINGSWD."Events.DB".HerdID'
    end
  end
  object EventsQuerySource: TDataSource
    DataSet = EventsQuery
    Left = 880
    Top = 12
  end
  object ComponentPrinter: TdxComponentPrinter
    CurrentLink = EventGridPrinterLink
    CustomizeDlgOptions = []
    PreviewOptions.EnableOptions = [peoPrint]
    PreviewOptions.VisibleOptions = [pvoPrint]
    PreviewOptions.WindowState = wsMaximized
    PrintTitle = 'Kingswood Grid Print'
    Version = 0
    Left = 730
    Top = 12
    object EventGridPrinterLink: TdxGridReportLink
      Active = True
      Component = EventGrid
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.CreationDate = 43489.5380416551
      ReportDocument.IsCaptionAssigned = True
      ReportDocument.IsCreatorAssigned = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      OptionsOnEveryPage.Footers = False
      OptionsOnEveryPage.Caption = False
      OptionsPreview.Visible = False
      OptionsSize.AutoWidth = True
      OptionsView.Caption = False
      OptionsView.ExpandButtons = False
      OptionsView.GroupFooters = False
      BuiltInReportLink = True
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 910
    Top = 12
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 6467839
      TextColor = clBlack
    end
  end
  object dxBarPopupMenu1: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Item = bbExportToExcelFile
        Visible = True
      end>
    UseOwnFont = False
    Left = 820
    Top = 12
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.xls'
    Filter = 'Excel File|*.xls'
    Left = 790
    Top = 12
  end
end
