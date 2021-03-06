unit LivestockInventory;

interface

uses
   classes, windows, sysutils, registry;

type
   TLivestockInventory = class
   private
    function GetBeefBullsBF06Mth: Integer;
    function GetBeefBullsCF06Mth: Integer;
    function GetBreedingBullsBF: Integer;
    function GetBreedingBullsCF: Integer;
    function GetCowsDryBF: Integer;
    function GetCowsDryCF: Integer;
    function GetCowsInMilkBF: Integer;
    function GetCowsInMilkCF: Integer;
    procedure SetBeefBullsBF06Mth(const Value: Integer);
    procedure SetBeefBullsCF06Mth(const Value: Integer);
    procedure SetBreedingBullsBF(const Value: Integer);
    procedure SetBreedingBullsCF(const Value: Integer);
    procedure SetCowsDryBF(const Value: Integer);
    procedure SetCowsDryCF(const Value: Integer);
    procedure SetCowsInMilkBF(const Value: Integer);
    procedure SetCowsInMilkCF(const Value: Integer);
    function GetHeifers06BF: Integer;
    function GetHeifers06CF: Integer;
    procedure SetHeifers06BF(const Value: Integer);
    procedure SetHeifers06CF(const Value: Integer);
    function GetHeifers12BF: Integer;
    function GetHeifers12CF: Integer;
    procedure SetHeifers12BF(const Value: Integer);
    procedure SetHeifers12CF(const Value: Integer);
    function GetHeifers18BF: Integer;
    function GetHeifers18CF: Integer;
    procedure SetHeifers18BF(const Value: Integer);
    procedure SetHeifers18CF(const Value: Integer);
    function GetHeifers24BF: Integer;
    function GetHeifers24CF: Integer;
    procedure SetHeifers24BF(const Value: Integer);
    procedure SetHeifers24CF(const Value: Integer);
    function GetSteers06BF: Integer;
    function GetSteers06CF: Integer;
    procedure SetSteers06BF(const Value: Integer);
    procedure SetSteers06CF(const Value: Integer);
    function GetSteers12BF: Integer;
    function GetSteers12CF: Integer;
    procedure SetSteers12BF(const Value: Integer);
    procedure SetSteers12CF(const Value: Integer);
    function GetSteers18BF: Integer;
    function GetSteers18CF: Integer;
    procedure SetSteers18BF(const Value: Integer);
    procedure SetSteers18CF(const Value: Integer);
    function GetSteers24BF: Integer;
    function GetSteers24CF: Integer;
    procedure SetSteers24BF(const Value: Integer);
    procedure SetSteers24CF(const Value: Integer);
    function GetCalvesBF: Integer;
    function GetCalvesCF: Integer;
    function GetCowsBF: Integer;
    function GetCowsCF: Integer;
    function GetHeifers24PlusBF: Integer;
    function GetHeifers24PlusCF: Integer;
    function GetHeifersPlus24BF: Integer;
    function GetHeifersPlus24CF: Integer;
    procedure SetHeifers24PlusBF(const Value: Integer);
    procedure SetHeifers24PlusCF(const Value: Integer);
    function GetSteers24PlusBF: Integer;
    function GetSteers24PlusCF: Integer;
    procedure SetSteers24PlusBF(const Value: Integer);
    procedure SetSteers24PlusCF(const Value: Integer);
    function GetHeifersBF: Integer;
    function GetHeifersCF: Integer;
    function GetSteersBF: Integer;
    function GetSteersCF: Integer;
    function GetOtherBF: Integer;
    function GetOtherCF: Integer;
    function GetBullsBF: Integer;
    function GetBullsCF: Integer;
    function GetTotalBF: Integer;
    function GetTotalCF: Integer;
    function GetStartDate: TDateTime;
    procedure SetStartDate(const Value: TDateTime);
    function GetEndDate: TDateTime;
    procedure SetEndDate(const Value: TDateTime);
    function GetBeefBullsBF12PMth: Integer;
    function GetBeefBullsBF612Mth: Integer;
    function GetBeefBullsCF12PMth: Integer;
    function GetBeefBullsCF612Mth: Integer;
    procedure SetBeefBullsBF12PMth(const Value: Integer);
    procedure SetBeefBullsBF612Mth(const Value: Integer);
    procedure SetBeefBullsCF12PMth(const Value: Integer);
    procedure SetBeefBullsCF612Mth(const Value: Integer);
   protected
      Reg : TRegistry;
   public
    constructor Create(DataName : string);
    destructor Destroy;override;

    property CowsInMilkCF : Integer read GetCowsInMilkCF write SetCowsInMilkCF;
    property CowsDryCF : Integer read GetCowsDryCF write SetCowsDryCF;

    property CowsInMilkBF : Integer read GetCowsInMilkBF write SetCowsInMilkBF;
    property CowsDryBF : Integer read GetCowsDryBF write SetCowsDryBF;

    property BeefBullsCF06Mth : Integer read GetBeefBullsCF06Mth write SetBeefBullsCF06Mth;
    property BeefBullsCF612Mth : Integer read GetBeefBullsCF612Mth write SetBeefBullsCF612Mth;
    property BeefBullsCF12PMth : Integer read GetBeefBullsCF12PMth write SetBeefBullsCF12PMth;
    property BreedingBullsCF : Integer read GetBreedingBullsCF write SetBreedingBullsCF;

    property BeefBullsBF06Mth : Integer read GetBeefBullsBF06Mth write SetBeefBullsBF06Mth;
    property BeefBullsBF612Mth : Integer read GetBeefBullsBF612Mth write SetBeefBullsBF612Mth;
    property BeefBullsBF12PMth : Integer read GetBeefBullsBF12PMth write SetBeefBullsBF12PMth;
    property BreedingBullsBF : Integer read GetBreedingBullsBF write SetBreedingBullsBF;

    property Heifers06BF : Integer read GetHeifers06BF write SetHeifers06BF;
    property Heifers06CF : Integer read GetHeifers06CF write SetHeifers06CF;

    property Heifers12BF : Integer read GetHeifers12BF write SetHeifers12BF;
    property Heifers12CF : Integer read GetHeifers12CF write SetHeifers12CF;

    property Heifers18BF : Integer read GetHeifers18BF write SetHeifers18BF;
    property Heifers18CF : Integer read GetHeifers18CF write SetHeifers18CF;

    property Heifers24BF : Integer read GetHeifers24BF write SetHeifers24BF;
    property Heifers24CF : Integer read GetHeifers24CF write SetHeifers24CF;

    property Heifers24PlusBF : Integer read GetHeifers24PlusBF write SetHeifers24PlusBF;
    property Heifers24PlusCF : Integer read GetHeifers24PlusCF write SetHeifers24PlusCF;

    property Steers06BF : Integer read GetSteers06BF write SetSteers06BF;
    property Steers06CF : Integer read GetSteers06CF write SetSteers06CF;

    property Steers12BF : Integer read GetSteers12BF write SetSteers12BF;
    property Steers12CF : Integer read GetSteers12CF write SetSteers12CF;

    property Steers18BF : Integer read GetSteers18BF write SetSteers18BF;
    property Steers18CF : Integer read GetSteers18CF write SetSteers18CF;

    property Steers24BF : Integer read GetSteers24BF write SetSteers24BF;
    property Steers24CF : Integer read GetSteers24CF write SetSteers24CF;

    property Steers24PlusBF : Integer read GetSteers24PlusBF write SetSteers24PlusBF;
    property Steers24PlusCF : Integer read GetSteers24PlusCF write SetSteers24PlusCF;

    property CalvesBF : Integer read GetCalvesBF;
    property CalvesCF : Integer read GetCalvesCF;

    property CowsBF : Integer read GetCowsBF;
    property CowsCF : Integer read GetCowsCF;

    property BullsBF : Integer read GetBullsBF;
    property BullsCF : Integer read GetBullsCF;

    property HeifersBF : Integer read GetHeifersBF;
    property HeifersCF : Integer read GetHeifersCF;

    property SteersBF : Integer read GetSteersBF;
    property SteersCF : Integer read GetSteersCF;

    property OtherBF : Integer read GetOtherBF;
    property OtherCF : Integer read GetOtherCF;

    property TotalBF : Integer read GetTotalBF;
    property TotalCF : Integer read GetTotalCF;

    property StartDate : TDateTime read GetStartDate write SetStartDate;
    property EndDate : TDateTime read GetEndDate write SetEndDate;
   end;

