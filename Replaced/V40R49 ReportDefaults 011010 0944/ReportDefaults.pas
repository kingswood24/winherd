unit ReportDefaults;

interface

uses
   Classes, Windows, Registry, SysUtils;

type
  TDateRange = record
     FromDate, ToDate : TDateTime;
  end;

  TIntRange = record
     IntFrom, IntTo : Integer;
  end;

  TNoOfRetentionDays = record
     Days1, Days2 : Integer;
  end;

  ReportDefaultsException = class(Exception);
  { TReportDefaults }
  TReportDefaults = class
  private
    Reg : TRegistry;
    FReportName,
    FDataDirName,
    FRootPath : string;
    LoadOnCreate : Boolean;
    procedure RaiseError(msg : string);
    procedure Check;
    function GetSortOrder: Integer;
    function GetSortField: Integer;
    procedure SetSortOrder(const Value: Integer);
    procedure SetSortField(const Value: Integer);
    function GetLactRange: TIntRange;
    procedure SetLactRange(const Value: TIntRange);
    function GetDOBRange: TDateRange;
    procedure SetDOBRange(const Value: TDateRange);
    function GetReportOn: Byte;
    procedure SetReportOn(const Value: Byte);
    function GetDateInterval: Integer;
    procedure SetDateInterval(const Value: Integer);
    function GetDichromatic: Boolean;
    procedure SetDichromatic(const Value: Boolean);
    function GetIncludeLeftHerd: Boolean;
    procedure SetIncludeLeftHerd(const Value: Boolean);
    function GetLactationType: Integer;
    procedure SetLactationType(const Value: Integer);
    function GetSex: Integer;
    procedure SetSex(const Value: Integer);
  public
    constructor Create(AReportName : string);
    destructor Destroy; override;
    property SortField : Integer read GetSortField write SetSortField;
    property SortOrder : Integer read GetSortOrder write SetSortOrder;
    property LactRange : TIntRange read GetLactRange write SetLactRange;
    property DOBRange : TDateRange read GetDOBRange write SetDOBRange;
    property ReportOn : Byte read GetReportOn write SetReportOn;
    property DateInterval : Integer read GetDateInterval write SetDateInterval;
    property IncludeLeftHerd : Boolean read GetIncludeLeftHerd write SetIncludeLeftHerd;
    property Dichromatic : Boolean read GetDichromatic write SetDichromatic; //  Definition:   [adj]  having or involving two colors
    property LactationType : Integer read GetLactationType write SetLactationType;
    property Sex : Integer read GetSex write SetSex;
  end;

  { TStockOnHandDefault }
  TStockOnHandDefaults = class(TReportDefaults)
  private
    function GetDisplayDamField: Byte;
    procedure SetDisplayDamField(const Value: Byte);
  public
    constructor Create(AReportName : string);
    property DisplayDamField : Byte read GetDisplayDamField write SetDisplayDamField;
  end;

  { TPurchaseSalesDefault }
  TPurchaseSalesDefaults = class(TReportDefaults)
  private
    function GetCustomer: Integer;
    function GetIdentityField: Byte;
    function GetPurchaseInterval: Integer;
    function GetSaleInterval: Integer;
    function GetSupplier: Integer;
    procedure SetCustomer(const Value: Integer);
    procedure SetIdentityField(const Value: Byte);
    procedure SetPurchaseInterval(const Value: Integer);
    procedure SetSaleInterval(const Value: Integer);
    procedure SetSupplier(const Value: Integer);
  public
    constructor Create(AReportName : string);
    property Supplier : Integer read GetSupplier write SetSupplier;
    property Customer : Integer read GetCustomer write SetCustomer;
    property IdentityField : Byte read GetIdentityField write SetIdentityField;
    property SaleInterval : Integer read GetSaleInterval write SetSaleInterval;
    property PurchaseInterval : Integer read GetPurchaseInterval write SetPurchaseInterval;
  end;

  TSalesEligibilityDefaults = class(TReportDefaults)
  private
    function GetDOBInterval: Integer;
    function GetPurchaseInterval: Integer;
    function GetThirtyMonthInterval: Integer;
    procedure SetDOBInterval(const Value: Integer);
    procedure SetPurchaseInterval(const Value: Integer);
    procedure SetThirtyMonthInterval(const Value: Integer);
    function GetRetentionDays: TNoOfRetentionDays;
    procedure SetRetentionDays(const Value: TNoOfRetentionDays);
  public
    constructor Create(AReportName : string);
    property DOBInterval : Integer read GetDOBInterval write SetDOBInterval;
    property ThirtyMonthInterval : Integer read GetThirtyMonthInterval write SetThirtyMonthInterval;
    property PurchaseInterval : Integer read GetPurchaseInterval write SetPurchaseInterval;
    property RetentionDays : TNoOfRetentionDays read GetRetentionDays write SetRetentionDays;
  end;

  { TRestrictedAnimalsDefaults }
  TRestrictedAnimalsDefaults = class(TReportDefaults)
  private
    function GetBruceDateFlt: Boolean;
    function GetTBTestDateFlt: Boolean;
    function GetVetWithdrawalFlt: Boolean;
    function GetWithInRetentionFlt: Boolean;
    procedure SetBruceDateFlt(const Value: Boolean);
    procedure SetTBTestDateFlt(const Value: Boolean);
    procedure SetVetWithdrawalFlt(const Value: Boolean);
    procedure SetWithInRetentionFlt(const Value: Boolean);
    function GetMovementDate: TDateTime;
    procedure SetMovementDate(const Value: TDateTime);
  public
    constructor Create(AReportName : string);
    property WithInRetentionFlt : Boolean read GetWithInRetentionFlt write SetWithInRetentionFlt;
    property TBTestDateFlt : Boolean read GetTBTestDateFlt write SetTBTestDateFlt;
    property VetWithdrawalFlt : Boolean read GetVetWithdrawalFlt write SetVetWithdrawalFlt;
    property BruceDateFlt : Boolean read GetBruceDateFlt write SetBruceDateFlt;
    property MovementDate : TDateTime read GetMovementDate write SetMovementDate;
  end;

  { TVetTreatmentsDefaults }
  TVetTreatmentsDefaults = class(TReportDefaults)
  private
    function GetIncludeDryAnimals: Boolean;
    procedure SetIncludeDryAnimals(const Value: Boolean);
  public
    constructor Create(AReportName : string);
    property IncludeDryAnimals : Boolean read GetIncludeDryAnimals write SetIncludeDryAnimals;
  end;

  { TSCCAnalysisDefaults }
  TSCCAnalysisDefaults = class(TReportDefaults)
  private
    function GetMonthRange: TIntRange;
    procedure SetMonthRange(const Value: TIntRange);
    function GetCalvingMonthFlt: Boolean;
    function GetLactFlt: Boolean;
    procedure SetCalvingMonthFlt(const Value: Boolean);
    procedure SetLactFlt(const Value: Boolean);
  public
    constructor Create(AReportName : string);
    property MonthRange : TIntRange read GetMonthRange write SetMonthRange;
    property LactFlt : Boolean read GetLactFlt write SetLactFlt;
    property CalvingMonthFlt : Boolean read GetCalvingMonthFlt write SetCalvingMonthFlt;
  end;

  { THeatsServicesPDs }
  THeatsServicesPDs = class(TReportDefaults)
  private
    function GetDateRefers: Integer;
    function GetIncLactation: Integer;
    function GetShowIrregular: Integer;
    procedure SetDateRefers(const Value: Integer);
    procedure SetIncLactation(const Value: Integer);
    procedure SetShowIrregular(const Value: Integer);
  public
     constructor Create(AReportName : string);
     property IncLactation : Integer read GetIncLactation write SetIncLactation;
     property DateRefers : Integer read GetDateRefers write SetDateRefers;
     property ShowIrregular : Integer read GetShowIrregular write SetShowIrregular;
  end;

  { TActionReminderDefaults }
  TActionReminderDefaults = class(TReportDefaults)
  private
    function GetIncludeCows: Boolean;
    function GetIncludeHeifers: Boolean;
    procedure SetIncludeCows(const Value: Boolean);
    procedure SetIncludeHeifers(const Value: Boolean);
    function GetBlankEntryForm: Boolean;
    function GetDoubleSpacing: Boolean;
    procedure SetBlankEntryForm(const Value: Boolean);
    procedure SetDoubleSpacing(const Value: Boolean);
    function GetNoDays: Integer;
    procedure SetNoDays(const Value: Integer);
    function GetIncludeNotPregnant: Boolean;
    procedure SetIncludeNotPregnant(const Value: Boolean);
    function GetSortByDate: Boolean;
    procedure SetSortByDate(const Value: Boolean);
  public
     constructor Create(AReportName : string);
     property NoDays : Integer read GetNoDays write SetNoDays;
     property IncludeCows : Boolean read GetIncludeCows write SetIncludeCows;
     property IncludeHeifers : Boolean read GetIncludeHeifers write SetIncludeHeifers ;
     property DoubleSpacing : Boolean read GetDoubleSpacing write SetDoubleSpacing;
     property BlankEntryForm : Boolean read GetBlankEntryForm write SetBlankEntryForm;
     property IncludeNotPregnant : Boolean read GetIncludeNotPregnant write SetIncludeNotPregnant;
     property SortByDate : Boolean read GetSortByDate write SetSortByDate;
  end;

  { TDueServiceDefaults }
  TDueServiceDefaults = class(TActionReminderDefaults)
  private
    function GetDueRepeatService: Boolean;
    function GetDueServeNoHeat: Boolean;
    function GetDueServiceWithHeat: Boolean;
    function GetExtendedDetails: Boolean;
    function GetIncludeOverDue: Boolean;
    procedure SetDueRepeatService(const Value: Boolean);
    procedure SetDueServeNoHeat(const Value: Boolean);
    procedure SetDueServiceWithHeat(const Value: Boolean);
    procedure SetExtendedDetails(const Value: Boolean);
    procedure SetIncludeOverDue(const Value: Boolean);
    function GetDueWithin: Integer;
    procedure SetDueWithin(const Value: Integer);
  public
     constructor Create(AReportName : String);
     property DueServeNoHeat : Boolean read GetDueServeNoHeat write SetDueServeNoHeat ;
     property DueServiceWithHeat : Boolean read GetDueServiceWithHeat write SetDueServiceWithHeat ;
     property DueRepeatService : Boolean read GetDueRepeatService write SetDueRepeatService ;
     property ExtendedDetails : Boolean read GetExtendedDetails write SetExtendedDetails ;
     property ExcludeOverDue : Boolean  read GetIncludeOverDue write SetIncludeOverDue ;
     property DueWithin : Integer  read GetDueWithin write SetDueWithin;
  end;

  { TDuePregDiagDefaults }
  TDuePregDiagDefaults = class(TActionReminderDefaults)
  private
    function GetDaysAfterCalving: Integer;
    function GetIncludeNotServed: Boolean;
    procedure SetDaysAfterCalving(const Value: Integer);
    procedure SetIncludeNotServed(const Value: Boolean);
  public
     constructor Create(AReportName : string);
     property DaysAfterCalving : Integer read GetDaysAfterCalving write SetDaysAfterCalving;
     property IncludeNotServed : Boolean read GetIncludeNotServed write SetIncludeNotServed;
  end;

  { TDueDryOffDefaults }
  TDueDryOffDefaults = class(TActionReminderDefaults)
  public
     constructor Create(AReportName : string);
  end;

  { TDueCalvingDefaults }
  TDueCalvingDefaults = class(TActionReminderDefaults)
  private
    function GetRestrictToPeriod: Boolean;
    procedure SetRestrictToPeriod(const Value: Boolean);
  public
     constructor Create(AReportName : string);
     property RestrictToPeriod : Boolean read GetRestrictToPeriod write SetRestrictToPeriod;
  end;

  { TWeighingDefaults }
  TWeighingDefaults = class(TReportDefaults)
  private
    function GetDOBInterval: Integer;
    function GetPurchaseInterval: Integer;
    function GetWeighingInterval: Integer;
    procedure SetDOBInterval(const Value: Integer);
    procedure SetPurchaseInterval(const Value: Integer);
    procedure SetWeighingInterval(const Value: Integer);
    function GetIdentityField: Integer;
    procedure SetIdentityField(const Value: Integer);
  public
     constructor Create(AReportName : string);
     property IdentityField : Integer read GetIdentityField write SetIdentityField;
     property DOBInterval : Integer read GetDOBInterval write SetDOBInterval;
     property WeighingInterval : Integer read GetWeighingInterval write SetWeighingInterval;
     property PurchaseInterval : Integer read GetPurchaseInterval write SetPurchaseInterval;
  end;

  TIndividualCowFert = class(TReportDefaults)
  private
  public
     constructor Create(AReportName : string);
  end;

  TBestCowsInHerdDefaults = class(TReportDefaults)
  private
    function GetCalvingMonth: TIntRange;
    function GetPrintTopTenPerc: Boolean;
    procedure SetCalvingMonth(const Value: TIntRange);
    procedure SetPrintTopTenPerc(const Value: Boolean);
    function GetShowSCCorSolid: Integer;
    procedure SetShowSCCorSolid(const Value: Integer);
  public
     constructor Create(AReportName : string);
     property PrintTopTenPerc : Boolean read GetPrintTopTenPerc write SetPrintTopTenPerc;
     property CalvingMonth : TIntRange read GetCalvingMonth write SetCalvingMonth;
     property ShowSCCorSolid : Integer read GetShowSCCorSolid write SetShowSCCorSolid;
  end;

  THerdBrochureDefaults = class(TReportDefaults)
  private
    function GetIncludeComments: Boolean;
    function GetIncludeCowStatus: Boolean;
    function GetIncludeDDam: Boolean;
    function GetIncludeImages: Boolean;
    function GetIncludeLactations: Boolean;
    function GetIncludeLastService: Boolean;
    function GetIncludeSireDamHBNo: Boolean;
    procedure SetIncludeComments(const Value: Boolean);
    procedure SetIncludeCowStatus(const Value: Boolean);
    procedure SetIncludeDDam(const Value: Boolean);
    procedure SetIncludeImages(const Value: Boolean);
    procedure SetIncludeLactations(const Value: Boolean);
    procedure SetIncludeLastService(const Value: Boolean);
    procedure SetIncludeSireDamHBNo(const Value: Boolean);

  public
     constructor Create(AReportName : String);
     property IncludeImages : Boolean read GetIncludeImages write SetIncludeImages;
     property IncludeDDam : Boolean read GetIncludeDDam write SetIncludeDDam;
     property IncludeSireDamHBNo : Boolean read GetIncludeSireDamHBNo write SetIncludeSireDamHBNo;
     property IncludeComments : Boolean read GetIncludeComments write SetIncludeComments;
     property IncludeCowStatus : Boolean read GetIncludeCowStatus write SetIncludeCowStatus;
     property IncludeLastService : Boolean read GetIncludeLastService write SetIncludeLastService;
     property IncludeLactations : Boolean read GetIncludeLactations write SetIncludeLactations;
  end;

  TCattleMarginsDefaults = class(TPurchaseSalesDefaults)
  private
    function GetBuyer: Integer;
    function GetListBySex: Boolean;
    procedure SetBuyer(const Value: Integer);
    procedure SetListBySex(const Value: Boolean);
    function GetPurchAnimalsOnly: Boolean;
    function GetSoldAnimalsOnly: Boolean;
    procedure SetPurchAnimalsOnly(const Value: Boolean);
    procedure SetSoldAnimalsOnly(const Value: Boolean);
  public
     constructor Create(AReportName : String);
     property Buyer : Integer read GetBuyer write SetBuyer;
     property ListBySex : Boolean read GetListBySex write SetListBySex;
     property SoldAnimalsOnly : Boolean read GetSoldAnimalsOnly write SetSoldAnimalsOnly;
     property PurchAnimalsOnly : Boolean read GetPurchAnimalsOnly write SetPurchAnimalsOnly;
  end;


