unit New_uHerdOwner;

interface
uses
   classes, Sysutils, db, dbTables, GenTypesConst;

type
  THerd = class;

  THerds = class(TList)
  private
     function GetHerd(AHerdID: Integer): THerd;
  public
     constructor create;
     destructor destroy;override;
     property Herd[AHerdID : Integer] : THerd read GetHerd;
  end;

  THerd = class
  private
    FHerdID: Integer;
    FHerdIdentity: string;
    FHerdIdentifier : string;
    FFixedCostsPerDay : double;
    FOrganicHerd : boolean;
    FFQAS : Boolean;
    FHoldingLoc : string;
    FHoldingSLoc : string;
    FMHSId : string;
    FRegisteredCountry : TCountry;
    FEmailCount : Integer;
    FEmailYear : Integer;
    FNextNatID : Integer;
    FInputNatIDStyle : Integer;
    FICBFExportDate : TDateTime;
    procedure SetHerdID(const Value: Integer);
    function GetHerdIdentity: string;
    function GetFixedCostsPerDay: double;
    function GetOrganicHerd: boolean;
    function GetFQAS: Boolean;
    function GetHoldingLoc: string;
    function GetHoldingSLoc: string;
    function GetMHSId: string;
    function GetRegisteredCountry: TCountry;
    function GetEmailCount: Integer;
    function GetEmailYear: Integer;
    function GetNextNatID: Integer;
    procedure SetNextNatID(const Value: Integer);
    function GetHerdIdentifier: string;
    function GetInputNatIDStyle: Integer;
    function GetHerdType: string;
    function GetICBFExportDate: TDateTime;
    procedure SetICBFExportDate(const Value: TDateTime);
    procedure OpenHerdQuery;
  protected
    FQuery : TQuery;
    FLookupData : Boolean;
  public
    constructor create(AHerdID : Integer);
    destructor Destroy;override;
    procedure Reload;
    property HerdID : Integer read FHerdID write SetHerdID;
    property HerdIdentity : string read GetHerdIdentity;
    property HerdIdentifier : string read GetHerdIdentifier;
    property FixedCostsPerDay : double read GetFixedCostsPerDay;
    property OrganicHerd : boolean read GetOrganicHerd;
    property FQAS : Boolean read GetFQAS;
    property HoldingLoc : string read GetHoldingLoc;
    property HoldingSLoc : string read GetHoldingSLoc;
    property MHSId : string read GetMHSId;
    property RegisteredCountry : TCountry read GetRegisteredCountry;
    property EmailCount : Integer read GetEmailCount;
    property EmailYear : Integer read GetEmailYear;
    property NextNatID : Integer read GetNextNatID write SetNextNatID;
    property InputNatIDStyle : Integer read GetInputNatIDStyle;
    property HerdType : string read GetHerdType;
    property ICBFExportDate : TDateTime read GetICBFExportDate write SetICBFExportDate;
   end;

const
   SQLSelectOwners = 'Select %s From Owners Where ID=:ID';
   SQLUpdateOwners = 'Update Owners Set %s = :Value Where ID=:ID';

implementation

{ THerds }

function THerds.GetHerd(AHerdID: Integer): THerd;
var
   i : Integer;
begin
   Result := nil;
   for i := 0 to Count-1 do
      begin
         if THerd(Items[i]).HerdID = AHerdID then
            Result := THerd(Items[i]);
      end;
end;

constructor THerds.create;
var
  Herd : THerd;
begin
   inherited create;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select ID From Owners');
         Open;
         try
            First;
            while not eof do
               begin
                  Herd := THerd.create(Fields[0].AsInteger);
                  Add(Herd);
                  Next;
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

destructor THerds.destroy;
var
   i : Integer;
begin
   for i := 0 to Count-1 do
      THerd(Items[i]).free;
  inherited;
end;

{ THerd }

constructor THerd.create(AHerdID : Integer);
begin
   FHerdID := AHerdID;
   FQuery := TQuery.Create(nil);
   OpenHerdQuery;
end;

destructor THerd.Destroy;
begin
  FreeAndNil(FQuery);
  inherited;
end;

function THerd.GetFixedCostsPerDay: double;
begin
   Result := FQuery.FieldByName('FixedCosts').AsFloat;
end;

function THerd.GetFQAS: Boolean;
begin
   Result := FQuery.FieldByName('FQAS').AsBoolean;