const
   cRootPath = 'Software\Kingswood\Herd\Reports\%s\LSInventory\';

   cCF = 'CF';
   cBF = 'BF';
   cBeefBulls06Mth = 'BfB06Mth';
   cBeefBullsBF06Mth = cBeefBulls06Mth+cBF;
   cBeefBullsCF06Mth = cBeefBulls06Mth+cCF;

   cBeefBulls612Mth = 'BfB612Mth';
   cBeefBullsBF612Mth = cBeefBulls612Mth+cBF;
   cBeefBullsCF612Mth = cBeefBulls612Mth+cCF;

   cBeefBulls12PMth = 'BfB12PMth';
   cBeefBullsBF12PMth = cBeefBulls12PMth+cBF;
   cBeefBullsCF12PMth = cBeefBulls12PMth+cCF;

   cBreedingBulls = 'BB';
   cBreedingBullsCF = cBreedingBulls+cCF;
   cBreedingBullsBF = cBreedingBulls+cBF;
   cCowsInMilk = 'CM';
   cCowsInMilkCF = cCowsInMilk+cCF;
   cCowsInMilkBF = cCowsInMilk+cBF;
   cCowsDry = 'CD';
   cCowsDryCF = cCowsDry+cCF;
   cCowsDryBF = cCowsDry+cBF;
   cHeifers06 = 'H06';
   cHeifers06BF = cHeifers06+cBF;
   cHeifers06CF = cHeifers06+cCF;
   cHeifers12 = 'H12';
   cHeifers12BF = cHeifers12+cBF;
   cHeifers12CF = cHeifers12+cCF;
   cHeifers18 = 'H18';
   cHeifers18BF = cHeifers18+cBF;
   cHeifers18CF = cHeifers18+cCF;
   cHeifers24 = 'H24';
   cHeifers24BF = cHeifers24+cBF;
   cHeifers24CF = cHeifers24+cCF;
   cHeifers24PlusBF = cHeifers24+'+'+cBF;
   cHeifers24PlusCF = cHeifers24+'+'+cCF;

   cSteers06 = 'S06';
   cSteers06BF = cSteers06+cBF;
   cSteers06CF = cSteers06+cCF;
   cSteers12 = 'S12';
   cSteers12BF = cSteers12+cBF;
   cSteers12CF = cSteers12+cCF;
   cSteers18 = 'S18';
   cSteers18BF = cSteers18+cBF;
   cSteers18CF = cSteers18+cCF;
   cSteers24 = 'S24';
   cSteers24BF = cSteers24+cBF;
   cSteers24CF = cSteers24+cCF;
   cSteers24PlusBF = cSteers24+'+'+cBF;
   cSteers24PlusCF = cSteers24+'+'+cCF;

   cStartDate = 'StartDate';
   cEndDate = 'EndDate';

