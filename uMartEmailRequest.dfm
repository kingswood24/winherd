object fmMartEmailRequest: TfmMartEmailRequest
  Left = 410
  Top = 200
  BorderStyle = bsDialog
  Caption = 'Mart File - Email Request'
  ClientHeight = 340
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 17
  object MartEmailRequestGrid: TcxGrid
    Left = 21
    Top = 51
    Width = 465
    Height = 225
    TabOrder = 0
    LookAndFeel.Kind = lfFlat
    object MartEmailRequestGridDBTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      FilterBox.CustomizeDialog = False
      FilterBox.Visible = fvNever
      DataController.DataSource = WinData.dsMarts
      DataController.KeyFieldNames = 'ID'
      DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.DataRowHeight = 22
      OptionsView.GridLines = glHorizontal
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 26
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      object MartEmailRequestGridDBTableViewMartName: TcxGridDBColumn
        DataBinding.FieldName = 'MartName'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 150
      end
      object MartEmailRequestGridDBTableViewAddress1: TcxGridDBColumn
        DataBinding.FieldName = 'Address1'
        Visible = False
        HeaderAlignmentVert = vaCenter
      end
      object MartEmailRequestGridDBTableViewAddress2: TcxGridDBColumn
        DataBinding.FieldName = 'Address2'
        Visible = False
        HeaderAlignmentVert = vaCenter
      end
      object MartEmailRequestGridDBTableViewAddress3: TcxGridDBColumn
        DataBinding.FieldName = 'Address3'
        Visible = False
        HeaderAlignmentVert = vaCenter
      end
      object MartEmailRequestGridDBTableViewAddress4: TcxGridDBColumn
        DataBinding.FieldName = 'Address4'
        Visible = False
        HeaderAlignmentVert = vaCenter
      end
      object MartEmailRequestGridDBTableViewMartNo: TcxGridDBColumn
        Caption = 'Mart No.'
        DataBinding.FieldName = 'MartNo'
        HeaderAlignmentVert = vaCenter
        Width = 80
      end
      object MartEmailRequestGridDBTableViewEmail: TcxGridDBColumn
        Caption = 'Email Address'
        DataBinding.FieldName = 'Email'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 194
      end
    end
    object MartEmailRequestGridLevel: TcxGridLevel
      GridView = MartEmailRequestGridDBTableView
    end
  end
  object btnSendEmail: TcxButton
    Left = 267
    Top = 289
    Width = 114
    Height = 34
    Action = actSelectMart
    TabOrder = 1
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF002B934800FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF002B93480031A648002B934800FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00399B610031A6480031A6480031A648002B934800FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF002B93480031A6480037B7550033A1580031A648002B934800FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF003F94
      660031A6480037B755002F8D58002F8D580037B7550043A1460037B75500FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF002B93
      480037B755002F8D5800FF00FF00FF00FF002F8D580037B755002B934800FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF002F8D5800FF00FF00FF00FF00FF00FF00FF00FF002F8D580037B755002B93
      4800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF002F8D580037B7
      550037B75500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF002F8D
      580031A64800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF002F8D580031A64800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF002F8D580031A64800FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF002F8D580031A64800FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF002F8D580031A64800FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF002F8D5800FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    LookAndFeel.Kind = lfOffice11
  end
  object btnClose: TcxButton
    Left = 398
    Top = 289
    Width = 90
    Height = 34
    Action = actClose
    ModalResult = 1
    TabOrder = 2
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00096EB000096EB00008609800FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00096EB000096EB0001479B8001479B80008609800FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00096EB000096EB0001680BF00157DBC00147AB9001479B80008609800394A
      6B00394A6B00394A6B00394A6B00394A6B00394A6B00FF00FF00FF00FF00FF00
      FF00096EB0001886C4001783C1001680BF00157DBC00147CBA00086098003D5B
      8100085A8E00085A8E00085A8E00085A8E00394A6B00FF00FF00FF00FF00FF00
      FF00096EB0001989C7001886C4001783C1001680BF00157FBD00086098000F49
      34000F4732000F4632000F45310010453100394A6B00FF00FF00FF00FF00FF00
      FF00096EB0001A8CCA001989C7001886C4001783C1001682C00008609800164D
      3800164A3600154935001646330015443100394A6B00FF00FF00FF00FF00FF00
      FF00096EB0001B90CD001A8CCA001989C7001886C4001785C300086098001C7A
      5B001C7C5E001D7D60001E785B001E725700394A6B00FF00FF00FF00FF00FF00
      FF00096EB0001B93CF001B90CD0022A6E20021A2DE001888C600086098001F83
      60001E7958001E6E4F001D624500205E4300394A6B00FF00FF00FF00FF00FF00
      FF00096EB0001C96D2001B93CF0022A6E200FFFFFF00198BC800086098005A76
      62007983700095948400AF9C8A00BB988700394A6B00FF00FF00FF00FF00FF00
      FF00096EB0001E9AD6001C96D2001B93CF001B91CE001A8ECB0008609800F0BA
      A400F0B29700F1BFA800F0BFA800F1BFA900394A6B00FF00FF00FF00FF00FF00
      FF00096EB0001F9EDA001E9AD6001C96D2001C94D1001B91CE0008609800F0B7
      9E00F2BFA900F4E0D700F2C6AE00F1A58100394A6B00FF00FF00FF00FF00FF00
      FF00096EB00021A2DE001F9EDA001E9AD6001D98D4001C94D10008609800EE7B
      4500F0A27D00F1A98600EF7D4500F0895600394A6B00FF00FF00FF00FF00FF00
      FF00096EB00022A6E20021A2DE001F9EDA001E9CD8001D98D40008609800ED73
      3B00EC6F3400EB6F3300EC6E3200EE865500394A6B00FF00FF00FF00FF00FF00
      FF00096EB000096EB00022A6E20021A2DE0020A0DC001E9CD80008609800E96F
      3C00E65F2400E7673100EE9D7B00ED946D00394A6B00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00096EB000096EB00021A4E00020A0DC0008609800394A
      6B00394A6B00394A6B00394A6B00394A6B00394A6B00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00096EB000096EB00008609800FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    LookAndFeel.Kind = lfOffice11
  end
  object lSearchForMart: TcxLabel
    Left = 19
    Top = 19
    Caption = 'Search For Mart:'
  end
  object teSearchForMart: TcxTextEdit
    Left = 128
    Top = 16
    Properties.CharCase = ecUpperCase
    Properties.OnChange = teSearchForMartPropertiesChange
    TabOrder = 4
    Width = 357
  end
  object btnClearSearch: TcxButton
    Left = 461
    Top = 16
    Width = 25
    Height = 26
    TabOrder = 5
    Visible = False
    OnClick = btnClearSearchClick
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00002EE4001B48FB00FF00FF001B48
      FB00002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00002EE4001B48FB00FF00FF00FF00FF001B48
      FB003E5EFF00002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00002EE4001B48FB00FF00FF00FF00FF00FF00FF001B48
      FB001B48FB003E5EFF00002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00002EE4001B48FB00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF003E5EFF001B48FB003E5EFF00002EE400FF00FF00FF00FF00FF00FF00FF00
      FF00002EE4001B48FB00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF001B48FB003E5EFF00002EE400FF00FF00FF00FF00002E
      E400002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF001B48FB003E5EFF00002EE400002EE400002E
      E400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF001B48FB001B48FB001B48FB00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF001B48FB003E5EFF001B48FB003E5EFF00002E
      E400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF001B48FB003E5EFF00002EE400FF00FF00FF00FF001B48
      FB00002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF001B48FB003E5EFF00002EE400FF00FF00FF00FF00FF00FF00FF00
      FF001B48FB00002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF001B48FB003E5EFF00002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF001B48FB00002EE400FF00FF00FF00FF00FF00FF00FF00FF001B48
      FB006482FF00002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00002EE400FF00FF00FF00FF001B48FB006482
      FF00002EE400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF001B48FB001B48
      FB00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    LookAndFeel.Kind = lfOffice11
  end
  object MAPIMail: TLMDMapiSendMail
    Left = 230
    Top = 292
  end
  object ActionList: TActionList
    Images = HerdLookup.ImageList16x16
    Left = 194
    Top = 292
    object actSendEmail: TAction
      Caption = 'Send Email'
      ImageIndex = 14
      OnExecute = actSendEmailExecute
    end
    object actSelectMart: TAction
      Caption = 'Select Mart'
      ImageIndex = 8
      OnExecute = actSelectMartExecute
    end
    object actClose: TAction
      Caption = 'Close'
      ImageIndex = 0
      OnExecute = actCloseExecute
    end
  end
end
