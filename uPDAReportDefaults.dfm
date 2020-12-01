object PDAReportDefaults: TPDAReportDefaults
  Left = 544
  Top = 200
  ActiveControl = btnUpdate
  BorderStyle = bsDialog
  Caption = 'PDALink Export Settings'
  ClientHeight = 467
  ClientWidth = 390
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 390
    Height = 53
    ButtonHeight = 45
    ButtonWidth = 86
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
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
      Height = 45
      Hint = 'Click Here To Exit'
      Caption = 'E&xit'
      Flat = True
      ModalResult = 1
      NumGlyphs = 2
      Transparent = True
    end
    object ToolButton1: TToolButton
      Left = 66
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 0
      Style = tbsDivider
    end
    object sbHelp: TRxSpeedButton
      Left = 74
      Top = 2
      Width = 58
      Height = 45
      Hint = 'Click Here To Exit'
      Caption = 'Help'
      Enabled = False
      Flat = True
      ModalResult = 1
      NumGlyphs = 2
      Transparent = True
    end
    object GroupBox1: TGroupBox
      Left = 132
      Top = 2
      Width = 185
      Height = 45
      Caption = 'Def Modules'
      Enabled = False
      TabOrder = 0
      Visible = False
      object CheckBox1: TCheckBox
        Left = 8
        Top = 16
        Width = 17
        Height = 17
        Caption = 'CheckBox1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 24
        Top = 16
        Width = 17
        Height = 17
        Caption = 'CheckBox1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = CheckBox2Click
      end
      object CheckBox3: TCheckBox
        Left = 40
        Top = 16
        Width = 17
        Height = 17
        Caption = 'CheckBox1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = CheckBox3Click
      end
      object CheckBox4: TCheckBox
        Left = 56
        Top = 16
        Width = 17
        Height = 17
        Caption = 'CheckBox1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = CheckBox4Click
      end
      object CheckBox5: TCheckBox
        Left = 72
        Top = 16
        Width = 17
        Height = 17
        Caption = 'CheckBox1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = CheckBox5Click
      end
      object Button2: TButton
        Left = 95
        Top = 16
        Width = 66
        Height = 18
        Caption = 'emulate'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = Button2Click
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 53
    Width = 390
    Height = 414
    Align = alClient
    Caption = 'Export Settings'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Bevel1: TBevel
      Left = 8
      Top = 22
      Width = 374
      Height = 36
      Shape = bsFrame
    end
    object Label1: TLabel
      Left = 14
      Top = 32
      Width = 53
      Height = 13
      Caption = 'Directory'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object pButtons: TPanel
      Left = 9
      Top = 64
      Width = 133
      Height = 245
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object sbHerdReports: TSpeedButton
        Left = 5
        Top = 6
        Width = 121
        Height = 22
        GroupIndex = 1
        Down = True
        Caption = 'Herd Reports'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        OnClick = sbHerdReportsClick
      end
      object sbSalesEligibility: TSpeedButton
        Tag = 1
        Left = 5
        Top = 36
        Width = 121
        Height = 22
        GroupIndex = 1
        Caption = 'Sales/Elgibility'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        OnClick = sbHerdReportsClick
      end
      object sbQualityAssurance: TSpeedButton
        Tag = 2
        Left = 5
        Top = 66
        Width = 121
        Height = 22
        GroupIndex = 1
        Caption = 'Quality Assurance'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        OnClick = sbHerdReportsClick
      end
      object sbCowRec: TSpeedButton
        Tag = 3
        Left = 5
        Top = 96
        Width = 121
        Height = 22
        GroupIndex = 1
        Caption = 'Cow Recording'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        OnClick = sbHerdReportsClick
      end
      object sbBreedingFert: TSpeedButton
        Tag = 4
        Left = 5
        Top = 126
        Width = 121
        Height = 22
        GroupIndex = 1
        Caption = 'Breeding/Fertility'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        OnClick = sbHerdReportsClick
      end
      object sbMilkAnalysis: TSpeedButton
        Tag = 5
        Left = 5
        Top = 156
        Width = 121
        Height = 22
        GroupIndex = 1
        Caption = 'Milk Analysis'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        OnClick = sbHerdReportsClick
      end
      object sbPedigreeReports: TSpeedButton
        Tag = 6
        Left = 5
        Top = 186
        Width = 121
        Height = 22
        GroupIndex = 1
        Caption = 'Pedigree Reports'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        OnClick = sbHerdReportsClick
      end
      object sbBeefMan: TSpeedButton
        Tag = 7
        Left = 5
        Top = 216
        Width = 121
        Height = 22
        GroupIndex = 1
        Caption = 'Beef Management'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        OnClick = sbHerdReportsClick
      end
    end
    object gbFileProperties: TGroupBox
      Left = 8
      Top = 312
      Width = 374
      Height = 91
      Caption = 'File Properties'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object lFileName: TLabel
        Left = 14
        Top = 28
        Width = 33
        Height = 13
        Caption = 'Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object lFileType: TLabel
        Left = 14
        Top = 56
        Width = 28
        Height = 13
        Caption = 'Type'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object eFileName: TEdit
        Left = 52
        Top = 24
        Width = 208
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object cbFileType: TComboBox
        Left = 52
        Top = 54
        Width = 208
        Height = 21
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 1
        Items.Strings = (
          'CSV (*.CSV) (Excel Format)'
          'RTF (*.RTF) (Word Document Format)')
      end
      object btnUpdate: TButton
        Left = 278
        Top = 53
        Width = 84
        Height = 24
        Caption = '&Update'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btnUpdateClick
      end
      object Button1: TButton
        Left = 278
        Top = 21
        Width = 84
        Height = 24
        Caption = '&Report Defs.'
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
    object gbPedigree: TGroupBox
      Tag = 6
      Left = 149
      Top = 59
      Width = 233
      Height = 250
      Caption = 'Pedigree Reports'
      TabOrder = 2
      object cbPedigreeReports: TCheckListBox
        Tag = 6
        Left = 8
        Top = 20
        Width = 213
        Height = 218
        Color = 16056298
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ItemHeight = 20
        Items.Strings = (
          'Herd Brochure')
        ParentFont = False
        Style = lbOwnerDrawVariable
        TabOrder = 0
        OnClick = cbHerdReportsClick
      end
    end
    object gbMilkAnalysis: TGroupBox
      Tag = 5
      Left = 149
      Top = 59
      Width = 233
      Height = 250
      Caption = 'Milk Analysis'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object cbMilkAnalysis: TCheckListBox
        Tag = 5
        Left = 8
        Top = 20
        Width = 213
        Height = 218
        Color = 16056298
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ItemHeight = 20
        Items.Strings = (
          'Best Cows In Herd')
        ParentFont = False
        Style = lbOwnerDrawVariable
        TabOrder = 0
        OnClick = cbHerdReportsClick
      end
    end
    object gbBreedingFert: TGroupBox
      Tag = 4
      Left = 149
      Top = 59
      Width = 233
      Height = 250
      Caption = 'Breeding/Fertility'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object cbBreedingFert: TCheckListBox
        Tag = 4
        Left = 8
        Top = 20
        Width = 213
        Height = 218
        Color = 16056298
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ItemHeight = 20
        Items.Strings = (
          'Individual Cow Fertility')
        ParentFont = False
        Style = lbOwnerDrawVariable
        TabOrder = 0
        OnClick = cbHerdReportsClick
      end
    end
    object gbBeefMan: TGroupBox
      Tag = 7
      Left = 149
      Top = 59
      Width = 233
      Height = 250
      Caption = 'Beef Management'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object cbBeefMan: TCheckListBox
        Tag = 7
        Left = 8
        Top = 20
        Width = 213
        Height = 218
        Color = 15790320
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ItemHeight = 20
        Items.Strings = (
          'Cattle Margins')
        ParentFont = False
        Style = lbOwnerDrawVariable
        TabOrder = 0
        OnClick = cbHerdReportsClick
      end
    end
    object gbCowRec: TGroupBox
      Tag = 3
      Left = 149
      Top = 59
      Width = 233
      Height = 250
      Caption = 'Cow Recording'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      object cbCowRec: TCheckListBox
        Tag = 3
        Left = 8
        Top = 20
        Width = 213
        Height = 218
        Color = 16772823
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ItemHeight = 20
        Items.Strings = (
          'Heats/Services/PD'#39's'
          'Due Service'
          'Due Pregnancy Diagnosis'
          'Due For Drying Off'
          'Due To Calve'
          'Weighing Report')
        ParentFont = False
        Style = lbOwnerDrawVariable
        TabOrder = 0
        OnClick = cbHerdReportsClick
      end
    end
    object gbQualityAssurance: TGroupBox
      Tag = 2
      Left = 149
      Top = 59
      Width = 233
      Height = 250
      Caption = 'Quality Assurance'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      object cbQualityAssurance: TCheckListBox
        Tag = 2
        Left = 8
        Top = 20
        Width = 213
        Height = 218
        Color = 15138815
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ItemHeight = 20
        Items.Strings = (
          'Veterinary Treatments Report'
          'Somatic Cell Count Analysis')
        ParentFont = False
        Style = lbOwnerDrawVariable
        TabOrder = 0
        OnClick = cbHerdReportsClick
      end
    end
    object gbSalesAnalysis: TGroupBox
      Tag = 1
      Left = 149
      Top = 59
      Width = 233
      Height = 250
      Caption = 'Sales Eligibility'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      object cbSalesAnalysis: TCheckListBox
        Tag = 1
        Left = 8
        Top = 20
        Width = 213
        Height = 218
        Color = 15138815
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ItemHeight = 20
        Items.Strings = (
          'Sales Planner'
          'Restricted Animals Report')
        ParentFont = False
        Style = lbOwnerDrawVariable
        TabOrder = 0
        OnClick = cbHerdReportsClick
      end
    end
    object gbHerdReports: TGroupBox
      Left = 149
      Top = 59
      Width = 233
      Height = 250
      Caption = 'Herd Reports'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      object cbHerdReports: TCheckListBox
        Left = 8
        Top = 20
        Width = 213
        Height = 218
        Color = 15138815
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ItemHeight = 20
        Items.Strings = (
          'Stock On Hand'
          'Purchase/Sales Analysis')
        ParentFont = False
        Style = lbOwnerDrawVariable
        TabOrder = 0
        OnClick = cbHerdReportsClick
      end
    end
    object OutputDir: TDirectoryEdit
      Left = 72
      Top = 29
      Width = 304
      Height = 20
      OnAfterDialog = OutputDirAfterDialog
      DialogKind = dkWin32
      DialogText = 'Select directory to store PDA files'
      InitialDir = 'C:\Kingswood Herd Management\PDA Export Files'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      GlyphKind = gkEllipsis
      NumGlyphs = 1
      ButtonWidth = 17
      ParentFont = False
      TabOrder = 10
      Text = 'OutputDir'
      OnDblClick = OutputDirDblClick
    end
  end
end
