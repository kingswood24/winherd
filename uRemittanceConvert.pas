unit uRemittanceConvert;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxLabel, cxMemo, StdCtrls, cxButtons, cxControls, cxContainer, cxEdit,
  cxTextEdit, uSPParser, ElectronicRemittanceConverter;

type
  TfmRemittanceConvert = class(TForm)
    teConvertFile: TcxTextEdit;
    teConvertedFileName: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxMemo1: TcxMemo;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    btnSaveOutput: TcxButton;
    OpenDialog: TOpenDialog;
    Parser: TSPParser;
    procedure FormCreate(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure btnSaveOutputClick(Sender: TObject);
  private
    { Private declarations }
    ElectronicRemittanceConverter : TElectronicRemittanceConverter;
  public
    { Public declarations }
    class procedure ShowConverter;
  end;

var
  fmRemittanceConvert: TfmRemittanceConvert;

const
  cCountryID = 2;
  cFactoryName = 3;
  cFactoryAddress1 = 4;
  cFactoryAddress2 = 5;
  cFactoryAddress3 = 6;
  cFactoryAddress4 = 7;
  cOwnerHerdNo = 8;
  cSlaughterDate = 9;
  cLotNo = 10;

  JustifyLeft  = 0;
  JustifyRight = 1;

  idNATIONAL  : array[0..2] of integer = (1,14,JustifyLeft);
  idCARCASE   : array[0..2] of integer = (16,8,JustifyLeft);
  idSEX       : array[0..2] of integer = (26,5,JustifyLeft);
  idGRADE     : array[0..2] of integer = (32,4,JustifyLeft);
  idLWEIGHT   : array[0..2] of integer = (39,7,JustifyRight);
  idRWEIGHT   : array[0..2] of integer = (48,8,JustifyRight);
  idCONDEMNED : array[0..2] of integer = (57,10,JustifyLeft);
  idCWEIGHT   : array[0..2] of integer = (68,8,JustifyRight);
  idPRICEPER  : array[0..2] of integer = (77,9,JustifyRight);
  idVALUE     : array[0..2] of integer = (87,14,JustifyRight);
  idLIVEWEIGHT : array[0..2] of integer = (102,15,JustifyRight);
  idTOTALDEDUCTIONS : array[0..2] of integer = (118,15,JustifyRight);

  idGBDNATIONAL  : array[0..2] of integer = (1,24,JustifyLeft);
  idGBDCARCASE   : array[0..2] of integer = (26,8,JustifyLeft);
  idGBDSEX       : array[0..2] of integer = (36,5,JustifyLeft);
  idGBDGRADE     : array[0..2] of integer = (42,4,JustifyLeft);
  idGBDLWEIGHT   : array[0..2] of integer = (49,7,JustifyRight);
  idGBDRWEIGHT   : array[0..2] of integer = (58,8,JustifyRight);
  idGBDCONDEMNED : array[0..2] of integer = (67,10,JustifyLeft);
  idGBDCWEIGHT   : array[0..2] of integer = (78,8,JustifyRight);
  idGBDPRICEPER  : array[0..2] of integer = (87,9,JustifyRight);
  idGBDVALUE     : array[0..2] of integer = (97,14,JustifyRight);
  idGBDLIVEWEIGHT : array[0..2] of integer = (112,15,JustifyRight);
  idGBDTOTALDEDUCTIONS : array[0..2] of integer = (128,15,JustifyRight);

implementation

uses KRoutines;

{$R *.DFM}

procedure TfmRemittanceConvert.FormCreate(Sender: TObject);
begin
   ElectronicRemittanceConverter := TElectronicRemittanceConverter.Create;
end;

procedure TfmRemittanceConvert.cxButton2Click(Sender: TObject);
begin
   ElectronicRemittanceConverter.Convert;
   cxMemo1.Lines.Clear;
   cxMemo1.Lines.Add( ElectronicRemittanceConverter.ElectronicRemittanceAsString );
   btnSaveOutput.Setfocus;
end;

procedure TfmRemittanceConvert.FormDestroy(Sender: TObject);
begin
   FreeAndNil(ElectronicRemittanceConverter);
end;

procedure TfmRemittanceConvert.cxButton1Click(Sender: TObject);
begin
   if OpenDialog.Execute then
      begin
         teConvertFile.Text := OpenDialog.FileName;
         ElectronicRemittanceConverter.CSVFileName := teConvertFile.Text;
         cxMemo1.Clear;
      end;
end;

class procedure TfmRemittanceConvert.ShowConverter;
begin
   with TfmRemittanceConvert.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmRemittanceConvert.btnSaveOutputClick(Sender: TObject);
begin
  ElectronicRemittanceConverter.SaveToFile( IncludeTrailingBackslash( ExtractFilePath( teConvertFile.Text )) + teConvertedFileName.Text );
end;

end.
