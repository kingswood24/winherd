{
   11/04/12 [V5.0 R4.8] /MK Additional Feature - New Function For CheckEvents For AnimalID, LactNo, EventType & EventDate.

   28/01/16 [V5.5 R2.4] /MK Additional Feature - New function, GetLastCalvingLactationNum, created to get the lactno of last calving of date specified.

   14/09/17 [V5.7 R3.0] /MK Additional Feature - New function, GetAnimalPurchaseDate, created to get purchase date for AnimalID.
                            Change - Changed GetSaleEventDate and GetDeathEventDate to GetAnimalSaleEventDate and GetAnimalDeathEventDate to be more descriptive.

   22/09/17 [V5.7 R3.0] /MK Additional Feature - New function GetAnimalLeftHerdDate which returns the sale or death date.

   09/03/18 [V5.7 R8.2] /MK Additional Feature - CanCalcOverallGainPerDay - New function to check if there are 2 sets of weighings for overall gain per day calc.

   25/04/18 [V5.7 R9.0] /MK Change - Added functions to get PreSaleEventID and PreSaleWeight.

   25/05/18 [V5.8 R0.2] /MK Bug Fix - GetAnimalPreSaleEventID - Changed query as result was showing animals that were sold not presale.

   27/06/18 [V5.8 R0.6] /MK Additional Feature - GetAnimal_First_Last_WeighingRecord - Created a new function that returns a TWeighingRecord for first or last weighing of animal.
                            Change - GetAnimalOverallGainPerDay - Used new GetAnimal_First_Last_WeighingRecord to get first and last weighing info instead of mutiple SQL's.
                                                                - Removed the updating of the animals table from this function.

   02/10/18 [V5.8 R3.0] /MK Additional Feature - Create TSaleEventInfo which hold all info for a sale/death event.
                                               - TEventDataHelper.GetSaleDeathRecord - New function that returns the new TSaleEventInfo class.

   17/05/19 [V5.8 R9.2] /MK Additional Feature - Created a TTempMovementInfo class that creates a temp table of all temp movement events with the detail of each event.

   16/08/19 [V5.9 R0.0] /MK Change - GetSaleDeathRecord - Allowed a SaleDate to be passed in to get an exact sale record.

   07/01/20 [V5.9 R1.6] /MK Change - TTempMovementInfo - Only add TempMovement events for animals that are still off farm, useful for when more than one Temp Movement event exists - Bellair Est.

   18/02/20 [V5.9 R2.3] /MK Bug Fix - GetAnimalNullLeftHerdEventID - Need to check for existance of the sale/death event in the SalesDeaths table to properly ascertain its a null event.

   21/08/20 [V5.9 R5.5] /MK Additional Feature - Added new Classes to get Purchase info and PreSale info.

   12/11/20 [V5.9 R7.2] /MK Bug Fix - Any query using PreSale = False should also use PreSale IS NULL as it won't return data if the PreSale is null.      
}

unit uEventDataHelper;

interface
uses
   SysUtils, Db, DbTables, Dialogs, GenTypesConst, uApplicationLog,
   uHerdOwner, KDBRoutines, uAnimal, KRoutines;

type
   TTempMovementInfo = class
   private
      FTempMoveEvents : TTable;
      FQuery : TQuery;
   public
      constructor Create;
      destructor Destroy;override;
      function GetIsStillOffFarm ( AAnimalID : Integer ) : Boolean;
      function BringBackAnimal ( AAnimalID : Integer; ADateMovedBack : TDateTime ) : Boolean;
   end;

   TSaleEventInfo = class
   private
      FPreSale: Boolean;
      FSoldStatus: Boolean;
      FRightWt: Double;
      FAnimalPrice: Double;
      FLeftWt: Double;
      FAnimalWeight: Double;
      FKillOut: Double;
      FColdDeadWt: Double;
      FCustomerCosts: Double;
      FSalesGroupID: Integer;
      FEventDate: TDateTime;
      FCustomerID: Integer;
      FCarcassSex: String;
      FGrade: String;
      FAnimalInfo: TAnimal;
      FWeighingDate: TDateTime;
      FFeedEndDate: TDateTime;
      FPricePerKg: Double;
      FKillNumber: String;
      FEventID: Integer;
   public
      constructor create;
      destructor destroy;override;
      property AnimalInfo : TAnimal read FAnimalInfo write FAnimalInfo;
      property EventID : Integer read FEventID write FEventID;
      property EventDate : TDateTime read FEventDate write FEventDate;
      property SoldStatus : Boolean read FSoldStatus write FSoldStatus;
      property PreSale : Boolean read FPreSale write FPreSale;
      property CustomerID : Integer read FCustomerID write FCustomerID;
      property AnimalPrice : Double read FAnimalPrice write FAnimalPrice;
      property AnimalWeight : Double read FAnimalWeight write FAnimalWeight;
      property CustomerCosts : Double read FCustomerCosts write FCustomerCosts;
      property KillOut : Double read FKillOut write FKillOut;
      property ColdDeadWt : Double read FColdDeadWt write FColdDeadWt;
      property LeftWt : Double read FLeftWt write FLeftWt;
      property RightWt : Double read FRightWt write FRightWt;
      property PricePerKg : Double read FPricePerKg write FPricePerKg;
      property KillNumber : String read FKillNumber write FKillNumber;
      property Grade : String read FGrade write FGrade;
      property CarcassSex : String read FCarcassSex write FCarcassSex;
      property SalesGroupID : Integer read FSalesGroupID write FSalesGroupID;
      property FeedEndDate : TDateTime read FFeedEndDate write FFeedEndDate;
      property WeighingDate : TDateTime read FWeighingDate write FWeighingDate;
   end;

   TPurchaseEventInfo = class
   private
     FWeight: Double;
     FEventID: Integer;
     FAnimalInfo: TAnimal;
     FEventDate: TDateTime;
   published
       constructor create;
       destructor destroy;override;
       property AnimalInfo : TAnimal read FAnimalInfo write FAnimalInfo;
       property EventID : Integer read FEventID write FEventID;
       property EventDate : TDateTime read FEventDate write FEventDate;
       property Weight : Double read FWeight write FWeight;
    end;

   TPreSaleEventInfo = class
   private
     FWeight: Double;
     FEventID: Integer;
     FAnimalInfo: TAnimal;
     FEventDate: TDateTime;
   published
       constructor create;
       destructor destroy;override;
       property AnimalInfo : TAnimal read FAnimalInfo write FAnimalInfo;
       property EventID : Integer read FEventID write FEventID;
       property EventDate : TDateTime read FEventDate write FEventDate;
       property Weight : Double read FWeight write FWeight;
    end;

   TEventDataHelper = class
   private
      FQuery : TQuery;
      FTable : TTable;
   public
      function GetLastEventDate(const AID, AEventType : Integer; ABeforeDate : TDateTime) : TDateTime;overload;
      function GetLastEventDate(const AID, LactNo, EventType : Integer) : TDateTime;overload;
      function GetLastEventDate(const AID, EventType : Integer) : TDateTime;overload;
      function GetFirstEventDate(const AID, LactNo, EventType : Integer) : TDateTime;overload;
      function GetFirstEventDate(const AID, EventType : Integer) : TDateTime;overload;
      function HasEventRecordedForDate(const AID, AEventType : Integer; AEventDate : TDateTime) : Boolean;
      function GetAnimalPurchaseEventDate(const AID : Integer) : TDateTime;
      function GetAnimalBirthDate(const AID : Integer) : TDateTime;
      function GetAnimalEnterHerdDate(const AID : Integer) : TDateTime;
      //   11/04/12 [V5.0 R4.8] /MK Additional Feature - New Function For CheckEvents For AnimalID, LactNo, EventType & EventDate.
      function CheckEventExists(AID, ALact, AEventType: Integer; AEventDate: TDateTime): Boolean;
      function GetEventDateBetweenDates(const AID, AEventType: Integer; AFromDate, AToDate: TDateTime): TDateTime;
      function GetLastCalvingLactationNum(AAnimalID, AAnimalLactNo: Integer; AEventDate: TDateTime): Integer;
      function EventDetailRecordExists (AEventID, AEventType : Integer) : Boolean;
      function GetPlannedBull (AAnimalID, ALactNo : Integer; const ABeforeDate : TDateTime = 0) : Integer;
      function GetPlannedBullRcmdBullInd(AAnimalID, ALactNo : Integer; AEventDate: TDateTime) : Integer;
      function GetEventID(AAnimalID, AAnimalLactNo, AEventType : Integer; const AEventDate : TDateTime = 0) : Integer;
      function TreatmentEventExists(AAnimalID, ADrugID : Integer; ATreatmentDate : TDateTime) : Boolean;

      function EventIdExists(AEventId : Integer) : Boolean;

      // Weighings
      function CanCalcOverallGainPerDay : Boolean;

      function GetAnimalBirthWeight(AAnimalID : Integer) : Double;
      function GetAnimalPurchaseWeight(AAnimalID : Integer) : Double;
      function GetAnimalSaleWeight(AAnimalID : Integer) : Double;

      function GetAnimalFirstWeighType(AAnimalID : Integer) : TWeighType;
      function GetAnimalFirstWeighDate(AAnimalID : Integer) : TDateTime;
      function GetAnimalFirstWeight(AAnimalID : Integer) : Double;

      function GetAnimalFirstWeighingEventDate(AAnimalID : Integer) : TDateTime;
      function GetAnimalFirstWeighingEventWeight(AAnimalID : Integer) : TDateTime;

      function GetAnimalLastWeighType(AAnimalID : Integer) : TWeighType;
      function GetAnimalLastWeighDate(AAnimalID : Integer) : TDateTime;
      function GetAnimalLastWeight(AAnimalID : Integer) : Double;

      function GetAnimalLastWeighingEventDate(AAnimalID : Integer) : TDateTime;
      function GetAnimalLastWeighingEventWeight(AAnimalID : Integer) : TDateTime;

      function GetAnimalOverallGainPerDay(AAnimalID : Integer) : Double;

      function GetAnimal_First_Last_WeighingRecord(AAnimalID: Integer; AFirstWeighing : Boolean): TWeighingRecord;

      function GetWeighDateWeight ( AAnimalID : Integer; AWeighDate : TDateTime ) : Double;

      // Sales
      function GetAnimalPreSaleEventID(AAnimalID : Integer) : Integer;
      function GetAnimalPreSaleWeight(AAnimalID : Integer) : Double;
      function GetAnimalLeftHerdEventID(AAnimalID : Integer) : Integer;
      function GetAnimalSaleEventID(AAnimalID : Integer) : Integer;
      function GetAnimalDeathEventID(AAnimalID : Integer) : Integer;
      function GetAnimalNullLeftHerdEventID(AAnimalID : Integer) : Integer;
      function GetSaleDeathRecord(AAnimalID: Integer; const ASaleDate : TDateTime = 0): TSaleEventInfo;
      function GetSaleDeathEventDate(const AID : Integer; const ASold : Boolean) : TDateTime;
      function GetAnimalDeathEventDate(const AID : Integer) : TDateTime;
      function GetAnimalSaleEventDate(const AID : Integer) : TDateTime;
      function GetAnimalLeftHerdDate(const AID : Integer) : TDateTime;

      // Purchase
      function GetPurchaseRecord(AAnimalID: Integer; const APurchDate : TDateTime = 0): TPurchaseEventInfo;

      // PreSale Event
      function GetPreSaleRecord(AAnimalID : Integer) : TPreSaleEventInfo;

      procedure GetPreSaleStatusInfo(const AID : Integer; const ASalesDate : TDateTime;
            var AStatusInfo : TStatusInfo; ACustomerID : Integer; ACheckBrucellosis : Boolean;
            ACheckTB : Boolean; ADisplayMinimumDays : Boolean);

      constructor Create;
      destructor Destroy;override;
   end;

