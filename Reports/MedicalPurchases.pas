{
   26/05/11 [V4.1 R1.6] /MK Additional Feature - Fixed Problem Where Total/Average Expression Not Showing On Report.

   12/12/14 [V5.4 R0.3] /MK Change - Changed Quantity to Quantity Purchased - GL/Andrew Dineen request.   

   01/02/19 [V5.8 R6.5] /MK Bug Fix - If the drug is N/A then display N/A not 9999 - Sean (Kingswood).

   10/08/20 [V5.9 R5.3] /MK Change - Added the Herd Identity to the top of the report.   
}

unit MedicalPurchases;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, QRExport;

type
  TMedicalPurchasesScr = class(TForm)
    qrMedicalPurchases: TQuickRep;
    PageFooterBand1: TQRBand;
    QRLabel9: TQRLabel;
    VerLabel: TQRLabel;
    PageHeaderBand1: TQRBand;
    RptTitle: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRExpr3: TQRExpr;
    Detail: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    QRLabel17: TQRLabel;
    QRDBText12: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel12: TQRLabel;
    qrlDateFrom: TQRLabel;
    qrlDateFromDate: TQRLabel;
    qrlDateTo: TQRLabel;
    qrlDateToDate: TQRLabel;
    lHerdIdentiyCaption: TQRLabel;
    qrlHerdIdentity: TQRLabel;
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure qrlDateFromDatePrint(sender: TObject; var Value: String);
    procedure NADrugWithdrawalPrint(sender: TObject; var Value: String);
  private

  public

  end;

var
  MedicalPurchasesScr: TMedicalPurchasesScr;

implementation
uses
   HealthFilterU;
{$R *.DFM}

procedure TMedicalPurchasesScr.QRDBText9Print(sender: TObject;
  var Value: String);
begin
   if TQRDBText(Sender).DataSet.FieldByName(TQRDBText(Sender).DataField).AsDateTime <= 0 then
      Value := '';
end;

procedure TMedicalPurchasesScr.qrlDateFromDatePrint(sender: TObject;
  var Value: String);
begin
   if ( Value = '00/00/0000' ) then
      Value := '';
end;

procedure TMedicalPurchasesScr.NADrugWithdrawalPrint(sender: TObject; var Value: String);
begin
   //   01/02/19 [V5.8 R6.5] /MK Bug Fix - If the drug is N/A then display N/A not 9999 - Sean (Kingswood).
   if ( Value = '9999' ) then
      Value := 'N/A';
end;

end.
