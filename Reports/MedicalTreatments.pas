{
   11/05/11 [V4.1 R1.1] /MK Additional Feature - Added RecordCount ExpLabel.

   11/01/13 [V5.1 R3.8] /MK Additional Feature - Added PrescribedBy field and changed report to fit new field.

   17/01/13 [V5.1 R3.8] /MK Change - QRLabel9 - Changed caption to Comment to match Single & Group Health screens.

   20/08/13 [V5.2 R0.0] /MK Change - Added TReportType to allow Individual or Blocks of animals to appear on the report.
                                     This is set by cbIndividualReport in HealthFilterU.

   17/09/13 [V5.2 R1.4] /MK Additional Feature- MedicialTreatments - Show count of ReportTable.EventCount if BlockReport.

   18/09/13 [V5.2 R1.4] /MK Additional Feature - Added Prescribed By and Admin By Code and Name to bottom of report.

   15/05/14 [V5.3 R0.3] /MK Additional Feature - Changed all Milk or Meat Withdrawal QRDBText Values to N/A if N/A drug.

   17/07/14 [V5.3 R3.1] /MK Additional Feature - Made a to move the headings/data from ExpiryDate to Cost over by 2 - GL request.   

   15/02/16 [V5.5 R3.8] /MK Additional Feature - If Crush User (IAD) then switch the EventComment to FromPen i.e. name of batch group used in Health event.   

   10/08/20 [V5.9 R5.3] /MK Change - Added the Herd Identity to the top of the report.   
}

unit MedicalTreatments;

interface

uses
   Windows, SysUtils, Messages, Classes, Graphics, Controls,
   StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
   QRExport, Dialogs, Def;

