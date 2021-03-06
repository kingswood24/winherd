{
  08/03/09 [V3.9 R6.7] /MK Additional Feature - Added Current Lactation heading
  to the report to indicate current years information.
  I also changed the Times Used heading to Serves Used.

  24/10/14 [V5.3 R8.6] /MK Change - Changed caption from "Cows Served" to "Cows in calf to Bull" in Current Lactation
                                  - Changed caption from "Calvings" to "Calvings due to Bull" in Completed Lactations.
                                  - Moved Semen Stock and Price/Straw closer to Last Used for better reading - GL request.
                                  - Round conception percentages - Gl request.
}

unit BullReport;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, QRExport, KRoutines;

type
  TBullRptscr = class(TQuickRep)
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    lPricePerStraw: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel16: TQRLabel;
    qBull2: TQuery;
    QRExpr2: TQRExpr;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    VerLabel: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape2: TQRShape;
    QRDBText7: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText8: TQRDBText;
    lBullsUsed: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel17: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText11: TQRDBText;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    QRShape3: TQRShape;
    QRLabel19: TQRLabel;
    qrlCompLacConcPerc: TQRLabel;
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  BullRptscr: TBullRptscr;

implementation
{
uses
    DairyData;
}

{$R *.DFM}

procedure TBullRptscr.QRDBText10Print(sender: TObject; var Value: String);
begin
   {
   if ( qBull2.FieldByName('ConcPerCow').AsFloat > 0 ) then
      QRDBText10.Mask := '#.##'
   else
      QRDBText10.Mask := '';
   }
end;

procedure TBullRptscr.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrlCompLacConcPerc.Caption := '';
   if ( qBull2.FieldByName('TimesUsed').AsInteger > 0 ) then
      qrlCompLacConcPerc.Caption := FloatToStr(KRound((qBull2.FieldByName('NoSucc').AsInteger*100)/qBull2.FieldByName('TimesUsed').AsFloat));
end;

end.
