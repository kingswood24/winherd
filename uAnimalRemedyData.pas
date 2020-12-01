{
   15/05/14 [V5.3 R0.3] /MK Bug Fix - If NoDays and NoTimes is null then TreatmentCount + 1.

   16/05/14 [V5.3 R0.4] /MK Change - GetMediGroupIDByMediType - Allow for other type descriptions.

   02/11/15 [V5.4 R9.9] /MK Change - VetLinkDataExists - This function is defined by whether drug purchases have been imported
                                     but not allocated. The check for the DrugPurchID and DrugID has to be enforced here.

   16/11/15 [V5.5 R0.6] /MK Bug Fix - GetNoTreatedMedicinesWithNullTypesOrNullWithdrawal - SQL to insert animals to temp table should check if drugs are in health.db first.

   24/11/16 [V5.6 R3.5] /MK Change - GetNoTreatedMedicinesWithNullTypesOrNullWithdrawal - Added the VPA Number to this check.

   19/12/16 [V5.6 R3.8] /MK Change - GetNoTreatedMedicinesWithNullTypesOrNullWithdrawal - Only require VPA Number where the user has the App.

   24/01/17 [V5.6 R4.2] /MK Change - GetNoTreatedMedicinesWithNullTypesOrNullWithdrawal- Add primary check for InUse drugs - John Wynne request.

   17/07/17 [V5.6 R9.2] /MK Change - GetNoTreatedMedicinesWithNullTypesOrNullWithdrawal - Removed primary check for InUse and added primary check for drugs used in the last 18 months - GL request.
                                                                                        - Added check for VPA number to secondary check i.e cbIncludeMedicines is not ticked.
}

unit uAnimalRemedyData;

interface

uses
   Classes, db, dbTables, DateUtil, SysUtils, GenTypesConst, Dialogs,
   uSPParser, KRoutines, KDBRoutines, uFarmSyncSettings, uHerdLookup;

type

   TMedicineType = ( mtAntibiotic, mtDoses, mtVaccines, mtTubes, mtOther);

   TNoTreatmentsByMedicineType = record
      NoAntibiotics,
      NoDoses,
      NoVaccines,
      NoTubes,
      NoOther : Integer;
   end;

   TIncludeEventsArray = array of Integer;

   TAnimalRemedyData = class
   private
      FDateFrom,
      FDateTo : TDateTime;
      FIncludeEventsArray : TIncludeEventsArray;
      FHerdID : Integer;
      FTempHealth : TTable;
      FQGetData : TQuery;
      FSLMediGroups : TStringList;
      procedure BuildData;
      function GetNONEHerdID: Integer;
   public
      constructor Create ( ADateFrom, ADateTo : TDateTime;
         AEventTypeArrary : TIncludeEventsArray; AHerdID : Integer );
      destructor Destroy; override;
      function GetNoTreatmentsByMedicineType : TNoTreatmentsByMedicineType;
      function GetNoTreatedMedicinesWithNullTypesOrNullWithdrawal : Integer;
      function GetMediGroupIDByMediType ( AMediType : TMedicineType ) : Integer;
   end;

   function VetLinkDataExists : Boolean;

implementation

{ TBordBiaInspectorGetInfo }

constructor TAnimalRemedyData.Create(ADateFrom, ADateTo: TDateTime;
  AEventTypeArrary: TIncludeEventsArray; AHerdID : Integer);
begin
   FDateFrom := ADateFrom;
   FDateTo := ADateTo;
   FIncludeEventsArray := AEventTypeArrary;
   FHerdID := AHerdID;

   FQGetData := TQuery.Create(nil);

   FTempHealth := TTable.Create(nil);
   with FTempHealth do
      try
         DatabaseName := AliasName;
         TableName := 'TempAnimalRemedyData';
         with FieldDefs do
            begin
               Add('AID',ftInteger);
               Add('AnimalNo',ftString,10);
               Add('SortAnimalNo',ftString,10);
               Add('NatIDNum',ftString,20);
               Add('SortNatID',ftString,20);
               Add('EventDate',ftDate);
               Add('EventDesc',ftString,40);
               Add('EventType',ftInteger);
               Add('RateApplic',ftfloat);
               Add('DoseUnitUsed',ftfloat);
               Add('DrugID',ftInteger);
               Add('DrugName',ftString,40);
               Add('MediGroup',ftInteger);
               Add('AdMinByID',ftInteger);
               Add('ApplicMethod',ftInteger);
               Add('DrugPurchID',ftInteger);
               Add('NoDays',ftInteger);
               Add('NoTimes',ftInteger);
               Add('MeatDays',ftFloat);
               Add('MilkDays',ftInteger);
               Add('OtherDays',ftInteger);
               Add('ReportID',ftInteger);
               Add('DoseUnit',ftString,6);
               Add('FarmCode',ftInteger);
               Add('BatchNo',ftString,30);
               Add('PrescribedByID',ftInteger);
               Add('HealthEventID',ftInteger);
            end;
         CreateTable;
      except

      end;

   BuildData;
