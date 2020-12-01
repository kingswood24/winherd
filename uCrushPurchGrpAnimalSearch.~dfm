object fmCrushGrpPurchAnimalSearch: TfmCrushGrpPurchAnimalSearch
  Left = 479
  Top = 199
  BorderStyle = bsDialog
  Caption = 'Purchase Group Animal Search'
  ClientHeight = 316
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pCrushPurchGrpAnimalSearch: TPanel
    Left = 0
    Top = 0
    Width = 491
    Height = 316
    Align = alClient
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object AnimalGrid: TcxGrid
      Left = 12
      Top = 56
      Width = 467
      Height = 206
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
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
        DataController.Summary.FooterSummaryItems = <>
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
        OptionsView.HeaderHeight = 32
        OptionsView.IndicatorWidth = 22
        object AnimalTableViewID: TcxGridDBColumn
          DataBinding.FieldName = 'ID'
          Visible = False
          HeaderAlignmentVert = vaCenter
          Hidden = True
        end
        object AnimalTableViewNatIdNum: TcxGridDBColumn
          Caption = 'Nat. Id. No.'
          DataBinding.FieldName = 'NatIdNum'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentVert = vaCenter
          Width = 154
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
          Width = 62
        end
        object AnimalTableViewCode: TcxGridDBColumn
          Caption = 'Breed'
          DataBinding.FieldName = 'Code'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentVert = vaCenter
          Width = 62
        end
        object AnimalTableViewAnimalNo: TcxGridDBColumn
          Caption = 'Animal No.'
          DataBinding.FieldName = 'AnimalNo'
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
    object cxLabel10: TcxLabel
      Left = 17
      Top = 19
      Caption = 'Enter Part Nat. Id. No.:'
      Style.TextColor = clWindowText
      Transparent = True
    end
    object btnFind: TcxButton
      Left = 326
      Top = 12
      Width = 70
      Height = 32
      Cursor = crHandPoint
      Caption = 'Find'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnFindClick
      OnKeyDown = btnFindKeyDown
      Colors.Normal = 16629124
      LookAndFeel.Kind = lfOffice11
    end
    object btnClear: TcxButton
      Left = 405
      Top = 12
      Width = 70
      Height = 32
      Cursor = crHandPoint
      Caption = 'Clear'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnClearClick
      Colors.Normal = 16629124
      LookAndFeel.Kind = lfOffice11
    end
    object btnSelect: TcxButton
      Left = 290
      Top = 272
      Width = 89
      Height = 29
      Cursor = crHandPoint
      Caption = 'Select'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 4
      OnClick = btnSelectClick
      Colors.Normal = 6409593
      LookAndFeel.Kind = lfOffice11
    end
    object cxButton1: TcxButton
      Left = 388
      Top = 272
      Width = 89
      Height = 29
      Cursor = crHandPoint
      Caption = 'Cancel'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 5
      OnClick = cxButton1Click
      Colors.Normal = 6409593
      LookAndFeel.Kind = lfOffice11
    end
    object teSearchAnimalTag: TcxTextEdit
      Left = 162
      Top = 19
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 6
      OnKeyDown = teSearchAnimalTagKeyDown
      Width = 121
    end
  end
  object QueryAnimals: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select A.ID, A.NatIdNum, A.SearchNatId, A.AnimalNo,'
      '       A.DateOfBirth, A.Sex, B.Code'
      'From Animals A'
      'Left Join Breeds B ON (A.PrimaryBreed=B.Id)'
      'Where SUBSTRING(A.SearchNatId FROM 8) Like :SearchNo'
      'And (A.InHerd=True)'
      'And (A.AnimalDeleted=False)'
      ' ')
    Left = 44
    Top = 272
    ParamData = <
      item
        DataType = ftString
        Name = 'SearchNo'
        ParamType = ptInput
        Value = '"%20%"'
      end>
  end
  object dsQueryAnimals: TDataSource
    DataSet = QueryAnimals
    Left = 12
    Top = 272
  end
end
