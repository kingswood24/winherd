{
   SP 16/12/2008 bug fix, procedure TBreedingData.GetActionData; RepType = "H"

   06/12/10 [V4.0 R6.0] /MK Bug Fix - Output Reminder Results - Repeat PD - Removed Check For LactNo > 0 (Zero Lact Heifers).

   06/12/10 [V4.0 R6.0] /MK Bug Fix - Output Due Results - DueDryOff - Do No Check For Zero Lactation Heifers.

   31/10/12 [V5.1 R0.7] /MK Bug Fix - CalcDueDryOffCalve- If IsPreg is "No" then DueCalveDate = 0.

   06/01/14 [V5.2 R7.5] /MK Bug Fix - If IsPreg = "No" then animals were set to not include.
                                      Include should be left out as Include is not used in alDueToCalve SQL to establish
                                      whether animals should appear on the report or not.

   07/12/16 [V5.5 R2.1] /MK Change - OutputResult - ReminderListingType - Only show cows that are not pregnant and don't have a To Be Culled event - TGM/GL request.
                                                  - WarningListingType - Only inlcude animals that don't have a To Be Culled date - TGM/GL request.

   05/02/21 [V5.9 R8.1] /MK Bug Fix - TBreedingData.Create - Temp Breeding Tables were not created before report is built.
}

unit uActionWarningReminders;

interface

uses
   Windows, Classes, SysUtils, db, dbtables, uProgressIndicator, Dialogs,
   ComCtrls, DairyData, kRoutines, uBreedingDataHelper;

type
   TActionListingType = (alFirstServiceWith4Days, alRepeatServiceWith4Days, alDueToDryOff, alDueToCalve );
   TWarningListingType = (wlNoHeatServiceXDaysCalved, wlNoHeatServiceXPeriodDaysCalved, wlCheckNoServicesRecorded, wlMissedHeatUnusualCycle );
   TReminderListingType = (rlCalvedLessThanVWP, rlConsiderPDAfterServiceXDays, rlCowsNotPregnant);

   TBreedingData = class(TObject)
   private
      GenQuery : TQuery;
      TempTable : TTable;
      FShowProgress: Boolean;
      FHerdID: Integer;
      FFromDate: TDateTime;
      FToDate: TDateTime;
      FDOBCutOffDate: TDateTime;
      FIncludeOverDue: Boolean;
      FDaysFirstService: Integer;
      FAnimalOutput: String;
      FNoHeatServiceDaysCalved: Integer;
      FNoHeatServicePeriodDaysCalvedBegin: Integer;
      FNoHeatServicePeriodDaysCalvedEnd: Integer;
      FCheckNoServicesRecorded: Integer;
      FVoluntaryWaitingPeriod: Integer;
      FConsiderPDAfterServiceXDays: Integer;
      FProgressBar: TProgressBar;
      FDaysforDryingOff: Integer;
      function GetNoneHerdID: Integer;
      function GetToday: TDateTime;
    procedure SetProgressBar(const Value: TProgressBar);
   protected
      FBreedingDataHelper : TBreedingDataHelper;
      procedure EmptyTempTable;
      procedure GetRawData;
      procedure InitializeTempTable;
      procedure GetActionData;
      procedure CalcWarningData;
   public
      constructor create;
      destructor Destroy;override;

      procedure Execute;

      function OutputResult(ADueListingType: TActionListingType) : string;overload;
      function OutputResult(AWarningListingType: TWarningListingType) : string;overload;
      function OutputResult(AReminderListingType: TReminderListingType) : string;overload;

      property DOBCutOffDate : TDateTime read FDOBCutOffDate write FDOBCutOffDate;
      property HerdID : Integer read FHerdID write FHerdID;
      property ShowProgress : Boolean read FShowProgress write FShowProgress;
      property FromDate : TDateTime read FFromDate write FFromDate;
      property ToDate : TDateTime read FToDate write FToDate;
      property NoneHerdID : Integer read GetNoneHerdID;
      property Today : TDateTime read GetToday;
      { Service }
      property DaysFirstService : Integer read FDaysFirstService write FDaysFirstService default 42;
      property DaysforDryingOff : Integer read FDaysforDryingOff write FDaysforDryingOff default 70;
      property IncludeOverDue : Boolean read FIncludeOverDue write FIncludeOverDue;
      property AnimalOutput : String read FAnimalOutput write FAnimalOutput;

      property NoHeatServiceDaysCalved : Integer read FNoHeatServiceDaysCalved write FNoHeatServiceDaysCalved default 60;
      property NoHeatServicePeriodDaysCalvedBegin : Integer read FNoHeatServicePeriodDaysCalvedBegin write FNoHeatServicePeriodDaysCalvedBegin default 42;
      property NoHeatServicePeriodDaysCalvedEnd : Integer read FNoHeatServicePeriodDaysCalvedEnd write FNoHeatServicePeriodDaysCalvedEnd default 60;

      property CheckNoServicesRecorded : Integer read FCheckNoServicesRecorded write FCheckNoServicesRecorded default 3;

      property VoluntaryWaitingPeriod : Integer read FVoluntaryWaitingPeriod write FVoluntaryWaitingPeriod default 30;
      property ConsiderPDAfterServiceXDays : Integer read FConsiderPDAfterServiceXDays write FConsiderPDAfterServiceXDays default 42;

      property ProgressBar : TProgressBar read FProgressBar write SetProgressBar;

   end;