implementation

{ TLivestockInventory }

constructor TLivestockInventory.Create(DataName: string);
begin
   Reg := TRegistry.Create;
   Reg.RootKey := HKEY_LOCAL_MACHINE;
   if not Reg.OpenKey( Format(cRootPath, [DataName]), TRUE ) then
      raise Exception.Create('Cannot open registry key');
end;

destructor TLivestockInventory.Destroy;
begin
   if ( Reg <> nil ) then
      begin
         Reg.CloseKey;
         FreeAndNil(Reg);
      end;
end;

function TLivestockInventory.GetBeefBullsBF06Mth: Integer;
begin
   if not Reg.ValueExists(cBeefBullsBF06Mth) then BeefBullsBF06Mth := 0;
   Result := Reg.ReadInteger(cBeefBullsBF06Mth);
end;

function TLivestockInventory.GetBeefBullsBF12PMth: Integer;
begin
   if not Reg.ValueExists(cBeefBullsBF12PMth) then BeefBullsBF12PMth := 0;
   Result := Reg.ReadInteger(cBeefBullsBF12PMth);

end;

function TLivestockInventory.GetBeefBullsBF612Mth: Integer;
begin
   if not Reg.ValueExists(cBeefBullsBF612Mth) then BeefBullsBF612Mth := 0;
   Result := Reg.ReadInteger(cBeefBullsBF612Mth);