type
  TReportType = (rtIndividual, rtBlock);
  TMedicalTreatmentsScr = class(TQuickRep)
    Detail: TQRBand;
    PageHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    RptTitle: TQRLabel;
    qrlNatIDNum: TQRLabel;
    qrlEventDate: TQRLabel;
    qrlDrugName: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    qrdbNatIDNum: TQRDBText;
    dbDate: TQRDBText;
    qrdbDrugName: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRShape1: TQRShape;
    QRLabel12: TQRLabel;
    dbWithdraw: TQRDBText;
    PageFooterBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText7: TQRDBText;
    qrlAnimalNo: TQRLabel;
    qrdbAnimalNo: TQRDBText;
    VerLabel: TQRLabel;
    ApplicMethod: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    qrlNoTimesNoDays: TQRLabel;
    QRDBText12: TQRDBText;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    qrexSumRecs: TQRExpr;
    QRLabel18: TQRLabel;
    QRDBText20: TQRDBText;
    qrlAnimalCount: TQRLabel;
    qrlTotalEventCount: TQRLabel;
    Query1: TQuery;
    qrlPresribedBy: TQRLabel;
    qrlAdminBy: TQRLabel;
    qrlAdminByCode_Name: TQRLabel;
    qrlPrescByCode_Name: TQRLabel;
    QRShape2: TQRShape;
    qrlDateFrom: TQRLabel;
    qrlDateFromDate: TQRLabel;
    qrlDateTo: TQRLabel;
    qrlDateToDate: TQRLabel;
    qrlHerdIdentityCaption: TQRLabel;
    qrlHerdIdentity: TQRLabel;
    procedure DetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure DetailAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QuickRepStartPage(Sender: TCustomQuickRep);
    procedure qrlNoTimesNoDaysPrint(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure qrlDateToDatePrint(sender: TObject; var Value: String);
    procedure PrintNALabelForMeat(sender: TObject; var Value: String);
    procedure PrintNALabelForMilk(sender: TObject; var Value: String);
  private

  public
     FReportType : TReportType;
  end;

var
  MedicalTreatmentsScr: TMedicalTreatmentsScr;

implementation
uses
    DairyData,
    HealthFilterU,
    uHerdLookup,
    GenTypesConst;

{$R *.DFM}

procedure TMedicalTreatmentsScr.DetailBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   if HerdLookup.HerdOwnerData.OrganicHerd then
      begin
         Detail.Height := 36;
         QRLabel23.Enabled := True;
         QRDBText17.Enabled := True;
         QRLabel22.Enabled := True;
         QRDBText14.Enabled := True;
         QRDBText16.Enabled := True;
         QRDBText15.Enabled := True;
         QRDBText19.Enabled := True;
      end
   else
      begin
         Detail.Height := 21;
         QRLabel23.Enabled := False;
         QRDBText17.Enabled := False;
         QRLabel22.Enabled := False;
         QRDBText14.Enabled := False;
         QRDBText16.Enabled := False;
         QRDBText15.Enabled := False;
         QRDBText19.Enabled := False;
      end;

    if WinData.GenLookUp.Locate('ID', HeatlthFilter.qMed.FieldbyName('ApplicMethod').AsInteger,[]) then
       ApplicMethod.Caption := WinData.GenLookUp.FieldByName('Description').AsString
    else
       ApplicMethod.Caption := '';

    if ( FReportType = rtBlock ) then
       begin
          if ( qrdbAnimalNo.DataSet.FieldByName('EventCount').AsInteger > 1 ) or ( qrdbAnimalNo.DataSet.FieldByName('EventCount').AsInteger = 0 ) then
             begin
                qrdbAnimalNo.Enabled := False;
                qrdbNatIDNum.Enabled := False;
                qrlAnimalCount.Enabled := True;
                qrlAnimalCount.Left := qrdbAnimalNo.Left;
                qrlAnimalCount.Top := qrdbAnimalNo.Top;
                qrlAnimalCount.Caption := 'No. Animals : '+IntToStr(qrdbAnimalNo.DataSet.FieldByName('EventCount').AsInteger);
             end
          else if ( qrdbAnimalNo.DataSet.FieldByName('EventCount').AsInteger = 1 ) then
             begin
                qrdbAnimalNo.Enabled := True;
                qrdbNatIDNum.Enabled := True;
                qrlAnimalCount.Enabled := False;
             end;
       end;
end;

procedure TMedicalTreatmentsScr.QRDBText9Print(sender: TObject;
  var Value: String);
begin
   if TQRDBText(Sender).DataSet.FieldByName(TQRDBText(Sender).DataField).AsDateTime <= 0 then
      Value := '';
end;

procedure TMedicalTreatmentsScr.QRDBText12Print(sender: TObject;
  var Value: String);
begin
   if Value <> '' then
      Value := Value + ' / ';

   if QRDBText12.Dataset.FieldByName('NoDays').AsInteger > 0 then
      Value := Value + IntToStr(QRDBText12.Dataset.FieldByName('NoDays').AsInteger);
end;

procedure TMedicalTreatmentsScr.DetailAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   QRLabel23.Caption := '';
   QRLabel22.Caption := '';
end;

procedure TMedicalTreatmentsScr.QuickRepStartPage(Sender: TCustomQuickRep);
begin
   QRLabel23.Caption := 'Health Code';
   QRLabel22.Caption := 'Organic Withdrawal Dates';
end;

procedure TMedicalTreatmentsScr.qrlNoTimesNoDaysPrint(sender: TObject;
  var Value: String);
begin
   Value := 'No.Times/'+#13#10+'No.Days';
end;

procedure TMedicalTreatmentsScr.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
   iEventCount : Integer;
begin
   iEventCount := 0;
   if ( FReportType = rtBlock ) then
      begin
         qrexSumRecs.Enabled := False;
         qrlTotalEventCount.Enabled := True;
         // Count total animals from tmpReportTable and show as total.
         with TQuery.Create(nil) do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('SELECT Sum(EventCount)');
               SQL.Add('FROM tmpReportTable');
               Open;
               try
                  First;
                  iEventCount := Fields[0].AsInteger;
               finally
                  Close;
               end;
            finally
               Free;
            end;
         qrlTotalEventCount.Caption := IntToStr(iEventCount);
      end
   else
      begin
         qrexSumRecs.Enabled := True;
         qrlTotalEventCount.Enabled := False;
      end;
   if ( Def.Definition.dUseCrush ) then
      begin
         QRLabel9.Caption := 'Pen From';
         QRDBText2.DataField := 'PenFrom';
      end
   else
      begin
         QRLabel9.Caption := 'Comment';
         QRDBText2.DataField := 'EventDesc';
      end;
end;

procedure TMedicalTreatmentsScr.qrlDateToDatePrint(sender: TObject;
  var Value: String);
begin
   if ( Value = '00/00/0000' ) then
      Value := '';
end;

procedure TMedicalTreatmentsScr.PrintNALabelForMeat(sender: TObject;
  var Value: String);
begin
   if ( TQRDBText(Sender).DataField = 'WithdrawalDate' ) or ( TQRDBText(Sender).DataField = 'OrganicMeatWD' ) then
      if ( TQRDBText(Sender).DataSet.FieldByName(TQRDBText(Sender).DataField).AsDateTime <= 0 ) then
         Value := '';

   if ( TQRDBText(Sender).DataSet.FieldByName('MeatN_A_Drug').AsBoolean ) then
       Value := 'N/A'
end;

procedure TMedicalTreatmentsScr.PrintNALabelForMilk(sender: TObject;
  var Value: String);
begin
   if ( TQRDBText(Sender).DataField = 'MilkWd' ) or ( TQRDBText(Sender).DataField = 'OrganicMilkWD' ) then
      if ( TQRDBText(Sender).DataSet.FieldByName(TQRDBText(Sender).DataField).AsDateTime <= 0 ) then
         Value := '';

   if ( TQRDBText(Sender).DataSet.FieldByName('MilkN_A_Drug').AsBoolean ) then
       Value := 'N/A'
end;

end.
