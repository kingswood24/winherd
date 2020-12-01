object fmLookupDrugBatchNo: TfmLookupDrugBatchNo
  Left = 627
  Top = 301
  BorderStyle = bsDialog
  Caption = 'Lookup Batch No.'
  ClientHeight = 278
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 17
  object lMedicineName: TcxLabel
    Left = 24
    Top = 20
    AutoSize = False
    Caption = 'lMedicineName'
    ParentColor = False
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Style.Color = clInfoBk
    Style.TextColor = clNavy
    Style.TextStyle = [fsBold]
    Height = 33
    Width = 409
  end
  object pBatchNos: TPanel
    Left = 26
    Top = 74
    Width = 403
    Height = 142
    Anchors = [akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 1
    object DrugBatchNoGrid: TcxGrid
      Left = 0
      Top = 0
      Width = 403
      Height = 142
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfFlat
      object DrugBatchNoGridDBTableView: TcxGridDBTableView
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = HerdLookup.dsBatchNoByPurchData
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        object DrugBatchNoGridDBTableViewBatchNo: TcxGridDBColumn
          Caption = 'Batch No.'
          DataBinding.FieldName = 'BatchNo'
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringMRUItemsList = False
          Options.Focusing = False
          Options.Grouping = False
          Options.Moving = False
          Width = 140
        end
        object DrugBatchNoGridDBTableViewPurchDate: TcxGridDBColumn
          Caption = 'Purch Date'
          DataBinding.FieldName = 'PurchDate'
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringMRUItemsList = False
          Options.Focusing = False
          Options.Grouping = False
          Options.Moving = False
          SortIndex = 0
          SortOrder = soAscending
          Width = 100
        end
        object DrugBatchNoGridDBTableViewQtyRem: TcxGridDBColumn
          Caption = 'Qty. Remaining'
          DataBinding.FieldName = 'QtyRemaining'
          PropertiesClassName = 'TcxCurrencyEditProperties'
          Properties.DisplayFormat = '0.##'
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringMRUItemsList = False
          Options.Focusing = False
          Options.Grouping = False
          Options.Moving = False
          Width = 100
        end
      end
      object DrugBatchNoGridLevel: TcxGridLevel
        GridView = DrugBatchNoGridDBTableView
      end
    end
  end
  object btnOK: TcxButton
    Left = 220
    Top = 230
    Width = 100
    Height = 34
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 2
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2B9348FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF2B934831A6482B9348FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF399B6131A64831A64831A6482B9348FF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      2B934831A64837B75533A15831A6482B9348FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF3F946631A64837B7552F8D582F8D5837B75543
      A14637B755FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2B9348
      37B7552F8D58FF00FFFF00FF2F8D5837B7552B9348FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF2F8D58FF00FFFF00FFFF00FFFF00FF2F
      8D5837B7552B9348FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2F8D5837B75537B755FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FF2F8D5831A648FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2F8D5831A648FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF2F8D5831A648FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2F8D
      5831A648FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FF2F8D5831A648FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FF2F8D58FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    LookAndFeel.Kind = lfOffice11
  end
  object btnCancel: TcxButton
    Left = 333
    Top = 230
    Width = 100
    Height = 34
    Anchors = [akRight, akBottom]
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000320B0000320B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FF002EE41B48FBFF00FF1B48FB002EE4FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FF002EE41B48FBFF00FFFF00FF1B48FB
      3E5EFF002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF002E
      E41B48FBFF00FFFF00FFFF00FF1B48FB1B48FB3E5EFF002EE4FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF002EE41B48FBFF00FFFF00FFFF00FFFF00FFFF00FF
      3E5EFF1B48FB3E5EFF002EE4FF00FFFF00FFFF00FFFF00FF002EE41B48FBFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB3E5EFF002EE4FF
      00FFFF00FF002EE4002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF1B48FB3E5EFF002EE4002EE4002EE4FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB1B
      48FB1B48FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF1B48FB3E5EFF1B48FB3E5EFF002EE4FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB3E5EFF002EE4FF
      00FFFF00FF1B48FB002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF1B48FB3E5EFF002EE4FF00FFFF00FFFF00FFFF00FF1B48FB002EE4FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB3E5EFF002EE4FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF1B48FB002EE4FF00FFFF00FFFF00FFFF00FF1B48FB
      6482FF002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FF002EE4FF00FFFF00FF1B48FB6482FF002EE4FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB1B48FB
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    LookAndFeel.Kind = lfOffice11
  end
end