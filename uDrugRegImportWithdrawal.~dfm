object fmDrugRegImportWithdrawal: TfmDrugRegImportWithdrawal
  Left = 653
  Top = 212
  BorderStyle = bsDialog
  Caption = 'Add New Drug'
  ClientHeight = 543
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 17
  object pMainPanel: TPanel
    Left = 0
    Top = 0
    Width = 551
    Height = 543
    Align = alClient
    Anchors = []
    BevelOuter = bvNone
    TabOrder = 0
    object gbInfo1: TcxGroupBox
      Left = 14
      Top = 41
      Alignment = alCenterCenter
      Style.BorderStyle = ebsFlat
      TabOrder = 0
      Height = 94
      Width = 524
      object lInfo1: TcxLabel
        Left = 2
        Top = 2
        Align = alClient
        AutoSize = False
        Caption = 
          'A new medicine VPA number has been detected. '#13#10'If the drug is in' +
          ' the Existing Drug list then select the drug from the list provi' +
          'ded. '#13#10'If you want to update the Existing Drug group or withdraw' +
          'al then enter these '#13#10'details also.If this drug does not exist i' +
          'n the Existing Drug list then enter the '#13#10'Withdrawal and Group f' +
          'or this New Drug. Click Proceed to add/update this drug.'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Height = 90
        Width = 520
      end
    end
    object gbInfo2: TcxGroupBox
      Left = 14
      Top = 197
      Alignment = alTopCenter
      Caption = ' New Drug '
      Style.BorderStyle = ebsFlat
      TabOrder = 1
      Height = 174
      Width = 524
      object ceMilkWithdrawal: TcxCurrencyEdit
        Left = 259
        Top = 58
        Properties.AssignedValues.DisplayFormat = True
        Properties.DecimalPlaces = 1
        Properties.OnChange = ceMilkWithdrawalPropertiesChange
        Style.BorderStyle = ebs3D
        TabOrder = 1
        OnExit = ceMilkWithdrawalExit
        Width = 53
      end
      object ceMeatWithdrawal: TcxCurrencyEdit
        Left = 127
        Top = 58
        Properties.AssignedValues.DisplayFormat = True
        Properties.DecimalPlaces = 1
        Properties.OnChange = ceMeatWithdrawalPropertiesChange
        Style.BorderStyle = ebs3D
        TabOrder = 0
        OnExit = ceMeatWithdrawalExit
        Width = 53
      end
      object lMilk: TcxLabel
        Left = 225
        Top = 60
        Caption = 'Milk:'
      end
      object lMeat: TcxLabel
        Left = 89
        Top = 58
        Caption = 'Meat:'
      end
      object lWithdrawalDesc: TcxLabel
        Left = 76
        Top = 22
        AutoSize = False
        Caption = 'lWithdrawalDesc'
        ParentColor = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Style.Color = clInfoBk
        Height = 24
        Width = 373
      end
      object cbNotApplicable: TcxCheckBox
        Left = 378
        Top = 58
        Caption = 'N/A'
        Properties.OnChange = cbNotApplicablePropertiesChange
        Style.BorderStyle = ebs3D
        TabOrder = 2
        Width = 51
      end
      object lInfo: TcxLabel
        Left = 111
        Top = 128
        AutoSize = False
        Caption = 
          'N/A indicates withdrawal period is not available'#13#10'or not applica' +
          'ble.'
        Properties.Alignment.Horz = taCenter
        Height = 38
        Width = 297
      end
      object cmboMediGroup: TcxLookupComboBox
        Left = 158
        Top = 96
        RepositoryItem = HerdLookup.erMedicineGroupLookup
        Properties.DropDownListStyle = lsFixedList
        Properties.ListColumns = <>
        Properties.OnEditValueChanged = cmboMediGroupPropertiesEditValueChanged
        Style.BorderStyle = ebsFlat
        TabOrder = 3
        Width = 259
      end
      object lGroup: TcxLabel
        Left = 98
        Top = 96
        Caption = 'Group:'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
      end
    end
    object gbInfo3: TcxGroupBox
      Left = 14
      Top = 434
      Alignment = alCenterCenter
      Style.BorderStyle = ebsFlat
      TabOrder = 2
      Height = 94
      Width = 524
      object lInfo2: TcxLabel
        Left = 2
        Top = 2
        Align = alClient
        AutoSize = False
        Caption = 
          'Proceed : Add/update the drug in the list of drugs in Kingswood ' +
          'and record Purchase.'#13#10'Ignore : Do not add drug and do not record' +
          ' Purchase.'#13#10'Resume Later : Exit from Record Purchases. All purch' +
          'ases and new drugs'#13#10'prior to Resume Later will be recorded/added' +
          '. The user can now save treatments for '#13#10'these drugs.'
        Height = 90
        Width = 520
      end
    end
    object gbExistingDrug: TcxGroupBox
      Left = 14
      Top = 135
      Alignment = alTopCenter
      Caption = ' Existing Drug '
      Style.BorderStyle = ebsFlat
      TabOrder = 3
      Height = 61
      Width = 524
      object cmboExistingDrugs: TcxLookupComboBox
        Left = 128
        Top = 25
        RepositoryItem = HerdLookup.erMedicineLookup
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <>
        Properties.OnChange = cmboExistingDrugsPropertiesChange
        Style.BorderStyle = ebsFlat
        TabOrder = 0
        Width = 259
      end
      object btnClearSelect: TcxButton
        Left = 388
        Top = 24
        Width = 61
        Height = 25
        Caption = 'Clear'
        TabOrder = 1
        OnClick = btnClearSelectClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          180000000000000300001E0F00001E0F00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFB5948CA36625A36625A36625A36625A36625A3
          6625A36625FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDF8543
          E59E69BD7B4ABD7B4ABD7B4ABD7B4ABD7B4AE59E69A36625FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFDF8543EEB78EBD7B4ABD7B4ABD7B4ABD7B4ABD
          7B4AEEB78EB57329A36625FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDF8543
          EEB78EF0C2A0F0C2A0F0C2A0F0C2A0F0C2A0EEB78EB57329B57329A36625FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFDF8543E49961E49961E49961E49961E4
          9961E49961DF8543B57329B573294770B3FF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFDF8543E49961E49961E49961E49961E49961E49961DF8543B573297B94
          C64770B3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDF8543E49961E49961E4
          9961E49961E49961E49961DF85437B94C67B94C64770B3FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF698BC395ADD49BB5D99BB5D99BB5D99BB5D995ADD47F9C
          CB7B94C64770B3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF698BC395
          ADD49BB5D99BB5D99BB5D99BB5D995ADD47F9CCB4770B3FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF698BC395ADD49BB5D99BB5D99BB5D99BB5
          D995ADD44770B3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF698BC3698BC3698BC3698BC3698BC3698BC3698BC3FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        LookAndFeel.Kind = lfOffice11
      end
    end
    object gbConfirm: TcxGroupBox
      Left = 14
      Top = 372
      Style.BorderStyle = ebsFlat
      TabOrder = 4
      Height = 54
      Width = 524
      object btnProceed: TcxButton
        Left = 73
        Top = 16
        Width = 94
        Height = 29
        Caption = 'Proceed'
        ModalResult = 1
        TabOrder = 0
        LookAndFeel.Kind = lfOffice11
      end
      object btnSkip: TcxButton
        Left = 210
        Top = 16
        Width = 94
        Height = 29
        Caption = 'Ignore'
        ModalResult = 2
        TabOrder = 1
        LookAndFeel.Kind = lfOffice11
      end
      object btnAbort: TcxButton
        Left = 355
        Top = 16
        Width = 94
        Height = 29
        Caption = 'Resume Later'
        ModalResult = 3
        TabOrder = 2
        LookAndFeel.Kind = lfOffice11
      end
    end
    object lMedicineName: TcxLabel
      Left = 0
      Top = 0
      Align = alTop
      AutoSize = False
      Caption = 'lMedicineName'
      ParentFont = False
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -21
      Style.Font.Name = 'Segoe UI'
      Style.Font.Style = []
      Style.TextColor = clRed
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      Height = 39
      Width = 551
    end
  end
end
