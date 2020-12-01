object fmLactationConsistencyChecker: TfmLactationConsistencyChecker
  Left = 482
  Top = 276
  BorderStyle = bsDialog
  Caption = 'Lactation Consistency Checker'
  ClientHeight = 287
  ClientWidth = 570
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 17
  object lAnimalCount: TLabel
    Left = 21
    Top = 237
    Width = 76
    Height = 17
    Caption = 'lAnimalCount'
  end
  object AnimalGrid: TcxGrid
    Left = 21
    Top = 16
    Width = 530
    Height = 209
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object AnimalGridDBTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource1
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnHorzSizing = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.DataRowHeight = 26
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 26
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      object AnimalGridDBTableViewAnimalNo: TcxGridDBColumn
        DataBinding.FieldName = 'AnimalNo'
        HeaderAlignmentVert = vaCenter
      end
      object AnimalGridDBTableViewNatIDNum: TcxGridDBColumn
        Caption = 'Nat. Id. No.'
        DataBinding.FieldName = 'NatIDNum'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentVert = vaCenter
        Width = 125
      end
      object AnimalGridDBTableViewDateOfBirth: TcxGridDBColumn
        Caption = 'Date Of Birth'
        DataBinding.FieldName = 'DateOfBirth'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentVert = vaCenter
        Width = 85
      end
      object AnimalGridDBTableViewSex: TcxGridDBColumn
        DataBinding.FieldName = 'Sex'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentVert = vaCenter
      end
      object AnimalGridDBTableViewLactNo: TcxGridDBColumn
        Caption = 'Lact No.'
        DataBinding.FieldName = 'LactNo'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentVert = vaCenter
        Width = 55
      end
      object AnimalGridDBTableViewNoOfCalvings: TcxGridDBColumn
        Caption = 'No Of Calvings'
        DataBinding.FieldName = 'NoOfCalvings'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentVert = vaCenter
        Width = 95
      end
      object AnimalGridDBTableViewAnimalID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
    end
    object AnimalGridLevel: TcxGridLevel
      GridView = AnimalGridDBTableView
    end
  end
  object btnCreateCalving: TcxButton
    Left = 344
    Top = 234
    Width = 109
    Height = 30
    Action = actCreateCalving
    Default = True
    TabOrder = 1
    LookAndFeel.NativeStyle = True
  end
  object btnCancel: TcxButton
    Left = 458
    Top = 234
    Width = 75
    Height = 30
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    LookAndFeel.NativeStyle = True
  end
  object DataSource1: TDataSource
    DataSet = QueryCowsIncompLacts
    Left = 282
    Top = 234
  end
  object QueryCowsIncompLacts: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * from CowsIncompLacts'
      'Order by SortAnimalNo')
    Left = 314
    Top = 234
  end
  object ActionList1: TActionList
    Left = 249
    Top = 233
    object actCreateCalving: TAction
      Caption = 'Create Calving'
      OnExecute = actCreateCalvingExecute
      OnUpdate = actCreateCalvingUpdate
    end
  end
end
