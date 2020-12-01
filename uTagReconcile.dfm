inherited fmTagReconcile: TfmTagReconcile
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'Tag Reconcile'
  ClientWidth = 449
  Font.Height = -13
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 17
  inherited StatusBar: TdxStatusBar
    Top = 122
    Width = 449
  end
  object pHeader: TPanel [1]
    Left = 0
    Top = 49
    Width = 449
    Height = 95
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    object lStartTag: TcxLabel
      Left = 18
      Top = 14
      Caption = 'Start Tag:'
    end
    object ceStartTag: TcxCurrencyEdit
      Left = 82
      Top = 14
      EditValue = 9999
      Properties.AssignedValues.MaxValue = True
      Properties.AssignedValues.MinValue = True
      Properties.DisplayFormat = '0'
      Properties.EditFormat = '0'
      Properties.OnChange = ceStartTagPropertiesChange
      Style.BorderStyle = ebsFlat
      TabOrder = 1
      Width = 97
    end
    object lStartTagInfo: TcxLabel
      Left = 185
      Top = 14
      Caption = '(this is the last 4 digits of the animals tag)'
    end
    object btnBeginCheck: TcxButton
      Left = 71
      Top = 48
      Width = 147
      Height = 33
      Caption = 'Begin Check'
      TabOrder = 3
      OnClick = btnBeginCheckClick
      LookAndFeel.Kind = lfOffice11
    end
    object btnReset: TcxButton
      Left = 227
      Top = 48
      Width = 147
      Height = 33
      Caption = 'Reset'
      TabOrder = 4
      OnClick = btnResetClick
      LookAndFeel.Kind = lfOffice11
    end
  end
  object TagGrid: TcxGrid [2]
    Left = 0
    Top = 142
    Width = 449
    Height = 211
    Align = alBottom
    TabOrder = 6
    LookAndFeel.Kind = lfFlat
    object TagGridDBTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object TagGridDBTableViewMissingTags: TcxGridDBColumn
        Caption = 'Tags Not Found'
        DataBinding.FieldName = 'Tag'
        MinWidth = 400
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 400
      end
    end
    object TagGridLevel: TcxGridLevel
      GridView = TagGridDBTableView
    end
  end
  inherited ActionList: TActionList
    object actPrint: TAction
      Caption = 'Print Preview'
      ImageIndex = 19
      OnExecute = actPrintExecute
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
            Item = blbPrint
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
    DockControlHeights = (
      0
      0
      49
      0)
    object blbPrint: TdxBarLargeButton
      Action = actPrint
      Category = 0
      Height = 45
      LargeGlyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000520B0000520B00000000000000000000FF00FFFF00FF
        AEAEAE999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C
        9E999C9E999C9EFF00FFFF00FFFF00FF636B73F7F7F7F4F4F4F2F2F2EFEFEFED
        EDEDEAEAEAE8E8E8E2E2E2DDDDDDD7D7D7D2D2D29C9FA1FF00FFFF00FF636B73
        3775AB636B73F7F7F7F4F4F4F2F2F2EFEFEFEDEDEDEAEAEAE8E8E8E2E2E2DDDD
        DDD7D7D79C9FA1FF00FFFF00FF31A5FF5ABDFF2F76B3636B73F7F7F7F4F4F4F2
        F2F2EFEFEFEDEDEDEAEAEAE8E8E8E2E2E2DDDDDD9C9FA1FF00FFFF00FFFF00FF
        31A5FF5ABDFF2F76B3F7F7F7F7F7F7F4F4F4F2F2F2EFEFEFEDEDEDEAEAEAE8E8
        E8E2E2E29C9FA1FF00FFFF00FFFF00FFAEAEAE31A5FF4A4239E5DAD5DCC3B1CC
        A79DD3B6A3DDC5BAE5DAD5EDEDEDEAEAEAE8E8E89C9FA1FF00FFFF00FFFF00FF
        AEAEAEFFFFFFE5DAD5AD9383E7D6AAF8E8B5F3E4B2E7D4AECCA79DE9E9E9EDED
        EDEAEAEA9C9FA1FF00FFFF00FFFF00FFAEAEAEFFFFFFD7B9B2ECDDADF9E8B6FF
        EFBBFFF1BCFEF0BBECDEADD3BAB4F0F0F0EDEDED9C9FA1FF00FFFF00FFFF00FF
        AEAEAEFFFFFFCCA79DEBDCACF9E8B6FEEDBBFFF0BCFFF1BDFBEBB7CCA79DF3F3
        F3F0F0F09C9FA1FF00FFFF00FFFF00FFAEAEAEFFFFFFD7B9B2E2D4A7F4E5B7FB
        EEC8FCEBBAFCECB9F0E0B0D7B9B2F5F5F5EAEAEA9C9FA1FF00FFFF00FFFF00FF
        AEAEAEFFFFFFE7D5D5DBC8A9EEE1BAF6E9C2F5E5B4EDDEAED7BE9EDFCAC3E2E2
        E2DDDDDD9C9FA1FF00FFFF00FFFF00FFAEAEAEFFFFFFFFFFFFCCA79DD8C3AEDD
        C9A6DFCAA6DABEA2D4B6AEEBEBEB9C9FA19C9FA19C9FA1FF00FFFF00FFFF00FF
        AEAEAEFFFFFFFFFFFFFFFFFFE7D5D5D7B9B2D7B9B2DDCEC7FFFFFFA8A9AAFFFF
        FFE6E6E69C9FA1FF00FFFF00FFFF00FFAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFA8A9AAE6E6E69B9D9DFF00FFFF00FFFF00FFFF00FF
        AEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A9AA9B9D
        9DFF00FFFF00FFFF00FFFF00FFFF00FFAEAEAE9B9B9C9B9B9C9B9B9C9B9B9C9B
        9B9C9B9B9C9B9B9C9B9B9C9C9FA1FF00FFFF00FFFF00FFFF00FF}
      Width = 85
    end
  end
  object ComponentPrinter: TdxComponentPrinter
    CurrentLink = ComponentPrinterLink
    PrintTitle = 'Missing Tags'
    Version = 0
    Left = 282
    Top = 10
    object ComponentPrinterLink: TdxGridReportLink
      Active = True
      Component = TagGrid
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
      ReportDocument.Caption = 'Missing Tags'
      ReportDocument.CreationDate = 42321.7030739931
      OptionsOnEveryPage.FilterBar = False
      OptionsView.ExpandButtons = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      BuiltInReportLink = True
    end
  end
end
