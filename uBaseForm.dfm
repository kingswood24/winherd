object fmBaseForm: TfmBaseForm
  Left = 457
  Top = 283
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 333
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
    Left = 252
    Top = 9
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
    Font.Height = -12
    Font.Name = 'Segoe UI'
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
    Left = 220
    Top = 9
    DockControlHeights = (
      0
      0
      49
      0)
    object bClose: TdxBarLargeButton
      Action = actClose
      Category = 0
      Height = 45
      Width = 65
    end
    object bHelp: TdxBarLargeButton
      Action = actHelp
      Category = 0
      Height = 45
      Width = 65
    end
  end
end
