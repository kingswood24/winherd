unit uNISuckForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, Db, DBTables;

type
  TfmNISuckForm = class(TForm)
    qrCows: TQuickRep;
    QRBand1: TQRBand;
    QRSubDetail1: TQRSubDetail;
    GroupFooterBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRExpr1: TQRExpr;
    qCows: TQuery;
    qHeifers: TQuery;
    QRLabel14: TQRLabel;
    PageFooterBand3: TQRBand;
    qrHeifers: TQuickRep;
    TitleBand1: TQRBand;
    QRSubDetail3: TQRSubDetail;
    GroupFooterBand3: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    lAppDate: TQRLabel;
    lRetentionDate: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel15: TQRLabel;
    QRExpr2: TQRExpr;
    PageFooterBand1: TQRBand;
    QRLabel23: TQRLabel;
    VerLabel2: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    lAppDate2: TQRLabel;
    lRetentionDate2: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel27: TQRLabel;
    VerLabel: TQRLabel;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmNISuckForm: TfmNISuckForm;

implementation

{$R *.DFM}

end.
