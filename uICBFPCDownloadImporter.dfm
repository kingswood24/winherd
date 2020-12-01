object fmICBFPCDownloadImporter: TfmICBFPCDownloadImporter
  Left = 411
  Top = 263
  Width = 753
  Height = 462
  VertScrollBar.Visible = False
  Caption = 'ICBF File Import'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gsEBIData: TcxGroupBox
    Tag = 1
    Left = 19
    Top = 71
    Caption = 'EBI Data'
    Style.LookAndFeel.Kind = lfStandard
    Style.TextStyle = [fsBold]
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.Kind = lfStandard
    TabOrder = 0
    Height = 92
    Width = 346
    object lEBIInfo: TcxLabel
      Left = 16
      Top = 19
      AutoSize = False
      Caption = 
        'Update all your animal EBI records with the latest EBI data cont' +
        'ained on the ICBF PC Download File.'
      Properties.WordWrap = True
      Height = 41
      Width = 314
    end
    object btnEBIData: TcxButton
      Left = 211
      Top = 56
      Width = 127
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'EBI Records'
      TabOrder = 0
      OnClick = btnEBIDataClick
      LookAndFeel.Kind = lfOffice11
    end
  end
  object gbServiceData: TcxGroupBox
    Tag = 3
    Left = 19
    Top = 271
    Caption = 'Service Data'
    Style.LookAndFeel.Kind = lfStandard
    Style.TextStyle = [fsBold]
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.Kind = lfStandard
    TabOrder = 1
    Height = 92
    Width = 346
    object cxLabel3: TcxLabel
      Left = 16
      Top = 19
      AutoSize = False
      Caption = 
        'Update your animal service records with the latest service data ' +
        'contained on the ICBF PC Download File.'
      Properties.WordWrap = True
      Height = 31
      Width = 314
    end
    object btnServiceData: TcxButton
      Left = 211
      Top = 54
      Width = 127
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Service Records'
      TabOrder = 0
      OnClick = btnServiceDataClick
      LookAndFeel.Kind = lfOffice11
    end
  end
  object gbPedigreeData: TcxGroupBox
    Tag = 6
    Left = 381
    Top = 271
    Caption = 'Pedigree Data'
    Style.LookAndFeel.Kind = lfStandard
    Style.TextStyle = [fsBold]
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.Kind = lfStandard
    TabOrder = 2
    Height = 92
    Width = 346
    object cxLabel4: TcxLabel
      Left = 16
      Top = 19
      AutoSize = False
      Caption = 
        'Update your animal pedigree history with the latest data contain' +
        'ed on the ICBF PC Download File.'
      Properties.WordWrap = True
      Height = 31
      Width = 314
    end
    object btnPedigree: TcxButton
      Left = 211
      Top = 54
      Width = 127
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Pedigree Records'
      TabOrder = 0
      OnClick = btnPedigreeClick
      LookAndFeel.Kind = lfOffice11
    end
  end
  object gbMilkData: TcxGroupBox
    Tag = 5
    Left = 381
    Top = 171
    Caption = 'Milk Data'
    Style.LookAndFeel.Kind = lfStandard
    Style.TextStyle = [fsBold]
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.Kind = lfStandard
    TabOrder = 3
    Height = 92
    Width = 346
    object cxLabel5: TcxLabel
      Left = 14
      Top = 19
      AutoSize = False
      Caption = 
        'Update your animal milk records with the latest milk data contai' +
        'ned on the ICBF PC Download File.'
      Properties.WordWrap = True
      Height = 31
      Width = 314
    end
    object btnMilkRecords: TcxButton
      Left = 211
      Top = 54
      Width = 127
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Milk Records'
      TabOrder = 0
      OnClick = btnMilkRecordsClick
      LookAndFeel.Kind = lfOffice11
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 19
    Top = 14
    Caption = 'ICBF PC Download File'
    Style.LookAndFeel.Kind = lfStandard
    Style.TextStyle = [fsBold]
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.Kind = lfStandard
    TabOrder = 4
    Height = 50
    Width = 708
    object cxLabel7: TcxLabel
      Left = 16
      Top = 19
      AutoSize = False
      Caption = 
        'Please ensure the ICBF file you want import is saved to your Des' +
        'ktop or click browse to select the ICBF file.'
      Properties.WordWrap = True
      Height = 23
      Width = 523
    end
    object lFileStatus: TcxLabel
      Left = 16
      Top = 51
      AutoSize = False
      Properties.Alignment.Horz = taLeftJustify
      Properties.WordWrap = True
      Height = 35
      Width = 208
    end
    object btnBrowse: TcxButton
      Left = 572
      Top = 15
      Width = 127
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Browse'
      Default = True
      TabOrder = 2
      OnClick = btnBrowseClick
      LookAndFeel.Kind = lfOffice11
    end
  end
  object btnClose: TcxButton
    Left = 638
    Top = 374
    Width = 89
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Close'
    ModalResult = 1
    TabOrder = 5
    LookAndFeel.Kind = lfOffice11
  end
  object gbWeighingData: TcxGroupBox
    Tag = 4
    Left = 381
    Top = 71
    Caption = 'Weighing Data'
    Style.LookAndFeel.Kind = lfStandard
    Style.TextStyle = [fsBold]
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.Kind = lfStandard
    TabOrder = 6
    Height = 92
    Width = 346
    object cxLabel2: TcxLabel
      Left = 16
      Top = 19
      AutoSize = False
      Caption = 
        'Update your animal weighing records with the latest weighing dat' +
        'a contained on the ICBF PC Download File.'
      Properties.WordWrap = True
      Height = 31
      Width = 314
    end
    object btnWeighingRecords: TcxButton
      Left = 211
      Top = 58
      Width = 127
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Weighing Records'
      TabOrder = 0
      OnClick = btnWeighingRecordsClick
      LookAndFeel.Kind = lfOffice11
    end
  end
  object PBar: TcxProgressBar
    Left = 16
    Top = 374
    Anchors = [akRight, akBottom]
    AutoSize = False
    TabOrder = 7
    Height = 25
    Width = 524
  end
  object gbImportPlannedBulls: TcxGroupBox
    Tag = 2
    Left = 19
    Top = 171
    Caption = 'Planned Bulls'
    Style.LookAndFeel.Kind = lfStandard
    Style.TextStyle = [fsBold]
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.Kind = lfStandard
    TabOrder = 8
    Height = 92
    Width = 346
    object lImportPlannedBullsInfo: TcxLabel
      Left = 16
      Top = 22
      AutoSize = False
      Caption = 'Import the planned bulls contained on the ICBF file. '
      Properties.WordWrap = True
      Height = 20
      Width = 314
    end
    object btnImportPlannedBulls: TcxButton
      Left = 211
      Top = 58
      Width = 127
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Planned Bull Records'
      TabOrder = 0
      OnClick = btnImportPlannedBullsClick
      LookAndFeel.Kind = lfOffice11
    end
  end
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 411
    Width = 745
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
    LookAndFeel.Kind = lfFlat
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
  end
  object btnImportAnimals: TcxButton
    Left = 544
    Top = 374
    Width = 89
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Import Animals'
    TabOrder = 10
    OnClick = btnImportAnimalsClick
    LookAndFeel.Kind = lfOffice11
  end
  object QueryAnimals: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select ID, NatIDNum, LactNo, HerdID '
      'From Animals '
      'Where Sex= '#39'Female'#39' '
      'And AnimalDeleted = False'
      'And HerdID = :AHerdID')
    Left = 748
    Top = 12
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AHerdID'
        ParamType = ptUnknown
      end>
  end
  object OpenDialog: TOpenDialog
    Filter = 'ICBF File|*.txt'
    InitialDir = 'C:\'
    Left = 748
    Top = 44
  end
end
