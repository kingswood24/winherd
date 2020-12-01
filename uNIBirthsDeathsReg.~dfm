object NIBirthsDeathsReg: TNIBirthsDeathsReg
  Left = 319
  Top = 187
  Width = 754
  Height = 586
  Caption = 'Births/Deaths Batch Registration'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 746
    Height = 52
    ButtonHeight = 45
    ButtonWidth = 86
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
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
    object sbRemove: TRxSpeedButton
      Left = 74
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
      Left = 161
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsDivider
    end
    object sbCreateXMLFile: TRxSpeedButton
      Left = 169
      Top = 2
      Width = 128
      Height = 45
      Hint = 'Click Here To Exit'
      Caption = 'Create Batch File'
      Flat = True
      NumGlyphs = 2
      Transparent = True
      OnClick = sbCreateXMLFileClick
    end
    object ToolButton3: TToolButton
      Left = 297
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsDivider
    end
    object sbReload: TRxSpeedButton
      Left = 305
      Top = 2
      Width = 58
      Height = 45
      Hint = 'Click Here To Exit'
      Caption = 'Reload'
      Flat = True
      NumGlyphs = 2
      Transparent = True
      OnClick = sbReloadClick
    end
    object ToolButton4: TToolButton
      Left = 363
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsDivider
    end
    object sbOptions: TRxSpeedButton
      Left = 371
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
      Left = 444
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 3
      Style = tbsDivider
    end
    object sbHelp: TRxSpeedButton
      Left = 452
      Top = 2
      Width = 58
      Height = 45
      Hint = 'Click Here To Exit'
      Caption = 'Help'
      Enabled = False
      Flat = True
      NumGlyphs = 2
      Transparent = True
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 533
    Width = 746
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
    Width = 746
    Height = 477
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    HotTrack = True
    ParentFont = False
    TabOrder = 2
    OnChange = RegistrationPagesChange
    object TabSheet1: TTabSheet
      Caption = 'Birth Registration'
      object pControls: TPanel
        Left = 0
        Top = 0
        Width = 738
        Height = 448
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Splitter: TSplitter
          Left = 0
          Top = 361
          Width = 738
          Height = 5
          Cursor = crVSplit
          Align = alBottom
          Beveled = True
          ResizeStyle = rsUpdate
        end
        object AnimalGrid: TDBGridEh
          Left = 0
          Top = 0
          Width = 738
          Height = 361
          Align = alClient
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = ANSI_CHARSET
          FooterFont.Color = clBlack
          FooterFont.Height = -12
          FooterFont.Name = 'Verdana'
          FooterFont.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghAutoSortMarking, dghRowHighlight]
          PopupMenu = mRemove
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -12
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          VTitleMargin = 3
          OnDblClick = AnimalGridDblClick
          OnGetCellParams = AnimalGridGetCellParams
          OnTitleClick = AnimalGridTitleClick
        end
        object pErrors: TPanel
          Left = 0
          Top = 366
          Width = 738
          Height = 82
          Align = alBottom
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 1
          Visible = False
          object Image1: TImage
            Left = 12
            Top = 16
            Width = 37
            Height = 53
          end
          object Label1: TLabel
            Left = 56
            Top = 8
            Width = 167
            Height = 52
            Caption = 
              'Warning: This animal cannot be registered at this time. Please r' +
              'eview details to the right.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            WordWrap = True
          end
          object DBStatusLabel1: TDBStatusLabel
            Left = 223
            Top = 32
            Width = 102
            Height = 13
            DataSource = dsBatchRegAnimals
            Style = lsRecordNo
            CalcRecCount = True
            Alignment = taRightJustify
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
          object DBNavigator1: TDBNavigator
            Left = 240
            Top = 8
            Width = 88
            Height = 24
            DataSource = dsBatchRegAnimals
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Flat = True
            TabOrder = 0
          end
          object ErrorGrid: TDBGridEh
            Left = 336
            Top = 2
            Width = 400
            Height = 78
            Align = alRight
            Anchors = [akLeft, akTop, akRight, akBottom]
            BorderStyle = bsNone
            DataSource = dsBatchRegAnimals
            Flat = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
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
            TitleFont.Height = -11
            TitleFont.Name = 'Verdana'
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
      Caption = 'Still Born Registration'
      ImageIndex = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 52
    Width = 746
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
    Left = 100
    Top = 159
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
    Left = 64
    Top = 208
  end
  object mOptions: TPopupMenu
    Left = 132
    Top = 159
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
    Interval = 500
    OnTimer = ImageTimerTimer
    Left = 52
    Top = 157
  end
end