end;

function TLivestockInventory.GetBeefBullsCF06Mth: Integer;
begin
   if not Reg.ValueExists(cBeefBullsCF06Mth) then BeefBullsCF06Mth := 0;
   Result := Reg.ReadInteger(cBeefBullsCF06Mth);
end;

function TLivestockInventory.GetBeefBullsCF12PMth: Integer;
begin
   if not Reg.ValueExists(cBeefBullsCF12PMth) then BeefBullsCF12PMth := 0;
   Result := Reg.ReadInteger(cBeefBullsCF12PMth);
end;

function TLivestockInventory.GetBeefBullsCF612Mth: Integer;
begin
   if not Reg.ValueExists(cBeefBullsCF612Mth) then BeefBullsCF612Mth := 0;
   Result := Reg.ReadInteger(cBeefBullsCF612Mth);
end;

function TLivestockInventory.GetBreedingBullsBF: Integer;
begin
   if not Reg.ValueExists(cBreedingBullsBF) then BreedingBullsBF := 0;
   Result := Reg.ReadInteger(cBreedingBullsBF);
end;

function TLivestockInventory.GetBreedingBullsCF: Integer;
begin
   if not Reg.ValueExists(cBreedingBullsCF) then BreedingBullsCF := 0;
   Result := Reg.ReadInteger(cBreedingBullsCF);
end;

function TLivestockInventory.GetBullsBF: Integer;
begin
   Result := BreedingBullsBF + BeefBullsBF06Mth + BeefBullsBF612Mth + BeefBullsBF12PMth;
end;

function TLivestockInventory.GetBullsCF: Integer;
begin
   Result := BreedingBullsCF + BeefBullsCF06Mth + BeefBullsCF612Mth + BeefBullsCF12PMth;
end;

function TLivestockInventory.GetCalvesBF: Integer;
begin
   Result := Heifers06BF + Heifers12BF + Steers06BF + Steers12BF;
end;

function TLivestockInventory.GetCalvesCF: Integer;
begin
   Result := Heifers06CF + Heifers12CF + Steers06CF + Steers12CF;
end;

function TLivestockInventory.GetCowsBF: Integer;
begin
   Result := CowsInMilkBF + CowsDryBF;
end;

function TLivestockInventory.GetCowsCF: Integer;
begin
   Result := CowsInMilkCF + CowsDryCF;
end;

function TLivestockInventory.GetCowsDryBF: Integer;
begin
   if not Reg.ValueExists(cCowsDryBF) then CowsDryBF := 0;
   Result := Reg.ReadInteger(cCowsDryBF);
end;

function TLivestockInventory.GetCowsDryCF: Integer;
begin
   if not Reg.ValueExists(cCowsDryCF) then CowsDryCF := 0;
   Result := Reg.ReadInteger(cCowsDryCF);
end;

function TLivestockInventory.GetCowsInMilkBF: Integer;
begin
   if not Reg.ValueExists(cCowsInMilkBF) then CowsInMilkBF := 0;
   Result := Reg.ReadInteger(cCowsInMilkBF);
end;

function TLivestockInventory.GetCowsInMilkCF: Integer;
begin
   if not Reg.ValueExists(cCowsInMilkCF) then CowsInMilkCF := 0;
   Result := Reg.ReadInteger(cCowsInMilkCF);
end;

function TLivestockInventory.GetEndDate: TDateTime;
begin
   if not Reg.ValueExists(cEndDate) then EndDate := 0;
   Result := Reg.ReadDateTime(cEndDate);
end;

function TLivestockInventory.GetHeifers06BF: Integer;
begin
   if not Reg.ValueExists(cHeifers06BF) then Heifers06BF := 0;
   Result := Reg.ReadInteger(cHeifers06BF);
end;

function TLivestockInventory.GetHeifers06CF: Integer;
begin
   if not Reg.ValueExists(cHeifers06CF) then Heifers06CF := 0;
   Result := Reg.ReadInteger(cHeifers06CF);
end;

