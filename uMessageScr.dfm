object fmMessageScr: TfmMessageScr
  Left = 616
  Top = 318
  BorderStyle = bsDialog
  Caption = 'fmMessageScr'
  ClientHeight = 205
  ClientWidth = 510
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 17
  object pInfo: TPanel
    Left = 0
    Top = 0
    Width = 510
    Height = 205
    Align = alClient
    BevelOuter = bvNone
    Color = clInfoBk
    TabOrder = 0
    object lInfo: TcxLabel
      Left = 0
      Top = 33
      Align = alClient
      AutoSize = False
      Caption = 
        'There is now an automated transfer of Animal Events from the Kin' +
        'gswood server'#13#10'to the ICBF. This means not having to click on th' +
        'is Gmail link anymore.'#13#10'To avail of this new convenient facility' +
        ' you need to get the Kingswood Herd App.'#13#10'hyperlink goes here'#13#10' ' +
        #13#10'Click on the above link or call us at 01-4596677'#13#10
      ParentColor = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -13
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextColor = clNavy
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      Height = 120
      Width = 510
    end
    object lInfoExtra: TcxLabel
      Left = 0
      Top = 0
      Align = alTop
      AutoSize = False
      Caption = 'Email of ICBF Events'
      ParentColor = False
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.Color = clInfoBk
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clRed
      Style.Font.Height = -16
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = [fsBold]
      Style.TextColor = clNavy
      Style.IsFontAssigned = True
      Height = 33
      Width = 510
    end
    object pButton: TPanel
      Left = 0
      Top = 153
      Width = 510
      Height = 52
      Align = alBottom
      BevelOuter = bvNone
      Color = clInfoBk
      TabOrder = 2
      object btnOK: TcxButton
        Left = 116
        Top = 2
        Width = 93
        Height = 35
        Anchors = [akRight, akBottom]
        Caption = 'OK'
        ModalResult = 1
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
      end
      object btnCancel: TcxButton
        Left = 228
        Top = 2
        Width = 93
        Height = 35
        Anchors = [akRight, akBottom]
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 1
        LookAndFeel.Kind = lfOffice11
      end
    end
    object hlKingswoodWesbite: TcxHyperLinkEdit
      Left = 203
      Top = 84
      Cursor = crHandPoint
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Properties.Prefix = ''
      Style.BorderColor = clInfoBk
      Style.BorderStyle = ebsNone
      Style.Color = clInfoBk
      Style.TextStyle = [fsBold, fsUnderline]
      StyleFocused.BorderStyle = ebsNone
      StyleHot.BorderStyle = ebsNone
      TabOrder = 3
      Text = 'www.kingswood.ie'
      OnClick = hlKingswoodWesbiteClick
      Width = 160
    end
  end
  object ActionList: TActionList
    Left = 314
    Top = 198
  end
end