implementation

{ TEventDataHelper }

constructor TEventDataHelper.Create;
begin
   FQuery := TQuery.Create(nil);
   FQuery.DatabaseName := 'kingswd';

   FTable := TTable.Create(nil);
   FTable.DatabaseName := 'kingswd';
end;

destructor TEventDataHelper.Destroy;
begin
   if ( FQuery <> nil ) then
      begin
         FQuery.Close;
         FreeAndNil(FQuery);
      end;
  inherited;
end;

function TEventDataHelper.GetFirstEventDate(const AID, LactNo, EventType: Integer): TDateTime;
begin
   Result := 0;
   if ( AID = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select Min(EventDate) EDate From Events Where AnimalID = :AID And EventType =:EID');
         if LactNo > -1 then
            SQL.Add('And AnimalLactNo=:AnimalLactNo');
         Params[0].AsInteger := AID;
         Params[1].AsInteger := EventType;
         if LactNo > -1 then
            Params[2].AsInteger := LactNo;
         try
            Open;
            First;
            Result := FieldByName('EDate').AsDateTime;
         except
         end;
      finally
         Free;
      end;
end;

function TEventDataHelper.GetFirstEventDate(const AID,
  EventType: Integer): TDateTime;
begin
   Result := GetFirstEventDate(AID, -1, EventType);
end;

function TEventDataHelper.GetLastEventDate(const AID, LactNo,
  EventType: Integer): TDateTime;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select Max(EventDate) EDate From Events Where AnimalID = :AID And EventType =:EID');
         if ( LactNo > -1 ) then
            SQL.Add('And AnimalLactNo=:AnimalLactNo');
         Params[0].AsInteger := AID;
         Params[1].AsInteger := EventType;
         if ( LactNo > -1 ) then
            Params[2].AsInteger := LactNo;
         try
            Open;
            Result := FieldByName('EDate').AsDateTime;
         except
         end;
      finally
         Free;
      end;
end;

function TEventDataHelper.GetLastEventDate(const AID,
  EventType: Integer): TDateTime;
begin
   Result := GetLastEventDate(AID, -1, EventType);
end;

function TEventDataHelper.GetLastEventDate(const AID, AEventType: Integer; ABeforeDate: TDateTime): TDateTime;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select Max(EventDate) EDate From Events Where AnimalID = :AID And EventType =:EID');
         if ( ABeforeDate > 0 ) then
            SQL.Add('And EventDate<:ED');
         Params[0].AsInteger := AID;
         Params[1].AsInteger := AEventType;
         if ( ABeforeDate > 0 ) then
            Params[2].AsDateTime := ABeforeDate;
         try
            Open;
            First;
            Result := FieldByName('EDate').AsDateTime;
         except
         end;
      finally
         Free;
      end;
end;

function TEventDataHelper.GetSaleDeathEventDate(const AID : Integer;
  const ASold : Boolean) : TDateTime;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT E.EventDate EDate');
         SQL.Add('FROM Events E');
         SQL.Add('LEFT JOIN SalesDeaths S ON (S.EventID=E.ID)');
         SQL.Add('WHERE ((AnimalID = :AID) AND (EventType = 11 ))');
         SQL.Add('AND   (S.Sold=:ASold)');
         SQL.Add('AND   ((S.PreSale = False) OR (S.PreSale IS NULL))');
         Params[0].AsInteger := AID;
         Params[1].AsBoolean := ASold;
         Open;
         try
            First;
            if ( RecordCount = 0 ) then Exit;
            Result := FieldByName('EDate').AsDateTime;
         finally
            Close;
         end;
      finally
         Close;
      end;
end;

function TEventDataHelper.GetAnimalSaleEventDate(const AID: Integer): TDateTime;
begin
   Result := 0;
   Result := GetSaleDeathEventDate(AID, True);
end;

function TEventDataHelper.GetAnimalDeathEventDate(const AID: Integer): TDateTime;
begin
   Result := 0;
   Result := GetSaleDeathEventDate(AID, False);
end;

function TEventDataHelper.GetAnimalLeftHerdDate(const AID: Integer): TDateTime;
begin
   Result := 0;
   if ( AID <= 0 ) then Exit;
   Result := GetAnimalSaleEventDate(AID);
   if ( Result <= 0 ) then
      Result := GetAnimalDeathEventDate(AID);
end;

function TEventDataHelper.GetAnimalPurchaseEventDate(const AID: Integer): TDateTime;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT E.EventDate EDate');
         SQL.Add('FROM Events E');
         SQL.Add('WHERE ((AnimalID = :AID) AND (EventType = '+IntToStr(CPurchaseEvent)+' ))');
         Params[0].AsInteger := AID;
         Open;
         try
            if ( RecordCount = 0 ) then Exit;
            First;
            Result := FieldByName('EDate').AsDateTime;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

function TEventDataHelper.GetAnimalBirthDate(const AID: Integer): TDateTime;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT DateOfBirth');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE ID = :AAnimalID');
         Params[0].AsInteger := AID;
         try
            Open;
            Result := Fields[0].AsDateTime;
         except
         end;
      finally
         Free;
      end;
end;

function TEventDataHelper.GetAnimalEnterHerdDate(const AID: Integer): TDateTime;
begin
   Result := 0;
   Result := GetAnimalPurchaseEventDate(AID);
   if ( Result = 0 ) then
      Result := GetAnimalBirthDate(AID);
end;

function TEventDataHelper.CheckEventExists(AID, ALact, AEventType: Integer;
  AEventDate: TDateTime): Boolean;
begin
   Result := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT * FROM Events');
         SQL.Add('WHERE AnimalID = :AID');
         SQL.Add('AND AnimalLactNo = :ALact');
         SQL.Add('AND EventType = :AEventType');
         SQL.Add('AND EventDate = :AEventDate');
         Params[0].AsInteger := AID;
         Params[1].AsInteger := ALact;
         Params[2].AsInteger := AEventType;
         Params[3].AsDateTime := AEventDate;
         Open;
         try
            First;
            if ( RecordCount > 0 ) then
               Result := True;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

