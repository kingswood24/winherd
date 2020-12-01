object fmCTSRegResults: TfmCTSRegResults
  Left = 432
  Top = 365
  BorderStyle = bsDialog
  Caption = 'CTS Registration Results'
  ClientHeight = 279
  ClientWidth = 506
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 17
  object cxButton1: TcxButton
    Left = 406
    Top = 236
    Width = 93
    Height = 32
    Caption = 'Close'
    Default = True
    ModalResult = 1
    TabOrder = 0
    LookAndFeel.NativeStyle = True
  end
  object RejectionGrid: TcxGrid
    Left = 8
    Top = 84
    Width = 489
    Height = 147
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    object RejectionGridTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DetailKeyFieldNames = 'AnimalID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnHiding = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.InvertSelect = False
      OptionsView.ShowEditButtons = gsebAlways
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object RejectionGridTableViewID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        Hidden = True
      end
      object RejectionGridTableViewAnimalID: TcxGridDBColumn
        Caption = 'Nat. Id. No.'
        DataBinding.FieldName = 'AnimalID'
        Visible = False
        Hidden = True
        Width = 84
      end
      object RejectionGridTableViewTxnId: TcxGridDBColumn
        DataBinding.FieldName = 'TxnId'
        Visible = False
      end
      object RejectionGridTableViewCode: TcxGridDBColumn
        Caption = 'Code'
        DataBinding.FieldName = 'RCode'
        Width = 78
      end
      object RejectionGridTableViewDesc: TcxGridDBColumn
        Caption = 'Description'
        DataBinding.FieldName = 'RDesc'
        PropertiesClassName = 'TcxMemoProperties'
        Width = 259
      end
      object RejectionGridTableViewSev: TcxGridDBColumn
        Caption = 'Severity'
        DataBinding.FieldName = 'RSev'
        OnGetDisplayText = RejectionGridTableViewSevGetDisplayText
        Width = 61
      end
      object RejectionGridTableViewField: TcxGridDBColumn
        Caption = 'Field'
        DataBinding.FieldName = 'RField'
        Width = 91
      end
    end
    object RejectionGridLevel: TcxGridLevel
      GridView = RejectionGridTableView
    end
  end
  object AnimalLabel: TcxLabel
    Left = 8
    Top = 1
    AutoSize = False
    Caption = 'WARNING: The %s record for animal %s has been rejected.'
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.WordWrap = True
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.TextColor = clRed
    Style.IsFontAssigned = True
    Height = 40
    Width = 491
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 42
    AutoSize = False
    Caption = 
      'Please review the list below which contains the reasons why this' +
      ' record has been rejected.'
    ParentFont = False
    Properties.WordWrap = True
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Height = 41
    Width = 491
  end
end
