object fmCTSWSMovementReg: TfmCTSWSMovementReg
  Left = 403
  Top = 201
  Width = 845
  Height = 577
  Caption = 'CTS Movement Registrations'
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
    Left = 0
    Top = 42
    Width = 837
    Height = 504
    ActivePage = tsToBeRegistered
    Align = alClient
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = True
    TabHeight = 28
    TabOrder = 4
    TabWidth = 150
    OnPageChanging = PageControlPageChanging
    ClientRectBottom = 500
    ClientRectLeft = 4
    ClientRectRight = 833
    ClientRectTop = 34
    object tsToBeRegistered: TcxTabSheet
      Caption = 'To be Registered'
      ImageIndex = 0
      object RegMovementsGrid: TcxGrid
        Left = 20
        Top = 22
        Width = 797
        Height = 387
        PopupMenu = GridPopupMenu
        TabOrder = 0
        LookAndFeel.NativeStyle = True
        object RegMovementsGridDBTableView: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          OnCellDblClick = RegMovementsGridDBTableViewCellDblClick
          DataController.DataSource = dstmpCTSMovements
          DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoFocusTopRowAfterSorting, dcoImmediatePost]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsView.DataRowHeight = 22
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 36
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 15
          Styles.OnGetContentStyle = RegMovementsGridDBTableViewStylesGetContentStyle
          object RegMovementsGridDBTableViewID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
          end
          object RegMovementsGridDBTableViewEventID: TcxGridDBColumn
            DataBinding.FieldName = 'EventID'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
          end
          object RegMovementsGridDBTableViewSelected: TcxGridDBColumn
            DataBinding.FieldName = 'Selected'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayGrayed = 'False'
            Properties.ImmediatePost = True
            Properties.NullStyle = nssUnchecked
            HeaderAlignmentVert = vaCenter
            Width = 52
          end
          object RegMovementsGridDBTableViewIgnoreWarnings: TcxGridDBColumn
            Caption = 'Ignore Warnings'
            DataBinding.FieldName = 'IgnoreWarnings'
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.DisplayGrayed = 'False'
            Properties.ImmediatePost = True
            Properties.NullStyle = nssUnchecked
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 57
          end
          object RegMovementsGridDBTableViewStatus: TcxGridDBColumn
            Caption = 'Status'
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
            Properties.OnButtonClick = RegMovementsGridDBTableViewStatusPropertiesButtonClick
            HeaderAlignmentVert = vaCenter
            Options.ShowEditButtons = isebAlways
            Width = 38
          end
          object RegMovementsGridDBTableViewAnimalID: TcxGridDBColumn
            DataBinding.FieldName = 'AnimalID'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
          end
          object RegMovementsGridDBTableViewNatIDNum: TcxGridDBColumn
            Caption = 'Nat. Id. No.'
            DataBinding.FieldName = 'NatIDNum'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
          end
          object RegMovementsGridDBTableViewSortNatIDNum: TcxGridDBColumn
            Caption = 'Nat. Id. No.'
            DataBinding.FieldName = 'SortNatIDNum'
            OnGetDisplayText = RegMovementsGridDBTableViewSortNatIDNumGetDisplayText
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.SortByDisplayText = isbtOff
            Width = 138
          end
          object RegMovementsGridDBTableViewMType: TcxGridDBColumn
            Caption = 'Mov. Type'
            DataBinding.FieldName = 'MType'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 57
          end
          object RegMovementsGridDBTableViewMovedFromTo: TcxGridDBColumn
            Caption = 'Source/Destination'
            DataBinding.FieldName = 'MovedFromTo'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
          end
          object RegMovementsGridDBTableViewOutputNatIDNum: TcxGridDBColumn
            DataBinding.FieldName = 'OutputNatIDNum'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
          end
          object RegMovementsGridDBTableViewEID: TcxGridDBColumn
            DataBinding.FieldName = 'EID'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
          end
          object RegMovementsGridDBTableViewLoc: TcxGridDBColumn
            DataBinding.FieldName = 'Loc'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 87
          end
          object RegMovementsGridDBTableViewSLoc: TcxGridDBColumn
            DataBinding.FieldName = 'SLoc'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 32
          end
          object RegMovementsGridDBTableViewMDate: TcxGridDBColumn
            Caption = 'Mov. Date'
            DataBinding.FieldName = 'MDate'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 73
          end
          object RegMovementsGridDBTableViewRefNum: TcxGridDBColumn
            Caption = 'Ref. Num'
            DataBinding.FieldName = 'RefNum'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 59
          end
          object RegMovementsGridDBTableViewCTSBatchID: TcxGridDBColumn
            DataBinding.FieldName = 'CTSBatchID'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
          end
          object RegMovementsGridDBTableViewRegistered: TcxGridDBColumn
            DataBinding.FieldName = 'Registered'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
          end
        end
        object RegMovementsGridLevel: TcxGridLevel
          GridView = RegMovementsGridDBTableView
        end
      end
      object StatusBar: TdxStatusBar
        Left = 0
        Top = 446
        Width = 829
        Height = 20
        Panels = <
          item
            PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
            Width = 250
          end>
        LookAndFeel.NativeStyle = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
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
          Left = 512
          Top = 38
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
            'Movements Rejected'
            'Movements Accepted'
            'All Movements')
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
          Left = 294
          Top = 16
          Style.BorderStyle = ebsNone
          Style.Edges = []
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 3
          Transparent = True
          Height = 35
          Width = 189
          object lMovementsRejected: TcxLabel
            Left = 12
            Top = 19
            Caption = 'Movements Rejected:'
            Properties.Alignment.Horz = taRightJustify
            Style.TransparentBorder = False
            Transparent = True
          end
          object lMovementsAccepted: TcxLabel
            Left = 10
            Top = -1
            Caption = 'Movements Accepted:'
            Properties.Alignment.Horz = taLeftJustify
            Style.TransparentBorder = False
            Transparent = True
          end
          object lNoMovementsAccepted: TcxLabel
            Left = 122
            Top = -1
            AutoSize = False
            Caption = 'lNoMovementsAccepted'
            Style.TextColor = clGreen
            Style.TransparentBorder = False
            Transparent = True
            Height = 17
            Width = 40
          end
          object lNoMovementsRejected: TcxLabel
            Left = 122
            Top = 19
            AutoSize = False
            Caption = 'lNoMovementsRejected'
            Style.TextColor = clRed
            Style.TransparentBorder = False
            Transparent = True
            Height = 17
            Width = 40
          end
        end
        object gbPreviousResultsNos: TcxGroupBox
          Left = 304
          Top = 18
          Style.BorderStyle = ebsNone
          Style.Edges = []
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 4
          Transparent = True
          Height = 33
          Width = 243
          object lMovements: TcxLabel
            Left = -1
            Top = 2
            AutoSize = False
            Caption = 'Total Movements:'
            Properties.Alignment.Horz = taRightJustify
            Style.TransparentBorder = False
            Transparent = True
            Height = 13
            Width = 166
          end
          object lNoOfMovements: TcxLabel
            Left = 169
            Top = 2
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
          DataController.DataSource = dsQueryCTSRequests
          DataController.KeyFieldNames = 'ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsView.DataRowHeight = 22
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 36
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 15
          Styles.OnGetContentStyle = PreviousResultsGridTableViewStylesGetContentStyle
          object PreviousResultsGridTableViewID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
          end
          object PreviousResultsGridTableViewStatus: TcxGridDBColumn
            Caption = 'Status'
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
            Properties.OnButtonClick = PreviousResultsGridTableViewStatusPropertiesButtonClick
            HeaderAlignmentVert = vaCenter
            Options.ShowEditButtons = isebAlways
            Width = 41
          end
          object PreviousResultsGridTableViewAnimalID: TcxGridDBColumn
            DataBinding.FieldName = 'AnimalID'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
          end
          object PreviousResultsGridTableViewRegisteredDate: TcxGridDBColumn
            Caption = 'Registration Date/Time'
            DataBinding.FieldName = 'RequestDate'
            PropertiesClassName = 'TcxDateEditProperties'
            Properties.Kind = ckDateTime
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 131
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
            Width = 153
          end
          object PreviousResultsGridTableViewSex: TcxGridDBColumn
            DataBinding.FieldName = 'Sex'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.ShowEditButtons = isebNever
          end
          object PreviousResultsGridTableViewMType: TcxGridDBColumn
            Caption = 'Mov. Type'
            DataBinding.FieldName = 'MType'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 57
          end
          object PreviousResultsGridTableViewOutputNatIDNum: TcxGridDBColumn
            DataBinding.FieldName = 'OutputNatIDNum'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
          end
          object PreviousResultsGridTableViewSortNatIDNum: TcxGridDBColumn
            DataBinding.FieldName = 'SortNatIDNum'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
            Options.Editing = False
            Options.ShowEditButtons = isebNever
          end
          object PreviousResultsGridTableViewDateOfBirth: TcxGridDBColumn
            Caption = 'Date of Birth'
            DataBinding.FieldName = 'DateOfBirth'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Width = 79
          end
          object PreviousResultsGridTableViewBreedCode: TcxGridDBColumn
            Caption = 'Breed'
            DataBinding.FieldName = 'BreedCode'
            HeaderAlignmentVert = vaCenter
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
    Left = 432
    Top = 6
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
      Caption = 'Options'
      Category = 0
      Hint = 'Options'
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = dxBarPopupMenu1
      HotImageIndex = 27
      LargeImageIndex = 3
      SyncImageIndex = False
      ImageIndex = 27
    end
    object blbRegisterCTS: TdxBarLargeButton
      Action = actRegisterCTS
      Category = 0
      HotImageIndex = 23
    end
    object blbTestData: TdxBarLargeButton
      Caption = 'Load Test Data'
      Category = 0
      Hint = 'Load Test Data'
      Visible = ivNever
      OnClick = blbTestDataClick
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
    object dxBarLargeButton3: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarButton1: TdxBarButton
      Action = actLogin
      Category = 0
      ImageIndex = 24
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
    object dxBarButton4: TdxBarButton
      Action = actChangeNatIDNum
      Category = 0
    end
    object dxBarButton5: TdxBarButton
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
    object dxBarButton6: TdxBarButton
      Action = actRemoveAllPermanently
      Category = 0
    end
    object blbPrint: TdxBarLargeButton
      Action = actPrint
      Category = 0
      HotImageIndex = 19
      SyncImageIndex = False
      ImageIndex = 19
    end
  end
  object ActionList1: TActionList
    Images = ImageStore.ImageList16x16
    Left = 400
    Top = 6
    object actExit: TAction
      Caption = 'Exit'
      ImageIndex = 0
      OnExecute = actExitExecute
    end
    object actLogin: TAction
      Caption = 'CTS Login Information'
      ImageIndex = 3
      OnExecute = actLoginExecute
    end
    object actRegisterCTS: TAction
      Caption = 'Register with CTS'
      ImageIndex = 23
      OnExecute = actRegisterCTSExecute
    end
    object actPrint: TAction
      Caption = 'Print Preview'
      ImageIndex = 19
      OnExecute = actPrintExecute
    end
    object actHelp: TAction
      Caption = 'Help'
      ImageIndex = 7
      OnExecute = actHelpExecute
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
    object actChangeNatIDNum: TAction
      Caption = 'Change Nat. Id. No.'
      OnExecute = actChangeNatIDNumExecute
    end
    object actRemovePermanently: TAction
      Caption = 'Remove Movement from Registration - Permanently '
      OnExecute = actRemovePermanentlyExecute
    end
    object actRemoveAllPermanently: TAction
      Caption = 'Remove All Movements from Registration - Permanently '
      OnExecute = actRemoveAllPermanentlyExecute
    end
  end
  object tmpCTSMovements: TTable
    AfterPost = tmpCTSMovementsAfterPost
    DatabaseName = 'Kingswd'
    TableName = 'tmpCTSMovements'
    Left = 7
    Top = 117
    object tmpCTSMovementsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tmpCTSMovementsEventID: TIntegerField
      FieldName = 'EventID'
    end
    object tmpCTSMovementsAnimalID: TIntegerField
      FieldName = 'AnimalID'
    end
    object tmpCTSMovementsMovedFromTo: TStringField
      FieldName = 'MovedFromTo'
      Size = 30
    end
    object tmpCTSMovementsNatIDNum: TStringField
      FieldName = 'NatIDNum'
    end
    object tmpCTSMovementsOutputNatIDNum: TStringField
      FieldName = 'OutputNatIDNum'
      Size = 14
    end
    object tmpCTSMovementsSortNatIDNum: TStringField
      FieldName = 'SortNatIDNum'
    end
    object tmpCTSMovementsEID: TStringField
      FieldName = 'EID'
    end
    object tmpCTSMovementsLoc: TStringField
      FieldName = 'Loc'
    end
    object tmpCTSMovementsSLoc: TStringField
      FieldName = 'SLoc'
    end
    object tmpCTSMovementsMType: TStringField
      FieldName = 'MType'
      Size = 6
    end
    object tmpCTSMovementsMDate: TDateTimeField
      FieldName = 'MDate'
    end
    object tmpCTSMovementsRefNum: TStringField
      FieldName = 'RefNum'
      Size = 2
    end
    object tmpCTSMovementsIgnoreWarnings: TBooleanField
      FieldName = 'IgnoreWarnings'
    end
    object tmpCTSMovementsSelected: TBooleanField
      FieldName = 'Selected'
    end
    object tmpCTSMovementsCTSBatchID: TIntegerField
      FieldName = 'CTSBatchID'
    end
    object tmpCTSMovementsRegistered: TBooleanField
      FieldName = 'Registered'
    end
  end
  object GenQuery: TQuery
    DatabaseName = 'Kingswd'
    Left = 7
    Top = 149
  end
  object dstmpCTSMovements: TDataSource
    DataSet = tmpCTSMovements
    Left = 7
    Top = 181
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 6
    Top = 86
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
  object Movements: TTable
    DatabaseName = 'Kingswd'
    TableName = 'tmpCTSMovementsTest.DB'
    Left = 10
    Top = 212
    object MovementsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object MovementsCTSBatchID: TIntegerField
      FieldName = 'CTSBatchID'
    end
    object MovementsEventID: TIntegerField
      FieldName = 'EventID'
    end
    object MovementsAnimalID: TIntegerField
      FieldName = 'AnimalID'
    end
    object MovementsMovedFromTo: TStringField
      FieldName = 'MovedFromTo'
      Size = 30
    end
    object MovementsNatIDNum: TStringField
      FieldName = 'NatIDNum'
    end
    object MovementsOutputNatIDNum: TStringField
      FieldName = 'OutputNatIDNum'
      Size = 14
    end
    object MovementsSortNatIDNum: TStringField
      FieldName = 'SortNatIDNum'
    end
    object MovementsEID: TStringField
      FieldName = 'EID'
    end
    object MovementsLoc: TStringField
      FieldName = 'Loc'
    end
    object MovementsSLoc: TStringField
      FieldName = 'SLoc'
    end
    object MovementsMType: TStringField
      FieldName = 'MType'
      Size = 6
    end
    object MovementsMDate: TDateTimeField
      FieldName = 'MDate'
    end
    object MovementsRefNum: TStringField
      FieldName = 'RefNum'
      Size = 2
    end
    object MovementsIgnoreWarnings: TBooleanField
      FieldName = 'IgnoreWarnings'
    end
    object MovementsSelected: TBooleanField
      FieldName = 'Selected'
    end
    object MovementsRegistered: TBooleanField
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
        Item = dxBarButton1
        Visible = True
      end
      item
        Item = dxBarButton2
        UserDefine = [udPaintStyle]
        Visible = True
      end
      item
        BeginGroup = True
        Item = dxBarSubItem1
        Visible = True
      end>
    UseOwnFont = False
    Left = 496
    Top = 6
  end
  object QueryCTSRequests: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      '')
    Left = 8
    Top = 244
  end
  object dsQueryCTSRequests: TDataSource
    DataSet = QueryCTSRequests
    Left = 8
    Top = 276
  end
  object GridPopupMenu: TdxBarPopupMenu
    BarManager = dxBarManager1
    ItemLinks = <
      item
        Visible = True
      end
      item
        Visible = True
      end
      item
        Visible = True
      end
      item
        Item = dxBarButton4
        Visible = True
      end
      item
        BeginGroup = True
        Item = dxBarButton5
        Visible = True
      end
      item
        BeginGroup = True
        Item = dxBarButton6
        Visible = True
      end>
    UseOwnFont = False
    OnPopup = GridPopupMenuPopup
    Left = 464
    Top = 6
  end
  object dxComponentPrinter: TdxComponentPrinter
    CurrentLink = PreRegMovementsComponentPrinterLink
    PrintTitle = 'Kingswood Grid Print'
    Version = 0
    Left = 529
    Top = 6
    object RegMovmentsComponentPrinterLink: TdxGridReportLink
      Active = True
      Component = RegMovementsGrid
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
      ReportDocument.Caption = 'Movements To Register'
      ReportDocument.CreationDate = 43357.6311339931
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
    object PreRegMovementsComponentPrinterLink: TdxGridReportLink
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
      ReportDocument.Caption = 'Registered Movements'
      ReportDocument.CreationDate = 43357.6311339931
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
