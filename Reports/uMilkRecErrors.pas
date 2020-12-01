unit uMilkRecErrors;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QRCtrls, QuickRpt, ExtCtrls, Db, DBTables;

type
  TMilkRecErrors = class(TForm)
    qrMilkErrors: TQuickRep;
    QRBand1: TQRBand;
    qrlHeading: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrlReportDesc: TQRMemo;
    QRSubDetail1: TQRSubDetail;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    GenQuery: TQuery;
    qrlHerdLactNo: TQRLabel;
    qrlICBFLactNo: TQRLabel;
    qrdblHerdLactNo: TQRDBText;
    qrdblICBFLactNo: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MilkRecErrors: TMilkRecErrors;

implementation
uses
   uMilkRec;

{$R *.DFM}

end.
