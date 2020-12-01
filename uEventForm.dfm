inherited fmEventForm: TfmEventForm
  Left = 688
  Top = 309
  Width = 451
  Height = 336
  Caption = 'fmEventForm'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 285
    Width = 443
  end
  object pEventControls: TPanel [1]
    Left = 14
    Top = 66
    Width = 409
    Height = 199
    BevelOuter = bvNone
    TabOrder = 5
    object teAnimalId: TcxTextEdit
      Left = 76
      Top = 10
      TabOrder = 6
      Width = 199
    end
    object deEventDate: TcxDateEdit
      Left = 76
      Top = 40
      Style.StyleController = EditStyleControllerFlat
      TabOrder = 0
      Width = 121
    end
    object teEventComment: TcxTextEdit
      Left = 76
      Top = 70
      Style.StyleController = EditStyleControllerFlat
      TabOrder = 1
      Width = 239
    end
    object cxLabel1: TcxLabel
      Left = 16
      Top = 40
      Caption = 'Date'
      Style.StyleController = EditStyleControllerFlat
    end
    object cxLabel2: TcxLabel
      Left = 16
      Top = 70
      Caption = 'Comment'
      Style.StyleController = EditStyleControllerFlat
    end
    object lIdType: TcxLabel
      Left = 16
      Top = 10
      Caption = 'Id Label'
      Style.StyleController = EditStyleControllerFlat
    end
    object cmboAnimalID: TcxLookupComboBox
      Left = 76
      Top = 10
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          Caption = 'Nat. Id. No.'
          SortOrder = soAscending
          Width = 85
          FieldName = 'NatIdNum'
        end
        item
          Caption = 'Animal No.'
          SortOrder = soAscending
          Width = 85
          FieldName = 'AnimalNo'
        end
        item
          Width = 70
          FieldName = 'Sex'
        end
        item
          Caption = 'Date Of Birth'
          Width = 85
          FieldName = 'DateOfBirth'
        end
        item
          Caption = 'Lact No.'
          Width = 55
          FieldName = 'LactNo'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glHorizontal
      Properties.ListOptions.ShowHeader = False
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
      Style.StyleController = EditStyleControllerFlat
      TabOrder = 2
      Width = 199
    end
  end
  inherited ActionList: TActionList
    Left = 8
    Top = 246
    inherited actClose: TAction
      Caption = 'Exit'
    end
    object actSave: TAction
      Caption = 'Save'
      ImageIndex = 8
      OnExecute = actSaveExecute
    end
    object actCancel: TAction
      Caption = 'Cancel'
      ImageIndex = 21
      OnExecute = actCancelExecute
    end
    object actDelete: TAction
      Caption = 'Delete'
      ImageIndex = 21
      OnExecute = actDeleteExecute
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
            Item = blbDelete
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
    Left = 38
    Top = 246
    DockControlHeights = (
      0
      0
      52
      0)
    inherited bClose: TdxBarLargeButton
      Height = 48
    end
    inherited bHelp: TdxBarLargeButton
      Height = 48
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actSave
      Category = 0
      Height = 48
      Width = 65
    end
    object blbDelete: TdxBarLargeButton
      Action = actDelete
      Category = 0
      Height = 48
      Width = 65
    end
  end
  object EditStyleControllerFlat: TcxEditStyleController
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = False
    Left = 70
    Top = 246
  end
end
