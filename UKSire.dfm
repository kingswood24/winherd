inherited fmBeefSalesCatalogue1: TfmBeefSalesCatalogue1
  Width = 792
  Height = 553
  Caption = 'fmBeefSalesCatalogue1'
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 497
    Width = 776
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = 'Total'
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 100
      end>
  end
  inherited GridCatalogueAnimals: TcxGrid
    Left = 0
    Top = 98
    Width = 776
    Height = 399
    Align = alClient
    TabOrder = 2
    inherited GridCatalogueAnimalsDBTableView: TcxGridDBTableView
      DataController.DataSource = dsQuerySires
      DataController.KeyFieldNames = 'HerdBookNo'
      inherited GridCatalogueAnimalsDBTableViewSelected: TcxGridDBColumn
        Visible = False
        Hidden = True
      end
      inherited GridCatalogueAnimalsDBTableViewSortAnimalNo: TcxGridDBColumn
        Visible = False
        Hidden = True
      end
      inherited GridCatalogueAnimalsDBTableViewSortNatID: TcxGridDBColumn
        Visible = False
        Hidden = True
      end
      inherited GridCatalogueAnimalsDBTableViewSex: TcxGridDBColumn
        Visible = False
        Hidden = True
      end
      inherited GridCatalogueAnimalsDBTableViewDateOfBirth: TcxGridDBColumn
        Visible = False
        Hidden = True
      end
      object GridCatalogueAnimalsDBTableViewBreedCode: TcxGridDBColumn
        DataBinding.FieldName = 'BreedCode'
        Width = 64
      end
      object GridCatalogueAnimalsDBTableViewDTRS: TcxGridDBColumn
        DataBinding.FieldName = 'DTRS'
      end
      object GridCatalogueAnimalsDBTableViewFatKG: TcxGridDBColumn
        DataBinding.FieldName = 'FatKG'
      end
      object GridCatalogueAnimalsDBTableViewFI: TcxGridDBColumn
        DataBinding.FieldName = 'FI'
      end
      object GridCatalogueAnimalsDBTableViewFIREL: TcxGridDBColumn
        DataBinding.FieldName = 'FIREL'
      end
      object GridCatalogueAnimalsDBTableViewHRDS: TcxGridDBColumn
        DataBinding.FieldName = 'HRDS'
      end
      object GridCatalogueAnimalsDBTableViewLacts: TcxGridDBColumn
        DataBinding.FieldName = 'Lacts'
      end
      object GridCatalogueAnimalsDBTableViewLegs: TcxGridDBColumn
        DataBinding.FieldName = 'Legs'
      end
      object GridCatalogueAnimalsDBTableViewLS: TcxGridDBColumn
        DataBinding.FieldName = 'LS'
      end
      object GridCatalogueAnimalsDBTableViewLSREL: TcxGridDBColumn
        DataBinding.FieldName = 'LSREL'
      end
      object GridCatalogueAnimalsDBTableViewPedigreeBreed: TcxGridDBColumn
        DataBinding.FieldName = 'PedigreeBreed'
      end
      object GridCatalogueAnimalsDBTableViewPercDTR2: TcxGridDBColumn
        DataBinding.FieldName = 'PercDTR2'
      end
      object GridCatalogueAnimalsDBTableViewPercDTRTop: TcxGridDBColumn
        DataBinding.FieldName = 'PercDTRTop'
      end
      object GridCatalogueAnimalsDBTableViewPercFAT: TcxGridDBColumn
        DataBinding.FieldName = 'PercFAT'
      end
      object GridCatalogueAnimalsDBTableViewPercProt: TcxGridDBColumn
        DataBinding.FieldName = 'PercProt'
      end
      object GridCatalogueAnimalsDBTableViewPercREL: TcxGridDBColumn
        DataBinding.FieldName = 'PercREL'
      end
      object GridCatalogueAnimalsDBTableViewPERS: TcxGridDBColumn
        DataBinding.FieldName = 'PERS'
      end
      object GridCatalogueAnimalsDBTableViewPin: TcxGridDBColumn
        DataBinding.FieldName = 'Pin'
      end
      object GridCatalogueAnimalsDBTableViewProtKG: TcxGridDBColumn
        DataBinding.FieldName = 'ProtKG'
      end
      object GridCatalogueAnimalsDBTableViewRESIND: TcxGridDBColumn
        DataBinding.FieldName = 'RESIND'
      end
      object GridCatalogueAnimalsDBTableViewSCC: TcxGridDBColumn
        DataBinding.FieldName = 'SCC'
      end
      object GridCatalogueAnimalsDBTableViewSCCREL: TcxGridDBColumn
        DataBinding.FieldName = 'SCCREL'
      end
      object GridCatalogueAnimalsDBTableViewType: TcxGridDBColumn
        DataBinding.FieldName = 'Type'
      end
      object GridCatalogueAnimalsDBTableViewTYPEREL: TcxGridDBColumn
        DataBinding.FieldName = 'TYPEREL'
      end
      object GridCatalogueAnimalsDBTableViewUdder: TcxGridDBColumn
        DataBinding.FieldName = 'Udder'
      end
    end
  end
  inherited cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 42
    Align = alTop
    TabOrder = 5
    Width = 776
    inherited cmboSearchColumns: TcxComboBox
      Width = 139
    end
    inherited cxLabel2: TcxLabel
      Left = 232
    end
    inherited teSearchText: TcxTextEdit
      Left = 301
    end
    inherited cxButton1: TcxButton
      Left = 511
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Left = 256
    Top = 48
    Visible = False
    Height = 19
    Width = 0
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
      42
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actAddSire
      Category = 0
      Width = 75
    end
  end
  inherited ActionList: TActionList
    object actAddSire: TAction
      Caption = 'Add Sire'
      ImageIndex = 9
    end
  end
  inherited dsCatalogueAnimals: TDataSource
    Left = 328
    Top = 180
  end
  inherited cxStyleRepository1: TcxStyleRepository
    Left = 16
    Top = 300
  end
  object QuerySires: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select  * from UKSires')
    Left = 686
    Top = 22
    object QuerySiresID: TIntegerField
      FieldName = 'ID'
      Origin = 'KINGSWD."UKSires.DB".ID'
    end
    object QuerySiresBreedCode: TStringField
      FieldName = 'BreedCode'
      Origin = 'KINGSWD."UKSires.DB".BreedCode'
      Size = 4
    end
    object QuerySiresName: TStringField
      FieldName = 'Name'
      Origin = 'KINGSWD."UKSires.DB".Name'
      Size = 40
    end
    object QuerySiresPedigreeBreed: TStringField
      FieldName = 'PedigreeBreed'
      Origin = 'KINGSWD."UKSires.DB".PedigreeBreed'
      Size = 2
    end
    object QuerySiresHerdBookNo: TStringField
      FieldName = 'HerdBookNo'
      Origin = 'KINGSWD."UKSires.DB".HerdBookNo'
    end
    object QuerySiresDTRS: TIntegerField
      FieldName = 'DTRS'
      Origin = 'KINGSWD."UKSires.DB".DTRS'
    end
    object QuerySiresHRDS: TStringField
      FieldName = 'HRDS'
      Origin = 'KINGSWD."UKSires.DB".HRDS'
      Size = 5
    end
    object QuerySiresPercDTRTop: TFloatField
      FieldName = 'PercDTRTop'
      Origin = 'KINGSWD."UKSires.DB".PercDTRTop'
    end
    object QuerySiresPercDTR2: TFloatField
      FieldName = 'PercDTR2'
      Origin = 'KINGSWD."UKSires.DB".PercDTR2'
    end
    object QuerySiresLacts: TStringField
      FieldName = 'Lacts'
      Origin = 'KINGSWD."UKSires.DB".Lacts'
      Size = 5
    end
    object QuerySiresPercREL: TFloatField
      FieldName = 'PercREL'
      Origin = 'KINGSWD."UKSires.DB".PercREL'
    end
    object QuerySiresMilkKG: TFloatField
      FieldName = 'MilkKG'
      Origin = 'KINGSWD."UKSires.DB".MilkKG'
    end
    object QuerySiresFatKG: TFloatField
      FieldName = 'FatKG'
      Origin = 'KINGSWD."UKSires.DB".FatKG'
    end
    object QuerySiresProtKG: TFloatField
      FieldName = 'ProtKG'
      Origin = 'KINGSWD."UKSires.DB".ProtKG'
    end
    object QuerySiresPercFAT: TFloatField
      FieldName = 'PercFAT'
      Origin = 'KINGSWD."UKSires.DB".PercFAT'
    end
    object QuerySiresPercProt: TFloatField
      FieldName = 'PercProt'
      Origin = 'KINGSWD."UKSires.DB".PercProt'
    end
    object QuerySiresPin: TStringField
      FieldName = 'Pin'
      Origin = 'KINGSWD."UKSires.DB".úPin'
      Size = 2
    end
    object QuerySiresSCCREL: TStringField
      FieldName = 'SCCREL'
      Origin = 'KINGSWD."UKSires.DB".SCCREL'
      Size = 2
    end
    object QuerySiresSCC: TStringField
      FieldName = 'SCC'
      Origin = 'KINGSWD."UKSires.DB".SCC'
      Size = 3
    end
    object QuerySiresLSREL: TStringField
      FieldName = 'LSREL'
      Origin = 'KINGSWD."UKSires.DB".LSREL'
      Size = 2
    end
    object QuerySiresLS: TFloatField
      FieldName = 'LS'
      Origin = 'KINGSWD."UKSires.DB".LS'
    end
    object QuerySiresFIREL: TStringField
      FieldName = 'FIREL'
      Origin = 'KINGSWD."UKSires.DB".FIREL'
      Size = 2
    end
    object QuerySiresFI: TFloatField
      FieldName = 'FI'
      Origin = 'KINGSWD."UKSires.DB".FI'
    end
    object QuerySiresPERS: TStringField
      FieldName = 'PERS'
      Origin = 'KINGSWD."UKSires.DB".PERS'
      Size = 2
    end
    object QuerySiresType: TFloatField
      FieldName = 'Type'
      Origin = 'KINGSWD."UKSires.DB".Type'
    end
    object QuerySiresRESIND: TStringField
      FieldName = 'RESIND'
      Origin = 'KINGSWD."UKSires.DB".RESIND'
      Size = 5
    end
    object QuerySiresTYPEREL: TStringField
      FieldName = 'TYPEREL'
      Origin = 'KINGSWD."UKSires.DB".TYPEREL'
      Size = 2
    end
    object QuerySiresLegs: TFloatField
      FieldName = 'Legs'
      Origin = 'KINGSWD."UKSires.DB".Legs'
    end
    object QuerySiresUdder: TFloatField
      FieldName = 'Udder'
      Origin = 'KINGSWD."UKSires.DB".Udder'
    end
  end
  object dsQuerySires: TDataSource
    DataSet = QuerySires
    Left = 686
    Top = 52
  end
end
