inherited fmTescoExport: TfmTescoExport
  Left = 510
  Top = 300
  Width = 399
  Height = 218
  Caption = 'Tesco Herd Scoring Export'
  Font.Height = -12
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 15
  inherited StatusBar: TdxStatusBar
    Top = 164
    Width = 391
  end
  object cxLabel1: TcxLabel [1]
    Left = 18
    Top = 89
    Caption = 'Enter a date to export events from: '
  end
  object deEventDate: TcxDateEdit [2]
    Left = 216
    Top = 84
    Style.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.Kind = lfStandard
    TabOrder = 6
    Width = 125
  end
  inherited ActionList: TActionList
    Left = 295
    Top = 8
    object actExportFile: TAction
      Caption = 'Create Export File'
      ImageIndex = 30
      OnExecute = actExportFileExecute
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
            Item = dxBarLargeButton1
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
    Left = 265
    Top = 8
    DockControlHeights = (
      0
      0
      49
      0)
    inherited bClose: TdxBarLargeButton
      Height = 45
      Width = 60
    end
    inherited bHelp: TdxBarLargeButton
      Height = 45
      Width = 60
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actExportFile
      Category = 0
      Height = 45
      Width = 100
    end
  end
  object SaveDialog: TSaveDialog
    Left = 327
    Top = 8
  end
end
