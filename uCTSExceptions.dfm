object fmCTSExceptions: TfmCTSExceptions
  Left = 287
  Top = 266
  BorderStyle = bsDialog
  Caption = 'CTS Webservice Exceptions'
  ClientHeight = 359
  ClientWidth = 552
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 300
    Width = 535
    Height = 11
    Shape = bsBottomLine
  end
  object ExceptionsGrid: TcxGrid
    Left = 8
    Top = 8
    Width = 535
    Height = 175
    TabOrder = 0
    LookAndFeel.NativeStyle = True
    object ExceptionsGridTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      FilterBox.CustomizeDialog = False
      DataController.DataSource = dsExceptionsQuery
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.ShowEditButtons = gsebAlways
      OptionsView.DataRowHeight = 28
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 28
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      object ExceptionsGridTableViewTxnId: TcxGridDBColumn
        DataBinding.FieldName = 'TxnId'
        Visible = False
      end
      object ExceptionsGridTableViewXMLType: TcxGridDBColumn
        Caption = 'Type'
        DataBinding.FieldName = 'XMLType'
        HeaderAlignmentVert = vaCenter
        Options.ShowEditButtons = isebNever
        Width = 74
      end
      object ExceptionsGridTableViewExNum: TcxGridDBColumn
        Caption = 'Exception Code'
        DataBinding.FieldName = 'ExNum'
        HeaderAlignmentVert = vaCenter
        Options.ShowEditButtons = isebNever
        Width = 86
      end
      object ExceptionsGridTableViewExDate: TcxGridDBColumn
        Caption = 'Exception Date'
        DataBinding.FieldName = 'ExDate'
        HeaderAlignmentVert = vaCenter
        Options.ShowEditButtons = isebNever
        Width = 82
      end
      object ExceptionsGridTableViewExMsg: TcxGridDBColumn
        Caption = 'Exception Message'
        DataBinding.FieldName = 'ExMsg'
        PropertiesClassName = 'TcxMemoProperties'
        HeaderAlignmentVert = vaCenter
        Options.ShowEditButtons = isebAlways
        Options.Sorting = False
        Width = 272
      end
    end
    object ExceptionsGridLevel: TcxGridLevel
      GridView = ExceptionsGridTableView
    end
  end
  object cxButton1: TcxButton
    Left = 466
    Top = 324
    Width = 75
    Height = 25
    Caption = 'Close'
    Default = True
    ModalResult = 1
    TabOrder = 1
    LookAndFeel.NativeStyle = True
  end
  object cxDBTextEdit1: TcxDBTextEdit
    Left = 8
    Top = 204
    DataBinding.DataField = 'XMLType'
    DataBinding.DataSource = dsExceptionsQuery
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 2
    Width = 139
  end
  object cxDBTextEdit2: TcxDBTextEdit
    Left = 164
    Top = 204
    DataBinding.DataField = 'ExNum'
    DataBinding.DataSource = dsExceptionsQuery
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 3
    Width = 121
  end
  object cxDBTextEdit3: TcxDBTextEdit
    Left = 304
    Top = 204
    DataBinding.DataField = 'ExDate'
    DataBinding.DataSource = dsExceptionsQuery
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 4
    Width = 121
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 187
    Caption = 'Type'
  end
  object cxLabel2: TcxLabel
    Left = 164
    Top = 187
    Caption = 'Number '
  end
  object cxLabel3: TcxLabel
    Left = 304
    Top = 187
    Caption = 'Date'
  end
  object cxDBMemo1: TcxDBMemo
    Left = 8
    Top = 243
    DataBinding.DataField = 'ExMsg'
    DataBinding.DataSource = dsExceptionsQuery
    Properties.ScrollBars = ssBoth
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 8
    Height = 58
    Width = 535
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 227
    Caption = 'Message '
  end
  object ExceptionsQuery: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * From CTSExceptions Order By ExDate DESC')
    Left = 10
    Top = 22
  end
  object dsExceptionsQuery: TDataSource
    DataSet = ExceptionsQuery
    Left = 6
    Top = 60
  end
end
