inherited fmNewFeedAllocEdit: TfmNewFeedAllocEdit
  Left = 512
  Top = 237
  Width = 368
  Height = 371
  Caption = 'Feed Allocation'
  Font.Height = -12
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 15
  inherited StatusBar: TdxStatusBar
    Top = 317
    Width = 360
  end
  object pFeedAllocEdit: TPanel [1]
    Left = 14
    Top = 62
    Width = 331
    Height = 235
    BevelOuter = bvNone
    TabOrder = 5
    object lFeedAllocDate: TcxLabel
      Left = 29
      Top = 26
      Caption = 'Allocation Date:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object lFeedGroup: TcxLabel
      Left = 29
      Top = 66
      Caption = 'Feed Group:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object lFeedType: TcxLabel
      Left = 29
      Top = 106
      Caption = 'Feed Type:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object lAmountPrice: TcxLabel
      Left = 29
      Top = 146
      Caption = 'Amount/Price:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object lEndAllocDate: TcxLabel
      Left = 29
      Top = 186
      Caption = 'End Allocation:'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object teFeedType: TcxTextEdit
      Left = 156
      Top = 106
      Properties.Alignment.Vert = taVCenter
      Properties.ReadOnly = True
      Style.Color = clGrayText
      TabOrder = 3
      Width = 139
    end
    object dAllocDate: TcxDateEdit
      Left = 156
      Top = 26
      TabOrder = 6
      Width = 139
    end
    object dEndAllocDate: TcxDateEdit
      Left = 156
      Top = 186
      TabOrder = 7
      Width = 139
    end
    object ceAmount: TcxCurrencyEdit
      Left = 156
      Top = 146
      Properties.ReadOnly = True
      Style.Color = clGrayText
      TabOrder = 8
      Width = 67
    end
    object cePrice: TcxCurrencyEdit
      Left = 227
      Top = 146
      Properties.ReadOnly = True
      Style.Color = clGrayText
      TabOrder = 9
      Width = 67
    end
    object lcbFeedGroup: TcxLookupComboBox
      Left = 156
      Top = 68
      Properties.ListColumns = <>
      Properties.OnCloseUp = lcbFeedGroupPropertiesCloseUp
      TabOrder = 10
      Width = 139
    end
  end
  inherited ActionList: TActionList
    Left = 248
    Top = 8
    object actSave: TAction [1]
      Caption = 'Save'
      ImageIndex = 8
      OnExecute = actSaveExecute
    end
    object actCancel: TAction [2]
      Caption = 'Cancel'
      ImageIndex = 21
      OnExecute = actCancelExecute
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
            Item = lbSave
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = lbCancel
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
    Left = 278
    Top = 8
    DockControlHeights = (
      0
      0
      48
      0)
    object lbSave: TdxBarLargeButton
      Action = actSave
      Category = 0
      Height = 44
      Width = 55
    end
    object lbCancel: TdxBarLargeButton
      Action = actCancel
      Category = 0
      Height = 44
      Width = 55
    end
  end
end