const
   CBullingEvent  = 1;
   CServiceEvent  = 2;
   CPregDiagEvent = 3;
   CDryOffEvent   = 4;
   CCalvingEvent  = 5;

   AliasName = 'kingswd';
   Cycle21  = 21;
   Cycle24  = 24;
   Cycle42  = 42;

   Cycle    = Cycle21;
   XTARGET  = 730;
   BULLGEST = 283;

implementation
uses
   GenTypesConst;

{ TBreedingData }


constructor TBreedingData.create;
begin
   FProgressBar := nil;
   if ( FBreedingDataHelper <> nil ) then
      FreeAndNil(FBreedingDataHelper);
   FBreedingDataHelper := TBreedingDataHelper.Create;

   //   05/02/21 [V5.9 R8.1] /MK Bug Fix - Temp Breeding Tables were not created before report is built.
   FBreedingDataHelper.CreateTempBreedingDataTables;

   GenQuery := TQuery.Create(nil);
   GenQuery.DatabaseName :=  AliasName;

   TempTable := TTable.Create(nil);
   TempTable.DatabaseName := AliasName;

   FShowProgress := False;
   FHerdID := 0;
   FFromDate := 0;
   FToDate := 0;
   FDOBCutOffDate := IncMonth(Date, -12);

   FFromDate := Date;
   FToDate := Date + Cycle21;
   FIncludeOverDue := False;
   FDOBCutOffDate := Date()-365;

   FCheckNoServicesRecorded := 3;

   FDaysFirstService := 42;
   FDaysforDryingOff := 70;

   FNoHeatServiceDaysCalved := 60;
   FNoHeatServicePeriodDaysCalvedBegin := 42;
   FNoHeatServicePeriodDaysCalvedEnd := 60;
   FCheckNoServicesRecorded := 3;
   FVoluntaryWaitingPeriod := 30;
   FConsiderPDAfterServiceXDays := 42;

   InitializeTempTable;
end;

destructor TBreedingData.Destroy;
begin
   if ( FBreedingDataHelper <> nil ) then
      FreeAndNil(FBreedingDataHelper);
   if ( FProgressBar <> nil ) then
      FProgressBar := nil;

   TempTable.Close;
   TempTable.DeleteTable;
   TempTable.Free;

   if ( GenQuery <> nil ) then
      begin
         GenQuery.Close;
         FreeAndNil(GenQuery);
      end;
   inherited;
end;

procedure TBreedingData.EmptyTempTable;
begin
   with GenQuery do
      begin
         Close;
         SQL.Clear;
         SQL.Add('Delete From '+TempTable.TableName);
         ExecSQL;
      end;
   TempTable.Close;
   TempTable.Open;
end;

procedure TBreedingData.Execute;
begin
   GetRawData;
   GetActionData;
   CalcWarningData;
end;

