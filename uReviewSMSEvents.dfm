object fmReviewSMSEvents: TfmReviewSMSEvents
  Left = 349
  Top = 308
  Width = 584
  Height = 362
  Caption = 'Kingswood Herd - Nokia Phone Link'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object Dock971: TDock97
    Left = 0
    Top = 0
    Width = 576
    Height = 50
    object Toolbar971: TToolbar97
      Left = 0
      Top = 0
      Caption = 'Toolbar971'
      DockPos = 0
      FullSize = True
      TabOrder = 0
      object sbExit: TRxSpeedButton
        Left = 0
        Top = 0
        Width = 62
        Height = 46
        Caption = 'Exit'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ModalResult = 1
        NumGlyphs = 2
        ParentFont = False
        Spacing = 2
      end
      object ToolbarSep971: TToolbarSep97
        Left = 62
        Top = 0
      end
      object RxSpeedButton2: TRxSpeedButton
        Left = 68
        Top = 0
        Width = 77
        Height = 46
        DropDownMenu = PopupMenu1
        Caption = 'Options'
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ModalResult = 1
        NumGlyphs = 2
        ParentFont = False
        Spacing = 2
      end
    end
  end
  object EventTab: TPageControl
    Left = 0
    Top = 50
    Width = 576
    Height = 257
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    HotTrack = True
    ParentFont = False
    TabOrder = 1
    OnChange = EventTabChange
    object TabSheet1: TTabSheet
      Caption = 'Heats'
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 568
        Height = 229
        Align = alClient
        DataSource = dsTempEvents
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Arial'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        OnDblClick = DBGridEh1DblClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'AnimalNo'
            Footers = <>
            Title.Caption = 'Animal No.'
          end
          item
            EditButtons = <>
            FieldName = 'NatIDNum'
            Footers = <>
            Title.Caption = 'National Id.'
            Width = 104
          end
          item
            EditButtons = <>
            FieldName = 'LactNo'
            Footers = <>
            Title.Caption = 'Lact. No.'
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'EventDate'
            Footers = <>
            Title.Caption = 'Event Date'
            Width = 79
          end
          item
            EditButtons = <>
            FieldName = 'BullNo'
            Footers = <>
            Title.Caption = 'Planned Bull'
            Width = 89
          end
          item
            EditButtons = <>
            FieldName = 'Comment'
            Footers = <>
            Width = 142
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Services'
      ImageIndex = 1
      object DBGridEh2: TDBGridEh
        Left = 0
        Top = 0
        Width = 568
        Height = 229
        Align = alClient
        DataSource = dsTempEvents
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Arial'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        OnDblClick = DBGridEh1DblClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'AnimalNo'
            Footers = <>
            Title.Caption = 'Animal No.'
            Width = 67
          end
          item
            EditButtons = <>
            FieldName = 'NatIDNum'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            Footers = <>
            Title.Caption = 'National Id.'
            Width = 113
          end
          item
            EditButtons = <>
            FieldName = 'LactNo'
            Footers = <>
            Title.Caption = 'Lact. No.'
            Width = 53
          end
          item
            EditButtons = <>
            FieldName = 'EventDate'
            Footers = <>
            Title.Caption = 'Event Date'
            Width = 69
          end
          item
            EditButtons = <>
            FieldName = 'BullNo'
            Footers = <>
            Title.Caption = 'Service Bull'
          end
          item
            EditButtons = <>
            FieldName = 'Comment'
            Footers = <>
          end>
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'PDs'
      ImageIndex = 2
      object DBGridEh3: TDBGridEh
        Left = 0
        Top = 0
        Width = 568
        Height = 229
        Align = alClient
        DataSource = dsTempEvents
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Arial'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        OnDblClick = DBGridEh1DblClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'AnimalNo'
            Footers = <>
          end
          item
            EditButtons = <>
            FieldName = 'NatIDNum'
            Footers = <>
            Title.Caption = 'National Id.'
            Width = 113
          end
          item
            EditButtons = <>
            FieldName = 'LactNo'
            Footers = <>
            Title.Caption = 'Lact. No.'
            Width = 51
          end
          item
            EditButtons = <>
            FieldName = 'EventDate'
            Footers = <>
            Title.Caption = 'Event Date'
            Width = 66
          end
          item
            EditButtons = <>
            FieldName = 'Comment'
            Footers = <>
            Width = 116
          end
          item
            ButtonStyle = cbsNone
            Checkboxes = False
            DblClickNextVal = True
            EditButtons = <>
            FieldName = 'Pregnant'
            Footers = <>
            Width = 60
          end>
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Drying Off'
      ImageIndex = 5
      object DBGridEh5: TDBGridEh
        Left = 0
        Top = 0
        Width = 568
        Height = 229
        Align = alClient
        DataSource = dsTempEvents
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Arial'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        OnDblClick = DBGridEh1DblClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'AnimalNo'
            Footers = <>
            Title.Caption = 'Animal No.'
            Width = 67
          end
          item
            EditButtons = <>
            FieldName = 'NatIDNum'
            Footers = <>
            Title.Caption = 'National Id.'
            Width = 113
          end
          item
            EditButtons = <>
            FieldName = 'LactNo'
            Footers = <>
            Title.Caption = 'Lact. No.'
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'EventDate'
            Footers = <>
            Title.Caption = 'Event Date'
            Width = 79
          end
          item
            EditButtons = <>
            FieldName = 'Medicine'
            Footers = <>
            Width = 89
          end
          item
            EditButtons = <>
            FieldName = 'HealthDesc'
            Footers = <>
            Title.Caption = 'Health Code'
            Width = 83
          end
          item
            EditButtons = <>
            FieldName = 'Comment'
            Footers = <>
          end>
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Health'
      ImageIndex = 3
      object DBGridEh4: TDBGridEh
        Left = 0
        Top = 0
        Width = 568
        Height = 229
        Align = alClient
        DataSource = dsTempEvents
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Arial'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        OnDblClick = DBGridEh1DblClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'AnimalNo'
            Footers = <>
            Title.Caption = 'Animal No.'
            Width = 67
          end
          item
            EditButtons = <>
            FieldName = 'NatIDNum'
            Footers = <>
            Title.Caption = 'National Id.'
            Width = 113
          end
          item
            EditButtons = <>
            FieldName = 'LactNo'
            Footers = <>
            Title.Caption = 'Lact. No.'
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'EventDate'
            Footers = <>
            Title.Caption = 'Event Date'
            Width = 79
          end
          item
            EditButtons = <>
            FieldName = 'Medicine'
            Footers = <>
            Width = 89
          end
          item
            EditButtons = <>
            FieldName = 'HealthDesc'
            Footers = <>
            Title.Caption = 'Health Code'
            Width = 83
          end
          item
            EditButtons = <>
            FieldName = 'Comment'
            Footers = <>
          end>
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Calvings'
      ImageIndex = 6
      object DBGridEh6: TDBGridEh
        Left = 0
        Top = 0
        Width = 568
        Height = 229
        Align = alClient
        DataSource = dsTempEvents
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Arial'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Verdana'
        TitleFont.Style = []
        OnDblClick = DBGridEh1DblClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'AnimalNo'
            Footers = <>
            Title.Caption = 'Animal No.'
            Width = 67
          end
          item
            EditButtons = <>
            FieldName = 'NatIDNum'
            Footers = <>
            Title.Caption = 'National Id.'
            Width = 113
          end
          item
            EditButtons = <>
            FieldName = 'LactNo'
            Footers = <>
            Title.Caption = 'Lact. No.'
            Width = 56
          end
          item
            EditButtons = <>
            FieldName = 'EventDate'
            Footers = <>
            Title.Caption = 'Event Date'
            Width = 79
          end
          item
            EditButtons = <>
            FieldName = 'CalfNo'
            Footers = <>
            Title.Caption = 'Calf Nat. Id.'
            Width = 114
          end
          item
            EditButtons = <>
            FieldName = 'CalfSex'
            Footers = <>
            Title.Caption = 'Calf Sex'
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'Comment'
            Footers = <>
            Width = 107
          end>
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Not Found'
      ImageIndex = 4
      object mErrors: TMemo
        Left = 0
        Top = 0
        Width = 568
        Height = 229
        Align = alClient
        Lines.Strings = (
          '')
        TabOrder = 0
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 307
    Width = 576
    Height = 21
    Panels = <
      item
        Text = 'Record Count:'
        Width = 150
      end
      item
        Width = 50
      end>
    SimplePanel = False
    SizeGrip = False
  end
  object dsTempEvents: TDataSource
    DataSet = TempEvents
    Left = 404
    Top = 7
  end
  object TempEvents: TTable
    AutoRefresh = True
    DatabaseName = 'Kingswd'
    TableName = 'tSmsEvents.DB'
    Left = 374
    Top = 7
    object TempEventsAnimalID: TIntegerField
      FieldName = 'AnimalID'
    end
    object TempEventsAnimalNo: TStringField
      FieldName = 'AnimalNo'
      Size = 10
    end
    object TempEventsNatIDNum: TStringField
      FieldName = 'NatIDNum'
    end
    object TempEventsLactNo: TIntegerField
      FieldName = 'LactNo'
    end
    object TempEventsBullID: TIntegerField
      FieldName = 'BullID'
    end
    object TempEventsBullNo: TStringField
      FieldName = 'BullNo'
      Size = 10
    end
    object TempEventsPregnant: TBooleanField
      FieldName = 'Pregnant'
    end
    object TempEventsMedicineCode: TIntegerField
      FieldName = 'MedicineCode'
    end
    object TempEventsHealthCode: TIntegerField
      FieldName = 'HealthCode'
    end
    object TempEventsEventType: TIntegerField
      FieldName = 'EventType'
    end
    object TempEventsDryOffEvent: TBooleanField
      FieldName = 'DryOffEvent'
    end
    object TempEventsEventDate: TDateField
      FieldName = 'EventDate'
    end
    object TempEventsComment: TStringField
      FieldName = 'Comment'
      Size = 30
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 156
    Top = 122
    object DefaultTab1: TMenuItem
      Caption = 'Default Tab'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Editeventsconsectitively1: TMenuItem
      Caption = 'Edit events consecutively'
      Checked = True
      OnClick = Editeventsconsectitively1Click
    end
  end
end
