unit uFertilityPrograms;

interface
uses
   Classes, Windows, SysUtils, db, dbtables;

type
   TFertilityPrograms = class
   public
      constructor create;
      destructor destroy;override;
      procedure RemoveProgramFromAnimal(const AAnimalID, ALactNo, AProgramID : Integer;
         const AStartDate : TDateTime);overload;
      procedure RemoveProgramFromAnimal(const AParentEventID : Integer);overload;
      procedure StartAnimalOnProgram(const AAnimalID, ALactNo, AProgramID, AParentEventID : Integer;
         const AStartDate : TDateTime);
   end;

implementation
uses
   GenTypesConst;

{ TFertilityPrograms }

constructor TFertilityPrograms.create;
begin

end;

destructor TFertilityPrograms.destroy;
begin
  inherited;

end;

procedure TFertilityPrograms.RemoveProgramFromAnimal(const AAnimalID,
  ALactNo, AProgramID: Integer; const AStartDate: TDateTime);
begin
  with TQuery.Create(nil) do
     try
        DatabaseName := AliasName;
        SQL.Add('DELETE FROM FertProgAdmin');
        SQL.Add('WHERE (AnimalID =:AnimalID)');
        SQL.Add('AND (LactNo =:LactNo)');
        SQL.Add('AND (ProgramId =:ProgramId)');
        SQL.Add('AND (StartDate =:StartDate)');
        Params[0].AsInteger := AAnimalID;
        Params[1].AsInteger := ALactNo;
        Params[2].AsInteger := AProgramID;
        Params[3].AsDateTime := AStartDate;
        ExecSQL;
     finally
        Free;
     end;
end;

procedure TFertilityPrograms.RemoveProgramFromAnimal(
  const AParentEventID: Integer);
begin
  with TQuery.Create(nil) do
     try
        DatabaseName := AliasName;
        SQL.Add('DELETE FROM FertProgAdmin');
        SQL.Add('WHERE (ParentEvent =:ParentEvent)');
        Params[0].AsInteger := AParentEventID;
        ExecSQL;
     finally
        Free;
     end;
end;

procedure TFertilityPrograms.StartAnimalOnProgram(const AAnimalID, ALactNo,
  AProgramID, AParentEventID: Integer; const AStartDate: TDateTime);
begin
  with TQuery.Create(nil) do
     try
        DatabaseName := AliasName;
        SQL.Add('INSERT INTO FertProgAdmin (AnimalID, LactNo, ProgramID, ParentEvent, StartDate)');
        SQL.Add('VALUES (:AnimalID, :LactNo, :ProgramID, :ParentEvent, :StartDate)');
        Params[0].AsInteger := AAnimalID;
        Params[1].AsInteger := ALactNo;
        Params[2].AsInteger := AProgramID;
        Params[3].AsInteger := AParentEventID;
        Params[4].AsDateTime := AStartDate;
        ExecSQL;
     finally
        Free;
     end;
end;

end.
