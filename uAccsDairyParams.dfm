inherited fmAccsDairyParams: TfmAccsDairyParams
  Left = 612
  Top = 325
  Width = 336
  Height = 319
  Caption = 'Accounts Dairy Params'
  Font.Height = -13
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  inherited StatusBar: TdxStatusBar
    Top = 261
    Width = 328
    Height = 24
  end
  object lMilkFedToCalves: TcxLabel [1]
    Left = 49
    Top = 98
    Caption = 'Milk Fed To Calves:'
  end
  object lProteinPerc: TcxLabel [2]
    Left = 49
    Top = 175
    Caption = 'Protein %:'
  end
  object lFatPerc: TcxLabel [3]
    Left = 49
    Top = 212
    Caption = 'Fat %:'
  end
  object ceMilkFedToCalves: TcxCurrencyEdit [4]
    Left = 182
    Top = 94
    Properties.DisplayFormat = '0.00'
    Properties.EditFormat = '0.00'
    Properties.OnChange = ceMilkFedToCalvesPropertiesChange
    Style.BorderStyle = ebs3D
    TabOrder = 8
    Width = 91
  end
  object ceProteinPerc: TcxCurrencyEdit [5]
    Left = 182
    Top = 171
    Properties.DisplayFormat = '0.00'
    Properties.EditFormat = '0.00'
    Properties.OnChange = ceProteinPercPropertiesChange
    Style.BorderStyle = ebs3D
    TabOrder = 9
    Width = 91
  end
  object ceFatPerc: TcxCurrencyEdit [6]
    Left = 182
    Top = 208
    Properties.DisplayFormat = '0.00'
    Properties.EditFormat = '0.00'
    Properties.OnChange = ceFatPercPropertiesChange
    Style.BorderStyle = ebs3D
    TabOrder = 10
    Width = 91
  end
  object lMilkFromCoOp: TcxLabel [7]
    Left = 49
    Top = 59
    Caption = 'Milk From Co-Op:'
  end
  object ceMilkFromCoOp: TcxCurrencyEdit [8]
    Left = 182
    Top = 57
    Properties.DisplayFormat = '0.00'
    Properties.EditFormat = '0.00'
    Properties.ReadOnly = True
    Style.BorderStyle = ebs3D
    Style.Color = clInfoBk
    TabOrder = 12
    Width = 91
  end
  object lTotalMilkProduced: TcxLabel [9]
    Left = 49
    Top = 137
    Caption = 'Total Milk Produced:'
  end
  object ceTotalMilkProduced: TcxCurrencyEdit [10]
    Left = 182
    Top = 133
    Properties.DisplayFormat = '0.00'
    Properties.EditFormat = '0.00'
    Properties.ReadOnly = True
    Style.BorderStyle = ebs3D
    Style.Color = clInfoBk
    TabOrder = 14
    Width = 91
  end
  inherited ActionList: TActionList
    Left = 162
    Top = 4
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
    Left = 132
    Top = 4
    DockControlHeights = (
      0
      0
      40
      0)
  end
end