function TLivestockInventory.GetHeifers12BF: Integer;
begin
   if not Reg.ValueExists(cHeifers12BF) then Heifers12BF := 0;
   Result := Reg.ReadInteger(cHeifers12BF);
end;

function TLivestockInventory.GetHeifers12CF: Integer;
begin
   if not Reg.ValueExists(cHeifers12CF) then Heifers12CF := 0;
   Result := Reg.ReadInteger(cHeifers12CF);
end;

function TLivestockInventory.GetHeifers18BF: Integer;
begin
   if not Reg.ValueExists(cHeifers18BF) then Heifers18BF := 0;
   Result := Reg.ReadInteger(cHeifers18BF);
end;

function TLivestockInventory.GetHeifers18CF: Integer;
begin
   if not Reg.ValueExists(cHeifers18CF) then Heifers18CF := 0;
   Result := Reg.ReadInteger(cHeifers18CF);
end;

function TLivestockInventory.GetHeifers24BF: Integer;
begin
   if not Reg.ValueExists(cHeifers24BF) then Heifers24BF := 0;
   Result := Reg.ReadInteger(cHeifers24BF);
end;

function TLivestockInventory.GetHeifers24CF: Integer;
begin
   if not Reg.ValueExists(cHeifers24CF) then Heifers24CF := 0;
   Result := Reg.ReadInteger(cHeifers24CF);
end;

function TLivestockInventory.GetHeifers24PlusBF: Integer;
begin
   if not Reg.ValueExists(cHeifers24PlusBF) then Heifers24PlusBF := 0;
   Result := Reg.ReadInteger(cHeifers24PlusBF);
end;

function TLivestockInventory.GetHeifers24PlusCF: Integer;
begin
   if not Reg.ValueExists(cHeifers24PlusCF) then Heifers24PlusCF := 0;
   Result := Reg.ReadInteger(cHeifers24PlusCF);
end;

function TLivestockInventory.GetHeifersBF: Integer;
begin
   Result := Heifers18BF + Heifers24BF;
end;

function TLivestockInventory.GetHeifersCF: Integer;
begin
   Result := Heifers18CF + Heifers24CF;
end;

function TLivestockInventory.GetHeifersPlus24BF: Integer;
begin
   if not Reg.ValueExists(cHeifers24PlusBF) then Heifers24PlusBF := 0;
   Result := Reg.ReadInteger(cHeifers24PlusBF);
end;

function TLivestockInventory.GetHeifersPlus24CF: Integer;
begin
   if not Reg.ValueExists(cHeifers24PlusCF) then Heifers24PlusCF := 0;
   Result := Reg.ReadInteger(cHeifers24PlusCF);
end;

function TLivestockInventory.GetOtherBF: Integer;
begin
   Result := Heifers24PlusBF + Steers24PlusBF;
end;

function TLivestockInventory.GetOtherCF: Integer;
begin
   Result := Heifers24PlusCF + Steers24PlusCF;
end;

function TLivestockInventory.GetStartDate: TDateTime;
begin
   if not Reg.ValueExists(cStartDate) then StartDate := 0;
   Result := Reg.ReadDateTime(cStartDate);
end;

function TLivestockInventory.GetSteers06BF: Integer;
begin
   if not Reg.ValueExists(cSteers06BF) then Steers06BF := 0;
   Result := Reg.ReadInteger(cSteers06BF);
end;

function TLivestockInventory.GetSteers06CF: Integer;
begin
   if not Reg.ValueExists(cSteers06CF) then Steers06CF := 0;
   Result := Reg.ReadInteger(cSteers06CF);
end;

function TLivestockInventory.GetSteers12BF: Integer;
begin
   if not Reg.ValueExists(cSteers12BF) then Steers12BF := 0;
   Result := Reg.ReadInteger(cSteers12BF);
end;

function TLivestockInventory.GetSteers12CF: Integer;
begin
   if not Reg.ValueExists(cSteers12CF) then Steers12CF := 0;
   Result := Reg.ReadInteger(cSteers12CF);
end;

function TLivestockInventory.GetSteers18BF: Integer;
begin
   if not Reg.ValueExists(cSteers18BF) then Steers18BF := 0;
   Result := Reg.ReadInteger(cSteers18BF);
end;

