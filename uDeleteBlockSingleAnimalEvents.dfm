inherited fmDeleteBlockSingleAnimalEvents: TfmDeleteBlockSingleAnimalEvents
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'Delete Animal Events'
  ClientWidth = 451
  Font.Height = -13
  Font.Name = 'Segoe UI'
  PixelsPerInch = 96
  TextHeight = 17
  inherited StatusBar: TdxStatusBar
    Width = 451
  end
  object pAnimalTagInfo: TPanel [1]
    Left = 0
    Top = 49
    Width = 451
    Height = 56
    Align = alTop
    Color = clInfoBk
    TabOrder = 5
    object lAnimalInfo: TcxLabel
      Left = 1
      Top = 1
      Align = alClient
      Caption = 'lAnimalInfo'
      Properties.Alignment.Vert = taVCenter
      Style.TextColor = clNavy
    end
  end
  object pDateFilter: TPanel [2]
    Left = 0
    Top = 105
    Width = 451
    Height = 56
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pDateFilter'
    TabOrder = 6
  end
  object EventGrid: TcxGrid [3]
    Left = 0
    Top = 161
    Width = 451
    Height = 172
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
    object EventGridAnimalEventsView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.First.Visible = False
      NavigatorButtons.PriorPage.Visible = False
      NavigatorButtons.Prior.Visible = False
      NavigatorButtons.Next.Visible = False
      NavigatorButtons.NextPage.Visible = False
      NavigatorButtons.Last.Visible = False
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
      DataController.DataModeController.SmartRefresh = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.FocusRect = False
      OptionsView.Navigator = True
      OptionsView.NavigatorOffset = 0
      OptionsView.DataRowHeight = 21
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 21
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 10
      Preview.Visible = True
      object EventGridAnimalEventsViewEventType: TcxGridDBColumn
        Caption = 'Event'
        DataBinding.FieldName = 'EventType'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 100
      end
      object EventGridAnimalEventsViewEventDate: TcxGridDBColumn
        Caption = 'Date'
        DataBinding.FieldName = 'EventDate'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        SortIndex = 0
        SortOrder = soDescending
        Width = 100
      end
      object EventGridAnimalEventsViewEventDesc: TcxGridDBColumn
        Caption = 'Comment'
        DataBinding.FieldName = 'EventDesc'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Width = 200
      end
    end
    object EventGridFeedEventsView: TcxGridDBTableView
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
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRectOnExit = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.FocusRect = False
      OptionsView.Navigator = True
      OptionsView.NavigatorOffset = 0
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 10
      Preview.Visible = True
      object EventGridFeedEventsViewAllocDate: TcxGridDBColumn
        Caption = 'Alloc. Date'
        DataBinding.FieldName = 'AllocDate'
        Options.Editing = False
        Options.Filtering = False
        Width = 64
      end
      object EventGridFeedEventsViewQuantDay: TcxGridDBColumn
        Caption = 'Kg/Day'
        DataBinding.FieldName = 'QuantDay'
        Options.Filtering = False
        Width = 54
      end
      object EventGridFeedEventsViewCostDay: TcxGridDBColumn
        Caption = 'Cost/Day'
        DataBinding.FieldName = 'CostDay'
        Options.Editing = False
        Options.Filtering = False
        Width = 64
      end
      object EventGridFeedEventsViewFeedName: TcxGridDBColumn
        Caption = 'Feed Name'
        DataBinding.FieldName = 'FeedName'
        Width = 74
      end
      object EventGridFeedEventsViewEndDate: TcxGridDBColumn
        Caption = 'End Date'
        DataBinding.FieldName = 'EndDate'
      end
      object EventGridFeedEventsViewNoDays: TcxGridDBColumn
        Caption = 'No. Days'
        DataBinding.FieldName = 'NoDays'
      end
    end
    object EventGridLevel: TcxGridLevel
      GridView = EventGridAnimalEventsView
    end
  end
  inherited ActionList: TActionList
    Left = 408
    object actDeleteEvents: TAction
      Caption = 'Delete Events'
      ImageIndex = 21
    end
    object actFindEvents: TAction
      Caption = 'Find Events'
      ImageIndex = 34
    end
  end
  inherited BarManager: TdxBarManager
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
        FloatLeft = 353
        FloatTop = 250
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = bClose
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = bFindEvents
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = bDeleteEvents
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = bHelp
            UserGlyph.Data = {00000000}
            Visible = True
          end>
        Name = 'Main'
        OneOnRow = True
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
        BackgroundBitmap.Data = {00000000}
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 376
    DockControlHeights = (
      0
      0
      49
      0)
    inherited bClose: TdxBarLargeButton
      Width = 85
    end
    inherited bHelp: TdxBarLargeButton
      Width = 85
    end
    object bDeleteEvents: TdxBarLargeButton
      Action = actDeleteEvents
      Category = 0
      Height = 45
      Width = 85
    end
    object bFindEvents: TdxBarLargeButton
      Action = actFindEvents
      Category = 0
      Height = 45
      Width = 85
    end
  end
end
