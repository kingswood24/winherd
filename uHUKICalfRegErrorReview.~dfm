object fmHUKICalfRegErrorReview: TfmHUKICalfRegErrorReview
  Left = 261
  Top = 221
  BorderStyle = bsDialog
  Caption = 'Calf Registration - Review'
  ClientHeight = 291
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lAnimalNo: TLabel
    Left = 438
    Top = 18
    Width = 83
    Height = 23
    Caption = 'lAnimalNo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lTagNo: TLabel
    Left = 98
    Top = 18
    Width = 59
    Height = 23
    Caption = 'lTagNo'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 20
    Top = 18
    Width = 76
    Height = 23
    Caption = 'Calf Tag:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 324
    Top = 18
    Width = 112
    Height = 23
    Caption = 'Calf Number:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object cxButton1: TcxButton
    Left = 478
    Top = 254
    Width = 75
    Height = 25
    Caption = 'Close'
    Default = True
    ModalResult = 1
    TabOrder = 0
    LookAndFeel.Kind = lfStandard
  end
  object ListBox1: TListBox
    Left = 170
    Top = 82
    Width = 121
    Height = 97
    Columns = 3
    ItemHeight = 13
    Items.Strings = (
      '1'
      '2'
      '3')
    TabOrder = 1
  end
  object cxGrid1: TcxGrid
    Left = 16
    Top = 48
    Width = 541
    Height = 189
    TabOrder = 2
    LookAndFeel.Kind = lfFlat
    object cxGrid1DBTableView1: TcxGridDBTableView
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
      DataController.DataSource = dsmdHUKIErrors
      DataController.KeyFieldNames = 'RecId'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Filtering.MRUItemsList = False
      Filtering.ColumnMRUItemsList = False
      OptionsCustomize.ColumnFiltering = False
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
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      Preview.Visible = True
      object cxGrid1DBTableView1RecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
      end
      object cxGrid1DBTableView1ErrorCode: TcxGridDBColumn
        DataBinding.FieldName = 'ErrorCode'
      end
      object cxGrid1DBTableView1ErrorMessage: TcxGridDBColumn
        DataBinding.FieldName = 'ErrorMessage'
        Width = 452
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object Button1: TButton
    Left = 18
    Top = 254
    Width = 97
    Height = 25
    Caption = 'View Sire Listing'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 122
    Top = 254
    Width = 97
    Height = 25
    Caption = 'View Dam Listing'
    TabOrder = 4
    OnClick = Button2Click
  end
  object mdHUKIErrors: TdxMemData
    Indexes = <>
    SortOptions = []
    SortedField = 'ErrorCode'
    Left = 214
    Top = 138
    object mdHUKIErrorsErrorCode: TIntegerField
      DisplayLabel = 'Error Code'
      FieldName = 'ErrorCode'
    end
    object mdHUKIErrorsErrorMessage: TStringField
      DisplayLabel = 'Error Message'
      FieldName = 'ErrorMessage'
      Size = 100
    end
  end
  object dsmdHUKIErrors: TDataSource
    DataSet = mdHUKIErrors
    Left = 244
    Top = 138
  end
end
