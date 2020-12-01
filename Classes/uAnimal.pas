unit uAnimal;

interface
uses
    Classes, SysUtils, Dialogs, contnrs, db, dbtables;

type

  TAnimal = class
  private
    FId: Integer;
    FLactNo: Integer;
    FSex: string;
    FAnimalNo: string;
    FNatIdNum: string;
    FBreedCode: string;
    FDateOfBirth: TDateTime;
    FLocateNatIdNum: string;
    FHerdId: Integer;
    FBreedID: Integer;
    FName: string;
   public
    constructor create;
    destructor destroy;override;
    property Id : Integer read FId write FId;
    property NatIdNum : string read FNatIdNum write FNatIdNum;
    property LocateNatIdNum : string read FLocateNatIdNum write FLocateNatIdNum;
    property AnimalNo : string read FAnimalNo write FAnimalNo;
    property DateOfBirth : TDateTime read FDateOfBirth write FDateOfBirth;
    property Sex : string read FSex write FSex;
    property BreedCode : string read FBreedCode write FBreedCode;
    property BreedID : Integer read FBreedID write FBreedID;
    property LactNo : Integer read FLactNo write FLactNo;
    property HerdId : Integer read FHerdId write FHerdId;
    property Name : string read FName write FName;
   end;

  TAnimals = class(TObjectList)
  private
   FListIndex : Integer;
   function GetCurrentAnimal: TAnimal;
  public
   procedure LoadBySQL(AQuery : TQuery);
   procedure MoveFirst;
   function MoveNext : Boolean;
   function Eof : Boolean;
   function Find(const ALocateNatIdNum : string) : Boolean;
   property CurrentAnimal : TAnimal read GetCurrentAnimal;

  end;


implementation
uses
   GenTypesConst;

{ TAnimals }

procedure TAnimals.LoadBySQL(AQuery : TQuery);
var
   Animal : TAnimal;
begin

   Clear;
   if AQuery = nil then Exit;

   with AQuery do
      try
         Active := True;
         try
            First;
            while not eof do
               begin

                  Animal := TAnimal.Create;
                  if FindField('Id') <> nil then
                     Animal.Id := FieldByName('Id').AsInteger;

                  if FindField('NatIdNum') <> nil then
                     Animal.NatIdNum := FieldByName('NatIdNum').AsString;

                  if FindField('AnimalNo') <> nil then
                     Animal.AnimalNo := FieldByName('AnimalNo').AsString;

                  if FindField('Sex') <> nil then
                     Animal.Sex := FieldByName('Sex').AsString;

                  if FindField('DateOfBirth') <> nil then
                     Animal.DateOfBirth := FieldByName('DateOfBirth').AsDateTime;

                  if FindField('LactNo') <> nil then
                     Animal.LactNo := FieldByName('LactNo').AsInteger;

                  if FindField('BreedCode') <> nil then
                     Animal.BreedCode := FieldByName('BreedCode').AsString;

                  if FindField('LocateNatId') <> nil then
                     Animal.LocateNatIdNum := FieldByName('LocateNatId').AsString;

                  Add(Animal);
                  Next;
               end;
         finally
            Active := False
         end;
      except
         on e : exception do
            begin
               showmessage(e.Message);
               Abort;
            end;
      end;
end;

function TAnimals.GetCurrentAnimal: TAnimal;
begin
   Result := nil;
   if ( FListIndex >= 0 ) and  ( FListIndex <= Count-1 ) then
      Result := TAnimal(Items[FListIndex]);
end;

procedure TAnimals.MoveFirst;
begin
   FListIndex := 0;
end;

function TAnimals.MoveNext: Boolean;
begin
   if ( FListIndex >= 0 ) and  ( FListIndex <= Count-1 ) then
      begin
         Result := True;
         Inc(FListIndex);
      end
   else
      Result := False;
end;

function TAnimals.Eof: Boolean;
begin
   Result := (FListIndex > Count-1);
end;

function TAnimals.Find(const ALocateNatIdNum: string): Boolean;
var
   i : Integer;
   Animal : TAnimal;
begin
   for i := 0 to Count-1 do
      begin
         Result := (StrComp(pChar(ALocateNatIdNum), pChar(TAnimal(Items[i]).LocateNatIdNum)) = 0);
         if Result then
            Break;
      end;
end;

{ TAnimal }

constructor TAnimal.create;
begin
   //
end;

destructor TAnimal.destroy;
begin
  inherited;

end;

end.
