inherited fmHealthEvent: TfmHealthEvent
  Width = 386
  Height = 278
  Caption = 'Health Event'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 227
    Width = 378
  end
  inherited pEventControls: TPanel
    Width = 346
    Height = 151
    inherited deEventDate: TcxDateEdit
      Left = 80
      TabOrder = 1
    end
    inherited teEventComment: TcxTextEdit
      Left = 80
      Top = 100
      TabOrder = 3
    end
    inherited cxLabel2: TcxLabel
      Top = 100
    end
    inherited cmboAnimalID: TcxLookupComboBox
      Left = 80
      TabOrder = 0
      Width = 180
    end
    object cmboICBFCode: TcxLookupComboBox
      Left = 80
      Top = 70
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NatIdNum'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glHorizontal
      Properties.ListOptions.ShowHeader = False
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
      Properties.OnChange = cmboICBFCodePropertiesChange
      Style.StyleController = EditStyleControllerFlat
      TabOrder = 2
      Width = 240
    end
    object cxLabel3: TcxLabel
      Left = 16
      Top = 70
      Caption = 'ICBF Code '
      Style.StyleController = EditStyleControllerFlat
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
    DockControlHeights = (
      0
      0
      52
      0)
  end
end