procedure TBreedingData.GetActionData;

   procedure CalcDueService;
   var
      HasHeat, IsServed, IsPreg, IsDry,
      HasCalved: Boolean;

      procedure CalcServiceDate;
      var
         LastServiceDate,
         LastEventDate,
         DateDiff,
         LastHeatDate : TDateTime;
         CycleDateDiff : Double;
         Result : Boolean;
         AnimalId : Integer;
      begin
         AnimalId := TempTable.FieldByName('AnimalId').AsInteger;
         LastServiceDate := TempTable.FieldByName('ServiceDate').AsDateTime;
         LastHeatDate := TempTable.FieldByName('HeatDate').AsDateTime;
         DateDiff := 0;
         CycleDateDiff := 0;
         Result := FALSE;

         // Use the latest event Service r Bulling
         if LastServiceDate > LastHeatDate then
            LastEventDate := LastServiceDate
         else
            LastEventDate := LastHeatDate;

         // Define if the cow is due for overdue/due service.
         // Check the difference between the last eventdate and today.
         // predict a new Due Service Date from last Service/Bulling Date.

          // WinData.TempTable.FieldByName('OverDue').AsBoolean tells us if animal is
          // over 21 day cycle + 3 day saftey margin.

          // This field (along with check for DueService date before today) is used
          // to determine what animals should appear red in report.
          // Added SP 26/05/04.


         DateDiff := ( Date - LastEventDate );
         if ( DateDiff < Cycle21 ) then
            begin
               CycleDateDiff := ( Cycle21 - DateDiff );
               TempTable.FieldByName('DueService').AsDateTime := Today + CycleDateDiff;
               TempTable.FieldByName('OverDue').AsBoolean := False;
               Result := TRUE;
            end
         else if ( DateDiff >= Cycle21 ) And ( DateDiff <= Cycle24 ) then
            begin
               CycleDateDiff := ( Cycle21 - DateDiff );
               TempTable.FieldByName('DueService').AsDateTime := Today + CycleDateDiff;
               TempTable.FieldByName('OverDue').AsBoolean := False;
               Result := TRUE;
            end
         else if ( DateDiff > Cycle24 ) And ( DateDiff <= Cycle42 ) then
            begin
               CycleDateDiff := ( Cycle42 - DateDiff );
               TempTable.FieldByName('DueService').AsDateTime := Today + CycleDateDiff;
               TempTable.FieldByName('OverDue').AsBoolean := not(FIncludeOverDue);
               Result := TRUE;
            end
         else if ( DateDiff > Cycle42 ) then
            begin
               CycleDateDiff := ( Cycle42 - DateDiff ); // Way overdue
               TempTable.FieldByName('DueService').AsDateTime := Today + CycleDateDiff;
               TempTable.FieldByName('OverDue').AsBoolean := True;
               Result := TRUE;
            end;
         TempTable.FieldByName('Include').AsBoolean := Result;
      end;

   var
      LastServiceDate,
      LastEventDate,
      DateDiff,
      LastHeatDate : TDateTime;
      CycleDateDiff : Double;
      Result : Boolean;
      AnimalId : Integer;
   begin
      AnimalId := TempTable.FieldByName('AnimalId').AsInteger;

      HasHeat := TempTable.FieldByName('HeatDate').AsDateTime > 0;
      IsServed := TempTable.FieldByName('ServiceDate').AsDateTime > 0;
      IsPreg := TempTable.FieldByName('Pregnant').AsBoolean;
      IsDry := TempTable.FieldByName('DryOffDate').AsDateTime > 0;
      HasCalved := TempTable.FieldByName('CalvingDate').AsDateTime > 0;

      // Set default value "False", this will be overridden in CalcServiceDate if animal is over 21day cycle.
      TempTable.FieldByName('OverDue').AsBoolean := False;

      if NOT IsDry AND NOT IsPreg then
      // See if Animal is Due First Service - Check if they have been served This Lactation
      if ( NOT IsServed ) AND ( Not HasHeat ) then
         begin
            // Due First Service
            TempTable.FieldByName('RepType').AsString := 'F';
            if TempTable.FieldByName('LactNo').AsInteger = 0 then
               // If 0 lact animal, service due is Calving Date + 730 (Xtarget) - 283 (Bullgest)
               TempTable.FieldByName('DueService').AsDateTime := TempTable.FieldByName('DOB').AsDateTime + XTARGET - BULLGEST
            else if HasCalved then
               // Calculate the service date 42 days after the last calving date.
               TempTable.FieldByName('DueService').AsDateTime := TempTable.FieldByName('CalvingDate').AsDateTime + FDaysFirstService
            else
               // Safety net, just in case!!
               TempTable.FieldByName('DueService').Value := Null;

                // if 0 lact animal > yearold
            if ((( TempTable.FieldByName('LactNo').AsInteger = 0 ) And
                ( Today-TempTable.FieldByName('DOB').AsDateTime > 365 ))
            Or  //  if > 0 lact animal, DueService <= User input ServiceDate, and not dried off
                ( TempTable.FieldByName('LactNo').AsInteger > 0 )) And
                ( TempTable.FieldByName('DueService').AsDateTime <= FToDate ) And
                (( NOT IsDry )
            Or  // Cover 0 lact animal that is dry
                (( TempTable.FieldByName('LactNo').AsInteger = 0 ) And ( IsDry ))) Then
            TempTable.FieldByName('Include').AsBoolean := TRUE;
         end
      // Check for last bulling Date, if found calculate the due service date
      else if (NOT IsServed) AND (HasHeat) then
         begin
            //TempTable.FieldByName('RepType').AsString := 'H'; // SP 16/12/2008 bug fix, RepType should be F, irrespective of Heat/Bulling cycle
            TempTable.FieldByName('RepType').AsString := 'F';   // SP 16/12/2008

            if TempTable.FieldByName('HeatDate').AsDateTime > TempTable.FieldByName('CalvingDate').AsDateTime then
               CalcServiceDate;
         end
      else
         Begin // If they have a Service include/exclude animal and calculate DueService date
            TempTable.FieldByName('RepType').AsString := 'R';  // Due Repeat Service
            CalcServiceDate;
         end;
   end;

   procedure CalcDueDryOff;
   begin
   end;

   procedure CalcDueDryOffCalve;
   var
      NoOfCalves : Integer;
      IsPreg : String;
      tDryDate : TDateTime;
   begin
      with TempTable do
         begin
            FieldByName('DueCalveDate').AsDateTime := WinData.GetProjCalving(FieldByName('AnimalID').AsInteger, FieldByName('LactNo').AsInteger, NoOfCalves, IsPreg);
            //   31/10/12 [V5.1 R0.7] /MK Bug Fix - If IsPreg is "No" then DueCalveDate = 0.
            //   06/01/14 [V5.2 R7.5] /MK Bug Fix - If IsPreg = "No" then animals were set to not include.
            //                                      Include should be left out as DueCalvingDate used in SQL to establish
            //                                      whether animals should appear on the report or not.
            if ( IsPreg = 'No' ) then
               FieldByName('DueCalveDate').AsDateTime := 0;
            tDryDate := WinData.GetDryDate( FieldByName('AnimalID').AsInteger, FieldByName('LactNo').AsInteger );
            if tDryDate <= 0 then // only project date when cow is not already dry.
               begin
                  if ( FieldByName('LactNo').AsInteger > 0) and ( FieldByName('DueCalveDate').AsDateTime > 0 ) then // Calc due dry date
                     FieldByName('DueDryOffDate').AsDateTime := FieldByName('DueCalveDate').AsDateTime - FDaysforDryingOff;
               end;
         end;
   end;