const
   cRootPath = 'Software\Kingswood\Herd\Reports\%s\Defaults\';
   cRD_StockOnHand = 'Stock On Hand';
   cRD_PurchSales = 'Purchase Sales';
   cRD_SalesAnalysis = 'Sales Analysis';
   cRD_RestrictedAnimals = 'Restricted Animals';
   cRD_VetTreatments = 'Vet Treatments';
   cRD_SCCAnalysis = 'SCC Analysis';
   cRD_HeatsServicesPDs = 'Heats Services PDs';
   cRD_DueService = 'Due Service';
   cRD_DuePregDiag = 'Due Preg Diag';
   cRD_DueDryOff = 'Due Dry Off';
   cRD_DueCalving = 'Due Calving';
   cRD_WeighingReport = 'Weighing Report';
   cRD_IndividualCowFert = 'Individual Cow Fertility';
   cRD_BestCowsInHerd = 'Best Cows InHerd';
   cRD_HerdBrochure = 'Herd Brochure';
   cRD_CattleMargins = 'Cattle Margins';
   cAccessDenied = 'Cannot access registry key';

implementation
uses
   kRoutines;

{ TPDAReportDefaults }

procedure TReportDefaults.Check;
begin
   if Reg = nil then
      RaiseError('Registry not initialized');
