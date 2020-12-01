{
   18/12/2008 SP - Button  btnReviewAWCalves
                 - Button  btnReviewAWEmails
                 - UI Changes/Enhancements

   13/12/16 [V5.6 R3.8] /MK Additional Feature - Added changes to include the Calf, Dam and Stock Bull Events.
                            Bug Fix - For Health Events only show number of events that have the ICBF Health Code selected.
                                    - For Sales/Death Events only show number of events that have the Culling Code selected.
}

unit uAWReviewEvents;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxLabel, db, dbtables, cxGroupBox,
  ExtCtrls, cxHint;

type
  TfmAWReviewEvents = class(TForm)
    btnOK: TcxButton;
    deEventsStartDate: TcxDateEdit;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    gbWelfareEvents: TcxGroupBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    teDisbuddingEvents: TcxTextEdit;
    teCastrationEvents: TcxTextEdit;
    teMealFeedingEvents: TcxTextEdit;
    teWeaningEvents: TcxTextEdit;
    teDisbuddingEventsNotified: TcxTextEdit;
    teCastrationEventsNotified: TcxTextEdit;
    teMealFeedingEventsNotified: TcxTextEdit;
    teWeaningEventsNotified: TcxTextEdit;
    gbICBFEvents: TcxGroupBox;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    teHeatBullingEvents: TcxTextEdit;
    teServiceEvents: TcxTextEdit;
    tePregDiagEvents: TcxTextEdit;
    teDryOffEvents: TcxTextEdit;
    teHeatBullingEventsNotified: TcxTextEdit;
    teServiceEventsNotified: TcxTextEdit;
    tePregDiagEventsNotified: TcxTextEdit;
    teDryOffEventsNotified: TcxTextEdit;
    cxLabel14: TcxLabel;
    teWeighingEvents: TcxTextEdit;
    teWeighingEventsNotified: TcxTextEdit;
    cxLabel15: TcxLabel;
    teHealthEvents: TcxTextEdit;
    teHealthEventsNotified: TcxTextEdit;
    cxLabel16: TcxLabel;
    teSaleDeathEvents: TcxTextEdit;
    teSaleDeathEventsNotified: TcxTextEdit;
    cxLabel17: TcxLabel;
    gbCalvingEvents: TcxGroupBox;
    cxLabel2: TcxLabel;
    teCalvesBorn: TcxTextEdit;
    teCalvings: TcxTextEdit;
    cxLabel1: TcxLabel;
    teCalvingsNotified: TcxTextEdit;
    btnReviewAWEmails: TcxButton;
    cxLabel18: TcxLabel;
    cxLabel19: TcxLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    btnReviewAWCalves: TcxButton;
    HintTimer: TTimer;
    cxHintStyleController2: TcxHintStyleController;
    cxHintStyleController1: TcxHintStyleController;
    lNoICBFCalfSurveyEvents: TcxLabel;
    teNoICBFCalfSurveyEvents: TcxTextEdit;
    teNoICBFCalfSurveyEventsNotified: TcxTextEdit;
    lNoICBFDamSurveyEvents: TcxLabel;
    teNoICBFDamSurveyEvents: TcxTextEdit;
    teNoICBFDamSurveyEventsNotified: TcxTextEdit;
    lNoICBFStockBullSurveyEvents: TcxLabel;
    teNoICBFStockBullSurveyEvents: TcxTextEdit;
    teNoICBFStockBullSurveyEventsNotified: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure deEventsStartDatePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure btnReviewAWEmailsClick(Sender: TObject);
    procedure btnReviewAWCalvesClick(Sender: TObject);
    procedure HintTimerTimer(Sender: TObject);
  private
    { Private declarations }
    AnimalWelfareEventsBeginDate : TDateTime;
    FHerdID : Integer;
    FHintStyleController : TcxHintStyleController;
    procedure getEvents;
  public
    { Public declarations }
    class procedure Show(AHerdID : Integer);
  end;

