inherited fmMovementInHealthBatchNo: TfmMovementInHealthBatchNo
  Left = 595
  Top = 284
  Width = 418
  Height = 273
  Caption = 'Drug Batch No'
  Font.Height = -13
  Font.Name = 'Segoe UI'
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 17
  inherited StatusBar: TdxStatusBar
    Top = 222
    Width = 410
  end
  object lDrugName: TcxLabel [1]
    Left = 25
    Top = 80
    AutoSize = False
    Caption = 'lDrugName'
    ParentColor = False
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Style.Color = clInfoBk
    Height = 34
    Width = 361
  end
  object lBatchNo: TcxLabel [2]
    Left = 75
    Top = 132
    Caption = 'Batch No:'
  end
  object cmboBatchNo: TcxComboBox [3]
    Left = 139
    Top = 130
    TabOrder = 7
    Width = 173
  end
  inherited ActionList: TActionList
    Left = 260
    Top = 11
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
    Left = 230
    Top = 11
    DockControlHeights = (
      0
      0
      49
      0)
    inherited bClose: TdxBarLargeButton
      Height = 45
      Width = 65
    end
    inherited bHelp: TdxBarLargeButton
      Height = 45
      Width = 65
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actSave
      Category = 0
      Height = 45
      Width = 65
    end
  end
end