end;

constructor TReportDefaults.Create(AReportName : string);
begin
   Reg := TRegistry.Create;
   Reg.RootKey := HKEY_LOCAL_MACHINE;

   FReportName  := AReportName;
   FDataDirName := ExtractDirFromPath(DataPath);
   FRootPath    := Format(cRootPath, [FDataDirName]);

   if not Reg.KeyExists( FRootPath + FReportName ) then
      LoadOnCreate := False;

   if not Reg.OpenKey( FRootPath + FReportName, TRUE ) then
      RaiseError(cAccessDenied);


end;

destructor TReportDefaults.Destroy;
begin
   if ( Reg <> nil ) then
      begin
         Reg.CloseKey;
         Reg.Free;
      end;
   inherited;
end;

procedure TReportDefaults.RaiseError;
begin
   raise ReportDefaultsException.Create(msg);
end;

function TReportDefaults.GetSortOrder: Integer;
begin
   if not Reg.ValueExists('SortOrder') then
      SortOrder := 0;
   Result := Reg.ReadInteger('SortOrder');
end;

function TReportDefaults.GetSortField: Integer;
begin
   if not Reg.ValueExists('SortField') then
      SortField := 0;
   Result := Reg.ReadInteger('SortField');
end;

function TReportDefaults.GetLactRange: TIntRange;
begin
   FillChar(Result, SizeOf(TIntRange), 0);