function TEventDataHelper.GetEventDateBetweenDates(const AID,
  AEventType: Integer; AFromDate, AToDate: TDateTime): TDateTime;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select EventDate From Events Where AnimalID = :AID And EventType =:EID');
         SQL.Add('And EventDate Between :ED1 And :ED2');
         Params[0].AsInteger := AID;
         Params[1].AsInteger := AEventType;
         Params[2].AsDateTime := AFromDate;
         Params[3].AsDateTime := AToDate;
         Open;
         try
            First;
            Result := FieldByName('EventDate').AsDateTime;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

function TEventDataHelper.HasEventRecordedForDate(const AID, AEventType: Integer;
  AEventDate: TDateTime): Boolean;
begin
   Result := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select Min(EventDate) EDate');
         SQL.Add('From Events');
         SQL.Add('Where AnimalID = :AID');
         SQL.Add('And EventType =:EID');
         SQL.Add('And EventDate =:EventDate');
         Params[0].AsInteger := AID;
         Params[1].AsInteger := AEventType;
         Params[2].AsDateTime := AEventDate;
         Open;
         try
            First;
            Result := FieldByName('EDate').AsDateTime>0;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

function TEventDataHelper.GetLastCalvingLactationNum (AAnimalID, AAnimalLactNo : Integer;
   AEventDate : TDateTime) : Integer;
var
   dLastCalvingDate : TDateTime;
