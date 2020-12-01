object fQuotaMan: TfQuotaMan
  Left = 186
  Top = 198
  Width = 657
  Height = 575
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Milk Quota Planner'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcQuota: TPageControl
    Left = 0
    Top = 53
    Width = 1677
    Height = 1280
    ActivePage = tsQuotaFigures
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    HotTrack = True
    ParentFont = False
    TabHeight = 35
    TabOrder = 0
    OnChange = pcQuotaChange
    OnChanging = pcQuotaChanging
    object tsQuotaFigures: TTabSheet
      Caption = 'Quota Figures'
      object Label1: TLabel
        Left = 10
        Top = 58
        Width = 86
        Height = 14
        Caption = 'Annual Quota'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 10
        Top = 142
        Width = 216
        Height = 14
        Caption = 'Milk Supplied to end of Last Month'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 10
        Top = 220
        Width = 71
        Height = 14
        Caption = '1st Calvers'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 10
        Top = 248
        Width = 73
        Height = 14
        Caption = 'Older Cows'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 10
        Top = 276
        Width = 62
        Height = 14
        Caption = 'Cull Cows'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 238
        Top = 384
        Width = 83
        Height = 13
        Caption = 'Avg. Days Fed'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 10
        Top = 327
        Width = 71
        Height = 14
        Caption = '1st Calvers'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 10
        Top = 355
        Width = 73
        Height = 14
        Caption = 'Older Cows'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 10
        Top = 378
        Width = 89
        Height = 16
        Caption = 'Calf Feeding'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 10
        Top = 403
        Width = 187
        Height = 14
        Caption = 'Average Days Calves Fed Milk'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object lLitresOrGallons: TLabel
        Left = 10
        Top = 431
        Width = 166
        Height = 14
        Caption = 'Litres/Gallons Fed per Day'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 10
        Top = 30
        Width = 175
        Height = 14
        Caption = 'Milk Units (Litres or Gallons)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label26: TLabel
        Left = 382
        Top = 220
        Width = 87
        Height = 14
        Caption = 'Dry Off Period'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label27: TLabel
        Left = 382
        Top = 248
        Width = 87
        Height = 14
        Caption = 'Dry Off Period'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label28: TLabel
        Left = 382
        Top = 276
        Width = 109
        Height = 14
        Caption = 'Sale/Dry Off Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object lReferenceBFat: TLabel
        Left = 382
        Top = 5
        Width = 125
        Height = 14
        Caption = 'Reference ButterFat'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object lExpectedBFat: TLabel
        Left = 382
        Top = 33
        Width = 120
        Height = 14
        Caption = 'Expected ButterFat'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object lAdjustAmount: TLabel
        Left = 10
        Top = 86
        Width = 132
        Height = 14
        Caption = 'Butterfat Adjustment'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object lQuotaAmount: TLabel
        Left = 10
        Top = 114
        Width = 151
        Height = 14
        Caption = 'Adjusted Quota Amount'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 10
        Top = 170
        Width = 158
        Height = 14
        Caption = 'Last Milk Statement Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 382
        Top = 170
        Width = 111
        Height = 14
        Caption = 'Herd Dry Off Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 10
        Top = 200
        Width = 89
        Height = 14
        Caption = 'End Lactation'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 240
        Top = 201
        Width = 90
        Height = 13
        Caption = 'Avg. Daily Yield'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 10
        Top = 307
        Width = 197
        Height = 14
        Caption = 'Fresh Calver ( to 31st March)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 240
        Top = 308
        Width = 90
        Height = 13
        Caption = 'Avg. Daily Yield'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object dbeAnnualQuota: TDBEdit
        Left = 240
        Top = 58
        Width = 91
        Height = 22
        DataField = 'AnnualQuota'
        DataSource = dsQuotaDefaults
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnChange = dbeAnnualQuotaChange
      end
      object DBEdit2: TDBEdit
        Left = 240
        Top = 142
        Width = 91
        Height = 22
        DataField = 'MilkSupply'
        DataSource = dsQuotaDefaults
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnExit = DBEdit2Exit
      end
      object DBEdit3: TDBEdit
        Left = 240
        Top = 220
        Width = 69
        Height = 22
        DataField = 'AFirstCalverDY'
        DataSource = dsQuotaDefaults
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
        OnExit = DBEdit3Exit
      end
      object DBEdit4: TDBEdit
        Left = 240
        Top = 248
        Width = 69
        Height = 22
        DataField = 'AOlderCowsDY'
        DataSource = dsQuotaDefaults
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object DBEdit5: TDBEdit
        Left = 240
        Top = 276
        Width = 69
        Height = 22
        DataField = 'ACullBarrenDY'
        DataSource = dsQuotaDefaults
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
      object DBEdit6: TDBEdit
        Left = 510
        Top = 220
        Width = 69
        Height = 22
        DataField = 'AFirstCalverDtoDO'
        DataSource = dsQuotaDefaults
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
      end
      object DBEdit7: TDBEdit
        Left = 510
        Top = 248
        Width = 69
        Height = 22
        DataField = 'AOlderCowsDtoDO'
        DataSource = dsQuotaDefaults
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
      end
      object DBDateEdit1: TDBDateEdit
        Left = 510
        Top = 276
        Width = 107
        Height = 24
        DataField = 'ACullBarrenDate'
        DataSource = dsQuotaDefaults
        CheckOnExit = True
        DefaultToday = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 14
        YearDigits = dyFour
      end
      object DBEdit8: TDBEdit
        Left = 240
        Top = 327
        Width = 69
        Height = 22
        DataField = 'BFirstCalverDY'
        DataSource = dsQuotaDefaults
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 15
        OnExit = DBEdit8Exit
      end
      object DBEdit9: TDBEdit
        Left = 240
        Top = 355
        Width = 69
        Height = 22
        DataField = 'BOlderCowsDY'
        DataSource = dsQuotaDefaults
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 16
      end
      object DBEdit10: TDBEdit
        Left = 240
        Top = 403
        Width = 69
        Height = 22
        DataField = 'AvgDaysCalvesFed'
        DataSource = dsQuotaDefaults
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 17
      end
      object DBEdit11: TDBEdit
        Left = 240
        Top = 431
        Width = 69
        Height = 22
        DataField = 'LitreGallonsPerDay'
        DataSource = dsQuotaDefaults
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 18
      end
      object cbLitresOrGallons: TDBComboBox
        Left = 240
        Top = 30
        Width = 107
        Height = 22
        DataField = 'MilkUnits'
        DataSource = dsQuotaDefaults
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ItemHeight = 14
        Items.Strings = (
          'Litres'
          'Gallons')
        ParentFont = False
        TabOrder = 1
        OnExit = cbLitresOrGallonsExit
      end
      object cbAdjustBFat: TDBCheckBox
        Left = 8
        Top = 2
        Width = 337
        Height = 21
        Hint = 'Press <Space Bar> to change'
        Alignment = taLeftJustify
        Caption = 'Apply Butterfat Adjustment to your Milk Quota'
        DataField = 'AdjustQuota'
        DataSource = dsQuotaDefaults
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = cbAdjustBFatClick
      end
      object dbeReferenceBFat: TDBEdit
        Left = 510
        Top = 5
        Width = 69
        Height = 22
        DataField = 'ReferenceBFat'
        DataSource = dsQuotaDefaults
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnExit = dbeReferenceBFatExit
      end
      object dbeExpectedBFat: TDBEdit
        Left = 510
        Top = 33
        Width = 69
        Height = 22
        DataField = 'ExpectedBFat'
        DataSource = dsQuotaDefaults
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnExit = dbeReferenceBFatExit
      end
      object mAdjustBFat: TMemo
        Left = 382
        Top = 63
        Width = 239
        Height = 73
        TabStop = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Lines.Strings = (
          'Two other conditions must be met'
          '(1)  National Butterfat Quota must '
          'be triggered'
          '(2)  The Co-op must be over quota')
        ParentFont = False
        ReadOnly = True
        TabOrder = 19
      end
      object dbeAdjustAmount: TDBEdit
        Left = 240
        Top = 86
        Width = 91
        Height = 22
        TabStop = False
        DataField = 'AdjustAmount'
        DataSource = dsQuotaDefaults
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        OnChange = dbeAdjustAmountChange
      end
      object dbeQuotaAmount: TDBEdit
        Left = 240
        Top = 114
        Width = 91
        Height = 22
        TabStop = False
        DataField = 'QuotaAmount'
        DataSource = dsQuotaDefaults
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object LastMilkDate: TDBDateEdit
        Left = 240
        Top = 170
        Width = 107
        Height = 24
        DataField = 'LastMilkDate'
        DataSource = dsQuotaDefaults
        CheckOnExit = True
        DefaultToday = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 8
        YearDigits = dyFour
        OnExit = LastMilkDateExit
      end
      object DBDateEdit2: TDBDateEdit
        Left = 510
        Top = 170
        Width = 107
        Height = 24
        DataField = 'HerdDryOffDate'
        DataSource = dsQuotaDefaults
        CheckOnExit = True
        DefaultToday = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        NumGlyphs = 2
        ParentFont = False
        TabOrder = 20
        YearDigits = dyFour
        OnExit = DBDateEdit2Exit
      end
      object DBCheckBox1: TDBCheckBox
        Left = 382
        Top = 141
        Width = 235
        Height = 21
        Hint = 'Press <Space Bar> to change'
        Alignment = taLeftJustify
        Caption = 'Will ALL cows be dried off together?'
        DataField = 'UseHerdDryOff'
        DataSource = dsQuotaDefaults
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        TabOrder = 21
        ValueChecked = 'True'
        ValueUnchecked = 'False'
        OnClick = DBCheckBox1Click
      end
    end
    object tsQuotaResults: TTabSheet
      Caption = 'Quota Results'
      object l1: TLabel
        Left = 42
        Top = 11
        Width = 89
        Height = 14
        Caption = 'Annual Quota'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object l3: TLabel
        Left = 68
        Top = 77
        Width = 225
        Height = 14
        Caption = 'End Lactation - Cull Cow Production'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object l4: TLabel
        Left = 68
        Top = 107
        Width = 234
        Height = 14
        Caption = 'End Lactation - 1st Calver Production'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object l5: TLabel
        Left = 68
        Top = 138
        Width = 236
        Height = 14
        Caption = 'End Lactation - Older Cow Production'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object l6: TLabel
        Left = 68
        Top = 169
        Width = 227
        Height = 14
        Caption = 'Fresh Calver - 1st Calver Production'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object l7: TLabel
        Left = 68
        Top = 199
        Width = 229
        Height = 14
        Caption = 'Fresh Calver - Older Cow Production'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object l8: TLabel
        Left = 42
        Top = 229
        Width = 179
        Height = 14
        Caption = 'Production this Quota Year'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object l10: TLabel
        Left = 68
        Top = 272
        Width = 97
        Height = 28
        Caption = 'Less Milk to be fed to'
        WordWrap = True
      end
      object lQuotaResult: TLabel
        Left = 42
        Top = 338
        Width = 94
        Height = 20
        Caption = 'Quota Result'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object l2: TLabel
        Left = 68
        Top = 47
        Width = 216
        Height = 14
        Caption = 'Milk Supplied to end of Last Month'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object l11: TLabel
        Left = 42
        Top = 310
        Width = 153
        Height = 14
        Caption = 'Supply this Quota Year'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object l13: TLabel
        Left = 232
        Top = 278
        Width = 39
        Height = 14
        Caption = 'calves'
        WordWrap = True
      end
      object Label19: TLabel
        Left = 42
        Top = 364
        Width = 485
        Height = 26
        Caption = 
          'Note: If your average butterfat exceeds the reference figure, th' +
          'en your excess milk production may be under-estimated by the pro' +
          'gram'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        WordWrap = True
      end
      object Label21: TLabel
        Left = 42
        Top = 395
        Width = 561
        Height = 28
        Caption = 
          'WARNING: These figures are indicative only. It is essential to h' +
          'ave them checked by your adviser or consultant, particularly if ' +
          'your milk delivered is close to your quota'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object dbeQuotaToUse: TDBEdit
        Left = 428
        Top = 6
        Width = 101
        Height = 22
        TabStop = False
        DataField = 'AnnualQuota'
        DataSource = dsQuotaDefaults
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object rA1: TCurrencyEdit
        Left = 468
        Top = 77
        Width = 61
        Height = 25
        TabStop = False
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        ReadOnly = True
        TabOrder = 1
      end
      object rA2: TCurrencyEdit
        Left = 468
        Top = 107
        Width = 61
        Height = 25
        TabStop = False
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        ReadOnly = True
        TabOrder = 2
      end
      object rA3: TCurrencyEdit
        Left = 468
        Top = 138
        Width = 61
        Height = 25
        TabStop = False
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        ReadOnly = True
        TabOrder = 3
      end
      object rA4: TCurrencyEdit
        Left = 468
        Top = 169
        Width = 61
        Height = 25
        TabStop = False
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        ReadOnly = True
        TabOrder = 4
      end
      object rA5: TCurrencyEdit
        Left = 468
        Top = 199
        Width = 61
        Height = 25
        TabStop = False
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        ReadOnly = True
        TabOrder = 5
      end
      object rSupplyThisYear: TCurrencyEdit
        Left = 428
        Top = 229
        Width = 101
        Height = 25
        TabStop = False
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        ReadOnly = True
        TabOrder = 6
      end
      object rA7: TCurrencyEdit
        Left = 468
        Top = 268
        Width = 61
        Height = 25
        TabStop = False
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        ReadOnly = True
        TabOrder = 7
      end
      object rQuotaResult: TCurrencyEdit
        Left = 428
        Top = 335
        Width = 101
        Height = 25
        TabStop = False
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
      object DBEdit13: TDBEdit
        Left = 456
        Top = 41
        Width = 73
        Height = 22
        TabStop = False
        DataField = 'MilkSupply'
        DataSource = dsQuotaDefaults
        ReadOnly = True
        TabOrder = 9
      end
      object TotalSupply: TCurrencyEdit
        Left = 428
        Top = 306
        Width = 101
        Height = 25
        TabStop = False
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        ReadOnly = True
        TabOrder = 10
      end
      object pDoingSomething: TPanel
        Left = 66
        Top = 425
        Width = 505
        Height = 33
        BevelOuter = bvNone
        TabOrder = 11
        object Label7: TLabel
          Left = 10
          Top = 8
          Width = 171
          Height = 14
          Caption = 'Calculating Quota results...'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          WordWrap = True
        end
        object DoingSomething: TProgressBar
          Left = 195
          Top = 7
          Width = 296
          Height = 19
          Min = 0
          Max = 100
          Smooth = True
          TabOrder = 0
        end
      end
      object rA6: TCurrencyEdit
        Left = 183
        Top = 269
        Width = 40
        Height = 24
        TabStop = False
        AutoSize = False
        DecimalPlaces = 0
        DisplayFormat = '0'
        ReadOnly = True
        TabOrder = 12
      end
    end
  end
  object qrQuotaResults: TQuickRep
    Left = 554
    Top = 539
    Width = 1123
    Height = 794
    Frame.Color = clBlack
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = qQuotaResults
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poLandscape
    Page.PaperSize = A4
    Page.Values = (
      100
      2100
      100
      2970
      100
      100
      0)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrintIfEmpty = False
    ReportTitle = 'Quota Planner - Production Results'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object TitleBand1: TQRBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 147
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        388.9375
        2770.1875)
      BandType = rbPageHeader
      object QRLabel13: TQRLabel
        Left = 4
        Top = 4
        Width = 423
        Height = 35
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          92.6041666666667
          10.5833333333333
          10.5833333333333
          1119.1875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Quota Planner - Production Results'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -29
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 22
      end
      object QRSysData7: TQRSysData
        Left = 886
        Top = 12
        Width = 149
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2344.20833333333
          31.75
          394.229166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsDateTime
        Text = 'Date : '
        Transparent = False
        FontSize = 10
      end
      object QRSysData8: TQRSysData
        Left = 934
        Top = 32
        Width = 101
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2471.20833333333
          84.6666666666667
          267.229166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsPageNumber
        Text = 'Page : '
        Transparent = False
        FontSize = 10
      end
      object QRShape5: TQRShape
        Left = 23
        Top = 53
        Width = 1001
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          60.8541666666667
          140.229166666667
          2648.47916666667)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel23: TQRLabel
        Left = 751
        Top = 117
        Width = 70
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1987.02083333333
          309.5625
          185.208333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Days Fed'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel24: TQRLabel
        Left = 831
        Top = 117
        Width = 70
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          2198.6875
          309.5625
          185.208333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Milk Fed '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 498
        Top = 117
        Width = 67
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1317.625
          309.5625
          177.270833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Production'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 426
        Top = 117
        Width = 75
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1127.125
          309.5625
          198.4375)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Days In Milk'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 660
        Top = 117
        Width = 67
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          1746.25
          309.5625
          177.270833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Production'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 585
        Top = 117
        Width = 75
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.0833333333333
          1547.8125
          309.5625
          198.4375)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Days In Milk'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel15: TQRLabel
        Left = 14
        Top = 99
        Width = 57
        Height = 44
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          116.416666666667
          37.0416666666667
          261.9375
          150.8125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Animal Number'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel16: TQRLabel
        Left = 72
        Top = 99
        Width = 49
        Height = 44
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          116.416666666667
          190.5
          261.9375
          129.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Lact. No.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel17: TQRLabel
        Left = 336
        Top = 99
        Width = 64
        Height = 44
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          116.416666666667
          889
          261.9375
          169.333333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Projected Calving Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel19: TQRLabel
        Left = 266
        Top = 99
        Width = 64
        Height = 44
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          116.416666666667
          703.791666666667
          261.9375
          169.333333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Projected Drying Off Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel25: TQRLabel
        Left = 952
        Top = 99
        Width = 70
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.1875
          2518.83333333333
          261.9375
          185.208333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Net Production'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel28: TQRLabel
        Left = 192
        Top = 99
        Width = 64
        Height = 44
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          116.416666666667
          508
          261.9375
          169.333333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Last Calving Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel29: TQRLabel
        Left = 122
        Top = 99
        Width = 64
        Height = 44
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          116.416666666667
          322.791666666667
          261.9375
          169.333333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Last Drying Off Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 585
        Top = 99
        Width = 142
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1547.8125
          261.9375
          375.708333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Fresh Calvers'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel5: TQRLabel
        Left = 426
        Top = 99
        Width = 139
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1127.125
          261.9375
          367.770833333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'End Lactation'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel7: TQRLabel
        Left = 751
        Top = 99
        Width = 150
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1987.02083333333
          261.9375
          396.875)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Calf Feeding'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 38
      Top = 185
      Width = 1047
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.2083333333333
        2770.1875)
      Master = qrQuotaResults
      DataSet = qQuotaResults
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText1: TQRDBText
        Left = 14
        Top = 3
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          37.0416666666667
          7.9375
          121.708333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qQuotaResults
        DataField = 'AnimalNo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 76
        Top = 3
        Width = 35
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          201.083333333333
          7.9375
          92.6041666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qQuotaResults
        DataField = 'LactNo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 192
        Top = 3
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          508
          7.9375
          211.666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qQuotaResults
        DataField = 'PriorCalvingDate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText3Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 122
        Top = 3
        Width = 92
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          322.791666666667
          7.9375
          243.416666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qQuotaResults
        DataField = 'PriorDryingOffDate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText3Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 336
        Top = 3
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          889
          7.9375
          209.020833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qQuotaResults
        DataField = 'LastCalvingDate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText3Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 266
        Top = 3
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          703.791666666667
          7.9375
          185.208333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qQuotaResults
        DataField = 'DryingOffDate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText3Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 498
        Top = 3
        Width = 67
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1317.625
          7.9375
          177.270833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qQuotaResults
        DataField = 'PriorProduction'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText11Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 660
        Top = 3
        Width = 67
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1746.25
          7.9375
          177.270833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qQuotaResults
        DataField = 'Production'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText11Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 735
        Top = 3
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1944.6875
          7.9375
          185.208333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qQuotaResults
        DataField = 'DaysFedMilk'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText11Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText11: TQRDBText
        Left = 815
        Top = 3
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2156.35416666667
          7.9375
          185.208333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qQuotaResults
        DataField = 'MilkFed'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText11Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRExpr1: TQRExpr
        Left = 925
        Top = 4
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          2447.39583333333
          10.5833333333333
          256.645833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = QRSubDetail1
        ParentFont = False
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = '(PriorProduction + Production) - MilkFed'
        FontSize = 8
      end
      object QRDBText12: TQRDBText
        Left = 426
        Top = 3
        Width = 75
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1127.125
          7.9375
          198.4375)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qQuotaResults
        DataField = 'PriorMilkDays'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText11Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText13: TQRDBText
        Left = 585
        Top = 3
        Width = 75
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1547.8125
          7.9375
          198.4375)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qQuotaResults
        DataField = 'MilkDays'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = QRDBText11Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 4
        Top = 3
        Width = 5
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          10.5833333333333
          7.9375
          13.2291666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '*'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        OnPrint = QRLabel8Print
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object QRBand5: TQRBand
      Left = 38
      Top = 207
      Width = 1047
      Height = 66
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        174.625
        2770.1875)
      BandType = rbSummary
      object QRExpr2: TQRExpr
        Left = 462
        Top = 20
        Width = 103
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1222.375
          52.9166666666667
          272.520833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = QRSubDetail1
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        WordWrap = True
        Expression = 'Sum(PriorProduction)'
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 38
        Top = 20
        Width = 35
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.6875
          100.541666666667
          52.9166666666667
          92.6041666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Total:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRExpr3: TQRExpr
        Left = 646
        Top = 20
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1709.20833333333
          52.9166666666667
          214.3125)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = QRSubDetail1
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        WordWrap = True
        Expression = 'Sum(Production)'
        FontSize = 8
      end
      object QRExpr4: TQRExpr
        Left = 741
        Top = 20
        Width = 276
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1960.5625
          52.9166666666667
          730.25)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = QRSubDetail1
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        WordWrap = True
        Expression = 'Sum(PriorProduction)  +  SUM(Production) - Sum(MilkFed)'
        FontSize = 8
      end
      object QRExpr5: TQRExpr
        Left = 77
        Top = 20
        Width = 36
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          203.729166666667
          52.9166666666667
          95.25)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        Master = QRSubDetail1
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        WordWrap = True
        Expression = 'COUNT'
        FontSize = 8
      end
    end
    object QRBand6: TQRBand
      Left = 38
      Top = 273
      Width = 1047
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.5
        2770.1875)
      BandType = rbPageFooter
      object QRLabel10: TQRLabel
        Left = 6
        Top = 4
        Width = 275
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          15.875
          10.5833333333333
          727.604166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Kingswood Computing Ltd.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object l: TQRLabel
        Left = 648
        Top = 4
        Width = 393
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1714.5
          10.5833333333333
          1039.8125)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'verno'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Verdana'
        Font.Style = []
        OnPrint = lPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 1677
    Height = 53
    ButtonHeight = 45
    ButtonWidth = 86
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    TabOrder = 1
    object ToolButton2: TToolButton
      Left = 0
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 2
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
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        42040000424D4204000000000000420000002800000020000000100000000100
        1000030000000004000000000000000000000000000000000000007C0000E003
        00001F000000E03DE03D00000000000000000000000000000000000000000000
        E03DE03DE03DE03DE03DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DFF7FEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003CE07F003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DEF3DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DFF7FFF7FFF7FFF7FFF7FE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003CFF03FF03FF03FF03FF03003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DEF3DEF3DEF3DEF3DEF3DFF7FE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003CFF03FF03FF03FF03FF03003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DEF3DFF7FFF7FFF7FEF3DFF7FE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003CFF03FF03FF03FF03FF03003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DEF3DEF3DEF3DEF3DEF3DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FE03DE03DE03DE03DE03DE03DE03DE03DEF3D
        FF7FE03DE03DE03DE03D0000003C003C003C003C003C003C003C003C003C0000
        E03DE03DE03DE03DE03DEF3DFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FEF3D
        FF7FE03DE03DE03DE03D00000000000000000000000000000000000000000000
        E03DE03DE03DE03DE03DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D
        E03DE03DE03D}
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbExitClick
    end
    object ToolButton1: TToolButton
      Left = 66
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 0
      Style = tbsDivider
    end
    object sbPreview: TRxSpeedButton
      Left = 74
      Top = 2
      Width = 86
      Height = 45
      Hint = 'Click Here To View This Reprot On Screen'
      Caption = 'Pre&view'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 1979867
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      Glyph.Data = {
        42040000424D4204000000000000420000002800000020000000100000000100
        1000030000000004000000000000000000000000000000000000007C0000E003
        00001F000000E03D000000000000000000000000000000000000000000000000
        0000E03DE03DE03DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D
        EF3DFF7FE03DE03D0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        0000E03DE03DE03DEF3DE03DFF7FE03DFF7FE03DFF7FE03DFF7FE03DFF7FE03D
        EF3DE03DE03DE03DE03D0000FF7F0000FF7F0000FF7F0000FF7F0000FF7F0000
        E03DE03DE03DE03DFF7FEF3DFF7FEF3DE03DEF3DE03DEF3DE03DEF3DE03DEF3D
        FF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
        00000000E03DEF3DEF3DEF3DEF3DE03DFF7FFF7FFF7FFF7FFF7FFF7FEF3DEF3D
        EF3DEF3DFF7F0000FF7FFF7FF75E0000000000000000000000000000F75EFF7F
        FF7F0000E03DEF3DFF7FE03DFF7FEF3DEF3DEF3DEF3DEF3DEF3DEF3DE03DFF7F
        FF7FEF3DFF7F0000FF7F007CFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000
        00000000E03DEF3DFF7FEF3DE03DE03DE03DE03DE03DE03DE03DE03DEF3DEF3D
        EF3DEF3DFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7F0000E03DEF3DE03DFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FEF3DE03DE03D000000000000000000000000000000000000000000000000
        0000E03DE03DE03DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D
        EF3DE03DE03DE03DE03DE03D000000000000000000000000000000000000E03D
        E03DE03DE03DE03DE03DE03DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DFF7F
        E03DE03DE03DE03DE03DE03D0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000E03D
        E03DE03DE03DE03DE03DE03DEF3DFF7FE03DFF7FFF7FFF7FFF7FFF7FEF3DFF7F
        E03DE03DE03DE03DE03DE03D0000FF7F00000000000000000000FF7F0000E03D
        E03DE03DE03DE03DE03DE03DEF3DFF7FEF3DEF3DEF3DEF3DEF3DFF7FEF3DFF7F
        E03DE03DE03DE03DE03DE03D0000FF7F0000E003E003FF030000FF7F0000E03D
        E03DE03DE03DE03DE03DE03DEF3DFF7FEF3DFF7FE03DE03DEF3DFF7FEF3DFF7F
        E03DE03DE03DE03DE03DE03D0000FF7F00001F7CE0031F7C0000FF7F0000E03D
        E03DE03DE03DE03DE03DE03DEF3DFF7FEF3DFF7FFF7FFF7FEF3DFF7FEF3DFF7F
        E03DE03DE03DE03DE03DE03D0000FF7F00000000000000000000FF7F0000E03D
        E03DE03DE03DE03DE03DE03DEF3DFF7FEF3DEF3DEF3DEF3DEF3DE03DEF3DFF7F
        E03DE03DE03DE03DE03DE03D0000FF7FFF7FFF7FFF7FFF7FFF7FFF7F0000E03D
        E03DE03DE03DE03DE03DE03DEF3DFF7FFF7FFF7FFF7FFF7FFF7FFF7FEF3DFF7F
        E03DE03DE03DE03DE03DE03D000000000000000000000000000000000000E03D
        E03DE03DE03DE03DE03DE03DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DE03D
        E03DE03DE03D}
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbPreviewClick
    end
    object sbMoreDetail: TRxSpeedButton
      Left = 160
      Top = 2
      Width = 86
      Height = 45
      Caption = '&Details'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        42040000424D4204000000000000420000002800000020000000100000000100
        1000030000000004000000000000000000000000000000000000007C0000E003
        00001F0000000F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C
        0F3C0F3C0F3C0F3C0F3C0F3CFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        0F3C0F3C0F3C0F3C0F3C0F3C0000000000000000000000000000000000000000
        0F3C0F3C0F3C0F3C0F3CEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DFF7F
        0F3C0F3C0F3C0F3C0F3C0F3C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
        0F3C0F3C0F3C0F3C0F3CEF3DFF7F0F3CFF7FFF7FFF7FFF7F0F3C0F3CEF3DFF7F
        0F3C0F3C0F3C0F3C0F3C0F3C0000FF7F0000000000000000FF7FFF7FFF7F0000
        0F3C0F3C0F3C0F3C0F3CEF3DFF7FEF3DEF3DEF3DEF3D0F3C0F3C0F3CEF3DFF7F
        0F3C0F3C0F3C0F3C0F3C0F3C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
        0F3C0F3C0F3C0F3C0F3CEF3DFF7F0F3CFF7FFF7FFF7FFF7FFF7FFF7FEF3DFF7F
        0F3C0F3C0F3C0F3C0F3C0F3C0000FF7F000000000000000000000000FF7F0000
        0F3C0F3C0F3C0F3C0F3CEF3DFF7FEF3DEF3DEF3DEF3DEF3DEF3D0F3CEF3DFF7F
        0F3C0F3C0F3C0F3C0F3C0F3C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
        0F3C0F3C0F3C0F3C0F3CEF3DFF7F0F3CFF7FFF7FFF7FFF7FFF7FFF7FEF3DFF7F
        0F3C0F3C0F3C0F3C0F3C0F3C0000FF7F000000000000000000000000FF7F0000
        0F3C0F3C0F3C0F3C0F3CEF3DFF7FEF3DEF3DEF3DEF3DEF3DEF3D0F3CEF3DFF7F
        0F3C0F3C0F3C0F3C0F3C0F3C0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000
        0F3C0F3C0F3C0F3C0F3CEF3DFF7F0F3CFF7FFF7FFF7F0F3C0F3C0F3CEF3DFF7F
        0F3C0F3C0F3C0F3C0F3C0F3C0000FF7F000000000000FF7FFF7FFF7FFF7F0000
        0F3C0F3C0F3C0F3C0F3CEF3DFF7FEF3DEF3DEF3D0F3C0F3CFF7FFF7FEF3DFF7F
        0F3C0F3C0F3C0F3C0F3C0F3C0000FF7FFF7FFF7FFF7FFF7F0000000000000000
        0F3C0F3C0F3C0F3C0F3CEF3DFF7F0F3CFF7FFF7F0F3CEF3DEF3DEF3DEF3D0F3C
        0F3C0F3C0F3C0F3C0F3C0F3C0000FF7F00000000FF7FFF7F0000FF7F00000F3C
        0F3C0F3C0F3C0F3C0F3CEF3DFF7FEF3DEF3D0F3C0F3CEF3DFF7FEF3D0F3C0F3C
        0F3C0F3C0F3C0F3C0F3C0F3C0000FF7FFF7FFF7FFF7FFF7F000000000F3C0F3C
        0F3C0F3C0F3C0F3C0F3CEF3DFF7FFF7FFF7FFF7FFF7FEF3DEF3D0F3C0F3C0F3C
        0F3C0F3C0F3C0F3C0F3C0F3C00000000000000000000000000000F3C0F3C0F3C
        0F3C0F3C0F3C0F3C0F3CEF3DEF3DEF3DEF3DEF3DEF3DEF3D0F3C0F3C0F3C0F3C
        0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C
        0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C
        0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C
        0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C0F3C
        0F3C0F3C0F3C}
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbMoreDetailClick
    end
    object sbCullList: TRxSpeedButton
      Left = 246
      Top = 2
      Width = 86
      Height = 45
      Hint = 'Click Here To Print This Report'
      Caption = '&List Culls'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        42040000424D4204000000000000420000002800000020000000100000000100
        1000030000000004000000000000000000000000000000000000007C0000E003
        00001F0000000F3C0F3C0F3C0F3C0F3C0F3C0000000000000000000000000000
        0000000000000F3C0F3C0F3C0F3C0F3CFF7FEF3DEF3DEF3DEF3DEF3DEF3DEF3D
        EF3DEF3DEF3D0F3C0F3C0F3C0F3C000000000000FF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7F00000F3C0F3C0F3CFF7FEF3DEF3DEF3DFF7F0F3CFF7FFF7FFF7FFF7F
        0F3C0F3CEF3D0F3C0F3C000000000000FF7F0000FF7F0000000000000000FF7F
        FF7FFF7F00000F3CFF7FEF3DEF3DEF3DFF7FEF3DFF7FEF3DEF3DEF3DEF3D0F3C
        0F3C0F3CEF3D000000000000FF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7F0000EF3DEF3DEF3DFF7FEF3DFF7FEF3DFF7F0F3CFF7FFF7FFF7FFF7F
        FF7FFF7FEF3D0000FF7F0000FF7F0000FF7F0000FF7F00000000000000000000
        0000FF7F0000EF3DFF7FEF3DFF7FEF3DFF7FEF3DFF7FEF3DEF3DEF3DEF3DEF3D
        EF3D0F3CEF3D0000FF7F0000FF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7F0000EF3DFF7FEF3DFF7FEF3DFF7FEF3DFF7F0F3CFF7FFF7FFF7FFF7F
        FF7FFF7FEF3D0000FF7F0000FF7F0000FF7F0000FF7F00000000000000000000
        0000FF7F0000EF3DFF7FEF3DFF7FEF3DFF7FEF3DFF7FEF3DEF3DEF3DEF3DEF3D
        EF3D0F3CEF3D0000FF7F0000FF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7F0000EF3DFF7FEF3DFF7FEF3DFF7FEF3DFF7F0F3CFF7FFF7FFF7F0F3C
        0F3C0F3CEF3D0000FF7F0000FF7F0000FF7F0000FF7F000000000000FF7FFF7F
        FF7FFF7F0000EF3DFF7FEF3DFF7FEF3DFF7FEF3DFF7FEF3DEF3DEF3D0F3C0F3C
        FF7FFF7FEF3D0000FF7F0000FF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7F0000
        000000000000EF3DFF7FEF3DFF7FEF3DFF7FEF3DFF7F0F3CFF7FFF7F0F3CEF3D
        EF3DEF3DEF3D0000FF7F0000FF7F0000FF7F0000FF7F00000000FF7FFF7F0000
        FF7F00000F3CEF3DFF7FEF3DFF7FEF3DFF7FEF3DFF7FEF3DEF3D0F3C0F3CEF3D
        FF7FEF3D0F3C0000FF7F0000FF7F0000FF7F0000FF7FFF7FFF7FFF7FFF7F0000
        00000F3C0F3CEF3DFF7FEF3DFF7FEF3DFF7FEF3DFF7FFF7FFF7FFF7FFF7FEF3D
        EF3D0F3C0F3C0000FF7F0000FF7F0000FF7F0000000000000000000000000000
        0F3C0F3C0F3CEF3DFF7FEF3DFF7FEF3DFF7FEF3DEF3DEF3DEF3DEF3DEF3DEF3D
        0F3C0F3C0F3C0000FF7F0000FF7F00000000000000000000000000000F3C0F3C
        0F3C0F3C0F3CEF3DFF7FEF3DFF7FEF3DEF3DEF3DEF3DEF3DEF3DEF3D0F3C0F3C
        0F3C0F3C0F3C0000FF7F00000000000000000000000000000F3C0F3C0F3C0F3C
        0F3C0F3C0F3CEF3DFF7FEF3DEF3DEF3DEF3DEF3DEF3DEF3D0F3C0F3C0F3C0F3C
        0F3C0F3C0F3C00000000000000000000000000000F3C0F3C0F3C0F3C0F3C0F3C
        0F3C0F3C0F3CEF3DEF3DEF3DEF3DEF3DEF3DEF3D0F3C0F3C0F3C0F3C0F3C0F3C
        0F3C0F3C0F3C}
      NumGlyphs = 2
      ParentFont = False
      OnClick = sbCullListClick
    end
    object ToolButton5: TToolButton
      Left = 332
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsDivider
    end
    object sbHelp: TRxSpeedButton
      Left = 340
      Top = 2
      Width = 58
      Height = 45
      Caption = '&Help'
      Enabled = False
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      Glyph.Data = {
        DE030000424DDE03000000000000420000002800000016000000150000000100
        1000030000009C03000000000000000000000000000000000000007C0000E003
        00001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FBD775A6B5A6B5B6B9C73
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F5A6B
        11422D258C00CC000F003121554A9C73FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7F955207000B000F009008CB094F091300110050255A67FF7F
        FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F734E06006D0090087208B2082C0A
        8D121412B9101500CF147B6FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F5A6B0700
        4C00900892087300EF09AD0E1113981BBE1ABD101300D135FE7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7F31460A008F0892085308F308AC0EED0E52133B1B3F1E3F15
        D60868015967FF7FFF7FFF7FFF7FFF7FFF7FDE7B0C210F005108720813091209
        6F0ED00E55121E0DFF00BE00B700A901934EFF7FFF7FFF7FFF7FFF7FFF7FBD77
        AC1010002E09AE09D00D5611381119115B08F724D24932562F5608464F3EFF7F
        FF7FFF7FFF7FFF7FFF7FDD7BAE106D018A0E2F0E57111A26FE2D9F21FD106B41
        806A407F407F8366F039FF7FFF7FFF7FFF7FBD77396718630D194B02CB0E0C13
        94239D43DF4A3F363E194F3D485E08770777465A3242FF7FFF7FFF7FFF7F7B6F
        9C73BD7734424902CC0A2D0FB423FE439F4B5F363E19F528913DD149CE492B2D
        185FFF7FFF7FFF7FFF7F9C73FF7FFF7F7B6B6A12CB0A0C0F0F17B627F9333727
        B4118845806A237B207BCC66DE7BFF7FFF7FFF7FFF7F9C73DE7B7B6F7B6F903A
        8A02EC0AAF0E530E30132E134E0A8A49826A237F207F0A77DE7BFF7FFF7FFF7F
        FF7F9C73FF7F9C739C739C739136AA02CF01B3084D0A0E0A9300AE396066037B
        237F007F3473FF7FFF7FFF7FFF7F9C73DE7B7B6F7B6F7B6F7B6BF6522E2A8C01
        AB018D01B0000A124856A072247F227F04777A73FF7FFF7FFF7F9C73DE7B7B6F
        7B6F7B6F7B6F5A6B9C73D552B5529552524AD55A9C736B66E272237F207F0673
        BC7BFF7FFF7F9C73FF7F9C739C739C739C739C73DE7B39671767915A295A4362
        136B176B00620277207B207F5577FF7FFF7F9C73FF7F9C739C739C739C737B6F
        3967F75EB1624066207F427FE8720F46023DA372237B207F7577FF7FFF7F9C73
        FF7FFF7FFF7FFF7FFF7FDE7B5A6B3967BC776A62007F237F227F8066445A237B
        237B007B787BFF7FFF7F9C739C739C739C739C739C737B6F1867FF7FFF7F9C77
        EC72207F207F247F247F207F207B0F73FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7FFF7FFF7FFF7FDE7F54770B77247F247F0A775477DE7FFF7FFF7F
        FF7F}
      ParentFont = False
    end
    object ToolButton3: TToolButton
      Left = 398
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsDivider
    end
    object pHerd: TPanel
      Left = 406
      Top = 2
      Width = 150
      Height = 45
      BevelOuter = bvNone
      TabOrder = 0
      object Label10: TLabel
        Left = 4
        Top = 2
        Width = 83
        Height = 14
        Caption = 'Herd I&dentity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object cbDefaultHerd: TRxDBLookupCombo
        Left = 1
        Top = 18
        Width = 120
        Height = 23
        DropDownCount = 8
        DisplayEmpty = 'All Herds'
        EmptyValue = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Verdana'
        Font.Style = []
        LookupField = 'ID'
        LookupDisplay = 'HerdIdentity'
        LookupSource = WinData.dsHerdDefaults
        ParentFont = False
        TabOrder = 0
        OnChange = cbDefaultHerdChange
      end
    end
  end
  object cbFavourite: TcxCheckBox
    Left = 422
    Top = 60
    AutoSize = False
    Caption = 'Add Report As Favourite'
    ParentFont = False
    Properties.OnChange = cbFavouritePropertiesChange
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Verdana'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 3
    Height = 23
    Width = 213
  end
  object GenQuery: TQuery
    DatabaseName = 'kingswd'
    Left = 400
    Top = 408
  end
  object dsQuotaDefaults: TDataSource
    Left = 432
    Top = 408
  end
  object qQuotaResults: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * From QuotaTemp Where ExcludeFromReport = False')
    Left = 464
    Top = 408
  end
  object QRTextFilter1: TQRTextFilter
    Left = 348
    Top = 126
  end
  object QRCSVFilter1: TQRCSVFilter
    Separator = ','
    Left = 388
    Top = 134
  end
  object QRHTMLFilter1: TQRHTMLFilter
    Left = 380
    Top = 198
  end
  object QRExcelFilter1: TQRExcelFilter
    Left = 396
    Top = 246
  end
  object QRRTFFilter1: TQRRTFFilter
    Left = 356
    Top = 254
  end
  object QRWMFFilter1: TQRWMFFilter
    Enhanced = False
    Left = 356
    Top = 182
  end
end
