object fmGroupUpdate: TfmGroupUpdate
  Left = 311
  Top = 210
  Width = 442
  Height = 327
  Caption = 'Change Group'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 22
    Top = 18
    Caption = 'Animal\Group Details'
    Style.LookAndFeel.Kind = lfStandard
    Style.TextStyle = [fsBold]
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.Kind = lfStandard
    TabOrder = 0
    Height = 253
    Width = 393
    object cxButton1: TcxButton
      Left = 184
      Top = 211
      Width = 85
      Height = 27
      Action = actSave
      Default = True
      TabOrder = 0
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF002B934800FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF002B93480031A648002B934800FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00399B610031A6480031A6480031A648002B934800FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF002B93480031A6480037B7550033A1580031A648002B934800FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF003F94
        660031A6480037B755002F8D58002F8D580037B7550043A1460037B75500FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF002B93
        480037B755002F8D5800FF00FF00FF00FF002F8D580037B755002B934800FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF002F8D5800FF00FF00FF00FF00FF00FF00FF00FF002F8D580037B755002B93
        4800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF002F8D580037B7
        550037B75500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF002F8D
        580031A64800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF002F8D580031A64800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF002F8D580031A64800FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF002F8D580031A64800FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF002F8D580031A64800FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF002F8D5800FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      LookAndFeel.NativeStyle = True
      Margin = 10
      Spacing = 8
    end
    object btnOK: TcxButton
      Left = 278
      Top = 211
      Width = 85
      Height = 27
      Action = actClose
      ModalResult = 1
      TabOrder = 1
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0021AD390022883500FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00238FBB00218BB7002187B2002187B2002187B2002187B2002187B2002187
        B20021AD3900228835002C8BB3002F8CB400FF00FF00FF00FF00FF00FF00248C
        B800259DCA002CACDB0031AEDC0035B0DC0041B5DF004BB9E00057BEE20039B0
        540026983E0077CBE7007ECDE90083CFEA0039A5CE00FF00FF00FF00FF00248C
        B80030A5D0004AB8E0005BC0E3006AC6E6007BCDE80086D1EA0092D5EC0021AD
        390022883500A2DCEF00A8DEF000ADE0F10039A5CE00FF00FF00FF00FF00248C
        B80037A8D10064C3E50080CEE9008CD3EB0096D7ED009BD9EE00A1DBEF0021AD
        390022883500B1E2F200B7E4F300BCE6F40039A5CE00FF00FF00FF00FF00248C
        B80039A5CE007ECEE9009DDAEE00A2DCEF0021AD390021AD390021AD390021AD
        390021AD390021AD39001E783100CBECF70039A5CE00FF00FF00FF00FF00248C
        B80039A5CE009DDAEE00A9DFF000AEE1F100B4E3F20021AD39004BCD6A0039B0
        540035A750001E783100D4F0F800DAF2FA0039A5CE00FF00FF00FF00FF00248C
        B80039A5CE00CFEEF800E6F8FC00E6F8FC00CEEEF700CDEDF70021AD39004BCD
        6A001E783100E1F5FB00E7F8FC00ECFAFD0039A5CE00FF00FF00FF00FF00248C
        B80039A5CE0039A5CE0039A5CE0039A5CE0029ADD600DAF3FA00E6F8FC0021AD
        3900EBF9FD00F0FBFE00F5FDFE00F7FEFE0039A5CE00FF00FF00FF00FF00248C
        B8002BADD80036B1DD0054BDE3006EC7E70069C5E50039A5CE0039A5CE0039A5
        CE0039A5CE0039A5CE0039A5CE0039A5CE0039A5CE00FF00FF00FF00FF00248C
        B80043B7DC0080CEEA0092D5ED009EDAEE00A8DEF00094D6EB008DD4EA008DD4
        EA008CD3EA008CD3EA008CD3EA0054BDE300FF00FF00FF00FF00FF00FF00248C
        B8004EB8DB00AADFF000C0E8F400E6F8FC00E6F8FC00CBECF60039A5CE00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0039A5CE0039A5CE0039A5CE0039A5CE0039A5CE0039A5CE00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      Margin = 10
      Spacing = 8
    end
    object lIdentCaption: TcxLabel
      Left = 26
      Top = 27
      Caption = 'Nat. Id. Number'
    end
    object cmbAnimals: TcxLookupComboBox
      Left = 147
      Top = 25
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 5
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          Caption = 'Animal No.'
          Width = 110
          FieldName = 'AnimalNo'
        end
        item
          Caption = 'National Identity Number'
          Width = 150
          FieldName = 'NatIDNum'
        end>
      Properties.ListOptions.GridLines = glHorizontal
      Properties.ListSource = WinData.dsqFilterAnimals
      Properties.PostPopupValueOnTab = True
      Properties.OnChange = cmbAnimalsPropertiesChange
      Properties.OnCloseUp = cmbAnimalsPropertiesCloseUp
      EditValue = ''
      Style.LookAndFeel.Kind = lfStandard
      Style.LookAndFeel.NativeStyle = True
      Style.ButtonStyle = btsDefault
      Style.ButtonTransparency = ebtNone
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 3
      Width = 200
    end
    object cxGroupBox2: TcxGroupBox
      Left = 26
      Top = 60
      Caption = 'Select Groups'
      Style.LookAndFeel.Kind = lfStandard
      Style.TextStyle = [fsBold]
      StyleDisabled.LookAndFeel.Kind = lfStandard
      StyleFocused.LookAndFeel.Kind = lfStandard
      StyleHot.LookAndFeel.Kind = lfStandard
      TabOrder = 4
      Height = 139
      Width = 337
      object cmbLookupPGroups: TcxLookupComboBox
        Left = 121
        Top = 21
        Properties.DropDownAutoSize = True
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownRows = 5
        Properties.DropDownSizeable = True
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            SortOrder = soDescending
            Width = 90
            FieldName = 'Code'
          end
          item
            Width = 200
            FieldName = 'Description'
          end
          item
            Width = 120
            FieldName = 'GroupType'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListOptions.GridLines = glHorizontal
        Properties.ListSource = dsPGroups
        Properties.PostPopupValueOnTab = True
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.ButtonStyle = btsDefault
        Style.ButtonTransparency = ebtNone
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Width = 200
      end
      object cxLabel1: TcxLabel
        Left = 22
        Top = 21
        Caption = 'Purchase'
      end
      object cxLabel2: TcxLabel
        Left = 22
        Top = 49
        Caption = 'Batch'
      end
      object cxLabel3: TcxLabel
        Left = 22
        Top = 77
        Caption = 'Feed'
      end
      object cxLabel4: TcxLabel
        Left = 22
        Top = 105
        Caption = 'Sales'
      end
      object cmbLookupBGroups: TcxLookupComboBox
        Left = 121
        Top = 49
        Properties.DropDownAutoSize = True
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownRows = 5
        Properties.DropDownSizeable = True
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            SortOrder = soDescending
            Width = 90
            FieldName = 'Code'
          end
          item
            Width = 200
            FieldName = 'Description'
          end
          item
            Width = 120
            FieldName = 'GroupType'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListOptions.GridLines = glHorizontal
        Properties.ListSource = dsBGroups
        Properties.PostPopupValueOnTab = True
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.ButtonStyle = btsDefault
        Style.ButtonTransparency = ebtNone
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 5
        Width = 200
      end
      object cmbLookupFGroups: TcxLookupComboBox
        Left = 121
        Top = 77
        Properties.DropDownAutoSize = True
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownRows = 5
        Properties.DropDownSizeable = True
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            SortOrder = soDescending
            Width = 90
            FieldName = 'Code'
          end
          item
            Width = 200
            FieldName = 'Description'
          end
          item
            Width = 120
            FieldName = 'GroupType'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListOptions.GridLines = glHorizontal
        Properties.ListSource = dsFGroups
        Properties.PostPopupValueOnTab = True
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.ButtonStyle = btsDefault
        Style.ButtonTransparency = ebtNone
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 6
        Width = 200
      end
      object cmbLookupSGroups: TcxLookupComboBox
        Left = 121
        Top = 105
        Properties.DropDownAutoSize = True
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownRows = 5
        Properties.DropDownSizeable = True
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            SortOrder = soDescending
            Width = 90
            FieldName = 'Code'
          end
          item
            Width = 200
            FieldName = 'Description'
          end
          item
            Width = 120
            FieldName = 'GroupType'
          end>
        Properties.ListFieldIndex = 1
        Properties.ListOptions.GridLines = glHorizontal
        Properties.ListSource = dsSGroups
        Properties.PostPopupValueOnTab = True
        Style.LookAndFeel.Kind = lfStandard
        Style.LookAndFeel.NativeStyle = True
        Style.ButtonStyle = btsDefault
        Style.ButtonTransparency = ebtNone
        StyleDisabled.LookAndFeel.Kind = lfStandard
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfStandard
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfStandard
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 7
        Width = 200
      end
    end
  end
  object qPGroups: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * from Grps where GroupType = '#39'Purchase'#39)
    Left = 6
    Top = 126
    object qPGroupsID: TIntegerField
      FieldName = 'ID'
      Origin = 'KINGSWD."grps.DB".ID'
      Visible = False
    end
    object qPGroupsCode: TStringField
      FieldName = 'Code'
      Origin = 'KINGSWD."grps.DB".Code'
      Size = 6
    end
    object qPGroupsDescription: TStringField
      FieldName = 'Description'
      Origin = 'KINGSWD."grps.DB".Description'
      Size = 30
    end
    object qPGroupsGroupType: TStringField
      DisplayLabel = 'Type'
      FieldName = 'GroupType'
      Origin = 'KINGSWD."grps.DB".GroupType'
    end
    object qPGroupsSelected: TBooleanField
      FieldName = 'Selected'
      Origin = 'KINGSWD."grps.DB".Selected'
      Visible = False
    end
    object qPGroupsAdditionalData: TBooleanField
      FieldName = 'AdditionalData'
      Origin = 'KINGSWD."grps.DB".AdditionalData'
      Visible = False
    end
  end
  object dsPGroups: TDataSource
    DataSet = qPGroups
    Left = 4
    Top = 96
  end
  object ActionList1: TActionList
    Images = WinData.NewImages16x16
    Left = 4
    Top = 66
    object actSave: TAction
      Caption = 'Save'
      ImageIndex = 0
      OnExecute = actSaveExecute
    end
    object actClose: TAction
      Caption = 'Exit'
      ImageIndex = 2
      OnExecute = actCloseExecute
    end
  end
  object qBGroups: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * from Grps where GroupType = '#39'Batch'#39)
    Left = 8
    Top = 280
    object IntegerField1: TIntegerField
      FieldName = 'ID'
      Origin = 'KINGSWD."grps.DB".ID'
      Visible = False
    end
    object StringField1: TStringField
      FieldName = 'Code'
      Origin = 'KINGSWD."grps.DB".Code'
      Size = 6
    end
    object StringField2: TStringField
      FieldName = 'Description'
      Origin = 'KINGSWD."grps.DB".Description'
      Size = 30
    end
    object StringField3: TStringField
      DisplayLabel = 'Type'
      FieldName = 'GroupType'
      Origin = 'KINGSWD."grps.DB".GroupType'
    end
    object BooleanField1: TBooleanField
      FieldName = 'Selected'
      Origin = 'KINGSWD."grps.DB".Selected'
      Visible = False
    end
    object BooleanField2: TBooleanField
      FieldName = 'AdditionalData'
      Origin = 'KINGSWD."grps.DB".AdditionalData'
      Visible = False
    end
  end
  object qFGroups: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * from Grps where GroupType = '#39'Feed'#39)
    Left = 8
    Top = 248
    object IntegerField2: TIntegerField
      FieldName = 'ID'
      Origin = 'KINGSWD."grps.DB".ID'
      Visible = False
    end
    object StringField4: TStringField
      FieldName = 'Code'
      Origin = 'KINGSWD."grps.DB".Code'
      Size = 6
    end
    object StringField5: TStringField
      FieldName = 'Description'
      Origin = 'KINGSWD."grps.DB".Description'
      Size = 30
    end
    object StringField6: TStringField
      DisplayLabel = 'Type'
      FieldName = 'GroupType'
      Origin = 'KINGSWD."grps.DB".GroupType'
    end
    object BooleanField3: TBooleanField
      FieldName = 'Selected'
      Origin = 'KINGSWD."grps.DB".Selected'
      Visible = False
    end
    object BooleanField4: TBooleanField
      FieldName = 'AdditionalData'
      Origin = 'KINGSWD."grps.DB".AdditionalData'
      Visible = False
    end
  end
  object qSGroups: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * from Grps where GroupType = '#39'Sales'#39)
    Left = 4
    Top = 156
    object IntegerField3: TIntegerField
      FieldName = 'ID'
      Origin = 'KINGSWD."grps.DB".ID'
      Visible = False
    end
    object StringField7: TStringField
      FieldName = 'Code'
      Origin = 'KINGSWD."grps.DB".Code'
      Size = 6
    end
    object StringField8: TStringField
      FieldName = 'Description'
      Origin = 'KINGSWD."grps.DB".Description'
      Size = 30
    end
    object StringField9: TStringField
      DisplayLabel = 'Type'
      FieldName = 'GroupType'
      Origin = 'KINGSWD."grps.DB".GroupType'
    end
    object BooleanField5: TBooleanField
      FieldName = 'Selected'
      Origin = 'KINGSWD."grps.DB".Selected'
      Visible = False
    end
    object BooleanField6: TBooleanField
      FieldName = 'AdditionalData'
      Origin = 'KINGSWD."grps.DB".AdditionalData'
      Visible = False
    end
  end
  object dsBGroups: TDataSource
    DataSet = qBGroups
    Left = 6
    Top = 32
  end
  object dsFGroups: TDataSource
    DataSet = qFGroups
    Left = 6
    Top = 218
  end
  object dsSGroups: TDataSource
    DataSet = qSGroups
    Left = 6
    Top = 186
  end
end