begin
   Result := AAnimalLactNo;
   if ( AAnimalID = 0 ) then Exit;
   dLastCalvingDate := 0;
   dLastCalvingDate := GetLastEventDate(AAnimalID, 5, AEventDate);
   if ( dLastCalvingDate = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT AnimalLactNo');
         SQL.Add('FROM Events');
         SQL.Add('WHERE (AnimalID = :AnimalID)');
         SQL.Add('AND   (EventType = 5)');
         SQL.Add('AND   (EventDate = "'+FormatDateTime('mm/dd/yyyy',dLastCalvingDate)+'")');
         Params[0].AsInteger := AAnimalID;
         try
            Open;
            if ( RecordCount > 0 ) then
               Result := Fields[0].AsInteger;
         except
         end;
         Close;
      finally
         Free;
      end;
end;

function TEventDataHelper.EventDetailRecordExists(AEventID, AEventType: Integer): Boolean;
var
   sTableName : String;
begin
   Result := True;
   if ( AEventID = 0 ) or ( AEventType = 0 ) then Exit;
   sTableName := '';
   case AEventType of
      CPurchaseEvent : sTableName := 'Purchases';
      CSaleDeathEvent : sTableName := 'SalesDeaths';
   end;
   if ( Length(sTableName) > 0 ) then
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT *');
            SQL.Add('FROM '+sTableName+'');
            SQL.Add('WHERE EventID = '+IntToStr(AEventID)+'');
            Open;
            Result := ( RecordCount > 0 );
         finally
            Free;
         end;
end;

function TEventDataHelper.GetPlannedBull(AAnimalID, ALactNo: Integer; const ABeforeDate: TDateTime): Integer;
var
   qPlannedBull : TQuery;
begin
   Result := 0;
   if ( AAnimalID = 0 ) then Exit;
   qPlannedBull := TQuery.Create(nil);
   with qPlannedBull do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT B.PlannedBull, E.EventDate, E.EventType');
         SQL.Add('FROM Bullings B');
         SQL.Add('LEFT JOIN Events E On (B.EventID = E.ID)');
         SQL.Add('WHERE (E.AnimalID = '+IntToStr(AAnimalID)+')');
         SQL.Add('AND   (E.AnimalLactNo = '+IntToStr(ALactNo)+')');
         SQL.Add('AND   (E.EventType IN ('+IntToStr(CBullingEvent)+','+IntToStr(CPlannedBull)+')) ');
         SQL.Add('AND   ( (B.RcmdBullInd = 1) OR (B.RcmdBullInd IS NULL) )');
         if ( ABeforeDate > 0 ) then
            SQL.Add('AND   (E.EventDate <= "'+FormatDateTime(cUSDateStyle,ABeforeDate)+'")');
         SQL.Add('ORDER BY E.EventDate DESC');
         Open;
         try
            First;
            while ( not(Eof) ) do
               begin
                  if ( Fields[0].AsInteger > 0 ) and ( Fields[2].AsInteger in [CBullingEvent, CPlannedBull] ) then
                     begin
                        Result := Fields[0].AsInteger;
                        Break;
                     end;
                  Next;
               end;
         finally
            Close;
         end;
      finally
         FreeAndNil(qPlannedBull);
      end;
end;

function TEventDataHelper.GetPlannedBullRcmdBullInd(AAnimalID, ALactNo : Integer;
   AEventDate : TDateTime) : Integer;
var
   qPlannedBull : TQuery;
begin
   Result := 1;
   if ( AAnimalID = 0 ) then Exit;
   qPlannedBull := TQuery.Create(nil);
   with qPlannedBull do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT MAX(B.RcmdBullInd)');
         SQL.Add('FROM Bullings B');
         SQL.Add('LEFT JOIN Events E On (B.EventID = E.ID)');
         SQL.Add('WHERE (E.AnimalID = '+IntToStr(AAnimalID)+')');
         SQL.Add('AND   (E.AnimalLactNo = '+IntToStr(ALactNo)+')');
         SQL.Add('AND   (E.EventType = '+IntToStr(CPlannedBull)+') ');
         SQL.Add('AND   (E.EventDate = "'+FormatDateTime(cUSDateStyle,AEventDate)+'")');
         SQL.Add('AND   (B.RcmdBullInd IS NOT NULL)');
         Open;
         try
            if ( RecordCount > 0 ) then
               Result := Fields[0].AsInteger+1;
         finally
            Close;
         end;
      finally
         FreeAndNil(qPlannedBull);
      end;
end;

function TEventDataHelper.GetEventID(AAnimalID, AAnimalLactNo, AEventType: Integer;
   const AEventDate: TDateTime = 0): Integer;
begin
   Result := 0;
   if ( AAnimalID = 0 ) or ( AEventType = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID');
         SQL.Add('FROM Events');
         SQL.Add('WHERE (AnimalID = '+IntToStr(AAnimalID)+')');
         SQL.Add('AND   (AnimalLactNo = '+IntToStr(AAnimalLactNo)+')');
         SQL.Add('AND   (EventType = '+IntToStr(AEventType)+')');
         if ( AEventDate > 0 ) then
            SQL.Add('AND   (EventDate = "'+FormatDateTime(cUSDateStyle,AEventDate)+'")');
         try
            Open;
            if ( RecordCount = 0 ) then Exit;
            Result := Fields[0].AsInteger; 
         except
         end;
      finally
         Free;
      end;
end;

function TEventDataHelper.TreatmentEventExists(AAnimalID, ADrugID: Integer;
  ATreatmentDate: TDateTime): Boolean;
begin
   Result := False;
   if ( AAnimalID = 0 ) or ( ADrugID = 0 ) or ( ATreatmentDate = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT E.ID');
         SQL.Add('FROM Events E');
         SQL.Add('LEFT JOIN Health H ON (H.EventID = E.ID)');
         SQL.Add('WHERE E.AnimalID = '+IntToStr(AAnimalID)+'');
         SQL.Add('AND   E.EventDate = "'+FormatDateTime(cUSDateStyle,ATreatmentDate)+'"');
         SQL.Add('AND   E.EventType IN ('+IntToStr(CHealthEvent)+', '+IntToStr(CDryOffEvent)+', '+IntToStr(CHerdVaccination)+')');
         SQL.Add('AND   H.DrugUsed = '+IntToStr(ADrugID)+'');
         Open;
         Result := ( RecordCount > 0 ) or ( Fields[0].AsInteger > 0 );
      finally
         Close;
         Free;
      end;
end;

function TEventDataHelper.CanCalcOverallGainPerDay: Boolean;
var
   bHasBirthWeights,
   bHasPurchWeights,
   bHasWeighings,
   bHasMultiWeighEvents : Boolean;
begin
   Result := False;
   bHasBirthWeights := False;
   bHasPurchWeights := False;
   bHasWeighings := False;
   bHasMultiWeighEvents := False;

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         // Get birth weight records.
         SQL.Clear;
         SQL.Add('SELECT A.BirthWeight');
         SQL.Add('FROM Animals A');
         SQL.Add('WHERE A.BirthWeight > 0');
         SQL.Add('AND   A.HerdID IN (SELECT DefaultHerdID FROM Defaults)');
         try
            Open;
            bHasBirthWeights := ( RecordCount > 0 );
            Close;

            // Get purchase weight records.
            SQL.Clear;
            SQL.Add('SELECT E.*');
            SQL.Add('FROM Events E');
            SQL.Add('LEFT JOIN Purchases P ON (P.EventID = E.ID)');
            SQL.Add('WHERE E.EventType = :Purchases');
            SQL.Add('AND   E.HerdID IN (SELECT DefaultHerdID FROM Defaults)');
            SQL.Add('AND   P.Weight > 0');
            Params[0].AsInteger := CPurchaseEvent;
            Open;
            bHasPurchWeights := ( RecordCount > 0 );
            Close;

            // Get weighing event records.
            SQL.Clear;
            SQL.Add('SELECT E.*');
            SQL.Add('FROM Events E');
            SQL.Add('LEFT JOIN Weights W ON (W.EventID = E.ID)');
            SQL.Add('WHERE E.EventType = :Weighings');
            SQL.Add('AND   E.HerdID IN (SELECT DefaultHerdID FROM Defaults)');
            SQL.Add('AND   W.Weight > 0');
            Params[0].AsInteger := CWeightEvent;
            Open;
            bHasWeighings := ( RecordCount > 0 );
            Close;

            // Get the number of weighing events for all animals that have weighing events.
            SQL.Clear;
            SQL.Add('SELECT DISTINCT(E.AnimalID), COUNT(E.AnimalID)');
            SQL.Add('FROM Events E');
            SQL.Add('LEFT JOIN Weights W ON (W.EventID = E.ID)');
            SQL.Add('WHERE E.EventType = :Weighings');
            SQL.Add('AND   E.HerdID IN (SELECT DefaultHerdID FROM Defaults)');
            SQL.Add('AND   W.Weight > 0');
            SQL.Add('GROUP BY E.AnimalID');
            SQL.Add('HAVING COUNT(E.AnimalID) > 1');
            Params[0].AsInteger := CWeightEvent;
            Open;
            bHasMultiWeighEvents := ( RecordCount > 0 );

            Close;
            // If user has birth or purchase weight record as well as normal weighings then lifetime calc will work.
            Result := ( (bHasBirthWeights or bHasPurchWeights) and bHasWeighings);
            // If user does not have birth or purchase weights recorded but if the animals have more than one weighing event then lifetime calc will work. 
            if ( not(Result) ) then
               Result := bHasMultiWeighEvents;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function TEventDataHelper.GetAnimalBirthWeight(AAnimalID: Integer): Double;
begin
   Result := 0;
   if ( AAnimalID = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT BirthWeight');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE ID = :AAnimalID');
         Params[0].AsInteger := AAnimalID;
         try
            Open;
            if ( RecordCount > 0 ) and ( Fields[0].AsFloat > 0 ) then
               Result := Fields[0].AsFloat;
         except
         end;
      finally
         Free;
      end;
end;

function TEventDataHelper.GetAnimalPurchaseWeight(AAnimalID: Integer): Double;
begin
   Result := 0;
   if ( AAnimalID = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT P.Weight');
         SQL.Add('FROM Purchases P');
         SQL.Add('LEFT JOIN Events E ON (E.ID = P.EventID)');
         SQL.Add('WHERE E.EventType = :CPurchaseEvent');
         SQL.Add('AND   E.AnimalID = :AAnimalID');
         Params[0].AsInteger := CPurchaseEvent;
         Params[1].AsInteger := AAnimalID;
         try
            Open;
            if ( RecordCount > 0 ) and ( Fields[0].AsFloat > 0 ) then
               Result := Fields[0].AsFloat;
         except
         end;
      finally
         Free;
      end;
end;

function TEventDataHelper.GetAnimalSaleWeight(AAnimalID: Integer): Double;
begin
   Result := 0;
   if ( AAnimalID = 0 ) then Exit;
   if ( GetAnimalLeftHerdDate(AAnimalID) = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT E.AnimalID, E.EventDate, S.Weight, S.Sold');
         SQL.Add('FROM Events E');
         SQL.Add('LEFT JOIN SalesDeaths S ON (S.EventID = E.ID)');
         SQL.Add('WHERE E.EventType = :CSaleEvent');
         SQL.Add('AND   E.AnimalID = :AAnimalID');
         SQL.Add('AND   S.Sold = True');
         Params[0].AsInteger := CSaleDeathEvent;
         Params[1].AsInteger := AAnimalID;
         try
            Open;
            if ( RecordCount > 0 ) and ( Fields[1].AsDateTime > 0 ) and ( Fields[2].AsFloat > 0 ) then
               Result := Fields[2].AsFloat;
         except
         end;
      finally
         Free;
      end;
end;

function TEventDataHelper.GetAnimalFirstWeighType(AAnimalID: Integer): TWeighType;
begin
   Result := wtNone;
   if ( AAnimalID = 0 ) then Exit;
   if ( GetAnimalPurchaseWeight(AAnimalID) > 0 ) then
      Result := wtPurchase
   else if ( GetAnimalBirthWeight(AAnimalID) > 0 ) then
      Result := wtBirth
   else if ( GetAnimalFirstWeighingEventWeight(AAnimalID) > 0 ) then
      Result := wtWeighing;
end;

function TEventDataHelper.GetAnimalFirstWeighDate(AAnimalID: Integer): TDateTime;
var
   WeightType : TWeighType;
begin
   Result := 0;
   if ( AAnimalID = 0 ) then Exit;
   WeightType := GetAnimalFirstWeighType(AAnimalID);
   case WeightType of
      wtPurchase : Result := GetAnimalPurchaseEventDate(AAnimalID);
      wtBirth    : Result := GetAnimalBirthDate(AAnimalID);
      wtWeighing : Result := GetAnimalFirstWeighingEventDate(AAnimalID);
   end;
end;

function TEventDataHelper.GetAnimalFirstWeight(AAnimalID: Integer): Double;
var
   FirstWeighType : TWeighType;
begin
   Result := 0;
   if ( AAnimalID = 0 ) then Exit;
   FirstWeighType := GetAnimalFirstWeighType(AAnimalID);
   case FirstWeighType of
      wtPurchase : Result := GetAnimalPurchaseWeight(AAnimalID);
      wtBirth    : Result := GetAnimalBirthWeight(AAnimalID);
      wtWeighing : Result := GetAnimalFirstWeighingEventWeight(AAnimalID);
   end;
end;

function TEventDataHelper.GetAnimalFirstWeighingEventDate(AAnimalID: Integer): TDateTime;
begin
   Result := 0;
   if ( AAnimalID = 0 ) then Exit;
   // Get animals earliest weight from a weighing event, if any, as the first weight.
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT E.ID, E.EventDate, W.Weight');
         SQL.Add('FROM Events E');
         SQL.Add('LEFT JOIN Weights W ON (W.EventID = E.ID)');
         SQL.Add('WHERE E.EventType = :CWeighing');
         SQL.Add('AND   E.AnimalID = :AAnimalID');
         SQL.Add('AND   W.Weight > 0');
         SQL.Add('ORDER BY EventDate ASC');
         Params[0].AsInteger := CWeightEvent;
         Params[1].AsInteger := AAnimalID;
         try
            Open;
            if ( RecordCount > 0 ) then
               begin
                  First;
                  if ( Fields[2].AsFloat > 0 ) then
                     Result := Fields[1].AsDateTime;
               end;
         except
         end;
      finally
         Free;
      end;
end;

function TEventDataHelper.GetAnimalFirstWeighingEventWeight(AAnimalID: Integer): TDateTime;
var
   iFirstWeighingEvID : Integer;
begin
   Result := 0;
   if ( AAnimalID = 0 ) then Exit;
   // Get animals earliest weight from a weighing event, if any, as the first weight.
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT E.ID, E.EventDate, W.Weight');
         SQL.Add('FROM Events E');
         SQL.Add('LEFT JOIN Weights W ON (W.EventID = E.ID)');
         SQL.Add('WHERE E.EventType = :CWeighing');
         SQL.Add('AND   E.AnimalID = :AAnimalID');
         SQL.Add('AND   W.Weight > 0');
         SQL.Add('ORDER BY EventDate ASC');
         Params[0].AsInteger := CWeightEvent;
         Params[1].AsInteger := AAnimalID;
         try
            Open;
            if ( RecordCount > 0 ) then
               begin
                  First;
                  if ( Fields[2].AsFloat > 0 ) then
                     Result := Fields[2].AsFloat;
               end;
         except
         end;
      finally
         Free;
      end;
end;

function TEventDataHelper.GetAnimalLastWeighType(AAnimalID: Integer): TWeighType;
var
   dSaleDate, dWeighingEventDate : TDateTime; 
begin
   Result := wtNone;
   if ( AAnimalID = 0 ) then Exit;
   if ( GetAnimalLastWeighingEventWeight(AAnimalID) > 0 ) and ( GetAnimalSaleWeight(AAnimalID) > 0 ) then
      begin
         dSaleDate := GetAnimalSaleEventDate(AAnimalID);
         dWeighingEventDate := GetAnimalLastWeighingEventDate(AAnimalID);
         // If the animal was sold more than 7 days after last weighing then the sales live weight is last weight.
         if ( (dSaleDate > dWeighingEventDate) and (Trunc(dSaleDate - dWeighingEventDate ) > 7) ) then
            Result := wtSale
         else
            Result := wtWeighing;
      end
   else if ( GetAnimalLastWeighingEventWeight(AAnimalID) > 0 ) and ( GetAnimalSaleWeight(AAnimalID) = 0 ) then
      Result := wtWeighing
   else if ( GetAnimalPurchaseWeight(AAnimalID) > 0 ) then
      Result := wtPurchase
   else if ( GetAnimalBirthWeight(AAnimalID) > 0 ) then
      Result := wtBirth;
end;

function TEventDataHelper.GetAnimalLastWeighDate(AAnimalID: Integer): TDateTime;
var
   LastWeighType : TWeighType;
begin
   Result := 0;
   if ( AAnimalID = 0 ) then Exit;
   LastWeighType := GetAnimalLastWeighType(AAnimalID);
   case LastWeighType of
      wtWeighing : Result := GetAnimalLastWeighingEventDate(AAnimalID);
      wtPurchase : Result := GetAnimalPurchaseEventDate(AAnimalID);
      wtBirth    : Result := GetAnimalBirthDate(AAnimalID);
      wtSale     : Result := GetAnimalSaleEventDate(AAnimalID);
   end;
end;

function TEventDataHelper.GetAnimalLastWeight(AAnimalID: Integer): Double;
var
   LastWeighType : TWeighType;
begin
   Result := 0;
   if ( AAnimalID = 0 ) then Exit;
   LastWeighType := GetAnimalLastWeighType(AAnimalID);
   case LastWeighType of
      wtWeighing : Result := GetAnimalLastWeighingEventWeight(AAnimalID);
      wtPurchase : Result := GetAnimalPurchaseWeight(AAnimalID);
      wtBirth    : Result := GetAnimalBirthWeight(AAnimalID);
      wtSale     : Result := GetAnimalSaleWeight(AAnimalID);
   end;
end;

function TEventDataHelper.GetAnimalLastWeighingEventDate(AAnimalID: Integer): TDateTime;
begin
   Result := 0;
   if ( AAnimalID = 0 ) then Exit;
   // Get animals date from a its last actual weighing event, if any, as the last weigh date.
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT E.ID, E.EventDate, W.Weight');
         SQL.Add('FROM Events E');
         SQL.Add('LEFT JOIN Weights W ON (W.EventID = E.ID)');
         SQL.Add('WHERE E.EventType = :CWeighing');
         SQL.Add('AND   E.AnimalID = :AAnimalID');
         SQL.Add('AND   W.Weight > 0');
         SQL.Add('ORDER BY EventDate ASC');
         Params[0].AsInteger := CWeightEvent;
         Params[1].AsInteger := AAnimalID;
         try
            Open;
            if ( RecordCount > 0 ) then
               begin
                  Last;
                  if ( Fields[2].AsFloat > 0 ) then
                     Result := Fields[1].AsDateTime;
               end;
         except
         end;
      finally
         Free;
      end;
end;

function TEventDataHelper.GetAnimalLastWeighingEventWeight(AAnimalID: Integer): TDateTime;
begin
   Result := 0;
   if ( AAnimalID = 0 ) then Exit;
   // Get animals weight from a its last actual weighing event, if any, as the last weigh weight.
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT E.ID, E.EventDate, W.Weight');
         SQL.Add('FROM Events E');
         SQL.Add('LEFT JOIN Weights W ON (W.EventID = E.ID)');
         SQL.Add('WHERE E.EventType = :CWeighing');
         SQL.Add('AND   E.AnimalID = :AAnimalID');
         SQL.Add('AND   W.Weight > 0');
         SQL.Add('ORDER BY EventDate ASC');
         Params[0].AsInteger := CWeightEvent;
         Params[1].AsInteger := AAnimalID;
         try
            Open;
            if ( RecordCount > 0 ) then
               begin
                  Last;
                  if ( Fields[2].AsFloat > 0 ) then
                     Result := Fields[2].AsFloat;
               end;
         except
         end;
      finally
         Free;
      end;
end;

function TEventDataHelper.GetAnimalOverallGainPerDay(AAnimalID: Integer): Double;
var
   fWeighGain,
   fWeighGainPerDay : Double;
   iNoDays : Integer;
   FirstWeighRecord,
   LastWeighRecord : TWeighingRecord;
begin
   Result := 0;
   if ( AAnimalID = 0 ) then Exit;
   try
      FirstWeighRecord := GetAnimal_First_Last_WeighingRecord(AAnimalID,True);
      LastWeighRecord := GetAnimal_First_Last_WeighingRecord(AAnimalID,False);

      iNoDays := 0;
      // Get the number of days between the first weighing date and the last weighing event date.
      if ( LastWeighRecord.Date > FirstWeighRecord.Date ) then
         iNoDays := Trunc(LastWeighRecord.Date - FirstWeighRecord.Date);

      if ( iNoDays > 0 ) then
         begin
            fWeighGain := 0;
            // Get the difference between the animals first weight and last weighing event weight.
            fWeighGain := ( LastWeighRecord.Weight - FirstWeighRecord.Weight );
            // Get the gain per day by dividing the difference of the first and last weight by the no days between the dates.
            if ( fWeighGain > 0 ) then
               Result := ( fWeighGain / iNoDays );
         end;
   except
      on e : Exception do
         ApplicationLog.LogError(Format('Error creating OverallGainPerDay for AnimalID %d',[AAnimalID])); 
   end;
end;

function TEventDataHelper.GetAnimalPreSaleEventID(AAnimalID: Integer): Integer;
var
   qPreSale : TQuery;
   iEventID : Integer;
begin
   Result := 0;
   if ( AAnimalID = 0 ) then Exit;
   qPreSale := TQuery.Create(nil);
   with qPreSale do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT E.ID, S.PreSale');
         SQL.Add('FROM Events E');
         SQL.Add('LEFT JOIN SalesDeaths S ON (S.EventID = E.ID)');
         SQL.Add('WHERE E.EventType = :SaleEvent');
         SQL.Add('AND   E.AnimalID = :AnimalID');
         Params[0].AsInteger := CSaleDeathEvent;
         Params[1].AsInteger := AAnimalID;
         Open;
         if ( (RecordCount > 0) and (Fields[1].AsBoolean) ) then
            Result := Fields[0].AsInteger;
      finally
         Free;
      end;
end;

function TEventDataHelper.GetAnimalPreSaleWeight(AAnimalID: Integer): Double;
var
   qPreSale : TQuery;
begin
   Result := 0;
   if ( AAnimalID = 0 ) then Exit;
   qPreSale := TQuery.Create(nil);
   with qPreSale do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT S.Weight');
         SQL.Add('FROM SalesDeaths S');
         SQL.Add('WHERE S.EventID = :PreSaleEventID');
         Params[0].AsInteger := GetAnimalPreSaleEventID(AAnimalID);
         Open;
         if ( RecordCount > 0 ) and ( Fields[0].AsFloat > 0 ) then
            Result := Fields[0].AsFloat;
      finally
         Free;
      end;
end;

function TEventDataHelper.GetAnimalLeftHerdEventID(AAnimalID: Integer): Integer;
begin
   Result := 0;
   if ( AAnimalID <= 0 ) then Exit;
   Result := GetAnimalSaleEventID(AAnimalID);
   if ( Result <= 0 ) then
      Result := GetAnimalDeathEventID(AAnimalID);
end;

function TEventDataHelper.GetAnimalDeathEventID(AAnimalID: Integer): Integer;
begin
   Result := 0;
   if ( AAnimalID = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT E.ID');
         SQL.Add('FROM Events E');
         SQL.Add('LEFT JOIN SalesDeaths S ON (S.EventID = E.ID)');
         SQL.Add('WHERE (E.AnimalID = :AnimalID)');
         SQL.Add('AND   (S.Sold = False)');
         SQL.Add('AND   ((S.PreSale = False) OR (S.PreSale IS NULL))');
         Params[0].AsInteger := AAnimalID;
         try
            Open;
            if ( RecordCount > 0 ) then
               Result := Fields[0].AsInteger
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function TEventDataHelper.GetAnimalSaleEventID(AAnimalID: Integer): Integer;
begin
   Result := 0;
   if ( AAnimalID = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT E.ID');
         SQL.Add('FROM Events E');
         SQL.Add('LEFT JOIN SalesDeaths S ON (S.EventID = E.ID)');
         SQL.Add('WHERE (E.AnimalID = :AnimalID)');
         SQL.Add('AND   (S.Sold = True)');
         SQL.Add('AND   ((S.PreSale = False) OR (S.PreSale IS NULL))');
         Params[0].AsInteger := AAnimalID;
         try
            Open;
            if ( RecordCount > 0 ) then
               Result := Fields[0].AsInteger
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function TEventDataHelper.GetAnimal_First_Last_WeighingRecord(AAnimalID: Integer; AFirstWeighing : Boolean): TWeighingRecord;
var
   qWeighings : TQuery;
begin
   Result.Date := 0;
   Result.Weight := 0;
   Result.WeighType := wtNone;
   if ( AAnimalID = 0 ) then Exit;

   qWeighings := TQuery.Create(nil);
   with qWeighings do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         if AFirstWeighing then
            begin
               SQL.Add('SELECT A.ID, A.BirthWeight, A.DateOfBirth, P.EventDate PurchDate, PR.Weight PRWeight');
               SQL.Add('FROM Animals A');
               SQL.Add('LEFT JOIN Events P ON ( (P.AnimalID = A.ID) AND (P.EventType = :PurchEvent) )');
               SQL.Add('LEFT JOIN Purchases PR ON ( PR.EventID = P.ID )');
               SQL.Add('WHERE A.ID = :AnimalID');
               Params[0].AsInteger := CPurchaseEvent;
               Params[1].AsInteger := AAnimalID;
               Open;
               if ( RecordCount > 0 ) then
                  begin
                     if ( FieldByName('PurchDate').AsDateTime <= 0 ) and ( FieldByName('BirthWeight').AsFloat > 0 ) then
                        begin
                           Result.Date := FieldByName('DateOfBirth').AsDateTime;
                           Result.Weight := FieldByName('BirthWeight').AsFloat;
                           Result.WeighType := wtBirth;
                        end
                     else if ( FieldByName('PurchDate').AsDateTime > 0 ) and ( FieldByName('PRWeight').AsFloat > 0 ) then
                        begin
                           Result.Date := FieldByName('PurchDate').AsDateTime;
                           Result.Weight := FieldByName('PRWeight').AsFloat;
                           Result.WeighType := wtPurchase;
                        end;
                  end;
            end
         else
            begin
               SQL.Add('SELECT E.AnimalID, E.EventDate SaleDate, S.Weight SaleWeight, S.Sold');
               SQL.Add('FROM Events E');
               SQL.Add('LEFT JOIN SalesDeaths S ON (S.EventID = E.ID)');
               SQL.Add('WHERE (E.EventType = :CSaleEvent)');
               SQL.Add('AND   (E.AnimalID = :AAnimalID)');
               SQL.Add('AND   (S.Sold = True)');
               SQL.Add('AND   ((S.PreSale = False) OR (S.PreSale IS NULL))');
               Params[0].AsInteger := CSaleDeathEvent;
               Params[1].AsInteger := AAnimalID;
               Open;
               if ( RecordCount > 0 ) and ( FieldByName('SaleDate').AsDateTime > 0 ) and ( FieldByName('SaleWeight').AsFloat > 0 ) then
                  begin
                     Result.Date := FieldByName('SaleDate').AsDateTime;
                     Result.Weight := FieldByName('SaleWeight').AsFloat;
                     Result.WeighType := wtSale;
                  end;
            end;

         if ( Result.WeighType = wtNone ) then
            begin
               Close;
               SQL.Clear;
               SQL.Add('SELECT E.EventDate WeighDate, W.Weight');
               SQL.Add('FROM Events E');
               SQL.Add('LEFT JOIN Weights W ON (W.EventID = E.ID)');
               SQL.Add('WHERE E.EventType = :CWeighing');
               SQL.Add('AND   E.AnimalID = :AnimalID');
               if AFirstWeighing then
                  SQL.Add('ORDER By E.EventDate ASC')
               else
                  SQL.Add('ORDER By E.EventDate DESC');
               Params[0].AsInteger := CWeightEvent;
               Params[1].AsInteger := AAnimalID;
               Open;
               if ( RecordCount = 0 ) then Exit;
               First;
               if ( FieldByName('WeighDate').AsDateTime > 0 ) and ( FieldByName('Weight').AsFloat > 0 ) then
                  begin
                     Result.Date := FieldByName('WeighDate').AsDateTime;
                     Result.Weight := FieldByName('Weight').AsFloat;
                     Result.WeighType := wtWeighing;
                  end;
            end;
      finally
         Free;
      end;
end;

function TEventDataHelper.GetWeighDateWeight(AAnimalID: Integer; AWeighDate: TDateTime): Double;
begin
   Result := 0;
   if ( AAnimalID = 0 ) or ( AWeighDate = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT E.AnimalID, E.EventDate, W.Weight');
         SQL.Add('FROM Events E');
         SQL.Add('LEFT JOIN Weights W ON (W.EventID = E.ID)');
         SQL.Add('WHERE E.AnimalID = :AnimalID');
         SQL.Add('AND   E.EventType = :Weighing');
         SQL.Add('AND   E.EventDate = :WeighDate');
         Params[0].AsInteger := AAnimalID;
         Params[1].AsInteger := CWeightEvent;
         Params[2].AsDateTime := AWeighDate;
         try
            Open;
            if ( RecordCount > 0 ) and ( FieldByName('Weight').AsFloat > 0 ) then
               Result := FieldByName('Weight').AsFloat;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

procedure TEventDataHelper.GetPreSaleStatusInfo(const AID: Integer;
  const ASalesDate: TDateTime; var AStatusInfo: TStatusInfo;
  ACustomerID: Integer; ACheckBrucellosis, ACheckTB,
  ADisplayMinimumDays: Boolean);
var
   BirthDate, TBTestDate, BruceDate,
   PurchDate, CutOffDate, WithdrawalDate,
   ToBeCulledDate : TDateTime;
   AnimalSex : String;
   AdminDays : Integer;
   WithDrawalDays : Double;
   GenQuery : TQuery;
   HerdOwnerData : THerdOwnerData;
   HerdID : Integer;
   AnimalLactNo : Integer;

   function CustomerIsMeatFactory : Boolean;
   var
     tResult : Variant;
   begin
      Result := False;
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT *');
            SQL.Add('FROM Customers');
            SQL.Add('WHERE ID = '+IntToStr(ACustomerID)+'');
            try
               Open;
               if ( RecordCount > 0 ) then
                  Result := FieldByName('MeatFactory').AsBoolean;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;
   end;

begin
   GenQuery := TQuery.Create(nil);
   GenQuery.DatabaseName := AliasName;

   HerdID := 0;
   HerdID := HerdIDByAnimalID(AID);
   HerdOwnerData := THerdOwnerData.create(nil,HerdID);

   AnimalLactNo := 0;
   BirthDate := 0;
   TBTestDate := 0;
   BruceDate := 0;
   PurchDate := 0;
   CutOffDate := 0;
   WithdrawalDate := 0;
   ToBeCulledDate := 0;

   try
      FillChar(AStatusInfo, SizeOf(TStatusInfo), 0);
      with GenQuery do
         begin
            SQL.Clear;
            SQL.Add('Select LactNo, Sex, DateOfBirth, TBTestDate, Brucellosis From Animals Where ID = :AID');
            Params[0].AsInteger := AID;
            Open;
            try
              First;
              AnimalLactNo := FieldByName('LactNo').AsInteger;
              TBTestDate := FieldByName('TBTestDate').AsDateTime;
              BruceDate := FieldByName('Brucellosis').AsDateTime;
              BirthDate := FieldByName('DateOfBirth').AsDateTime;
              AnimalSex := FieldByName('Sex').AsString;
            finally
              Close;
            end;
         end;

      AStatusInfo.CheckBrucellosis := ( ( AnimalSex <> cSex_Steer ) and ( BirthDate <= IncMonth(Date, -12) ) and NOT(CustomerIsMeatFactory)) and (ACheckBrucellosis);
      AStatusInfo.CheckTBTest      := ( BirthDate < (Date-(7 * 6))) and (ACheckTB);
      AStatusInfo.CheckMinimumDaysOnFarm  := ADisplayMinimumDays;
      PurchDate := GetLastEventDate(AID,-1, cPurchaseEvent);
      if ( PurchDate > 0 ) then
         AStatusInfo.NoDaysOnFarm := Trunc( ASalesDate - PurchDate)
      else
         AStatusInfo.NoDaysOnFarm := Trunc( ASalesDate - BirthDate);
      AStatusInfo.TBTestDate := TBTestDate;
      AStatusInfo.BruceDate := BruceDate;
      AStatusInfo.WithinDrugWithdrawalPeriod := False;

      ToBeCulledDate := GetLastEventDate(AID,AnimalLactNo,CToBeCulledEvent);

      with GenQuery do
         begin
            // Find the maxium withdrawal days in medicine.db
            // Exclude any health events before WithDrawalDays + DateToUse
            //   28/01/15 [V5.4 R2.6] /MK Bug Fix - Exclude N_A withdrawals for max withdrawal days.
            SQL.Clear;
            SQL.Add('SELECT MAX(WithDrawal) MeatWDDays, ');
            SQL.Add('       MAX(MilkWithDrawal) MilkWDDays, ');
            SQL.Add('       MAX(OtherWithDrawal) OtherWDDays,  ');
            SQL.Add('       MAX(OrganicMeatWithDrawal) OrganicMeatWDDays,  ');
            SQL.Add('       MAX(OrganicMilkWithDrawal) OrganicMilkWDDays,  ');
            SQL.Add('       MAX(OrganicOtherWithDrawal) OrganicOtherWDDays ');
            SQL.Add('FROM Medicine');
            SQL.Add('WHERE ( (MilkN_A_Drug = False) OR (MilkN_A_Drug IS NULL) )');
            SQL.Add('AND   ( (MeatN_A_Drug = False) OR (MeatN_A_Drug IS NULL) )');
            try
               Open;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;

            First;
            WithDrawalDays := 0;
            WithDrawalDays := GenQuery.FieldByName('MeatWDDays').AsInteger;
            if GenQuery.FieldByName('MilkWDDays').AsInteger > WithDrawalDays then
               //   23/03/16 [V5.5 R5.4] /MK Change - Only assign WithdrawalDays as MilkDays where the animal is not culled.
               if ( ToBeCulledDate = 0 ) then
                  WithDrawalDays := GenQuery.FieldByName('MilkWDDays').AsInteger;

            if ( HerdOwnerData.OrganicHerd ) then
               begin
                  if GenQuery.FieldByName('OrganicMeatWDDays').AsInteger > WithDrawalDays then
                     WithDrawalDays := GenQuery.FieldByName('OrganicMeatWDDays').AsInteger
                  else if GenQuery.FieldByName('OrganicMilkWDDays').AsInteger > WithDrawalDays then
                      //   23/03/16 [V5.5 R5.4] /MK Change - Only assign WithdrawalDays as MilkDays where the animal is not culled.
                     if ( ToBeCulledDate = 0 ) then
                        WithDrawalDays := GenQuery.FieldByName('OrganicMilkWDDays').AsInteger;
               end;

            Close;
         end;

      CutOffDate := Date - WithDrawalDays;
      with GenQuery do
         begin
            SQL.Clear;
            SQL.Add('SELECT DISTINCT E.AnimalID, E.ID, E.EventDate, H.NoDays,');
            SQL.Add('M.Withdrawal, M.MilKWithDrawal, M.OtherWithdrawal,  ');
            SQL.Add('M.OrganicMeatWithDrawal, M.OrganicMilkWithDrawal, M.OrganicOtherWithDrawal,  ');
            SQL.Add('M.MilkN_A_Drug, M.MeatN_A_Drug');
            SQL.Add('FROM Events E');
            SQL.Add('LEFT JOIN Health H ON (H.EventID = E.ID)');
            SQL.Add('LEFT JOIN Medicine M ON (M.ID = H.DrugUsed)');
            SQL.Add('WHERE (E.AnimalID = :AID)');
            SQL.Add('AND E.EventType IN ('+IntToStr(CHealthEvent)+','+IntToStr(CDryOffEvent)+')');
            // Select all health/dry events after DateToUse ( CutOffDate - WithDrawalDays )
            // This will ensure only animals still in withdrawal period will be considered for report.
            SQL.Add('AND (E.EventDate >= "'+FormatDateTime('mm/dd/yyyy',CutOffDate)+'")');
            Params[0].AsInteger := AID;
            Open;
            if NOT (IsEmpty) then
               try
                  GenQuery.First;
                  while ( not(GenQuery.Eof) ) do
                     begin

                        AdminDays := GenQuery.FieldByName('NoDays').AsInteger;

                        // Standard withdrawal dates.
                        //   27/03/14 [V5.2 R9.2] /MK Bug Fix - Check for Not Applicable Boolean.
                        if ( not(GenQuery.FieldByName('MeatN_A_Drug').AsBoolean) ) then
                           begin
                              WithDrawalDays := GenQuery.FieldByName('WithDrawal').AsFloat;
                              if Frac( WithDrawalDays ) <> 0 then
                                 WithDrawalDays :=WithDrawalDays +1; // safe option
                              WithdrawalDate := GenQuery.FieldByName('EventDate').AsDateTime + ( AdminDays -1 ) + WithDrawalDays;
                              if WithDrawalDate >= ASalesDate then
                                 begin
                                    AStatusInfo.WithinDrugWithdrawalPeriod := True;
                                    Break;
                                 end;
                           end;

                        //   27/03/14 [V5.2 R9.2] /MK Bug Fix - Check for Not Applicable Boolean.
                        //   23/03/16 [V5.5 R4.5] /MK Change - As this check only pertains to the sale of an animal, only get meat withdrawal.
                        if ( not(GenQuery.FieldByName('MilkN_A_Drug').AsBoolean) ) then
                           //   23/03/16 [V5.5 R5.4] /MK Change - Only assign WithdrawalDays as MilkDays where the animal is not culled.
                           if ( ToBeCulledDate = 0 ) then
                              begin
                                 WithDrawalDays := GenQuery.FieldByName('MilkWithDrawal').AsFloat;
                                 if Frac( WithDrawalDays ) <> 0 then
                                    WithDrawalDays :=WithDrawalDays +1; // safe option
                                 WithdrawalDate := GenQuery.FieldByName('EventDate').AsDateTime + ( AdminDays -1 ) + WithDrawalDays;
                                 if WithDrawalDate >= ASalesDate then
                                    begin
                                       AStatusInfo.WithinDrugWithdrawalPeriod := True;
                                       Break;
                                    end;
                              end;

                        if ( HerdOwnerData.OrganicHerd ) then
                           begin
                              // Standard withdrawal dates.
                              WithDrawalDays := GenQuery.FieldByName('OrganicMeatWithdrawal').AsFloat;
                              if Frac( WithDrawalDays ) <> 0 then
                                 WithDrawalDays :=WithDrawalDays +1; // safe option
                              WithdrawalDate := GenQuery.FieldByName('EventDate').AsDateTime + ( AdminDays -1 ) + WithDrawalDays;
                              if WithDrawalDate >= ASalesDate then
                                 begin
                                    AStatusInfo.WithinDrugWithdrawalPeriod := True;
                                    Break;
                                 end;

                              //   23/03/16 [V5.5 R4.5] /MK Change - Only assign WithdrawalDays as MilkDays where the animal is not culled.
                              if ( ToBeCulledDate = 0 ) then
                                 begin
                                    WithDrawalDays := GenQuery.FieldByName('OrganicMilkWithdrawal').AsFloat;
                                    if Frac( WithDrawalDays ) <> 0 then
                                       WithDrawalDays :=WithDrawalDays +1; // safe option
                                    WithdrawalDate := GenQuery.FieldByName('EventDate').AsDateTime + ( AdminDays -1 ) + WithDrawalDays;
                                    if WithDrawalDate >= ASalesDate then
                                       begin
                                          AStatusInfo.WithinDrugWithdrawalPeriod := True;
                                          Break;
                                       end;
                                 end;
                           end;

                        GenQuery.Next;
                     end;
               finally
                  GenQuery.Close;
               end;
         end;
   finally
      FreeAndNil(GenQuery);
   end;
end;

function TEventDataHelper.GetSaleDeathRecord(AAnimalID: Integer; const ASaleDate : TDateTime = 0): TSaleEventInfo;
var
   qEvent : TQuery;
begin
   Result := nil;
   if ( AAnimalID = 0 ) then Exit;

   Result := TSaleEventInfo.Create;

   Result.AnimalInfo := GetAnimal(AAnimalID);

   qEvent := TQuery.Create(nil);
   with qEvent do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT E.ID, E.EventDate, S.PreSale, S.Sold, S.RightWt, S.LeftWt, S.Price, S.Weight,');
         SQL.Add('       S.KillOut, S.ColdDeadWt, S.CustomerCosts, S.SaleGrps_Id, S.Customer, S.CarcassSex,');
         SQL.Add('       S.Grade, S.WeighingDate, S.FeedEndDate, S.PricePerKg, S.KillNumber');
         SQL.Add('FROM Events E');
         SQL.Add('LEFT JOIN SalesDeaths S ON (S.EventID = E.ID)');
         SQL.Add('WHERE E.AnimalID = :AnimalID');
         SQL.Add('AND   E.EventType = :SaleDeathEvent');
         if ( ASaleDate > 0 ) then
            SQL.Add('AND   E.EventDate = "'+FormatDateTime(cUSDateStyle,ASaleDate)+'"');
         Params[0].AsInteger := AAnimalID;
         Params[1].AsInteger := CSaleDeathEvent;
         try
            Open;
            if ( RecordCount = 0 ) then Exit;
            Result.EventID := FieldByName('ID').AsInteger;
            Result.EventDate := FieldByName('EventDate').AsDateTime;
            Result.PreSale := FieldByName('PreSale').AsBoolean;
            Result.SoldStatus := FieldByName('Sold').AsBoolean;
            Result.RightWt := FieldByName('RightWt').AsFloat;
            Result.LeftWt := FieldByName('LeftWt').AsFloat;
            Result.AnimalPrice := FieldByName('Price').AsFloat;
            Result.AnimalWeight := FieldByName('Weight').AsFloat;
            Result.KillOut := FieldByName('KillOut').AsFloat;
            Result.ColdDeadWt := FieldByName('ColdDeadWt').AsFloat;
            Result.CustomerCosts := FieldByName('CustomerCosts').AsFloat;
            Result.SalesGroupID := FieldByName('SaleGrps_Id').AsInteger;
            Result.CustomerID := FieldByName('Customer').AsInteger;
            Result.CarcassSex := FieldByName('CarcassSex').AsString;
            Result.Grade := FieldByName('Grade').AsString;
            Result.WeighingDate := FieldByName('WeighingDate').AsDateTime;
            Result.FeedEndDate := FieldByName('FeedEndDate').AsDateTime;
            Result.PricePerKg := FieldByName('PricePerKg').AsFloat;
            Result.KillNumber := FieldByName('KillNumber').AsString;
         except
         end;
      finally
         Close;
         Free;
      end;
end;

function TEventDataHelper.GetAnimalNullLeftHerdEventID(AAnimalID: Integer): Integer;
begin
   Result := 0;
   if ( AAnimalID = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT E.ID');
         SQL.Add('FROM Events E');
         SQL.Add('WHERE E.AnimalID = :AnimalID');
         SQL.Add('AND   E.EventType = :SaleDeath');
         Params[0].AsInteger := AAnimalID;
         Params[1].AsInteger := CSaleDeathEvent;
         try
            Open;
            if ( RecordCount > 0 ) then
               Result := Fields[0].AsInteger;
            //   18/02/20 [V5.9 R2.3] /MK Bug Fix - Need to check for existance of the sale/death event in the SalesDeaths table to properly ascertain its a null event. 
            if ( Result > 0 ) then
               begin
                  SQL.Clear;
                  SQL.Add('SELECT *');
                  SQL.Add('FROM SalesDeaths');
                  SQL.Add('WHERE EventID = :EventId');
                  Params[0].AsInteger := Result;
                  Open;
                  if ( RecordCount > 0 ) then
                     Result := 0;
               end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function TEventDataHelper.GetPurchaseRecord(AAnimalID: Integer;  const APurchDate: TDateTime): TPurchaseEventInfo;
var
   qEvent : TQuery;
begin
   Result := nil;
   if ( AAnimalID = 0 ) then Exit;

   Result := TPurchaseEventInfo.Create();

   Result.AnimalInfo := GetAnimal(AAnimalID);
   Result.EventId := 0;
   Result.EventDate := 0;
   Result.Weight := 0;

   qEvent := TQuery.Create(nil);
   with qEvent do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT E.ID, E.EventDate, P.Weight');
         SQL.Add('FROM Events E');
         SQL.Add('LEFT JOIN Purchases P ON (P.EventID = E.ID)');
         SQL.Add('WHERE E.AnimalID = :AID');
         Params[0].AsInteger := AAnimalID;
         try
            Open;
            if ( RecordCount > 0 ) then
               begin
                  Result.EventID := qEvent.FieldByName('ID').AsInteger;
                  Result.EventDate := qEvent.FieldByName('EventDate').AsDateTime;
                  Result.Weight := qEvent.FieldByName('Weight').AsFloat;
               end;
         except
            on e : Exception do
               ShowDebugMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function TEventDataHelper.GetPreSaleRecord(AAnimalID: Integer): TPreSaleEventInfo;
var
   qEvent : TQuery;
begin
   Result := nil;

   if ( AAnimalID = 0 ) then Exit;

   Result := TPreSaleEventInfo.Create();

   Result.AnimalInfo := GetAnimal(AAnimalId);
   Result.EventID := 0;
   Result.EventDate := 0;
   Result.Weight := 0;

   qEvent := TQuery.Create(nil);
   with qEvent do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT E.ID, E.EventDate, S.Weight');
         SQL.Add('FROM Events E');
         SQL.Add('LEFT JOIN SalesDeaths S ON (E.ID = S.EventID)');
         SQL.Add('WHERE E.AnimalId = :AID');
         SQL.Add('AND   S.PreSale = True');
         Params[0].AsInteger := AAnimalID;
         try
            Open;
            if ( RecordCount > 0 ) then
               begin
                  Result.EventId := FieldByName('ID').AsInteger;
                  Result.EventDate := FieldByName('EventDate').AsDateTime;
                  Result.Weight := FieldByName('Weight').AsFloat;
               end;
         except
            on e : Exception do
               ShowDebugMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function TEventDataHelper.EventIdExists(AEventId: Integer): Boolean;
begin
   Result := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM Events');
         SQL.Add('WHERE ID = :EvId');
         Params[0].AsInteger := AEventId;
         try
            Open;
            Result := ( RecordCount > 0 );
         except
            on e : Exception do
               ShowDebugMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

{ TSaleEventInfo }

constructor TSaleEventInfo.create;
begin
//
end;

destructor TSaleEventInfo.destroy;
begin
  inherited;
//
end;

{ TPurchEventInfo }

constructor TPurchaseEventInfo.create;
begin
//
end;

destructor TPurchaseEventInfo.destroy;
begin
  inherited;
//
end;

{ TTempMovementInfo }

constructor TTempMovementInfo.Create;
begin
   FTempMoveEvents := TTable.Create(nil);
   FTempMoveEvents.DatabaseName := AliasName;
   FTempMoveEvents.TableName := 'tmpTempTransfer';
   FTempMoveEvents.FieldDefs.Clear;
   FTempMoveEvents.FieldDefs.Add('ID',ftAutoInc);
   FTempMoveEvents.FieldDefs.Add('AnimalID',ftInteger);
   FTempMoveEvents.FieldDefs.Add('EventID',ftInteger);
   FTempMoveEvents.FieldDefs.Add('MovedOutDate',ftDateTime);
   FTempMoveEvents.FieldDefs.Add('MovedInDate',ftDateTime);
   FTempMoveEvents.FieldDefs.Add('StillOffFarm',ftBoolean);
   FTempMoveEvents.IndexDefs.Clear;
   FTempMoveEvents.IndexDefs.Add('iID','ID',[ixPrimary,ixUnique]);
   FTempMoveEvents.CreateTable;
   FTempMoveEvents.Open;

   FQuery := TQuery.Create(nil);
   FQuery.DatabaseName := AliasName;
   FQuery.SQL.Clear;
   FQuery.SQL.Add('INSERT INTO '+FTempMoveEvents.TableName+' (AnimalID, EventID, MovedOutDate, MovedInDate, StillOffFarm)');
   FQuery.SQL.Add('SELECT E.AnimalID, E.ID, E.EventDate, M.DateMovedBack, M.StillOffFarm');
   FQuery.SQL.Add('FROM Events E');
   FQuery.SQL.Add('LEFT JOIN Movements M ON (M.EventID = E.ID)');
   FQuery.SQL.Add('WHERE E.EventType = :TempMove');
   FQuery.SQL.Add('AND   M.StillOffFarm = True');
   FQuery.Params[0].AsInteger := CMovementEvent;
   FQuery.ExecSQL;

   FTempMoveEvents.Close;
   FTempMoveEvents.Open;
end;

function TTempMovementInfo.GetIsStillOffFarm(AAnimalID: Integer): Boolean;
begin
   Result := False;
   if ( AAnimalID = 0 ) then Exit;
   Result := FTempMoveEvents.Locate('AnimalID',AAnimalID,[]);
end;

function TTempMovementInfo.BringBackAnimal(AAnimalID: Integer; ADateMovedBack : TDateTime): Boolean;
begin
   Result := False;
   if ( AAnimalID <= 0 ) or ( ADateMovedBack <= 0 ) then Exit;
   if ( not(FTempMoveEvents.Locate('AnimalID',AAnimalID,[])) ) then Exit;
   if ( FTempMoveEvents.FieldByName('MovedOutDate').AsDateTime > ADateMovedBack ) then
      begin
         ApplicationLog.LogInfo(Format('Failed to update TempMovement MovedBack date for AnimalID %d, original MovedOut date is greater than MovedBack date.',[AAnimalID]));
         Exit;
      end;
   FQuery.Close;
   FQuery.SQL.Clear;
   FQuery.SQL.Add('UPDATE Movements');
   FQuery.SQL.Add('SET DateMovedBack = :AMovedBackDate,');
   FQuery.SQL.Add('    StillOffFarm = False');
   FQuery.SQL.Add('WHERE EventID = :AEvID');
   FQuery.Params[0].AsDateTime := ADateMovedBack;
   FQuery.Params[1].AsInteger := FTempMoveEvents.FieldByName('EventID').AsInteger;
   FQuery.ExecSQL;
   Result := True;
end;

destructor TTempMovementInfo.Destroy;
begin
   if ( FTempMoveEvents <> nil ) then
      begin
         FTempMoveEvents.Close;
         FTempMoveEvents.DeleteTable;
         FreeAndNil(FTempMoveEvents);
      end;

   if ( FQuery <> nil ) then
      FreeAndNil(FQuery);
end;

{ TPreSaleEventInfo }

constructor TPreSaleEventInfo.create;
begin
//
end;

destructor TPreSaleEventInfo.destroy;
begin
  inherited;
//
end;

end.
