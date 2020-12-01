unit HealthData;

interface
uses
   Classes, SysUtils, db, dbTables, Dialogs, uHerdOwner, GenTypesConst, KDBRoutines;

type
   THealthData = class
   public
      class function GetMaxWithDrawalDate(AAnimalID : Integer) : TDateTime;
      class function GetDrugBatchArray(ADrugID : Integer; AEditingEvent : Boolean) : PStringArray;
   end;

implementation

{ THealthData }

class function THealthData.GetDrugBatchArray(ADrugID: Integer; AEditingEvent : Boolean): PStringArray;
var
   qDrugBatchNo : TQuery;
begin
   SetLength(Result,0);
   if ( ADrugID = 0 ) then Exit;

   qDrugBatchNo := TQuery.Create(nil);
   with qDrugBatchNo do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT DISTINCT(MP.BatchNo)');
         SQL.Add('FROM MediPur MP');
         SQL.Add('LEFT JOIN Medicine M ON (M.ID=MP.DrugID)');
         if ( not(AEditingEvent) ) then
            begin
               SQL.Add('WHERE MP.InUse=TRUE');
               SQL.Add('AND TRIM(MP.BatchNo) <> ""');
            end
         else
            SQL.Add('WHERE TRIM(MP.BatchNo) <> ""');
         SQL.Add('AND MP.DrugID = :ADrugID');
         Params[0].AsInteger := ADrugID;
         try
            Open;
            if ( RecordCount > 0 ) then
               begin
                  First;
                  while ( not(Eof) ) do
                     begin
                        SetLength(Result,Length(Result)+1);
                        Result[Length(Result)-1] := UpperCase(FieldByName('BatchNo').AsString);
                        Next;
                     end;
               end;
            Close;
            SQL.Clear;
            SQL.Add('SELECT Distinct(H.DrugBatchNo)');
            SQL.Add('FROM Health H');
            SQL.Add('WHERE (H.DrugBatchNo NOT IN (SELECT MP.BatchNo FROM MediPur MP))');
            SQL.Add('AND   (H.DrugBatchNo IS NOT Null)');
            SQL.Add('AND   (H.DrugUsed = :ADrugUsed)');
            Params[0].AsInteger := ADrugID;
            Open;
            if ( RecordCount > 0 ) then
               begin
                  First;
                  while ( not(Eof) ) do
                     begin
                        SetLength(Result,Length(Result)+1);
                        Result[Length(Result)-1] := UpperCase(FieldByName('BatchNo').AsString);
                        Next;
                     end;
               end;
            Close;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

class function THealthData.GetMaxWithDrawalDate(
  AAnimalID: Integer): TDateTime;
var
   DateToUse : TDateTime;
   EventID : Integer;
   WithDrawalDays : Double;
   AdminDays : Integer; // Stores the number of days animal is to be administered drug.
   MaxWDDate : TDateTime; // temp withdrawaldate.
   HerdID : Integer;
   HerdOwnerData : THerdOwnerData;
   t : double;
