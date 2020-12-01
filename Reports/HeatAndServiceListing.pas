unit HeatAndServiceListing;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  THeatsAndServicesListingScr = class(TQuickRep)
    Detail: TQRBand;
    PageFooterBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    RptTitle: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    CalvingDate: TQRDBText;
    FirstHeat: TQRDBText;
    SecondHeat: TQRDBText;
    ThirdHeat: TQRDBText;
    FourthHeat: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    qHeatsAndServicesListing: TQuery;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    Summary: TQRBand;
    QRLabel16: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel23: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRExpr1: TQRExpr;
    VerLabel: TQRLabel;
  private

  public

  end;

var
  HeatsAndServicesListingScr: THeatsAndServicesListingScr;

implementation
Uses
    DairyData;

{$R *.DFM}

end.
