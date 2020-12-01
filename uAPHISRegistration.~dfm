object APHISRegistration: TAPHISRegistration
  Left = 399
  Top = 156
  Width = 879
  Height = 604
  Caption = 'APHIS Births/Deaths Registration'
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
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 871
    Height = 52
    ButtonHeight = 45
    ButtonWidth = 86
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
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
      Width = 62
      Height = 45
      Hint = 'Click Here To Exit'
      Caption = 'E&xit'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ModalResult = 1
      NumGlyphs = 2
      ParentFont = False
      Transparent = True
    end
    object ToolButton1: TToolButton
      Left = 70
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 0
      Style = tbsDivider
    end
    object sbRemove: TRxSpeedButton
      Left = 78
      Top = 2
      Width = 87
      Height = 45
      Hint = 'Click Here To Exit'
      DropDownMenu = mRemove
      Caption = 'Remove '
      Flat = True
      NumGlyphs = 2
      Transparent = True
      OnClick = sbRemoveClick
    end
    object ToolButton5: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsDivider
    end
    object sbRegister: TRxSpeedButton
      Left = 173
      Top = 2
      Width = 132
      Height = 45
      Hint = 'Click Here To Exit'
      Caption = 'Register'
      Flat = True
      NumGlyphs = 2
      Transparent = True
      OnClick = sbRegisterClick
    end
    object ToolButton3: TToolButton
      Left = 305
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsDivider
    end
    object sbReload: TRxSpeedButton
      Left = 313
      Top = 2
      Width = 73
      Height = 45
      Hint = 'Click Here To Exit'
      Caption = 'Reload'
      Flat = True
      NumGlyphs = 2
      Transparent = True
      OnClick = sbReloadClick
    end
    object ToolButton4: TToolButton
      Left = 386
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsDivider
    end
    object sbOptions: TRxSpeedButton
      Left = 394
      Top = 2
      Width = 73
      Height = 45
      DropDownMenu = mOptions
      Caption = 'Options'
      Flat = True
      NumGlyphs = 2
      Transparent = True
    end
    object ToolButton6: TToolButton
      Left = 467
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 3
      Style = tbsDivider
    end
    object RxSpeedButton1: TRxSpeedButton
      Left = 475
      Top = 2
      Width = 102
      Height = 45
      Hint = 'Click Here To Exit'
      Caption = 'Registration Forms'
      Flat = True
      NumGlyphs = 2
      Transparent = True
      WordWrap = True
      OnClick = RxSpeedButton1Click
    end
    object ToolButton7: TToolButton
      Left = 577
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 4
      Style = tbsDivider
    end
    object sbHelp: TRxSpeedButton
      Left = 585
      Top = 2
      Width = 54
      Height = 45
      Hint = 'Click Here To Exit'
      Caption = 'Help'
      Flat = True
      NumGlyphs = 2
      Transparent = True
      OnClick = sbHelpClick
    end
    object ToolButton9: TToolButton
      Left = 639
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 647
      Top = 2
      Caption = 'ToolButton8'
      ImageIndex = 5
      Visible = False
      OnClick = ToolButton8Click
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 554
    Width = 871
    Height = 19
    Panels = <
      item
        Text = 'Animals'
        Width = 200
      end
      item
        Text = 'File ID '
        Width = 85
      end
      item
        Text = 'Last Registration'
        Width = 250
      end
      item
        Style = psOwnerDraw
        Width = 50
      end>
    SimplePanel = False
  end
  object RegistrationPages: TPageControl
    Left = 0
    Top = 56
    Width = 871
    Height = 498
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    HotTrack = True
    ParentFont = False
    TabHeight = 28
    TabOrder = 2
    OnChange = RegistrationPagesChange
    OnChanging = RegistrationPagesChanging
    object TabSheet1: TTabSheet
      Caption = 'Birth Registration'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      object pControls: TPanel
        Left = 0
        Top = 0
        Width = 863
        Height = 460
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Splitter: TSplitter
          Left = 0
          Top = 373
          Width = 863
          Height = 5
          Cursor = crVSplit
          Align = alBottom
          Beveled = True
          ResizeStyle = rsUpdate
        end
        object AnimalGrid: TDBGridEh
          Left = 0
          Top = 0
          Width = 863
          Height = 373
          Hint = 
            'Click column title to sort column data in ascending/descending f' +
            'ashion. '
          Align = alClient
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          FooterColor = clWindow
          FooterFont.Charset = ANSI_CHARSET
          FooterFont.Color = clBlack
          FooterFont.Height = -13
          FooterFont.Name = 'Segoe UI'
          FooterFont.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghAutoSortMarking, dghRowHighlight]
          ParentFont = False
          ParentShowHint = False
          PopupMenu = mRemove
          ReadOnly = True
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -13
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          VTitleMargin = 3
          OnEnter = AnimalGridEnter
          OnGetCellParams = AnimalGridGetCellParams
          OnTitleClick = AnimalGridTitleClick
        end
        object pErrors: TPanel
          Left = 0
          Top = 378
          Width = 863
          Height = 82
          Align = alBottom
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Visible = False
          object WarningImage: TImage
            Left = 12
            Top = 16
            Width = 37
            Height = 53
          end
          object Label1: TLabel
            Left = 60
            Top = 8
            Width = 286
            Height = 34
            Caption = 
              'Warning: This animal cannot be registered at this time. Please r' +
              'eview details to the right.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object DBStatusLabel1: TDBStatusLabel
            Left = 379
            Top = 32
            Width = 99
            Height = 17
            DataSource = dsBatchRegAnimals
            Style = lsRecordNo
            CalcRecCount = True
            Alignment = taRightJustify
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object DBNavigator1: TDBNavigator
            Left = 356
            Top = 2
            Width = 124
            Height = 29
            DataSource = dsBatchRegAnimals
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Flat = True
            TabOrder = 0
          end
          object ErrorGrid: TDBGridEh
            Left = 488
            Top = 2
            Width = 373
            Height = 78
            Align = alRight
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataSource = dsBatchRegAnimals
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            FooterColor = clWindow
            FooterFont.Charset = ANSI_CHARSET
            FooterFont.Color = clBlack
            FooterFont.Height = -13
            FooterFont.Name = 'Verdana'
            FooterFont.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
            ParentFont = False
            TabOrder = 1
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -13
            TitleFont.Name = 'Segoe UI'
            TitleFont.Style = []
            VertScrollBar.Tracking = True
            VertScrollBar.VisibleMode = sbAlwaysShowEh
            Columns = <
              item
                EditButtons = <>
                FieldName = 'ErrorDesc'
                Footers = <>
                Title.Caption = 'Error Description'
                Width = 392
              end>
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Death Registration'
      ImageIndex = 1
    end
    object TabSheet3: TTabSheet
      Caption = 'Still Birth Registration'
      ImageIndex = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 52
    Width = 871
    Height = 4
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
  end
  object LoadAnimalTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = LoadAnimalTimerTimer
    Left = 20
    Top = 154
  end
  object mRemove: TPopupMenu
    Left = 132
    Top = 127
    object Remove1: TMenuItem
      Caption = 'Remove From This Registration'
      OnClick = Remove1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object RemovePermanently1: TMenuItem
      Caption = 'Remove Permanently'
      OnClick = RemovePermanently1Click
    end
  end
  object dsBatchRegAnimals: TDataSource
    Left = 56
    Top = 184
  end
  object mOptions: TPopupMenu
    Left = 132
    Top = 159
    object APHISLogindetails1: TMenuItem
      Caption = 'APHIS Login details'
      OnClick = APHISLogindetails1Click
    end
    object GotoAPHISOnline1: TMenuItem
      Caption = 'Go to APHIS Online'
      OnClick = GotoAPHISOnline1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object ShowXMLFiles1: TMenuItem
      Caption = 'Show Registration Files'
      OnClick = ShowXMLFiles1Click
    end
  end
  object ImageTimer: TTimer
    Enabled = False
    Interval = 600
    OnTimer = ImageTimerTimer
    Left = 52
    Top = 149
  end
end
