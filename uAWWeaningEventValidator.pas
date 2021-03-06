unit uAWWeaningEventValidator;

interface
uses
   Classes, SysUtils, db, dbTables;

type
   TAWWeaningEventValidator = class
   private
      FHerdID : Integer;
      FWeaningDate : TDateTime;
      FCalfCount : Integer;
      FNoOfWeaningsYearToDate : Integer;
      FCowsInHerd : Integer;
      FPrecedingWeaningDate : TDateTime;
      FSucceedingWeaningDate : TDateTime;
      FErrorText : string;
   protected
      function GetPrecedingWeaningDate : TDateTime;
      function GetSucceedingWeaningDate : TDateTime;
      function GetNoOfWeaningsYearToDate() : Integer;
      function GetCowsInHerd : Integer;
   public
      constructor create(const AHerdId : Integer;
         const AWeaningDate : TDateTime; const ACalfCount : Integer);
      function IsWeaningPermissible : Boolean;
      {procedure InsertTestData(ACowsInHerdCount,
           ANoOfWeaningToDate, AWeaningCount: Integer; APrecedingWeaningDate,
           ASucceedingWeaningDate: TDateTime);}
      property ErrorText : string read FErrorText;
   end;

implementation
uses
   GenTypesConst, kRoutines, DateUtil, uLivestockData;

{ TAWWeaningEventValidator }


   // 1. 10 or more Cows currently in the herd.
   // 2. Must be at least two weanings per year.
   // 3. Weaning dates must be at least 5 days apart.
   // 4. Limit the first weaning to MAX 9 calves, ensuring that any herd with ten
   //    or more calves has at least 1 or more calves left to wean .

   // 5. Redirect Individual Weaning to block weaning

function TAWWeaningEventValidator.GetCowsInHerd: Integer;
var
   DairyLivestockNumbers : TDairyLivestockNumbers;
   FLivestockData : TLivestockData;
begin
   // get the number of cows (milking & dry) in the herd on the weaning date.
   FLivestockData := TLivestockData.Create(FHerdID);
   FillChar(DairyLivestockNumbers,SizeOf(TDairyLivestockNumbers),0);
   try
      FLivestockData.StockDate := FWeaningDate;
      FLivestockData.IncludeAnimalWeights := False;
      FLivestockData.CalcProjectedCalving := False;
      FLivestockData.SexFilter := 'AND Sex = "Female"';
      FLivestockData.GetDairyLivestockValues(DairyLivestockNumbers);
      Result := DairyLivestockNumbers.DairyCows + DairyLivestockNumbers.DairyCowsDry;
   finally
      FreeAndNil(FLivestockData);
   end;
end;

constructor TAWWeaningEventValidator.create(const AHerdId: Integer;
  const AWeaningDate: TDateTime; const ACalfCount: Integer);
begin
   FErrorText := '';

   FHerdID := AHerdId;
   FWeaningDate := AWeaningDate;
   FCalfCount := ACalfCount;

   FPrecedingWeaningDate := GetPrecedingWeaningDate;
   FSucceedingWeaningDate := GetSucceedingWeaningDate;

   FCowsInHerd := GetCowsInHerd;
   FNoOfWeaningsYearToDate := GetNoOfWeaningsYearToDate;
end;

function TAWWeaningEventValidator.IsWeaningPermissible: Boolean;
var
   DaysBetween : Integer;