function TLivestockInventory.GetSteers18CF: Integer;
begin
   if not Reg.ValueExists(cSteers18CF) then Steers18CF := 0;
   Result := Reg.ReadInteger(cSteers18CF);
end;

function TLivestockInventory.GetSteers24BF: Integer;
begin
   if not Reg.ValueExists(cSteers24BF) then Steers24BF := 0;
   Result := Reg.ReadInteger(cSteers24BF);
end;

function TLivestockInventory.GetSteers24CF: Integer;
begin
   if not Reg.ValueExists(cSteers24CF) then Steers24CF := 0;
   Result := Reg.ReadInteger(cSteers24CF);
end;

function TLivestockInventory.GetSteers24PlusBF: Integer;
begin
   if not Reg.ValueExists(cSteers24PlusBF) then Steers24PlusBF := 0;
   Result := Reg.ReadInteger(cSteers24PlusBF);
end;

function TLivestockInventory.GetSteers24PlusCF: Integer;
begin
   if not Reg.ValueExists(cSteers24PlusCF) then Steers24PlusCF := 0;
   Result := Reg.ReadInteger(cSteers24PlusCF);
end;

function TLivestockInventory.GetSteersBF: Integer;
begin
   Result := Steers18BF + Steers24BF;
end;

function TLivestockInventory.GetSteersCF: Integer;
begin
   Result := Steers18CF + Steers24CF;
end;

function TLivestockInventory.GetTotalBF: Integer;
begin
   Result := CowsInMilkBF + CowsDryBF + BeefBullsBF06Mth + BeefBullsBF612Mth + BeefBullsBF12PMth + BreedingBullsBF +
             Heifers06BF + Heifers12BF + Heifers18BF + Heifers24BF +
             Heifers24PlusBF + Steers06BF + Steers12BF + Steers18BF +
             Steers24BF + Steers24PlusBF;
end;

function TLivestockInventory.GetTotalCF: Integer;
begin
   Result := CowsInMilkCF + CowsDryCF + BeefBullsCF06Mth + BeefBullsCF612Mth + BeefBullsCF12PMth + BreedingBullsCF +
             Heifers06CF+ Heifers12CF+ Heifers18CF + Heifers24CF+
             Heifers24PlusCF + Steers06CF + Steers12CF + Steers18CF +
             Steers24CF + Steers24PlusCF;
end;

procedure TLivestockInventory.SetBeefBullsBF06Mth(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cBeefBullsBF06Mth, Value)
   else Reg.WriteInteger(cBeefBullsBF06Mth, 0);
end;

procedure TLivestockInventory.SetBeefBullsBF12PMth(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cBeefBullsBF12PMth, Value)
   else Reg.WriteInteger(cBeefBullsBF12PMth, 0);
end;

procedure TLivestockInventory.SetBeefBullsBF612Mth(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cBeefBullsBF612Mth, Value)
   else Reg.WriteInteger(cBeefBullsBF612Mth, 0);
end;

procedure TLivestockInventory.SetBeefBullsCF06Mth(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cBeefBullsCF06Mth, Value)
   else Reg.WriteInteger(cBeefBullsCF06Mth, 0);
end;

procedure TLivestockInventory.SetBeefBullsCF12PMth(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cBeefBullsCF12PMth, Value)
   else Reg.WriteInteger(cBeefBullsCF12PMth, 0);
end;

procedure TLivestockInventory.SetBeefBullsCF612Mth(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cBeefBullsCF612Mth, Value)
   else Reg.WriteInteger(cBeefBullsCF612Mth, 0);
end;

procedure TLivestockInventory.SetBreedingBullsBF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cBreedingBullsBF, Value)
   else Reg.WriteInteger(cBreedingBullsBF, 0);
end;

procedure TLivestockInventory.SetBreedingBullsCF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cBreedingBullsCF, Value)
   else Reg.WriteInteger(cBreedingBullsCF, 0);
end;

procedure TLivestockInventory.SetCowsDryBF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cCowsDryBF, Value)
   else Reg.WriteInteger(cCowsDryBF, 0);
end;

procedure TLivestockInventory.SetCowsDryCF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cCowsDryCF, Value)
   else Reg.WriteInteger(cCowsDryCF, 0);
