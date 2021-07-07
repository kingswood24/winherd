object HerdLookup: THerdLookup
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 345
  Top = 119
  Height = 861
  Width = 1164
  object qGenLook: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      ''
      '')
    Left = 40
    Top = 16
  end
  object dsqGenLook: TDataSource
    DataSet = qGenLook
    Left = 68
    Top = 16
  end
  object tblLookupGenLook: TTable
    Tag = 1
    DatabaseName = 'Kingswd'
    ReadOnly = True
    TableName = 'GenLook.DB'
    Left = 160
    Top = 52
  end
  object LookupHealthReportDesc: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select ID, Description from GenLook where ListType = 23'
      'Order By Description')
    Left = 40
    Top = 68
  end
  object dsLookupHealthReportDesc: TDataSource
    DataSet = LookupHealthReportDesc
    Left = 68
    Top = 68
  end
  object NIStillBornReasons: TdxMemData
    Tag = 1
    Indexes = <>
    Persistent.Data = {
      566572CDCCCCCCCCCCFC3F02000000040000000C0003004944003D0000000100
      0C004465736372697074696F6E0001010000003500000043616C66205374696C
      6C626F726E2F41626F72746564206F7220646965642077697468696E20312064
      6179206F662062697274680001020000003000000043616C662068756D616E65
      6C7920736C6175676874657265642077697468696E203120646179206F662062
      697274680001030000002900000043616C662064696564206265747765656E20
      3120616E642032302064617973206F6620626972746800010400000039000000
      43616C662068756D616E656C7920736C61756768746572656420626574776565
      6E203120616E642032302064617973206F6620626972746800}
    ReadOnly = True
    SortOptions = [soCaseInsensitive]
    SortedField = 'Description'
    Left = 42
    Top = 166
    object NIStillBornReasonsID: TAutoIncField
      FieldName = 'ID'
    end
    object NIStillBornReasonsDescription: TStringField
      FieldName = 'Description'
      Size = 60
    end
  end
  object dsNIStillBornReasons: TDataSource
    DataSet = NIStillBornReasons
    Left = 70
    Top = 166
  end
  object CustomerQuery: TQuery
    DatabaseName = 'Kingswd'
    Left = 40
    Top = 118
  end
  object dsCustomerQuery: TDataSource
    DataSet = CustomerQuery
    Left = 68
    Top = 118
  end
  object mdEventTypes: TdxMemData
    Tag = 1
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F040000000400000003000A004576656E7454797065
      001E00000001000C004465736372697074696F6E000200000005000C00557365
      7256697369626C65000200000005001300416C6C6F77426C6F636B44656C6574
      696F6E000101000000010700000042756C6C696E670101000101000102000000
      0107000000536572766963650101000101000103000000011300000050726567
      6E616E637920446961676E6F7369730101000101000104000000010700000044
      7279204F66660101000101000105000000010700000043616C76696E67010100
      010000010600000001060000004865616C746801010001010001070000000108
      0000005765696768696E67010100010100010800000001110000004669727374
      20416765205072656D69756D010000010000010900000001120000005365636F
      6E6420416765205072656D69756D010000010000010A000000010C0000004275
      6C6C205072656D69756D010000010000010B000000010A00000053616C655C44
      65617468010100010000010C0000000108000000507572636861736501010001
      0000010D00000001080000004D6F76656D656E74010100010000010E00000001
      09000000496E74657268657264010000010000010F000000010B00000053746F
      636B2042756C6C200100000100000110000000010C0000004E65772049442045
      76656E740101000100000112000000010E00000041626F7274696F6E20457665
      6E740101000100000113000000011000000043617374726174696F6E20457665
      6E740101000100000114000000010F000000436F6E646974696F6E2053636F72
      6501010001010001150000000111000000446961676E6F7369732050726F626C
      656D01010001000001160000000111000000456D6272796F205472616E73706C
      616E74010100010000011700000001080000004D617374697469730101000100
      000118000000010C000000546F2042652043756C6C6564010100010000011900
      000001070000005765616E696E67010100010000011A0000000114000000496E
      7465726E616C204578616D696E6174696F6E010100010000011B000000010D00
      000053746F636B2042756C6C20496E010100010000011C000000010F00000053
      746F636B2042756C6C204F757420010100010000011D000000010C0000004772
      6F7570204368616E6765010000010000011E000000011C000000457874656E64
      656420507265676E616E637920446961676E6F736973010000010000011F0000
      00010A00000044697362756464696E670101000100000120000000010C000000
      4D65616C2046656564696E670101000100000121000000010E00000044697362
      756464696E67204E2F410101000100000122000000010E000000436173747261
      74696F6E204E2F410101000100000123000000010F00000046657274696C6974
      7920436865636B010100010100012400000001100000004D696C6B2054656D70
      6572616D656E740101000101000125000000010D0000004A6F686E6573205265
      73756C740101000101000126000000010B00000056616363696E6174696F6E01
      01000101000127000000010C000000506C616E6E65642042756C6C0101000101
      000128000000010E000000494342462044616D204576656E7401010001010001
      290000000115000000494342462053746F636B2042756C6C204576656E740101
      00010100012A0000000116000000494342462043616C66205375727665792045
      76656E7401010001010001670000000113000000507265676E616E6379204469
      61676E6F736973010100010100012B00000001080000004D6173746974697301
      0100010100012C00000001080000004C616D656E657373010100010100}
    SortOptions = [soCaseInsensitive]
    SortedField = 'Description'
    Left = 44
    Top = 212
    object mdEventTypesEventType: TIntegerField
      FieldName = 'EventType'
    end
    object mdEventTypesDescription: TStringField
      FieldName = 'Description'
      Size = 30
    end
    object mdEventTypesUserDisplay: TBooleanField
      FieldName = 'UserVisible'
    end
    object mdEventTypesAllowBlockDeletion: TBooleanField
      FieldName = 'AllowBlockDeletion'
    end
  end
  object dsEventTypes: TDataSource
    DataSet = mdEventTypes
    Left = 72
    Top = 212
  end
  object QueryHealthWithDrawals: TQuery
    OnCalcFields = QueryHealthWithDrawalsCalcFields
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      
        'SELECT DISTINCT E.ID, E.EventDate, E.EventType, A.HerdID, P.Expi' +
        'ryDate, H.DrugPurchID, '
      
        'M.WithDrawal MeatDays, M.MilkWithDrawal MilkDays,  M.OtherWithDr' +
        'awal '
      'OtherDays, M.MilkN_A_Drug, M. MeatN_A_Drug, H.NoDays,'
      
        'M.OrganicMeatWithDrawal OrganicMeatDays, M.OrganicMilkWithDrawal' +
        ' OrganicMilkDays,  M.OrganicOtherWithDrawal '
      'OrganicOtherDays'
      'FROM Animals A'
      'LEFT JOIN Events E  on (E.AnimalID = A.ID) '
      'LEFT JOIN Health H  on (H.EventID = E.ID)  '
      'LEFT JOIN Medicine M on (M.ID = H.DrugUsed) '
      'LEFT JOIN MediPur P on (P.ID = H.DrugPurchID ) '
      'WHERE ( A.ID = :AID  )'
      'AND ( E.EventType IN (4,6) )'
      ' ')
    Left = 160
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'AID'
        ParamType = ptUnknown
        Value = 100
      end>
    object QueryHealthWithDrawalsID: TIntegerField
      FieldName = 'ID'
    end
    object QueryHealthWithDrawalsEventDate: TDateField
      FieldName = 'EventDate'
    end
    object QueryHealthWithDrawalsExpiryDate: TDateField
      FieldName = 'ExpiryDate'
    end
    object QueryHealthWithDrawalsDrugPurchID: TIntegerField
      FieldName = 'DrugPurchID'
    end
    object QueryHealthWithDrawalsMeatDays: TFloatField
      FieldName = 'MeatDays'
    end
    object QueryHealthWithDrawalsMilkDays: TIntegerField
      FieldName = 'MilkDays'
    end
    object QueryHealthWithDrawalsOtherDays: TIntegerField
      FieldName = 'OtherDays'
    end
    object QueryHealthWithDrawalsNoDays: TIntegerField
      FieldName = 'NoDays'
    end
    object QueryHealthWithDrawalsMeatWD: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'MeatWD'
      Calculated = True
    end
    object QueryHealthWithDrawalsMilkWD: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'MilkWD'
      Calculated = True
    end
    object QueryHealthWithDrawalsOtherWD: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'OtherWD'
      Calculated = True
    end
    object QueryHealthWithDrawalsEventType: TSmallintField
      FieldName = 'EventType'
    end
    object QueryHealthWithDrawalsOrganicMeatDays: TIntegerField
      FieldName = 'OrganicMeatDays'
    end
    object QueryHealthWithDrawalsOrganicMilkDays: TIntegerField
      FieldName = 'OrganicMilkDays'
    end
    object QueryHealthWithDrawalsOrganicOtherDays: TIntegerField
      FieldName = 'OrganicOtherDays'
    end
    object QueryHealthWithDrawalsOrganicMeatWD: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'OrganicMeatWD'
      Calculated = True
    end
    object QueryHealthWithDrawalsOrganicMilkWD: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'OrganicMilkWD'
      Calculated = True
    end
    object QueryHealthWithDrawalsOrganicOtherWD: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'OrganicOtherWD'
      Calculated = True
    end
    object QueryHealthWithDrawalsHerdID: TIntegerField
      FieldName = 'HerdID'
    end
    object QueryHealthWithDrawalsMilkN_A_Drug: TBooleanField
      FieldName = 'MilkN_A_Drug'
    end
    object QueryHealthWithDrawalsMeatN_A_Drug: TBooleanField
      FieldName = 'MeatN_A_Drug'
    end
  end
  object EditRepository: TcxEditRepository
    Left = 382
    Top = 82
    object erCustomerLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          SortOrder = soAscending
          FieldName = 'Name'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glHorizontal
      Properties.Revertable = True
    end
    object erSupplierLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          SortOrder = soAscending
          FieldName = 'Name'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glHorizontal
      Properties.Revertable = True
    end
    object erBreedLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Code'
        end
        item
          FieldName = 'Name'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glHorizontal
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
    end
    object erMedicineLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.CharCase = ecUpperCase
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          Caption = 'Medicine'
          SortOrder = soAscending
          Width = 150
          FieldName = 'Name'
        end
        item
          Caption = 'In Use'
          FieldName = 'InUse'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glHorizontal
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
    end
    object erMediAdminLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          SortOrder = soAscending
          Width = 120
          FieldName = 'Name'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glHorizontal
      Properties.ListOptions.ShowHeader = False
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
    end
    object erCalfDocilityLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          Width = 120
          FieldName = 'Description'
        end
        item
          Width = 60
          FieldName = 'Score'
        end
        item
          MinWidth = 0
          Sorting = False
          Width = 0
          FieldName = 'ListType'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glNone
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
      Properties.OnInitPopup = erCalfDocilityLookupPropertiesInitPopup
    end
    object erCalfQualityLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          Width = 120
          FieldName = 'Description'
        end
        item
          Width = 60
          FieldName = 'Score'
        end
        item
          MinWidth = 0
          Sorting = False
          Width = 0
          FieldName = 'ListType'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glNone
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
      Properties.OnInitPopup = erCalfQualityLookupPropertiesInitPopup
    end
    object erHealthDescriptionsLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsEditList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'EventDesc'
      Properties.ListColumns = <
        item
          Caption = 'Comment'
          SortOrder = soAscending
          Width = 180
          FieldName = 'EventDesc'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glHorizontal
      Properties.ListSource = dsQueryHealthDescriptions
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
    end
    object erLookupHealthReminder: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          SortOrder = soAscending
          Width = 180
          FieldName = 'Description'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glHorizontal
      Properties.ListSource = dsLookupHealthReportDesc
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
    end
    object erFertProgramsLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          SortOrder = soAscending
          FieldName = 'Description'
        end
        item
          Width = 95
          FieldName = 'Code'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glHorizontal
      Properties.ListSource = dsQueryFertPrograms
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
    end
    object erFeedGroupLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          SortOrder = soDescending
          Width = 220
          FieldName = 'Description'
        end
        item
          Width = 120
          FieldName = 'Code'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glHorizontal
      Properties.ListSource = dsFGroups
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
    end
    object erLookupBuyers: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          SortOrder = soAscending
          Width = 220
          FieldName = 'Name'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glHorizontal
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
    end
    object erMedicineGroupLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Description'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsQueryMedicineGroups
      Properties.PostPopupValueOnTab = True
    end
    object erSexCombo: TcxEditRepositoryComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.ImmediateUpdateText = True
      Properties.Items.Strings = (
        ''
        'Female'
        'Bull'
        'Steer'
        'Male')
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
    end
    object erColourCombo: TcxEditRepositoryColorComboBox
      Properties.ColorComboStyle = cxccsComboList
      Properties.CustomColors = <
        item
          Color = clRed
        end
        item
          Color = clMaroon
        end
        item
          Color = clBlue
        end
        item
          Color = clOlive
        end
        item
          Color = clGreen
        end
        item
          Color = clFuchsia
        end
        item
          Color = clPurple
        end>
      Properties.DefaultColor = clBlue
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.NamingConvention = cxncNone
      Properties.PostPopupValueOnTab = True
      Properties.PrepareList = cxplNone
    end
    object erDamLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'NatIDNum'
        end
        item
          FieldName = 'Animalno'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glHorizontal
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsDamLookup
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
    end
    object erTagLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.CharCase = ecUpperCase
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsEditList
      Properties.DropDownRows = 10
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'TagNumber'
      Properties.ListColumns = <
        item
          Caption = 'Nat. Id. No.'
          Sorting = False
          FieldName = 'TagNumber'
        end
        item
          MinWidth = 0
          SortOrder = soAscending
          Width = 0
          FieldName = 'SortTagNumber'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsTagStore
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
    end
    object erNatIdNoEntryStyleLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 3
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'InputStyle'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glHorizontal
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsmdNatIDNoInputStyles
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
    end
    object erLookupDisposalManner: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          SortOrder = soAscending
          Width = 130
          FieldName = 'Description'
        end
        item
          MinWidth = 0
          Width = 0
          FieldName = 'InUse'
        end
        item
          MinWidth = 0
          Width = 0
          FieldName = 'ID'
        end
        item
          MinWidth = 0
          Width = 0
          FieldName = 'LookupCode'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsqGenLook
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
    end
    object erHerdIDLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'HerdIdentity'
        end
        item
          FieldName = 'Name'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glHorizontal
      Properties.ListOptions.ShowHeader = False
      Properties.Revertable = True
    end
    object ICBFHealthCodeLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          SortOrder = soAscending
          Width = 220
          FieldName = 'Description'
        end
        item
          Caption = 'Code'
          Width = 85
          FieldName = 'LookupCode'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glHorizontal
      Properties.ListOptions.ShowHeader = False
    end
    object erConditionScoreAssociatedEvents: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'EventType'
      Properties.ListColumns = <
        item
          FieldName = 'Description'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glHorizontal
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsmdConditionScoreAssociatedEvents
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
    end
    object erDrugBatchNoLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.DropDownWidth = 195
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          Caption = 'Batch No.'
          SortOrder = soAscending
          Width = 110
          FieldName = 'BatchNo'
        end
        item
          Caption = 'Expiry Date'
          Width = 85
          FieldName = 'ExpiryDate'
        end
        item
          MinWidth = 0
          Width = 0
          FieldName = 'DrugId'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glHorizontal
      Properties.PostPopupValueOnTab = True
    end
    object erAdminByVet: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          SortOrder = soAscending
          Width = 140
          FieldName = 'Name'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glHorizontal
      Properties.ListOptions.ShowHeader = False
    end
    object erLookupEventTypes: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'EventType'
      Properties.ListColumns = <
        item
          FieldName = 'Description'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glNone
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsEventTypes
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
    end
    object erFertilityCheckStatus: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 4
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Description'
        end>
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.ColumnSorting = False
      Properties.ListOptions.GridLines = glHorizontal
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsQueryFertilityCheckStatus
      Properties.Revertable = True
    end
    object erFertilityCheckAction: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownRows = 4
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Description'
        end>
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.ColumnSorting = False
      Properties.ListOptions.GridLines = glHorizontal
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsQueryFertilityCheckAction
      Properties.Revertable = True
    end
    object erLookupSires: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'AnimalNo'
        end>
    end
    object erSingleCalfTypeCombo: TcxEditRepositoryComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'M'
        'F')
    end
    object erMultipleCalfTypeCombo: TcxEditRepositoryComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        'M/M'
        'F/F'
        'M/F')
    end
    object erVaccineTypeLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Description'
        end>
      Properties.ListSource = dsHerdVaccineType
    end
    object erDamMilkAbilityLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Description'
        end
        item
          FieldName = 'Score'
        end
        item
          MinWidth = 0
          Width = 0
          FieldName = 'ListType'
        end>
      Properties.ListOptions.GridLines = glNone
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
      Properties.OnInitPopup = erDamMilkAbilityLookupPropertiesInitPopup
    end
    object erDamDocilityLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Description'
        end
        item
          FieldName = 'Score'
        end
        item
          MinWidth = 0
          Width = 0
          FieldName = 'ListType'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glNone
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
      Properties.OnInitPopup = erDamDocilityLookupPropertiesInitPopup
    end
    object erBullFunctionalityLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Description'
        end
        item
          FieldName = 'Score'
        end
        item
          MinWidth = 0
          Width = 0
          FieldName = 'ListType'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glNone
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
      Properties.OnInitPopup = erBullFunctionalityLookupPropertiesInitPopup
    end
    object erBullDocilityLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Description'
        end
        item
          FieldName = 'Score'
        end
        item
          MinWidth = 0
          Width = 0
          FieldName = 'ListType'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.CaseInsensitive = True
      Properties.ListOptions.GridLines = glNone
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
      Properties.OnInitPopup = erBullDocilityLookupPropertiesInitPopup
    end
    object erBatchGroupLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Description'
        end
        item
          FieldName = 'Code'
        end>
      Properties.ListSource = dsBatchGroups
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
    end
    object erPurchaseGroupLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Description'
        end
        item
          FieldName = 'Code'
        end>
      Properties.ListSource = dsPurchaseGroups
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
    end
    object erICBFSexedSemenLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.ListColumns = <
        item
          Caption = 'Code'
          Width = 64
          FieldName = 'LookupCode'
        end
        item
          Width = 200
          FieldName = 'Description'
        end>
      Properties.ListSource = dsICBFSexedSemenType
    end
    object erStockBulls: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          Caption = 'Animal No'
          Width = 100
          FieldName = 'AnimalNo'
        end>
      Properties.ListSource = dsStockBulls
    end
    object erCalfVitalityLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Description'
        end
        item
          FieldName = 'Score'
        end
        item
          MinWidth = 0
          Width = 0
          FieldName = 'ListType'
        end>
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
      Properties.OnInitPopup = erCalfVitalityLookupPropertiesInitPopup
    end
    object erCalfScourLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Description'
        end
        item
          FieldName = 'Score'
        end
        item
          MinWidth = 0
          Width = 0
          FieldName = 'ListType'
        end>
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
      Properties.OnInitPopup = erCalfScourPropertiesInitPopup
    end
    object erCalfPneumoniaLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Description'
        end
        item
          FieldName = 'Score'
        end
        item
          MinWidth = 0
          Width = 0
          FieldName = 'ListType'
        end>
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
      Properties.OnInitPopup = erCalfPneumoniaPropertiesInitPopup
    end
    object erCalfSizeLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          Width = 60
          FieldName = 'Description'
        end
        item
          Width = 70
          FieldName = 'Score'
        end>
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
    end
    object erAnimalColourCodeLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.DropDownWidth = 100
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'LookupCode'
      Properties.ListColumns = <
        item
          FieldName = 'Description'
        end>
      Properties.ListSource = dsAnimalColours
    end
    object erLookupBatchGroups: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Description'
        end>
      Properties.ListSource = dsBatchGroups
    end
    object erLookupTreatmentUsed: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Description'
        end>
    end
    object erPureBredBreedLookup: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownAutoSize = True
      Properties.DropDownListStyle = lsFixedList
      Properties.DropDownSizeable = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          FieldName = 'Code'
        end
        item
          FieldName = 'Name'
        end>
      Properties.ListSource = dsPureBredBreeds
      Properties.PostPopupValueOnTab = True
      Properties.Revertable = True
    end
    object erLookupBatchByPurchDate: TcxEditRepositoryLookupComboBoxItem
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'ID'
      Properties.ListColumns = <
        item
          Caption = 'Batch'
          Width = 80
          FieldName = 'BatchNo'
        end
        item
          Caption = 'Purch Date'
          Width = 100
          FieldName = 'PurchDate'
        end
        item
          Caption = 'Qty. Rem'
          Width = 80
          FieldName = 'QtyRemaining'
        end>
      Properties.ListSource = dsBatchNosWithQtyRem
    end
  end
  object GenQuery: TQuery
    DatabaseName = 'Kingswd'
    Left = 162
    Top = 148
  end
  object qDrugList: TQuery
    AutoRefresh = True
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * From Medicine M'
      'Where InUse = True'
      'Order By Name ASC')
    Left = 496
    Top = 54
    object qDrugListID: TIntegerField
      FieldName = 'ID'
      Origin = 'KINGSWD."Medicine.DB".ID'
    end
    object qDrugListDrugCode: TStringField
      FieldName = 'DrugCode'
      Origin = 'KINGSWD."Medicine.DB".DrugCode'
      Size = 6
    end
    object qDrugListName: TStringField
      FieldName = 'Name'
      Origin = 'KINGSWD."Medicine.DB".Name'
      Size = 30
    end
    object qDrugListWithdrawal: TFloatField
      FieldName = 'Withdrawal'
      Origin = 'KINGSWD."Medicine.DB".Withdrawal'
    end
    object qDrugListDoseUnit: TIntegerField
      FieldName = 'DoseUnit'
      Origin = 'KINGSWD."Medicine.DB".DoseUnit'
    end
    object qDrugListPurchUnit: TIntegerField
      FieldName = 'PurchUnit'
      Origin = 'KINGSWD."Medicine.DB".PurchUnit'
    end
    object qDrugListQuantityInStock: TFloatField
      FieldName = 'QuantityInStock'
      Origin = 'KINGSWD."Medicine.DB".QuantityInStock'
    end
    object qDrugListCostPurchUnit: TFloatField
      FieldName = 'CostPurchUnit'
      Origin = 'KINGSWD."Medicine.DB".CostPurchUnit'
    end
    object qDrugListMilkWithDrawal: TIntegerField
      FieldName = 'MilkWithDrawal'
      Origin = 'KINGSWD."Medicine.DB".MilkWithDrawal'
    end
    object qDrugListOtherWithDrawal: TIntegerField
      FieldName = 'OtherWithDrawal'
      Origin = 'KINGSWD."Medicine.DB".OtherWithDrawal'
    end
    object qDrugListInUse: TBooleanField
      FieldName = 'InUse'
      Origin = 'KINGSWD."Medicine.DB".InUse'
    end
    object qDrugListStockLevel: TFloatField
      FieldName = 'StockLevel'
      Origin = 'KINGSWD."Medicine.DB".StockLevel'
    end
    object qDrugListOrganicMeatWithdrawal: TIntegerField
      FieldName = 'OrganicMeatWithdrawal'
      Origin = 'KINGSWD."Medicine.DB".OrganicMeatWithdrawal'
    end
    object qDrugListOrganicMilkWithdrawal: TIntegerField
      FieldName = 'OrganicMilkWithdrawal'
      Origin = 'KINGSWD."Medicine.DB".OrganicMilkWithdrawal'
    end
    object qDrugListOrganicOtherWithdrawal: TIntegerField
      FieldName = 'OrganicOtherWithdrawal'
      Origin = 'KINGSWD."Medicine.DB".OrganicOtherWithdrawal'
    end
    object qDrugListMediGroup: TIntegerField
      FieldName = 'MediGroup'
      Origin = 'KINGSWD."Medicine.DB".MediGroup'
    end
    object qDrugListVPANo: TStringField
      FieldName = 'VPANo'
      Origin = 'KINGSWD."Medicine.DB".VPANo'
    end
    object qDrugListMilkN_A_Drug: TBooleanField
      FieldName = 'MilkN_A_Drug'
      Origin = 'KINGSWD."Medicine.DB".MilkN_A_Drug'
    end
    object qDrugListMeatN_A_Drug: TBooleanField
      FieldName = 'MeatN_A_Drug'
      Origin = 'KINGSWD."Medicine.DB".MeatN_A_Drug'
    end
    object qDrugListIsSynchronized: TBooleanField
      FieldName = 'IsSynchronized'
      Origin = 'KINGSWD."Medicine.DB".IsSynchronized'
    end
  end
  object dsDrugList: TDataSource
    DataSet = qDrugList
    Left = 438
    Top = 6
  end
  object ImageList16x16: TImageList
    Left = 486
    Top = 178
    Bitmap = {
      494C010112001300040010001000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      000000000000000000000000000000000000000000002173B500636B73000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002173B500218CEF002173B500636B
      7300000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D0BAA400FFD6AD00EFBD
      8C00EFBD8C00C0AC970000000000000000000000000000000000CABEB400FFD6
      AD00EFBD8C00EFBD8C00C8AB8D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000031A5FF0052BDFF00218CEF002173
      B500636B73000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007A7A7A006E6E6E005C5C
      5C004C4C4C003A3A3A00000000000000000000000000000000005E5E5E005A5A
      5A00484848003D3D3D0038383800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000031A5FF0052BDFF00218C
      EF002173B500636B730000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000898989007C7C7C006464
      6400515151003A3A3A0000000000000000000000000000000000575757006161
      61004F4F4F004141410038383800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000031A5FF0052BD
      FF00218CEF002173B500636B7300000000000000000000000000000000000000
      00000000000000000000000000000000000000000000898989007C7C7C006464
      6400515151003A3A3A006C6C6C00000000000000000079797900636363006161
      61004F4F4F004141410038383800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000031A5
      FF0052BDFF00218CEF005A6B730000000000D5B9B400D6ADA500D6ADA500D6AD
      A500D5B9B40000000000000000000000000000000000898989007C7C7C006464
      6400515151003F3F3F002D2D2D002D2D2D005C5C5C0070707000676767006161
      61004F4F4F004141410038383800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000031A5FF0031A5FF004A423900B69B8B00F0E2C000F9EFC800FDF2CB00FEF4
      CC00ECD8C200D6ADA500000000000000000000000000898989007C7C7C006464
      640051515100424242002B2B2B00000000007A7A7A0097979700707070006161
      61004F4F4F004141410038383800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BB9F8800F3E3B600FCF3D100FEF6CD00FEF7CF00FEF9
      D000FDF7D200F5E6C200D6ADA5000000000000000000818181007C7C7C006464
      640051515100424242002B2B2B00000000007A7A7A0097979700707070006161
      61004F4F4F00414141003A3A3A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D5B9B400EFE1B500FAEDBD00FFF1C100FFF3C200FFF5C400FFF7
      C500FFFAC700FDF8D200D6ADA50000000000000000007C7C7C00787878006969
      690051515100424242002D2D2D00000000007A7A7A0097979700707070006161
      61004E4E4E003838380059595900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D6ADA500EFE3B600FBECBE00FDEFBF00FEF1C100FFF2C200FFF4
      C400FFF7C500FFF9C700EEE2BB00D6ADA50000000000000000007C7C7C007878
      7800515151004242420031313100262626007A7A7A0097979700707070006161
      6100494949005959590000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D6ADA500EDE1B400F6E9BE00FCF1D300FCF0C900FEF0C100FFF1
      C200FFF4C300FFF6C500F6E9C200CBAF9C000000000000000000000000006C6C
      6C005757570040404000333333005B5B5B006262620067676700545454004A4A
      4A00595959000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D6ADA500EBDEB200F2E6BB00FCF2D700FCF1D300FCEEC000FEEF
      C200FFF2C200FEF2C200EFE1BB00D2B3A3000000000000000000000000008E8E
      8E0045454500363636006464640000000000000000006F6F6F00323232003232
      3200646464000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D5B9B400E4D8B000EDE1B600F3E7BC00F8EBC000F9EBBC00FBED
      BE00FAECBD00F5E9BA00D6ADA500000000000000000000000000000000008E8E
      8E009B9B9B006C6C6C00646464000000000000000000898989009B9B9B006C6C
      6C00646464000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D6ADA500EADFBC00ECE0B600F0E3B600F1E5B700F2E5
      B700EFE3B500F5E7BC00D5B9B400000000000000000000000000000000008E8E
      8E009B9B9B006C6C6C006464640000000000000000008E8E8E009B9B9B006C6C
      6C00646464000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D6ADA500E0D4B500EADEB400EBDEB100E8DB
      B100D6ADA500D5B9B40000000000000000000000000000000000000000000000
      00008E8E8E0089898900000000000000000000000000000000008E8E8E008989
      8900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D5B9B400D6ADA500D6ADA500D9B7
      A300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D0A284009886710000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000002EE4001B48FB000000000000000000000000000000
      000000000000000000000000000094A8A8009AA3A30000000000000000000000
      00000000000000000000000000000000000000000000097EC900096EB000096E
      B000096EB000096EB000096EB000096EB000096EB000096EB000096EB000096E
      B000096EB000096EB000096EB000000000000000000000000000000000000000
      00000000000000000000D0A28400F9CAA700EEBA8E0098867100000000000000
      000000000000000000000000000000000000000000001B48FB00002EE4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000002EE4001B48FB00000000000000000000000000000000000000
      0000829B9B00839C9C00A8C3C6009AC4C10091AAAA009EA3A300A6B7BA000000
      000000000000000000000000000000000000000000000B8ADA004AC8FD004AC8
      FD004AC8FD004AC8FD004AC8FD004AC8FD004AC8FD004AC8FD004AC8FD004AC8
      FD004AC8FD004AC8FD00096EB000000000000000000000000000000000000000
      000000000000D0A28400F9CAA700FFBB8100FFB47B00EEBA8E00988671000000
      000000000000000000000000000000000000000000001B48FB003E5EFF00002E
      E400000000000000000000000000000000000000000000000000000000000000
      0000002EE4001B48FB00000000000000000000000000000000009C9F9F0092A8
      AA0074939700728C8D0088A3A2006F9194008BA5A400B4CBCB00A6C4C8000000
      000000000000000000000000000000000000000000000B8ADA004AC8FD00ACAB
      AB009A9D9E009A9D9E009A9D9E009A9D9E009A9D9E009A9D9E009A9D9E009A9D
      9E009A9D9E004AC8FD00096EB000000000000000000000000000000000000000
      0000D0A28400F9CAA700FFBB8100FFBB8100FFB47B00FFB47B00EEBA8E009886
      710000000000000000000000000000000000000000001B48FB001B48FB003E5E
      FF00002EE400000000000000000000000000000000000000000000000000002E
      E4001B48FB0000000000000000000000000000000000000000006B807F00748D
      8B007C979B00748F9000789796008CABAF007B95920092ACAC0096B2B2009BA9
      AA00A0AFB000A8BBBE000000000000000000000000000B8ADA004AC8FD00ACAB
      AB00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFE
      FD009A9D9E004AC8FD00096EB00000000000000000000000000000000000D0A2
      8400F9CAA700FFBB8100FFBB8100FFBB8100FFB47B00FFB47B00FFB47B00EEBA
      8E009886710000000000000000000000000000000000000000003E5EFF001B48
      FB003E5EFF00002EE40000000000000000000000000000000000002EE4001B48
      FB0000000000000000000000000000000000000000008F9F9F00768F94006881
      81006F888800809F9D0084A6A50087A9A70092BBB7009BBFC00099B9B70091AB
      AA00B1C8CB00000000000000000000000000000000000B8ADA004AC8FD00ACAB
      AB00FEFEFD00FBFBFC005454D400E3E3F700FEFEFD00FEFEFD00FEFEFD00FEFE
      FD009A9D9E004AC8FD00096EB000000000000000000000000000D0A28400F9CA
      A700FFC99200FFC99200FFC99200FFBB8100FFB47B00EEBA8E00EEBA8E00EEBA
      8E00EEBA8E009886710000000000000000000000000000000000000000000000
      00001B48FB003E5EFF00002EE4000000000000000000002EE400002EE4000000
      000000000000000000000000000000000000000000008D9594006B8382007389
      880089A2A00088A3A10087A8A5009DC5C1009BC4C10082A8A70070928F008DA3
      A400A3C0C5009AAAAC00A1A7A70000000000000000000B8ADA004AC8FD00ACAB
      AB00FEFEFD00B3B3EB000000C0002424C900FBFBFC00FEFEFD00FEFEFD00FEFE
      FD009A9D9E004AC8FD00096EB0000000000000000000D0A28400D0A28400D0A2
      8400D0A28400D0A28400F9CAA700FFBB8100FFB47B00EEBA8E00988671009886
      7100988671009886710098867100000000000000000000000000000000000000
      0000000000001B48FB003E5EFF00002EE400002EE400002EE400000000000000
      000000000000000000000000000000000000A2A7A7008CA2A200768D8B00728B
      8900728D8B00738D8A007995920089ADA90084A8A400799A98008AACA900A7C5
      C90088ADB10096B6B700B1C5C40000000000000000000B8ADA004AC8FD00ACAB
      AB00FEFEFD004040CF000C0CC3000000C0009B9BE500FEFEFD00FEFEFD00FEFE
      FD009A9D9E004AC8FD00096EB000000000000000000000000000000000000000
      000000000000D0A28400F9CAA700FFBB8100FFB47B00EEBA8E00988671000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001B48FB001B48FB001B48FB0000000000000000000000
      0000000000000000000000000000000000009EA3A300899E9D007C949200849F
      9F00849F9F0079908E0089999600828E8C0087A4A00088AEAA009FC0BF0093BC
      B90066888600A0B9B8000000000000000000000000000B8ADA004AC8FD00ACAB
      AB008B8BE1000000C0007070DB006464D8001818C600EFEFF900FEFEFD00FEFE
      FD009A9D9E004AC8FD00096EB000000000000000000000000000000000000000
      000000000000D0A28400F9CAA700FFBB8100FFB47B00EEBA8E00988671000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001B48FB003E5EFF001B48FB003E5EFF00002EE400000000000000
      00000000000000000000000000000000000000000000969A9A009AB0AE0088A3
      A3007992930073888800819796009EA2A2007C918D0091B6B200B4D7D600B8DE
      DB0098B7B80095B4B700ABC5C800A9AFAF00000000000B8ADA004AC8FD00ACAB
      AB008787E1001C1CC700E3E3F700EFEFF9002020C8006060D700FEFEFD00FEFE
      FD009A9D9E004AC8FD00096EB000000000000000000000000000000000000000
      000000000000D0A28400F9CAA700FFBB8100FFB47B00EEBA8E00988671000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001B48FB003E5EFF00002EE40000000000000000001B48FB00002EE4000000
      000000000000000000000000000000000000000000008E9A99009FB2B0007B97
      9600748D8E006E83840068808000697D7B006F84810096B2AE00BFE3E000C4E4
      E4009DBDBF008DB3B600C4E1E100BACBC900000000000B8ADA004AC8FD00ACAB
      AB00FEFEFD00FEFEFD00FEFEFD00FEFEFD00CBCBF1000C0CC300AFAFEA00FEFE
      FD009A9D9E004AC8FD00096EB000000000000000000000000000000000000000
      000000000000D0A28400F9CAA700FFBB8100FFB47B00EEBA8E00988671000000
      0000000000000000000000000000000000000000000000000000000000001B48
      FB003E5EFF00002EE400000000000000000000000000000000001B48FB00002E
      E40000000000000000000000000000000000000000008F9595009BAFAC008DA8
      A7005C797A0056707300476163004E666600617C7A008FAAA700C7E6E600AACF
      CF00779895008AA7A600AEB9B90000000000000000000B8ADA004AC8FD00ACAB
      AB00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00ABABE9001414C500DFDF
      F6009A9D9E004AC8FD00096EB000000000000000000000000000000000000000
      000000000000D0A28400F9CAA700FFBB8100FFB47B00EEBA8E00988671000000
      00000000000000000000000000000000000000000000000000001B48FB003E5E
      FF00002EE4000000000000000000000000000000000000000000000000001B48
      FB00002EE400000000000000000000000000000000000000000098A6A40096B0
      B300597A7C00415D6200425E600047605F006B88860091AFAD00AFD0D10095B4
      B3008CA8AB009FBEC300A7B5B60000000000000000000B8ADA004AC8FD00ACAB
      AB00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00ABABE9003434
      CC0093969F004AC8FD00096EB000000000000000000000000000000000000000
      000000000000D0A28400F9CAA700FFBB8100FFB47B00EEBA8E00988671000000
      000000000000000000000000000000000000000000001B48FB006482FF00002E
      E400000000000000000000000000000000000000000000000000000000000000
      000000000000002EE400000000000000000000000000000000008F9594007E93
      90008CA9AC00819C9F006D878700708D8C007F9C9A0086A1A00069868200688B
      86009ABCBF00BCDBD9000000000000000000000000000B8ADA004AC8FD00ACAB
      AB00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00ABAB
      E9002B2CB60047BFFA00096EB000000000000000000000000000000000000000
      000000000000D0A28400F9CAA700FFC99200FFC99200FFC99200988671000000
      0000000000000000000000000000000000001B48FB006482FF00002EE4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000989F9F00849F9E00869F9E00809B9800728C8900647C7A0088A4A20091B2
      B2009CB7B600A9AEAE000000000000000000000000000B84D1004AC8FD00ACAB
      AB00ACABAB008D9295006C70720061616000616160006161600061616000ACAB
      AB008C8BAF00235EDD000A7BC400000000000000000000000000000000000000
      000000000000D0A2840098867100988671009886710098867100988671000000
      0000000000000000000000000000000000001B48FB001B48FB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F999800000000007B8A8900A0B5B6008593940099B0AE00B0C0
      C0000000000000000000000000000000000000000000000000000B84D1000B84
      D1000B84D1009DA1A300FFFFFF00E5E6E700E5E6E700B5B7B900616160000A70
      B1000A7BC4000A7BC40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000094999900A0A8A70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009DA1A3009DA1A3009DA1A3008D929500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000060A8B90060A8B90060A8B90060A8B900000000000000
      0000000000000000000000000000000000000000000000000000AEAEAE00999C
      9E00999C9E00999C9E00999C9E00999C9E00999C9E00999C9E00999C9E00999C
      9E00999C9E00999C9E00999C9E00000000000000000000000000000000000000
      000000000000D0A2840098867100988671009886710098867100988671000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002B9348000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000060A8B90046AB
      C80060A8B90095C5D00062B2C70047B5D6003AACD0002096BE0067B4D00047A8
      C900309CC00060A8B90000000000000000000000000000000000AEAEAE00F7F7
      F700F4F4F400F2F2F200EFEFEF00EDEDED00EAEAEA00E8E8E800E2E2E200DDDD
      DD00D7D7D700D2D2D2009C9FA100000000000000000000000000000000000000
      000000000000D0A28400F9CAA700FFC99200FFC99200FFC99200988671000000
      0000000000000000000000000000000000000000000000000000000000002B93
      480031A648002B93480000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004CA3BB004FAF
      CF0059B4D20058B7D50021ABD3006BC2DD0086D4E90036AED20066C1DC006DC2
      DD0033A4C8002192BA0000000000000000000000000000000000AEAEAE00F9F9
      F900F7F7F700F4F4F400F2F2F200EFEFEF00EDEDED00EAEAEA00E8E8E8009B9B
      9B009B9B9B00D7D7D7009C9FA100000000000000000000000000000000000000
      000000000000D0A28400F9CAA700FFBB8100FFB47B00EEBA8E00988671000000
      0000000000000000000000000000000000000000000000000000399B610031A6
      480031A6480031A648002B934800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000060A8B90041A4C30065BE
      D90076C8E0004AAAC80056B0CC009FDFF0009FDFF00087D2E7006EC9E30092D7
      EA0085CAE0002B97BD0060A8B900000000000000000000000000AEAEAE00FCFC
      FC00F9F9F900F7F7F700F4F4F400F2F2F200EFEFEF00EDEDED00EAEAEA00E8E8
      E800E2E2E200DDDDDD009C9FA100000000000000000000000000000000000000
      000000000000D0A28400F9CAA700FFBB8100FFB47B00EEBA8E00988671000000
      00000000000000000000000000000000000000000000000000002B93480031A6
      480037B7550033A1580031A648002B9348000000000000000000000000000000
      0000000000000000000000000000000000005FACC10074C7E0004CB3D4007ECF
      E600A1E0F100A1E0F100A1E0F100A1E0F100A1E0F100A1E0F100A0E1F200A2E5
      F60071D4EE0035B3D90030A9D1003197B9000000000000000000AEAEAE00FEFE
      FE009B9B9B009B9B9B00F7F7F7009B9B9B009B9B9B009B9B9B00EDEDED009B9B
      9B009B9B9B00E2E2E2009C9FA100000000000000000000000000000000000000
      000000000000D0A28400F9CAA700FFBB8100FFB47B00EEBA8E00988671000000
      000000000000000000000000000000000000000000003F94660031A6480037B7
      55002F8D58002F8D580037B7550043A1460037B7550000000000000000000000
      00000000000000000000000000000000000056A6BC006EBFD80089D6EA009CDE
      F000A1E0F100A1E0F1008DD2E60071C1D60071BFD40075C2DA008CD1E600A0E0
      F10091DCF00074D1EA005AC1DF001D97C0000000000000000000AEAEAE00FFFF
      FF00FEFEFE00FCFCFC00F9F9F900F7F7F700F4F4F400F2F2F200EFEFEF00EDED
      ED00EAEAEA00E8E8E8009C9FA100000000000000000000000000000000000000
      000000000000D0A28400F9CAA700FFBB8100FFB47B00EEBA8E00988671000000
      000000000000000000000000000000000000000000002B93480037B755002F8D
      580000000000000000002F8D580037B755002B93480000000000000000000000
      00000000000000000000000000000000000060A8B9005DB6D000BEEFFB00B1EA
      F80097D9EB0076B3C700ADADAD00ACACAC00AAA0A000ADA0A0006EAEC3008FD3
      E800A1E0F100A1E0F1003FA6C90060A8B9000000000000000000AEAEAE00FFFF
      FF009B9B9B009B9B9B00FCFCFC009B9B9B009B9B9B009B9B9B00F2F2F2009B9B
      9B009B9B9B00EAEAEA009C9FA100000000000000000000000000000000000000
      000000000000D0A28400F9CAA700FFBB8100FFB47B00EEBA8E00988671000000
      00000000000000000000000000000000000000000000000000002F8D58000000
      00000000000000000000000000002F8D580037B755002B934800000000000000
      00000000000000000000000000000000000053A5BC004CAECE00C0EFFB00B8ED
      FA0096C9D7009EA7AB00DADADA00B5B5B500B0A4A400D2B5B5009CAAB10076C0
      D600A1E4F400B0E9F8003CA3C6002391B7000000000000000000AEAEAE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FAFAFA00F8F8F800F5F5F500F3F3
      F300F0F0F000EDEDED009C9FA100000000000000000000000000000000000000
      000000000000D0A28400F9CAA700FFBB8100FFB47B00EEBA8E00988671000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002F8D580037B7550037B755000000
      0000000000000000000000000000000000007CB7C70071BACE00A4DEEF00BEEF
      FB00A5CFDA00B8B8B800DEDEDE00B5B5B500B0A4A400D3B5B500BFA9A9007CB0
      C100A3E7F90093D2E30058B0CE005AAECC000000000000000000AEAEAE00FFFF
      FF009B9B9B009B9B9B00FFFFFF009B9B9B009B9B9B009B9B9B00F8F8F8009B9B
      9B009B9B9B00F0F0F0009C9FA1000000000000000000D0A28400D0A28400D0A2
      8400D0A28400D0A28400F9CAA700FFBB8100FFB47B00EEBA8E00988671009886
      7100988671009886710098867100000000000000000000000000000000000000
      000000000000000000000000000000000000000000002F8D580031A648000000
      0000000000000000000000000000000000000000000060A8B9006EB8CD00AEE5
      F300ACD1DA00B8B8B800DEDEDE00B5B5B500B0A4A400D3B5B500BFA9A9007CB0
      C10077D3EC00369CBF0060A8B900000000000000000000000000AEAEAE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FAFAFA00F8F8
      F800F5F5F500EAEAEA009C9FA100000000000000000000000000D0A28400F9CA
      A700FFC99200FFC99200FFC99200FFBB8100FFB47B00EEBA8E00EEBA8E00EEBA
      8E00EEBA8E009886710000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002F8D580031A6
      480000000000000000000000000000000000000000000000000078B3C3005BA9
      C10078AABA00B8B8B800DEDEDE00B5B5B500B0A4A400D3B5B500BFA9A9004D9F
      B90036A4C80056ADCC0000000000000000000000000000000000AEAEAE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00EAEA
      EA00E2E2E200DDDDDD009C9FA10000000000000000000000000000000000D0A2
      8400F9CAA700FFBB8100FFBB8100FFBB8100FFB47B00FFB47B00FFB47B00EEBA
      8E00988671000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002F8D
      580031A6480000000000000000000000000000000000000000000000000060A8
      B90060A8B900B8B8B800DEDEDE00B5B5B500B0A4A400D3B5B500BFA9A90060A8
      B90060A8B9000000000000000000000000000000000000000000AEAEAE00FFFF
      FF009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B00FFFFFF00A8A9
      AA009C9FA1009C9FA1009C9FA100000000000000000000000000000000000000
      0000D0A28400F9CAA700FFBB8100FFBB8100FFB47B00FFB47B00EEBA8E009886
      7100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00002F8D580031A6480000000000000000000000000000000000000000000000
      000000000000AEADAD00BFBFBF00A5A5A5009F9A9A00B3A3A300B0A1A1000000
      0000000000000000000000000000000000000000000000000000AEAEAE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A9
      AA00FFFFFF00E6E6E6009C9FA100000000000000000000000000000000000000
      000000000000D0A28400F9CAA700FFBB8100FFB47B00EEBA8E00988671000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002F8D580031A64800000000000000000000000000000000000000
      000000000000AFAFAF00D5D4D400BFBFBF00A5A1A100B0A3A300A19999000000
      0000000000000000000000000000000000000000000000000000AEAEAE00FFFF
      FF009B9B9B009B9B9B009B9B9B00FFFFFF009B9B9B009B9B9B00FFFFFF00A8A9
      AA00E6E6E6009B9D9D0000000000000000000000000000000000000000000000
      00000000000000000000D0A28400F9CAA700EEBA8E0098867100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002F8D5800000000000000000000000000000000000000
      000000000000B5B4B400E9E8E800DEDDDD00B3B3B300A5A0A000989393000000
      0000000000000000000000000000000000000000000000000000AEAEAE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A9
      AA009B9D9D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D0A284009886710000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A8A8A800ADACAC00A1A1A10098979700000000000000
      0000000000000000000000000000000000000000000000000000AEAEAE009B9B
      9C009B9B9C009B9B9C009B9B9C009B9B9C009B9B9C009B9B9C009B9B9C009C9F
      A100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AEAEAE00999C
      9E00999C9E00999C9E00999C9E00999C9E00999C9E00999C9E00999C9E00999C
      9E00999C9E00999C9E00999C9E000000000000000000BC6C5C009F463D009F46
      3D009F463D009F463D009F463D009F463D009F463D009F463D009F463D009F46
      3D009F463D009F463D0000000000000000000000000000000000000000000000
      0000E7D6CE00DEC6BD00DEC6BD00DEC6BD00DEC6BD00DEC6BD00E7D6CE000000
      0000000000000000000000000000000000000000000000000000000000002373
      8A00327C91004894A9005A98AA0066A9BB0066A9BB005A98AA005993A4003B7C
      8F0020677B002A71860000000000000000000000000000000000AEAEAE00FEFE
      FD00FDFDFC00FAFAF900F6F6F500F3F3F200F0F0EF00ECECEB00E9E9E800E4E4
      E400DBDBDB00D2D2D2009C9FA1000000000000000000BC6C5C00FDF9F900F8EF
      EF00F8EFEF00F8EFEF00F8EFEF00F3E3E200F3E3E200F3E3E200F3E3E200F3E3
      E200F3E3E2009F463D000000000000000000000000000000000000000000E7D6
      CE00E7CEC600EFDED600F7E7D600F7E7D600EFDED600EFDED600EFDED600DEC6
      BD000000000000000000000000000000000000000000000000003F8296003E95
      AE0078B9CC004D95AA0076BACE0099CFDE00D4EBF100BCD5DB0097BDC7006DA2
      B10044889C001C677D00005D7800000000000000000000000000AEAEAE00FEFE
      FD00FEFEFD00FDFDFC00FAFAF900F6F6F500F3F3F200F0F0EF00ECECEB00E9E9
      E800E4E4E400DBDBDB009C9FA1000000000000000000BC6C5C00FDF9F900AE52
      4700AE524700AE524700AE524700AE524700AD514600AD514600AD514600AA4B
      4000F3E3E2009F463D0000000000000000000000000000000000E7D6CE00F7E7
      D600F7F7F700E7E7E700CEB5A500D6AD9400DEC6BD00EFF7F700F7EFEF00EFDE
      D600DEC6BD0000000000000000000000000000000000000000001C687E00449E
      B80082C1D3004890A50070B7CB0098CEDD00D7EEF500C1D8DE009CC0CA0073A6
      B4004A8C9F00206E840017576A00000000000000000000000000AEAEAE00FEFE
      FD00FEFEFD00C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9
      C900E9E9E800E4E4E4009C9FA1000000000000000000BC6C5C00FDF9F900B45B
      5100B45B5100B45B5100B96B6100DCB5B100C17D7500AD514600AD514600AA4B
      4000F3E3E2009F463D00000000000000000000000000E7D6CE00F7E7DE00F7FF
      FF00CE9C8400B54A1000BD633900D6AD9C00C65A2100BD522100D6AD9C00F7FF
      FF00F7DED600DEC6BD00000000000000000000000000000000001C687E00449E
      B80082C1D3004890A50070B7CB0098CEDD00D7EEF500C1D8DE009CC0CA0073A6
      B4004A8C9F00206E840017576A000000000000000000000000009A9D9F00DCDC
      DB00DCDCDB00DCDCDB00DCDCDB00DCDCDB00DCDCDB00DCDCDB00DCDCDB00DCDC
      DB00DCDCDB00DCDCDB007B7D7F000000000000000000BC6C5C00FDF9F900B45B
      5100B45B5100B45B5100DCB5B100FFFFFF00DCB5B100AD514600AD514600AE52
      4700F3E3E2009F463D00000000000000000000000000EFDED600F7FFFF00C67B
      5A00BD4A1000C6521800C6A59400FFFFFF00DE947300BD4A1000B54A1000CE9C
      8400F7FFFF00EFDED600E7D6CE000000000000000000000000001C687E00197D
      9900428FA5004B93A80069ACBF0085BFCF0095C4D20081B2C000689EAD004C89
      9A00317386001B677D0017576A000000000000000000BD5A1000AD4A0000AD4A
      0000AD4A0000AD4A0000AD4A0000AD4A0000AD4A0000AD4A0000AD4A0000AD4A
      0000AD4A0000AD4A0000AD4A0000AD4A000000000000BC6C5C00FDF9F900B45B
      5100B45B5100B45B5100B45B5100DCB5B100BA6B6200AD514600AD514600AE52
      4700F3E3E2009F463D000000000000000000F7E7E700F7F7F700D6AD9400BD4A
      1000CE633100CE632900CE6B3900DE8C6B00CE632900CE633100C65A2900B54A
      1000DEC6BD00F7EFE700DEC6BD00000000000000000000000000005D78004495
      AC0082C1D3004890A50070B7CB0098CEDD00D7EEF500C1D8DE009CC0CA0073A6
      B4004A8C9F001861760000465A000000000000000000CE6B0000AEAEAE00FEFE
      FD00EB9B7300E88E6000E88E6000E88E6000E88E6000E88E6000E88E6000E88E
      6000EB9B7300F0F0EF009C9FA100AD4A000000000000BC6C5C00FDF9F900B45B
      5100B45B5100B45B5100B45B5100C47F7700AD514600AD514600AD514600AE52
      4700F3E3E2009F463D000000000000000000F7EFE700F7F7F700C6633100C65A
      2900CE6B3100CE5A2100CE8C6B00F7E7DE00CE6B3900C65A2100CE633100C652
      1800C67B5200F7FFFF00EFDED600E7D6CE0000000000000000001C687E00449E
      B80082C1D3004890A50070B7CB0098CEDD00D7EEF500C1D8DE009CC0CA0073A6
      B4004A8C9F00206E840017576A000000000000000000CE6B0000CE6B0000CE6B
      0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B0000CE6B
      0000CE6B0000CE6B0000CE6B0000BD5A100000000000BC6C5C00FDF9F900BB64
      5A00B45B5100B45B5100B45B5100FFFFFF00C27B7300AD514600AD514600AE52
      4700F8EFEF009F463D000000000000000000F7EFE700EFDED600C65A2100CE63
      3100CE633100CE5A2100C6846B00FFFFFF00EFAD9400C64A1000CE633100CE63
      2900C65A2900F7EFEF00EFDED600DEC6BD0000000000000000001C687E00449E
      B80082C1D3004890A50070B7CB0098CEDD00D7EEF500C1D8DE009CC0CA0073A6
      B4004A8C9F00206E840017576A00000000000000000000000000AEAEAE00FEFE
      FD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFE
      FD00FBFBFA00F8F8F7009C9FA1000000000000000000BC6C5C00FDF9F900BA63
      5900BB645A00B45B5100B45B5100C1786F00FFFFFF00CF9A9300AD514600AE52
      4700F8EFEF009F463D000000000000000000F7EFE700F7DECE00CE5A2100CE63
      3100CE633100CE632900C6522100CEB5A500FFFFFF00E79C7B00C6521800CE63
      2900C65A2900F7EFEF00EFDED600DEC6BD0000000000000000001C687E002488
      A400529BB0004A92A7006BAFC2008AC3D300A6CFDB0091BBC70075A7B5005690
      A10037798C001F6C820017576A00000000000000000000000000AEAEAE00FEFE
      FD00FEFEFD00C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9
      C900FEFEFD00FBFBFA009C9FA1000000000000000000BC6C5C00FDF9F900BA63
      5900BC665C00BB645A00B45B5100B45B5100DFBAB500FAF5F400C98A8300AE52
      4700F8EFEF009F463D000000000000000000F7EFE700F7EFE700DE6B3100D66B
      3100CE632900C65A2100C6521800BD4A1000DECEC600FFFFFF00D6734200CE5A
      2100CE6B3900FFF7F700EFDED600DEC6BD000000000000000000005D7800398A
      A20072B5C8004991A5006FB4C80093CADA00C7E3EC00B1CED6008FB8C300699F
      AE0044869900155C710000465A00000000000000000000000000AEAEAE00FEFE
      FD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFE
      FD00FEFEFD00FEFEFD009C9FA1000000000000000000BC6C5C00FDF9F900BA63
      5900CE8E8700F8F0F000DDB5B000BA635900D29A9300FFFFFF00E3C2BF00AE52
      4700F8EFEF009F463D000000000000000000F7E7E700FFFFFF00F79C6B00E763
      2900CE8C6B00EFE7DE00D67B5200BD310000D69C7B00FFFFFF00DE8C6300CE52
      1800E79C7300FFFFFF00EFDED600E7D6CE0000000000000000001C687E00449E
      B80082C1D3004890A50070B7CB0098CEDD00D7EEF500C1D8DE009CC0CA0073A6
      B4004A8C9F00206E840017576A00000000000000000000000000AEAEAE00FEFE
      FD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFE
      FD00FEFEFD00FEFEFD009C9FA1000000000000000000BC6C5C00FDF9F900BA63
      5900CE8D8600FFFFFF00D8A9A400BE6D6300E9D0CD00FFFFFF00D3A09B00AE52
      4700F8EFEF009F463D000000000000000000F7EFE700F7EFEF00FFEFDE00FF8C
      4A00DE845A00EFFFFF00FFFFFF00E7BDA500F7FFFF00EFFFFF00E7733900E773
      3900FFEFEF00F7E7DE00DEC6BD000000000000000000000000001C687E00449E
      B80082C1D3004890A50070B7CB0098CEDD00D7EEF500C1D8DE009CC0CA0073A6
      B4004A8C9F00206E840017576A00000000000000000000000000AEAEAE00FEFE
      FD00FEFEFD00C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9C900C9C9
      C900FEFEFD00FEFEFD009C9FA1000000000000000000BC6C5C00FDF9F900BA63
      5900BA635900CA857D00FFFFFF00FFFFFF00FFFFFF00CF958E00B9615700AE52
      4700F8EFEF009F463D00000000000000000000000000EFDED600FFFFFF00FFEF
      CE00FFB57300EFAD8400EFE7DE00EFF7F700EFE7DE00F7A57B00FF8C4A00FFDE
      CE00FFFFFF00EFDED600E7D6CE000000000000000000000000001C687E00469F
      B90073A6B4004A8C9F002B819A002B819A002B819A002B819A003B7C8F003B7C
      8F00387D91001F6D830017576A00000000000000000000000000AEAEAE00FEFE
      FD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFE
      FD00FEFEFD00FEFEFD009B9B9C000000000000000000BC6C5C00FDF9F900BA63
      5900BA635900BA635900BA635900BA635900BA635900BA635900BA635900AE52
      4700F8EFEF009F463D00000000000000000000000000F7EFEF00EFDED600FFFF
      FF00FFFFFF00FFF7C600FFDEAD00FFCE9400FFCE9400FFD6AD00FFF7F700FFFF
      FF00EFDED600DEC6BD0000000000000000000000000000000000397F93002B81
      9A004890A50070B7CB0066A9BB009CC0CA00C1D8DE009CC0CA0070B7CB004890
      A50024697D00135C7000005D7800000000000000000000000000AEAEAE00FEFE
      FD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFE
      FD00FEFEFD00FEFEFD009B9B9C000000000000000000BC6C5C00FDF9F900FDF9
      F900FDF9F900FDF9F900FDF9F900FDF9F900FDF9F900FDF9F900FDF9F900FDF9
      F900FDF9F9009F463D0000000000000000000000000000000000F7EFEF00EFDE
      D600F7E7E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFE7DE00EFDE
      D600DEC6BD000000000000000000000000000000000000000000000000001972
      8B00196C83003B879C003A8CA2005A98AA005A98AA003A8CA200478699003272
      85001C5E72003E899E0000000000000000000000000000000000AEAEAE009B9B
      9C009B9B9C009B9B9C009B9B9C009B9B9C009B9B9C009B9B9C009B9B9C009C9F
      A1009B9B9C009B9B9C009B9B9C000000000000000000BC6C5C00BC6C5C00BC6C
      5C00BC6C5C00BC6C5C00BC6C5C00BC6C5C00BC6C5C00BC6C5C00BC6C5C00BC6C
      5C00BC6C5C00BC6C5C000000000000000000000000000000000000000000F7EF
      E700F7F7EF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EFEF00F7EF
      E700000000000000000000000000000000000000000000000000000000000000
      00000000000000000000096EB000096EB0000860980000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000096EB000096EB0001479B8001479B8000860980000000000000000000000
      0000000000000000000000000000000000000000000023738A00327C91004894
      A9005A98AA0066A9BB0066A9BB005A98AA005993A4003B7C8F0020677B002A71
      86000000000000000000000000000000000000000000C9762B00A24F2200A24F
      2200A24F2200A24F2200A24F2200A24F2200A24F2200A24F2200A24F2200A24F
      2200A24F2200A24F2200A24F2200A24F22000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000096EB000096E
      B0001680BF00157DBC00147AB9001479B80008609800394A6B00394A6B00394A
      6B00394A6B00394A6B00394A6B00000000003F8296003E95AE0078B9CC004D95
      AA0076BACE0099CFDE00D4EBF100BCD5DB0097BDC7006DA2B10044889C001C67
      7D00005D780000000000000000000000000000000000C9762B00FEFEFD00FEFE
      FD00FEFEFD00FEFEFD00FBFBFA00F8F8F700F5F5F400F1F1F000EEEEED00EBEB
      EA00E8E8E700DEDEDE00D2D2D200A24F22000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF0084000000840000008400
      00008400000084000000FFFFFF00840000000000000000000000096EB0001886
      C4001783C1001680BF00157DBC00147CBA00086098003D5B8100085A8E00085A
      8E00085A8E00085A8E00394A6B00000000001C687E00449EB80082C1D3004890
      A50070B7CB0098CEDD00D7EEF500C1D8DE009CC0CA0073A6B4004A8C9F00206E
      840017576A0000000000000000000000000000000000C9762B00FEFEFD00FEFE
      FD00FEFEFD00FEFEFD00FEFEFD00FBFBFA00F8F8F700F5F5F400F1F1F000EEEE
      ED00EBEBEA00E8E8E700DEDEDE00A24F22000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000096EB0001989
      C7001886C4001783C1001680BF00157FBD00086098000F4934000F4732000F46
      32000F45310010453100394A6B00000000001C687E00449EB80082C1D3004890
      A50070B7CB0098CEDD00D7EEF500C1D8DE009CC0CA0073A6B4004A8C9F00206E
      840017576A0000000000000000000000000000000000C9762B00FEFEFD0036A7
      D00036A7D00036A7D00036A7D000FEFEFD00AFAFAF00AFAFAF00AFAFAF00AFAF
      AF00AFAFAF00AFAFAF00E8E8E700A24F22000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF0084000000840000008400
      00008400000084000000FFFFFF00840000000000000000000000096EB0001A8C
      CA001989C7001886C4001783C1001682C00008609800164D3800164A36001549
      35001646330015443100394A6B00000000001C687E00197D9900428FA5004B93
      A80069ACBF0085BFCF0095C4D20081B2C000689EAD004C899A00317386001B67
      7D0017576A0000000000000000000000000000000000C9762B00FEFEFD005DBC
      E300B7E4F3005DBCE30036A7D000FEFEFD00FEFEFD00FBFBFA00F8F8F700F5F5
      F400F1F1F000EEEEED00EBEBEA00A24F22000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000096EB0001B90
      CD001A8CCA001989C7001886C4001785C300086098001C7A5B001C7C5E001D7D
      60001E785B001E725700394A6B0000000000005D78004495AC0082C1D3004890
      A50070B7CB0098CEDD00D7EEF500C1D8DE009CC0CA0073A6B4004A8C9F001861
      760000465A0000000000000000000000000000000000C9762B00FEFEFD005DBC
      E30036A7D000FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FBFBFA00F8F8
      F700F5F5F400F1F1F000EEEEED00A24F220044B1E400107FAD00107FAD00107F
      AD00107FAD00107FAD00107FAD0084000000FFFFFF0084000000840000008400
      00008400000084000000FFFFFF00840000000000000000000000096EB0001B93
      CF001B90CD0022A6E20021A2DE001888C600086098001F8360001E7958001E6E
      4F001D624500205E4300394A6B00000000001C687E00449EB80082C1D3004890
      A50070B7CB0098CEDD00D7EEF500C1D8DE009CC0CA0073A6B4004A8C9F00206E
      840017576A0000000000000000000000000000000000C9762B00FEFEFD00FEFE
      FD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FDFD
      FC00F8F8F700F5F5F400F1F1F000A24F220044B1E400FEFEFD00FBFBFA00F5F5
      F400EEEEED00E8E8E700D2D2D20084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000096EB0001C96
      D2001B93CF0022A6E200FFFFFF00198BC800086098005A766200798370009594
      8400AF9C8A00BB988700394A6B00000000001C687E00449EB80082C1D3004890
      A50070B7CB0098CEDD00D7EEF500C1D8DE009CC0CA0073A6B4004A8C9F00206E
      840017576A0000000000000000000000000000000000C9762B00FEFEFD0036A7
      D00036A7D00036A7D00036A7D000FEFEFD00AFAFAF00AFAFAF00AFAFAF00AFAF
      AF00AFAFAF00AFAFAF00F6F6F500A24F220044B1E400FEFEFD00FEFEFD000021
      AD00F5F5F400EEEEED00EBEBEA00840000008400000084000000840000008400
      000084000000840000000F951C00840000000000000000000000096EB0001E9A
      D6001C96D2001B93CF001B91CE001A8ECB0008609800F0BAA400F0B29700F1BF
      A800F0BFA800F1BFA900394A6B00000000001C687E002488A400529BB0004A92
      A7006BAFC2008AC3D300A6CFDB0091BBC70075A7B5005690A10037798C000870
      19000870190008701900000000000000000000000000C9762B00FEFEFD005DBC
      E300B7E4F3005DBCE30036A7D000FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFE
      FD00FEFEFD00FDFDFC00FAFAF900A24F220044B1E400FEFEFD000021AD002152
      E7000021AD00F8F8F700F1F1F000107FAD000000000009831100000000000000
      000000000000098311000F951C00000000000000000000000000096EB0001F9E
      DA001E9AD6001C96D2001C94D1001B91CE0008609800F0B79E00F2BFA900F4E0
      D700F2C6AE00F1A58100394A6B0000000000005D7800398AA20072B5C8004991
      A5006FB4C80093CADA00C7E3EC00B1CED6008FB8C300699FAE00448699000870
      190014A02E0008701900000000000000000000000000C9762B00FEFEFD005DBC
      E30036A7D000FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFE
      FD00FEFEFD00FEFEFD00FDFDFC00A24F220044B1E4001839DE006373E7002152
      E7002152E7000021AD00F8F8F700107FAD00098311000F951C00000000000000
      00000983110010A51B000F951C00000000000000000000000000096EB00021A2
      DE001F9EDA001E9AD6001D98D4001C94D10008609800EE7B4500F0A27D00F1A9
      8600EF7D4500F0895600394A6B00000000001C687E00449EB80082C1D3004890
      A50070B7CB0098CEDD00D7EEF500C1D8DE009CC0CA0008701900087019000870
      19001FA9430008701900087019000870190000000000C9762B00FEFEFD00FEFE
      FD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFEFD00FEFE
      FD00FEFEFD00FEFEFD00FEFEFD00A24F220044B1E400FEFEFD001839DE006373
      E7000021AD00FEFEFD00FEFEFD0009831100098311000F951C00098311000983
      110010A51B000F951C0000000000000000000000000000000000096EB00022A6
      E20021A2DE001F9EDA001E9CD8001D98D40008609800ED733B00EC6F3400EB6F
      3300EC6E3200EE865500394A6B00000000001C687E00449EB80082C1D3004890
      A50070B7CB0098CEDD00D7EEF500C1D8DE009CC0CA000870190029C6630014A0
      2E0014A02E001FA943001FA943000870190000000000C9762B00D06F0100D06F
      0100D06F0100D06F0100D06F0100D06F0100D06F0100D06F0100D06F0100D06F
      0100D06F0100D06F0100D06F0100A24F220044B1E400FEFEFD00FEFEFD001839
      DE00FEFEFD00FEFEFD000983110017C7620010A51B0010A51B0010A51B000F95
      1C000F951C000000000000000000000000000000000000000000096EB000096E
      B00022A6E20021A2DE0020A0DC001E9CD80008609800E96F3C00E65F2400E767
      3100EE9D7B00ED946D00394A6B00000000001C687E00469FB90073A6B4004A8C
      9F002B819A002B819A002B819A002B819A003B7C8F0008701900087019000870
      190014A02E0008701900087019000870190000000000CE630000ED973300ED97
      3300ED973300ED973300ED973300ED973300ED973300F6CA9A00ED973300F6CA
      9A00ED973300306DF9007F748800CE63000044B1E400FEFEFD00FEFEFD00FEFE
      FD00FEFEFD00107FAD00107FAD000983110017C7620010A51B000F951C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000096EB000096EB00021A4E00020A0DC0008609800394A6B00394A6B00394A
      6B00394A6B00394A6B00394A6B0000000000397F93002B819A004890A50070B7
      CB0066A9BB009CC0CA00C1D8DE009CC0CA0070B7CB004890A50024697D000870
      190014A02E000870190000000000000000000000000000000000DA7B0D00DA7B
      0D00DA7B0D00DA7B0D00DA7B0D00DA7B0D00DA7B0D00DA7B0D00DA7B0D00DA7B
      0D00DA7B0D00DA7B0D00DA7B0D000000000044B1E400FEFEFD00FEFEFD00FEFE
      FD00FEFEFD00107FAD00209FDA00000000000983110009831100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000096EB000096EB0000860980000000000000000000000
      0000000000000000000000000000000000000000000019728B00196C83003B87
      9C003A8CA2005A98AA005A98AA003A8CA20047869900327285001C5E72000870
      1900087019000870190000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000044B1E40044B1E40044B1E40044B1
      E40044B1E400107FAD0000000000000000000000000009831100000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF009FFFFFFF000000000FFF83C100000000
      07FF83C10000000083FF83C100000000C1FF818100000000E107800100000000
      F003810100000000FC01810100000000F801810100000000F800C00300000000
      F800E00700000000F800E18700000000F801E18700000000FC01E18700000000
      FE03F3CF00000000FF0FFFFF00000000FE7FFFFCFE7F8001FC3F9FF9F01F8001
      F81F8FF3C01F8001F00F87E7C0038001E007C3CF80078001C003F19F80018001
      8001F83F00018001F81FFC7F00038001F81FF83F80008001F81FF19F80008001
      F81FE3CF80018001F81FC7E7C0018001F81F8FFBC0038001F81F1FFFF0038001
      F81F3FFFFA0FC003FFFFFFFFFE7FFC3FFFFFFC3FC001F81FF7FFC003C001F81F
      E3FFC003C001F81FC1FF8001C001F81FC0FF0000C001F81F807F0000C001F81F
      8C7F0000C001F81FDE3F0000C001F81FFF1F0000C0018001FF9F8001C001C003
      FFCFC003C001E007FFE7E007C001F00FFFF3F81FC001F81FFFF9F81FC003FC3F
      FFFDF81FC007FE7FFFFFFC3FC00FFFFFFFFFC0018003F01FE003C0018003E00F
      C001C0018003C007C001C00180038003C001C00180038001C001800080030001
      C001800080030000C001800080030000C001C00180030000C001C00180030000
      C001C00180030000C001C00180030001C001C00180038001C001C00180038003
      C001C0018003C007E003C0018003E00FFC7FFFFFFFFFFE00F07F800F8000FE00
      C00100078000FE00C00100078000FE00C00100078000FE00C00100078000FE00
      C001000780000000C001000780000000C001000780000000C0010003800000B9
      C001000380000031C001000080000003C001000080000007C00100008000001F
      F0010003C001013FFC7F8003FFFF03BF}
  end
  object QueryHealthDescriptions: TQuery
    OnCalcFields = QueryHealthWithDrawalsCalcFields
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT DISTINCT E.EventDesc From Events E'
      'WHERE E.EventType = 6'
      'AND  E.EventDesc <> '#39#39)
    Left = 280
    Top = 164
    object QueryHealthDescriptionsEventDesc: TStringField
      FieldName = 'EventDesc'
      Origin = 'KINGSWD."Events.DB".EventDesc'
      Size = 30
    end
  end
  object dsQueryHealthDescriptions: TDataSource
    DataSet = QueryHealthDescriptions
    Left = 282
    Top = 212
  end
  object QueryFertTreatments: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select Distinct(Description) From FertTreatments'
      'Where Description<>'#39#39)
    Left = 146
    Top = 300
  end
  object dsQueryFertTreatments: TDataSource
    DataSet = QueryFertTreatments
    Left = 146
    Top = 344
  end
  object QueryFertPrograms: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select ID, Code, Description, StartDay From FertPrograms'
      'Where Description<>'#39#39)
    Left = 244
    Top = 288
  end
  object dsQueryFertPrograms: TDataSource
    DataSet = QueryFertPrograms
    Left = 254
    Top = 340
  end
  object QueryFertProgramHistory: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select F.Code, F.Description, FP.StartDate, FP.ID'
      'From FertProgAdmin FP '
      'Left Join FertPrograms F ON (F.ID=FP.ProgramID) '
      'where (FP.AnimalID=:ID)'
      'order by StartDate DESC')
    Left = 354
    Top = 284
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
        Value = 0
      end>
    object QueryFertProgramHistoryCode: TStringField
      FieldName = 'Code'
      Origin = 'KINGSWD."FertPrograms.DB".Code'
      Size = 10
    end
    object QueryFertProgramHistoryDescription: TStringField
      FieldName = 'Description'
      Origin = 'KINGSWD."FertPrograms.DB".Description'
      Size = 50
    end
    object QueryFertProgramHistoryStartDate: TDateField
      FieldName = 'StartDate'
      Origin = 'KINGSWD."FertProgAdmin.DB".StartDate'
    end
    object QueryFertProgramHistoryID: TIntegerField
      FieldName = 'ID'
      Origin = 'KINGSWD."FertProgAdmin.DB".ID'
    end
  end
  object dsQueryFertProgramHistory: TDataSource
    DataSet = QueryFertProgramHistory
    Left = 360
    Top = 332
  end
  object dsFGroups: TDataSource
    DataSet = FeedGroups
    Left = 228
    Top = 442
  end
  object FeedGroups: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * '
      'From Grps '
      'Where GroupType = '#39'Feed'#39
      'Order By Description')
    Left = 184
    Top = 442
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
  object QueryMedicineGroups: TQuery
    Tag = 1
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select ID, Description '
      'From GenLook '
      'Where ListType=25 ')
    Left = 60
    Top = 410
  end
  object dsQueryMedicineGroups: TDataSource
    DataSet = QueryMedicineGroups
    Left = 62
    Top = 454
  end
  object TagStore: TTable
    AfterPost = TagStoreAfterPost
    AfterDelete = TagStoreAfterDelete
    DatabaseName = 'Kingswd'
    IndexName = 'iSortTagNumber'
    TableName = 'TagStore'
    Left = 502
    Top = 296
  end
  object dsTagStore: TDataSource
    DataSet = TagStore
    Left = 502
    Top = 340
  end
  object mdNatIDNoInputStyles: TdxMemData
    Tag = 1
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F020000000400000003000300494400140000000100
      0B00496E7075745374796C65000101000000010C0000004D616E75616C20496E
      7075740102000000010D0000004175746F2D67656E6572617465010300000001
      1000000043686F6F73652046726F6D204C697374}
    SortOptions = []
    SortedField = 'InputStyle'
    Left = 594
    Top = 50
    object mdNatIDNoInputStylesID: TIntegerField
      FieldName = 'ID'
    end
    object mdNatIDNoInputStylesInputStyle: TStringField
      FieldName = 'InputStyle'
    end
  end
  object dsmdNatIDNoInputStyles: TDataSource
    DataSet = mdNatIDNoInputStyles
    Left = 596
    Top = 98
  end
  object dsDamLookup: TDataSource
    Left = 650
    Top = 298
  end
  object PedigreeTable: TTable
    AfterPost = PedigreeTableAfterPost
    DatabaseName = 'kingswd'
    TableName = 'PedTable'
    Left = 579
    Top = 611
  end
  object dsPedigreeTable: TDataSource
    DataSet = PedigreeTable
    Left = 579
    Top = 659
  end
  object dsICBFHealthCodes: TDataSource
    DataSet = qICBFHealthCodes
    Left = 46
    Top = 672
  end
  object qICBFHealthCodes: TQuery
    BeforeOpen = qICBFHealthCodesBeforeOpen
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT DISTINCT ID, Description, LookupCode'
      'FROM GenLook.DB where  ListType = :HC '
      'AND UPPER(Description) LIKE "ICBF%"'
      'ORDER BY Description')
    Left = 42
    Top = 626
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'HC'
        ParamType = ptUnknown
      end>
  end
  object dsNonICBFHealthCodes: TDataSource
    DataSet = qNonICBFHealthCodes
    Left = 240
    Top = 563
  end
  object qNonICBFHealthCodes: TQuery
    BeforeOpen = qNonICBFHealthCodesBeforeOpen
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT DISTINCT ID, Description, LookupCode'
      'FROM GenLook.DB where  ListType = :HC '
      'AND NOT(UPPER(Description) LIKE "ICBF%")'
      'ORDER BY Description')
    Left = 238
    Top = 516
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'HC'
        ParamType = ptUnknown
      end>
  end
  object mdConditionScoreAssociatedEvents: TdxMemData
    Tag = 1
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F030000000400000003000A004576656E7454797065
      001E00000001000C004465736372697074696F6E000400000003000A00536F72
      744F726465720001020000000107000000536572766963650000000000010300
      00000113000000507265676E616E637920446961676E6F736973000000000001
      040000000107000000447279204F666600000000000105000000010700000043
      616C76696E670000000000010600000001060000004865616C74680000000000
      010000000001040000004E6F6E650000000000}
    SortOptions = [soDesc, soCaseInsensitive]
    Left = 42
    Top = 258
    object IntegerField1: TIntegerField
      FieldName = 'EventType'
    end
    object StringField1: TStringField
      FieldName = 'Description'
      Size = 30
    end
  end
  object dsmdConditionScoreAssociatedEvents: TDataSource
    DataSet = mdConditionScoreAssociatedEvents
    Left = 76
    Top = 258
  end
  object QueryFertilityCheckStatus: TQuery
    BeforeOpen = QueryFertilityCheckStatusBeforeOpen
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * from GenLook Where (ListType = :ListType)'
      'Order By Description')
    Left = 772
    Top = 12
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ListType'
        ParamType = ptUnknown
      end>
  end
  object QueryFertilityCheckAction: TQuery
    BeforeOpen = QueryFertilityCheckActionBeforeOpen
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * from GenLook Where (ListType = :ListType)'
      'Order By ID'
      '')
    Left = 752
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ListType'
        ParamType = ptUnknown
      end>
  end
  object dsQueryFertilityCheckStatus: TDataSource
    DataSet = QueryFertilityCheckStatus
    Left = 742
    Top = 58
  end
  object dsQueryFertilityCheckAction: TDataSource
    DataSet = QueryFertilityCheckAction
    Left = 738
    Top = 148
  end
  object qPlannedBull: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT ID, AnimalNo,Name '
      'FROM Animals, BullSemenStk '
      
        'WHERE (Animals.ID = BullSemenStk.AnimalID) AND (BullSemenStk.InU' +
        'se = True)  '
      'AND (UPPER(Animals.Sex)="BULL")'
      'AND Animals.Breeding = True'
      'AND Animals.AnimalDeleted=False'
      'AND Animals.AnimalNo Is Not Null'
      
        'AND ((Animals.PrimaryBreed IS NOT NULL) OR (Animals.PrimaryBreed' +
        ' > 0))'
      'ORDER BY AnimalNo')
    Left = 366
    Top = 434
  end
  object dsPlannedBull: TDataSource
    DataSet = qPlannedBull
    Left = 365
    Top = 534
  end
  object qServiceBullUsed: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select ID, AnimalNo,Name From Animals, BullSemenStk '
      
        'where (Animals.ID = BullSemenStk.AnimalID) And (BullSemenStk.InU' +
        'se = True) '
      'And (UPPER(Animals.Sex)="BULL")'
      'AND Animals.Breeding = True'
      'AND Animals.AnimalDeleted=False'
      'AND Animals.AnimalNo Is Not Null'
      
        'AND ((Animals.PrimaryBreed IS NOT NULL) OR (Animals.PrimaryBreed' +
        ' > 0))'
      'Order By AnimalNo')
    Left = 463
    Top = 433
    object qServiceBullUsedID: TIntegerField
      FieldName = 'ID'
      Origin = 'KINGSWD."Animals.DB".ID'
    end
    object qServiceBullUsedAnimalNo: TStringField
      FieldName = 'AnimalNo'
      Origin = 'KINGSWD."Animals.DB".AnimalNo'
      Size = 10
    end
    object qServiceBullUsedName: TStringField
      FieldName = 'Name'
      Origin = 'KINGSWD."Animals.DB".Name'
      Size = 40
    end
  end
  object dsServiceBullUsed: TDataSource
    DataSet = qServiceBullUsed
    Left = 463
    Top = 534
  end
  object qServiceHistBullUsed: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT ID, AnimalNo,Name '
      'FROM Animals, BullSemenStk '
      'WHERE (Animals.ID = BullSemenStk.AnimalID) '
      'AND (UPPER(Animals.Sex)="BULL")'
      'AND Animals.Breeding = True'
      'AND Animals.AnimalDeleted=False'
      'AND Animals.AnimalNo Is Not Null'
      
        'AND ((Animals.PrimaryBreed IS NOT NULL) OR (Animals.PrimaryBreed' +
        ' > 0))'
      'ORDER BY AnimalNo')
    Left = 464
    Top = 486
  end
  object qHistPlannedBull: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT ID, AnimalNo,Name '
      'FROM Animals, BullSemenStk '
      'WHERE (Animals.ID = BullSemenStk.AnimalID) '
      'AND (UPPER(Animals.Sex)="BULL")'
      'AND Animals.Breeding = True'
      'AND Animals.AnimalDeleted=False'
      'AND Animals.AnimalNo Is Not Null'
      'ORDER BY AnimalNo')
    Left = 365
    Top = 486
  end
  object dsHerdVaccineType: TDataSource
    DataSet = qHerdVaccineType
    Left = 796
    Top = 279
  end
  object qHerdVaccineType: TQuery
    BeforeOpen = qHerdVaccineTypeBeforeOpen
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT DISTINCT ID, Description, LookupCode'
      'FROM GenLook.DB '
      'WHERE  ListType = :VC '
      'AND UserCanDelete = False'
      'ORDER BY Description')
    Left = 798
    Top = 230
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'VC'
        ParamType = ptUnknown
      end>
  end
  object dsBatchGroups: TDataSource
    DataSet = qBatchGroups
    Left = 636
    Top = 538
  end
  object qBatchGroups: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT *'
      'FROM Grps'
      'WHERE GroupType = "Batch"'
      'ORDER BY Description')
    Left = 710
    Top = 538
  end
  object dsPurchaseGroups: TDataSource
    DataSet = qPurchaseGroups
    Left = 670
    Top = 604
  end
  object qPurchaseGroups: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT *'
      'FROM Grps'
      'WHERE GroupType = "Purchase"'
      'ORDER BY Description')
    Left = 736
    Top = 604
  end
  object dsLookupJohnesResult: TDataSource
    DataSet = LookupJohnesResult
    Left = 44
    Top = 572
  end
  object LookupJohnesResult: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT ID, Description'
      'FROM GenLook'
      'WHERE ListType = 29'
      'Order By ID')
    Left = 44
    Top = 527
  end
  object dsICBFSexedSemenType: TDataSource
    DataSet = qICBFSexedSemenType
    Left = 692
    Top = 408
  end
  object qICBFSexedSemenType: TQuery
    BeforeOpen = qICBFSexedSemenTypeBeforeOpen
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT ID, LookupCode, Description'
      'FROM GenLook'
      'WHERE ListType = :SexedSemenListType')
    Left = 692
    Top = 458
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SexedSemenListType'
        ParamType = ptUnknown
      end>
  end
  object qHistDrugList: TQuery
    AutoRefresh = True
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * From Medicine M'
      'Order By Name ASC')
    Left = 496
    Top = 4
    object IntegerField3: TIntegerField
      FieldName = 'ID'
      Origin = 'KINGSWD."Medicine.DB".ID'
    end
    object StringField2: TStringField
      FieldName = 'DrugCode'
      Origin = 'KINGSWD."Medicine.DB".DrugCode'
      Size = 6
    end
    object StringField3: TStringField
      FieldName = 'Name'
      Origin = 'KINGSWD."Medicine.DB".Name'
      Size = 30
    end
    object FloatField1: TFloatField
      FieldName = 'Withdrawal'
      Origin = 'KINGSWD."Medicine.DB".Withdrawal'
    end
    object IntegerField4: TIntegerField
      FieldName = 'DoseUnit'
      Origin = 'KINGSWD."Medicine.DB".DoseUnit'
    end
    object IntegerField5: TIntegerField
      FieldName = 'PurchUnit'
      Origin = 'KINGSWD."Medicine.DB".PurchUnit'
    end
    object FloatField2: TFloatField
      FieldName = 'QuantityInStock'
      Origin = 'KINGSWD."Medicine.DB".QuantityInStock'
    end
    object FloatField3: TFloatField
      FieldName = 'CostPurchUnit'
      Origin = 'KINGSWD."Medicine.DB".CostPurchUnit'
    end
    object IntegerField6: TIntegerField
      FieldName = 'MilkWithDrawal'
      Origin = 'KINGSWD."Medicine.DB".MilkWithDrawal'
    end
    object IntegerField7: TIntegerField
      FieldName = 'OtherWithDrawal'
      Origin = 'KINGSWD."Medicine.DB".OtherWithDrawal'
    end
    object BooleanField1: TBooleanField
      FieldName = 'InUse'
      Origin = 'KINGSWD."Medicine.DB".InUse'
    end
    object FloatField4: TFloatField
      FieldName = 'StockLevel'
      Origin = 'KINGSWD."Medicine.DB".StockLevel'
    end
    object IntegerField8: TIntegerField
      FieldName = 'OrganicMeatWithdrawal'
      Origin = 'KINGSWD."Medicine.DB".OrganicMeatWithdrawal'
    end
    object IntegerField9: TIntegerField
      FieldName = 'OrganicMilkWithdrawal'
      Origin = 'KINGSWD."Medicine.DB".OrganicMilkWithdrawal'
    end
    object IntegerField10: TIntegerField
      FieldName = 'OrganicOtherWithdrawal'
      Origin = 'KINGSWD."Medicine.DB".OrganicOtherWithdrawal'
    end
    object IntegerField11: TIntegerField
      FieldName = 'MediGroup'
      Origin = 'KINGSWD."Medicine.DB".MediGroup'
    end
  end
  object BreedQuery: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT ID, Code, Name'
      'FROM Breeds'
      'ORDER BY Code')
    Left = 384
    Top = 166
  end
  object DSBreedQuery: TDataSource
    DataSet = BreedQuery
    Left = 366
    Top = 146
  end
  object LookupPrescribedBy: TDataSource
    DataSet = QueryPrescribedBy
    Left = 248
    Top = 38
  end
  object QueryPrescribedBy: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select *'
      'From MedAdmin'
      'Where IsVet = True')
    Left = 260
    Top = 82
  end
  object LookupAdminBy: TDataSource
    DataSet = QueryAdminBy
    Left = 294
    Top = 4
  end
  object QueryAdminBy: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select *'
      'From MedAdmin')
    Left = 328
    Top = 48
  end
  object dsStockBulls: TDataSource
    DataSet = qStockBulls
    Left = 578
    Top = 244
  end
  object qStockBulls: TQuery
    BeforeOpen = qStockBullsBeforeOpen
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT A.ID, A.AnimalNo'
      'FROM Animals A'
      'LEFT JOIN BullSemenStk B ON (B.AnimalID=A.ID)'
      'WHERE (Upper(A.Sex) = "BULL")'
      'AND       (A.InHerd = TRUE)'
      'AND       (A.AnimalDeleted = FALSE)'
      'AND       (A.HerdID = :ADefaultHerdID)'
      'AND       (A.Breeding = TRUE)'
      'AND       (B.InUse = TRUE)'
      
        'AND       ((Animals.PrimaryBreed IS NOT NULL) OR (Animals.Primar' +
        'yBreed > 0))')
    Left = 576
    Top = 194
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ADefaultHerdID'
        ParamType = ptUnknown
      end>
  end
  object qExistingVPADrugs: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT M.*'
      'FROM Medicine M'
      'WHERE M.VPANo IS NOT NULL')
    Left = 458
    Top = 114
  end
  object dsFeedGroups: TDataSource
    DataSet = qFeedGroups
    Left = 440
    Top = 612
  end
  object qFeedGroups: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT *'
      'FROM Grps'
      'WHERE Upper(GroupType) = '#39'FEED'#39
      'ORDER BY Description')
    Left = 454
    Top = 666
    object qFeedGroupsID: TIntegerField
      FieldName = 'ID'
      Origin = 'KINGSWD."grps.DB".ID'
    end
    object qFeedGroupsGroupType: TStringField
      FieldName = 'GroupType'
      Origin = 'KINGSWD."grps.DB".GroupType'
    end
    object qFeedGroupsCode: TStringField
      FieldName = 'Code'
      Origin = 'KINGSWD."grps.DB".Code'
      Size = 6
    end
    object qFeedGroupsDescription: TStringField
      FieldName = 'Description'
      Origin = 'KINGSWD."grps.DB".Description'
      Size = 30
    end
    object qFeedGroupsSelected: TBooleanField
      FieldName = 'Selected'
      Origin = 'KINGSWD."grps.DB".Selected'
    end
    object qFeedGroupsAdditionalData: TBooleanField
      FieldName = 'AdditionalData'
      Origin = 'KINGSWD."grps.DB".AdditionalData'
    end
    object qFeedGroupsEventDate: TDateField
      FieldName = 'EventDate'
      Origin = 'KINGSWD."grps.DB".EventDate'
    end
    object qFeedGroupsDestSource: TIntegerField
      FieldName = 'DestSource'
      Origin = 'KINGSWD."grps.DB".DestSource'
    end
    object qFeedGroupsCrushLoadComplete: TBooleanField
      FieldName = 'CrushLoadComplete'
      Origin = 'KINGSWD."grps.DB".CrushLoadComplete'
    end
    object qFeedGroupsIsSynchronized: TBooleanField
      FieldName = 'IsSynchronized'
      Origin = 'KINGSWD."grps.DB".IsSynchronized'
    end
  end
  object qMedBatchNoTreats: TQuery
    AutoCalcFields = False
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      
        'SELECT A.NatIDNum, A.SortNatID, A.Sex, A.DateOfBirth, B.Code Bre' +
        'ed, E.EventDate, '
      
        '              H.DrugUsed, H.RateApplic, H.NoDays, H.NoTimes, AB.' +
        'Name AdminBy, PB.Name PrescBy'
      'FROM Animals A'
      'RIGHT JOIN Events E ON (E.AnimalID = A.ID)'
      'LEFT JOIN Breeds B ON (B.ID = A.PrimaryBreed)'
      'LEFT JOIN Health H ON (H.EventID = E.ID)'
      'LEFT JOIN MedAdmin AB ON (AB.ID = H.AdminBy)'
      
        'LEFT JOIN MedAdmin PB ON ((PB.ID = H.VetPresc) AND (PB.IsVet = T' +
        'RUE))'
      'WHERE (E.EventType In (4, 6, 38))'
      'AND   (H.DrugPurchID = :DrugPurchID)'
      'AND   (H.DrugUsed = :DrugID)'
      'ORDER BY E.EventDate Asc')
    Left = 261
    Top = 642
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DrugPurchID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DrugID'
        ParamType = ptUnknown
      end>
  end
  object dsMedBatchNoTreats: TDataSource
    DataSet = qMedBatchNoTreats
    Left = 274
    Top = 686
  end
  object qBatchNoMedDetails: TQuery
    AutoCalcFields = False
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select DP.DrugId, DP.BatchNo, M.DrugCode, M.Name'
      'From MediPur DP'
      'Left Join Medicine M On (M.ID = DP.DrugID)'
      'Where DP.ID = :DrugPurchID')
    Left = 362
    Top = 638
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DrugPurchID'
        ParamType = ptUnknown
      end>
  end
  object dsAnimalColours: TDataSource
    DataSet = qAnimalColours
    Left = 566
    Top = 402
  end
  object qAnimalColours: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT ID, LookupCode, Description'
      'FROM GenLook'
      'WHERE ListType = 9'
      'AND LookupCode IS NOT NULL'
      'AND Description IS NOT NULL')
    Left = 568
    Top = 452
  end
  object qGroupsNotUsed: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select ID, GroupType, Code, Description'
      'From Grps'
      'Where ID NOT IN (Select GroupID From GrpLinks)')
    Left = 794
    Top = 331
  end
  object dsLookupTreatmentUsed: TDataSource
    DataSet = qLookupTreatmentUsed
    Left = 810
    Top = 482
  end
  object qLookupTreatmentUsed: TQuery
    BeforeOpen = qLookupTreatmentUsedBeforeOpen
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT DISTINCT ID, Description, LookupCode'
      'FROM GenLook.DB where  ListType = :TU'
      'ORDER BY Description'
      '')
    Left = 808
    Top = 532
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'TU'
        ParamType = ptUnknown
      end>
  end
  object mdPureBredBreeds: TdxMemData
    Indexes = <>
    Persistent.Data = {
      5665728FC2F5285C8FFE3F030000000400000003000300494400060000000100
      0500436F6465001E000000010005004E616D6500}
    SortOptions = []
    SortedField = 'Code'
    Left = 818
    Top = 400
    object mdPureBredBreedsID: TIntegerField
      FieldName = 'ID'
    end
    object mdPureBredBreedsCode: TStringField
      FieldName = 'Code'
      Size = 6
    end
    object mdPureBredBreedsName: TStringField
      FieldName = 'Name'
      Size = 30
    end
  end
  object dsPureBredBreeds: TDataSource
    DataSet = mdPureBredBreeds
    Left = 786
    Top = 386
  end
  object qDrugBatchNos: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT MP.ID, MP.BatchNo, MP.PurchDate'
      'FROM MediPur MP'
      'WHERE MP.DrugID = :DrugID'
      'AND MP.InUse = True'
      'AND MP.QtyRemaining > 0'
      'AND MP.BatchNo IS NOT NULL'
      'AND MP.PurchDate <= :TreatDate'
      'ORDER BY MP.PurchDate')
    Left = 136
    Top = 642
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DrugID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TreatDate'
        ParamType = ptUnknown
      end>
  end
  object dsDrugBatchNos: TDataSource
    DataSet = qDrugBatchNos
    Left = 154
    Top = 696
  end
  object qMediDisposalReason: TQuery
    BeforeOpen = qMediDisposalReasonBeforeOpen
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT G.ID, G.Description'
      'FROM GenLook G'
      'Where G.ListType = :ListType')
    Left = 714
    Top = 682
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ListType'
        ParamType = ptUnknown
      end>
  end
  object dsMediDiposalReason: TDataSource
    DataSet = qMediDisposalReason
    Left = 764
    Top = 666
  end
  object qBatchNosWithQtyRem: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT ID, BatchNo, QtyRemaining, PurchDate'
      'FROM MediPur'
      'WHERE DrugID = :DrugID'
      'AND   InUse = True'
      'AND   QtyRemaining > 0'
      'ORDER BY PurchDate DESC')
    Left = 130
    Top = 518
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DrugID'
        ParamType = ptUnknown
      end>
  end
  object dsBatchNosWithQtyRem: TDataSource
    DataSet = qBatchNosWithQtyRem
    Left = 136
    Top = 570
  end
  object qAnimalsInHerdTempOff: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select Distinct(M.AID)'
      'From Movements M'
      'Left Join Animals A ON (A.ID = M.AID)'
      'Where M.StillOffFarm = True'
      'And A.InHerd = True'
      'And A.HerdID IN (Select DefaultHerdID From Defaults)'
      'And A.AnimalDeleted = False')
    Left = 454
    Top = 262
  end
  object dsBatchNoByPurchData: TDataSource
    DataSet = qBatchNoByPurchData
    Left = 280
    Top = 412
  end
  object qBatchNoByPurchData: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT ID, BatchNo, PurchDate, QtyRemaining'
      'FROM MediPur'
      'WHERE DrugID = :DrugID'
      'AND PurchDate <= :PurchDate'
      'AND QtyRemaining > 0')
    Left = 334
    Top = 398
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'DrugID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PurchDate'
        ParamType = ptUnknown
      end>
  end
  object qInHerdCurrLactMilkDiskInfo: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT M.*'
      'FROM MilkDisk M'
      'INNER JOIN Animals A On (M.AnimalId = A.ID)'
      'WHERE A.Sex = "Female"'
      'AND A.AnimalDeleted = False'
      'AND A.InHerd = True'
      'AND A.HerdId = :AHerdID'
      'AND M.LactNo = A.LactNo')
    Left = 552
    Top = 522
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AHerdID'
        ParamType = ptUnknown
      end>
  end
  object qInHerdDailyMilkDiskTransInfo: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT M.*'
      'FROM MilkDiskTrans M'
      'INNER JOIN Animals A On (M.AnimalId = A.ID)'
      'WHERE A.Sex = "Female"'
      'AND A.AnimalDeleted = False'
      'AND A.InHerd = True'
      'AND A.HerdId = :AHerdID'
      'AND M.LactNo = A.LactNo'
      'ORDER By M.DateOfRecording DESC')
    Left = 516
    Top = 592
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AHerdID'
        ParamType = ptUnknown
      end>
  end
  object qMainGridMilkDiskTrans: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT M.*'
      'FROM MilkDiskTrans M'
      'INNER JOIN Animals A On (M.AnimalId = A.ID)'
      'WHERE A.Sex = "Female"'
      'AND A.AnimalDeleted = False'
      'AND A.HerdId = :AHerdID'
      'AND ((M.LactNo = A.LactNo) OR (M.LactNo = A.LactNo-1))'
      'ORDER By M.DateOfRecording DESC')
    Left = 510
    Top = 712
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AHerdID'
        ParamType = ptUnknown
      end>
  end
  object qMainGridMilkDisk: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'SELECT M.*'
      'FROM MilkDisk M'
      'INNER JOIN Animals A On (M.AnimalId = A.ID)'
      'WHERE A.Sex = "Female"'
      'AND A.AnimalDeleted = False'
      'AND A.HerdId = :AHerdID'
      'AND ((M.LactNo = A.LactNo) OR (M.LactNo = A.LactNo-1))')
    Left = 388
    Top = 712
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AHerdID'
        ParamType = ptUnknown
      end>
  end
end
