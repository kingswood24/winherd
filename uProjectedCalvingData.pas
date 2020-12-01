unit uProjectedCalvingData;

interface

uses
   db, dbTables, SysUtils, Classes, Dialogs, uApplicationLog, GenTypesConst;

type
   TProjectedItem = class(TObject)
   private
      FAnimalID: Integer;
      FAnimalLactNo: Integer;
      FThisCalvingDate: TDateTime;
      FProjCalvingDate: TDateTime;
      FLastCalvingDate: TDateTime;
      function GetCalvingInterval: Integer;
      function GetProjCalvingInterval: Integer;
   public
      property AnimalID : Integer read FAnimalID write FAnimalID;
      property AnimalLactNo : Integer read FAnimalLactNo write FAnimalLactNo;
      property ThisCalvingDate : TDateTime read FThisCalvingDate write FThisCalvingDate;
      property LastCalvingDate : TDateTime read FLastCalvingDate write FLastCalvingDate;
      property ProjCalvingDate : TDateTime read FProjCalvingDate write FProjCalvingDate;
      property CalvingInterval : Integer read GetCalvingInterval;
      property ProjCalvingInterval : Integer read GetProjCalvingInterval;
      constructor Create;
      destructor Destroy; override;
   end;

   TProjectedCalvingData = class
   private
      FHasData : Boolean;
      FCows : TQuery;
      F1stLactHeifers : TQuery;
      FToBeCulled : TQuery;
      FServed : TQuery;
      FPDd : TQuery;
      FItems : TList;
      FMeanCalvingInterval: Integer;
      FMeanProjCalvingInterval: Integer;
      procedure OpenQueries;
      procedure ProcessData;
   public
      constructor Create;
      destructor Destroy; override;
      procedure Load;
      property Items : TList read FItems;
      property MeanCalvingInterval : Integer read FMeanCalvingInterval;
      property MeanProjCalvingInterval : Integer read FMeanProjCalvingInterval;
   end;

implementation

{ TProjectedCalvingData }

constructor TProjectedCalvingData.Create;
begin
   FCows := TQuery.Create(nil);
   F1stLactHeifers := TQuery.Create(nil);
   FToBeCulled := TQuery.Create(nil);
   FServed := TQuery.Create(nil);
   FPDd := TQuery.Create(nil);
   FItems := TList.Create;
end;

procedure TProjectedCalvingData.Load;
begin
   OpenQueries();
end;

