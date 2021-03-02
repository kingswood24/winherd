object fmCTSWSBirthReg: TfmCTSWSBirthReg
  Left = 110
  Top = 172
  Width = 839
  Height = 577
  Caption = 'CTS Birth Registrations'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TcxPageControl
    Left = 8
    Top = 42
    Width = 823
    Height = 504
    ActivePage = tsToBeRegistered
    Align = alClient
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = True
    TabHeight = 28
    TabOrder = 3
    TabWidth = 150
    OnPageChanging = PageControlPageChanging
    ClientRectBottom = 500
    ClientRectLeft = 4
    ClientRectRight = 819
    ClientRectTop = 34
    object tsToBeRegistered: TcxTabSheet
      Caption = 'To be Registered'
      ImageIndex = 0
      object RegBirthGrid: TcxGrid
        Left = 20
        Top = 22
        Width = 779
        Height = 390
        PopupMenu = GridPopupMenu
        TabOrder = 0
        LookAndFeel.NativeStyle = True
        object RegBirthGridDBTableView: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          FilterBox.CustomizeDialog = False
          OnCellDblClick = RegBirthGridDBTableViewCellDblClick
          DataController.DataSource = dstmpCTSBirths
          DataController.KeyFieldNames = 'ID'
          DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoFocusTopRowAfterSorting, dcoImmediatePost]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsSelection.InvertSelect = False
          OptionsView.ShowEditButtons = gsebAlways
          OptionsView.DataRowHeight = 22
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 36
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 15
          Styles.OnGetContentStyle = RegBirthGridDBTableViewStylesGetContentStyle
          object RegBirthGridDBTableViewID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
          end
          object RegBirthGridDBTableViewEventID: TcxGridDBColumn
            DataBinding.FieldName = 'EventID'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
          end
          object RegBirthGridDBTableViewAnimalID: TcxGridDBColumn
            DataBinding.FieldName = 'AnimalID'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
          end
          object RegBirthGridDBTableViewStatus: TcxGridDBColumn
            Caption = 'Result'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Caption = 'View'
                Default = True
                Kind = bkText
                LeftAlignment = True
                Width = 36
              end>
            Properties.ViewStyle = vsButtonsOnly
            Properties.OnButtonClick = RegBirthGridDBTableViewStatusPropertiesButtonClick
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.ShowEditButtons = isebAlways
            Styles.Header = cxStyleNotRegistered
            Width = 40
          end
          object RegBirthGridDBTableViewSelected: TcxGridDBColumn
            DataBinding.FieldName = 'Selected'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayGrayed = 'False'
            Properties.ImmediatePost = True
            Properties.NullStyle = nssUnchecked
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.ShowEditButtons = isebNever
            Width = 51
          end
          object RegBirthGridDBTableViewIgnoreWarnings: TcxGridDBColumn
            DataBinding.FieldName = 'IgnoreWarnings'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayGrayed = 'False'
            Properties.ImmediatePost = True
            Properties.NullStyle = nssUnchecked
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.ShowEditButtons = isebNever
            Width = 55
          end
          object RegBirthGridDBTableViewNatIDNum: TcxGridDBColumn
            DataBinding.FieldName = 'NatIDNum'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
          end
          object RegBirthGridDBTableViewOutputNatIDNum: TcxGridDBColumn
            DataBinding.FieldName = 'OutputNatIDNum'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
          end
          object RegBirthGridDBTableViewSortNatIDNum: TcxGridDBColumn
            Caption = 'Nat. Id. No.'
            DataBinding.FieldName = 'SortNatIDNum'
            OnGetDisplayText = RegBirthGridDBTableViewSortNatIDNumGetDisplayText
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Options.SortByDisplayText = isbtOff
          end
          object RegBirthGridDBTableViewSex: TcxGridDBColumn
            DataBinding.FieldName = 'Sex'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 28
          end
          object RegBirthGridDBTableViewDateOfBirth: TcxGridDBColumn
            Caption = 'Date of Birth'
            DataBinding.FieldName = 'DateOfBirth'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 80
          end
          object RegBirthGridDBTableViewBreed: TcxGridDBColumn
            DataBinding.FieldName = 'Breed'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 36
          end
          object RegBirthGridDBTableViewEID: TcxGridDBColumn
            DataBinding.FieldName = 'EID'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
          end
          object RegBirthGridDBTableViewOutputDamNatIDNum: TcxGridDBColumn
            DataBinding.FieldName = 'OutputDamNatIDNum'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
          end
          object RegBirthGridDBTableViewDamNatIDNum: TcxGridDBColumn
            DataBinding.FieldName = 'DamNatIDNum'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
          end
          object RegBirthGridDBTableViewDamSortNatIDNum: TcxGridDBColumn
            Caption = 'Dam Nat. Id. No.'
            DataBinding.FieldName = 'DamSortNatIDNum'
            OnGetDisplayText = RegBirthGridDBTableViewDamSortNatIDNumGetDisplayText
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Options.SortByDisplayText = isbtOff
          end
          object RegBirthGridDBTableViewOutputSurrogateNatIDNum: TcxGridDBColumn
            DataBinding.FieldName = 'OutputSurrogateNatIDNum'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
          end
          object RegBirthGridDBTableViewSurrogateNatIDNum: TcxGridDBColumn
            DataBinding.FieldName = 'SurrogateNatIDNum'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
          end
          object RegBirthGridDBTableViewSurrogateSortNatIDNum: TcxGridDBColumn
            Caption = 'Surr. Nat. Id. No.'
            DataBinding.FieldName = 'SurrogateSortNatIDNum'
            OnGetDisplayText = RegBirthGridDBTableViewSurrogateSortNatIDNumGetDisplayText
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Options.SortByDisplayText = isbtOff
          end
          object RegBirthGridDBTableViewOutputSireNatIDNum: TcxGridDBColumn
            DataBinding.FieldName = 'OutputSireNatIDNum'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
          end
          object RegBirthGridDBTableViewSireNatIDNum: TcxGridDBColumn
            Caption = 'Sire Identifier'
            DataBinding.FieldName = 'SireNatIDNum'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
          end
          object RegBirthGridDBTableViewSireSortNatIDNum: TcxGridDBColumn
            Caption = 'Sire Identifier'
            DataBinding.FieldName = 'SireSortNatIDNum'
            OnGetDisplayText = RegBirthGridDBTableViewSireSortNatIDNumGetDisplayText
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Options.SortByDisplayText = isbtOff
          end
          object RegBirthGridDBTableViewBLoc: TcxGridDBColumn
            Caption = 'Birth Loc.'
            DataBinding.FieldName = 'BLoc'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 80
          end
          object RegBirthGridDBTableViewBSLoc: TcxGridDBColumn
            Caption = 'Birth Sub. Loc.'
            DataBinding.FieldName = 'BSLoc'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 62
          end
          object RegBirthGridDBTableViewPLoc: TcxGridDBColumn
            Caption = 'Postal Loc.'
            DataBinding.FieldName = 'PLoc'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 80
          end
          object RegBirthGridDBTableViewPSLoc: TcxGridDBColumn
            Caption = 'Postal Sub. Loc.'
            DataBinding.FieldName = 'PSLoc'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 62
          end
          object RegBirthGridDBTableViewCTSBatchID: TcxGridDBColumn
            DataBinding.FieldName = 'CTSBatchID'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
          end
          object RegBirthGridDBTableViewRegistered: TcxGridDBColumn
            DataBinding.FieldName = 'Registered'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
          end
        end
        object RegBirthGridLevel: TcxGridLevel
          GridView = RegBirthGridDBTableView
        end
      end
      object cxLabel4: TcxLabel
        Left = 20
        Top = 414
        Caption = 
          'Please note that CTS Web Services is unavailable between 7 pm an' +
          'd 8 pm each evening for back ups to take place.'
        Style.TextColor = clWindowText
        Transparent = True
      end
      object StatusBar: TdxStatusBar
        Left = 0
        Top = 446
        Width = 815
        Height = 20
        Panels = <
          item
            PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
            Width = 250
          end>
        LookAndFeel.NativeStyle = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
      end
    end
    object tsRegistrationResults: TcxTabSheet
      Caption = 'Registration Results'
      ImageIndex = 2
      OnShow = tsRegistrationResultsShow
      object gbRegistrationResults: TcxGroupBox
        Left = 20
        Top = 14
        Caption = 'Registration Results'
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Height = 59
        Width = 779
        object cxLabel5: TcxLabel
          Left = 510
          Top = 34
          Caption = '(Click the view button to view CTS registration result) '
          Style.TransparentBorder = False
          Transparent = True
        end
        object cxLabel2: TcxLabel
          Left = 18
          Top = 21
          Caption = 'View:'
          Style.TransparentBorder = False
          Transparent = True
        end
        object cmboView: TcxComboBox
          Left = 50
          Top = 19
          Properties.DropDownListStyle = lsFixedList
          Properties.ImmediatePost = True
          Properties.Items.Strings = (
            'Calves Rejected'
            'Calves Accepted'
            'All Calves')
          Properties.ReadOnly = False
          Properties.Revertable = True
          Properties.OnChange = cmboViewPropertiesChange
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 2
          Width = 233
        end
        object gbRegistrationResultsNos: TcxGroupBox
          Left = 312
          Top = 14
          Style.BorderStyle = ebsNone
          Style.Edges = []
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 3
          Transparent = True
          Height = 37
          Width = 145
          object lCalvesAccepted: TcxLabel
            Left = 8
            Top = 0
            Caption = 'Calves Accepted:'
            Style.TransparentBorder = False
            Transparent = True
          end
          object lCalvesRejected: TcxLabel
            Left = 10
            Top = 18
            Caption = 'Calves Rejected:'
            Style.TransparentBorder = False
            Transparent = True
          end
          object lNoRejected: TcxLabel
            Left = 95
            Top = 18
            AutoSize = False
            Caption = 'lNoRejected'
            Style.TextColor = clRed
            Style.TransparentBorder = False
            Transparent = True
            Height = 17
            Width = 40
          end
          object lNoAccepted: TcxLabel
            Left = 95
            Top = 0
            AutoSize = False
            Caption = 'lNoAccepted'
            Style.TextColor = clGreen
            Style.TransparentBorder = False
            Transparent = True
            Height = 17
            Width = 40
          end
        end
        object gbPreviousResultsNos: TcxGroupBox
          Left = 288
          Top = 18
          Style.BorderStyle = ebsNone
          Style.Edges = []
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 4
          Transparent = True
          Height = 27
          Width = 211
          object lCalves: TcxLabel
            Left = 40
            Top = 4
            AutoSize = False
            Caption = 'Calves Accepted:'
            Properties.Alignment.Horz = taRightJustify
            Style.TransparentBorder = False
            Transparent = True
            Height = 13
            Width = 127
          end
          object lNoOfCalves: TcxLabel
            Left = 171
            Top = 4
            Caption = '0'
            Style.TransparentBorder = False
            Transparent = True
          end
        end
      end
    end
    object tsPreviousResults: TcxTabSheet
      Caption = 'Previous Results'
      ImageIndex = 1
      OnShow = tsPreviousResultsShow
      object PreviousResultsGrid: TcxGrid
        Left = 20
        Top = 80
        Width = 779
        Height = 332
        TabOrder = 0
        LookAndFeel.NativeStyle = True
        object PreviousResultsGridTableView: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          FilterBox.CustomizeDialog = False
          DataController.DataSource = dsQueryCTSRequests
          DataController.KeyFieldNames = 'ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Inserting = False
          OptionsSelection.InvertSelect = False
          OptionsView.ShowEditButtons = gsebAlways
          OptionsView.DataRowHeight = 22
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 36
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 15
          Styles.OnGetContentStyle = RegisteredGridTableViewStylesGetContentStyle
          object PreviousResultsGridTableViewStatus: TcxGridDBColumn
            Caption = 'Result'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Caption = 'View'
                Default = True
                Kind = bkText
                LeftAlignment = True
                Width = 38
              end>
            Properties.ViewStyle = vsButtonsOnly
            Properties.OnButtonClick = RegisteredGridTableViewStatusPropertiesButtonClick
            HeaderAlignmentVert = vaCenter
            Options.ShowEditButtons = isebAlways
            Width = 40
          end
          object PreviousResultsGridTableViewAnimalID: TcxGridDBColumn
            DataBinding.FieldName = 'AnimalID'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
          end
          object PreviousResultsGridTableViewRequestDate: TcxGridDBColumn
            Caption = 'Registration Date/Time'
            DataBinding.FieldName = 'RequestDate'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.InputKind = ikStandard
            Properties.Kind = ckDateTime
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 111
          end
          object PreviousResultsGridTableViewRegistered: TcxGridDBColumn
            Caption = 'Accepted'
            DataBinding.FieldName = 'Registered'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayGrayed = 'False'
            Properties.NullStyle = nssUnchecked
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 59
          end
          object PreviousResultsGridTableViewNatIDNum: TcxGridDBColumn
            Caption = 'Nat. Id. No.'
            DataBinding.FieldName = 'NatIDNum'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 120
          end
          object PreviousResultsGridTableViewSortNatIDNum: TcxGridDBColumn
            DataBinding.FieldName = 'SortNatIDNum'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
          end
          object PreviousResultsGridTableViewSex: TcxGridDBColumn
            DataBinding.FieldName = 'Sex'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 52
          end
          object PreviousResultsGridTableViewDateOfBirth: TcxGridDBColumn
            Caption = 'Date of Birth'
            DataBinding.FieldName = 'DateOfBirth'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 80
          end
          object PreviousResultsGridTableViewBreed: TcxGridDBColumn
            Caption = 'Breed'
            DataBinding.FieldName = 'BreedCode'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 33
          end
          object PreviousResultsGridTableViewDamNatIDNum: TcxGridDBColumn
            Caption = 'Dam Nat. Id. No.'
            DataBinding.FieldName = 'GenDamNatID'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 120
          end
          object PreviousResultsGridTableViewDamSortNatIDNum: TcxGridDBColumn
            DataBinding.FieldName = 'DamSortNatID'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
          end
          object PreviousResultsGridTableViewSurrogateNatIDNum: TcxGridDBColumn
            Caption = 'Surr. Dam Nat. Id. No.'
            DataBinding.FieldName = 'DamNatID'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 120
          end
          object PreviousResultsGridTableViewSurrogateSortNatIDNum: TcxGridDBColumn
            DataBinding.FieldName = 'DonorDamSortNatID'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
          end
          object PreviousResultsGridTableViewSireNatIDNum: TcxGridDBColumn
            Caption = 'Sire Nat. Id. No.'
            DataBinding.FieldName = 'SireNatIDNum'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 120
          end
          object PreviousResultsGridTableViewSireSortNatIDNum: TcxGridDBColumn
            DataBinding.FieldName = 'SireSortNatID'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
          end
        end
        object PreviousResultsGridLevel: TcxGridLevel
          GridView = PreviousResultsGridTableView
        end
      end
    end
  end
  object cxSplitter1: TcxSplitter
    Left = 0
    Top = 42
    Width = 8
    Height = 504
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
        Caption = 'MainToolbar'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 604
        FloatTop = 357
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxBarLargeButton1
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbRegisterCTS
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton2
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbPrint
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbHelp
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarStatic1
            Visible = True
          end>
        Name = 'MainToolbar'
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
    HotImages = ImageStore.ImageList16x16
    Images = ImageStore.ImageList16x16
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 608
    Top = 8
    DockControlHeights = (
      0
      0
      42
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actExit
      Category = 0
      HotImageIndex = 0
      Width = 55
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = actLogin
      Caption = 'Options'
      Category = 0
      ButtonStyle = bsDropDown
      DropDownMenu = dxBarPopupMenu1
      HotImageIndex = 27
      SyncImageIndex = False
      ImageIndex = 27
    end
    object blbRegisterCTS: TdxBarLargeButton
      Action = actRegisterCTS
      Category = 0
      HotImageIndex = 23
      SyncImageIndex = False
      ImageIndex = 23
    end
    object blbLoadTestData: TdxBarLargeButton
      Caption = 'Load Test Data'
      Category = 0
      Hint = 'Load Test Data'
      Visible = ivNever
      OnClick = blbLoadTestDataClick
    end
    object blbHelp: TdxBarLargeButton
      Action = actHelp
      Category = 0
      HotImageIndex = 7
      Width = 55
    end
    object dxBarStatic1: TdxBarStatic
      Category = 0
      Visible = ivAlways
    end
    object dxBarButton1: TdxBarButton
      Action = actLogin
      Category = 0
    end
    object dxBarButton2: TdxBarButton
      Action = actCheckCTSWSStatus
      Category = 0
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'System'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = bbRemoveNatIdFormatting
          Visible = True
        end
        item
          BeginGroup = True
          Item = dxBarButton3
          Visible = True
        end>
    end
    object dxBarButton3: TdxBarButton
      Action = actViewCTSExceptions
      Category = 0
    end
    object bbChangeDamNatID: TdxBarButton
      Action = actChangeDamNatIDNum
      Category = 0
    end
    object bbChangeSireNatID: TdxBarButton
      Action = actChangeSireNatIDNum
      Category = 0
    end
    object bbChangeSurrDamNatID: TdxBarButton
      Action = actChangeSurrogateDamNatIDNum
      Category = 0
    end
    object bbRemoveSireNatIdNum: TdxBarButton
      Action = actRemoveSireNatIdNum
      Category = 0
    end
    object bbRemoveSurrogateNatIdNum: TdxBarButton
      Action = actRemoveSurrogateNatIdNum
      Category = 0
    end
    object dxBarButton4: TdxBarButton
      Action = actRemovePermanently
      Category = 0
    end
    object bbRemoveNatIdFormatting: TdxBarButton
      Caption = 'Remove Nat. Id. No. Formatting'
      Category = 0
      Hint = 'Remove Nat. Id. No. Formatting'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = bbRemoveNatIdFormattingClick
    end
    object dxBarButton5: TdxBarButton
      Action = actRemoveAllPermanently
      Category = 0
    end
    object dxBarButton6: TdxBarButton
      Action = actRemoveAllBullCalves
      Category = 0
    end
    object blbPrint: TdxBarLargeButton
      Action = actPrintGrid
      Caption = 'Print Preview'
      Category = 0
      HotImageIndex = 19
      SyncImageIndex = False
      ImageIndex = 19
    end
    object dxBarInPlaceSubItem1: TdxBarInPlaceSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
      KeepBeginGroupWhileExpanded = False
    end
    object dxBarSpinEdit1: TdxBarSpinEdit
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Width = 100
    end
    object dxBarToolbarsListItem1: TdxBarToolbarsListItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
    end
    object dxBarImageCombo1: TdxBarImageCombo
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000000000000080FFFFFFFFFFFFF080FDEBFFFFFFFFF080FB6DF00F00F
        0F080F9ACFFFFFFFFF080FFFFFFFFFFFFF080C9D6CCCCCCCCC080C46BCFFFFCF
        FC080CBAECCCCCCCCC080FFFFFFFFFFFFF080F64AFFFFFFFFF080F496F00F000
        0F080F94BFFFFFFFFF080FFFFFFFFFFFFF080000000000000008}
      Width = 100
      ItemIndex = -1
      ImageIndexes = ()
    end
    object dxBarTreeViewCombo1: TdxBarTreeViewCombo
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFF000FFFFFFFF0000F0F0FFFFFFFF0FFFF000FFFFFFFF0FFFFFFFFFF
        FFFFF0FFFFFFFFFF000FF0FFFFF0000F0F0FF0FFFFF0FFFF000FF0FFFFFFFFFF
        FFFFF0FFFF000FFFFFFFF0000F0F0FFFFFFFF0FFFF000FFFFFFFFFFFFFFFFFFF
        FFFF000FFFFFFFFFFFFF0F0FFFFFFFFFFFFF000FFFFFFFFFFFFF}
      Width = 100
      Indent = 19
      ShowButtons = True
      ShowLines = True
      ShowRoot = True
      SortType = stNone
    end
    object bbCalvesRegistered: TdxBarButton
      Caption = 'Calves Registered'
      Category = 0
      Hint = 'Calves Registered'
      Visible = ivAlways
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        238FBB218BB72187B22187B22187B22187B22187B22187B226983E2187B22C8B
        B32F8CB4FF00FFFF00FFFF00FF248CB8259DCA2CACDB31AEDC35B0DC41B5DF4B
        B9E04BB9E021AD394BCD6A1E783183CFEA83CFEA39A5CEFF00FFFF00FF248CB8
        30A5D04AB8E05BC0E36AC6E67BCDE886D1EA21AD394BCD6A32A7492DA0411E78
        31ADE0F139A5CEFF00FFFF00FF248CB837A8D164C3E580CEE98CD3EB96D7ED21
        AD3921AD3921AD3921AD3921AD3921AD3926983E39A5CEFF00FFFF00FF248CB8
        39A5CE7ECEE99DDAEEA2DCEFA8DEF0B7E4F3B7E4F321AD394BCD6A228835B7E4
        F3B7E4F339A5CEFF00FFFF00FF248CB839A5CE9DDAEEA9DFF0AEE1F1B4E3F2B8
        E5F3BEE7F421AD394BCD6A26983ED4F0F8DAF2FA39A5CEFF00FFFF00FF248CB8
        39A5CECFEEF8E6F8FCE6F8FCCEEEF7CDEDF7CDECD321AD3926983EB6DABDE7F8
        FCECFAFD39A5CEFF00FFFF00FF248CB839A5CE39A5CE39A5CE39A5CE29ADD6CD
        ECD321AD3926983E9ED1A9F0FBFEF5FDFEF7FEFE39A5CEFF00FFFF00FF248CB8
        2BADD836B1DD54BDE36EC7E769C5E521AD3926983E39A5CE39A5CE39A5CE39A5
        CE39A5CE39A5CEFF00FFFF00FF248CB843B7DC80CEEA92D5ED9EDAEEA8DEF08D
        D4EA8DD4EA8DD4EA8CD3EA8CD3EA8CD3EA54BDE3FF00FFFF00FFFF00FF248CB8
        4EB8DBAADFF0C0E8F4E6F8FCE6F8FCCBECF639A5CEFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF39A5CE39A5CE39A5CE39A5CE39A5CE39
        A5CEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = bbCalvesRegisteredClick
    end
  end
  object ActionList1: TActionList
    Images = ImageStore.ImageList16x16
    Left = 576
    Top = 8
    object actExit: TAction
      Caption = 'Exit'
      ImageIndex = 0
      OnExecute = actExitExecute
    end
    object actLogin: TAction
      Caption = 'CTS Login Information'
      ImageIndex = 24
      OnExecute = actLoginExecute
    end
    object actRegisterCTS: TAction
      Caption = 'Register with CTS'
      ImageIndex = 23
      OnExecute = actRegisterCTSExecute
    end
    object actHelp: TAction
      Caption = 'Help'
      ImageIndex = 7
      OnExecute = actHelpExecute
    end
    object actPrintGrid: TAction
      Caption = 'Print'
      ImageIndex = 19
      OnExecute = actPrintGridExecute
    end
    object actCheckCTSWSStatus: TAction
      Caption = 'Check CTS Web Service Status'
      ImageIndex = 28
      OnExecute = actCheckCTSWSStatusExecute
    end
    object actViewCTSExceptions: TAction
      Caption = 'View CTS Exceptions'
      ImageIndex = 29
      OnExecute = actViewCTSExceptionsExecute
    end
    object actChangeSireNatIDNum: TAction
      Caption = 'Change Sire Nat. Id. No.'
      OnExecute = actChangeSireNatIDNumExecute
    end
    object actChangeDamNatIDNum: TAction
      Caption = 'Change Dam Nat. Id. No.'
      OnExecute = actChangeDamNatIDNumExecute
    end
    object actChangeSurrogateDamNatIDNum: TAction
      Caption = 'Change Surrogate Dam Nat. Id. No.'
      OnExecute = actChangeSurrogateDamNatIDNumExecute
    end
    object actRemoveSireNatIdNum: TAction
      Caption = 'Remove Sire Nat. Id. No. (Optional Field)'
      OnExecute = actRemoveSireNatIdNumExecute
    end
    object actRemoveSurrogateNatIdNum: TAction
      Caption = 'Remove Surrogate Nat. Id. No. (Optional Field)'
      OnExecute = actRemoveSurrogateNatIdNumExecute
    end
    object actRemovePermanently: TAction
      Caption = 'Remove Calf from Registration - Permanently '
      OnExecute = actRemovePermanentlyExecute
    end
    object actRemoveAllPermanently: TAction
      Caption = 'Remove ALL calves from registration - Permanently '
      OnExecute = actRemoveAllPermanentlyExecute
    end
    object actRemoveAllBullCalves: TAction
      Caption = 'Remove ALL Bull calves from registration - Permanently '
      OnExecute = actRemoveAllBullCalvesExecute
    end
  end
  object tmpCTSBirths: TTable
    AfterPost = tmpCTSBirthsAfterPost
    DatabaseName = 'Kingswd'
    TableName = 'tmpCTSBirths'
    Left = 5
    Top = 219
    object tmpCTSBirthsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tmpCTSBirthsEventID: TIntegerField
      FieldName = 'EventID'
    end
    object tmpCTSBirthsAnimalID: TIntegerField
      FieldName = 'AnimalID'
    end
    object tmpCTSBirthsNatIDNum: TStringField
      DisplayLabel = 'Nat. Id. No.'
      FieldName = 'NatIDNum'
    end
    object tmpCTSBirthsOutputNatIDNum: TStringField
      FieldName = 'OutputNatIDNum'
      Size = 14
    end
    object tmpCTSBirthsSortNatIDNum: TStringField
      FieldName = 'SortNatIDNum'
    end
    object tmpCTSBirthsSex: TStringField
      FieldName = 'Sex'
      Size = 6
    end
    object tmpCTSBirthsDateOfBirth: TDateField
      DisplayLabel = 'Date Of Birth'
      FieldName = 'DateOfBirth'
    end
    object tmpCTSBirthsBreed: TStringField
      FieldName = 'Breed'
      Size = 6
    end
    object tmpCTSBirthsEID: TStringField
      FieldName = 'EID'
    end
    object tmpCTSBirthsOutputDamNatIDNum: TStringField
      FieldName = 'OutputDamNatIDNum'
      Size = 14
    end
    object tmpCTSBirthsDamNatIDNum: TStringField
      DisplayLabel = 'Dam Nat. Id. No.'
      FieldName = 'DamNatIDNum'
    end
    object tmpCTSBirthsDamSortNatIDNum: TStringField
      FieldName = 'DamSortNatIDNum'
    end
    object tmpCTSBirthsOutputSurrogateNatIDNum: TStringField
      FieldName = 'OutputSurrogateNatIDNum'
      Size = 14
    end
    object tmpCTSBirthsSurrogateNatIDNum: TStringField
      DisplayLabel = 'Surr. Nat. Id. No.'
      FieldName = 'SurrogateNatIDNum'
    end
    object tmpCTSBirthsSurrogateSortNatIDNum: TStringField
      FieldName = 'SurrogateSortNatIDNum'
    end
    object tmpCTSBirthsOutputSireNatIDNum: TStringField
      FieldName = 'OutputSireNatIDNum'
      Size = 14
    end
    object tmpCTSBirthsSireNatIDNum: TStringField
      DisplayLabel = 'Sire Nat. Id. No.'
      FieldName = 'SireNatIDNum'
    end
    object tmpCTSBirthsSireSortNatIDNum: TStringField
      FieldName = 'SireSortNatIDNum'
    end
    object tmpCTSBirthsBLoc: TStringField
      FieldName = 'BLoc'
    end
    object tmpCTSBirthsBSLoc: TStringField
      FieldName = 'BSLoc'
    end
    object tmpCTSBirthsPLoc: TStringField
      FieldName = 'PLoc'
    end
    object tmpCTSBirthsPSLoc: TStringField
      FieldName = 'PSLoc'
    end
    object tmpCTSBirthsIgnoreWarnings: TBooleanField
      DisplayLabel = 'Ignore Warnings'
      FieldName = 'IgnoreWarnings'
    end
    object tmpCTSBirthsSelected: TBooleanField
      FieldName = 'Selected'
    end
    object tmpCTSBirthsCTSBatchID: TIntegerField
      FieldName = 'CTSBatchID'
    end
    object tmpCTSBirthsRegistered: TBooleanField
      FieldName = 'Registered'
    end
    object tmpCTSBirthsDamID: TIntegerField
      FieldName = 'DamID'
    end
    object tmpCTSBirthsSurrogateDamID: TIntegerField
      FieldName = 'SurrogateDamID'
    end
    object tmpCTSBirthsSireID: TIntegerField
      FieldName = 'SireID'
    end
    object tmpCTSBirthsCalvingFieldName: TStringField
      FieldName = 'CalvingFieldName'
      Size = 10
    end
    object tmpCTSBirthsDBSex: TStringField
      FieldName = 'DBSex'
      Size = 6
    end
  end
  object dstmpCTSBirths: TDataSource
    DataSet = tmpCTSBirths
    Left = 5
    Top = 311
  end
  object QueryDamSire: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      
        'Select AnimalNo, SortAnimalNo, NatIdNum, SortNatId, Name, UKAISi' +
        'reCode'
      'From Animals'
      'Where ID = :AID')
    Left = 5
    Top = 247
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AID'
        ParamType = ptUnknown
      end>
  end
  object GenQuery: TQuery
    DatabaseName = 'Kingswd'
    Left = 5
    Top = 279
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 6
    Top = 186
    object cxStyleRegistered: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clGreen
    end
    object cxStyleNotRegistered: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clRed
    end
    object cxStyleDefault: TcxStyle
      AssignedValues = [svTextColor]
      TextColor = clWindowText
    end
  end
  object Births: TTable
    DatabaseName = 'Kingswd'
    TableName = 'tmpCTSBirthstest.DB'
    Left = 6
    Top = 344
    object BirthsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object BirthsCTSBatchID: TIntegerField
      FieldName = 'CTSBatchID'
    end
    object BirthsEventID: TIntegerField
      FieldName = 'EventID'
    end
    object BirthsAnimalID: TIntegerField
      FieldName = 'AnimalID'
    end
    object BirthsNatIDNum: TStringField
      FieldName = 'NatIDNum'
    end
    object BirthsOutputNatIDNum: TStringField
      FieldName = 'OutputNatIDNum'
      Size = 14
    end
    object BirthsSortNatIDNum: TStringField
      FieldName = 'SortNatIDNum'
    end
    object BirthsSex: TStringField
      FieldName = 'Sex'
      Size = 6
    end
    object BirthsDateOfBirth: TDateField
      FieldName = 'DateOfBirth'
    end
    object BirthsBreed: TStringField
      FieldName = 'Breed'
      Size = 6
    end
    object BirthsEID: TStringField
      FieldName = 'EID'
    end
    object BirthsOutputDamNatIDNum: TStringField
      FieldName = 'OutputDamNatIDNum'
      Size = 14
    end
    object BirthsDamNatIDNum: TStringField
      FieldName = 'DamNatIDNum'
    end
    object BirthsDamSortNatIDNum: TStringField
      FieldName = 'DamSortNatIDNum'
    end
    object BirthsOutputSurrogateNatIDNum: TStringField
      FieldName = 'OutputSurrogateNatIDNum'
      Size = 14
    end
    object BirthsSurrogateNatIDNum: TStringField
      FieldName = 'SurrogateNatIDNum'
    end
    object BirthsSurrogateSortNatIDNum: TStringField
      FieldName = 'SurrogateSortNatIDNum'
    end
    object BirthsOutputSireNatIDNum: TStringField
      FieldName = 'OutputSireNatIDNum'
      Size = 14
    end
    object BirthsSireNatIDNum: TStringField
      FieldName = 'SireNatIDNum'
    end
    object BirthsSireSortNatIDNum: TStringField
      FieldName = 'SireSortNatIDNum'
    end
    object BirthsBLoc: TStringField
      FieldName = 'BLoc'
    end
    object BirthsBSLoc: TStringField
      FieldName = 'BSLoc'
    end
    object BirthsPLoc: TStringField
      FieldName = 'PLoc'
    end
    object BirthsPSLoc: TStringField
      FieldName = 'PSLoc'
    end
    object BirthsIgnoreWarnings: TBooleanField
      FieldName = 'IgnoreWarnings'
    end
    object BirthsSelected: TBooleanField
      FieldName = 'Selected'
    end
    object BirthsRegistered: TBooleanField
      FieldName = 'Registered'
    end
  end
  object dxBarPopupMenu1: TdxBarPopupMenu
    BarManager = dxBarManager1
    ItemLinks = <
      item
        Visible = True
      end
      item
        BeginGroup = True
        Visible = True
      end
      item
        Visible = True
      end
      item
        Visible = True
      end
      item
        Item = dxBarButton1
        Visible = True
      end
      item
        Item = dxBarButton2
        Visible = True
      end
      item
        Item = bbCalvesRegistered
        Visible = True
      end
      item
        Item = dxBarSubItem1
        Visible = True
      end>
    UseOwnFont = False
    Left = 640
    Top = 8
  end
  object QueryCTSRequests: TQuery
    OnCalcFields = QueryCTSRequestsCalcFields
    DatabaseName = 'Kingswd'
    Left = 6
    Top = 376
    object QueryCTSRequestsDamNatID: TStringField
      FieldKind = fkCalculated
      FieldName = 'DamNatID'
      Calculated = True
    end
    object QueryCTSRequestsGenDamNatID: TStringField
      FieldKind = fkCalculated
      FieldName = 'GenDamNatID'
      Calculated = True
    end
    object QueryCTSRequestsID: TIntegerField
      FieldName = 'ID'
    end
    object QueryCTSRequestsRequestdate: TDateTimeField
      FieldName = 'Requestdate'
    end
    object QueryCTSRequestsCTSBatchID: TIntegerField
      FieldName = 'CTSBatchID'
    end
    object QueryCTSRequestsRegistered: TBooleanField
      FieldName = 'Registered'
    end
    object QueryCTSRequestsAnimalID: TIntegerField
      FieldName = 'AnimalID'
    end
    object QueryCTSRequestsWarnings: TBooleanField
      FieldName = 'Warnings'
    end
    object QueryCTSRequestsTxnId: TStringField
      FieldName = 'TxnId'
      Size = 40
    end
    object QueryCTSRequestsNatIDNum: TStringField
      FieldName = 'NatIDNum'
    end
    object QueryCTSRequestsSex: TStringField
      FieldName = 'Sex'
      Size = 10
    end
    object QueryCTSRequestsDateOfBirth: TDateField
      FieldName = 'DateOfBirth'
    end
    object QueryCTSRequestsSortNatID: TStringField
      FieldName = 'SortNatID'
    end
    object QueryCTSRequestsDamNatIDNum: TStringField
      FieldName = 'DamNatIDNum'
    end
    object QueryCTSRequestsDamSortNatID: TStringField
      FieldName = 'DamSortNatID'
    end
    object QueryCTSRequestsSireNatIDNum: TStringField
      FieldName = 'SireNatIDNum'
    end
    object QueryCTSRequestsSireSortNatID: TStringField
      FieldName = 'SireSortNatID'
    end
    object QueryCTSRequestsDonorDamNatID: TStringField
      FieldName = 'DonorDamNatID'
    end
    object QueryCTSRequestsDonorDamSortNatID: TStringField
      FieldName = 'DonorDamSortNatID'
    end
    object QueryCTSRequestsBreedCode: TStringField
      FieldName = 'BreedCode'
      Size = 6
    end
  end
  object dsQueryCTSRequests: TDataSource
    DataSet = QueryCTSRequests
    Left = 5
    Top = 408
  end
  object GridPopupMenu: TdxBarPopupMenu
    BarManager = dxBarManager1
    ItemLinks = <
      item
        Item = bbChangeDamNatID
        Visible = True
      end
      item
        BeginGroup = True
        Item = bbChangeSireNatID
        Visible = True
      end
      item
        Item = bbRemoveSireNatIdNum
        Visible = True
      end
      item
        BeginGroup = True
        Item = bbChangeSurrDamNatID
        Visible = True
      end
      item
        Item = bbRemoveSurrogateNatIdNum
        Visible = True
      end
      item
        BeginGroup = True
        Item = dxBarButton4
        Visible = True
      end
      item
        BeginGroup = True
        Item = dxBarButton6
        Visible = True
      end
      item
        Item = dxBarButton5
        Visible = True
      end>
    UseOwnFont = False
    OnPopup = GridPopupMenuPopup
    Left = 544
    Top = 8
  end
  object ComponentPrinter: TdxComponentPrinter
    CurrentLink = CalvesRegisteredComponentPrinterLink
    CustomizeDlgOptions = []
    PreviewOptions.EnableOptions = [peoPrint]
    PreviewOptions.VisibleOptions = [pvoPrint]
    PreviewOptions.WindowState = wsMaximized
    PrintTitle = 'Kingswood Grid Print'
    Version = 0
    Left = 512
    Top = 8
    object ToBeRegBirthComponentPrinterLink: TdxGridReportLink
      Active = True
      Component = RegBirthGrid
      DesignerCaption = 'Calves To Be Registered'
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
      ReportDocument.Caption = 'Calves To Be Registered'
      ReportDocument.CreationDate = 44252.4491408681
      ReportDocument.Creator = 'Kingswood Computing Ltd'
      OptionsOnEveryPage.Footers = False
      OptionsOnEveryPage.Caption = False
      OptionsOnEveryPage.FilterBar = False
      OptionsSize.AutoWidth = True
      OptionsView.Footers = False
      OptionsView.Caption = False
      OptionsView.ExpandButtons = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      BuiltInReportLink = True
    end
    object CalvesRegisteredComponentPrinterLink: TdxGridReportLink
      Active = True
      Component = PreviousResultsGrid
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
      ReportDocument.Caption = 'Calves Registered'
      ReportDocument.CreationDate = 44252.4491408681
      ReportDocument.Creator = 'Kingswood Computing Ltd'
      OptionsOnEveryPage.Footers = False
      OptionsOnEveryPage.Caption = False
      OptionsOnEveryPage.FilterBar = False
      OptionsSize.AutoWidth = True
      OptionsView.Footers = False
      OptionsView.Caption = False
      OptionsView.ExpandButtons = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      BuiltInReportLink = True
    end
  end
end