end;

procedure TLivestockInventory.SetCowsInMilkBF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cCowsInMilkBF, Value)
   else Reg.WriteInteger(cCowsInMilkBF, 0);
end;

procedure TLivestockInventory.SetCowsInMilkCF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cCowsInMilkCF, Value)
   else Reg.WriteInteger(cCowsInMilkCF, 0);
end;

procedure TLivestockInventory.SetEndDate(const Value: TDateTime);
begin
   if ( Value > -1 ) then Reg.WriteDateTime(cEndDate, Value)
   else Reg.WriteDateTime(cEndDate, 0);
end;

procedure TLivestockInventory.SetHeifers06BF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cHeifers06BF, Value)
   else Reg.WriteInteger(cHeifers06BF, 0);
end;

procedure TLivestockInventory.SetHeifers06CF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cHeifers06CF, Value)
   else Reg.WriteInteger(cHeifers06CF, 0);
end;

procedure TLivestockInventory.SetHeifers12BF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cHeifers12BF, Value)
   else Reg.WriteInteger(cHeifers12BF, 0);
end;

procedure TLivestockInventory.SetHeifers12CF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cHeifers12CF, Value)
   else Reg.WriteInteger(cHeifers12CF, 0);
end;

procedure TLivestockInventory.SetHeifers18BF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cHeifers18BF, Value)
   else Reg.WriteInteger(cHeifers18BF, 0);
end;

procedure TLivestockInventory.SetHeifers18CF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cHeifers18CF, Value)
   else Reg.WriteInteger(cHeifers18CF, 0);
end;

procedure TLivestockInventory.SetHeifers24BF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cHeifers24BF, Value)
   else Reg.WriteInteger(cHeifers24BF, 0);
end;

procedure TLivestockInventory.SetHeifers24CF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cHeifers24CF, Value)
   else Reg.WriteInteger(cHeifers24CF, 0);
end;

procedure TLivestockInventory.SetHeifers24PlusBF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cHeifers24PlusBF, Value)
   else Reg.WriteInteger(cHeifers24PlusBF, 0);
end;

procedure TLivestockInventory.SetHeifers24PlusCF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cHeifers24PlusCF, Value)
   else Reg.WriteInteger(cHeifers24PlusCF, 0);
end;

procedure TLivestockInventory.SetStartDate(const Value: TDateTime);
begin
   if ( Value > -1 ) then Reg.WriteDateTime(cStartDate, Value)
   else Reg.WriteDateTime(cStartDate, 0);
end;

procedure TLivestockInventory.SetSteers06BF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cSteers06BF, Value)
   else Reg.WriteInteger(cSteers06BF, 0);
end;

procedure TLivestockInventory.SetSteers06CF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cSteers06CF, Value)
   else Reg.WriteInteger(cSteers06CF, 0);
end;

procedure TLivestockInventory.SetSteers12BF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cSteers12BF, Value)
   else Reg.WriteInteger(cSteers12BF, 0);
end;

procedure TLivestockInventory.SetSteers12CF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cSteers12CF, Value)
   else Reg.WriteInteger(cSteers12CF, 0);
end;

procedure TLivestockInventory.SetSteers18BF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cSteers18BF, Value)
   else Reg.WriteInteger(cSteers18BF, 0);
end;

procedure TLivestockInventory.SetSteers18CF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cSteers18CF, Value)
   else Reg.WriteInteger(cSteers18CF, 0);
end;

procedure TLivestockInventory.SetSteers24BF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cSteers24BF, Value)
   else Reg.WriteInteger(cSteers24BF, 0);
end;

procedure TLivestockInventory.SetSteers24CF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cSteers24CF, Value)
   else Reg.WriteInteger(cSteers24CF, 0);
end;

procedure TLivestockInventory.SetSteers24PlusBF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cSteers24PlusBF, Value)
   else Reg.WriteInteger(cSteers24PlusBF, 0);
end;

procedure TLivestockInventory.SetSteers24PlusCF(const Value: Integer);
begin
   if ( Value > -1 ) then Reg.WriteInteger(cSteers24PlusCF, Value)
   else Reg.WriteInteger(cSteers24PlusCF, 0);
end;

end.
