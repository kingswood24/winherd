object fmCrushDiskEdit: TfmCrushDiskEdit
  Left = 401
  Top = 256
  Width = 364
  Height = 383
  ActiveControl = Panel1
  Caption = 'Crush Intake Edit'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 356
    Height = 349
    Align = alClient
    BevelInner = bvSpace
    BevelOuter = bvLowered
    TabOrder = 0
    object Label3: TLabel
      Left = 24
      Top = 26
      Width = 77
      Height = 32
      Caption = 'National ID Number'
      FocusControl = DBEdit3
      WordWrap = True
    end
    object Label4: TLabel
      Left = 24
      Top = 69
      Width = 96
      Height = 16
      Caption = 'Animal Number'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 24
      Top = 111
      Width = 93
      Height = 16
      Caption = 'Animal Weight'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 24
      Top = 155
      Width = 95
      Height = 16
      Caption = 'Weighing Date'
    end
    object Label1: TLabel
      Left = 206
      Top = 112
      Width = 16
      Height = 16
      Caption = 'Kg'
      FocusControl = DBEdit5
    end
    object Label2: TLabel
      Left = 24
      Top = 198
      Width = 65
      Height = 16
      Caption = 'Pen Name'
    end
    object sbsave: TRxSpeedButton
      Left = 24
      Top = 293
      Width = 105
      Height = 43
      Caption = '&Save'
      ModalResult = 1
      OnClick = sbsaveClick
    end
    object sbcancel: TRxSpeedButton
      Left = 224
      Top = 293
      Width = 105
      Height = 43
      Caption = '&Cancel'
      ModalResult = 2
      OnClick = sbcancelClick
    end
    object DBEdit3: TDBEdit
      Left = 130
      Top = 24
      Width = 124
      Height = 24
      DataField = 'AnimalTag'
      TabOrder = 0
    end
    object DBEdit4: TDBEdit
      Left = 130
      Top = 67
      Width = 87
      Height = 24
      DataField = 'AnimalNum'
      TabOrder = 1
    end
    object DBEdit5: TDBEdit
      Left = 130
      Top = 109
      Width = 71
      Height = 24
      DataField = 'AnimalWgt'
      TabOrder = 2
    end
    object cb: TDBCheckBox
      Left = 24
      Top = 237
      Width = 119
      Height = 17
      Alignment = taLeftJustify
      Caption = 'Matched'
      DataField = 'HasCard'
      TabOrder = 3
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object DBDateEdit1: TDBDateEdit
      Left = 130
      Top = 153
      Width = 121
      Height = 24
      NumGlyphs = 2
      TabOrder = 4
    end
    object Pen: TRxDBLookupCombo
      Left = 130
      Top = 195
      Width = 199
      Height = 23
      DropDownCount = 8
      LookupField = 'ID'
      LookupDisplay = 'Description'
      LookupSource = WinData.dsLookupGroups
      TabOrder = 5
    end
  end
end
