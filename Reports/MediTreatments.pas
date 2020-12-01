unit MediTreatments;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls;

type
  TQuickReport1 = class(TQuickRep)
    Detail: TQRBand;
    QRDBText1: TQRDBText;
    dbDate: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    dbWithdraw: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    ApplicMethod: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    PageHeaderBand1: TQRBand;
    RptTitle: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRShape1: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape2: TQRShape;
    QRLabel21: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    PageFooterBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    VerLabel: TQRLabel;
    procedure DetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText11Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  QuickReport1: TQuickReport1;

implementation
uses
    DairyData,
    HealthFilterU;


{$R *.DFM}

procedure TQuickReport1.DetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
    if WinData.GenLookUp.Locate('ID', HeatlthFilter.qMed.fieldbyName('ApplicMethod').AsInteger,[]) then
       ApplicMethod.Caption := WinData.GenLookUp.FieldByName('Description').AsString
    else
       ApplicMethod.Caption := '';

end;

procedure TQuickReport1.QRDBText11Print(sender: TObject;
  var Value: String);
begin
   if TQRDBText(Sender).DataSet.FieldByName(TQRDBText(Sender).DataField).DataType = ftDateTime then // be sure its a date field.
      if TQRDBText(Sender).DataSet.FieldByName(TQRDBText(Sender).DataField).AsDateTime <= 0 then // if less than zero blank
         Value := '';
end;

end.
