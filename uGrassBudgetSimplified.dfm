object fmGrassBudgetSimplified: TfmGrassBudgetSimplified
  Left = 305
  Top = 115
  Width = 998
  Height = 710
  Caption = 'Grassland Budget Sheet'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TcxPageControl
    Left = 0
    Top = 126
    Width = 982
    Height = 548
    ActivePage = tsGrassIntake
    Align = alClient
    LookAndFeel.Kind = lfFlat
    Options = [pcoGradient, pcoGradientClientArea, pcoRedrawOnResize, pcoUsePageColorForTab]
    Style = 7
    TabHeight = 40
    TabOrder = 0
    TabPosition = tpBottom
    TabWidth = 150
    OnDrawTabEx = PageControlDrawTabEx
    OnPageChanging = PageControlPageChanging
    ClientRectBottom = 505
    ClientRectLeft = 1
    ClientRectRight = 981
    ClientRectTop = 1
    object tsGrassIntake: TcxTabSheet
      Caption = 'Grass Intake'
      Color = clBtnFace
      ImageIndex = 0
      ParentColor = False
      object ssbGrassIntake: TcxSpreadSheetBook
        Left = 0
        Top = 0
        Width = 980
        Height = 504
        ExcelProtectionStyle = False
        Align = alClient
        DefaultStyle.Font.Name = 'MS Sans Serif'
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Style = []
        PainterType = ptOfficeXPStyle
        PageCount = 2
        ShowCaptionBar = False
        OnSetSelection = ssbGrassIntakeSetSelection
      end
    end
    object tsGrassGrowth: TcxTabSheet
      Caption = 'Grass Growth'
      Color = clBtnFace
      ImageIndex = 1
      ParentColor = False
      object cxSpinEdit1: TcxSpinEdit
        Left = 248
        Top = 532
        TabOrder = 0
        Width = 121
      end
      object ssGrassGrowth: TcxSpreadSheetBook
        Left = 0
        Top = 0
        Width = 980
        Height = 504
        Align = alClient
        DefaultStyle.Font.Name = 'MS Sans Serif'
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Style = []
        PainterType = ptOfficeXPStyle
        ShowCaptionBar = False
        OnSetSelection = ssGrassGrowthSetSelection
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 93
    Width = 982
    Height = 33
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
    object pCellInfo: TPanel
      Left = 1
      Top = 1
      Width = 980
      Height = 31
      Align = alTop
      Caption = 'pCellInfo'
      TabOrder = 0
      object pnCellsRect: TPanel
        Left = 3
        Top = 5
        Width = 81
        Height = 21
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = 'A1'
        Color = clBtnHighlight
        TabOrder = 0
      end
      object Panel3: TPanel
        Left = 84
        Top = 5
        Width = 56
        Height = 21
        Alignment = taRightJustify
        BevelOuter = bvNone
        Caption = 'Cell text = '
        TabOrder = 1
      end
      object edtCellEdit: TEdit
        Left = 140
        Top = 5
        Width = 822
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        TabOrder = 2
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 44
    Width = 982
    Height = 49
    Align = alTop
    TabOrder = 6
    object Label1: TLabel
      Left = 22
      Top = 16
      Width = 119
      Height = 13
      Caption = 'All Cows Dried Off On '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DriedOffon: TcxDateEdit
      Left = 148
      Top = 12
      EditValue = 39783d
      Style.LookAndFeel.Kind = lfFlat
      StyleDisabled.LookAndFeel.Kind = lfFlat
      StyleFocused.LookAndFeel.Kind = lfFlat
      StyleHot.LookAndFeel.Kind = lfFlat
      TabOrder = 0
      Width = 121
    end
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Bars = <
      item
        AllowClose = False
        AllowCustomizing = False
        AllowQuickCustomizing = False
        AllowReset = False
        Caption = 'MainToolBar'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 604
        FloatTop = 357
        FloatClientWidth = 23
        FloatClientHeight = 22
        ItemLinks = <
          item
            Item = blbExit
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton1
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton2
            Visible = True
          end>
        Name = 'MainToolBar'
        OneOnRow = True
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        UseRestSpace = True
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 592
    Top = 12
    DockControlHeights = (
      0
      0
      44
      0)
    object blbExit: TdxBarLargeButton
      Caption = 'Exit'
      Category = 0
      Hint = 'Exit'
      Visible = ivAlways
      OnClick = blbExitClick
      Height = 40
      HotGlyph.Data = {
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
      Width = 55
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'Save'
      Category = 0
      Hint = 'Save'
      Visible = ivAlways
      OnClick = dxBarLargeButton1Click
      Height = 40
      HotGlyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2B9348FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF2B934831A6482B9348FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF399B6131A64831A64831A6482B9348FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        2B934831A64837B75533A15831A6482B9348FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF3F946631A64837B7552F8D582F8D5837B75543
        A14637B755FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2B9348
        37B7552F8D58FF00FFFF00FF2F8D5837B7552B9348FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF2F8D58FF00FFFF00FFFF00FFFF00FF2F
        8D5837B7552B9348FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2F8D5837B75537B755FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF2F8D5831A648FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2F8D5831A648FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF2F8D5831A648FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2F8D
        5831A648FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF2F8D5831A648FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF2F8D58FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Width = 55
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = 'Load'
      Category = 0
      Hint = 'Load'
      Visible = ivAlways
      OnClick = dxBarLargeButton2Click
      Height = 40
      HotGlyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000330B0000330B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFC9762BA24F22A24F22A24F22A24F22A24F22A2
        4F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22A24F22FF00FFC9762B
        FEFEFDFEFEFDFEFEFDFEFEFDFBFBFAF8F8F7F5F5F4F1F1F0EEEEEDEBEBEAE8E8
        E7DEDEDED2D2D2A24F22FF00FFC9762BFEFEFD5A7B5A5A7B5A5A7B5A5A7B5A5A
        7B5A5A7B5A5A7B5A5A7B5A5A7B5A5A7B5A5A7B5ADEDEDEA24F22FF00FFC9762B
        FEFEFD5A7B5AFEFEFD9CBDC6FEFEFD9CBDC6F8F8F7F5F5F4F1F1F09CBDC6EBEB
        EA5A7B5AE8E8E7A24F22FF00FFC9762BFEFEFD5A7B5A84A5849CBDC684A5849C
        BDC684A58484A58484A5849CBDC684A5845A7B5AEBEBEAA24F22FF00FFC9762B
        FEFEFD5A7B5AFEFEFD9CBDC6FEFEFD9CBDC6FEFEFDFBFBFAF8F8F79CBDC6F1F1
        F05A7B5AEEEEEDA24F22FF00FFC9762BFEFEFD5A7B5A84A5849CBDC684A5849C
        BDC684A58484A58484A5849CBDC684A5845A7B5AF1F1F0A24F22FF00FFC9762B
        FEFEFD5A7B5AFEFEFD9CBDC6FEFEFD9CBDC6FEFEFDFEFEFDFEFEFD9CBDC6F8F8
        F75A7B5AF6F6F5A24F22FF00FFC9762BFEFEFD5A7B5A5A7B5A5A7B5A5A7B5A5A
        7B5A5A7B5A5A7B5A5A7B5A5A7B5A5A7B5A5A7B5AFAFAF9A24F22FF00FFC9762B
        FEFEFDFEFEFDFEFEFD84A58484A58484A58484A58484A58484A58484A584FEFE
        FDFEFEFDFDFDFCA24F22FF00FFC9762BFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFE
        FEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDA24F22FF00FFC9762B
        D06F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01D06F01D06F
        01D06F01D06F01A24F22FF00FFCE6300ED9733ED9733ED9733ED9733ED9733ED
        9733ED9733F6CA9AED9733F6CA9AED9733306DF97F7488CE6300FF00FFFF00FF
        DA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B0DDA7B
        0DDA7B0DDA7B0DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      Width = 55
    end
    object dxBarStatic1: TdxBarStatic
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarControlContainerItem1: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivNever
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.xls'
    InitialDir = 'C:\Kingswood Herd Management'
    Left = 247
    Top = 192
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.xls'
    InitialDir = 'C:\Kingswood Herd Management'
    Left = 249
    Top = 230
  end
end
