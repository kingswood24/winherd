{
   03/08/12 [V5.0 R9.7] /MK Additional Feature - Add animals in detail band to cart.

   08/01/13 [V5.1 R3.7] /MK Additional Feature - Add counts to report if no animal numbers or no breeding history.
                                               - Add labels to report if count is greater than 0.

   17/01/13 [V5.1 R3.8] /MK Change - Changed left of AnimalNumber qrlabels and qrdbtexts to look better on the report.

   18/07/13 [V5.1 R8.6] /MK Change - Removed FAnimalCartArray code as button in ActionReminderFlt Cart button adding animals to FAnimalCartArray

   18/05/17 [V5.6 R8.1] /MK Bug Fix - OtherDetailBeforePrint - Was looking at same Due Service Date QRDBLabel as normal report - Declan O'Meara.
                            Change - Changed caption of both "indicates Due First Service" labels to "indicates no heats recorded - GL request.
                                   - MainHeaderBeforePrint/OtherDetailBeforePrint - Show labels "dates highlighted" depending on result of new functions HasMissedCycle & HasOverDueCutOffDates.
                                   - Added new header and QRDBText components for Days Since Last Heat - GL/Declan O'Meara request.
                                   - Remove Service Type header and QRDBText - GL request.
}

unit DueFirstService;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
     StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables,
     QRExport, GenTypesConst;

type
  TDueFirstServiceScr = class(TQuickRep)
    PageFooterBand1: TQRBand;
    MainHeader: TQRBand;
    qDueFirstService: TQuery;
    MainHeadingShort: TQRLabel;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    DataHeader: TQRBand;
    DataEntryHeading: TQRLabel;
    QRShape2: TQRShape;
    QRLabel14: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel13: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    Period: TQRLabel;
    BlankFormDate: TQRLabel;
    QRLabel15: TQRLabel;
    VerLabel: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel27: TQRLabel;
    MainDetail: TQRBand;
    QRDBText17: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRExpr2: TQRExpr;
    SummaryBand2: TQRBand;
    QRLabel36: TQRLabel;
    QRExpr4: TQRExpr;
    lOverDueNotice: TQRLabel;
    qrDetailedService: TQuickRep;
    DetailReportHeaderBand: TQRBand;
    MainHeadingLong: TQRLabel;
    QRShape3: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel23: TQRLabel;
    QRSysData5: TQRSysData;
    QRSysData6: TQRSysData;
    PeriodExtended: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel34: TQRLabel;
    OtherDetail: TQRBand;
    qrlastheat: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText18: TQRDBText;
    qrlastservice: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText23: TQRDBText;
    QRExpr1: TQRExpr;
    PageFooterBand2: TQRBand;
    QRLabel12: TQRLabel;
    verno2: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel35: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel40: TQRLabel;
    QRLabel38: TQRLabel;
    lOverDueNotice2: TQRLabel;
    qrlNoAnimalNumbersCount: TQRLabel;
    qrlNoBreedingHistoryCount: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBDaysSinceLastHeat: TQRDBText;
    procedure DueFirstServiceScrBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure MainDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure OtherDetailBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure qrlastheatPrint(sender: TObject; var Value: String);
    procedure qrDetailedServiceBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure MainHeaderBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailReportHeaderBandBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
     function HasMissedCycle : Boolean;
     function HasOverDueCutOffDates : Boolean;
  public
     //   08/01/13 [V5.1 R3.7] /MK Additional Feature - Add count to report if no animal numbers or no breeding history.
     NoBreedHistoryCount,
     NoAnimalNumberCount : Integer;
     OverDueCutOffDate : TDateTime; //
     PrintOutBlank : Boolean;
  end;

var
  DueFirstServiceScr: TDueFirstServiceScr;

implementation

uses
  DairyData, ActionReminderFilt, uAnimalCart;

{$R *.DFM}

