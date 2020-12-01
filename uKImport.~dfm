object fKImport: TfKImport
  Left = 207
  Top = 112
  Width = 1416
  Height = 747
  VertScrollBar.Visible = False
  Caption = 'fKImport'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object GetFile: TFilenameEdit
    Left = 752
    Top = 259
    Width = 25
    Height = 21
    DefaultExt = '.dat'
    Filter = 'Kingwood Import Files|*.dat'
    NumGlyphs = 1
    TabOrder = 0
    Visible = False
  end
  object pSalePanel: TPanel
    Left = 0
    Top = 48
    Width = 1408
    Height = 167
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object gbLoadSaleAnimals: TcxGroupBox
      Left = 0
      Top = -1
      Align = alBottom
      Caption = 'Step 1 - Load Animals'
      ParentFont = False
      Style.Edges = [bTop]
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Height = 85
      Width = 1408
      object Label1: TLabel
        Left = 14
        Top = 57
        Width = 157
        Height = 13
        Caption = 'Load animals from sales group'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label16: TLabel
        Left = 14
        Top = 19
        Width = 170
        Height = 13
        Caption = 'Load animals currently in the cart'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label17: TLabel
        Left = 14
        Top = 39
        Width = 16
        Height = 13
        Caption = 'OR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object lNoAnimalsInCart: TLabel
        Left = 234
        Top = 21
        Width = 349
        Height = 13
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object SalesGrp: TRxDBLookupCombo
        Left = 234
        Top = 49
        Width = 183
        Height = 21
        DropDownCount = 8
        DropDownWidth = 300
        EscapeClear = False
        DisplayEmpty = '<Add>'
        EmptyValue = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        LookupField = 'ID'
        LookupDisplay = 'Code; Description'
        LookupSource = dsSalesGrp
        ParentFont = False
        TabOrder = 1
        OnChange = SalesGrpChange
        OnCloseUp = SalesGrpCloseUp
        OnDropDown = SalesGrpDropDown
      end
      object btnLoadFromCart: TcxButton
        Left = 232
        Top = 21
        Width = 185
        Height = 25
        Caption = 'Load From Cart'
        Default = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBackground
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnLoadFromCartClick
        LookAndFeel.Kind = lfOffice11
      end
    end
    object gbSalesDetails: TcxGroupBox
      Left = 0
      Top = 84
      Align = alBottom
      Caption = 'Step 2 - Specify Default Sales Details'
      ParentFont = False
      Style.Edges = [bTop]
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Height = 83
      Width = 1408
      object Label2: TLabel
        Left = 14
        Top = 29
        Width = 48
        Height = 13
        Caption = 'Sale Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label3: TLabel
        Left = 14
        Top = 53
        Width = 49
        Height = 13
        Caption = 'Customer'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 433
        Top = 29
        Width = 24
        Height = 13
        Caption = 'Price'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 433
        Top = 51
        Width = 38
        Height = 13
        Caption = 'Weight'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 216
        Top = 51
        Width = 49
        Height = 13
        Caption = 'Comment'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 545
        Top = 29
        Width = 37
        Height = 13
        Caption = 'Lot No.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 216
        Top = 29
        Width = 61
        Height = 13
        Caption = 'Cull Reason'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object SaleDate: TDBDateEdit
        Left = 70
        Top = 26
        Width = 141
        Height = 21
        Hint = 'Sale Date'
        DataSource = dsCurrTableHeader
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 0
        YearDigits = dyFour
        OnChange = SaleDateChange
        OnExit = SaleDateExit
      end
      object Customer: TRxDBLookupCombo
        Left = 70
        Top = 50
        Width = 141
        Height = 21
        Hint = 'Purchasing Individual'
        DropDownCount = 8
        DropDownWidth = 200
        DisplayAllFields = True
        DataSource = dsCurrTableHeader
        DisplayEmpty = '<Add>'
        EmptyValue = '0'
        FieldsDelimiter = ' '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ListStyle = lsDelimited
        LookupField = 'ID'
        LookupDisplay = 'Name;BTEHerdNo'
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnCloseUp = CustomerCloseUp
      end
      object Weight: TDBEdit
        Left = 475
        Top = 50
        Width = 61
        Height = 21
        DataField = 'Weight'
        DataSource = dsCurrTableHeader
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnEnter = WeightEnter
        OnExit = PriceExit
      end
      object SaleComment: TDBEdit
        Left = 284
        Top = 50
        Width = 145
        Height = 21
        DataField = 'Comment'
        DataSource = dsCurrTableHeader
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnExit = PriceExit
      end
      object Price: TDBEdit
        Left = 475
        Top = 26
        Width = 61
        Height = 21
        DataField = 'Price'
        DataSource = dsCurrTableHeader
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnExit = PriceExit
      end
      object DBEdit2: TDBEdit
        Left = 588
        Top = 26
        Width = 61
        Height = 21
        DataField = 'LotNumber'
        DataSource = dsCurrTableHeader
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnExit = PriceExit
      end
      object rxcCulling: TRxDBLookupCombo
        Left = 284
        Top = 26
        Width = 145
        Height = 21
        DropDownCount = 8
        DropDownWidth = 300
        DataSource = dsCurrTableHeader
        DisplayEmpty = '<None>'
        EmptyValue = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        LookupField = 'ID'
        LookupDisplay = 'Description'
        ParentFont = False
        TabOrder = 2
        OnExit = rxcCullingExit
      end
    end
  end
  object pPurchPanel: TPanel
    Left = 0
    Top = 215
    Width = 1408
    Height = 253
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object gbDestinationHerd: TcxGroupBox
      Left = 0
      Top = 86
      Align = alTop
      Caption = 'Step 2 - Select Destination Herd'
      ParentFont = False
      Style.Edges = [bTop]
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.TextColor = clWindowText
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Height = 52
      Width = 1408
      object Label27: TLabel
        Left = 14
        Top = 23
        Width = 88
        Height = 13
        Caption = 'Destination Herd'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lcbHerdLookup: TRxDBLookupCombo
        Left = 234
        Top = 20
        Width = 183
        Height = 21
        DropDownCount = 8
        DropDownWidth = 300
        EscapeClear = False
        DataSource = dsCurrTableHeader
        DisplayEmpty = '<Select Herd>'
        EmptyValue = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Constraints.MaxHeight = 21
        LookupField = 'ID'
        LookupDisplay = 'HerdIdentity'
        ParentFont = False
        TabOrder = 0
      end
    end
    object gbPurchDetails: TcxGroupBox
      Left = 0
      Top = 138
      Align = alClient
      Caption = 'Step 3 - Specify Default Purchase Details'
      ParentFont = False
      Style.Edges = [bTop]
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.TextColor = clWindowText
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      Height = 115
      Width = 1408
      object Label6: TLabel
        Left = 14
        Top = 28
        Width = 73
        Height = 13
        Caption = 'Purchase Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 14
        Top = 59
        Width = 43
        Height = 13
        Caption = 'Supplier'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 14
        Top = 90
        Width = 29
        Height = 13
        Caption = 'Buyer'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 302
        Top = 90
        Width = 24
        Height = 13
        Caption = 'Price'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 435
        Top = 90
        Width = 38
        Height = 13
        Caption = 'Weight'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 558
        Top = 28
        Width = 37
        Height = 13
        Caption = 'Lot No.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label31: TLabel
        Left = 558
        Top = 59
        Width = 49
        Height = 13
        Caption = 'Comment'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 302
        Top = 22
        Width = 51
        Height = 31
        AutoSize = False
        Caption = 'Purchase Group'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object lBatchGroup: TLabel
        Left = 302
        Top = 56
        Width = 51
        Height = 31
        AutoSize = False
        Caption = 'Batch Group'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object PurchDate: TDBDateEdit
        Left = 105
        Top = 25
        Width = 179
        Height = 23
        Hint = 'Sale Date'
        DataSource = dsCurrTableHeader
        CheckOnExit = True
        DefaultToday = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Weekends = [Sun, Sat]
        WeekendColor = clBlue
        YearDigits = dyFour
        OnChange = SaleDateChange
        OnExit = SaleDateExit
      end
      object Supplier: TRxDBLookupCombo
        Left = 105
        Top = 56
        Width = 179
        Height = 21
        Hint = 'Place Purchased'
        DropDownCount = 8
        DataSource = dsCurrTableHeader
        DisplayEmpty = '<Add>'
        EmptyValue = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Constraints.MaxHeight = 21
        LookupField = 'ID'
        LookupDisplay = 'Name'
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnCloseUp = SupplierCloseUp
      end
      object Buyer: TRxDBLookupCombo
        Left = 105
        Top = 87
        Width = 179
        Height = 21
        Hint = 'Purchasing Individual'
        DropDownCount = 8
        DataSource = dsCurrTableHeader
        DisplayEmpty = '<Add>'
        EmptyValue = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Constraints.MaxHeight = 21
        LookupField = 'ID'
        LookupDisplay = 'Name'
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnCloseUp = BuyerCloseUp
      end
      object PurchPrice: TDBEdit
        Left = 361
        Top = 87
        Width = 66
        Height = 21
        DataField = 'Price'
        DataSource = dsCurrTableHeader
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnExit = PurchPriceExit
      end
      object PurchWeight: TDBEdit
        Left = 475
        Top = 87
        Width = 64
        Height = 21
        DataField = 'Weight'
        DataSource = dsCurrTableHeader
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnExit = PurchPriceExit
      end
      object DBEdit1: TDBEdit
        Left = 617
        Top = 25
        Width = 64
        Height = 21
        DataField = 'LotNumber'
        DataSource = dsCurrTableHeader
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnExit = PurchPriceExit
      end
      object PurchComment: TDBEdit
        Left = 617
        Top = 56
        Width = 179
        Height = 21
        DataField = 'Comment'
        DataSource = dsCurrTableHeader
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnExit = PurchPriceExit
      end
      object PurchGrp: TRxDBLookupCombo
        Left = 361
        Top = 27
        Width = 179
        Height = 21
        DropDownCount = 8
        DropDownWidth = 300
        EscapeClear = False
        DisplayEmpty = '<Add>'
        EmptyValue = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        LookupField = 'ID'
        LookupDisplay = 'Description'
        LookupSource = dsPurchGrp
        ParentFont = False
        TabOrder = 3
        OnChange = PurchGrpChange
        OnCloseUp = PurchGrpCloseUp
        OnDropDown = PurchGrpDropDown
      end
      object dblcBatchGroups: TRxDBLookupCombo
        Left = 361
        Top = 56
        Width = 179
        Height = 21
        DropDownCount = 8
        DropDownWidth = 300
        EscapeClear = False
        DisplayEmpty = '<Add>'
        EmptyValue = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        LookupField = 'ID'
        LookupDisplay = 'Description'
        LookupSource = dsBatchGroups
        ParentFont = False
        TabOrder = 8
        OnChange = dblcBatchGroupsChange
        OnCloseUp = dblcBatchGroupsCloseUp
        OnDropDown = dblcBatchGroupsDropDown
      end
    end
    object gbSelectPurchFile: TcxGroupBox
      Left = 0
      Top = 0
      Align = alTop
      Caption = 'Step 1 - Load Movements In File'
      ParentFont = False
      Style.Edges = [bTop]
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Height = 86
      Width = 1408
      object Label5: TLabel
        Left = 14
        Top = 24
        Width = 195
        Height = 13
        Caption = 'Select the Movements In file to import'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label13: TLabel
        Left = 14
        Top = 43
        Width = 16
        Height = 13
        Caption = 'OR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label20: TLabel
        Left = 13
        Top = 63
        Width = 170
        Height = 13
        Caption = 'Add animals manually to the grid'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object btnSelectPurchaseFile: TcxButton
        Left = 234
        Top = 19
        Width = 185
        Height = 25
        Caption = 'Select Movements In File'
        Default = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnSelectPurchaseFileClick
        LookAndFeel.Kind = lfOffice11
      end
      object btnPurchManually: TcxButton
        Left = 233
        Top = 58
        Width = 185
        Height = 25
        Caption = 'Purchase Animals Manually'
        Default = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnPurchManuallyClick
        LookAndFeel.Kind = lfOffice11
      end
    end
  end
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 696
    Width = 1408
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 250
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 300
      end
      item
        PanelStyleClassName = 'TdxStatusBarContainerPanelStyle'
        PanelStyle.Container = dxStatusBar1Container2
        Bevel = dxpbNone
      end>
    LookAndFeel.Kind = lfStandard
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    object dxStatusBar1Container2: TdxStatusBarContainerControl
      Left = 558
      Top = 2
      Width = 850
      Height = 18
    end
  end
  object pComplete: TPanel
    Left = 0
    Top = 619
    Width = 1408
    Height = 77
    Align = alBottom
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 4
    object gbCompleteTrans: TcxGroupBox
      Left = 0
      Top = 0
      Align = alClient
      Caption = 'Step 5 - Complete'
      ParentFont = False
      Style.Edges = [bTop]
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfFlat
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 0
      Height = 77
      Width = 1408
      object btnUpdateTables: TcxButton
        Left = 14
        Top = 31
        Width = 225
        Height = 31
        Caption = '&Update Herd Register'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnUpdateTablesClick
        LookAndFeel.Kind = lfOffice11
      end
      object btnCreateSales: TcxButton
        Left = 25
        Top = 31
        Width = 230
        Height = 31
        Caption = '&Update Register/Create File'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnCreateSalesClick
        LookAndFeel.Kind = lfOffice11
      end
    end
  end
  object gbReview: TcxGroupBox
    Left = 0
    Top = 468
    TabStop = True
    Align = alClient
    Caption = 'Step 4 - Review/Edit'
    ParentFont = False
    Style.Edges = [bTop, bBottom]
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = False
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 3
    Height = 151
    Width = 1408
    object AnimalGrid: TDBGridEh
      Left = 100
      Top = 74
      Width = 63
      Height = 39
      Hint = 'Double Click on grid to modify sales information'
      TabStop = False
      DataSource = dsCurrTableData
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = ANSI_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = 'Verdana'
      FooterFont.Style = []
      FrozenCols = 2
      HorzScrollBar.Tracking = True
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
      ParentFont = False
      PopupMenu = PopupMenu2
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      UseMultiTitle = True
      VertScrollBar.Tracking = True
      Visible = False
      VTitleMargin = 0
      OnDblClick = AnimalGridDblClick
      Columns = <
        item
          EditButtons = <>
          FieldName = 'NatIDNum'
          Footers = <>
          Title.Alignment = taLeftJustify
          Title.Caption = 'Nat Id. No.'
          Width = 131
        end
        item
          EditButtons = <>
          FieldName = 'AnimalNo'
          Footers = <>
          Title.Alignment = taLeftJustify
          Title.Caption = 'Animal No.'
          Width = 71
        end
        item
          EditButtons = <>
          FieldName = 'DateOfBirth'
          Footers = <>
          Title.Alignment = taLeftJustify
          Title.Caption = 'Date Of Birth'
          Width = 72
        end
        item
          EditButtons = <>
          FieldName = 'Sex'
          Footers = <>
          PickList.Strings = (
            '')
          Width = 56
        end
        item
          Alignment = taRightJustify
          EditButtons = <>
          FieldName = 'Price'
          Footers = <>
          Width = 62
        end
        item
          Alignment = taRightJustify
          DisplayFormat = '#.##'
          EditButtons = <>
          FieldName = 'Weight'
          Footers = <>
          Title.Caption = 'Weight (Kgs)'
          Width = 67
        end
        item
          EditButtons = <>
          FieldName = 'LotNumber'
          Footers = <>
          Title.Caption = 'Lot Number'
          Width = 66
        end
        item
          EditButtons = <>
          FieldName = 'Comment'
          Footers = <>
          Title.Alignment = taLeftJustify
          Width = 165
        end
        item
          EditButtons = <>
          FieldName = 'BreedCode'
          Footers = <>
          Title.Caption = 'Code | Breed'
          Width = 37
        end
        item
          EditButtons = <>
          FieldName = 'ColourCode'
          Footers = <>
          Title.Caption = 'Code | Colour'
          Width = 41
        end
        item
          EditButtons = <>
          FieldName = 'TBTestDate'
          Footers = <>
          Title.Caption = 'Test Dates | TB '
          Width = 71
        end
        item
          EditButtons = <>
          FieldName = 'BruceDate'
          Footers = <>
          Title.Caption = 'Test Dates | Brucellosis'
          Width = 71
        end
        item
          Alignment = taCenter
          EditButtons = <>
          FieldName = 'LactNo'
          Footers = <>
          Title.Caption = 'Lact No.'
          Width = 44
        end
        item
          EditButtons = <>
          FieldName = 'Name'
          Footers = <>
          Width = 72
        end
        item
          EditButtons = <>
          FieldName = 'DamIDNum'
          Footers = <>
          Title.Caption = 'Dam Nat Id. No.'
          Width = 107
        end
        item
          EditButtons = <>
          FieldName = 'SireIDNum'
          Footers = <>
          Title.Caption = 'Sire Nat Id. No.'
          Width = 106
        end>
    end
    object Panel1: TPanel
      Left = 2
      Top = 117
      Width = 1404
      Height = 32
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      TabStop = True
      object lTotal: TLabel
        Left = 369
        Top = 8
        Width = 28
        Height = 13
        Caption = 'Total:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object pbProgBar: TProgressBar
        Left = 632
        Top = 2
        Width = 167
        Height = 28
        Min = 0
        Max = 100
        Smooth = True
        TabOrder = 2
        Visible = False
      end
      object btnReviewData: TcxButton
        Left = 202
        Top = 1
        Width = 159
        Height = 31
        Caption = 'Review Detailed Data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnReviewDataClick
        LookAndFeel.NativeStyle = True
      end
      object cxDBNavigator1: TcxDBNavigator
        Left = 14
        Top = 1
        Width = 180
        Height = 31
        Buttons.PriorPage.Visible = False
        Buttons.Prior.Visible = True
        Buttons.NextPage.Visible = False
        Buttons.Insert.Visible = False
        Buttons.Delete.Visible = False
        Buttons.Edit.Visible = False
        Buttons.Post.Visible = False
        Buttons.Cancel.Visible = False
        Buttons.Refresh.Visible = False
        Buttons.SaveBookmark.Visible = False
        Buttons.GotoBookmark.Visible = False
        Buttons.Filter.Visible = False
        DataSource = dsCurrTableData
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        TabOrder = 0
      end
    end
    object AnimalDataGrid: TcxGrid
      Left = 2
      Top = 53
      Width = 1404
      Height = 64
      Hint = 'Double click the grid to modify individual animal information'
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      LookAndFeel.Kind = lfFlat
      object AnimalDataGridDBTableView: TcxGridDBTableView
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
        DataController.DataSource = dsCurrTableData
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.DataRowHeight = 22
        OptionsView.GridLines = glHorizontal
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        OptionsView.IndicatorWidth = 15
        object AnimalDataGridDBTableViewNatIDNo: TcxGridDBColumn
          Caption = 'Nat. Id. No.'
        end
        object AnimalDataGridDBTableViewAnimalNo: TcxGridDBColumn
          Caption = 'Animal No.'
        end
        object AnimalDataGridDBTableViewDOB: TcxGridDBColumn
          Caption = 'Date of Birth'
        end
        object AnimalDataGridDBTableViewSex: TcxGridDBColumn
          Caption = 'Sex'
        end
        object AnimalDataGridDBTableViewPrice: TcxGridDBColumn
          Caption = 'Price'
        end
        object AnimalDataGridDBTableViewWeight: TcxGridDBColumn
          Caption = 'Weight (Kgs)'
        end
        object AnimalDataGridDBTableViewLotNo: TcxGridDBColumn
          Caption = 'Lot Number'
        end
        object AnimalDataGridDBTableViewComment: TcxGridDBColumn
          Caption = 'Comment'
        end
      end
      object AnimalDataGridDBBandedTableView: TcxGridDBBandedTableView
        OnDblClick = AnimalDataGridDBBandedTableViewDblClick
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
        DataController.DataSource = dsCurrTableData
        DataController.KeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsCustomize.ColumnHidingOnGrouping = False
        OptionsCustomize.ColumnSorting = False
        OptionsCustomize.BandMoving = False
        OptionsCustomize.BandSizing = False
        OptionsCustomize.ColumnVertSizing = False
        OptionsCustomize.NestedBands = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsView.DataRowHeight = 22
        OptionsView.GroupByBox = False
        OptionsView.HeaderHeight = 34
        OptionsView.Indicator = True
        OptionsView.IndicatorWidth = 15
        OptionsView.BandHeaderHeight = 32
        OptionsView.BandHeaderLineCount = 2
        OptionsView.BandHeaders = False
        Bands = <
          item
          end>
        object AnimalDataGridDBBandedTableViewID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'ID'
          Visible = False
          HeaderAlignmentVert = vaCenter
          Hidden = True
          Options.ShowEditButtons = isebNever
          Position.BandIndex = 0
          Position.ColIndex = 0
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewAID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'AID'
          Visible = False
          HeaderAlignmentVert = vaCenter
          Hidden = True
          Position.BandIndex = 0
          Position.ColIndex = 1
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewAnimalNo: TcxGridDBBandedColumn
          Caption = 'Animal No.'
          DataBinding.FieldName = 'AnimalNo'
          HeaderAlignmentVert = vaCenter
          Options.ShowEditButtons = isebAlways
          Width = 80
          Position.BandIndex = 0
          Position.ColIndex = 2
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewSortAnimalNo: TcxGridDBBandedColumn
          DataBinding.FieldName = 'SortAnimalNo'
          Visible = False
          HeaderAlignmentVert = vaCenter
          Hidden = True
          Position.BandIndex = 0
          Position.ColIndex = 3
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewNatIDNum: TcxGridDBBandedColumn
          Caption = 'Nat. Id. No.'
          DataBinding.FieldName = 'NatIDNum'
          HeaderAlignmentVert = vaCenter
          Width = 120
          Position.BandIndex = 0
          Position.ColIndex = 4
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewSortNatID: TcxGridDBBandedColumn
          DataBinding.FieldName = 'SortNatID'
          Visible = False
          HeaderAlignmentVert = vaCenter
          Hidden = True
          Position.BandIndex = 0
          Position.ColIndex = 5
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewDateOfBirth: TcxGridDBBandedColumn
          Caption = 'Date of Birth'
          DataBinding.FieldName = 'DateOfBirth'
          HeaderAlignmentVert = vaCenter
          Width = 83
          Position.BandIndex = 0
          Position.ColIndex = 6
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewSex: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Sex'
          HeaderAlignmentVert = vaCenter
          Position.BandIndex = 0
          Position.ColIndex = 7
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewBreedCode: TcxGridDBBandedColumn
          Caption = 'Breed'
          DataBinding.FieldName = 'BreedCode'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.Alignment.Vert = taVCenter
          Properties.DropDownListStyle = lsFixedList
          Properties.DropDownWidth = 200
          Properties.KeyFieldNames = 'Code'
          Properties.ListColumns = <
            item
              FieldName = 'Code'
            end
            item
              FieldName = 'Name'
            end>
          HeaderAlignmentVert = vaCenter
          Width = 40
          Position.BandIndex = 0
          Position.ColIndex = 8
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewPurchaseGroup: TcxGridDBBandedColumn
          Caption = 'Purch. Group'
          DataBinding.FieldName = 'PurchaseGroup'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.DropDownListStyle = lsFixedList
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'Description'
            end>
          Properties.ListSource = dsPurchGrp
          Visible = False
          HeaderAlignmentVert = vaCenter
          Width = 148
          Position.BandIndex = 0
          Position.ColIndex = 24
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewBatchGroup: TcxGridDBBandedColumn
          Caption = 'Batch Group'
          DataBinding.FieldName = 'BatchGroup'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.DropDownListStyle = lsFixedList
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'Description'
            end>
          Properties.ListSource = dsBatchGroups
          Visible = False
          HeaderAlignmentVert = vaCenter
          Width = 148
          Position.BandIndex = 0
          Position.ColIndex = 25
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewLactNo: TcxGridDBBandedColumn
          Caption = 'Lact. No.'
          DataBinding.FieldName = 'LactNo'
          HeaderAlignmentVert = vaCenter
          Width = 62
          Position.BandIndex = 0
          Position.ColIndex = 19
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewName: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Name'
          Visible = False
          HeaderAlignmentVert = vaCenter
          Width = 147
          Position.BandIndex = 0
          Position.ColIndex = 20
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewHerdBookNo: TcxGridDBBandedColumn
          Caption = 'Herdbook No.'
          DataBinding.FieldName = 'HerdBookNo'
          Visible = False
          HeaderAlignmentVert = vaCenter
          Width = 110
          Position.BandIndex = 0
          Position.ColIndex = 18
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewColourCode: TcxGridDBBandedColumn
          Caption = 'Colour'
          DataBinding.FieldName = 'ColourCode'
          HeaderAlignmentVert = vaCenter
          Width = 134
          Position.BandIndex = 0
          Position.ColIndex = 9
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewBreeding: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Breeding'
          HeaderAlignmentVert = vaCenter
          Width = 67
          Position.BandIndex = 0
          Position.ColIndex = 10
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewTBTestDate: TcxGridDBBandedColumn
          Caption = 'T.B. Test Date'
          DataBinding.FieldName = 'TBTestDate'
          Visible = False
          HeaderAlignmentVert = vaCenter
          Width = 89
          Position.BandIndex = 0
          Position.ColIndex = 11
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewBruceDate: TcxGridDBBandedColumn
          Caption = 'Brucellosis Date'
          DataBinding.FieldName = 'BruceDate'
          Visible = False
          HeaderAlignmentVert = vaCenter
          Width = 101
          Position.BandIndex = 0
          Position.ColIndex = 12
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewA1A2Result: TcxGridDBBandedColumn
          Caption = 'A1A2'
          DataBinding.FieldName = 'A1A2Result'
          HeaderAlignmentVert = vaCenter
          Width = 80
          Position.BandIndex = 0
          Position.ColIndex = 26
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewDamIDNum: TcxGridDBBandedColumn
          Caption = 'Dam Nat. Id. No.'
          DataBinding.FieldName = 'DamIDNum'
          Visible = False
          HeaderAlignmentVert = vaCenter
          Width = 120
          Position.BandIndex = 0
          Position.ColIndex = 21
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewSireIDNum: TcxGridDBBandedColumn
          Caption = 'Sire Nat. Id. No'
          DataBinding.FieldName = 'SireIDNum'
          Visible = False
          HeaderAlignmentVert = vaCenter
          Width = 120
          Position.BandIndex = 0
          Position.ColIndex = 22
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewStillOffFarm: TcxGridDBBandedColumn
          Caption = 'Still Off Farm'
          DataBinding.FieldName = 'StillOffFarm'
          HeaderAlignmentVert = vaCenter
          HeaderGlyphAlignmentHorz = taCenter
          Width = 80
          Position.BandIndex = 0
          Position.ColIndex = 23
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewPrice: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Price'
          HeaderAlignmentVert = vaCenter
          Width = 55
          Position.BandIndex = 0
          Position.ColIndex = 13
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewWeight: TcxGridDBBandedColumn
          Caption = 'Weight (Kgs)'
          DataBinding.FieldName = 'Weight'
          HeaderAlignmentVert = vaCenter
          Width = 81
          Position.BandIndex = 0
          Position.ColIndex = 14
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewGrade: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Grade'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.Alignment.Horz = taRightJustify
          Properties.Alignment.Vert = taVCenter
          HeaderAlignmentVert = vaCenter
          Width = 55
          Position.BandIndex = 0
          Position.ColIndex = 15
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewLotNumber: TcxGridDBBandedColumn
          Caption = 'Lot No.'
          DataBinding.FieldName = 'LotNumber'
          HeaderAlignmentVert = vaCenter
          Width = 75
          Position.BandIndex = 0
          Position.ColIndex = 16
          Position.RowIndex = 0
        end
        object AnimalDataGridDBBandedTableViewComment: TcxGridDBBandedColumn
          DataBinding.FieldName = 'Comment'
          HeaderAlignmentVert = vaCenter
          Width = 120
          Position.BandIndex = 0
          Position.ColIndex = 17
          Position.RowIndex = 0
        end
      end
      object AnimalDataGridLevel: TcxGridLevel
        GridView = AnimalDataGridDBBandedTableView
      end
    end
    object pTableControl: TPanel
      Left = 2
      Top = 20
      Width = 1404
      Height = 33
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object btnAddAnimal: TcxButton
        Left = 14
        Top = -1
        Width = 78
        Height = 34
        Hint = 'Add Record'
        Caption = 'Add'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        OnClick = btnAddAnimalClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000230B0000230B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0FA5280F
          A5280FA5280FA528FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF0FA5287EE09E51CD830FA528FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0FA5287E
          E09E38C2730FA528FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF0FA5287EE09E38C2730FA528FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0FA5287E
          E09E38C2730FA528FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0FA528
          0FA5280FA5280FA5280FA5280FA5287EE09E38C2730FA5280FA5280FA5280FA5
          280FA5280FA528FF00FFFF00FF0FA5287EE09E38C27338C27338C27338C27338
          C27338C27338C27338C27338C27338C27351CD830FA528FF00FFFF00FF0FA528
          5FD38B5FD38B5FD38B5FD38B5FD38B51CD8338C2735FD38B5FD38B5FD38B5FD3
          8B5FD38B0FA528FF00FFFF00FF0FA5280FA5280FA5280FA5280FA5280FA5287E
          E09E38C2730FA5280FA5280FA5280FA5280FA5280FA528FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF0FA5287EE09E38C2730FA528FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0FA5287E
          E09E38C2730FA528FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF0FA5287EE09E38C2730FA528FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0FA52851
          CD835FD38B0FA528FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF0FA5280FA5280FA5280FA528FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        LookAndFeel.NativeStyle = True
      end
      object btnDeleteAnimal: TcxButton
        Left = 95
        Top = -1
        Width = 78
        Height = 34
        Hint = 'Delete Record'
        Caption = 'Delete'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnDeleteAnimalClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000320B0000320B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FF002EE41B48FBFF00FF1B48FB002EE4FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FF002EE41B48FBFF00FFFF00FF1B48FB
          3E5EFF002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF002E
          E41B48FBFF00FFFF00FFFF00FF1B48FB1B48FB3E5EFF002EE4FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF002EE41B48FBFF00FFFF00FFFF00FFFF00FFFF00FF
          3E5EFF1B48FB3E5EFF002EE4FF00FFFF00FFFF00FFFF00FF002EE41B48FBFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB3E5EFF002EE4FF
          00FFFF00FF002EE4002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF1B48FB3E5EFF002EE4002EE4002EE4FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB1B
          48FB1B48FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF1B48FB3E5EFF1B48FB3E5EFF002EE4FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB3E5EFF002EE4FF
          00FFFF00FF1B48FB002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF1B48FB3E5EFF002EE4FF00FFFF00FFFF00FFFF00FF1B48FB002EE4FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB3E5EFF002EE4FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF1B48FB002EE4FF00FFFF00FFFF00FFFF00FF1B48FB
          6482FF002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FF002EE4FF00FFFF00FF1B48FB6482FF002EE4FF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB1B48FB
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        LookAndFeel.NativeStyle = True
      end
    end
  end
  object qPurchGrp: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * From "Grps.db"'
      'Where (GroupType = "Purchase")'
      'Order By Code ASC')
    Left = 735
    Top = 5
  end
  object CurrTableHeader: TTable
    OnNewRecord = CurrTableHeaderNewRecord
    DatabaseName = 'Kingswd'
    Left = 766
    Top = 97
  end
  object CurrTableData: TTable
    OnNewRecord = CurrTableDataNewRecord
    DatabaseName = 'Kingswd'
    Left = 705
    Top = 5
  end
  object dsCurrTableHeader: TDataSource
    DataSet = CurrTableHeader
    Left = 735
    Top = 66
  end
  object dsCurrTableData: TDataSource
    DataSet = CurrTableData
    Left = 735
    Top = 97
  end
  object qSalesGrp: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * From "Grps.db"'
      'Where (GroupType = "Sales")'
      'Order By Code ASC')
    Left = 735
    Top = 35
  end
  object dsSalesGrp: TDataSource
    DataSet = qSalesGrp
    Left = 704
    Top = 97
  end
  object dsPurchGrp: TDataSource
    DataSet = qPurchGrp
    Left = 797
    Top = 66
  end
  object qExistingNo: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select ID from Animals where Upper(AnimalNo) = :AnimalNum'
      'AND HerdID = :HerdID')
    Left = 705
    Top = 35
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AnimalNum'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HerdID'
        ParamType = ptUnknown
      end>
  end
  object PopupMenu1: TPopupMenu
    MenuAnimation = [maLeftToRight]
    Left = 766
    Top = 66
    object DuplicateAnimalsNumbers1: TMenuItem
      Caption = 'Duplicate Animals Numbers'
      object ModifyAnimalNumber1: TMenuItem
        Caption = 'Modify'
        Checked = True
        GroupIndex = 1
        OnClick = ModifyAnimalNumber1Click
      end
      object IgnoreAnimalNumber1: TMenuItem
        Caption = 'Ignore'
        GroupIndex = 1
        RadioItem = True
        OnClick = ModifyAnimalNumber1Click
      end
    end
    object N1: TMenuItem
      Caption = '-'
      GroupIndex = 1
    end
    object Include1: TMenuItem
      Caption = 'Include'
      GroupIndex = 1
      object IncludePremiumStatus: TMenuItem
        Caption = 'Premium Status'
        Checked = True
        GroupIndex = 1
        OnClick = IncludePremiumStatusClick
      end
      object CreatePurchaseEvents: TMenuItem
        Caption = 'Purchase Events'
        Checked = True
        GroupIndex = 1
        OnClick = CreatePurchaseEventsClick
      end
      object IncludeAncestorAnimals: TMenuItem
        Caption = 'Ancestor Animals'
        Checked = True
        GroupIndex = 1
        OnClick = IncludeAncestorAnimalsClick
      end
    end
  end
  object PrintGrid: TPrintDBGridEh
    Options = [pghFitGridToPageWidth, pghColored, pghOptimalColWidths]
    Page.BottomMargin = 1
    Page.LeftMargin = 1
    Page.RightMargin = 1
    Page.TopMargin = 1
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'MS Sans Serif'
    PageHeader.Font.Style = []
    PrintFontName = 'Arial'
    Units = MM
    Left = 704
    Top = 66
  end
  object PopupMenu2: TPopupMenu
    Left = 796
    Top = 97
    object PrintGrid1: TMenuItem
      Caption = 'Preview / Print Grid'
      OnClick = PrintGrid1Click
    end
  end
  object UpdateAnimalNumber: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Update Animals '
      'Set AnimalNo = :AAnimalNo '
      'Where ID = :AID')
    Left = 766
    Top = 35
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AAnimalNo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'AID'
        ParamType = ptUnknown
      end>
  end
  object BarManager: TdxBarManager
    AllowReset = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'Custom 1'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 604
        FloatTop = 357
        FloatClientWidth = 23
        FloatClientHeight = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemLinks = <
          item
            Item = blbExit
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbAccounts
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbOptions
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbHelp
            Visible = True
          end>
        Name = 'Custom 1'
        NotDocking = [dsNone]
        OneOnRow = True
        RotateWhenVertical = False
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = True
        UseRestSpace = True
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    HotImages = ImageStore.ImageList16x16
    Images = ImageStore.ImageList16x16
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 796
    Top = 35
    DockControlHeights = (
      0
      0
      48
      0)
    object blbExit: TdxBarLargeButton
      Action = actExit
      Category = 0
      Height = 44
      HotImageIndex = 0
      Width = 55
      SyncImageIndex = False
      ImageIndex = 0
    end
    object blbAccounts: TdxBarLargeButton
      Action = actAccounts
      Category = 0
      Height = 44
      HotImageIndex = 31
      Width = 85
      SyncImageIndex = False
      ImageIndex = 31
    end
    object blbOptions: TdxBarLargeButton
      Caption = 'Options'
      Category = 0
      Hint = 'Options'
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = pmOptions
      Height = 44
      HotImageIndex = 26
      Width = 55
      SyncImageIndex = False
      ImageIndex = 26
    end
    object blbHelp: TdxBarLargeButton
      Action = actHelp
      Category = 0
      Height = 44
      HotImageIndex = 7
      Width = 55
      SyncImageIndex = False
      ImageIndex = 7
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'Duplicate Animal Numbers'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = bbModifyAnimalNumber
          Visible = True
        end
        item
          Item = bbIgnoreAnimalNumber
          Visible = True
        end
        item
          Item = bbRenumberExistingAnimal
          Visible = True
        end>
    end
    object dxBarButton1: TdxBarButton
      Caption = 'Create Purchase Events'
      Category = 0
      Hint = 'Create Purchase Events'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
    end
    object bbIgnoreAnimalNumber: TdxBarButton
      Caption = 'Reset (New Animal No. will be left empty)'
      Category = 0
      Hint = 'Reset (New Animal No. will be left empty)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      GroupIndex = 1
      OnClick = bbIgnoreAnimalNumberClick
    end
    object bbModifyAnimalNumber: TdxBarButton
      Caption = 'Modify Animal No.'
      Category = 0
      Hint = 'Modify Animal No.'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = bbModifyAnimalNumberClick
    end
    object dxBarButton4: TdxBarButton
      Caption = 'Ignore Ancestor Animals'
      Category = 0
      Hint = 'Ignore Ancestor Animals'
      Visible = ivNever
      ButtonStyle = bsChecked
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Height = 28
    end
    object bbImportAsOldFormat: TdxBarButton
      Caption = 'Use Old Format'
      Category = 0
      Hint = 'Use Old Format'
      Visible = ivAlways
      ButtonStyle = bsChecked
      OnClick = bbImportAsOldFormatClick
    end
    object bbIgnoreEventMessages: TdxBarButton
      Caption = 'Ignore Event Messages'
      Category = 0
      Hint = 'Ignore Event Messages'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = bbIgnoreEventMessagesClick
    end
    object bbRenumberExistingAnimal: TdxBarButton
      Caption = 'Reset (Existing Animal No. will be left empty)'
      Category = 0
      Hint = 'Reset (Existing Animal No. will be left empty)'
      Visible = ivAlways
      ButtonStyle = bsChecked
      Down = True
      OnClick = bbRenumberExistingAnimalClick
    end
  end
  object ActionList: TActionList
    Left = 796
    Top = 5
    object actExit: TAction
      Caption = 'Exit'
      OnExecute = actExitExecute
    end
    object actAccounts: TAction
      Caption = 'Accounts'
      OnExecute = actAccountsExecute
    end
    object actHelp: TAction
      Caption = 'Help'
      OnExecute = actHelpExecute
    end
  end
  object pmOptions: TdxBarPopupMenu
    BarManager = BarManager
    ItemLinks = <
      item
        Item = bbImportAsOldFormat
        Visible = True
      end
      item
        BeginGroup = True
        Item = bbIgnoreEventMessages
        Visible = True
      end
      item
        Item = dxBarSubItem1
        Visible = True
      end
      item
        Item = dxBarButton1
        Visible = True
      end
      item
        Item = dxBarButton4
        Visible = True
      end>
    UseOwnFont = False
    Left = 766
    Top = 5
  end
  object OpenDialog: TOpenDialog
    Filter = 'XML File|*.xml'
    FilterIndex = 0
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 418
    Top = 316
  end
  object dsBatchGroups: TDataSource
    DataSet = qBatchGroups
    Left = 828
    Top = 8
  end
  object qBatchGroups: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * From "Grps.db"'
      'Where (GroupType = "Batch")'
      'Order By Code ASC')
    Left = 828
    Top = 37
  end
  object qClearTransponderNo: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Update Animals '
      'Set TransponderNo = '#39#39
      'Where ID = :AID')
    Left = 830
    Top = 67
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AID'
        ParamType = ptUnknown
      end>
  end
end
