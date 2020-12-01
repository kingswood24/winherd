object fmCrushAnimalFilter: TfmCrushAnimalFilter
  Left = 381
  Top = 181
  BorderStyle = bsSingle
  Caption = 'Crush Cattle Select'
  ClientHeight = 501
  ClientWidth = 723
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pcCrushFilterAnimals: TcxPageControl
    Left = 0
    Top = 0
    Width = 723
    Height = 501
    ActivePage = tsFilterAnimals
    Align = alClient
    Color = 15987699
    Font.Charset = ANSI_CHARSET
    Font.Color = clGrayText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = True
    ParentColor = False
    ParentFont = False
    Style = 9
    TabHeight = 45
    TabOrder = 0
    TabWidth = 345
    ClientRectBottom = 501
    ClientRectRight = 723
    ClientRectTop = 46
    object tsFilterAnimals: TcxTabSheet
      Caption = 'Cattle Select'
      Color = 15987699
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ImageIndex = 0
      ParentColor = False
      ParentFont = False
      object btnClose: TcxButton
        Left = 588
        Top = 374
        Width = 118
        Height = 58
        Action = actClose
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Colors.Normal = 16629124
        LookAndFeel.Kind = lfFlat
      end
      object lJumboFrom: TcxLabel
        Left = 19
        Top = 26
        Caption = 'Jumbo From:'
        ParentFont = False
        Style.StyleController = WinData.TouchScreenLabelStyleController
        Style.TextColor = 6316128
        Transparent = True
      end
      object lJumboTo: TcxLabel
        Left = 231
        Top = 26
        Caption = 'Jumbo To:'
        ParentFont = False
        Style.StyleController = WinData.TouchScreenLabelStyleController
        Style.TextColor = 6316128
        Transparent = True
      end
      object lBreed: TcxLabel
        Left = 417
        Top = 26
        Caption = 'Breed:'
        ParentFont = False
        Style.StyleController = WinData.TouchScreenLabelStyleController
        Style.TextColor = 6316128
        Transparent = True
      end
      object ceJumboFrom: TcxCurrencyEdit
        Left = 142
        Top = 26
        Properties.AssignedValues.DisplayFormat = True
        Properties.DecimalPlaces = 0
        TabOrder = 4
        Width = 84
      end
      object ceJumboTo: TcxCurrencyEdit
        Left = 329
        Top = 24
        Properties.AssignedValues.DisplayFormat = True
        Properties.DecimalPlaces = 0
        TabOrder = 5
        Width = 84
      end
      object cmboBreed: TcxLookupComboBox
        Left = 478
        Top = 24
        Properties.ListColumns = <>
        TabOrder = 6
        Width = 98
      end
      object AnimalGrid: TcxGrid
        Left = 19
        Top = 67
        Width = 556
        Height = 370
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        LookAndFeel.Kind = lfUltraFlat
        object AnimalTableView: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          NavigatorButtons.First.Visible = True
          NavigatorButtons.PriorPage.Visible = True
          NavigatorButtons.Prior.Visible = True
          NavigatorButtons.Next.Visible = True
          NavigatorButtons.NextPage.Visible = True
          NavigatorButtons.Last.Visible = True
          NavigatorButtons.Insert.Visible = True
          NavigatorButtons.Delete.Visible = True
          NavigatorButtons.Edit.Visible = True
          NavigatorButtons.Post.Visible = True
          NavigatorButtons.Cancel.Visible = True
          NavigatorButtons.Refresh.Visible = True
          NavigatorButtons.SaveBookmark.Visible = True
          NavigatorButtons.GotoBookmark.Visible = True
          NavigatorButtons.Filter.Visible = True
          DataController.DataSource = dsQueryAnimals
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '0'
              Kind = skCount
              FieldName = 'AnimalNo'
              Column = AnimalTableViewAnimalNo
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnHidingOnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.HideFocusRectOnExit = False
          OptionsSelection.InvertSelect = False
          OptionsSelection.UnselectFocusedRecordOnExit = False
          OptionsView.DataRowHeight = 54
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 38
          OptionsView.IndicatorWidth = 22
          Styles.Content = cxStyle2
          Styles.Inactive = SelectedRecord
          Styles.Selection = SelectedRecord
          Styles.Header = cxStyle1
          object AnimalTableViewID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            HeaderAlignmentVert = vaCenter
            Hidden = True
          end
          object AnimalTableViewAnimalNo: TcxGridDBColumn
            Caption = 'Animal No.'
            DataBinding.FieldName = 'AnimalNo'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentVert = vaCenter
            Width = 97
          end
          object AnimalTableViewNatIdNum: TcxGridDBColumn
            Caption = 'Nat. Id. No.'
            DataBinding.FieldName = 'NatIdNum'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentVert = vaCenter
            Width = 174
          end
          object AnimalTableViewDateOfBirth: TcxGridDBColumn
            Caption = 'DOB'
            DataBinding.FieldName = 'DateOfBirth'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentVert = vaCenter
            Width = 90
          end
          object AnimalTableViewSex: TcxGridDBColumn
            DataBinding.FieldName = 'Sex'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentVert = vaCenter
            Width = 90
          end
          object AnimalTableViewCode: TcxGridDBColumn
            Caption = 'Breed'
            DataBinding.FieldName = 'BreedCode'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            HeaderAlignmentVert = vaCenter
            Width = 70
          end
        end
        object AnimalGridLevel: TcxGridLevel
          GridView = AnimalTableView
        end
      end
      object btnFind: TcxButton
        Left = 588
        Top = 12
        Width = 118
        Height = 58
        Cursor = crHandPoint
        Caption = 'Find'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        OnClick = btnFindClick
        Colors.Normal = 16629124
        LookAndFeel.Kind = lfFlat
      end
      object btnPrint: TcxButton
        Left = 588
        Top = 77
        Width = 118
        Height = 58
        Cursor = crHandPoint
        Caption = 'Print'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindow
        Font.Height = -24
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        OnClick = btnPrintClick
        Colors.Normal = 6409593
        LookAndFeel.Kind = lfFlat
      end
    end
  end
  object QueryAnimals: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT A.ID, A.NatIdNum, A.AnimalNo, A.SortAnimalNo,'
      '       A.DateOfBirth, A.Sex, B.Code BreedCode'
      'FROM Animals A'
      'LEFT JOIN Breeds B ON (A.PrimaryBreed=B.Id)'
      'WHERE (A.InHerd = True)'
      'AND   (A.AnimalDeleted = False)'
      'AND   (A.HerdID In (SELECT DefaultHerdID FROM Defaults))'
      'ORDER BY SortAnimalNo Asc')
    Left = 619
    Top = 8
  end
  object dsQueryAnimals: TDataSource
    DataSet = QueryAnimals
    Left = 589
    Top = 8
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 649
    Top = 8
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6316128
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TextColor = clHighlightText
    end
    object SelectedRecord: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16629124
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      TextColor = clWindow
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
    end
  end
  object ActionList: TActionList
    Left = 559
    Top = 8
    object actSaveAnimal: TAction
      Caption = 'Save'
    end
    object actCancelAnimal: TAction
      Caption = 'Cancel'
    end
    object actClose: TAction
      Caption = 'Close'
      OnExecute = actCloseExecute
    end
  end
  object dxComponentPrinter: TdxComponentPrinter
    CurrentLink = dxComponentPrinterLink
    PrintTitle = 'Kingswood Grid Print'
    Version = 0
    Left = 530
    Top = 8
    object dxComponentPrinterLink: TdxGridReportLink
      Active = True
      Component = AnimalGrid
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.CreationDate = 42277.6583854861
      OptionsOnEveryPage.Caption = False
      OptionsOnEveryPage.FilterBar = False
      OptionsView.Caption = False
      OptionsView.ExpandButtons = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      BuiltInReportLink = True
    end
  end
end
