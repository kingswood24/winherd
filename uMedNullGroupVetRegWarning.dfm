object fmMedNullGroupVetRegWarning: TfmMedNullGroupVetRegWarning
  Left = 715
  Top = 451
  BorderStyle = bsDialog
  ClientHeight = 187
  ClientWidth = 594
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 17
  object pInfoTreatWithMedNoGroup: TPanel
    Left = 0
    Top = 0
    Width = 594
    Height = 187
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object lInfo: TcxLabel
      Left = 0
      Top = 0
      Align = alTop
      AutoSize = False
      Caption = 
        'There are medicines that have been administered to animals in yo' +
        'ur herd '#13#10'that do not have a medicine type (antibiotic, dose, va' +
        'ccine or tube) specified'#13#10'and/or do not have withdrawal days ent' +
        'ered.'#13#10'Click Continue to run the Treatment Report with these med' +
        'icines EXCLUDED '#13#10'or click Fix to add types to these medicines.'
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextColor = clBlack
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      Height = 124
      Width = 594
    end
    object btnContinue: TcxButton
      Left = 158
      Top = 122
      Width = 106
      Height = 40
      Anchors = [akRight, akBottom]
      Caption = 'Continue'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      TabStop = False
      OnClick = btnContinueClick
      Colors.Default = clGreen
      LookAndFeel.Kind = lfFlat
    end
    object btnFix: TcxButton
      Left = 338
      Top = 122
      Width = 106
      Height = 40
      Anchors = [akRight, akBottom]
      Caption = 'Fix'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      TabStop = False
      OnClick = btnFixClick
      Colors.Default = clRed
      LookAndFeel.Kind = lfFlat
    end
  end
end