procedure TProjectedCalvingData.OpenQueries;
begin
   FCows.DatabaseName := AliasName;
   FCows.SQL.Clear;
   FCows.SQL.Add('SELECT A.ID AnimalID, A.LactNo, C1.EventDate ThisCalvingDate, C2.EventDate LastCalvingDate');
   FCows.SQL.Add('FROM Animals A');
   FCows.SQL.Add('LEFT JOIN Events C1 ON (C1.AnimalID = A.ID)');
   FCows.SQL.Add('LEFT JOIN Events C2 ON (C2.AnimalID = A.ID)');
   FCows.SQL.Add('WHERE (C1.AnimalLactNo = A.LactNo)');
   FCows.SQL.Add('AND   (C1.EventType = '+IntToStr(CCalvingEvent)+')');
   FCows.SQL.Add('AND   (C2.AnimalLactNo = A.LactNo-1)');
   FCows.SQL.Add('AND   (C2.EventType = '+IntToStr(CCalvingEvent)+')');
   FCows.SQL.Add('AND   (A.InHerd = True)');
   FCows.SQL.Add('AND   (A.AnimalDeleted = False)');
   FCows.SQL.Add('AND   (A.HerdID IN (Select DefaultHerdID From Defaults))');
   FCows.SQL.Add('AND   (A.LactNo > 1)');
   FCows.Open;

   F1stLactHeifers.DatabaseName := AliasName;
   F1stLactHeifers.SQL.Clear;
   F1stLactHeifers.SQL.Add('SELECT A.ID AnimalID, A.LactNo, C1.EventDate ThisCalvingDate');
   F1stLactHeifers.SQL.Add('FROM Animals A');
   F1stLactHeifers.SQL.Add('LEFT JOIN Events C1 ON (C1.AnimalID = A.ID)');
   F1stLactHeifers.SQL.Add('WHERE (C1.AnimalLactNo = A.LactNo)');
   F1stLactHeifers.SQL.Add('AND   (C1.EventType = '+IntToStr(CCalvingEvent)+')');
   F1stLactHeifers.SQL.Add('AND   (A.InHerd = True)');
   F1stLactHeifers.SQL.Add('AND   (A.AnimalDeleted = False)');
   F1stLactHeifers.SQL.Add('AND   (A.HerdID IN (Select DefaultHerdID From Defaults))');
   F1stLactHeifers.SQL.Add('AND   (A.LactNo = 1)');
   F1stLactHeifers.Open;

   FHasData := ( FCows.RecordCount > 0 ) or ( F1stLactHeifers.RecordCount > 0 );
   if ( not(FHasData) ) then Exit;

   FToBeCulled.DatabaseName := AliasName;
   FToBeCulled.SQL.Clear;
   FToBeCulled.SQL.Add('SELECT A.ID AnimalID, E.EventDate');
   FToBeCulled.SQL.Add('FROM Animals A');
   FToBeCulled.SQL.Add('LEFT JOIN Events E ON (E.AnimalID = A.ID)');
   FToBeCulled.SQL.Add('WHERE (A.LactNo = E.AnimalLactNo)');
   FToBeCulled.SQL.Add('AND   (E.EventType = '+IntToStr(CToBeCulledEvent)+')');
   FToBeCulled.SQL.Add('AND   (A.InHerd = True)');
   FToBeCulled.SQL.Add('AND   (A.AnimalDeleted = False)');
   FToBeCulled.SQL.Add('AND   (A.HerdID IN (SELECT DefaultHerdID FROM Defaults))');
   FToBeCulled.SQL.Add('AND   (A.LactNo > 0)');
   FToBeCulled.Open;

   FServed.DatabaseName := AliasName;
   FServed.SQL.Clear;
   FServed.SQL.Add('SELECT A.ID AnimalID, A.LactNo, S.EventDate ServiceDate, BR.GestationPeriod');
   FServed.SQL.Add('FROM Animals A');
   FServed.SQL.Add('LEFT JOIN Events S ON (S.AnimalID = A.ID)');
   FServed.SQL.Add('LEFT JOIN Services SE ON (SE.EventID = S.ID)');
   FServed.SQL.Add('LEFT JOIN Animals B ON (B.ID = SE.ServiceBull)');
   FServed.SQL.Add('LEFT JOIN Breeds BR ON (BR.ID = B.PrimaryBreed)');
   FServed.SQL.Add('WHERE (S.EventType = '+IntToStr(CServiceEvent)+')');
   FServed.SQL.Add('AND   (S.AnimalLactNo = A.LactNo)');
   FServed.SQL.Add('AND   (A.InHerd = True)');
   FServed.SQL.Add('AND   (A.AnimalDeleted = False)');
   FServed.SQL.Add('AND   (A.HerdID IN (SELECT DefaultHerdID FROM Defaults))');
   FServed.SQL.Add('ORDER BY S.EventDate DESC');
   FServed.Open;

   FPDd.DatabaseName := AliasName;
   FPDd.SQL.Clear;
   FPDd.SQL.Add('SELECT A.ID AnimalID, A.LactNo, P.EventDate PDDate, PD.DaysInCalf, PD.PregnancyStatus');
   FPDd.SQL.Add('FROM Animals A');
   FPDd.SQL.Add('LEFT JOIN Events P ON (P.AnimalID = A.ID)');
   FPDd.SQL.Add('LEFT JOIN PregnancyDiag PD ON (PD.EventID = P.ID)');
   FPDd.SQL.Add('WHERE (P.EventType = '+IntToStr(CPregDiagEvent)+')');
   FPDd.SQL.Add('AND   (P.AnimalLactNo = A.LactNo)');
   FPDd.SQL.Add('AND   (A.InHerd = True)');
   FPDd.SQL.Add('AND   (A.AnimalDeleted = False)');
   FPDd.SQL.Add('AND   (A.HerdID IN (SELECT DefaultHerdID FROM Defaults))');
   FPDd.SQL.Add('AND   (PD.PregnancyStatus = True)');
   FPDd.Open;

   ProcessData;
end;

procedure TProjectedCalvingData.ProcessData;
var
   Item : TProjectedItem;
   ActualCalfInterval, ProjCalfInterval, CalfInterval,
   ActualCowNum,
   i, ProjCowNum : Integer;

   function GetProjCalvingDate ( AAnimalID : Integer; ADataSet : TDataSet ) : TDateTime;
   var
      Gestation, NoDaysPreg : Integer;
      ServiceDate, PDDate : TDateTime;
   begin
      Result := 0;
      if ( not(FToBeCulled.Locate('AnimalID',AAnimalID,[])) ) then
         begin
            if ( FServed.RecordCount > 0 ) then
               if ( FServed.Locate('AnimalID',AAnimalID,[]) ) then
                  begin
                     ServiceDate := FServed.FieldByName('ServiceDate').AsDateTime;
                     Gestation := FServed.FieldByName('GestationPeriod').AsInteger;
                     if ( Gestation = 0 ) then
                        Gestation := cGestationPeriod;
                  end;

            if ( FPDd.RecordCount > 0 ) then
               if ( FPDd.Locate('AnimalID',AAnimalID,[]) ) then
                  begin
                     PDDate := FPDd.FieldByName('PDDate').AsDateTime;
                     NoDaysPreg := FPDd.FieldByName('DaysInCalf').AsInteger;
                  end;

            if ( (PDDate > 0) and (ServiceDate > 0) and (PDDate > ServiceDate) ) and
               ( (NoDaysPreg > 0 ) and (NoDaysPreg < Gestation) ) and
                ( PDDate > ADataSet.FieldByName('ThisCalvingDate').AsDateTime ) then
               Result := PDDate + ( Gestation - NoDaysPreg )
            else if ( (PDDate > 0) and (ServiceDate > 0) and (NoDaysPreg = 0) ) or
                    ( (PDDate = 0) and (ServiceDate > 0) ) and
                    ( ServiceDate > ADataSet.FieldByName('ThisCalvingDate').AsDateTime ) then
               Result := ServiceDate + Gestation
         end;
   end;

