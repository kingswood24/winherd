object fmICBFEmailReview: TfmICBFEmailReview
  Left = 426
  Top = 234
  Width = 633
  Height = 470
  ActiveControl = cmboICBFFiles
  Caption = 'Review Animal Welfare Emails'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 16
    Top = 370
    Width = 575
    Height = 10
    Anchors = [akLeft, akTop, akRight, akBottom]
    Shape = bsBottomLine
  end
  object gbRegistrationDateReview: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = 'Select Date of Registration to Review'
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 0
    Height = 65
    Width = 625
    object cmboICBFFiles: TcxComboBox
      Left = 124
      Top = 18
      Anchors = [akLeft, akTop, akRight]
      Properties.DropDownListStyle = lsFixedList
      Properties.ImmediatePost = True
      Properties.Revertable = True
      Properties.OnEditValueChanged = cmboICBFFilesPropertiesEditValueChanged
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Width = 473
    end
    object cxLabel1: TcxLabel
      Left = 18
      Top = 20
      Caption = 'Registration Date:'
    end
    object lFileName: TcxLabel
      Left = 124
      Top = 42
      AutoSize = False
      Height = 17
      Width = 329
    end
  end
  object gbRegistrationDetails: TcxGroupBox
    Left = 0
    Top = 65
    Align = alClient
    Caption = 'Registration Details'
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 1
    Height = 333
    Width = 625
    object pcEventData: TcxPageControl
      Left = 2
      Top = 16
      Width = 621
      Height = 315
      ActivePage = tsEvents
      Align = alClient
      NavigatorPosition = npLeftBottom
      Style = 9
      TabHeight = 26
      TabOrder = 0
      TabWidth = 150
      ClientRectBottom = 315
      ClientRectRight = 621
      ClientRectTop = 27
      object tsEvents: TcxTabSheet
        Caption = 'Events On File'
        ImageIndex = 0
        object GridEventData: TcxGrid
          Left = 0
          Top = 0
          Width = 621
          Height = 288
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          object GridEventDataDBTableView: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            FilterBox.CustomizeDialog = False
            DataController.DataSource = dsmdSFile
            DataController.KeyFieldNames = 'ID'
            DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoFocusTopRowAfterSorting]
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = 'Total: #'
                Kind = skCount
                FieldName = 'ID'
                Column = GridEventDataDBTableViewSortNatIDNo
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsView.DataRowHeight = 24
            OptionsView.Footer = True
            OptionsView.GridLines = glHorizontal
            OptionsView.GroupByBox = False
            OptionsView.HeaderHeight = 32
            OptionsView.Indicator = True
            OptionsView.IndicatorWidth = 15
            object GridEventDataDBTableViewNatIdNo: TcxGridDBColumn
              DataBinding.FieldName = 'NatIdNo'
              Visible = False
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Hidden = True
            end
            object GridEventDataDBTableViewSortNatIDNo: TcxGridDBColumn
              DataBinding.FieldName = 'SortNatIDNo'
              OnGetDisplayText = GridEventDataDBTableViewSortNatIDNoGetDisplayText
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
            end
            object GridEventDataDBTableViewEventDate: TcxGridDBColumn
              Caption = 'Date'
              DataBinding.FieldName = 'EventDate'
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              SortIndex = 0
              SortOrder = soAscending
              Width = 99
            end
            object GridEventDataDBTableViewEventType: TcxGridDBColumn
              Caption = 'Type'
              DataBinding.FieldName = 'EventType'
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              SortIndex = 1
              SortOrder = soAscending
              Width = 111
            end
            object GridEventDataDBTableViewEventDesc: TcxGridDBColumn
              Caption = 'Description'
              DataBinding.FieldName = 'EventDesc'
              HeaderAlignmentVert = vaCenter
              HeaderGlyphAlignmentHorz = taCenter
              Options.Filtering = False
              Width = 197
            end
          end
          object GridEventDataLevel: TcxGridLevel
            GridView = GridEventDataDBTableView
          end
        end
      end
      object tsSFile: TcxTabSheet
        Caption = 'File (Raw)'
        ImageIndex = 1
        object mSFile: TcxMemo
          Left = 0
          Top = 0
          Align = alClient
          Properties.ReadOnly = True
          Properties.ScrollBars = ssBoth
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          Height = 288
          Width = 621
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 398
    Width = 625
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnClose: TcxButton
      Left = 494
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Close'
      Default = True
      ModalResult = 2
      TabOrder = 0
      LookAndFeel.NativeStyle = True
    end
  end
  object dsmdSFile: TDataSource
    DataSet = mdSFile
    Left = 542
    Top = 198
  end
  object mdSFile: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 582
    Top = 194
    object mdSFileID: TAutoIncField
      FieldName = 'ID'
    end
    object mdSFileNatIdNo: TStringField
      DisplayLabel = 'Nat. Id. No.'
      FieldName = 'NatIdNo'
      Visible = False
    end
    object mdSFileSortNatIDNo: TStringField
      DisplayLabel = 'Nat. Id. No.'
      FieldName = 'SortNatIDNo'
    end
    object mdSFileEventDate: TDateTimeField
      DisplayLabel = 'Event Date'
      FieldName = 'EventDate'
    end
    object mdSFileEventType: TStringField
      DisplayLabel = 'Event Type'
      FieldName = 'EventType'
      Size = 2
    end
    object mdSFileEventDesc: TStringField
      FieldName = 'EventDesc'
      Size = 40
    end
  end
end