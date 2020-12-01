object fmCalvingHistoryEntry: TfmCalvingHistoryEntry
  Left = 501
  Top = 342
  BorderStyle = bsDialog
  Caption = 'Historical Calving Entry'
  ClientHeight = 218
  ClientWidth = 515
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 20
    Top = 18
    Width = 481
    Height = 32
    Caption = 
      'This facility allows you to enter a calving event prior to the l' +
      'ast calving '#13#10'event detected in the database'
  end
  object Label2: TLabel
    Left = 20
    Top = 66
    Width = 352
    Height = 16
    Caption = 'The calving event being entered will be for lactation '
  end
  object Label3: TLabel
    Left = 20
    Top = 100
    Width = 121
    Height = 16
    Caption = 'Enter calving date'
  end
  object btnCreateCalving: TButton
    Left = 226
    Top = 162
    Width = 121
    Height = 31
    Caption = 'Create Calving'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 356
    Top = 162
    Width = 121
    Height = 31
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object deCalvingDate: TDateEdit
    Left = 296
    Top = 100
    Width = 129
    Height = 23
    NumGlyphs = 2
    TabOrder = 1
  end
  object eLactNo: TEdit
    Left = 389
    Top = 66
    Width = 37
    Height = 24
    TabOrder = 0
  end
  object QueryLactationNo: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select AnimalLactNo'
      'From Events'
      'Where AnimalID = :AID'
      'AND EventType = 5')
    Left = 6
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AID'
        ParamType = ptUnknown
      end>
  end
  object EventInsert: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      
        'INSERT INTO EVENTS (ID, ANIMALID, ANIMALLACTNO,EVENTTYPE,EVENTDE' +
        'SC,EVENTDATE,HERDID,ICBFNOTIFIED,ICBFACTION,MPNOTIFIED,MPACTION,' +
        'EVENTSOURCE)'
      
        'values (:ID, :ANIMALID, :ANIMALLACTNO,:EVENTTYPE,:EVENTDESC,:EVE' +
        'NTDATE,:HERDID,:ICBFNOTIFIED,:ICBFACTION,:MPNOTIFIED,:MPACTION,:' +
        'EVENTSOURCE)')
    Left = 6
    Top = 100
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
        Value = '9000'
      end
      item
        DataType = ftInteger
        Name = 'ANIMALID'
        ParamType = ptUnknown
        Value = 50
      end
      item
        DataType = ftSmallint
        Name = 'ANIMALLACTNO'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'EVENTTYPE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EVENTDESC'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EVENTDATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'HERDID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ICBFNOTIFIED'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ICBFACTION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MPNOTIFIED'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MPACTION'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EVENTSOURCE'
        ParamType = ptUnknown
      end>
  end
  object CalvingsInsert: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      
        'INSERT INTO CALVINGS(EventID,Type,ID1,ID2,ID3,ID4,ID1Notified,ID' +
        '2Notified,ID3Notified,ID4Notified,ID1HFSNotified,ID2HFSNotified,' +
        'ID3HFSNotified,ID4HFSNotified,DeadCalves,Mortality,BirthType,Cal' +
        'fDead1,CalfDead2,CalfDead3,CalfDead4,CalfMortality1,CalfMortalit' +
        'y2,CalfMortality3,CalfMortality4,ID1CardReceived,ID2CardReceived' +
        ',ID3CardReceived,ID4CardReceived,ID1ComplianceCert,ID2Compliance' +
        'Cert,ID3ComplianceCert,ID4ComplianceCert,ID1STATUS,ID2STATUS,ID3' +
        'STATUS,ID4STATUS,ID1DATE,ID2DATE,ID3DATE,ID4DATE,ID1EMAILCOUNT,I' +
        'D2EMAILCOUNT,ID3EMAILCOUNT,ID4EMAILCOUNT)'
      
        'values(:EventID,:Type,:ID1,:ID2,:ID3,:ID4,:ID1Notified,:ID2Notif' +
        'ied,:ID3Notified,:ID4Notified,:ID1HFSNotified,:ID2HFSNotified,:I' +
        'D3HFSNotified,:ID4HFSNotified,:DeadCalves,:Mortality,:BirthType,' +
        ':CalfDead1,:CalfDead2,:CalfDead3,:CalfDead4,:CalfMortality1,:Cal' +
        'fMortality2,:CalfMortality3,:CalfMortality4,:ID1CardReceived,:ID' +
        '2CardReceived,:ID3CardReceived,:ID4CardReceived,:ID1ComplianceCe' +
        'rt,:ID2ComplianceCert,:ID3ComplianceCert,:ID4ComplianceCert,:ID1' +
        'STATUS,:ID2STATUS,:ID3STATUS,:ID4STATUS,:ID1DATE,:ID2DATE,:ID3DA' +
        'TE,:ID4DATE,:ID1EMAILCOUNT,:ID2EMAILCOUNT,:ID3EMAILCOUNT,:ID4EMA' +
        'ILCOUNT)'
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 6
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EventID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ID1'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ID2'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ID3'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ID4'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID1Notified'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID2Notified'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID3Notified'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID4Notified'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID1HFSNotified'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID2HFSNotified'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID3HFSNotified'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID4HFSNotified'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DeadCalves'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Mortality'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BirthType'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CalfDead1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CalfDead2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CalfDead3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CalfDead4'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CalfMortality1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CalfMortality2'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CalfMortality3'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CalfMortality4'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID1CardReceived'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID2CardReceived'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID3CardReceived'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID4CardReceived'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID1ComplianceCert'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID2ComplianceCert'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID3ComplianceCert'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID4ComplianceCert'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID1STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID2STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID3STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID4STATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID1DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID2DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID3DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID4DATE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID1EMAILCOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID2EMAILCOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID3EMAILCOUNT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID4EMAILCOUNT'
        ParamType = ptUnknown
      end>
  end
  object QueryEvents: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select ID, EventDate'
      'From Events '
      'where  AnimalID = :AID'
      'And Eventdate <= :EDate'
      'And EventType = 5'
      'Order By EventDate Desc')
    Left = 6
    Top = 156
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EDate'
        ParamType = ptUnknown
      end>
  end
  object CloseTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = CloseTimerTimer
    Left = 128
    Top = 152
  end
end