end;

procedure TAnimalRemedyData.BuildData;
begin
   FSLMediGroups := TStringList.Create;

   with FQGetData do
      begin
         DatabaseName := AliasName;
         with SQL do
            begin
               Clear;
               Add('SELECT ID, Upper(Description)');
               Add('FROM GenLook');
               Add('WHERE ListType = "'+IntToStr(LMedicineGroup)+'"');
               try
                  Open;
                  First;
                  while ( not(Eof) ) do
                     begin
                        FSLMediGroups.Add(Fields[1].AsString+','+IntToStr(Fields[0].AsInteger));
                        Next;
                     end;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;

               Clear;
               Add('INSERT INTO '+FTempHealth.TableName+' (AID, AnimalNo, SortAnimalNo, NatIDNum, SortNatID,');
               Add('EventDate, EventDesc, EventType, RateApplic, DoseUnitUsed, DrugID, DrugName, MediGroup, AdMinByID, ApplicMethod, DrugPurchID,');
               Add('NoDays, NoTimes, MeatDays, MilkDays, OtherDays, ReportID,');
               Add('DoseUnit, FarmCode, BatchNo, PrescribedByID, HealthEventID)');
               Add('SELECT DISTINCT (A.ID), A.AnimalNo, A.SortAnimalNo, A.NatIDNum, A.SortNatID,');
               Add('E.EventDate, E.EventDesc, E.EventType, H.RateApplic, ((H.DoseUnitUsed/H.PurchUnitUsed) * H.RateApplic) DoseUnitUsed, M.ID, M.Name, M.MediGroup,');
               Add('H.AdMinBy, H.ApplicMethod, H.DrugPurchID, H.NoDays, H.NoTimes, M.WithDrawal, M.MilkWithDrawal, M.OtherWithDrawal,');
               Add('H.ReportID, U.UnitCode, H.FarmCode,');
               Add('H.DrugBatchNo, H.VetPresc,');
               Add('H.EventID HealthEventID');
               Add('FROM Animals A');
               Add('LEFT JOIN Events E on (E.AnimalID = A.ID)');
               Add('LEFT JOIN Health H on (H.EventID = E.ID)');
               Add('LEFT JOIN Medicine M on (M.ID = H.DrugUsed)');
               Add('LEFT JOIN Units U on (M.DoseUnit = U.ID)');
               Add('WHERE ( NOT (A.HerdID = ' + IntToStr(GetNONEHerdID) + ') )');
               Add('AND   ( A.AnimalDeleted = FALSE)');
               Add('AND   ( A.HerdID = ' + IntToStr(FHerdID) + ')');
               Add('AND   ( EventDate BETWEEN "'+FormatDateTime(cUSDateStyle,FDateFrom)+'" AND "'+FormatDateTime(cUSDateStyle,FDateTo)+'" )');
               Add('AND   ( EventType IN '+ IntArrayToSQLInString(FIncludeEventsArray) +' ) ');
               try
                  ExecSQL;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
            end;
      end;
end;

function TAnimalRemedyData.GetNONEHerdID : Integer;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID');
         SQL.Add('FROM Owners');
         SQL.Add('WHERE Upper(Name) = "NONE"');
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

function TAnimalRemedyData.GetNoTreatmentsByMedicineType : TNoTreatmentsByMedicineType;
var
   Parser : TSPParser;
   i,
   TreatmentCount : Integer;