begin

   if FShowProgress then
      begin
         if FProgressBar = nil then
            ShowProgressIndicator('Generating Data List...', 0, TempTable.RecordCount, 1)
         else
            begin
               FProgressBar.Position := 0;
               FProgressBar.Min := 0;
               FProgressBar.Max := TempTable.RecordCount;
               FProgressBar.Step := 1;
               FProgressBar.Visible := True;
            end;
      end;

   TempTable.First;
   while NOT TempTable.EOF do
      begin
         TempTable.Edit;
         CalcDueService;
         CalcDueDryOffCalve;
         TempTable.Post;
         TempTable.Next;
         if FShowProgress then
            begin
               if FProgressBar = nil then
                  ProgressIndicator.Position := TempTable.RecNo
               else
                  FProgressBar.StepIt;
            end;
      end;

   if FShowProgress then
      if FProgressBar = nil then
         ProgressIndicator.Close
      else
         FProgressBar.Hide;

end;

function TBreedingData.GetNoneHerdID: Integer;
begin
   Result := 1;
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'Owners';
         Active := True;
         try
            if Locate('HerdIdentity','NONE',[loCaseInsensitive]) then
               Result := FieldByName('ID').Value;
         finally
            Active := False;
         end;
      finally
         Free;
      end;
end;

procedure TBreedingData.GetRawData;
var
   { Bulling Vars }
   HasHeat : Boolean;
   HeatDate : TDateTime;
   PlannedBull, HeatLastBull : String;

   { Service Vars }
   IsServed: Boolean;
   NoServes, DaysToService: Integer;
   LastService, DueAfter: TDateTime;
   ServiceLastBull, ServeType: String;

   { PregDiag Vars }
   IsPreg, IsRecheck : Boolean;
   PregDiagDate : TDateTime;
   NoOfCalves, DaysInCalf : Integer;

   { DryOff Vars }
   IsDry: Boolean;
   DryDate: TDateTime;

   { Calving Vars }
   HasCalved : Boolean;
   CalvingDate : TDateTime;
   DaysInMilk : Integer;

   {To Be Culled Vars}
   ToBeCulledDate : TDateTime;

   AnimalId : Integer;