begin
   Items.Clear;
   FMeanCalvingInterval:= 0;
   FMeanProjCalvingInterval:= 0;
   ActualCalfInterval := 0;
   ProjCalfInterval := 0;
   CalfInterval := 0;
   ActualCowNum := 0;
   ProjCowNum := 0;

   // Cows that should have a this calving date and last calving date are lact > 1.
   if ( FCows.RecordCount > 0 ) then
      begin
         FCows.First;
         while ( not(FCows.Eof) ) do
            begin
               Item := TProjectedItem.Create;
               Item.AnimalID := FCows.FieldByName('AnimalID').AsInteger;
               Item.AnimalLactNo := FCows.FieldByName('LactNo').AsInteger;
               Item.ThisCalvingDate := FCows.FieldByName('ThisCalvingDate').AsDateTime;
               Item.LastCalvingDate := FCows.FieldByName('LastCalvingDate').AsDateTime;
               Item.ProjCalvingDate := GetProjCalvingDate(FCows.FieldByName('AnimalID').AsInteger,FCows);

               Items.Add(pointer(Item));

               FCows.Next;
            end;
      end;

   // Heifers that have this calving date no last calving date are on lact no 1.
   if ( F1stLactHeifers.RecordCount > 0 ) then
      begin
         F1stLactHeifers.First;
         while ( not(F1stLactHeifers.Eof) ) do
            begin
               Item := TProjectedItem.Create;
               Item.AnimalID := F1stLactHeifers.FieldByName('AnimalID').AsInteger;
               Item.AnimalLactNo := F1stLactHeifers.FieldByName('LactNo').AsInteger;
               Item.ThisCalvingDate := F1stLactHeifers.FieldByName('ThisCalvingDate').AsDateTime;
               Item.ProjCalvingDate := GetProjCalvingDate(F1stLactHeifers.FieldByName('AnimalID').AsInteger,F1stLactHeifers);
               Items.Add(pointer(Item));

               F1stLactHeifers.Next;
            end;
      end;

    for i := 0 to Items.Count-1 do
       begin
          Item := TProjectedItem(Items[i]);
          if ( Item.ThisCalvingDate > 0 ) and ( Item.LastCalvingDate > 0 ) then
             begin
                ActualCalfInterval := ActualCalfInterval + Item.CalvingInterval;
                Inc(ActualCowNum);
             end;
          if ( Item.ProjCalvingDate > 0 ) and ( Item.ThisCalvingDate > 0 ) then
             begin
                ProjCalfInterval := ProjCalfInterval + Item.ProjCalvingInterval;
                Inc(ProjCowNum);
             end;
       end;

    if ( ActualCowNum > 0 ) then
       FMeanCalvingInterval := (ActualCalfInterval div ActualCowNum);
    if ( ProjCowNum > 0 ) then
       FMeanProjCalvingInterval := (ProjCalfInterval div ProjCowNum);
end;

destructor TProjectedCalvingData.Destroy;
var
   i : Integer;
   Item : TProjectedItem;
begin
   inherited;
   if ( FCows <> nil ) then
      FreeAndNil(FCows);
   if ( F1stLactHeifers <> nil ) then
      FreeAndNil(F1stLactHeifers);
   if ( FToBeCulled <> nil ) then
      FreeAndNil(FToBeCulled);
   if ( FServed <> nil ) then
      FreeAndNil(FServed);
   if ( FPDd <> nil ) then
      FreeAndNil(FPDd);
   if (FItems <> nil) then
      begin
         for i := 0 to FItems.Count-1 do
            begin
               Item := TProjectedItem(Items[i]);
               Item.Free;
            end;
         FreeAndNil(FItems);
      end;
end;

{ TProjAnimalData }

constructor TProjectedItem.Create;
begin
   FAnimalID:= 0;
   FAnimalLactNo:= 0;
   FThisCalvingDate := 0;
   FLastCalvingDate := 0;
   FProjCalvingDate := 0;
end;

destructor TProjectedItem.Destroy;
begin
  inherited;
end;

function TProjectedItem.GetCalvingInterval: Integer;
begin
   Result := 0;
   if ( FThisCalvingDate > 0 ) and ( FLastCalvingDate > 0 ) then
      Result := Round(FThisCalvingDate - FLastCalvingDate);
end;

function TProjectedItem.GetProjCalvingInterval: Integer;
begin
   Result := 0;
   if ( FProjCalvingDate > 0 ) and ( FThisCalvingDate > 0 ) then
      Result := Round(FProjCalvingDate - FThisCalvingDate);
end;

end.
