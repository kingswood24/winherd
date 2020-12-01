inherited fmChangeCustomerSupplierNames: TfmChangeCustomerSupplierNames
  Left = 560
  Top = 216
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'fmChangeCustomerSupplierNames'
  ClientHeight = 549
  ClientWidth = 585
  Font.Height = -16
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 21
  inherited StatusBar: TdxStatusBar
    Top = 529
    Width = 585
  end
  object pInfo: TPanel [1]
    Left = 0
    Top = 49
    Width = 585
    Height = 54
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    object lInfo: TcxLabel
      Left = 0
      Top = 0
      Align = alClient
      Caption = 
        'Select either Customer or Supplier to view the list of customers' +
        '/suppliers.'#13#10'Enter in new customer/supplier name and click Save ' +
        'to update the name'
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
    end
  end
  object CustomerSupplierGrid: TcxGrid [2]
    Left = 0
    Top = 141
    Width = 585
    Height = 388
    Align = alBottom
    TabOrder = 6
    LookAndFeel.Kind = lfFlat
    object CustomerSupplierGridDBTableView: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 35
      OptionsView.Indicator = True
      object CustomerSupplierGridDBTableViewExistingName: TcxGridColumn
        Caption = 'Existing Name'
        DataBinding.FieldName = 'OldName'
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 270
      end
      object CustomerSupplierGridDBTableViewNewName: TcxGridColumn
        Caption = 'New Name'
        DataBinding.FieldName = 'NewName'
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 270
      end
    end
    object CustomerSupplierGridLevel: TcxGridLevel
      GridView = CustomerSupplierGridDBTableView
    end
  end
  object pCustomerSupplier: TPanel [3]
    Left = 0
    Top = 103
    Width = 585
    Height = 38
    Align = alClient
    BevelOuter = bvSpace
    TabOrder = 7
    object rbCustomer: TcxRadioButton
      Left = 101
      Top = 7
      Width = 105
      Height = 25
      Anchors = [akTop, akBottom]
      Caption = 'Customer'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = rbCustomerClick
      LookAndFeel.Kind = lfFlat
    end
    object rbSupplier: TcxRadioButton
      Left = 388
      Top = 7
      Width = 105
      Height = 25
      Anchors = [akTop, akBottom]
      Caption = 'Supplier'
      TabOrder = 1
      OnClick = rbSupplierClick
      LookAndFeel.Kind = lfFlat
    end
  end
  inherited ActionList: TActionList
    Left = 255
    Top = 10
    object actSave: TAction
      Caption = 'Save'
      ImageIndex = 8
      OnExecute = actSaveExecute
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
            Item = dxblbSave
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
    Left = 225
    Top = 10
    DockControlHeights = (
      0
      0
      49
      0)
    object dxblbSave: TdxBarLargeButton
      Action = actSave
      Category = 0
      Height = 45
      Width = 65
    end
  end
end
