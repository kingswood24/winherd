inherited fmBeefSalesCatalogue: TfmBeefSalesCatalogue
  Left = 492
  Top = 263
  Caption = 'Sales Catalogue'
  PixelsPerInch = 96
  TextHeight = 13
  inherited GridCatalogueAnimals: TcxGrid
    Left = 0
    Top = 157
    Width = 599
    Height = 275
    Align = alClient
    TabOrder = 4
    inherited GridCatalogueAnimalsDBTableView: TcxGridDBTableView
      OptionsData.Appending = True
      OptionsData.CancelOnExit = True
      OptionsData.Editing = True
      OptionsData.Inserting = True
    end
  end
  inherited cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 101
    Align = alTop
    Width = 599
  end
  inherited cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 48
    Align = alTop
    Width = 599
    inherited cbIncludeAnimalsLeftHerd: TcxCheckBox
      Left = 20
    end
  end
  object pFavourite: TPanel [4]
    Left = 102
    Top = 224
    Width = 213
    Height = 27
    BevelOuter = bvNone
    TabOrder = 8
    object cbFavourite: TcxCheckBox
      Left = 0
      Top = 3
      AutoSize = False
      Caption = 'Add Report As Favourite'
      Properties.OnChange = cbFavouritePropertiesChange
      TabOrder = 0
      Height = 23
      Width = 213
    end
  end
  inherited ActionList: TActionList
    inherited actView: TAction
      OnExecute = actViewExecute
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
            Item = dxBarControlContainerItem1
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
      48
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actView
      Category = 0
      Width = 65
    end
    object dxBarControlContainerItem1: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = pFavourite
    end
  end
end