{   if not LoadOnCreate then
      begin
         Result.IntFrom := 0;
         Result.IntTo := 30;
      end;
}
   if not Reg.ValueExists('LactRange') then
      LactRange := Result;
   Reg.ReadBinaryData('LactRange', Result, SizeOf( TIntRange ));
end;

function TReportDefaults.GetDOBRange: TDateRange;
begin
   FillChar(Result, SizeOf(TDateRange), 0);
   if not Reg.ValueExists('DOBRange') then
      DOBRange := Result;
   Reg.ReadBinaryData('DOBRange', Result, SizeOf( TDateRange ));
end;

function TReportDefaults.GetReportOn: Byte;
begin
   if not Reg.ValueExists('ReportOn') then
      ReportOn := 0;
   Result := Reg.ReadInteger('ReportOn');
end;

function TReportDefaults.GetDateInterval: Integer;
begin
   if not Reg.ValueExists('DateInterval') then
      DateInterval := 0;
   Result := Reg.ReadInteger('DateInterval');
end;

function TReportDefaults.GetIncludeLeftHerd: Boolean;
begin
   if not Reg.ValueExists('IncludeLeftHerd') then
      IncludeLeftHerd := False;
   Result := Reg.ReadBool('IncludeLeftHerd');
end;

function TReportDefaults.GetDichromatic: Boolean;
begin
   if not Reg.ValueExists('Dichromatic') then
      Dichromatic := FALSE;
   Result := Reg.ReadBool('Dichromatic');
end;

function TReportDefaults.GetLactationType: Integer;
begin
   if not Reg.ValueExists('LactationType') then
      LactationType := 0;
   Result := Reg.ReadInteger('LactationType');
end;

function TReportDefaults.GetSex: Integer;
begin
   if not Reg.ValueExists('Sex') then
      Sex := 0;
   Result := Reg.ReadInteger('Sex');
end;

procedure TReportDefaults.SetSex(const Value: Integer);
begin
   if Value > -1 then
      Reg.WriteInteger('Sex', Value);
end;

procedure TReportDefaults.SetSortOrder(const Value: Integer);
begin
   if Value > -1 then
      Reg.WriteInteger('SortOrder', Value);
end;

procedure TReportDefaults.SetSortField(const Value: Integer);
begin
   if Value > -1 then
      Reg.WriteInteger('SortField', Value);
end;

procedure TReportDefaults.SetLactRange(const Value: TIntRange);
var
   tLactRange : TIntRange;
begin
   tLactRange := Value;
   Reg.WriteBinaryData('LactRange', tLactRange, SizeOf( TIntRange ));
end;

procedure TReportDefaults.SetDOBRange(const Value: TDateRange);
var
   DR : TDateRange;
begin
   DR := Value;
   Reg.WriteBinaryData('DOBRange', DR, SizeOf(TDateRange));
end;

procedure TReportDefaults.SetReportOn(const Value: Byte);
begin
   Reg.WriteInteger('ReportOn', Value);
end;

procedure TReportDefaults.SetDateInterval(const Value: Integer);
begin
   if Value > -1 then
      Reg.WriteInteger('DateInterval', Value);
end;

procedure TReportDefaults.SetDichromatic(const Value: Boolean);
begin
   Reg.WriteBool('Dichromatic', Value);
end;

procedure TReportDefaults.SetLactationType(const Value: Integer);
begin
   if ( Value > -1 ) then
      Reg.WriteInteger('LactationType', Value);
end;

{ TStockOnHandDefault }

constructor TStockOnHandDefaults.Create(AReportName : string);
begin
   Inherited Create(AReportName);
end;

function TStockOnHandDefaults.GetDisplayDamField: Byte;
begin
   if not Reg.ValueExists('DisplayDamField') then
      DisplayDamField := 0;
   Result := Reg.ReadInteger('DisplayDamField');
end;

procedure TStockOnHandDefaults.SetDisplayDamField(const Value: Byte);
begin
   Reg.WriteInteger('DisplayDamField', Value);
end;


procedure TReportDefaults.SetIncludeLeftHerd(const Value: Boolean);
begin
   Reg.WriteBool('IncludeLeftHerd', Value);
end;

{ TPurchaseSalesDefault }

constructor TPurchaseSalesDefaults.Create(AReportName: string);
begin
   inherited Create(AReportName);
end;

function TPurchaseSalesDefaults.GetCustomer: Integer;
begin
   if not Reg.ValueExists('Customer') then
      Customer := 0;
   Result := Reg.ReadInteger('Customer');
end;

function TPurchaseSalesDefaults.GetIdentityField: Byte;
begin
   if not Reg.ValueExists('IdentityField') then
      IdentityField := 0;
   Result := Reg.ReadInteger('IdentityField');
end;

function TPurchaseSalesDefaults.GetPurchaseInterval: Integer;
begin
   if not Reg.ValueExists('PurchaseInterval') then
      PurchaseInterval := 0;
   Result := Reg.ReadInteger('PurchaseInterval');
end;

function TPurchaseSalesDefaults.GetSaleInterval: Integer;
begin
   if not Reg.ValueExists('SaleInterval') then
      SaleInterval := 0;
   Result := Reg.ReadInteger('SaleInterval');
end;

function TPurchaseSalesDefaults.GetSupplier: Integer;
begin
   if not Reg.ValueExists('Supplier') then
      Supplier := 0;
   Result := Reg.ReadInteger('Supplier');
end;

procedure TPurchaseSalesDefaults.SetCustomer(const Value: Integer);
begin
   if ( Value > -1 ) then
      Reg.WriteInteger('Customer', Value);
end;

