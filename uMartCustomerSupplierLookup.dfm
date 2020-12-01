object fmMartCustomerSupplierLookup: TfmMartCustomerSupplierLookup
  Left = 540
  Top = 330
  Width = 456
  Height = 384
  Caption = 'WARNING!'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lAnimalTag: TcxLabel
    Left = 92
    Top = 32
    Caption = 'lAnimalTag'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextColor = clWindowText
    Style.IsFontAssigned = True
  end
  object lEventDateType: TcxLabel
    Left = 242
    Top = 32
    Caption = 'Purchase Date:'
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
  end
  object cxLabel2: TcxLabel
    Left = 14
    Top = 32
    Caption = 'Nat. Id. No.:'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
  end
  object lEventDate: TcxLabel
    Left = 344
    Top = 32
    Caption = 'Purchase Date'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextColor = clWindowText
    Style.IsFontAssigned = True
  end
  object lRefCodeType: TcxLabel
    Left = 96
    Top = 60
    AutoSize = False
    Caption = 'Ref. Code:'
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    Height = 19
    Width = 147
  end
  object lRefCode: TcxLabel
    Left = 242
    Top = 60
    Caption = 'Ref. Code:'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clRed
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextColor = clWindowText
    Style.IsFontAssigned = True
  end
  object cxLabel3: TcxLabel
    Left = 17
    Top = 94
    AutoSize = False
    Caption = 
      'Select the record from the list below which corresponds to the c' +
      'ode above.'
    ParentFont = False
    Properties.Alignment.Horz = taLeftJustify
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextColor = clBlack
    Style.IsFontAssigned = True
    Height = 23
    Width = 405
  end
  object LookupList: TcxLookupComboBox
    Left = 17
    Top = 118
    ParentFont = False
    Properties.ListColumns = <>
    Properties.OnEditValueChanged = cxLookupComboBox1PropertiesEditValueChanged
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfFlat
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 7
    Width = 304
  end
  object btnCancel: TcxButton
    Left = 343
    Top = 310
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 8
    LookAndFeel.Kind = lfOffice11
  end
  object btnSelect: TcxButton
    Left = 327
    Top = 118
    Width = 62
    Height = 25
    Caption = 'Select'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 9
    OnClick = btnSelectClick
    LookAndFeel.Kind = lfOffice11
  end
  object cxLabel1: TcxLabel
    Left = 17
    Top = 265
    AutoSize = False
    Caption = 
      'NOTE: If you do not wish to select a record at this time you mus' +
      't edit this event and enter the appropriate details.'
    ParentFont = False
    Properties.Alignment.Horz = taLeftJustify
    Properties.WordWrap = True
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextColor = clRed
    Style.IsFontAssigned = True
    Height = 37
    Width = 404
  end
  object lMainCaption: TcxLabel
    Left = 0
    Top = 0
    Align = alTop
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextColor = clRed
    Style.IsFontAssigned = True
    Height = 23
    Width = 440
  end
  object btnAddSupplierOrCustomer: TcxButton
    Left = 391
    Top = 119
    Width = 24
    Height = 24
    TabOrder = 12
    OnClick = btnAddSupplierOrCustomerClick
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000230B0000230B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0FA5280F
      A5280FA5280FA528FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF0FA5287EE09E51CD830FA528FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0FA5287E
      E09E38C2730FA528FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF0FA5287EE09E38C2730FA528FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0FA5287E
      E09E38C2730FA528FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0FA528
      0FA5280FA5280FA5280FA5280FA5287EE09E38C2730FA5280FA5280FA5280FA5
      280FA5280FA528FF00FFFF00FF0FA5287EE09E38C27338C27338C27338C27338
      C27338C27338C27338C27338C27338C27351CD830FA528FF00FFFF00FF0FA528
      5FD38B5FD38B5FD38B5FD38B5FD38B51CD8338C2735FD38B5FD38B5FD38B5FD3
      8B5FD38B0FA528FF00FFFF00FF0FA5280FA5280FA5280FA5280FA5280FA5287E
      E09E38C2730FA5280FA5280FA5280FA5280FA5280FA528FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF0FA5287EE09E38C2730FA528FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0FA5287E
      E09E38C2730FA528FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF0FA5287EE09E38C2730FA528FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0FA52851
      CD835FD38B0FA528FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF0FA5280FA5280FA5280FA528FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    LookAndFeel.Kind = lfOffice11
  end
  object gbAPHISList: TcxGroupBox
    Left = 17
    Top = 150
    Caption = 'APHIS List'
    ParentFont = False
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfFlat
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfFlat
    StyleFocused.LookAndFeel.Kind = lfFlat
    StyleHot.LookAndFeel.Kind = lfFlat
    TabOrder = 13
    Height = 111
    Width = 404
    object lName: TcxLabel
      Left = 184
      Top = 19
      Caption = 'lName'
    end
    object lCode: TcxLabel
      Left = 48
      Top = 19
      Caption = 'lCode'
    end
    object btnAddFromAPHIS: TcxButton
      Left = 284
      Top = 74
      Width = 97
      Height = 25
      Caption = 'Add From AHPIS'
      Enabled = False
      TabOrder = 2
      OnClick = btnAddFromAPHISClick
      LookAndFeel.Kind = lfOffice11
    end
    object cxLabel4: TcxLabel
      Left = 10
      Top = 19
      Caption = 'Code:'
      Style.TextStyle = [fsBold]
    end
    object cxLabel5: TcxLabel
      Left = 142
      Top = 19
      Caption = 'Name:'
      Style.TextStyle = [fsBold]
    end
    object cxLabel6: TcxLabel
      Left = 10
      Top = 44
      AutoSize = False
      Caption = 
        'Important: Only add this record when you are sure this record do' +
        'es NOT exist in your herd database.'
      ParentFont = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.WordWrap = True
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.TextColor = clBlack
      Style.IsFontAssigned = True
      Height = 31
      Width = 375
    end
  end
end
