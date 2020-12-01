inherited fmWeightTargets: TfmWeightTargets
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'Target Weights'
  ClientHeight = 411
  ClientWidth = 346
  Font.Height = -13
  Font.Name = 'Segoe UI'
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 17
  inherited StatusBar: TdxStatusBar
    Top = 391
    Width = 346
  end
  object dbceBirthTarget: TcxDBCurrencyEdit [1]
    Left = 188
    Top = 60
    DataBinding.DataField = 'BirthTarget'
    DataBinding.DataSource = WinData.dsTargetWeights
    Properties.DisplayFormat = '0.00'
    Properties.EditFormat = '0.00'
    Properties.OnChange = dbceBirthTargetPropertiesChange
    TabOrder = 5
    Width = 80
  end
  object dbce6WeekTarget: TcxDBCurrencyEdit [2]
    Left = 188
    Top = 96
    DataBinding.DataField = '6WeekTarget'
    DataBinding.DataSource = WinData.dsTargetWeights
    Properties.DisplayFormat = '0.00'
    Properties.EditFormat = '0.00'
    Properties.OnChange = dbceBirthTargetPropertiesChange
    TabOrder = 6
    Width = 80
  end
  object dbce3MonthTarget: TcxDBCurrencyEdit [3]
    Left = 188
    Top = 132
    DataBinding.DataField = '3MonthTarget'
    DataBinding.DataSource = WinData.dsTargetWeights
    Properties.DisplayFormat = '0.00'
    Properties.EditFormat = '0.00'
    Properties.OnChange = dbceBirthTargetPropertiesChange
    TabOrder = 7
    Width = 80
  end
  object dbce6MonthTarget: TcxDBCurrencyEdit [4]
    Left = 188
    Top = 168
    DataBinding.DataField = '6MonthTarget'
    DataBinding.DataSource = WinData.dsTargetWeights
    Properties.DisplayFormat = '0.00'
    Properties.EditFormat = '0.00'
    Properties.OnChange = dbceBirthTargetPropertiesChange
    TabOrder = 8
    Width = 80
  end
  object dbce12MonthTarget: TcxDBCurrencyEdit [5]
    Left = 188
    Top = 204
    DataBinding.DataField = '12MonthTarget'
    DataBinding.DataSource = WinData.dsTargetWeights
    Properties.DisplayFormat = '0.00'
    Properties.EditFormat = '0.00'
    Properties.OnChange = dbceBirthTargetPropertiesChange
    TabOrder = 9
    Width = 80
  end
  object dbce15MonthTarget: TcxDBCurrencyEdit [6]
    Left = 188
    Top = 240
    DataBinding.DataField = '15MonthTarget'
    DataBinding.DataSource = WinData.dsTargetWeights
    Properties.DisplayFormat = '0.00'
    Properties.EditFormat = '0.00'
    Properties.OnChange = dbceBirthTargetPropertiesChange
    TabOrder = 10
    Width = 80
  end
  object dbce21MonthTarget: TcxDBCurrencyEdit [7]
    Left = 188
    Top = 276
    DataBinding.DataField = '21MonthTarget'
    DataBinding.DataSource = WinData.dsTargetWeights
    Properties.DisplayFormat = '0.00'
    Properties.EditFormat = '0.00'
    Properties.OnChange = dbceBirthTargetPropertiesChange
    TabOrder = 11
    Width = 80
  end
  object dbce24MonthTarget: TcxDBCurrencyEdit [8]
    Left = 188
    Top = 312
    DataBinding.DataField = '24MonthTarget'
    DataBinding.DataSource = WinData.dsTargetWeights
    Properties.DisplayFormat = '0.00'
    Properties.EditFormat = '0.00'
    Properties.OnChange = dbceBirthTargetPropertiesChange
    TabOrder = 12
    Width = 80
  end
  object lBirth: TcxLabel [9]
    Left = 56
    Top = 63
    AutoSize = False
    Caption = 'Birth:'
    Properties.Alignment.Horz = taLeftJustify
    Height = 21
    Width = 112
  end
  object l6Weeks: TcxLabel [10]
    Left = 56
    Top = 99
    AutoSize = False
    Caption = '6 Weeks:'
    Properties.Alignment.Horz = taLeftJustify
    Height = 21
    Width = 112
  end
  object l3Months: TcxLabel [11]
    Left = 56
    Top = 135
    AutoSize = False
    Caption = '3 Months:'
    Properties.Alignment.Horz = taLeftJustify
    Height = 21
    Width = 112
  end
  object l6Months: TcxLabel [12]
    Left = 56
    Top = 171
    AutoSize = False
    Caption = '6 Months:'
    Properties.Alignment.Horz = taLeftJustify
    Height = 21
    Width = 112
  end
  object l12Months: TcxLabel [13]
    Left = 56
    Top = 207
    AutoSize = False
    Caption = '12 Months:'
    Properties.Alignment.Horz = taLeftJustify
    Height = 21
    Width = 112
  end
  object l15Months: TcxLabel [14]
    Left = 56
    Top = 243
    AutoSize = False
    Caption = '15 Months:'
    Properties.Alignment.Horz = taLeftJustify
    Height = 21
    Width = 112
  end
  object l21Months: TcxLabel [15]
    Left = 56
    Top = 279
    AutoSize = False
    Caption = '21 Months:'
    Properties.Alignment.Horz = taLeftJustify
    Height = 21
    Width = 112
  end
  object l24Months: TcxLabel [16]
    Left = 56
    Top = 315
    AutoSize = False
    Caption = '24 Months:'
    Properties.Alignment.Horz = taLeftJustify
    Height = 21
    Width = 112
  end
  object lDailyKgWarning: TcxLabel [17]
    Left = 56
    Top = 352
    AutoSize = False
    Caption = 'Daily Kg Warning:'
    Properties.Alignment.Horz = taLeftJustify
    Height = 21
    Width = 112
  end
  object dbceDailKgWarning: TcxDBCurrencyEdit [18]
    Left = 188
    Top = 349
    DataBinding.DataField = 'DailyKgWarning'
    DataBinding.DataSource = WinData.dsTargetWeights
    Properties.DisplayFormat = '0.00'
    Properties.EditFormat = '0.00'
    Properties.OnChange = dbceBirthTargetPropertiesChange
    TabOrder = 22
    Width = 80
  end
  inherited ActionList: TActionList
    Left = 309
    Top = 10
    object actSave: TAction
      Caption = 'Save'
      ImageIndex = 8
      OnExecute = actSaveExecute
    end
    object actCancel: TAction
      Caption = 'Cancel'
      ImageIndex = 21
      OnExecute = actCancelExecute
    end
  end
  inherited BarManager: TdxBarManager
    Bars = <
      item
        Caption = 'Toolbar'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 465
        FloatTop = 314
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = blbExit
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton4
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton3
            UserGlyph.Data = {00000000}
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton2
            UserGlyph.Data = {00000000}
            Visible = True
          end>
        Name = 'Toolbar'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
        BackgroundBitmap.Data = {00000000}
      end>
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 279
    Top = 10
    DockControlHeights = (
      0
      0
      49
      0)
    object blbSave: TdxBarLargeButton
      Action = actSave
      Category = 0
      Height = 45
      Width = 65
    end
    object blbCancel: TdxBarLargeButton
      Action = actCancel
      Category = 0
      Height = 45
      Width = 65
    end
    object blbExit: TdxBarLargeButton
      Action = actClose
      Category = 0
      Height = 45
      Width = 65
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Action = actHelp
      Category = 0
      Height = 45
      Width = 65
    end
    object dxBarLargeButton3: TdxBarLargeButton
      Action = actCancel
      Category = 0
      Height = 45
      Width = 65
    end
    object dxBarLargeButton4: TdxBarLargeButton
      Action = actSave
      Category = 0
      Height = 45
      Width = 65
    end
  end
end
