object fmAWReviewCalves: TfmAWReviewCalves
  Left = 407
  Top = 226
  Width = 802
  Height = 483
  Caption = 'Animal Welfare - Suckler Calf Review'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 409
    Width = 794
    Height = 2
    Align = alBottom
    Shape = bsBottomLine
  end
  object Panel1: TPanel
    Left = 0
    Top = 411
    Width = 794
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnClose: TcxButton
      Left = 695
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Close'
      Default = True
      ModalResult = 1
      TabOrder = 0
      LookAndFeel.NativeStyle = True
    end
    object btnPrint: TcxButton
      Left = 612
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Print'
      TabOrder = 1
      OnClick = btnPrintClick
      LookAndFeel.NativeStyle = True
    end
  end
  object GridEventData: TcxGrid
    Left = 10
    Top = 14
    Width = 771
    Height = 374
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    object GridEventDataDBTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      FilterBox.CustomizeDialog = False
      DataController.DataSource = dsAWCalves
      DataController.KeyFieldNames = 'RecId'
      DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoFocusTopRowAfterSorting]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = 'Total: #'
          Kind = skCount
          FieldName = 'ID'
          Column = GridEventDataDBTableViewSortNatID
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.DataRowHeight = 24
      OptionsView.Footer = True
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 32
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      object GridEventDataDBTableViewRecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
        HeaderAlignmentVert = vaCenter
      end
      object GridEventDataDBTableViewID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Hidden = True
      end
      object GridEventDataDBTableViewNatIdNum: TcxGridDBColumn
        DataBinding.FieldName = 'NatIdNum'
        Visible = False
        HeaderAlignmentVert = vaCenter
      end
      object GridEventDataDBTableViewSortNatID: TcxGridDBColumn
        DataBinding.FieldName = 'SortNatID'
        OnGetDisplayText = GridEventDataDBTableViewSortNatIDGetDisplayText
        HeaderAlignmentVert = vaCenter
        SortIndex = 0
        SortOrder = soAscending
        Width = 117
      end
      object GridEventDataDBTableViewAnimalNo: TcxGridDBColumn
        DataBinding.FieldName = 'AnimalNo'
        Visible = False
        HeaderAlignmentVert = vaCenter
      end
      object GridEventDataDBTableViewSortAnimalNo: TcxGridDBColumn
        DataBinding.FieldName = 'SortAnimalNo'
        Visible = False
        HeaderAlignmentVert = vaCenter
      end
      object GridEventDataDBTableViewDateOfBirth: TcxGridDBColumn
        Caption = 'Date of Birth'
        DataBinding.FieldName = 'DateOfBirth'
        HeaderAlignmentVert = vaCenter
        Width = 79
      end
      object GridEventDataDBTableViewSex: TcxGridDBColumn
        DataBinding.FieldName = 'Sex'
        HeaderAlignmentVert = vaCenter
        Width = 27
      end
      object GridEventDataDBTableViewPrimaryBreed: TcxGridDBColumn
        DataBinding.FieldName = 'PrimaryBreed'
        HeaderAlignmentVert = vaCenter
        Width = 40
      end
      object GridEventDataDBTableViewCalfSurveyDate: TcxGridDBColumn
        Caption = 'Calf Survey Date'
        DataBinding.FieldName = 'CalfSurveyDate'
        HeaderAlignmentVert = vaCenter
        Width = 92
      end
      object GridEventDataDBTableViewCalfDocility: TcxGridDBColumn
        Caption = 'Calf Docility'
        DataBinding.FieldName = 'Docility'
        HeaderAlignmentVert = vaCenter
        Width = 90
      end
      object GridEventDataDBTableViewCalfQuality: TcxGridDBColumn
        Caption = 'Calf Quality'
        DataBinding.FieldName = 'Quality'
        HeaderAlignmentVert = vaCenter
        Width = 90
      end
      object GridEventDataDBTableViewCalfVitality: TcxGridDBColumn
        Caption = 'Calf Vitality'
        DataBinding.FieldName = 'CalfVitality'
        HeaderAlignmentVert = vaCenter
        Width = 90
      end
      object GridEventDataDBTableViewCalfSize: TcxGridDBColumn
        Caption = 'Calf Size'
        DataBinding.FieldName = 'CalfSize'
        HeaderAlignmentVert = vaCenter
        Width = 90
      end
      object GridEventDataDBTableViewCalfScour: TcxGridDBColumn
        Caption = 'Calf Scour'
        DataBinding.FieldName = 'CalfScour'
        HeaderAlignmentVert = vaCenter
        Width = 90
      end
      object GridEventDataDBTableViewCalfPneumonia: TcxGridDBColumn
        Caption = 'Pneumonia'
        DataBinding.FieldName = 'CalfPneumonia'
        HeaderAlignmentVert = vaCenter
        Width = 90
      end
      object GridEventDataDBTableViewDisbuddingDate: TcxGridDBColumn
        DataBinding.FieldName = 'DisbuddingDate'
        PropertiesClassName = 'TcxDateEditProperties'
        HeaderAlignmentVert = vaCenter
        Width = 90
      end
      object GridEventDataDBTableViewCastrationDate: TcxGridDBColumn
        DataBinding.FieldName = 'CastrationDate'
        PropertiesClassName = 'TcxDateEditProperties'
        HeaderAlignmentVert = vaCenter
        Width = 90
      end
      object GridEventDataDBTableViewMealFeedingDate: TcxGridDBColumn
        DataBinding.FieldName = 'MealFeedingDate'
        PropertiesClassName = 'TcxDateEditProperties'
        HeaderAlignmentVert = vaCenter
        Width = 90
      end
      object GridEventDataDBTableViewWeaningDate: TcxGridDBColumn
        DataBinding.FieldName = 'WeaningDate'
        PropertiesClassName = 'TcxDateEditProperties'
        HeaderAlignmentVert = vaCenter
        Width = 90
      end
    end
    object GridEventDataLevel: TcxGridLevel
      GridView = GridEventDataDBTableView
    end
  end
  object dsAWCalves: TDataSource
    DataSet = mdAWCalves
    Left = 549
    Top = 198
  end
  object mdAWCalves: TdxMemData
    Indexes = <
      item
        FieldName = 'ID'
        SortOptions = []
      end>
    SortOptions = []
    Left = 579
    Top = 198
    object mdAWCalvesID: TIntegerField
      FieldName = 'ID'
    end
    object mdAWCalvesNatIdNum: TStringField
      DisplayLabel = 'Nat. Id. No.'
      FieldName = 'NatIdNum'
      Visible = False
    end
    object mdAWCalvesSortNatID: TStringField
      DisplayLabel = 'Nat. Id. No.'
      FieldName = 'SortNatID'
    end
    object mdAWCalvesAnimalNo: TStringField
      FieldName = 'AnimalNo'
      Visible = False
      Size = 10
    end
    object mdAWCalvesSortAnimalNo: TStringField
      DisplayLabel = 'Animal No.'
      FieldName = 'SortAnimalNo'
      Size = 10
    end
    object mdAWCalvesPrimaryBreed: TIntegerField
      DisplayLabel = 'Breed'
      FieldName = 'PrimaryBreed'
    end
    object mdAWCalvesSex: TStringField
      FieldName = 'Sex'
      Size = 1
    end
    object mdAWCalvesDisbuddingDate: TDateTimeField
      DisplayLabel = 'Disbudding Date'
      FieldName = 'DisbuddingDate'
    end
    object mdAWCalvesCastrationDate: TDateTimeField
      DisplayLabel = 'Castration Date'
      FieldName = 'CastrationDate'
    end
    object mdAWCalvesMealFeedingDate: TDateTimeField
      DisplayLabel = 'Meal Feeding Date'
      FieldName = 'MealFeedingDate'
    end
    object mdAWCalvesWeaningDate: TDateTimeField
      DisplayLabel = 'Weaning Date'
      FieldName = 'WeaningDate'
    end
    object mdAWCalvesDateOfBirth: TDateField
      DisplayLabel = 'Date Of Birth'
      FieldName = 'DateOfBirth'
    end
    object mdAWCalvesCalfSurveyDate: TDateField
      FieldName = 'CalfSurveyDate'
    end
    object mdAWCalvesDocility: TStringField
      DisplayWidth = 20
      FieldName = 'Docility'
    end
    object mdAWCalvesQuality: TStringField
      DisplayWidth = 20
      FieldName = 'Quality'
    end
    object mdAWCalvesVitality: TStringField
      FieldName = 'CalfVitality'
    end
    object mdAWCalvesCalfSize: TStringField
      FieldName = 'CalfSize'
    end
    object mdAWCalvesCalfScour: TStringField
      FieldName = 'CalfScour'
    end
    object mdAWCalvesCalfPneumonia: TStringField
      FieldName = 'CalfPneumonia'
    end
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = cplGridEventData
    CustomizeDlgOptions = []
    PrintTitle = 'Kingswood Grid Print'
    Version = 0
    Left = 126
    Top = 128
    object cplGridEventData: TdxGridReportLink
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.CreationDate = 39944.6211371412
      ReportDocument.Creator = 'Kingswood Computing Ltd.'
      ReportDocument.IsCaptionAssigned = True
      OptionsCards.AutoWidth = True
      OptionsCards.KeepSameHeight = False
      OptionsCards.KeepSameWidth = False
      OptionsOnEveryPage.Footers = False
      OptionsOnEveryPage.FilterBar = False
      OptionsView.FilterBar = False
      BuiltInReportLink = True
    end
  end
end