begin
   EmptyTempTable;
   with GenQuery do
      begin
         Close;
         SQL.Clear;
         // Select Events of Service type and their associated Animal file info.
         SQL.Add('INSERT INTO '+TempTable.TableName+' (AnimalID, LactNo, AnimalNo, SortAnimalno, DOB)');
         SQL.Add('SELECT DISTINCT ID, LactNo, AnimalNo, SortAnimalNo, DateOfBirth');
         SQL.Add('FROM "Animals.db" A');
         SQL.Add('WHERE (A.InHerd = TRUE)');
         // They are OVER 1 year old
         SQL.Add('AND ((A.DateOfBirth <= ' + '''' + FormatDateTime(cUSDateStyle,FDOBCutOffDate) + '''' + ')');
         SQL.Add('OR   ((A.DateOfBirth Is Null) And (A.LactNo > 0 )) )');
         SQL.Add('AND (A.Sex = "Female")');
         SQL.Add('AND (A.Breeding = TRUE)');
         SQL.Add('AND (A.AnimalDeleted=FALSE)');
         SQL.Add('And ( NOT (A.HerdID = ' + IntToStr(NoneHerdID) + '))');
         SQL.Add('And ( A.AnimalNo IS NOT NULL )');

         if ( FHerdID > 0 ) then SQL.Add('And (A.HerdID = ' + IntToStr(FHerdID) + ')');
         ExecSQL;
       end;

   if FShowProgress then
      begin
         if FProgressBar = nil then
            ShowProgressIndicator('Generating Action List...', 0, TempTable.RecordCount, 1)
         else
            begin
               FProgressBar.Position := 0;
               FProgressBar.Min := 0;
               FProgressBar.Max := TempTable.RecordCount;
               FProgressBar.Step := 1;
               FProgressBar.Visible := True;
            end;
      end;

   TempTable.First;
   while NOT TempTable.EOF do
      try
         TempTable.Edit;
         AnimalId := TempTable.FieldByName('AnimalId').AsInteger;

         TempTable.FieldByName('Include').AsBoolean := FALSE;

         FBreedingDataHelper.GetBullingInfo(TempTable.FieldByName('AnimalId').AsInteger,
                                            TempTable.FieldByName('LactNo').AsInteger,
                                            HasHeat, HeatDate, PlannedBull, HeatLastBull);
         TempTable.FieldByName('HeatDate').AsDateTime := HeatDate;

         FBreedingDataHelper.GetServiceInfo(TempTable.FieldByName('AnimalId').AsInteger,
                                            TempTable.FieldByName('LactNo').AsInteger,
                                            IsServed, NoServes, DaysToService, LastService, DueAfter, ServiceLastBull, ServeType);
         TempTable.FieldByName('DueAfter').AsDateTime := DueAfter;
         TempTable.FieldByName('NoServes').AsInteger := NoServes;
         if ( LastService > 0 ) then
            TempTable.FieldByName('ServiceDate').AsDateTime := LastService;
         TempTable.FieldByName('DaysToService').AsFloat := DaysToService;

         FBreedingDataHelper.GetPregDiagInfo(TempTable.FieldByName('AnimalId').AsInteger,
                                             TempTable.FieldByName('LactNo').AsInteger,
                                             IsPreg, IsRecheck, PregDiagDate, NoOfCalves, DaysInCalf);
         TempTable.FieldByName('PDDate').AsDateTime := PregDiagDate;
         TempTable.FieldByName('Pregnant').AsBoolean := IsPreg;
         TempTable.FieldByName('PDExists').AsBoolean := PregDiagDate > 0;

         FBreedingDataHelper.GetDryOffInfo(TempTable.FieldByName('AnimalId').AsInteger,
                                           TempTable.FieldByName('LactNo').AsInteger,
                                           IsDry, DryDate);
         if IsDry then TempTable.FieldByName('DryOffDate').AsDateTime := DryDate;

         FBreedingDataHelper.GetCalvingInfo(TempTable.FieldByName('AnimalId').AsInteger,
                                            TempTable.FieldByName('LactNo').AsInteger,
                                            HasCalved, DryDate, CalvingDate, DaysInMilk);
         TempTable.FieldByName('CalvingDate').AsDateTime := CalvingDate;
         TempTable.FieldByName('DaysInMilk').AsFloat := DaysInMilk;

         TempTable.FieldByName('HeatsServicesRecorded').AsBoolean := not (not IsServed and not HasHeat);

         ToBeCulledDate := 0;
         FBreedingDataHelper.GetToBeCulledInfo(TempTable.FieldByName('AnimalID').AsInteger,
                                               TempTable.FieldByName('LactNo').AsInteger,
                                               ToBeCulledDate);
         if ( ToBeCulledDate > 0 ) then
            TempTable.FieldByName('ToBeCulledDate').AsDateTime := ToBeCulledDate;

         TempTable.Next;
         if FShowProgress then
            begin
               if FProgressBar = nil then
                  ProgressIndicator.Position := TempTable.RecNo
               else
                  FProgressBar.StepIt;
            end;
      except
         on e : Exception do
            ShowMessage(e.Message);
      end;

   if FShowProgress then
      if FProgressBar = nil then
         ProgressIndicator.Close
      else
         FProgressBar.Hide;
end;

function TBreedingData.GetToday: TDateTime;
begin
   Result := Date;
end;