procedure TDueFirstServiceScr.DueFirstServiceScrBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   { SP 26/05/04 }
   if ActionReminderFilter.ExcludeOver.Checked then // Only show where animals over due are displayed
     lOverDueNotice.caption := '';

   //   08/01/13 [V5.1 R3.7] /MK Additional Feature - Add counts to report if no animal numbers or no breeding history.
   qrlNoAnimalNumbersCount.Enabled := NoAnimalNumberCount > 0;
   qrlNoBreedingHistoryCount.Enabled := NoBreedHistoryCount > 0;
   if ( not(qrlNoBreedingHistoryCount.Enabled) ) and ( qrlNoAnimalNumbersCount.Enabled ) then
      qrlNoAnimalNumbersCount.Top := 21;
   if NoAnimalNumberCount > 0 then
      begin
         qrlNoAnimalNumbersCount.Caption := '';
         if ( NoAnimalNumberCount = 1 ) then
            qrlNoAnimalNumbersCount.Caption := Format('There was %d animal without an Animal Number.',[NoAnimalNumberCount])
         else if ( NoAnimalNumberCount > 1 ) then
            qrlNoAnimalNumbersCount.Caption := Format('There are %d animals without Animal Numbers.',[NoAnimalNumberCount]);
         qrlNoAnimalNumbersCount.Font.Color := clRed;
      end;
   if NoBreedHistoryCount > 0 then
      begin
         qrlNoBreedingHistoryCount.Caption := '';
         if ( NoBreedHistoryCount = 1 ) then
            qrlNoBreedingHistoryCount.Caption := Format('Due Service Date cannot be determined for %d animal as '+#13#10+
                                                        'it has insufficient breeding history.',[NoBreedHistoryCount])
         else if ( NoBreedHistoryCount > 1 ) then
            qrlNoBreedingHistoryCount.Caption := Format('Due Service Date cannot be determined for %d animals as '+#13#10+
                                                        'they have insufficient breeding history.',[NoBreedHistoryCount]);
         qrlNoBreedingHistoryCount.Font.Color := clRed;
      end;

end;

procedure TDueFirstServiceScr.MainDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   QRDBText28.Font.Color := clNavy;
   if ( OverDueCutOffDate > 0 ) then
      if ( qDueFirstService.FieldByName('DueService').AsDateTime < OverDueCutOffDate) then
         QRDBText28.Font.Color := clRed;
   if qDueFirstService.FieldByName('OverDue').AsBoolean then
      QRDBText28.Font.Color := clBlue;
end;

procedure TDueFirstServiceScr.OtherDetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRDBText14.Font.Color := clNavy;
  if ( OverDueCutOffDate > 0 ) then
      if ( qDueFirstService.FieldByName('DueService').AsDateTime < OverDueCutOffDate ) then
         QRDBText14.Font.Color := clRed;
  if ( qDueFirstService.FieldByName('OverDue').AsBoolean ) then
     QRDBText14.Font.Color := clBlue;
end;

procedure TDueFirstServiceScr.QRDBText10Print(sender: TObject;
  var Value: String);
begin
   if (Sender as TQRDBText).DataSet.FieldByName((Sender as TQRDBText).DataField).AsDateTime <= 0  then
      Value := '';
end;

procedure TDueFirstServiceScr.qrlastheatPrint(sender: TObject;
  var Value: String);
begin
   if (Sender as TQRDBText).DataSet.FieldByName((Sender as TQRDBText).DataField).AsDateTime <= 0  then
      Value := '';
end;

procedure TDueFirstServiceScr.qrDetailedServiceBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   { SP 26/05/04 }
   if ActionReminderFilter.ExcludeOver.Checked then // Only show where animals over due are displayed
     lOverDueNotice2.caption := '';
end;

procedure TDueFirstServiceScr.MainHeaderBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   QRLabel40.Enabled := HasMissedCycle;
   lOverDueNotice.Enabled := HasOverDueCutOffDates;
end;

procedure TDueFirstServiceScr.DetailReportHeaderBandBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
begin
   QRLabel38.Enabled := HasMissedCycle;
   lOverDueNotice2.Enabled := HasOverDueCutOffDates;
end;

function TDueFirstServiceScr.HasMissedCycle : Boolean;
begin
   Result := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM DueFirstService');
         SQL.Add('WHERE (Include = True)');
         SQL.Add('AND   (OverDue = True)');
         try
            Open;
            Result := ( RecordCount > 0 );
         except
         end;
      finally
         Free;
      end;
end;

function TDueFirstServiceScr.HasOverDueCutOffDates: Boolean;
begin
   Result := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM DueFirstService');
         SQL.Add('WHERE (Include = True)');
         SQL.Add('AND   (DueService < "'+FormatDateTime(cUSDateStyle,OverDueCutOffDate)+'")');
         try
            Open;
            Result := ( RecordCount > 0 );
         except
         end;
      finally
         Free;
      end;
end;

end.