var
  fmAWReviewEvents: TfmAWReviewEvents;

implementation

uses DairyData, GenTypesConst, uAWReviewCalves, uICBFEmailReview;

{$R *.DFM}

procedure TfmAWReviewEvents.FormCreate(Sender: TObject);
begin
    teCalvings.Text := '0';
    teCalvesBorn.Text := '0';
    teDisbuddingEvents.Text := '0';
    teCastrationEvents.Text := '0';
    teMealFeedingEvents.Text := '0';
    teWeaningEvents.Text := '0';
    deEventsStartDate.Date := EncodeDate(2008,1,1);
    AnimalWelfareEventsBeginDate := deEventsStartDate.Date;
end;

procedure TfmAWReviewEvents.FormActivate(Sender: TObject);
begin
   getEvents;
end;

class procedure TfmAWReviewEvents.Show(AHerdID : Integer);
begin
   fmAWReviewEvents := TfmAWReviewEvents.Create(nil);
   with fmAWReviewEvents do
      try
         if AHerdID > 0 then
            FHerdID := AHerdID
         else
            FHerdID := WinData.UserDefaultHerdID;

         ShowModal;
      finally
        FreeAndNil(fmAWReviewEvents);
      end;
end;

procedure TfmAWReviewEvents.deEventsStartDatePropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
{
   if deeventsStartDate.Date < EnCodeDate(2008,1,1) then
      begin
         ErrorText := 'Date must be on or after 01/01/2008 - resetting date';
         Error := True;
         deeventsStartDate.Date := EnCodeDate(2008,1,1);
      end;

   if not Error then
}      getEvents;
end;

procedure TfmAWReviewEvents.getEvents;
var
   NoOfCalves : Integer;
