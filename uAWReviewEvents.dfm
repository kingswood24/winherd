object fmAWReviewEvents: TfmAWReviewEvents
  Left = 657
  Top = 257
  Width = 646
  Height = 474
  Caption = 'ICBF/Animal Welfare Events Review'
  Color = clBtnFace
  Constraints.MaxHeight = 474
  Constraints.MaxWidth = 646
  Constraints.MinHeight = 474
  Constraints.MinWidth = 646
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 14
    Top = 387
    Width = 600
    Height = 11
    Shape = bsBottomLine
  end
  object Bevel2: TBevel
    Left = 14
    Top = 47
    Width = 600
    Height = 3
    Shape = bsTopLine
  end
  object btnOK: TcxButton
    Left = 538
    Top = 405
    Width = 75
    Height = 25
    Caption = 'Close'
    Default = True
    ModalResult = 1
    TabOrder = 6
    LookAndFeel.NativeStyle = True
  end
  object deEventsStartDate: TcxDateEdit
    Left = 154
    Top = 12
    Properties.DateButtons = [btnToday]
    Properties.ImmediatePost = True
    Properties.PostPopupValueOnTab = True
    Properties.SaveTime = False
    Properties.ShowTime = False
    Properties.OnValidate = deEventsStartDatePropertiesValidate
    Style.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 0
    Width = 165
  end
  object cxLabel7: TcxLabel
    Left = 16
    Top = 14
    Caption = 'Include Events From:'
    Style.TextStyle = [fsBold]
  end
  object cxLabel8: TcxLabel
    Left = 262
    Top = 58
    AutoSize = False
    Caption = 'ICBF Notified'
    Properties.Alignment.Horz = taCenter
    Properties.WordWrap = True
    Height = 30
    Width = 47
  end
  object cxLabel9: TcxLabel
    Left = 208
    Top = 58
    AutoSize = False
    Caption = 'Recorded'
    Properties.Alignment.Horz = taCenter
    Properties.WordWrap = True
    Height = 18
    Width = 51
  end
  object gbWelfareEvents: TcxGroupBox
    Left = 16
    Top = 169
    Caption = 'Other Animal Welfare Events'
    Style.LookAndFeel.NativeStyle = True
    Style.TextStyle = [fsBold]
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 1
    Height = 220
    Width = 302
    object cxLabel3: TcxLabel
      Left = 12
      Top = 40
      Caption = 'Number of Disbudding Events '
    end
    object cxLabel4: TcxLabel
      Left = 12
      Top = 65
      Caption = 'Number of Castration Events '
    end
    object cxLabel5: TcxLabel
      Left = 12
      Top = 90
      Caption = 'Number of Meal Feeding Events '
    end
    object cxLabel6: TcxLabel
      Left = 12
      Top = 115
      Caption = 'Number of Weaning Events '
    end
    object teDisbuddingEvents: TcxTextEdit
      Left = 198
      Top = 40
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 4
      Width = 39
    end
    object teCastrationEvents: TcxTextEdit
      Left = 198
      Top = 65
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 5
      Width = 39
    end
    object teMealFeedingEvents: TcxTextEdit
      Left = 198
      Top = 90
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 6
      Width = 39
    end
    object teWeaningEvents: TcxTextEdit
      Left = 198
      Top = 115
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 7
      Width = 39
    end
    object teDisbuddingEventsNotified: TcxTextEdit
      Left = 247
      Top = 40
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 8
      Width = 39
    end
    object teCastrationEventsNotified: TcxTextEdit
      Left = 247
      Top = 65
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 9
      Width = 39
    end
    object teMealFeedingEventsNotified: TcxTextEdit
      Left = 247
      Top = 90
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 10
      Width = 39
    end
    object teWeaningEventsNotified: TcxTextEdit
      Left = 247
      Top = 115
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 11
      Width = 39
    end
    object cxLabel17: TcxLabel
      Left = 9
      Top = 16
      Caption = 'Note: Only events on/after 01/01/2008 will be included'
    end
    object lNoICBFCalfSurveyEvents: TcxLabel
      Left = 12
      Top = 140
      Caption = 'No of Calf Survey Events'
    end
    object teNoICBFCalfSurveyEvents: TcxTextEdit
      Left = 198
      Top = 140
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 14
      Width = 39
    end
    object teNoICBFCalfSurveyEventsNotified: TcxTextEdit
      Left = 247
      Top = 140
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 15
      Width = 39
    end
    object lNoICBFDamSurveyEvents: TcxLabel
      Left = 12
      Top = 165
      Caption = 'No of Dam Survey Events'
    end
    object teNoICBFDamSurveyEvents: TcxTextEdit
      Left = 198
      Top = 165
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 17
      Width = 39
    end
    object teNoICBFDamSurveyEventsNotified: TcxTextEdit
      Left = 247
      Top = 165
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 18
      Width = 39
    end
    object lNoICBFStockBullSurveyEvents: TcxLabel
      Left = 12
      Top = 190
      Caption = 'No Stock Bull Survey Events'
    end
    object teNoICBFStockBullSurveyEvents: TcxTextEdit
      Left = 198
      Top = 190
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 20
      Width = 39
    end
    object teNoICBFStockBullSurveyEventsNotified: TcxTextEdit
      Left = 247
      Top = 190
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 21
      Width = 39
    end
  end
  object gbICBFEvents: TcxGroupBox
    Left = 323
    Top = 92
    Caption = 'Other ICBF Events'
    Style.LookAndFeel.NativeStyle = True
    Style.TextStyle = [fsBold]
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 2
    Height = 297
    Width = 291
    object cxLabel10: TcxLabel
      Left = 12
      Top = 20
      Caption = 'Number of Heat/Bulling Events'
    end
    object cxLabel11: TcxLabel
      Left = 12
      Top = 60
      Caption = 'Number of Service Events '
    end
    object cxLabel12: TcxLabel
      Left = 12
      Top = 100
      Caption = 'Number of Preg. Diag. Events '
    end
    object cxLabel13: TcxLabel
      Left = 12
      Top = 140
      Caption = 'Number of Dry Off Events '
    end
    object teHeatBullingEvents: TcxTextEdit
      Left = 187
      Top = 20
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 4
      Width = 39
    end
    object teServiceEvents: TcxTextEdit
      Left = 187
      Top = 60
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 5
      Width = 39
    end
    object tePregDiagEvents: TcxTextEdit
      Left = 187
      Top = 100
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 6
      Width = 39
    end
    object teDryOffEvents: TcxTextEdit
      Left = 187
      Top = 140
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 7
      Width = 39
    end
    object teHeatBullingEventsNotified: TcxTextEdit
      Left = 236
      Top = 20
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 8
      Width = 39
    end
    object teServiceEventsNotified: TcxTextEdit
      Left = 236
      Top = 60
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 9
      Width = 39
    end
    object tePregDiagEventsNotified: TcxTextEdit
      Left = 236
      Top = 100
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 10
      Width = 39
    end
    object teDryOffEventsNotified: TcxTextEdit
      Left = 236
      Top = 140
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 11
      Width = 39
    end
    object cxLabel14: TcxLabel
      Left = 12
      Top = 180
      Caption = 'Number of Weighing Events '
    end
    object teWeighingEvents: TcxTextEdit
      Left = 187
      Top = 180
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 13
      Width = 39
    end
    object teWeighingEventsNotified: TcxTextEdit
      Left = 236
      Top = 180
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 14
      Width = 39
    end
    object cxLabel15: TcxLabel
      Left = 12
      Top = 220
      Caption = 'Number of Health Events '#13#10'     (wtih ICBF code)'
    end
    object teHealthEvents: TcxTextEdit
      Left = 187
      Top = 220
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 16
      Width = 39
    end
    object teHealthEventsNotified: TcxTextEdit
      Left = 236
      Top = 220
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 17
      Width = 39
    end
    object cxLabel16: TcxLabel
      Left = 12
      Top = 260
      AutoSize = False
      Caption = 'Number of Sale/Death Events '#13#10'     (with culling code)'
      Height = 34
      Width = 149
    end
    object teSaleDeathEvents: TcxTextEdit
      Left = 187
      Top = 260
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 19
      Width = 39
    end
    object teSaleDeathEventsNotified: TcxTextEdit
      Left = 236
      Top = 260
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 20
      Width = 39
    end
  end
  object gbCalvingEvents: TcxGroupBox
    Left = 16
    Top = 92
    Caption = 'Calving Events'
    Style.LookAndFeel.Kind = lfFlat
    Style.LookAndFeel.NativeStyle = True
    Style.TextStyle = [fsBold]
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 3
    Height = 71
    Width = 302
    object cxLabel2: TcxLabel
      Left = 70
      Top = 45
      Caption = 'Number of Calves Born '
    end
    object teCalvesBorn: TcxTextEdit
      Left = 198
      Top = 45
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 1
      Width = 39
    end
    object teCalvings: TcxTextEdit
      Left = 198
      Top = 20
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 2
      Width = 39
    end
    object cxLabel1: TcxLabel
      Left = 12
      Top = 20
      Caption = 'Number of Calvings '
    end
    object teCalvingsNotified: TcxTextEdit
      Left = 247
      Top = 20
      Properties.Alignment.Horz = taRightJustify
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 4
      Width = 39
    end
  end
  object btnReviewAWEmails: TcxButton
    Left = 349
    Top = 405
    Width = 175
    Height = 25
    Hint = 'Review Animal Welfare Emails'
    Caption = 'Review Animal Welfare Emails'
    TabOrder = 5
    OnClick = btnReviewAWEmailsClick
    LookAndFeel.NativeStyle = True
  end
  object cxLabel18: TcxLabel
    Left = 556
    Top = 58
    AutoSize = False
    Caption = 'ICBF Notified'
    Properties.Alignment.Horz = taCenter
    Properties.WordWrap = True
    Height = 30
    Width = 47
  end
  object cxLabel19: TcxLabel
    Left = 505
    Top = 58
    AutoSize = False
    Caption = 'Recorded'
    Properties.Alignment.Horz = taCenter
    Properties.WordWrap = True
    Height = 18
    Width = 51
  end
  object btnReviewAWCalves: TcxButton
    Left = 14
    Top = 405
    Width = 175
    Height = 25
    Hint = 'Review Animal Welfare Calves'
    Caption = 'Review Animal Welfare Calves'
    TabOrder = 4
    OnClick = btnReviewAWCalvesClick
    LookAndFeel.NativeStyle = True
  end
  object HintTimer: TTimer
    Enabled = False
    Interval = 3000
    OnTimer = HintTimerTimer
    Left = 570
    Top = 12
  end
  object cxHintStyleController2: TcxHintStyleController
    Global = False
    HintStyle.Animate = cxhaSlideUpward
    HintStyle.CaptionFont.Charset = DEFAULT_CHARSET
    HintStyle.CaptionFont.Color = clWindowText
    HintStyle.CaptionFont.Height = -11
    HintStyle.CaptionFont.Name = 'MS Sans Serif'
    HintStyle.CaptionFont.Style = []
    HintStyle.Font.Charset = DEFAULT_CHARSET
    HintStyle.Font.Color = clWindowText
    HintStyle.Font.Height = -11
    HintStyle.Font.Name = 'MS Sans Serif'
    HintStyle.Font.Style = []
    HintStyle.IconSize = cxisSmall
    HintStyle.IconType = cxhiInformation
    HintStyle.Rounded = True
    Left = 406
    Top = 8
  end
  object cxHintStyleController1: TcxHintStyleController
    Global = False
    HintStyle.Animate = cxhaSlideUpward
    HintStyle.CaptionFont.Charset = DEFAULT_CHARSET
    HintStyle.CaptionFont.Color = clWindowText
    HintStyle.CaptionFont.Height = -11
    HintStyle.CaptionFont.Name = 'MS Sans Serif'
    HintStyle.CaptionFont.Style = []
    HintStyle.Font.Charset = DEFAULT_CHARSET
    HintStyle.Font.Color = clWindowText
    HintStyle.Font.Height = -11
    HintStyle.Font.Name = 'MS Sans Serif'
    HintStyle.Font.Style = []
    HintStyle.IconSize = cxisSmall
    HintStyle.IconType = cxhiInformation
    HintStyle.Rounded = True
    Left = 444
    Top = 10
  end
end
