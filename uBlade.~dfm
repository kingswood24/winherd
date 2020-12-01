object fmBlade: TfmBlade
  Left = 377
  Top = 281
  BorderStyle = bsDialog
  Caption = 'BLADE'
  ClientHeight = 249
  ClientWidth = 471
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object Dock971: TDock97
    Left = 0
    Top = 0
    Width = 471
    Height = 51
    object Toolbar971: TToolbar97
      Left = 0
      Top = 0
      Caption = 'Toolbar971'
      DockPos = 0
      FullSize = True
      TabOrder = 0
      object sbExit: TRxSpeedButton
        Left = 0
        Top = 0
        Width = 62
        Height = 47
        Action = Exit
        Flat = True
      end
      object ToolbarSep971: TToolbarSep97
        Left = 430
        Top = 0
      end
      object ToolbarSep972: TToolbarSep97
        Left = 261
        Top = 0
        Visible = False
      end
      object sbCreate: TRxSpeedButton
        Left = 68
        Top = 0
        Width = 85
        Height = 47
        Action = Create
        Flat = True
      end
      object sbUpdate: TRxSpeedButton
        Left = 250
        Top = 0
        Width = 11
        Height = 47
        Caption = 'Update'
        Flat = True
        Visible = False
        OnClick = sbExitClick
      end
      object sbSend: TRxSpeedButton
        Left = 159
        Top = 0
        Width = 85
        Height = 47
        Action = Send
        Flat = True
      end
      object ToolbarSep973: TToolbarSep97
        Left = 244
        Top = 0
      end
      object ToolbarSep974: TToolbarSep97
        Left = 62
        Top = 0
      end
      object ToolbarSep975: TToolbarSep97
        Left = 153
        Top = 0
      end
      object Panel1: TPanel
        Left = 267
        Top = 0
        Width = 163
        Height = 47
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 2
          Width = 87
          Height = 16
          Caption = 'Herd Identity'
        end
        object HerdCombo: TRxDBLookupCombo
          Left = 9
          Top = 20
          Width = 130
          Height = 23
          DropDownCount = 8
          DisplayEmpty = '<Select Herd>'
          EmptyValue = '0'
          LookupField = 'ID'
          LookupDisplay = 'HerdIdentity;Name'
          LookupSource = WinData.dsHerdDefaults
          TabOrder = 0
          OnCloseUp = HerdComboCloseUp
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 228
    Width = 471
    Height = 21
    Panels = <
      item
        Width = 260
      end
      item
        Style = psOwnerDraw
        Width = 50
      end>
    SimplePanel = False
    OnDrawPanel = StatusBar1DrawPanel
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 51
    Width = 471
    Height = 177
    Align = alClient
    Caption = 'Output Information'
    TabOrder = 2
    object cbFeedPurch: TCheckBox
      Left = 21
      Top = 26
      Width = 180
      Height = 17
      Caption = 'Feed Purchases'
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = cbFeedPurchClick
    end
    object cbSuppliers: TCheckBox
      Left = 21
      Top = 50
      Width = 180
      Height = 17
      Caption = 'Suppliers'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = cbFeedPurchClick
    end
    object cbCattle: TCheckBox
      Left = 21
      Top = 74
      Width = 180
      Height = 17
      Caption = 'Cattle'
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = cbFeedPurchClick
    end
    object cbSales: TCheckBox
      Left = 21
      Top = 98
      Width = 180
      Height = 17
      Caption = 'Sale Events'
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = cbFeedPurchClick
    end
    object cbHealth: TCheckBox
      Left = 21
      Top = 122
      Width = 180
      Height = 17
      Caption = 'Health Events'
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = cbFeedPurchClick
    end
    object cbWeighings: TCheckBox
      Left = 21
      Top = 146
      Width = 180
      Height = 17
      Caption = 'Weighing Events'
      Checked = True
      State = cbChecked
      TabOrder = 5
      OnClick = cbFeedPurchClick
    end
  end
  object LMDMapiSendMail1: TLMDMapiSendMail
    Left = 334
    Top = 97
  end
  object ActionList1: TActionList
    Left = 300
    Top = 97
    object Exit: TAction
      Caption = 'Exit'
      Hint = 'Click to exit from BLADE'
      OnExecute = ExitExecute
    end
    object Create: TAction
      Caption = 'Create'
      Hint = 'Creates BLADE file'
      OnExecute = CreateExecute
    end
    object Send: TAction
      Caption = 'Send'
      Hint = 'Sends BLADE file'
      OnExecute = SendExecute
    end
  end
end
