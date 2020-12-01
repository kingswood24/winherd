object fmCMMSPermits: TfmCMMSPermits
  Left = 222
  Top = 73
  Width = 1036
  Height = 744
  Caption = 'Movement Permit Forms'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object AnimalGrid: TDBGridEh
    Left = 0
    Top = 257
    Width = 1028
    Height = 434
    Hint = '<Ctrl> and <Delete> removes highlighted animal(s)'
    Align = alClient
    Anchors = [akTop, akBottom]
    DataSource = dsGetAnimals
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = ANSI_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = 'Verdana'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghRowHighlight]
    ParentFont = False
    PopupMenu = PopupMenu2
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    OnDblClick = AnimalGridDblClick
    OnGetCellParams = AnimalGridGetCellParams
    OnTitleClick = AnimalGridTitleClick
    Columns = <
      item
        Checkboxes = False
        EditButtons = <>
        FieldName = 'Selected'
        Font.Charset = SYMBOL_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Wingdings'
        Font.Style = []
        Footers = <>
        ReadOnly = True
        Title.Caption = 'ü'
        Title.Font.Charset = SYMBOL_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Wingdings'
        Title.Font.Style = []
      end
      item
        EditButtons = <>
        FieldName = 'NatIdNum'
        Footers = <>
        Title.Caption = ' National ID'
        Title.TitleButton = True
        Width = 179
      end
      item
        EditButtons = <>
        FieldName = 'AnimalNo'
        Footers = <>
        Title.Caption = 'Animal No/Code'
        Title.TitleButton = True
        Width = 126
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'Sex'
        Footers = <>
        Title.Alignment = taCenter
        Title.TitleButton = True
        Width = 121
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'DateOfBirth'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = 'Date Of Birth'
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Title.TitleButton = True
        Width = 121
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1028
    Height = 56
    ButtonHeight = 49
    ButtonWidth = 86
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    TabOrder = 1
    object ToolButton2: TToolButton
      Left = 0
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsDivider
    end
    object sbExit: TRxSpeedButton
      Left = 8
      Top = 2
      Width = 58
      Height = 49
      Hint = 'Click Here To Exit'
      Caption = 'E&xit'
      Flat = True
      NumGlyphs = 2
      OnClick = sbExitClick
    end
    object ToolButton6: TToolButton
      Left = 66
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 6
      Style = tbsDivider
    end
    object sbView: TRxSpeedButton
      Left = 74
      Top = 2
      Width = 85
      Height = 49
      Caption = '&View Form'
      Flat = True
      NumGlyphs = 2
      OnClick = sbViewClick
    end
    object sbPrint: TRxSpeedButton
      Tag = 1
      Left = 159
      Top = 2
      Width = 85
      Height = 49
      Caption = '&Print Form'
      Flat = True
      NumGlyphs = 2
      OnClick = sbViewClick
    end
    object ToolButton1: TToolButton
      Left = 244
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 5
      Style = tbsDivider
    end
    object sbOptions: TRxSpeedButton
      Left = 252
      Top = 2
      Width = 74
      Height = 49
      DropDownMenu = PopupMenu1
      Caption = 'Options'
      Flat = True
      NumGlyphs = 2
    end
    object ToolButton3: TToolButton
      Left = 326
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 5
      Style = tbsDivider
    end
    object Panel2: TPanel
      Left = 334
      Top = 2
      Width = 161
      Height = 49
      BevelOuter = bvNone
      TabOrder = 0
      object Label7: TLabel
        Left = 4
        Top = 2
        Width = 87
        Height = 16
        Caption = 'Herd &Identity'
      end
      object HerdCombo: TRxDBLookupCombo
        Left = 3
        Top = 19
        Width = 138
        Height = 23
        DropDownCount = 8
        DisplayEmpty = '<Select Herd>'
        EmptyValue = '0'
        LookupField = 'ID'
        LookupDisplay = 'HerdIdentity'
        LookupSource = WinData.dsHerdDefaults
        TabOrder = 0
        OnCloseUp = HerdComboCloseUp
      end
    end
    object ToolButton5: TToolButton
      Left = 495
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 4
      Style = tbsDivider
    end
    object sbHelp: TRxSpeedButton
      Left = 503
      Top = 2
      Width = 65
      Height = 49
      Caption = 'Help'
      Flat = True
      NumGlyphs = 2
      OnClick = sbHelpClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 56
    Width = 1028
    Height = 150
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object pNBAS31G: TPanel
      Left = 0
      Top = 78
      Width = 1028
      Height = 72
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      object lPrintCopies: TLabel
        Left = 13
        Top = 39
        Width = 110
        Height = 26
        Caption = 'Enter number of copies to print'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label1: TLabel
        Left = 13
        Top = 13
        Width = 118
        Height = 13
        Caption = 'Date of Movement'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 288
        Top = 13
        Width = 169
        Height = 13
        Alignment = taRightJustify
        Caption = 'Buyer/Destination Details'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object PrintCopies: TRxSpinEdit
        Left = 150
        Top = 44
        Width = 51
        Height = 22
        MaxValue = 3
        MinValue = 1
        Value = 3
        MaxLength = 1
        TabOrder = 0
      end
      object deMovementDate: TDateEdit
        Left = 150
        Top = 8
        Width = 121
        Height = 23
        NumGlyphs = 2
        TabOrder = 1
      end
      object BuyerDestDetails: TRxDBLookupCombo
        Left = 472
        Top = 8
        Width = 265
        Height = 23
        DropDownCount = 8
        DisplayEmpty = '<Add New>'
        EmptyValue = '0'
        LookupField = 'ID'
        LookupDisplay = 'Name'
        LookupSource = WinData.dsCustomers
        TabOrder = 2
        OnCloseUp = BuyerDestDetailsCloseUp
      end
    end
    object pNBAS31AB: TPanel
      Left = 0
      Top = 78
      Width = 1028
      Height = 72
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object lBuyerDestination: TLabel
        Left = 94
        Top = 15
        Width = 179
        Height = 16
        Alignment = taRightJustify
        Caption = 'Select Customer Holding'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Buyer: TRxDBLookupCombo
        Left = 287
        Top = 10
        Width = 298
        Height = 23
        DropDownCount = 8
        DisplayEmpty = '<Add>'
        EmptyValue = '0'
        LookupField = 'ID'
        LookupDisplay = 'Name'
        LookupSource = WinData.dsCustomers
        TabOrder = 0
        OnCloseUp = BuyerCloseUp
      end
    end
    object rgFormType: TRadioGroup
      Left = 0
      Top = 0
      Width = 1028
      Height = 78
      Align = alTop
      Caption = 'Select Form'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      Items.Strings = (
        
          'NBAS 31A (Sale and movement of cattle from a single holding to a' +
          'nother holding)'
        
          'NBAS 31B (Movement of cattle from a single holding to/ from anot' +
          'her holding for feeding)'
        
          'NBAS 31G (Onward movement of cattle from a registered dealers pr' +
          'emises)')
      ParentFont = False
      TabOrder = 0
      OnClick = SelectFormType
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 691
    Width = 1028
    Height = 19
    Panels = <
      item
        Width = 264
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object pGridInfo: TPanel
    Left = 0
    Top = 206
    Width = 1028
    Height = 51
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object Label3: TLabel
      Left = 11
      Top = 21
      Width = 606
      Height = 26
      Caption = 
        'Double click the animal record to add/remove the animal from the' +
        ' CMMS permit application. '#13#10'Click View/Print when all animals ar' +
        'e selected.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object GetAnimals: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      
        'Insert into CMMSAnimals(ID, NatIdNum, AnimalNo, Sex, DateOfBirth' +
        ', SortNatID, SortAnimalNo)'
      
        'Select Distinct A.ID, A.NatIdNum, A.AnimalNo, A.Sex, A.DateOfBir' +
        'th, A.SortNatID, A.SortAnimalNo'
      'From Animals A'
      'Where ( A.Inherd = True ) '
      'And (A.Animaldeleted=False)'
      'And (A.HerdID = :HID)'
      'And (A.ID in (Select F.AID From AFilters F))')
    Left = 606
    Top = 294
    ParamData = <
      item
        DataType = ftInteger
        Name = 'HID'
        ParamType = ptInput
      end>
  end
  object dsGetAnimals: TDataSource
    DataSet = CMMSAnimals
    Left = 642
    Top = 258
  end
  object Timer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerTimer
    Left = 606
    Top = 264
  end
  object CMMSAnimals: TTable
    AfterPost = CMMSAnimalsAfterPost
    DatabaseName = 'Kingswd'
    StoreDefs = True
    Left = 608
    Top = 417
    object CMMSAnimalsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object CMMSAnimalsNatIdNum: TStringField
      FieldName = 'NatIdNum'
    end
    object CMMSAnimalsAnimalNo: TStringField
      FieldName = 'AnimalNo'
      Size = 10
    end
    object CMMSAnimalsSex: TStringField
      FieldName = 'Sex'
      Size = 10
    end
    object CMMSAnimalsDateOfBirth: TDateField
      FieldName = 'DateOfBirth'
    end
    object CMMSAnimalsSortNatID: TStringField
      FieldName = 'SortNatID'
    end
    object CMMSAnimalsSortAnimalNo: TStringField
      FieldName = 'SortAnimalNo'
      Size = 10
    end
    object CMMSAnimalsSelected: TBooleanField
      FieldName = 'Selected'
      DisplayValues = 'ü;'
    end
  end
  object GenQuery: TQuery
    DatabaseName = 'Kingswd'
    Left = 608
    Top = 324
  end
  object PopupMenu1: TPopupMenu
    Left = 608
    Top = 358
    object SelectAll1: TMenuItem
      Caption = '&Select All'
      OnClick = SelectAll1Click
    end
    object DeselectAll1: TMenuItem
      Caption = '&Deselect All'
      OnClick = DeselectAll1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object VenNoAllocationUpdate1: TMenuItem
      Caption = 'Ven No. Allocation Update'
      OnClick = VenNoAllocationUpdate1Click
    end
  end
  object dsMoveTo: TDataSource
    DataSet = WinData.tMovedTo
    Left = 608
    Top = 387
  end
  object PopupMenu2: TPopupMenu
    Left = 152
    Top = 200
    object Select1: TMenuItem
      Caption = 'Add to Permit Application'
      OnClick = Select1Click
    end
    object Deselect1: TMenuItem
      Caption = 'Remove from Permit Application'
      OnClick = Deselect1Click
    end
  end
end
