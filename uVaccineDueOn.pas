{
   26/09/12 [V5.1 R0.0] /MK Additional Feature - Added PageControl with Review tab.
                                               - If in Review tab then allow user to re-create events with new date.
                                               - Print now prints either grid.

   01/10/12 [V5.1 R0.0] /MK Additional Feature - Add Options button to allow program to show reminders on Program Startup.

   05/12/12 [V5.1 R3.4] /MK Bug Fix - deNewEventDate - Close table and then execute query instead of execute query and refresh table.

   13/12/12 [V5.1 R3.5] /MK Bug Fix - Fixed some glitches when trying to collect the Detail data.
                        /MK Change - On Create Events show confirmation message to create number of events.
                                   - On Page Change - if Repeat Date is after today then show confirmation message that repeat date is after today.
                                                    - Header EventDate is today then don't allow create events.

   20/12/12 [V5.1 R3.5] /MK Bug Fix - On Health Event if no Health or ICBF Code then review screen shows blank.
                                    - QueryData and GetDetailData now look for both Vaccine and Disease ID.

   15/04/15 [V5.4 R3.8] /MK Bug Fix - QueryData - Allowed breakdown by the days/weeks to remind - DOM reported.
                                    - actCreateEvents - Show message based on selected records on the grid and not the total records in the grid - DOM reported.

   18/05/20 [V5.9 R4.7] /MK Change - Don't save the repeat event for animals that left the herd before the treatment date - DOM request.
                                   - Show progress bar when saving the events.
                                   - Show memo box after the events are saved shows the amount of events saved or not saved.                                    

   19/01/21 [V5.9 R8.0] /MK Bug Fix - QueryData - Zero ReminderDays is saved into the database as Null. The query needs to check for that also.
}

unit uVaccineDueOn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, dxBar, dxBarExtItems, ActnList, cxControls, dxStatusBar,
  StdCtrls, cxButtons, cxLabel, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, ExtCtrls, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, DB, dbTables, GenTypesConst, DateUtil,
  dxPSCore, dxPScxCommon, dxPScxGridLnk, cxPC, dxmdaset, EventRecording,
  uPreferences, uHerdLookup, uGeneralMemo, uProgressIndicator;