procedure TBreedingData.CalcWarningData;

   procedure CalcMissedUnusalHeatCycles;
   var
   i : Integer;
   begin
      // Find the Bulling Events for this Animal
      FBreedingDataHelper.CreateTempBreedingDataTables;

      FBreedingDataHelper.TempBullings.Filter := '(AnimalID = '+IntToStr(TempTable.FieldByName('AnimalID').AsInteger)+') And (AnimalLactNo = '+IntToStr(TempTable.FieldByName('LactNo').AsInteger)+')';
      FBreedingDataHelper.TempBullings.Filtered := True;
      if FBreedingDataHelper.TempBullings.RecordCount >= 4 then
         i := 4
      else
         i := FBreedingDataHelper.TempBullings.RecordCount;
      FBreedingDataHelper.TempBullings.FindLast;
      TempTable.FieldByName('IrregularHeat').AsBoolean := FALSE;
      while ( FBreedingDataHelper.TempBullings.FindPrior ) And ( i > 0 ) do
         begin
            case i of
               1 : begin
                      TempTable.FieldByName('FirstHeat').AsDateTime := FBreedingDataHelper.TempBullings.FieldByName('EventDate').AsDateTime;
                      if TempTable.FieldByName('SecondHeat').AsDateTime > 0 then
                         begin
                            TempTable.FieldByName('FirstHeatInt').Value := TempTable.FieldByName('SecondHeat').AsDateTime-TempTable.FieldByName('FirstHeat').AsDateTime;
                            if NOT ( TempTable.FieldByName('FirstHeatInt').AsInteger in [18..24] ) then
                               TempTable.FieldByName('IrregularHeat').AsBoolean := TRUE;
                         end;
                   end;
               2 : begin
                      TempTable.FieldByName('SecondHeat').AsDateTime := FBreedingDataHelper.TempBullings.FieldByName('EventDate').AsDateTime;
                      if TempTable.FieldByName('ThirdHeat').AsDateTime > 0 then
                         begin
                            TempTable.FieldByName('SecondHeatInt').Value := TempTable.FieldByName('ThirdHeat').AsDateTime-TempTable.FieldByName('SecondHeat').AsDateTime;
                            if NOT ( TempTable.FieldByName('SecondHeatInt').AsInteger in [18..24] ) then
                               TempTable.FieldByName('IrregularHeat').AsBoolean := TRUE;
                         end;
                   end;
               3 : begin
                      TempTable.FieldByName('ThirdHeat').AsDateTime := FBreedingDataHelper.TempBullings.FieldByName('EventDate').AsDateTime;
                      if TempTable.FieldByName('FourthHeat').AsDateTime > 0 then
                         begin
                            TempTable.FieldByName('ThirdHeatInt').Value := TempTable.FieldByName('ThirdHeat').AsDateTime-TempTable.FieldByName('FourthHeat').AsDateTime;
                            if NOT ( TempTable.FieldByName('ThirdHeatInt').AsInteger in [18..24] ) then
                               TempTable.FieldByName('IrregularHeat').AsBoolean := TRUE;
                         end;
                   end;
               4 : TempTable.FieldByName('FourthHeat').AsDateTime := FBreedingDataHelper.TempBullings.FieldByName('EventDate').AsDateTime;
            end;
            Dec(i);
         end;
      // Clear the Filter
      FBreedingDataHelper.TempBullings.Filter := '';
      FBreedingDataHelper.TempBullings.Filtered := False;
   end;

begin
   if FShowProgress then
      begin
         if FProgressBar = nil then
            ShowProgressIndicator('Generating Data List...', 0, TempTable.RecordCount, 1)
         else
            begin
               FProgressBar.Position := 0;
               FProgressBar.Min := 0;
               FProgressBar.Max := TempTable.RecordCount;
               FProgressBar.Step := 1;
               FProgressBar.Visible := True;
            end;
      end;

   TempTable.First;
   while NOT TempTable.EOF do
      begin
         TempTable.Edit;
         CalcMissedUnusalHeatCycles;//(HasHeat,IsServed,IsPreg,IsDry,HasCalved);
         TempTable.Post;
         TempTable.Next;
         if FShowProgress then
            begin
               if FProgressBar = nil then
                  ProgressIndicator.Position := TempTable.RecNo
               else
                  FProgressBar.StepIt;
            end;
      end;

   if FShowProgress then
      if FProgressBar = nil then
         ProgressIndicator.Close
      else
         FProgressBar.Hide;
end;