begin
   Result := 0;
   HerdOwnerData := THerdOwnerData.create(nil,GetAnimalInfo(AAnimalID, 'HerdID'));

   with TQuery.Create(nil) do
      begin
         // Find the maxium withdrawal days in medicine.db
         // Exclude any health events before WithDrawalDays + DateToUse
         DatabaseName := AliasName;

         SQL.Clear;
         SQL.Add('SELECT MAX(WithDrawal) MeatWDDays, ');
         SQL.Add('       MAX(MilkWithDrawal) MilkWDDays, ');
         SQL.Add('       MAX(OtherWithDrawal) OtherWDDays,  ');
         SQL.Add('       MAX(OrganicMeatWithDrawal) OrganicMeatWDDays,  ');
         SQL.Add('       MAX(OrganicMilkWithDrawal) OrganicMilkWDDays,  ');
         SQL.Add('       MAX(OrganicOtherWithDrawal) OrganicOtherWDDays   ');
         SQL.Add('FROM Medicine ');
         Open;

         First;
         WithDrawalDays := FieldByName('MeatWDDays').AsInteger;
         if FieldByName('MilkWDDays').AsInteger > WithDrawalDays then
            WithDrawalDays := FieldByName('MilkWDDays').AsInteger
         else if FieldByName('OtherWDDays').AsInteger > WithDrawalDays then
            WithDrawalDays := FieldByName('OtherWDDays').AsInteger;

         if HerdOwnerData.OrganicHerd then
            begin
               if FieldByName('OrganicMeatWDDays').AsInteger > WithDrawalDays then
                  WithDrawalDays := FieldByName('OrganicMeatWDDays').AsInteger
               else if FieldByName('OrganicMilkWDDays').AsInteger > WithDrawalDays then
                  WithDrawalDays := FieldByName('OrganicMilkWDDays').AsInteger
               else if FieldByName('OrganicOtherWDDays').AsInteger > WithDrawalDays then
                  WithDrawalDays := FieldByName('OrganicOtherWDDays').AsInteger;
            end;
         Close;

         DateToUse := Date - WithDrawalDays;

         SQL.Clear;
         SQL.Add('SELECT DISTINCT E.AnimalID, E.ID, E.EventDate ');
         SQL.Add('FROM Events E');
         SQL.Add('WHERE (E.AnimalID=:AnimalID)');
         SQL.Add('AND (E.EventType IN ('+IntToStr(CHealthEvent)+','+IntToStr(CDryOffEvent)+'))');
         SQL.Add('AND (E.EventDate > "'+FormatDateTime('mm/dd/yyyy', DateToUse)+'")');
         Params[0].AsInteger := AAnimalID;

         Open;
         if NOT (IsEmpty) then
            begin
               First;
               while not( Eof ) do
                  begin
                     WithDrawalDays := 0;
                     AdminDays := 0;
                     MaxWDDate := 0;

                     EventID := FieldByName('ID').AsInteger;
                     with TQuery.Create(nil) do
                        try
                           DatabaseName := AliasName;
                           SQL.Add('SELECT H.DrugUsed, H.NoDays, M.WithDrawal, M.MilkWithdrawal, M.OtherWithdrawal, ');
                           SQL.Add('       M.OrganicMeatWithDrawal, M.OrganicMilkWithDrawal,M.OrganicOtherWithdrawal ');
                           SQL.Add('FROM Health H ');
                           SQL.Add('LEFT JOIN Medicine M ON (H.DrugUsed=M.ID)');
                           SQL.Add('WHERE H.EventID=:EventID');
                           Params[0].AsInteger := EventID;
                           Open;

                           First;
                           if FieldByName('DrugUsed').AsInteger > 0 then
                              begin
                                 AdminDays := FieldByName('NoDays').AsInteger;

                                 WithDrawalDays := FieldByName('WithDrawal').AsInteger;
                                 if FieldByName('MilkWithdrawal').AsInteger > WithDrawalDays then
                                    WithDrawalDays := FieldByName('MilkWithdrawal').AsInteger
                                 else if FieldByName('OtherWithdrawal').AsInteger > WithDrawalDays then
                                    WithDrawalDays := FieldByName('OtherWithdrawal').AsInteger;

                                 if HerdOwnerData.OrganicHerd then
                                    begin
                                       if FieldByName('OrganicMeatWithDrawal').AsInteger > WithDrawalDays then
                                          WithDrawalDays := FieldByName('OrganicMeatWithDrawal').AsInteger
                                       else if FieldByName('OrganicMilkWithDrawal').AsInteger > WithDrawalDays then
                                          WithDrawalDays := FieldByName('OrganicMilkWithDrawal').AsInteger
                                       else if FieldByName('OrganicOtherWithdrawal').AsInteger > WithDrawalDays then
                                          WithDrawalDays := FieldByName('OrganicOtherWithdrawal').AsInteger;
                                    end;
                              end;
                        finally
                           Close;
                           Free;
                        end;

                     t := frac( WithDrawalDays );
                     if t >= 0.5 then
                        WithDrawalDays := WithDrawalDays + 1;

                     if ( WithDrawalDays > 0 ) then
                        begin
                           if ( AdminDays <= 0 ) then
                              AdminDays := 1; // set AdminDays to default "1 day" where AdminDays <= 0
                           MaxWDDate := FieldByName('EventDate').AsDateTime + ( AdminDays -1 ) + WithDrawalDays;
                           if Result = 0 then
                              Result := MaxWDDate;
                           if MaxWDDate > Result then
                              Result := MaxWDDate;
                        end;
                     Next;
                  end;
            end;
      end;
end;

end.
