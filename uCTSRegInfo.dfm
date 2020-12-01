object fmCTSRegInfo: TfmCTSRegInfo
  Left = 498
  Top = 300
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'CTS Registration Information'
  ClientHeight = 293
  ClientWidth = 486
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object lMovementReg: TcxLabel
    Left = 34
    Top = 145
    AutoSize = False
    Caption = 'Outstanding Movement Registrations: '
    Properties.Alignment.Vert = taVCenter
    Height = 25
    Width = 228
  end
  object lBirthReg: TcxLabel
    Left = 34
    Top = 229
    AutoSize = False
    Caption = 'Outstanding Birth Registrations: '
    Height = 25
    Width = 228
  end
  object cxeBirthRegCount: TcxMaskEdit
    Left = 277
    Top = 216
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Properties.ReadOnly = True
    Style.Color = clBtnFace
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -24
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 7
    Text = '0'
    Height = 48
    Width = 56
  end
  object cxeMovementRegCount: TcxMaskEdit
    Left = 277
    Top = 132
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Properties.ReadOnly = True
    Style.Color = clBtnFace
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -24
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 9
    Text = '0'
    Height = 48
    Width = 56
  end
  object btnMoveRegNow: TcxButton
    Left = 346
    Top = 132
    Width = 81
    Height = 48
    Action = actMovementReg
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
  end
  object btnBirthRegNow: TcxButton
    Left = 346
    Top = 216
    Width = 81
    Height = 48
    Action = actBirthReg
    TabOrder = 1
    LookAndFeel.Kind = lfOffice11
  end
  object lRegInfo: TcxLabel
    Left = 30
    Top = 57
    AutoSize = False
    Caption = 
      'A number of events have not yet been registered with CTS. '#13#10#13#10'Pl' +
      'ease review the folllowing:'
    ParentFont = False
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = ANSI_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Segoe UI'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Height = 58
    Width = 425
  end
  object ActionList: TActionList
    Left = 449
    Top = 5
    object actExit: TAction
      Caption = 'Exit'
      OnExecute = actExitExecute
    end
    object actBirthReg: TAction
      Caption = 'Register'#13#10'Now'
      OnExecute = actBirthRegExecute
      OnUpdate = actBirthRegUpdate
    end
    object actMovementReg: TAction
      Caption = 'Register'#13#10'Now'
      OnExecute = actMovementRegExecute
      OnUpdate = actMovementRegUpdate
    end
  end
  object dxBarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        Caption = 'Toolbar'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 447
        FloatTop = 317
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = dxlbExit
            Visible = True
          end>
        Name = 'Toolbar'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    Style = bmsStandard
    UseSystemFont = True
    Left = 448
    Top = 36
    DockControlHeights = (
      0
      0
      48
      0)
    object dxlbExit: TdxBarLargeButton
      Action = actExit
      Category = 0
      Height = 44
      LargeGlyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
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
      Width = 60
    end
  end
end