procedure TBreedingData.InitializeTempTable;
begin
  with TempTable do
     begin
         Close;
         Randomize();
         TableName := 'BreedingData' + IntToStr(Random(10000));

         FieldDefs.Clear;
         FieldDefs.Add('AnimalID',ftInteger,0,False);
         FieldDefs.Add('LactNo',ftInteger,0,False);
         FieldDefs.Add('AnimalNo',ftString,10,False);
         FieldDefs.Add('SortAnimalNo',ftString,10,False);
         FieldDefs.Add('DOB',ftDate,0,False);
         FieldDefs.Add('HeatsServicesRecorded',ftBoolean);

         FieldDefs.Add('HeatDate',ftDate,0,False);
         FieldDefs.Add('NextHeat',ftDate,0,False);

         FieldDefs.Add('ServiceDate',ftDate,0,False);
         FieldDefs.Add('NoServes',ftInteger,0,False);
         FieldDefs.Add('DaysToService',ftFloat,0,False);
         FieldDefs.Add('DueService',ftDate,0,False);
         FieldDefs.Add('DueAfter',ftDate,0,False);
         FieldDefs.Add('OverDue', ftBoolean);

         FieldDefs.Add('PDDate',ftDate,0,False);
         FieldDefs.Add('Pregnant',ftBoolean,0,False);
         FieldDefs.Add('PDExists',ftBoolean,0,False);

         FieldDefs.Add('DryOffDate',ftDate,0,False);
         FieldDefs.Add('CalvingDate',ftDate,0,False);
         FieldDefs.Add('DaysInMilk',ftFloat,0,False);

         FieldDefs.Add('ToBeCulledDate',ftDate);

         FieldDefs.Add('Include',ftBoolean,0,False);
         FieldDefs.Add('RepType',ftString,1,False);

         FieldDefs.Add('FirstHeat',ftDate,0,False);
         FieldDefs.Add('SecondHeat',ftDate,0,False);
         FieldDefs.Add('ThirdHeat',ftDate,0,False);
         FieldDefs.Add('FourthHeat',ftDate,0,False);
         FieldDefs.Add('FirstHeatInt',ftInteger,0,False);
         FieldDefs.Add('SecondHeatInt',ftInteger,0,False);
         FieldDefs.Add('ThirdHeatInt',ftInteger,0,False);

         FieldDefs.Add('IrregularHeat',ftBoolean,0,False);

         FieldDefs.Add('DueDryOffDate',ftDate,0,False);
         FieldDefs.Add('DueCalveDate',ftDate,0,False);

         IndexDefs.Clear;
         IndexDefs.Add('AnimalIDx','AnimalID',[ixPrimary]);
         CreateTable;
         Open;
     end;
end;

function TBreedingData.OutputResult(
  ADueListingType: TActionListingType): string;
begin
   FAnimalOutput := '';
   with GenQuery do
      begin
         SQL.Clear;
         if ADueListingType in ([ alFirstServiceWith4Days, alRepeatServiceWith4Days]) then
            begin
               SQL.Add('SELECT DISTINCT AnimalNo, SortAnimalNo, DueService  FROM '+TempTable.TableName+'');
               SQL.Add('WHERE ( DueService Between ' + '''' + FormatDateTime(cUSDateStyle,FFromDate) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,FToDate)   + '''' + ') ');
               if ADueListingType = alFirstServiceWith4Days then
                  SQL.Add('AND RepType = "F" ')
               else if ADueListingType = alRepeatServiceWith4Days then
                  SQL.Add('AND RepType = "R" ');
               SQL.Add('AND (Include=TRUE) ');

               SQL.Add('Order By DueService, SortAnimalNo ');
           end
        else
           begin
               if ADueListingType = alDueToDryOff then
                  begin
                     SQL.Add('SELECT DISTINCT AnimalNo, SortAnimalNo, DueDryOffDate FROM '+TempTable.TableName+'');
                     SQL.Add('WHERE ( DueDryOffDate Between ' + '''' + FormatDateTime(cUSDateStyle,IncMonth(Date, -3)) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,FToDate)   + '''' + ') ');
                     //   06/12/10 [V4.0 R6.1] /MK Bug Fix - Do No Check For Zero Lactation Heifers.
                     SQL.Add('AND LactNo >= 1');
                     //SQL.Add('WHERE ( DueDryOffDate <= ' + '''' + FormatDateTime(cUSDateStyle,FToDate)   + '''' + ') ');
                  end
               else if ADueListingType = alDueToCalve then
                  begin
                     SQL.Add('SELECT DISTINCT AnimalNo, SortAnimalNo, DueCalveDate FROM '+TempTable.TableName+'');
                     SQL.Add('WHERE ( DueCalveDate Between ' + '''' + FormatDateTime(cUSDateStyle,IncMonth(Date, -3)) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,FToDate)   + '''' + ') ');
                     //SQL.Add('WHERE ( DueCalveDate <= ' + '''' + FormatDateTime(cUSDateStyle,FToDate)   + '''' + ') ');
                  end;
               // Set the Sort Order of the Query
               //SQL.Add('Order By SortAnimalNo');
               if ADueListingType = alDueToDryOff then
                  SQL.Add('Order By DueDryOffDate, SortAnimalNo ')
               else
                  SQL.Add('Order By DueCalveDate, SortAnimalNo ');
         end;


         Open;

         First;
         while not eof do
            begin
               if ADueListingType = alDueToDryOff then
                  FAnimalOutput := FAnimalOutput + FieldByName('AnimalNo').AsString + ' ('+FormatDateTime('dd/mm',FieldByName('DueDryOffDate').AsDateTime)+') ,'
               else if ADueListingType = alDueToCalve then
                  FAnimalOutput := FAnimalOutput + FieldByName('AnimalNo').AsString + ' ('+FormatDateTime('dd/mm',FieldByName('DueCalveDate').AsDateTime)+') ,'
               else if ADueListingType = alFirstServiceWith4Days then
                  FAnimalOutput := FAnimalOutput + FieldByName('AnimalNo').AsString + ' ('+FormatDateTime('dd/mm',FieldByName('DueService').AsDateTime)+') ,'
               else  if ADueListingType = alRepeatServiceWith4Days then
                  FAnimalOutput := FAnimalOutput + FieldByName('AnimalNo').AsString + ' ('+FormatDateTime('dd/mm',FieldByName('DueService').AsDateTime)+') ,';
               Next;
            end;
         Trim(FAnimalOutput);
      end;
   Result := FAnimalOutput;