type
  TfmVaccineDueOn = class(TfmBaseForm)
    pDateFilter: TPanel;
    deEventDateFrom: TcxDateEdit;
    deEventDateTo: TcxDateEdit;
    lVaccineDateFrom: TcxLabel;
    lVaccineDateTo: TcxLabel;
    btnGetHeaderData: TcxButton;
    dlbPrint: TdxBarLargeButton;
    actPrint: TAction;
    ComponentPrinter: TdxComponentPrinter;
    ComponentPrinterLink: TdxGridReportLink;
    pcVaccines: TcxPageControl;
    tsVaccine: TcxTabSheet;
    tsVaccineReview: TcxTabSheet;
    gVaccineDueOn: TcxGrid;
    gVaccineDueOnDBTableView: TcxGridDBTableView;
    gVaccineDueOnDBTableViewEventDate: TcxGridDBColumn;
    gVaccineDueOnDBTableViewDisease: TcxGridDBColumn;
    gVaccineDueOnDBTableViewVaccine: TcxGridDBColumn;
    gVaccineDueOnDBTableViewCount: TcxGridDBColumn;
    gVaccineDueOnDBTableViewComment: TcxGridDBColumn;
    gVaccineDueOnDBTableViewReminderType: TcxGridDBColumn;
    gVaccineDueOnDBTableViewReminderDate: TcxGridDBColumn;
    gVaccineDueOnLevel: TcxGridLevel;
    gVaccineReviewDBTableView: TcxGridDBTableView;
    gVaccineReviewLevel: TcxGridLevel;
    gVaccineReview: TcxGrid;
    gVaccineReviewDBTableViewEventDate: TcxGridDBColumn;
    gVaccineReviewDBTableViewAnimalNo: TcxGridDBColumn;
    gVaccineReviewDBTableViewNatIDNum: TcxGridDBColumn;
    gVaccineReviewDBTableViewDateOfBirth: TcxGridDBColumn;
    gVaccineReviewDBTableViewBreedCode: TcxGridDBColumn;
    gVaccineReviewDBTableViewLactNo: TcxGridDBColumn;
    gVaccineReviewDBTableViewDisease: TcxGridDBColumn;
    gVaccineReviewDBTableViewDrugName: TcxGridDBColumn;
    gVaccineReviewDBTableViewReminderType: TcxGridDBColumn;
    gVaccineReviewDBTableViewReminderWeeks: TcxGridDBColumn;
    gVaccineReviewDBTableViewSelected: TcxGridDBColumn;
    lNewEventDate: TcxLabel;
    deNewEventDate: TcxDateEdit;
    btnCreateEvents: TcxButton;
    actCreateEvents: TAction;
    blbOptions: TdxBarLargeButton;
    pmOptions: TdxBarPopupMenu;
    pmiShowOnStartup: TdxBarButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnGetHeaderDataClick(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure gVaccineDueOnDBTableViewDblClick(Sender: TObject);
    procedure gVaccineReviewDBTableViewEditing(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      var AAllow: Boolean);
    procedure pcVaccinesChange(Sender: TObject);
    procedure deNewEventDatePropertiesChange(Sender: TObject);
    procedure actCreateEventsExecute(Sender: TObject);
    procedure pmiShowOnStartupClick(Sender: TObject);
    procedure blbOptionsClick(Sender: TObject);
  private
     FHeaderDataTable : TTable;
     FHeaderDataSource : TDataSource;
     FDetailDataTable : TTable;
     FDetailDataSource : TDataSource;
     FDetailDataQuery : TQuery;
     FLookupEventType : TEventType;
     FHerdDosingQueryText : String;
    procedure GetHeaderData;
    procedure GetDetailData(AEventDate : TDateTime; AReminderWeeks : Integer;
       const AVaccineID : Integer = 0; const ADiseaseID : Integer = 0 );
    procedure ReviewAnimals;
    procedure SetupScreen;
    procedure QueryData(AEventDate: TDateTime; const AVaccineID : Integer = 0;
       const ADiseaseID : Integer = 0; const AReminderDays : Integer = 0);
    procedure UpdateDetailTable(AEventDate: TDateTime);
     { Private declarations }
  public
     FHerdDosingQuery : TQuery;
     class procedure ShowForm ( AEventType : TEventType );
     { Public declarations }
  end;

var
  fmVaccineDueOn: TfmVaccineDueOn;

implementation

uses DairyData;

{$R *.DFM}

{ TfmVaccineDueOn }

class procedure TfmVaccineDueOn.ShowForm ( AEventType : TEventType );
begin
   with TfmVaccineDueOn.Create(nil) do
      try
         FLookupEventType := AEventType;
         deEventDateFrom.Date := IncYear(Date,-1);
         deEventDateTo.Date := Date;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmVaccineDueOn.FormCreate(Sender: TObject);
begin
   inherited;
   FHeaderDataTable := TTable.Create(nil);
   with FHeaderDataTable do
      begin
         DatabaseName := AliasName;
         TableName := 'tmpVaccinesHeader';
         FieldDefs.Add('ID',ftAutoInc);
         FieldDefs.Add('EventCount',ftInteger);
         FieldDefs.Add('EventDate',ftDateTime);
         FieldDefs.Add('Disease',ftString,20);
         FieldDefs.Add('DiseaseID',ftInteger);
         FieldDefs.Add('VaccineID',ftInteger);
         FieldDefs.Add('Vaccine',ftString,20);
         FieldDefs.Add('EventDesc',ftString,30);
         FieldDefs.Add('ReminderType',ftString,20);
         FieldDefs.Add('ReminderID',ftInteger);
         FieldDefs.Add('ReminderDays',ftInteger);
         FieldDefs.Add('ReminderDate',ftDateTime);
         CreateTable;
         AddIndex('ID','ID',[ixPrimary]);
      end;

   FDetailDataTable := TTable.Create(nil);
   with FDetailDataTable do
      begin
         DatabaseName := AliasName;
         TableName := 'tmpVaccinesDetail';
         FieldDefs.Add('ID',ftAutoInc);
         FieldDefs.Add('Selected',ftBoolean);
         FieldDefs.Add('EventDate',ftDateTime);
         FieldDefs.Add('AnimalID',ftInteger);
         FieldDefs.Add('AnimalNo',ftString,10);
         FieldDefs.Add('NatIDNum',ftString,20);
         FieldDefs.Add('DateOfBirth',ftDateTime);
         FieldDefs.Add('BreedCode',ftString,6);
         FieldDefs.Add('LactNo',ftInteger);
         FieldDefs.Add('DiseaseID',ftInteger);
         FieldDefs.Add('Disease',ftString,20);
         FieldDefs.Add('DrugID',ftInteger);
         FieldDefs.Add('DrugName',ftString,20);
         FieldDefs.Add('ReminderID',ftInteger);
         FieldDefs.Add('ReminderType',ftString,20);
         FieldDefs.Add('ReminderWeeks',ftInteger);
         CreateTable;
         AddIndex('ID','ID',[ixPrimary]);
      end;

   FHeaderDataSource := TDataSource.Create(nil);
   FDetailDataSource := TDataSource.Create(nil);

   FHeaderDataSource.DataSet := FHeaderDataTable;
   gVaccineDueOnDBTableView.DataController.DataSource := FHeaderDataSource;

   FDetailDataSource.Dataset := FDetailDataTable;
   FDetailDataQuery := TQuery.Create(nil);

   gVaccineReviewDBTableView.DataController.DataSource := nil;
   gVaccineReviewDBTableView.OptionsData.Editing := True;

   pcVaccines.ActivePage := nil;
end;

procedure TfmVaccineDueOn.FormActivate(Sender: TObject);
begin
   inherited;
   actPrint.Enabled := False;
   blbOptions.Enabled := ( FLookupEventType = THerdVaccination );
   pmiShowOnStartup.Down := Preferences.ValueAsBoolean[cGSShowVaccineRemindersOnStartup];

   OnActivate := nil;

   pcVaccines.ActivePage := tsVaccine;
   SetupScreen;
end;

procedure TfmVaccineDueOn.GetHeaderData;
var
   qDataHeader : TQuery;
begin
   FHeaderDataTable.DisableControls;
   gVaccineDueOnDBTableView.DataController.BeginFullUpdate;

   qDataHeader := TQuery.Create(nil);
   qDataHeader.DatabaseName := AliasName;
   qDataHeader.Close;
   qDataHeader.SQL.Clear;
   try
      begin
         FHeaderDataTable.Close;
         FHeaderDataTable.EmptyTable;
         FHeaderDataTable.Open;

         if FLookupEventType = THerdVaccination then
            qDataHeader.SQL.Text := WinData.qHerdVaccineReminders.SQL.Text
         else
            begin
               qDataHeader.SQL.Clear;
               qDataHeader.SQL.Text := WinData.qHerdDosageReminders.SQL.Text;
            end;

         qDataHeader.Params[0].AsDateTime := deEventDateFrom.Date;
         qDataHeader.Params[1].AsDateTime := deEventDateTo.Date;
         qDataHeader.Open;

         with qDataHeader do
            try
               while ( not(Eof) ) do
                  begin
                     if ( FieldByName('EventCount').AsInteger > 0 ) then
                        try
                           FHeaderDataTable.Append;
                           FHeaderDataTable.FieldByName('EventCount').AsInteger := FieldByName('EventCount').AsInteger;
                           FHeaderDataTable.FieldByName('EventDate').AsDateTime := FieldByName('EventDate').AsDateTime;
                           FHeaderDataTable.FieldByName('VaccineID').AsInteger := FieldByName('DrugUsedID').AsInteger;
                           FHeaderDataTable.FieldByName('Vaccine').AsString := FieldByName('DrugUsed').AsString;
                           FHeaderDataTable.FieldByName('Disease').AsString := FieldByName('Disease').AsString;
                           FHeaderDataTable.FieldByName('DiseaseID').AsInteger := FieldByName('DiseaseID').AsInteger;
                           FHeaderDataTable.FieldByName('EventDesc').AsString := FieldByName('EventDesc').AsString;
                           FHeaderDataTable.FieldByName('ReminderType').AsString := FieldByName('ReminderType').AsString;
                           FHeaderDataTable.FieldByName('ReminderID').AsInteger := FieldByName('RTID').AsInteger;
                           FHeaderDataTable.FieldByName('ReminderDays').AsInteger := FieldByName('ReportInDays').AsInteger;
                           FHeaderDataTable.FieldByName('ReminderDate').AsDateTime := FieldByName('EventDate').AsDateTime + FieldByName('ReportInDays').AsInteger;
                           FHeaderDataTable.Post;
                        except
                           FHeaderDataTable.Cancel;
                        end;
                     Next;
                  end;
            finally
               Free;
            end;
      end;

   finally
      FHeaderDataTable.EnableControls;
      gVaccineDueOnDBTableView.DataController.EndFullUpdate;
      if ( FHeaderDataTable.RecordCount > 0 ) then
         begin
            actPrint.Enabled := True;
            gVaccineDueOnDBTableView.Controller.FocusedRowIndex := 0;
         end;
   end;
end;

procedure TfmVaccineDueOn.QueryData(AEventDate: TDateTime;
   const AVaccineID : Integer = 0; const ADiseaseID : Integer = 0;
   const AReminderDays : Integer = 0);
begin
   with FDetailDataQuery do
      begin
         DatabaseName := AliasName;
         Close;
         SQL.Clear;
         SQL.Add('SELECT A.ID AnimalID, A.AnimalNo, A.NatIDNum, A.DateOfBirth, A.LactNo,');
         SQL.Add('	 B.Code BreedCode,');
         SQL.Add('       E.EventDate,');
         SQL.Add('       H.DrugUsed DrugID,');
         if ADiseaseID > 0 then
            begin
               SQL.Add('       H.HealthCode DiseaseID,');
               SQL.Add('       GV.Description Disease,');
            end;
         SQL.Add('       H.ReportID ReminderID,');
         SQL.Add('       G.Description ReminderType,');
         SQL.Add('	 M.Name DrugName');
         SQL.Add('FROM Animals A');
         SQL.Add('INNER JOIN Events E On (E.AnimalID = A.ID)');
         SQL.Add('INNER JOIN Health H On (H.EventID = E.ID)');
         SQL.Add('LEFT JOIN Breeds B On (B.ID = A.PrimaryBreed)');
         if ADiseaseID > 0 then
            SQL.Add('LEFT JOIN Genlook GV On (GV.ID = H.HealthCode)');
         SQL.Add('LEFT JOIN Genlook G On (G.ID = H.ReportID)');
         SQL.Add('LEFT JOIN Medicine M On (M.ID = H.DrugUsed)');

         if FLookupEventType = THerdVaccination then
            begin
               SQL.Add('WHERE (E.EventType = '+IntToStr(CHerdVaccination)+') ');
               SQL.Add('AND   (H.HealthCode = :ALookupID)');
               SQL.Add('AND   (E.EventDate = :AEventDate)');
               Params[0].AsInteger := ADiseaseID;
            end
         else
            begin
               SQL.Add('WHERE (E.EventType = '+IntToStr(CHealthEvent)+') ');
               SQL.Add('AND   (H.DrugUsed = :ALookupID)');
               SQL.Add('AND   (E.EventDate = :AEventDate)');
               Params[0].AsInteger := AVaccineID;
            end;

         //   19/01/21 [V5.9 R8.0] /MK Bug Fix - Zero ReminderDays is saved into the database as Null. The query needs to check for that also.
         if ( AReminderDays > 0 ) then
            SQL.Add('AND (H.ReportInDays = '+IntToStr(AReminderDays)+')')
         else
            SQL.Add('AND ((H.ReportInDays = 0) OR (H.ReportInDays IS NULL))');

         Params[1].AsDateTime := AEventDate;

         Open;
      end;
end;

procedure TfmVaccineDueOn.GetDetailData(AEventDate : TDateTime; AReminderWeeks : Integer;
   const AVaccineID : Integer = 0; const ADiseaseID : Integer = 0 );
var
   iReminderDays : Integer;
begin
   FDetailDataTable.Close;
   FDetailDataTable.EmptyTable;
   FDetailDataTable.Open;

   gVaccineReviewDBTableView.DataController.DataSource := nil;

   QueryData(AEventDate, AVaccineID, ADiseaseID, FHeaderDataTable.FieldByName('ReminderDays').AsInteger);

   FDetailDataQuery.First;
   while ( not(FDetailDataQuery.Eof) ) do
      begin
         try
            FDetailDataTable.Append;
            FDetailDataTable.FieldByName('Selected').AsBoolean := True;
            FDetailDataTable.FieldByName('EventDate').AsDateTime := FDetailDataQuery.FieldByName('EventDate').AsDateTime;
            FDetailDataTable.FieldByName('AnimalID').AsInteger := FDetailDataQuery.FieldByName('AnimalID').AsInteger;
            FDetailDataTable.FieldByName('AnimalNo').AsString := FDetailDataQuery.FieldByName('AnimalNo').AsString;
            FDetailDataTable.FieldByName('NatIDNum').AsString := FDetailDataQuery.FieldByName('NatIDNum').AsString;
            FDetailDataTable.FieldByName('DateOfBirth').AsDateTime := FDetailDataQuery.FieldByName('DateOfBirth').AsDateTime;
            FDetailDataTable.FieldByName('BreedCode').AsString := FDetailDataQuery.FieldByName('BreedCode').AsString;
            FDetailDataTable.FieldByName('LactNo').AsInteger := FDetailDataQuery.FieldByName('LactNo').AsInteger;

            if ( ADiseaseID > 0 ) then
               FDetailDataTable.FieldByName('DiseaseID').AsInteger := FDetailDataQuery.FieldByName('DiseaseID').AsInteger;
            if ( ADiseaseID > 0 ) then
               FDetailDataTable.FieldByName('Disease').AsString := FDetailDataQuery.FieldByName('Disease').AsString;

            FDetailDataTable.FieldByName('ReminderID').AsInteger := FDetailDataQuery.FieldByName('ReminderID').AsInteger;
            FDetailDataTable.FieldByName('ReminderType').AsString := FDetailDataQuery.FieldByName('ReminderType').AsString;

            FDetailDataTable.FieldByName('DrugID').AsInteger := FDetailDataQuery.FieldByName('DrugID').AsInteger;
            FDetailDataTable.FieldByName('DrugName').AsString := FDetailDataQuery.FieldByName('DrugName').AsString;
            FDetailDataTable.FieldByName('ReminderWeeks').AsInteger := AReminderWeeks;
            FDetailDataTable.Post;
         except
            FDetailDataTable.Cancel;
         end;

         FDetailDataQuery.Next;
      end;

   FDetailDataQuery.Close;

   FDetailDataTable.Close;
   FDetailDataTable.Open;

   gVaccineReviewDBTableView.DataController.DataSource := FDetailDataSource;

   FDetailDataTable.First;
end;

procedure TfmVaccineDueOn.btnGetHeaderDataClick(Sender: TObject);
begin
   inherited;
   GetHeaderData;
end;

procedure TfmVaccineDueOn.actPrintExecute(Sender: TObject);
begin
   inherited;
   if ( FHeaderDataTable.RecordCount > 0 ) or ( FDetailDataTable.RecordCount > 0 ) then
      begin
         if Length(ComponentPrinter.PrintTitle) = 0 then
            ComponentPrinter.PrintTitle := 'Kingswood Grid Print';
         ComponentPrinterLink.Preview;
      end;
end;

procedure TfmVaccineDueOn.gVaccineDueOnDBTableViewDblClick(
  Sender: TObject);
begin
   ReviewAnimals;
end;

procedure TfmVaccineDueOn.pcVaccinesChange(Sender: TObject);
begin
   inherited;
   btnCreateEvents.Enabled := True;
   deNewEventDate.Enabled := True;
   if pcVaccines.ActivePage = tsVaccine then
      begin
         ComponentPrinterLink.Component := gVaccineDueOn;
         GetHeaderData;
         StatusBar.Panels.Clear;
      end
   else if pcVaccines.ActivePage = tsVaccineReview then
      begin
         ReviewAnimals;
         ComponentPrinterLink.Component := gVaccineReview;
         lNewEventDate.Left := 5;
         deNewEventDate.Left := 83;
         deNewEventDate.Clear;
         btnCreateEvents.Left := 215;

         if FHeaderDataTable.FieldByName('ReminderDate').AsDateTime > 0 then
            begin
               if ( FHeaderDataTable.FieldByName('EventDate').AsDateTime = Date ) then
                  begin
                     deNewEventDate.Clear;
                     deNewEventDate.Enabled := False;
                     btnCreateEvents.Enabled := False;
                     UpdateDetailTable(Date);
                  end
               else
                  deNewEventDate.Date := FHeaderDataTable.FieldByName('ReminderDate').AsDateTime;
                  StatusBar.Panels.Add;
                  StatusBar.Panels[0].Text := Format('Animal Count : %d',[FDetailDataTable.RecordCount]);
                  StatusBar.Panels[0].Width := Length(StatusBar.Panels[0].Text)+2;
            end;

      end;
   SetupScreen;
end;

procedure TfmVaccineDueOn.ReviewAnimals;
var
   dEventDate,
   dReminderDate : TDateTime;
   iDiseaseID, iVaccineID, iReminderWeeks : Integer;
begin
   inherited;
   dEventDate := FHeaderDataTable.FieldByName('EventDate').AsDateTime;

   iDiseaseID := FHeaderDataTable.FieldByName('DiseaseID').AsInteger;
   iVaccineID := FHeaderDataTable.FieldByName('VaccineID').AsInteger;
   if ( FLookupEventType = THerdVaccination ) then
      iReminderWeeks := ( FHeaderDataTable.FieldByName('ReminderDays').AsInteger div 7 )
   else
      iReminderWeeks := FHeaderDataTable.FieldByName('ReminderDays').AsInteger;

   GetDetailData(dEventDate,iReminderWeeks,iVaccineID,iDiseaseID);
   pcVaccines.ActivePage := tsVaccineReview;
end;

procedure TfmVaccineDueOn.gVaccineReviewDBTableViewEditing(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
begin
   inherited;
   if AItem.Index = gVaccineReviewDBTableViewSelected.Index then
      AAllow := True
   else
      AAllow := False;
end;

procedure TfmVaccineDueOn.deNewEventDatePropertiesChange(Sender: TObject);
begin
   inherited;
   if ( btnCreateEvents.Enabled ) then
      if ( deNewEventDate.Date > Date ) then
         begin
            if ( MessageDlg('The repeat date is not yet due.'+cCRLF+
                            'Do you want to go ahead with todays date.',mtInformation,[mbYes,mbNo],0) = mrNo ) then
               begin
                  deNewEventDate.Enabled := False;
                  btnCreateEvents.Enabled := False;
                  Exit;
               end
            else
               deNewEventDate.Date := Date;
         end
      else
         begin
            UpdateDetailTable(deNewEventDate.Date);
         end;
end;

procedure TfmVaccineDueOn.UpdateDetailTable ( AEventDate : TDateTime );
begin
   //   05/12/12 [V5.1 R3.4] /MK Bug Fix - Close table and then execute query instead of execute query and refresh table.
   gVaccineReviewDBTableView.DataController.BeginFullUpdate;
   FDetailDataTable.Close;

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('UPDATE '+FDetailDataTable.TableName+' ');
         SQL.Add('SET EventDate = :EventDate');
         Params[0].AsDateTime := AEventDate;
         ExecSQL;
      finally
         Free;
      end;

   FDetailDataTable.Open;
   gVaccineReviewDBTableView.DataController.EndFullUpdate;
   gVaccineReviewDBTableView.DataController.DataSource := FDetailDataSource;
end;

procedure TfmVaccineDueOn.actCreateEventsExecute(Sender: TObject);
var
   VaccinationEvent : THealthEvent;
   iRecsToSaveCount,
   SavedCount : Integer;
   SelectedCount : Integer;
   HealthComment : String;
   dLeftHerdDate : TDateTime;
   slMemoText : TStringList;

   function GetSelectedCount : Integer;
   begin
      Result := 0;
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT Count(ID)');
            SQL.Add('FROM '+FDetailDataTable.TableName+'');
            SQL.Add('WHERE Selected = TRUE');
            try
               Open;
               Result := Fields[0].AsInteger;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;
   end;

begin
   inherited;
   SavedCount := 0;
   SelectedCount := GetSelectedCount;
   slMemoText := TStringList.Create();
   try
      //   15/04/15 [V5.4 R3.8] /MK Bug Fix - Show message based on selected records on the grid and not the total records in the grid.
      if ( MessageDlg(Format('Do you want to create %d events?',[GetSelectedCount]),
                      mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
         try
            gVaccineReviewDBTableView.DataController.BeginFullUpdate;

            VaccinationEvent := THealthEvent.Create('TVaccine');
            FDetailDataTable.First;

            if ( FLookupEventType = THealth ) then
               begin
                  if ( not(HerdLookup.qDrugList.Active) ) then
                     HerdLookup.qDrugList.Active := True;
                  if FDetailDataTable.FieldByName('DrugId').AsInteger > 0 then
                     if ( HerdLookup.qDrugList.Locate('ID', FDetailDataTable.FieldByName('DrugId').AsInteger,[]) ) then
                        HealthComment := 'Health - ' + HerdLookup.qDrugList.FieldByName('DrugCode').AsString;
               end;

            ShowProgressIndicator('Creating Repeat Vaccination Events',1,FDetailDataTable.RecordCount,1);
            ProgressIndicator.Max := FDetailDataTable.RecordCount;
            ProgressIndicator.Position := 1;
            Application.ProcessMessages;
            Update;

            FDetailDataTable.First;
            while ( not(FDetailDataTable.Eof) ) do
               begin
                  dLeftHerdDate := WinData.FEventDataHelper.GetAnimalLeftHerdDate(FDetailDataTable.FieldByName('AnimalId').AsInteger);
                  if ( FDetailDataTable.FieldByName('Selected').AsBoolean ) and ( (dLeftHerdDate = 0) or (dLeftHerdDate > FDetailDataTable.FieldByName('EventDate').AsDateTime) ) then
                     begin
                        with VaccinationEvent do
                           try
                              Append;
                              EventType := FLookupEventType;
                              AnimalID := FDetailDataTable.FieldByName('AnimalId').AsInteger;
                              AnimalLactNo := FDetailDataTable.FieldByName('LactNo').AsInteger;
                              AnimalHerdID := WinData.DefaultHerdID;
                              EventDate := FDetailDataTable.FieldByName('EventDate').AsDateTime;
                              EventSource := sRepeatVaccination;
                              DrugUsed := FDetailDataTable.FieldByName('DrugID').AsInteger;
                              if FDetailDataTable.FieldByName('DrugID').AsInteger > 0 then
                                 RateApplic := 1;
                              HealthCode := FDetailDataTable.FieldByName('DiseaseID').AsInteger;
                              ReportID := FDetailDataTable.FieldByName('ReminderID').AsInteger;

                              if ( FLookupEventType = THerdVaccination ) then
                                 begin
                                    ReportInDays := ( FDetailDataTable.FieldByName('ReminderWeeks').AsInteger * 7 );
                                    EventComment := FDetailDataTable.FieldByName('Disease').AsString + ' Vaccination';
                                 end
                              else
                                 begin
                                    ReportInDays := FDetailDataTable.FieldByName('ReminderWeeks').AsInteger;
                                    EventComment := HealthComment;
                                 end;
                              //   28/08/13 [V5.2 R0.2] /MK Change - Added Manual Comment Boolean.
                              ManualComment := False;
                              Post;
                              Inc(SavedCount);

                           except
                              on e : Exception do
                                 begin
                                    ShowMessage(e.Message);
                                    Cancel;
                                 end;
                           end;
                     end;
                  ProgressIndicator.Position := ProgressIndicator.Position + 1;
                  Application.ProcessMessages;
                  Update;
                  FDetailDataTable.Next;
               end;
         finally
            ProgressIndicator.Close;
            FreeAndNil(VaccinationEvent);
            gVaccineReviewDBTableView.DataController.EndFullUpdate;
            if SavedCount > 0 then
               begin
                  slMemoText.Add(IntToStr(SavedCount)+' vaccination event(s) saved.');
                  if ( SavedCount < SelectedCount ) then
                     slMemoText.Add(cCRLFx2+
                                    IntToStr(SelectedCount - SavedCount)+' vaccination event(s) NOT saved.'+cCRLF+
                                    'Events cannot be saved for animals that left the herd before the vaccination date.');
                  TfmGeneralMemo.ShowTheForm(slMemoText,mtRepeatVaccine);
               end;
         end
      else
         Exit;
   finally
      if ( slMemoText <> nil ) then
         FreeAndNil(slMemoText);
   end;
end;

procedure TfmvaccineDueOn.SetupScreen;
begin
   lVaccineDateFrom.Visible := ( pcVaccines.ActivePage = tsVaccine );
   deEventDateFrom.Visible := ( lVaccineDateFrom.Visible );
   lVaccineDateTo.Visible := ( lVaccineDateFrom.Visible );
   deEventDateTo.Visible := ( lVaccineDateFrom.Visible );
   btnGetHeaderData.Visible := ( lVaccineDateFrom.Visible );
   lNewEventDate.Visible := ( pcVaccines.ActivePage = tsVaccineReview );
   deNewEventDate.Visible := ( lNewEventDate.Visible );
   btnCreateEvents.Visible := ( lNewEventDate.Visible );

   if FLookupEventType = THerdVaccination then
      begin
         Caption := 'Herd Vaccination Report';
         tsVaccine.Caption := 'Vaccinations';
         gVaccineDueOnDBTableViewDisease.Caption := 'Disease';
         gVaccineDueOnDBTableViewVaccine.Caption := 'Vaccine';
         gVaccineReviewDBTableViewDisease.Caption := 'Disease';
         gVaccineReviewDBTableViewDrugName.Caption := 'Vaccine';
         gVaccineReviewDBTableViewReminderWeeks.Caption := 'Weeks to Remind';
      end
   else
      begin
         Caption := 'Herd Dosing Review';
         tsVaccine.Caption := 'Dosings';
         gVaccineDueOnDBTableViewDisease.Caption := 'Health Code';
         gVaccineDueOnDBTableViewVaccine.Caption := 'Drug Used';
         gVaccineReviewDBTableViewDisease.Caption := 'Health Code';
         gVaccineReviewDBTableViewDrugName.Caption := 'Drug Used';
         gVaccineReviewDBTableViewReminderWeeks.Caption := 'Days to Remind';
      end;
end;

procedure TfmVaccineDueOn.pmiShowOnStartupClick(Sender: TObject);
begin
   inherited;
   Preferences.ValueAsBoolean[cGSShowVaccineRemindersOnStartup] := pmiShowOnStartup.Down;
end;

procedure TfmVaccineDueOn.blbOptionsClick(Sender: TObject);
begin
   inherited;
   pmOptions.PopupFromCursorPos;
end;

procedure TfmVaccineDueOn.FormDestroy(Sender: TObject);
begin
   inherited;
   FHeaderDataTable.Close;
   FHeaderDataTable.DeleteTable;
   FHeaderDataTable.Free;
   FHeaderDataSource.Free;

   FDetailDataQuery.Free;

   FDetailDataTable.Close;
   FDetailDataTable.DeleteTable;
   FDetailDataTable.Free;
   FDetailDataSource.Free;
end;

end.
