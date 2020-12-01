object fmFeedEventFilter: TfmFeedEventFilter
  Left = 502
  Top = 245
  Width = 1118
  Height = 546
  Caption = 'Feed Event Diary'
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
  object FeedEventGrid: TcxGrid
    Left = 0
    Top = 224
    Width = 1110
    Height = 230
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
    object FeedEventGridTableView: TcxGridDBTableView
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
      DataController.DataSource = FeedEventsQuerySource
      DataController.Filter.Options = [fcoCaseInsensitive, fcoShowOperatorDescription, fcoSoftNull, fcoSoftCompare, fcoIgnoreNull]
      DataController.Filter.AutoDataSetFilter = True
      DataController.KeyFieldNames = 'ID'
      DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoSortByDisplayText, dcoFocusTopRowAfterSorting, dcoGroupsAlwaysExpanded, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = 'Rec Count: #'
          Kind = skCount
          FieldName = 'ID'
          Column = FeedEventGridTableViewAllocDate
        end
        item
          Format = 'Avg Cost/Day: #.##'
          Kind = skAverage
          FieldName = 'CostDay'
          Column = FeedEventGridTableViewCostDay
        end
        item
          Format = 'Total No. Days : #'
          Kind = skSum
          FieldName = 'NoDays'
          Column = FeedEventGridTableViewNoDays
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
      object FeedEventGridTableViewAllocDate: TcxGridDBColumn
        Caption = 'Allocation Date'
        DataBinding.FieldName = 'AllocDate'
        HeaderAlignmentVert = vaCenter
        Width = 140
      end
      object FeedEventGridTableViewEventDesc: TcxGridDBColumn
        Caption = 'Feed Name'
        DataBinding.FieldName = 'FeedName'
        HeaderAlignmentVert = vaCenter
        Width = 150
      end
      object FeedEventGridTableViewAnimalNo: TcxGridDBColumn
        Caption = 'Animal No.'
        DataBinding.FieldName = 'SortAnimalNo'
        HeaderAlignmentVert = vaCenter
        Options.SortByDisplayText = isbtOff
        Width = 100
      end
      object FeedEventGridTableViewNatIDNum: TcxGridDBColumn
        Caption = 'Nat. Id. No.'
        DataBinding.FieldName = 'SortNatID'
        HeaderAlignmentVert = vaCenter
        Options.SortByDisplayText = isbtOff
        Width = 130
      end
      object FeedEventGridTableViewFeedGroupName: TcxGridDBColumn
        Caption = 'Feed Group Name'
        DataBinding.FieldName = 'FeedGroupName'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.FilteringMRUItemsList = False
        Options.IncSearch = False
        Options.Grouping = False
        Width = 160
      end
      object FeedEventGridTableViewQuantDay: TcxGridDBColumn
        Caption = 'Quant/Day'
        DataBinding.FieldName = 'QuantDay'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = '0.00'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 80
      end
      object FeedEventGridTableViewCostDay: TcxGridDBColumn
        Caption = 'Cost/Day'
        DataBinding.FieldName = 'CostDay'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = '€,0.00;-€,0.00'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
      end
      object FeedEventGridTableViewEndDate: TcxGridDBColumn
        Caption = 'End Date'
        DataBinding.FieldName = 'EndDate'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
      end
      object FeedEventGridTableViewNoDays: TcxGridDBColumn
        Caption = 'No. Days'
        DataBinding.FieldName = 'NoDays'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = '0'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Grouping = False
      end
      object FeedEventGridTableViewHiddenAnimalNo: TcxGridDBColumn
        DataBinding.FieldName = 'AnimalNo'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Hidden = True
      end
      object FeedEventGridTableViewHiddenNatIDNum: TcxGridDBColumn
        DataBinding.FieldName = 'NatIDNum'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Hidden = True
      end
      object FeedEventGridTableViewID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        Hidden = True
      end
      object FeedEventGridTableViewHerdId: TcxGridDBColumn
        DataBinding.FieldName = 'HerdId'
        Visible = False
        Hidden = True
      end
      object FeedEventGridTableViewFeedRegimeID: TcxGridDBColumn
        DataBinding.FieldName = 'FeedRegimeID'
        Visible = False
        Hidden = True
      end
      object FeedEventGridTableViewFeedGroupID: TcxGridDBColumn
        DataBinding.FieldName = 'FeedGroupID'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Hidden = True
      end
    end
    object FeedEventGridLevel: TcxGridLevel
      GridView = FeedEventGridTableView
    end
  end
  object pHerdId: TPanel
    Left = 10
    Top = 303
    Width = 159
    Height = 44
    BevelOuter = bvNone
    TabOrder = 1
    object HerdCombo: TcxLookupComboBox
      Left = 5
      Top = 18
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.DropDownWidth = 220
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'HerdIdentity'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glHorizontal
      Properties.Revertable = True
      Properties.OnChange = HerdComboPropertiesChange
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
      Width = 147
    end
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
  end
  object pDiaryFilter: TPanel
    Left = 11
    Top = 355
    Width = 735
    Height = 44
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 7
      Top = 2
      Width = 84
      Height = 13
      Caption = 'Event Date From '
    end
    object Label2: TLabel
      Left = 137
      Top = 2
      Width = 12
      Height = 13
      Caption = 'To'
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
    object btnFilterGrid: TcxButton
      Left = 419
      Top = 16
      Width = 92
      Height = 23
      Action = actApplyFilter
      TabOrder = 2
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0041879B00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF001D6E850041879B00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF001D6E850091C3D20041879B00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF001D6E850091C3D2001D6E8500FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF001D6E850091C3D2001D6E8500FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF001D6E850091C3D20041879B001D6E
        8500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF001D6E850091C3D2005799AC00468DA1003A85
        99001D6E8500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF001D6E850091C3D20061A0B2005497AA00468DA1003A85
        99002A778C001D6E8500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF001D6E850091C3D20076AFC0005998AB003F8194003A8094003A85
        99002C7B9000217389001D6E8500FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF001D6E850097C7D50075ABBA003B77890047869C006FB1CD00117B9C002266
        79001E6376001E6B81001E6E84001D6E8500FF00FF00FF00FF00FF00FF00FF00
        FF001F6D83002673890046A5BC00A4FFFF0045D0FD008AD7FD0045A8E3000022
        AC001725AC00397092002B6E8200185C7000FF00FF00FF00FF00FF00FF00FF00
        FF006BA7B9002673890032A5CD00A4EBFB008AF5FD0045C5F6000022BF000000
        BE000000CC001725AC005D8E9C006BA7B900FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00AA521000586957004077870067C5F6001E4DD200191ECA000000
        D9000000DE000000C5008D8DD300FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00C0733100AC410000B74C00007E604C00412E99007084E800191E
        CA000000CF007171CF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0074474700DCA37200ECA54400AF6810009F7153003838C4003838
        C4008D8DDD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00B99E980097655400CBBABA00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Layout = blGlyphRight
      LookAndFeel.Kind = lfOffice11
    end
    object cmboFeedGroup: TcxComboBox
      Left = 265
      Top = 18
      Constraints.MinHeight = 22
      Properties.DropDownListStyle = lsFixedList
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.ItemHeight = 21
      Properties.OnChange = cmboDeletableFeedTypesPropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 3
      Width = 150
    end
    object cxLabel2: TcxLabel
      Left = 264
      Top = 2
      Caption = 'Feed Group:'
    end
    object btnClearFilter: TcxButton
      Left = 515
      Top = 16
      Width = 92
      Height = 23
      Action = actClearFilter
      TabOrder = 5
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
      Layout = blGlyphRight
      LookAndFeel.Kind = lfOffice11
    end
    object lFilterApplying: TcxLabel
      Left = 614
      Top = 16
      AutoSize = False
      Caption = 'Applying Filter .......'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Height = 22
      Width = 119
    end
  end
  object pMultipleEventDeletion: TPanel
    Left = 0
    Top = 102
    Width = 1110
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
    TabOrder = 3
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
      Caption = 'Feed Group:'
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
    object cmboDeletableFeedTypes: TcxComboBox
      Left = 290
      Top = 52
      Constraints.MinHeight = 22
      Properties.DropDownListStyle = lsFixedList
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.ItemHeight = 21
      Properties.OnChange = cmboDeletableFeedTypesPropertiesChange
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
    Width = 1110
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
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
    Width = 1110
    Height = 20
    Panels = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object pFilterInfo: TPanel
    Left = 206
    Top = 302
    Width = 277
    Height = 44
    BevelOuter = bvNone
    Color = clInfoBk
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    object lFilterInfo: TcxLabel
      Left = 0
      Top = 0
      Align = alClient
      Properties.Alignment.Vert = taVCenter
      Style.TextColor = clNavy
      Style.TextStyle = [fsBold]
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
            Item = dxBarControlContainerItem3
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarControlContainerItem2
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
    Left = 699
    Top = 11
    DockControlHeights = (
      0
      0
      102
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
      Control = pDiaryFilter
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
    object dxBarControlContainerItem2: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = pFilterInfo
    end
  end
  object ActionList1: TActionList
    Images = ImageStore.ImageList16x16
    Left = 551
    Top = 11
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
    object actApplyFilter: TAction
      Caption = 'Apply Filter'
      ImageIndex = 34
      OnExecute = actApplyFilterExecute
    end
    object actClearFilter: TAction
      Caption = 'Clear Filter'
      ImageIndex = 21
      OnExecute = actClearFilterExecute
      OnUpdate = actClearFilterUpdate
    end
  end
  object FeedEventsQuery: TQuery
    BeforeOpen = FeedEventsQueryBeforeOpen
    OnCalcFields = FeedEventsQueryCalcFields
    DatabaseName = 'Kingswd'
    ParamCheck = False
    SQL.Strings = (
      
        'SELECT FE.ID, FE.AllocDate, FE.QuantDay, FE.CostDay, FE.EndDate,' +
        ' FE.FeedRegimeID,'
      #9#9' FT.Description FeedName,'
      #9#9' FR.GroupID FeedGroupID,'
      #9#9' FG.Description FeedGroupName,'
      
        #9#9' A.ID AnimalID, A.AnimalNo, A.SortAnimalNo, A.NatIDNum, A.Sort' +
        'NatID, A.HerdID'
      'FROM Animals A'
      'RIGHT JOIN FeedEvents FE ON (FE.AnimalID = A.ID)'
      'RIGHT JOIN FeedTypes FT ON (FT.ID = FE.FeedType)'
      'LEFT JOIN FeedRegime FR ON (FR.ID = FE.FeedRegimeID)'
      
        'LEFT JOIN Grps FG ON ((FR.GroupID = FG.ID) AND (Upper(FG.GroupTy' +
        'pe) = '#39'FEED'#39'))'
      'WHERE A.HerdID = :HerdID'
      'AND FE.AnimalID IN (SELECT AF.AID FROM AFilters AF)'
      'ORDER BY FE.ID Desc')
    Left = 609
    Top = 11
    ParamData = <
      item
        DataType = ftInteger
        Name = 'HerdID'
        ParamType = ptUnknown
      end>
    object FeedEventsQueryID: TIntegerField
      FieldName = 'ID'
    end
    object FeedEventsQueryAllocDate: TDateField
      FieldName = 'AllocDate'
    end
    object FeedEventsQueryQuantDay: TFloatField
      FieldName = 'QuantDay'
    end
    object FeedEventsQueryCostDay: TFloatField
      FieldName = 'CostDay'
    end
    object FeedEventsQueryEndDate: TDateField
      FieldName = 'EndDate'
    end
    object FeedEventsQueryFeedRegimeID: TIntegerField
      FieldName = 'FeedRegimeID'
    end
    object FeedEventsQueryFeedName: TStringField
      FieldName = 'FeedName'
      Size = 30
    end
    object FeedEventsQueryFeedGroupID: TIntegerField
      FieldName = 'FeedGroupID'
    end
    object FeedEventsQueryFeedGroupName: TStringField
      FieldName = 'FeedGroupName'
      Size = 30
    end
    object FeedEventsQueryAnimalNo: TStringField
      FieldName = 'AnimalNo'
      Size = 10
    end
    object FeedEventsQuerySortAnimalNo: TStringField
      FieldName = 'SortAnimalNo'
      OnGetText = FeedEventsQuerySortAnimalNoGetText
      Size = 10
    end
    object FeedEventsQueryNatIDNum: TStringField
      FieldName = 'NatIDNum'
    end
    object FeedEventsQuerySortNatID: TStringField
      FieldName = 'SortNatID'
      OnGetText = FeedEventsQuerySortNatIDGetText
    end
    object FeedEventsQueryAnimalID: TIntegerField
      FieldName = 'AnimalID'
    end
    object FeedEventsQueryHerdID: TIntegerField
      FieldName = 'HerdID'
    end
    object FeedEventsQueryNoDays: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'NoDays'
      Calculated = True
    end
  end
  object FeedEventsQuerySource: TDataSource
    DataSet = FeedEventsQuery
    Left = 638
    Top = 11
  end
  object ComponentPrinter: TdxComponentPrinter
    CurrentLink = FeedEventsGridPrinterLink
    CustomizeDlgOptions = []
    PreviewOptions.EnableOptions = [peoPrint]
    PreviewOptions.VisibleOptions = [pvoPrint]
    PreviewOptions.WindowState = wsMaximized
    PrintTitle = 'Kingswood Grid Print'
    Version = 0
    Left = 668
    Top = 11
    object FeedEventsGridPrinterLink: TdxGridReportLink
      Active = True
      Component = FeedEventGrid
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.Caption = 'FeedEventsGridPrinterLink'
      ReportDocument.CreationDate = 43005.7483984722
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
    Left = 522
    Top = 11
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
    Left = 580
    Top = 11
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.xls'
    Filter = 'Excel File|*.xls'
    Left = 729
    Top = 11
  end
end
