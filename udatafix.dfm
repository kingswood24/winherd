object fmDatafix: TfmDatafix
  Left = 331
  Top = 225
  Width = 218
  Height = 380
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Caption = 'Test Form'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxButton1: TcxButton
    Left = 518
    Top = 412
    Width = 75
    Height = 25
    Caption = 'cxButton1'
    TabOrder = 0
    OnClick = cxButton1Click
  end
  object Memo1: TMemo
    Left = 352
    Top = 294
    Width = 591
    Height = 111
    TabOrder = 1
  end
  object cxButton2: TcxButton
    Left = 22
    Top = 8
    Width = 163
    Height = 25
    Caption = 'Beef Profit Monitor'
    TabOrder = 2
    OnClick = cxButton2Click
  end
  object cxButton3: TcxButton
    Left = 22
    Top = 38
    Width = 163
    Height = 25
    Caption = 'No DataLink Condition Score'
    TabOrder = 3
    OnClick = cxButton3Click
  end
  object cxButton4: TcxButton
    Left = 22
    Top = 68
    Width = 163
    Height = 25
    Caption = 'Beef AI Sire Register'
    TabOrder = 4
    OnClick = cxButton4Click
  end
  object Query: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select * from Animals where AnimalNo<>'#39#39
      'And HerdID=3'
      'And Sex='#39'Female'#39
      'And LactNo =1')
    Left = 190
    Top = 92
  end
  object Query2: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Select ID, AnimalID, EventDate From events Where '
      'EventType = 2')
    Left = 250
    Top = 100
  end
  object DeleteQuery: TQuery
    DatabaseName = 'Kingswd'
    SQL.Strings = (
      'Delete From Events Where (AnimalID =:AID)'
      'And (EventType=2 )'
      'And (EventDate=:ADate)'
      'And (ID <>:ID)'
      '')
    Left = 312
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'AID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ADate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object Services: TTable
    DatabaseName = 'Kingswd'
    TableName = 'Services'
    Left = 540
    Top = 16
  end
  object Events: TTable
    DatabaseName = 'Kingswd'
    TableName = 'Events'
    Left = 496
    Top = 22
  end
end