begin
   Result := True;
   // * The purpose of this function is to prevent herds containing 10 or more cows
   //   to wean all the calves on the same day. For herds with 10 more cows
   //   there must be 2 or more groups of calves weaned within the application year.

   // * Each group weaned must be weaned at least 5 days apart.

   // * If a herd contains less than 10 cows, this rule does not apply.

   // 1. Check if herd has 10 or more Cows on Weaning Date.
   if ( FCowsInHerd < 10 ) then
      begin
         // Herd has/had less than 10 cows on weaning date, weaning should be allowed.
         Exit;
      end;

   // 2. Check that preceding weaning date is 5 or more days prior to weaning date.
   if ( FPrecedingWeaningDate > 0 ) then
      begin
         DaysBetween := Trunc(FWeaningDate - FPrecedingWeaningDate);

         if ( DaysBetween <= 4 ) then
            begin
               Result := False;
               FErrorText := Format('This weaning event cannot be saved.' +cCRLFx2 +
                                    'A previous weaning date (%s) has been found within 5 days of this weaning date %s.'+cCRLFx2 +
                                    'Weaning dates must be at least 5 days apart.',[FormatDate(FPrecedingWeaningDate, dsIrish),FormatDate(FWeaningDate, dsIrish)]);
               Exit;
            end;
      end;

   // 3. Check that succeeding weaning date is 5 or more days after weaning date.
   if ( FSucceedingWeaningDate > 0 ) then
      begin
         DaysBetween := Trunc(FSucceedingWeaningDate - FWeaningDate);

         if ( DaysBetween <= 4 ) then
            begin
               Result := False;
               FErrorText := Format('This weaning event cannot be saved.' +cCRLFx2 +
                                    'A later weaning date (%s) has been found within 5 days of this weaning date %s.'+cCRLFx2 +
                                    'Weaning dates must be at least 5 days apart.',[FormatDate(FSucceedingWeaningDate, dsIrish),FormatDate(FWeaningDate, dsIrish)]);
               Exit;
            end;
      end;

   // 4. If this is the first weaning date of the year ( FNoOfWeaningsYearToDate = 0 ),
   //    restrict the number of calves to be weaned to 9. This will ensure that herds containing 10 or more
   //    cows will have to do a second weaning event.
   // *** NEW RULE *** ICBF Allow as many animals in the first group but once there are two groups of animals within 5 days.
   if ( FNoOfWeaningsYearToDate = 0 ) then // indicates FWeaningDate is the first weaning date of year.
      begin
         //if ( FCalfCount > 9 ) then // do not allow more than 9 calves to be weaned if first weaning of year.
         if ( FCalfCount > (FCowsInHerd-1) )  then // do not allow more than (count females in the herd - 1) to be sent off. so user has to create two groups.
            begin
               Result := False;
               FErrorText := Format('This weaning event cannot be saved.' +cCRLFx2 +
                                    'There must be two groups of weaning created.',[ExtractYear(FWeaningDate)]);
               Exit;
            end;
      end;

end;


function TAWWeaningEventValidator.GetNoOfWeaningsYearToDate: Integer;
begin
   // Return the number of weaning events recorded within specified year.
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT COUNT(E.ID) CountOfWeanings');
         SQL.Add('FROM Events E ');
         SQL.Add('WHERE (E.EventType=:EventType)');
         SQL.Add('AND (E.HerdId=:HerdId)');
         SQL.Add('AND (EXTRACT(YEAR FROM E.EventDate)=:AYear)');
         Params[0].AsInteger := CWeaningEvent;
         Params[1].AsInteger := FHerdID;
         Params[2].AsInteger := ExtractYear(FWeaningDate);
         Open;
         try
            First;
            Result := Fields[0].AsInteger;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

function TAWWeaningEventValidator.GetPrecedingWeaningDate: TDateTime;
begin
   // Return the most recent weaning date prior to FWeaningDate
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT MAX(E.EventDate)');
         SQL.Add('FROM Events E ');
         SQL.Add('WHERE (E.EventType=:EventType)');
         SQL.Add('AND (E.HerdId=:HerdId)');
         SQL.Add('AND (E.EventDate <= :EventDate)');
         Params[0].AsInteger := CWeaningEvent;
         Params[1].AsInteger := FHerdID;
         Params[2].AsDateTime := FWeaningDate;
         Open;
         try
            First;
            Result := Fields[0].AsDateTime;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

function TAWWeaningEventValidator.GetSucceedingWeaningDate: TDateTime;
begin
   // Return the most recent weaning date after FWeaningDate
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT MIN(E.EventDate)');
         SQL.Add('FROM Events E ');
         SQL.Add('WHERE (E.EventType=:EventType)');
         SQL.Add('AND (E.HerdId=:HerdId)');
         SQL.Add('AND (E.EventDate >= :EventDate)');
         Params[0].AsInteger := CWeaningEvent;
         Params[1].AsInteger := FHerdID;
         Params[2].AsDateTime := FWeaningDate;
         Open;
         try
            First;
            Result := Fields[0].AsDateTime;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

(*
procedure TAWWeaningEventValidator.InsertTestData(ACowsInHerdCount,
  ANoOfWeaningToDate, AWeaningCount: Integer; APrecedingWeaningDate,
  ASucceedingWeaningDate: TDateTime);
begin
   FCowsInHerd := ACowsInHerdCount;
   FNoOfWeaningsYearToDate := ANoOfWeaningToDate;
   FCalfCount := AWeaningCount;
   FPrecedingWeaningDate := APrecedingWeaningDate;
   FSucceedingWeaningDate := ASucceedingWeaningDate;
end;
*)

end.
