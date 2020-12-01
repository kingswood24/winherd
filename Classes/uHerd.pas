unit uHerd;

interface
uses
    Classes, SysUtils, contnrs, uAnimal;
type

   THerd = class
   private
    FID: Integer;
    FHerdIdentity: string;
    FAnimals: TAnimals;
    FDatabasePath: string;
    function GetDatabaseName: string;
   public
    constructor create;
    destructor destroy;override;
    property ID : Integer read FID write FID;
    property HerdIdentity : string read FHerdIdentity write FHerdIdentity;
    property DatabaseName : string read GetDatabaseName;
    property DatabasePath : string read FDatabasePath write FDatabasePath;
    property Animals : TAnimals read FAnimals write FAnimals;
   end;

   THerds = class(TObjectList)
   public
      function FindHerd(AHerdId : Integer; ADatabaseName : string) : Boolean;
      function FindAnimal(ALocateNatId : string) : Boolean;
   end;

implementation
uses
   KRoutines;

{ THerd }

constructor THerd.create;
begin
   Animals := TAnimals.Create(True);
end;

destructor THerd.destroy;
begin
  if ( FAnimals <> nil ) then
     FreeAndNil(FAnimals);
  inherited;
end;

function THerd.GetDatabaseName: string;
begin
   Result := ExtractDirFromPath(FDatabasePath);
end;

{ THerds }

function THerds.FindAnimal(ALocateNatId: string): Boolean;
var
   Herd : THerd;
   i : Integer;
begin
   Result := False;
   for i := 0 to Count-1 do
      begin
         Herd := THerd(Items[i]);
         Result := Herd.Animals.Find(ALocateNatId);
         if Result then Break;
      end;
end;

function THerds.FindHerd(AHerdId: Integer; ADatabaseName: string): Boolean;
var
   Herd : THerd;
   i : Integer;
begin
   Result := False;
   if ( Count <= 0 ) then Exit;

   for i := 0 to Count-1 do
      begin
         Herd := THerd(Items[i]);
         if Herd <> nil then
            begin
               Result := (Herd.Id = AHerdId) and (UpperCase(Herd.DatabaseName) = UpperCase(ADatabaseName));
               if Result then
                  Break;
            end;
      end;
end;

end.
