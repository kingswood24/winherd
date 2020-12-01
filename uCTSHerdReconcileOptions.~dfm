object fmCTSHerdReconcileOptions: TfmCTSHerdReconcileOptions
  Left = 376
  Top = 222
  Width = 436
  Height = 318
  Caption = 'CTS Herd Reconciliation Options'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 29
    Top = 221
    Width = 360
    Height = 5
    Shape = bsBottomLine
  end
  object HerdDatabaseGrid: TcxGrid
    Left = 28
    Top = 32
    Width = 360
    Height = 175
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    object HerdDatabaseGridDBTableView: TcxGridDBTableView
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
      DataController.DataSource = DataSource1
      DataController.KeyFieldNames = 'RecId'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsView.DataRowHeight = 21
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 26
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      object HerdDatabaseGridDBTableViewSelected: TcxGridDBColumn
        DataBinding.FieldName = 'Selected'
        HeaderAlignmentVert = vaCenter
        Width = 57
      end
      object HerdDatabaseGridDBTableViewHerdId: TcxGridDBColumn
        DataBinding.FieldName = 'HerdId'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Hidden = True
        Options.Editing = False
      end
      object HerdDatabaseGridDBTableViewHerdNo: TcxGridDBColumn
        Caption = 'Herd No.'
        DataBinding.FieldName = 'HerdNo'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 120
      end
      object HerdDatabaseGridDBTableViewDatabasePath: TcxGridDBColumn
        Caption = 'Database Path'
        DataBinding.FieldName = 'DatabasePath'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Hidden = True
        Options.Editing = False
      end
      object HerdDatabaseGridDBTableViewDatabaseName: TcxGridDBColumn
        Caption = 'Database Name'
        DataBinding.FieldName = 'DatabaseName'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 157
      end
    end
    object HerdDatabaseGridLevel: TcxGridLevel
      GridView = HerdDatabaseGridDBTableView
    end
  end
  object cxLabel1: TcxLabel
    Left = 28
    Top = 12
    Caption = 'Tick each herd that you want to reconcile '
  end
  object btnOK: TcxButton
    Left = 230
    Top = 238
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    LookAndFeel.NativeStyle = True
  end
  object btnCancel: TcxButton
    Left = 314
    Top = 238
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
    LookAndFeel.NativeStyle = True
  end
  object mdReconcileHerdOptions: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 364
    Top = 12
    object mdReconcileHerdOptionsSelected: TBooleanField
      FieldName = 'Selected'
    end
    object mdReconcileHerdOptionsHerdId: TIntegerField
      FieldName = 'HerdId'
    end
    object mdReconcileHerdOptionsHerdNo: TStringField
      FieldName = 'HerdNo'
    end
    object mdReconcileHerdOptionsDatabaseName: TStringField
      FieldName = 'DatabaseName'
      Size = 30
    end
    object mdReconcileHerdOptionsDatabasePath: TStringField
      FieldName = 'DatabasePath'
      Size = 255
    end
  end
  object DataSource1: TDataSource
    DataSet = mdReconcileHerdOptions
    Left = 386
    Top = 66
  end
end
