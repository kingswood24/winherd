object fmCTSCattleOnHolding: TfmCTSCattleOnHolding
  Left = 382
  Top = 149
  Width = 845
  Height = 577
  Caption = 'CTS Cattle On Holding'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TcxPageControl
    Left = 0
    Top = 48
    Width = 837
    Height = 478
    ActivePage = tsAnimalsOnHolding
    Align = alClient
    LookAndFeel.Kind = lfFlat
    LookAndFeel.NativeStyle = True
    TabHeight = 28
    TabOrder = 4
    TabWidth = 150
    OnPageChanging = PageControlPageChanging
    ClientRectBottom = 474
    ClientRectLeft = 4
    ClientRectRight = 833
    ClientRectTop = 34
    object tsAnimalsOnHolding: TcxTabSheet
      Caption = '&Animals On Holding'
      ImageIndex = 0
      object pcHerdReconciliation: TcxPageControl
        Left = 20
        Top = 19
        Width = 780
        Height = 293
        ActivePage = tsDataAnimalsOnHolding
        LookAndFeel.NativeStyle = True
        TabHeight = 21
        TabOrder = 3
        OnPageChanging = pcHerdReconciliationPageChanging
        ClientRectBottom = 289
        ClientRectLeft = 4
        ClientRectRight = 776
        ClientRectTop = 27
        object tsBCMSAnimals: TcxTabSheet
          Caption = 'Animals not found on your holding'
          ImageIndex = 0
          object GetHoldingAnimals: TcxGrid
            Left = 0
            Top = 0
            Width = 772
            Height = 262
            Align = alClient
            TabOrder = 0
            LookAndFeel.NativeStyle = True
            object GetHoldingAnimalsDBTableView: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              FilterBox.CustomizeDialog = False
              DataController.DataSource = dsQueryOnHolding
              DataController.KeyFieldNames = 'ID'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnFiltering = False
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.CellSelect = False
              OptionsView.DataRowHeight = 28
              OptionsView.GridLines = glHorizontal
              OptionsView.GroupByBox = False
              OptionsView.HeaderHeight = 28
              OptionsView.Indicator = True
              OptionsView.IndicatorWidth = 15
              object GetHoldingAnimalsDBTableViewEtg: TcxGridDBColumn
                Caption = 'Nat. Id. No.'
                DataBinding.FieldName = 'Etg'
                HeaderAlignmentVert = vaCenter
                Width = 123
              end
              object GetHoldingAnimalsDBTableViewDOB: TcxGridDBColumn
                Caption = 'Date Of Birth'
                DataBinding.FieldName = 'DOB'
                HeaderAlignmentVert = vaCenter
                Width = 75
              end
              object GetHoldingAnimalsDBTableViewSex: TcxGridDBColumn
                DataBinding.FieldName = 'Sex'
                HeaderAlignmentVert = vaCenter
                Width = 63
              end
              object GetHoldingAnimalsDBTableViewBrd: TcxGridDBColumn
                Caption = 'Breed'
                DataBinding.FieldName = 'Brd'
                HeaderAlignmentVert = vaCenter
                Width = 35
              end
              object GetHoldingAnimalsDBTableViewGdEtg: TcxGridDBColumn
                Caption = 'Gen. Dam Nat. Id. No.'
                DataBinding.FieldName = 'GdEtg'
                HeaderAlignmentVert = vaCenter
              end
              object GetHoldingAnimalsDBTableViewSuEtg: TcxGridDBColumn
                Caption = 'Su. Dam Nat. Id. No.'
                DataBinding.FieldName = 'SuEtg'
                HeaderAlignmentVert = vaCenter
                Width = 124
              end
              object GetHoldingAnimalsDBTableViewSiEtg: TcxGridDBColumn
                Caption = 'Sire Nat. Id. No.'
                DataBinding.FieldName = 'SiEtg'
                HeaderAlignmentVert = vaCenter
                Width = 124
              end
              object GetHoldingAnimalsDBTableViewOnDate: TcxGridDBColumn
                Caption = 'On Date'
                DataBinding.FieldName = 'OnDate'
                HeaderAlignmentVert = vaCenter
              end
            end
            object GetHoldingAnimalsLevel: TcxGridLevel
              GridView = GetHoldingAnimalsDBTableView
            end
          end
        end
        object tsDataAnimalsOnHolding: TcxTabSheet
          Caption = 'Animals not found on CTS data'
          ImageIndex = 1
          object HoldingGrid: TcxGrid
            Left = 0
            Top = 0
            Width = 772
            Height = 262
            Align = alClient
            TabOrder = 0
            LookAndFeel.NativeStyle = True
            object HoldingGridDBTableView: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              FilterBox.CustomizeDialog = False
              DataController.DataSource = dsQueryOnHolding
              DataController.KeyFieldNames = 'ID'
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsCustomize.ColumnFiltering = False
              OptionsData.CancelOnExit = False
              OptionsData.Deleting = False
              OptionsData.DeletingConfirmation = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.CellSelect = False
              OptionsView.DataRowHeight = 28
              OptionsView.GridLines = glHorizontal
              OptionsView.GroupByBox = False
              OptionsView.HeaderHeight = 28
              OptionsView.Indicator = True
              OptionsView.IndicatorWidth = 15
              object cxGridDBColumn1: TcxGridDBColumn
                Caption = 'Nat. Id. No.'
                DataBinding.FieldName = 'Etg'
                HeaderAlignmentVert = vaCenter
                Width = 132
              end
              object cxGridDBColumn2: TcxGridDBColumn
                Caption = 'Date Of Birth'
                DataBinding.FieldName = 'DOB'
                HeaderAlignmentVert = vaCenter
                Width = 100
              end
              object cxGridDBColumn3: TcxGridDBColumn
                DataBinding.FieldName = 'Sex'
                HeaderAlignmentVert = vaCenter
                Width = 63
              end
              object cxGridDBColumn4: TcxGridDBColumn
                Caption = 'Breed'
                DataBinding.FieldName = 'Brd'
                HeaderAlignmentVert = vaCenter
                Width = 52
              end
              object HoldingGridDBTableViewHerdNo: TcxGridDBColumn
                Caption = 'Herd No.'
                DataBinding.FieldName = 'HerdNo'
                HeaderAlignmentVert = vaCenter
                Width = 138
              end
            end
            object HoldingGridLevel: TcxGridLevel
              GridView = HoldingGridDBTableView
            end
          end
        end
      end
      object lGetHoldingInfo: TcxLabel
        Left = 0
        Top = 0
        Align = alTop
        AutoSize = False
        Properties.Alignment.Horz = taCenter
        Style.TextColor = clGreen
        Transparent = True
        Height = 17
        Width = 829
      end
      object cxLabel1: TcxLabel
        Left = 20
        Top = 414
        Caption = 
          'Please note that CTS Web Services is unavailable between 7 pm an' +
          'd 8 pm each evening for back ups to take place.'
        Style.TextColor = clWindowText
        Transparent = True
      end
      object gbMatch: TcxGroupBox
        Left = 20
        Top = 318
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Height = 93
        Width = 780
        object lMatchAnimalsInfo: TcxLabel
          Left = 8
          Top = 7
          AutoSize = False
          Caption = 
            'It is possible that the animals above actually exist on your her' +
            'd database. This can happen when the Nat. Id. No. within the her' +
            'd database cannnot be '#13#10'found on the CTS Holding data because th' +
            'ere may be spaces or other characters contained within the Nat. ' +
            'Id. No. Click the "Get Closest Match" button '#13#10'to search your he' +
            'rd database for possible matches.'#13#10
          Properties.WordWrap = True
          Style.TextColor = clWindowText
          Transparent = True
          Height = 43
          Width = 762
        end
        object btnGetClosetMatch: TcxButton
          Left = 10
          Top = 55
          Width = 135
          Height = 27
          Action = actGetClosestMatch
          TabOrder = 0
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000520B0000520B00000000000000000000FF00FFFF00FF
            AEAEAE999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C
            9E999C9E999C9EFF00FFFF00FFFF00FFAEAEAEFEFEFDFDFDFCFAFAF9F6F6F5F3
            F3F2F0F0EFECECEBE9E9E8E4E4E4DBDBDBD2D2D29C9FA1FF00FFFF00FFFF00FF
            AEAEAEFEFEFDFEFEFDFDFDFCFAFAF9F6F6F5F3F3F2F0F0EFECECEBE9E9E8E4E4
            E4DBDBDB9C9FA1FF00FFFF00FFFF00FFAEAEAEFEFEFDFEFEFDC9C9C9C9C9C9C9
            C9C9C9C9C9C9C9C9C9C9C9C9C9C9E9E9E8E4E4E49C9FA1FF00FFFF00FFFF00FF
            9A9D9FDCDCDBDCDCDBDCDCDBDCDCDBDCDCDBDCDCDBDCDCDBDCDCDBDCDCDBDCDC
            DBDCDCDB7B7D7FFF00FFFF00FFBD5A10AD4A00AD4A00AD4A00AD4A00AD4A00AD
            4A00AD4A00AD4A00AD4A00AD4A00AD4A00AD4A00AD4A00AD4A00FF00FFCE6B00
            AEAEAEFEFEFDEB9B73E88E60E88E60E88E60E88E60E88E60E88E60E88E60EB9B
            73F0F0EF9C9FA1AD4A00FF00FFCE6B00CE6B00CE6B00CE6B00CE6B00CE6B00CE
            6B00CE6B00CE6B00CE6B00CE6B00CE6B00CE6B00CE6B00BD5A10FF00FFFF00FF
            AEAEAEFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFBFB
            FAF8F8F79C9FA1FF00FFFF00FFFF00FFAEAEAEFEFEFDFEFEFDC9C9C9C9C9C9C9
            C9C9C9C9C9C9C9C9C9C9C9C9C9C9FEFEFDFBFBFA9C9FA1FF00FFFF00FFFF00FF
            AEAEAEFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
            FDFEFEFD9C9FA1FF00FFFF00FFFF00FFAEAEAEFEFEFDFEFEFDFEFEFDFEFEFDFE
            FEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD9C9FA1FF00FFFF00FFFF00FF
            AEAEAEFEFEFDFEFEFDC9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9FEFE
            FDFEFEFD9C9FA1FF00FFFF00FFFF00FFAEAEAEFEFEFDFEFEFDFEFEFDFEFEFDFE
            FEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD9B9B9CFF00FFFF00FFFF00FF
            AEAEAEFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
            FDFEFEFD9B9B9CFF00FFFF00FFFF00FFAEAEAE9B9B9C9B9B9C9B9B9C9B9B9C9B
            9B9C9B9B9C9B9B9C9B9B9C9C9FA19B9B9C9B9B9C9B9B9CFF00FF}
          LookAndFeel.NativeStyle = True
        end
        object btnAddToHerd: TcxButton
          Left = 154
          Top = 55
          Width = 135
          Height = 27
          Action = actAddToHerd
          TabOrder = 2
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF001B74AF001B74AF001B74AF001B74AF001B74AF001B74AF001B74AF001B74
            AF001B74AF001B74AF001B74AF001B74AF00FF00FF00FF00FF00FF00FF001B74
            AF00F4FAFC00F0F8FC00ECF6FB00E8F4FA00E4F2FA00E1F0F900DDEEF800D9EC
            F800D5EAF700D1E8F600CEE6F600CEE6F6001B74AF00FF00FF00FF00FF001B74
            AF00F8FCFD003BA2D80035A0D600309DD5002A9BD4002599D3001F96D2001A94
            D0001491CF000F8FCE00098DCD00CEE6F6001B74AF00FF00FF00FF00FF001B74
            AF00FBFEFE0040A4D9003BA2D80035A0D6002F9DD500FFFFFF008DC5EB001F96
            D2001994D0001491CF000F8FCE00D1E8F6001B74AF00FF00FF00FF00FF001B74
            AF00FFFFFF0045A7DA0040A4D9003BA2D80035A0D600FFFFFF008DC5EB002599
            D3001F96D2001994D0001491CF00D5EAF7001B74AF00FF00FF00FF00FF001B74
            AF00FFFFFF004BAADC0047A7DA0041A5D9003BA3D800FFFFFF008DC5EB002B9C
            D4002699D3002096D2001B94D100D9ECF8001B74AF00FF00FF00FF00FF001B74
            AF00FFFFFF0052ADDD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF002699D3002197D200DDEEF8001B74AF00FF00FF00FF00FF001B74
            AF00FFFFFF005CB1DF008DC5EB008DC5EB008DC5EB00FFFFFF008DC5EB008DC5
            EB008DC5EB002C9CD400279AD300E3F1F9001B74AF00FF00FF00FF00FF001B74
            AF00FFFFFF0065B5E1005CB1DF0052ADDD004CAADC00FFFFFF008DC5EB003DA3
            D80037A1D700319ED6002C9CD400E6F3FA001B74AF00FF00FF00FF00FF001B74
            AF00FFFFFF006EB9E30065B5E1005BB1DF0052ADDD00FFFFFF008DC5EB0042A5
            D9003DA3D80037A1D700329ED600EAF5FB001B74AF00FF00FF00FF00FF001B74
            AF00FFFFFF0079BEE60071BAE40067B6E1005DB2DF0055AEDE004DAADC0048A8
            DB0043A6D9003DA3D80038A1D700EEF7FB001B74AF00FF00FF00FF00FF001B74
            AF00FFFFFF0084C2E8007CBFE60071BAE40068B6E20060B2E00055AEDD004EAB
            DC0049A9DB0044A6DA003FA4D900F2F9FC001B74AF00FF00FF00FF00FF001B74
            AF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FDFFFE00FAFDFE00F6FBFD001B74AF00FF00FF00FF00FF00FF00
            FF001B74AF001B74AF001B74AF001B74AF001B74AF001B74AF001B74AF001B74
            AF001B74AF001B74AF001B74AF001B74AF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          LookAndFeel.NativeStyle = True
        end
        object btnPrintAnimalsOnHolding: TcxButton
          Left = 638
          Top = 55
          Width = 135
          Height = 27
          Action = actPrintAnimalsOnHolding
          TabOrder = 3
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000520B0000520B00000000000000000000FF00FFFF00FF
            AEAEAE999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C9E999C
            9E999C9E999C9EFF00FFFF00FFFF00FF636B73F7F7F7F4F4F4F2F2F2EFEFEFED
            EDEDEAEAEAE8E8E8E2E2E2DDDDDDD7D7D7D2D2D29C9FA1FF00FFFF00FF636B73
            3775AB636B73F7F7F7F4F4F4F2F2F2EFEFEFEDEDEDEAEAEAE8E8E8E2E2E2DDDD
            DDD7D7D79C9FA1FF00FFFF00FF31A5FF5ABDFF2F76B3636B73F7F7F7F4F4F4F2
            F2F2EFEFEFEDEDEDEAEAEAE8E8E8E2E2E2DDDDDD9C9FA1FF00FFFF00FFFF00FF
            31A5FF5ABDFF2F76B3F7F7F7F7F7F7F4F4F4F2F2F2EFEFEFEDEDEDEAEAEAE8E8
            E8E2E2E29C9FA1FF00FFFF00FFFF00FFAEAEAE31A5FF4A4239E5DAD5DCC3B1CC
            A79DD3B6A3DDC5BAE5DAD5EDEDEDEAEAEAE8E8E89C9FA1FF00FFFF00FFFF00FF
            AEAEAEFFFFFFE5DAD5AD9383E7D6AAF8E8B5F3E4B2E7D4AECCA79DE9E9E9EDED
            EDEAEAEA9C9FA1FF00FFFF00FFFF00FFAEAEAEFFFFFFD7B9B2ECDDADF9E8B6FF
            EFBBFFF1BCFEF0BBECDEADD3BAB4F0F0F0EDEDED9C9FA1FF00FFFF00FFFF00FF
            AEAEAEFFFFFFCCA79DEBDCACF9E8B6FEEDBBFFF0BCFFF1BDFBEBB7CCA79DF3F3
            F3F0F0F09C9FA1FF00FFFF00FFFF00FFAEAEAEFFFFFFD7B9B2E2D4A7F4E5B7FB
            EEC8FCEBBAFCECB9F0E0B0D7B9B2F5F5F5EAEAEA9C9FA1FF00FFFF00FFFF00FF
            AEAEAEFFFFFFE7D5D5DBC8A9EEE1BAF6E9C2F5E5B4EDDEAED7BE9EDFCAC3E2E2
            E2DDDDDD9C9FA1FF00FFFF00FFFF00FFAEAEAEFFFFFFFFFFFFCCA79DD8C3AEDD
            C9A6DFCAA6DABEA2D4B6AEEBEBEB9C9FA19C9FA19C9FA1FF00FFFF00FFFF00FF
            AEAEAEFFFFFFFFFFFFFFFFFFE7D5D5D7B9B2D7B9B2DDCEC7FFFFFFA8A9AAFFFF
            FFE6E6E69C9FA1FF00FFFF00FFFF00FFAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFA8A9AAE6E6E69B9D9DFF00FFFF00FFFF00FFFF00FF
            AEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A9AA9B9D
            9DFF00FFFF00FFFF00FFFF00FFFF00FFAEAEAE9B9B9C9B9B9C9B9B9C9B9B9C9B
            9B9C9B9B9C9B9B9C9B9B9C9C9FA1FF00FFFF00FFFF00FFFF00FF}
          LookAndFeel.NativeStyle = True
        end
        object btnAddRemoveAll: TcxButton
          Left = 296
          Top = 55
          Width = 135
          Height = 27
          Action = actAddAllToHerd
          TabOrder = 4
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF001B74AF001B74AF001B74AF001B74AF001B74AF001B74AF001B74AF001B74
            AF001B74AF001B74AF001B74AF001B74AF00FF00FF00FF00FF00FF00FF001B74
            AF00F4FAFC00F0F8FC00ECF6FB00E8F4FA00E4F2FA00E1F0F900DDEEF800D9EC
            F800D5EAF700D1E8F600CEE6F600CEE6F6001B74AF00FF00FF00FF00FF001B74
            AF00F8FCFD003BA2D80035A0D600309DD5002A9BD4002599D3001F96D2001A94
            D0001491CF000F8FCE00098DCD00CEE6F6001B74AF00FF00FF00FF00FF001B74
            AF00FBFEFE0040A4D9003BA2D80035A0D6002F9DD500FFFFFF008DC5EB001F96
            D2001994D0001491CF000F8FCE00D1E8F6001B74AF00FF00FF00FF00FF001B74
            AF00FFFFFF0045A7DA0040A4D9003BA2D80035A0D600FFFFFF008DC5EB002599
            D3001F96D2001994D0001491CF00D5EAF7001B74AF00FF00FF00FF00FF001B74
            AF00FFFFFF004BAADC0047A7DA0041A5D9003BA3D800FFFFFF008DC5EB002B9C
            D4002699D3002096D2001B94D100D9ECF8001B74AF00FF00FF00FF00FF001B74
            AF00FFFFFF0052ADDD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF002699D3002197D200DDEEF8001B74AF00FF00FF00FF00FF001B74
            AF00FFFFFF005CB1DF008DC5EB008DC5EB008DC5EB00FFFFFF008DC5EB008DC5
            EB008DC5EB002C9CD400279AD300E3F1F9001B74AF00FF00FF00FF00FF001B74
            AF00FFFFFF0065B5E1005CB1DF0052ADDD004CAADC00FFFFFF008DC5EB003DA3
            D80037A1D700319ED6002C9CD400E6F3FA001B74AF00FF00FF00FF00FF001B74
            AF00FFFFFF006EB9E30065B5E1005BB1DF0052ADDD00FFFFFF008DC5EB0042A5
            D9003DA3D80037A1D700329ED600EAF5FB001B74AF00FF00FF00FF00FF001B74
            AF00FFFFFF0079BEE60071BAE40067B6E1005DB2DF0055AEDE004DAADC0048A8
            DB0043A6D9003DA3D80038A1D700EEF7FB001B74AF00FF00FF00FF00FF001B74
            AF00FFFFFF0084C2E8007CBFE60071BAE40068B6E20060B2E00055AEDD004EAB
            DC0049A9DB0044A6DA003FA4D900F2F9FC001B74AF00FF00FF00FF00FF001B74
            AF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FDFFFE00FAFDFE00F6FBFD001B74AF00FF00FF00FF00FF00FF00
            FF001B74AF001B74AF001B74AF001B74AF001B74AF001B74AF001B74AF001B74
            AF001B74AF001B74AF001B74AF001B74AF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          LookAndFeel.NativeStyle = True
        end
        object pSaleDate: TPanel
          Left = 438
          Top = 51
          Width = 185
          Height = 35
          BevelOuter = bvNone
          TabOrder = 5
          object lSaleDate: TcxLabel
            Left = 8
            Top = 8
            Caption = 'Sale Date :'
          end
          object deSaleDate: TcxDateEdit
            Left = 68
            Top = 7
            TabOrder = 1
            Width = 110
          end
        end
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'Registration Results'
      ImageIndex = 2
      TabVisible = False
    end
    object tsQueriedAnimals: TcxTabSheet
      Caption = '&Queried Animals'
      ImageIndex = 1
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 829
        Height = 440
        Align = alClient
        TabOrder = 0
        LookAndFeel.NativeStyle = True
        object cxGridDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          FilterBox.CustomizeDialog = False
          DataController.DataSource = dsQueryOnHolding
          DataController.KeyFieldNames = 'ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.DataRowHeight = 28
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 28
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 15
          object cxGridDBColumn5: TcxGridDBColumn
            Caption = 'Nat. Id. No.'
            DataBinding.FieldName = 'Etg'
            HeaderAlignmentVert = vaCenter
            Width = 123
          end
          object cxGridDBColumn6: TcxGridDBColumn
            Caption = 'Date Of Birth'
            DataBinding.FieldName = 'DOB'
            HeaderAlignmentVert = vaCenter
            Width = 75
          end
          object cxGridDBColumn7: TcxGridDBColumn
            DataBinding.FieldName = 'Sex'
            HeaderAlignmentVert = vaCenter
            Width = 63
          end
          object cxGridDBColumn8: TcxGridDBColumn
            Caption = 'Breed'
            DataBinding.FieldName = 'Brd'
            HeaderAlignmentVert = vaCenter
            Width = 35
          end
          object cxGridDBColumn9: TcxGridDBColumn
            Caption = 'Gen. Dam Nat. Id. No.'
            DataBinding.FieldName = 'GdEtg'
            HeaderAlignmentVert = vaCenter
          end
          object cxGridDBColumn10: TcxGridDBColumn
            Caption = 'Su. Dam Nat. Id. No.'
            DataBinding.FieldName = 'SuEtg'
            HeaderAlignmentVert = vaCenter
            Width = 124
          end
          object cxGridDBColumn11: TcxGridDBColumn
            Caption = 'Sire Nat. Id. No.'
            DataBinding.FieldName = 'SiEtg'
            HeaderAlignmentVert = vaCenter
            Width = 124
          end
          object cxGridDBColumn12: TcxGridDBColumn
            Caption = 'On Date'
            DataBinding.FieldName = 'OnDate'
            HeaderAlignmentVert = vaCenter
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
    end
    object tsQueriedMovements: TcxTabSheet
      Caption = 'Queried &Movements'
      ImageIndex = 2
      object GridQueriedMovements: TcxGrid
        Left = 18
        Top = 22
        Width = 779
        Height = 387
        TabOrder = 0
        LookAndFeel.NativeStyle = True
        object GridQueriedMovementsTableView: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          FilterBox.CustomizeDialog = False
          DataController.DataSource = dsQueryOnHolding
          DataController.KeyFieldNames = 'ID'
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.DataRowHeight = 28
          OptionsView.GridLines = glHorizontal
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 28
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 15
          object GridQueriedMovementsTableViewEtg: TcxGridDBColumn
            Caption = 'Nat. Id. No.'
            DataBinding.FieldName = 'Etg'
            HeaderAlignmentVert = vaCenter
            Width = 133
          end
          object GridQueriedMovementsTableViewMoveDate: TcxGridDBColumn
            Caption = 'Move Date'
            DataBinding.FieldName = 'MoveDate'
            HeaderAlignmentVert = vaCenter
            Width = 92
          end
          object GridQueriedMovementsTableViewMoveType: TcxGridDBColumn
            Caption = 'Move Type'
            DataBinding.FieldName = 'MoveType'
            HeaderAlignmentVert = vaCenter
            Width = 121
          end
          object GridQueriedMovementsTableViewReceivedDate: TcxGridDBColumn
            Caption = 'Received Date'
            DataBinding.FieldName = 'ReceivedDate'
            HeaderAlignmentVert = vaCenter
          end
        end
        object GridQueriedMovementsLevel: TcxGridLevel
          GridView = GridQueriedMovementsTableView
        end
      end
    end
  end
  object StatusBar: TdxStatusBar
    Left = 0
    Top = 526
    Width = 837
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Width = 150
      end>
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object ActionList1: TActionList
    Images = ImageStore.ImageList16x16
    Left = 560
    Top = 42
    object actExit: TAction
      Caption = 'Exit'
      ImageIndex = 0
      OnExecute = actExitExecute
    end
    object actLogin: TAction
      Caption = 'CTS Login Information'
      ImageIndex = 24
      OnExecute = actLoginExecute
    end
    object actGetHoldingData: TAction
      Caption = 'Download &Holding Data'
      ImageIndex = 23
      OnExecute = actGetHoldingDataExecute
    end
    object actHelp: TAction
      Caption = 'Help'
      ImageIndex = 7
      OnExecute = actHelpExecute
    end
    object actCheckCTSWSStatus: TAction
      Caption = 'Check CTS Web Service Status'
      ImageIndex = 28
      OnExecute = actCheckCTSWSStatusExecute
    end
    object actViewCTSExceptions: TAction
      Caption = 'View CTS Exceptions'
      ImageIndex = 29
      OnExecute = actViewCTSExceptionsExecute
    end
    object actReconcileHerd: TAction
      Caption = 'Reconcile Herd'
      ImageIndex = 20
      OnExecute = actReconcileHerdExecute
      OnUpdate = actReconcileHerdUpdate
    end
    object actGetClosestMatch: TAction
      Caption = '&Get Closest Match'
      ImageIndex = 5
      OnExecute = actGetClosestMatchExecute
    end
    object actAddToHerd: TAction
      Caption = 'Add To Herd'
      ImageIndex = 9
      OnExecute = actAddToHerdExecute
    end
    object actPrintAnimalsOnHolding: TAction
      Caption = 'Print Listing'
      OnExecute = actPrintAnimalsOnHoldingExecute
    end
    object actReconcileOptions: TAction
      Caption = 'Reconcile Options'
      ImageIndex = 26
      OnExecute = actReconcileOptionsExecute
    end
    object actAddAllToHerd: TAction
      Caption = 'Add All To Herd'
      ImageIndex = 9
      OnExecute = actAddAllToHerdExecute
    end
    object actRemoveAllFromHerd: TAction
      Caption = 'Remove All From Herd'
      ImageIndex = 10
      OnExecute = actRemoveAllFromHerdExecute
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
        Caption = 'MainToolbar'
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
            Item = dxBarLargeButton1
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbGetHoldingData
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbReconcileHerd
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarLargeButton2
            Visible = True
          end
          item
            BeginGroup = True
            Item = blbHelp
            Visible = True
          end
          item
            BeginGroup = True
            Item = dxBarStatic1
            Visible = True
          end>
        Name = 'MainToolbar'
        OneOnRow = True
        Row = 0
        ShowMark = False
        SizeGrip = False
        UseOwnFont = False
        UseRecentItems = False
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
    HotImages = ImageStore.ImageList16x16
    Images = ImageStore.ImageList16x16
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 592
    Top = 42
    DockControlHeights = (
      0
      0
      48
      0)
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actExit
      Caption = '&Exit'
      Category = 0
      Height = 44
      HotImageIndex = 0
      Width = 55
    end
    object dxBarLargeButton2: TdxBarLargeButton
      Caption = '&Options'
      Category = 0
      Hint = 'Options'
      Visible = ivAlways
      ButtonStyle = bsDropDown
      DropDownMenu = dxBarPopupMenu1
      Height = 44
      HotImageIndex = 27
      LargeImageIndex = 24
      SyncImageIndex = False
      ImageIndex = 27
    end
    object blbGetHoldingData: TdxBarLargeButton
      Action = actGetHoldingData
      Category = 0
      Height = 44
      HotImageIndex = 23
    end
    object blbHelp: TdxBarLargeButton
      Action = actHelp
      Caption = '&Help'
      Category = 0
      Height = 44
      HotImageIndex = 7
      Width = 55
      SyncImageIndex = False
      ImageIndex = 7
    end
    object dxBarStatic1: TdxBarStatic
      Category = 0
      Visible = ivAlways
    end
    object dxBarListItem1: TdxBarListItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      Detachable = True
      DetachingBar = 0
      Items.Strings = (
        'CTS Login Information')
    end
    object dxBarButton1: TdxBarButton
      Action = actLogin
      Category = 0
    end
    object dxBarButton3: TdxBarButton
      Action = actCheckCTSWSStatus
      Caption = 'Check CTS Web Service Status...'
      Category = 0
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'System'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Item = dxBarButton2
          Visible = True
        end
        item
          BeginGroup = True
          Item = bbReconcileWithNatIdNoFormatting
          Visible = True
        end>
    end
    object dxBarButton2: TdxBarButton
      Action = actViewCTSExceptions
      Category = 0
    end
    object blbReconcileHerd: TdxBarLargeButton
      Action = actReconcileHerd
      Caption = '&Reconcile Herd'
      Category = 0
      Height = 44
      HotImageIndex = 20
    end
    object bbReconcileWithNatIdNoFormatting: TdxBarButton
      Caption = 'Reconcile your herd using Nat. Id. No. Formatting'
      Category = 0
      Hint = 'Reconcile your herd using Nat. Id. No. Formatting'
      Visible = ivAlways
      ButtonStyle = bsChecked
    end
    object dxBarButton4: TdxBarButton
      Action = actReconcileOptions
      Category = 0
    end
  end
  object dsQueryOnHolding: TDataSource
    DataSet = QueryOnHolding
    Left = 94
    Top = 254
  end
  object QueryOnHolding: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * from tmpCTSOnHolding')
    Left = 94
    Top = 216
    object QueryOnHoldingID: TIntegerField
      FieldName = 'ID'
      Origin = 'KINGSWD."tmpCTSOnHolding.DB".ID'
    end
    object QueryOnHoldingOnHoldingType: TIntegerField
      FieldName = 'OnHoldingType'
      Origin = 'KINGSWD."tmpCTSOnHolding.DB".OnHoldingType'
    end
    object QueryOnHoldingEtg: TStringField
      FieldName = 'Etg'
      Origin = 'KINGSWD."tmpCTSOnHolding.DB".Etg'
      Size = 14
    end
    object QueryOnHoldingDOB: TDateTimeField
      FieldName = 'DOB'
      Origin = 'KINGSWD."tmpCTSOnHolding.DB".DOB'
    end
    object QueryOnHoldingBrd: TStringField
      FieldName = 'Brd'
      Origin = 'KINGSWD."tmpCTSOnHolding.DB".Brd'
      Size = 6
    end
    object QueryOnHoldingSex: TStringField
      FieldName = 'Sex'
      Origin = 'KINGSWD."tmpCTSOnHolding.DB".Sex'
      Size = 8
    end
    object QueryOnHoldingGdEtg: TStringField
      FieldName = 'GdEtg'
      Origin = 'KINGSWD."tmpCTSOnHolding.DB".GdEtg'
    end
    object QueryOnHoldingSuEtg: TStringField
      FieldName = 'SuEtg'
      Origin = 'KINGSWD."tmpCTSOnHolding.DB".SuEtg'
    end
    object QueryOnHoldingSiEtg: TStringField
      FieldName = 'SiEtg'
      Origin = 'KINGSWD."tmpCTSOnHolding.DB".SiEtg'
    end
    object QueryOnHoldingOnDate: TDateTimeField
      FieldName = 'OnDate'
      Origin = 'KINGSWD."tmpCTSOnHolding.DB".OnDate'
    end
    object QueryOnHoldingMoveDate: TDateTimeField
      FieldName = 'MoveDate'
      Origin = 'KINGSWD."tmpCTSOnHolding.DB".MoveDate'
    end
    object QueryOnHoldingMoveType: TIntegerField
      FieldName = 'MoveType'
      Origin = 'KINGSWD."tmpCTSOnHolding.DB".MoveType'
    end
    object QueryOnHoldingReceivedDate: TDateTimeField
      FieldName = 'ReceivedDate'
      Origin = 'KINGSWD."tmpCTSOnHolding.DB".ReceivedDate'
    end
    object QueryOnHoldingOnHerd: TBooleanField
      FieldName = 'OnHerd'
      Origin = 'KINGSWD."tmpCTSOnHolding.DB".OnHerd'
    end
  end
  object dxBarPopupMenu1: TdxBarPopupMenu
    BarManager = dxBarManager1
    ItemLinks = <
      item
        Item = dxBarButton1
        Visible = True
      end
      item
        Item = dxBarButton3
        Visible = True
      end
      item
        Item = dxBarSubItem1
        Visible = True
      end
      item
        BeginGroup = True
        Item = dxBarButton4
        Visible = True
      end>
    UseOwnFont = False
    Left = 360
    Top = 202
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = cplCattleOnHolding
    PreviewOptions.EnableOptions = [peoCanChangeMargins, peoPageBackground, peoPageSetup, peoPrint]
    PreviewOptions.VisibleOptions = [pvoPageBackground, pvoPageSetup, pvoPrint, pvoReportFileOperations, pvoPageMargins]
    PreviewOptions.WindowState = wsMaximized
    PrintTitle = 'Kingswood Grid Print'
    Version = 0
    Left = 402
    Top = 279
    object cplCattleOnHolding: TdxGridReportLink
      Active = True
      Component = HoldingGrid
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 6350
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageFooter.LeftTitle.Strings = (
        '')
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportDocument.CreationDate = 43840.7294561343
      ReportTitle.Text = 'Cattle on your holding not found on the CTS system.'
      OptionsOnEveryPage.Caption = False
      OptionsOnEveryPage.FilterBar = False
      OptionsSize.AutoWidth = True
      OptionsView.Caption = False
      OptionsView.ExpandButtons = False
      OptionsView.FilterBar = False
      OptionsView.GroupFooters = False
      BuiltInReportLink = True
    end
  end
end
