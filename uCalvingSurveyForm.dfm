object fmCalvingSurveyForm: TfmCalvingSurveyForm
  Left = 464
  Top = 191
  BorderStyle = bsDialog
  Caption = 'Calving Survey'
  ClientHeight = 377
  ClientWidth = 539
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object gbConditionScore: TcxGroupBox
    Left = 16
    Top = 12
    Caption = 'Condition Score of Dam'
    Style.LookAndFeel.Kind = lfFlat
    Style.TextStyle = [fsBold]
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 0
    Height = 148
    Width = 504
    object cxLabel1: TcxLabel
      Left = 18
      Top = 30
      AutoSize = False
      Caption = 
        'Enter a condition score of the calved dam. If you do not wish to' +
        ' record a condition score leave the Score field with a "0" value' +
        '.'
      Properties.WordWrap = True
      Height = 41
      Width = 475
    end
    object cxLabel2: TcxLabel
      Left = 18
      Top = 77
      Caption = 'Score '
    end
    object cxLabel3: TcxLabel
      Left = 18
      Top = 103
      Caption = 'Comment'
    end
    object seScore: TcxSpinEdit
      Left = 84
      Top = 74
      Properties.DisplayFormat = '#.##'
      Properties.EditFormat = '#.##'
      Properties.MaxValue = 5
      Properties.ValueType = vtFloat
      Properties.OnChange = seScorePropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 3
      Width = 69
    end
    object teCSComment: TcxTextEdit
      Left = 84
      Top = 102
      Properties.MaxLength = 30
      Properties.OnChange = teCSCommentPropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 4
      Text = 'teCSComment'
      Width = 215
    end
  end
  object gbBirthProblems: TcxGroupBox
    Left = 16
    Top = 174
    Caption = 'Birth Related Problems'
    Style.LookAndFeel.Kind = lfFlat
    Style.TextStyle = [fsBold]
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 1
    Height = 148
    Width = 504
    object cbAbortedCalving: TcxCheckBox
      Left = 22
      Top = 28
      Caption = 'Aborted Calving'
      Properties.ImmediatePost = True
      Properties.OnChange = cbAbortedCalvingPropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 0
      Width = 121
    end
    object cbAssistedCalvingModerate: TcxCheckBox
      Left = 22
      Top = 58
      Caption = 'Assisted Calving - Moderate'
      Properties.ImmediatePost = True
      Properties.OnChange = cbAssistedCalvingModeratePropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 1
      Width = 173
    end
    object cbAssistedCalvingSerious: TcxCheckBox
      Left = 22
      Top = 88
      Caption = 'Assisted Calving - Serious'
      Properties.ImmediatePost = True
      Properties.OnChange = cbAssistedCalvingSeriousPropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 2
      Width = 173
    end
    object cbMilkFever: TcxCheckBox
      Left = 244
      Top = 28
      Caption = 'Milk Fever'
      Properties.ImmediatePost = True
      Properties.OnChange = cbMilkFeverPropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 3
      Width = 173
    end
    object cbRetainedCleansing: TcxCheckBox
      Left = 244
      Top = 58
      Caption = 'Retained Cleansings'
      Properties.ImmediatePost = True
      Properties.OnChange = cbRetainedCleansingPropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 4
      Width = 137
    end
    object cbDisplacedAbomasums: TcxCheckBox
      Left = 244
      Top = 88
      Caption = 'Displaced Abomasums'
      Properties.ImmediatePost = True
      Properties.OnChange = cbDisplacedAbomasumsPropertiesChange
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 5
      Width = 145
    end
  end
  object btnOK: TcxButton
    Left = 436
    Top = 334
    Width = 85
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
    LookAndFeel.NativeStyle = True
  end
  object cbRegisterCalves: TcxCheckBox
    Left = 16
    Top = 336
    Caption = 'Register Calves upon closing of Calving Survey?'
    Properties.ImmediatePost = True
    Properties.OnChange = cbRegisterCalvesPropertiesChange
    TabOrder = 2
    Width = 271
  end
end