procedure TPurchaseSalesDefaults.SetIdentityField(const Value: Byte);
begin
   Reg.WriteInteger('IdentityField', Value);
end;

procedure TPurchaseSalesDefaults.SetPurchaseInterval(const Value: Integer);
begin
   if ( Value > -1 ) then
      Reg.WriteInteger('PurchaseInterval', Value);
end;

procedure TPurchaseSalesDefaults.SetSaleInterval(const Value: Integer);
begin
   if ( Value > -1 ) then
      Reg.WriteInteger('SaleInterval', Value);
end;

procedure TPurchaseSalesDefaults.SetSupplier(const Value: Integer);
begin
   if ( Value > -1 ) then
      Reg.WriteInteger('Supplier', Value);
end;

{ TSalesEligibilityDefaults }

constructor TSalesEligibilityDefaults.Create(AReportName: string);
begin
   inherited Create(AReportName);
end;

function TSalesEligibilityDefaults.GetDOBInterval: Integer;
begin
   if not Reg.ValueExists('DOBInterval') then
      DOBInterval := 0;
   Result := Reg.ReadInteger('DOBInterval');
end;

function TSalesEligibilityDefaults.GetPurchaseInterval: Integer;
begin
   if not Reg.ValueExists('PurchaseInterval') then
      PurchaseInterval := 0;
   Result := Reg.ReadInteger('PurchaseInterval');
end;

function TSalesEligibilityDefaults.GetRetentionDays: TNoOfRetentionDays;
begin
   Result.Days1 := 30;
   Result.Days2 := 70;
   if not Reg.ValueExists('RetentionDays') then
      RetentionDays := Result;
   Reg.ReadBinaryData('RetentionDays', Result, SizeOf( TNoOfRetentionDays ));
end;

function TSalesEligibilityDefaults.GetThirtyMonthInterval: Integer;
begin
   if not Reg.ValueExists('ThirtyMonthInterval') then
      ThirtyMonthInterval := 0;
   Result := Reg.ReadInteger('ThirtyMonthInterval');
end;

procedure TSalesEligibilityDefaults.SetDOBInterval(const Value: Integer);
begin
   if ( Value > -1 ) then
      Reg.WriteInteger('DOBInterval', Value);
end;

procedure TSalesEligibilityDefaults.SetPurchaseInterval(
  const Value: Integer);
begin
   if ( Value > -1 ) then
      Reg.WriteInteger('PurchaseInterval', Value);
end;

procedure TSalesEligibilityDefaults.SetRetentionDays(
  const Value: TNoOfRetentionDays);
var
   NoOfRetentionDays : TNoOfRetentionDays;
begin
   NoOfRetentionDays := Value;
   Reg.WriteBinaryData('RetentionDays', NoOfRetentionDays, SizeOf( TNoOfRetentionDays ));
end;

procedure TSalesEligibilityDefaults.SetThirtyMonthInterval(
  const Value: Integer);
begin
   if ( Value > -1 ) then
      Reg.WriteInteger('ThirtyMonthInterval', Value);
end;

{ TRestrictedAnimalsDefaults }

constructor TRestrictedAnimalsDefaults.Create(AReportName: string);
begin
   inherited Create(AReportName);
end;

function TRestrictedAnimalsDefaults.GetBruceDateFlt: Boolean;
begin
   if not Reg.ValueExists('BruceDate') then
      BruceDateFlt := TRUE;
   Result := Reg.ReadBool('BruceDate');
end;

function TRestrictedAnimalsDefaults.GetMovementDate: TDateTime;
begin
   if not Reg.ValueExists('MovementDate') then
      MovementDate := Date;
   Result := Reg.ReadDateTime('MovementDate');
end;

function TRestrictedAnimalsDefaults.GetTBTestDateFlt: Boolean;
begin
   if not Reg.ValueExists('TBTestDate') then
      TBTestDateFlt := TRUE;
   Result := Reg.ReadBool('TBTestDate');
end;

function TRestrictedAnimalsDefaults.GetVetWithdrawalFlt: Boolean;
begin
   if not Reg.ValueExists('VetWithdrawal') then
      VetWithdrawalFlt := TRUE;
   Result := Reg.ReadBool('VetWithdrawal');
end;

function TRestrictedAnimalsDefaults.GetWithInRetentionFlt: Boolean;
begin
   if not Reg.ValueExists('WithInRetention') then
      WithInRetentionFlt := TRUE;
   Result := Reg.ReadBool('WithInRetention');
end;

procedure TRestrictedAnimalsDefaults.SetBruceDateFlt(
const Value: Boolean);
begin
   Reg.WriteBool('BruceDate', Value);
end;

procedure TRestrictedAnimalsDefaults.SetMovementDate(
  const Value: TDateTime);
begin
   Reg.WriteDateTime('MovementDate', Value);
end;

procedure TRestrictedAnimalsDefaults.SetTBTestDateFlt(
   const Value: Boolean);
begin
   Reg.WriteBool('TBTestDate', Value);
end;

procedure TRestrictedAnimalsDefaults.SetVetWithdrawalFlt(
  const Value: Boolean);
begin
   Reg.WriteBool('VetWithdrawal', Value);
end;

procedure TRestrictedAnimalsDefaults.SetWithInRetentionFlt(
  const Value: Boolean);
begin
   Reg.WriteBool('WithInRetention', Value);
end;

{ TVetTreatmentsDefaults }

constructor TVetTreatmentsDefaults.Create(AReportName: string);
begin
   Inherited Create(AReportName);
end;

function TVetTreatmentsDefaults.GetIncludeDryAnimals: Boolean;
begin
   if not Reg.ValueExists('IncludeDryAnimals') then
      IncludeDryAnimals := TRUE;
   Result := Reg.ReadBool('IncludeDryAnimals');
end;

procedure TVetTreatmentsDefaults.SetIncludeDryAnimals(
  const Value: Boolean);
begin
   Reg.WriteBool('IncludeDryAnimals', Value);
end;

{ TSCCAnalysisDefaults }

constructor TSCCAnalysisDefaults.Create(AReportName: string);
begin
   Inherited Create(AReportName);
end;