begin
   Result.NoAntibiotics := 0;
   Result.NoDoses := 0;
   Result.NoVaccines := 0;
   Result.NoTubes := 0;
   Result.NoOther := 0;

   Parser := TSPParser.Create(nil);
   Parser.Sepchar := ',';

   with FQGetData do
      begin
         for i := 0 to FSLMediGroups.Count-1 do
            begin
               Parser.Parse(FSLMediGroups.Strings[i]);

               SQL.Clear;
               SQL.Add('SELECT T.EventDate, T.DrugID, T.RateApplic, T.NoTimes, T.NoDays');
               SQL.Add('FROM '+FTempHealth.TableName+' T');
               SQL.Add('LEFT JOIN Medicine M ON (M.ID = T.DrugID)');
               SQL.Add('WHERE ( MediGroup = '+Parser.Fields[2]+' ) ');
               if ( Parser.Fields[1] <> 'ANTIBIOTIC' ) then
                  SQL.Add('GROUP By T.EventDate, T.DrugID, T.RateApplic, T.NoTimes, T.NoDays');

               try
                  Open;
                  TreatmentCount := 0;
                  if ( RecordCount > 0 ) then
                     begin
                        First;
                        while ( not(Eof) ) do
                           begin
                              //   15/05/14 [V5.3 R0.3] /MK Bug Fix - If NoDays and NoTimes is null then TreatmentCount + 1.
                              if ( Fields[3].AsVariant = Null ) and ( Fields[4].AsVariant = Null ) then
                                 TreatmentCount := TreatmentCount + 1
                              else
                                 TreatmentCount := TreatmentCount + (Fields[3].AsInteger * Fields[4].AsInteger);
                              Next;
                           end;

                        if ( Parser.Fields[1] = 'ANTIBIOTIC' ) then
                           Result.NoAntibiotics := TreatmentCount
                        else if ( Parser.Fields[1] = 'DOSE' ) then
                           Result.NoDoses := TreatmentCount
                        else if ( Parser.Fields[1] = 'VACCINE' ) then
                           Result.NoVaccines := TreatmentCount
                        else if ( Parser.Fields[1] = 'TUBE' ) then
                           Result.NoTubes := TreatmentCount
                        else if ( Parser.Fields[1] = 'OTHER' ) then
                           Result.NoOther := TreatmentCount;

                     end;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;

            end;
   end;
end;

function TAnimalRemedyData.GetNoTreatedMedicinesWithNullTypesOrNullWithdrawal : Integer;
var
   qGetNoMedicines : TQuery;
begin
   Result := 0;
   qGetNoMedicines := TQuery.Create(nil);
   with qGetNoMedicines do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID');
         SQL.Add('FROM Medicine');
         SQL.Add('WHERE (ID IN (SELECT DISTINCT(DrugUsed)');
         SQL.Add('              FROM Health');
         SQL.Add('              WHERE EventID IN (SELECT ID');
         SQL.Add('                                FROM Events');
         SQL.Add('                                WHERE EventType IN ('+IntToStr(CDryOffEvent)+', '+IntToStr(CHealthEvent)+', '+IntToStr(CHerdVaccination)+')');
         SQL.Add('                                AND   EventDate >= "'+FormatDateTime(cUSDateStyle,IncMonth(Date,-18))+'")))');
         SQL.Add('AND   ( ((VPANo = "") OR (VPANo IS NULL)) OR');
         SQL.Add('        ( (MediGroup IS NULL) OR ');
         SQL.Add('	   ((Withdrawal IS NULL) AND (MilkWithDrawal IS NULL))');
         if ( HerdLookup.HerdOwnerData.OrganicHerd ) then
            SQL.Add('	 OR ((OrganicMeatWithdrawal IS NULL) AND (OrganicMilkWithdrawal IS NULL))');
         SQL.Add('))');
         try
            Open;
            if ( RecordCount > 0 ) then
               Result := RecordCount;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function TAnimalRemedyData.GetMediGroupIDByMediType (AMediType : TMedicineType) : Integer;
begin
   with GetQuery do
      try
         Result := 0;
         SQL.Add('SELECT ID');
         SQL.Add('FROM GenLook');
         SQL.Add('WHERE (ListType = '+IntToStr(LMedicineGroup)+')');
         if ( AMediType = mtAntibiotic ) then
            SQL.Add('AND   (Upper(Description) = "ANTIBIOTIC")')
         else if ( AMediType = mtOther ) then
            SQL.Add('AND   (Upper(Description) = "OTHER")');
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

destructor TAnimalRemedyData.Destroy;
begin
   inherited;
   if FQGetData.Active then
      FQGetData.Close;
   FreeAndNil(FQGetData);
   if FTempHealth.Active then
      FTempHealth.Close;
   FTempHealth.DeleteTable;
   FreeAndNil(FTempHealth);
end;

//   02/11/15 [V5.4 R9.9] /MK Change - This function is defined by whether drug purchases have been imported
//                                     but not allocated. The check for the DrugPurchID and DrugID has to be enforced here.
function VetLinkDataExists : Boolean;
begin
   Result := False;
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'DrugsRegImportDetail';
         if ( Exists ) then
            with TQuery.Create(nil) do
               try
                  DatabaseName := AliasName;
                  SQL.Clear;
                  SQL.Add('SELECT *');
                  SQL.Add('FROM DrugsRegImportDetail');
                  SQL.Add('WHERE ( DrugID > 0 AND DrugPurchID > 0 )');
                  try
                     Open;
                     Result := ( RecordCount > 0 );
                     Close;
                  except
                     on e : Exception do
                        ShowMessage(e.Message);
                  end;
               finally
                  Free;
               end;
      finally
         Free;
      end;
end;

end.
