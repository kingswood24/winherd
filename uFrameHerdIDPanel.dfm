object frmHerdIDPanel: TfrmHerdIDPanel
  Left = 0
  Top = 0
  Width = 163
  Height = 48
  TabOrder = 0
  object pHerdId: TPanel
    Left = 0
    Top = 0
    Width = 163
    Height = 48
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object HerdCombo: TcxLookupComboBox
      Left = 5
      Top = 23
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.DropDownWidth = 220
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'HerdIdentity'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glHorizontal
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = WinData.dsHerdDefaults
      Properties.Revertable = True
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = True
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Width = 154
    end
    object cxLabel1: TcxLabel
      Left = 4
      Top = 4
      Caption = 'Select Herd Identity'
      ParentFont = False
      Style.Font.Charset = ANSI_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
  end
end
