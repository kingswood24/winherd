object fmDrugPurchTagDetails: TfmDrugPurchTagDetails
  Left = 559
  Top = 247
  BorderStyle = bsDialog
  Caption = 'Drug Register Tag Details'
  ClientHeight = 267
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 15
  object lInfo: TcxLabel
    Left = 15
    Top = 10
    AutoSize = False
    Caption = 
      'The tag description below is associated with this '#13#10'medicine on ' +
      'this purchase date. This description is normally the '#13#10'tag / jum' +
      'bo numbers of the animals that were dosed.'#13#10'Please select these ' +
      'animals on the health/dosing screen.'
    ParentColor = False
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Style.Color = 10930928
    Height = 69
    Width = 350
  end
  object btnExit: TcxButton
    Left = 291
    Top = 231
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 0
    OnClick = btnExitClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000420B0000420B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF4A5E8642557C313F5BFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A5E8642557C38619038
      6190313F5BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      4A5E8642557C3F67973C6594396291386190313F5B394A6B394A6B394A6B394A
      6B394A6B394A6BFF00FFFF00FFFF00FF4A5E86446D9C416A993F67973C65943A
      6392313F5B3A577A42638C42638C42638C42638C394A6BFF00FFFF00FFFF00FF
      4A5E86476F9F446D9C416A993F67973D6695313F5B0F49340F47320F46320F45
      31104531394A6BFF00FFFF00FFFF00FF4A5E864A72A2476F9F446D9C416A9940
      6998313F5B164D38164A36154935164633154431394A6BFF00FFFF00FFFF00FF
      4A5E864D75A54A72A2476F9F446D9C436B9B313F5B1C7A5B1C7C5E1D7D601E78
      5B1E7257394A6BFF00FFFF00FFFF00FF4A5E864F77A74D75A56188B96188B946
      6E9E313F5B1F83601E79581E6E4F1D6245205E43394A6BFF00FFFF00FFFF00FF
      4A5E86527AAA4F77A76188B9FFFFFF4871A0313F5B5A7662798370959484AF9C
      8ABB9887394A6BFF00FFFF00FFFF00FF4A5E86567EAE527AAA4F77A74E76A64B
      73A3313F5BF0BAA4F0B297F1BFA8F0BFA8F1BFA9394A6BFF00FFFF00FFFF00FF
      4A5E865A81B2567EAE527AAA5179A94E76A6313F5BF0B79EF2BFA9F4E0D7F2C6
      AEF1A581394A6BFF00FFFF00FFFF00FF4A5E865D85B55A81B2567EAE547CAC51
      79A9313F5BEE7B45F0A27DF1A986EF7D45F08956394A6BFF00FFFF00FFFF00FF
      4A5E866188B95D85B55A81B2587FB0547CAC313F5BED733BEC6F34EB6F33EC6E
      32EE8655394A6BFF00FFFF00FFFF00FF42557C4A5E866188B95D85B55B83B358
      7FB0313F5BE96F3CE65F24E76731EE9D7BED946D394A6BFF00FFFF00FFFF00FF
      FF00FFFF00FF4A5E8642557C5F86B75B83B3313F5B394A6B394A6B394A6B394A
      6B394A6B394A6BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4A5E8642
      557C313F5BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    LookAndFeel.Kind = lfOffice11
  end
  object lTagDesc: TcxLabel
    Left = 15
    Top = 144
    Caption = 'Tag Description:'
  end
  object lDrugPurchDate: TcxLabel
    Left = 294
    Top = 100
    AutoSize = False
    Caption = 'lDrugPurchDate'
    ParentColor = False
    ParentFont = False
    Style.Color = clWhite
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Height = 21
    Width = 70
  end
  object lDrugName: TcxLabel
    Left = 15
    Top = 100
    AutoSize = False
    Caption = 'lDrugName'
    ParentColor = False
    ParentFont = False
    Style.Color = clWhite
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Height = 21
    Width = 246
  end
  object moTagDescription: TcxMemo
    Left = 15
    Top = 166
    Lines.Strings = (
      'moTagDescription')
    Properties.ReadOnly = True
    Style.BorderStyle = ebsNone
    Style.Color = clInfoBk
    TabOrder = 5
    Height = 55
    Width = 349
  end
end