function TSCCAnalysisDefaults.GetCalvingMonthFlt: Boolean;
begin
   if not Reg.ValueExists('CalvingMonthFlt') then
      CalvingMonthFlt := False;
   Result := Reg.ReadBool('CalvingMonthFlt');
end;

function TSCCAnalysisDefaults.GetLactFlt: Boolean;
begin
   if not Reg.ValueExists('LactFlt') then
      LactFlt := False;
   Result := Reg.ReadBool('LactFlt');
end;

function TSCCAnalysisDefaults.GetMonthRange: TIntRange;
begin
   FillChar(Result, SizeOf(TIntRange), 0);
   if not Reg.ValueExists('MonthRange') then
      MonthRange := Result;
   Reg.ReadBinaryData('MonthRange', Result, SizeOf( TIntRange ));
end;

procedure TSCCAnalysisDefaults.SetCalvingMonthFlt(const Value: Boolean);
begin
   Reg.WriteBool('CalvingMonthFlt', Value);
end;

procedure TSCCAnalysisDefaults.SetLactFlt(const Value: Boolean);
begin
   Reg.WriteBool('LactFlt', Value);
end;

procedure TSCCAnalysisDefaults.SetMonthRange(const Value: TIntRange);
var
   tMonthRange : TIntRange;
begin
   tMonthRange := Value;
   Reg.WriteBinaryData('MonthRange', tMonthRange, SizeOf( TIntRange ));
end;

{ THeatsServicesPDs }

constructor THeatsServicesPDs.Create(AReportName: string);
begin
   inherited Create(AReportName);
end;

function THeatsServicesPDs.GetDateRefers: Integer;
begin
   if not Reg.ValueExists('DateRefers') then
      DateRefers := 0;
   Result := Reg.ReadInteger('DateRefers');
end;

function THeatsServicesPDs.GetIncLactation: Integer;
begin
   if not Reg.ValueExists('IncLactation') then
      IncLactation := 0;
   Result := Reg.ReadInteger('IncLactation');
end;

function THeatsServicesPDs.GetShowIrregular: Integer;
begin
   if not Reg.ValueExists('ShowIrregular') then
      ShowIrregular := 0;
   Result := Reg.ReadInteger('ShowIrregular');
end;

procedure THeatsServicesPDs.SetDateRefers(const Value: Integer);
begin
   if Value > -1 then
      Reg.WriteInteger('DateRefers', Value);
end;

procedure THeatsServicesPDs.SetIncLactation(const Value: Integer);
begin
   if Value > -1 then
      Reg.WriteInteger('IncLactation',Value);
end;

procedure THeatsServicesPDs.SetShowIrregular(const Value: Integer);
begin
   if Value > -1 then
      Reg.WriteInteger('ShowIrregular', Value);
end;

{ TActionReminderDefaults }

constructor TActionReminderDefaults.Create(AReportName : string);
begin
   inherited Create(AReportName);
end;

function TActionReminderDefaults.GetBlankEntryForm: Boolean;
begin
   if not Reg.ValueExists('BlankEntryForm') then
      BlankEntryForm := False;
   Result := Reg.ReadBool('BlankEntryForm');
end;

function TActionReminderDefaults.GetDoubleSpacing: Boolean;
begin
   if not Reg.ValueExists('DoubleSpacing') then
      DoubleSpacing := False;
   Result := Reg.ReadBool('DoubleSpacing');
end;

function TActionReminderDefaults.GetIncludeCows: Boolean;
begin
   if not Reg.ValueExists('IncludeCows') then
      IncludeCows := TRUE;
   Result := Reg.ReadBool('IncludeCows');
end;

function TActionReminderDefaults.GetIncludeHeifers: Boolean;
begin
   if not Reg.ValueExists('IncludeHeifers') then
      IncludeHeifers := TRUE;
   Result := Reg.ReadBool('IncludeHeifers');
end;

function TActionReminderDefaults.GetIncludeNotPregnant: Boolean;
begin
   if not Reg.ValueExists('IncludeNotPregnant') then
      IncludeNotPregnant := False;
   Result := Reg.ReadBool('IncludeNotPregnant');
end;

function TActionReminderDefaults.GetNoDays: Integer;
begin
   if not Reg.ValueExists('NoDays') then
      NoDays := 0;
   Result := Reg.ReadInteger('NoDays');
end;

function TActionReminderDefaults.GetSortByDate: Boolean;
begin
   if not Reg.ValueExists('SortByDate') then
      SortByDate := TRUE;
   Result := Reg.ReadBool('SortByDate');
end;

procedure TActionReminderDefaults.SetBlankEntryForm(const Value: Boolean);
begin
   Reg.WriteBool('BlankEntryForm', Value);
end;

procedure TActionReminderDefaults.SetDoubleSpacing(const Value: Boolean);
begin
   Reg.WriteBool('DoubleSpacing', Value);
end;

procedure TActionReminderDefaults.SetIncludeCows(const Value: Boolean);
begin
   Reg.WriteBool('IncludeCows', Value);
end;

procedure TActionReminderDefaults.SetIncludeHeifers(const Value: Boolean);
begin
   Reg.WriteBool('IncludeHeifers', Value);
end;

procedure TActionReminderDefaults.SetIncludeNotPregnant(
  const Value: Boolean);
begin
   Reg.WriteBool('IncludeNotPregnant', Value);
end;

procedure TActionReminderDefaults.SetNoDays(const Value: Integer);
begin
   if Value > -1 then
      Reg.WriteInteger('NoDays', Value);
end;

procedure TActionReminderDefaults.SetSortByDate(const Value: Boolean);
begin
   Reg.WriteBool('SortByDate', Value);
end;

{ TDueServiceDefaults }

constructor TDueServiceDefaults.Create(AReportName: String);
begin
   inherited Create(AReportName);
end;

function TDueServiceDefaults.GetDueRepeatService: Boolean;
begin
   if not Reg.ValueExists('DueRepeatService') then
      DueRepeatService := False;
   Result := Reg.ReadBool('DueRepeatService');
end;

