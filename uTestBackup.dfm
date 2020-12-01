object Form1: TForm1
  Left = 247
  Top = 195
  Width = 606
  Height = 201
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 218
    Top = 16
    Width = 40
    Height = 13
    Caption = 'Zip Path'
  end
  object Label2: TLabel
    Left = 218
    Top = 62
    Width = 47
    Height = 13
    Caption = 'File Name'
  end
  object Label3: TLabel
    Left = 406
    Top = 64
    Width = 52
    Height = 13
    Caption = 'Unzip Path'
  end
  object Label4: TLabel
    Left = 218
    Top = 108
    Width = 50
    Height = 13
  end
  object Label5: TLabel
    Left = 406
    Top = 108
    Width = 50
    Height = 13
  end
  object Label6: TLabel
    Left = 12
    Top = 132
    Width = 53
    Height = 13
    Caption = 'Error Code:'
  end
  object Button1: TButton
    Left = 10
    Top = 22
    Width = 195
    Height = 25
    Caption = 'Zip'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 10
    Top = 52
    Width = 195
    Height = 25
    Caption = 'Unzip'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Path: TEdit
    Left = 218
    Top = 30
    Width = 361
    Height = 21
    TabOrder = 2
    Text = 'C:\Kingswd\RY\*.*'
  end
  object FileName: TEdit
    Left = 218
    Top = 78
    Width = 171
    Height = 21
    TabOrder = 3
    Text = 'A:\Test.zip'
  end
  object ProgressBar1: TProgressBar
    Left = 218
    Top = 122
    Width = 171
    Height = 21
    Min = 0
    Max = 100
    TabOrder = 4
  end
  object ProgressBar2: TProgressBar
    Left = 406
    Top = 122
    Width = 171
    Height = 21
    Min = 0
    Max = 100
    TabOrder = 5
  end
  object UnzipPath: TEdit
    Left = 406
    Top = 78
    Width = 175
    Height = 21
    TabOrder = 6
    Text = 'C:\Kingswd\Test'
  end
  object Button3: TButton
    Left = 128
    Top = 92
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 7
  end
  object Zip: TZipFile
    OnMajorCallback = ZipMajorCallback
    OnMinorCallback = ZipMinorCallback
    ZipFormats = [EncryptFlag]
    wZipSubOptions = [ZSO_LOGZIPRESULTS]
    Options = [NoDirectoryNamesFlag]
    lpszEncryptCode.PChar = {636F7070657200}
    Left = 358
  end
  object Unzip: TUnzipFile
    IndexofItem = 0
    Options = [OverWriteFlag, DecryptFlag]
    lpszDecryptCode.PChar = {636F7070657200}
    wUnzipSubOptions = []
    Left = 388
  end
  object UnzipFile1: TUnzipFile
    OnMajorCallback = UnzipFile1MajorCallback
    OnMinorCallback = UnzipFile1MinorCallback
    IndexofItem = 0
    Options = [NoDirectoryNamesFlag]
    wUnzipSubOptions = []
    Left = 96
    Top = 130
  end
  object ZipFile1: TZipFile
    OnMajorCallback = ZipFile1MajorCallback
    OnMinorCallback = ZipFile1MinorCallback
    ZipFormats = []
    wZipSubOptions = []
    Options = [NoDirectoryNamesFlag]
    Left = 142
    Top = 18
  end
end
