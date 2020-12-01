inherited fmGroups: TfmGroups
  Left = 361
  Top = 181
  Width = 941
  Height = 693
  Caption = 'Group Setup'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 642
    Width = 933
  end
  object PageControl: TcxPageControl [1]
    Left = 0
    Top = 48
    Width = 933
    Height = 594
    ActivePage = tsGroupSelection
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Style = 9
    TabHeight = 30
    TabOrder = 5
    TabWidth = 160
    OnDrawTabEx = PageControlDrawTabEx
    OnPageChanging = PageControlPageChanging
    ClientRectBottom = 594
    ClientRectRight = 933
    ClientRectTop = 31
    object tsGroupSelection: TcxTabSheet
      Caption = 'Group Selection'
      ImageIndex = 0
      object cxGroupBox1: TcxGroupBox
        Left = 20
        Top = 12
        Caption = 'Add/Edit Group'
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Height = 169
        Width = 883
        object btnAddNewGroup: TcxButton
          Left = 20
          Top = 32
          Width = 117
          Height = 36
          Action = actAdd
          Caption = 'Add'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          LookAndFeel.NativeStyle = True
        end
        object btnSaveGroup: TcxButton
          Left = 20
          Top = 73
          Width = 117
          Height = 36
          Action = actSave
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          LookAndFeel.NativeStyle = True
        end
        object btnCancelGroup: TcxButton
          Left = 20
          Top = 115
          Width = 117
          Height = 36
          Action = actCancel
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          LookAndFeel.NativeStyle = True
        end
        object teCode: TcxDBTextEdit
          Left = 254
          Top = 34
          DataBinding.DataField = 'Code'
          DataBinding.DataSource = WinData.dsGroups
          Style.LookAndFeel.Kind = lfFlat
          Style.TextStyle = []
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.Kind = lfFlat
          TabOrder = 3
          Width = 113
        end
        object cxLabel1: TcxLabel
          Left = 158
          Top = 36
          AutoSize = False
          Caption = 'Code: '
          Height = 21
          Width = 83
        end
        object cxLabel2: TcxLabel
          Left = 158
          Top = 72
          AutoSize = False
          Caption = 'Description: '
          Height = 21
          Width = 83
        end
        object teDescription: TcxDBTextEdit
          Left = 254
          Top = 70
          DataBinding.DataField = 'Description'
          DataBinding.DataSource = WinData.dsGroups
          Style.LookAndFeel.Kind = lfFlat
          Style.TextStyle = []
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.Kind = lfFlat
          TabOrder = 6
          Width = 240
        end
        object cxLabel3: TcxLabel
          Left = 158
          Top = 108
          AutoSize = False
          Caption = 'Type: '
          Height = 21
          Width = 83
        end
        object cxLabel4: TcxLabel
          Left = 522
          Top = 36
          AutoSize = False
          Caption = 'Move Date: '
          Height = 21
          Width = 83
        end
        object cxLabel5: TcxLabel
          Left = 522
          Top = 72
          AutoSize = False
          Caption = 'Supplier: '
          Height = 21
          Width = 71
        end
        object cxDBLookupComboBox2: TcxDBLookupComboBox
          Left = 606
          Top = 70
          DataBinding.DataField = 'DestSource'
          DataBinding.DataSource = WinData.dsGroups
          Properties.ListColumns = <>
          Style.TextStyle = []
          TabOrder = 9
          Width = 240
        end
        object deMoveDate: TcxDBDateEdit
          Left = 606
          Top = 34
          DataBinding.DataField = 'EventDate'
          DataBinding.DataSource = WinData.dsGroups
          Style.TextStyle = []
          TabOrder = 8
          Width = 149
        end
        object cmboGroupType: TcxDBComboBox
          Left = 254
          Top = 106
          DataBinding.DataField = 'GroupType'
          DataBinding.DataSource = WinData.dsGroups
          Style.TextStyle = []
          TabOrder = 7
          Width = 240
        end
      end
      object cxGroupBox2: TcxGroupBox
        Left = 20
        Top = 198
        Caption = 'Group Listing'
        Style.LookAndFeel.Kind = lfFlat
        StyleDisabled.LookAndFeel.Kind = lfFlat
        StyleFocused.LookAndFeel.Kind = lfFlat
        StyleHot.LookAndFeel.Kind = lfFlat
        TabOrder = 1
        Height = 347
        Width = 883
        object Image3: TImage
          Left = 20
          Top = 30
          Width = 19
          Height = 21
          Picture.Data = {
            07544269746D617036030000424D360300000000000036000000280000001000
            000010000000010018000000000000030000420B0000420B0000000000000000
            0000FF00FF2173B5636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2173B5218CEF2173B5636B73FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FF31A5FF52BDFF218CEF2173B5636B73FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF31A5FF52BDFF218CEF2173
            B5636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF31A5FF52BDFF218CEF2173B5636B73FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF31A5FF52BD
            FF218CEF5A6B73FF00FFD5B9B4D6ADA5D6ADA5D6ADA5D5B9B4FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF31A5FF31A5FF4A4239B69B8BF0E2C0F9EFC8
            FDF2CBFEF4CCECD8C2D6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFBB9F88F3E3B6FCF3D1FEF6CDFEF7CFFEF9D0FDF7D2F5E6C2D6ADA5FF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFD5B9B4EFE1B5FAEDBDFFF1C1FFF3C2
            FFF5C4FFF7C5FFFAC7FDF8D2D6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFD6ADA5EFE3B6FBECBEFDEFBFFEF1C1FFF2C2FFF4C4FFF7C5FFF9C7EEE2BBD6
            ADA5FF00FFFF00FFFF00FFFF00FFFF00FFD6ADA5EDE1B4F6E9BEFCF1D3FCF0C9
            FEF0C1FFF1C2FFF4C3FFF6C5F6E9C2CBAF9CFF00FFFF00FFFF00FFFF00FFFF00
            FFD6ADA5EBDEB2F2E6BBFCF2D7FCF1D3FCEEC0FEEFC2FFF2C2FEF2C2EFE1BBD2
            B3A3FF00FFFF00FFFF00FFFF00FFFF00FFD5B9B4E4D8B0EDE1B6F3E7BCF8EBC0
            F9EBBCFBEDBEFAECBDF5E9BAD6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFD6ADA5EADFBCECE0B6F0E3B6F1E5B7F2E5B7EFE3B5F5E7BCD5B9B4FF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6ADA5E0D4B5EADEB4
            EBDEB1E8DBB1D6ADA5D5B9B4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFD5B9B4D6ADA5D6ADA5D9B7A3FF00FFFF00FFFF00FFFF
            00FF}
          Transparent = True
        end
        object GroupGrid: TcxGrid
          Left = 20
          Top = 60
          Width = 805
          Height = 222
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
          object GroupGridDBTableView: TcxGridDBTableView
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
            OnFocusedRecordChanged = GroupGridDBTableViewFocusedRecordChanged
            DataController.DataSource = WinData.dsGroups
            DataController.KeyFieldNames = 'ID'
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsCustomize.ColumnFiltering = False
            OptionsData.CancelOnExit = False
            OptionsData.Deleting = False
            OptionsData.DeletingConfirmation = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsSelection.CellSelect = False
            OptionsSelection.HideFocusRectOnExit = False
            OptionsSelection.InvertSelect = False
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.DataRowHeight = 28
            OptionsView.GridLines = glHorizontal
            OptionsView.GroupByBox = False
            OptionsView.HeaderHeight = 34
            OptionsView.Indicator = True
            OptionsView.IndicatorWidth = 15
            object GroupGridDBTableViewID: TcxGridDBColumn
              DataBinding.FieldName = 'ID'
              Visible = False
              HeaderAlignmentVert = vaCenter
              Hidden = True
            end
            object GroupGridDBTableViewCode: TcxGridDBColumn
              DataBinding.FieldName = 'Code'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentVert = vaCenter
              Width = 145
            end
            object GroupGridDBTableViewDescription: TcxGridDBColumn
              DataBinding.FieldName = 'Description'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentVert = vaCenter
              Width = 280
            end
            object GroupGridDBTableViewGroupType: TcxGridDBColumn
              DataBinding.FieldName = 'Group Type'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentVert = vaCenter
              Width = 125
            end
            object GroupGridDBTableViewSelected: TcxGridDBColumn
              DataBinding.FieldName = 'Selected'
              Visible = False
              HeaderAlignmentVert = vaCenter
              Hidden = True
            end
            object GroupGridDBTableViewEventDate: TcxGridDBColumn
              DataBinding.FieldName = 'EventDate'
              Visible = False
              HeaderAlignmentVert = vaCenter
              Hidden = True
            end
            object GroupGridDBTableViewDestSource: TcxGridDBColumn
              DataBinding.FieldName = 'DestSource'
              Visible = False
              HeaderAlignmentVert = vaCenter
              Hidden = True
            end
            object GroupGridDBTableViewCrushLoadComplete: TcxGridDBColumn
              DataBinding.FieldName = 'CrushLoadComplete'
              Visible = False
              HeaderAlignmentVert = vaCenter
              Hidden = True
            end
          end
          object GroupGridLevel: TcxGridLevel
            GridView = GroupGridDBTableView
          end
        end
        object cxLabel6: TcxLabel
          Left = 20
          Top = 297
          AutoSize = False
          Caption = 'Number of animals currently in group: '
          Height = 21
          Width = 249
        end
        object teCountOfAnimalsInGroup: TcxTextEdit
          Left = 272
          Top = 298
          ParentFont = False
          Properties.Alignment.Horz = taRightJustify
          Properties.ReadOnly = True
          Style.LookAndFeel.Kind = lfFlat
          Style.StyleController = WinData.ReadOnlyEditStyleController
          Style.TextStyle = []
          StyleDisabled.LookAndFeel.Kind = lfFlat
          StyleFocused.LookAndFeel.Kind = lfFlat
          StyleHot.LookAndFeel.Kind = lfFlat
          TabOrder = 2
          Text = 'teCountOfAnimalsInGroup'
          Width = 75
        end
        object cxButton1: TcxButton
          Left = 646
          Top = 294
          Width = 179
          Height = 36
          Caption = 'Group Transfers'
          Default = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          Colors.Default = 3714899
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
        end
        object cxTextEdit1: TcxTextEdit
          Left = 51
          Top = 28
          Properties.MaxLength = 40
          Style.TextStyle = []
          TabOrder = 4
          Text = 'Search by Description'
          Width = 335
        end
        object cxButton2: TcxButton
          Left = 392
          Top = 29
          Width = 85
          Height = 26
          Action = actExecuteSourceSearch
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          LookAndFeel.Kind = lfOffice11
        end
      end
    end
    object tsGroupAnimals: TcxTabSheet
      Caption = 'Animal Selection'
      ImageIndex = 1
      object cxGroupBox3: TcxGroupBox
        Left = 20
        Top = 12
        Caption = 'Selected Group'
        TabOrder = 0
        Height = 83
        Width = 884
        object cxLabel9: TcxLabel
          Left = 48
          Top = 26
          AutoSize = False
          Caption = 'Code: '
          Properties.Alignment.Horz = taRightJustify
          Height = 21
          Width = 83
        end
        object cxLabel10: TcxLabel
          Left = 48
          Top = 50
          AutoSize = False
          Caption = 'Description: '
          Properties.Alignment.Horz = taRightJustify
          Height = 21
          Width = 83
        end
        object cxDBLabel1: TcxDBLabel
          Left = 132
          Top = 26
          DataBinding.DataField = 'Code'
          DataBinding.DataSource = WinData.dsGroups
          Style.TextStyle = []
          Height = 21
          Width = 215
        end
        object cxDBLabel2: TcxDBLabel
          Left = 132
          Top = 50
          DataBinding.DataField = 'Description'
          DataBinding.DataSource = WinData.dsGroups
          Style.TextStyle = []
          Height = 21
          Width = 215
        end
      end
      object gbSourcePanel: TcxGroupBox
        Left = 20
        Top = 108
        Caption = 'Animals that can be moved into %s'
        TabOrder = 1
        Height = 431
        Width = 436
        object Image1: TImage
          Left = 16
          Top = 30
          Width = 19
          Height = 21
          Picture.Data = {
            07544269746D617036030000424D360300000000000036000000280000001000
            000010000000010018000000000000030000420B0000420B0000000000000000
            0000FF00FF2173B5636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2173B5218CEF2173B5636B73FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FF31A5FF52BDFF218CEF2173B5636B73FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF31A5FF52BDFF218CEF2173
            B5636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF31A5FF52BDFF218CEF2173B5636B73FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF31A5FF52BD
            FF218CEF5A6B73FF00FFD5B9B4D6ADA5D6ADA5D6ADA5D5B9B4FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF31A5FF31A5FF4A4239B69B8BF0E2C0F9EFC8
            FDF2CBFEF4CCECD8C2D6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFBB9F88F3E3B6FCF3D1FEF6CDFEF7CFFEF9D0FDF7D2F5E6C2D6ADA5FF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFD5B9B4EFE1B5FAEDBDFFF1C1FFF3C2
            FFF5C4FFF7C5FFFAC7FDF8D2D6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFD6ADA5EFE3B6FBECBEFDEFBFFEF1C1FFF2C2FFF4C4FFF7C5FFF9C7EEE2BBD6
            ADA5FF00FFFF00FFFF00FFFF00FFFF00FFD6ADA5EDE1B4F6E9BEFCF1D3FCF0C9
            FEF0C1FFF1C2FFF4C3FFF6C5F6E9C2CBAF9CFF00FFFF00FFFF00FFFF00FFFF00
            FFD6ADA5EBDEB2F2E6BBFCF2D7FCF1D3FCEEC0FEEFC2FFF2C2FEF2C2EFE1BBD2
            B3A3FF00FFFF00FFFF00FFFF00FFFF00FFD5B9B4E4D8B0EDE1B6F3E7BCF8EBC0
            F9EBBCFBEDBEFAECBDF5E9BAD6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFD6ADA5EADFBCECE0B6F0E3B6F1E5B7F2E5B7EFE3B5F5E7BCD5B9B4FF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6ADA5E0D4B5EADEB4
            EBDEB1E8DBB1D6ADA5D5B9B4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFD5B9B4D6ADA5D6ADA5D9B7A3FF00FFFF00FFFF00FFFF
            00FF}
          Transparent = True
        end
        object SourceGrid: TcxGrid
          Left = 12
          Top = 62
          Width = 410
          Height = 314
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          LookAndFeel.Kind = lfFlat
          object SourceGridDBTableView: TcxGridDBTableView
            DragMode = dmAutomatic
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
            OnSelectionChanged = SourceGridDBTableViewSelectionChanged
            DataController.DataSource = dsSourceData
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
            OptionsSelection.InvertSelect = False
            OptionsSelection.MultiSelect = True
            OptionsView.GridLines = glHorizontal
            OptionsView.GroupByBox = False
            OptionsView.HeaderHeight = 34
            OptionsView.Indicator = True
            OptionsView.IndicatorWidth = 15
            object SourceGridDBTableViewRecId: TcxGridDBColumn
              DataBinding.FieldName = 'RecId'
              Visible = False
              HeaderAlignmentVert = vaCenter
              Hidden = True
            end
            object SourceGridDBTableViewId: TcxGridDBColumn
              DataBinding.FieldName = 'Id'
              Visible = False
              HeaderAlignmentVert = vaCenter
              Hidden = True
            end
            object SourceGridDBTableViewAnimalNo: TcxGridDBColumn
              Caption = 'Animal No'
              DataBinding.FieldName = 'AnimalNo'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentVert = vaCenter
              Width = 85
            end
            object SourceGridDBTableViewNatIdNum: TcxGridDBColumn
              Caption = 'Nat. Id. No.'
              DataBinding.FieldName = 'NatIdNum'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentVert = vaCenter
              Width = 145
            end
            object SourceGridDBTableViewSortAnimalNo: TcxGridDBColumn
              DataBinding.FieldName = 'SortAnimalNo'
              Visible = False
              HeaderAlignmentVert = vaCenter
              Hidden = True
            end
            object SourceGridDBTableViewSortNatIdNum: TcxGridDBColumn
              DataBinding.FieldName = 'SortNatIdNum'
              Visible = False
              HeaderAlignmentVert = vaCenter
              Hidden = True
            end
            object SourceGridDBTableViewDateOfBirth: TcxGridDBColumn
              Caption = 'Date Of Birth'
              DataBinding.FieldName = 'DateOfBirth'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentVert = vaCenter
              Width = 85
            end
            object SourceGridDBTableViewSex: TcxGridDBColumn
              DataBinding.FieldName = 'Sex'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentVert = vaCenter
              Width = 58
            end
            object SourceGridDBTableViewBreedCode: TcxGridDBColumn
              Caption = 'Breed'
              DataBinding.FieldName = 'BreedCode'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentVert = vaCenter
              Width = 45
            end
            object SourceGridDBTableViewLactNo: TcxGridDBColumn
              Caption = 'Lact No.'
              DataBinding.FieldName = 'LactNo'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.Alignment.Vert = taVCenter
              HeaderAlignmentVert = vaCenter
              Width = 55
            end
          end
          object SourceGridLevel: TcxGridLevel
            GridView = SourceGridDBTableView
          end
        end
        object teSourceSearchText: TcxTextEdit
          Left = 46
          Top = 28
          Style.TextStyle = []
          TabOrder = 1
          Text = 'Search by Nat. Id. No.'
          OnExit = teSourceSearchTextExit
          OnMouseLeave = teSourceSearchTextMouseLeave
          Width = 285
        end
        object cxButton5: TcxButton
          Left = 82
          Top = 380
          Width = 340
          Height = 36
          Caption = 'Add Selected Animal(s) To Group'
          Default = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          Colors.Default = 3714899
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
        end
        object cxLabel11: TcxLabel
          Left = 332
          Top = -2
          Cursor = crHandPoint
          Caption = 'Filter Options'
          ParentFont = False
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = [fsBold]
          Style.TextColor = clBlue
          Style.TextStyle = [fsBold, fsUnderline]
          Style.IsFontAssigned = True
        end
        object SourceCountLabel: TcxLabel
          Left = 11
          Top = 378
          AutoSize = False
          Caption = '65'
          ParentColor = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Style.Color = 3714899
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWhite
          Style.Font.Height = -21
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          Height = 39
          Width = 65
        end
        object btnSearchSource: TcxButton
          Left = 336
          Top = 27
          Width = 85
          Height = 26
          Action = actExecuteSourceSearch
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          LookAndFeel.Kind = lfOffice11
        end
      end
      object cxGroupBox5: TcxGroupBox
        Left = 466
        Top = 108
        Caption = 'Animals Currently In Group'
        TabOrder = 2
        Height = 431
        Width = 436
        object Image2: TImage
          Left = 16
          Top = 30
          Width = 19
          Height = 21
          Picture.Data = {
            07544269746D617036030000424D360300000000000036000000280000001000
            000010000000010018000000000000030000420B0000420B0000000000000000
            0000FF00FF2173B5636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2173B5218CEF2173B5636B73FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FF31A5FF52BDFF218CEF2173B5636B73FF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF31A5FF52BDFF218CEF2173
            B5636B73FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FF31A5FF52BDFF218CEF2173B5636B73FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF31A5FF52BD
            FF218CEF5A6B73FF00FFD5B9B4D6ADA5D6ADA5D6ADA5D5B9B4FF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FF31A5FF31A5FF4A4239B69B8BF0E2C0F9EFC8
            FDF2CBFEF4CCECD8C2D6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFBB9F88F3E3B6FCF3D1FEF6CDFEF7CFFEF9D0FDF7D2F5E6C2D6ADA5FF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFD5B9B4EFE1B5FAEDBDFFF1C1FFF3C2
            FFF5C4FFF7C5FFFAC7FDF8D2D6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFD6ADA5EFE3B6FBECBEFDEFBFFEF1C1FFF2C2FFF4C4FFF7C5FFF9C7EEE2BBD6
            ADA5FF00FFFF00FFFF00FFFF00FFFF00FFD6ADA5EDE1B4F6E9BEFCF1D3FCF0C9
            FEF0C1FFF1C2FFF4C3FFF6C5F6E9C2CBAF9CFF00FFFF00FFFF00FFFF00FFFF00
            FFD6ADA5EBDEB2F2E6BBFCF2D7FCF1D3FCEEC0FEEFC2FFF2C2FEF2C2EFE1BBD2
            B3A3FF00FFFF00FFFF00FFFF00FFFF00FFD5B9B4E4D8B0EDE1B6F3E7BCF8EBC0
            F9EBBCFBEDBEFAECBDF5E9BAD6ADA5FF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFD6ADA5EADFBCECE0B6F0E3B6F1E5B7F2E5B7EFE3B5F5E7BCD5B9B4FF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6ADA5E0D4B5EADEB4
            EBDEB1E8DBB1D6ADA5D5B9B4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFD5B9B4D6ADA5D6ADA5D9B7A3FF00FFFF00FFFF00FFFF
            00FF}
          Transparent = True
        end
        object teTargetSearchText: TcxTextEdit
          Left = 46
          Top = 28
          Style.TextStyle = []
          TabOrder = 0
          Width = 285
        end
        object cxButton6: TcxButton
          Left = 12
          Top = 380
          Width = 340
          Height = 36
          Action = actRemoveFromGroup
          Caption = 'Remove Selected Animal(s) From Group'
          Default = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          Colors.Default = 2179838
          LookAndFeel.Kind = lfFlat
          LookAndFeel.NativeStyle = False
        end
        object TargetGrid: TcxGrid
          Left = 12
          Top = 60
          Width = 410
          Height = 314
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          LookAndFeel.Kind = lfFlat
          object TargetGridDBTableView: TcxGridDBTableView
            DragMode = dmAutomatic
            OnDragDrop = TargetGridDBTableViewDragDrop
            OnDragOver = TargetGridDBTableViewDragOver
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
            OnSelectionChanged = TargetGridDBTableViewSelectionChanged
            DataController.DataSource = dsTargetData
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
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
            OptionsSelection.MultiSelect = True
            OptionsSelection.UnselectFocusedRecordOnExit = False
            OptionsView.GridLines = glHorizontal
            OptionsView.GroupByBox = False
            OptionsView.HeaderHeight = 34
            OptionsView.Indicator = True
            OptionsView.IndicatorWidth = 15
            object TargetGridDBTableViewRecId: TcxGridDBColumn
              DataBinding.FieldName = 'RecId'
              Visible = False
              HeaderAlignmentVert = vaCenter
              Hidden = True
            end
            object TargetGridDBTableViewId: TcxGridDBColumn
              DataBinding.FieldName = 'Id'
              Visible = False
              HeaderAlignmentVert = vaCenter
              Hidden = True
            end
            object TargetGridDBTableViewAnimalNo: TcxGridDBColumn
              Caption = 'Animal No.'
              DataBinding.FieldName = 'AnimalNo'
              HeaderAlignmentVert = vaCenter
              Width = 85
            end
            object TargetGridDBTableViewNatIdNum: TcxGridDBColumn
              Caption = 'Nat. Id. No.'
              DataBinding.FieldName = 'NatIdNum'
              HeaderAlignmentVert = vaCenter
              Width = 145
            end
            object TargetGridDBTableViewSortAnimalNo: TcxGridDBColumn
              DataBinding.FieldName = 'SortAnimalNo'
              Visible = False
              HeaderAlignmentVert = vaCenter
              Hidden = True
            end
            object TargetGridDBTableViewSortNatIdNum: TcxGridDBColumn
              DataBinding.FieldName = 'SortNatIdNum'
              Visible = False
              HeaderAlignmentVert = vaCenter
              Hidden = True
            end
            object TargetGridDBTableViewDateOfBirth: TcxGridDBColumn
              Caption = 'Date Of Birth'
              DataBinding.FieldName = 'DateOfBirth'
              HeaderAlignmentVert = vaCenter
              Width = 85
            end
            object TargetGridDBTableViewSex: TcxGridDBColumn
              DataBinding.FieldName = 'Sex'
              HeaderAlignmentVert = vaCenter
              Width = 58
            end
            object TargetGridDBTableViewBreedCode: TcxGridDBColumn
              Caption = 'Breed'
              DataBinding.FieldName = 'BreedCode'
              HeaderAlignmentVert = vaCenter
              Width = 45
            end
            object TargetGridDBTableViewLactNo: TcxGridDBColumn
              Caption = 'Lact No.'
              DataBinding.FieldName = 'LactNo'
              HeaderAlignmentVert = vaCenter
              Width = 55
            end
          end
          object TargetGridLevel: TcxGridLevel
            GridView = TargetGridDBTableView
          end
        end
        object TargetCountLabel: TcxLabel
          Left = 358
          Top = 378
          AutoSize = False
          Caption = '65'
          ParentColor = False
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Style.Color = 2179838
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWhite
          Style.Font.Height = -21
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          Height = 39
          Width = 65
        end
        object btnSearchTarget: TcxButton
          Left = 336
          Top = 27
          Width = 85
          Height = 26
          Action = actExecuteTargetSearch
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          LookAndFeel.Kind = lfOffice11
        end
      end
    end
  end
  inherited ActionList: TActionList
    Left = 362
    Top = 6
    object actAdd: TAction
      Caption = 'Add '
      OnExecute = actAddExecute
      OnUpdate = actAddUpdate
    end
    object actSave: TAction
      Caption = 'Save'
      OnExecute = actSaveExecute
      OnUpdate = actSaveUpdate
    end
    object actCancel: TAction
      Caption = 'Cancel'
      OnExecute = actCancelExecute
      OnUpdate = actCancelUpdate
    end
    object actOptions: TAction
      Caption = 'Options'
    end
    object actAddToGroup: TAction
      Caption = 'Add To %s'
    end
    object actRemoveFromGroup: TAction
      Caption = 'Remove From Group'
      OnExecute = actRemoveFromGroupExecute
      OnUpdate = actRemoveFromGroupUpdate
    end
    object actExecuteSourceSearch: TAction
      Caption = 'Search'
      OnExecute = actExecuteSourceSearchExecute
    end
    object actExecuteTargetSearch: TAction
      Caption = 'Search'
      OnExecute = actExecuteTargetSearchExecute
    end
    object act: TAction
      Caption = 'act'
    end
  end
  inherited BarManager: TdxBarManager
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Main'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 353
        FloatTop = 250
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = bClose
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton1
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = bHelp
            UserGlyph.Data = {00000000}
            Visible = True
          end>
        Name = 'Main'
        OneOnRow = True
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        Visible = True
        WholeRow = True
        BackgroundBitmap.Data = {00000000}
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 332
    Top = 4
    DockControlHeights = (
      0
      0
      48
      0)
    inherited bClose: TdxBarLargeButton
      Height = 44
    end
    inherited bHelp: TdxBarLargeButton
      Height = 44
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actOptions
      Category = 0
      Height = 44
      HotImageIndex = 26
      Width = 75
    end
  end
  object SourceData: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 484
    Top = 10
    object SourceDataId: TIntegerField
      FieldName = 'Id'
      Visible = False
    end
    object SourceDataAnimalNo: TStringField
      FieldName = 'AnimalNo'
      Size = 10
    end
    object SourceDataNatIdNum: TStringField
      FieldName = 'NatIdNum'
      Size = 25
    end
    object SourceDataSortAnimalNo: TStringField
      FieldName = 'SortAnimalNo'
      Visible = False
      Size = 10
    end
    object SourceDataSortNatIdNum: TStringField
      FieldName = 'SortNatIdNum'
      Visible = False
      Size = 25
    end
    object SourceDataDateOfBirth: TDateTimeField
      FieldName = 'DateOfBirth'
    end
    object SourceDataSex: TStringField
      FieldName = 'Sex'
      Size = 6
    end
    object SourceDataBreedCode: TStringField
      FieldName = 'BreedCode'
      Size = 5
    end
    object SourceDataLactNo: TIntegerField
      FieldName = 'LactNo'
    end
  end
  object TargetData: TdxMemData
    Indexes = <>
    SortOptions = []
    AfterOpen = TargetDataAfterOpen
    AfterDelete = TargetDataAfterDelete
    Left = 518
    Top = 12
    object TargetDataId: TIntegerField
      FieldName = 'Id'
    end
    object TargetDataAnimalNo: TStringField
      FieldName = 'AnimalNo'
      Size = 10
    end
    object TargetDataNatIdNum: TStringField
      FieldName = 'NatIdNum'
      Size = 25
    end
    object TargetDataSortAnimalNo: TStringField
      FieldName = 'SortAnimalNo'
      Size = 10
    end
    object TargetDataSortNatIdNum: TStringField
      FieldName = 'SortNatIdNum'
      Size = 25
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DateOfBirth'
    end
    object StringField5: TStringField
      FieldName = 'Sex'
      Size = 6
    end
    object StringField6: TStringField
      FieldName = 'BreedCode'
      Size = 5
    end
    object IntegerField2: TIntegerField
      FieldName = 'LactNo'
    end
  end
  object dsSourceData: TDataSource
    DataSet = SourceData
    Left = 483
    Top = 47
  end
  object dsTargetData: TDataSource
    DataSet = TargetData
    Left = 517
    Top = 47
  end
end
