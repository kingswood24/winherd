inherited fmConditionScoreEvent: TfmConditionScoreEvent
  Width = 386
  Height = 306
  Caption = 'Condition Score'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 250
    Width = 370
  end
  inherited pEventControls: TPanel
    Width = 347
    Height = 177
    inherited deEventDate: TcxDateEdit
      Left = 86
      Top = 48
    end
    inherited teEventComment: TcxTextEdit
      Left = 86
      Top = 138
      TabOrder = 2
    end
    inherited cxLabel1: TcxLabel
      Top = 50
      Style.TransparentBorder = False
    end
    inherited cxLabel2: TcxLabel
      Top = 140
      Style.TransparentBorder = False
    end
    inherited lIdType: TcxLabel
      Top = 18
      Style.TransparentBorder = False
    end
    inherited cmboAnimalID: TcxLookupComboBox
      Left = 86
      Top = 18
    end
    object seConditionScore: TcxSpinEdit
      Left = 86
      Top = 78
      Properties.DisplayFormat = '#'
      Properties.EditFormat = '#'
      Properties.ImmediatePost = True
      Properties.LargeIncrement = 1
      Properties.MaxValue = 5
      Properties.MinValue = 1
      Properties.ValueType = vtFloat
      Style.StyleController = EditStyleControllerFlat
      TabOrder = 1
      Value = 1
      Width = 57
    end
    object cxLabel3: TcxLabel
      Left = 16
      Top = 80
      Caption = 'Score'
      Style.StyleController = EditStyleControllerFlat
      Style.TransparentBorder = False
    end
    object cmboAssociatedEventType: TcxLookupComboBox
      Left = 86
      Top = 108
      RepositoryItem = HerdLookup.erConditionScoreAssociatedEvents
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glHorizontal
      Properties.ListOptions.ShowHeader = False
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
      Style.StyleController = EditStyleControllerFlat
      TabOrder = 8
      Width = 199
    end
    object cxLabel4: TcxLabel
      Left = 16
      Top = 105
      AutoSize = False
      Caption = 'Associated Event Type'
      Properties.WordWrap = True
      Style.StyleController = EditStyleControllerFlat
      Style.TransparentBorder = False
      Height = 35
      Width = 59
    end
  end
  inherited ActionList: TActionList
    Left = 16
    Top = 224
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
    Left = 48
    Top = 220
    DockControlHeights = (
      0
      0
      42
      0)
  end
  inherited EditStyleControllerFlat: TcxEditStyleController
    Left = 78
    Top = 218
  end
end