end;

function THerd.GetHerdIdentity: string;
begin
   Result := FQuery.FieldByName('HerdIdentity').AsString;
end;

function THerd.GetOrganicHerd: boolean;
begin
   Result := FQuery.FieldByName('Organic').AsBoolean;
end;

procedure THerd.SetHerdID(const Value: Integer);
begin
   FHerdID := Value;
end;

{ TUKHerdOwner }

function THerd.GetHoldingLoc: string;
begin
   Result := TRIM(FQuery.FieldByName('Location').AsString);
end;

function THerd.GetHoldingSLoc: string;
begin
   Result := TRIM(FQuery.FieldByName('SLocation').AsString);
end;

function THerd.GetMHSId: string;
begin
   Result := TRIM(FQuery.FieldByName('SMHSId').AsString);
end;

function THerd.GetRegisteredCountry: TCountry;
begin
   Result := Other;
   case FQuery.FieldByName('Country').AsInteger of
      1  : Result := Ireland;
      7  : Result := England;
      12 : Result := NIreland;
      13 : Result := Poland;
   end;
end;

function THerd.GetEmailCount: Integer;
begin
   Result := FQuery.FieldByName('EmailCount').AsInteger;
end;

function THerd.GetEmailYear: Integer;
begin
   Result := FQuery.FieldByName('EmailCount').AsInteger;
end;

function THerd.GetNextNatID: Integer;
begin
   Result := FQuery.FieldByName('NextNatID').AsInteger;
end;

procedure THerd.SetNextNatID(const Value: Integer);
begin
   with FQuery do
      begin
         Close;

         SQL.Clear;
         SQL.Add(Format(SQLUpdateOwners, ['NextNatID']));
         Params[0].AsInteger := Value;
         Params[1].AsInteger := FHerdID;
         ExecSQL;

         OpenHerdQuery;
     end;
end;

function THerd.GetHerdIdentifier: string;
begin
   Result := TRIM(FQuery.FieldByName('HerdIdentifier').AsString);
end;

function THerd.GetInputNatIDStyle: Integer;
{ Result = cInputNatIDStyle_ManualInput =1,cInputNatIDStyle_AutoGenInput =2,cInputNatIDStyle_ListInput =3}
var
   NatIDInputStyle, NextNatID : Integer;
begin

   NatIDInputStyle := FQuery.FieldByName('NatIDNumInputStyle').AsInteger;
   NextNatID := FQuery.FieldByName('NextNatID').AsInteger;

   if NextNatID > 0 then
      Result := NatIDInputStyle;
end;

function THerd.GetHerdType: string;
var
   GenLookId : Integer;
begin
   Result := 'BEEF';

   if ( FQuery.FieldByName('TypeOfHerd').AsInteger>0 ) then
      begin
         GenLookId := FQuery.FieldByName('TypeOfHerd').AsInteger;

         FQuery.Close;

         FQuery.SQL.Clear;
         FQuery.SQL.Add('Select Description From GenLook Where ID=:ID' );
         FQuery.Params[0].AsInteger := GenLookId;
         FQuery.Open;
         try
            FQuery.First;
            Result := UPPERCASE(FQuery.Fields[0].AsString);
         finally
            FQuery.Close;
         end;
      end;
end;


function THerd.GetICBFExportDate: TDateTime;
begin
   Result := FQuery.FieldByName('ICBFExportDate').AsDateTime;
end;

procedure THerd.SetICBFExportDate(const Value: TDateTime);
begin
   with FQuery do
      begin
         FQuery.Close;

         FQuery.SQL.Clear;
         FQuery.SQL.Add(Format(SQLUpdateOwners, ['ICBFExportDate']));
         FQuery.Params[0].AsDateTime := Value;
         FQuery.Params[1].AsInteger := FHerdID;
         FQuery.ExecSQL;

         OpenHerdQuery;
     end;
end;

procedure THerd.OpenHerdQuery;
begin
   FQuery.Close;
   FQuery.DatabaseName := AliasName;
   FQuery.SQL.Add('Select * From Owners');
   FQuery.SQL.Add('WHERE ID=:ID');
   FQuery.Params[0].AsInteger := FHerdID;
   FQuery.Open;
end;

procedure THerd.Reload;
begin
   OpenHerdQuery;
end;

end.
