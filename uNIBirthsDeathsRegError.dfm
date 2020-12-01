object NIBirthsDeathsRegError: TNIBirthsDeathsRegError
  Left = 407
  Top = 309
  Width = 377
  Height = 349
  Caption = 'Births/Deaths Batch Registration'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 137
    Height = 16
    Caption = 'National ID Number: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object dbNatIDNum: TDBText
    Left = 152
    Top = 16
    Width = 97
    Height = 17
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 264
    Top = 272
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 40
    Width = 329
    Height = 217
    DataSource = dsBatchRegAnimals
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ErrorDesc'
        Title.Caption = 'Error Description'
        Width = 293
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 16
    Top = 272
    Width = 224
    Height = 25
    DataSource = dsBatchRegAnimals
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
    TabOrder = 2
  end
  object BatchRegAnimals: TTable
    DatabaseName = 'Kingswd'
    IndexName = 'iAnimalID'
    MasterFields = 'AnimalID'
    TableName = 'tBatchRegAnimals'
    Left = 16
    Top = 264
  end
  object dsBatchRegAnimals: TDataSource
    DataSet = BatchRegAnimals
    Left = 48
    Top = 264
  end
end
