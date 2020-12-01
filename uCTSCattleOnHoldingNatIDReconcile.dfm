object fmCTSCattleOnHoldingNatIDReconcile: TfmCTSCattleOnHoldingNatIDReconcile
  Left = 519
  Top = 363
  Width = 533
  Height = 331
  Caption = 'CTS Herd Reconcile - Select Nat. Id. No.'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object NatIdGrid: TcxGrid
    Left = 20
    Top = 94
    Width = 470
    Height = 147
    TabOrder = 0
    LookAndFeel.NativeStyle = True
    object NatIdGridDBTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsmdNatIdInfo
      DataController.KeyFieldNames = 'RecId'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsSelection.CellSelect = False
      OptionsView.DataRowHeight = 21
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 21
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      object NatIdGridDBTableViewRecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
        HeaderAlignmentVert = vaCenter
      end
      object NatIdGridDBTableViewID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
        HeaderAlignmentVert = vaCenter
      end
      object NatIdGridDBTableViewNatIDNum: TcxGridDBColumn
        DataBinding.FieldName = 'NatIDNum'
        HeaderAlignmentVert = vaCenter
        Width = 173
      end
      object NatIdGridDBTableViewMatchNatIDNum: TcxGridDBColumn
        DataBinding.FieldName = 'MatchNatIDNum'
        Visible = False
        HeaderAlignmentVert = vaCenter
      end
      object NatIdGridDBTableViewSex: TcxGridDBColumn
        DataBinding.FieldName = 'Sex'
        HeaderAlignmentVert = vaCenter
        Width = 104
      end
      object NatIdGridDBTableViewDateOfBirth: TcxGridDBColumn
        DataBinding.FieldName = 'DateOfBirth'
        HeaderAlignmentVert = vaCenter
        Width = 143
      end
    end
    object NatIdGridLevel: TcxGridLevel
      GridView = NatIdGridDBTableView
    end
  end
  object rgDisplayMode: TcxRadioGroup
    Left = 20
    Top = 12
    Caption = 'Nat. Id. No. Display Mode'
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = 'Closest Nat. Id. No. Match'
      end
      item
        Caption = 'All Nat. Id. No.'#39's in Herd'
      end>
    ItemIndex = 0
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 1
    OnClick = rgDisplayModeClick
    Height = 51
    Width = 470
  end
  object btnSelect: TcxButton
    Left = 317
    Top = 253
    Width = 81
    Height = 29
    Action = actSelect
    TabOrder = 2
    LookAndFeel.NativeStyle = True
  end
  object btnCancel: TcxButton
    Left = 410
    Top = 253
    Width = 81
    Height = 29
    Caption = 'Cancel'
    Default = True
    ModalResult = 2
    TabOrder = 3
    LookAndFeel.NativeStyle = True
  end
  object cxLabel1: TcxLabel
    Left = 20
    Top = 76
    Caption = 'Select the Nat. Id. No. that is a match with the CTS Tag No. '
  end
  object mdNatIdInfo: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 36
    Top = 146
    object mdNatIdInfoID: TIntegerField
      FieldName = 'ID'
      Visible = False
    end
    object mdNatIdInfoNatIDNum: TStringField
      DisplayLabel = 'Nat. Id. No'
      FieldName = 'NatIDNum'
    end
    object mdNatIdInfoMatchNatIDNum: TStringField
      FieldName = 'MatchNatIDNum'
      Visible = False
    end
    object mdNatIdInfoSex: TStringField
      FieldName = 'Sex'
      Size = 6
    end
    object mdNatIdInfoDateOfBirth: TDateTimeField
      DisplayLabel = 'Date Of Birth'
      FieldName = 'DateOfBirth'
    end
  end
  object dsmdNatIdInfo: TDataSource
    DataSet = mdNatIdInfo
    Left = 38
    Top = 180
  end
  object ActionList1: TActionList
    Left = 334
    Top = 72
    object actSelect: TAction
      Caption = 'Select'
      OnExecute = actSelectExecute
      OnUpdate = actSelectUpdate
    end
  end
end