function TDueServiceDefaults.GetDueServeNoHeat: Boolean;
begin
   if not Reg.ValueExists('DueServeNoHeat') then
      DueServeNoHeat := False;
   Result := Reg.ReadBool('DueServeNoHeat');
end;

function TDueServiceDefaults.GetDueServiceWithHeat: Boolean;
begin
   if not Reg.ValueExists('DueServiceWithHeat') then
      DueServiceWithHeat := False;
   Result := Reg.ReadBool('DueServiceWithHeat');
end;

function TDueServiceDefaults.GetDueWithin: Integer;
begin
   if not Reg.ValueExists('DueWithin') then
      DueWithin := 4;
   Result := Reg.ReadInteger('DueWithin');
end;

function TDueServiceDefaults.GetExtendedDetails: Boolean;
begin
   if not Reg.ValueExists('ExtendedDetails') then
      ExtendedDetails := False;
   Result := Reg.ReadBool('ExtendedDetails');
end;

function TDueServiceDefaults.GetIncludeOverDue: Boolean;
begin
   if not Reg.ValueExists('IncludeOverDue') then
      ExcludeOverDue := False;
   Result := Reg.ReadBool('IncludeOverDue');
end;

procedure TDueServiceDefaults.SetDueRepeatService(const Value: Boolean);
begin
   Reg.WriteBool('DueRepeatService', Value);
end;

procedure TDueServiceDefaults.SetDueServeNoHeat(const Value: Boolean);
begin
   Reg.WriteBool('DueServeNoHeat', Value);
end;

procedure TDueServiceDefaults.SetDueServiceWithHeat(const Value: Boolean);
begin
   Reg.WriteBool('DueServiceWithHeat', Value);
end;

procedure TDueServiceDefaults.SetDueWithin(const Value: Integer);
begin
   Reg.WriteInteger('DueWithin', Value);
end;

procedure TDueServiceDefaults.SetExtendedDetails(const Value: Boolean);
begin
   Reg.WriteBool('ExtendedDetails', Value);
end;

procedure TDueServiceDefaults.SetIncludeOverDue(const Value: Boolean);
begin
   Reg.WriteBool('IncludeOverDue', Value);
end;

{ TDuePregDiagDefaults }

constructor TDuePregDiagDefaults.Create(AReportName : string);
begin
   inherited Create(AReportName);
end;

function TDuePregDiagDefaults.GetDaysAfterCalving: Integer;
begin
   if not Reg.ValueExists('DaysAfterCalving') then
      DaysAfterCalving := 0;
   Result := Reg.ReadInteger('DaysAfterCalving');
end;

function TDuePregDiagDefaults.GetIncludeNotServed: Boolean;
begin
   if not Reg.ValueExists('IncludeNotServed') then
      IncludeNotServed := False;
   Result := Reg.ReadBool('IncludeNotServed');
end;

procedure TDuePregDiagDefaults.SetDaysAfterCalving(const Value: Integer);
begin
   if Value > -1 then
      Reg.WriteInteger('DaysAfterCalving', Value);
end;

procedure TDuePregDiagDefaults.SetIncludeNotServed(const Value: Boolean);
begin
   Reg.WriteBool('IncludeNotServed', Value);
end;

{ TDueDryOffDefaults }

constructor TDueDryOffDefaults.Create(AReportName : string);
begin
   inherited Create(AReportName);
end;

{ TDueCalvingDefaults }

constructor TDueCalvingDefaults.Create(AReportName : string);
begin
   inherited Create(AReportName);
end;

function TDueCalvingDefaults.GetRestrictToPeriod: Boolean;
begin
   if not Reg.ValueExists('RestrictToPeriod') then
      RestrictToPeriod := False;
   Result := Reg.ReadBool('RestrictToPeriod');
end;

procedure TDueCalvingDefaults.SetRestrictToPeriod(const Value: Boolean);
begin
   Reg.WriteBool('RestrictToPeriod', Value);
end;

{ TWeighingDefaults }

constructor TWeighingDefaults.Create(AReportName: string);
begin
   inherited Create(AReportName);
end;

function TWeighingDefaults.GetDOBInterval: Integer;
begin
   if not Reg.ValueExists('DOBInterval') then
      DOBInterval := 0;
   Result := Reg.ReadInteger('DOBInterval');
end;

function TWeighingDefaults.GetIdentityField: Integer;
begin
   if not Reg.ValueExists('IdentityField') then
      IdentityField := 0;
   Result := Reg.ReadInteger('IdentityField');
end;

function TWeighingDefaults.GetPurchaseInterval: Integer;
begin
   if not Reg.ValueExists('PurchaseInterval') then
      PurchaseInterval := 0;
   Result := Reg.ReadInteger('PurchaseInterval');
end;

function TWeighingDefaults.GetWeighingInterval: Integer;
begin
   if not Reg.ValueExists('WeighingInterval') then
      WeighingInterval := 0;
   Result := Reg.ReadInteger('WeighingInterval');
end;

procedure TWeighingDefaults.SetDOBInterval(const Value: Integer);
begin
   if ( Value > -1 ) then
      Reg.WriteInteger('DOBInterval', Value);
end;

procedure TWeighingDefaults.SetIdentityField(const Value: Integer);
begin
   if ( Value > -1 ) then
      Reg.WriteInteger('IdentityField', Value);
end;

procedure TWeighingDefaults.SetPurchaseInterval(const Value: Integer);
begin
   if ( Value > -1 ) then
      Reg.WriteInteger('PurchaseInterval', Value);
end;

procedure TWeighingDefaults.SetWeighingInterval(const Value: Integer);
begin
   if ( Value > -1 ) then
      Reg.WriteInteger('WeighingInterval', Value);
end;

{ TIndividualCowFert }

constructor TIndividualCowFert.Create(AReportName: string);
begin
   inherited Create(AReportName);
end;

{ TBestCowsInHerdDefaults }

constructor TBestCowsInHerdDefaults.Create(AReportName: string);
begin
   inherited Create(AReportName);
end;

function TBestCowsInHerdDefaults.GetCalvingMonth: TIntRange;
begin
   FillChar(Result, SizeOf(TIntRange), 0);
   if not Reg.ValueExists('CalvingMonth') then
      CalvingMonth := Result;
   Reg.ReadBinaryData('CalvingMonth', Result, SizeOf( TIntRange ));
