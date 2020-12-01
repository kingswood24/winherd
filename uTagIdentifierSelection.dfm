object fmTagIdentifierSelection: TfmTagIdentifierSelection
  Left = 679
  Top = 268
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'New (372) Tag Identifier Selection'
  ClientHeight = 402
  ClientWidth = 577
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 17
  object cxGroupBox1: TcxGroupBox
    Left = 20
    Top = 13
    Caption = 'New (372) Tag Identifier Selection'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.NativeStyle = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 0
    Height = 347
    Width = 533
    object Bevel1: TBevel
      Left = 24
      Top = 168
      Width = 485
      Height = 107
      Shape = bsFrame
    end
    object lInformation: TcxLabel
      Left = 23
      Top = 26
      AutoSize = False
      Caption = 
        'Please select the appropriate tag identifier for this calving or' +
        ' click Enter Calving. '#13#10'Click "Don'#39't Show This Screen Again" if ' +
        'all your old tags are used up.'
      ParentColor = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.WordWrap = True
      Style.Color = clBtnFace
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI Semibold'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfFlat
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      Height = 61
      Width = 490
    end
    object rgTagSelect: TcxRadioGroup
      Left = 24
      Top = 80
      Anchors = []
      Caption = 'Select National Prefix'
      Properties.Columns = 2
      Properties.ImmediatePost = True
      Properties.Items = <
        item
        end
        item
        end>
      Properties.OnChange = rgTagSelectPropertiesChange
      Style.BorderStyle = ebsFlat
      Style.TextStyle = [fsBold]
      TabOrder = 1
      Height = 71
      Width = 485
    end
    object lHerdDesginator: TcxLabel
      Left = 142
      Top = 222
      Caption = 'Herd Designator:'
      Style.TextStyle = [fsBold]
    end
    object teHerdDesignator: TcxTextEdit
      Left = 267
      Top = 219
      ParentFont = False
      Properties.MaxLength = 7
      Style.BorderColor = clWindowFrame
      Style.BorderStyle = ebsFlat
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 3
      OnKeyPress = teHerdDesignatorKeyPress
      Width = 108
    end
    object lDesignatorInfo: TcxLabel
      Left = 34
      Top = 174
      AutoSize = False
      Caption = 'Please enter in your new herd designator ( 7 digits)'
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      Height = 21
      Width = 467
    end
    object btnOK: TcxButton
      Left = 310
      Top = 294
      Width = 198
      Height = 38
      Caption = 'Enter Calving'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 5
      OnClick = btnOKClick
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000720B0000720B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8F7C67FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF8E7862917A63FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF96775DD2A3769C7D61FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA57F61DBA677D9A576A88263
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8A725C96765CA27D
        5FAC8363B28866B68A67B78B68B88C68BA8D69BD8E6AC0916BC4936CC6956EE7
        AB7AE5AA79DDA677AD8564FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        92745ACD9C70D8A274E0A777E5AA78E8AB79E9AC7AE9AC7AEAAD7AECAE7BEEAF
        7CF0B07DF2B17DF1B17DEDAF7CE6AA79DBA475AA8262FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FF99765AD29D71DEA475E6AA78EBAD7AEEAF7BF0AF7CF0B07C
        F1B07CF2B17DF4B27DF5B37EF6B37EF5B37EF2B17DEBAD7AE1A676D39E719E7A
        5CFF00FFFF00FFFF00FFFF00FFFF00FF9B775AD19C70DEA474E6A978ECAD7BEF
        B07EF1B17FF1B27FF2B280F3B380F4B380F5B481F6B581F5B37FF2B17DECAC7A
        E2A676D59E71C5956B8D7057FF00FFFF00FFFF00FFFF00FF987458CC986DD9A1
        73E3AB7EEDC09CF5D8C1F8E4D3F9E6D6F9E4D4F8E0CDF8DCC5F8D9C1F8D9C0F6
        CEAEF0B78BE8AB7ADFA474D29C6FC29269B68D67846F5BFF00FFFF00FFFF00FF
        8F6E54C39269CF9B71DAA77EE3B692E8C0A0EAC3A4EBC4A5ECC6A7EDC7A9EFCA
        AEF2D2B9F7E0CFF8E5D7EEC5A5E1A97CD79F71CA966BBA8D65A2785CFF00FFFF
        00FFFF00FFFF00FF866B54B58B66C0926BC89870CD9B73CF9D73D09D73D19D73
        D29E74D4A076D7A379DBA87FE0B18BE5BB99E0B28CD5A076CB976CBE8E66A277
        59FF00FFFF00FFFF00FFFF00FFFF00FFA6826BA07B63A47C61A97E61AC7F61AE
        8060AF8060B08160B18261B48463B88765BB8A68B68B6BD0A07ACD9E77C5946D
        BB8C66A4785AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF96765DBE
        9370BC916EB48A669F765AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF8E7561B19073AE8D709C7962FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF8E7561B190739C7962FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E75619C7962FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9C7962FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Layout = blGlyphRight
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = True
      Spacing = 16
    end
  end
  object cbHideThisScreen: TcxCheckBox
    Left = 357
    Top = 366
    Anchors = [akRight, akBottom]
    Caption = 'Don'#39't Show This Screen Again'
    Properties.OnChange = cbHideThisScreenPropertiesChange
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 1
    Width = 198
  end
end