end;

function TBreedingData.OutputResult(
  AWarningListingType: TWarningListingType): string;
begin
   FAnimalOutput := '';
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT DISTINCT AnimalNo, SortAnimalNo');
         SQL.Add('FROM '+TempTable.TableName+'');
         if AWarningListingType = wlNoHeatServiceXDaysCalved then
            begin
               SQL.Add('Where ( HeatsServicesRecorded = False )');
               SQL.Add('And (DaysInMilk > '+IntToStr(NoHeatServiceDaysCalved)+' )');
               //   07/12/16 [V5.5 R2.1] /MK Change - Only inlcude animals that don't have a To Be Culled date - TGM/GL request.
               SQL.Add('And (ToBeCulledDate IS NULL)');
            end
         else if AWarningListingType = wlNoHeatServiceXPeriodDaysCalved then
            begin
               SQL.Add('Where ( HeatsServicesRecorded = False )');
               SQL.Add('And (DaysInMilk Between '+IntToStr(FNoHeatServicePeriodDaysCalvedBegin)+' And '+IntToStr(FNoHeatServicePeriodDaysCalvedEnd)+' )');
            end
         else  if AWarningListingType = wlCheckNoServicesRecorded then
            begin
               SQL.Add('Where ( NoServes >= '+IntToStr(CheckNoServicesRecorded)+' )');
            end
         else if AWarningListingType = wlMissedHeatUnusualCycle then
            begin
               SQL.Add('Where ( IrregularHeat = TRUE )');
            end;
         // Set the Sort Order of the Query
         SQL.Add('Order By SortAnimalNo');
         Open;

         First;
         while not eof do
            begin
               FAnimalOutput := FAnimalOutput + FieldByName('AnimalNo').AsString + ',';
               Next;
            end;
         Trim(FAnimalOutput);
      end;
   Result := FAnimalOutput;
end;

function TBreedingData.OutputResult(AReminderListingType: TReminderListingType): string;
var
   TestDate  : TDateTime;
begin
   FAnimalOutput := '';

   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT DISTINCT AnimalNo, SortAnimalNo FROM '+TempTable.TableName+'');
         if AReminderListingType = rlCalvedLessThanVWP  then
            begin
               TestDate := Date - VoluntaryWaitingPeriod;
               SQL.Add('WHERE ( CalvingDate > ' + '''' + FormatDateTime(cUSDateStyle,TestDate) + '''' + ' ) ')
            end
         else if AReminderListingType = rlConsiderPDAfterServiceXDays then
            begin
               TestDate := Date - FConsiderPDAfterServiceXDays;
               SQL.Add('WHERE (ServiceDate IS NOT NULL) and ( ServiceDate < ' + '''' + FormatDateTime(cUSDateStyle,TestDate) + '''' + ' ) ');
               SQL.Add('And PDExists = False');
            end
         else if AReminderListingType = rlCowsNotPregnant then
            begin
               SQL.Add('WHERE ( Pregnant = False ) ');
               SQL.Add('AND   ( PDExists = True )');
               //   07/12/16 [V5.5 R2.1] /MK Change - Only show cows that are not pregnant and don't have a To Be Culled event - TGM/GL request.
               SQL.Add('AND   ( ToBeCulledDate IS NULL )');
               //   06/12/10 [V4.0 R6.1] /MK Bug Fix - Removed Check For LactNo > 0 (Zero Lact Heifers).
               //   SQL.Add('And ( LactNo > 0 )');
            end;

         // Set the Sort Order of the Query
         SQL.Add('Order By SortAnimalNo');
         Open;

         First;
         while not eof do
            begin
               FAnimalOutput := FAnimalOutput + FieldByName('AnimalNo').AsString + ',';
               Next;
            end;
         Trim(FAnimalOutput);
      end;
   Result := FAnimalOutput;
end;

procedure TBreedingData.SetProgressBar(const Value: TProgressBar);
begin
   FProgressBar := Value;
   FProgressBar.Visible := False;
end;

end.
