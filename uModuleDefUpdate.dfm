inherited fmModuleDefUpdate: TfmModuleDefUpdate
  Left = 658
  Top = 231
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'Module Definiton'
  ClientHeight = 368
  ClientWidth = 755
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TdxStatusBar
    Top = 348
    Width = 755
  end
  object pModules: TPanel [1]
    Left = 0
    Top = 49
    Width = 755
    Height = 299
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 5
    object GroupBox3: TcxGroupBox
      Left = 153
      Top = 196
      Caption = 'Additional Modules '
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Transparent = True
      Height = 82
      Width = 579
      object cbAccs: TcxCheckBox
        Left = 10
        Top = 17
        Caption = 'Kingswood Accounts'
        ParentFont = False
        Properties.ImmediatePost = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Transparent = True
        Width = 130
      end
      object cbParlour: TcxCheckBox
        Left = 296
        Top = 38
        Caption = 'Parlour Link'
        ParentFont = False
        Properties.ImmediatePost = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 1
        Transparent = True
        Width = 130
      end
      object cbRation: TcxCheckBox
        Left = 296
        Top = 17
        Caption = 'Ration Calc'
        ParentFont = False
        Properties.ImmediatePost = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 2
        Transparent = True
        Width = 130
      end
      object cbElecWeigh: TcxCheckBox
        Left = 153
        Top = 59
        Caption = 'Electronic Weighing'
        ParentFont = False
        Properties.ImmediatePost = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 3
        Transparent = True
        Width = 130
      end
      object cbPDAHerd: TcxCheckBox
        Tag = 1
        Left = 10
        Top = 38
        Caption = 'PDA Herd'
        ParentFont = False
        Properties.ImmediatePost = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 4
        Transparent = True
        Width = 130
      end
      object cbDIY: TcxCheckBox
        Left = 153
        Top = 38
        Caption = 'DIY Milk Recording'
        ParentFont = False
        Properties.ImmediatePost = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 5
        Transparent = True
        Width = 130
      end
      object cbPDAFields: TcxCheckBox
        Tag = 1
        Left = 10
        Top = 59
        Caption = 'PDA Fields Link'
        ParentFont = False
        Properties.ImmediatePost = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 6
        Transparent = True
        Width = 130
      end
      object cbCrush: TcxCheckBox
        Left = 153
        Top = 17
        Caption = 'Crush'
        ParentFont = False
        Properties.ImmediatePost = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 7
        Transparent = True
        Width = 130
      end
      object cbDanRyanImport: TcxCheckBox
        Left = 296
        Top = 59
        Caption = 'Dan Ryan Link'
        ParentFont = False
        Properties.ImmediatePost = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 8
        Transparent = True
        Width = 130
      end
      object cbPlateMeterImport: TcxCheckBox
        Left = 439
        Top = 17
        Caption = 'Plate Meter Import'
        ParentFont = False
        Properties.ImmediatePost = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 9
        Transparent = True
        Width = 130
      end
      object cbDealer: TcxCheckBox
        Left = 439
        Top = 41
        Caption = 'Dealer'
        ParentFont = False
        Properties.ImmediatePost = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 10
        Transparent = True
        Width = 130
      end
    end
    object Label2: TcxLabel
      Left = 8
      Top = 19
      Caption = 'Beef System'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextColor = clBtnText
      Style.TextStyle = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object Label4: TcxLabel
      Left = 8
      Top = 139
      Caption = 'Std. Dairy System'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextColor = clBtnText
      Style.TextStyle = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object Label5: TcxLabel
      Left = 8
      Top = 79
      Caption = 'Suckler System'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextColor = clBtnText
      Style.TextStyle = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object Label7: TcxLabel
      Left = 361
      Top = 25
      Caption = 'Full Dairy System'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object Label8: TcxLabel
      Left = 8
      Top = 199
      Caption = 'Additional Modules '
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextColor = clBtnText
      Style.TextStyle = []
      Style.IsFontAssigned = True
      Transparent = True
    end
    object mod2: TcxGroupBox
      Left = 153
      Top = 79
      Caption = 'Module 2'
      ParentColor = False
      ParentFont = False
      Style.Color = clCaptionText
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 6
      Transparent = True
      Height = 44
      Width = 180
      object UseManCal: TcxCheckBox
        Left = 10
        Top = 17
        Caption = 'Cow Recording'
        ParentFont = False
        Properties.ImmediatePost = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Transparent = True
        Width = 153
      end
    end
    object mod6: TcxGroupBox
      Left = 547
      Top = 86
      Caption = 'Module 6'
      ParentColor = False
      ParentFont = False
      Style.Color = clCaptionText
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 7
      Transparent = True
      Height = 44
      Width = 180
      object UseBeefManagement: TcxCheckBox
        Left = 10
        Top = 17
        Caption = 'Beef Management'
        ParentFont = False
        Properties.ImmediatePost = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Transparent = True
        Width = 153
      end
    end
    object mod1: TcxGroupBox
      Tag = 2
      Left = 153
      Top = 19
      Caption = 'Module 1'
      ParentColor = False
      ParentFont = False
      Style.Color = clWhite
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 8
      Transparent = True
      Height = 44
      Width = 180
      object UsePremiums: TcxCheckBox
        Left = 10
        Top = 17
        Caption = 'Herd Admin'
        ParentFont = False
        Properties.ImmediatePost = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Transparent = True
        Width = 153
      end
    end
    object mod3: TcxGroupBox
      Left = 153
      Top = 139
      Caption = 'Module 3'
      ParentColor = False
      ParentFont = False
      Style.Color = clCaptionText
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 9
      Transparent = True
      Height = 44
      Width = 180
      object UseQuotaMan: TcxCheckBox
        Left = 10
        Top = 17
        Caption = 'Advanced Dairy'
        ParentFont = False
        Properties.ImmediatePost = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Transparent = True
        Width = 153
      end
    end
    object mod4: TcxGroupBox
      Left = 353
      Top = 58
      Caption = 'Module 4'
      ParentColor = False
      ParentFont = False
      Style.Color = clCaptionText
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 10
      Transparent = True
      Height = 44
      Width = 180
      object UseMilkRec: TcxCheckBox
        Left = 10
        Top = 17
        Caption = 'Milk Recording'
        ParentFont = False
        Properties.ImmediatePost = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Transparent = True
        Width = 153
      end
    end
    object mod5: TcxGroupBox
      Tag = 2
      Left = 353
      Top = 114
      Caption = 'Module 5'
      ParentColor = False
      ParentFont = False
      Style.Color = clCaptionText
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = True
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 11
      Transparent = True
      Height = 44
      Width = 180
      object UsePedigree: TcxCheckBox
        Left = 10
        Top = 17
        Caption = 'Pedigree Records'
        ParentFont = False
        Properties.ImmediatePost = True
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Segoe UI'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = True
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Transparent = True
        Width = 153
      end
    end
    object seSerialNo: TcxSpinEdit
      Left = 608
      Top = 16
      TabOrder = 12
      Width = 75
    end
  end
  inherited ActionList: TActionList
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
            Item = dlbSave
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
      49
      0)
    object dlbSave: TdxBarLargeButton
      Action = actSave
      Category = 0
      Height = 45
      Width = 65
    end
  end
end
