unit uPremiumReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TfmPremiumReport = class(TForm)
    PremiumScr: TQuickRep;
    ColumnHeaderBand2: TQRBand;
    QRLabel18: TQRLabel;
    QRShape2: TQRShape;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel19: TQRLabel;
    PremRptTitle: TQRLabel;
    PremDateType: TQRLabel;
    PremOrderLabel: TQRLabel;
    QRLabel25: TQRLabel;
    PremSortLabel: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    PremDetail: TQRBand;
    qrApplicDate: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText10: TQRDBText;
    PremRepFirstPrem: TQRExpr;
    PageFooterBand2: TQRBand;
    QRLabel34: TQRLabel;
    PremVerLabel: TQRLabel;
    SummaryBand2: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPremiumReport: TfmPremiumReport;

implementation
uses
   StockInHerdFilt;
{$R *.DFM}

end.
