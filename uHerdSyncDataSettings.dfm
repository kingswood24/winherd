object fmHerdSyncDataSettings: TfmHerdSyncDataSettings
  Left = 488
  Top = 232
  Width = 697
  Height = 476
  Caption = 'Herd Sync - Data Settings '
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object DataActionPageControl: TcxPageControl
    Left = 28
    Top = 25
    Width = 633
    Height = 352
    ActivePage = tsDataSettings
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = False
    NavigatorPosition = npLeftTop
    Options = [pcoGradient, pcoGradientClientArea, pcoNoArrows, pcoRedrawOnResize]
    ParentFont = False
    ShowFrame = True
    Style = 9
    TabHeight = 34
    TabOrder = 0
    TabWidth = 282
    ClientRectBottom = 351
    ClientRectLeft = 1
    ClientRectRight = 632
    ClientRectTop = 35
    object tsDataSettings: TcxTabSheet
      Caption = 'Data Settings'
      ImageIndex = 0
      object cxGroupBox1: TcxGroupBox
        Left = 32
        Top = 20
        Caption = 'Bull Management'
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Height = 121
        Width = 565
        object cxLabel1: TcxLabel
          Left = 26
          Top = 28
          AutoSize = False
          Caption = 
            'Specify the maximum number of active breeding bulls which will b' +
            'e sync'#39'd to your app. Keeping the number as low as possible will' +
            ' make bull selection easier within the app.'
          Properties.WordWrap = True
          Style.TextStyle = []
          Height = 51
          Width = 522
        end
        object lInfo: TcxLabel
          Left = 26
          Top = 76
          Caption = 'Maximum Number: '
          Style.TextStyle = []
        end
        object seNoBulls: TcxSpinEdit
          Left = 150
          Top = 74
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.DisplayFormat = '0'
          Properties.EditFormat = '0'
          Properties.MaxValue = 100
          Properties.MinValue = 1
          Style.BorderStyle = ebsFlat
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = []
          Style.TextStyle = []
          Style.IsFontAssigned = True
          TabOrder = 2
          Value = 20
          Width = 63
        end
      end
      object cxGroupBox2: TcxGroupBox
        Left = 32
        Top = 156
        Caption = 'Animal Remedies'
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 1
        Height = 121
        Width = 565
        object cxLabel2: TcxLabel
          Left = 26
          Top = 28
          AutoSize = False
          Caption = 
            'Specify how many years of animal remedy history that you would l' +
            'ike to sync to your app. The further back in time you go, the lo' +
            'nger some sync'#39'ing operations will take.'
          Properties.WordWrap = True
          Style.TextStyle = []
          Height = 39
          Width = 533
        end
        object cxLabel3: TcxLabel
          Left = 26
          Top = 76
          Caption = 'Number of Years: '
          Style.TextStyle = []
        end
        object seAnimalRemedyNumberOfYears: TcxSpinEdit
          Left = 150
          Top = 76
          ParentFont = False
          Properties.Alignment.Horz = taCenter
          Properties.DisplayFormat = '0'
          Properties.EditFormat = '0'
          Properties.MaxValue = 10
          Properties.MinValue = 1
          Style.BorderStyle = ebsFlat
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Segoe UI'
          Style.Font.Style = []
          Style.TextStyle = []
          Style.IsFontAssigned = True
          TabOrder = 2
          Value = 1
          Width = 63
        end
      end
    end
    object tsMisc: TcxTabSheet
      Caption = 'Sync Information'
      ImageIndex = 1
      object cxGroupBox3: TcxGroupBox
        Left = 32
        Top = 20
        Caption = 'Sync Information'
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Height = 121
        Width = 565
        object cxLabel5: TcxLabel
          Left = 24
          Top = 28
          Caption = 'Last Successful Sync: '
          Style.TextStyle = []
        end
        object LastSyncDateValue: TcxLabel
          Left = 152
          Top = 28
          Caption = 'LastSyncDateValue'
          Style.TextStyle = []
        end
      end
    end
  end
  object cxButton1: TcxButton
    Left = 485
    Top = 386
    Width = 85
    Height = 36
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = True
  end
  object cxButton2: TcxButton
    Left = 575
    Top = 386
    Width = 85
    Height = 36
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = True
  end
  object AdvancedSettingsButton: TcxButton
    Left = 29
    Top = 386
    Width = 140
    Height = 36
    Caption = 'Advanced Settings'
    ModalResult = 1
    TabOrder = 3
    OnClick = AdvancedSettingsButtonClick
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = True
  end
end
