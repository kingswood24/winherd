unit uGridPrint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, QRExport;

type
  TfGridPrint = class(TForm)
    qrAnimals: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRBand2: TQRBand;
    QRLabel8: TQRLabel;
    VerLabel: TQRLabel;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel7: TQRLabel;
    qGridPrint: TQuery;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    procedure qrAnimalsBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure Print;
  end;

var
  fGridPrint: TfGridPrint;

implementation
uses
   DairyData, GenTypesConst, MenuUnit;
{$R *.DFM}

procedure TfGridPrint.Print;
begin
    with qGridPrint do
       begin
          SQL.Text := 'SELECT * FROM ANIMALS WHERE ID IN (SELECT DISTINCT AID FROM AFILTERS) ORDER BY '+MenuForm.CurrIndex;
          Open;
       end;
    qrAnimals.Print;
end;

procedure TfGridPrint.qrAnimalsBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   if UpperCase(Windata.UserTypeOfHerd) = 'BEEF' then
      QRDBText4.DataField := 'Name_1'
   else
      QRDBText4.DataField := 'LactNo';
end;

procedure TfGridPrint.FormDestroy(Sender: TObject);
begin
   qGridPrint.Close;
end;

end.
