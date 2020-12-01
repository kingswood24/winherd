unit uPedNamePrint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, StdCtrls, Db, DBTables, QRExport;

type
  TPedNamePrintRep = class(TForm)
    QuickRep1: TQuickRep;
    GenQuery: TQuery;
    PageFooterBand1: TQRBand;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRShape1: TQRShape;
    QRBand2: TQRBand;
    CowNo: TQRDBText;
    AnimalName: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel44: TQRLabel;
    PurchSalesVerLabel: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PedNamePrintRep: TPedNamePrintRep;

implementation
uses
   uPedName;

{$R *.DFM}

procedure TPedNamePrintRep.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   With GenQuery do
     Begin
        SQL.Clear;
        SQL.Add('SELECT *');
        SQL.Add('FROM tPedName'); //, Animals S');
        Open;
    end;

end;

end.