end;

function TBestCowsInHerdDefaults.GetPrintTopTenPerc: Boolean;
begin
   if not Reg.ValueExists('PrintTopTenPerc') then
      PrintTopTenPerc := False;
   Result := Reg.ReadBool('PrintTopTenPerc');
end;

function TBestCowsInHerdDefaults.GetShowSCCorSolid: Integer;
begin
   if not Reg.ValueExists('ShowSCCorSolid') then
      ShowSCCorSolid := 0;
   Result := Reg.ReadInteger('ShowSCCorSolid');
end;

procedure TBestCowsInHerdDefaults.SetCalvingMonth(const Value: TIntRange);
var
   tMonthRange : TIntRange;
begin
   tMonthRange := Value;
   Reg.WriteBinaryData('CalvingMonth', tMonthRange, SizeOf( TIntRange ));
end;

procedure TBestCowsInHerdDefaults.SetPrintTopTenPerc(const Value: Boolean);
begin
   Reg.WriteBool('PrintTopTenPerc', Value);
end;

procedure TBestCowsInHerdDefaults.SetShowSCCorSolid(const Value: Integer);
begin
   if Value > -1 then
      Reg.WriteInteger('ShowSCCorSolid', Value);
end;

{ THerdBrochureDefaults }

constructor THerdBrochureDefaults.Create(AReportName: String);
begin
   Inherited Create(AReportName);
end;

function THerdBrochureDefaults.GetIncludeComments: Boolean;
begin
   if not Reg.ValueExists('IncludeComments') then
      IncludeComments := False;
   Result := Reg.ReadBool('IncludeComments');
end;

function THerdBrochureDefaults.GetIncludeCowStatus: Boolean;
begin
   if not Reg.ValueExists('IncludeCowStatus') then
      IncludeCowStatus := False;
   Result := Reg.ReadBool('IncludeCowStatus');
end;

function THerdBrochureDefaults.GetIncludeDDam: Boolean;
begin
   if not Reg.ValueExists('IncludeDDam') then
      IncludeDDam := False;
   Result := Reg.ReadBool('IncludeDDam');
end;

function THerdBrochureDefaults.GetIncludeImages: Boolean;
begin
   if not Reg.ValueExists('IncludeImages') then
      IncludeImages := False;
   Result := Reg.ReadBool('IncludeImages');
end;

function THerdBrochureDefaults.GetIncludeLactations: Boolean;
begin
   if not Reg.ValueExists('IncludeLactations') then
      IncludeLactations := False;
   Result := Reg.ReadBool('IncludeLactations');
end;

function THerdBrochureDefaults.GetIncludeLastService: Boolean;
begin
   if not Reg.ValueExists('IncludeLastService') then
      IncludeLastService := False;
   Result := Reg.ReadBool('IncludeLastService');
end;

function THerdBrochureDefaults.GetIncludeSireDamHBNo: Boolean;
begin
   if not Reg.ValueExists('IncludeSireDamHBNo') then
      IncludeSireDamHBNo := False;
   Result := Reg.ReadBool('IncludeSireDamHBNo');
end;

procedure THerdBrochureDefaults.SetIncludeComments(const Value: Boolean);
begin
   Reg.WriteBool('IncludeComments', Value);
end;

procedure THerdBrochureDefaults.SetIncludeCowStatus(const Value: Boolean);
begin
   Reg.WriteBool('IncludeCowStatus', Value);
end;

procedure THerdBrochureDefaults.SetIncludeDDam(const Value: Boolean);
begin
   Reg.WriteBool('IncludeDDam', Value);
end;

procedure THerdBrochureDefaults.SetIncludeImages(const Value: Boolean);
begin
   Reg.WriteBool('IncludeImages', Value);
end;

procedure THerdBrochureDefaults.SetIncludeLactations(const Value: Boolean);
begin
   Reg.WriteBool('IncludeLactations', Value);
end;

procedure THerdBrochureDefaults.SetIncludeLastService(const Value: Boolean);
begin
   Reg.WriteBool('IncludeLastService', Value);
end;

procedure THerdBrochureDefaults.SetIncludeSireDamHBNo(const Value: Boolean);
begin
   Reg.WriteBool('IncludeSireDamHBNo', Value);
end;

{ TCattleMargins }

constructor TCattleMarginsDefaults.Create(AReportName: String);
begin
   Inherited Create(AReportName);
end;

function TCattleMarginsDefaults.GetBuyer: Integer;
begin
   if not Reg.ValueExists('Buyer') then
      Buyer := 0;
   Result := Reg.ReadInteger('Buyer');
end;

function TCattleMarginsDefaults.GetListBySex: Boolean;
begin
   if not Reg.ValueExists('ListBySex') then
      ListBySex := False;
   Result := Reg.ReadBool('ListBySex');
end;

function TCattleMarginsDefaults.GetPurchAnimalsOnly: Boolean;
begin
   if not Reg.ValueExists('PurchAnimalsOnly') then
      PurchAnimalsOnly := False;
   Result := Reg.ReadBool('PurchAnimalsOnly');
end;

function TCattleMarginsDefaults.GetSoldAnimalsOnly: Boolean;
begin
   if not Reg.ValueExists('SoldAnimalsOnly') then
      SoldAnimalsOnly := False;
   Result := Reg.ReadBool('SoldAnimalsOnly');
end;

procedure TCattleMarginsDefaults.SetBuyer(const Value: Integer);
begin
   if Value > -1 then
      Reg.WriteInteger('Buyer', Value);
end;

procedure TCattleMarginsDefaults.SetListBySex(const Value: Boolean);
begin
   Reg.WriteBool('ListBySex', Value);
end;

procedure TCattleMarginsDefaults.SetPurchAnimalsOnly(const Value: Boolean);
begin
   Reg.WriteBool('PurchAnimalsOnly', Value);
end;

procedure TCattleMarginsDefaults.SetSoldAnimalsOnly(const Value: Boolean);
begin
   Reg.WriteBool('SoldAnimalsOnly', Value);
end;



end.
