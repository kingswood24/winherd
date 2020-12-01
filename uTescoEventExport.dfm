object fmBaseForm: TfmBaseForm
  Left = 539
  Top = 228
  Width = 549
  Height = 384
  Caption = 'fmBaseForm'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 330
    Width = 541
    Height = 20
    Panels = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object ActionList: TActionList
    Images = ImageStore.ImageList16x16
    Left = 30
    Top = 92
    object actClose: TAction
      Caption = 'Close'
      ImageIndex = 0
      OnExecute = actCloseExecute
    end
    object actHelp: TAction
      Caption = 'Help'
      ImageIndex = 7
    end
  end
  object BarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
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
            Visible = True
          end
          item
            BeginGroup = True
            Item = bHelp
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
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    HotImages = ImageStore.ImageList16x16
    Images = ImageStore.ImageList16x16
    LargeImages = ImageStore.ImageList16x16
    PopupMenuLinks = <>
    Style = bmsStandard
    UseSystemFont = True
    Left = 30
    Top = 62
    DockControlHeights = (
      0
      0
      40
      0)
    object bClose: TdxBarLargeButton
      Action = actClose
      Category = 0
      Width = 55
    end
    object bHelp: TdxBarLargeButton
      Action = actHelp
      Category = 0
      Width = 55
    end
  end
end
