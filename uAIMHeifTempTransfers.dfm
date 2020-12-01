object fmAIMHeifTempTransfers: TfmAIMHeifTempTransfers
  Left = 570
  Top = 268
  BorderStyle = bsDialog
  Caption = 'Heifer Movements'
  ClientHeight = 487
  ClientWidth = 679
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 17
  object AIMContractHerdsGrid: TcxGrid
    Left = 27
    Top = 35
    Width = 620
    Height = 274
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object AIMContractHerdsGridDBTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      OptionsView.Indicator = True
      object AIMContractHerdsGridDBTableViewSelected: TcxGridDBColumn
        DataBinding.FieldName = 'Selected'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 30
        IsCaptionAssigned = True
      end
      object AIMContractHerdsGridDBTableViewNatIDNo: TcxGridDBColumn
        Caption = 'National ID No.'
        DataBinding.FieldName = 'NatIDNo'
        Visible = False
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 160
      end
      object AIMContractHerdsGridDBTableViewSortNatID: TcxGridDBColumn
        Caption = 'National ID No.'
        DataBinding.FieldName = 'SortNatID'
        OnGetDisplayText = AIMContractHerdsGridDBTableViewSortNatIDGetDisplayText
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 160
      end
      object AIMContractHerdsGridDBTableViewDateOfBirth: TcxGridDBColumn
        Caption = 'Date Of Birth'
        DataBinding.FieldName = 'DateOfBirth'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Width = 100
      end
      object AIMContractHerdsGridDBTableViewNewHerdID: TcxGridDBColumn
        Caption = 'New Herd ID'
        DataBinding.FieldName = 'NewHerdID'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 100
      end
      object AIMContractHerdsGridDBTableViewMoveDate: TcxGridDBColumn
        Caption = 'Movement Date'
        DataBinding.FieldName = 'MoveDate'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 100
      end
    end
    object AIMContractHerdsGridView: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.DataRowHeight = 30
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 40
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      Styles.Header = cxStyle1
      object AIMContractHerdsGridViewHerdNumber: TcxGridColumn
        Caption = 'Moved To'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 110
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 110
      end
      object AIMContractHerdsGridViewHeiferCount: TcxGridColumn
        Caption = 'No. Heifers Moved'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 100
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 100
      end
      object AIMContractHerdsGridViewMovementType: TcxGridColumn
        Caption = 'Movement Type'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DropDownListStyle = lsFixedList
        Properties.Items.Strings = (
          'Contract Rearing (Retain On Kingswood Profile)'
          'Contract Rearing (Move off Kingswood Profile)'
          'Normal Farm to Farm Movement (Create Sale Record)')
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 350
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.HorzSizing = False
        Options.Moving = False
        Width = 350
      end
    end
    object AIMContractHerdsGridLevel: TcxGridLevel
      GridView = AIMContractHerdsGridView
    end
  end
  object btnSaveMovements: TcxButton
    Left = 494
    Top = 322
    Width = 156
    Height = 40
    Action = actSave
    TabOrder = 1
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
  object lHeader: TcxLabel
    Left = 26
    Top = 6
    AutoSize = False
    Caption = 
      'We have detected the following %s have moved to the following he' +
      'rd(s).'
    Style.TextStyle = [fsBold]
    Height = 21
    Width = 623
  end
  object imgInfo: TcxImage
    Left = 27
    Top = 320
    Picture.Data = {
      07544269746D617066090000424D660900000000000036000000280000001C00
      00001C000000010018000000000030090000D30E0000D30E0000000000000000
      0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB39172B39172FF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFBD9C7BE0C0A195745FFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD9C7BE2C3A5E2
      C3A495745FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFBD9C7BE3C6A9E3C5A8E3C5A795745FFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3BDA3BD9C7BE5C9
      AEE4C8ADE4C8ACE3C6A9A68772B39172FF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFD3BDA3BD9C7BE6CCB2E6CBB1E6CBB1E5CAAFE5C9AEE4C8ADE4C7
      AAE3C5A8A68772BD9C7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3BDA3BD9C7BE7CEB5E7CEB5
      E7CEB5E7CDB4E6CCB3E6CCB2E6CBB1E5CAAFE5C9AEE4C8ACE3C6A9E3C5A7A687
      72FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFBD9C7BE8D0B8E8D0B8E8D0B8E8D0B8E8D0B8AD735D9A2700CC5E29
      CC5E299A2700C4865EE5C9AEE4C8ACE3C6A9E3C5A7A68772FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD9C7BE9D1BAE9D2BBE9
      D2BBE9D2BBE9D2BBE9D2BBE9D1BAE9D1B99C3000912801E7CDB4E6CCB2E5CAB0
      E5C9AEE4C8ACE3C5A8E2C4A6A68772FF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFD3BDA3EAD3BCEAD4BDEAD4BEEAD4BEEAD4BEEAD4BEEAD4BEEA
      D4BDEAD3BC9C30008B2100E8CFB7E7CEB5E6CCB2E5CAB0E5C9AEE4C7AAE3C5A8
      E2C3A5BD9C7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD9C7BEAD4
      BEEBD6C0EBD6C1EBD6C1EBD6C1EBD6C1EBD6C1EBD6C0EAD4BE9C30008C2200E9
      D1B9E8CFB7E7CDB4E6CCB2E5CAAFE4C8ADE3C6A9E3C5A7A68772FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFD3BDA3EBD5BFEBD6C1ECD7C2EDD9C5EDD9C5EDD9
      C5EDD9C5EDD9C5ECD7C2EBD6C19C30008C2200E9D2BBE8D0B8E8CFB6E7CDB4E6
      CBB1E5C9AEE4C8ACE3C5A8E2C3A5BD9C7BFF00FFFF00FFFF00FFFF00FFFF00FF
      D3BDA3EBD6C1ECD8C3EDDAC7EEDCCAEFDECDEFDECDEFDECDEEDCCAEDDAC7ECD8
      C39C30008C2200EAD4BDE9D1BAE8D0B8E7CEB5E6CCB2E5CAAFE4C8ADE3C6A9E2
      C4A6A68772FF00FFFF00FFFF00FFFF00FFFF00FFD3BDA3ECD8C3EEDCCAEFDECD
      F1E2D2F2E4D5F2E4D5F2E4D5F1E2D2EFDECDEEDCCA9C30008C2200EAD4BEEAD3
      BCE9D1B9E8CFB6E6CCB3E6CBB1E5C9AEE4C7AAE3C5A7A68772FF00FFFF00FFFF
      00FFFF00FFFF00FFD3BDA3EDDAC7EFDECDF2E4D5F4E8DBF5EADEF5EADEF5EADE
      F4E8DBD2A88C9C30008E20007D1600EBD6C0EAD4BDE9D1BAE8CFB7E7CDB4E6CB
      B1E5C9AEE4C8ACE3C5A8A68772FF00FFFF00FFFF00FFFF00FFFF00FFD3BDA3EE
      DCCAF1E2D2F4E8DBF6EBE0F8EFE6F8EFE6F8EFE6F6EBE0A88572854F31854F31
      6D3313EBD6C1EAD4BEE9D2BBE8D0B8E7CEB5E6CCB2E5CAAFE4C8ACE3C5A8A687
      72FF00FFFF00FFFF00FFFF00FFFF00FFD3BDA3EFDECDF2E4D5F5EADEF8EFE6FA
      F3EBFBF5EEFAF3EBF8EFE6F5EADEF2E4D5EFDECDEDD9C5EBD6C1EAD4BEE9D2BB
      E8D0B8E7CEB5E6CCB2E5CAAFE4C8ACE3C5A8BD9C7BFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFD3BDA3F2E4D5F5EADEF8EFE6FBF5EEFEFBF7FBF5EEF8EFE6F5
      EADED0AC9B9C3000E38551EBD6C1EAD4BEE9D2BBE8D0B8E7CEB5E6CCB2E5CAAF
      E4C8ACA68772FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3BDA3F2E4
      D5F5EADEF8EFE6FAF3EBFBF5EEFAF3EBF8EFE6F5EADE7830279C30009F3612CC
      A692EAD4BEE9D2BBE8D0B8E7CEB5E6CCB2E5CAAFE4C8ACBD9C7BFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3BDA3F4E8DBF6EBE0F8EFE6F8EF
      E6F8EFE6F6EBE0F4E8DB7E52465609005A1000D7C7BEEAD4BEE9D2BBE8D0B8E7
      CEB5E6CCB2E5CAAFA68772FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFD3BDA3F4E8DBF5EADEF5EADEF5EADEF4E8DBF2E4D5EFDE
      CDC4B6B0D7CFCCEBD6C0EAD4BDE9D1BAE8CFB7E7CDB4E6CBB1A68772FF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      D3BDA3F2E4D5F2E4D5F2E4D5F1E2D2EFDECDEEDCCAECD8C3EBD6C1EAD4BEEAD3
      BCE9D1B9E8CFB6E6CCB3A68772FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3BDA3D3BDA3EFDECD
      EEDCCAEDDAC7ECD8C3EBD6C1EBD5BFEAD4BDE9D1BAE8D0B8A68772BD9C7BFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3BDA3D3BDA3D3BDA3D3BDA3D3BDA3
      D3BDA3D3BDA3D3BDA3BD9C7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    Properties.Stretch = True
    Style.BorderStyle = ebsNone
    TabOrder = 3
    OnClick = imgInfoClick
    Height = 34
    Width = 34
  end
  object pInformation: TPanel
    Left = 66
    Top = 323
    Width = 373
    Height = 151
    BevelOuter = bvNone
    Color = clInfoBk
    TabOrder = 4
    object lHeader1: TcxLabel
      Left = 4
      Top = 2
      Caption = 'Contract Rearing (Retain On Kingswood Profile)'
      Style.TextColor = clBlack
      Style.TextStyle = [fsBold]
    end
    object lHeader2: TcxLabel
      Left = 4
      Top = 72
      Caption = 'Contract Rearing (Move off Kingswood Profile)'
      Style.TextColor = clBlack
      Style.TextStyle = [fsBold]
    end
    object lText1: TcxLabel
      Left = 4
      Top = 20
      AutoSize = False
      Caption = 
        'If you'#39're going to CONTINUE recording events for these '#13#10'animals' +
        ' (eg. Animal Remedies, Services, etc) then you should '#13#10'choose t' +
        'his option.'
      Style.TextColor = clNavy
      Height = 56
      Width = 400
    end
    object lText2: TcxLabel
      Left = 4
      Top = 88
      AutoSize = False
      Caption = 
        'If you'#39're NOT going to record events for these animals , '#13#10'while' +
        ' they'#39're away from the farm, then you should '#13#10'choose this optio' +
        'n.'
      Style.TextColor = clNavy
      Height = 56
      Width = 400
    end
  end
  object ActionList1: TActionList
    Left = 649
    Top = 68
    object actSave: TAction
      Caption = 'Save Movements'
      OnExecute = actSaveExecute
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 650
    Top = 35
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
    end
  end
end