begin

    teDisbuddingEvents.Text := '';
    teCastrationEvents.Text := '';
    teMealFeedingEvents.Text := '';
    teWeaningEvents.Text := '';
    teDisbuddingEventsNotified.Text := '';
    teCastrationEventsNotified.Text := '';
    teMealFeedingEventsNotified.Text := '';
    teWeaningEventsNotified.Text := '';
    teHeatBullingEvents.Text := '';
    teServiceEvents.Text := '';
    tePregDiagEvents.Text := '';
    teDryOffEvents.Text := '';
    teHeatBullingEventsNotified.Text := '';
    teServiceEventsNotified.Text := '';
    tePregDiagEventsNotified.Text := '';
    teDryOffEventsNotified.Text := '';
    teWeighingEvents.Text := '';
    teWeighingEventsNotified.Text := '';
    teHealthEvents.Text := '';
    teHealthEventsNotified.Text := '';
    teSaleDeathEvents.Text := '';
    teSaleDeathEventsNotified.Text := '';
    teCalvesBorn.Text := '';
    teCalvings.Text := '';
    teCalvingsNotified.Text := '';


   Update;
   Screen.Cursor := crHourGlass;
   try

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT COUNT(ID) CID');
         SQL.Add('FROM Events');
         SQL.Add('WHERE EventType = :EventType');
         SQL.Add('AND EventDate >= :EventDate');
         SQL.Add('AND HerdID = :HerdID');

         Params[0].AsInteger := CCalvingEvent;
         Params[1].AsDateTime := deEventsStartDate.Date;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teCalvings.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         Params[0].AsInteger := CDisbuddingEvent;
         if ( deEventsStartDate.Date >= AnimalWelfareEventsBeginDate ) then
            Params[1].AsDateTime := deEventsStartDate.Date
         else
            Params[1].AsDateTime := AnimalWelfareEventsBeginDate;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teDisbuddingEvents.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         Params[0].AsInteger := CCastrateEvent;
         if ( deEventsStartDate.Date >= AnimalWelfareEventsBeginDate ) then
            Params[1].AsDateTime := deEventsStartDate.Date
         else
            Params[1].AsDateTime := AnimalWelfareEventsBeginDate;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teCastrationEvents.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         Params[0].AsInteger := CMealFeedingEvent;
         if ( deEventsStartDate.Date >= AnimalWelfareEventsBeginDate ) then
            Params[1].AsDateTime := deEventsStartDate.Date
         else
            Params[1].AsDateTime := AnimalWelfareEventsBeginDate;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teMealFeedingEvents.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         Params[0].AsInteger := CWeaningEvent;
         if ( deEventsStartDate.Date >= AnimalWelfareEventsBeginDate ) then
            Params[1].AsDateTime := deEventsStartDate.Date
         else
            Params[1].AsDateTime := AnimalWelfareEventsBeginDate;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teWeaningEvents.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         Params[0].AsInteger := CICBFCalfSurveyEvent;
         if ( deEventsStartDate.Date >= AnimalWelfareEventsBeginDate ) then
            Params[1].AsDateTime := deEventsStartDate.Date
         else
            Params[1].AsDateTime := AnimalWelfareEventsBeginDate;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teNoICBFCalfSurveyEvents.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         Params[0].AsInteger := CICBFDamEvent;
         if ( deEventsStartDate.Date >= AnimalWelfareEventsBeginDate ) then
            Params[1].AsDateTime := deEventsStartDate.Date
         else
            Params[1].AsDateTime := AnimalWelfareEventsBeginDate;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teNoICBFDamSurveyEvents.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         Params[0].AsInteger := CICBFStockBullEvent;
         if ( deEventsStartDate.Date >= AnimalWelfareEventsBeginDate ) then
            Params[1].AsDateTime := deEventsStartDate.Date
         else
            Params[1].AsDateTime := AnimalWelfareEventsBeginDate;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teNoICBFStockBullSurveyEvents.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         Params[0].AsInteger := CBullingEvent;
         Params[1].AsDateTime := deEventsStartDate.Date;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teHeatBullingEvents.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         Params[0].AsInteger := CServiceEvent;
         Params[1].AsDateTime := deEventsStartDate.Date;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teServiceEvents.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         Params[0].AsInteger := CPregDiagEvent;
         Params[1].AsDateTime := deEventsStartDate.Date;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            tePregDiagEvents.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         Params[0].AsInteger := CDryOffEvent;
         Params[1].AsDateTime := deEventsStartDate.Date;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teDryOffEvents.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         Params[0].AsInteger := CWeightEvent;
         Params[1].AsDateTime := deEventsStartDate.Date;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teWeighingEvents.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         SQL.Clear;
         SQL.Add('SELECT COUNT(E.ID) CID');
         SQL.Add('FROM Events E');
         SQL.Add('LEFT JOIN Health H ON (H.EventID = E.ID)');
         SQL.Add('WHERE (E.EventType = :EventType)');
         SQL.Add('AND   (E.EventDate >= :EventDate)');
         SQL.Add('AND   (E.HerdID = :HerdID)');
         SQL.Add('AND   ( (H.HealthCode <> "") AND (H.HealthCode > 0) )');
         Params[0].AsInteger := CHealthEvent;
         Params[1].AsDateTime := deEventsStartDate.Date;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teHealthEvents.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         SQL.Clear;
         SQL.Add('SELECT COUNT(E.ID) CID');
         SQL.Add('FROM Events E');
         SQL.Add('LEFT JOIN SalesDeaths S On (S.EventID = E.ID)');
         SQL.Add('WHERE (E.EventType = :SaleEvent)');
         SQL.Add('AND   (E.EventDate >= :EventDate)');
         SQL.Add('AND   (E.HerdID = :HerdID)');
         SQL.Add('AND   (S.Culled IS NOT NULL)');
         Params[0].AsInteger := CSaleDeathEvent;
         Params[1].AsDateTime := deEventsStartDate.Date;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teSaleDeathEvents.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         SQL.Clear;
         SQL.Add('SELECT COUNT(ID) CID');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE ID IN (SELECT DISTINCT (ID1) From Calvings)');
         SQL.Add('AND DateOfBirth >= :EventDate');
         SQL.Add('AND HerdID = :HerdID');
         Params[0].AsDateTime := deEventsStartDate.Date;
         Params[1].AsInteger := FHerdID;
         Open;
         try
            First;
            NoOfCalves := NoOfCalves + Fields[0].AsInteger;
         finally
            Close;
         end;

         SQL.Clear;
         SQL.Add('SELECT COUNT(ID) CID');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE ID IN (SELECT DISTINCT (ID2) From Calvings)');
         SQL.Add('AND DateOfBirth >= :EventDate');
         SQL.Add('AND HerdID = :HerdID');
         Params[0].AsDateTime := deEventsStartDate.Date;
         Params[1].AsInteger := FHerdID;
         Open;
         try
            First;
            NoOfCalves := NoOfCalves + Fields[0].AsInteger;
         finally
            Close;
         end;

         SQL.Clear;
         SQL.Add('SELECT COUNT(ID) CID');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE ID IN (SELECT DISTINCT (ID3) From Calvings)');
         SQL.Add('AND DateOfBirth >= :EventDate');
         SQL.Add('AND HerdID = :HerdID');
         Params[0].AsDateTime := deEventsStartDate.Date;
         Params[1].AsInteger := FHerdID;
         Open;
         try
            First;
            NoOfCalves := NoOfCalves + Fields[0].AsInteger;
         finally
            Close;
         end;

         SQL.Clear;
         SQL.Add('SELECT COUNT(ID) CID');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE ID IN (SELECT DISTINCT (ID4) From Calvings)');
         SQL.Add('AND DateOfBirth >= :EventDate');
         SQL.Add('AND HerdID = :HerdID');
         Params[0].AsDateTime := deEventsStartDate.Date;
         Params[1].AsInteger := FHerdID;
         Open;
         try
            First;
            NoOfCalves := NoOfCalves + Fields[0].AsInteger;
         finally
            Close;
         end;

         teCalvesBorn.Text := IntToStr(NoOfCalves);

         SQL.Clear;
         SQL.Add('SELECT COUNT(ID) CID');
         SQL.Add('FROM Events');
         SQL.Add('WHERE EventType = :EventType');
         SQL.Add('AND EventDate >= :EventDate');
         SQL.Add('AND ICBFNotified = TRUE');
         SQL.Add('AND HerdID = :HerdID');

         Params[0].AsInteger := CCalvingEvent;
         Params[1].AsDateTime := deEventsStartDate.Date;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teCalvingsNotified.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         Params[0].AsInteger := CDisbuddingEvent;
         if ( deEventsStartDate.Date >= AnimalWelfareEventsBeginDate ) then
            Params[1].AsDateTime := deEventsStartDate.Date
         else
            Params[1].AsDateTime := AnimalWelfareEventsBeginDate;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teDisbuddingEventsNotified.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         Params[0].AsInteger := CCastrateEvent;
         if ( deEventsStartDate.Date >= AnimalWelfareEventsBeginDate ) then
            Params[1].AsDateTime := deEventsStartDate.Date
         else
            Params[1].AsDateTime := AnimalWelfareEventsBeginDate;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teCastrationEventsNotified.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         Params[0].AsInteger := CMealFeedingEvent;
         if ( deEventsStartDate.Date >= AnimalWelfareEventsBeginDate ) then
            Params[1].AsDateTime := deEventsStartDate.Date
         else
            Params[1].AsDateTime := AnimalWelfareEventsBeginDate;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teMealFeedingEventsNotified.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         Params[0].AsInteger := CWeaningEvent;
         if ( deEventsStartDate.Date >= AnimalWelfareEventsBeginDate ) then
            Params[1].AsDateTime := deEventsStartDate.Date
         else
            Params[1].AsDateTime := AnimalWelfareEventsBeginDate;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teWeaningEventsNotified.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         Params[0].AsInteger := CICBFCalfSurveyEvent;
         if ( deEventsStartDate.Date >= AnimalWelfareEventsBeginDate ) then
            Params[1].AsDateTime := deEventsStartDate.Date
         else
            Params[1].AsDateTime := AnimalWelfareEventsBeginDate;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teNoICBFCalfSurveyEventsNotified.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         Params[0].AsInteger := CICBFDamEvent;
         if ( deEventsStartDate.Date >= AnimalWelfareEventsBeginDate ) then
            Params[1].AsDateTime := deEventsStartDate.Date
         else
            Params[1].AsDateTime := AnimalWelfareEventsBeginDate;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teNoICBFDamSurveyEventsNotified.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         Params[0].AsInteger := CICBFStockBullEvent;
         if ( deEventsStartDate.Date >= AnimalWelfareEventsBeginDate ) then
            Params[1].AsDateTime := deEventsStartDate.Date
         else
            Params[1].AsDateTime := AnimalWelfareEventsBeginDate;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teNoICBFStockBullSurveyEventsNotified.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         Params[0].AsInteger := CBullingEvent;
         Params[1].AsDateTime := deEventsStartDate.Date;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teHeatBullingEventsNotified.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         Params[0].AsInteger := CServiceEvent;
         Params[1].AsDateTime := deEventsStartDate.Date;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teServiceEventsNotified.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         Params[0].AsInteger := CPregDiagEvent;
         Params[1].AsDateTime := deEventsStartDate.Date;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            tePregDiagEventsNotified.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         Params[0].AsInteger := CDryOffEvent;
         Params[1].AsDateTime := deEventsStartDate.Date;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teDryOffEventsNotified.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         Params[0].AsInteger := CWeightEvent;
         Params[1].AsDateTime := deEventsStartDate.Date;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teWeighingEventsNotified.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         SQL.Clear;
         SQL.Add('SELECT COUNT(E.ID) CID');
         SQL.Add('FROM Events E');
         SQL.Add('LEFT JOIN Health H ON (H.EventID = E.ID)');
         SQL.Add('WHERE (E.EventType = :EventType)');
         SQL.Add('AND   (E.EventDate >= :EventDate)');
         SQL.Add('AND   (E.HerdID = :HerdID)');
         SQL.Add('AND   ( (H.HealthCode <> "") AND (H.HealthCode > 0) )'); 
         SQL.Add('AND   (E.ICBFNotified = True)');
         Params[0].AsInteger := CHealthEvent;
         Params[1].AsDateTime := deEventsStartDate.Date;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teHealthEventsNotified.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

         SQL.Clear;
         SQL.Add('SELECT COUNT(E.ID)');
         SQL.Add('FROM Events E');
         SQL.Add('LEFT JOIN SalesDeaths S On (S.EventID = E.ID)');
         SQL.Add('WHERE (E.EventType = :SaleEvent)');
         SQL.Add('AND   (E.EventDate >= :EventDate)');
         SQL.Add('AND   (E.HerdID = :HerdID)');
         SQL.Add('AND   (S.Culled IS NOT NULL)');
         SQL.Add('AND   (E.ICBFNotified = True)');
         Params[0].AsInteger := CSaleDeathEvent;
         Params[1].AsDateTime := deEventsStartDate.Date;
         Params[2].AsInteger := FHerdID;
         Open;
         try
            First;
            teSaleDeathEventsNotified.Text := IntToStr(Fields[0].AsInteger);
         finally
            Close;
         end;

      finally
         Free;
      end;
   finally
      Screen.Cursor := crDefault;
   end;

end;

procedure TfmAWReviewEvents.btnReviewAWEmailsClick(Sender: TObject);
begin
   TfmICBFEmailReview.Execute(FHerdID);
end;

procedure TfmAWReviewEvents.btnReviewAWCalvesClick(Sender: TObject);
begin
   TfmAWReviewCalves.Execute(FHerdID);
end;

procedure TfmAWReviewEvents.HintTimerTimer(Sender: TObject);
begin
   HintTimer.Enabled := False;
end;

end.
