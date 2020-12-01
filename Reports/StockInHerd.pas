unit StockInHerd;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TPurchaseSalesScr = class(TQuickRep)
    PurchSalesDetail: TQRBand;
    ColumnHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    PurchSalesRptTitle: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    qPurchSales: TQuery;
    QRShape1: TQRShape;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    SortLabel: TQRLabel;
    OrderLabel: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    VerLabel: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRShape2: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape5: TQRShape;
    QRLabel20: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel21: TQRLabel;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    Margin: TQRExpr;
  private
  public
  end;

implementation
uses
    DairyData;

{$R *.DFM}

end.
