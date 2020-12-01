unit DairyData;


{***************** N.B.
If a new Table or Index is added you must specify the Index details in the uIndexes
ReIndexAll procedure (this is to allow a complete reBuild of all Indexes).
Also if you add a New Index using the CheckFiles
 procedure you must also add this
to uIndexes ReIndexAll
*****************
  This is the Dairy Program DataSource.
  All Updates to Paradox tables are carried out here.
  Events are controlled by the Event Types ( Const ).


}
  { SP ******* 19/03/2003 ******* SP }
  {                                  }
  {   All table updates to be        }
  {   done in uUpdateTables.pas      }
  {                                  }
  { SP ******* 19/03/2003 ******* SP }


{
  JT Nut Management

  function MakeAnimalWasteProd: Boolean;

 ------------------------------------------------------------------------------

 SP 16/09/02 :-

 New : Function GetAccsCompany(const HerdID : Byte) : String;
       Returns the Accounts Company associated for the
       HerdID parameter. If HerdID = 0, HerdID = None HerdID,
       or HerdID cannot be found then "Accs" is the returned value.

 Modified : Procedure AccessAccounts(wParam : String);
            Vars:-

            ProgramToStart : String; Removed
            WinAccsPath constant in GenTypesConst

            AccsInstalled : Boolean; Removed
            FileExits returns boolean value

            AccsCompany : String; Removed
            GetAccsCompany returns Company.

 SP 16/09/02 :-

 ------------------------------------------------------------------------------

 SP 16/09/02 :-

 Check to make sure "gobbly gook" does not over write an existing valid Irish Tag.
 For now assume new value is "gobbly gook" if NatID type = StyleUnknown!

 New Private variable : BeforeEditNatIDType :
                        TNatIDStyle :- Assigned value when
                        AnimalFileByIDBeforeEdit is triggered.
                        AfterEditNatIDType :- TNatIDStyle :- Assigned value when
                        AnimalFileByIDNatIDNumSetText is triggered.

 New check located in AnimalFileByIDBeforePost;
 if BeforeEditNatIDType <> StyleUnknown and AfterEditNatIDType = StyleUnknown then
 raise error msg.

 SP 16/09/02.

 ** Modified 19/09/2002.

 ------------------------------------------------------------------------------

 SP 16/09/02 :-

 Check to make sure "gobbly gook" does not over write an existing valid Irish Tag.
 For now assume new value is "gobbly gook" if NatID type = StyleUnknown!

 New Private variable : BeforeEditNatIDType : TNatIDStyle:-
                        Assigned value when AnimalFileByIDBeforeEdit is triggered.
                        AfterEditNatIDType : TNatIDStyle:-
                        Assigned value when AnimalFileByIDNatIDNumSetText is triggered.

 New check located in AnimalFileByIDBeforePost;
 if BeforeEditNatIDType <> StyleUnknown and AfterEditNatIDType = StyleUnknown then
 raise error msg.

 Modified 19/09/2002.

 SP 16/09/02.
 ______________________________________________________________________________

 SP 26/09/2002:-

 Make sure NatIDNum has changed before NatID Check.
 Procedure AnimalFileByIDBeforePost;
 New Line = if AnimalFileByIDNatIDNum.OldValue <> AnimalFileByIDNatIDNum.NewValue then

 V3.5 R9.1
 SP 26/09/2002.

 ------------------------------------------------------------------------------

 SP 27/09/02:-

 Function : CheckFiles;
          New Field "PhoneLink" Boolean added to defaults table.
 This will used to determine if the user wants to check for SMS Messages on
 startup of the program.

 SP 27/09/02.

 ------------------------------------------------------------------------------
 SP 09/10/2002:-

 qDrugBatchNo
 dsDrugBatchNo

 Taken from uHealth and put in DairyData Module.

 SP 09/10/2002.

 ------------------------------------------------------------------------------

 SP 29/10/2002:-

 CheckFiles

 New Field Added to PurchGrpData.db
 "Matched" Boolean Field.

 Used to indicate whether the animal tag number was matched from the crush weight file and user input.

 SP 29/10/2002.

 ------------------------------------------------------------------------------

 SP 30/10/2002:-

 CheckFiles
 New Field Added to MediPur.db
 ExpiryDate TDateTime Field.


 This Expiry Date is connected to a particular Medicine Batch No.

 User inputs Drug Expiry Date in Medicine Purchase Screen.

 Warnings are given if the drug used is within one month of the expiry date.

 Expiry date displayed in the Drug Treatments / Medicine Purchases Reports.

 MediPurch on new Record set ExpiryDate as today.

 SP 30/10/2002.

 ------------------------------------------------------------------------------

 SP 06/11/2002:-

 CheckFiles
 New Field Added to Breeds.db
 Selected TDateTime Field.

 Used in filter screen. Filter by Breeds. User selects breed from grid.

 SP 06/11/2002.

 ------------------------------------------------------------------------------

 SP 15/11/2002:-

 CheckFiles

 New Field LastUpdate TDateTime  Defaults.db
 New Field PhoneLinkType Integer Defaults.db

 SP 15/11/2002.

 ------------------------------------------------------------------------------

 SP 09/12/2002:-

 function UpdateBreedsCase : Boolean;

 loop thru breed table, change to case of name to lower.

 SP 09/12/2002:-

 ------------------------------------------------------------------------------

 SP 13/01/2003:-

 New :-

    property SlghtTopupAmount : Double read GetSlghtTopupAmount write SetSlghtTopupAmount;
    property SlghtAmount : Double read GetSlghtAmount write SetSlghtAmount;
    property SuckAmount : Double read GetSuckAmount write SetSuckAmount;
    property SuckTopupAmount : Double read GetSuckTopupAmount write SetSuckTopupAmount;
    property BullAmount : Double read GetBullAmount write SetBullAmount;
    property FirstAmount : Double read GetFirstAmount write SetFirstAmount;
    property SecondAmount : Double read GetSecondAmount write SetSecondAmount;
    property PremiumYear : Integer read FPremiumYear write SetPremiumYear;

    function GetCurrentYear : Integer;

 ------------------------------------------------------------------------------

   SP 28/01/2003:-

   Customers OnNewRecord - Set CMMSForms to false.

   SP 28/01/2003.

 ------------------------------------------------------------------------------

 SP 10/02/2003:-

 Create Death events for all dead calves. v3.6 r4.0

 SP 10/02/2003.

 ------------------------------------------------------------------------------

 SP 18/03/2003:-

 AnimalFileByIDBeforePost

 Check for animal colour, if animal is registered in NIreland
 If doesn't exist raise error msg

 SP 18/03/2003

 ------------------------------------------------------------------------------

 08/01/2009 V3.9 R5.6 /SP Additional Feature : AnimalFileByID.OnNewRecord - Default Animal to Pedigree if pedigree module present
                                           : EventsAfterPost - Default Calf to Pedigree if Pedigree module present

 29/01/2009 [V3.9 R5.8] /SP Additional Feature - Notify HUK of animals moved onto farm, using grid and cart
                                               procedure NotifiyMovementsToHUK(AnimalData: array of Integer);

 09/02/2009 [Dev 3.9 R6.0] /SP Bug Fix - Only update medicine stock after event has been posted. (Check Events after post method)
                                         previously this was done on Health after post, which wasnt working correctly.

 09/02/2009 [Dev 3.9 R6.7] /SP Program Change - Default new groups to "Batch" GroupType.

 18/11/09 [V4.0 R0.4] /MK Additional Feature - Livestock Values - New Fields for Pedigree Values

 03/06/10 [V4.0 R3.6] /MK Additional Feature - CanShowStandardReportHint Boolean for new report hints.

 01/07/10 [V4.0 R3.9] /MK Additional Feature - New Field In SetupAnimals called UKAISireCode.

 09/07/10 [V4.0 R4.0] /MK Additional Feature - New Function StripAllAlphaButNum to strip all chars but numbers
                                             - Used in Electronic Weighing File Name.

 16/07/10 [V4.0 R4.0] /MK Additional Feature - Allowed Dead Calves not to be registered where National ID is not Irish Tag ID.

 17/08/10 [V4.0 R4.4] /MK Bug Fix - TempCalvingAfterScroll does not check for country as DefaultNatIDMaskFromHerdIdentifierMask has now been
                                    changed to allow for Ireland and NIreland. If <> Ireland and NIreland then DefaultNatIDMask.

 08/09/10 [V4.0 R4.7] /MK Change - TempCalvingAfterScroll now checks for DeadCalfNatID Variable.

 08/09/10 [V4.0 R4.7] /MK Change - Moved Creation of AutoGenTag From TempCalvingNewRecord To TempCalvingCalfDeadChange. Program already
                                   Run's Into TempCalvingCalfDeadChange On FormCreate.

 10/09/10 [V4.0 R4.7] /MK Change - Moved NatIDGenerated To Public Variable. Check This To See If Tag Was Generated On TempCalvingCalfDeadChange.
                                 - New Variable RollBackTag. Check This See if There has been a RollBack for Irish Tags.

 }

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, stdctrls, GenTypesConst, HHPack, ImgList, Registry,
  DynaZip, DynaLibU, FileCtrl, KRoutines, uCallToExternalProgram,
  Menus, uKParser, RxLogin, EventDefaults, RestorePoint, PDALink,
  QuickRpt, Groups, CaprineTag, cxEdit, cxDBEditRepository, dxmdaset,
  DateUtil, cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView, cxGrid,
  uHerdOwner, cxContainer, cxStyles, uNationalID, LMDWebBase, LMDMapi,
  uEventDataHelper, uBreedingDataHelper, uEventDataTransfer, Printers,
  uKillOutCalculator, cxHint;

type

//  TSupplierBreederAttribute = (saAnimalSupplier, saMedicineSupplier, saFeedSupplier);
//  TSupplierBreederAttributes = set of TSupplierBreederAttribute;
  TCustomerAttribute = (caSlaughterEligibility, caCMMSRegistered, caMeatFactory);
  TCustomerAttributes = set of TCustomerAttribute;
  TEventStatus = (EAdding,EAddingAtSetUp,EAmending,NotNone);
//  TNatIdStyle =  (Style1999,Style1996,StylePre1996,StyleUnKnown);
  MPECategory = String[4];
  TWinData = class(TDataModule)
    KingData: TDatabase;
    OwnerFile: TTable;
    OwnerSource: TDataSource;
    Events: TTable;
    EventSource: TDataSource;
    Weighings: TTable;
    WeighSource: TDataSource;
    WeighingsWeight: TFloatField;
    IDFile: TTable;
    WeightID: TIntegerField;
    UniqueID: TIntegerField;
    Groups: TTable;
    dsGroups: TDataSource;
    dsGroupLinks: TDataSource;
    QDams: TDataSource;
    Breeds: TTable;
    BreedsSource: TDataSource;
    SireQuery: TQuery;
    QSire: TDataSource;
    LookUpDamSire: TTable;
    DamQuery: TQuery;
    OtherIDs: TTable;
    Bullings: TTable;
    dsBullings: TDataSource;
    GenLookUp: TTable;
    sGenLookUp: TDataSource;
    MilkCumulative: TTable;
    dsMilkDisk: TDataSource;
    Sires: TTable;
    dsSires: TDataSource;
    tBullExt: TTable;
    dsBullExt: TDataSource;
    qBovine: TQuery;
    qBull: TQuery;
    tBullSemen: TTable;
    dsBullSemen: TDataSource;
    Services: TTable;
    dsService: TDataSource;
    PregDiag: TTable;
    dsPregDiag: TDataSource;
    Health: TTable;
    dsHealth: TDataSource;
    Calvings: TTable;
    dsCalvings: TDataSource;
    TempTable: TTable;
    Medicine: TTable;
    dsMedicine: TDataSource;
    MediPurch: TTable;
    dsMediPurch: TDataSource;
    Units: TTable;
    dsUnits: TDataSource;
    MediAdmin: TTable;
    dsMediAdmin: TDataSource;
    dsApplicMethod: TDataSource;
    dsBirthType: TDataSource;
    qApplicMethod: TQuery;
    qBirthType: TQuery;
    dsServiceType: TDataSource;
    qServiceType: TQuery;
    dsObservedBy: TDataSource;
    qObservedBy: TQuery;
    TempCalving: TTable;
    CheckHealth: TTable;
    MediPurchPurchDate: TDateField;
    MediPurchQuantity: TFloatField;
    MediPurchCostUnit: TFloatField;
    MediPurchSuppID: TIntegerField;
    MediPurchID: TAutoIncField;
    MediPurchDrugID: TIntegerField;
    MediPurchUnitUsed: TFloatField;
    Suppliers: TTable;
    dsSuppliers: TDataSource;
    BreedsID: TAutoIncField;
    BreedsCode: TStringField;
    BreedsName: TStringField;
    BreedsGestationPeriod: TSmallintField;
    BreedsEligibleforPremium: TBooleanField;
    ServicesEventID : TIntegerField;
    ServicesServiceType: TIntegerField;
    ServicesServiceBull: TIntegerField;
    ServicesServedBy: TIntegerField;
    ServicesTreatments: TIntegerField;
    ServicesAmountOfStraw: TFloatField;
    CheckEvents: TTable;
    LookUpServices: TTable;
    LookUpPDs: TTable;
    LookUpBullings: TTable;
    dsHerdType: TDataSource;
    qHerdType: TQuery;
    HealthDrugUsed: TIntegerField;
    HealthRateApplic: TFloatField;
    HealthDrugCost: TFloatField;
    HealthApplicMethod: TIntegerField;
    HealthAdminBy: TIntegerField;
    HealthDoseUnitUsed: TFloatField;
    HealthPurchUnitUsed: TFloatField;
    HealthPurchUnitCost: TFloatField;
    HealthEventID: TIntegerField;
    BullingsEventID: TIntegerField;
    BullingsPlannedBull: TIntegerField;
    BullingsHeatType: TIntegerField;
    BullingsObservedBy: TIntegerField;
    HealthHealthCode: TIntegerField;
    BeefSubsidy: TTable;
    dsBeefSubsidy: TDataSource;
    PremiumType: TTable;
    dsPremiumType: TDataSource;
    BeefSubsidyAnimalID: TIntegerField;
    BeefSubsidyPremiumType: TStringField;
    BeefSubsidyEventID: TIntegerField;
    BeefSubsidyApplicationDate: TDateField;
    BeefSubsidyEligibilityDate: TDateField;
    PremiumTypeType: TStringField;
    PremiumTypeDescription: TStringField;
    PremiumTypeTimeFromDOBMonths: TSmallintField;
    PremiumTypeRetensionDays: TSmallintField;
    PremiumTypeTimeOutMonths: TSmallintField;
    qAnimalColours: TQuery;
    dsAnimalColours: TDataSource;
    BeefSubsidyRetensionDate: TDateField;
    BeefSubsidyApplicationID: TIntegerField;
    SaleDeath: TTable;
    dsSaleDeath: TDataSource;
    Customers: TTable;
    dsCustomers: TDataSource;
    Purchases: TTable;
    dsPurchases: TDataSource;
    Applications: TTable;
    dsApplications: TDataSource;
    Defaults: TTable;
    MainMilkTrans: TTable;
    dsMainMilkTrans: TDataSource;
    MilkDiskTrans: TTable;
    dsMilkDiskTrans: TDataSource;
    MilkDiskLayout: TTable;
    dsMilkDiskLayout: TDataSource;
    MilkCumulativeMilkDiskID: TAutoIncField;
    MilkCumulativeAnimalID: TIntegerField;
    MilkCumulativeLactNo: TSmallintField;
    MilkCumulativeDailyYield: TFloatField;
    MilkCumulativeDailyBfatPerc: TFloatField;
    MilkCumulativeDailyProtPerc: TFloatField;
    MilkCumulativeDailyLactosePerc: TFloatField;
    MilkCumulativeSCC: TSmallintField;
    MilkCumulativeCumYield: TFloatField;
    MilkCumulativeCumBfatPerc: TFloatField;
    MilkCumulativeCumProtPerc: TFloatField;
    MilkCumulativeCumLactosePerc: TFloatField;
    MilkCumulativeNoOfRecordings: TSmallintField;
    MilkCumulativeDaysInMilk: TSmallintField;
    MilkCumulativeYield305: TFloatField;
    MilkCumulativeBfatPerc305: TFloatField;
    MilkCumulativeProtPerc305: TFloatField;
    MilkCumulativeLactosePerc305: TFloatField;
    MilkDiskTransID: TAutoIncField;
    MilkDiskTransMDTID: TIntegerField;
    MilkDiskTransAnimalID: TIntegerField;
    MilkDiskTransAnimalCode: TStringField;
    MilkDiskTransLactNo: TSmallintField;
    MilkDiskTransHerdNumber: TStringField;
    MilkDiskTransDateofRecording: TDateField;
    MilkDiskTransDailyYield: TFloatField;
    MilkDiskTransDailyBfatPerc: TFloatField;
    MilkDiskTransDailyProtPerc: TFloatField;
    MilkDiskTransDailyLactPerc: TFloatField;
    MilkDiskTransSCC: TSmallintField;
    MilkDiskTransCumYield: TFloatField;
    MilkDiskTransCumBfatPerc: TFloatField;
    MilkDiskTransCumProtPerc: TFloatField;
    MilkDiskTransCumLactPerc: TFloatField;
    MilkDiskTransNoOfRecordings: TSmallintField;
    MilkDiskTransDaysInMilk: TSmallintField;
    MilkDiskTransEventType: TIntegerField;
    MilkDiskTransEventDate: TDateField;
    MilkDiskTransYield305: TFloatField;
    MilkDiskTransBfat305Perc: TFloatField;
    MilkDiskTransProt305Perc: TFloatField;
    MilkDiskTransLact305Perc: TFloatField;
    MilkDiskTransNMRRecording: TBooleanField;
    qHerdDefaults: TQuery;
    dsHerdDefaults: TDataSource;
    PurchasesEventID: TIntegerField;
    PurchasesSupplier: TIntegerField;
    PurchasesPrice: TFloatField;
    PurchasesWeight: TFloatField;
    PurchasesGrade: TStringField;
    dsCountries: TDataSource;
    qCountries: TQuery;
    qFemales: TQuery;
    dsFemales: TDataSource;
    LookUpPurchases: TTable;
    LookUpMilkDisk: TTable;
    AutoIncField1: TAutoIncField;
    IntegerField3: TIntegerField;
    SmallintField1: TSmallintField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    SmallintField2: TSmallintField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    SmallintField3: TSmallintField;
    SmallintField4: TSmallintField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    LookUpSaleDeath: TTable;
    PurchasesBuyer: TIntegerField;
    OwnerFileID: TAutoIncField;
    OwnerFileHerdIdentity: TStringField;
    OwnerFileMilkRecordingID: TStringField;
    OwnerFileDateLastAccessed: TDateField;
    OwnerFileTypeOfHerd: TIntegerField;
    OwnerFileAutumnCalving: TBooleanField;
    OwnerFileName: TStringField;
    OwnerFileAddress1: TStringField;
    OwnerFileAddress2: TStringField;
    OwnerFileAddress3: TStringField;
    OwnerFileAddress4: TStringField;
    OwnerFilePlaceForInspection1: TStringField;
    OwnerFilePlaceForInspection2: TStringField;
    OwnerFileTownLand1: TStringField;
    OwnerFileTownLand2: TStringField;
    OwnerFileDED1: TStringField;
    OwnerFileDED2: TStringField;
    OwnerFileOwnedORCommage1: TStringField;
    OwnerFileOwnedORCommage2: TStringField;
    OwnerFilePhone: TStringField;
    OwnerFileFax: TStringField;
    OwnerFileEmail: TStringField;
    OwnerFileUserCanDelete: TBooleanField;
    OwnerFileUseHealth: TBooleanField;
    OwnerFileUseGrassLand: TBooleanField;
    OwnerFileUseMilkRec: TBooleanField;
    OwnerFileUseWeighing: TBooleanField;
    OwnerFileUsePremium: TBooleanField;
    OwnerFileHerdPreFix: TStringField;
    OwnerFileCountry: TIntegerField;
    OwnerFileRestricted: TBooleanField;
    OwnerFileDeductions: TFloatField;
    OwnerFileHerdIdentifier: TStringField;
    SaleDeathEventID: TIntegerField;
    SaleDeathSold: TBooleanField;
    SaleDeathCustomer: TIntegerField;
    SaleDeathPrice: TFloatField;
    SaleDeathWeight: TFloatField;
    SaleDeathGrade: TStringField;
    SaleDeathNotified: TBooleanField;
    SaleDeathColdDeadWt: TFloatField;
    SaleDeathKillOut: TFloatField;
    Buyers: TTable;
    dsBuyers: TDataSource;
    tRemarks: TTable;
    dsRemarks: TDataSource;
    tSysUser: TTable;
    dsSysUsers: TDataSource;
    tSysUserName: TStringField;
    tSysUserID: TAutoIncField;
    OwnerFileHFSPin: TStringField;
    BuyersID: TAutoIncField;
    BuyersName: TStringField;
    BuyersAddress1: TStringField;
    BuyersAddress2: TStringField;
    BuyersAddress3: TStringField;
    BuyersAddress4: TStringField;
    BuyersAddress5: TStringField;
    BuyersPhone: TStringField;
    BuyersFax: TStringField;
    BuyersEmail: TStringField;
    BuyersCommission: TFloatField;
    SuppliersID: TAutoIncField;
    SuppliersName: TStringField;
    SuppliersAddress1: TStringField;
    SuppliersAddress2: TStringField;
    SuppliersAddress3: TStringField;
    SuppliersAddress4: TStringField;
    SuppliersAddress5: TStringField;
    SuppliersPhone: TStringField;
    SuppliersFax: TStringField;
    SuppliersEmail: TStringField;
    SuppliersCommission: TFloatField;
    SuppliersTransport: TFloatField;
    tMovedTo: TTable;
    tMovements: TTable;
    luMovements: TTable;
    PurchasesSupplierCosts: TFloatField;
    PurchasesBuyerCosts: TFloatField;
    CustomersName: TStringField;
    CustomersAddress1: TStringField;
    CustomersAddress2: TStringField;
    CustomersAddress3: TStringField;
    CustomersAddress4: TStringField;
    CustomersAddress5: TStringField;
    CustomersPhone: TStringField;
    CustomersFax: TStringField;
    CustomersEmail: TStringField;
    CustomersLicensed: TBooleanField;
    CustomersID: TAutoIncField;
    SaleDeathPreSale: TBooleanField;
    tSApplic: TTable;
    tSAppliedFor: TTable;
    tIntHerd: TTable;
    dsInterHerd: TDataSource;
    tIntHerdAnimalID: TIntegerField;
    tIntHerdLastHerdID: TIntegerField;
    tIntHerdNewHerdID: TIntegerField;
    tIntHerdDateMoved: TDateField;
    tIntHerdRemark: TStringField;
    OwnerFileLastSeqNo: TIntegerField;
    tIntHerdOldSeqNo: TIntegerField;
    tIntHerdNewSeqNo: TIntegerField;
    tSlghtAppliedFor: TTable;
    tSlghtAppliedForID: TAutoIncField;
    tSlghtAppliedForApplicationID: TIntegerField;
    tSlghtAppliedForAnimalID: TIntegerField;
    tSlghtApplic: TTable;
    tSlghtApplicDateOfApplic: TDateField;
    tSlghtApplicYearOfApplic: TIntegerField;
    tSlghtApplicHerdID: TIntegerField;
    tSlghtApplicDescription: TStringField;
    SaleDeathKillNumber: TStringField;
    AnimalFileByID: TQuery;
    UpdateAnimals: TUpdateSQL;
    GroupLinks: TTable;
    GenQuery: TQuery;
    EventID: TIntegerField;
    EventsAnimalID: TIntegerField;
    EventsAnimalLactNo: TSmallintField;
    EventsEventDate: TDateField;
    EventsEventDesc: TStringField;
    EventsEventType: TSmallintField;
    EventsCondScore: TFloatField;
    EventsNextEventDate: TDateField;
    EventsNextEventComment: TStringField;
    EventsHerdID: TIntegerField;
    PrintDialog1: TPrintDialog;
    OwnerFileSearchField: TStringField;
    GroupsID: TAutoIncField;
    GroupsGroupType: TStringField;
    GroupsCode: TStringField;
    GroupsDescription: TStringField;
    GroupsSelected: TBooleanField;
    TempCalvingID: TAutoIncField;
    TempCalvingCalfNo: TStringField;
    TempCalvingNatID: TStringField;
    TempCalvingName: TStringField;
    TempCalvingSex: TStringField;
    TempCalvingBreed: TIntegerField;
    TempCalvingHerdID: TIntegerField;
    TempCalvingColour: TIntegerField;
    TempCalvingDOB: TDateField;
    LookUpTempCalving: TTable;
    AutoIncField2: TAutoIncField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField4: TIntegerField;
    DateField1: TDateField;
    EventsDisplayInfo: TStringField;
    FilteredAnimals: TTable;
    OwnerFileVATRegistered: TBooleanField;
    OwnerFilePurchWeighing: TBooleanField;
    OwnerFilePremiums: TBooleanField;
    OwnerFilePurchGrpAutoGridUpdates: TBooleanField;
    SuppliersAnimalSupplier: TBooleanField;
    SuppliersMedicineSupplier: TBooleanField;
    SuppliersFeedSupplier: TBooleanField;
    MedicineID: TAutoIncField;
    MedicineDrugCode: TStringField;
    MedicineName: TStringField;
    MedicineWithdrawal: TFloatField;
    MedicineDoseUnit: TIntegerField;
    MedicinePurchUnit: TIntegerField;
    MedicineQuantityInStock: TFloatField;
    MedicineCostPurchUnit: TFloatField;
    CustomersEditStatus: TStringField;
    SuppliersEditStatus: TStringField;
    BreedsEditStatus: TStringField;
    UnitsID: TAutoIncField;
    UnitsUnitCode: TStringField;
    UnitsName: TStringField;
    UnitsMultiplier: TFloatField;
    GenLookUpID: TAutoIncField;
    GenLookUpListType: TIntegerField;
    GenLookUpDescription: TStringField;
    GenLookUpUserCanDelete: TBooleanField;
    GenLookUpLookUpCode: TStringField;
    MediAdminID: TAutoIncField;
    MediAdminAdminCode: TStringField;
    MediAdminName: TStringField;
    MediAdminPosition: TStringField;
    LookUpMedicine: TTable;
    AutoIncField3: TAutoIncField;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField1: TFloatField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    FloatField2: TFloatField;
    FloatField15: TFloatField;
    TempCalvingBirthWeight: TFloatField;
    EventsICBFNotified: TBooleanField;
    SaleDeathCulled: TIntegerField;
    qCulling: TQuery;
    dsCulling: TDataSource;
    qMortality: TQuery;
    dsMortality: TDataSource;
    TempCalvingDeadCalves: TIntegerField;
    TempCalvingMortality: TIntegerField;
    CustomersDeductions: TFloatField;
    CustomersTransport: TFloatField;
    PurchasesMeasuredWeight: TFloatField;
    PurchasesMeasuredWtDate: TDateField;
    SaleDeathCustomerCosts: TFloatField;
    SaleDeathFeedEndDate: TDateField;
    SaleDeathWeighingDate: TDateField;
    OwnerFileFixedCosts: TFloatField;
    tCalvingAnimal: TTable;
    LookUpTempCalvingBirthWeight: TFloatField;
    LookUpTempCalvingDeadCalves: TIntegerField;
    LookUpTempCalvingMortality: TIntegerField;
    Manufacturers: TTable;
    AutoIncField4: TAutoIncField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    dsManufacturers: TDataSource;
    FeedTypes: TTable;
    dsFeedTypes: TDataSource;
    FdStkEvents: TTable;
    dsFdStkEvents: TDataSource;
    FeedRegime: TTable;
    dsFeedRegime: TDataSource;
    FeedEvents: TTable;
    dsFeedEvents: TDataSource;
    MediPurchBatchNo: TStringField;
    qFeedCat: TQuery;
    dsFeedCat: TDataSource;
    FeedRegimeID: TAutoIncField;
    FeedRegimeGroupID: TIntegerField;
    FeedRegimeFeedType: TIntegerField;
    FeedRegimeAllocDate: TDateField;
    FeedRegimeQuantDay: TFloatField;
    FeedRegimeCostDay: TFloatField;
    FeedEventsID: TAutoIncField;
    FeedEventsAnimalID: TIntegerField;
    FeedEventsFeedType: TIntegerField;
    FeedEventsAllocDate: TDateField;
    FeedEventsQuantDay: TFloatField;
    FeedEventsCostDay: TFloatField;
    FeedEventsFeedStock: TIntegerField;
    FeedEventsEndDate: TDateField;
    FeedEventsTotalCost: TFloatField;
    FdStkEventsID: TAutoIncField;
    FdStkEventsFeedType: TIntegerField;
    FdStkEventsSupplier: TIntegerField;
    FdStkEventsManufacturer: TIntegerField;
    FdStkEventsBatchNumber: TStringField;
    FdStkEventsEventDate: TDateField;
    FdStkEventsQuantity: TFloatField;
    FdStkEventsUnitCost: TFloatField;
    FdStkEventsOtherCosts: TFloatField;
    FdStkEventsFeedStock: TIntegerField;
    FdStkEventsIncDec: TBooleanField;
    FdStkEventsTotFeedPrice: TFloatField;
    FeedTypesID: TAutoIncField;
    FeedTypesName: TStringField;
    FeedTypesDescription: TStringField;
    FeedTypesCategory: TIntegerField;
    FeedTypesPurchUnit: TIntegerField;
    FeedTypesFeedUnit: TIntegerField;
    FeedTypesUnitCost: TFloatField;
    FeedTypesStock: TFloatField;
    FeedTypesLastFeedCalcDt: TDateField;
    FeedTypesCostTypeChangeDt: TDateField;
    FeedTypesInitStockDt: TDateField;
    FeedTypesStartDt: TDateField;
    FeedTypesEndDt: TDateField;
    FeedTypesLIFO: TBooleanField;
    FeedTypesDefCostTon: TFloatField;
    FeedTypesDefQuantDay: TFloatField;
    SaleDeathCarcassNum: TIntegerField;
    SaleDeathCarcassSex: TStringField;
    SaleDeathLeftWt: TFloatField;
    SaleDeathRightWt: TFloatField;
    SaleDeathCondemnedWt: TFloatField;
    SaleDeathPricePerKg: TFloatField;
    SaleDeathSaleGrps_Id: TIntegerField;
    ServicesGeneticDam: TIntegerField;
    LookUpServicesEventID: TIntegerField;
    LookUpServicesServiceType: TIntegerField;
    LookUpServicesServiceBull: TIntegerField;
    LookUpServicesServedBy: TIntegerField;
    LookUpServicesTreatments: TIntegerField;
    LookUpServicesAmountOfStraw: TFloatField;
    LookUpServicesGeneticDam: TIntegerField;
    AnimalFileByIDID: TIntegerField;
    AnimalFileByIDLactNo: TSmallintField;
    AnimalFileByIDNatIDNum: TStringField;
    AnimalFileByIDTransponderNo: TStringField;
    AnimalFileByIDTattoNo: TStringField;
    AnimalFileByIDName: TStringField;
    AnimalFileByIDType: TStringField;
    AnimalFileByIDPrimaryBreed: TIntegerField;
    AnimalFileByIDPrimaryPerc: TSmallintField;
    AnimalFileByIDSecondaryBreed: TIntegerField;
    AnimalFileByIDSecondaryPerc: TSmallintField;
    AnimalFileByIDColour: TIntegerField;
    AnimalFileByIDDateOfBirth: TDateField;
    AnimalFileByIDDamID: TIntegerField;
    AnimalFileByIDSireID: TIntegerField;
    AnimalFileByIDBreeder: TIntegerField;
    AnimalFileByIDHerdID: TIntegerField;
    AnimalFileByIDInHerd: TBooleanField;
    AnimalFileByIDBreeding: TBooleanField;
    AnimalFileByIDAncestor: TBooleanField;
    AnimalFileByIDTBTestDate: TDateField;
    AnimalFileByIDAnimalDeleted: TBooleanField;
    AnimalFileByIDHerdBookNo: TStringField;
    AnimalFileByIDSeqNo: TIntegerField;
    AnimalFileByIDSortAnimalNo: TStringField;
    AnimalFileByIDSortNatID: TStringField;
    AnimalFileByIDAnimalNo: TStringField;
    AnimalFileByIDBirthWeight: TFloatField;
    AnimalFileByIDDonorDamID: TIntegerField;
    TempCalvingDonorDamID: TIntegerField;
    CustomersCMMSForms: TBooleanField;
    BullExt: TTable;
    CowExt: TTable;
    MainFilter: TTable;
    CMMS: TTable;
    dsCMMS: TDataSource;
    CMMSInitCMMSNo: TIntegerField;
    CMMSCMMSAllocation: TIntegerField;
    CMMSCurrCMMSNo: TIntegerField;
    CMMSLastCMMSNo: TIntegerField;
    CustomersSlaughter: TBooleanField;
    SaleDeathSlaughter: TBooleanField;
    DefaultsID: TAutoIncField;
    DefaultsNatIDIndex: TSmallintField;
    DefaultsNatIDMask: TStringField;
    DefaultsMilkLayout: TSmallintField;
    DefaultsDefaultHerdID: TIntegerField;
    DefaultsLUCow: TFloatField;
    DefaultsLUEwe: TFloatField;
    DefaultsLUSuckler: TFloatField;
    DefaultsLU10Mth: TFloatField;
    DefaultsLUUnder24Mth: TFloatField;
    DefaultsLUOver24Mth: TFloatField;
    DefaultsUpdateNo: TIntegerField;
    DefaultsShowAllAnimals: TBooleanField;
    DefaultsAuditCreated: TDateTimeField;
    DefaultsAuditReCreated: TDateTimeField;
    DefaultsCurrUser: TIntegerField;
    DefaultsLastBackUp: TDateField;
    DefaultsMassUpdates: TBooleanField;
    DefaultsActiveFilter: TBooleanField;
    DefaultsDefaultFarmID: TIntegerField;
    DefaultsUseScanner: TBooleanField;
    DefaultsVAT: TFloatField;
    DefaultsShowHints: TBooleanField;
    DefaultsAmtBullPrem: TFloatField;
    DefaultsAmt10MthPrem: TFloatField;
    DefaultsAmt22MthPrem: TFloatField;
    DefaultsAmtSlghtPrem: TFloatField;
    DefaultsLUEF0to6mths: TFloatField;
    DefaultsLUEF6to12mths: TFloatField;
    DefaultsLUEF1to2yrs: TFloatField;
    DefaultsHeifSlghtPrem: TFloatField;
    OwnerFileVATRate: TFloatField;
    EventsICBFAction: TStringField;
    ICBFDelete: TTable;
    ICBFDeleteEventID: TIntegerField;
    ICBFDeleteEventType: TIntegerField;
    ICBFDeleteEventDate: TDateField;
    ICBFDeleteAction: TStringField;
    OwnerFileMilkPrice: TFloatField;
    OwnerFileBFatPerc: TFloatField;
    OwnerFileProtPerc: TFloatField;
    OwnerFileLactPerc: TFloatField;
    OwnerFileBFatprice: TFloatField;
    OwnerFileProtprice: TFloatField;
    OwnerFileLactprice: TFloatField;
    OwnerFileMeasure: TBooleanField;
    FeedEventsBatch: TIntegerField;
    FeedEventsLact: TIntegerField;
    OwnerFileBFatweight: TFloatField;
    OwnerFileProtweight: TFloatField;
    OwnerFileLactweight: TFloatField;
    OwnerFileBFatvar: TFloatField;
    OwnerFileProtvar: TFloatField;
    OwnerFileLactvar: TFloatField;
    AnimalFileByIDBrucellosis: TDateField;
    Feeds: TTable;
    FeedsSource: TDataSource;
    qFeeds: TQuery;
    OwnerFileRSINumber: TStringField;
    OwnerFileTitle: TStringField;
    OwnerFileSurname: TStringField;
    OwnerFileFirstName: TStringField;
    ICBFDeleteNotified: TBooleanField;
    dsCowExt: TDataSource;
    OwnerFileEMailYear: TIntegerField;
    OwnerFileEMailCount: TIntegerField;
    qRetag: TQuery;
    dsBlup: TDataSource;
    tBlup: TTable;
    SaleGrps: TTable;
    SubsidyPayments: TTable;
    PurchGrpHeader: TTable;
    Ext001: TTable;
    Deductions: TTable;
    PurchGrpData: TTable;
    Unzip: TUnzipFile;
    ID: TAutoIncField;
    HelpSocket: TigAppHelpSocket;
    dsLookupGroups: TDataSource;
    dsDefaults: TDataSource;
    LookupGroups: TTable;
    LookupGroupsID: TAutoIncField;
    LookupGroupsGroupType: TStringField;
    LookupGroupsCode: TStringField;
    LookupGroupsDescription: TStringField;
    LookupGroupsSelected: TBooleanField;
    DefaultsMilkRecDir: TStringField;
    DefaultsICBFMMR: TBooleanField;
    AnimalFileByIDSex: TStringField;
    DefaultsReportInEuro: TBooleanField;
    DefaultsEConvert: TBooleanField;
    SuckReplace: TTable;
    dsSuckReplace: TDataSource;
    OwnerFileMilkQuota: TFloatField;
    ICBFDeleteHerdID: TIntegerField;
    OwnerFileSucklerQuota: TFloatField;
    TempCalvingCalfMortality: TIntegerField;
    TempCalvingCalfDead: TBooleanField;
    TempCalvingBreeding: TBooleanField;
    SaleDeathNIDeathNotify: TBooleanField;
    OwnerFileClientRefNo: TStringField;
    OwnerFileFarmSurveyNo: TStringField;
    DefaultsICBFDefaultDate: TDateField;
    OwnerFileDefAccComp: TStringField;
    DefaultsPassReq: TBooleanField;
    PremiaDefaults: TTable;
    dsPremiaDefaults: TDataSource;
    PremiaPayments: TTable;
    dsPremiaPayments: TDataSource;
    ConditionScore: TTable;
    DiagnoseProblem: TTable;
    EmbryoTransfer: TTable;
    dsConditionScore: TDataSource;
    dsDiagnoseProblem: TDataSource;
    dsEmbryoTransfer: TDataSource;
    EventsMPNotified: TBooleanField;
    EventsMPAction: TStringField;
    MPDelete: TTable;
    dsMPDelete: TDataSource;
    ConditionScoreEventID: TIntegerField;
    dsIntExam: TDataSource;
    IntExam: TTable;
    HealthVetPresc: TIntegerField;
    BullInOut: TTable;
    dsBullInOut: TDataSource;
    dsPedDetails: TDataSource;
    tPedDetails: TTable;
    qResCodes: TQuery;
    dsResCodes: TDataSource;
    dsExamReason: TDataSource;
    qExamReason: TQuery;
    qExamMethod: TQuery;
    dsExamMethod: TDataSource;
    qOwners: TQuery;
    ThisHerdType: TQuery;
    ThisHerdTypeDescription: TStringField;
    PremiaDefaultsID: TAutoIncField;
    PremiaDefaultsYear: TIntegerField;
    PremiaDefaultsMonth10: TCurrencyField;
    PremiaDefaultsMonth22: TCurrencyField;
    PremiaDefaultsBull: TCurrencyField;
    PremiaDefaultsSuckCowHeif: TCurrencyField;
    PremiaDefaultsSuckHeifTopup: TCurrencyField;
    PremiaDefaultsSlgthPrem: TCurrencyField;
    PremiaDefaultsSlgthTopUpPrem: TCurrencyField;
    PremiaDefaultsLastEditDate: TDateField;
    PremiaPaymentsID: TAutoIncField;
    PremiaPaymentsApplicID: TIntegerField;
    PremiaPaymentsPayDate: TDateField;
    PremiaPaymentsPayRefNo: TStringField;
    PremiaPaymentsPayOrdNo: TStringField;
    PremiaPaymentsBeefReduct: TCurrencyField;
    PremiaPaymentsFirst_Amt: TCurrencyField;
    PremiaPaymentsSecond_Amt: TCurrencyField;
    PremiaPaymentsBull_Amt: TCurrencyField;
    PremiaPaymentsFirst_Clm: TIntegerField;
    PremiaPaymentsSecond_Clm: TIntegerField;
    PremiaPaymentsBull_Clm: TIntegerField;
    PremiaPaymentsSuckCowHeif_Amt: TCurrencyField;
    PremiaPaymentsSuckHeifTopUp_Amt: TCurrencyField;
    PremiaPaymentsSuckCowHeif_Clm: TIntegerField;
    PremiaPaymentsSuckHeifTopUp_Clm: TIntegerField;
    PremiaPaymentsSlght_Amt: TCurrencyField;
    PremiaPaymentsSlghtHeifTopUp_Amt: TCurrencyField;
    PremiaPaymentsSlght_Clm: TIntegerField;
    PremiaPaymentsSlghtHeifTopUp_Clm: TIntegerField;
    PremiaPaymentsPenalty_Amt: TCurrencyField;
    PremiaPaymentsRunning_Amt: TCurrencyField;
    PremiaPaymentsPayable_Amt: TCurrencyField;
    PremiaPaymentsBalanceDue: TCurrencyField;
    PremiaPaymentsComment: TBlobField;
    PremiaPaymentsPayType: TIntegerField;
    LiveStockValues: TTable;
    LiveStockValuesHerdID: TIntegerField;
    LiveStockValuesCowsInMilk: TFloatField;
    LiveStockValuesCowsDry: TFloatField;
    LiveStockValuesBullBreed: TFloatField;
    LiveStockValuesHeifer06: TFloatField;
    LiveStockValuesHeifer612: TFloatField;
    LiveStockValuesHeifer1218: TFloatField;
    LiveStockValuesHeifer1824: TFloatField;
    LiveStockValuesHeifer24Plus: TFloatField;
    LiveStockValuesSteer06: TFloatField;
    LiveStockValuesSteer612: TFloatField;
    LiveStockValuesSteer1218: TFloatField;
    LiveStockValuesSteer1824: TFloatField;
    LiveStockValuesSteer24Plus: TFloatField;
    LiveStockValuesWP_Catt0_12: TIntegerField;
    LiveStockValuesWP_Catt12_24: TIntegerField;
    LiveStockValuesWP_Catt24Plus: TIntegerField;
    LiveStockValuesWP_DairyCows: TIntegerField;
    LiveStockValuesWP_SucklerCows: TIntegerField;
    LiveStockValuesWP_Rams: TIntegerField;
    LiveStockValuesWP_EwesMountain: TIntegerField;
    LiveStockValuesWP_EwesLowland: TIntegerField;
    LiveStockValuesWP_HoggetsMountain: TIntegerField;
    LiveStockValuesWP_HoggetsLowland: TIntegerField;
    LiveStockValuesWP_Lambs: TIntegerField;
    LiveStockValuesOpeningValue: TFloatField;
    LiveStockValuesClosingValue: TFloatField;
    dsLiveStockValues: TDataSource;
    DefaultsPhoneLink: TBooleanField;
    dsDrugBatchNo: TDataSource;
    qDrugBatchNo: TQuery;
    LiveStockValuesFromDate: TDateField;
    LiveStockValuesToDate: TDateField;
    MedicineMilkWithDrawal: TIntegerField;
    MedicineOtherWithDrawal: TIntegerField;
    MediPurchExpiryDate: TDateField;
    qDrugBatchNoBatchNo: TStringField;
    qDrugBatchNoExpiryDate: TDateField;
    qDrugBatchNoName: TStringField;
    qDrugBatchNoDrugID: TIntegerField;
    BreedsSelected: TBooleanField;
    HealthDrugPurchID: TIntegerField;
    qDrugBatchNoID: TIntegerField;
    LookUpMedicineMilkWithDrawal: TIntegerField;
    LookUpMedicineOtherWithDrawal: TIntegerField;
    DefaultsLastVerUpdate: TDateField;
    DefaultsPhoneLinkType: TIntegerField;
    EventsEventSource: TIntegerField;
    LiveStockValuesAvgDairyPerc: TFloatField;
    LiveStockValuesAvgCattlePerc: TFloatField;
    LiveStockValuesAvgReplacePerc: TFloatField;
    CowExtAnimalID: TIntegerField;
    CowExtPIN: TIntegerField;
    CowExtITEM: TIntegerField;
    CowExtCGI: TIntegerField;
    CowExtCalcFrom: TStringField;
    CowExtCountry: TIntegerField;
    CowExtSRStatus: TStringField;
    CowExtAwards: TStringField;
    CowExtLatestClass: TStringField;
    CowExtLatestClassScore: TIntegerField;
    CowExtNoOfTimesClassedEX: TIntegerField;
    CowExtFarmID: TStringField;
    CowExtFamilyName: TStringField;
    BullExtAnimalID: TIntegerField;
    BullExtCountry: TIntegerField;
    BullExtSource: TIntegerField;
    BullExtMilkPredDiff: TFloatField;
    BullExtFatKgs: TFloatField;
    BullExtFatPerc: TFloatField;
    BullExtProtKgs: TFloatField;
    BullExtProtPerc: TFloatField;
    BullExtReliability: TSmallintField;
    BullExtCalvingDifficulty: TFloatField;
    BullExtPI: TFloatField;
    BullExtPIN: TIntegerField;
    BullExtITEM: TIntegerField;
    BullExtCGI: TIntegerField;
    BullExtCalcFrom: TStringField;
    BullExtSRStatus: TStringField;
    BullExtAwards: TStringField;
    BullExtLatestClass: TStringField;
    BullExtLatestClassScore: TIntegerField;
    BullExtNoOfTimesClassedEX: TIntegerField;
    BullExtFarmID: TStringField;
    PurchasesLotNumber: TStringField;
    OwnerFileFQAS: TBooleanField;
    PurchasesFQAS: TBooleanField;
    AnimalFileByIDBreedCode: TStringField;
    AnimalSourceByID: TDataSource;
    AnimalFileByIDRT: TBooleanField;
    qTempTag: TQuery;
    AnimalFileByIDTT: TBooleanField;
    HealthNoDays: TIntegerField;
    HealthNoTimes: TIntegerField;
    LookupMediAdmin: TTable;
    dsLookupMediAdmin: TDataSource;
    dsLookUpMedicine: TDataSource;
    FdStkEventsComment: TStringField;
    FeedEventsFeedName: TStringField;
    MilkDiskLayoutID: TAutoIncField;
    MilkDiskLayoutCountry: TStringField;
    MilkDiskLayoutDefaultName: TStringField;
    MilkDiskLayoutTestDatePos: TSmallintField;
    MilkDiskLayoutTestDateLen: TSmallintField;
    MilkDiskLayoutAnimalNoChars: TSmallintField;
    MilkDiskLayoutAnimalNoPos: TSmallintField;
    MilkDiskLayoutAnimalNoLen: TSmallintField;
    MilkDiskLayoutDailyMilkYieldPos: TSmallintField;
    MilkDiskLayoutDailyMilkYieldLen: TSmallintField;
    MilkDiskLayoutDailyBFatPos: TSmallintField;
    MilkDiskLayoutDailyBFatLen: TSmallintField;
    MilkDiskLayoutDailyProtPos: TSmallintField;
    MilkDiskLayoutDailyProtLen: TSmallintField;
    MilkDiskLayoutDailyLactPos: TSmallintField;
    MilkDiskLayoutDailyLactLen: TSmallintField;
    MilkDiskLayoutYield305Pos: TSmallintField;
    MilkDiskLayoutYield305Len: TSmallintField;
    MilkDiskLayoutBFat305PercPos: TSmallintField;
    MilkDiskLayoutBFat305PercLen: TSmallintField;
    MilkDiskLayoutProt305PercPos: TSmallintField;
    MilkDiskLayoutProt305PercLen: TSmallintField;
    MilkDiskLayoutCumYieldPos: TSmallintField;
    MilkDiskLayoutCumYieldLen: TSmallintField;
    MilkDiskLayoutCumBFatPos: TSmallintField;
    MilkDiskLayoutCumBFatLen: TSmallintField;
    MilkDiskLayoutCumProtPos: TSmallintField;
    MilkDiskLayoutCumProtLen: TSmallintField;
    MilkDiskLayoutNoOfTestsPos: TSmallintField;
    MilkDiskLayoutNoOfTestsLen: TSmallintField;
    MilkDiskLayoutDaysInMilkPos: TSmallintField;
    MilkDiskLayoutDaysInMilkLen: TSmallintField;
    MilkDiskLayoutSCCPos: TSmallintField;
    MilkDiskLayoutSCCLen: TSmallintField;
    MilkDiskLayoutCumLactPos: TIntegerField;
    MilkDiskLayoutCumLactLen: TIntegerField;
    HealthFarmCode: TIntegerField;
    Images: TImageList;
    CrushDisk: TTable;
    CrushDiskTrans: TTable;
    dsCrushDisk: TDataSource;
    dsCrushDiskTrans: TDataSource;
    dsMilkCheque: TDataSource;
    dsMilkTank: TDataSource;
    MilkCheque: TTable;
    MilkTank: TTable;
    MilkTankID: TAutoIncField;
    MilkTankDateCollected: TDateField;
    MilkTankAmtCollect: TFloatField;
    MilkTankPerFat: TFloatField;
    MilkTankPerProtein: TFloatField;
    MilkTankPerLac: TFloatField;
    MilkTankPerSolid: TFloatField;
    MilkTankSCC: TFloatField;
    MilkTankTCB: TFloatField;
    MilkTankThermoduric: TFloatField;
    MilkTankUnitMeasure: TFloatField;
    MilkChequeID: TAutoIncField;
    MilkChequeCalMthEnd: TDateField;
    MilkChequeDateStart: TDateField;
    MilkChequeDateEnd: TDateField;
    MilkChequeLiqMilkProd: TFloatField;
    MilkChequePrcPerLtrLiq: TFloatField;
    MilkChequeProcMilkProd: TFloatField;
    MilkChequePrcPerLtrProc: TFloatField;
    MilkChequeGrossValMilk: TFloatField;
    MilkChequeNetValMilk: TFloatField;
    MilkChequeAvgPerFat: TFloatField;
    MilkChequeAvgPerProtein: TFloatField;
    MilkChequeAvgPerLac: TFloatField;
    MilkChequeAvgPerSolid: TFloatField;
    MilkChequeAvgSCC: TFloatField;
    MilkChequeBDEDesigner1TCB: TFloatField;
    MilkChequeBDEDesigner2TCB: TFloatField;
    MilkChequeBDEDesigner3TCB: TFloatField;
    MilkChequeAvgTherm: TFloatField;
    MilkChequeUnitMeasure: TFloatField;
    OwnerFileBladeFarmerID: TIntegerField;
    FdStkEventsBladeFeedID: TIntegerField;
    SuppliersBladeSupplierID: TIntegerField;
    AnimalFileByIDBladeNotified: TBooleanField;
    EventsBladeNotified: TBooleanField;
    SuppliersBladeNotified: TBooleanField;
    FdStkEventsBladeNotified: TBooleanField;
    AnimalFileByIDSearchNatID: TStringField;
    DefaultsShowMessage: TBooleanField;
    AnimalFileByIDColourCode: TStringField;
    AnimalFileByIDDamNo: TStringField;
    AnimalFileByIDSireNo: TStringField;
    LookupAnimals: TTable;
    tCowExt: TTable;
    DeletedCalvings: TTable;
    LookupWeighings: TTable;
    SaleDeathDisposal: TIntegerField;
    TempCalvingCalfID: TIntegerField;
    RestorePoint: TRestorePoint;
    CustomersBTEHerdNo: TStringField;
    SetInHerd: TQuery;
    TempCalvingGroupID: TIntegerField;
    TempCalvingDisposalPlace: TIntegerField;
    qEventsRecorded: TQuery;
    ConditionScoreScore: TFloatField;
    qSaleExists: TQuery;
    dsMainFilter: TDataSource;
    qFilterAnimals: TQuery;
    dsqFilterAnimals: TDataSource;
    MainFilterAID: TIntegerField;
    NewImages24x24: TImageList;
    NewImages16x16: TImageList;
    HealthBladeDiagCode: TIntegerField;
    HealthTemperature: TFloatField;
    HealthReportID: TIntegerField;
    CowExtEBI: TFloatField;
    BullExtRBI: TFloatField;
    CMMSPermits: TTable;
    BreedsInUse: TBooleanField;
    MedicineInUse: TBooleanField;
    MediPurchInUse: TBooleanField;
    qFilterAnimalsID: TIntegerField;
    qFilterAnimalsAnimalNo: TStringField;
    qFilterAnimalsNatIDNum: TStringField;
    OwnerFileForageAreaHa: TFloatField;
    qFilterAnimalsSex: TStringField;
    qFilterAnimalsDateOfBirth: TDateField;
    qFilterAnimalsLactNo: TSmallintField;
    HealthDetailedComment: TMemoField;
    CustomersAuthorisedDisposalPlace: TBooleanField;
    AnimalFileByIDEBI: TFloatField;
    AnimalFileByIDFemale_EBI: TFloatField;
    AnimalFileByIDBull_EBI: TFloatField;
    AnimalFileByIDDamAnimalNo: TStringField;
    LiveStockValuesBullBeef06: TFloatField;
    LiveStockValuesBullBeef612: TFloatField;
    LiveStockValuesBullBeef12Plus: TFloatField;
    dsMovedTo: TDataSource;
    PregDiagEventID: TIntegerField;
    PregDiagPDType: TStringField;
    PregDiagPDbyWhom: TStringField;
    PregDiagNoCalves: TSmallintField;
    PregDiagDaysInCalf: TSmallintField;
    PregDiagPregnancyStatus: TBooleanField;
    QuerySpecies: TQuery;
    dsQuerySpecies: TDataSource;
    OwnerFileSpecies: TIntegerField;
    DefaultsGoatTagFormat: TStringField;
    MilkCumulative305ProtKgs: TFloatField;
    MilkCumulative305BFatKgs: TFloatField;
    MilkCumulativeCumProtKgs: TFloatField;
    MilkCumulativeCumBFatKgs: TFloatField;
    MilkCumulative305TotalSolids: TFloatField;
    MilkCumulativeCumTotalSolids: TFloatField;
    BreedsPedigreeBreed: TStringField;
    ServicesTechnician: TIntegerField;
    pDefs: TTable;
    pDefsID: TAutoIncField;
    pDefsNPDairyCow: TFloatField;
    pDefsNPSucklerCow: TFloatField;
    pDefsNPCattle2YrsPlus: TFloatField;
    pDefsNPCattle1to2Yrs: TFloatField;
    pDefsNPMTEweLamb: TFloatField;
    pDefsNPLowEweLamb: TFloatField;
    pDefsNPMTHogget: TFloatField;
    pDefsNPLowHogget: TFloatField;
    pDefsPPDairyCow: TFloatField;
    pDefsPPSucklerCow: TFloatField;
    pDefsPPCattle2YrsPlus: TFloatField;
    pDefsPPCattle1to2Yrs: TFloatField;
    pDefsPPMTEweLamb: TFloatField;
    pDefsPPLowEweLamb: TFloatField;
    pDefsPPMTHogget: TFloatField;
    pDefsPPLowHogget: TFloatField;
    pDefsNPCattle0to12Mths: TFloatField;
    pDefsPPCattle0to12Mths: TFloatField;
    SaleDeathFallenStkNo: TStringField;
    ServicesET1No: TStringField;
    GroupsEventDate: TDateField;
    GroupsDestSource: TIntegerField;
    CustomersMeatFactory: TBooleanField;
    pDefsNINPCattleOver24Mths: TFloatField;
    pDefsNINPCattle12To24Mths: TFloatField;
    pDefsNINPBullBeef0To13Mths: TFloatField;
    pDefsNINPBullBeef6To13Mths: TFloatField;
    pDefsNINPCattle0To12Mths: TFloatField;
    pDefsNINPCalves6To12Mths: TFloatField;
    pDefsNINPCalves0To6Mths: TFloatField;
    pDefsNINPDairyCows: TFloatField;
    TempCalvingComplianceCert: TBooleanField;
    MedicineStockLevel: TFloatField;
    DefaultsCMMSDataStartUpDate: TDateField;
    QueryEvent: TQuery;
    QuerySubEvent: TQuery;
    CheckEventSession: TSession;
    BullExtFamilyName: TStringField;
    MealFeeding: TTable;
    dsMealFeeding: TDataSource;
    Disbudding: TTable;
    dsDisbudding: TDataSource;
    MealFeedingEventID: TIntegerField;
    DisbuddingEventID: TIntegerField;
    DisbuddingVetID: TIntegerField;
    Weaning: TTable;
    dsWeaning: TDataSource;
    WeaningEventID: TIntegerField;
    WeaningDocility: TIntegerField;
    WeaningQuality: TIntegerField;
    WeaningScores: TdxMemData;
    WeaningScoresID: TIntegerField;
    WeaningScoresDescription: TStringField;
    WeaningScoresScore: TIntegerField;
    WeaningScoresListType: TIntegerField;
    dsWeaningScores: TDataSource;
    WeaningWeight: TFloatField;
    WeaningWeighingDate: TDateField;
    EditRepository: TcxEditRepository;
    HealthReportInDays: TIntegerField;
    FertPrograms: TTable;
    FertProgramsID: TAutoIncField;
    FertProgramsCode: TStringField;
    FertProgramsDescription: TStringField;
    FertProgramsStartDay: TIntegerField;
    FertTreatments: TTable;
    FertTreatmentsID: TAutoIncField;
    FertTreatmentsParentProgram: TIntegerField;
    FertTreatmentsCode: TStringField;
    FertTreatmentsDescription: TStringField;
    FertTreatmentsStartDay: TIntegerField;
    dsFertTreatments: TDataSource;
    dsFertPrograms: TDataSource;
    CowFertility: TTable;
    dsCowFertility: TDataSource;
    cxGridViewRepository1: TcxGridViewRepository;
    cxGridViewRepository1DBBandedTableView1: TcxGridDBBandedTableView;
    CTSBirthsRequest: TTable;
    dsCTSBirthsRequest: TDataSource;
    CustomersLocationId: TStringField;
    CustomersSubLocationId: TStringField;
    SuppliersLocationId: TStringField;
    SuppliersSubLocationId: TStringField;
    OwnerFileBLoc: TStringField;
    OwnerFileBSLoc: TStringField;
    OwnerFilePLoc: TStringField;
    OwnerFilePSLoc: TStringField;
    OwnerFileLoc: TStringField;
    OwnerFileSLoc: TStringField;
    OwnerFileCTSBatchID: TIntegerField;
    CustomersMHSId: TStringField;
    SuppliersMHSid: TStringField;
    OwnerFileMHSId: TStringField;
    SaleDeathCTSReg: TBooleanField;
    PurchasesCTSReg: TBooleanField;
    LookUpMedicineInUse: TBooleanField;
    MedicineOrganicMeatWithdrawal: TIntegerField;
    MedicineOrganicMilkWithdrawal: TIntegerField;
    MedicineOrganicOtherWithdrawal: TIntegerField;
    OwnerFileOrganic: TBooleanField;
    PurchasesFQASDays: TIntegerField;
    BuyersDefaultBuyer: TBooleanField;
    AnimalFileByIDPurchFQAS: TBooleanField;
    dsMarts: TDataSource;
    AnimalsExt: TTable;
    dsAnimalsExt: TDataSource;
    AnimalsExtAnimalID: TIntegerField;
    AnimalsExtComments: TMemoField;
    AnimalFileByIDNewComment: TStringField;
    MedicineMediGroup: TIntegerField;
    FeedEventsFeedRegimeID: TIntegerField;
    SaleDeathTotalDeductions: TFloatField;
    AnimalFileByIDNoDaysOnThisFarm: TIntegerField;
    DefaultsRestoreDate: TDateField;
    AnimalFileByIDPedigree: TBooleanField;
    OwnerFileNatIDNumInputStyle: TIntegerField;
    PurchasesHaulage: TFloatField;
    PurchasesCommission: TFloatField;
    StyleRepository: TcxStyleRepository;
    StyleRequired: TcxStyle;
    StyleNormal: TcxStyle;
    RequiredEditStyleController: TcxEditStyleController;
    AnimalFileByIDLocateNatID: TStringField;
    OwnerFileNextNatID: TIntegerField;
    OwnerFileNatIDLeadZero: TBooleanField;
    MAPIMail: TLMDMapiSendMail;
    qHealthCodes: TQuery;
    dsHealthCodes: TDataSource;
    GenLookUpInUse: TBooleanField;
    ConditionScoreAssociatedEventID: TIntegerField;
    ConditionScoreAssociatedEventType: TIntegerField;
    MoveIDs: TBatchMove;
    dsLookUpDamSire: TDataSource;
    LookUpServicesTechnician: TIntegerField;
    LookUpServicesET1No: TStringField;
    DefaultEditStyleController: TcxDefaultEditStyleController;
    LiveStockValuesPedigreeCowsInMilk: TFloatField;
    LiveStockValuesPedigreeCowsDry: TFloatField;
    LiveStockValuesPedigreeBullBreed: TFloatField;
    LiveStockValuesPedigreeHeifer06: TFloatField;
    LiveStockValuesPedigreeHeifer612: TFloatField;
    LiveStockValuesPedigreeHeifer1218: TFloatField;
    LiveStockValuesPedigreeHeifer1824: TFloatField;
    LiveStockValuesPedigreeHeifer24Plus: TFloatField;
    LiveStockValuesPedigreeSteer06: TFloatField;
    LiveStockValuesPedigreeSteer612: TFloatField;
    LiveStockValuesPedigreeSteer1218: TFloatField;
    LiveStockValuesPedigreeSteer1824: TFloatField;
    LiveStockValuesPedigreeSteer24Plus: TFloatField;
    LiveStockValuesPedigreeBullBeef06: TFloatField;
    LiveStockValuesPedigreeBullBeef612: TFloatField;
    LiveStockValuesPedigreeBullBeef12Plus: TFloatField;
    LiveStockValuesEnterpriseType: TStringField;
    LiveStockValuesPedigreeOpeningValue: TFloatField;
    LiveStockValuesPedigreeClosingValue: TFloatField;
    cxHint: TcxHintStyleController;
    mdMarts: TdxMemData;
    mdMartsID: TAutoIncField;
    mdMartsMartName: TStringField;
    mdMartsAddress1: TStringField;
    mdMartsAddress2: TStringField;
    mdMartsAddress3: TStringField;
    mdMartsAddress4: TStringField;
    mdMartsEmail: TStringField;
    AnimalFileByIDUKAISireCode: TStringField;
    TempCalvingCalcNatId: TStringField;
    procedure HerdBeforePost(DataSet: TDataSet);
    procedure EventsNewRecord(DataSet: TDataSet);
    procedure WinDataDestroy(Sender: TObject);
    procedure EventsAfterDelete(DataSet: TDataSet);
    procedure BreedsAfterPost(DataSet: TDataSet);
    function DeleteEvents : Boolean;
    procedure BreedsAfterDelete(DataSet: TDataSet);
    procedure OwnerFileNewRecord(DataSet: TDataSet);
    procedure OwnerFileAfterPost(DataSet: TDataSet);
    procedure tBullSemenAfterPost(DataSet: TDataSet);
    procedure tBullExtAfterPost(DataSet: TDataSet);
    procedure MilkCumulativeAfterPost(DataSet: TDataSet);
    procedure tBullSemenBeforeInsert(DataSet: TDataSet);
    procedure EventsBeforeDelete(DataSet: TDataSet);
    procedure WeighingsNewRecord(DataSet: TDataSet);
    procedure EventsAfterPost(DataSet: TDataSet);
    procedure EventsAfterCancel(DataSet: TDataSet);
    procedure MedicineAfterPost(DataSet: TDataSet);
    procedure TempCalvingBeforePost(DataSet: TDataSet);
    procedure EventsBeforePost(DataSet: TDataSet);
    procedure TempCalvingAfterInsert(DataSet: TDataSet);
    procedure HealthBeforeDelete(DataSet: TDataSet);
    procedure HealthBeforeEdit(DataSet: TDataSet);
    procedure HealthNewRecord(DataSet: TDataSet);
    procedure HealthAfterPost(DataSet: TDataSet);
    procedure GenLookUpNewRecord(DataSet: TDataSet);
    procedure GenLookUpAfterPost(DataSet: TDataSet);
    procedure GenLookUpBeforeDelete(DataSet: TDataSet);
    procedure MediPurchAfterPost(DataSet: TDataSet);
    procedure MediPurchNewRecord(DataSet: TDataSet);
    procedure MediPurchBeforeDelete(DataSet: TDataSet);
    procedure MediPurchBeforeEdit(DataSet: TDataSet);
    procedure MediPurchAfterDelete(DataSet: TDataSet);
    procedure MediAdminAfterPost(DataSet: TDataSet);
    procedure HealthBeforePost(DataSet: TDataSet);
    procedure MediPurchBeforePost(DataSet: TDataSet);
    procedure BeefSubsidyNewRecord(DataSet: TDataSet);
    procedure BeefSubsidyAfterDelete(DataSet: TDataSet);
    procedure PremiumTypeBeforePost(DataSet: TDataSet);
    procedure PremiumTypeAfterPost(DataSet: TDataSet);
    procedure BeefSubsidyBeforeDelete(DataSet: TDataSet);
    procedure OwnerFileBeforeDelete(DataSet: TDataSet);
    procedure tBullSemenNewRecord(DataSet: TDataSet);
    procedure OwnerFileBeforePost(DataSet: TDataSet);
    procedure SaleDeathNewRecord(DataSet: TDataSet);
    procedure TempCalvingNewRecord(DataSet: TDataSet);
    procedure ApplicationsAfterPost(DataSet: TDataSet);
    procedure DefaultsAfterOpen(DataSet: TDataSet);
    procedure MilkDiskLayoutBeforePost(DataSet: TDataSet);
    procedure EventsEventDateChange(Sender: TField);
    procedure PurchasesSupplierChange(Sender: TField);
    procedure PurchasesGradeChange(Sender: TField);
    procedure PurchasesNewRecord(DataSet: TDataSet);
    procedure qFemalesBeforeOpen(DataSet: TDataSet);
    procedure qFemalesAfterOpen(DataSet: TDataSet);
    procedure PregDiagNewRecord(DataSet: TDataSet);
    procedure tBullExtNewRecord(DataSet: TDataSet);
    procedure AnimalSourceByIDStateChange(Sender: TObject);
    procedure EventsAfterEdit(DataSet: TDataSet);
    procedure SaleDeathCustomerChange(Sender: TField);
    procedure EventsBeforeEdit(DataSet: TDataSet);
    procedure tMovementsBeforePost(DataSet: TDataSet);
    procedure tMovementsNewRecord(DataSet: TDataSet);
    procedure tMovedToBeforeDelete(DataSet: TDataSet);
    procedure PurchasesBuyerChange(Sender: TField);
    procedure PurchasesSupplierCostsChange(Sender: TField);
    procedure PurchasesBuyerCostsChange(Sender: TField);
    procedure CheckEventsBeforeOpen(DataSet: TDataSet);
    procedure tIntHerdNewRecord(DataSet: TDataSet);
    procedure tIntHerdAfterPost(DataSet: TDataSet);
    procedure tIntHerdBeforePost(DataSet: TDataSet);
    procedure BreedsBeforeDelete(DataSet: TDataSet);
    procedure tIntHerdAfterCancel(DataSet: TDataSet);
    procedure AnimalFileByIDAfterPost(DataSet: TDataSet);
    procedure AnimalFileByIDNewRecord(DataSet: TDataSet);
    procedure AnimalFileByIDHerdIDChange(Sender: TField);
    procedure AnimalFileByIDBeforePost(DataSet: TDataSet);
    procedure AnimalFileByIDColourChange(Sender: TField);
    procedure AnimalFileByIDPrimaryBreedChange(Sender: TField);
    procedure AnimalFileByIDSexChange(Sender: TField);
    procedure AnimalFileByIDBeforeEdit(DataSet: TDataSet);
    procedure AnimalFileByIDDateOfBirthChange(Sender: TField);
    procedure AnimalFileByIDAfterScroll(DataSet: TDataSet);
    procedure AnimalFileByIDAnimalNoValidate(Sender: TField);
    procedure AnimalFileByIDAfterCancel(DataSet: TDataSet);
    procedure AnimalFileByIDAfterInsert(DataSet: TDataSet);
    procedure AnimalFileByIDNatIDNumValidate(Sender: TField);
    procedure GroupsBeforeDelete(DataSet: TDataSet);
    procedure GroupsNewRecord(DataSet: TDataSet);
    procedure GroupsBeforePost(DataSet: TDataSet);
    procedure GroupsAfterScroll(DataSet: TDataSet);
    procedure SaleDeathBeforePost(DataSet: TDataSet);
    procedure EventsEventDateValidate(Sender: TField);
    procedure ServicesBeforePost(DataSet: TDataSet);
    procedure ServicesAfterPost(DataSet: TDataSet);
    procedure tBullSemenBeforePost(DataSet: TDataSet);
    procedure AnimalFileByIDTBTestDateValidate(Sender: TField);
    procedure AnimalFileByIDNatIDNumSetText(Sender: TField; const Text: String);
    procedure AnimalFileByIDNatIDNumChange(Sender: TField);
    procedure AnimalFileByIDDamIDValidate(Sender: TField);
    procedure AnimalFileByIDSireIDValidate(Sender: TField);
    procedure AnimalFileByIDAfterEdit(DataSet: TDataSet);
    procedure AnimalFileByIDHerdBookNoValidate(Sender: TField);
    procedure TempCalvingNatIDSetText(Sender: TField; const Text: String);
    procedure TempCalvingNatIDValidate(Sender: TField);
    procedure TempCalvingCalfNoValidate(Sender: TField);
    procedure OwnerFileMilkRecordingIDValidate(Sender: TField);
    procedure GroupsCodeValidate(Sender: TField);
    procedure GroupsGroupTypeValidate(Sender: TField);
    procedure SuppliersNewRecord(DataSet: TDataSet);
    procedure MedicineDrugCodeValidate(Sender: TField);
    procedure MedicineNameValidate(Sender: TField);
    procedure SuppliersBeforeDelete(DataSet: TDataSet);
    procedure CustomersBeforeDelete(DataSet: TDataSet);
    procedure BuyersBeforeDelete(DataSet: TDataSet);
    procedure BreedsNewRecord(DataSet: TDataSet);
    procedure BreedsCodeValidate(Sender: TField);
    procedure CustomersEditStatusGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure SuppliersEditStatusGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure BreedsEditStatusGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure UnitsUnitCodeValidate(Sender: TField);
    procedure UnitsBeforeDelete(DataSet: TDataSet);
    procedure GenLookUpDescriptionValidate(Sender: TField);
    procedure MediAdminAdminCodeValidate(Sender: TField);
    procedure MediAdminBeforeDelete(DataSet: TDataSet);
    procedure MedicineBeforeDelete(DataSet: TDataSet);
    procedure AnimalFileByIDLactNoValidate(Sender: TField);
    procedure GenLookUpLookUpCodeValidate(Sender: TField);
    procedure GenLookUpBeforePost(DataSet: TDataSet);
    procedure FeedEventsEndDateChange(Sender: TField);
    procedure CustomersNewRecord(DataSet: TDataSet);
    procedure AnimalFileByIDAnimalNoChange(Sender: TField);
    procedure FeedsAfterScroll(DataSet: TDataSet);
    procedure AnimalFileByIDBrucellosisValidate(Sender: TField);
    function HelpSocketHTMLHelp(Command: Word; Data: Integer;
      var CallHelp: Boolean): Boolean;
    procedure SuckReplaceAfterPost(DataSet: TDataSet);
    procedure SuckReplaceAfterInsert(DataSet: TDataSet);
    procedure PremiaDefaultsAfterPost(DataSet: TDataSet);
    procedure BullInOutNewRecord(DataSet: TDataSet);
    procedure WinDataCreate(Sender: TObject);
    procedure CustomersSlaughterChange(Sender: TField);
    procedure PremiaDefaultsHerdIDChange(Sender: TField);
    procedure DefaultsAfterPost(DataSet: TDataSet);
    procedure CowExtBeforePost(DataSet: TDataSet);
    procedure OtherIDsAfterPost(DataSet: TDataSet);
    procedure IDFileAfterPost(DataSet: TDataSet);
    procedure AnimalFileByIDAfterOpen(DataSet: TDataSet);
    procedure FeedEventsAfterDelete(DataSet: TDataSet);
    procedure FeedEventsAfterPost(DataSet: TDataSet);
    procedure CrushDiskTransAfterInsert(DataSet: TDataSet);
    procedure CrushDiskAfterPost(DataSet: TDataSet);
    procedure CrushDiskTransAfterPost(DataSet: TDataSet);
    procedure CrushDiskBeforeClose(DataSet: TDataSet);
    procedure CrushDiskTransBeforeClose(DataSet: TDataSet);
    procedure GroupLinksAfterPost(DataSet: TDataSet);
    procedure FdStkEventsBeforePost(DataSet: TDataSet);
    procedure CheckICBFCountry;
    procedure DeletedCalvingsAfterPost(DataSet: TDataSet);
    procedure CustomersAfterPost(DataSet: TDataSet);
    procedure tBlupNewRecord(DataSet: TDataSet);
    procedure tBlupAfterPost(DataSet: TDataSet);
    procedure tBlupAfterDelete(DataSet: TDataSet);
    procedure BullExtAfterPost(DataSet: TDataSet);
    procedure BullExtAfterDelete(DataSet: TDataSet);
    procedure CowExtAfterDelete(DataSet: TDataSet);
    procedure CowExtAfterPost(DataSet: TDataSet);
    procedure EventsAfterInsert(DataSet: TDataSet);
    procedure CMMSPermitsAfterPost(DataSet: TDataSet);
    procedure CMMSPermitsNewRecord(DataSet: TDataSet);
    procedure CMMSPermitsBeforePost(DataSet: TDataSet);
    procedure AnimalFileByIDBeforeInsert(DataSet: TDataSet);
    procedure MedicineNewRecord(DataSet: TDataSet);
    procedure TempCalvingBeforeCancel(DataSet: TDataSet);
    procedure EventsBeforeCancel(DataSet: TDataSet);
    procedure AnimalFileByIDCalcFields(DataSet: TDataSet);
    procedure ServicesAfterInsert(DataSet: TDataSet);
    procedure BullingsAfterInsert(DataSet: TDataSet);
    procedure PregDiagPregnancyStatusChange(Sender: TField);
    procedure MilkCumulativeCalcFields(DataSet: TDataSet);
    procedure AnimalFileByIDBeforeCancel(DataSet: TDataSet);
    procedure MedicineBeforePost(DataSet: TDataSet);
    procedure tRemarksAfterPost(DataSet: TDataSet);
    procedure CalvingsAfterPost(DataSet: TDataSet);
    procedure FertTreatmentsAfterDelete(DataSet: TDataSet);
    procedure FertTreatmentsAfterPost(DataSet: TDataSet);
    procedure FertProgramsAfterPost(DataSet: TDataSet);
    procedure FertProgramsAfterDelete(DataSet: TDataSet);
    procedure FertProgramsBeforePost(DataSet: TDataSet);
    procedure FertTreatmentsBeforePost(DataSet: TDataSet);
    procedure FertTreatmentsBeforeInsert(DataSet: TDataSet);
    procedure HealthDrugUsedChange(Sender: TField);
    procedure HealthRateApplicChange(Sender: TField);
    procedure AnimalFileByIDBeforeOpen(DataSet: TDataSet);
    procedure BuyersAfterPost(DataSet: TDataSet);
    procedure BuyersNewRecord(DataSet: TDataSet);
    procedure AnimalFileByIDPurchFQASGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure AnimalsExtAfterPost(DataSet: TDataSet);
    procedure AnimalsExtAfterDelete(DataSet: TDataSet);
    procedure TempCalvingBeforeDelete(DataSet: TDataSet);
    procedure TempCalvingCalfDeadChange(Sender: TField);
    procedure PurchasesHaulageChange(Sender: TField);
    procedure PurchasesCommissionChange(Sender: TField);
    procedure PurchasesBeforePost(DataSet: TDataSet);
    procedure qHealthCodesBeforeOpen(DataSet: TDataSet);
    procedure SaleDeathColdDeadWtChange(Sender: TField);
    procedure SaleDeathKillOutChange(Sender: TField);
    procedure SaleDeathWeightChange(Sender: TField);
    procedure cxHintShowHint(Sender: TObject; var HintStr: String;
      var CanShow: Boolean; var HintInfo: THintInfo);
    procedure TempCalvingCalcFields(DataSet: TDataSet);
    procedure TempCalvingAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    AfterEditNatIDType,
    BeforeEditNatIDType : TNatIdStyle; // SP 16/09/02

    NeedSequence : Boolean;   // True if Inserting a NEW Animal and a Sequence No is required
    LastHerdID,               // used to store the HerdID of an animal before its posted
                              // this allow the seq no for this LastHerd to be increased
    NewSeqNo,
    NewInterHerdID,
    RemarksOrigAnimalID : Integer;  // Stores the Animals ID before Posting to all if the
                             // Changes shift the Animal out of the grid
    SaleDeathDateSet,
    PurchDateSet : Boolean;
    ThisEventId : Integer;
    ThisEventDate : TDateTime;
    OrigAnimalId : Integer;
    EStatus      : TEventStatus;
    CurrentUser  : Integer;
    FPremiumYear: Integer;
    MPSaleDeath,
    MPService : ^MPECategory;
    FNewCustomerAttributes: TCustomerAttributes;

    PasswordProtectTables : Boolean;
    DataOpenOK : Boolean;

    CheckEventID : Integer;
    sSubEventTable : string;

    FSystemRegisteredCountry: TCountry;
    FCalculateLiveAndDeadWeight : Boolean;

    // 08/09/10 [V4.0 R4.7] /MK Change - Moved DeadCalfNatID Variable So I can access it from other procedures

    procedure CheckFiles;
    function OpenAllTables : Boolean;

    function GetDefaultCountry : String;

    function GetUserHerdID : Integer;
    procedure SetUserHerdID ( NewId : Integer );
    function GetShowAllAnimals : Boolean;
    procedure SetShowAllAnimals ( ShowAll : Boolean );
    function GetMassUpdates : Boolean;
    procedure SetMassUpdates ( Value : Boolean );
    // Call this to refresh the Listing from GenLook.db
    procedure SetUpQueries;
//    procedure MakeCowExt; Moved to Update.Dll 03/03/2003
    function CheckSireIdCalvingRecords : Boolean;
    function CheckCalvingEvents : Boolean;
    function ICBFNotified : Boolean;
    function FeedCategory : Boolean;
    procedure UpdateDefaults;

    function GetEventStatus : TEventStatus;
    procedure SetEventStatus ( NewStatus : TEventStatus );
//    procedure MakeBuyer; Moved to Update.Dll 03/03/2003
//    procedure MakeAudit; Moved to Update.Dll 03/03/2003
//    procedure MakeSysUsers; Moved to Update.Dll 03/03/2003
    // Used to Store any changes made to an animals detail - Bovine Herd Register
    procedure WriteRemarks;

    function GetLastBackUpDate : TDateTime;
    procedure SetLastBacKupDate ( ThisDate : TDateTime );

    // procedure CheckRemarks(MyField: TField; MyRemark : TRemark);
    procedure CheckRemarks(ThisTable : TDataSet; MyField: TField; MyRemark : TRemark; AUserConfirm : Boolean = True);
//    procedure MakeInterHerd; Moved to Update.Dll 03/03/2003
//    procedure MakeMovement; Moved to Update.Dll 03/03/2003
//    procedure MakeMovedTo; Moved to Update.Dll 03/03/2003
//    procedure MakeSApplic; Moved to Update.Dll 03/03/2003
//    procedure MakeSAppliedFor;   Moved to Update.Dll 03/03/2003
    procedure MakePremiaDefaults;
    procedure MakePremiaPayments;
    procedure WriteTheEventRecord;
    function  TransferAnimalNo : Boolean;
    function  TransferNATID : Boolean;
    function  AddSeqNo : Boolean;
//    procedure MakeSlghtApplic; moved to update.DLL 03/03/2003
//    procedure MakeSlghtAppliedFor; moved to update.DLL 03/03/2003
    function GetNoInGroup : Integer;
    function GetSelected : Integer;
    procedure SetNatIdRequired;
    function CheckMilkRecDates : Boolean;
    function CreateLstkDefValue: Boolean; //jt 17/07/2002

    function GetICBFMMR: Boolean;
    procedure SetICBFMMR(const Value: Boolean);
    function GetUseEuro: Boolean;
    procedure SetUseEuro(const Value: Boolean);
    function GetReportInEuro: Boolean;
    procedure SetReportInEuro(const Value: Boolean);
//    function GetNamePassReq: Boolean;
    function GetHerdIdentifier: String;
    function RemoveOldExtDefaults : Boolean;
    function GetDefAccsCompany: String;
    procedure SetDefAccsCompany(const Value: String);
    function GetSearchPhoneLink: Boolean;
    procedure SetSearchPhoneLink(const Value: Boolean);
    function GetLastVersionUpdate: TDateTime;
    function GetPhoneLinkType: SmallInt;
    procedure SetLastVersionUpdate(const Value: TDateTime);
    procedure SetPhoneLinkType(const Value: SmallInt);

    function GetBullAmount: Double;
    function GetFirstAmount: Double;
    function GetSecondAmount: Double;
    function GetSlghtAmount: Double;
    procedure SetBullAmount(const Value: Double);
    procedure SetFirstAmount(const Value: Double);
    procedure SetSecondAmount(const Value: Double);
    procedure SetSlghtAmount(const Value: Double);
    function GetSuckAmount: Double;
    function GetSuckTopupAmount: Double;
    procedure SetSuckAmount(const Value: Double);
    procedure SetSuckTopupAmount(const Value: Double);
    function GetSlghtTopupAmount: Double;
    procedure SetSlghtTopupAmount(const Value: Double);
    procedure SetPremiumYear(const Value: Integer);
    function GetFieldsRepsVerNo: Integer;
    procedure SetHerdDBPassword(const Value: String);
    function GetHerdDBPassword: String;
    procedure SetFieldsRepsVerNo(const Value: Integer);
    procedure SetDisplayNews(const Value: Boolean);
    function GetDisplayNews: Boolean;
    function GetICBFMatchField: string;
    procedure SetICBFMatchField(const Value: string);
    function GetUserDefaultHerdCountry: TCountry;
    procedure SetGoatTagFormat(const Value : String);
    function GetGoatTagFormat : String;
    function GetDefaultHerdID: Integer;
    function GetForageArea: Double;
    function GetCMMSDataStartUpDate: TDateTime;
    procedure SetCMMSDataStartUpDate(const Value: TDateTime);
    function GetDefaultHerdIdentifierMask: string;
    function GetDefaultNatIDMaskFromHerdIdentifierMask: string;
    procedure AnimalFileByIDBreedingGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    function GetDefaultEmailClient: string;
    procedure SetDefaultEmailClient(const Value: string);
    function GetLastRestoreDate: TDateTime;
    procedure SetLastRestoreDate(const Value: TDateTime);
    function ExtractHerdIdentifier(NatIDMask: string;
      const AFormatResult: Boolean): string;
    function GetBeefAISireFileName: string;
    procedure SetBeefAISireFileName(const Value: string);
    function GetCurrentDBVersion: Integer;
    procedure CalculateLiveAndDeadWeight;
    function GetKingswdDatabaseName: string;
  protected
    FNoneHerdID : Integer;
    ServiceBullID : Integer;
    ServiceBullNoStraws : Double;
    // used in conjunction with the SearchField property

    function GetAnimalID : LongInt;
    function GetOtherID : LongInt;
    // function GetHerdID : LongInt;
    function GetNONEHerdID : LongInt;
    function GetHasInterHerd : Boolean;
    procedure UpdateEventHerdID (HID : Variant; AID : Integer);
    function GetSearchField : String;
    procedure SetSearchField ( Value : String );

    function GetActiveFilter : Boolean;
    procedure SetActiveFilter ( Value : Boolean );

    function GetDefaultSysUser : Integer;
    procedure SetDefaultSysUser ( SetToThis : Integer );
//    procedure MakeSaleDeletion; Moved to Update.Dll 03/03/2003
//    procedure MakePurchDeletion; Moved to Update.Dll 03/03/2003
    function  MakeGroupTables : Boolean;
    function RemoveRequiredAnimalNo : Boolean;
    function GetUseScanner : Boolean;
    procedure SetUseScanner ( Value : Boolean );
    function GetShowHints : Boolean;
    procedure SetShowHints ( Value : Boolean );
    function GetVAT : Double;
    procedure SetVAT ( Value : Double );

    function GetLUEF0to6mths : Double;
    procedure SetLUEF0to6mths (Value : Double);
    function GetLUEF6to12mths : Double;
    procedure SetLUEF6to12mths (Value : Double);
    function GetLUEF1to2yrs : Double;
    procedure SetLUEF1to2yrs (Value : Double);
    function GetLUEF2plusyrs : Double;
    procedure SetLUEF2plusyrs (Value : Double);
    function GetLUEF2plusyrsCows : Double;
    procedure SetLUEF2plusyrsCows (Value : Double);

    function GetLUEFSucklerCows : Double;
    procedure SetLUEFSucklerCows (Value : Double);

    function GetBullPrem : Double;
    procedure SetBullPrem (Value : Double);
    function Get10MthPrem : Double;
    procedure Set10MthPrem (Value : Double);
    function Get22MthPrem : Double;
    procedure Set22MthPrem (Value : Double);
    function GetSlghtPrem : Double;
    procedure SetSlghtPrem (Value : Double);
    // included 30/8/00 - kr
{
    function GetHeifSlghtPrem : Double;
    procedure SetHeifSlghtPrem (Value : Double);
}
    // Default Currency to use
    function GetLastEventFUpdate : TDateTime;
    procedure SetLastEventFUpdate(Value : TDateTime);

    function GetMilkRecDir : String;
    procedure SetMilkRecDir(MilkRecDir : String);

//    procedure PurchGrpHeaderCreate; Moved to update.dll 03/03/2003
//    procedure PurchGrpDataCreate; Moved to update.dll 03/03/2003
    function SortNatIdUpdate : Boolean;
    function PremUpdateCosts : Boolean;
    function CheckZeroSortNatID(SortNatID : String) : Boolean;
    function RemoveCheckDigit(NatIDStr : string) : String;
    function ReIndexNatIdMask: Boolean;
    function EuroCurrencyUpdate : Boolean;
    function UpdateCountries : Boolean;
    function CreateSuckSubsTable : Boolean;
    function CreateSuckQuotaField : Boolean;
    function AmmendSuckTable : Boolean;
    function AmmendReplaceTable : Boolean;
    function UpdateICBFDeleteTable : Boolean; // add a HerdID Field to this table.
    function ModifySuckField : Boolean;
    function AsgnHIDICBFDeleteEvents : Boolean;
    function UpdateMedicines : Boolean;
    function MooreParkUpdate : Boolean;
    procedure UpdateAnimalSex(Sex : String);
    function UpdDefaultsSrchField : Boolean;
    function FixHealthEvents : Boolean;
    function MakeAnimalWasteProd: Boolean;
    function UpdateBreedsCase : Boolean;
    procedure BullCowExtFix; // SP 15/01/2003
    function CreateQuotaTable : Boolean;
    procedure LoadPreferences;
    // NI Tag Validation
    procedure CreateAFilters;
    procedure AddRemoveProtectedTables(AddPassword : Boolean);
    procedure SetInHerdStatus(const InHerd : Boolean; const AID : Integer = 0);
    procedure ClearPasswordFromTables;
//    procedure UpgradeTableLevel;

    procedure CheckEventConsistency;

    procedure Table_ReIndex(ATable : TTable);

    procedure GS_SetSireField;

    procedure MDGridPurchDataBeforePost (Sender : TDataSet);



    // Used to unique identify Animals only
    property NewID : LongInt Read GetAnimalID;
//    property NewID2 : LongInt Read GetAnimalID2;
    // Used to unique identify Events e.t.c
    procedure CreateAnimalExtRecord;

    procedure ConvertTagPreferenceToTagStoreData;

  public
    { Public declarations }
    InsertCalving,          // True if Adding a Calving Record at SetUp
    // Deleting Animal is set in ONE place only Delete button on SetUp Animals Form
    DeletingAnimal,           // TRUE if user is attempting to delete an animal
    CalvingAnimal,            // TRUE if user is attempting to Calve an animal
    ReTaggingAnimal,            // TRUE if user is attempting to ReTag an animal
    IsItPreSale,
    RunReIndex : Boolean;
    CalvingBirthType,
    DeadCalves,
    Mortality,
    OrigBull,        // Used for Calving to store the Bull used for the last service
    LastBull : Integer;   // Used for Calving to Identify Last Bull Used;
    CustomerDeathID : Integer; // Used for calving to identify a burial place
    DonorDamID : integer;  // saves genetic dam id if used
    DefaultNatIdMaskIndex : Integer;
    DefaultNatIDMask : String;
    DefaultSaleDeathEventDate,
    DefaultPurchEventDate : TDate;
    OriginalSex,
    DefaultSex,
    DefaultComment,
    DefaultGrade     : String;

    DataForAccounts : Boolean;//From Accounts On Click Initiate Livestock Inventory
    DefaultDOB       : TDateTime;
    DefaultSupplierCost,
    DefaultBuyerCost    : Double;
    DefaultCustomer,
    DefaultBuyer,
    DefaultSupplier,
    DefaultBreed,
    DefaultColour,
    DefaultHerd : Integer;

    DefaultCalfGroup : Integer;

    // purchase unit default values 14/3/00 - kr
    pPriceDef   : currency;
    pWeightDef  : Integer;
    pCommentDef,
    pGroupDef   : string;
    pDefNOTHeld : Boolean;

    // sale/death unit default values 16/3/00 - kr
    sPriceDef   : currency;
    sWeightDef  : Integer;
    sCommentDef,
    sGroupDef   : string;
    sDefNOTHeld : Boolean;

    // InterHerd unit default values 22/3/00 - kr
    iNewHerd    : Integer;
    iMoved      : TDate;
    iRemark     : String;
    iDefNOTHeld : Boolean;

    // bovine audit report - 10/8/00  kr
    NoSales,
    NoPurch : Boolean;

    EventType : TEventType;
    DrugUsed  : Integer;
    OrigDrug  : Integer;
    PurchUnitUsed,
    OrigQty,
    DrugCost,
    DrugQtyUsed : Double;
    // Stores the Currents Herd PreFix for Calving events
    HerdPreFix   : String;
    // Type of Herd selected by user - Value is set by the UserDefaultHerdID property
    UserTypeOfHerd : String;

    // Tips Defaults
    DefaultTips : TStrings;

    //AnimalFileByIDBeforePost procedure, with this set to true Breed is not required.
    BreedRequired : Boolean;

    // ICBF Event Deletion Variables
    ICBFID,
    ICBFHerdID, // SP 10/1/2002 Store Herd ID ICBF
    ICBFType : Integer;
    ICBFDate : TDateTime;

    // MoorePark 27/03/02
    MPID,
    MPHerdID,
    MPType : Integer;
    MPDate : TDateTime;


    // icbf newid event variables
    IDEvent : Boolean;
    NewIDValue,
    OldIDValue : String;
    UpdatingToEuro : Boolean;

    dSuckHerdID,
    dSuckApplicID : Integer;
    dSuckApplicDate,
    dRetensionDate : TDateTime;
    dLactNo        : Integer;

    UnderRentention : Boolean;
    // New ICBF Modified boolean 14/01/2002
    // Changed to reflect changes to MoorePark, drop ICBF leave a ModifiyingEvent
    ModifyingEvent : Boolean;

    // Use as part of uKImport.
    MassSalesUpdate : Boolean;
    CustEligForSlght : Boolean;

    // Milk Recording Update
    ICBFMilkRec : Boolean;

    CallProg : TCallPrograms; // SP 31/03/2003

//    ServiceDefaults : TServiceRecordDefaults;
    ShowDOBMessage : Boolean;
    GlobalSettings : TGlobalSettings;

    CalvingRecords : array [1..4] of PCalvingsRecord;
    SaleDeathRecord : PSaleDeathRecord;

    ExportToPDA : Boolean;
//    PDALinkReportInfo : TPDALinkReportInfo;
    PDALinkExport : TPDALink;
    GroupUpdate : TGroupUpdate;

    PurchaseGroupImport : Boolean;

    CaprineTag : TCaprineTag;


    MDGridPurchData, MDGridSaleData, MDGridFeedData : TdxMemData;

    FEventDataHelper : TEventDataHelper;
    FBreedingDataHelper : TBreedingDataHelper;

    EventDataTransfer : TEventDataTransfer;

    FDBOpenRetryCount : Integer;

    CanShowStandardReportHint : Boolean;

    ShowCalfRegReminder : Boolean;
    FullTermCalving : Boolean;

    DeadCalfNatIDValue : String;
    RollBackTag, NatIDGenerated : Boolean;

    function CheckEventExists(AID, ALact, AEventType : Integer) : Boolean;overload;
    function CheckEventExists(AID, AEventType : Integer; AEventDate : TDateTime): Boolean;overload;
    function RemovePassBlanks(RemStr: array of Byte): String;
    // Check the Groups table to see what groups are selected
    function AreGroupsSelected ( var GroupIDS : String ) : Boolean;
//    function DataSetApplyUpdates(DataSet: TDataSet; Apply: Boolean): Boolean;
    function DataSetApplyUpdates(DataSet: TDataSet; Apply : Boolean;
         DisplayUserPrompt : Boolean = True): Boolean;
    function GetProjCalving ( AnimalToSeek, LactNo : Integer; var NoOfCalves : Integer;
                                                              var IsPregnant : String ) : TDateTime;
    // Get the No of Months after DOB for Elibability or
    // Get the No of Days After Application you must retain the Animal
    function GetNoMonthsOrDaysForPrem( TypesTable : TTable; MonthsOrDays : TMonthsOrDays; PremType : TPremType ) : Integer;
    // Procedure to strip all leading and trailing Spaces from a string
    function StripSpaces( StrToStrip : String) : String;
    // Procedure to strip all Spaces from a string
    function StripAllSpaces( StrToStrip : String) : String;
    function StripAllNomNumAlpha( StrToStrip : String) : String;

    // 08/07/10 [V4.0 R4.0] /MK Additional Feature - Strip All But Numbers From String
    function StripAllAlphaButNum( StrToStrip : String) : String;

    function ReplaceAllNomNumAlphaWithSpace( StrToStrip : String) : String;
    // Function to build the National ID Number
    function CheckNatID( NatIDStr : String; var NewId : String; FromReport : Boolean ) : Boolean;
    function CheckHerdID( HerdIDStr : String; var NewHerdId : String ) : Boolean;
    function WhatStyleNatID( NatIDStr : String; RemoveAll : Boolean ) : TNatIDStyle;
//    function CreateExtTable : Boolean; Moved to update.dll 03/03/2003
    // SP, to prevent user editing Sale/Death event from the Sale/Death Icon in MenuUnit. requested by "GL"
    function HasSaleDeath(AnimalID, HerdID: Integer): Boolean;
    // Special function to Update the Milk recordings Cumulative file to the
    // Last Largest Milk disk transactions for the PAST lactations.
    function UpdateMilkDiskRecords : Boolean;
    function SetButtonColour : TColor;    // Set the TEXT colour based on Nat ID Mask
    function InsertZeros ( OrigStr : String; NewSize : Integer ) : String;
    function GetRetensionDate(ApplicDate: TDateTime; PremTypes : TTable) : TDateTime;
    // tries to link Calves to Dams using DOB and DAmID in
    // in Animals.DB
    // Procedure to Add and Check the 10/22 & Bull Premiums
    function GetHerdCountry ( OwnerF : TTable; HerdID : String ) : TCountry;
    function CheckPremiumEligibility : Boolean;
    function CheckSlaughterEligibility : Boolean;
    function ActiveMovements ( AnimalID, HerdID : Integer; ANo, NatIdNo : String;
       MoveToRecord : Boolean; AllowUserChange : Boolean = True ) : Boolean;
    function ReLinkCalvesToDams(CalledFromDairyData : Boolean) : Boolean;
    function EuroUpdate : Boolean;
    function OkToConvertToEuro : Boolean;
    function CheckIfInGroup(AID: Integer; GType: String; const ShowConfirmMsg : Boolean = True): Boolean;
    function PremiumFix : Boolean;
    function UpdateSuckPremTable : Boolean;
    function IsAnimalUnderRetention(AID : Integer; EDate : TDateTime) : Boolean;
    function KRound(Value : Double) : Double;
    function RoundUp(Value : Double) : Double;
    function CheckRetentionMsg : Boolean;
    function CheckBreedTable : Boolean;
    function HerdType : String;
    function HerdSpecies(AHerdID : Integer = -1) : String;
    function DefCountry(HerdID : Integer) : TCountry; // SP
    function CustomerEligSlght(CustID : Integer) : Boolean;
    function CheckSlaughter(AID : Integer; DateOfBirth : TDateTime; SaleDate : TDateTime): Boolean;
    function GetAccsCompany(const HerdID : Byte) : String;
    function SuckApplicApplied(HerdID, Year : Integer) : Boolean;
    function ParlourFileExists : Boolean;
    function SortByCheckDigit(NatID : String) : String;
    function GetCurrentYear : Integer;
    function CreateTQuery(var GenQuery : TQuery; const FOwner : TComponent = nil; const DBName : String = '') : Boolean;
    function CreateTTable(var GenTable : TTable; FOwner : TComponent;
                              const DBName : string = ''; const TblName : String = '') : Boolean;
    function NISystem : Boolean;
    function SystemRegisteredCountry: TCountry;

    function IsNINatID(sNatID : String) : Boolean;
    procedure CreateAndShowForm ( const WhichForm : TFormClass );

    // procedure CalcCostAndQtyUsed;
    procedure CalcCostAndQtyUsed(ThisDrugUsed : Integer;
                                 ThisRateOfApplic : Double;
                                 HealthT : TDataSet);
    function CalcDrugCost(const ThisDrugUsed : Integer;
       const ThisRateOfApplic : Double; const NoOfDoses : Integer = 1) : Double;
    procedure ReportNotAvailable;
    procedure OptionNotAvailable;
    procedure InsertPremium ( Sender : TObject; PremType : TPremType; StillToApply, UsingButton : Boolean;
                              EligDate, ApplicDate : TEdit; AnimalsTable : TDataSet; const Show2005MsgDlg : Boolean);
    procedure OpenAndCheckTables;
    procedure HTMLHelp(Context: String);
    procedure SetEventsToEdit;
    procedure CheckSysUser;
    procedure UpdateMedicine (MedicineID : LongInt; MedicineRate, NewCost : Double );
    procedure CallPrintDialog(ThisRpt :TCustomQuickRep);
    procedure IncDecAnimalsApplied(DoWhat : Integer);
    procedure ReIndex(TblName,MyIndex,MyField: String; MyOptions: TIndexOptions);
    procedure AddToGroup(AID: Integer; GroupID: Integer; AllowDeletion: Boolean;
              const DateJoined : TDateTime; gType : String; ATagNo : String;
              const ShowConfirmMsg : Boolean = True );
    procedure CreateParlourEvents;
    procedure CreatePDAEvents(const ADisplayMsgIfNoEvents : Boolean);
    procedure CreatePhoneLinkEvents;
    procedure EuroCheck;
    procedure MenuItemClick(Sender: TObject; pmMenu : TPopupMenu);
    function HerdHasIHMs(HerdID : Integer) : Boolean;

    function  GetSeqNo(HerdID:Integer) : Integer; // Made public for Adding Ped Animals
    function  IncreaseSeqNo(HerdID:Integer) : Boolean; // Made public for Adding Ped Animals
    procedure SavePreferences;
    procedure LoadBtnImage(Glyph : TBitMap; Index : Integer);
    procedure SaveNokiaIniSettings(ComNumber, NokiaConnectionType : Byte);
    procedure LoadNokiaIniSettings(var ComNumber, NokiaConnectionType : Byte);
    procedure CreateNokiaIniSettings;
    procedure SQLEmptyTable(TblName : String);
    function CheckAnimalNoInUse(const AnimalNo: String; const HerdId: Integer): TAnimalCheck;
    // Return the HerdType of (Arg HerdID)
    function GetProjCalvingInfo(const AnimalID, LactNo : Integer) : TCalvingInfo;

    function IrishSystem : Boolean;
    procedure CalcCalvingDate(const AID, LactNo, PlannedBull : integer; TestDate : TDateTime;
                              var ProjCalvingDate : TDateTime; var CalvIndex : Integer );

    function GetDryDate(const AID, LactNo : Integer) : TDateTime;

    procedure LastServiceDetails(const AID, LactNo : Integer; var EventDate : TDateTime;
                                 var BullUsed, ServiceType, NoStraws, GenDam : Integer);
    procedure HandleException(E : Exception; const Dataset : TBDEDataset = nil);
    procedure ClearEventFilter;
    function LUValue(const AnimalID : Integer) : double;
    procedure GetPurchaseEventDetails(const AID : Integer; var PurchaseRecord : PPurchaseRecord);
    procedure GetWeighingEventDetails(const AID, LactNo : Integer; var WeighingRecord : PWeighingRecord);
    procedure LookupTablesActive(const Open : Boolean; const Tables : array of TTable);
    procedure GetGroupAnimals(const GrpID : Integer; var AList : TList);
    function SortByNatIDByFarmNo(const NatID : string) : string;
    function CheckNINatID(const sNatID : String; var FormattedNatID : String;
       FormatWithPaddedZeros : Boolean = False) : Boolean;
    function ValidNITagNo(TagNo : string) : Boolean;
    function OpenTable(ATable : TTable; CachedUpdateMode : Boolean = False) : Boolean;
    procedure CreateRestorePoint;


//    function PDALinkExportReport(QR : TQuickRep) : Boolean;

//    function CreateSortNatIDString( const NatID : string; const AHerdID : Integer = 0 ) : String;
    function NextAnimalID : Integer;
    function NextEventID : Integer;

    function EventsRecorded(const AID : Integer) : Boolean;

    function CreateYoungStockEBIValues(const HerdID : Integer) : Integer; // return number of update young stock

    function CheckCMMSAllocation(APermitType : TNBASPermits) : Boolean;
    function CheckDealerHerd(const AHerdID : Integer) : Boolean;

    function CheckNatIDNumInHerd(const ANatIDNum : string; const AHerdID : Integer) : TCheckNationalIDRecord;

    procedure CheckAISireRegister;

    function ActivePDAEvents(const IsTopMost : Boolean = True) : Boolean;

    function CalcDrugWithdrawalDate(const AStartDate : TDateTime;
       const AWithdrawalDays : Integer; const ANoDays : Integer = 1) : TDateTime;

    function SortAnimalNoString(InStr : string) : string;

    function PedigreeNamePrefix(const HerdID : Integer) : String;
    procedure GetDefaultPDDataFromLastService(var DaysInCalf, Pregnant : Variant);

    function HerdInUse(const AHerdID : Integer) : Boolean;

    function HerdType_DairyID : Integer;
    function HerdType_BeefID : Integer;
    function HerdType_SucklerID : Integer;

    function SpeciesByID(const SID : Integer) : String;

    function GetCrossBreed( ABreedID : Integer ) : Integer; // SP 05/12/2006
    function GetBreedID( ABreedCode : string ) : Integer;overload;
    function GetBreedCodeByPedigreeBreed( APedigreeCode : TPedigreeBreedCode ) : string;

    function ClearPostivePregDiag( const AAnimalID, ALactNo : Integer;
       const AServiceDate : TDateTime) : Boolean;

    function HerdIdentifierByHerdID(AHerdID : Integer) : String;
    function HerdIDByAnimalID(AAnimalID : Integer) : Integer;

    procedure QueryICBFRegistrations;

    function QueryNoOfWeanings(const ADateOfWeaning : TDateTime) : Integer;
    function CastrationQueryWeaning(const AAnimalID : Integer; ACastrationDate : TDateTime;
       var AWeaningDate : TDateTime) : Boolean;
    function WeaningQueryCastration(const AAnimalID : Integer; AWeaningDate : TDateTime;
       var ACastrationDate : TDateTime) : Boolean;
    function MealFeedingQueryWeaning(const AAnimalID : Integer; AMealFeedingDate : TDateTime;
       var AWeaningDate : TDateTime) : Boolean;
    function WeaningQueryMealFeeding(const AAnimalID : Integer; AWeaningDate : TDateTime;
       var AMealFeedingDate : TDateTime) : Boolean;


    function CreateCowFertilityRecord(AID : Integer) : Boolean;
    function UpdateCowFertilityCulledStatus(AID : Integer; const Culled : Boolean; const ACullingDate : TDateTime = 0 ) : Boolean;

    function ETCalving(AAnimalID, ALactNo : Integer) : Boolean;

    procedure ReIndexCalvings;

    procedure GetEventLookupData(AOpen : Boolean);

    procedure AddToEventLookupData(AAnimalID : Integer; AEventType : Integer);
    procedure RemoveFromEventLookupData(AAnimalID : Integer; AEventType : Integer);

    procedure ViewMailBox;
    function DownloadEmailAttachments : Integer;
    procedure EditMailboxSettings;

    procedure RefreshDamSireLookupTable(ASires : Boolean);

    // Extract Herd Identifier from National Id Mask
    function GetNatIDNumHerdIdentifier(AHerdID : Integer) : string;

    procedure CheckInBreeding(AServingAnimal : string; ABullID, ADamID, ASireID : Integer);

    // Check an Animalno doesn't exist on the Animal File
    // I = National ID, N = AnimalNo, H - HerdBookNo

    function CheckForAnimal(AnimalNo : String; NoORID : Char ) : TAnimalCheck;

    function EventDataHelper : TEventDataHelper;
    function BreedingDataHelper : TBreedingDataHelper;

    procedure NotifiyMovementsToHUK(AnimalData: array of Integer);

    procedure MoveIDsToAFilter;

    function ICBF_NormalBirthType_ID : Integer;
    function AdvisoryRoleActive : Boolean;

    function GetInMemoryDataset(const ADatabaseName, AQuery : String) : TdxMemData;
    procedure SendSimpleEmail(AToAddress, ACCAddress, ASubject, ABody : string);

    procedure CallHintStyle;

    procedure RollbackTagAutoGenNumber;

    function CreateAbortedTag(ADamNatID : String) : String;

    property ReportInEuro : Boolean read GetReportInEuro write SetReportInEuro;
    property ICBFMMR : Boolean read GetICBFMMR write SetICBFMMR;
    // Store Dir which MilkRec files are stored.
    property MilkRecDir : String read GetMilkRecDir write SetMilkRecDir;
    // Hold the Status of the Event
    property EventStatus : TEventStatus read GetEventStatus write SetEventStatus;
    // Used to Get the Country from the Default table and MilkLayout Table
    property DefaultCountry : String Read GetDefaultCountry;
    // Get the NONE HERD id or create a nw record on the Owner File
    property NONEHerdID : LongInt Read GetNONEHerdID;
    // property DefaultHerdID : LongInt Read GetHerdID;
    // Get the Last System User From the Defaults File
    property DefaultSysUser : Integer read GetDefaultSysUser write SetDefaultSysUser;
    // Check the LASt Backup Date
    property LastBackUpDate : TDateTime Read GetLastBackUpDate write SetLastBackUpDate;
    property LastRestoreDate : TDateTime read GetLastRestoreDate write SetLastRestoreDate;
    // Try to determine the HERD type
    property UserDefaultHerdID : LongInt Read GetUserHerdID write SetUserHerdID;

    // Try to determine the Register country of Default HERD
    property UserDefaultHerdCountry : TCountry read GetUserDefaultHerdCountry;

    // Used to set the Show all animal Check box on MenuUnit
    property ShowAllAnimals : Boolean Read GetShowAllAnimals write SetShowAllAnimals;
    // Used to see if user wants to use the Mass Updater
    property MassUpdates : Boolean Read GetMassUpdates write SetMassUpdates;
    // Used to set the Livestock Unit Equivalent Factors in the Livestock Summary Report

    property LUEF0to6mths : Double Read GetLUEF0to6mths write SetLUEF0to6mths;
    property LUEF6to12mths : Double Read GetLUEF6to12mths write SetLUEF6to12mths;
    property LUEF1to2yrs : Double Read GetLUEF1to2yrs write SetLUEF1to2yrs;
    property LUEF2plusyrs : Double Read GetLUEF2plusyrs write SetLUEF2plusyrs;
    property LUEF2plusyrsCows : Double Read GetLUEF2plusyrsCows write SetLUEF2plusyrsCows;
    property LUEFSucklerCows : Double Read GetLUEFSucklerCows write SetLUEFSucklerCows;
    property OpenTables : Boolean Read OpenAllTables; // Try to Open all the tables
    property HasInterHerd : Boolean read GetHasInterHerd; // determine if the Animal has a Inter Herd Transfer
    property NoInGroup : Integer read GetNoInGroup; // Get the No of Animals in the Current Group
    property Selected  : Integer read GetSelected;  // 14/8/00 - kr
    property SearchField : String read GetSearchField write SetSearchField; // Get The Field to search on NatIdNum or AnimalNo stored in the Owners table
    property ActiveFilter : Boolean read GetActiveFilter write SetActiveFilter; // Get The Field Active Filter From the Defaults
    property UseScanner : Boolean Read GetUseScanner write SetUseScanner; // Used to see if user wants to use a bar code reader
    property ShowHints : Boolean Read GetShowHints write SetShowHints; // Used to see if user wants to see hints
    property UseEuro : Boolean Read GetUseEuro write SetUseEuro; // Currency to Use
    property LastEventFUpdate : TDateTime Read GetLastEventFUpdate write SetLastEventFUpdate;
    property VATRate : Double Read GetVAT write SetVAT;
    property HerdIdentifier : String read GetHerdIdentifier;
    property DefaultAccsCompany : String read GetDefAccsCompany write SetDefAccsCompany;
    property SearchPhoneLink : Boolean read GetSearchPhoneLink write SetSearchPhoneLink; // 01/10/2002
    property PhoneLinkType : SmallInt read GetPhoneLinkType write SetPhoneLinkType;
    property LastVersionUpdate : TDateTime read GetLastVersionUpdate write SetLastVersionUpdate;
    property SlghtTopupAmount : Double read GetSlghtTopupAmount write SetSlghtTopupAmount;
    property SlghtAmount : Double read GetSlghtAmount write SetSlghtAmount;
    property SuckAmount : Double read GetSuckAmount write SetSuckAmount;
    property SuckTopupAmount : Double read GetSuckTopupAmount write SetSuckTopupAmount;
    property BullAmount : Double read GetBullAmount write SetBullAmount;
    property FirstAmount : Double read GetFirstAmount write SetFirstAmount;
    property SecondAmount : Double read GetSecondAmount write SetSecondAmount;
    property PremiumYear : Integer read FPremiumYear write SetPremiumYear; // Set the year to locate in PremiaDefaults.
    property FieldsRepsVerNo: Integer read GetFieldsRepsVerNo write SetFieldsRepsVerNo;
    property HerdDBPassword : String read GetHerdDBPassword write setHerdDBPassword;
    property DisplayNews : Boolean read GetDisplayNews write SetDisplayNews;
    property ICBFMatchField : string read GetICBFMatchField write SetICBFMatchField;
    property NewCustomerAttributes : TCustomerAttributes read FNewCustomerAttributes write FNewCustomerAttributes;
    property GoatTagFormat : string read GetGoatTagFormat write SetGoatTagFormat;
//    property DefaultAccsCompany : string read GetDefaultAccsCompany write SetDefaultAccsCompany;
    property DefaultHerdID : Integer read GetDefaultHerdID;
    { Forage Area (Ha): (Excludes cereal, oilseed, and protein crops) }
    property ForageArea : Double read GetForageArea;
    property CMMSDataStartUpDate : TDateTime read GetCMMSDataStartUpDate write SetCMMSDataStartUpDate;
    property DefaultHerdIdentifierMask : string read GetDefaultHerdIdentifierMask;
    property DefaultNatIDMaskFromHerdIdentifierMask : string read GetDefaultNatIDMaskFromHerdIdentifierMask;
    property NewOtherID : LongInt Read GetOtherID;
    property DefaultEmailClient : string read GetDefaultEmailClient Write SetDefaultEmailClient;
    property BeefAISireFileName : string read GetBeefAISireFileName Write SetBeefAISireFileName;
    property CurrentDBVersion : Integer read GetCurrentDBVersion;
    property KingswdDatabaseName : string read GetKingswdDatabaseName;


end;


const
   GenLookUpType : TGenLookUpType = TNone;
   // N.I.
   cFirstNIDrawn  = '1st premium drawn';
   cSecondNIDrawn = '2nd premium drawn';
   cBullNIDrawn   = 'Bull premium drawn';
   cFirstNIElig   = 'Eligible for 1st premium';
   cSecondNIElig  = 'Eligible for 2nd premium';
   cBullNIElig    = 'Eligible for Bull premium';
   // ROI
   cFirstDrawn  = 'First Age (9 Month) drawn';
   cSecondDrawn = 'Second Age (21 Month) drawn';
   cBullDrawn   = 'Bull Premium drawn';
   cFirstElig   = 'Eligible for First Age prem.';
   cSecondElig  = 'Eligible for Second Age prem.';
   cBullElig    = 'Eligible for Bull premium';

   cCannotCalcEligNoDOB = 'Cannot Calculate Eligibility Date' + #13 + 'No Date of Birth for this Animal';

   cCustNameInsert  = 'Please make sure the Customer Name is correct before saving - You cannot change the Name after saving';
   cCustNameEdit    = 'You cannot change the Customer Name';
   cSuppNameInsert  = 'Please make sure the Supplier Name is correct before saving - You cannot change the Name after saving';
   cSuppNameEdit    = 'You cannot change the Supplier Name';
   cBreedCodeInsert = 'Please make sure the Breed Code is correct before saving - You cannot change the Breed Code after saving';
   cBreedCodeEdit   = 'You cannot change the Breed Code';

var
  WinData: TWinData;

implementation

uses
    BDE,
    uRemarks,
    uSetUpUsers,
    uIndexes,
    Buttons,
    uUnDelete,
    ComCtrls,
    extctrls,
    Def,
    Splash,
    ShellAPI,
    igHHInt,
    MenuUnit,
    uFilters,
    uCalfRegFlt,
    SetupAnimals,
    uPedAddAmend,
    uSalesDeaths,
    uDataBackup,
    uCreateEvents,
    EventRecording,
    uUpdateTables,
    HerdPassword,
    IniFiles,
    KDBRoutines,
    Password,
    ActiveX,
    uHerdLookup,
    BDEUtils,
    uNBASVenNoUpdate,
    uProgressIndicator,
    uPhoneLinkEventsReview, uCrush, uCrushHelper, uHerdSetUp,
  uICBFEventExport, uMailBoxHelper, SQLHelper, uPreferences,
  uAnimalEventTransfer, uPrinters, uKingswoodController, uConnect;


{$R *.DFM}


// changed for D5 - kr 2/10/00
//procedure TWinData.CallPrintDialog(ThisRpt :TQuickRep);
procedure TWinData.CallPrintDialog(ThisRpt :TCustomQuickRep);
var OVI : TOsVersionInfo;
begin
   OVI.dwOSVersionInfoSize := SizeOf(OVI);
   GetVersionEx(OVI);
 //  if (OVI.dwMajorVersion=4) And ( OVI.dwMinorVersion=10) then
    //  begin
         ThisRpt.Prepare;
         PrintDialog1.FromPage := 1;
         PrintDialog1.ToPage := ThisRpt.PageNumber;
         PrintDialog1.Copies := 1;
         if PrintDialog1.Execute then
            begin
               ThisRpt.PrinterSettings.FirstPage := PrintDialog1.FromPage;
               ThisRpt.PrinterSettings.LastPage := PrintDialog1.ToPage;
               ThisRpt.PrinterSettings.Copies := PrintDialog1.Copies;
               ThisRpt.Print;
            end;
    //  end
  // else
    //  ThisRpt.Print;
end;

procedure TWinData.HTMLHelp(Context: String);
var
   HF: string;
begin
   try
      // get & assign current directory as file path
      SetCurrentDir(ExtractFilePath(ParamStr(0)));
      HF := ExtractFilePath(ParamStr(0))+'HerdHelp.chm';
      if FileExists(HF) then
         begin
            if (Application.HelpFile <> HF) then
               begin
                  HelpSocket.CloseAll;
                  Application.HelpFile := HF;
               end;
            HelpSocket.HTMLHelpCommand(HH_DISPLAY_TOPIC,LongInt(PChar(Context)));
            // try open page, else open contents
            if (HelpSocket.HHShowTopicByName(Context,False)=0) then
               ShellExecute(Application.Handle,'Open',PChar(HF),nil,nil,SW_SHOWMAXIMIZED);
         end;
   except
      MessageDlg('Error Executing Help Function. Contact Kingswood.',mtConfirmation,[mbOK],0);
   end;
end;

function TWinData.AreGroupsSelected(var GroupIDS: String): Boolean;
var
   FirstOne : Boolean;
begin
   with GenQuery do
      begin
         GroupIDS := '';
         Result := FALSE;
         FirstOne := TRUE;
         SQL.Clear;
         SQL.Add('SELECT Id FROM Grps WHERE Selected = TRUE');
         Open;
         if NOT IsEmpty then
            begin
               while NOT EOF do
                  begin
                     if FirstOne then
                        begin
                           GroupIDS := '(';
                           GroupIDS := GroupIDS + FieldByName('ID').AsString;
                           FirstOne := FALSE;
                        end
                     else
                        GroupIDS := GroupIDS + ',' + FieldByName('ID').AsString;
                     Next;
                  end;
               GroupIDS := GroupIDS + ')';
               Result := TRUE;
            end;
      end;
end;

function TWinData.MakeGroupTables : Boolean;
Var
   GroupQuery  : TQuery;
begin
   GroupQuery := TQuery.Create(nil);
   try
      GroupQuery.DatabaseName := KingData.DatabaseName;
      try
         with GroupQuery do
            begin
               SQL.Clear;
               SQL.Add('CREATE TABLE "Grps.db"');
      	      SQL.Add('(');
	            SQL.Add(' ID          AUTOINC,');
      	      SQL.Add(' GroupType   CHAR(20),');
	            SQL.Add(' Code        CHAR(6),');
     	         SQL.Add(' Description CHAR(30),');
	            SQL.Add(' Selected    BOOLEAN,');
               SQL.Add(' PRIMARY KEY(ID,GroupType)');
               SQL.Add(')');
               ExecSQL; // Create the TABLE
            end;
      except
         //
      end;
      try
         with GroupQuery do
            begin
               SQL.Clear;
               SQL.Add('CREATE TABLE "GrpLinks.db"');
       	      SQL.Add('(');
	            SQL.Add(' GroupID     INTEGER,');
      	      SQL.Add(' AnimalID    INTEGER,');
	            SQL.Add(' DateJoined  DATE,');
               SQL.Add(' PRIMARY KEY(GroupID,AnimalID)');
               SQL.Add(')');
               ExecSQL; // Create the TABLE
            end;
      except
         //
      end;
   finally
      if GroupQuery <> nil then
         begin
            GroupQuery.Close;
            GroupQuery.Free;
         end;
      Result := TRUE;
   end;
end;

{procedure TWinData.MakeSlghtApplic;
Var
   SlghtQuery : TQuery;
begin
   try
      SlghtQuery := TQuery.Create(nil);
      SlghtQuery.DatabaseName := KingData.DatabaseName;
      with SlghtQuery do
         begin
            SQL.Add('CREATE TABLE "SlghtApplic.db"');
      	   SQL.Add('(');
     	      SQL.Add(' ID AUTOINC,');
	         SQL.Add(' DateOfApplic DATE,');
     	      SQL.Add(' YearOfApplic INTEGER,');
	         SQL.Add(' HerdID INTEGER,');
     	      SQL.Add(' Description CHAR(30),');
            SQL.Add(' PRIMARY KEY(ID)');
            SQL.Add(')');
            ExecSQL; // Create the TABLE
         end;
   finally
      SlghtQuery.Close;
      SlghtQuery.Free;
   end;
end;
}
{
procedure TWinData.MakeSlghtAppliedFor;
Var
   SlghtQuery : TQuery;
begin
   try
      SlghtQuery := TQuery.Create(nil);
      SlghtQuery.DatabaseName := KingData.DatabaseName;
      with SlghtQuery do
         begin
            SQL.Add('CREATE TABLE "SlghtAppliedFor.db"');
       	   SQL.Add('(');
      	   SQL.Add(' ID AUTOINC,');
	         SQL.Add(' ApplicationID INTEGER,');
      	   SQL.Add(' AnimalID INTEGER,');
            SQL.Add(' PRIMARY KEY(ID,ApplicationID,AnimalID)');
            SQL.Add(')');
            ExecSQL; // Create the TABLE
         end;
   finally
      SlghtQuery.Close;
      SlghtQuery.Free;
   end;
end;
}
function TWinData.GetLastBackUpDate : TDateTime;
begin
   Result := Date;
   // open and read the Last BackUp Date
   with Defaults do
      begin
         Open;
         try
            if RecordCount > 0 then
               ReSult := FieldByName('LastBackUp').AsDateTime;
         finally
            Close;
         end;
      end;
end;

procedure TWinData.SetLastBackUpDate ( ThisDate : TDateTime );
begin
   // Set the Last Date a Backup was taken
   with Defaults do
      begin
        Open;
        try
           if RecordCount > 0 then
              begin
                 Edit;
                 FieldByName('LastBackUp').AsDateTime := ThisDate;
                 Post;
              end;
         finally
           Close;
         end;
         DbiSaveChanges(Defaults.Handle);
      end;
end;

function TWinData.GetUseScanner: Boolean;
begin
   Result := GlobalSettings.UseBarcodeScanner;
{   // Get the UseScanner Boolean.
   try
      with Defaults do
         begin
            Open;
            First;
            Result := FieldByName('UseScanner').AsBoolean;
         end;
   finally
      Defaults.Close;
   end;}
end;

procedure TWinData.SetUseScanner(Value: Boolean);
begin
   // Set the UseScanner Boolean
   GlobalSettings.UseBarcodeScanner := Value;
   SavePreferences;
{   try
      with Defaults do
         begin
            Open;
            First;
            if EOF then
               begin
                  Insert;
                  FieldByName('UseScanner').AsBoolean := Value;
               end
            else
               begin
                  Edit;
                  FieldByName('UseScanner').AsBoolean := Value;
               end;
            Post;
         end;}
         if Value then
            SearchField := 'NatIDNum';
{   finally
      Defaults.Close;
   end;}
end;

function TWinData.GetShowHints: Boolean;
begin
   // Get the ShowHints Boolean.
   try
      with Defaults do
         begin
            Open;
            First;
            Result := FieldByName('ShowHints').AsBoolean;
         end;
      Application.ShowHint := Result;
   finally
      Defaults.Close;
   end;
end;

procedure TWinData.SetShowHints(Value: Boolean);
begin
   // Set the ShowHints Boolean
   try
      with Defaults do
         begin
            Open;
            First;
            if EOF then
               begin
                  Insert;
                  FieldByName('ShowHints').AsBoolean := Value;
               end
            else
               begin
                  Edit;
                  FieldByName('ShowHints').AsBoolean := Value;
               end;
            Post;
         end;
   finally
      Application.ShowHint := Value;
      Defaults.Close;
   end;
end;

// Get the Default VAT Rate
function TWinData.GetVAT: Double;
begin
   // Get the VAT Float.
   try
      with Defaults do
         begin
            Open;
            First;
            Result := FieldByName('VAT').AsFloat;
         end;
   finally
      Defaults.Close;
   end;
end;

procedure TWinData.SetVAT(Value: Double);
begin
   // Set the VAT Float
   try
      with Defaults do
         begin
            Open;
            First;
            if EOF then
               begin
                  Insert;
                  FieldByName('VAT').AsFloat := Value;
               end
            else
               begin
                  Edit;
                  FieldByName('VAT').AsFloat := Value;
               end;
            Post;
         end;
   finally
      Defaults.Close;
   end;
end;

function TWinData.GetLUEF0to6mths: Double;
begin
   // Get the LUEF for 0 to 6 mths.
   try
      with Defaults do
         begin
            Open;
            First;
            Result := FieldByName('LUEF0to6mths').AsFloat;
         end;
   finally
      Defaults.Close;
   end;
end;

procedure TWinData.SetLUEF0to6mths(Value: Double);
begin
   // Set the the LUEF for 0 to 6 mths.
   try
      with Defaults do
         begin
            Open;
            First;
            if EOF then
               begin
                  Insert;
                  FieldByName('LUEF0to6mths').AsFloat := Value;
               end
            else
               begin
                  Edit;
                  FieldByName('LUEF0to6mths').AsFloat := Value;
               end;
            Post;
         end;
   finally
      Defaults.Close;
   end;
end;

function TWinData.GetLUEF6to12mths: Double;
begin
   // Get the LUEF for 6 to 12 mths.
   try
      with Defaults do
         begin
            Open;
            First;
            Result := FieldByName('LUEF6to12mths').AsFloat;
         end;
   finally
      Defaults.Close;
   end;
end;

procedure TWinData.SetLUEF6to12mths(Value: Double);
begin
   // Set the the LUEF for 6 to 12 mths.
   try
      with Defaults do
         begin
            Open;
            First;
            if EOF then
               begin
                  Insert;
                  FieldByName('LUEF6to12mths').AsFloat := Value;
               end
            else
               begin
                  Edit;
                  FieldByName('LUEF6to12mths').AsFloat := Value;
               end;
            Post;
         end;
   finally
      Defaults.Close;
   end;
end;

function TWinData.GetLUEF1to2yrs: Double;
begin
   // Get the LUEF for 1 to 2 yrs.
   try
      with Defaults do
         begin
            Open;
            First;
            Result := FieldByName('LUEF1to2yrs').AsFloat;
         end;
   finally
      Defaults.Close;
   end;
end;

procedure TWinData.SetLUEF1to2yrs(Value: Double);
begin
   // Set the the LUEF for 1 to 2 yrs.
   try
      with Defaults do
         begin
            Open;
            First;
            if EOF then
               begin
                  Insert;
                  FieldByName('LUEF1to2yrs').AsFloat := Value;
               end
            else
               begin
                  Edit;
                  FieldByName('LUEF1to2yrs').AsFloat := Value;
               end;
            Post;
         end;
   finally
      Defaults.Close;
   end;
end;

function TWinData.GetLUEF2plusyrs: Double;
begin
   // Get the LUEF for 2 plus yrs.
   try
      with Defaults do
         begin
            Open;
            First;
            Result := FieldByName('LUOver24Mth').AsFloat;
         end;
   finally
      Defaults.Close;
   end;
end;

procedure TWinData.SetLUEF2plusyrs(Value: Double);
begin
   // Set the the LUEF for 2 plus yrs.
   try
      with Defaults do
         begin
            Open;
            First;
            if EOF then
               begin
                  Insert;
                  FieldByName('LUOver24Mth').AsFloat := Value;
               end
            else
               begin
                  Edit;
                  FieldByName('LUOver24Mth').AsFloat := Value;
               end;
            Post;
         end;
   finally
      Defaults.Close;
   end;
end;

function TWinData.GetLUEF2plusyrsCows: Double;
begin
   // Get the LUEF for 2 plus yrs for Cows.
   try
      with Defaults do
         begin
            Open;
            First;
            Result := FieldByName('LUCow').AsFloat;
         end;
   finally
      Defaults.Close;
   end;
end;

procedure TWinData.SetLUEF2plusyrsCows(Value: Double);
begin
   // Set the the LUEF for 2 plus yrs for Cows.
   try
      with Defaults do
         begin
            Open;
            First;
            if EOF then
               begin
                  Insert;
                  FieldByName('LUCow').AsFloat := Value;
               end
            else
               begin
                  Edit;
                  FieldByName('LUCow').AsFloat := Value;
               end;
            Post;
         end;
   finally
      Defaults.Close;
   end;
end;

function TWinData.GetLUEFSucklerCows: Double;
begin
   // Get the LUEF for Suckler Cows - Use Defaults(LUSuckler).
   try
      with Defaults do
         begin
            Open;
            First;
            Result := FieldByName('LUSuckler').AsFloat;
         end;
   finally
      Defaults.Close;
   end;
end;

procedure TWinData.SetLUEFSucklerCows(Value: Double);
begin
   // Set the the LUEF for Suckler Cows - Use Defaults(LUSuckler).
   try
      with Defaults do
         begin
            Open;
            First;
            if EOF then
               begin
                  Insert;
                  FieldByName('LUSuckler').AsFloat := Value;
               end
            else
               begin
                  Edit;
                  FieldByName('LUSuckler').AsFloat := Value;
               end;
            Post;
         end;
   finally
      Defaults.Close;
   end;
end;

function TWinData.GetBullPrem : Double;
begin
   // Get the Bull Premium Amount
   try
      with Defaults do
         begin
            Open;
            First;
            Result := FieldByName('AmtBullPrem').AsFloat;
         end;
   finally
      Defaults.Close;
   end;
end;

procedure TWinData.SetBullPrem ( Value : Double );
begin
   // Set the Bull Premium Amount
   try
      with Defaults do
         begin
            Open;
            First;
            if EOF then
               begin
                  Insert;
                  FieldByName('AmtBullPrem').AsFloat := Value;
               end
            else
               begin
                  Edit;
                  FieldByName('AmtBullPrem').AsFloat := Value;
               end;
            Post;
         end;
   finally
      Defaults.Close;
   end;
end;

function TWinData.Get10MthPrem : Double;
begin
   // Get the 10Mth Premium Amount
   try
      with Defaults do
         begin
            Open;
            First;
            Result := FieldByName('Amt10MthPrem').AsFloat;
         end;
   finally
      Defaults.Close;
   end;
end;

procedure TWinData.Set10MthPrem ( Value : Double );
begin
   // Set the 10Mth Premium Amount
   try
      with Defaults do
         begin
            Open;
            First;
            if EOF then
               begin
                  Insert;
                  FieldByName('Amt10MthPrem').AsFloat := Value;
               end
            else
               begin
                  Edit;
                  FieldByName('Amt10MthPrem').AsFloat := Value;
               end;
            Post;
        end;
   finally
      Defaults.Close;
   end;
end;

function TWinData.Get22MthPrem : Double;
begin
   // Get the 22Mth Premium Amount
   try
      with Defaults do
         begin
            Open;
            First;
            Result := FieldByName('Amt22MthPrem').AsFloat;
         end;
   finally
      Defaults.Close;
   end;
end;

procedure TWinData.Set22MthPrem ( Value : Double );
begin
   // Set the 22Mth Premium Amount
   try
      with Defaults do
         begin
            Open;
            First;
            if EOF then
               begin
                  Insert;
                  FieldByName('Amt22MthPrem').AsFloat := Value;
               end
            else
               begin
                  Edit;
                  FieldByName('Amt22MthPrem').AsFloat := Value;
               end;
            Post;
         end;
   finally
      Defaults.Close;
   end;
end;

function TWinData.GetSlghtPrem : Double;
begin
   // Get the Slght Premium Amount
   try
      with Defaults do
         begin
            Open;
            First;
            Result := FieldByName('AmtSlghtPrem').AsFloat;
         end;
   finally
      Defaults.Close;
   end;
end;

procedure TWinData.SetSlghtPrem ( Value : Double );
begin
   // Set the Slght Premium Amount
   try
      with Defaults do
         begin
            Open;
            First;
            if EOF then
               begin
                  Insert;
                  FieldByName('AmtSlghtPrem').AsFloat := Value;
               end
            else
               begin
                  Edit;
                  FieldByName('AmtSlghtPrem').AsFloat := Value;
               end;
            Post;
         end;
   finally
      Defaults.Close;
   end;
end;

{
function TWinData.GetHeifSlghtPrem : Double;
begin
   // Get the Slght Premium Amount
   try
      with Defaults do
         begin
            Open;
            First;
            Result := FieldByName('HeifSlghtPrem').AsFloat;
         end;
   finally
      Defaults.Close;
   end;
end;


procedure TWinData.SetHeifSlghtPrem ( Value : Double );
begin
   // Set the Slght Premium Amount
   try
      with Defaults do
         begin
            Open;
            First;
            if EOF then
               begin
                  Insert;
                  FieldByName('HeifSlghtPrem').AsFloat := Value;
               end
            else
               begin
                  Edit;
                  FieldByName('HeifSlghtPrem').AsFloat := Value;
               end;
            Post;
         end;
   finally
      Defaults.Close;
   end;
end;
}
function TWinData.GetDefaultSysUser : Integer;
begin
   // open and read the Last User ID
   Result := 0;
   with Defaults do
      begin
        Open;
        try
           if RecordCount > 0 then
              ReSult := FieldByName('CurrUser').AsInteger;
         finally
           Close;
         end;
      end;
end;

procedure TWinData.SetDefaultSysUser ( SetToThis : Integer );
begin
   // open and read the Default Table to Set the Last User
   CurrentUser := SetToThis;
   with Defaults do
      begin
        Open;
        try
           if RecordCount > 0 then
              begin
                 Edit;
                 FieldByName('CurrUser').AsInteger := SetToThis;
                 Post;
              end;
         finally
            Close;
         end;
      end;
end;

function TWinData.GetSearchField : String;
begin
   // open and read the Last User ID
   Result := 'AnimalNo';
   try
      with OwnerFile do
         begin
            if NOT Active then Open;
            // Find the UserDefault
            if Locate('ID',WinData.UserDefaultHerdID,[] ) then
               begin
                  if NOT FieldByName('SearchField').IsNull then
                     Result := FieldByName('SearchField').AsString;
               end
            // they have All Herd Selected - use the NONE herd to store this value
            else if Locate('ID',WinData.NONEHerdID,[] ) then
               begin
                  if NOT FieldByName('SearchField').IsNull then
                     Result := FieldByName('SearchField').AsString;
               end;
         end;
   finally
      //
   end;
end;

procedure TWinData.SetSearchField ( Value : String );
Var
   OFile : TTable;
begin
   OFile := TTable.Create(nil);
   OFile.DatabaseName := KingData.DatabaseName;
   OFile.TableName := OwnerFile.TableName;
   try
      OFile.Open;
      with OFile do
         begin
            // Find the UserDefault
            if Locate('ID',WinData.UserDefaultHerdID,[] ) then
               begin
                  Edit;
                  FieldByName('SearchField').AsString := Value;
                  Post;
               end
            // they have All Herd Selected - use the NONE herd to store this value
            else if Locate('ID',WinData.NONEHerdID,[] ) then
               begin
                  Edit;
                  FieldByName('SearchField').AsString := Value;
                  Post;
               end;
         end;
   finally
      if OFile <> nil then
         begin
            OFile.Close;
            OFile.Free;
         end;
   end;
end;

// Beginning of property ActiveFilter
function TWinData.GetActiveFilter : Boolean;
begin
   // open and read the Last User ID
   Result := FALSE;
   with Defaults do
      begin
        try
           Open;
           // Find the Activefilter
           if RecordCount > 0 then
              ReSult := FieldByName('ActiveFilter').AsBoolean;
        finally
           Close;
        end;
      end;
end;

procedure TWinData.SetActiveFilter ( Value : Boolean );
begin
   with Defaults do
      begin
         try
            Open;
            // Set the Active Filter property
            if ( RecordCount > 0 ) then
               begin
                  Edit;
                  FieldByName('ActiveFilter').AsBoolean := Value;
                  Post;
               end;
         finally
            Close;
         end;
      end;
end;
// end of property ActiveFilter

function TWinData.GetEventStatus : TEventStatus;
begin
   ReSult := EStatus;
end;

procedure TWinData.SetEventStatus ( NewStatus : TEventStatus );
begin
   EStatus := NewStatus;
end;

function TWinData.GetDefaultCountry : String;
begin
   // open and read the Default Table to get the MilkLayout Parameter
   with Defaults do
      begin
         Open;
         try
            if RecordCount > 0 then
               begin
                  First;
                  MilkDiskLayout.Open;
                  if MilkDiskLayout.Locate('ID',FieldByName('MilkLayout').AsInteger,[] ) then
                     Result := UPPERCASE ( MilkDiskLayout.FieldByName('Country').Value )
                  else
                     Result := 'I';  // R.O.Ireland.
               end;
         finally
            MilkDiskLayout.Close;
            Close;
         end;
      end;
end;

function TWinData.GetHerdCountry ( OwnerF : TTable; HerdID : String ) : TCountry;
begin
   // open and read the Default Table to get the MilkLayout Parameter
   with OwnerF do
      begin
         qCountries.Open;
         Result := Ireland;
         if Length ( HerdID ) > 0 then
            if HerdID <> '0' then
               if Locate('ID',HerdID,[] ) then
                  if qCountries.Locate('ID',FieldByName('Country').AsInteger,[] ) then
                     begin
                        if UpperCase(qCountries.FieldByName('Name').AsString) = 'IRELAND' then
                           Result := Ireland
                        else if UpperCase(qCountries.FieldByName('Name').AsString) = 'N.IRELAND' then
                           Result := NIreland;
                     end;
      end;
end;

procedure TWinData.HerdBeforePost(DataSet: TDataSet);
begin
   if MessageDlg('Select this Herd?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      Begin
         OwnerFile.Edit;
         OwnerFile.FieldByName('DateLastAccessed').Value := Date();
      end;
end;

procedure TWinData.EventsNewRecord(DataSet: TDataSet);
Var ValidEvent : Boolean;
    Whichc : TCountry;

   WeaningDate : TDateTime;
begin
   ValidEvent := True;

   Case EventType Of
      THealth  :  begin
                     EventID.Value := NewOtherID;
                     CheckEventID := EventID.Value;
                     sSubEventTable := 'Health';
                     EventsEventType.Value := CHealthEvent;
                     EventsAnimalID.Value := AnimalFileByIDID.Value;
                     EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
                     EventsHerdID.Value := AnimalFileByIDHerdID.Value;
                     EventsEventDate.Value := Now();
                     //EventsEventDesc.Value := 'Health';
                     EventsMPNotified.Value := False;
                     EventsMPAction.Value   := 'A';
                     EventsICBFNotified.Value := False;
                     EventsICBFAction.Value := 'A';
                     // Append a Health Record
                     Health.Append;//Record([EventID.Value]);
                  end;
      TCalving :  begin
                     // Start a Calving Event
                     EventID.Value := NewOtherID;
                     EventsEventType.Value := CCalvingEvent;
                     EventsAnimalID.Value := AnimalFileByIDID.Value;
                     EventsHerdID.Value := AnimalFileByIDHerdID.Value;
                     Mortality := 0;  // SP 12/04/01 Reset Mortality, value was carried over to next calving record.
                     // Calving Event goes into next lactation as Start of Lactation
                     if InsertCalving then
                        // Goes into the Current Lactation
                        EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value
                     else
                        EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value+1;
                     EventsEventDate.Value := Now();
                     EventsEventDesc.Value := 'Calving';
                     EventsMPNotified.Value := False;
                     EventsMPAction.Value   := 'A';
                     EventsICBFNotified.Value := False;
                     EventsICBFAction.Value := 'A';

                     FullTermCalving := False;
                  end;
      TWeight  :  begin
                     EventID.Value := NewOtherID;
                     EventsEventType.Value := CWeightEvent;
                     EventsAnimalID.Value := AnimalFileByIDID.Value;
                     EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
                     EventsHerdID.Value := AnimalFileByIDHerdID.Value;
                     EventsEventDate.Value := Now();
                     EventsEventDesc.Value := 'Weighing';
                     EventsMPNotified.Value := False;
                     EventsMPAction.Value   := 'A';
                     EventsICBFNotified.Value := False;
                     EventsICBFAction.Value := 'A';
                     Weighings.Append;
                  end;
      TBulling :  begin
                     EventID.Value := NewOtherID;
                     EventsEventType.Value := CBullingEvent;
                     EventsAnimalID.Value := AnimalFileByIDID.Value;
                     EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
                     EventsHerdID.Value := AnimalFileByIDHerdID.Value;

                     { Assign Defaults}
                     if BullingDefaults <> nil then
                        begin
                           if ( BullingDefaults.EventDate > 0 ) then
                              EventsEventDate.Value := BullingDefaults.EventDate
                           else
                              EventsEventDate.Value := Now();

                           if ( BullingDefaults.Comment <> '' ) then
                              EventsEventDesc.Value := BullingDefaults.Comment
                           else
                              EventsEventDesc.Value := 'Heat/Bulling';
                        end
                     else
                        begin
                           EventsEventDate.Value := Now();
                           EventsEventDesc.Value := 'Heat/Bulling';
                        end;

                     EventsMPNotified.Value := False;
                     EventsMPAction.Value   := 'A';
                     EventsICBFNotified.Value := False;
                     EventsICBFAction.Value := 'A';
                     Bullings.Append;
                  end;
      TService :  begin
                     EventID.Value := NewOtherID;
                     EventsEventType.Value := CServiceEvent;
                     EventsAnimalID.Value := AnimalFileByIDID.Value;
                     EventsHerdID.Value := AnimalFileByIDHerdID.Value;
                     EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;

                     { Assign Defaults}
                     if ServiceDefaults <> nil then
                        begin
                           if ( ServiceDefaults.EventDate > 0 ) then
                              EventsEventDate.Value := ServiceDefaults.EventDate
                           else
                              EventsEventDate.Value := Now();

                           if ( ServiceDefaults.Comment <> '' ) then
                              EventsEventDesc.Value := ServiceDefaults.Comment
                           else
                              EventsEventDesc.Value := 'Service';
                        end
                     else
                        begin
                           EventsEventDate.Value := Now();
                           EventsEventDesc.Value := 'Service';
                        end;
                     EventsMPNotified.Value := False;
                     EventsMPAction.Value   := 'A';
                     EventsICBFNotified.Value := False;
                     EventsICBFAction.Value := 'A';
                     Services.Append;
                  end;
      TPregDiag:  begin
                     EventID.Value := NewOtherID;
                     EventsEventType.Value := CPregDiagEvent;
                     EventsAnimalID.Value := AnimalFileByIDID.Value;
                     EventsHerdID.Value := AnimalFileByIDHerdID.Value;
                     EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
                     EventsEventDate.Value := Now();
                     EventsEventDesc.Value := 'Scanning/Pregnancy Diagnosis';
                     EventsMPNotified.Value := False;
                     EventsMPAction.Value   := 'A';
                     EventsICBFNotified.Value := False;
                     EventsICBFAction.Value := 'A';
                     PregDiag.Append;
                  end;
     TSaleDeath:  begin
                     EventID.Value := NewOtherID;
                     EventsEventType.Value := CSaleDeathEvent;
                     if NOT(MassSalesUpdate) then
                        begin
                           CheckEventID := EventID.Value;
                           sSubEventTable := 'SalesDeaths';
                           EventsAnimalID.Value := AnimalFileByIDID.Value;
                           EventsHerdID.Value := AnimalFileByIDHerdID.Value;
                           EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
                           if SaleDeathDateSet then
                              EventsEventDate.Value := DefaultSaleDeathEventDate
                           else
                              EventsEventDate.Value := Now();
                           if sDefNOTHeld = False then
                               EventsEventDesc.Value := sCommentDef
                           else
                              EventsEventDesc.Value := 'Sale';
                        end;
                     EventsMPNotified.Value := False;
                     EventsMPAction.Value   := 'A';
                     EventsICBFNotified.Value := False;
                     EventsICBFAction.Value := 'A';
                  end;
     TPreSale  :  begin
                     {if WinData.HasSaleDeath(AnimalFileByIDID.AsInteger, AnimalFileByIDHerdID.AsInteger) then
                        begin
                           Events.Cancel;
                           raise Exception.Create('Animal already has sale event recorded');
                        end; }
                     EventID.Value := NewOtherID;
                     EventsEventType.Value := CSaleDeathEvent;
                     EventsAnimalID.Value := AnimalFileByIDID.Value;
                     EventsHerdID.Value := AnimalFileByIDHerdID.Value;
                     EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
                     EventsEventDate.Value := Date;
                     EventsEventDesc.Value := 'Pre-Sale';
                     EventsMPNotified.Value := False;
                     EventsMPAction.Value   := 'A';
                     EventsICBFNotified.Value := False;
                     EventsICBFAction.Value := 'A';
                  end;
      TPurchase:  begin
                     EventID.Value := NewOtherID;
                     CheckEventID := EventID.Value;
                     sSubEventTable := 'Purchases';
                     EventsEventType.Value := CPurchaseEvent;
                     EventsAnimalID.Value := AnimalFileByIDID.Value;
                     EventsHerdID.Value := AnimalFileByIDHerdID.Value;
                     EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
                     if PurchDateSet then
                        EventsEventDate.Value := DefaultPurchEventDate;
//                      Date of birth default purch date removed SP 3/09/2001
//                   else
//                      EventsEventDate.Value := AnimalFileByIDDateOfBirth.Value;
                     if pDefNOTHeld = False then
                        EventsEventDesc.Value := pCommentDef
                     else
                        EventsEventDesc.Value := 'Purchase';

                     if Purchases.RecordCount <= 0 then
                        Purchases.Insert
                     else
                        Purchases.Append
                  end;
      TDryOff  :  begin
                     // This is a Drying Off Record one per Lactation
                     EventID.Value := NewOtherID;
                     EventsEventType.Value := CDryOffEvent;
                     EventsAnimalID.Value := AnimalFileByIDID.Value;
                     EventsHerdID.Value := AnimalFileByIDHerdID.Value;
                     EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
                     EventsEventDate.Value := Now();
                     EventsEventDesc.Value := 'Drying Off';
                     EventsMPNotified.Value := False;
                     EventsMPAction.Value   := 'A';
                     EventsICBFNotified.Value := False;
                     EventsICBFAction.Value := 'A';
                     Health.Append;
                  end;
      TMovement:  begin
                     EventID.Value := NewOtherID;
                     EventsEventType.Value := CMovementEvent;
                     EventsAnimalID.Value := AnimalFileByIDID.Value;
                     EventsHerdID.Value := AnimalFileByIDHerdID.Value;
                     EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
                     EventsEventDate.Value := Now();
                     EventsEventDesc.Value := 'Temporary Movement';
                  end;
      TStockBull: begin
                     EventID.Value := NewOtherID;
                     EventsEventType.Value := CStockBullEvent;
                     EventsAnimalID.Value := AnimalFileByIDID.Value;
                     EventsHerdID.Value := AnimalFileByIDHerdID.Value;
                     EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
                     EventsEventDate.Value := Now();
                     EventsEventDesc.Value := 'Stock Bull In/Out';
                     EventsMPNotified.Value := False;
                     EventsMPAction.Value   := 'A';
                     EventsICBFNotified.Value := False;
                     EventsICBFAction.Value := 'A';
                     //StockBull.Append;
                  end;
      TNewID:     begin
                     EventID.Value := NewOtherID;
                     EventsEventType.Value := CNewIDEvent;
                     EventsAnimalID.Value := AnimalFileByIDID.Value;
                     EventsHerdID.Value := AnimalFileByIDHerdID.Value;
                     EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
                     EventsEventDate.Value := Now();
                     EventsEventDesc.Value := 'New ID Allocation';
                     EventsMPNotified.Value := False;
                     EventsMPAction.Value   := 'A';
                     EventsICBFNotified.Value := False;
                     EventsICBFAction.Value := 'A';
                     //NewID.Append;
                  end;
      TAbortion:  begin
                     EventID.Value := NewOtherID;
                     EventsEventType.Value := CAbortionEvent;
                     EventsAnimalID.Value := AnimalFileByIDID.Value;
                     EventsHerdID.Value := AnimalFileByIDHerdID.Value;
                     EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
                     EventsEventDate.Value := Now();
                     EventsEventDesc.Value := 'Abortion';
                     EventsMPNotified.Value := False;
                     EventsMPAction.Value   := 'A';
                     EventsICBFNotified.Value := False;
                     EventsICBFAction.Value := 'A';
                  end;
      TCastrate:  begin
                     if EventDataHelper.GetLastEventDate(AnimalFileByIDID.AsInteger, CCastrateEvent) > 0 then
                        begin
                           MessageDlg('A Castration event has already been recorded for this animal.',mtInformation,[mbOK],0);
                           SysUtils.Abort;
                        end;

                     EventID.Value := NewOtherID;
                     EventsEventType.Value := CCastrateEvent;
                     EventsAnimalID.Value := AnimalFileByIDID.Value;
                     EventsHerdID.Value := AnimalFileByIDHerdID.Value;
                     EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
                     EventsEventDate.Value := Now();
                     EventsEventDesc.Value := 'Castration';
                     EventsMPNotified.Value := False;
                     EventsMPAction.Value   := 'A';
                     EventsICBFNotified.Value := False;
                     EventsICBFAction.Value := 'A';
                  end;
      TConditionScore : begin
                           EventID.Value := NewOtherID;
                           EventsEventType.Value := CCondScoreEvent;
                           EventsAnimalID.Value := AnimalFileByIDID.Value;
                           EventsHerdID.Value := AnimalFileByIDHerdID.Value;
                           EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
                           EventsEventDate.Value := Now();
                           EventsEventDesc.Value := 'Condition Score';
                           EventsMPNotified.Value := False;
                           EventsMPAction.Value   := 'A';
                           EventsICBFNotified.Value := False;
                           EventsICBFAction.Value := 'A';
                           ConditionScore.Append;
                        end;
      TDiagnoseProblem: begin
                           EventID.Value := NewOtherID;
                           EventsEventType.Value := CDiagProblemEvent;
                           EventsAnimalID.Value := AnimalFileByIDID.Value;
                           EventsHerdID.Value := AnimalFileByIDHerdID.Value;
                           EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
                           EventsEventDate.Value := Now();
                           EventsEventDesc.Value := 'Diagnose Problem';
                           EventsMPNotified.Value := False;
                           EventsMPAction.Value   := 'A';
                           EventsICBFNotified.Value := False;
                           EventsICBFAction.Value := 'A';
                           DiagnoseProblem.Append;
                        end;
      TEmbryoTransfer:  begin
                           EventID.Value := NewOtherID;
                           EventsEventType.Value := CEmbryoTransEvent;
                           EventsAnimalID.Value := AnimalFileByIDID.Value;
                           EventsHerdID.Value := AnimalFileByIDHerdID.Value;
                           EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
                           EventsEventDate.Value := Now();
                           EventsEventDesc.Value := 'Embryo Transfer';
                           EventsMPNotified.Value := False;
                           EventsMPAction.Value   := 'A';
                           EventsICBFNotified.Value := False;
                           EventsICBFAction.Value := 'A';
                           EmbryoTransfer.Append;
                        end;
      TMastitis:        begin
                           EventID.Value := NewOtherID;
                           EventsEventType.Value := CMastitisEvent;
                           EventsAnimalID.Value := AnimalFileByIDID.Value;
                           EventsHerdID.Value := AnimalFileByIDHerdID.Value;
                           EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
                           EventsEventDate.Value  := Now();
                           EventsEventDesc.Value  := 'Mastitis';
                           EventsMPNotified.Value := False;
                           EventsMPAction.Value   := 'A';
                           EventsICBFNotified.Value := False;
                           EventsICBFAction.Value := 'A';
                        end;
      TToBeCulled:      begin
                           EventID.Value := NewOtherID;
                           EventsEventType.Value := CToBeCulledEvent;
                           EventsAnimalID.Value  := AnimalFileByIDID.Value;
                           EventsHerdID.Value    := AnimalFileByIDHerdID.Value;
                           EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
                           EventsEventDate.Value  := Now();
                           EventsEventDesc.Value  := 'To Be Culled';
                           EventsMPNotified.Value := False;
                           EventsMPAction.Value   := 'A';
                           EventsICBFNotified.Value := False;
                           EventsICBFAction.Value := 'A';
                        end;
      TWean:            begin
                           if EventDataHelper.GetLastEventDate(AnimalFileByIDID.AsInteger, CWeaningEvent) > 0 then
                              begin
                                 MessageDlg('A Weaning event has already been recorded for this animal.',mtInformation,[mbOK],0);
                                 SysUtils.Abort;
                              end;
                           EventID.Value := NewOtherID;
                           EventsEventType.Value := CWeaningEvent;
                           EventsAnimalID.Value  := AnimalFileByIDID.Value;
                           EventsHerdID.Value    := AnimalFileByIDHerdID.Value;
                           EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
                           EventsEventDate.Value  := Now();
                           EventsEventDesc.Value  := 'Weaning';
                           EventsMPNotified.Value := False;
                           EventsMPAction.Value   := 'A';
                           EventsICBFNotified.Value := False;
                           EventsICBFAction.Value := 'A';

                           Weaning.Append;
                           WeaningEventID.AsInteger := EventID.AsInteger;
                           Weaning.Post;


                        end;
      TInternalExam:    begin
                           EventID.Value := NewOtherID;
                           EventsEventType.Value := CIntExamEvent;
                           EventsAnimalID.Value  := AnimalFileByIDID.Value;
                           EventsHerdID.Value    := AnimalFileByIDHerdID.Value;
                           EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
                           EventsEventDate.Value  := Now();
                           EventsEventDesc.Value  := 'Internal Examination';
                           EventsMPNotified.Value := False;
                           EventsMPAction.Value   := 'A';
                           EventsICBFNotified.Value := False;
                           EventsICBFAction.Value := 'A';
                        end;
      TRunBullIn:       begin
                           EventID.Value := NewOtherID;
                           EventsEventType.Value := CStockBullIn;
                           EventsAnimalID.Value  := AnimalFileByIDID.Value;
                           EventsHerdID.Value    := AnimalFileByIDHerdID.Value;
                           EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
                           EventsEventDate.Value  := Now();
                           EventsEventDesc.Value  := 'Run Bull In';
                           EventsMPNotified.Value := False;
                           EventsMPAction.Value   := 'A';
                           EventsICBFNotified.Value := False;
                           EventsICBFAction.Value := 'A';
                           BullInOut.Append;
                        end;
      TRunBullOut:      begin
                           EventID.Value := NewOtherID;
                           EventsEventType.Value := CStockBullOut;
                           EventsAnimalID.Value  := AnimalFileByIDID.Value;
                           EventsHerdID.Value    := AnimalFileByIDHerdID.Value;
                           EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
                           EventsEventDate.Value  := Now();
                           EventsEventDesc.Value  := 'Run Bull Out';
                           EventsMPNotified.Value := False;
                           EventsMPAction.Value   := 'A';
                           EventsICBFNotified.Value := False;
                           EventsICBFAction.Value := 'A';
                           BullInOut.Append;
                        end;
      TMealFeeding:     begin
                           if AnimalFileByIDLactNo.AsInteger <> 0 then
                              begin
                                 MessageDlg('This animal is not a calf.',mtInformation,[mbOK],0);
                                 SysUtils.Abort;
                              end
                           else
                              begin
                                 if EventDataHelper.GetLastEventDate(AnimalFileByIDID.AsInteger, CMealFeedingEvent) > 0 then
                                    begin
                                       MessageDlg('A Meal Feeding event has already been recorded for this animal.',mtInformation,[mbOK],0);
                                       SysUtils.Abort;
                                    end;

                                 // Check disbudding event has been recorded.
                                 if not CheckEventExists(AnimalFileByIDID.AsInteger,-1,CDisbuddingEvent) then
                                    begin
                                       if MessageDlg('No disbudding event has been recorded for this animal.'+#13#10+#13#10+
                                                     'Are you sure you want to continue?',mtConfirmation,[mbYes,mbNo],0) = idNo then
                                          begin
                                             SysUtils.Abort;
                                          end;
                                    end;

                                 // if Bull, check castration event has been recorded where applicable.
                                 // NOTE, if bull is being sold as "Whole" the recording of castration
                                 // event is not required.
                                 if AnimalFileByIDSex.AsString = cSex_Bull then
                                    begin
                                       if not CheckEventExists(AnimalFileByIDID.AsInteger,-1,CCastrateEvent) then
                                          begin
                                             if MessageDlg('No castration event has been recorded for this animal.'+#13#10+#13#10+
                                                           'Are you sure you want to continue?',mtConfirmation,[mbYes,mbNo],0) = idNo then
                                                begin
                                                   SysUtils.Abort;
                                                end;
                                          end;
                                    end;
                              end;

                           EventID.Value := NewOtherID;
                           EventsEventType.Value := cMealFeedingEvent;
                           EventsAnimalID.Value  := AnimalFileByIDID.Value;
                           EventsHerdID.Value    := AnimalFileByIDHerdID.Value;
                           EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
                           EventsEventDate.Value  := Now();
                           EventsEventDesc.Value  := 'Start Meal Feeding';
                           EventsMPNotified.Value := False;
                           EventsMPAction.Value   := 'A';
                           EventsICBFNotified.Value := False;
                           EventsICBFAction.Value := 'A';

                           MealFeeding.Append;
                           MealFeedingEventID.AsInteger := EventID.AsInteger;
                           MealFeeding.Post;
                        end;
      TDisbudding:      begin
                           if AnimalFileByIDLactNo.AsInteger <> 0 then
                              begin
                                 MessageDlg('This animal is not a calf.',mtInformation,[mbOK],0);
                                 SysUtils.Abort;
                              end;

                           if EventDataHelper.GetLastEventDate(AnimalFileByIDID.AsInteger, CDisbuddingEvent) > 0 then
                              begin
                                 MessageDlg('A Disbudding event has already been recorded for this animal.',mtInformation,[mbOK],0);
                                 SysUtils.Abort;
                              end;

                           EventID.Value := NewOtherID;
                           EventsEventType.Value := CDisbuddingEvent;
                           EventsAnimalID.Value  := AnimalFileByIDID.Value;
                           EventsHerdID.Value    := AnimalFileByIDHerdID.Value;
                           EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
                           EventsEventDate.Value  := Now();
                           EventsEventDesc.Value  := 'Disbudding';
                           EventsMPNotified.Value := False;
                           EventsMPAction.Value   := 'A';
                           EventsICBFNotified.Value := False;
                           EventsICBFAction.Value := 'A';

                           Disbudding.Append;
                           DisbuddingEventID.AsInteger := EventID.AsInteger;
                           Disbudding.Post;
                        end;
   else
      ValidEvent := False;
   end;

   { SP 05/12/2002 }
   { Save source of event to events table }
   EventsEventSource.AsInteger := sInternal;


   {   if ValidEvent then
      begin

         EventsAnimalID.Value := AnimalFileByIDID.Value;
         EventsAnimalLactNo.Value := AnimalFileByIDLactNo.Value;
         EventsID.Value := NewOtherID;
         EventsEventDate.Value := Now();
         EventsEventDesc.Value := 'New Weighing Event';

      end
   else
      Events.Cancel; }
   if NOT ValidEvent then
      Events.Cancel;

end;

function TWinData.GetAnimalID : LongInt;
begin
   //Incremnet the unique ID by 1 the Value UniqueID
   With IDFile Do
      Begin
         Open;
         Try
             First;
             Edit;
             UniqueId.Value := UniqueID.Value + 1;
             Result := UniqueId.Value;
             Post;
         Finally
             Close;
         End;
     End;
end;

function TWinData.GetOtherID : LongInt;
begin
   //Incremnet the Other ID by 1 the value UniqueID
   With OtherIDs Do
      Begin
         Open;
         Try
            First;
            Edit;
            FieldByName('Id').AsInteger := FieldByName('Id').AsInteger + 1;
            Result := FieldByName('Id').AsInteger;
            Post;
         Finally
            Close;
         End;
      End;
end;

function TWinData.OpenAllTables : Boolean;
var
   IndexRecords : TIndexRecords;

   function ReCreateIndexes(e : Exception) : Boolean;
   begin
       Result := (Pos('index', lowercase(e.Message)) > 0);
   end;

begin
   if Splashmessage then
      Splash.SplashForm.lStartmessage.Caption := ' Opening Files ...';

   BullExt.Open;
   CowExt.Open;
   tBullExt.Open;
   tCowExt.Open;
   AnimalsExt.Active := True;
   if Menuform <> nil then
      AnimalFileByID.Active := True;
   FilteredAnimals.Open;
   Events.Open;
   Weighings.Open;
   OwnerFile.Open;
   Groups.Open;
   GroupLinks.Open;
   Breeds.Open;
   Bullings.Open;
   LookUpDamSire.Open;
   LookUpGroups.Open;
   GenLookUp.Open;
   MilkCumulative.Open;

   try
      Sires.Open;
   except
      on e : EDatabaseError do
        begin
           Sires.Close;
           if ReCreateIndexes(e) then
              begin
                 SetLength(IndexRecords, 0); // clear any existing indexes
                 SetLength(IndexRecords, 1);
                 IndexRecords[0].FieldName := 'AICode';
                 IndexRecords[0].IndexName := '';
                 IndexRecords[0].IndexOptions := [ixUnique,ixPrimary];
                 RemoveIndexes(KingData.Directory, Sires.TableName);
                 CreateIndexes(Sires.TableName, IndexRecords);
                 Sires.Open;
              end;
        end;
   end;

   tBullSemen.Open;
   Services.Open;
   PregDiag.Open;
   Health.Open;
   Calvings.Open;
   Medicine.Open;
   MediPurch.Open;
   Units.Open;
   MediAdmin.Open;
   Suppliers.Open;
   CheckEvents.Open;
   LookUpServices.Open;
//   LookUpCalvings.Open;
   LookUpPDs.Open;
   LookUpBullings.Open;
   BeefSubsidy.Open;
   PremiumType.Open;
   SaleDeath.Open; // Animal Sale or Death Records
   Customers.Open;
   Purchases.Open; // Animal Purchase Records
   Applications.Open;
   Defaults.Open;
   Defaults.Close;
   SetUpQueries;
   qCountries.Open;
   Buyers.Open;
   tMovements.Open;
   // new tables for feed costs - 22/5/00 - kr
   Manufacturers.Open;
   FeedTypes.Open;
   FeedRegime.Open;
   FdStkEvents.Open;
   try
      FeedEvents.Open;
   except
     Feeds.Open;
   end;
   // opened to allow access for herd brochure & sales catalogue - kr 12/7/00
   WinData.MainFilter.Open;
   CMMS.Open;
   ConditionScore.Open;
   DiagnoseProblem.Open;
   EmbryoTransfer.Open;
   IntExam.Open;
   BullInOut.Open;
   tBlup.Open;
   CMMSPermits.Open;
   if (Def.Definition.dUseMilkRec) then
      begin
         qFeeds.Prepare;
         qFeeds.Open;
      end;
   pDefs.Open;
   Disbudding.Open;
   MealFeeding.Open;
   Weaning.Open;

   RefreshDamSireLookupTable(True); // Sires
   RefreshDamSireLookupTable(False); // Dams
   Result := TRUE;
end;

procedure TWinData.CheckSysUser;
begin
   with tSysUser do
      try
         Open;
         if (RecordCount = 0) Or (RecordCount > 1) Or (WinData.HerdDBPassword <> '') Or
            (NOT Locate('ID',DefaultSysUser,[])) then
            //WinData.CreateAndShowForm(TfSetUpUsers);
            uSetupUsers.ShowTheForm(True);
      finally
         Close;
      end;
end;

procedure TWinData.OpenAndCheckTables;
  procedure HandleDataError;
  var
     iterator : integer;
     sDir : string;
  begin
     Inc(FDBOpenRetryCount);
     if FDBOpenRetryCount > 2 then // Notify user of data errors
        MessageDlg('Error Opening Data - Program will Reindex',mtInformation,[mbOK],0);
     Splash.SplashForm.lStartmessage.Caption := 'Re-Indexing Files ...';
     Splash.SplashForm.lStartmessage.Hide;
     Splash.SplashForm.lStartmessage.Show;
     if FDBOpenRetryCount >= 2 then // Notify user of data errors
        MessageDlg('Shutting down program',mtInformation,[mbOK],0);
     sDir := KingData.Directory;

     KingData.CloseDataSets;
     for iterator := 0 to ComponentCount-1 do
        if (Components[iterator] is TDBDataSet) then
           if (Components[iterator] as TDBDataSet).Active then
              TDBDataSet(Components[iterator]).Active := False; //Ensure all datasets are closed that maynot be linked to KingData.
     KingData.Close;

     if FDBOpenRetryCount > 2 then // Notify user of data errors
        Application.Terminate;
     Application.ProcessMessages;

     Session.Active := False;
     ForceIndicesRemoval(sDir);

     if FDBOpenRetryCount <= 2 then
        begin
           Session.Active := True;
           Session.AddPassword(MASTER_PASSWORD);
           try
              ReIndexAll(True);
           finally
              Session.Active := False;
           end;
        end;

     if FDBOpenRetryCount > 2 then
        Halt(1)
     else
        OpenAndCheckTables;
  end;
begin

   WinData.KingData.Connected := True;
   Session.AddPassword(MASTER_PASSWORD);

   if not DefOpenOK then
      begin
         Def.LoadDef(WinData.KingData.Directory);
         if ( DefOpenOK ) Then
            begin
               Def.Definition.dShutDownOK := FALSE;

               // Check Definition file. If not dUsePremiums then
               // close herd, open Fields/REPS program.
               if not ( Def.Definition.dUsePremiums ) then
                  begin
                     WinData.KingData.Connected := False;
                     if not ( FileExists( ExtractFilePath( ParamStr(0)) + '\Paddocks.exe' ) ) then
                        begin
                           MessageDlg('Fields/REPs program not found - shutting down',mtError,[mbOK],0);
                           Halt(0);
                        end
                     else
                        begin
                           WinExec( PChar(ExtractFilePath( ParamStr(0)) + '\Paddocks.exe') , SW_SHOWNORMAL);
                           Application.Terminate;
                           Halt(0);
                        end;
                  end;
            end;
       end;

   ReIndexCalvings;

   ClearPasswordFromTables; // only do this once! clear passwords for all protected tables.

   PasswordProtectTables := NISystem; // var stored for later use when data module is destroyed.
   if ( PasswordProtectTables ) then // only password protect if NI System.
      AddRemoveProtectedTables(False);

   try
      CheckFiles;
      if RunReIndex then
         begin
            ReIndexAll(True);
            // Screen.ActiveForm.Refresh;
         end;
   except
      HandleDataError;
   end;

   Application.ProcessMessages;
   try
//      GetEventLookupData(True);
      OpenTables;
      CheckICBFCountry;
      DataOpenOK := True;
   except
      on E : EOutOfMemory do MessageDlg(E.Message, mtError,[mbOK],0);
      on E : EOutOfResources do MessageDlg(E.Message, mtError,[mbOK],0);
      on E : EDatabaseError do
         begin
            if FDBOpenRetryCount > 2 then
               ShowMessage(E.Message);
            HandleDataError;
         end;
   end;
end;

(*
function TWinData.DataSetApplyUpdates(DataSet: TDataSet; Apply: Boolean): Boolean;

{   function DatasetModified(DataSet : TDBDataset) : Boolean; // SP
   var
      i : SmallInt;
      Field : TField;
   begin
      Result := False;
      for i := 0 to Pred(TDBDataset(Dataset).FieldCount) do
         begin
            Field := TDBDataset(Dataset).FindField(TDBDataset(Dataset).Fields[i].FieldName);
            if Field <> nil then
               if Field.OldValue <> Field.NewValue then
                  begin
                     Result := True;
                     Break;
                  end;
         end;
   end;     }
begin
   Result := True;
   with TDBDataSet(DataSet) do
   begin
      if (State in dsEditModes) or UpdatesPending then
         begin
            if Apply then
               begin
                  Database.ApplyUpdates([DataSet as TDBDataSet]);
                  { Always call CancelUpdates to remove any discard changes }
                  CancelUpdates;
               end
            else //if DatasetModified(TDBDataSet(DataSet)) then
               begin
                  if (MessageDlg('Unsaved changes, exit anyway?',mtConfirmation,[mbYes,mbCancel],0) = mrYes) then
                     begin
                        CancelUpdates;
                     end
                  else
                     Result := False;
               end;
         end;
   end;
end;
*)

procedure TWinData.WinDataCreate(Sender: TObject);
begin
   FSystemRegisteredCountry := Other;
   DataOpenOK := False;

   FNoneHerdID := 0;
   FDBOpenRetryCount := 0;
   CallProg := TCallPrograms.Create;

   Splash.SplashForm.lStartmessage.Caption := ' Creating Directories ...';
   Application.ProcessMessages;

   // point to current directory (ie. c:\Kingswood Herd Management)
   // removed 29/6/00 to allow incorporation of Report Generator and DIY Milk Recording
   // allows bde admin control pdoxusrs.net and resource sharing between programs/network

   // Session.NetFileDir := ExtractFilePath(ParamStr(0)) + 'NET';
   SetCurrentDir(ExtractFilePath(ParamStr(0)));

   SetRegVerNo('Herd', iHerdVerNo); // Update Registry, set VerNo = iHerdVerNo

   PremiumYear := GetCurrentYear;


   OpenAndCheckTables;
   // Important: LoadPreferences must be called before OpenAndCheckTables, Lookup fields
   // on AnimalFileByID get initialized based on preference settings.
   LoadPreferences;


   Application.ProcessMessages;
   // Check the No of User inthe SystemFile if there are more than 1 ask for the User Name
   CheckSysUser;
   Application.ProcessMessages;

   ShowAllAnimals := False;
   ShowDOBMessage := True;
   DeletingAnimal := FALSE;
   CalvingAnimal  := FALSE;
   ReTaggingAnimal  := FALSE;
   DefaultCalfGroup := 0;

   pDefNOTHeld := TRUE;  // added 16/03/00 to confirm defaults to be held
   sDefNOTHeld := TRUE;  // for purchase and sales screens - kr
   iDefNOTHeld := TRUE;  // and InterHerd 22/3/00 - kr
   iRemark := '';        // clear InterHerd Default Remark

   if (DefaultEmailClient = '') then
      DefaultEmailClient := cEmailClient_MS;

   IniDir;
   if WinData.PhoneLinkType <> plNOKIA then
      WinData.PhoneLinkType := plNOKIA;

   ExportToPDA := False;

   GroupUpdate := TGroupUpdate.create;
   Global_Crush := TCrush.Create;
   WinData.PurchaseGroupImport := False;
   if SystemRegisteredCountry = Ireland then
      begin
         if not ICBFMMR then
            ICBFMMR := True;
      end
   else
      ICBFMMR := False;
   FCalculateLiveAndDeadWeight := True;
end;

procedure TWinData.WinDataDestroy(Sender: TObject);
var
   iterator : Integer;
begin
   GetEventLookupData(False);
   FreeAndNil(Global_Crush);
   FreeAndNil(CallProg);
   FreeAndNil(GroupUpdate);
   FreeAndNil(PreferenceObj);
   FreeAndNil(FEventDataHelper);
   if Session.Active then
      begin
         KingData.CloseDataSets;
         for iterator := 0 to ComponentCount-1 do
            if (Components[iterator] is TDBDataSet) then
               if (Components[iterator] as TDBDataSet).Active then
                  TDBDataSet(Components[iterator]).Active := False; //Ensure all datasets are closed that maynot be linked to KingData.
         KingData.Close;
         if DataOpenOK then
            CreateRestorePoint;
         Session.Close;
         if ( PasswordProtectTables ) then
            AddRemoveProtectedTables(True);
         KingData.CloseDataSets;
         KingData.Close;
         Session.Close;
      end;
end;

procedure TWinData.EventsAfterDelete(DataSet: TDataSet);
begin
   try
      case EventType of
         TCalving     : KingData.ApplyUpdates([Calvings,Events]);
         THealth,
         TDryOff      : KingData.ApplyUpdates([Health,Events]);
         TWeight      : KingData.ApplyUpdates([Weighings,Events]);
         TService     : KingData.ApplyUpdates([Services,Events]);
         TBulling     : KingData.ApplyUpdates([Bullings,Events]);
         TPregDiag    : begin
                           KingData.ApplyUpdates([PregDiag,Events]);
                           //WinData.UpdateCowFertilityCulledStatus(WinData.AnimalFileByIDID.AsInteger,False,0);
                        end;
         TSaleDeath   : begin

                           KingData.ApplyUpdates([SaleDeath,Events]);

{                           // Mark the Animal as Back in Herd
                           if NOT ( AnimalFileByID.state in dsEditmodes ) then
                              AnimalFileById.Edit;
                           AnimalFileByIdInHerd.Value := True;
                           AnimalFileById.Post;
}
                           SetInHerdStatus(True);
                           RemoveFromEventLookupData(AnimalFileByIDID.AsInteger, cSaleDeathEvent);
                        end;
         TPreSale     : KingData.ApplyUpdates([SaleDeath,Events]); { PreSale }
         TPurchase    : begin
                           KingData.ApplyUpdates([Purchases,Events]);
                           RemoveFromEventLookupData(AnimalFileByIDID.AsInteger, cPurchaseEvent);
                        end;
         TMovement    : KingData.ApplyUpdates([tMovements,Events]);
         TPremium10,
         TPremium22,
         TPremiumBull : KingData.ApplyUpdates([Events]);
         TStockBull   : KingData.ApplyUpdates([{StockBull,}Events]);
         TNewID       : KingData.ApplyUpdates([{NewID,}Events]);
         TAbortion    : KingData.ApplyUpdates([Events]);
         TCastrate    : begin
                           UpdateAnimalSex('Steer');
                           KingData.ApplyUpdates([AnimalFileByID,Events]);
                        end;
         TConditionScore  : KingData.ApplyUpdates([ConditionScore, Events]);
         TDiagnoseProblem : KingData.ApplyUpdates([DiagnoseProblem, Events]);
         TEmbryoTransfer  : KingData.ApplyUpdates([EmbryoTransfer, Events]);
         TMastitis        : KingData.ApplyUpdates([Events]);
         TToBeCulled      : begin
                                KingData.ApplyUpdates([Events]);
                                WinData.UpdateCowFertilityCulledStatus(WinData.AnimalFileByIDID.AsInteger,False,0);
                            end;
         TWean            : KingData.ApplyUpdates([Weaning,Events]);
         TInternalExam    : KingData.ApplyUpdates([IntExam, Events]);
         TRunBullIn,
         TRunBullOut      : KingData.ApplyUpdates([BullInOut, Events]);
         TMealFeeding     : KingData.ApplyUpdates([MealFeeding, Events]);
         TDisbudding      : KingData.ApplyUpdates([Disbudding, Events]);
      end;
   except
      on E : Exception do
         begin
            MessageDlg(E.Message + ' AFTER DELETE', mtInformation, [mbOK],0);
            case EventType Of
               TCalving :  begin
                              AnimalFileById.CancelUpdates;
                              Events.CancelUpdates;
                              Calvings.CancelUpdates;
                           end;
               TWeight  :  begin
                              Events.CancelUpdates;
                              Weighings.CancelUpdates;
                           end;
               TBulling :  begin
                              Events.CancelUpdates;
                              Bullings.CancelUpdates;
                           end;
               TService :  begin
                              Events.CancelUpdates;
                              Services.CancelUpdates;
                           end;
               TSaleDeath: begin
                              Events.CancelUpdates;
                              SaleDeath.CancelUpdates;
                           end;
               TPurchase:  begin
                              Events.CancelUpdates;
                              Purchases.CancelUpdates;
                           end;
               THealth,
               TDryOff  :  begin
                              Events.CancelUpdates;
                              Health.CancelUpdates;
                           end;
               TPremium10,
               TPremium22,
               TPremiumBull
                        :  begin
                              Events.CancelUpdates;
                              BeefSubsidy.CancelUpdates;
                           end;
               TMovement:  begin
                              Events.CancelUpdates;
                              tMovements.CancelUpdates;
                           end;
               TStockBull: begin
                              Events.CancelUpdates;
//                              StockBull.CancelUpdates;
                           end;
               TNewID   :  begin
                              Events.CancelUpdates;
//                              NewID.CancelUpdates;
                           end;
               TAbortion        : Events.CancelUpdates;

               TCastrate        : Events.CancelUpdates;
               TConditionScore  : begin
                                     Events.CancelUpdates;
                                     ConditionScore.CancelUpdates;
                                  end;
               TDiagnoseProblem : begin
                                     Events.CancelUpdates;
                                     DiagnoseProblem.CancelUpdates;
                                  end;
               TEmbryoTransfer  : begin
                                     Events.CancelUpdates;
                                     EmbryoTransfer.CancelUpdates;
                                  end;
               TMastitis        : Events.CancelUpdates;
               TToBeCulled      : Events.CancelUpdates;
               TWean            : begin
                                     Events.CancelUpdates;
                                     Weaning.CancelUpdates;
                                  end;
               TInternalExam    : begin
                                     Events.CancelUpdates;
                                     IntExam.CancelUpdates;
                                  end;
               TRunBullIn,
               TRunBullOut      : begin
                                     Events.CancelUpdates;
                                     BullInOut.CancelUpdates;
                                  end;
               TMealFeeding     : begin
                                     Events.CancelUpdates;
                                     MealFeeding.CancelUpdates;
                                  end;
               TDisbudding      : begin
                                     Events.CancelUpdates;
                                     Disbudding.CancelUpdates;
                                  end;
            end;
         end;
   end;

   // create ICBFDeleteEvent - 15/11/00 - kr
   with ICBFDelete do
      try
         Active := True;
         Append;
         FieldByName('EventID').AsInteger    := ICBFID;
         FieldByName('EventType').AsInteger  := ICBFType;
         FieldByName('EventDate').AsDateTime := ICBFDate;
         FieldByName('HerdID').AsInteger     := ICBFHerdID;
         FieldByName('Action').AsString      := 'D';
         FieldByName('Notified').AsBoolean   := False;
         Post;
      finally
         Active := False;
      end;

   // Create MPDeleteEvent - 27/03/02 - SP
   if NOT(EventType In ([TPremium10, TPremium22, TPremiumBull])) then
      with MPDelete do
         try
            Active := True;
            if MPDelete.RecordCount > 0 then
               MPDelete.Append
            else
               MPDelete.Insert;
            FieldByName('EventID').AsInteger    := MPID;
            FieldByName('EventType').AsInteger  := MPType;
            FieldByName('EventDate').AsDateTime := MPDate;
            FieldByName('HerdID').AsInteger     := MPHerdID;
            FieldByName('Action').AsString      := 'D';
            FieldByName('Notified').AsBoolean   := False;
            if MPType = CSaleDeathEvent then
               begin
                  if MPSaleDeath <> nil then
                     begin
                        FieldByName('ECategory').AsString := MPSaleDeath^;
                        Dispose(MPSaleDeath);
                        MPSaleDeath := nil;
                     end;
               end
            else if MPType = CServiceEvent then
               begin
                  if MPService <> nil then
                     begin
                        FieldByName('ECategory').AsString := MPService^;
                        Dispose(MPService);
                        MPService := nil;
                     end;
               end;

            Post;
         finally
            Active := False;
         end;

   // Bring events back to event grid after deletion,
   // This was put here because KB's AnimalFileByID 2 caused
   // Major problems. This is a very bad work around.
   //   AnimalEventSQL;
   // Never Remove.
end;

procedure TWinData.WriteRemarks;
var
   i : Integer;
   TimeNow : TTime;
   DateNow : TDate;
begin
   try
      with tRemarks do
         begin
            Open;
            tSysUser.Open;
            TimeNow := SysUtils.Time();
            DateNow := SysUtils.Date();
            for i := 1 to uRemarks.MaxRemarks do
               begin
                   if ( fRemarks.RecordRemarks[i].RecType <> None ) then
                      begin
                         Append;
                         // Use the Animal ID Stored before posting
                         FieldByName('AID').AsInteger := RemarksOrigAnimalID;
                         FieldByName('DateChanged').AsDateTime := DateNow;
                         FieldByName('TimeChanged').AsDateTime := TimeNow;
                         FieldByName('UserDate').AsDateTime := fRemarks.RecordRemarks[i].RecUserDate;
                         Case fRemarks.RecordRemarks[i].RecType of
                            NatID    : begin
                                          FieldByName('OldItem').Value := AnimalFileByIDNatIDNum.OldValue;
                                          FieldByName('ItemChanged').AsInteger := cNatIdRemark;
                                       end;
                            DOB      : begin
                                          FieldByName('OldItem').Value := AnimalFileByIdDateOfBirth.OldValue;
                                          FieldByName('ItemChanged').AsInteger := cDOBRemark;
                                       end;
                            Colour   : begin
                                          FieldByName('ItemChanged').AsInteger := cColourRemark;
                                          if GenLookUp.Locate('ID',AnimalFileByIDColour.OldValue,[] ) then
                                             FieldByName('OldItem').Value := GenLookUp.FieldByName('Description').AsString
                                          else
                                             FieldByName('OldItem').Value := 'UnAssigned Colour';
                                       end;
                            Breed    : begin
                                          FieldByName('ItemChanged').AsInteger := cBreedRemark;
                                          if Breeds.Locate('ID',AnimalFileByIDPrimaryBreed.OldValue,[] ) then
                                             FieldByName('OldItem').Value := Breeds.FieldByName('Code').AsString
                                          else
                                             FieldByName('OldItem').AsString := 'UnAssigned Breed';
                                       end;
                            SaleDate : begin
                                          FieldByName('OldItem').Value := EventsEventDate.OldValue;
                                          FieldByName('ItemChanged').AsInteger := cSaleDateRemark;
                                       end;
                            PurchDate :begin
                                          FieldByName('OldItem').Value := EventsEventDate.OldValue;
                                          FieldByName('ItemChanged').AsInteger := cPurchDateRemark;
                                       end;
                            SalePlace : begin
                                          if Customers.Locate('ID',SaleDeathCustomer.OldValue,[] ) then
                                             FieldByName('OldItem').Value := Customers.FieldByName('Name').AsString
                                          else
                                             FieldByName('OldItem').AsString := 'UnAssigned Sale Place';
                                          FieldByName('ItemChanged').AsInteger := cSalePlaceRemark;
                                       end;
                            PurchPlace:begin
                                          if Suppliers.Locate('ID',PurchasesSupplier.OldValue,[] ) then
                                             FieldByName('OldItem').Value := Suppliers.FieldByName('Name').AsString
                                          else
                                             FieldByName('OldItem').AsString := 'UnAssigned Purchase Place';
                                          FieldByName('ItemChanged').AsInteger := cPurchPlaceRemark;
                                       end;
                            Sex      : begin
                                          FieldByName('ItemChanged').AsInteger := cSexRemark;
                                          FieldByName('OldItem').Value := AnimalFileByIDSex.OldValue;
                                       end;
                            rHerdID  : begin
                                          FieldByName('ItemChanged').AsInteger := cHerdIDRemark;
                                          if OwnerFile.Locate('ID',AnimalFileByIDHerdID.OldValue,[] ) then
                                             FieldByName('OldItem').Value := OwnerFile.FieldByName('HerdIdentity').AsString
                                          else
                                             FieldByName('OldItem').AsString := 'UnAssigned Herd Identity';
                                       end;
                            Deletion : begin
                                          FieldByName('ItemChanged').AsInteger := cDeletionRemark;
                                          FieldByName('OldItem').AsString := 'Animal Deleted';
                                       end;
                         end;
                         FieldByName('Remark').Value := fRemarks.RecordRemarks[i].RecText;
                         // Get the Current User Name
                         if tSysUser.Locate('ID',DefaultSysUser,[] ) then
                            FieldByName('ChangedBy').AsString := tSysUser.FieldByName('Name').AsString
                         else
                            raise EInvalidOp.CreateFmt('SetUp a Default User Name - Changes NOT saved',[0]);
                         Post;
                      end;
               end;
         end;
   finally
      // Clear the Remarks Array to Blank
      fRemarks.RemarksAdded := FALSE;
      tSysUser.Close;
   end;
end;

procedure TWinData.BreedsAfterPost(DataSet: TDataSet);
begin
   try
      KingData.ApplyUpdates([Breeds]);
   except
      on E : Exception Do
         MessageDlg(E.Message,mtInformation,[mbOK],0);
   end;
end;

function TWinData.DeleteEvents : Boolean;
Var
   MyQuery : TQuery;
begin
   MyQuery := TQuery.Create(nil);
   try
      MyQuery.DatabaseName := KingData.DatabaseName;
      MyQuery.SQL.Add('Delete From BullExt Where AnimalID = ' + IntToStr(AnimalFileByIdID.Value));
      MyQuery.Prepare;
      MyQuery.ExecSQL;
      MyQuery.Close;
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('Delete From BullSemenStk Where AnimalID = ' + IntToStr(AnimalFileByIdID.Value));
      MyQuery.Prepare;
      MyQuery.ExecSQL;
      ReSult := True;
   finally
      MyQuery.Free;
   end;
end;

procedure TWinData.BreedsAfterDelete(DataSet: TDataSet);
begin
   try
      KingData.ApplyUpdates([Breeds]);
   except
      on E : Exception Do
         MessageDlg ( E.Message, mtInformation, [mbOK],0 );
   end;
end;

procedure TWinData.OwnerFileNewRecord(DataSet: TDataSet);
begin
   OwnerFile.Fields[0].AsInteger := NewOtherID;
   OwnerFile.FieldByName('UserCanDelete').Value := True;
   OwnerFile.FieldByName('TypeOfHerd').Value := 0;
   if GenLookup.Active then
      begin
         if GenLookUp.Locate('ListType;Description', VarArrayOf([LSpecies,cSpecies_Bovine]),[]) then
            OwnerFile.FieldByName('Species').Value := GenLookUp.FieldByName('ID').Value;
      end;
end;

procedure TWinData.OwnerFileAfterPost(DataSet: TDataSet);
begin
   try
      KingData.ApplyUpdates([OwnerFile]);
      // ReQuery the qHerdDefaults Listing
      OwnerFile.FlushBuffers;
      qHerdDefaults.Close;
      qHerdDefaults.Open;
      SetUpQueries; // Call setup Queries to re-open all queries that use Herd Type/Country as parameters.
      FSystemRegisteredCountry := Other;
   except
      on E : Exception Do
         MessageDlg ( E.Message, mtInformation, [mbOK],0 );
   end;
end;

procedure TWinData.tBullSemenAfterPost(DataSet: TDataSet);
begin
   KingData.ApplyUpdates([tBullSemen]);
end;

procedure TWinData.tBullExtAfterPost(DataSet: TDataSet);
begin
   //KingData.ApplyUpdates([tBullExt]);
   DBIForceWrite( tBullExt );
end;

procedure TWinData.MilkCumulativeAfterPost(DataSet: TDataSet);
begin
   KingData.ApplyUpdates([MilkCumulative]);
end;

procedure TWinData.tBullSemenBeforeInsert(DataSet: TDataSet);
begin
   // Set the ID of the animal into this Record
   If tBullSemen.Locate('AnimalID', AnimalFileByIDID.AsInteger,[] ) Then
      tBullSemen.Edit;
end;

procedure TWinData.EventsBeforeDelete(DataSet: TDataSet);
begin
   { Moorpark }
   if EventType = TSaleDeath then
      begin
         if MPSaleDeath = nil then
            New(MPSaleDeath); // Moorpark Sale / Death Status, record whether event is sale or death. Use MP Event Codes.
         if SaleDeathSold.AsBoolean then
            MPSaleDeath^ := PChar('ESEL')
         else
            MPSaleDeath^ := PChar('EDIE');
      end
   else if EventType = TService then
      begin
         if MPService = nil then
            New(MPService); // Moorpark Sale / Death Status, record whether event is sale or death. Use MP Event Codes.

         if LookupDamSire.Locate('ID', Services.FieldByName('ServiceBull').AsInteger, []) then
            if LookUpDamSire.FieldByname('HerdID').AsInteger = NONEHerdID then
               MPService^ := 'ESAI'
            else
               MPService^ := 'ESFB';
      end;

   try
      Case EventType of
         THealth,
         TDryOff    : if (Health.RecordCount > 0) then
                         begin
                            HealthBeforeEdit(Health);
                            Health.Delete;
                         end;
         TCalving   : ;
         TWeight    : if (Weighings.RecordCount > 0) then
                         Weighings.Delete;
         TBulling   : if (Bullings.RecordCount > 0) then
                         Bullings.Delete;
         TService   : if (Services.RecordCount > 0) then
                         Services.Delete;
         TPregDiag  : if (PregDiag.RecordCount > 0) then
                         PregDiag.Delete;
         TSaleDeath : if (SaleDeath.RecordCount > 0) then
                         SaleDeath.Delete;
         TPreSale   : if (SaleDeath.RecordCount > 0) then
                         SaleDeath.Delete;
         TPurchase  : if (Purchases.RecordCount > 0) then
                         Purchases.Delete;
         TMovement  : if (tMovements.RecordCount > 0) then
                         tMovements.Delete;
//         TStockBull : if (StockBull.RecordCount > 0) then
//                         StockBull.Delete;
//         TNewID     : if (NewID.RecordCount > 0) then
//                         NewID.Delete;
         TConditionScore  : if ConditionScore.RecordCount > 0 then
                               ConditionScore.Delete;
         TDiagnoseProblem : if DiagnoseProblem.RecordCount > 0 then
                               DiagnoseProblem.Delete;
         TEmbryoTransfer  : if EmbryoTransfer.RecordCount > 0 then
                               EmbryoTransfer.Delete;
         TInternalExam    : if IntExam.RecordCount > 0 then
                               IntExam.Delete;
         TRunBullIn,
         TRunBullOut      : if BullInOut.RecordCount > 0 then
                               BullInOut.Delete;
//         TAbortion        :
//         TCastrate        :
//         TMastitis        :
//         TToBeCulled      :
         TWean           : if Weaning.RecordCount > 0 then
                              Weaning.Delete;
         TMealFeeding    : if MealFeeding.RecordCount > 0 then
                              MealFeeding.Delete;
         TDisbudding     : if Disbudding.RecordCount > 0 then
                              Disbudding.Delete;
      end;
   except
      on E : Exception Do
         MessageDlg(E.Message,mtInformation,[mbOK],0);
   end;


                                  


   // save fields to variables for ICBF Deletions Table
   ICBFID := EventID.AsInteger;
   ICBFType := EventsEventType.AsInteger;
   ICBFDate := EventsEventDate.AsDateTime;
   ICBFHerdID := EventsHerdID.AsInteger;

   MPID     := ICBFID;
   MPType   := ICBFType;
   MPDate   := ICBFDate;
   MPHerdID := ICBFHerdID

end;

procedure TWinData.WeighingsNewRecord(DataSet: TDataSet);
begin
   // Set the relationship between the weighing record and the event
   WeightID.Value := EventID.Value;
end;

procedure TWinData.WriteTheEventRecord;
begin
   // Ensures the Record is written to the Disk
   DbiSaveChanges(Events.Handle);
   case EventType Of
      THealth,
      TDryOff     : DbiSaveChanges(Health.Handle);
      TWeight     : DbiSaveChanges(Weighings.Handle);
      TBulling    : DbiSaveChanges(Bullings.Handle);
      TService    : DbiSaveChanges(Services.Handle);
      TPregDiag   : DbiSaveChanges(PregDiag.Handle);
      TSaleDeath  : DbiSaveChanges(SaleDeath.Handle);
      TPurchase   : DbiSaveChanges(Purchases.Handle);
      TMovement   : DbiSaveChanges(tMovements.Handle);
      TPremium10,
      TPremium22,
      TPremiumBull: DbiSaveChanges(BeefSubsidy.Handle);
//      TStockBull  : DbiSaveChanges(StockBull.Handle);
      TNewID      : DbiSaveChanges(Events.Handle);
      TConditionScore : DbiSaveChanges(ConditionScore.Handle);
      TDiagnoseProblem : DbiSaveChanges(DiagnoseProblem.Handle);
      TEmbryoTransfer  : DbiSaveChanges(EmbryoTransfer.Handle);
      TInternalExam    : DbiSaveChanges(IntExam.Handle);
      TRunBullIn,
      TRunBullOut      : DbiSaveChanges(BullInOut.Handle);
      TMealFeeding : DbiSaveChanges(MealFeeding.Handle);
      TDisbudding : DbiSaveChanges(Disbudding.Handle);
//      TAbortion   :
//      TCastrate   :
//      TMastitis   :
//      TToBeCulled :
      TWean       :  DbiSaveChanges(Weaning.Handle);
   end;
end;

procedure TWinData.EventsAfterPost(DataSet: TDataSet);
type
   TPDeadCalf = ^TDeadCalf;
   TDeadCalf = record
      AnimalID : Integer;
      DateofBirth : TDateTime;
      DeadCalf : Boolean;
      DisposalPlace : Integer;
   end;

   TGroupRecord = record
      AnimalID : Integer;
      NatIDNum : string;
      GroupID : Integer;
   end;

   TNewIDRecord = record
      AnimalID : Integer;
      HerdID : Integer;
   end;

Var
   DamId,
   Counter  : Integer;
   AnimalId : Packed Array[1..cMaxCalves] Of Integer;       // Store the New Calves Animal ID
   AnimalReg : Packed Array[1..cMaxCalves] Of Boolean;      // Store the New Calves Reg Boolean
   AnimalHFSReg : Packed Array[1..cMaxCalves] Of Boolean;   // Store the New Calves HFS Reg Boolean
   DeadCalf : Packed Array[1..cMaxCalves] Of Boolean;     // Store status of calf in "Calvings.db"
   CalfMortality : Packed Array[1..cMaxCalves] Of Integer; // Store calving calf Mortality in "Calvings.db"
   ComplianceCert : Packed Array[1..cMaxCalves] Of Boolean;
   iDeadCalves : Array of TPDeadCalf;
   DeathEvent : TSaleDeathEvent;
   TempAnimalNo : String;
   AnimalTable : TTable;

   CalfGroups : Packed Array[1..cMaxCalves] Of TGroupRecord; // Store calving calf Mortality in "Calvings.db"
   CalfNewIDs : Packed Array[1..cMaxCalves] Of TNewIDRecord; // Store calving calf Mortality in "Calvings.db"

   HerdType : THerdType;
   NewIDEvent : TNewIDEvent;

   procedure NewCalves;
   var
      i, x : Integer;
      ThisEvent,
      ParentHerd : Integer;
      NatIdStr : String;
      nLoop : Integer;
      RegCountry : TCOuntry;

   begin

     for x := 1 to cMaxCalves Do
        begin
          AnimalID[x]      := 0;
          AnimalReg[x]     := TRUE;
          AnimalHFSReg[x]  := TRUE;
          DeadCalf[x]      := FALSE;
          CalfMortality[x] := 0;
          ComplianceCert[x] := False;
          CalfNewIDs[x].AnimalID := 0;
          CalfNewIDs[x].HerdID := 0;

          CalfGroups[x].AnimalID := 0;
          CalfGroups[x].NatIDNum := '';
          CalfGroups[x].GroupID := 0;
        end;

     SetLength(iDeadCalves, TempCalving.RecordCount);
     for x := 0 to TempCalving.RecordCount-1 do
        begin
           New(iDeadCalves[x]);
           iDeadCalves[x]^.AnimalID := 0;
           iDeadCalves[x]^.DateofBirth := 0;
           iDeadCalves[x]^.DeadCalf := False;
           iDeadCalves[x]^.DisposalPlace := 0;
        end;

     DamID := AnimalFileByIDID.Value;
     ParentHerd := AnimalFileByIdHerdId.Value;

     Counter := 1;
     // Store the Original Parent Animal
     OrigAnimalID := AnimalFileByIDID.Value;
     ThisEventDate := EventsEventDate.Value;
     // Store the Event ID of the Calving
     ThisEvent     := ThisEventID;

     RegCountry := DefCountry(AnimalFileByIDHerdID.AsInteger);
     try
        // Set the National ID to NOT required
        CalvingAnimal := TRUE;

        TempCalving.First;
        while ( NOT TempCalving.EOF ) do
           begin

              if ( TempCalving.FieldByName('CalfID').AsInteger <= 0 ) then
                 begin

                    tCalvingAnimal.Append; // Should Generate new ID
                    tCalvingAnimal.FieldByName('ID').AsInteger := NewID;
                    tCalvingAnimal.FieldByName('LactNo').AsInteger := 0;
                    tCalvingAnimal.FieldByName('AnimalNo').AsString := TempCalving.Fields[1].AsString;
                    tCalvingAnimal.FieldByName('NatIDNum').AsString := TempCalving.Fields[2].AsString;
                    tCalvingAnimal.FieldByName('Name').AsString := TempCalving.Fields[3].AsString;
                    tCalvingAnimal.FieldByName('Sex').AsString := TempCalving.Fields[4].AsString;
                    tCalvingAnimal.FieldByName('PrimaryBreed').AsInteger := TempCalving.Fields[5].AsInteger;
                    tCalvingAnimal.FieldByName('HerdID').AsInteger := ParentHerd;
                    tCalvingAnimal.FieldByName('Colour').AsInteger := TempCalving.Fields[7].AsInteger;
                    tCalvingAnimal.FieldByName('BirthWeight').AsFloat := TempCalving.FieldByName('BirthWeight').AsFloat;
                    tCalvingAnimal.FieldByName('AnimalDeleted').AsBoolean := FALSE;
                    tCalvingAnimal.FieldByName('InHerd').AsBoolean := not(TempCalving.FieldByName('CalfDead').AsBoolean);
                    tCalvingAnimal.FieldByName('DateOfBirth').Value := TempCalving.FieldByName('DOB').AsDateTime;
                    tCalvingAnimal.FieldByName('DamID').AsInteger := DamID;
                    tCalvingAnimal.FieldByName('DonorDamID').AsInteger := DonorDamID;
                    tCalvingAnimal.FieldByName('SireID').AsInteger := LastBull;
                    tCalvingAnimal.FieldByName('SortAnimalNo').AsString := SortAnimalNoString(tCalvingAnimal.FieldByName('AnimalNo').AsString);

                    // 08/01/09 V3.9 R5.6 /SP Default Calf to Pedigree if user has pedigree module.
                    if Def.Definition.dUsePedigree then
                       begin
                          tCalvingAnimal.FieldByName('Pedigree').AsBoolean := True;
                       end;

                    NatIdStr := tCalvingAnimal.FieldByName('NatIdNum').AsString;
                    try
                       tCalvingAnimal.FieldByName('SortNatId').AsString := CreateSortNatIDString(NatIDStr,ParentHerd);
                    except
                    end;

                    tCalvingAnimal.FieldByName('SearchNatID').AsString := WinData.StripAllNomNumAlpha(UPPERCASE(NatIdStr));

                    if NatIDKind(NatIdStr) = nkUK9 then
                       tCalvingAnimal.FieldByName('LocateNatID').AsString := UK9NatIDNumber.CreateLocateNatID(NatIdStr)
                    else
                       tCalvingAnimal.FieldByName('LocateNatID').AsString := tCalvingAnimal.FieldByName('SearchNatID').AsString;

                    // Get the Next Seq No from the Owner
                    tCalvingAnimal.FieldByName('SeqNo').AsInteger := GetSeqNo(ParentHerd);
                    // Increment the Seq no on the Owner File
                    if NOT IncreaseSeqNo(ParentHerd) then
                       MessageDLG('Invalid Sequence Number - error updating',mtwarning,[mbOk],0);

                    if UPPERCASE( TempCalving.Fields[4].AsString ) <> 'STEER' then //SP 08/12/00 Calved Male animals not used for breeding
                       tCalvingAnimal.FieldByName('Breeding').AsBoolean := TempCalving.FieldByName('Breeding').AsBoolean
                    else
                       tCalvingAnimal.FieldByName('Breeding').AsBoolean := FALSE;

                    AnimalID[Counter]      := tCalvingAnimal.FieldByName('ID').AsInteger;
                    AnimalReg[Counter]     := FALSE;
                    AnimalHFSReg[Counter]  := FALSE;
                    DeadCalf[Counter]      := TempCalving.FieldByName('CalfDead').AsBoolean;
                    CalfMortality[Counter] := TempCalving.FieldByName('CalfMortality').AsInteger;


                    tCalvingAnimal.Post;
                    DbiSaveChanges(tCalvingAnimal.Handle);

                    // if tag is found in tag store, update the tag store
                    if (HerdLookup.HerdOwnerData.InputNatIDStyle = cInputNatIDStyle_ListInput) then
                       try
                          HerdLookup.RemoveFromTagStore(ParentHerd,tCalvingAnimal.FieldByName('NatIDNum').AsString);
                       except
                          on e : exception do
                             begin
                                MessageDlg(cErrorContact_2 + cCRLFx2 + E.Message,mtError,[mbOk],0);
                             end;
                       end;

                    ComplianceCert[Counter] := TempCalvingComplianceCert.AsBoolean;

                    if ( Trim( tCalvingAnimal.FieldByName('AnimalNo').AsString ) <> '' ) and ( HerdType <> htBeef ) then
                       begin
                          CalfNewIDs[Counter].AnimalID := tCalvingAnimal.FieldByName('ID').AsInteger;
                          CalfNewIDs[Counter].HerdID := tCalvingAnimal.FieldByName('HerdID').AsInteger;
                       end;

                    if TempCalving.FieldByName('CalfDead').AsBoolean then
                       begin
                          nLoop := Counter-1;
                          iDeadCalves[nLoop]^.AnimalID    := tCalvingAnimal.FieldByName('ID').AsInteger;
                          iDeadCalves[nLoop]^.DateOfBirth := tCalvingAnimal.FieldByName('DateOfBirth').AsDateTime;
                          iDeadCalves[nLoop]^.DeadCalf   := TRUE;
                          iDeadCalves[nLoop]^.DisposalPlace  := TempCalving.FieldByName('DisposalPlace').AsInteger;
                       end
                    else
                       begin
                          if (TempCalving.FieldByName('GroupID').AsInteger > 0) then
                             begin
                                DefaultCalfGroup := TempCalving.FieldByName('GroupID').AsInteger;
                                CalfGroups[Counter].AnimalID := tCalvingAnimal.FieldByName('ID').AsInteger;
                                CalfGroups[Counter].GroupID := TempCalving.FieldByName('GroupID').AsInteger;
                                CalfGroups[Counter].NatIDNum := TempCalving.Fields[2].AsString;
                             end;
                       end;

                    for i := 1 to TempCalving.RecordCount do
                       begin
                          if DeadCalf[Counter] = False then
                             begin
                                if ( WinData.GlobalSettings.ShowCalfReg ) then
                                   ShowCalfRegReminder := True;
                                Break;
                             end;
                       end;

                 end
              else
                 begin
                    AnimalID[Counter]      := TempCalving.FieldByName('CalfID').AsInteger;
                    AnimalReg[Counter]     := FALSE;
                    AnimalHFSReg[Counter]  := FALSE;
                    DeadCalf[Counter]      := TempCalving.FieldByName('CalfDead').AsBoolean;
                    CalfMortality[Counter] := TempCalving.FieldByName('CalfMortality').AsInteger;

                    AnimalTable := TTable.Create(nil);
                    try
                       with AnimalTable do
                          begin
                             DatabaseName := AliasName;
                             TableName := 'animals';
                             Active := True;
                             try
                                if Locate('ID', TempCalving.FieldByName('CalfID').AsInteger, [] ) then
                                   begin
                                      Edit;
                                      try
                                         FieldByName('DamID').AsInteger := DamId;
                                         FieldByName('HerdID').AsInteger := ParentHerd;
                                         FieldByName('AnimalDeleted').AsBoolean := False;
                                         if ( WinData.LastBull > 0 ) then
                                            if ( WinData.LastBull <> FieldByName('SireID').AsInteger ) then
                                               FieldByName('SireID').AsInteger := WinData.LastBull;
                                         Post;
                                      except
                                         Cancel;
                                      end;
                                   end;
                             finally
                               Active := False;
                             end;
                          end;
                    finally
                       AnimalTable.Free;
                    end;
                 end;

             if ( RegCountry = Ireland) and (TempCalving.FieldByName('CalfDead').AsBoolean) then
                begin
                   // if tag style is style1999, register the calf even if marked as dead as valid tag
                   // has been used for calf.
                   AnimalReg[Counter]:= not( WhatStyleNatID(tCalvingAnimal.FieldByName('NatIDNum').AsString, True) = Style1999 );
                end;

             TempCalving.Next;
             Inc ( Counter );
          end;
     finally
        CalvingAnimal := FALSE;
     end;


     with TQuery.Create(nil) do
        try
           DatabaseName := AliasName;
           SQL.Add('INSERT INTO Calvings ( EventID, ID1, ID2, ID3, ID4,');
           SQL.Add('ID1Notified, ID2Notified, ID3Notified, ID4Notified,');
           SQL.Add('ID1HFSNotified, ID2HFSNotified, ID3HFSNotified, ID4HFSNotified,');
           SQL.Add('CalfDead1, CalfDead2, CalfDead3, CalfDead4,');
           SQL.Add('CalfMortality1, CalfMortality2, CalfMortality3, CalfMortality4,');
           SQL.Add('BirthType, DeadCalves, Mortality,');
           SQL.Add('ID1ComplianceCert, ID2ComplianceCert, ID3ComplianceCert, ID4ComplianceCert,');
           SQL.Add('ID1CTSReg, ID2CTSReg, ID3CTSReg, ID4CTSReg)');
           SQL.Add('VALUES ');
           SQL.Add('( :EventID, :ID1, :ID2, :ID3, :ID4,');
           SQL.Add(':ID1Notified, :ID2Notified, :ID3Notified, :ID4Notified,');
           SQL.Add(':ID1HFSNotified, :ID2HFSNotified, :ID3HFSNotified, :ID4HFSNotified,');
           SQL.Add(':CalfDead1, :CalfDead2, :CalfDead3, :CalfDead4,');
           SQL.Add(':CalfMortality1, :CalfMortality2, :CalfMortality3, :CalfMortality4,');
           SQL.Add(':BirthType, :DeadCalves, :Mortality,');
           SQL.Add(':ID1ComplianceCert, :ID2ComplianceCert, :ID3ComplianceCert, :ID4ComplianceCert,');
           SQL.Add(':ID1CTSReg, :ID2CTSReg, :ID3CTSReg, :ID4CTSReg)');
           Params[0].AsInteger := ThisEvent;
           Params[1].AsInteger := AnimalID[1];
           Params[2].AsInteger := AnimalID[2];
           Params[3].AsInteger := AnimalID[3];
           Params[4].AsInteger := AnimalID[4];
           Params[5].AsBoolean := AnimalReg[1];
           Params[6].AsBoolean := AnimalReg[2];
           Params[7].AsBoolean := AnimalReg[3];
           Params[8].AsBoolean := AnimalReg[4];
           Params[9].AsBoolean := AnimalHFSReg[1];
           Params[10].AsBoolean := AnimalHFSReg[2];
           Params[11].AsBoolean := AnimalHFSReg[3];
           Params[12].AsBoolean := AnimalHFSReg[4];
           Params[13].AsBoolean := DeadCalf[1];
           Params[14].AsBoolean := DeadCalf[2];
           Params[15].AsBoolean := DeadCalf[3];
           Params[16].AsBoolean := DeadCalf[4];
           Params[17].AsInteger := CalfMortality[1];
           Params[18].AsInteger := CalfMortality[2];
           Params[19].AsInteger := CalfMortality[3];
           Params[20].AsInteger := CalfMortality[4];
           Params[21].AsInteger := CalvingBirthType;
           Params[22].AsInteger := DeadCalves;
           Params[23].AsInteger := Mortality;
           Params[24].AsBoolean := ComplianceCert[1];
           Params[25].AsBoolean := ComplianceCert[2];
           Params[26].AsBoolean := ComplianceCert[3];
           Params[27].AsBoolean := ComplianceCert[4];
           Params[28].AsBoolean := FALSE;
           Params[29].AsBoolean := FALSE;
           Params[30].AsBoolean := FALSE;
           Params[31].AsBoolean := FALSE;
           try
              ExecSQL;
           except
              on e : exception do
                 begin
                    Showmessage(e.Message);
                 end;
           end;
        finally
           Free;
        end;

     for x := 1 to cMaxCalves do
       begin
          if ( CalfNewIDs[x].AnimalID > 0 ) then
             begin
                with TNewIDEvent.Create('tmp001') do
                   try
                      TSubEventTable := nil;
                      Append;
                      EventType := TNewID;
                      AnimalID := CalfNewIDs[x].AnimalID;
                      AnimalLactNo := 0;
                      EventDate := Date;
                      EventComment := 'New ID Allocation';
                      AnimalHerdID := CalfNewIDs[x].HerdID;
                      Post;
                   finally
                      Free;
                   end;
                TempCalving.Next;
             end;

          if ( CalfGroups[x].AnimalID > 0 ) then
             begin
                AddToGroup(CalfGroups[x].AnimalID, CalfGroups[x].GroupID, TRUE, Date, '', CalfGroups[x].NatIDNum);
             end;
     end;
{
     with Calvings do
        begin
           Append;
           FieldByName('EventID').AsInteger := ThisEvent;
           FieldByName('ID1').AsInteger := AnimalID[1];
           FieldByName('ID2').AsInteger := AnimalID[2];
           FieldByName('ID3').AsInteger := AnimalID[3];
           FieldByName('ID4').AsInteger := AnimalID[4];
           FieldByName('ID1Notified').AsBoolean := AnimalReg[1];
           FieldByName('ID2Notified').AsBoolean := AnimalReg[2];
           FieldByName('ID3Notified').AsBoolean := AnimalReg[3];
           FieldByName('ID4Notified').AsBoolean := AnimalReg[4];
           FieldByName('ID1HFSNotified').AsBoolean := AnimalHFSReg[1];
           FieldByName('ID2HFSNotified').AsBoolean := AnimalHFSReg[2];
           FieldByName('ID3HFSNotified').AsBoolean := AnimalHFSReg[3];
           FieldByName('ID4HFSNotified').AsBoolean := AnimalHFSReg[4];
           FieldByName('CalfDead1').AsBoolean       := DeadCalf[1];
           FieldByName('CalfDead2').AsBoolean       := DeadCalf[2];
           FieldByName('CalfDead3').AsBoolean       := DeadCalf[3];
           FieldByName('CalfDead4').AsBoolean       := DeadCalf[4];
           FieldByName('CalfMortality1').AsInteger  := CalfMortality[1];
           FieldByName('CalfMortality2').AsInteger  := CalfMortality[2];
           FieldByName('CalfMortality3').AsInteger  := CalfMortality[3];
           FieldByName('CalfMortality4').AsInteger  := CalfMortality[4];
           FieldByName('BirthType').AsInteger := CalvingBirthType;
           FieldByName('DeadCalves').AsInteger := DeadCalves;
           FieldByName('Mortality').AsInteger := Mortality;
           FieldByName('ID1ComplianceCert').AsBoolean       := ComplianceCert[1];
           FieldByName('ID2ComplianceCert').AsBoolean       := ComplianceCert[2];
           FieldByName('ID3ComplianceCert').AsBoolean       := ComplianceCert[3];
           FieldByName('ID4ComplianceCert').AsBoolean       := ComplianceCert[4];
           FieldByName('ID1CTSReg').AsBoolean := FALSE;
           FieldByName('ID2CTSReg').AsBoolean := FALSE;
           FieldByName('ID3CTSReg').AsBoolean := FALSE;
           FieldByName('ID4CTSReg').AsBoolean := FALSE;
           Post;
           KingData.ApplyUpdates([Calvings]);
        end;
}
        for nLoop := 0 to TempCalving.RecordCount-1 do
           try
              if (iDeadCalves[nLoop]^.AnimalID > 0) and (iDeadCalves[nLoop]^.DeadCalf = True ) then
                  begin
                     DeathEvent := TSaleDeathEvent.Create('TmpSale');
                     try
                        with DeathEvent do  { SP 10/02/2003 Create Death events for all dead calves. }
                           try
                              DeathEvent.Append;
                              DeathEvent.EventType := TSaleDeath;
                              DeathEvent.AnimalID  := iDeadCalves[nLoop]^.AnimalID;
                              DeathEvent.AnimalLactNo := 0;
                              DeathEvent.AnimalHerdID := ParentHerd;
                              DeathEvent.EventDate    := iDeadCalves[nLoop]^.DateofBirth;
                              DeathEvent.EventComment := 'Died at birth';
                              DeathEvent.Sold := FALSE;
                              DeathEvent.Customer := iDeadCalves[nLoop]^.DisposalPlace;
                              DeathEvent.Notified := FALSE;
                              DeathEvent.PreSale  := FALSE;
                              DeathEvent.Slaughter := FALSE;
                              DeathEvent.EventSource := sInternal;
                              AddToEventLookupData(iDeadCalves[nLoop]^.AnimalID, CSaleDeathEvent);
                              DeathEvent.Post;
                           except
                              DeathEvent.Cancel;
                           end;
                        finally
                           DeathEvent.Free;
                        end;
                    end;
           finally
              if (iDeadCalves) <> nil then
                 Dispose(iDeadCalves[nLoop]);
           end;
   end;

   Procedure UpdateAnimal;
   begin
      try
        CalvingAnimal := TRUE;
        try
           if tCalvingAnimal.Locate('ID',OrigAnimalId,[]) then
              begin
                 if WinData.EventStatus = EAdding then
                    with tCalvingAnimal DO
                      begin
                        Edit;
                        tCalvingAnimal.FieldByName('LactNo').Value := tCalvingAnimal.FieldByName('LactNo').Value + 1;
                        Post;
                        DbiSaveChanges(tCalvingAnimal.Handle);
                      end;
                  // Don't Update if  EAddingAtSetup
                  if WinData.EventStatus = EAdding then
                     begin
                        if ( OrigBull <> LastBull ) And ( LastBull > 0 ) then
                           begin
                              // Try and find the last Service for the Last Lactation
                              // Clear the Filter
                              CheckEvents.Filter := '';
                              CheckEvents.Filtered := False;
                              // Check the Last Service
                              CheckEvents.Filter := '(AnimalID = ' + tCalvingAnimal.FieldByName('ID').AsString + ') And (AnimalLactNo = ' + IntToStr(tCalvingAnimal.FieldByName('LactNo').AsInteger-1) + ') And (EventType = ' + IntToStr(CServiceEvent) + ')';
                              CheckEvents.Filtered := True;
                              if CheckEvents.FindLast then
                                 if LookUpServices.Locate('EventID',CheckEvents.FieldByName('ID').AsInteger,[] ) then
                                    begin
                                      LookUpServices.Edit;
                                      LookUpServices.FieldByName('ServiceBull').AsInteger := LastBull;
      //                                LookUpServices.FieldByName('GeneticDam').AsInteger  := ;
                                      LookUpServices.Post;
                                      DbiSaveChanges(LookUpServices.Handle);
                                   end;
                              CheckEvents.Filtered := False;
                              CheckEvents.Filter := '';
                           end;
                     end;
               end;
        except
          MessageDlg('Could not Update Animal',mtInformation,[mbOK],0);
        end;
      finally
        CalvingAnimal := FALSE;
      end;
   end;

var
   InInsertMode : Boolean;
   LastID : Integer;
begin
   HerdType := HerdLookup.GetHerdType(WinData.AnimalFileByIDHerdID.AsInteger);
   LastID := EventID.AsInteger;
   CheckEventID := LastID;
   try
      Case EventType Of
          TCalving : begin
                        // Store the Event ID
                        ShowCalfRegReminder := False;

                        if ( WinData.EventStatus = EAdding ) and ( Events.RecordCount = 1 ) then
                           begin
                              // Work around for "At End of Table" BDE Bug
                              // Update of Events Table lactation number does not corresspond to
                              // that of the Animals table lact 0.
                              // Temporarily set the lactation number to 1 if calving heifer.
                              // and no prior events exist.
                              // This workaround put in after DevExpress grids on front grid
                              // were incorporated into program.
                              AnimalFileByID.Edit;
                              AnimalFileByIDLactNo.AsInteger := AnimalFileByIDLactNo.AsInteger + 1;


                              KingData.ApplyUpdates([Events]);
                              AnimalFileByID.Cancel;
                           end
                        else
                           KingData.ApplyUpdates([Events]);

                        //WinData.SavePreferences; // Update the National Identity Animal Number (Automatic Numbering)

                        // If adding then add calf records and up the Lact No
                        if ( WinData.EventStatus in [EAdding,EAddingAtSetUp] ) then
                           try
                              // Open the TTable to insert Calves.
                              tCalvingAnimal.Open;
                              // Insert Calves Info.
                              NewCalves;
                              // Now Update the Lactation number of the Animal
                              // if the Calving isn't being added from SetUp Screen
                              { ********* Changed to update animalfilebyid, it wasn't picking up new Calve! **********}
                              if WinData.EventStatus in [EAdding,EAddingAtSetUp] then
                                 UpDateAnimal; // while in here, do check for EAddingAtSetup!!!
                           finally
                              tCalvingAnimal.Close;
                              // ReFresh the Query
                              MenuForm.SetUpQuery;
                           end;
                     end;
          THealth,
          TDryOff  : begin
                        // 09/02/2009 [Dev 3.9 R6.0] /SP Bug Fix - Only update medicine stock after event has been posted.
                        // previously this was done on Health after post, which wasnt working correctly.
                        if NOT (( OrigDrug = HealthDrugUsed.Value ) And ( OrigQty = HealthRateApplic.Value )) then
                           begin
                              UpdateMedicine ( OrigDrug, OrigQty, 0 );
                              UpdateMedicine ( HealthDrugUsed.Value, -DrugQtyUsed, 0 );
                           end;
                        KingData.ApplyUpdates([Health,Events]);
                        sSubEventTable := Health.TableName;
                     end;
          TWeight  : KingData.ApplyUpdates([Weighings,Events]);
          TBulling : begin
                        { Save Defaults }
                        BullingDefaults.EventDate := EventsEventDate.AsDateTime;
                        BullingDefaults.Comment := EventsEventDesc.AsString;
                        BullingDefaults.PlannedBull := BullingsPlannedBull.AsInteger;
                        BullingDefaults.ObservedBy := BullingsObservedBy.AsInteger;
                        KingData.ApplyUpdates([Bullings,Events]);
                     end;
          TService : begin
                        { Save Defaults }
                        ServiceDefaults.EventDate := EventsEventDate.AsDateTime;
                        ServiceDefaults.Comment   := EventsEventDesc.AsString;
                        ServiceDefaults.NumOfStraws := ServicesAmountOfStraw.AsInteger;
                        ServiceDefaults.BullUsed := ServicesServiceBull.AsInteger;
                        ServiceDefaults.ServiceType := ServicesServiceType.AsInteger;
                        KingData.ApplyUpdates([Services,Events]);
                     end;
          TPregDiag : KingData.ApplyUpdates([PregDiag,Events]);
          TSaleDeath : begin
                          sSubEventTable := SaleDeath.TableName;
                          if NOT(MassSalesUpdate) then
                             begin
                                if NOT WinData.IsItPreSale then
                                   begin
                                      SetInHerdStatus(False);
                                      InInsertMode := ( WinData.Events.UpdateStatus = usInserted );
                                      if fRemarks.RemarksAdded then
                                         begin
                                            WriteRemarks;
                                            KingData.ApplyUpdates([ SaleDeath, Events, tRemarks]);
                                            tRemarks.Close;
                                         end
                                      else
                                         begin
                                            KingData.ApplyUpdates([ SaleDeath, Events ]);
                                         end;

                                      if ( ( InInsertMode ) and ( GlobalSettings.RenumAnimalNo ) ) then
                                         begin
                                            //this is where we need to renumber animals //joanne tighe 10/3/04
                                            TempAnimalNo := '';
                                            LookupAnimals.Open;
                                            try
                                               if LookupAnimals.Locate('ID', AnimalFileByIDID.AsInteger, []) then
                                                  begin
                                                     if ( LookupAnimals.FieldByName('AnimalNo').AsString <> '' ) then
                                                        begin
                                                           if GlobalSettings.ReNumFormat = '/yy' then
                                                              begin
                                                                 if Length(Trim(AnimalFileByIDAnimalNo.AsString)) <= 7 then
                                                                    TempAnimalNo := (AnimalFileByIDAnimalNo.AsString +'/' + FormatDateTime('yy', Date));
                                                              end
                                                           else if GlobalSettings.ReNumFormat = '(yy)' then
                                                              begin
                                                                 if Length(Trim(AnimalFileByIDAnimalNo.AsString)) <= 6 then
                                                                    TempAnimalNo := (AnimalFileByIDAnimalNo.AsString +'(' + FormatDateTime('yy', Date) + ')');
                                                              end;

                                                           if ( TempAnimalNo <> '' ) then
                                                              begin
                                                                 if CheckAnimalNoInUse(TempAnimalNo, AnimalFileByIDHerdID.AsInteger) = Allok then
                                                                    begin
                                                                       LookupAnimals.Edit;
                                                                       try
                                                                          LookupAnimals.FieldByName('AnimalNo').AsString := TempAnimalNo;
                                                                          LookupAnimals.Post;
                                                                          DBIForceWrite(LookupAnimals);
                                                                       except
                                                                          LookupAnimals.Cancel;
                                                                          MessageDlg(Format('Failed to re-number animal %s', [AnimalFileByIDAnimalNo.AsString]), mtError,[mbOK],0);
                                                                       end;
                                                                    end;
                                                                 end
                                                              else
                                                                 MessageDlg('The Animal Number cannot be changed. ' + cCRLF +
                                                                            'The new Animal Number value exceeds maximum field length of 10 characters.', mtInformation,[mbOK],0);
                                                        end;
                                                  end
                                               else
                                                  MessageDlg(Format('Failed to re-number animal %s', [AnimalFileByIDAnimalNo.AsString]), mtError,[mbOK],0);
                                            finally
                                               LookupAnimals.Close;
                                            end;
                                         end;
                                // update EventLookupData;
                                AddToEventLookupData( WinData.AnimalFileByIDID.AsInteger, cSaleDeathEvent);
                             end;
                       end;
{          TSaleDeath : begin
                          if NOT(MassSalesUpdate) then
                             begin
                                if fRemarks.RemarksAdded then
                                   begin
                                      WriteRemarks;
                                      KingData.ApplyUpdates([SaleDeath,Events,tRemarks]);
                                      tRemarks.Close;
                                   end
                                else
                                   KingData.ApplyUpdates([SaleDeath,Events]);

                                // Mark the Animal as Left Herd
                                if NOT WinData.IsItPreSale then
                                   begin
                                      if NOT ( AnimalFileByID.state in dsEditmodes ) then
                                         AnimalFileById.Edit;
                                      try
                                         AnimalFileByIdInHerd.Value := False;
                                         //this is where we need to renumber animals
                                         if GlobalSettings.RenumAnimalNo then //joanne tighe 10/3/04
                                            begin
                                               if GlobalSettings.ReNumFormat = '/yy' then
                                                  TempAnimalNo := (AnimalFileByIDAnimalNo.AsString +'/' + FormatDateTime('yy', Date))
                                               else
                                                  TempAnimalNo := (AnimalFileByIDAnimalNo.AsString +'(' + FormatDateTime('yy', Date) + ')');
                                               if CheckAnimalNoInUse(TempAnimalNo, AnimalFileByIDHerdID.AsInteger) = Allok then
                                                 AnimalFileByIDAnimalNo.AsString := TempAnimalNo;
                                            end;
                                         AnimalFileById.Post;
                                      except
                                         AnimalFileByID.Cancel;
                                      end;

                                   end;
                             end;
                       end;
          TSaleDeath : begin
                          if NOT(MassSalesUpdate) then
                             begin
                                if fRemarks.RemarksAdded then
                                   begin
                                      WriteRemarks;
                                      KingData.ApplyUpdates([SaleDeath,Events,tRemarks]);
                                      tRemarks.Close;
                                   end
                                else
                                   KingData.ApplyUpdates([SaleDeath,Events]);

                                // Mark the Animal as Left Herd
                                if NOT WinData.IsItPreSale then
                                   begin
                                      if NOT ( AnimalFileByID.state in dsEditmodes ) then
                                         AnimalFileById.Edit;
                                      AnimalFileByIdInHerd.Value := False;
                                      AnimalFileById.Post;
                                   end;
                             end;}
                       end;
          TPreSale   : KingData.ApplyUpdates([SaleDeath,Events]);
          TPurchase  : begin
                          sSubEventTable := Purchases.TableName;
                          if fRemarks.RemarksAdded then
                             begin
                                WriteRemarks;
                                KingData.ApplyUpdates([Purchases,Events,tRemarks]);
                                tRemarks.Close;
                             end
                          else
                             KingData.ApplyUpdates([Purchases,Events]);

                          // update EventLookupData;
                          AddToEventLookupData( WinData.AnimalFileByIDID.AsInteger, cPurchaseEvent);
                       end;
          TMovement  : KingData.ApplyUpdates([tMovements,Events]);
          TPremium10,
          TPremium22,
          TPremiumBull
                           : KingData.ApplyUpdates([BeefSubsidy,Events]);
          TStockBull       : KingData.ApplyUpdates([{StockBull,}Events]);
          TNewID           : KingData.ApplyUpdates([{NewID,}Events]);
          TAbortion        : KingData.ApplyUpdates([Events]);
          TCastrate        : begin
                                UpdateAnimalSex('Bull');
                                KingData.ApplyUpdates([Events, AnimalFileById]);
                             end;
          TConditionScore  : KingData.ApplyUpdates([ConditionScore, Events]);
          TDiagnoseProblem : KingData.ApplyUpdates([DiagnoseProblem, Events]);
          TEmbryoTransfer  : KingData.ApplyUpdates([EmbryoTransfer,Events]);
          TMastitis        : KingData.ApplyUpdates([Events]);
          TToBeCulled      : begin
                                KingData.ApplyUpdates([Events]);
                                WinData.UpdateCowFertilityCulledStatus(WinData.AnimalFileByIDID.AsInteger,True,EventsEventDate.AsDateTime);
                             end;
          TWean            : KingData.ApplyUpdates([Weaning, Events]);
          TInternalExam    : KingData.ApplyUpdates([IntExam, Events]);
          TRunBullIn,
          TRunBullOut      : KingData.ApplyUpdates([BullInOut, Events]);
          TMealFeeding     : KingData.ApplyUpdates([MealFeeding, Events]);
          TDisbudding      : KingData.ApplyUpdates([Disbudding, Events]);
      End;
      // write events to disk
      WriteTheEventRecord;

      if (EventType in [ TPurchase,TSaleDeath,THealth]) then
         begin
            if CheckEventID = 0 then
               CheckEventID := EventID.AsInteger;
            CheckEventConsistency;
         end;

   except
      on e : exception do
      begin
      Case EventType Of
         TCalving :  begin
                        AnimalFileById.CancelUpdates;
                        Events.CancelUpdates;
                        Calvings.CancelUpdates;
                     end;
         TWeight  :  begin
                        Events.CancelUpdates;
                        Weighings.CancelUpdates;
                     end;
         TBulling :  begin
                        Events.CancelUpdates;
                        Bullings.CancelUpdates;
                     end;
         TService :  begin
                        Events.CancelUpdates;
                        Services.CancelUpdates;
                     end;
         TSaleDeath: begin
                        Events.CancelUpdates;
                        SaleDeath.CancelUpdates;
                     end;
         TPurchase:  begin
                        Events.CancelUpdates;
                        Purchases.CancelUpdates;
                     end;
         THealth,
         TDryOff  :  begin
                        Events.CancelUpdates;
                        Health.CancelUpdates;
                     end;
         TPremium10,
         TPremium22,
         TPremiumBull
                  :  begin
                        Events.CancelUpdates;
                        BeefSubsidy.CancelUpdates;
                     end;
         TMovement : begin
                        Events.CancelUpdates;
                        tMovements.CancelUpdates;
                     end;
         TStockBull: begin
                        Events.CancelUpdates;
//                        StockBull.CancelUpdates;
                     end;
         TNewID    : begin
                        Events.CancelUpdates;
//                        NewID.CancelUpdates;
                     end;
         TAbortion        : Events.CancelUpdates;

         TCastrate        : Events.CancelUpdates;
         TConditionScore  : begin
                               Events.CancelUpdates;
                               ConditionScore.CancelUpdates;
                            end;
         TDiagnoseProblem : begin
                               Events.CancelUpdates;
                               DiagnoseProblem.CancelUpdates;
                            end;
         TEmbryoTransfer  : begin
                               Events.CancelUpdates;
                               EmbryoTransfer.CancelUpdates;
                            end;
         TMastitis        : Events.CancelUpdates;
         TToBeCulled      : Events.CancelUpdates;
         TInternalExam    : begin
                               Events.CancelUpdates;
                               IntExam.CancelUpdates;
                            end;
         TRunBullIn,
         TRunBullOut      : begin
                               Events.CancelUpdates;
                               BullInOut.CancelUpdates;
                            end;
         TWean            : begin
                               Events.CancelUpdates;
                               Weaning.CancelUpdates;
                            end;
         TMealFeeding     : begin
                               Events.CancelUpdates;
                               MealFeeding.CancelUpdates;
                            end;
         TDisbudding      : begin
                               Events.CancelUpdates;
                               Disbudding.CancelUpdates;
                            end;
      end;
         MessageDlg(e.message + ' Database Error - Contact Kingswood',mterror,[mbOK],0);
      end;
   end;

   // reposition the cursor to the record modified record.
   Events.Locate('ID',LastID,[]);
{   if (NOT (EventType IN ([TPremium10,TPremium22,TPremiumBull, TNewID]))) then
      AnimalEventSQL;}
end;

procedure TWinData.EventsAfterCancel(DataSet: TDataSet);
begin
   case EventType of
      TCalving   : begin
                      AnimalFileById.CancelUpdates;
                      LoadPreferences; // Update the calf number to stored number
                   end;

      TBulling   : Bullings.CancelUpdates;
      TDryOff,
      THealth    : Health.CancelUpdates;
      TService   : Services.CancelUpdates;
      TWeight    : Weighings.CancelUpdates;
      TPregDiag  : PregDiag.CancelUpdates;
      TPremium10,
      TPremium22,
      TPremiumBull : BeefSubsidy.CancelUpdates;
      TSaleDeath : SaleDeath.CancelUpdates;
      TPreSale : SaleDeath.CancelUpdates; { Presale }
      TPurchase  : Purchases.CancelUpdates;
      TMovement  : tMovements.CancelUpdates;
//    TStockBull : StockBull.CancelUpdates;
//    TNewID : NewID.CancelUpdates;
      // MoorePark
      TConditionScore  : ConditionScore.CancelUpdates;
      TDiagnoseProblem : DiagnoseProblem.CancelUpdates;
      TEmbryoTransfer  : EmbryoTransfer.CancelUpdates;
      TInternalExam    : IntExam.CancelUpdates;
      TRunBullIn,
      TRunBullOut      : BullInOut.CancelUpdates;
//    TAbortion  :
//    TCastrate  :
//    TMastitis   :
//    TToBeCulled :
      TWean       : begin
                       Weaning.CancelUpdates;
                    end;
      TDisbudding : begin
                       Disbudding.CancelUpdates;
                    end;
      TMealFeeding : begin
                        MealFeeding.CancelUpdates;
                     end;
   end;
end;

procedure TWinData.MedicineAfterPost(DataSet: TDataSet);
begin
   KingData.ApplyUpdates([Medicine]);
end;

procedure TWinData.SetUpQueries;
var
   Country : TCountry;
begin
   With Windata Do
      begin
         qHealthCodes.Open;
         
         qApplicMethod.SQL.Clear;
         qApplicMethod.SQL.Add('SELECT DISTINCT ID, Description FROM "GenLook.DB" where ListType = ' + IntToStr(LApplicMethod) + ' ORDER BY Description');
         qApplicMethod.Open;


         Country := System_Registered_Country;
         qBirthType.SQL.Clear;
         if Country = Ireland then
            qBirthType.SQL.Add('SELECT DISTINCT ID, Description FROM "GenLook.DB" where ListType = ' + IntToStr(LBirthType) + ' AND Description LIKE ''ICBF%'' ORDER BY Description')
         else // Original Query >>
            qBirthType.SQL.Add('SELECT DISTINCT ID, Description FROM "GenLook.DB" where ListType = ' + IntToStr(LBirthType) + ' ORDER BY Description');
         qBirthType.Open;

         qObservedBy.SQL.Clear;
         qObservedBy.SQL.Add('SELECT DISTINCT ID, Description FROM "GenLook.DB" where ListType = ' + IntToStr(LObservedBy) + ' ORDER BY Description');
         qObservedBy.Open;

         qServiceType.SQL.Clear;
         qServiceType.SQL.Add('SELECT DISTINCT ID, Description FROM "GenLook.DB" where ListType = ' + IntToStr(LServiceType) + ' ORDER BY Description');
         qServiceType.Open;
         qHerdType.SQL.Clear;
         qHerdType.SQL.Add('SELECT DISTINCT ID, Description FROM "GenLook.DB" where ListType = ' + IntToStr(LHerdType) + ' ORDER BY Description');
         qHerdType.Open;

         qAnimalColours.SQL.Clear;
         qAnimalColours.SQL.Add('SELECT DISTINCT ID, Description, LookUpCode FROM "GenLook.DB" where ListType = ' + IntToStr(LAnimalColour) + ' ORDER BY Description');
         qAnimalColours.Open;

         qCulling.SQL.Clear;
         qCulling.SQL.Add('SELECT DISTINCT ID, Description FROM "GenLook.DB" where ListType = ' + IntToStr(LCulledCode) + ' ORDER BY Description');
         qCulling.Open;
         qMortality.SQL.Clear;
         qMortality.SQL.Add('SELECT DISTINCT ID, Description FROM "GenLook.DB" where ListType = ' + IntToStr(LMortality) + ' ORDER BY Description');
         qMortality.Open;
         qFeedCat.SQL.Clear;
         qFeedCat.SQL.Add('SELECT DISTINCT ID, Description FROM "GenLook.DB" where ListType = ' + IntToStr(LFeedCategory) + ' ORDER BY Description');
         qFeedCat.Open;
         qExamReason.SQL.Clear;
         qExamReason.SQL.Add('SELECT DISTINCT ID, Description, LookUpCode FROM "GenLook.DB" where ListType = ' + IntToStr(LIntExamRea) + ' ORDER BY Description');
         qExamReason.Open;
         qExamMethod.SQL.Clear;
         qExamMethod.SQL.Add('SELECT DISTINCT ID, Description, LookUpCode FROM "GenLook.DB" where ListType = ' + IntToStr(LIntExamMet) + ' ORDER BY Description');
         qExamMethod.Open;
         qResCodes.SQL.Clear;
         qResCodes.SQL.Add('SELECT DISTINCT ID, Description, LookUpCode FROM "GenLook.DB" where ListType = ' + IntToStr(LIntExamRes) + ' ORDER BY Description');
         qResCodes.Open;

         QuerySpecies.Close;
         QuerySpecies.Open;
         // open the Herd Default Query
         qHerdDefaults.Open;
         if (HerdLookup <> nil) then
            begin
               HerdLookup.QueryMedicineGroups.Active := False;
               HerdLookup.QueryMedicineGroups.Active := True;
            end;
      end;
end;

procedure TWinData.TempCalvingBeforePost(DataSet: TDataSet);
// 03/02/09 [Rel V3.9 R5.9, Dev V3.9 R4.9] /SP Program Change - TempCalving OnNewRecord, Much tighter validation on the IE Nat. Id. No. Do not
//                                                              allow invalid or uncomplete tag number to be saved.
//                                                              general refactor of OnNewRecord procedure code.

   procedure CheckColour;
   begin
      if TempCalving.FieldByName('Colour').AsInteger <= 0 then
         raise ErrorMsg.Create('You must enter a colour for this animal');
   end;

   procedure CheckBreed;
   begin
      // make breed required field - 27/3/00 kr
      if (TempCalvingBreed.IsNull) or (TempCalving.FieldByName('Breed').AsInteger = 0) then
         raise ErrorMsg.CreateFmt('You must enter a breed for this animal',[nil]);
   end;

   procedure CheckSex;
   begin
      if ( UpperCase(TempCalving.FieldByName('Sex').AsString) = 'STEER' ) then
         TempCalving.FieldByName('Sex').AsString := 'Steer'
      else if ( UpperCase(TempCalving.FieldByName('Sex').AsString) = 'FEMALE' ) then
         TempCalving.FieldByName('Sex').AsString := 'Female'
      else if ( UpperCase(TempCalving.FieldByName('Sex').AsString) = 'BULL' ) then
         TempCalving.FieldByName('Sex').AsString := 'Bull'
      else
         raise ErrorMsg.Create('Invalid Sex Entered - Please Re-enter a valid Sex');
   end;

var
   Country : TCountry;
   TempNatIdNo : string;
begin
   { TEST for Calf No }
   // Check one of the 2 Animal No are filled
   // Only check the Record if the Calf is being added i.e. NEW CALVING EVENT
   // Otherwise if they are amending the Animal WILL exist in the Animals Table
   if WinData.EventStatus in [EAdding,EAddingAtSetUp] then
      begin
         if ( not ActivePDAEvents ) then
            begin

               Country := DefCountry(TempCalvingHerdID.AsInteger);

                  { SP 18/03/2003 :- }
               if ( Length(Trim(TempCalvingNatID.AsString)) > 0 ) then
                 if (( LookUpDamSire.Locate('NatIDNum', TempCalvingNatID.AsString, [] )) and
                   // deleted calving sets Herd to Null.
                   ( not LookUpDamSire.FieldByName('HerdID').IsNull  ) and ( not LookUpDamSire.FieldByName('AnimalDeleted').AsBoolean )) or
                   (( LookUpTempCalving.Locate('NatID', TempCalvingNatID.AsString, [] )) And
                    ( TempCalvingID.AsInteger <> LookUpTempCalving.FieldByName('ID').AsInteger )) then
                      raise ErrorMsg.CreateFmt('Nat. Id. No. has already been entered.',[nil]);

                  if NOT ( TempCalvingCalfNo.IsNull ) then
                     if LookUpDamSire.Locate('AnimalNo;HerdID',VarArrayOf([TempCalvingCalfNo.AsVariant,TempCalvingHerdID.AsVariant]),[] ) then
                        if ( TempCalvingID.AsInteger <> LookUpDamSire.FieldByName('ID').AsInteger ) then
                           raise ErrorMsg.CreateFmt('Animal No. %s has already been used in this Herd',[TempCalvingCalfNo.AsVariant]);

                  { SP 18/03/2003 - If herd is registered in NIreland, check for animal colour }
                  {                 if doesn't exist raise error msg }

                  if ( Country = NIreland ) then
                     begin
                        CheckSex;
                        CheckColour;
                        CheckBreed;
                     end
                  else if ( Country = Ireland ) then
                     begin

                        // If the calf is alive, ensure National Id. No. is entered in full and is valid national id.
                        if (not ( TempCalvingCalfDead.AsBoolean )) then
                           begin
                              TempNatIdNo := StripAllNomNumAlpha(TempCalvingNatID.AsString);
                              if ((Copy(TempNatIdNo,1,2) <> 'IE') and ( Length(TempNatIdNo) <> 14 )) then
                                 raise ErrorMsg.CreateFmt(cInvalid_NatIdNo+cCRLFx2+
                                                          'Please check the "Nat. Id. No." field is fully entered before saving calving event.',[nil])
                              else if not WinData.CheckNatID(TempCalvingNatID.AsString, TempNatIdNo, TRUE) then   //Checks for a valid NatID Number format
                                 raise ErrorMsg.CreateFmt(cInvalid_NatIdNo+cCRLFx2+
                                                          'Please check you have entered the correct digits for the "Nat. Id. No." value.',[nil]);
                           end;
                        CheckSex;
                        CheckBreed;
                     end;
            end
         else
            begin
               // PDA Calving validation is done in calving.pas OnSave Click.
               if NOT ( TempCalvingCalfNo.IsNull ) then
                  if LookUpDamSire.Locate('AnimalNo;HerdID',VarArrayOf([TempCalvingCalfNo.AsVariant,TempCalvingHerdID.AsVariant]),[] ) then
                        begin
                           MessageDlg(Format('Animal No. %s has already been used in this Herd',[TempCalvingCalfNo.AsString]),mtError,[mbOK],0);
                           //TempCalvingCalfNo.AsString := '';
                        end;

               //if WinData.TempCalvingCalfDead.AsBoolean then // clear nationalid for dead calves
                 // begin
                   //  WinData.TempCalvingNatID.Clear;
//                  end
            end;

      end;

end;

procedure TWinData.EventsBeforePost(DataSet: TDataSet);
const
   CSMinValue = 1;
   CSMaxValue = 5;

   // SP.
   procedure WriteDetails;
   begin

      if EventsICBFNotified.AsBoolean then
         begin
            EventsICBFNotified.AsBoolean := False;
            EventsICBFAction.AsString := 'M';
         end;
      if EventsMPNotified.AsBoolean then
         begin
            EventsMPNotified.AsBoolean := False;
            EventsMPAction.AsString := 'M';
         end;
   end;

var
   TempInt, i : Integer;
   TempDate, LastEventDate : TDateTime;
   CastrationDate, WeaningDate, MealFeedingDate : TDateTime;
   HerdType : THerdType;
   LactNo : Integer;

   DateOfBirth : TDateTime;
   CheckWeaning : Boolean;

   NoOfAntibioticDosesPastYear : Integer;
begin

   if not WinData.AnimalFileByIDInHerd.AsBoolean then
      begin
         if not(EventsEventType.AsInteger in [cSaleDeathEvent,CNewIDEvent]) then
            begin
               LastEventDate := EventDataHelper.GetLastEventDate(AnimalFileByIDID.AsInteger, -1, cSaleDeathEvent);
               if LastEventDate > 0 then
                  begin
                     // Check Purchase Date is before Sale/Death Date
                     if ( Events.FieldByName('EventDate').AsDateTime > LastEventDate ) then
                        begin
                           MessageDlg(Format('Event date %s cannot be after Sale/Death date %s ',
                                     [FormatDate(Events.FieldByName('EventDate').AsDateTime, dsIrish),
                                      FormatDate(LastEventDate, dsIrish  ) ] ),mtError,[mbOk],0);
                           SysUtils.Abort;
                        end;
                  end;
            end;
      end;

      case Events.FieldByName('EventType').Value of
         cSaleDeathEvent : begin
                              if ( Events.State = dsInsert) and (SaleDeathSold.AsBoolean) and (WinData.AnimalFileByIDLactNo.AsInteger=0) then
                                 begin
                                    HerdType := HerdLookup.GetHerdType(WinData.AnimalFileByIDHerdID.AsInteger);
                                    if (HerdType <> htBeef) then
                                       begin
                                          CheckWeaning := False;
                                          DateOfBirth := WinData.AnimalFileByIDDateOfBirth.AsDateTime;
                                          if (DateOfBirth > 0) then
                                             begin
                                                if (HerdType = htSuckler) then
                                                   begin
                                                      // CheckWeaning = True if animal is less than or equal to 12 months of age.
                                                      CheckWeaning := (DateOfBirth >= IncMonth(Date, -12));
                                                   end
                                                else if (HerdType = htDairy) then
                                                   begin
                                                      // CheckWeaning = True if animal is less than or equal to 12 months of age and greater than or equal to 10 weeks.
                                                      CheckWeaning := ((DateOfBirth >= IncMonth(Date, -12)) and (DateOfBirth <= IncDay(Date,-70)));
                                                   end;

                                                if ((CheckWeaning) and (RegisteredCountry=Ireland)) then
                                                   begin
                                                      WeaningDate := EventDataHelper.GetLastEventDate(WinData.AnimalFileByIDID.AsInteger,-1, CWeaningEvent);
                                                      if WeaningDate > 0 then
                                                         begin
                                                            if ( EventsEventDate.AsDateTime >= WeaningDate ) and ( EventsEventDate.AsDateTime <= WeaningDate+14 ) then
                                                              if MessageDlg('This calf has a Weaning event recorded within the past 2 weeks. Do you want to continue?',mtWarning,[mbYes,mbNo],0) = idNo then
                                                                 SysUtils.Abort;
                                                         end
                                                      else
                                                         begin
                                                            if MessageDlg('This calf does not have a Weaning event recorded. Do you want to continue?',mtWarning,[mbYes,mbNo],0) = idNo then
                                                               SysUtils.Abort;
                                                         end;
                                                   end;
                                             end;
                                       end;
                                 end;


                              // Do necessary checks for NIreland Herd
                              if ( DefCountry(AnimalFileByIDHerdID.AsInteger) = NIreland ) then
                                 begin
                                    if (WinData.AnimalFileByIDColour.IsNull) or (WinData.AnimalFileByIDColour.AsInteger <= 0) then
                                        begin
                                           MessageDLG('You must enter a colour for this animal.',mtInformation,[mbOK],0);
                                           SysUtils.Abort;
                                        end;

                                    if ( not SaleDeathSold.AsBoolean ) then
                                       begin
                                          if ( SaleDeathCustomer.AsInteger <= 0 ) then
                                             begin
                                                MessageDlg('You must select a Disposal Place before saving death event.',mtError,[mbOk],0);
                                                SysUtils.Abort;
                                             end;
                                           if not ( HerdLookup.IsAuthorisedDisposalPlace(SaleDeathCustomer.AsInteger)) then
                                             begin
                                                if MessageDlg('You have not selected an authorised Disposal Place.'+cCRLFx2+
                                                              'Are you sure you want to continue?',mtWarning,[mbYes,mbNo],0) = idNo then
                                                  SysUtils.Abort;
                                             end;
                                           if (WinData.SaleDeathDisposal.AsInteger <= 0) then
                                             begin
                                                MessageDlg('You must select a Disposal Manner before saving death event.',mtError,[mbOk],0);
                                                SysUtils.Abort;
                                             end;
                                       end
                                    else
                                       begin
                                          if ( SaleDeathCustomer.AsInteger <= 0 ) then
                                             begin
                                                MessageDlg('You must select a Customer.',mtWarning,[mbOk],0);
                                                SysUtils.Abort;
                                             end;
                                       end;
                                 end
                              else if ( SaleDeathCustomer.AsInteger <= 0 ) then
                                 begin
                                    MessageDlg('You must select a Customer.',mtWarning,[mbOk],0);
                                    SysUtils.Abort;
                                 end;

                              if ((NOT (WinData.IsItPreSale )) and ( Events.FieldByName('EventDate').AsDateTime > Date )) then
                                 begin
                                    MessageDlg(Format('Date entered %s cannot be after today %s', [FormatDateTime(cIrishDateStyle,Events.FieldByName('EventDate').AsDateTime), FormatDateTime(cIrishDateStyle,Date)]),mtError,[mbOk],0);//Error;
                                    SysUtils.Abort;
                                 end;

                              // Check Sale/Death Date is after Date of Birth
                              if ( Events.FieldByName('EventDate').AsDateTime < AnimalFileByIDDateOfBirth.AsDateTime ) then
                                 begin

                                    MessageDlg(Format('Sale/Death date %s cannot be before animal date of birth %s ',
                                                      [FormatDate(Events.FieldByName('EventDate').AsDateTime, dsIrish ),
                                                       FormatDate(AnimalFileByIDDateOfBirth.AsDateTime, dsIrish ) ] ), mtError,[mbOk],0);
                                    SysUtils.Abort;
                                 end
                              else
                                 begin
                                    LastEventDate := EventDataHelper.GetLastEventDate(AnimalFileByIDID.AsInteger, -1, cPurchaseEvent);
                                    if LastEventDate > 0 then
                                       begin
                                          // Check Sale/Death Date is before Purchase Date
                                          if ( Events.FieldByName('EventDate').AsDateTime < LastEventDate ) then
                                              begin
                                                 MessageDlg(Format('Sale/Death date %s cannot be before Purchase date %s ',
                                                           [FormatDate( Events.FieldByName('EventDate').AsDateTime , dsIrish ),
                                                            FormatDate( LastEventDate, dsIrish ) ] ),mtError,[mbOk],0);
                                                 SysUtils.Abort;
                                              end;
                                       end;
                                 end;
                           end;
         cPurchaseEvent : begin
                              // Check Purchase Date is after Date of Birth
                              if ( Events.FieldByName('EventDate').AsDateTime < AnimalFileByIDDateOfBirth.AsDateTime ) then
                                 begin
                                    MessageDlg(Format('Purchase date %s cannot be before animal date of birth %s ',
                                                     [FormatDate( Events.FieldByName('EventDate').AsDateTime, dsIrish),
                                                      FormatDate( AnimalFileByIDDateOfBirth.AsDateTime, dsIrish  ) ] ),mtError,[mbOk],0);
                                    SysUtils.Abort;
                                 end
                              else
                                 begin
                                    LastEventDate := EventDataHelper.GetLastEventDate(AnimalFileByIDID.AsInteger, -1, cSaleDeathEvent);
                                    if LastEventDate > 0 then
                                       begin
                                          // Check Purchase Date is before Sale/Death Date
                                          if ( Events.FieldByName('EventDate').AsDateTime > LastEventDate ) then
                                             begin
                                                MessageDlg(Format('Purchase date %s cannot be after Sale/Death date %s ',
                                                          [FormatDate(Events.FieldByName('EventDate').AsDateTime, dsIrish),
                                                           FormatDate(LastEventDate, dsIrish  ) ] ),mtError,[mbOk],0);
                                                SysUtils.Abort;
                                             end;
                                       end;
                                 end;
                          end;
         CCondScoreEvent : begin
                              if (( ConditionScore.FieldByName('Score').AsFloat < CSMinValue ) or
                                  ( ConditionScore.FieldByName('Score').AsFloat > CSMaxValue )) then
                                 begin
                                    MessageDlg('Condition Score value must be in the range of 1 to 5',mtError,[mbOK],0);
                                    SysUtils.Abort;
                                 end;
                           end;

         CDisbuddingEvent : begin

                               if EventsEventDate.AsDateTime < AnimalFileByIDDateOfBirth.AsDateTime then
                                  begin
                                     MessageDlg('Event date must be on or after Animal Date of Birth',mtError,[mbOK],0);
                                     SysUtils.Abort;
                                  end;

                               // complete validation checks before disbudding can be saved.
                               // 1. Disbudding date must be within 21 days of DOB
                               // 2. If Disbudding date is > 14 Days days of DOB, Vet must be used.
                               // 3. This event is not recorded for polled animals, definition of polled animals = ??
                               // Possibly this might relate to what breed the animal might be. Ignore rule 3 for now. - 13/12/2007
                               TempInt := Trunc(EventsEventDate.AsDateTime - AnimalFileByIDDateOfBirth.AsDateTime);
                               if TempInt > 21 then
                                  begin
                                     if MessageDlg('The animal is more than 21 days of age.'+#13#10+
                                                   'Do you want to continue?',mtWarning,[mbYes,mbNo],0) = idNo then
                                        SysUtils.Abort;

                                     // ensure vet is assigned.
                                     if DisbuddingVetID.AsInteger <= 0 then
                                        begin
                                           MessageDlg(Format('It has been %d days since animal date of birth.'+#13#10+
                                                             'If you disbud a calf after 14 days, you must enter a vet.'
                                                             ,[TempInt]),mtWarning,[mbOk],0);
                                           SysUtils.Abort;
                                        end;
                                  end
                               else if TempInt > 14 then
                                  begin
                                     // ensure vet is assigned.
                                     if DisbuddingVetID.AsInteger <= 0 then
                                        begin
                                           MessageDlg(Format('It has been %d days since animal date of birth.'+#13#10+
                                                             'If you disbud a calf after 14 days, you must enter a vet.'
                                                             ,[TempInt]),mtWarning,[mbOk],0);
                                           SysUtils.Abort;
                                        end;
                                  end
                               else if TempInt < 0 then
                                  begin
                                     MessageDlg('The disbudding date must be after animal date of birth.',mtError,[mbOk],0);
                                     SysUtils.Abort;
                                  end;
                            end;
         CCastrateEvent :   begin

                               if EventsEventDate.AsDateTime < AnimalFileByIDDateOfBirth.AsDateTime then
                                  begin
                                     MessageDlg('Event date must be on or after Animal Date of Birth',mtError,[mbOK],0);
                                     SysUtils.Abort;
                                  end;

                               TempDate := IncMonth(EventsEventDate.AsDateTime, -6);
                               if AnimalFileByIDDateOfBirth.AsDateTime < TempDate then
                                  begin
                                     if MessageDlg('The animal is more than 6 months of age.'+#13#10+#13#10+
                                                   'Do you want to continue?',mtWarning,[mbYes,mbNo],0) = idNo then
                                     SysUtils.Abort;
                                  end;

                               WeaningDate := 0;
                               if not WinData.CastrationQueryWeaning(AnimalFileByIDID.AsInteger, EventsEventDate.AsDateTime, WeaningDate ) then
                                  begin
                                     if MessageDlg( Format('Animal Tag: "%s"'+#13#10+#13#10+
                                                        'A Weaning Event for "%s" has been found for this animal.'+#13#10+
                                                        'The Castration Date entered must be at least 4 weeks before'+#13#10+
                                                        'the Weaning Date, or at least 2 weeks after the weaning date.'+#13#10+#13#10+
                                                        'Do you want to continue?',[AnimalFileByIDNatIDNum.AsString,DateToStr(WeaningDate)]),mtWarning,[mbYes,mbNo],0) = idNo then
                                     SysUtils.Abort;
                                  end;
                            end;
         cWeaningEvent :    begin
                               if EventsEventDate.AsDateTime < AnimalFileByIDDateOfBirth.AsDateTime then
                                  begin
                                     MessageDlg('Event date must be on or after Animal Date of Birth',mtError,[mbOK],0);
                                     SysUtils.Abort;
                                  end;

                               if not WinData.WeaningQueryCastration(AnimalFileByIDID.AsInteger, EventsEventDate.AsDateTime, CastrationDate) then
                                  begin
                                     if MessageDlg( Format('Animal Tag: "%s"'+#13#10+#13#10+
                                                        'A Castration Event date for the "%s" has been found for this animal.'+#13#10+
                                                        'The Weaning date must be at least 4 weeks after the Castration Date.'+#13#10+#13#10+
                                                        'Do you want to continue?',[AnimalFileByIDNatIDNum.AsString,DateToStr(CastrationDate)]),mtWarning,[mbYes,mbNo],0) = idNo then
                                     SysUtils.Abort;
                                  end;

                               if not WinData.WeaningQueryMealFeeding(AnimalFileByIDID.AsInteger, EventsEventDate.AsDateTime, MealFeedingDate) then
                                  begin
                                     if MessageDlg( Format('Animal Tag: "%s"'+#13#10+#13#10+
                                                        'A Feeding Event date for the "%s" has been found for this animal.'+#13#10+
                                                        'The Meal Feeding Event date must be at least 4 weeks before'+#13#10+
                                                        'Weaning date and continued for two weeks after Weaning date.'+#13#10+#13#10+
                                                        'Do you want to continue?',[AnimalFileByIDNatIDNum.AsString,DateToStr(MealFeedingDate)]),mtWarning,[mbYes,mbNo],0) = idNo then
                                     SysUtils.Abort;
                                  end;

                               // Check on the no. of weanings re-introduced 11/08/2010 requested by GL.
                               // Orginally removed from program at request of unknown farmer.
                               if (QueryNoOfWeanings(EventsEventDate.AsDateTime) + 1) > 10 then
                                  begin
                                     MessageDlg('You cannot exceed the maximum number allowed (10) weanings per day.',mtWarning,[mbOK],0);
                                     SysUtils.Abort;
                                  end;

                               if Weaning.FieldByName('Weight').AsFloat > 0 then
                                  begin

                                     if Weaning.FieldByName('WeighingDate').AsDateTime <= 0 then
                                        begin
                                           if MessageDlg('No weighing date has been entered, do you want to continue?',mtConfirmation,[mbYes,mbNo],0) = idNo then
                                              SysUtils.Abort;
                                        end;
                                  end;

                               if Weaning.FieldByName('Docility').AsInteger <= 0 then
                                  begin
                                     if MessageDlg('Docility has not been entered, do you want to continue?',mtConfirmation,[mbYes,mbNo],0) = idNo then
                                        SysUtils.Abort;

                                  end;
                               if Weaning.FieldByName('Quality').AsInteger <= 0 then
                                  begin
                                     if MessageDlg('Calf Quality has not been entered, do you want to continue?',mtConfirmation,[mbYes,mbNo],0) = idNo then
                                        SysUtils.Abort;
                                  end;
                                  
                            end;
         cMealFeedingEvent : begin
                               if EventsEventDate.AsDateTime < AnimalFileByIDDateOfBirth.AsDateTime then
                                  begin
                                     MessageDlg('Event date must be on or after Animal Date of Birth',mtError,[mbOK],0);
                                     SysUtils.Abort;
                                  end;
                                if not WinData.MealFeedingQueryWeaning(AnimalFileByIDID.AsInteger, EventsEventDate.AsDateTime, WeaningDate) then
                                   begin
                                      if MessageDlg( Format('Animal Tag: "%s"'+#13#10+#13#10+
                                                         'A Weaning Event date for the "%s" has been found for this animal.'+#13#10+
                                                         'The Meal Feeding Event date must be at least 4 weeks before'+#13#10+
                                                         'Weaning date and continued for two weeks after Weaning date.'+#13#10+#13#10+
                                                         'Do you want to continue?',[AnimalFileByIDNatIDNum.AsString,DateToStr(WeaningDate)]),mtWarning,[mbYes,mbNo],0) = idNo then
                                      SysUtils.Abort;
                                   end;
                             end;
         CHealthEvent      : begin
                                // 13/08/2008 SP

                                // Check organic health. If anitbiotics have been administered
                                // twice in the past year, (365) then do not allow save of
                                // another antibiotic

                                // First check herd is organic
                                HerdLookup.HerdOwnerData.HerdID := AnimalFileByIDHerdID.AsInteger;
                                if HerdLookup.HerdOwnerData.OrganicHerd then
                                   begin
                                      // Check if selected Drug is in Antibiotic Group.
                                      if HerdLookup.DrugGroupByDrugID(HealthDrugUsed.AsInteger) = 'Antibiotic' then
                                         begin
                                            NoOfAntibioticDosesPastYear := HerdLookup.CountOfDrugDoses(AnimalFileByIDID.AsInteger, 'Antibiotic', IncMonth(EventsEventDate.AsDateTime,-12), EventsEventDate.AsDateTime);
                                            if (NoOfAntibioticDosesPastYear >= 2) then
                                               begin
                                                  if MessageDlg(Format('This animal has %d antibiotic treatments recorded within 1 year of the treatment date.'+cCRLFx2+
                                                                'Do you want to continue saving this health event?',[NoOfAntibioticDosesPastYear]),mtWarning,[mbyes,mbNo],0) = mrNo then
                                                     SysUtils.Abort;
                                               end;
                                         end;
                                   end;
                             end;
      end;

      // SP
      // Now do a check to see if either the Events or secondary table was modified.
      if EventType in ([TSaleDeath, THealth, TWeight]) then
         EventsBladeNotified.Value := False;

      try
      if ModifyingEvent then // Make sure events exists, this will determine whether so
         begin
            // First check events for any changes!
            for i := 0 to Events.FieldCount-1 do
               if Events.Fields[i].OldValue <> Events.Fields[i].NewValue then
                  WriteDetails;
            // Now check the secondary tables for changes!
            // as far as i know  these are all the events that can be modified!
            Case EventType Of
               TCalving   : begin
                               for i := 0 to Calvings.FieldCount-1 do
                                  if Calvings.Fields[i].OldValue <> Calvings.Fields[i].NewValue then
                                     WriteDetails;
                            end;
               TBulling   : begin
                               for i := 0 to Bullings.FieldCount-1 do
                                  if Bullings.Fields[i].OldValue <> Bullings.Fields[i].NewValue then
                                     WriteDetails;
                            end;
               TService   : begin
                               for i := 0 to Services.FieldCount-1 do
                                  if Services.Fields[i].OldValue <> Services.Fields[i].NewValue then
                                     WriteDetails;
                            end;
               TPregDiag  : begin
                               for i := 0 to PregDiag.FieldCount-1 do
                                  if PregDiag.Fields[i].OldValue <> PregDiag.Fields[i].NewValue then
                                     WriteDetails;
                            end;
               THealth,
               TDryOff    : begin
                               for i := 0 to Health.FieldCount-1 do
                                  if Health.Fields[i].OldValue <> Health.Fields[i].NewValue then
                                     WriteDetails;
                            end;
               TWeight    : begin
                               for i := 0 to Weighings.FieldCount-1 do
                                  if Weighings.Fields[i].OldValue <> Weighings.Fields[i].NewValue then
                                     WriteDetails;
                            end;
               TSaleDeath : begin
                                for i := 0 to SaleDeath.FieldCount-1 do
                                   if SaleDeath.Fields[i].OldValue <> SaleDeath.Fields[i].NewValue then
                                     WriteDetails;
                            end;
               TPreSale   : begin
                                for i := 0 to SaleDeath.FieldCount-1 do
                                   if SaleDeath.Fields[i].OldValue <> SaleDeath.Fields[i].NewValue then
                                     WriteDetails;
                            end;
               TStockBull : begin
                               // only written to events.
                            end;
               TAbortion  : begin
                               //
                            end;
               TCastrate  : begin
                               //
                            end;
               TConditionScore  : begin
                                     for i := 0 to ConditionScore.FieldCount-1 do
                                        if ConditionScore.Fields[i].OldValue <> ConditionScore.Fields[i].NewValue then
                                          WriteDetails;
                                  end;
               TDiagnoseProblem : begin
                                     for i := 0 to DiagnoseProblem.FieldCount-1 do
                                        if DiagnoseProblem.Fields[i].OldValue <> DiagnoseProblem.Fields[i].NewValue then
                                          WriteDetails;
                                  end;
               TEmbryoTransfer  : begin
                                     for i := 0 to EmbryoTransfer.FieldCount-1 do
                                        if EmbryoTransfer.Fields[i].OldValue <> EmbryoTransfer.Fields[i].NewValue then
                                          WriteDetails;
                                  end;
               TMastitis        : begin
                                     //
                                  end;
               TToBeCulled      : begin
                                     //
                                  end;
               TWean            : begin
                                     for i := 0 to Weaning.FieldCount-1 do
                                        if Weaning.Fields[i].OldValue <> Weaning.Fields[i].NewValue then
                                          WriteDetails;
                                  end;
               TInternalExam    : begin
                                     for i := 0 to IntExam.FieldCount-1 do
                                        if IntExam.Fields[i].OldValue <> IntExam.Fields[i].NewValue then
                                          WriteDetails;
                                  end;
               TRunBullIn,
               TRunBullOut      : begin
                                     for i := 0 to BullInOut.FieldCount-1 do
                                        if BullInOut.Fields[i].OldValue <> BullInOut.Fields[i].NewValue then
                                          WriteDetails;
                                  end;
               TDisbudding      : begin
                                     for i := 0 to Disbudding.FieldCount-1 do
                                        if Disbudding.Fields[i].OldValue <> Disbudding.Fields[i].NewValue then
                                          WriteDetails;
                                  end;
               TMealFeeding     : begin
                                     for i := 0 to MealFeeding.FieldCount-1 do
                                        if MealFeeding.Fields[i].OldValue <> MealFeeding.Fields[i].NewValue then
                                          WriteDetails;
                                  end;
            end;
         end
      except
      end;
   // Store the EventId
   ThisEventID := EventID.Value;
   if (EventType = TMovement) then
      begin
         if (tMovements.FieldByName('MovedTo').AsInteger = 0) then
            // Check the person has a Moveto place entered
             begin
                MessageDLG('Place Moved to is required',mtInformation,[mbOk],0);
                SysUtils.Abort;
             end;
      end
   else if not(ICBFMilkRec) then
      if ((EventType In [TBulling, TService, TPregDiag, TDryOff]) AND (WinData.Events.State = dsInsert)) then                  //KVB
          begin
             if WinData.CheckEvents.Locate('AnimalID;AnimalLactNo;EventType',VarArrayOf([EventsAnimalID.AsVariant,EventsAnimalLactNo.AsVariant,CCalvingEvent]),[] ) then      //KVB
                begin                                                                                                                 //KVB
                   If EventsEventDate.AsDateTime < WinData.CheckEvents.FieldByName('EventDate').AsDateTime then                                //KVB
                      begin                                                                                                         //KVB
                         MessageDLG('Can not add new Breeding Events Prior to Last Calving Date', mtInformation, [mbok],0);       //KVB
                         SysUtils.Abort;                                                                                          //KVB
                      end;                                                                                                          //KVB
                end;                                                                                                                  //KVB
          end;
   Case EventType Of
      TCalving   : begin
                   end;
      TBulling   : begin
                   end;
      TService   : begin
                   end;
      TPregDiag  : begin
                   end;
      THealth,
      TDryOff    : begin
                   {   if Health.FieldByName('EventID').AsInteger = 0 then    // ensure sub event is written to health table.
                         begin                                               // EventID will be 0, if user hasnt activated Sub table by entering a value
                            Health.Append;                                   // into a Health Field. This is caused by a bug somewhere in code. Hard to trace
                            Health.Post;                                     // where bug is occurring. When the event is inserted into Events\Health tables the Health.State
                         end;                                                // reverts to dsBrowse when Health form is shown. the Health table does not regain the Insert status}
                   end;                                                      // until the user selects\inserts a field value.
      TWeight    : begin
                   end;
      TSaleDeath : begin
                   end;
      TPreSale   : begin
                   end;
      TStockBull : begin
                   end;
      TAbortion  : begin
                   end;
      TCastrate  : begin
                   end;
      TConditionScore  : begin
                         end;
      TDiagnoseProblem : begin
                         end;
      TEmbryoTransfer  : begin
                         end;
      TMastitis        : begin
                         end;
      TToBeCulled      : begin
                         end;
      TWean            : begin
                         end;
      TInternalExam    : begin
                         end;
      TRunBullIn,
      TRunBullOut      : begin
                         end;
   end;

end;

procedure TWinData.TempCalvingAfterInsert(DataSet: TDataSet);
begin
   if TempCalving.RecordCount >= cMaxCalves Then
      begin
         MessageDlg('Only ' + IntToStr(cMaxCalves) + ' Calves Allowed',mtInformation,[mbOK],0);
         TempCalving.Cancel;
      end;
end;

{ **** Beginning of Health Record Procedures/Functions }
procedure TWinData.HealthBeforeDelete(DataSet: TDataSet);
begin
   // Add the Amount for this medicine record
   UpdateMedicine ( OrigDrug, OrigQty, 0 );
end;

procedure TWinData.HealthBeforeEdit(DataSet: TDataSet);
begin
   OrigQty := ( Health.FieldByName('DoseUnitUsed').AsFloat * Health.FieldByName('RateApplic').AsFloat );
   OrigDrug:= Health.FieldByName('DrugUsed').AsInteger;
end;

procedure TWinData.HealthNewRecord(DataSet: TDataSet);
begin
   OrigQty := 0;
   OrigDrug := 0;
   HealthEventID.Value := EventID.Value;
end;

procedure TWinData.HealthAfterPost(DataSet: TDataSet);
begin
   // 09/02/09 [Dev 3.9 R6.0] /SP Bug Fix - Only update medicine stock after event has been posted. (moved to Events after post method)
   // previously this was done on Health after post, which wasnt working correctly.
{   if NOT (( OrigDrug = HealthDrugUsed.Value ) And ( OrigQty = HealthRateApplic.Value )) then
   begin
      UpdateMedicine ( OrigDrug, OrigQty, 0 );
      UpdateMedicine ( HealthDrugUsed.Value, -DrugQtyUsed, 0 );
   end;}
end;

procedure TWinData.HealthBeforePost(DataSet: TDataSet);
begin
   // Calculate the Drug Quantity;
  CalcCostAndQtyUsed(DataSet.FieldByName('DrugUsed').AsInteger,DataSet.FieldByName('RateApplic').AsFloat, DataSet );
end;
{ **** End of Health Record Procedures/Functions }

procedure TWinData.UpdateMedicine (MedicineID : LongInt; MedicineRate, NewCost : Double );
var
   PurchUnit : Double;
begin
   if MedicineRate <> 0 then
      if Medicine.Locate('ID',MedicineID,[]) then
         Try
            Medicine.Edit;
            Medicine.FieldByName('StockLevel').AsFloat := Medicine.FieldByName('StockLevel').AsFloat + MedicineRate;


            if WinData.Units.Locate('ID', Medicine.FieldByName('PurchUnit').Value,[]) then
               begin
                  PurchUnit := WinData.Units.FieldByName('Multiplier').AsFloat;
                  if PurchUnit > 0 then
                     Medicine.FieldByName('QuantityInStock').AsFloat := Medicine.FieldByName('StockLevel').AsFloat / PurchUnit;
               end;

            If ( NewCost <> 0 ) And ( Medicine.FieldByName('CostPurchUnit').AsFloat <> NewCost ) then
               Medicine.FieldByName('CostPurchUnit').AsFloat := NewCost;
            Medicine.Post;
         except
            on e : exception do
               begin
                   ShowMessage(E.Message);
                   Medicine.CancelUpdates;
               end;
         end;
end;

procedure TWinData.CreateAndShowForm(const WhichForm: TFormClass);
begin
   with WhichForm.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
end;

procedure TWinData.GenLookUpNewRecord(DataSet: TDataSet);
begin
   case GenLookUpType of
      TApplicMethod : GenLookUp.FieldByName('ListType').Value := LApplicMethod;
      THealthCode   : GenLookUp.FieldByName('ListType').Value := LHealthCode;
      TServiceType  : GenLookUp.FieldByName('ListType').Value := LServiceType;
      TAnimalColour : GenLookUp.FieldByName('ListType').Value := LAnimalColour;
      TObservedBy   : GenLookUp.FieldByName('ListType').Value := LObservedBy;
      TCulledCode   : GenLookUp.FieldByName('ListType').Value := LCulledCode;
      TMortality    : GenLookUp.FieldByName('ListType').Value := LMortality;
      TFeedCategory : GenLookUp.FieldByName('ListType').Value := LFeedCategory;
      TIntExamRes   : GenLookUp.FieldByName('ListType').Value := LIntExamRes;
      TIntExamRea   : GenLookUp.FieldByName('ListType').Value := LIntExamRea;
      TIntExamMet   : GenLookUp.FieldByName('ListType').Value := LIntExamMet;
      THealthReportDesc   : GenLookUp.FieldByName('ListType').Value := LHealthReportDesc;
   end;
   GenLookUp.FieldByName('UserCanDelete').Value := True;
   GenLookUp.FieldByName('InUse').Value := True;
end;

procedure TWinData.GenLookUpAfterPost(DataSet: TDataSet);
begin
   KingData.ApplyUpdates([GenLookUp]);
   // Refresh the Queries for Listing from the GenLookUp table
   SetUpQueries;
end;

procedure TWinData.GenLookUpBeforeDelete(DataSet: TDataSet);
begin
     // Check the Code isn;t being used by another record - MAintain data integrity
     CheckHealth.Open;
     // If its system defined it cannot be deleted
     if NOT ( GenLookUp.FieldByName('UserCanDelete').AsBoolean ) then
        begin
           MessageDlg('Cannot Delete this Record - System Defined',mtInformation,[mbOK],0);
           SysUtils.Abort;
        end
     else
        case GenLookUpType of
            TNone : MessageDlg('Cannot Delete this record',mtInformation,[mbOK],0);
            TApplicMethod : if ( WinData.CheckHealth.LookUp('ApplicMethod',GenLookUp.Fields[0].AsString,'ApplicMethod' ) = GenLookUp.Fields[0].Value ) then
                                begin
                                   MessageDlg('Cannot Delete this Record - System Defined',mtInformation,[mbOK],0);
                                   SysUtils.Abort;
                                end;
            THealthCode   : if ( WinData.CheckHealth.LookUp('HealthCode',GenLookUp.Fields[0].AsString,'HealthCode' ) = GenLookUp.Fields[0].Value ) then
                                begin
                                   MessageDlg('Cannot Delete this Record',mtInformation,[mbOK],0);
                                   SysUtils.Abort;
                                end;
            TAnimalColour : if (LookUpDamSire.LookUp('Colour',GenLookUp.Fields[0].AsString,'Colour') = GenLookUp.Fields[0].Value) then
                                begin
                                   MessageDlg('This Colour is in Use',mtInformation,[mbOK],0);
                                   SysUtils.Abort;
                                end;
            TObservedBy   : if (LookUpBullings.LookUp('ObservedBy',GenLookUp.Fields[0].AsString,'ObservedBy') = GenLookUp.Fields[0].Value) then
                                begin
                                   MessageDlg('This Record is in Use',mtInformation,[mbOK],0);
                                   SysUtils.Abort;
                                end;
            TCulledCode   : if (LookUpSaleDeath.LookUp('Culled',GenLookUp.Fields[0].AsString,'Culled') = GenLookUp.Fields[0].Value) then
                                begin
                                   MessageDlg('This Record is in Use',mtInformation,[mbOK],0);
                                   SysUtils.Abort;
                                end;
            TMortality    : begin

                               with TQuery.Create(nil) do
                                  try
                                     DatabaseName := AliasName;
                                     SQL.Clear;
                                     SQL.Add('Select Mortality From Calvings Where Mortality=:Mortality');
                                     Params[0].AsString := GenLookUp.Fields[0].AsString;
                                     Open;
                                     try
                                        if (RecordCount >0) then
                                           begin
                                              MessageDlg('This Record is in Use',mtInformation,[mbOK],0);
                                              SysUtils.Abort;
                                           end;
                                     finally
                                        Close;
                                     end;
                                  finally
                                     Free;
                                  end;

                               //if (LookUpCalvings.LookUp('Mortality',GenLookUp.Fields[0].AsString,'Mortality') = GenLookUp.Fields[0].Value) then
                            end;
            TFeedCategory : if (FeedTypes.LookUp('Category',GenLookUp.Fields[0].AsString,'Category') = GenLookUp.Fields[0].Value) then
                                begin
                                   MessageDlg('This Record is in Use',mtInformation,[mbOK],0);
                                   SysUtils.Abort;
                                end;
            TIntExamRes  :  begin
                               if (IntExam.LookUp('MainResult',GenLookUp.Fields[0].AsString,'MainResult') = GenLookUp.Fields[0].Value) then
                                  begin
                                     MessageDlg('This Record is in Use',mtInformation,[mbOK],0);
                                     SysUtils.Abort;
                                  end
                               else if (IntExam.LookUp('Result2',GenLookUp.Fields[0].AsString,'Result2') = GenLookUp.Fields[0].Value) then
                                  begin
                                     MessageDlg('This Record is in Use',mtInformation,[mbOK],0);
                                     SysUtils.Abort;
                                  end
                               else if (IntExam.LookUp('Result3',GenLookUp.Fields[0].AsString,'Result3') = GenLookUp.Fields[0].Value) then
                                  begin
                                     MessageDlg('This Record is in Use',mtInformation,[mbOK],0);
                                     SysUtils.Abort;
                                  end;
                            end;
            TIntExamRea  : if (IntExam.LookUp('Reason',GenLookUp.Fields[0].AsString,'Reason') = GenLookUp.Fields[0].Value) then
                              begin
                                 MessageDlg('This Record is in Use',mtInformation,[mbOK],0);
                                 SysUtils.Abort;
                              end;
            TIntExamMet  : if (IntExam.LookUp('Method',GenLookUp.Fields[0].AsString,'Method') = GenLookUp.Fields[0].Value) then
                              begin
                                 MessageDlg('This Record is in Use',mtInformation,[mbOK],0);
                                 SysUtils.Abort;
                              end;
            THealthReportDesc  : if ( WinData.CheckHealth.LookUp('ReportID',GenLookUp.Fields[0].AsString,'ReportID' ) = GenLookUp.Fields[0].Value ) then
                                begin
                                   MessageDlg('This Record is in Use',mtInformation,[mbOK],0);
                                   SysUtils.Abort;
                                end;
        end;
     CheckHealth.Close;
end;

procedure TWinData.MediPurchAfterPost(DataSet: TDataSet);
var
   StockLevel : Double;
begin
   // Update the Drug Selected Drug Plus the Quantity
   try
      StockLevel := MediPurchQuantity.Value * MediPurchUnitUsed.Value;
   except
      StockLevel := 0;
   end;
   UpdateMedicine ( MediPurchDrugId.Value, StockLevel, MediPurchCostUnit.Value );

   KingData.ApplyUpdates([MediPurch]);
end;

procedure TWinData.MediPurchNewRecord(DataSet: TDataSet);
begin
   OrigQty := 0;
   OrigDrug := 0;
   MediPurchInUse.Value := True;
   MediPurchPurchDate.Value := Now();
   MediPurchExpiryDate.AsDateTime := Date; { SP 30/10/2002 }
   MediPurchSuppID.Value := 0;
end;

procedure TWinData.MediPurchBeforeDelete(DataSet: TDataSet);
begin
     MediPurchBeforeEdit(DataSet);
     UpdateMedicine ( OrigDrug, -OrigQty, 0 );
end;

procedure TWinData.MediPurchBeforeEdit(DataSet: TDataSet);
begin
   OrigQty := ( MediPurchUnitUsed.AsFloat * MediPurchQuantity.AsFloat );
   OrigDrug:= MediPurchDrugID.AsInteger;
end;

procedure TWinData.MediPurchAfterDelete(DataSet: TDataSet);
begin
   KingData.ApplyUpdates([MediPurch]);
end;

procedure TWinData.MediAdminAfterPost(DataSet: TDataSet);
begin
     KingData.ApplyUpdates([MediAdMin]);
end;

{
Calculates the Total Amount of Drug used and the Cost of this Health Record
Stores the Dose Unit Used
           Purchase Unit Used
           Purchase Cost these 3 values allow the Health record to be deleted and
           the correct Amount reassigned to the Medicine.
}
procedure TWinData.CalcCostAndQtyUsed(ThisDrugUsed : Integer;
                                      ThisRateOfApplic : Double;
                                      HealthT : TDataSet);
var
     PurchUnit,
     UnitUsed   : Double;
begin
     // Get the DoseUnit from Medicine using the Drug Used
     (*if WinData.Medicine.Locate('ID',ThisDrugUsed,[]) then
        if WinData.Units.Locate('ID',WinData.Medicine.FieldByName('DoseUnit').Value,[]) then
           begin
              WinData.DrugUsed := HealthDrugUsed.Value;
              UnitUsed := WinData.Units.FieldByName('Multiplier').AsFloat;
              if WinData.Units.Locate('ID',WinData.Medicine.FieldByName('PurchUnit').Value,[]) then
                 begin
                    // Make sure the table is in edit mode
                    {if NOT  ( WinData.Health.State in dsEditModes ) then
                        WinData.Health.Edit;
                    }
                    PurchUnit := WinData.Units.FieldByName('Multiplier').AsFloat;
                    HealthT.FieldByName('DoseUnitUsed').Value := UnitUsed;
                    if HealthT.FieldByName('PurchUnitCost').IsNull then // save the PurchUnitCost only when it is null eg: (New Event)
                       HealthT.FieldByName('PurchUnitCost').Value := WinData.Medicine.FieldByName('CostPurchUnit').AsFloat;
                    HealthT.FieldByName('PurchUnitUsed').Value := PurchUnit;
                    {
                    WinData.Health.FieldByName('DoseUnitUsed').Value := UnitUsed;
                    WinData.Health.FieldByName('PurchUnitCost').Value := WinData.Medicine.FieldByName('CostPurchUnit').AsFloat;
                    WinData.Health.FieldByName('PurchUnitUsed').Value := PurchUnit;
                    WinData.DrugQtyUsed := ( UnitUsed * HealthRateApplic.Value );
                    }
                    WinData.DrugQtyUsed := ( UnitUsed * ThisRateOfApplic );
                    if ( PurchUnit <> 0 ) and (HealthT.FieldByName('PurchUnitCost').AsFloat > 0 ) then
                       WinData.DrugCost := WinData.DrugQtyUsed * ( HealthT.FieldByName('PurchUnitCost').Value / PurchUnit );
//                       WinData.DrugCost := WinData.DrugQtyUsed * ( WinData.Medicine.FieldByName('CostPurchUnit').AsFloat / PurchUnit );
                 end;
           end;*)

     WinData.DrugCost := 0;
     // Get the DoseUnit from Medicine using the Drug Used
     if WinData.Medicine.Locate('ID',ThisDrugUsed,[]) then
        if WinData.Units.Locate('ID',WinData.Medicine.FieldByName('DoseUnit').Value,[]) then
           begin
              WinData.DrugUsed := HealthDrugUsed.Value;
              UnitUsed := WinData.Units.FieldByName('Multiplier').AsFloat;
              if WinData.Units.Locate('ID',WinData.Medicine.FieldByName('PurchUnit').Value,[]) then
                 begin
                    // Make sure the table is in edit mode

                    PurchUnit := WinData.Units.FieldByName('Multiplier').AsFloat;
                    HealthT.FieldByName('DoseUnitUsed').Value := UnitUsed;

                    if HealthT.FieldByName('PurchUnitCost').IsNull {AsFloat <= 0} then // save the PurchUnitCost only when it is null eg: (New Event)
                       HealthT.FieldByName('PurchUnitCost').Value := WinData.Medicine.FieldByName('CostPurchUnit').AsFloat;
                    HealthT.FieldByName('PurchUnitUsed').Value := PurchUnit;
                    {
                    WinData.Health.FieldByName('DoseUnitUsed').Value := UnitUsed;
                    WinData.Health.FieldByName('PurchUnitCost').Value := WinData.Medicine.FieldByName('CostPurchUnit').AsFloat;
                    WinData.Health.FieldByName('PurchUnitUsed').Value := PurchUnit;
                    WinData.DrugQtyUsed := ( UnitUsed * HealthRateApplic.Value );
                    }

                   // WinData.DrugCost := ThisRateOfApplic * (( UnitUsed / PurchUnit ) * HealthT.FieldByName('PurchUnitCost').Value);

                    WinData.DrugQtyUsed := ( UnitUsed * ThisRateOfApplic );
                    if ( PurchUnit <> 0 ) and (HealthT.FieldByName('PurchUnitCost').AsFloat > 0 ) then
                       WinData.DrugCost := (ThisRateOfApplic * ( UnitUsed / PurchUnit )) * HealthT.FieldByName('PurchUnitCost').Value;
                       //WinData.DrugCost := WinData.DrugQtyUsed * ( HealthT.FieldByName('PurchUnitCost').Value / PurchUnit );
//                       WinData.DrugCost := WinData.DrugQtyUsed * ( WinData.Medicine.FieldByName('CostPurchUnit').AsFloat / PurchUnit );
                 end;
           end;

end;

procedure TWinData.MediPurchBeforePost(DataSet: TDataSet);
var
   StockLevel : Double;
begin
   MediPurchUnitUsed.Value := PurchUnitUsed;
//    If LookUpMedicine.Locate('ID', MediPurchDrugId.Value,[]) then // Replace by MK
    If not HerdLookup.qDrugList.Locate('ID', MediPurchDrugId.Value,[]) then
       begin
          MessageDlg('You must Select a Medicine',mtInformation,[mbOk],0);
          SysUtils.Abort;
       end;
    if ( MediPurchQuantity.Value = 0 ) then
       begin
          MessageDlg('You must Enter a Quantity',mtInformation,[mbOk],0);
          SysUtils.Abort;
       end;
    if MediPurchPurchDate.AsDateTime <= 0 then
       begin
          MessageDlg('You must enter a Purchase Date',mtInformation,[mbOk],0);
          SysUtils.Abort;
       end;
    if MediPurchSuppID.AsInteger <= 0 then
       begin
          MessageDlg('You must enter a Supplier',mtInformation,[mbOk],0);
          SysUtils.Abort;
       end;
end;

{
Get the Gestation Period of the Bull - Default is 283 Days
}
{
function TWinData.GetGestation ( BullUsed : Integer ) : Integer;
begin
     ReSult := 283;           // Standard Value
     if WinData.LookUpDamSire.Locate('ID',BullUsed,[]) then
        if WinData.Breeds.Locate('ID',Windata.LookupDamSire.FieldbyName('PrimaryBreed').AsInteger,[]) then
           ReSult := WinData.Breeds.FieldByName('GestationPeriod').AsInteger;
end;
}
function TWinData.GetProjCalving(AnimalToSeek,LactNo: Integer; var NoOfCalves: Integer; var IsPregnant: String): TDateTime;
Var
   NoDaysPreg,
   Gestation : Integer;
   ProjDate,
   TestDate,
   LastCalvingDate,
   LastServiceDate,
   LastPDDate : TDateTime;
   UsedPD   : Boolean;
   IsPregYesNo : String;
begin
   NoOfCalves := 0;
   ProjDate := 0;
   //IsPregnant := 'UnDefined';  // Set Pregnancy status to FALSE
   //LastBull := 0;
   //IsPregYesNo := '';
   LastCalvingDate:=0;
   LastServiceDate:=0;
   LastPDDate :=0;
   Gestation := 0;

   // Check the Last Calving Date Assign to variable
   WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(AnimalToSeek) + ') And (AnimalLactNo = ' + IntToStr(LactNo) + ') And (EventType = ' + IntToStr(CCalvingEvent) + ')';
   WinData.CheckEvents.Filtered := True;
   if WinData.CheckEvents.FindLast then
      LastCalvingDate := WinData.CheckEvents.FieldbyName('EventDate').AsDateTime;


   // Clear the Filter
   WinData.CheckEvents.Filter := '';
   WinData.CheckEvents.Filtered := False;

   // Check the Last Service Against the Date today if it's more than 10 days display Message
   WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(AnimalToSeek) + ') And (AnimalLactNo = ' + IntToStr(LactNo) + ') And (EventType = ' + IntToStr(CServiceEvent) + ')';
   WinData.CheckEvents.Filtered := True;
   if WinData.CheckEvents.FindLast then
      begin
          TestDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
          // Check the Last Service Date Assign to variable
          LastServiceDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
          // Check the Calving Record for the Bull used in last service
          if WinData.LookUpServices.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) then
             Begin
                Gestation := BreedingDataHelper.GetGestation ( WinData.LookUpServices.FieldByName('ServiceBull').AsInteger );
                WinData.LastBull := WinData.LookUpServices.FieldByName('ServiceBull').AsInteger;
             end
          else
             Gestation := 283;
          ProjDate := ( TestDate + Gestation ); // Projected Date
          if NoOfCalves = 0 then
             NoOfCalves := 1;
      end;
   // Clear the Filter
   WinData.CheckEvents.Filter := '';
   WinData.CheckEvents.Filtered := False;

   // Check the PD Scan
   WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(AnimalToSeek) + ') And (AnimalLactNo = ' + IntToStr(LactNo) + ') And (EventType = ' + IntToStr(CPregDiagEvent) + ')';
   WinData.CheckEvents.Filtered := True;
   if WinData.CheckEvents.FindLast then
      // Check the Pregnancy Diagnosis Record for the No of Days Pregnant
      if WinData.LookUpPDs.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) then
         begin
            if WinData.LookUpPDs.FieldByName('PregnancyStatus').AsBoolean then
               begin
                  IsPregnant := 'Yes';
                  IsPregYesNo := IsPregnant;
                  if Gestation = 0 then
                     Gestation := 283;
                  TestDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                  LastPDDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                  NoDaysPreg := WinData.LookUpPDs.FieldByName('DaysInCalf').AsInteger;
                  if WinData.LookUpPDs.FieldByName('NoCalves').AsInteger > 0 then
                     NoOfCalves := WinData.LookUpPDs.FieldByName('NoCalves').AsInteger
                  else
                     NoOfCalves := 1;
                  if ( NoDaysPreg >= 1 ) And  // SP
                     ( NoDaysPreg <= Gestation ) then
                     ProjDate := TestDate + (Gestation-NoDaysPreg) // Projected Date
                  else
                     // if no. of days in calf is empty, project from last service date + Gest period
                     ProjDate := LastServiceDate + Gestation; // Projected Date
               end
            else
               begin
                  IsPregnant := 'No';
                  IsPregYesNo := IsPregnant;
                  LastPDDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
               end;
         end;

        // Clear the Filter
        WinData.CheckEvents.Filter := '';
        WinData.CheckEvents.Filtered := False;

   // No if calving event is lastest
   if ( LastCalvingDate > LastServiceDate ) then
      IsPregnant := 'No'
   else if ( LastCalvingDate > LastPDDate ) then
      IsPregnant := 'No';
   if ( LastServiceDate > LastCalvingDate ) then
      IsPregnant := 'UnDefined';
   if ( LastPDDate > LastCalvingDate ) then
      begin
         IsPregnant := IsPregYesNo;
      end;
   if ( LastPDDate > LastServiceDate ) then
      begin
         IsPregnant := IsPregYesNo;
      end;
   if ( LastServiceDate > LastPDDate ) then
      IsPregnant := 'UnDefined';

   if ((ProjDate+30) < Now()) then
       NoOfCalves := 0;

   RESULT := ProjDate;
end;

procedure TWinData.ReportNotAvailable;
begin
   MessageDLG('Report Not Available',mtInformation,[mbOK],0);
end;

procedure TWinData.OptionNotAvailable;
begin
   MessageDLG('Option Not Available',mtInformation,[mbOK],0);
end;

procedure TWinData.BeefSubsidyNewRecord(DataSet: TDataSet);
begin
{   BeefSubsidyEventID.Value := EventID.Value;
   if CalvingAnimal then
      BeefSubsidyAnimalId.Value := tCalvingAnimal.FieldByName('ID').AsInteger
   else
      BeefSubsidyAnimalId.Value := AnimalFileByIdID.Value;
   BeefSubsidyApplicationID.Value := -1;
   BeefSubsidyApplicationDate.Clear;
   BeefSubsidyEligibilityDate.Clear;
   BeefSubsidyRetensionDate.Clear;
}
end;

procedure TWinData.BeefSubsidyAfterDelete(DataSet: TDataSet);
begin
   KingData.ApplyUpdates([BeefSubsidy]);
end;

procedure TWinData.PremiumTypeBeforePost(DataSet: TDataSet);
begin
     if NOT (( PremiumTypeType.Value = 'F' ) Or
             ( PremiumTypeType.Value = 'S' ) Or
             ( PremiumTypeType.Value = 'B' )) then
        begin
            MessageDlg('InValid Premium Type - Valid Types are F,S,B',mtInformation,[mbOK],0);
            SysUtils.Abort;
        end;
     if NOT (PremiumTypeTimeFromDOBMonths.Value In [Low(ValidTimeDOBRange)..High(ValidTimeDOBRange)] ) then
        begin
            MessageDlg('InValid Time From Date of Birth Valid Range is ' + IntToStr(Low(ValidTimeDOBRange)) + ' to ' + IntToStr(High(ValidTimeDOBRange)),mtInformation,[mbOK],0);
            SysUtils.Abort;
        end;
     if NOT (PremiumTypeRetensionDays.Value In [Low(ValidRetensionDays)..High(ValidRetensionDays)]) then
        begin
            MessageDlg('InValid Retension Days - Valid Range is ' + IntToStr(Low(ValidRetensionDays)) + ' to ' + IntToStr(High(ValidRetensionDays)),mtInformation,[mbOK],0);
            SysUtils.Abort;
        end;
end;

procedure TWinData.PremiumTypeAfterPost(DataSet: TDataSet);
begin
   KingData.ApplyUpdates([PremiumType]);
end;

procedure TWinData.BeefSubsidyBeforeDelete(DataSet: TDataSet);
begin
   // Delete the associated Event
   if Events.Locate('ID',BeefSubsidyEventID.Value,[]) then
      Events.Delete;
end;

function TWinData.GetNoMonthsOrDaysForPrem(TypesTable: TTable; MonthsOrDays: TMonthsOrDays; PremType: TPremType): Integer;
Var
   St : string;
begin
     // Get the no of months after DOB for First Premium
   Result := 0;
     if PremType = F then
        St := 'F'
     else if PremType = S then
        St := 'S'
     else if PremType = B then
        St := 'B';
     if TypesTable.Locate('Type',St,[]) then
        begin
           if MonthsOrDays = M then
              Result := TypesTable.FieldByName('TimeFromDOBMonths').AsInteger
           else if MonthsOrDays = D then
              Result := TypesTable.FieldByName('RetensionDays').AsInteger
           else if MonthsOrDays = C then
              Result := TypesTable.FieldByName('TimeOutMonths').AsInteger;
        end
     else
         begin
            // No Record exists Create one
            if PremType = F then
               TypesTable.Appendrecord(['F','First Age Premium',7,2,20])
            else if PremType = S then
               TypesTable.Appendrecord(['S','Second Age Premium',20,2,0])
            else if PremType = B then
               TypesTable.Appendrecord(['B','Bull Premium',7,2,0]);

            if MonthsOrDays = M then
               Result := TypesTable.FieldByName('TimeFromDOBMonths').AsInteger
            else if MonthsOrDays = D then
               Result := TypesTable.FieldByName('RetensionDays').AsInteger
            else if MonthsOrDays = C then
               Result := TypesTable.FieldByName('TimeOutMonths').AsInteger;
         end;
end;

procedure TWinData.OwnerFileBeforeDelete(DataSet: TDataSet);
begin
   if ( OwnerFile.FieldByName('UserCanDelete').Value <> True ) then
      begin
         MessageDLG('Cannot Delete this Herd - System Defined',mtInformation,[mbOK],0);
         SysUtils.Abort;
      end
   else if LookUpDamSire.Locate('HerdID',OwnerFile.FieldByName('ID').Value,[]) then
      begin
         MessageDLG('Cannot Delete this Herd - Its in USE',mtInformation,[mbOK],0);
         SysUtils.Abort;
      end;
end;

function TWinData.GetNONEHerdID : Integer;
begin
   if FNoneHerdID > 0 then
      begin
         Result := FNoneHerdID;
         Exit;
      end;

   //Check The Owner File for the Default Record - 'NONE' HERD
   with OwnerFile do
      begin
         if Locate('HerdIdentity','NONE',[loCaseInsensitive]) then
            Result := FieldByName('ID').Value
         else
            begin
               // No Record Found so Add it
               Append;
               FieldByName('HerdIdentity').Value := 'NONE';
               FieldByName('UserCanDelete').Value := False;
               Post;
               ReSult := FieldByName('ID').Value;
            end;
         FNoneHerdID := Result;
      end;
end;

function TWinData.GetShowAllAnimals : Boolean;
begin
   // Get the Show all Animals Boolean.
   try
      with Defaults do
         begin
            Open;
            First;
            Result := FieldByName('ShowAllAnimals').AsBoolean;
         end;
   finally
      Defaults.Close;
   end;
end;

procedure TWinData.SetShowAllAnimals ( ShowAll : Boolean );
begin
   // Set the Show all Animals Boolean.
   try
      with Defaults do
         begin
            Open;
            First;
            if EOF then
               begin
                  Insert;
                  FieldByName('ShowAllAnimals').AsBoolean := ShowAll;
               end
            else
               begin
                  Edit;
                  FieldByName('ShowAllAnimals').AsBoolean := ShowAll;
               end;
            Post;
         end;
   finally
      Defaults.Close;
   end;
end;

function TWinData.GetMassUpdates : Boolean;
begin
   // Get the Show all Animals Boolean.
   try
      with Defaults do
         begin
            Open;
            First;
            Result := FieldByName('MassUpdates').AsBoolean;
         end;
   finally
      Defaults.Close;
   end;
end;

procedure TWinData.SetMassUpdates ( Value : Boolean );
begin
   // Set the Show Mass Updates
   try
      with Defaults do
         begin
            Open;
            First;
            if EOF then
               begin
                  Insert;
                  FieldByName('MassUpdates').AsBoolean := Value;
               end
            else
               begin
                  Edit;
                  FieldByName('MassUpdates').AsBoolean := Value;
               end;
            Post;
         end;
   finally
      Defaults.Close;
   end;
end;

function TWinData.GetUserHerdID : Integer;

  procedure GetHerdType(var HerdType : String);
  begin
     with def.Definition do
        if ((dUsePremiums) and not(dUseManCal) and not(dUseQuotaMan) and not(dUseMilkRec)) then
           HerdType := 'Beef'
        else if ((dUsePremiums) and (dUseManCal) and not(dUseQuotaMan) and not(dUseMilkRec)) then
           HerdType := 'Suckler'
        else
           HerdType := 'Dairy';
  end; //SP

var
   AlreadyOpen : Boolean;
begin
   Try
      with Defaults do
         begin
            Open;
            First;
            if EOF then
               begin
                  Insert;
                  FieldByName('DefaultHerdID').AsInteger := 0;
                  Post;
                  GetHerdType(UserTypeOfHerd);
               end
            else
               begin
                  AlreadyOpen := True;
                  if not OwnerFile.Active then
                     begin
                        OwnerFile.Active := True;
                        AlreadyOpen := False;
                     end;
                  if OwnerFile.Locate('ID', Defaults.FieldByName('DefaultHerdID').AsInteger,[]) then
                     begin
                        if GenLookUp.Locate('ID', OwnerFile.FieldByName('TypeOfHerd').AsInteger, [] ) then
                           UserTypeOfHerd := GenLookUp.FieldByName('Description').AsString
                        else
                           UserTypeOfHerd := 'Beef'; // SP
                     end
                  else
                     GetHerdType(UserTypeOfHerd);
                  OwnerFile.Active := AlreadyOpen;
               end;
            Result := FieldByName('DefaultHerdID').AsInteger;
         end;
   finally
      Defaults.Close;
   end;
end;

procedure TWinData.SetUserHerdID ( NewId : Integer );
var
   Reg : TRegistry;
begin
   Reg := TRegistry.Create;
   Try
      with Defaults do
       begin
          Open;
          First;
          if EOF then
             begin
                Insert;
                FieldByName('DefaultHerdID').AsInteger := NewID;
             end
          else
             begin
                Edit;
                FieldByName('DefaultHerdID').AsInteger := NewID;
             end;
          Post;
       end;

      { SP 30/03/2003:- }
      { Store in Registry, used in paddocks for Nutrient Management }
      Reg.RootKey := HKEY_USERS;
      if Reg.OpenKey(Reg_DefaultHerdID, True) then
         Reg.WriteString('Default Herd ID', IntToStr(NewID));
      Reg.CloseKey;
      { SP 30/03/2003. }

   finally
      Reg.Free;
      Defaults.Close;
   end;
end;

procedure TWinData.tBullSemenNewRecord(DataSet: TDataSet);
begin
   // Set in use to true for New Records.
   tBullSemen.FieldByName('AnimalID').AsInteger := AnimalFileByIDID.AsInteger;
   if AnimalFileByIDBreeding.Value = True then
      begin
         if NOT(WinData.AnimalFileByIDAncestor.AsBoolean) then
            tBullSemen.FieldByName('InUse').AsBoolean := True
         else
            tBullSemen.FieldByName('InUse').AsBoolean := False
      end
   else
      tBullSemen.FieldByName('InUse').AsBoolean := False;

end;

function TWinData.CheckForAnimal(AnimalNo : String; NoORID : Char ) : TAnimalCheck; //Boolean;
Var
   AlreadyEntered : Boolean;
   TestStr      : String;
   TestAnimalNo : Variant;
   IsDeleted    : Boolean;
begin
     TestAnimalNo := NULL;
     AlreadyEntered := FALSE;
     // Used to see if the user wants to undelete a animal
     IsDeleted      := FALSE;

     if NoOrID = 'N' then       // See if you can find the AnimalNo
        begin
           TestStr := StripSpaces(AnimalNo);
           if Length(TestStr) > 0 then
              if LookUpDamSire.Locate('AnimalNo;HerdID',VarArrayOf([AnimalNo,AnimalfileByIDHerdId.AsVariant]),[loCaseInsensitive] ) then
                 begin
                    TestAnimalNo := LookUpDamSire.FieldByName('ID').Value;
                    IsDeleted := LookUpDamSire.FieldByName('AnimalDeleted').AsBoolean;
                 end;
        end
     else if NoOrID = 'I' then // National Id
        begin
           // Store the AnimalNo and Strip all spaces to allow a test for blank
           TestStr := StripSpaces(AnimalNo);
           if Length(TestStr) > 0 then
              // TestAnimalNo := WinData.LookUpDamSire.LookUp('NatIdNum',AnimalNo,'ID' );
              begin
                 if LookUpDamSire.Locate('NatIdNum',AnimalNo,[loCaseInsensitive]) then
                    begin
                       TestAnimalNo := LookUpDamSire.FieldByName('ID').Value;
                       IsDeleted := LookUpDamSire.FieldByName('AnimalDeleted').AsBoolean;
                    end;
              end
        end
     else if NoOrID = 'H' then // HerdBook No
        begin
           // Store the AnimalNo and Strip all spaces to allow a test for blank
           TestStr := StripSpaces(AnimalNo);
           if Length(TestStr) > 0 then
              begin
                 // TestAnimalNo := WinData.LookUpDamSire.LookUp('HerdBookNo',AnimalNo,'ID' );
                 if LookUpDamSire.Locate('HerdBookNo',AnimalNo,[loCaseInsensitive] ) then
                    begin
                       TestAnimalNo := LookUpDamSire.FieldByName('ID').Value;
                       IsDeleted := LookUpDamSire.FieldByName('AnimalDeleted').AsBoolean;
                    end;
              end;
        end;

     // if its not NULL then check the ID against the Curent record ID,
     // if they do not match then the AnimalNo is VALID
     if TestAnimalNo <> NULL then
        begin
           if NoOrID = 'N' then
              AlreadyEntered := ( TestAnimalNo <> AnimalFileByIDID.Value )
           else if NoOrID = 'I' then
              begin
                 if Length(TestStr) > 0 then
                    AlreadyEntered := ( TestAnimalNo <> AnimalFileByIDID.Value )
                 else
                    ReSult := AllOk; //False;
              end
           else if NoOrID = 'H' then
              begin
                 if Length(TestStr) > 0 then
                    AlreadyEntered := ( TestAnimalNo <> AnimalFileByIDID.Value )
                 else
                    ReSult := AllOk; //False;
              end
           else
              Result := AllOk; //FALSE;

           if AlreadyEntered And IsDeleted then
              begin
                 Result := Deleted;
                 // if the User exits without undeleting pass back entered as result
                 // this will cause focus to be set to the Animal No Again.
                 if NOT uUnDelete.ShowUnDelete(TestAnimalNo) then
                    Result := Entered;
              end
           else if AlreadyEntered then
              Result := Entered
           else
              Result := AllOK;
        end
     else
         Result := AllOk;  //False;
end;

Function TWinData.StripAllSpaces( StrToStrip : String) : String;
var
   j:integer;
   st : string;
begin
   st := StripSpaces(StrToStrip);
   if length(St)>0 then
      begin
         j := length(St);
         while (j>1) do
            begin
               if St[j] = ' ' then
                  Delete(St,j,1);
               Dec(j);
            end;
      end;
   Result := St;
end;

function TWinData.StripAllNomNumAlpha( StrToStrip : String) : String;
var
   j:integer;
   st : string;
begin
   St := StripAllSpaces(StrToStrip);
   if Length(St)>0 then
      begin
         j := length(St);
         while (j>1) do
            begin
               if NOT ( St[j] in ['A'..'Z','0'..'9'] ) then
                  Delete(St,j,1);
               Dec(j);
            end;
      end;
   Result := St;
end;

function TWinData.ReplaceAllNomNumAlphaWithSpace( StrToStrip : String) : String;
var
   j:integer;
   st : string;
begin
   // Only Strip leading and Trailing Spaces
   St := StripSpaces(StrToStrip);
   if Length(St)>0 then
     begin
        j := length(St);
        while (j>1) do
           begin
              if NOT ( St[j] in ['A'..'Z','0'..'9'] ) then
                 St[j] := ' ';
              Dec(j);
           end;
     end;
   Result := St;
end;

Function TWinData.StripSpaces( StrToStrip : String) : String;
var
   i,
   j:integer;
begin
   if length(StrToStrip)>0 then
      begin
         i := 1;
         while (i<length(StrToStrip)) and (StrToStrip[i]=' ') do
            i := i+1;                     { find first non-blank character }
         if StrToStrip[i]=' ' then        { string is all blank }
            StrToStrip := ''
         else                      { string is not all blank }
            begin
               j := length(StrToStrip);
               while (j>1) and (StrToStrip[j]=' ') do
                  j := j-1;         { find end of non-blank section }
               StrToStrip := copy(StrToStrip,i,j+1-i);
            end;
      end;
   Result := StrToStrip;
end;

procedure TWinData.OwnerFileBeforePost(DataSet: TDataSet);
var
   HID : String;
begin
   HID := OwnerFile.FieldByName('HerdIdentity').AsString;
   HID := StripSpaces(HID);
   if OwnerFile.FieldByName('UserCanDelete').Value = False then
      begin
         if ( OwnerFile.FieldByName('HerdIdentity').AsString <> 'NONE' ) then
            begin
              MessageDLG('System Defined Herd - Cannot be changed',mtInformation,[mbOK],0);
              SysUtils.Abort;
            end;
      end
   else if Length(HID) = 0 then
      begin
         MessageDLG('Herd Identity must be entered',mtWarning,[mbOK],0);
         SysUtils.Abort;
      end;

   // Check if saving herd as Goat Species, if so append the Herd Identifier
   // to the Goat Tag Mask in defaults table.
   // Check Herd Identifier is present.

   if GenLookUp.Locate('ListType;Description',VarArrayOf([LSpecies,cSpecies_Goats]),[]) then
      begin
         if OwnerFile.FieldByName('Species').AsInteger = GenLookUp.FieldByName('ID').AsInteger then
            begin

               // The herd species is being saved as GOAT, do validation checks

               // Ensure GOAT species has herd type DAIRY
               if OwnerFileTypeOfHerd.AsInteger <> HerdType_DairyID then
                  OwnerFileTypeOfHerd.AsInteger := HerdType_DairyID;

               // Check valid length.
               if OwnerFile.FieldByName('Country').AsInteger in [7,12,14] then
                  begin
                  end
               else if OwnerFile.FieldByName('Country').AsInteger in [7,12,14] then
                  begin
                     if Length(OwnerFile.FieldByName('HerdIdentifier').AsString) <> 7 then
                        begin
                           MessageDLG('You must enter a valid 7 digit Herd Identifier!',mtError,[mbOK],0);
                           SysUtils.Abort;
                        end
                  end
               else
                  begin
                     GoatTagFormat := 'IE '+ OwnerFile.FieldByName('HerdIdentifier').AsString;
                  end;
            end;
      end;
end;

procedure TWinData.SaleDeathNewRecord(DataSet: TDataSet);
begin
   SaleDeathEventID.AsInteger := EventID.AsInteger;
   SaleDeathCustomer.AsInteger := DefaultCustomer;
   SaleDeathSold.Value := TRUE;
   SaleDeathNotified.Value := FALSE;
   SaleDeathCTSReg.Value := FALSE;
   if WinData.EventType = TSaleDeath then
      SaleDeathPreSale.AsBoolean := False
   else if WinData.EventType = TPreSale then
      SaleDeathPreSale.AsBoolean := True
   else
      begin
         Events.Cancel;
         SaleDeath.Cancel;
         raise Exception.Create('Invalid eventype type selected');
      end;

   if not MassSalesUpdate then
      SaleDeathSlaughter.AsBoolean := (CustomerEligSlght(DefaultCustomer) and CheckSlaughter(AnimalFileByIDID.AsInteger, AnimalFileByIDDateOfBirth.AsDateTime, EventsEventDate.AsDateTime ))
   else
      SaleDeathSlaughter.AsBoolean := False;
   if NOT WinData.sDefNOTHeld then
      try
         SaleDeathPrice.Value := WinData.sPriceDef;
         SaleDeathWeight.Value := WinData.sWeightDef;
      except
      end;

   if ActivePDAEvents then
      begin
         if SaleDeathRecord <> nil then
            begin
               SaleDeathPrice.Value := SaleDeathRecord^.Price;
               SaleDeathWeight.Value := SaleDeathRecord^.Weight;
               SaleDeathGrade.Value := SaleDeathRecord^.Grade;
               SaleDeathCustomer.Value := SaleDeathRecord^.CustID;
               SaleDeathSold.AsBoolean := SaleDeathRecord^.Sold;
               if not SaleDeathRecord^.Sold then
                  begin
                     SaleDeathDisposal.AsInteger := SaleDeathRecord^.DisposalPlace;
                     SaleDeathCulled.AsInteger := SaleDeathRecord^.CauseOfDeath;
                  end;
            end;
      end;
end;

procedure TWinData.CheckFiles;
Var
   UpdateNo : Integer;  // To test against the iHerdVerNo in Const GenTypesConst.
   MyQuery : TQuery;
   MyTable : TTable;
   GenBool       : Boolean;
   UpDateOK           : Boolean;
   RunReCheck         : Boolean;
begin
   PurchDateSet := False;
   SaleDeathDateSet := False;
   RunReIndex := FALSE;
// Can be used to Add Field to existing Data NOT in use at present
   MyTable := TTable.Create(nil);
   MyQuery := TQuery.Create(nil);
try
   MyTable.DatabaseName := KingData.DatabaseName;
   MyQuery.DatabaseName := KingData.DatabaseName;

   try
      UpdateNo := 0;
      MyTable.TableName := 'Defaults';
      MyTable.Open;
      MyTable.First;
      UpdateNo := MyTable.FieldByName('UpdateNo').AsInteger;
   finally
      MyTable.Close;
   end;

   if (UpdateNo = 0) or (UpdateNo < 3610) then
      try
         uUpdateTables.UpdateKingswd;
      except
      end;

   if (UpdateNo < 3747) then
      begin
//         UpgradeTableLevel;
//         ReIndexAll(False);
      end;

   if (UpdateNo < 3695) then
      // Fix animal table corruption
      with TQuery.create(nil) do
         try
            DatabaseName := 'kingswd';

            SQL.Clear;
            SQL.Add('Update Animals A Set A.Inherd = False         ');
            SQL.Add('Where A.ID IN (Select E.AnimalID From Events E');
            SQL.Add('               LEFT JOIN SalesDeaths S ON (S.EventID=E.ID)');
            SQL.Add('               Where (E.EventType = 11) ');
            SQL.Add('               AND (S.Presale = False))');
            ExecSQL;
         finally
            Free;
         end;

   if ( UpdateNo < 3724 ) then
      begin
          // PhoneLink Changes.
         if FileExists( IniDir + cPhoneLinkIniFile ) then
            DeleteFile( IniDir + cPhoneLinkIniFile );
      end;

   CreateAFilters;
   // Check if the AFilters Table exists - This hold ID currently on the Grid
{   try
      MyTable.Close;
      MyTable.TableName := 'AFilters';
      MyTable.Open;
   except
      with MyQuery do
         begin
            SQL.Clear;
            SQL.Add('CREATE TABLE "AFilters.db"');
                  SQL.Add('(');
                  SQL.Add(' AID     INTEGER,');
            SQL.Add(' PRIMARY KEY(AID)');
            SQL.Add(')');
            ExecSQL; // Create the TABLE
         end;
      MyQuery.Close;
   end;
}
   { ------------ End Ext001.db Changes ------------}

   with MyTable do
      try
         Close;
         TableName := 'Ext001';
         Open;
         try
            FieldByName('ForageAreaHa').AsFloat;
         except
            Close;
            with MyQuery do
               try
                  SQL.Clear;
                  SQL.Add('ALTER TABLE Ext001 ADD ForageAreaHa Float');
                  try
                     execsql;
                  except
                     //
                  end;
               finally
                  //
               end;
         end;
      finally
         close;
      end;

   with MyTable do
      try
         Close;
         TableName := 'Ext001';
         Open;
         try
            FieldByName('NumEwes').AsInteger;
         except
            Close;
            with MyQuery do
               try
                  SQL.Clear;
                  SQL.Add('ALTER TABLE Ext001 ADD NumEwes INTEGER');
                  try
                     execsql;
                  except
                     //
                  end;
               finally
                  //
               end;
         end;
      finally
         close;
      end;

   { ------------ End Ext001.db Changes ------------}

   with MyTable do
      try
         Close;
         TableName := 'flt.db';
         Open;
         try
            FieldByName('AIBull').AsBoolean;
         except
            Close;
            with MyQuery do
               try
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "flt.db" ADD AIBull          Boolean,');
                  SQL.Add('                     ADD Retag           Boolean,');
                  SQL.Add('                     ADD LeftHerd        Boolean,');
                  SQL.Add('                     ADD Breeding        Boolean,');
                  SQL.Add('                     ADD NonBreeding     Boolean,');
                  SQL.Add('                     ADD Ancestors       Boolean,');
                  SQL.Add('                     ADD Dairy           Boolean,');
                  SQL.Add('                     ADD Beef            Boolean,');
                  SQL.Add('                     ADD NoneHerd        Boolean');
                  try
                     execsql;
                  except
                     //
                  end;
               finally
                  //
               end;
         end;
      finally
         close;
      end;

   With MyTable do
      try             // Use this table for grids throughout the program.
         Close;
         TableName := 'TmpGrid';
         try
            IndexDefs.FindIndexForFields('SortAnimalNo');
         except
            Active := False;
            with FieldDefs do
               begin
                  FieldDefs.Clear;
                  FieldDefs.Add('ID',ftInteger,0,FALSE);
                  FieldDefs.Add('Selected',ftBoolean,0,FALSE);
                  FieldDefs.Add('AnimalNo',ftString,10,FALSE);
                  FieldDefs.Add('SortAnimalNo',ftString,20,FALSE);
                  FieldDefs.Add('Name',ftString,40,FALSE);
                  FieldDefs.Add('DOB',ftDate,0,FALSE);
               end;

            with IndexDefs do
               begin
                  Clear;
                  IndexDefs.Add('','ID',[ixPrimary,ixUnique]);
                  IndexDefs.Add('iSortAnimalNo','SortAnimalNo',[ixCaseInsensitive]);
                  IndexDefs.Add('iName','Name',[ixCaseInsensitive]);
                  IndexDefs.Add('iDOB','DOB',[ixCaseInsensitive]);

                  IndexDefs.Add('iSortAnimalNod','SortAnimalNo',[ixCaseInSensitive,ixDescending]);
                  IndexDefs.Add('iNamed','Name',[ixCaseInSensitive,ixDescending]);
                  IndexDefs.Add('iDOBd','DOB',[ixCaseInSensitive,ixDescending]);
               end;
            try
               CreateTable
            except
              //
            end;
         end;
      finally
         Close;
      end;

{   with MyTable do
      try
         close;
         TableName := 'Defaults.db';
         Open;
         try
            FieldByName('LastEventFileUpdate').AsDateTime;
         except
            Close;
            with MyQuery do
               try
                  try
                     SQL.Text := 'ALTER TABLE Defaults ADD LastEventFileUpdate Date';
                     execsql;
                  except
                     //
                  end;
                  try
                     SQL.Text := 'Update Defaults Set LastEventFileUpdate = "'+DateToStr(Date)+'"';
                     execsql;
                  except
                     //
                  end;
               finally
                  //
                end;
         end;
      finally
         close;
      end;
}

   try
      MyTable.Close;
      MyTable.TableName := 'Defaults';
      MyTable.Open;
      GenBool := (MyTable.FieldDefs.IndexOf('EConvert') < 0);
      MyTable.Close;
      if GenBool then
         try
            MyTable.Close;
            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('ALTER TABLE Defaults ADD EConvert Boolean');
            MyQuery.ExecSQL;

            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('UPDATE Defaults SET EConvert = False');
            MyQuery.ExecSQL;

            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('ALTER TABLE Defaults ADD ReportInEuro Boolean');
            MyQuery.ExecSQL;

            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('UPDATE Defaults SET ReportInEuro = False');
            MyQuery.ExecSQL;

            if MyTable.FieldDefs.IndexOf('Euro') > 0 then
               begin
                  MyQuery.SQL.Clear;
                  MyQuery.SQL.Add('ALTER TABLE Defaults Drop Euro');
                  MyQuery.ExecSQL;
               end;

            if MyTable.FieldDefs.IndexOf('UseEuro') > 0 then
               begin
                  MyQuery.SQL.Clear;
                  MyQuery.SQL.Add('ALTER TABLE Defaults Drop UseEuro');
                  MyQuery.ExecSQL;
               end;

         except
          //
         end;

   finally
      MyTable.Close;
   end;

   try
      try
         MyTable.Close;
         MyTable.TableName := 'Defaults';
         MyTable.Open;
         GenBool := (MyTable.FieldDefs.IndexOf('MilkRecDir') < 0);
         MyTable.Close;
         if GenBool then
            begin
               MyTable.Close;
               MyQuery.SQL.Clear;
               MyQuery.SQL.Add('ALTER TABLE Defaults ADD MilkRecDir Char(70)');
               MyQuery.ExecSQL;

               MyQuery.SQL.Clear;
               MyQuery.SQL.Add('Update Defaults Set MilkRecDir="C:\Kingswood Herd Management" ');
               MyQuery.ExecSQL;
            end;
      except
        //
      end;
   finally
      MyTable.Close;
   end;

   if (UpdateNo = 0) or (UpdateNo < 3709) then
   try
      try
         MyTable.Close;
         MyTable.TableName := 'Defaults';
         MyTable.Open;
         GenBool := (MyTable.FieldDefs.IndexOf('ShowMessage') < 0);
         MyTable.Close;
         if GenBool then
            begin
               MyTable.Close;
               MyQuery.SQL.Clear;
               MyQuery.SQL.Add('ALTER TABLE Defaults ADD ShowMessage Boolean');
               MyQuery.ExecSQL;

               MyTable.Close;
               MyQuery.SQL.Clear;
               MyQuery.SQL.Add('Update Defaults Set ShowMessage=True');
               MyQuery.ExecSQL;
            end;
      except
        //
      end;
   finally
      MyTable.Close;
   end;

   try
      try
         MyTable.Close;
         MyTable.TableName := 'Defaults';
         MyTable.Open;
         GenBool := (MyTable.FieldDefs.IndexOf('ICBFMMR') < 0);
         MyTable.Close;
         if GenBool then
            begin
               MyTable.Close;
               MyQuery.SQL.Clear;
               MyQuery.SQL.Add('ALTER TABLE Defaults ADD ICBFMMR Boolean');
               MyQuery.ExecSQL;

               MyQuery.SQL.Clear;
               MyQuery.SQL.Add('Update Defaults Set ICBFMMR=False');
               MyQuery.ExecSQL;
            end;
      except
        //
      end;
   finally
      MyTable.Close;
   end;

   try
           // Clear BlupEval indexes, and rebuild, Reindex
           MyTable.TableName := 'BlupEval.db';
           if MyTable.Exists then
              begin
                 try
                    MyTable.Close;
                    ReIndex('BlupEval','iAnimalID','AnimalID',[ixUnique,ixPrimary]);
                 except
                    //
                 end;
              end
           else
              begin
                 try
                    with MyQuery do
                       begin
                          SQL.Clear;
                          SQL.Add('CREATE TABLE "BlupEval.db"');
                          SQL.Add('(');
                          SQL.Add(' AnimalID    INTEGER ,');

                          SQL.Add(' GroupName   CHAR(30),');
                          SQL.Add(' MUS         FLOAT   ,');
                          SQL.Add(' SKE         FLOAT   ,');
                          SQL.Add(' BRE         FLOAT   ,');
                          SQL.Add(' FUN         FLOAT   ,');
                          SQL.Add(' DOC         FLOAT   ,');
                          SQL.Add(' REL         FLOAT   ,');
                          SQL.Add(' WWT         FLOAT   ,');
                          SQL.Add(' YWT         FLOAT   ,');
                          SQL.Add(' RELPerc     FLOAT    ');
                          SQL.Add(')');
                          ExecSQL;
                          SQL.Clear;
                          SQL.Add('CREATE INDEX iAnimalID ON "BlupEval.db" (AnimalID)');
                          ExecSQL;
                       end;
                 except
                    //
                 end;
              end;
      except
        //
      end;

   try
      MyTable.TableName := 'Calvings';
      MyTable.Open;
      GenBool := ( MyTable.FieldDefs.IndexOf('CalfDead1') < 0 );
      if GenBool then
         try
            MyTable.Close;
            MyQuery.SQL.Clear;
            // Add a Field to store the default Milk Country from Milk Layout Table
            MyQuery.SQL.Add('ALTER TABLE Calvings       ');
            MyQuery.SQL.Add('ADD CalfDead1 BOOLEAN      ,');
            MyQuery.SQL.Add('ADD CalfDead2 BOOLEAN      ,');
            MyQuery.SQL.Add('ADD CalfDead3 BOOLEAN      ,');
            MyQuery.SQL.Add('ADD CalfDead4 BOOLEAN      ,');
            MyQuery.SQL.Add('ADD CalfMortality1 Integer ,');
            MyQuery.SQL.Add('ADD CalfMortality2 Integer ,');
            MyQuery.SQL.Add('ADD CalfMortality3 Integer ,');
            MyQuery.SQL.Add('ADD CalfMortality4 Integer  ');
            MyQuery.ExecSQL;
            MyQuery.Close;
         except
           Raise;
         end;
   finally
      MyTable.Close;
   end;

   try
      try
         MyTable.Close;
         MyTable.TableName := 'Defaults';
         MyTable.Open;
         GenBool := (MyTable.FieldDefs.IndexOf('ICBFDefaultDate') < 0);
         MyTable.Close;
         if GenBool then
            with MyQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE Defaults ADD ICBFDefaultDate DATE ');
                  ExecSQL;
               end;
      except
         raise
      end;
   finally
      if MyTable.Active then
         MyTable.Active := False;
   end;

   try
      try
         MyTable.Close;
         MyTable.TableName := 'SalesDeaths';
         MyTable.Open;
         GenBool := (MyTable.FieldDefs.IndexOf('NIDeathNotify') < 0);
         MyTable.Close;
         if GenBool then
            with MyQuery do
               begin
                  SQL.Clear;
                  SQL.Add('ALTER TABLE SalesDeaths ADD NIDeathNotify BOOLEAN ');
                  ExecSQL;

                  SQL.Clear;
                  SQL.Add('UPDATE SalesDeaths SET NIDeathNotify = TRUE');
                  ExecSQL;
               end;
      except
         on E : Exception do

         raise Exception.Create(E.Message);
      end;
   finally
      if MyTable.Active then
         MyTable.Active := False;
   end;

   try
      try
         MyTable.Close;
         MyTable.TableName := 'Applications';
         MyTable.Open;
         GenBool := (MyTable.FieldDefs.IndexOf('PremType') < 0);
         MyTable.Close;
         if GenBool then
            begin
               MyTable.Close;
               MyQuery.SQL.Clear;
               MyQuery.SQL.Add('ALTER TABLE Applications ADD PremType Char(1)');
               MyQuery.ExecSQL;
            end;
      except
        //
      end;
   finally
      MyTable.Close;
   end;

{
  // SP new import export facility
  try
      try
         MyTable.Close;
         MyTable.TableName := 'PurchGrpData';
         MyTable.Open;
         GenBool := (MyTable.FieldDefs.IndexOf('BruceDate') < 0);
         MyTable.Close;
         if GenBool then
            begin
               MyTable.Close;
               MyQuery.SQL.Clear;
               MyQuery.SQL.Add('ALTER TABLE PurchGrpData ADD BruceDate Date ');
               MyQuery.ExecSQL;
            end;
      except
        //
      end;
   finally
      MyTable.Close;
   end;
}

   try
      try
         MyTable.Close;
         MyTable.TableName := 'Owners';
         MyTable.Open;
         GenBool := (MyTable.FieldDefs.IndexOf('ClientRefNo') < 0);
         MyTable.Close;
         if GenBool then
            begin
               MyTable.Close;
               MyQuery.SQL.Clear;
               MyQuery.SQL.Add('ALTER TABLE Owners ADD ClientRefNo Char(15) ,');
               MyQuery.SQL.Add('                   ADD FarmSurveyNo Char(15) ');
               MyQuery.ExecSQL;
            end;
      except
        //
      end;
   finally
      MyTable.Close;
   end;

  // SP new import export facility
  try
      try
         MyTable.Close;
         MyTable.TableName := 'Owners';
         MyTable.Open;
         GenBool := (MyTable.FieldDefs.IndexOf('DefAccComp') < 0);
         MyTable.Close;
         if GenBool then
            begin
               MyQuery.SQL.Clear;
               MyQuery.SQL.Add('ALTER TABLE Owners ADD DefAccComp Char(30) ');
               MyQuery.ExecSQL;

               MyQuery.SQL.Clear;
               MyQuery.SQL.Add('Update Owners Set DefAccComp = "ACCS"');
               MyQuery.ExecSQL;
            end;
      except
        //
      end;
   finally
      MyTable.Close;
   end;

   try
      MyTable.TableName := 'Defaults';
      MyTable.Open;
      GenBool := ( MyTable.FieldDefs.IndexOf('PassReq') < 0 );

      if GenBool then
         try
            MyTable.Close;

            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('ALTER TABLE Defaults ADD PassReq BOOLEAN ');
            MyQuery.ExecSQL;

            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('Update Defaults Set PassReq = False ');
            MyQuery.ExecSQL;

            MyQuery.Close;
         except
           Raise;
         end;
   finally
      MyTable.Close;
   end;

{   try
      MyTable.TableName := 'Defaults';
      MyTable.Open;
      GenBool := ( MyTable.FieldDefs.IndexOf('SuckCowAmt') < 0 );

      if GenBool then
         try
            MyTable.Close;

            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('ALTER TABLE Defaults ADD SuckCowAmt Float, ');
            MyQuery.SQL.Add('                     ADD SuckHeifAmt Float ');
            MyQuery.ExecSQL;

            MyQuery.Close;
         except
           Raise;
         end;
   finally
      MyTable.Close;
   end;
}


   // add fields to Ext001.DB for extensification dates - kr 10/11/00
   with MyTable do
      try
         close;
         TableName := 'Ext001.DB';
         Open;
         try
            FieldByName('ExtDate5').AsDateTime;
         except
            Close;
            with MyQuery do
               try
                  SQL.Clear;
                  SQL.Add('ALTER TABLE Ext001 ADD ExtDate5 Date,      ');
                  SQL.Add('                   ADD ExtDate6 Date       ');
                  try
                     ExecSql;
                  except
                     //
                  end;
               finally
                  //
               end;
         end;
      finally
         close;
      end;
{
   with MyTable do
      try
         close;
         TableName := 'PremDefaults';
         Open;
         try
            FieldByName('SuckCowHeif').AsFloat;
         except
            Close;
            with MyQuery do
               try
                  SQL.Clear;
                  SQL.Add('ALTER TABLE PremDefaults Drop SuckCow,            ');
                  SQL.Add('                         Drop SuckHeif,           ');
                  SQL.Add('                         Drop HerdID,             ');
                  SQL.Add('                         Drop HeifSlgthPrem,      ');
                  SQL.Add('                         ADD  SuckCowHeif   Float,');
                  SQL.Add('                         ADD  SuckHeifTopup Float ');
                  try
                     ExecSql;
                  except
                     //
                  end;
               finally
                  //
               end;
         end;
      finally
         close;
      end;
}

   //SP 27/09/02:-
   // New PhoneLink Boolean field to check for SMS messages on program startup.
   with MyTable do
      begin
         Close;
         TableName := 'defaults';
         Open;
         if MyTable.FieldDefs.IndexOf('PhoneLink') > 0  then
            Close
         else
            begin
               MyTable.Close;
               with MyQuery do
                  try
                     SQL.Clear;
                     SQL.Add('ALTER TABLE defaults ADD PhoneLink Boolean ');
                     ExecSql;
                     SQL.Clear;
                     SQL.Add('UPDATE defaults SET PhoneLink = False ');
                     ExecSql;
                     MyQuery.Close;
                  except
                    //
                  end;
            end;
      end;
   //SP 27/09/02.

   { SP 29/10/2002:- }
   try
      MyTable.TableName := 'PurchGrpData';
      MyTable.Open;
      GenBool := ( MyTable.FieldDefs.IndexOf('Matched') < 0 );

      if GenBool then
         try
            MyTable.Close;
            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('ALTER TABLE PurchGrpData ADD Matched BOOLEAN ');
            MyQuery.ExecSQL;
            MyQuery.Close;
         except
           Raise;
         end;

   finally
      MyTable.Close;
   end;
   { SP 29/10/2002. }

   { SP 29/10/2002:- }
   try
      MyTable.TableName := 'PurchGrpData';
      MyTable.Open;
      GenBool := ( MyTable.FieldDefs.IndexOf('cGroupID') < 0 );

      if GenBool then
         try
            MyTable.Close;
            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('ALTER TABLE PurchGrpData ADD cGroupID Integer ');
            MyQuery.ExecSQL;
            MyQuery.Close;
         except
           Raise;
         end;

   finally
      MyTable.Close;
   end;
   { SP 29/10/2002. }

   { SP 29/10/2002:- }
   try
      MyTable.TableName := 'PurchGrpData';
      MyTable.Open;
      GenBool := ( MyTable.FieldByName('Sex'). DataSize <= 11);

      if GenBool then
         try
            MyTable.Close;
            ResizeField('PurchGrpData', 'Sex', 15);
         except
           Raise;
         end;

   finally
      MyTable.Close;
   end;
   { SP 29/10/2002. }


   { SP 30/10/2002:- }
   try
      MyTable.TableName := 'MediPur';
      MyTable.Open;
      GenBool := ( MyTable.FieldDefs.IndexOf('BatchNo') < 0 );

      if GenBool then
         try
            MyTable.Close;
            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('ALTER TABLE MediPur ADD BatchNo Char(30) ');
            MyQuery.ExecSQL;
            MyQuery.Close;
         except
           Raise;
         end;

   finally
      MyTable.Close;
   end;

   { SP 30/10/2002:- }
   try
      MyTable.TableName := 'MediPur';
      MyTable.Open;
      GenBool := ( MyTable.FieldDefs.IndexOf('ExpiryDate') < 0 );

      if GenBool then
         try
            MyTable.Close;
            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('ALTER TABLE MediPur ADD ExpiryDate DATE ');
            MyQuery.ExecSQL;
            MyQuery.Close;
         except
           Raise;
         end;

   finally
      MyTable.Close;
   end;

   try
      MyTable.TableName := 'Medicine';
      MyTable.Open;
      GenBool := ( MyTable.FieldDefs.IndexOf('MilkWithDrawal') < 0 );

      if GenBool then
         try
            { Add new medicine withdrawal dates. MilkWithDrawal and OtherWithDrawal both integer fields.
              The withdrawal date already in medicine will be Meat }
            MyTable.Close;
            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('ALTER TABLE Medicine ADD MilkWithDrawal  INTEGER, ');
            MyQuery.SQL.Add('                     ADD OtherWithDrawal INTEGER  ');
            MyQuery.ExecSQL;
            MyQuery.Close;
         except
           Raise;
         end;

   finally
      MyTable.Close;
   end;

  { SP 04/11/2002:- }
{   try
      MyTable.TableName := 'Health';
      MyTable.Open;
      GenBool := ( MyTable.FieldDefs.IndexOf('DrugExpiry') < 0 );

      if GenBool then
         try
            MyTable.Close;
            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('ALTER TABLE Drop DrugExpiry ');
            MyQuery.ExecSQL;
            MyQuery.Close;
         except
            Raise;
         end;
   finally
      MyTable.Close;
   end;
}
   { SP 30/10/2002. }

   { SP 06/11/2002:- }
   try
      MyTable.TableName := 'Breeds';
      MyTable.Open;
      GenBool := ( MyTable.FieldDefs.IndexOf('Selected') < 0 );

      if GenBool then
         try
            MyTable.Close;
            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('ALTER TABLE Breeds ADD Selected BOOLEAN ');
            MyQuery.ExecSQL;
            MyQuery.Close;
         except
           Raise;
         end;
   finally
      MyTable.Close;
   end;
   { SP 06/11/2002. }

   { SP 04/11/2002:- }
   try
      MyTable.TableName := 'Health';
      MyTable.Open;
      GenBool := ( MyTable.FieldDefs.IndexOf('DrugPurchID') <= 0 );

      if GenBool then
         try
            MyTable.Close;
            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('ALTER TABLE Health ADD DrugPurchID INTEGER '); // This will be used to Link MediPurch.db to Health.db
            MyQuery.ExecSQL;
            MyQuery.Close;
         except
         end
      else
         MyTable.Close;

         try
            MyTable.Open;
            GenBool := ( MyTable.FieldDefs.IndexOf('BatchNo') > 0 );

            if GenBool then
               begin
                  MyTable.First;
                  MediPurch.Active := True;
                  while not MyTable.Eof do
                     begin
                        if Trim(MyTable.FieldByName('BatchNo').AsString) <> '' then
                           if MediPurch.Locate('BatchNo', MyTable.FieldByName('BatchNo').AsString, [loCaseInsensitive]) then
                              begin
                                 MyTable.Edit;
                                 MyTable.FieldByName('DrugPurchID').AsInteger := MediPurch.FieldByName('ID').AsInteger;
                                 MyTable.Post;
                              end;
                        MyTable.Next;
                     end;
                  MediPurch.Active := False;
                  MyTable.Close;
                  try
                     MyQuery.SQL.Clear;
                     MyQuery.SQL.Add('ALTER TABLE Health DROP BatchNo ');
                     MyQuery.ExecSQL;
                     MyQuery.Close;
                  except
                  end;

                  try
                     MyQuery.SQL.Clear;
                     MyQuery.SQL.Add('ALTER TABLE Health DROP DrugExpiry ');
                     MyQuery.ExecSQL;
                     MyQuery.Close;
                  except
                  end;
               end;
         except
         end;
   finally
      MyTable.Close;
   end;

   { SP 30/10/2002. }

{   with MyTable do
      try
         Close;
         TableName := 'flt.db';
         Open;
         try
            FieldByName('GroupSel').AsBoolean;
         except
            Close;
            with MyQuery do
               try
                  SQL.Clear;
                  SQL.Add('ALTER TABLE "flt.db" ADD GroupsSelected Boolean');
                  try
                     execsql;
                  except
                     //
                  end;
               finally
                  //
               end;
         end;
      finally
         close;
      end;
}
   try
      MyTable.TableName := 'Defaults';
      MyTable.Open;
      GenBool := ( MyTable.FieldDefs.IndexOf('LastVerUpdate') < 0 );

      if GenBool then
         begin
            MyTable.Close;
            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('ALTER TABLE Defaults ADD LastVerUpdate  DATE ');
            MyQuery.ExecSQL;

            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('UPDATE Defaults Set LastVerUpdate = "'+FormatDateTime(cUSDateStyle,Date)+'"');
            MyQuery.ExecSQL;

            MyQuery.Close;
         end;
   finally
      MyTable.Close;
   end;

   try
      MyTable.TableName := 'Defaults';
      MyTable.Open;
      GenBool := ( MyTable.FieldDefs.IndexOf('PhoneLinkType') < 0 );

      if GenBool then
         begin
            MyTable.Close;
            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('ALTER TABLE Defaults ADD PhoneLinkType INTEGER ');
            MyQuery.ExecSQL;

            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('UPDATE Defaults Set PhoneLinkType = 1 '); // set to Siemens Link
            MyQuery.ExecSQL;

            MyQuery.Close;
         end
      else
         begin

            if ( UpdateNo < 3724 ) then // Reset Phonelink to Nokia 
               begin
                  MyQuery.SQL.Clear;
                  MyQuery.SQL.Add('UPDATE Defaults Set PhoneLinkType = 1 '); // set to Siemens Link
                  MyQuery.ExecSQL;
               end;


         end;
   finally
      MyTable.Close;
   end;

   try
      MyTable.TableName := 'Events';
      MyTable.Open;
      GenBool := ( MyTable.FieldDefs.IndexOf('EventSource') < 0 );

      if GenBool then
         begin
            MyTable.Close;
            MyQuery.SQL.Clear;
            MyQuery.SQL.Add('ALTER TABLE Events ADD EventSource INTEGER ');
            MyQuery.ExecSQL;
            MyQuery.Close;
         end;
   finally
      MyTable.Close;
   end;

   // NN 27/11/2002 :-
   // NN creating fields in a table called LivestockValues
   try
      try
         MyTable.TableName := 'LiveStockValues';
         MyTable.Open;
         GenBool := ( MyTable.FieldDefs.IndexOf('AvgDairyPerc') < 0 );

         if GenBool then
            begin
               MyTable.Close;
               MyQuery.SQL.Clear;
               MyQuery.SQL.Add('ALTER TABLE LiveStockValues ADD AvgDairyPerc FLOAT, ');
               MyQuery.SQL.Add('                            ADD AvgCattlePerc FLOAT,');
               MyQuery.SQL.Add('                            ADD AvgReplacePerc FLOAT');
               MyQuery.ExecSQL;
               MyQuery.Close;
            end;
      except

      end;
   finally
      MyTable.Close;
   end;

   // SP 15/01/2003
   try
      try
         MyTable.TableName := 'BullExt';
         MyTable.Open;
         GenBool := ( MyTable.FieldDefs.IndexOf('FamilyName') < 0 );

         if GenBool then
            begin
               MyTable.Close;
               MyQuery.SQL.Clear;
               MyQuery.SQL.Add('ALTER TABLE BullExt ADD FamilyName Char(30)');
               MyQuery.ExecSQL;
               MyQuery.Close;
            end;
      except
      end;
   finally
      MyTable.Close;
   end;

finally

   if MyTable <> nil then
      begin
         MyTable.Close;
         MyTable.Free;
      end;
   if MyQuery <> nil then
      begin
         MyQuery.Close;
         MyQuery.Free;
      end;
end;

// Call the Function in the Diary Data Module to create and check the Files
{ UpdateOK := dmFarmDiary.DiaryOK; SP No longer needed 02/03/2003 }

   UpdateOK := TRUE;

// Introduced in 1042
if ( UpdateNo = 0 ) or ( UpdateNo < 1042 ) then
   UpdateOK := CheckSireIdCalvingRecords;

// Introduced in 1043
if (( UpdateNo = 0 ) or ( UpdateNo < 1043 )) and ( UpdateOK ) then
   begin
      UpdateOK := CheckCalvingEvents;
      if UpDateOk then
         UpDateOK := CheckPremiumEligibility;
   end;
{
// Introduced in 1060
if (( UpdateNo = 0 ) or ( UpdateNo < 1060 )) and ( UpdateOK ) then
   // Check the Ext001 file exists
   try
      UpdateOK := FALSE;
      MyTable := TTable.Create(nil);
      MyTable.DatabaseName := KingData.DatabaseName;
      MyTable.TableName := 'ext001';
      MyTable.Open;
      MyTable.Close;
      MyTable.DeleteTable;

      MyTable.Free;
      UpdateOK := CreateExtTable;
   except
      MyTable.Close;
      MyTable.Free;
      UpdateOk := CreateExtTable;
   end;
}
// Introduced in 2020
if (( UpdateNo = 0 ) or ( UpdateNo < 2020 )) and ( UpdateOK ) then
   // Check the AnimalDeleted isn't NULL
   try
      UpdateOK := FALSE;
      MyQuery := TQuery.Create(nil);
      MyQuery.DatabaseName := KingData.DatabaseName;
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('UPDATE Animals SET AnimalDeleted=FALSE');
      MyQuery.SQL.Add('WHERE AnimalDeleted IS NULL');
      MyQuery.ExecSQL;
      MyQuery.Close;
      UpdateOK := TRUE;
   finally
      MyQuery.Cancel;
      MyQuery.Free;
   end;


// Introduced in 2023
if (( UpdateNo = 0 ) or ( UpdateNo < 2023 )) and ( UpdateOK ) then
   // Check the Animal file and Owners and Add the Sequence Numbers
   UpdateOK := AddSeqNo;

// Introduced in 2024
if (( UpdateNo = 0 ) or ( UpdateNo < 2024 )) and ( UpdateOK ) then
   // Check the Animal file and transfer the NatID to SortNatID
   begin
      UpdateOK := TransferNatID;
      if UpdateOk then RunReIndex := TRUE;
   end;

// Introduced in 3012
if (( UpdateNo = 0 ) or ( UpdateNo < 3012 )) and ( UpdateOK ) then
   // Check the New Grps.db and GrpTx files exist
   begin
      UpdateOK := MakeGroupTables;
      if UpdateOk then RunReIndex := TRUE;
   end;

// Introduced in 3017
if (( UpdateNo = 0 ) or ( UpdateNo < 3017 )) and ( UpdateOK ) then
   UpDateOK := CheckPremiumEligibility;

// Introduced in 3018
if (( UpdateNo = 0 ) or ( UpdateNo < 3018 )) and ( UpdateOK ) then
   begin
      UpDateOK := RemoveRequiredAnimalNo;
      if UpdateOK then RunReIndex := TRUE;
   end;

// Introduced in 3124 - NEW year 2000 Premiums
if ( RunReCheck ) then
   begin
      MessageDLG('The program is about to recalculate your Eligibility dates' + #13#13 +
                 'This may take up half an hour depending on' + #13 +
                 'the number of animals on your system and the Speed of your computer' + #13#13 +
                 'You cannot make any 1999 applications AFTER this process is complete',mtWarning,[mbOK],0);
      UpDateOK := CheckPremiumEligibility;
   end;

if (( UpdateNo = 0 ) or ( UpdateNo < 3126 )) and ( UpdateOK ) then
   UpdateOK := CheckMilkRecDates;

if (( UpdateNo = 0 ) or ( UpdateNo < 3141 )) and ( UpdateOK ) then
   UpdateOK := ReLinkCalvesToDams(True);

if (( UpdateNo = 0 ) or ( UpdateNo < 3143 )) and ( UpdateOK ) then
   UpdateOK := ICBFNotified;

if (( UpdateNo = 0 ) or ( UpdateNo < 3148 )) and ( UpdateOK ) then
   UpdateOK := FeedCategory;

// check to see if sortnatid needs updated - sp 4/7/00
if (( UpdateNo = 0 ) or ( UpdateNo < 3915)) and ( UpdateOK ) then
   UpdateOK := SortNatIdUpdate;

// reassign natid index in defaults.db - 23/10/00
if (( UpdateNo = 0 ) or ( UpdateNo < 3315 )) and ( UpdateOK ) then
   UpdateOK := ReIndexNatIdMask;

if (( UpdateNo = 0 ) or ( UpdateNo < 3490 )) and ( UpdateOK ) then
   UpdateOK := PremUpdateCosts;

if ((UpdateNo = 0 ) or (UpDateNo < 3490)) and (UpdateOK) then
   UpdateOK := UpdateCountries;

if ((UpdateNo = 0 ) or (UpDateNo < 3490)) and (UpdateOK) then
   UpdateOK := CheckSlaughterEligibility;

if (( UpdateNo = 0 ) or ( UpDateNo < 3490)) and ( UpdateOK ) then
   UpdateOK := PremiumFix;

if ((UpdateNo = 0 ) or (UpDateNo < 3549)) and (UpdateOK) then
   UpdateOK := RemoveOldExtDefaults;


   if ((UpdateNo = 0 ) or (UpDateNo < 3650)) then
      begin
         if UpdateOK then
            UpdateOK := CreateSuckSubsTable;
         if UpdateOK then
            UpdateOK := AmmendReplaceTable; {Subs table}
         if UpdateOK then
            UpdateOK := UpdateSuckPremTable;
         if UpdateOK then
            UpdateOK := CreateSuckQuotaField;
         if UpdateOK then
            UpdateOK := AmmendSuckTable;
         if UpdateOK then
            UpdateOK := UpdateICBFDeleteTable;
         if UpdateOK then
            UpdateOK := ModifySuckField;
         if UpdateOK then
            CheckBreedTable;
         if UpdateOK then
            UpdateOK := MooreParkUpdate;
      end;

if ((UpdateNo = 0 ) or (UpDateNo < 3573)) and (UpdateOK) then
   begin
      MakePremiaDefaults;
      MakePremiaPayments;
   end;

if ((UpdateNo = 0 ) or (UpDateNo < 3568)) and (UpdateOK) then
   UpdateOK := UpdDefaultsSrchField;

   UpdateOK := CreateLstkDefValue;
   UpdateOK := MakeAnimalWasteProd;

   try
      if ((UpdateNo < 3623) and (UpdateOk)) then
         UpdateOK := UpdateBreedsCase;
   except
   end;

if ((UpdateNo < 3633) and (UpdateOk)) then
   BullCowExtFix;

if ((UpdateNo < 3633) and (UpdateOk)) then
   UpdateOk := CreateQuotaTable;

// check to see if sortnatid needs updated - sp 4/7/00
if (( UpdateNo < 3786 ) and ( UpdateOK )) then
   UpdateOK := SortNatIdUpdate;

// check to see if sortnatid needs updated - sp 4/7/00
if (( UpdateNo < 3964 ) and ( UpdateOK )) then
      UpdateOK := TransferAnimalNo;

if (( UpdateNo < 3990 ) and ( UpdateOK )) then
   begin
      HerdDBPassword := '';
      SavePreferences;
   end;
if UpdateOK then
 CheckBreedTable;

uUpdateTables.CheckDatabaseTables(UpdateOK, UpdateNo);   // SP 29/01/2003

if ((UpdateNo = 0 ) or (UpDateNo < 3780)) then
   ReindexAll(True);

if UpdateOK then
   UpdateDefaults;

end; // end of 'check files'

function TWinData.PremUpdateCosts : Boolean;
var
   MyTable : TTable;
begin
   // Function to to update Default Premium Costs //SP 04/09/00
   Result := False;
   MyTable := TTable.Create(NIL);
   try
      MyTable.DatabaseName := KingData.DatabaseName;
      MyTable.Tablename := 'Defaults';
      MyTable.Open;

      try
         with MyTable do
            begin
               First;
               // Changes for 2002, not sure what the new heifslghtprem cost is, leave as before.
               // Check if euro upadte is done, if so insert euro values, this would have happened after releasing early euro versions.
               if FieldByName('EConvert').AsBoolean then
                  begin
                     Edit;
                     FieldByName('AmtBullPrem').AsFloat   := 210.00;
                     FieldByName('Amt10MthPrem').AsFloat  := 150.00;
                     FieldByName('Amt22MthPrem').AsFloat  := 150.00;
                     FieldByName('AmtSlghtPrem').AsFloat  :=  80.00;
                     if FindField('HeifSlghtPrem') <> nil then
                     FieldByName('HeifSlghtPrem').AsFloat :=  49.58; // *****
                     Post;
                  end
               else
                  begin
                     Edit;
                     FieldByName('AmtBullPrem').AsFloat   := 165.39;
                     FieldByName('Amt10MthPrem').AsFloat  := 118.13;
                     FieldByName('Amt22MthPrem').AsFloat  := 118.13;
                     FieldByName('AmtSlghtPrem').AsFloat  :=  63.01;
                     if FindField('HeifSlghtPrem') <> nil then
                     FieldByName('HeifSlghtPrem').AsFloat :=  39.26; // *****
                     Post;
                  end
            end;
         RESULT := True;
      except
         MessageDlg('Cannot Update Default Premium Values - Contact Kingswood',mtWarning,[mbOK],0);
      end;
   finally
      Mytable.Close;
   end;
end;

// KR/SP 04/06/00  Update empty calf SortNatId's due to error writing Natidnum in DB field.
function TWinData.SortNatIdUpdate : Boolean;
var
   MyTable : TTable;
   MyStr : String;
begin
   // function to correct any empty sort nat id numbers prior to 3.3 1.3
   Result := False;
   MyTable := TTable.Create(NIL);
   try
      MyTable.DatabaseName := KingData.DatabaseName;
      MyTable.Tablename := 'Animals';
      try
         with MyTable do
            begin
               Disablecontrols;
               open;
               try
                  First;
                  while not EOF do
                     begin
                        Edit;
                        MyStr := FieldByName('NatIdNum').AsString;
                        FieldByName('SortNatId').AsString := CreateSortNatIDString(MyStr, FieldByName('HerdID').AsInteger);
                        Post;
                        Next;
                     end;
               finally
                  MyTable.Close;
               end;
            end;
         RESULT := True;
      except
         MessageDlg('Cannot update National ID Sort Codes - Contact Kingswood',mtWarning,[mbOK],0);
      end;
   finally
      MyTable.Free; //Sp
   end;
end;

// separated out as general function - kr/sp - 2/8/00
function TWinData.RemoveCheckDigit(NatIDStr : string) : String;
var
   tempstr : string;
begin
   if WhatStyleNatID(NatIDStr, False) = Style1999 then
      begin
         NatIDStr := StripAllSpaces(NatIDStr);
         TempStr  := Copy(NatIdStr,Length(NatIdStr)-4,1);
         Delete(NatIDStr,Length(NatIDStr)-4,1);
         NatIdStr := NatIdStr + TempStr;
      end;
   RESULT := NatIDStr;
end;

// use this with SortNatID update v3.2 r1.2 - kr 5/7/00
function TWinData.CheckZeroSortNatID(SortNatID : String) : Boolean;
var
   i,
   StringEnd : integer;
begin
   StringEnd := (Length(SortNatID));
   for i := 1 to StringEnd do
      begin
         if SortNatID[i] = '0' then
            RESULT := True
         else
            begin
               RESULT := False;
               StringEnd := i;
            end;
      end;
end;

function TWinData.ReIndexNatIdMask: Boolean;
var
   MyTable : TTable;
begin
   RESULT := False;

   MyTable := TTable.Create(nil);
   try
      MyTable.DataBaseName := KingData.DataBaseName;
      MyTable.Close;
      MyTable.TableName := 'Defaults';

      MyTable.Open;
      try
         MyTable.First;
         MyTable.Edit;
         case MyTable.FieldByName('NatIDIndex').AsInteger of
            0: MyTable.FieldByName('NatIDIndex').AsInteger := 1;
            1: MyTable.FieldByName('NatIDIndex').AsInteger := 2;
            2: MyTable.FieldByName('NatIDIndex').AsInteger := 0;
            3: MyTable.FieldByName('NatIDIndex').AsInteger := 4;
         end;
         MyTable.Post;
         RESULT := True;
      finally
         MyTable.Close;
      end;
   finally
      MyTable.Free;
   end;
end;

function TWinData.CheckMilkRecDates : Boolean;
var
   qMilkTrans   : TQuery;
   MilkRecs     : TTable;
   mYear,
   mMonth,
   mDay        : Word;
   NewDate     : TDateTime;
begin
   qMilkTrans := TQuery.Create(nil);
   MilkRecs := TTable.Create(nil);
   try
      qMilkTrans.DataBaseName := KingData.DataBaseName;
      MilkRecs.DataBaseName := KingData.DataBaseName;
      MilkRecs.TableName := MainMilkTrans.TableName;
      MilkRecs.Open;

      // first Milk Recording Record
      MilkRecs.First;
      while NOT MilkRecs.EOF do
         begin
             // May Need fixing
             if MilkRecs.FieldByName('RecordingDate').AsDateTime > Now() then
                begin
                   DecodeDate(MilkRecs.FieldByName('RecordingDate').AsDateTime,mYear,mMonth,mDay);
                   if mYear > 2060 then  // Invalid Record
                      begin
                          // Subtract 1200 months from the date (100 years)
                          NewDate := IncMonth(MilkRecs.FieldByName('RecordingDate').AsDateTime,-1200);
                          // Update the Individual Records for the above record
                          with qMilkTrans do
                             begin
                                SQL.Clear;
                                SQL.Add('UPDATE ' + MilkDiskTrans.TableName);
                                SQL.Add('SET DateOfRecording="' + FormatDateTime(cUSDateStyle,NewDate) + '"');
                                SQL.Add('WHERE MDTID=' + MilkRecs.FieldByName('ID').AsString);
                                ExecSQL;
                             end;
                          // Update the Main Record
                          MilkRecs.Edit;
                          MilkRecs.FieldByName('RecordingDate').AsDateTime := NewDate;
                          MilkRecs.FieldByName('Description').AsString := 'Milk Recording on ' + FormatDateTime(cIrishDateStyle,NewDate);
                          MilkRecs.Post;
                      end;
                end;
             MilkRecs.Next;
         end;
      RESULT := TRUE;
   finally
      MilkRecs.Close;
      qMilkTrans.Close;
      MilkRecs.Free;
      qMilkTrans.Free;
   end;
end;

function TWinData.InsertZeros ( OrigStr : String; NewSize : Integer ) : String;
var
   TempStr : String;
begin
   TempStr := OrigStr;
   TempStr := StripAllSpaces(TempStr);
   // Concat zero to string
   while Length(TempStr) < NewSize do
      TempStr := '0' + TempStr;
   Result := TempStr;
end;

function TWinData.AddSeqNo : Boolean;
var
   NextNo : Integer;
   AnimalQuery : TQuery;
   AnimalTable : TTable;
   OwnerQuery  : TQuery;
   OwnerTable  : TTable;
begin
   AnimalQuery := TQuery.Create(nil);
   AnimalTable := TTable.Create(nil);
   OwnerQuery := TQuery.Create(nil);
   OwnerTable := TTable.Create(nil);
   try
      AnimalQuery.DataBaseName := KingData.DataBaseName;
      AnimalTable.DataBaseName := KingData.DataBaseName;
      OwnerQuery.DataBaseName := KingData.DataBaseName;
      OwnerTable.DataBaseName := KingData.DataBaseName;
      AnimalTable.TableName := 'Animals';
      OwnerTable.TableName := 'Owners';
      OwnerTable.Open;
      AnimalTable.Open;
      try

         OwnerQuery.SQL.Clear;
         OwnerQuery.SQL.Add('SELECT * FROM owners');
         OwnerQuery.Open;
         OwnerQuery.First;
         while NOT OwnerQuery.EOF do
            begin
               NextNo := 1;
               AnimalQuery.SQL.Clear;
               AnimalQuery.SQL.Add('SELECT * FROM ANIMALS');
               AnimalQuery.SQL.Add('WHERE (HerdID = ' + OwnerQuery.FieldByName('ID').AsString + ')');
               AnimalQuery.SQL.Add('ORDER BY ID');
               AnimalQuery.Open;
               while NOT AnimalQuery.EOF do
                  begin
                     // Update the Animal Record with the Seq No
                     if AnimalTable.Locate('ID',AnimalQuery.FieldByName('ID').Value,[] ) then
                        begin
                           AnimalTable.Edit;
                           AnimalTable.FieldByName('SeqNo').AsInteger := NextNo;
                           AnimalTable.Post;
                        end;
                     AnimalQuery.Next;
                     Inc(NextNo);
                  end;
               Dec(NextNo);
               // Set the Owners Last Seq Number
               if OwnerTable.Locate('ID',OwnerQuery.FieldByName('ID').Value,[] ) then
                  begin
                     OwnerTable.Edit;
                     OwnerTable.FieldByName('LastSeqNo').AsInteger := NextNo;
                     OwnerTable.Post;
                  end;
               OwnerQuery.Next;
            end;
      Result := TRUE;
      finally
         OwnerTable.Close;
         AnimalTable.Close;
      end;
   finally
      OwnerTable.Free;
      AnimalTable.Free;
      AnimalQuery.Free;
      OwnerQuery.Free;
   end;
end;

function TWinData.RemoveRequiredAnimalNo : Boolean;
var
   MyQuery : TQuery;
begin
   MyQuery := TQuery.Create(nil);
   try
      MyQuery.DatabaseName := KingData.DatabaseName;
      with MyQuery do
         begin
            SQL.Clear;
            SQL.Add('ALTER TABLE Animals ADD tan CHAR(10)');
            ExecSQL;
            SQL.Clear;
            SQL.Add('UPDATE Animals SET tan=AnimalNo');
            ExecSQL;
            SQL.Clear;
            SQL.Add('ALTER TABLE Animals DROP AnimalNo');
            ExecSQL;
            SQL.Clear;
            SQL.Add('ALTER TABLE Animals Add AnimalNo CHAR(10)');
            ExecSQL;
            SQL.Clear;
            SQL.Add('UPDATE Animals SET AnimalNo=tan');
            ExecSQL;
            SQL.Clear;
            SQL.Add('ALTER TABLE Animals DROP tan');
            ExecSQL;
         end;
      RESULT := TRUE;
   finally
      MyQuery.Free;
   end;
end;

function TWinData.TransferAnimalNo : Boolean;
var
   ATable : TTable;
   s : string;
begin
   ATable := TTable.Create(nil);
   try
      ATable.DatabaseName := KingData.DatabaseName;
      ATable.TableName := 'Animals';
      ATable.Open;
      try
         ATable.First;
         while not ATable.EOF do
            begin
               ATable.Edit;
               //ATable.FieldByName('SortAnimalNo').AsString := InsertZeros(StripAllNomNumAlpha(ATable.FieldByName('AnimalNo').AsString), ATable.FieldByNAme('AnimalNo').Size);
               ATable.FieldByName('SortAnimalNo').AsString := SortAnimalNoString(ATable.FieldByName('AnimalNo').AsString);
               try
                  ATable.Post;
               except
                  ATable.Cancel;
               end;
               ATable.Next;
            end;
         Result := TRUE;
      finally
         ATable.Close;
      end;
   finally
      ATable.Free;
   end;
end;

function TWinData.TransferNATID : Boolean;
var
   ATable : TTable;
   MyBar : TProgressBar;
   MyStr : String;
begin
   Result := FALSE;
   try
      MyBar := TProgressBar.Create(nil);
      ATable := TTable.Create(nil);
      ATable.DatabaseName := KingData.DatabaseName;
      ATable.TableName := 'Animals';
      ATable.Open;
      ATable.First;
      // Assign the bar to whatever form
      MyBar.Parent := Screen.ActiveForm;
      MyBar.Align := alBottom;
      MyBar.Step := 1;
      MyBar.Min := 1;
      MyBar.Max := 1;
      if ATable.RecordCount > 0 then
        MyBar.Max := ATable.RecordCount;
      MyBar.Height := 50;
      MyBar.Enabled := TRUE;
      MyBar.Show;
      MyBar.ReFresh;
      Screen.ActiveForm.Refresh;
      while not ATable.EOF do
         begin
            ATable.Edit;
            // Determine the NatID Type
            MyStr := ATable.FieldByName('NatIDNum').AsString;
            ATable.FieldByName('SortNatID').AsString := CreateSortNatIDString(MyStr, ATable.FieldByName('HerdID').AsInteger);
            ATable.Post;
            ATable.Next;
            MyBar.StepIt;
         end;
      Result := TRUE;
   finally
      MyBar.Free;
      ATable.Close;
      ATable.Free;
   end;
end;
{
procedure TWinData.PurchGrpHeaderCreate;
var
   MyQuery : TQuery;
begin
   try
      MyQuery := TQuery.Create(nil);
      MyQuery.DatabaseName := KingData.DatabaseName;
      with MyQuery do
         begin   //Create fields in the tPurchGrpHeader table
            SQL.Add('CREATE TABLE "PurchGrpHeader.db"');
     	    SQL.Add('(');
	          SQL.Add(' ID               AUTOINC,');
            SQL.Add(' PurchGroupID     Integer,');
            SQL.Add(' PurchGrpCode     CHAR(6),');
            SQL.Add(' PurchaseDate     Date,');
            SQL.Add(' SupplierID       Integer,');
            SQL.Add(' SupplierCosts    Float,');
            SQL.Add(' BuyerID          Integer,');
            SQL.Add(' BuyerCosts       Float,');
            SQL.Add(' Sex              CHAR(10),');
            SQL.Add(' Number           SmallInt,');     //Number that should be in Group
            SQL.Add(' MartWeight       Float,');
            SQL.Add(' MartCost         Float,');
            SQL.Add(' VAT              Float,');           //VAT rate
            SQL.Add(' HerdID           Integer,');
            SQL.Add(' GroupID          Integer,');
            SQL.Add(' PenID            Integer,');
            SQL.Add(' Breeding         Boolean,');
            SQL.Add(' LactationNumber  Smallint,');
            SQL.Add(' EventDesc        CHAR(30),');
            SQL.Add(' OfficePhase1     Boolean,');
            SQL.Add(' TagWtVsMartWtVar Float,');
            SQL.Add(' DataPosted       Boolean,');
            SQL.Add(' ActualNumber     Integer,');
            SQL.Add(' TotWeight        Float,');
            SQL.Add(' TotMartPrice     Float,');
            SQL.Add(' TotCostIntoPen   Float,');
            SQL.Add(' PRIMARY KEY(ID)');
            SQL.Add(')');
            ExecSQL; // Create the TABLE
          end;
   finally
      MyQuery.Close;
      MyQuery.Free;
   end;
end;
}

{procedure TWinData.PurchGrpDataCreate;
var
   MyQuery : TQuery;
begin
   try
      MyQuery := TQuery.Create(nil);
      MyQuery.DatabaseName := KingData.DatabaseName;
      with MyQuery do
         begin   //Create fields in the tPurchGrpHeader table
            SQL.Add('CREATE TABLE "PurchGrpData.db"');
	          SQL.Add('(');
            SQL.Add(' ID               AutoInc,');
            SQL.Add(' PurchGrpHeaderID Integer,');
            SQL.Add(' SeqNum           Smallint,');
            SQL.Add(' NatIDNum         CHAR(20),');
            SQL.Add(' AnimalNo         CHAR(10),');
            SQL.Add(' PrimaryBreed     Integer,');
            SQL.Add(' Weight           Float,');
            SQL.Add(' EventDesc        CHAR(30),');
            SQL.Add(' Grade            CHAR(15),');
            SQL.Add(' Colour           Integer,');
            SQL.Add(' MartPrice        Float,');
            SQL.Add(' CostIntoPen      Float,');
            SQL.Add(' DateOfBirth      Date,');
            SQL.Add(' TBTestDate       Date,');
            SQL.Add(' EventDate        Date,');
            SQL.Add(' SupplierID       Integer,');
            SQL.Add(' BuyerID          Integer,');
            SQL.Add(' Sex              CHAR(10),');
            SQL.Add(' GroupID          Integer,');
            SQL.Add(' PenID            Integer,');
            SQL.Add(' Breeding         Boolean,');
            SQL.Add(' LactationNumber  Smallint,');
            SQL.Add(' SupplierCosts    Float,');
            SQL.Add(' BuyerCosts       Float,');
            SQL.Add(' PRIMARY KEY(ID)');
            SQL.Add(')');
            ExecSQL; // Create the TABLE
          end;
   finally
      MyQuery.Close;
      MyQuery.Free;
   end;
end;
}
{procedure TWinData.MakeSApplic;
Var
   SucklerQuery : TQuery;
begin
   try
      SucklerQuery := TQuery.Create(nil);
      SucklerQuery.DatabaseName := KingData.DatabaseName;
      with SucklerQuery do
         begin
            SQL.Add('CREATE TABLE "SApplic.db"');
     	    SQL.Add('(');
	          SQL.Add(' ID AUTOINC,');
     	    SQL.Add(' DateOfApplic DATE,');
	          SQL.Add(' RetensionDate DATE,');
     	    SQL.Add(' YearOfApplic INTEGER,');
	          SQL.Add(' HerdID INTEGER,');
     	    SQL.Add(' Description CHAR(30),');
            SQL.Add(' PRIMARY KEY(ID)');
            SQL.Add(')');
            ExecSQL; // Create the TABLE
         end;
   finally
      SucklerQuery.Close;
      SucklerQuery.Free;
   end;
end;
}
{procedure TWinData.MakeSAppliedFor;
Var
   SucklerQuery : TQuery;
begin
   try
      SucklerQuery := TQuery.Create(nil);
      SucklerQuery.DatabaseName := KingData.DatabaseName;
      with SucklerQuery do
         begin
            SQL.Add('CREATE TABLE "SAppliedFor.db"');
     	    SQL.Add('(');
            SQL.Add(' ID AUTOINC,');
     	    SQL.Add(' ApplicationID INTEGER,');
            SQL.Add(' AnimalID INTEGER,');
            SQL.Add(' PRIMARY KEY(ID,ApplicationID,AnimalID)');
            SQL.Add(')');
            ExecSQL; // Create the TABLE
         end;
   finally
      SucklerQuery.Close;
      SucklerQuery.Free;
   end;
end;
}
procedure TWinData.MakePremiaDefaults;
var
   TPremia : TTable;
begin
   TPremia := TTable.Create(nil);
   WinData.Defaults.Active := True;
   try
      TPremia.DatabaseName := KingData.DatabaseName;

      if TPremia.Exists then
         TPremia.DeleteTable;

      with TPremia do
         begin
            TableName := 'PremDefaults';

            with FieldDefs do
               begin
                  Clear;
                  Add('ID',            ftAutoInc,  0, False);
                  Add('Year',          ftInteger,  0, False);
                  Add('Month10',       ftCurrency, 0, False);
                  Add('Month22',       ftCurrency, 0, False);
                  Add('Bull',          ftCurrency, 0, False);
                  Add('SuckCowHeif',   ftCurrency, 0, False);
                  Add('SuckHeifTopup', ftCurrency, 0, False);
                  Add('SlgthPrem',     ftCurrency, 0, False);
                  Add('SlgthTopUpPrem',ftCurrency, 0, False);
                  Add('LastEditDate',  ftDate,     0, False);
               end;

            with IndexDefs do
               begin
                  Clear;
                  Add('iID', 'ID', [ixPrimary]);
                  Add('iYear', 'Year', [ixCaseInsensitive, ixUnique]);
               end;
            CreateTable;
            Open;

            try
               Insert;
               try
                  FieldByName('Year').AsInteger           := PremDefYear;
                  FieldByName('Month10').AsCurrency       := PremDefMonth10;
                  FieldByName('Month22').AsCurrency       := PremDefMonth22;
                  FieldByName('Bull').AsCurrency          := PremDefBull;
                  FieldByName('SuckCowHeif').AsCurrency   := PremDefSuckCowHeif;
                  FieldByName('SuckHeifTopup').AsCurrency := PremDefSuckHeifTopUp;
                  FieldByName('SlgthPrem').AsCurrency     := PremDefSlgth;
                  FieldByName('SlgthTopUpPrem').AsCurrency:= PremDefSlgthTopUp;
                  Post;
               except
                  Cancel;
               end;
            finally
               Close;
            end;

         end;
   finally
      WinData.Defaults.Active := False;
      TPremia.Free;
   end;
end;

procedure TWinData.MakePremiaPayments;
begin
   with PremiaPayments do
      try
         if Exists then
            DeleteTable;

         TableName := 'PremiaPayments';
         TableType := ttParadox;

         with FieldDefs do
            begin
               Add('ID',            ftAutoInc,   0, False);

               // Header Details
               Add('ApplicID',      ftInteger,   0, False);
               Add('PayDate',       ftDate,      0, False);
               Add('PayRefNo',      ftString,   30, False);
               Add('PayOrdNo',      ftString,   30, False);
               Add('BeefReduct',    ftCurrency,  0, False);
               Add('PayType',       ftInteger,  0, False);

               { Beef Premium }
               Add('First_Amt',     ftCurrency,  0, False);
               Add('Second_Amt',    ftCurrency,  0, False);
               Add('Bull_Amt',      ftCurrency,  0, False);
               Add('First_Clm',     ftInteger,  0, False);
               Add('Second_Clm',    ftInteger,  0, False);
               Add('Bull_Clm',      ftInteger,  0, False);

               { Suckler Premium }
               Add('SuckCowHeif_Amt',   ftCurrency,  0, False);
               Add('SuckHeifTopUp_Amt',  ftCurrency,  0, False);
               Add('SuckCowHeif_Clm',   ftInteger,  0, False);
               Add('SuckHeifTopUp_Clm',  ftInteger,  0, False);

               { Slaughter Premium }
               Add('Slght_Amt',     ftCurrency,  0, False);
               Add('SlghtHeifTopUp_Amt', ftCurrency,  0, False);
               Add('Slght_Clm',     ftInteger,  0, False);
               Add('SlghtHeifTopUp_Clm', ftInteger,  0, False);

               { Payment values }
               Add('Penalty_Amt',   ftCurrency,  0, False);
               Add('Running_Amt',   ftCurrency,  0, False);
               Add('Payable_Amt',   ftCurrency,  0, False);
               Add('BalanceDue',    ftCurrency,  0, False);

               Add('Comment',      ftBlob,    220, False);
            end;

         with IndexDefs do
            begin
               Clear;
               Add(''  ,'ID' ,[ixPrimary,ixUnique]);
               Add('iApplicID'  ,'ApplicID' ,[ixCaseInsensitive]);
            end;

         CreateTable;
      except
         MessageDlg('Cannot create table "PremiaPayments.db"',mtError,[mbOK],0);
      end;
end;

// Create the Cow Ext if it doesn't exist
{procedure TWinData.MakeCowExt;
Var
   CowExtQuery : TQuery;
begin
   try
      CowExtQuery := TQuery.Create(nil);
      CowExtQuery.DatabaseName := KingData.DatabaseName;
      with CowExtQuery do
         begin
            SQL.Add('CREATE TABLE "CowExt.db"');
            SQL.Add('(');
	          SQL.Add(' AnimalId INTEGER,');
	          SQL.Add(' PIN INTEGER,');
            SQL.Add(' ITEM INTEGER,');
            SQL.Add(' CGI INTEGER,');
	          SQL.Add(' EBI SmallInt,');
	          SQL.Add(' CalcFrom CHAR(25),');
	          SQL.Add(' Country INTEGER,');
	          SQL.Add(' SRStatus CHAR(1),');
	          SQL.Add(' Awards CHAR(25),');
	          SQL.Add(' LatestClass CHAR(2),');
	          SQL.Add(' LatestClassScore INTEGER,');
            SQL.Add(' NoOfTimesClassedEX INTEGER,');
            SQL.Add(' FarmID CHAR(4),');
            SQL.Add(' PRIMARY KEY(AnimalID)');
            SQL.Add(')');
            ExecSQL; // Create the TABLE
         end;
   finally
      CowExtQuery.Close;
      CowExtQuery.Free;
   end;
end;
}
// Create the Sale Deletion Table if it doesn't exist
{procedure TWinData.MakeSaleDeletion;
Var
   SaleDeletionQuery : TQuery;
begin
   try
      SaleDeletionQuery := TQuery.Create(nil);
      SaleDeletionQuery.DatabaseName := KingData.DatabaseName;
      with SaleDeletionQuery do
         begin
            SQL.Add('CREATE TABLE "shrd.db"');
     	    SQL.Add('(');
	          SQL.Add(' AID INTEGER,');
     	    SQL.Add(' SaleDate DATE,');
	          SQL.Add(' SaleDesc CHAR(30),');
     	    SQL.Add(' SalePlace INTEGER,');
	          SQL.Add(' Remark CHAR(40),');
     	    SQL.Add(' DateChanged DATE,');
	          SQL.Add(' TimeChanged TIME,');
     	    SQL.Add(' ChangedBy CHAR(30),');
	          SQL.Add(' Sold BOOLEAN,');
     	    SQL.Add(' HerdID INTEGER');
            SQL.Add(')');
            ExecSQL; // Create the TABLE
         end;
   finally
      SaleDeletionQuery.Close;
      SaleDeletionQuery.Free;
   end;
end;
}
// Create the Purchase Deletion Table if it doesn't exist
{procedure TWinData.MakePurchDeletion;
Var
   PurchDeletionQuery : TQuery;
begin
   try
      PurchDeletionQuery := TQuery.Create(nil);
      PurchDeletionQuery.DatabaseName := KingData.DatabaseName;
      with PurchDeletionQuery do
         begin
            SQL.Add('CREATE TABLE "phrd.db"');
     	    SQL.Add('(');
	          SQL.Add(' AID INTEGER,');
            SQL.Add(' PurchDate DATE,');
     	    SQL.Add(' PurchDesc CHAR(30),');
	          SQL.Add(' PurchPlace INTEGER,');
     	    SQL.Add(' Remark CHAR(40),');
	          SQL.Add(' DateChanged DATE,');
     	    SQL.Add(' TimeChanged TIME,');
	          SQL.Add(' ChangedBy CHAR(30),');
     	    SQL.Add(' HerdID INTEGER');
            SQL.Add(')');
            ExecSQL; // Create the TABLE
         end;
   finally
      PurchDeletionQuery.Close;
      PurchDeletionQuery.Free;
   end;
end;
}
// Create the InterHerd if it doesn't exist
{procedure TWinData.MakeInterHerd;
Var
   InterHerdTable : TTable;
begin
   try
      InterHerdTable := TTable.Create(nil);
      InterHerdTable.DatabaseName := KingData.DatabaseName;
      with InterHerdTable do
         begin
            TableName := 'IHM.db';
            DatabaseName := KingData.DatabaseName;

            FieldDefs.Clear;
            FieldDefs.Add( 'ID',         ftAutoInc,  0,FALSE);
            FieldDefs.Add( 'AnimalID',   ftInteger,  0,FALSE);
            FieldDefs.Add( 'LastHerdID', ftInteger,  0,FALSE);
            FieldDefs.Add( 'NewHerdID',  ftInteger,  0,FALSE);
            FieldDefs.Add( 'DateMoved',  ftDate,     0,FALSE);
            FieldDefs.Add( 'Remark',     ftString,  40,FALSE);
            FieldDefs.Add( 'OldSeqNo',   ftInteger,  0,FALSE);
            FieldDefs.Add( 'NewSeqNo',   ftInteger,  0,FALSE);
            CreateTable;
         end;
   finally
      InterHerdTable.Close;
      InterHerdTable.Free;
   end;
end;
}
// Create the Temporary Movement Table if it doesn't exist
{procedure TWinData.MakeMovement;
Var
   MovementTable : TTable;
begin
   try
      MovementTable := TTable.Create(nil);
      MovementTable.DatabaseName := KingData.DatabaseName;
      with MovementTable do
         begin
            TableName := 'Movements.db';
            DatabaseName := KingData.DatabaseName;
            FieldDefs.Add( 'EventID',      ftInteger, 0,  FALSE);
            FieldDefs.Add( 'AID',          ftInteger, 0,  FALSE);
            FieldDefs.Add( 'MovedTo',      ftInteger, 0,  FALSE);
            FieldDefs.Add( 'DateMovedBack',ftDate,    0,  FALSE);
            FieldDefs.Add( 'StillOffFarm' ,ftBoolean, 0,  FALSE);
            FieldDefs.Add( 'Remark' ,      ftString,  40,  FALSE);
            IndexDefs.Add( '','EventID',[ixUnique,ixPrimary] );
            CreateTable;
         end;
   finally
      MovementTable.Close;
      MovementTable.Free;
   end;
end;
}

// Create the Temporary Movement Table if it doesn't exist
{procedure TWinData.MakeMovedTo;
Var
   MovedTo : TTable;
begin
   try
      MovedTo := TTable.Create(nil);
      MovedTo.DatabaseName := KingData.DatabaseName;
      with MovedTo do
         begin
            TableName := 'MovedTo.db';
            DatabaseName := KingData.DatabaseName;
            FieldDefs.Add( 'ID',           ftAutoInc, 0,  FALSE);
            FieldDefs.Add( 'HerdIdentity', ftString , 15,  FALSE);  // Animal ID
            FieldDefs.Add( 'Name',         ftString,  40,  FALSE);
            FieldDefs.Add( 'Townland',     ftString,  40,  FALSE);
            FieldDefs.Add( 'County',       ftString,  40,  FALSE);

            IndexDefs.Add( '','ID',[ixUnique,ixPrimary] );
            CreateTable;
         end;
   finally
      MovedTo.Close;
      MovedTo.Free;
   end;
end;
}
// Create the Audit Table to keep track of changes for the Dept of Agri Herd Register
{procedure TWinData.MakeAudit;
Var
   DefTable,
   AuditTable : TTable;
begin
   try
      AuditTable := TTable.Create(nil);
      AuditTable.DatabaseName := KingData.DatabaseName;

      DefTable := TTable.Create(nil);
      DefTable.DatabaseName := KingData.DatabaseName;
      DefTable.TableName := Defaults.TableName;

      with AuditTable do
         begin
            TableName := 'Afdoa.db';
            DatabaseName := KingData.DatabaseName;
            FieldDefs.Add( 'ID',         ftAutoInc, 0,FALSE);
            FieldDefs.Add( 'AID',   ftInteger, 0,FALSE);  // Animal ID
            FieldDefs.Add( 'DateChanged',ftDate,    0,FALSE);
            FieldDefs.Add( 'TimeChanged',ftTime,    0,FALSE);
            FieldDefs.Add( 'ItemChanged',ftSmallInt,0,FALSE);
            FieldDefs.Add( 'OldItem',    ftString,  20,FALSE);
            FieldDefs.Add( 'ChangedBy',  ftString,  30,FALSE);
            FieldDefs.Add( 'Remark',     ftString,  40,FALSE);

            IndexDefs.Add( '','ID',[ixUnique,ixPrimary] );
            IndexDefs.Add( 'iIDDate','AID;DateChanged',[ixCaseInsensitive] );
            CreateTable;
         end;

      try
         DefTable.Open;
         DefTable.First;
         if DefTable.RecordCount > 0 then
            begin
               DefTable.Edit;
               DefTable.FieldByName('AuditReCreated').AsDateTime := Now();
               DefTable.Post;
            end;
      except

      end;

   finally
      AuditTable.Close;
      AuditTable.Free;
      DefTable.Close;
   end;
end;
}
// Create the Ssytem Users Table to keep Name of People using the System
{procedure TWinData.MakeSysUsers;
Var
   DefaultTemp,
   TempTable,
   SysUserTable : TTable;
begin
   try
      DefaultTemp := TTable.Create(nil);
      DefaultTemp.DatabaseName := KingData.DatabaseName;
      DefaultTemp.TableName := Defaults.TableName;

      SysUserTable := TTable.Create(nil);
      SysUserTable.DatabaseName := KingData.DatabaseName;
      TempTable := TTable.Create(nil);
      TempTable.DatabaseName := KingData.DatabaseName;
      TempTable.TableName := OwnerFile.TableName;
      with SysUserTable do
         begin
            TableName := 'SysUsers.db';
            DatabaseName := KingData.DatabaseName;
            FieldDefs.Add( 'ID',         ftAutoInc, 0,FALSE);
            FieldDefs.Add( 'Name',   ftString, 30,TRUE);  // Animal ID
            IndexDefs.Add( '','ID',[ixUnique,ixPrimary] );
            CreateTable;
            Open;
         end;
      TempTable.Open;
      TempTable.First;
      if TempTable.Recordcount > 0 then
         while NOT TempTable.EOF do
            begin
               if TempTable.FieldByName('HerdIdentity').AsString <> 'NONE' then
                  begin
                     SysUserTable.Append;
                     if TempTable.FieldByName('Name').IsNull then
                        begin
                           if TempTable.FieldByName('HerdIdentity').IsNull then
                              SysUserTable.FieldByName('Name').AsString := 'No User Name Set Up'
                           else
                              SysUserTable.FieldByName('Name').AsString := TempTable.FieldByName('HerdIdentity').AsString;
                        end
                     else
                        SysUserTable.FieldByName('Name').AsString := TempTable.FieldByName('Name').AsString;
                     SysUserTable.Post;
                  end;
               TempTable.Next;
            end;

      DefaultTemp.Open;
      DefaultTemp.First;
      SysUserTable.First;
      if DefaultTemp.RecordCount > 0 then
          begin
             DefaultTemp.Edit;
             DefaultTemp.FieldByName('CurrUser').AsInteger := SysUserTable.FieldByName('ID').AsInteger;
             DefaultTemp.Post;
          end;
   finally
      DefaultTemp.Close;
      DefaultTemp.Free;
      TempTable.Close;
      TempTable.Free;
      SysUserTable.Close;
      SysUserTable.Free;
   end;
end;
}
// Create the Buyer if it doesn't exist
{procedure TWinData.MakeBuyer;
Var
   STable,
   BuyerTable : TTable;
   i : Integer;
begin
   try
      BuyerTable := TTable.Create(nil);
      BuyerTable.TableName := 'Buyers.db';
      BuyerTable.DatabaseName := KingData.DatabaseName;

      STable := TTable.Create(nil);
      STable.TableName := Suppliers.TableName;
      STable.DatabaseName := KingData.DatabaseName;

      STable.Open;
      for i := 0 to STable.FieldCount-1 do
         if ( UPPERCASE(STable.FieldDefs.Items[i].Name) <> 'TRANSPORT' ) then
            BuyerTable.FieldDefs.Add( STable.FieldDefs.Items[i].Name,STable.FieldDefs.Items[i].DataType,
                                      STable.FieldDefs.Items[i].Size, STable.FieldDefs.Items[i].Required);
      BuyerTable.CreateTable;
   finally
      STable.Close;
      STable.Free;
      BuyerTable.Close;
      BuyerTable.Free;
   end;
end;
}

procedure TWinData.TempCalvingNewRecord(DataSet: TDataSet);
var
   CheckDigit, nPos : Integer;
   sAnimalNo, HerdIdentifier :string;
   CheckTagNo, NewID, FormattedStr : String;
   bLeadZero : Boolean;
begin
   // Automatic National Identity Numbering
   if Events.State = dsInsert then
      begin
         NatIDGenerated := False;
         TempCalvingComplianceCert.AsBoolean := False;
         if (DefaultCalfGroup > 0) then
            TempCalvingGroupID.AsInteger := DefaultCalfGroup;

         TempCalvingHerdID.AsInteger := AnimalFileByIdHerdID.Value;
         HerdLookup.HerdOwnerData.HerdID := TempCalvingHerdID.AsInteger;
         HerdIdentifier := HerdLookup.HerdOwnerData.HerdIdentifier;

         if not ( WinData.ActivePDAEvents ) then // only set mask if natid is manually entered.
             TempCalvingNatID.EditMask := DefaultNatIDMaskFromHerdIdentifierMask;

         if HerdSpecies(TempCalving.FieldByName('HerdId').AsInteger) = cSpecies_Goats then
            TempCalvingNatID.EditMask := GoatTagFormat
         else if HerdSpecies(TempCalving.FieldByName('HerdId').AsInteger) = cSpecies_Bovine then
            begin
               if ( not ActivePDAEvents ) then
                  //begin
                     // Populate Animal No with Lead Zeros ??
                     bLeadZero := HerdLookup.HerdOwnerData.NatIDLeadZero;
{
                     if ( HerdLookup.HerdOwnerData.InputNatIDStyle=cInputNatIDStyle_AutoGenInput ) then
                        begin
                           if HerdLookup.HerdOwnerData.RegisteredCountry = Ireland then
                              begin
                                 // Auto Generate Irish Tag.
                                 for CheckDigit := 1 to 9 do
                                    begin
                                       NewID := '';
                                       CheckTagNo := 'IE ' + HerdIdentifier + IntToStr(CheckDigit) + PadLeft(IntToStr(HerdLookup.HerdOwnerData.NextNatID),'0',4);
                                       if CheckNatID(CheckTagNo, NewID, True) then
                                          begin
                                             TempCalvingNatID.EditMask := '';
                                             TempCalvingNatID.Value := NewID;
                                             HerdLookup.HerdOwnerData.NextNatID := HerdLookup.HerdOwnerData.NextNatID+1;
                                             NatIDGenerated := True;
                                             Break;
                                          end;
                                    end;
                              end
                           else
                              begin
                                 // Auto Generate Northern Irish Tag.
                                 for CheckDigit := 1 to 7 do
                                    begin
                                       NewID := '';
                                       if bLeadZero then
                                          sAnimalNo := PadLeft(IntToStr(HerdLookup.HerdOwnerData.NextNatID), '0', 4)
                                       else
                                          sAnimalNo := IntToStr(HerdLookup.HerdOwnerData.NextNatID);
                                       // very important for UK9 tag... include the spaces between HerdNo, AnimalNo                and              Check Digit
                                       if ((CheckNINatID( 'UK 9 ' + HerdIdentifier + ' ' + sAnimalNo + ' ' + IntToStr(CheckDigit) , NewID)) and (CheckDigit<=7)) then
                                          begin
                                             TempCalvingNatID.EditMask := '';
                                             TempCalvingNatID.Value := NewID;
                                             HerdLookup.HerdOwnerData.NextNatID := HerdLookup.HerdOwnerData.NextNatID+1;
                                             NatIDGenerated := True;
                                             Break;
                                          end;
                                    end;
                              end
                        end
                     else
}
                      if ( HerdLookup.HerdOwnerData.InputNatIDStyle=cInputNatIDStyle_ListInput ) then
                        begin
                           TempCalvingNatID.EditMask := '';
                           // Default to just the Country Code + Herd Identifier.
                           TempCalvingNatID.AsString := WinData.GetNatIDNumHerdIdentifier(WinData.AnimalFileByIDHerdID.AsInteger) + ' ';
                        end;
//                  end;
                    try
                       if ( NatIDGenerated ) and ( TempCalvingCalfNo.IsNull ) and ( GlobalSettings.NatIDToAnimalNo ) then
                          begin
                             if WhatStyleNatID(NewID, False) = Style1999 then
                                begin
                                   FormattedStr := StripAllSpaces(NewID);
                                   FormattedStr := Copy(FormattedStr, Length(FormattedStr)-3, 4);
                                   TempCalvingCalfNo.AsString := FormattedStr;
                                end
                             else if  ( IsNINatID(NewID)) then
                                begin
                                   FormattedStr := StripAllSpaces(NewID);
                                   nPos := Pos(HerdIdentifier,FormattedStr);
                                   if nPos > 0 then
                                      begin
                                         FormattedStr := Copy(FormattedStr, nPos+Length(HerdIdentifier), MaxInt);
                                         if Length(FormattedStr) > 0 then
                                            begin
                                               Delete(FormattedStr, Length(FormattedStr), 1);
                                               TempCalvingCalfNo.AsString := FormattedStr;
                                            end;
                                         TempCalvingCalfNo.AsString := FormattedStr;
                                      end;
                                end;
                          end;
                      except
                         on e : exception do
                            begin
                               if e.message = 'Animal No. already entered' then
                                  begin
                                     MessageDlg(Format('The program generated calf number "%s" cannot be used.'+cCRLF+
                                                'Calf number "%s" is already in use.',[FormattedStr,FormattedStr]), mtInformation,[mbOK],0);
                                  end;
                            end;
                      end;
            end;


         if not ( ActivePDAEvents ) then
            begin
               TempCalving.FieldByName('Colour').AsInteger := DeFaultColour;

               // DeFaultBreed = selected breed of bull at calving time BullUsed.Value
               // Check Dam/Sire breeds are same, if so, set the calf breed same as sire breed
               // if not, use cross breed of sire breed.
               if WinData.AnimalFileByIDPrimaryBreed.AsInteger <> DeFaultBreed then
                  TempCalving.FieldByName('Breed').AsInteger := GetCrossBreed(DeFaultBreed)
               else
                  TempCalving.FieldByName('Breed').AsInteger  := DeFaultBreed;
               TempCalving.FieldByName('Name').AsString    := HerdPreFix;
               TempCalvingCalfDead.AsBoolean := False;
            end;

         if NatIDGenerated then
            begin

               MessageDlg('Nat. Id. No. has been automatically generated. '+cCRLF+
                          'Please ensure generated Nat. Id. No. is correct!',mtWARNING,[mbOK],0);
            end;

      end;
end;

procedure TWinData.ApplicationsAfterPost(DataSet: TDataSet);
begin
   KingData.ApplyUpdates([Applications]);
end;

{ Check Herd Check Digit }
function TWinData.CheckHerdID( HerdIDStr : String; var NewHerdId : String ) : Boolean;
var
   CorrectEntry : Boolean;
   NoNums,
   NoAlphas,
   i,
   StrLen       : Integer;
   OrigDigit,
   TestStr      : String;

   function ValidateHerdID : Boolean;
   var
      NumStr,
      CalcDigit : String;
      i,
      NumDigit,
      Remainder,
      Multiplier,
      TotalValue,
      ArrPos,
      NumVal : Integer;
      TestArr : packed array [1..8] of Integer;
   begin
      FillChar(TestArr, Sizeof(TestArr),0);
      TotalValue := 0;

      NumVal := ( Ord(TestStr[1]) - 64 );
      NumStr := IntToStr(NumVal);
      if NumVal < 10 then
         begin
            TestArr[1] := 0;
            TestArr[2] := StrToInt(NumStr);
         end
      else
         begin
            TestArr[1] := StrToInt(Copy(NumStr,1,1));
            TestArr[2] := StrToInt(Copy(NumStr,2,1));
         end;
      ArrPos := 3;
      for i := 2 to 7 do
         begin
            TestArr[ArrPos] := StrToInt ( Copy ( TestStr[i],1,1 ));
            Inc(ArrPos);
         end;

      Multiplier := 9;
      // Total the Array
      for i := 1 to 8 do
         begin
            TotalValue := TotalValue + (TestArr[i] * Multiplier);
            Dec(Multiplier);
         end;

      // Divide by 11 and get the remainder
      Remainder := TotalValue mod 11;
      NumDigit := 11 - Remainder;

      if NumDigit = 10 then
         CalcDigit := '0'
      else if NumDigit = 11 then
         CalcDigit := 'X'
      else
         CalcDigit := IntToStr(NumDigit);

      CorrectEntry := ( CalcDigit = OrigDigit );
      if NOT CorrectEntry then
         MessageDLG('Invalid Herd ID entered',mtWarning,[mbOK],0);
      Result := CorrectEntry;
   end;

begin
   Result := TRUE;
   // Store Passed value in a temporary string
   TestStr := HerdIDStr;

   // Strip all spaces
   TestStr := StripAllSpaces(TestStr);

   OrigDigit := '';
   NoNums := 0;
   NoAlphas := 0;
   CorrectEntry := FALSE;

   StrLen := Length(TestStr);

   // Seven Characters in the Herd ID
   if ( StrLen = 8 ) then
      begin
         OrigDigit := TestStr[StrLen];
         // Count the No of Alpha Char - exclude the last character
         if (TestStr[1] In ['A'..'Z']) then
            NoAlphas := 1
         else
            NoAlphas := 0;

         // Count the No of Numbers
         for i := 2 to 7 do
            if (TestStr[i] In ['0'..'9']) then
               Inc(NoNums);
      end;

   // Test to see if this is a Herd ID
   if ( NoAlphas = 1 ) And ( NoNums = 6 ) And ( StrLen = 8 ) then
      Result := ValidateHerdID;

   // Return the formatted National ID
   if CorrectEntry then
      NewHerdID := TestStr
   else
      NewHerdId := HerdIDStr;
end;

{ Check Digit Calculator }
function TWinData.CheckNatID( NatIDStr : String; var NewId : String; FromReport : Boolean ) : Boolean;
var
   IncIE,
   CorrectEntry,
   LastIsChar,
   CalcPre1996Digit,
   Calc1999Digit,
   Calc1996Digit    : Boolean;
   Factor,
   CumVal,
   TotalCum,
   RM,                     // Remainder
   RS,                     // Remainder - 23
   i,
   StrLen,
   NoNums,
   NoAlphas : Integer;
   OldDigit,
   TestStr,
   CalcCheckDigit,
   CheckDigit : String;

   { Check the 1999 Digit IE 12 12345 ? 1234 }
   Function Check1999Digit : Boolean;
   var
      i : Integer;
      CumStr : String;
   begin
      // Copy the Old Digit from the String
      OldDigit := Copy ( TestStr,8 ,1 );
      Factor := 0;
      CumVal := 0;
      RM := 0;
      RS := 0;
      for i := 1 to 12 do
         begin
            { set multiplication factor }
            case i of
               1 : Factor := 1;
               2 : Factor := 2;
               3 : Factor := 1;
               4 : Factor := 2;
               5 : Factor := 1;
               6 : Factor := 2;
               7 : Factor := 1;
               8 : Factor := 0;  // Check digit
               9 : factor := 2;
               10 : Factor := 1;
               11 : Factor := 2;
               12 : Factor := 1;
            end;

            { calculate cumulative total }
            if i <> 8 then
               CumVal := CumVal + ((ord (TestStr[i]) - 48) * Factor);
         end;

      { Convert to String }
      CumStr := IntToStr(CumVal);
      // add the Numbers together
      if Length(CumStr) = 1 then
         TotalCum := StrToInt(CumStr[1])
      else if Length(CumStr) = 2 then
         TotalCum := StrToInt(CumStr[1]) + StrToInt(CumStr[2])
      else if Length(CumStr) = 3 then
         TotalCum := StrToInt(CumStr[1]) + StrToInt(CumStr[2])+ StrToInt(CumStr[3])
      else // if string is longer then 3 the Code is
         TotalCum := 0;

      if ( TotalCum > 9 ) AND ( TotalCum < 100 ) then
         while TotalCum > 9 do
            begin
               CumStr := IntToStr(TotalCum);
               TotalCum := StrToInt(CumStr[1]) + StrToInt(CumStr[2]);
            end
      else if ( TotalCum > 9 ) AND ( TotalCum > 100 ) then
         while TotalCum > 9 do
            begin
               CumStr := IntToStr(TotalCum);
               if Length(CumStr) = 2 then
                  TotalCum := StrToInt(CumStr[1]) + StrToInt(CumStr[2])
               else if Length(CumStr) = 3 then
                  TotalCum := StrToInt(CumStr[1]) + StrToInt(CumStr[2]) + StrToInt(CumStr[3])
               else
                  TotalCum := 0;
            end;

      CalcCheckDigit := IntToStr(TotalCum);
      CorrectEntry := ( OldDigit = CalcCheckdigit );

      if CorrectEntry then
         begin
            // Insert Spaces to set the String in correct format
            Insert(' ',TestStr,3);
            Insert(' ',TestStr,9);
            Insert(' ',TestStr,11);
            // ReInsert IE if its entered
            if IncIE then
               Insert( 'IE ',TestStr,1 );
         end
      else
         if NOT FromReport then
            MessageDLG(cInvalid_NatIdNo,mtWarning,[mbOK],0);
      ReSult := CorrectEntry;
   end;

   { Check the 1996 on Digit IE ABCD 2345 ? }
   Function Check1996Digit : Boolean;
   var
      i : Integer;
   begin
      // Copy the Old Digit from the String
      OldDigit := Copy ( TestStr,9 ,1 );

      Factor := 0;
      CumVal := 0;
      RM := 0;
      RS := 0;
      for i := 1 to 8 do
         begin
            { set multiplication factor }
            case i of
               1 : Factor := 9;
               2 : Factor := 8;
               3 : Factor := 7;
               4 : Factor := 6;
               5 : Factor := 5;
               6 : Factor := 4;
               7 : Factor := 3;
               8 : Factor := 2;
            end;

            { calculate cumulative total }
            if TestStr[i] in ['A'..'Z'] then
               CumVal := CumVal + ((ord (TestStr[i]) - 64) * Factor)
            else if TestStr[i] in ['0'..'9'] then
               CumVal := CumVal + ((ord (TestStr[i]) - 48) * Factor);
         end;

      { get remainder after divided by 23 }
      RM := CumVal mod 23;

      { get result of 23 minus remainder }
      RS := 23 - RM;

      { return result character }
      case RS of
         1 : CalcCheckDigit := 'A';
         2 : CalcCheckDigit := 'B';
         3 : CalcCheckDigit := 'C';
         4 : CalcCheckDigit := 'D';
         5 : CalcCheckDigit := 'E';
         6 : CalcCheckDigit := 'F';
         7 : CalcCheckDigit := 'G';
         8 : CalcCheckDigit := 'H';
         9 : CalcCheckDigit := 'J';
         10 : CalcCheckDigit := 'K';
         11 : CalcCheckDigit := 'L';
         12 : CalcCheckDigit := 'M';
         13 : CalcCheckDigit := 'N';
         14 : CalcCheckDigit := 'P';
         15 : CalcCheckDigit := 'Q';
         16 : CalcCheckDigit := 'R';
         17 : CalcCheckDigit := 'S';
         18 : CalcCheckDigit := 'T';
         19 : CalcCheckDigit := 'U';
         20 : CalcCheckDigit := 'V';
         21 : CalcCheckDigit := 'W';
         22 : CalcCheckDigit := 'X';
         23 : CalcCheckDigit := 'Y';
      end;

      CorrectEntry := ( OldDigit = CalcCheckdigit );
      if CorrectEntry then
         begin
            // Insert a Space between 1234 and Check Digit
            Insert(' ',TestStr,9);
            // Insert a Space between ABCD and 1234
            Insert(' ',TestStr,5);
            // ReInsert the IE if it was entered
            if IncIE then
               Insert( 'IE ',TestStr,1 );
            // Return the formatted National ID
            NewID := TestStr;
         end
      else
         if NOT FromReport then
            MessageDLG(cInvalid_NatIdNo,mtWarning,[mbOK],0);
      ReSult := CorrectEntry;
   end;

   { Check the PRE 1996 Digit YCA 12345? }
   Function CheckPre1996Digit : Boolean;
   var
      CumStr,
      NumStr  : String;
      LastMult,
      ArrPos,
      NumVal,
      i       : Integer;
      TestArr : packed array [1..14] of Integer;
   begin
      // Copy the Old Digit from the String
      OldDigit := Copy ( TestStr, 9 ,1 );

      CumVal := 0;
      ArrPos := 1;
      FillChar(TestArr,SizeOf(TestArr),0);

      // Accumulate the Letters
      for i := 1 to 3 do
         begin
            NumVal := ( Ord(TestStr[i]) + 36 );
            NumStr := IntToStr(NumVal);
            TestArr[ArrPos] := StrToInt(Copy(Numstr,1,1));
            Inc(ArrPos);
            TestArr[ArrPos] := StrToInt(Copy(Numstr,2,1));
            Inc(ArrPos);
            TestArr[ArrPos] := StrToInt(Copy(Numstr,3,1));
            Inc(ArrPos);
         end;

      // Accumulate the Numbers
      for i := 4 to 8 do
         begin
            TestArr[ArrPos] := StrToInt(Copy(TestStr,i,1));
            Inc(ArrPos);
         end;

      // Get the Total
      LastMult := 2;
      for i := 1 to 14 do
         begin
            CumVal := CumVal + (TestArr[i]*LastMult);
            if LastMult = 1 then
               LastMult := 2
            else
               LastMult := 1;
         end;

      // Store it as a string
      CumStr := IntToStr(CumVal);

      // Reinitialise the array
      FillChar(TestArr,SizeOf(TestArr),0);

      // Check the size if CumVal
      if CumVal In [10..99] then
         while ( CumVal >= 10 ) do
            begin
               // Break the Cumulative in 2
               TestArr[1] := StrToInt(CumStr[1]);
               TestArr[2] := StrToInt(CumStr[2]);
               CumVal := TestArr[1] + TestArr[2];
               CumStr := IntToStr(CumVal);
            end
      else if ( CumVal >= 100 ) And ( CumVal <= 999 ) then
         while ( CumVal >= 10 ) do
            begin
               // Break the Cumulative in 2
               TestArr[1] := StrToInt(CumStr[1]);
               TestArr[2] := StrToInt(CumStr[2]);
               TestArr[3] := StrToInt(CumStr[3]);
               CumVal := TestArr[1] + TestArr[2] + TestArr[3];
               CumStr := IntToStr(CumVal);
            end;
      CalcCheckDigit := IntToStr(CumVal);

      // Check this against the user input
      CorrectEntry := ( OldDigit = CalcCheckdigit );
      if CorrectEntry then
         begin
            // Insert a Space between ABC and 123343
            Insert(' ',TestStr,4);
            // Return the formatted National ID
            NewID := TestStr;
         end
      else
         if NOT FromReport then
            MessageDLG(cInvalid_NatIdNo,mtWarning,[mbOK],0);
      ReSult := CorrectEntry;

   end;

begin
   Result := TRUE;
   // Store Passed value in a temporary string
   TestStr := NatIDStr;

   // Strip all spaces
   TestStr := StripAllSpaces(TestStr);

   // Remove the IE if entered
   if (Pos ('IE', TestStr) > 0) then
      begin
         Delete (TestStr, Pos ('IE', TestStr), 2);
         IncIE := TRUE;
      end
   else
      IncIE := FALSE;

   CheckDigit := '';
   LastIsChar       := FALSE;
   CorrectEntry     := FALSE;

   NoNums   := 0;
   NoAlphas := 0;
   StrLen   := Length(TestStr);

   if ( StrLen > 0 ) then
      begin
         LastIsChar := ( TestStr[StrLen] In ['A'..'Z'] );
         // Count the No of Alpha Char - exclude the last character
         for i := 1 to StrLen do
            if (TestStr[i] In ['A'..'Z']) then
               Inc(NoAlphas);
         if LastIsChar then
            Dec(NoAlphas);

         // Count the No of Numbers
         for i := 1 to StrLen do
            if (TestStr[i] In ['0'..'9']) then
               Inc(NoNums);
      end;

   // See if the New 1999 Plastic Tag
   if ( NoNums = StrLen ) And ( StrLen = 12 ) then
      Result := Check1999Digit    // Calc1999Digit := TRUE
   // This is the pre 1996 Brass Tags
   else if ( NoAlphas = 3 ) And ( NoNums = 6 ) And ( StrLen = 9 ) then
      Result := CheckPre1996Digit  //CalcPre1996Digit := TRUE
   else if ( NoAlphas = 4 ) And ((( LastIsChar ) And ( NoNums = 4 )) Or
           ( NoNums = 5 )) then
      Result := Check1996Digit;  // Calc1996Digit := TRUE;

   // Return the formatted National ID
   if CorrectEntry then
      NewID := TestStr
   else
      NewId := NatIDStr;
end;

function TWinData.WhatStyleNatID( NatIDStr : String; RemoveAll : Boolean ) : TNatIDStyle;
   function IsPre1996(Str : String) : Boolean;
   var
      i,
      StrLen,
      NoNums,
      NoAlphas : Integer;
   begin
      NoNums   := 0;
      NoAlphas := 0;
      StrLen   := Length(Str);
      if ( StrLen > 0 ) then
         for i := 1 to StrLen do
            if (Str[i] In ['A'..'Z']) then
               Inc(NoAlphas);

         // Count the No of Numbers
         for i := 1 to StrLen do
            if (Str[i] In ['0'..'9']) then
               Inc(NoNums);
      if ( NoAlphas = 3 ) And ( NoNums = 6 ) And ( StrLen = 9 ) then
         Result := True
   end;

var
   TestStr : String;
   i,
   StrLen,
   NoNums,
   NoAlphas : Integer;
   LastIsChar : Boolean;
begin

   // Store Passed value in a temporary string
   TestStr := NatIDStr;
   // Strip all spaces
   if not RemoveAll then
      TestStr := StripAllSpaces(TestStr)
   else
      TestStr := StripAllNomNumAlpha(TestStr);


   if NOT IsPre1996(TestStr) then
      // Remove the IE if entered
      if (Pos ('IE', TestStr) > 0) then
         Delete (TestStr, Pos ('IE', TestStr), 2);

   NoNums   := 0;
   NoAlphas := 0;
   StrLen   := Length(TestStr);
   if ( StrLen > 0 ) then
      begin
         LastIsChar := ( TestStr[StrLen] In ['A'..'Z'] );
         // Count the No of Alpha Char - exclude the last character
         for i := 1 to StrLen do
            if (TestStr[i] In ['A'..'Z']) then
               Inc(NoAlphas);
         if LastIsChar then
            Dec(NoAlphas);

         // Count the No of Numbers
         for i := 1 to StrLen do
            if (TestStr[i] In ['0'..'9']) then
               Inc(NoNums);
      end;
   // See if the New 1999 Plastic Tag
   if ( NoNums = StrLen ) And ( StrLen = 12 ) then
      Result := Style1999
   // This is the pre 1996 Brass Tags
   else if ( NoAlphas = 3 ) And ( NoNums = 6 ) And ( StrLen = 9 ) then
      Result := StylePre1996
   else if ( NoAlphas = 4 ) And ((( LastIsChar ) And ( NoNums = 4 )) Or
           ( NoNums = 5 )) then
      Result := Style1996
   else
      Result := StyleUnKnown;
end;

function TWinData.GetSeqNo(HerdID:Integer) : Integer;
begin
    Result := -1;
    if OwnerFile.Locate('ID',HerdID,[] ) then
       Result := OwnerFile.FieldByName('LastSeqNo').AsInteger+1;
end;

function TWinData.IncreaseSeqNo(HerdID:Integer) : Boolean;
begin
    Result := FALSE;
    if OwnerFile.Locate('ID',HerdID,[] ) then
       begin
          OwnerFile.Edit;
          OwnerFile.FieldByName('LastSeqNo').AsInteger := OwnerFile.FieldByName('LastSeqNo').AsInteger+1;
          OwnerFile.Post;
          Result := TRUE;
       end;
end;

procedure TWinData.DefaultsAfterOpen(DataSet: TDataSet);
begin
   with Defaults do
      begin
         Defaults.First;
         if NOT Defaults.EOF then
            begin
               if NOT ( Defaults.FieldByName('NatIdIndex').IsNull ) then
                  DefaultNatIdMaskIndex := Defaults.FieldByName('NatIdIndex').AsInteger;
               if NOT ( Defaults.FieldByName('NatIdMask').IsNull ) then
                  if (not ( DefaultNatIdMaskIndex in ([MT_NITAG, MT_UKTAG]))) then
                     DefaultNatIdMask := UPPERCASE(Defaults.FieldByName('NatIdMask').Value)
                  else
                     DefaultNatIdMask := Defaults.FieldByName('NatIdMask').Value;
            end;
      end;
end;

procedure TWinData.MilkDiskLayoutBeforePost(DataSet: TDataSet);
begin
     if ( MilkDiskLayout.FieldByName('Country').IsNull ) Or
        NOT ( MilkDiskLayout.FieldByName('Country').AsString[1] In ['I','N','S','E','O'] ) then
        begin
           MessageDLG('Invalid Country Code - I,N,E,S,O are the valid Codes',mtinformation,[mbOK],0);
           SysUtils.Abort;
        end;
end;

procedure TWinData.PurchasesSupplierChange(Sender: TField);
begin
     DefaultSupplier := PurchasesSupplier.AsInteger;
     CheckRemarks(Purchases, Sender, GenTypesConst.PurchPlace );
end;

procedure TWinData.PurchasesGradeChange(Sender: TField);
begin
     DefaultGrade := PurchasesGrade.AsString;
end;

procedure TWinData.PurchasesNewRecord(DataSet: TDataSet);
begin
//   PurchasesSupplierCosts.AsFloat := DefaultSupplierCost;
//   PurchasesBuyerCosts.AsFloat    := DefaultBuyerCost;
   PurchasesBuyer.AsInteger       := DefaultBuyer;
   PurchasesSupplier.AsInteger    := DefaultSupplier;
   PurchasesGrade.AsString        := DefaultGrade;
   PurchasesCTSReg.AsBoolean      := False;
   PurchasesCommission.AsFloat    := 0;
   PurchasesHaulage.AsFloat       := 0;

end;

procedure TWinData.InsertPremium ( Sender : TObject; PremType : TPremType; StillToApply, UsingButton : Boolean;
                                   EligDate, ApplicDate : TEdit; AnimalsTable : TDataSet; const Show2005MsgDlg : Boolean );
{Var
   OkToCreate : Boolean;
   NoMonths   : Integer;
   St         : String;}
begin
   (*  // Get Premium Type
     if PremType = F then
        St := 'F'
     else if PremType = S then
        St := 'S'
     else if PremType = B then
        St := 'B';

     if ( StillToApply ) then
        begin
          OkToCreate := True;
          // Check to see if the Animal has applied for Bull Premium
          if ( PremType In [F,S] ) then
             begin
                if BeefSubsidy.Locate('AnimalID;PremiumType',VarArrayOf([AnimalsTable.FieldByName('Id').Value,'B']),[] ) then
                   if BeefSubsidy.FieldByName('ApplicationID').AsInteger = -1 then
                      begin
                         if MessageDLG('Delete this Animals Bull Premium eligibility',mtInformation,[mbYes,mbNo],0) = mrYes then
                            BeefSubsidy.Delete
                         else
                            OkToCreate := False;
                      end
                   else
                      begin
                         MessageDLG('This Animal has Applied for Bull Premium',mtInformation,[mbOK],0);
                         OkToCreate := False;
                      end;
             end
          // Check to see if the Animal has applied for 10 or 22 Premium
          else if ( PremType = B ) then
             begin
                if BeefSubsidy.Locate('AnimalID;PremiumType',VarArrayOf([AnimalsTable.FieldByName('ID').Value,'F']),[] ) then
                   if BeefSubsidy.FieldByName('ApplicationID').AsInteger = -1 then
                      begin
                         if MessageDLG('Delete this Animals First Age eligibility',mtInformation,[mbYes,mbNo],0) = mrYes then
                            BeefSubsidy.Delete
                         else
                            OkToCreate := False;
                      end
                   else
                      begin
                         MessageDLG('This Animal has Applied for First Age Premium',mtInformation,[mbOK],0);
                         OkToCreate := False;
                      end;
                if BeefSubsidy.Locate('AnimalID;PremiumType',VarArrayOf([AnimalsTable.FieldByName('ID').Value,'S']),[] ) then
                   if BeefSubsidy.FieldByName('ApplicationID').AsInteger = -1 then
                      begin
                         if MessageDLG('Delete this Animals Second Age eligibility',mtInformation,[mbYes,mbNo],0) = mrYes then
                            BeefSubsidy.Delete
                         else
                            OkToCreate := False;
                      end
                   else
                      begin
                         MessageDLG('This Animal has Applied for Second Age Premium',mtInformation,[mbOK],0);
                         OkToCreate := False;
                      end;
             end;

          if OkToCreate then
             begin
                NoMonths := GetNoMonthsOrDaysForPrem(PremiumType, M,PremType);

                { if DOB + NoMonths > 31/12/2004 do not allow to save premium eligibility. }
                { premiums are no longer an issue from 1/1/2005 onwards}

                if AnimalsTable.FindField('HerdID') <> nil then
                   begin
                      if DefCountry(AnimalsTable.FieldByName('HerdID').AsInteger) = NIreland then
                         begin
                            // These dates only apply to NI Animals
                            if ( PremType in ([B,F]) ) then
                               begin
                                  // Exit InsertPremium routine if BirthDate > 04/08/2004
                                  if AnimalsTable.FieldByName('DateOfBirth').Value > EncodeDate(2004, 08, 25) then
                                     begin
                                        if Show2005MsgDlg then
                                           MessageDlg('Cannot update premium eligibility'+#13#10+'Animal date of birth must be before 26/08/2004',mtInformation,[mbOK],0);
                                        Exit;
                                     end;
                               end
                            else if ( PremType = S ) then
                               begin
                                  // Exit InsertPremium routine if BirthDate > 25/07/2003
                                  if AnimalsTable.FieldByName('DateOfBirth').Value > EncodeDate(2003, 07, 25) then
                                     begin
                                        if Show2005MsgDlg then
                                           MessageDlg('Cannot update premium eligibility'+#13#10+'Animal date of birth must be before 26/07/2003',mtInformation,[mbOK],0);
                                        Exit;
                                     end;
                               end;
                         end
                      else
                         begin
                            if IncMonth(AnimalsTable.FieldByName('DateOfBirth').Value, NoMonths) >= EncodeDate(2005,1,1) then
                               begin
                                  if Show2005MsgDlg then
                                     MessageDlg('Cannot update premium eligibility status'+#13#10+'premium eligibility date must be in 2004',mtInformation,[mbOK],0);
                                  Exit;
                               end;
                         end;
                   end;

                // write a BeefSub Record for this Animal
                case PremType Of
                   F : EventType := TPremium10;
                   S : EventType := TPremium22;
                   B : EventType := TPremiumBull;
                   else
                       EventType := TPremium10;
                end;

                if ( AnimalsTable.FieldByName('DateOfBirth').AsDateTime > 0 ) and
                   ( AnimalsTable.FieldByName('DateOfBirth').AsDateTime <= Now() ) then
                   begin
                      Events.Append;
                      // Alter the Items Added by the On New Record Method
                      EventsAnimalID.AsInteger := AnimalsTable.FieldByName('ID').AsInteger;
                      EventsAnimalLactNo.AsInteger := AnimalsTable.FieldByName('LactNo').AsInteger;


                      EventsEventDate.Value := IncMonth(AnimalsTable.FieldByName('DateOfBirth').Value, NoMonths);
                      BeefSubsidy.FieldByName('EligibilityDate').Value := IncMonth(AnimalsTable.FieldByName('DateOfBirth').Value, NoMonths);
                      BeefSubsidy.FieldByName('PremiumType').Value := St;
                      Events.Post;
                      if UsingButton then
                         begin
                           (Sender As TSpeedButton).Caption := 'Yes';
                           (Sender As TSpeedButton).Font.Color := clGreen;
                           // find the Record to display the Date
                           if BeefSubsidy.Locate('AnimalID;PremiumType',VarArrayOf([AnimalsTable.FieldByName('ID').Value,St]),[] ) then
                              EligDate.Text := FormatDateTime(cIrishDateStyle,BeefSubsidyEligibilityDate.AsDateTime);
                         end;
                   end
                // Date of Birth After today
                else if ( AnimalsTable.FieldByName('DateOfBirth').AsDateTime > Now() ) then
                   MessageDLG(Format('Date of Birth %s cannot be after Today %s',
                              [FormatDateTime(cIrishDateStyle,
                               AnimalsTable.FieldByName('DateOfBirth').AsDateTime),
                               FormatDateTime(cIrishDateStyle,Now())
                              ]),mtWarning,[mbOK],0)
                else
                   MessageDLG(cCannotCalcEligNoDOB,mtwarning,[mbOk],0);
             end;
        end
     else
        begin
          // Check for and Delete the BeefSub Record if the Application Date is blank
          if BeefSubsidy.Locate('AnimalId;PremiumType',VarArrayOf([AnimalsTable.FieldByName('ID').Value,St]),[] ) then
             if BeefSubsidy.FieldByName('ApplicationDate').IsNull then
                begin
                     BeefSubsidy.Delete;
                     (Sender As TSpeedButton).Caption := 'No';
                     (Sender As TSpeedButton).Font.Color := clRed;
                     EligDate.Text := '';
                     ApplicDate.Text := '';
                end
             else
                 MessageDLG('Cannot Remove - You have Applied for a Premium on this Animal',mtInformation,[mbOK],0);
        end;     }
        *)
end;

procedure TWinData.qFemalesBeforeOpen(DataSet: TDataSet);
begin
     {
     with qFemales.SQL do
        begin
            Clear;
            Add ('SELECT ID, AnimalNo, Name FROM animals');
            Add ('WHERE ( Upper(Sex)="FEMALE")');
            Add ('AND (InHerd=TRUE)');
            Add ('AND NOT ( HerdID = ' + IntToStr(DefaultHerdID) + ')');
            if DefaultHerd  > 0 then
              Add('AND (HerdID= ' + IntToStr(DefaultHerd) + ')');
            Add ('ORDER BY AnimalNo');
        end;
     }
end;

procedure TWinData.qFemalesAfterOpen(DataSet: TDataSet);
begin
     // try to locate the Current animal
     //qFemales.Locate('ID',AnimalFileByIDID.Value,[]);
end;

procedure TWinData.PregDiagNewRecord(DataSet: TDataSet);
var
   DaysInCalf, Pregnant : Variant;
begin
//   GetDefaultPDDataFromLastService( DaysInCalf, Pregnant);
//   if DaysInCalf <> null then
//      PregDiag.FieldByName('DaysInCalf').Value := DaysInCalf
//   else
//      PregDiag.FieldByName('DaysInCalf').Clear;

   PregDiag.FieldByName('PregnancyStatus').Value := True;
   PregDiag.FieldByName('NoCalves').AsInteger := 1; // Add SP 20/01/05 requested by agents (meeting 19/01/05)
end;

procedure TWinData.tBullExtNewRecord(DataSet: TDataSet);
begin
   tBullExt.FieldByName('AnimalID').AsInteger := AnimalFileByIDID.AsInteger;
end;

procedure TWinData.AnimalSourceByIDStateChange(Sender: TObject);
begin
end;

// Special fix for Calving Bug in Version KHM V1.0 R3.?
function TWinData.CheckSireIdCalvingRecords : Boolean;
var
   CalfID : array [1..4] of Integer;
   AID,   // AnimalID
   LNo,   // Lactation Number
   i,
   BullUsed : Integer;
   CowExtQuery : TQuery;
   TransTable  : TTable;
begin
    // Create a Transaction file to record changes
    ReSult := FALSE;
    try
       CowExtQuery := TQuery.Create(nil);
       CowExtQuery.DatabaseName := KingData.DatabaseName;
       TransTable := TTable.Create(nil);
       TransTable.DatabaseName := KingData.DatabaseName;
       TransTable.TableName := 'SFileTrans.db';
       TransTable.Open;
    except
       with CowExtQuery do
          begin
             SQL.Add('CREATE TABLE "SFileTrans.db"');
     	     SQL.Add('(');
     	     SQL.Add(' CowId INTEGER,');
	           SQL.Add(' CowLactNo INTEGER,');
     	     SQL.Add(' CalfID INTEGER,');
	           SQL.Add(' SireID INTEGER');
             SQL.Add(')');
             ExecSQL; // Create the TABLE
          end;
       CowExtQuery.Close;
       CowExtQuery.Free;
       TransTable.Open;
    end;

    // Scroll through calvings
    try
       FillChar(CalfId, SizeOf(CalfId),0);
       Calvings.Open;
       CheckEvents.Open;
       LookUpDamSire.ReadOnly := FALSE;
       LookUpDamSire.Open;
       LookUpServices.Open;

       Calvings.First;
       while NOT Calvings.EOF do
          begin
             BullUsed := 0;
             // Store the 4 possible calf id - ref to animals file
             CalfID[1] := Calvings.FieldByName('ID1').AsInteger;
             CalfID[2] := Calvings.FieldByName('ID2').AsInteger;
             CalfID[3] := Calvings.FieldByName('ID3').AsInteger;
             CalfID[4] := Calvings.FieldByName('ID4').AsInteger;
             // Get the Calving Event
             if CheckEvents.Locate('ID;EventType',VarArrayOf([Calvings.FieldByName('EventID').AsInteger,CCalvingEvent]),[] ) then
                begin
                   AID := CheckEvents.FieldByName('AnimalId').AsInteger;
                   // Subtract 1 as you need to look at services from previous Lact.
                   LNo := CheckEvents.FieldByName('AnimalLactNo').AsInteger-1;

                   // Clear the Filter
                   WinData.CheckEvents.Filter := '';
                   WinData.CheckEvents.Filtered := FALSE;
                   // Check the Last Service Against the Date today if it's more than 10 days display Message
                   WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(AID) + ') And (AnimalLactNo = ' + IntToStr(LNo) + ') And (EventType = ' + IntToStr(CServiceEvent) + ')';
                   WinData.CheckEvents.Filtered := True;
                   if WinData.CheckEvents.FindLast then
                      if WinData.LookUpServices.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) then
                         BullUsed := WinData.LookUpServices.FieldByName('ServiceBull').AsInteger;
                   // Clear the Filter
                   WinData.CheckEvents.Filter := '';
                   WinData.CheckEvents.Filtered := FALSE;
                end;
             // if the BullUsed > 0 then Process the Calves Records on the AnimalFile to
             // Check the SireID (if 0 then add UsedBull )
             if ( BullUsed > 0 ) then
                for i := 1 to 4 do
                   begin
                      if CalfID[i] > 0 then
                         if LookUpDamSire.Locate('ID',CalfID[i],[]) then
                            if LookUpDamSire.FieldByName('SireId').AsInteger = 0 then
                               begin
                                  LookUpDamSire.Edit;
                                  LookUpDamSire.FieldByName('SireId').AsInteger := BullUsed;
                                  LookUpDamSire.Post;
                                  try
                                     // Insert Trans Record
                                     TransTable.Insert;
                                     TransTable.FieldByName('CowId').AsInteger := AID;
                                     TransTable.FieldByName('CowLactNo').AsInteger := LNo;
                                     TransTable.FieldByName('CalfID').AsInteger := CalfId[i];
                                     TransTable.FieldByName('SireID').AsInteger := BullUsed;
                                     TransTable.Post;
                                  except
                                     // Don't Stop
                                  end;
                               end;
                   end;
             Calvings.Next;
          end;
       ReSult := TRUE;
    finally
       Calvings.Close;
       CheckEvents.Close;
       LookUpDamSire.Close;
       LookUpDamSire.ReadOnly := TRUE;
       LookUpServices.Close;
       TransTable.Close;
       RunReIndex := TRUE;  // ReIndex All Files.
    end;
end;

// Special fix for Calving Events Bug caused by IDRC import
function TWinData.CheckCalvingEvents : Boolean;
var
   MyQuery : TQuery;
begin
   try
      Result := FALSE;
      MyQuery := TQuery.Create(nil);
      MyQuery.DatabaseName := KingData.DatabaseName;
      MyQuery.SQL.Add('UPDATE Events');
      MyQuery.SQL.Add('SET EventType = ' + IntToStr(CCalvingEvent));
      MyQuery.SQL.Add('WHERE ( EventType IS NULL )');
      MyQuery.SQL.Add('AND ( EventDesc = "Calving" )');
      MyQuery.ExecSQL;
      ReSult := TRUE;
   finally
      MyQuery.Free;
      RunReIndex := TRUE;
   end;
end;

// Insert ICBF codes into GenLook.db (01/03/2000 - KR)
function TWinData.ICBFNotified : Boolean;
var
   MyTable : TTable;
   Linecount : integer;
begin
   try
      Result := True;
      MyTable := TTable.Create(nil);
      with MyTable do
         try
            DatabaseName := KingData.DatabaseName;
            Close;
            TableName := 'GenLook';
            Open;
            Linecount := 1;
            if NOT(Locate('Description','ICBF-Normal',[])) then
            while LineCount <= 30 do
               begin
                  Append;
                     Case LineCount of
                        1 : begin
                               FieldByName('ListType').AsInteger      := 6;
                               FieldByName('Description').AsString    := 'ICBF-Normal';
                               FieldByName('UserCanDelete').AsBoolean := False;
                               FieldByName('LookUpCode').AsString     := '1';
                            end;
                        2 : begin
                               FieldByName('ListType').AsInteger      := 6;
                               FieldByName('Description').AsString    := 'ICBF-Some Assistance';
                               FieldByName('UserCanDelete').AsBoolean := False;
                               FieldByName('LookUpCode').AsString     := '2';
                            end;
                        3 : begin
                               FieldByName('ListType').AsInteger      := 6;
                               FieldByName('Description').AsString    := 'ICBF-Considerable Difficulty';
                               FieldByName('UserCanDelete').AsBoolean := False;
                               FieldByName('LookUpCode').AsString     := '3';
                            end;
                        4 : begin
                               FieldByName('ListType').AsInteger      := 6;
                               FieldByName('Description').AsString    := 'ICBF-Veterinary Assistance';
                               FieldByName('UserCanDelete').AsBoolean := False;
                               FieldByName('LookUpCode').AsString     := '4';
                            end;
                        5 : begin
                               FieldByName('ListType').AsInteger      := 13;
                               FieldByName('Description').AsString    := 'ICBF-Displaced Abomasum';
                               FieldByName('UserCanDelete').AsBoolean := True;
                               FieldByName('LookUpCode').AsString     := 'DA';
                            end;
                        6 : begin
                               FieldByName('ListType').AsInteger      := 13;
                               FieldByName('Description').AsString    := 'ICBF-Grass Staggers';
                               FieldByName('UserCanDelete').AsBoolean := True;
                               FieldByName('LookUpCode').AsString     := 'GS';
                            end;
                        7 : begin
                               FieldByName('ListType').AsInteger      := 13;
                               FieldByName('Description').AsString    := 'ICBF-Ketosis';
                               FieldByName('UserCanDelete').AsBoolean := True;
                               FieldByName('LookUpCode').AsString     := 'KE';
                            end;
                        8 : begin
                               FieldByName('ListType').AsInteger      := 13;
                               FieldByName('Description').AsString    := 'ICBF-Milk Fever';
                               FieldByName('UserCanDelete').AsBoolean := True;
                               FieldByName('LookUpCode').AsString     := 'MF';
                            end;
                        9 : begin
                               FieldByName('ListType').AsInteger      := 13;
                               FieldByName('Description').AsString    := 'ICBF-Mastitis';
                               FieldByName('UserCanDelete').AsBoolean := True;
                               FieldByName('LookUpCode').AsString     := 'MA';
                            end;
                       10 : begin
                               FieldByName('ListType').AsInteger      := 13;
                               FieldByName('Description').AsString    := 'ICBF-Retained Placenta';
                               //FieldByName('Description').AsString    := 'ICBF-Retained Plascenta';
                               FieldByName('UserCanDelete').AsBoolean := True;
                               FieldByName('LookUpCode').AsString     := 'RP';
                            end;
                       11 : begin
                               FieldByName('ListType').AsInteger      := 13;
                               FieldByName('Description').AsString    := 'ICBF-Leptospirosis';
                               FieldByName('UserCanDelete').AsBoolean := True;
                               FieldByName('LookUpCode').AsString     := 'LE';
                            end;
                       12 : begin
                               FieldByName('ListType').AsInteger      := 13;
                               FieldByName('Description').AsString    := 'ICBF-Lameness';
                               FieldByName('UserCanDelete').AsBoolean := True;
                               FieldByName('LookUpCode').AsString     := 'LM';
                            end;
                       13 : begin
                               FieldByName('ListType').AsInteger      := 13;
                               FieldByName('Description').AsString    := 'ICBF-Parasitic Infection';
                               FieldByName('UserCanDelete').AsBoolean := True;
                               FieldByName('LookUpCode').AsString     := 'PI';
                            end;
                       14 : begin
                               FieldByName('ListType').AsInteger      := 13;
                               FieldByName('Description').AsString    := 'ICBF-Respiratory Disease';
                               FieldByName('UserCanDelete').AsBoolean := True;
                               FieldByName('LookUpCode').AsString     := 'RD';
                            end;
                       15 : begin
                               FieldByName('ListType').AsInteger      := 13;
                               FieldByName('Description').AsString    := 'ICBF-Scour';
                               FieldByName('UserCanDelete').AsBoolean := True;
                               FieldByName('LookUpCode').AsString     := 'SC';
                            end;
                       16 : begin
                               FieldByName('ListType').AsInteger      := 14;
                               FieldByName('Description').AsString    := 'ICBF-Abortion';
                               FieldByName('UserCanDelete').AsBoolean := False;
                               FieldByName('LookUpCode').AsString     := 'AB';
                            end;
                       17 : begin
                               FieldByName('ListType').AsInteger      := 14;
                               FieldByName('Description').AsString    := 'ICBF-Brucellosis';
                               FieldByName('UserCanDelete').AsBoolean := False;
                               FieldByName('LookUpCode').AsString     := 'BR';
                            end;
                       18 : begin
                               FieldByName('ListType').AsInteger      := 14;
                               FieldByName('Description').AsString    := 'ICBF-BSE';
                               FieldByName('UserCanDelete').AsBoolean := False;
                               FieldByName('LookUpCode').AsString     := 'BS';
                            end;
                       19 : begin
                               FieldByName('ListType').AsInteger      := 14;
                               FieldByName('Description').AsString    := 'ICBF-Feet and Legs';
                               FieldByName('UserCanDelete').AsBoolean := False;
                               FieldByName('LookUpCode').AsString     := 'FL';
                            end;
                       20 : begin
                               FieldByName('ListType').AsInteger      := 14;
                               FieldByName('Description').AsString    := 'ICBF-Infertility';
                               FieldByName('UserCanDelete').AsBoolean := False;
                               FieldByName('LookUpCode').AsString     := 'IN';
                            end;
                       21 : begin
                               FieldByName('ListType').AsInteger      := 14;
                               FieldByName('Description').AsString    := 'ICBF-Low Production';
                               FieldByName('UserCanDelete').AsBoolean := False;
                               FieldByName('LookUpCode').AsString     := 'LP';
                            end;
                       22 : begin
                               FieldByName('ListType').AsInteger      := 14;
                               FieldByName('Description').AsString    := 'ICBF-Old Age';
                               FieldByName('UserCanDelete').AsBoolean := False;
                               FieldByName('LookUpCode').AsString     := 'OA';
                            end;
                       23 : begin
                               FieldByName('ListType').AsInteger      := 14;
                               FieldByName('Description').AsString    := 'ICBF-Poor Milking Speed';
                               FieldByName('UserCanDelete').AsBoolean := False;
                               FieldByName('LookUpCode').AsString     := 'MS';
                            end;
                       24 : begin
                               FieldByName('ListType').AsInteger      := 14;
                               FieldByName('Description').AsString    := 'ICBF-Poor Temperament';
                               FieldByName('UserCanDelete').AsBoolean := False;
                               FieldByName('LookUpCode').AsString     := 'TE';
                            end;
                       25 : begin
                               FieldByName('ListType').AsInteger      := 14;
                               FieldByName('Description').AsString    := 'ICBF-Poor Type';
                               FieldByName('UserCanDelete').AsBoolean := False;
                               FieldByName('LookUpCode').AsString     := 'TY';
                            end;
                       26 : begin
                               FieldByName('ListType').AsInteger      := 14;
                               FieldByName('Description').AsString    := 'ICBF-To be Culled';
                               FieldByName('UserCanDelete').AsBoolean := False;
                               FieldByName('LookUpCode').AsString     := 'TC';
                            end;
                       27 : begin
                               FieldByName('ListType').AsInteger      := 14;
                               FieldByName('Description').AsString    := 'ICBF-Tuberculosis';
                               FieldByName('UserCanDelete').AsBoolean := False;
                               FieldByName('LookUpCode').AsString     := 'TB';
                            end;
                       28 : begin
                               FieldByName('ListType').AsInteger      := 15;
                               FieldByName('Description').AsString    := 'ICBF-Abortion';
                               FieldByName('UserCanDelete').AsBoolean := False;
                               FieldByName('LookUpCode').AsString     := '1';
                            end;
                       29 : begin
                               FieldByName('ListType').AsInteger      := 15;
                               FieldByName('Description').AsString    := 'ICBF-Dead At Birth';
                               FieldByName('UserCanDelete').AsBoolean := False;
                               FieldByName('LookUpCode').AsString     := '2';
                            end;
                       30 : begin
                               FieldByName('ListType').AsInteger      := 15;
                               FieldByName('Description').AsString    := 'ICBF-Dead Within 48 Hours';
                               FieldByName('UserCanDelete').AsBoolean := False;
                               FieldByName('LookUpCode').AsString     := '3';
                            end;
                     end;
                  Inc(LineCount);
                  Post;
               end;
            Close;
         except
            MessageDlg('Cannot Update ICBF Codes - Contact Kingswood',mtWarning,[mbOK],0);
            Result := False;
         end;
   finally
      //
   end;
end;

// Insert Feed Category codes into GenLook.db (22/05/2000 - KR)
function TWinData.FeedCategory : Boolean;
var
   MyTable : TTable;
   Linecount : integer;
begin
   try
      Result := True;
      MyTable := TTable.Create(nil);
      with MyTable do
         begin
            DatabaseName := KingData.DatabaseName;
            Close;
            TableName := 'GenLook';
            Open;
            if NOT(Locate('Description','Homegrown',[])) then
               try
                  Linecount := 1;
                  while LineCount <= 2 do
                     begin
                        Append;
                           Case LineCount of
                              1 : begin
                                     FieldByName('ListType').AsInteger      := 16;
                                     FieldByName('Description').AsString    := 'Homegrown';
                                     FieldByName('UserCanDelete').AsBoolean := False;
                                     FieldByName('LookUpCode').AsString     := '1';
                                  end;
                              2 : begin
                                     FieldByName('ListType').AsInteger      := 16;
                                     FieldByName('Description').AsString    := 'Purchased';
                                     FieldByName('UserCanDelete').AsBoolean := False;
                                     FieldByName('LookUpCode').AsString     := '2';
                                  end;
                           end;
                        Inc(LineCount);
                        Post;
                     end;
               except
                  MessageDlg('Cannot Update Feed Category Codes - Contact Kingswood',mtWarning,[mbOK],0);
                  Result := False;
               end;
            Close;
         end;
   finally
      //
   end;
end;

procedure TWinData.UpdateDefaults;
begin
   try
    Defaults.Open;
      if (Defaults.RecordCount > 0) then
         if (Defaults.FieldByName('UpdateNo').AsInteger < iHerdVerNo) then
            begin
               Defaults.Edit;
               Defaults.FieldByName('UpdateNo').AsInteger := iHerdVerNo;
               Defaults.Post;
            end;
   finally
      Defaults.Close;
   end;   
end;

// function to recalculate the Eligibility date for animals that have a beefsub record
// and haven't drawn a premium.
function TWinData.CheckPremiumEligibility : Boolean;
var
   MyEvents,
   MyLookUpDamSire,
   MyOwnerFile,
   MyBeefSubsidy,
   MyPremiumType : TTable;
   MyQuery : TQuery;
   NewDate,
   DOB     : TDateTime;
   Sex     : String;
   NoMonths : Integer;
   HasDrawn : Boolean;
   WhichC   : TCountry;
begin
   try
      ReSult := FALSE;
      MyEvents := TTable.Create(nil);
      MyEvents.DatabaseName := KingData.DatabaseName;
      MyEvents.TableName := Events.TableName;
      MyEvents.Open;
      MyOwnerFile := TTable.Create(nil);
      MyOwnerFile.DatabaseName := KingData.DatabaseName;
      MyOwnerFile.TableName := OwnerFile.TableName;
      MyOwnerFile.Open;
      MyLookUpDamSire := TTable.Create(nil);
      MyLookUpDamSire.DatabaseName := KingData.DatabaseName;
      MyLookUpDamSire.TableName := LookUpDamSire.TableName;
      MyLookUpDamSire.Open;
      MyBeefSubsidy := TTable.Create(nil);
      MyBeefSubsidy.DatabaseName := KingData.DatabaseName;
      MyBeefSubsidy.TableName := BeefSubsidy.TableName;
      MyBeefSubsidy.Open;
      MyPremiumType := TTable.Create(nil);
      MyPremiumType.DatabaseName := KingData.DatabaseName;
      MyPremiumType.TableName := PremiumType.TableName;
      MyPremiumType.Open;

      MyQuery := TQuery.Create(nil);
      MyQuery.DatabaseName := KingData.DatabaseName;
      MyQuery.SQL.Add('SELECT * FROM events');
      MyQuery.SQL.Add('WHERE ( EventType = ' + IntToStr(CPremium10Event) + ')');
      MyQuery.SQL.Add('OR ( EventType = ' + IntToStr(CPremium22Event) + ')');
      MyQuery.SQL.Add('OR ( EventType = ' + IntToStr(CPremiumBullEvent) + ')');
      MyQuery.Open;
      MyQuery.First;
      while NOT MyQuery.EOF do
         begin
            if MyLookUpDamSire.Locate('ID',MyQuery.FieldByName('AnimalID').AsInteger,[]) then
               begin
                  DOB := MyLookUpDamSire.FieldByName('DateOfBirth').AsDateTime;
                  Sex := MyLookUpDamSire.FieldByName('Sex').AsString;
                  MyBeefSubsidy.Filter := 'AnimalID = ' + MyLookUpDamSire.FieldByName('ID').AsString;
                  MyBeefSubsidy.Filtered := TRUE;
                  MyBeefSubsidy.First;
                  while NOT MyBeefSubsidy.EOF do
                     begin
                        HasDrawn := FALSE;
                        NewDate := 0;
                        // if Application drawn then don't recalculate
                        if MyBeefSubsidy.FieldByName('ApplicationID').AsInteger = -1 then
                           begin
                              if MyBeefSubsidy.FieldByName('PremiumType').AsString = 'F' then
                                 begin
                                    NoMonths := GetNoMonthsOrDaysForPrem(MyPremiumType,M,F);
                                    NewDate := IncMonth(DOB, NoMonths);
                                    if ( NewDate <> MyBeefSubsidy.FieldByName('EligibilityDate').AsDateTime ) then
                                       begin
                                          MyBeefSubsidy.Edit;
                                          MyBeefSubsidy.FieldByName('EligibilityDate').AsDateTime := NewDate;
                                          MyBeefSubsidy.Post;
                                       end;
                                 end
                              else if MyBeefSubsidy.FieldByName('PremiumType').AsString = 'S' then
                                 begin
                                    NoMonths := GetNoMonthsOrDaysForPrem(MyPremiumType,M,S);
                                    NewDate := IncMonth(DOB, NoMonths);
                                    if ( NewDate <> MyBeefSubsidy.FieldByName('EligibilityDate').AsDateTime ) then
                                       begin
                                          MyBeefSubsidy.Edit;
                                          MyBeefSubsidy.FieldByName('EligibilityDate').AsDateTime := NewDate;
                                          MyBeefSubsidy.Post;
                                       end;
                                 end
                              else if MyBeefSubsidy.FieldByName('PremiumType').AsString = 'B' then
                                 begin
                                    NoMonths := GetNoMonthsOrDaysForPrem(MyPremiumType,M,B);
                                    NewDate := IncMonth(DOB, NoMonths);
                                    if ( NewDate <> MyBeefSubsidy.FieldByName('EligibilityDate').AsDateTime ) then
                                       begin
                                          MyBeefSubsidy.Edit;
                                          MyBeefSubsidy.FieldByName('EligibilityDate').AsDateTime := NewDate;
                                          MyBeefSubsidy.Post;
                                       end;
                                 end;
                           end
                        else // Premium Drawn so change the Event Description and Date to
                             // the Application Date
                           begin
                              NewDate := MyBeefSubsidy.FieldByName('ApplicationDate').AsDateTime;
                              if NewDate > 0 then
                                 HasDrawn := TRUE;
                              // ReCalculate the Retension Date for this Animal
                              MyBeefSubsidy.Edit;
                              if MyBeefSubsidy.FieldByName('PremiumType').AsString = 'B' then
                                 NoMonths := WinData.GetNoMonthsOrDaysForPrem(MyPremiumType,D,B)
                              else if MyBeefSubsidy.FieldByName('PremiumType').AsString = 'F' then
                                 NoMonths := WinData.GetNoMonthsOrDaysForPrem(MyPremiumType,D,F)
                              else if MyBeefSubsidy.FieldByName('PremiumType').AsString = 'S' then
                                 NoMonths := WinData.GetNoMonthsOrDaysForPrem(MyPremiumType,D,S)
                              else
                                 NoMonths := WinData.GetNoMonthsOrDaysForPrem(MyPremiumType,D,F);
                              MyBeefSubsidy.FieldByName('RetensionDate').AsDateTime := GetRetensionDate(NewDate, MyPremiumType);
                              MyBeefSubsidy.Post;
                           end;

                        // if a date has been set then ensure the event link date is the same as the eligibility date
                        if ( NewDate > 0 ) then
                           if MyEvents.Locate('ID',MyBeefSubsidy.FieldByName('EventID').AsInteger,[] ) then
                              begin
                                 if {(( NewDate <> MyEvents.FieldByName('EventDate').AsDateTime ) And}
                                     (( MyEvents.FieldByName('EventType').AsInteger = CPremium10Event ) Or
                                      ( MyEvents.FieldByName('EventType').AsInteger = CPremium22Event ) Or
                                      ( MyEvents.FieldByName('EventType').AsInteger = CPremiumBullEvent )) then
                                    begin
                                       MyEvents.Edit;
                                       if HasDrawn then
                                          begin
                                             MyEvents.FieldByName('EventDate').AsDateTime := NewDate;
                                             WhichC := WinData.GetHerdCountry(MyOwnerFile,MyEvents.FieldByName('HerdID').AsString);
                                             if WhichC = NIreland then
                                                case MyEvents.FieldByName('EventType').AsInteger of
                                                   CPremium10Event   :MyEvents.FieldByName('EventDesc').AsString := cFirstNIDrawn;
                                                   CPremium22Event   :MyEvents.FieldByName('EventDesc').AsString := cSecondNIDrawn;
                                                   CPremiumBullEvent :MyEvents.FieldByName('EventDesc').AsString := cBullNIDrawn;
                                                end
                                             else
                                                case MyEvents.FieldByName('EventType').AsInteger of
                                                   CPremium10Event   :MyEvents.FieldByName('EventDesc').AsString := cFirstDrawn;
                                                   CPremium22Event   :MyEvents.FieldByName('EventDesc').AsString := cSecondDrawn;
                                                   CPremiumBullEvent :MyEvents.FieldByName('EventDesc').AsString := cBullDrawn;
                                                 end;
                                          end
                                       else
                                          begin
                                             WhichC := WinData.GetHerdCountry(MyOwnerFile,MyEvents.FieldByName('HerdID').AsString);
                                             if WhichC = NIreland then
                                                case MyEvents.FieldByName('EventType').AsInteger of
                                                   CPremium10Event   :MyEvents.FieldByName('EventDesc').AsString := cFirstNIElig;
                                                   CPremium22Event   :MyEvents.FieldByName('EventDesc').AsString := cSecondNIElig;
                                                   CPremiumBullEvent :MyEvents.FieldByName('EventDesc').AsString := cBullNIElig;
                                                end
                                             else
                                                case MyEvents.FieldByName('EventType').AsInteger of
                                                   CPremium10Event   :MyEvents.FieldByName('EventDesc').AsString := cFirstElig;
                                                   CPremium22Event   :MyEvents.FieldByName('EventDesc').AsString := cSecondElig;
                                                   CPremiumBullEvent :MyEvents.FieldByName('EventDesc').AsString := cBullElig;
                                                end;
                                             MyEvents.FieldByName('EventDate').AsDateTime := NewDate;
                                          end;
                                       MyEvents.Post;
                                    end;
                              end;
                        MyBeefSubsidy.Next;
                     end;
                  MyBeefSubsidy.Filtered := FALSE;
                  MyBeefSubsidy.Filter := '';
               end;
            MyQuery.Next;
         end;
      ReSult := TRUE;
   finally
      MyEvents.Close;
      MyLookUpDamSire.Close;
      MyOwnerFile.Close;
      MyBeefSubsidy.Close;
      MyPremiumType.Close;
      MyQuery.Free;
      MyEvents.Free;
      MyLookUpDamSire.Free;
      MyBeefSubsidy.Free;
      MyPremiumType.Free;
      MyOwnerFile.Free;
   end;
end;

procedure TWinData.SetEventsToEdit;
begin
   if NOT (Events.State in dsEditmodes) then
      Events.Edit;
end;

procedure TWinData.EventsAfterEdit(DataSet: TDataSet);
begin
   try
      case EventType of
         THealth,
         TDryOff  : begin
                       // Before editing Event put the Health record into edit mode
                       if Health.RecordCount > 0 then
                          Health.Edit;
                    end;
         TPurchase : begin
                       // Before editing Event put the Purchase record into edit mode
                       if Purchases.RecordCount > 0 then
                          Purchases.Edit
                       else
                          Purchases.Append;
                     end;
         TSaleDeath : begin
                       // Before editing Event put the Purchase record into edit mode
                       if SaleDeath.RecordCount > 0 then
                          SaleDeath.Edit
                       else
                          SaleDeath.Append;
                     end;
         TPreSale  : begin
                       // Before editing Event put the Purchase record into edit mode
                       if SaleDeath.RecordCount > 0 then
                          SaleDeath.Edit
                       else
                          SaleDeath.Append;
                     end;
         TMovement : begin
                       // Before editing Event put the Movement record into edit mode
                       if tMovements.RecordCount > 0 then
                          tMovements.Edit
                       else
                          tMovements.Append;
                     end;
         TPregDiag : begin
                       if PregDiag.RecordCount > 0 then
                          PregDiag.Edit
                       else
                          PregDiag.Append;
                     end;
         TConditionScore  : begin
                               if ConditionScore.RecordCount > 0 then
                                  ConditionScore.Edit
                               else
                                  ConditionScore.Append;
                            end;
         TDiagnoseProblem : begin
                               if DiagnoseProblem.RecordCount > 0 then
                                  DiagnoseProblem.Edit
                               else
                                  DiagnoseProblem.Append;
                            end;
         TEmbryoTransfer  : begin
                               if EmbryoTransfer.RecordCount > 0 then
                                  EmbryoTransfer.Edit
                               else
                                  EmbryoTransfer.Append;
                            end;
         TInternalExam    : begin
                               if IntExam.RecordCount > 0 then
                                  IntExam.Edit
                               else
                                  IntExam.Append;
                            end;
         TRunBullIn,
         TRunBullOut      : begin
                               if BullInOut.RecordCount > 0 then
                                  BullInOut.Edit
                               else
                                  BullInOut.Append;
                            end;
         TMealFeeding      : begin
                               if MealFeeding.RecordCount > 0 then
                                  MealFeeding.Edit
                               else
                                  MealFeeding.Append;
                            end;
         TDisbudding      : begin
                               if Disbudding.RecordCount > 0 then
                                  Disbudding.Edit
                               else
                                  Disbudding.Append;
                            end;
         TWean      : begin
                               if Weaning.RecordCount > 0 then
                                  Weaning.Edit
                               else
                                  Weaning.Append;
                            end;
      end;
   except
      on E : Exception Do
         MessageDlg ( E.Message, mtInformation, [mbOK],0 );
   end;
{   // update ICBF notification
   EventsICBFNotified.AsBoolean := False;
   EventsICBFAction.AsString := 'M';
}
end;
{
function TWinData.CreateExtTable : Boolean;
var
   MyQuery : TQuery;
begin
    try
       RESULT := FALSE;
       MyQuery := TQuery.Create(nil);
       MyQuery.DatabaseName := KingData.DatabaseName;
       with MyQuery do
          begin
             try
                SQL.Clear;
                SQL.Add('DROP TABLE "ext001.db"');
                ExecSQL;
             except
                 // Do Nothing
             end;
             SQL.Clear;
             SQL.Add('CREATE TABLE "ext001.db"');
             SQL.Add('(');
	           SQL.Add(' HerdId INTEGER,');
	           SQL.Add(' YearToRun INTEGER,');
	           SQL.Add(' DateTo DATE,');
	           SQL.Add(' FHect FLOAT,');
	           SQL.Add(' LUExtPrem FLOAT,');
	           SQL.Add(' LUBase FLOAT,');
	           SQL.Add(' LUMin FLOAT,');
	           SQL.Add(' ExtAmt FLOAT,');
	           SQL.Add(' PremAmt FLOAT,');
	           SQL.Add(' MaxLUS FLOAT,');
	           SQL.Add(' MilkQuota FLOAT,');
             SQL.Add(' PndsCow FLOAT,');
             SQL.Add(' NoCows INTEGER,');

             SQL.Add(' PndsEwe FLOAT,');
             SQL.Add(' NoEwe INTEGER,');
             SQL.Add(' PndsSuckler FLOAT,');
             SQL.Add(' NoSuckler INTEGER,');
             SQL.Add(' LUS10Mth FLOAT,');
             SQL.Add(' LUSUnder24Mth FLOAT,');

             SQL.Add('LUSOver24Mth Float,');
             SQL.Add('LUSCow       Float,');
             SQL.Add('LUSEwe       Float,');
             SQL.Add('LUSSuckler   Float,');
             SQL.Add('TotalAmtCow  Float,');
             SQL.Add('TotalAmtEwe  Float,');
             SQL.Add('TotalAmtSuckler Float,');

             SQL.Add('seNo10Mth    Integer,');  // se = Still Eligible
             SQL.Add('seNoUnder24Mth Integer,');
             SQL.Add('seNoOver24Mth  Integer,');
             SQL.Add('se10MthLU      Float,');
             SQL.Add('seUnder24MthLU Float,');
             SQL.Add('seOver24MthLU  Float,');

             SQL.Add('neNo10Mth      Integer,');  // ne = Not Eligible
             SQL.Add('neNoUnder24Mth Integer,');
             SQL.Add('neNoOver24Mth  Integer,');
             SQL.Add('ne10MthLU      Float,');
             SQL.Add('neUnder24MthLU Float,');
             SQL.Add('neOver24MthLU  Float,');

             SQL.Add('TotalLUSStillElig  Float,');
             SQL.Add('TotalLUSAppliedFor Float,');
             SQL.Add('TotalLUS           Float,');

             //Results Screen
             SQL.Add('TotalLUSExceeding   Float,');
             SQL.Add('NoSteersUnder24Mths Float,');
             SQL.Add('NoSteersOver24Mths  Float,');

             SQL.Add('NoToDeduct10Mth      Integer,');
             SQL.Add('NoToDeductUnder24Mth Integer,');
             SQL.Add('NoToDeductOver24Mth  Integer,');

             SQL.Add('Deduct10MthLU        Float,');
             SQL.Add('DeductUnder24MthLU   Float,');
             SQL.Add('DeductOver24MthLU    Float,');

             SQL.Add('TotalSBPExExten      MONEY,');
             SQL.Add('TotalSBPInclExten    MONEY,');
             SQL.Add('AvgGallons           FLOAT,');
             SQL.Add('SucklerQuota         INTEGER,');
             SQL.Add('NoSucklerHeifers     INTEGER,');
             SQL.Add('LUSSucklerHeifers    FLOAT,');
             SQL.Add(' PRIMARY KEY(HerdID)');
             SQL.Add(')');
             ExecSQL; // Create the TABLE
          end;
    finally
       MyQuery.Close;
       MyQuery.Free;
       RESULT := TRUE;
    end;
end;
}
procedure TWinData.EventsEventDateChange(Sender: TField);
begin
     if ( EventType = TPurchase ) then
        if ( Events.State = dsInsert ) then
           begin
              DefaultPurchEventDate := EventsEventDate.AsDateTime;
              PurchDateSet := True;
           end;
     if ( EventType = TSaleDeath ) then
        if ( Events.State = dsInsert ) then
           begin
              DefaultSaleDeathEventDate := EventsEventDate.AsDateTime;
              SaleDeathDateSet := True;
           end;
     if ( EventType = TPurchase ) then
        CheckRemarks(Events, Sender, GenTypesConst.PurchDate )
     else if ( EventType = TSaleDeath  ) then
        CheckRemarks(Events, Sender, GenTypesConst.SaleDate );

   if ( Events.State = dsInsert ) and ( EventsEventType.AsInteger = cCalvingEvent ) then
      begin
         HerdLookup.QueryAnimalWithdrawal(WinData.AnimalFileByIDID.AsInteger, EventsEventDate.AsDateTime);
      end;
end;

procedure TWinData.CheckRemarks(ThisTable : TDataSet; MyField: TField; MyRemark : TRemark; AUserConfirm : Boolean);
begin
   fRemarks.UserConfirm := AUserConfirm;
   if ( ThisTable.State <> dsInsert ) then
      if MyField.OldValue <> MyField.NewValue then
         fRemarks.DisplayRemark := MyRemark
      else
         fRemarks.RemoveRemark := MyRemark;
end;

procedure TWinData.SaleDeathCustomerChange(Sender: TField);
begin
   DefaultCustomer := SaleDeathCustomer.AsInteger;
   if WinData.Events.State = dsEdit then
      CheckRemarks(SaleDeath, Sender, GenTypesConst.SalePlace );
end;

procedure TWinData.EventsBeforeEdit(DataSet: TDataSet);
begin
    // Clear all the Remarks Field before editing
    if ( EventType in [TPurchase,TSaleDeath] ) then
       fRemarks.RemarksAdded := FALSE;

{    if EventType = TPreSale then
       if WinData.HasSaleDeath(AnimalFileByIDID.AsInteger, AnimalFileByIDHerdID.AsInteger) then
           raise Exception.Create('Animal already has sale event recorded');
}
end;

procedure TWinData.tMovementsBeforePost(DataSet: TDataSet);
begin
    // If the Moved Back Date has a value then set the StillOffFarm to False
    DataSet.FieldByName('StillOffFarm').AsBoolean := DataSet.FieldByName('DateMovedBack').IsNull;
end;

procedure TWinData.tMovementsNewRecord(DataSet: TDataSet);
begin
    // If the Moved Back Date has a value then set the StillOffFarm to False
    DataSet.FieldByName('AID').AsInteger := AnimalFileByIDID.AsInteger;
end;

procedure TWinData.tMovedToBeforeDelete(DataSet: TDataSet);
begin
    // Check the Record isn't begin used by the Movements Table
    try
       luMovements.Open;
       if luMovements.Locate('MovedTo',tMovedTo.FieldByName('ID').AsInteger,[]) then
          begin
             MessageDlg('This Place is in Used for other Movement',mtInformation,[mbOK],0);
             SysUtils.Abort;
          end;
    finally
       luMovements.Close;
    end;
end;

procedure TWinData.PurchasesBuyerChange(Sender: TField);
begin
     DefaultBuyer := PurchasesBuyer.AsInteger;
end;

procedure TWinData.PurchasesSupplierCostsChange(Sender: TField);
begin
//   DefaultSupplierCost := PurchasesSupplierCosts.Value;
end;

procedure TWinData.PurchasesBuyerCostsChange(Sender: TField);
begin
//   DefaultBuyerCost := PurchasesBuyerCosts.Value;
end;

procedure TWinData.CheckEventsBeforeOpen(DataSet: TDataSet);
begin
    // Set the Index to the Event Date
    WinData.CheckEvents.IndexName := 'iEventDate';
end;

procedure TWinData.tIntHerdAfterPost(DataSet: TDataSet);
begin
     try
        KingData.ApplyUpdates([tIntHerd]);
        try
           with GenQuery do
              begin
                  SQL.Clear;
                  SQL.Add('UPDATE Animals');
                  SQL.Add('SET HerdID=' + IntToStr(NewInterHerdID) + ',');
                  SQL.Add('SeqNo=' + IntToStr(NewSeqNo));
                  SQL.Add('WHERE ID=' + AnimalFileByIDID.AsString);
                  ExecSQL;
              end;
           if NeedSequence then
              if NOT IncreaseSeqNo(NewInterHerdID) then
                 MessageDLG('Invalid Sequence Number - error updating',mtwarning,[mbOk],0);
           (*
           // Change the Animal to the New Herd
           if NOT ( AnimalFileByID.state in dsEditmodes ) then
              AnimalFileById.Edit;

           AnimalFileByIDSeqNo.AsInteger :=  NewSeqNo;
           AnimalFileByIDHerdID.AsInteger := NewInterHerdID;
           AnimalFileById.Post;
           *)
        except
           // Cancel changes to Animal to the New Herd
           // AnimalFileById.CancelUpdates;
        end;
     except
        tIntHerd.CancelUpdates;
     end;
end;

procedure TWinData.tIntHerdBeforePost(DataSet: TDataSet);
begin
    // check the Old and New Herds exist
    if ( tIntHerd.FieldByName('NewHerdID').AsInteger <= 0 ) or
       ( tIntHerd.FieldByName('LastHerdID').AsInteger <= 0 ) then
       begin
           ShowMessage('Old and New Herd ID must be selected');
           SysUtils.Abort;
       end;
    NewInterHerdID := tIntHerd.FieldByName('NewHerdID').AsInteger;
    tIntHerd.FieldByName('AnimalID').AsInteger := AnimalFileByIDID.AsInteger;
    tIntHerd.FieldByName('OldSeqNo').AsInteger := AnimalFileByIDSeqNo.AsInteger;
    tIntHerd.FieldByName('NewSeqNo').AsInteger := GetSeqNo(NewInterHerdID);
    NewSeqNo := tIntHerd.FieldByName('NewSeqNo').AsInteger;
end;

procedure TWinData.BreedsBeforeDelete(DataSet: TDataSet);
begin
    // Check the Breed isn't in use on an Animal
    if LookUpDamSire.Locate('PrimaryBreed',DataSet.FieldByName('ID').AsInteger,[]) then
       begin
          MessageDLG('Breed Code is in use - cannot delete',mtwarning,[mbOK],0);
          SysUtils.Abort;  // Cancel the Deletion
       end
    // Check the Breed isn't in use on an Animal
    else if LookUpDamSire.Locate('SecondaryBreed',DataSet.FieldByName('ID').AsInteger,[]) then
       begin
          MessageDLG('Breed Code is in use - cannot delete',mtwarning,[mbOK],0);
          SysUtils.Abort;  // Cancel the Deletion
       end;
end;

procedure TWinData.tIntHerdNewRecord(DataSet: TDataSet);
begin
     NeedSequence := TRUE;
     tIntHerd.FieldByName('LastHerdID').AsInteger := AnimalFileByIDHerdID.AsInteger;
     // Set the AnimalID here BUT it will be altered by before post to ensure
     // the correct AnimalID is saved
     tIntHerd.FieldByName('AnimalID').AsInteger := AnimalFileByIDID.AsInteger;
     // tIntHerd.FieldByName('OldSeqNo').AsInteger := AnimalFileByIDSeqNo.AsInteger;
     tIntHerd.FieldByName('DateMoved').AsDateTime := Now();
end;

function TWinData.GetHasInterHerd : Boolean;
begin
    // Try and determin if a Inter Herd Transfer exists
    // for the Current Animal in AnimalFileById
    try
       tIntHerd.Open;
       if tIntHerd.Locate('AnimalID',AnimalFileByIdID.AsInteger,[] ) then
          Result := TRUE
       else
          Result := FALSE;
    finally
       tIntHerd.Close;
    end;
end;

procedure TWinData.tIntHerdAfterCancel(DataSet: TDataSet);
begin
     NeedSequence := FALSE;
end;

{ Start of Animal File processing }
procedure TWinData.AnimalFileByIDNewRecord(DataSet: TDataSet);
var
   ThisHerdType : String;
begin
   AnimalFileByIDID.Value := NewID;
   AnimalFileByIDLactNo.Value := 0;
   AnimalFileByIdInHerd.Value := True;
   { BLADE }
   { Set BladeNotified to True where inserting new animal.}
   AnimalFileByIDBladeNotified.Value := False;

   // Set the Defaults
   if ( DefaultHerd = 0 ) then
      DefaultHerd := UserDefaultHerdID;

   AnimalFileByIdHerdID.Value := DefaultHerd;
   if HerdSpecies(AnimalFileByIdHerdID.Value) = cSpecies_Goats then
      AnimalFileByIDNatIDNum.EditMask := GoatTagFormat
   else if AnimalFileByIdHerdID.Value = NONEHerdID then
      AnimalFileByIDNatIDNum.EditMask := '';

   AnimalFileByIDPrimaryBreed.Value := DefaultBreed;
   AnimalFileByIDColour.Value := DefaultColour;
   AnimalFileByIDSex.Value := DefaultSex;
   AnimalFileByIDAnimalDeleted.Value := FALSE;

   AnimalFileByIdDamID.Value := 0;
   AnimalFileByIdSireID.Value := 0;
   AnimalFileByIDPedigree.AsBoolean := False;

   // Get the Herd Type
   if OwnerFile.Locate('ID',DefaultHerd,[]) then
      if GenLookUp.Locate('ID',OwnerFile.FieldByName('TypeOfHerd').AsInteger,[]) then
         ThisHerdType := GenLookUp.FieldByName('Description').Value;

   if AnimalFileByIDSex.Value <> 'Steer' then
      begin
         if ThisHerdType = 'Beef' then
            AnimalFileByIDBreeding.Value := False
         else
            begin
               if AnimalFileByIDSex.Value = 'Bull' then
                  // done at the behest of GL/P. Cosgrave 28/07/06
                  AnimalFileByIDBreeding.AsBoolean := GlobalSettings.DefaultMaleBreedingStatus
               else // if Female
                  AnimalFileByIDBreeding.Value := True;
            end;
      end
   else
      AnimalFileByIDBreeding.Value := False;

   // 08/01/2009 V3.9 R5.6 /SP Default Animal to Pedigree if user has pedigree module.
   if Def.Definition.dUsePedigree then
      begin
         AnimalFileByIDPedigree.AsBoolean := True;
      end;
end;

procedure TWinData.AnimalFileByIDAfterPost(DataSet: TDataSet);
var
   OldHerdID,
   NewHerdID : Variant;
   AID       : Integer;
begin
   AnimalFileByIDNatIDNum.EditMask := '';

   if ( tBullSemen.State in dsEditModes ) then tBullSemen.Post;
   if ( tBullExt.State in dsEditModes ) then tBullExt.Post;
   if ( CowExt.State in dsEditModes ) then CowExt.Post;
   if ( tBlup.State in dsEditModes ) then tBlup.Post;
   if (AnimalsExt.State in dsEditModes ) then AnimalsExt.Post;

   OldHerdID := AnimalfileByIDHerdID.OldValue;
   NewHerdID := AnimalFileByIDHerdID.NewValue;
   AID       := AnimalfileByIDID.AsInteger;

   try
      try
         AnimalFileById.DisableControls;
         if fRemarks.RemarksAdded then
            begin
               WriteRemarks;
               KingData.ApplyUpdates([AnimalFileByID,tRemarks]);
               tRemarks.Close;
            end
         else
            begin
               if NeedSequence then
                  begin
                     if NOT IncreaseSeqNo(LastHerdID) then
                        MessageDLG('Invalid Sequence Number - error updating',mtwarning,[mbOk],0);
                  end;
               KingData.ApplyUpdates([AnimalFileByID]);
            end;
         UpdateAnimals.DataSet.FlushBuffers;
         AnimalFileById.CommitUpdates;  // Introduced by shane to try prevent loss of animals after x amount of new animals.

         // ensure the data is written to disk
         // DbiSaveChanges(AnimalFileById.Handle);
         // After everything is save call Query to Update Events table with
         // New HerdID if the User changed it
         if (NewHerdID <> OldHerdID) then
            UpdateEventHerdID(NewHerdID,AID);

         if AnimalFileByIDSex.AsString = cSex_Bull then
            RefreshDamSireLookupTable(True) // Sires
         else if AnimalFileByIDSex.AsString = cSex_Female then
            RefreshDamSireLookupTable(False); // Dams
         CreateAnimalExtRecord;

      except
         on E : Exception Do
            MessageDlg(E.Message,mtInformation,[mbOK],0);
      end;
   finally
      AnimalFileById.EnableControls;
      if ( EventDataTransfer <> nil ) then
         try
            TfmAnimalEventTransfer.InvokeAnimalEventTransfer(EventDataTransfer.OldID, EventDataTransfer.NewID);
         finally
            FreeAndNil(EventDataTransfer);
         end;
   end;
end;

procedure TWinData.UpdateEventHerdID(HID: Variant; AID: Integer);
begin
   try
      with GenQuery do
         begin
            Close;
            SQL.Clear;
            SQL.Add('UPDATE ' + Events.TableName);
            SQL.Add('SET HerdID = ' + IntToStr(HID));
            SQL.Add('WHERE AnimalID=' + IntToStr(AID));
            ExecSQL;
         end;
   except
      ShowMessage('Failed to update HerdID - Contact Kingswood');
   end;
end;

procedure TWinData.AnimalFileByIDBeforePost(DataSet: TDataSet);
var
   AllOk : Boolean;
   ShowMessage : Boolean;
   sThisHerdType : String;
   CheckNationalIDRecord : TCheckNationalIDRecord;
   TempStr : string;
begin
   // Do Not Check this info if Calving an animal
   if NOT CalvingAnimal then
      begin

         { TEST for Herd Identity }
         if NOT ( OwnerFile.Locate('ID', AnimalFileByIDHerdID.AsInteger, [] )) then
            raise ErrorMsg.CreateFmt('Herd Identity must be entered',[nil]);
         { END TEST for Herd Identity }

         // make sex required field - 17/7/00 kr
         if (AnimalFileByIDSex.IsNull) then
            begin
               MessageDLG('Invalid Sex Entered - Please Re-enter a valid Sex',mtInformation,[mbOK],0);
               SysUtils.Abort;
            end;

         { SP 16/09/02 :- BeforeEditNatIDType this variable is set in AnimalFileByIDBeforeEdit }
         if (AnimalFileByID.State = dsEdit) and ( AnimalFileByIDHerdID.AsInteger <> NONEHerdID) then
            begin
               if AnimalFileByIDNatIDNum.OldValue <> AnimalFileByIDNatIDNum.NewValue then
                   begin
                     WinData.Defaults.Open;
                     try
                        Defaults.First;
                        ShowMessage := ((BeforeEditNatIDType <> StyleUnknown) and (AfterEditNatIDType = StyleUnknown) and ( Defaults.FieldByName('NatIdIndex').AsInteger <> 4 ));
                        if ShowMessage then
                           raise ErrorMsg.Create('Tag not correct for this tag type');
                     finally
                        Defaults.Close;
                     end;
                  end;
            end;

         { TEST for Animal No }
         // Check one of the 2 Animal No are filled
         if ( AnimalFileByIDHerdID.AsInteger <> NONEHerdID ) then
            begin
               if ( AnimalFileByIDAnimalNo.IsNull And AnimalFileByIDNatIdNum.IsNull ) then
                  raise ErrorMsg.CreateFmt('Animal No or National No required',[nil])
            end;

         // If the AnimalNo has info. in it check this string doesn't already exist
         // in the Current Herd ID and it isn't the same record.
         if not ( AnimalFileByIDAnimalNo.IsNull ) then
            begin
               if LookUpDamSire.Filtered then
                  begin
                     LookUpDamSire.Filter := '';
                     LookUpDamSire.Filtered := False;
                  end;
               LookUpDamSire.Refresh;

               if LookUpDamSire.Locate('AnimalNo;HerdID',VarArrayOf([ AnimalFileByIDAnimalNo.AsString, AnimalFileByIDHerdID.AsInteger ]),[] ) then
                  if ( AnimalFileByIDID.AsInteger <> LookUpDamSire.FieldByName('ID').AsInteger ) then
                     raise ErrorMsg.CreateFmt('Animal No %s already exists in this Herd',[AnimalFileByIDAnimalNo.AsString]);
            end;
         { END TEST for Animal No }

         { SP 18/03/2003 - If herd is registered in NIreland, check for animal colour }
         {                 if doesn't exist raise error msg }

         if ( AnimalFileByIDHerdID.AsInteger <> NONEHerdID ) then
            if DefCountry(AnimalFileByIDHerdID.AsInteger) = NIreland then
               if (AnimalFileByIDColour.IsNull) or (AnimalFileByIDColour.AsInteger <= 0) then
                  raise ErrorMsg.CreateFmt('You must enter a colour for this animal',[nil]);

         { SP 18/03/2003 }

         { Test for DateOfBirth for Animals in the HERD }
         if ( AnimalFileByIDDateOfBirth.IsNull ) And ( AnimalFileByIDHerdID.AsInteger <> NONEHerdID ) then
            raise ErrorMsg.CreateFmt('Date of Birth required',[nil])
         else if ( NOT ( AnimalFileByIDDateOfBirth.IsNull )) And ( AnimalFileByIDHerdID.AsInteger <> NONEHerdID ) then
            if AnimalFileByIDDateOfBirth.AsDateTime > Now() then
               raise ErrorMsg.CreateFmt('Date of Birth %s cannot be after Today %s',[FormatDateTime(cIrishDateStyle,AnimalFileByIDDateOfBirth.AsDateTime),FormatDateTime(cIrishDateStyle,Now())]);
         if (AnimalFileByIDHerdID.AsInteger <> NONEHerdID ) then
            if AnimalFileByIDDateOfBirth.AsDateTime < StrToDate('01/01/1900') then
               raise ErrorMsg.CreateFmt('Date of Birth %s cannot before "01/01/1900"',[FormatDateTime(cIrishDateStyle,AnimalFileByIDDateOfBirth.AsDateTime)]);
         { END Test for DateOfBirth for Animals in the HERD }

         // make breed required field - 17/7/00 kr
         // Ancestors added from the Pedigree Screen do not need a breed "Gerry" 02/08/01
         if BreedRequired then
            if ((AnimalFileByIDPrimaryBreed.IsNull) or (AnimalFileByIDPrimaryBreed.AsInteger = 0)) then // AND None herd requirement taken out. Calf reg needs Dam/Sire breed/.
               //( Not (AnimalFileByIDHerdID.AsInteger = NONEHerdID))) then   //KVB 22/01/01 Animal Images Requirement
               raise ErrorMsg.CreateFmt('You must enter a breed for this animal',[nil]);

         if ( UPPERCASE(AnimalFileByIDSex.Value) <> 'FEMALE' ) then
            begin

               AnimalFileByIDLactNo.Value := 0;

               // SP 16/09/02. Steers must not be used for breeding
               if AnimalFileByIDSex.AsString = 'Steer' then
                  AnimalFileByIDBreeding.AsBoolean := False
               else
                  begin
                     if ( Length(Trim(AnimalFileByIDAnimalNo.AsString)) = 0 ) then
                     if ( AnimalFileByIDBreeding.AsBoolean ) and ( AnimalFileByIDHerdID.AsInteger <> NONEHerdID ) then
                         begin
                            MessageDlg('This animal has been identified as a breeding stock bull.'+cCRLF+cCRLF+
                                       'You must enter an animal number before saving.',mtWarning,[mbOK],0);
                            SysUtils.Abort;
                         end;
                  end;
            end;


         if ( Length(Trim(AnimalFileByIDNatIDNum.AsString)) > 0 ) then
            begin
               AnimalFileByIDSearchNatID.AsString := WinData.StripAllNomNumAlpha(UPPERCASE(AnimalFileByIDNatIDNum.AsString));

               if NatIDKind(AnimalFileByIDNatIDNum.AsString) = nkUK9 then
                  AnimalFileByIDLocateNatID.AsString := UK9NatIDNumber.CreateLocateNatID(AnimalFileByIDNatIDNum.AsString)
               else
                  AnimalFileByIDLocateNatID.AsString := AnimalFileByIDSearchNatID.AsString;
            end;

         // Call the Calving screen only if these rules are active
         InsertCalving := (( AnimalFileByIDSex.AsString = 'Female' ) And
                           ( AnimalFileByIDBreeding.AsBoolean    ) And
                           ( AnimalFileByIDLactNo.AsInteger > 0  ) And
                           // if inserting or editing whilst animal has no events other than NEWID event.
                           (( AnimalFileByID.State = dsInsert ) or ((AnimalFileByID.State = dsEdit) and ( not EventsRecorded(AnimalFileByIDID.AsInteger) ))));
      end; // end of NOT AnimalCalving


   if NeedSequence then
      AnimalFileByIDSeqNo.AsInteger := GetSeqNo(LastHerdID);

   // create NewID event for icbf - 8/12/00 - kr

   if not PurchaseGroupImport then
      begin
         if ( AnimalFileByID.State = dsInsert ) then
            begin
               if ( HerdLookup.GetHerdTypeAsString(AnimalFileByIDHerdID.AsInteger) <> cBeefHerd ) and
                  ( Trim( AnimalFileByIDAnimalNo.Value ) <> '' ) then
                  begin
                     EventType := TNewID;
                     Events.Append;
                     Events.Post;
                  end
            end
         else if ( AnimalFileByID.State = dsEdit ) then
            if ( AnimalFileByIDAnimalNo.OldValue <> AnimalFileByIDAnimalNo.NewValue ) then
               begin
                  EventType := TNewID;
                  Events.Append;
                  Events.Post;
               end;
      end
   else // set the insert calving to false, we do not want to create calving events
        // if we are importing a purchase group file.
      InsertCalving := False;

   if ( (AnimalFileByID.State = dsInsert) and ( UseScanner ) and // SP
        ( AfterEditNatIDType = StylePre1996 ) ) and (AnimalFileByIDDateOfBirth.AsDateTime <= 0) then
      AnimalFileByIDDateOfBirth.AsDateTime := EncodeDate(1996 , 01 , 01);

   if ( AnimalFileByID.State = dsEdit ) then
      begin
         // Check if Changes have been made to NatID or AnimalNo, if so reset the sort fields.
         if AnimalFileByIDAnimalNo.OldValue <> AnimalFileByIDAnimalNo.NewValue then
            begin
               AnimalFileByIDSortAnimalNo.Clear;
               //AnimalFileByIDSortAnimalNo.AsString := InsertZeros(StripAllNomNumAlpha(AnimalFileByIDAnimalNo.AsString), AnimalFileByIDAnimalNo.Size);
               AnimalFileByIDSortAnimalNo.AsString := SortAnimalNoString(AnimalFileByIDAnimalNo.AsString);
            end;

         if AnimalFileByIDNatIDNum.OldValue <> AnimalFileByIDNatIDNum.NewValue then
            begin
               AnimalFileByIDSortNatID.Clear;
               AnimalFileByIDSortNatID.AsString := CreateSortNatIDString(AnimalFileByIDNatIDNum.AsString,AnimalFileByIDHerdID.AsInteger);
            end;

          { BLADE }
          { Set BladeNotified to False where editing of animal has ocurred }
          AnimalFileByIDBladeNotified.Value := False;
      end;
   // reset event flag
   IDEvent := False;
   // Store HerdID
   LastHerdID := AnimalFileByIDHerdID.AsInteger;

   if (( AnimalFileByID.State = dsInsert ) and ( GlobalSettings.AllowDuplicateTags )) then
      begin
         CheckNationalIDRecord := CheckNatIDNumInHerd(AnimalFileByIDNatIDNum.AsString,AnimalFileByIDHerdID.AsInteger);
         if CheckNationalIDRecord.Sold then
            begin
               TempStr := CheckNationalIDRecord.HerdNo;
               if MessageDlg(Format('Animal tag "%s" was previously recorded in herd "%s".'+cCRLFX2+'Do you want to transfer all previous management events to this animal?',[AnimalFileByIDNatIDNum.AsString,CheckNationalIDRecord.HerdNo]),mtConfirmation,[mbYes,mbNo],0) = idYes then
                  begin
                     if ( EventDataTransfer <> nil ) then
                        FreeAndNil(EventDataTransfer);
                     EventDataTransfer := TEventDataTransfer.Create;
                     EventDataTransfer.NewID := WinData.AnimalFileByIDID.AsInteger;
                     EventDataTransfer.OldID := CheckNationalIDRecord.OldAID;
                  end;
            end;
      end;
end;

procedure TWinData.AnimalFileByIDColourChange(Sender: TField);
begin
   DefaultColour := AnimalFileByIDColour.AsInteger;
   CheckRemarks(AnimalFileByID, Sender, GenTypesConst.Colour);
end;

procedure TWinData.AnimalFileByIDPrimaryBreedChange(Sender: TField);
begin
   DefaultBreed := AnimalFileByIDPrimaryBreed.AsInteger;
   CheckRemarks(AnimalFileById, Sender, GenTypesConst.Breed);
end;

procedure TWinData.AnimalFileByIDSexChange(Sender: TField);
begin
   DefaultSex := AnimalFileByIDSex.AsString;
   if AnimalFileByID.State in [dsEdit,dsInsert] then
      begin
         if HerdType = 'Beef' then
            AnimalFileByIDBreeding.AsBoolean := FALSE
         else if ( UPPERCASE(AnimalFileByIDSex.AsString) <> 'STEER' ) then
            AnimalFileByIDBreeding.AsBoolean := TRUE
         else
            AnimalFileByIDBreeding.AsBoolean := FALSE;
      end;

   { Do not prompt user with register remark, if the sex changed is bull to steer or steer to bull } // SP 10/06/08
   if AnimalFileByID.State = dsEdit then
      begin
         if ((AnimalFileByIDSex.OldValue = cSex_Female) and (AnimalFileByIDSex.NewValue <> cSex_Female)) or
            ((AnimalFileByIDSex.OldValue <> cSex_Female) and (AnimalFileByIDSex.NewValue = cSex_Female)) then
            CheckRemarks(AnimalFileByID,Sender, GenTypesConst.Sex)
         else
            CheckRemarks(AnimalFileByID,Sender, GenTypesConst.Sex, False )
      end;
end;

procedure TWinData.AnimalFileByIDBeforeEdit(DataSet: TDataSet);
begin
   SetNatIdRequired;
   OriginalSex := AnimalFileByIDSex.AsString;
   // Clear all the Remarks Field before editing
   fRemarks.RemarksAdded := FALSE;

   if AnimalFileByIDHerdID.AsInteger <> NONEHerdID then
      BeforeEditNatIDType := WhatStyleNatID(AnimalFileByIDNatIDNum.AsString, False)
   else
      BeforeEditNatIDType := StyleUnKnown;
end;

procedure TWinData.AnimalFileByIDDateOfBirthChange(Sender: TField);
var
   sHerdType : String;
begin
   if (( ShowDOBMessage )  and (AnimalFileByID.State = dsInsert )) then
      try
         if ( AnimalFileByIDDateOfBirth.AsDateTime > IncMonth(Date, -3) ) then
            begin
               sHerdType := HerdLookup.GetHerdTypeAsString(AnimalFileByIDHerdID.AsInteger);
               if ( sHerdType <> cBeefHerd ) then
                  MessageDlg('WARNING: This animal is less than three months old.'+#13+
                             'If it originated from an On-farm calving,'+#13+
                             'Please enter it through a Calving Event for the Dam',mtWarning,[mbOK],0);
            end;
      except
      end;
   DefaultDOB := AnimalFileByIDDateOfBirth.AsDateTime;
   CheckRemarks(AnimalFileByID, Sender, GenTypesConst.DOB);
end;

procedure TWinData.AnimalFileByIDAfterScroll(DataSet: TDataSet);
begin
   RemarksOrigAnimalID := AnimalFileByIDID.AsInteger;
   if not (AnimalFileByID.ControlsDisabled) then
      begin
         if AnimalFileByID.State <> dsInsert then
            begin
               CreateAnimalExtRecord;
            end;
      end;
end;

procedure TWinData.AnimalFileByIDAfterCancel(DataSet: TDataSet);
begin
   AnimalFileByIDNatIDNum.EditMask := '';
   NeedSequence := FALSE;
end;

procedure TWinData.AnimalFileByIDAfterInsert(DataSet: TDataSet);
begin
   NeedSequence := TRUE;
   if DefaultSex = 'Steer' then
      AnimalFileByIDBreeding.Value := False
//   else
    //  AnimalFileByIDBreeding.Value := True;
end;

{ End of Animal File Processing }

procedure TWinData.GroupsBeforeDelete(DataSet: TDataSet);
var
   GroupInCurrentRegime : Boolean;
   GroupType : string;
begin
   // Delete all associated records in the GroupLinks Table
   if ( DataSet.FieldByName('GroupType').AsString <> 'Purchase' ) then
      begin
         GenQuery.SQL.Clear;
         GenQuery.SQL.Add('SELECT AnimalID FROM GrpLinks ');
         GenQuery.SQL.Add('WHERE (GroupID=' + DataSet.FieldByName('ID').AsString + ')');
         GenQuery.Open;
         if GenQuery.RecordCount = 0 then
            begin
               if ( GroupType = 'Feed' ) then
                  begin
                     GenQuery.SQL.Clear;
                     GenQuery.SQL.Add('Delete From FeedRegime ');
                     GenQuery.SQL.Add('WHERE (GroupID=' + DataSet.FieldByName('ID').AsString + ')');
                     GenQuery.ExecSQL;
                  end
               else if ( GroupType = 'Sales' ) then
                  begin
                     GenQuery.SQL.Clear;
                     GenQuery.SQL.Add('Update SalesDeaths Set SaleGrps_ID = NULL ');
                     GenQuery.SQL.Add('WHERE (SaleGrps_ID=' + DataSet.FieldByName('ID').AsString + ')');
                     GenQuery.ExecSQL;
                  end;
            end
         else
            begin
               MessageDlg('All animals must be removed from group before deleting.',mtWarning,[mbOK],0);
               SysUtils.Abort;
            end;
      end
   else
      begin
         GenQuery.SQL.Clear;
         GenQuery.SQL.Add('SELECT PurchGroupID FROM PurchGrpHeader');
         GenQuery.SQL.Add('WHERE (PurchGroupID=' + DataSet.FieldByName('ID').AsString + ')');
         GenQuery.Open;
         if GenQuery.RecordCount = 0 then
            begin
               GenQuery.SQL.Clear;
               GenQuery.SQL.Add('DELETE FROM GrpLinks');
               GenQuery.SQL.Add('WHERE (GroupID=' + DataSet.FieldByName('ID').AsString + ')');
               GenQuery.ExecSQL;
            end
         else
            begin
               ShowMessage('Please Delete this Group in the Group Events:Purchases screen first');
               SysUtils.Abort;
            end;
      end;
end;

procedure TWinData.GroupsNewRecord(DataSet: TDataSet);
begin
   GroupsSelected.AsBoolean := FALSE;
   // 09/02/2009 [Dev 3.9 R6.7] /SP Program Change - Default new groups to "Batch" GroupType.
   GroupsGroupType.AsString := cBatchGroup;
end;

procedure TWinData.GroupsBeforePost(DataSet: TDataSet);
begin
   if (Length(Trim(GroupsCode.AsString)) <= 0) then
      begin
         MessageDlg('You must enter a Group Code.',mtInformation,[mbOK],0);
         SysUtils.Abort;
      end;

   if (Length(Trim(GroupsDescription.AsString)) <= 0) then
      begin
         MessageDlg('You must enter a Group Description.',mtInformation,[mbOK],0);
         SysUtils.Abort;
      end;

   if (Length(Trim(GroupsGroupType.AsString)) <= 0) then
      begin
         MessageDlg('You must enter a Group Type.',mtInformation,[mbOK],0);
         SysUtils.Abort;
      end;

  // if DataSet.State = dsInsert then
  //    begin
         GenQuery.Close;
         GenQuery.SQL.Clear;
         GenQuery.SQL.Add('SELECT Code, GroupType, ID FROM ' + Groups.TableName);
         // Incase you are adding a Group the ID isn't assigned until you SAVE/POST the
         // Record, so DO NOT test using where clause
         if NOT ( GroupsID.IsNull ) then
            GenQuery.SQL.Add('WHERE ID <> ' + GroupsID.AsString);
         GenQuery.Open;
         if GenQuery.Locate('Code;GroupType',VarArrayOf([GroupsCode.AsString,GroupsGroupType.AsString]),[]) then
            raise ErrorMsg.CreateFmt('Group Code already in use. Change group code to make it unique.',[nil]);
         GenQuery.Close;
         // Now code is unique, can allow it to be recorded - but if changing a Code for a
         // Purchase Group that has a PurchGrpHeader record, need to modify the Code in this
         // record. If PurchGrpHeader is to exist then GroupsID is not Null
         if NOT ( GroupsID.IsNull ) then
            begin
               // Now to update the Code field in the appropriate record in the tPurchGrpHeader table.
               GenQuery.SQL.Clear;
               GenQuery.SQL.Add('UPDATE "PurchGrpHeader.db" SET PurchGrpCode = "' + GroupsCode.AsString + '"');
               GenQuery.SQL.Add('WHERE PurchGroupID = ' + GroupsID.AsString);
               GenQuery.ExecSQL;
               GenQuery.Close;
            end;
   //   end;
end;

function TWinData.GetNoInGroup : Integer;
begin
   try
      Result := 0;
      if NOT WinData.Groups.FieldByName('ID').IsNull then
         begin
            GenQuery.SQL.Clear;
            GenQuery.SQL.Add('SELECT COUNT(AnimalID) CA FROM GrpLinks');
            GenQuery.SQL.Add('WHERE (GroupID = ' + WinData.Groups.FieldByName('ID').AsString + ')');
            GenQuery.Open;
            if NOT GenQuery.IsEmpty then
               Result := GenQuery.FieldByName('CA').AsInteger;
         end;
   finally
      GenQuery.Close;
   end;
end;

function TWinData.GetSelected : Integer;
begin
   try
      Result := 0;
      if NOT WinData.Groups.FieldByName('ID').IsNull then
         begin
            GenQuery.SQL.Clear;
            GenQuery.SQL.Add('SELECT COUNT(G.AnimalID) CA');
            GenQuery.SQL.Add('FROM GrpLinks G, AFilters A');
            GenQuery.SQL.Add('WHERE (G.GroupID = ' + WinData.Groups.FieldByName('ID').AsString + ')');
            GenQuery.SQL.Add('AND   (G.AnimalID = A.AID)');
            GenQuery.Open;
            if NOT GenQuery.IsEmpty then
               Result := GenQuery.FieldByName('CA').AsInteger;
         end;
   finally
      GenQuery.Close;
   end;
end;

procedure TWinData.GroupsAfterScroll(DataSet: TDataSet);
begin
//   NoInGroup;
//   Selected;
end;

function TWinData.ActiveMovements ( AnimalID, HerdID : Integer; ANo, NatIdNo : String;
  MoveToRecord : Boolean; AllowUserChange : Boolean = True ) : Boolean;
var
   TempBool : Boolean;
begin
   try
      TempBool := FALSE;
      luMovements.Open;
      if CheckEvents.Locate('AnimalID;EventType', VarArrayOf([AnimalID,CMovementEvent]), [] ) then
          if luMovements.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[] ) then
             TempBool := luMovements.FieldByName('StillOffFarm').AsBoolean;
      if ( TempBool And MoveToRecord ) then
         // Attempt to Shift to the Event
         Events.Locate('ID',WinData.CheckEvents.FieldByName('ID').AsInteger,[] )
      else if TempBool then
         begin
            // Get the Animal No, NatId
            if NOT LookUpDamSire.Locate('ID',AnimalID,[] ) then
               MessageDLG('Animal has an Active Temporary Movement',mtWarning,[mbOK],0)
            else
               MessageDLG('Animal No ' + ANo +
                ' National ID ' + NatIdNo + ' has an Active Temporary Movement',mtWarning,[mbOK],0);
         end;
      // Check the Animal isn;t in the NONE herd
      if NOT TempBool then
         begin
             if ( HerdID = WinData.NONEHerdID ) then
                begin
                   TempBool := TRUE;
                   MessageDLG('Animal No ' + ANo +
                        ' National ID ' + NatIDNo + ' is an off Farm Animal',mtWarning,[mbOK],0);
                end;
          end;
   finally
      Result := TempBool;
      luMovements.Close;
      { Revised SP 9.5 Xmas Release 22/12/2003 }
      if (Result) and (AllowUserChange) then
         { if User wants to proceed set result = false }
         Result := not (MessageDlg('Do you want to proceed with the event?',mtConfirmation,[mbYes,mbNo],0) = IdYes);
   end;
end;

procedure TWinData.SaleDeathBeforePost(DataSet: TDataSet);
var
   KillOutPerc : Double;
begin
   // If its NOT a PreSale
   if NOT WinData.IsItPreSale then
      begin
         // Check the Sale and Cold Dead weight if either is 0 copy the other into it
         if ( SaleDeathWeight.AsFloat <= 0 ) then
            begin
               if ( SaleDeathColdDeadWt.AsFloat > 0 ) then
                  begin
                     //DataSet.FieldByName('Weight').AsFloat := DataSet.FieldByName('ColdDeadWt').AsFloat
                     try
                        KillOutPerc := HerdLookup.GetKillOutPerc(EventsAnimalID.AsInteger);
                        if KillOutPerc > 0 then
                           begin
                              SaleDeathKillOut.AsFloat := KillOutPerc;
                              SaleDeathWeight.AsFloat := Round(((SaleDeathColdDeadWt.AsFloat * 100) / KillOutPerc));
                           end;
                     except
                     end;
                  end;
            end;
         //else if ( SaleDeathColdDeadWt.AsFloat <= 0 ) then
         //   SaleDeathColdDeadWt.AsFloat := SaleDeathWeight.AsFloat;
      end;

   try
      SaleDeathNIDeathNotify.AsBoolean := FALSE;
   except
   end;

   if WinData.Customers.Locate('ID', SaleDeathCustomer.AsInteger,[]) then
      SaleDeathNotified.AsBoolean := not WinData.Customers.FieldByName('CMMSForms').AsBoolean
end;

procedure TWinData.EventsEventDateValidate(Sender: TField);
begin
   if (Sender as TField).AsDateTime = 0 then
      raise ErrorMsg.CreateFmt('%s is not a valid Date',[(Sender as TField).AsString])
   else
      // allow future premium dates
      if NOT (EventType in [TPremium10,TPremium22,TPremiumBull]) then
         // added 27/3/00 to allow future pre-sale date
         if NOT ((EventType in [TSaleDeath])and(IsItPreSale=True)) then
            if (Sender as TField).AsDateTime > Now() then
               raise ErrorMsg.CreateFmt('Date entered %s cannot be after Today %s',[FormatDateTime(cIrishDateStyle,(Sender as TField).AsDateTime),FormatDateTime(cIrishDateStyle,Now())]);
end;

procedure TWinData.ServicesBeforePost(DataSet: TDataSet);
begin
   ServiceBullID := DataSet.FieldByName('ServiceBull').AsInteger;
   ServiceBullNoStraws := DataSet.FieldByName('AmountOfStraw').AsFloat;
end;

procedure TWinData.ServicesAfterPost(DataSet: TDataSet);
begin
   try
      if ( ServiceBullID > 0 ) And ( ServiceBullNoStraws > 0 ) then
         with GenQuery do
            begin
               SQL.Clear;
               SQL.Add('UPDATE ' + tBullSemen.TableName);
               SQL.Add('SET OpeningSemen=(OpeningSemen-' + FloatToStr(ServiceBullNoStraws) + ')');
               SQL.Add('WHERE (AnimalID=' + IntToStr(ServiceBullID) + ')');
               ExecSQL;
            end;
   except
      //
   end;
end;

procedure TWinData.tBullSemenBeforePost(DataSet: TDataSet);
begin
   if DataSet.FieldByName('SemenStrawsAdded').AsFloat <> 0 then
      DataSet.FieldByName('OpeningSemen').AsFloat := DataSet.FieldByName('OpeningSemen').AsFloat +
                                                     DataSet.FieldByName('SemenStrawsAdded').AsFloat;
   if DataSet.FieldByName('SemenStrawSales').AsFloat <> 0 then
      DataSet.FieldByName('OpeningSemen').AsFloat := DataSet.FieldByName('OpeningSemen').AsFloat -
                                                     DataSet.FieldByName('SemenStrawSales').AsFloat;
   DataSet.FieldByName('SemenStrawSales').AsFloat := 0;
   DataSet.FieldByName('SemenStrawsAdded').AsFloat := 0;
end;

procedure TWinData.AnimalFileByIDTBTestDateValidate(Sender: TField);
begin
    if (Sender as TField).AsDateTime <> 0 then
       if AnimalFileByIDDateOfBirth.AsDateTime <> 0 then
          if AnimalFileByIDDateOfBirth.AsDateTime > (Sender as TField).AsDateTime then
             raise ErrorMsg.CreateFmt('TB Test Date %s is before Date of Birth %s',
                 [(Sender as TField).AsString,AnimalFileByIDDateOfBirth.AsString]);
end;

function TWinData.UpdateMilkDiskRecords : Boolean;
var
   Trans,
   MyTable : TTable;
   MyQuery : TQuery;
   MyGauge : TProgressBar;
begin
   try
       RESULT := FALSE;
       MyTable := TTable.Create(nil);
       MyTable.DatabaseName := KingData.DatabaseName;
       MyTable.TableName := MilkCumulative.TableName;

       Trans := TTable.Create(nil);
       Trans.DatabaseName := KingData.DatabaseName;
       Trans.TableName := MilkCumulative.TableName;

       MyGauge := TProgressBar.Create(nil);
       MyGauge.Parent := Screen.ActiveForm;
       MyGauge.Align := alBottom;

       MyQuery := TQuery.Create(nil);
       MyQuery.DatabaseName := KingData.DatabaseName;

       MyTable.Open;

       MyGauge.Max := MyTable.RecordCount;
       MyGauge.Height := 50;
       MyGauge.Enabled := TRUE;
       MyGauge.Step := 1;
       MyGauge.Show;
       MyGauge.ReFresh;
       Screen.ActiveForm.Refresh;

       while NOT (MyTable.EOF) do
          begin
             MyQuery.Close;
             MyQuery.SQL.Clear;
             MyQuery.SQL.Add('SELECT CumYield, CumBFatPerc, CumProtPerc,');
             MyQuery.SQL.Add('Yield305, BFat305Perc, Prot305Perc, DaysInMilk FROM MilkDiskTrans M, Animals A');
             MyQuery.SQL.Add('WHERE (M.AnimalID=' + MyTable.FieldByName('AnimalID').AsString + ')');
             MyQuery.SQL.Add('AND   (M.LactNo=' + MyTable.FieldByName('LactNo').AsString + ')');
             MyQuery.SQL.Add('AND   (M.AnimalID=A.ID)');
             MyQuery.SQL.Add('AND   (M.LactNo<>A.LactNo)');
             MyQuery.SQL.Add('ORDER BY M.CumYield Desc');
             MyQuery.Open;
             if NOT MyQuery.IsEmpty then
                begin
                    MyTable.Edit;
                    MyTable.FieldByName('CumYield').AsFloat := MyQuery.FieldByName('CumYield').AsFloat;
                    MyTable.FieldByName('CumBFatPerc').AsFloat := MyQuery.FieldByName('CumBFatPerc').AsFloat;
                    MyTable.FieldByName('CumProtPerc').AsFloat := MyQuery.FieldByName('CumProtPerc').AsFloat;
                    MyTable.FieldByName('Yield305').AsFloat := MyQuery.FieldByName('Yield305').AsFloat;
                    MyTable.FieldByName('BFatPerc305').AsFloat := MyQuery.FieldByName('BFat305Perc').AsFloat;
                    MyTable.FieldByName('ProtPerc305').AsFloat := MyQuery.FieldByName('Prot305Perc').AsFloat;
                    MyTable.FieldByName('DaysInMilk').AsFloat := MyQuery.FieldByName('DaysInMilk').AsFloat;
                end;
             MyTable.Next;
             MyGauge.StepIt;
          end;
       RESULT := TRUE;
   finally
       MyTable.Free;
       Trans.Free;
       MyQuery.Free;
       MyGauge.Free;
   end;
end;

// National ID processing
procedure TWinData.AnimalFileByIDNatIDNumSetText(Sender: TField;
  const Text: String);
var
   UpperTxt,
   FormattedStr : String;
begin
   UpperTxt := Text;

   if HerdSpecies = cSpecies_Bovine then
      begin
         if NOT WinData.CheckNatID(UpperTxt, FormattedStr,TRUE) then   //Checks for a valid NatID Number format
            raise ErrorMsg.CreateFmt(cInvalid_NatIdNo,[nil])
         else if ( NatIDKind(UpperTxt) = nkUK9) then
            begin
               { 13/11/2009 - ROI User scanning NI Tags (UK9) came into difficultly }
               {              when the program was validating a scanned barcode UK913245612341  }
               {              The UK9NatIDNumber.validate routines requires the tag to have  }
               {              Preinserted spaces. This is to allow the UK9NatIDNumber.validate }
               {              routine to distinguish between the HerdNo, BarNo and Check Digit. }
               {              Because the scanned barcode does not contain spaces the routine returned }
               {              false. To get around this problem, do not validate if barcode Scanner is    }
               {              being used and Nat Id format = free format.    }
               if UK9NatIDNumber.validate(UpperTxt) then
                  begin
                     (Sender as TField).EditMask := '';
                     (Sender as TField).AsString := UK9NatIDNumber.FormattedNatID;
                  end
               else
                  begin
                     if ((DefaultNatIDMask <> '') and not ( UseScanner )) then
                        raise ErrorMsg.CreateFmt(cInvalid_NatIdNo,[nil])
                     else
                        (Sender as TField).AsString := Text;
                  end;
            end
         else
            begin
               (Sender as TField).AsString := FormattedStr;
                AfterEditNatIDType := WhatStyleNatID(WinData.AnimalFileByIDNatIDNum.AsString, False);
            end;

      {  Copy NatIDNum / AnimalNo
         try
            if ( AnimalFileByIDAnimalNo.IsNull ) and ( GlobalSettings.NatIDToAnimalNo ) then
               if WhatStyleNatID(UpperTxt, False) = Style1999 then
                  begin
                     FormattedStr := StripAllSpaces(FormattedStr);
                     FormattedStr := Copy(FormattedStr, Length(FormattedStr)-3, 4);
                     AnimalFileByIDAnimalNo.AsString := FormattedStr;
                  end;
         except
         end; }
      end
   else
      begin
         if not CaprineTag.ValidateTag( UpperTxt ) then
            raise  ErrorMsg.CreateFmt('Invalid Goat Tag Entered',[nil]);
         (Sender as TField).AsString := Text;
      end
end;

procedure TWinData.AnimalFileByIDNatIDNumValidate(Sender: TField);
var
   TempStr,
   MyStr : String;
   CurrentHerd : String;
   CheckNationalIDRecord : TCheckNationalIDRecord;
begin
     TempStr := (Sender as TField).AsString;
     TempStr := StripAllSpaces(TempStr);
     if Length(TempStr) > 0 then
        begin
           if GlobalSettings.AllowDuplicateTags then
              begin
                 // To allow multiple Animals in herd. Check if currently in Herd.
                 CheckNationalIDRecord := CheckNatIDNumInHerd((Sender as TField).AsString,AnimalFileByIDHerdID.AsInteger);
                 if CheckNationalIDRecord.InHerd then
                    begin
                       MessageDlg(Format('Cannot save animal details.'+cCRLFX2+'This animal "%s" is currently in herd "%s"',[(Sender as TField).AsString,CheckNationalIDRecord.HerdNo]),mtInformation,[mbOK],0);
                       SysUtils.Abort;
                    end
                 {else if CheckNationalIDRecord.Sold then
                    begin
                       if MessageDlg(Format('Animal tag "%s" was previously recorded in herd "%s".'+cCRLFX2+'Do you want to transfer all previous management events'+#13#10+
                                  'to this animal?',[(Sender as TField).AsString,CheckNationalIDRecord.Herd]),mtConfirmation,[mbYes,mbNo],0) = idYes then
                          begin
                             if ( EventDataTransfer <> nil ) then
                                FreeAndNil(EventDataTransfer);
                             EventDataTransfer := TEventDataTransfer.Create;
                             EventDataTransfer.NewID := WinData.AnimalFileByIDID.AsInteger;
                             EventDataTransfer.OldID := CheckNationalIDRecord.OldAID;
                          end;
                    end;}
              end
           else
              begin
                 if CheckForAnimal((Sender as TField).AsString,'I') = Entered then
                    raise ErrorMsg.CreateFmt('National ID %s already in use',[(Sender as TField).AsString])
                 else
                    if ( LookUpDamSire.Locate('NatIDNum', (Sender as TField).AsString, [] )) then
                       if ( LookUpDamSire.FieldByName('ID').AsInteger <> AnimalFileByIDID.AsInteger ) then
                          raise ErrorMsg.CreateFmt('National ID %s already entered',[(Sender as TField).AsString]);
              end;
        end
     else if ( AnimalFileByIDHerdID.AsInteger <> NONEHerdID ) then
        begin
           if AnimalFileByIDNatIDNum.IsNull then
              raise ErrorMsg.CreateFmt('National ID must be entered',[nil]);
        end;

     // Before Posting the record insert the Animal No into the SortAnimalNo
     // Check the Table is in an editable mode as CheckAnimal can change this
     if ( AnimalFileByID.State in dsEditModes ) then
        begin
           MyStr := AnimalFileByIDNatIDNum.AsString;
           AnimalFileByIDSortNatId.AsString := CreateSortNatIDString(MyStr, AnimalFileByIDHerdID.AsInteger);
        end;
end;
// End of National ID processing

procedure TWinData.AnimalFileByIDNatIDNumChange(Sender: TField);
begin
   if NOT RetaggingAnimal then
      CheckRemarks(AnimalFileByID, Sender, GenTypesConst.NatID);
end;

// Check and Validate Herd ID after change
procedure TWinData.AnimalFileByIDHerdIDChange(Sender: TField);
begin
   DefaultHerd := AnimalFileByIdHerdID.AsInteger;
   CheckRemarks(AnimalFileByID, Sender, GenTypesConst.rHerdID);
   // If the Animal is being save into the NONE herd the National ID is not required
   SetNatIDRequired;
end;
// End Check and Validate Herd ID

procedure TWinData.AnimalFileByIDDamIDValidate(Sender: TField);
begin
   if (Sender as TField).AsInteger > 0 then
      if ((Sender as TField).AsInteger = WinData.AnimalFileByIDID.Value) then
         raise ErrorMsg.CreateFmt('Animal cannot be its own Dam',[nil]);
end;

procedure TWinData.AnimalFileByIDSireIDValidate(Sender: TField);
begin
   if (Sender as TField).AsInteger > 0 then
      if ((Sender as TField).AsInteger = WinData.AnimalFileByIDID.Value) then
         raise ErrorMsg.CreateFmt('Animal cannot be its own Sire',[nil]);
end;

// checking Animal Number
procedure TWinData.AnimalFileByIDAnimalNoValidate(Sender: TField);
begin
   if NOT (Sender as TField).IsNull then
      if CheckForAnimal((Sender as TField).AsString,'N') = Entered then
         raise ErrorMsg.CreateFmt('Animal No. already in use',[nil]);
   // Before Posting the record insert the Animal No into the SortAnimalNo
   // Check State because CheckForAnimal Can UnDelete an Animal
   if (AnimalFileByID.State in dsEditModes) then
//      AnimalFileByIDSortAnimalNo.AsString := InsertZeros(StripAllNomNumAlpha(AnimalFileByIDAnimalNo.AsString), AnimalFileByIDAnimalNo.Size );
      AnimalFileByIDSortAnimalNo.AsString := SortAnimalNoString(AnimalFileByIDAnimalNo.AsString);

end;
// End checking Animal Number

procedure TWinData.AnimalFileByIDHerdBookNoValidate(Sender: TField);
begin

   if not GlobalSettings.AllowDuplicateTags then
      if CheckForAnimal((Sender as TField).AsString,'H') = Entered then
         raise ErrorMsg.CreateFmt('HerdBook No. already in use',[nil]);
end;

procedure TWinData.SetNatIdRequired;
begin
   // If the Animal is being save into the NONE herd the National ID is not required
   if (AnimalFileByIDHerdID.AsInteger = NONEHerdID)Or
      (DeletingAnimal) or (CalvingAnimal)  then
      AnimalFileByIDNatIDNum.Required := FALSE
   else
      AnimalFileByIDNatIDNum.Required := TRUE;
end;

procedure TWinData.AnimalFileByIDAfterEdit(DataSet: TDataSet);
begin
   SetNatIdRequired;
end;

{ Calving Event Calf NatID Checks }
procedure TWinData.TempCalvingNatIDSetText(Sender: TField; const Text: String);
var
   UpperTxt,
   FormattedStr : String;
   HerdIdentifier : string;
   nPos : Integer;
begin
   UpperTxt := Text;

   if HerdSpecies = cSpecies_Bovine then
      begin
         if NOT WinData.CheckNatID(UpperTxt, FormattedStr, TRUE) then   //Checks for a valid NatID Number format
            begin
               raise ErrorMsg.CreateFmt(cInvalid_NatIdNo,[nil]);
            end
         else if ( IsNINatID(UpperTxt)) then
            begin
               if not( CheckNINatID( UpperTxt, FormattedStr ) ) then
                  raise ErrorMsg.CreateFmt(cInvalid_NatIdNo,[nil])
               else
                  begin
                     (Sender as TField).EditMask := '';
                     (Sender as TField).AsString := FormattedStr;
                  end;
            end
         else
            (Sender as TField).AsString := FormattedStr;

         // Copy part NatIDNum to AnimalNo
       try
            if ( TempCalvingCalfNo.IsNull ) and ( GlobalSettings.NatIDToAnimalNo ) then
               begin
                  if WhatStyleNatID(UpperTxt, False) = Style1999 then
                     begin
                        FormattedStr := StripAllSpaces(FormattedStr);
                        FormattedStr := Copy(FormattedStr, Length(FormattedStr)-3, 4);
                        TempCalvingCalfNo.AsString := FormattedStr;
                     end
                  else if  ( IsNINatID(UpperTxt)) then
                     begin
                        if OwnerFile.Locate('ID', AnimalFileByIDHerdID.AsInteger,[ ]) then
                           begin
                              FormattedStr := StripAllSpaces(FormattedStr);
                              HerdIdentifier := OwnerFileHerdIdentifier.AsString;
                              if HerdIdentifier <>'' then
                                 begin
                                    nPos := Pos(HerdIdentifier,FormattedStr);
                                    if nPos > 0 then
                                       begin
                                          FormattedStr := Copy(FormattedStr, nPos+Length(HerdIdentifier), MaxInt);
                                          if Length(FormattedStr) > 0 then
                                             begin
                                                Delete(FormattedStr, Length(FormattedStr), 1);
                                                TempCalvingCalfNo.AsString := FormattedStr;
                                             end;
                                       end;
                                 end;
                           end;
                     end;
               end;
         except
            on e : exception do
               begin
                  if e.message = 'Animal No. already entered' then
                     begin
                        MessageDlg(Format('The program generated calf number "%s" cannot be used.'+cCRLF+
                                   'Calf number "%s" is already in use.',[FormattedStr,FormattedStr]), mtInformation,[mbOK],0);
                     end;
               end;
         end;
      end
   else
      begin
         if not CaprineTag.ValidateTag( UpperTxt ) then
            raise  ErrorMsg.CreateFmt('Invalid Goat Tag Entered',[nil]);
         (Sender as TField).AsString := Text;
      end;
end;

procedure TWinData.TempCalvingNatIDValidate(Sender: TField);
var
   TempStr : String;
begin
   // Only check if user is Adding a Calving Event
   // Otherwise if they are amending the Animal WILL exist in the Animals Table
   if EventStatus in [EAdding,EAddingAtSetUp] then
      begin
         TempStr := (Sender as TField).AsString;

         if ( Length(TempStr) > 0 ) and ( LookUpDamSire.Locate('NatIDNum;HerdID;AnimalDeleted', VarArrayOf([TempStr,Null,True]),[])) then
            begin
               // We might have a calf who has been orphaned due to Delete Calving Facility.
               // We have found NatIDNum, and animal is marked as deleted.
               // lets now determine if animal was actually deleted from calving event.
               with TQuery.Create(nil) do
                  try
                     Databasename := AliasName;

                     SQL.Clear;
                     SQL.Add('Select EventID From DeletedCalvings ');
                     SQL.Add('Where ( CalfID1 = :CID ) ');
                     SQL.Add('or ( CalfID2 = :CID )    ');
                     SQL.Add('or ( CalfID3 = :CID )    ');
                     SQL.Add('or ( CalfID4 = :CID )    ');
                     Params.ParamByName('CID').AsInteger := LookUpDamSire.FieldByName('ID').AsInteger;
                     Open;

                     if FieldByName('EventID').AsInteger > 0 then
                        begin
                           if MessageDlg('NOTE: This calf record already exists in the database. '+ ^j +
                                         'Do you want to use this calf''s details?',mtInformation,[mbYes,mbNo],0) = idYes then
                              begin
                                 if not ( LookUpDamSire.FieldByName('ID').IsNull ) then
                                    TempCalvingCalfID.Value := LookUpDamSire.FieldByName('ID').Value;
                                 if not ( LookUpDamSire.FieldByName('AnimalNo').IsNull ) then
                                    TempCalvingCalfNo.Value := LookUpDamSire.FieldByName('AnimalNo').Value;
                                 if not ( LookUpDamSire.FieldByName('PrimaryBreed').IsNull ) then
                                    TempCalvingBreed.Value := LookUpDamSire.FieldByName('PrimaryBreed').Value;
                                 if not ( LookUpDamSire.FieldByName('Sex').IsNull ) then
                                    TempCalvingSex.Value := LookUpDamSire.FieldByName('Sex').Value;
                                 if not ( LookUpDamSire.FieldByName('Colour').IsNull ) then
                                    TempCalvingColour.Value := LookUpDamSire.FieldByName('Colour').Value;
                                 if not ( LookUpDamSire.FieldByName('Name').IsNull ) then
                                    TempCalvingName.Value := LookUpDamSire.FieldByName('Name').Value;
                                 if not ( LookUpDamSire.FieldByName('BirthWeight').IsNull ) then
                                    TempCalvingBirthWeight.Value := LookUpDamSire.FieldByName('BirthWeight').Value;
                                 if not ( LookUpDamSire.FieldByName('HerdID').IsNull ) then
                                    TempCalvingHerdID.Value := WinData.AnimalFileByIDHerdID.AsInteger;
                                 if not ( LookUpDamSire.FieldByName('InHerd').IsNull ) then
                                    TempCalvingCalfDead.Value := not ( LookUpDamSire.FieldByName('InHerd').Value );
                                 if ( LookUpDamSire.FieldByName('SireID').Value > 0 ) then
                                    LastBull := LookUpDamSire.FieldByName('SireID').Value;
                              end;
                        end;
                  finally
                     Free;
                     // Rollback newly created tag number
                     RollbackTagAutoGenNumber;
                  end;
            end
        else

           begin

              if Length(TempStr) > 0 then
               if ( LookUpDamSire.Locate('NatIDNum', (Sender as TField).AsString, [] ) ) or
                 (( LookUpTempCalving.Locate('NatID', (Sender as TField).AsString, [] )) And
                  ( TempCalvingID.AsInteger <> LookUpTempCalving.FieldByName('ID').AsInteger )) then
                    if ActivePDAEvents then   // Do not raise exception if creating from PDA Calving.
                       MessageDlg('National ID already entered',mtError,[mbOK],0)
                    else
                       raise ErrorMsg.CreateFmt('National ID already entered',[nil]);
           end
      end;
end;

{ END Calving Event Calf NatID Checks }

{ Calving Event Calf no Checks }
procedure TWinData.TempCalvingCalfNoValidate(Sender: TField);
var
   TempStr : String;
   RecLocated : Boolean;
begin
   // Only check if user is Adding a Calving Event
   // Otherwise if they are amending the Animal WILL exist in the Animals Table
   if not ActivePDAEvents then // Do not raise exception if creating from PDA Calving.
      begin

         if EventStatus in [EAdding,EAddingAtSetUp] then
            begin
               TempStr := (Sender as TField).AsString;
               if Length(TempStr) > 0 then
                  begin
                     RecLocated := ( LookUpDamSire.Locate('AnimalNo;HerdID', VarArrayOf([(Sender as TField).AsString,TempCalvingHerdID.AsVariant]), [] ));
                     if RecLocated or
                        (( LookUpTempCalving.Locate('CalfNo', (Sender as TField).AsString, [] )) And
                           ( TempCalvingID.AsInteger <> LookUpTempCalving.FieldByName('ID').AsInteger )) then
          //                 if ActivePDAEvents then // Do not raise exception if creating from PDA Calving.
            //                  MessageDlg(Format('Animal No. "%s" already entered',[TempStr]),mtError,[mbOK],0)
              //             else
                              raise ErrorMsg.CreateFmt('Animal No. already entered',[nil]);
                  end;
            end;
      end;
end;
{ END Calving Event Calf no Checks }

function TWinData.SetButtonColour : TColor;
begin
   RESULT := clBlack;
   if (DefaultNatIdMaskIndex <> 4) then
      RESULT := clRed;
end;

procedure TWinData.OwnerFileMilkRecordingIDValidate(Sender: TField);
begin
   if NOT (Sender as TField).IsNull then
      begin
         GenQuery.Close;
         GenQuery.SQL.Clear;
         GenQuery.SQL.Add('SELECT ID, MilkRecordingID FROM ' + OwnerFile.TableName);
         GenQuery.Open;
         if GenQuery.Locate('MilkRecordingID',(Sender as TField).AsString,[]) then
            if GenQuery.FieldByName('ID').AsInteger <> OwnerFileID.asInteger then
               raise ErrorMsg.CreateFmt('Milk disk ID already in use',[nil]);
         GenQuery.Close;
      end;
end;

procedure TWinData.GroupsCodeValidate(Sender: TField);
begin
   if (Sender as TField).IsNull then
      raise ErrorMsg.CreateFmt('Group Code is required',[nil]);
end;

procedure TWinData.GroupsGroupTypeValidate(Sender: TField);
begin
   if NOT (Sender as TField).IsNull then
      begin
         if NOT (((Sender as TField).AsString = 'Purchase') Or ((Sender as TField).AsString = 'Sales') Or
                 ((Sender as TField).AsString = 'Batch') Or ((Sender as TField).AsString = 'Pen') Or
                 ((Sender as TField).AsString = 'Feed')) then
            raise ErrorMsg.CreateFmt('Type %s is not a valid Group type',[(Sender as TField).AsString]);
      end
   else
      raise ErrorMsg.CreateFmt('Group Type is required',[nil]);
end;

procedure TWinData.SuppliersNewRecord(DataSet: TDataSet);
begin
   // Set these to TRUE for a NEW record
   SuppliersFeedSupplier.AsBoolean     := TRUE;
   SuppliersMedicineSupplier.AsBoolean := TRUE;
   SuppliersAnimalSupplier.AsBoolean   := TRUE;
   SuppliersBladeNotified.Value := False;
end;

function TWinData.GetRetensionDate(ApplicDate: TDateTime; PremTypes : TTable) : TDateTime;
var
   NoOfMonths : Integer;
begin
   NoOfMonths := WinData.GetNoMonthsOrDaysForPrem(PremTypes,D,F);
   // Add 1 Day to the Date pass to ensure the animal is 1 day over x months
   RESULT     := IncMonth(ApplicDate+1, NoOfMonths);
end;

procedure TWinData.MedicineDrugCodeValidate(Sender: TField);
begin
   if (Sender as TField).IsNull then
       raise ErrorMsg.CreateFmt('Medicine Code is Required',[nil])
   else
      begin
         with GenQuery do
            begin
               SQL.Clear;
               SQL.Add('SELECT DrugCode FROM ' + Medicine.TableName);
               SQL.Add('WHERE UPPER(DrugCode) = "' + UPPERCASE((Sender as TField).AsString) + '"');
               if NOT ( dsMedicine.DataSet.FieldByName('ID').IsNull ) then
                  SQL.Add('AND ID <> ' + dsMedicine.DataSet.FieldByName('ID').AsString);
               Open;
            end;
         if GenQuery.RecordCount > 0 then
            raise ErrorMsg.CreateFmt('Medicine Code %s is already in use',[(Sender as TField).AsString]);
      end;
end;

procedure TWinData.MedicineNameValidate(Sender: TField);
begin
   if (Sender as TField).IsNull then
       raise ErrorMsg.CreateFmt('Medicine Name is Required',[nil]);
end;

procedure TWinData.SuppliersBeforeDelete(DataSet: TDataSet);
begin
   try
      LookUpPurchases.Open;
      // Check the Supplier isn't being used by any records
      if LookUpPurchases.Locate('Supplier',DataSet.FieldByName('ID').AsInteger,[]) then
         begin
            MessageDLG('Supplier is in use - cannot delete',mtwarning,[mbOK],0);
            SysUtils.Abort;  // Cancel the Deletion
         end;
   except
      SysUtils.Abort;
   end;
end;

procedure TWinData.CustomersBeforeDelete(DataSet: TDataSet);
begin
   try
      LookUpSaleDeath.Open;
      // Check the Customer isn't being used by any records
      if LookUpSaleDeath.Locate('Customer',DataSet.FieldByName('ID').AsInteger,[]) then
         begin
            MessageDLG('Customer is in use - cannot delete',mtwarning,[mbOK],0);
            SysUtils.Abort;  // Cancel the Deletion
         end;
   except
       SysUtils.Abort;
   end;
end;

procedure TWinData.BuyersBeforeDelete(DataSet: TDataSet);
begin
   try
      LookUpPurchases.Open;
      // Check the Buyer isn't being used by any records
      if LookUpPurchases.Locate('Buyer',DataSet.FieldByName('ID').AsInteger,[]) then
         begin
            MessageDLG('Buyer is in use - cannot delete',mtwarning,[mbOK],0);
            SysUtils.Abort;  // Cancel the Deletion
         end;
   except
       SysUtils.Abort;
   end;
end;

procedure TWinData.BreedsNewRecord(DataSet: TDataSet);
begin
   // Mark as NOT eligible
   BreedsEligibleforPremium.AsBoolean := FALSE;
   // Set synch to PDA
   BreedsInUse.AsBoolean := TRUE;
end;

procedure TWinData.BreedsCodeValidate(Sender: TField);
begin
   if (Sender as TField).IsNull then
       raise ErrorMsg.CreateFmt('Breed Code is Required',[nil])
   else
      begin
         with GenQuery do
            begin
               SQL.Clear;
               SQL.Add('SELECT Code FROM ' + Breeds.TableName);
               SQL.Add('WHERE UPPER(Code) = "' + UPPERCASE((Sender as TField).AsString) + '"');
               if NOT ( BreedsSource.DataSet.FieldByName('ID').IsNull ) then
                  SQL.Add('AND ID <> ' + BreedsSource.DataSet.FieldByName('ID').AsString);
               Open;
            end;
         if GenQuery.RecordCount > 0 then
            raise ErrorMsg.CreateFmt('Breed Code %s is already in use',[(Sender as TField).AsString]);
      end;
end;

procedure TWinData.CustomersEditStatusGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
   if Customers.State = dsInsert then
      Text := cCustNameInsert
   else if Customers.State <> dsCalcFields then
      Text := cCustNameEdit;
end;

procedure TWinData.SuppliersEditStatusGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
   if Suppliers.State = dsInsert then
      Text := cSuppNameInsert
   else if Suppliers.State <> dsCalcFields then
      Text := cSuppNameEdit;
end;

procedure TWinData.BreedsEditStatusGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
   if Breeds.State = dsInsert then
      Text := cBreedCodeInsert
   else if Breeds.State <> dsCalcFields then
      Text := cBreedCodeEdit;
end;

procedure TWinData.UnitsUnitCodeValidate(Sender: TField);
begin
   if (Sender as TField).IsNull then
       raise ErrorMsg.CreateFmt('Unit Code is Required',[nil])
   else
      begin
         with GenQuery do
            begin
               SQL.Clear;
               SQL.Add('SELECT UnitCode FROM ' + Units.TableName);
               SQL.Add('WHERE UPPER(UnitCode) = "' + UPPERCASE((Sender as TField).AsString) + '"');
               if NOT ( dsUnits.DataSet.FieldByName('ID').IsNull ) then
                  SQL.Add('AND ID <> ' + dsUnits.DataSet.FieldByName('ID').AsString);
               Open;
            end;
         if GenQuery.RecordCount > 0 then
            raise ErrorMsg.CreateFmt('Unit Code %s is already in use',[(Sender as TField).AsString]);
      end;
end;

procedure TWinData.UnitsBeforeDelete(DataSet: TDataSet);
begin
   try
      if NOT LookUpMedicine.Active then
         LookUpMedicine.Open;
      // Check the Buyer isn't being used by any records
      if LookUpMedicine.Locate('DoseUnit',DataSet.FieldByName('ID').AsInteger,[]) then
         begin
            MessageDLG('Unit is in use - cannot delete',mtwarning,[mbOK],0);
            SysUtils.Abort;  // Cancel the Deletion
         end;
      if LookUpMedicine.Locate('PurchUnit',DataSet.FieldByName('ID').AsInteger,[]) then
         begin
            MessageDLG('Unit is in use - cannot delete',mtwarning,[mbOK],0);
            SysUtils.Abort;  // Cancel the Deletion
         end;
   except
       SysUtils.Abort;
   end;
end;

procedure TWinData.GenLookUpDescriptionValidate(Sender: TField);
begin
   if (Sender as TField).IsNull then
      raise ErrorMsg.CreateFmt('Description is Required',[nil])
   else
      begin
         with GenQuery do
            begin
               SQL.Clear;
               SQL.Add('SELECT Description FROM ' + GenLookUp.TableName);
               SQL.Add('WHERE UPPER(Description) = "' + UPPERCASE((Sender as TField).AsString) + '"');
               case GenLookUpType of
                  TApplicMethod : SQL.Add('AND   ListType = ' + IntToStr(LApplicMethod));
                  THealthCode   : SQL.Add('AND   ListType = ' + IntToStr(LHealthCode));
                  TServiceType  : SQL.Add('AND   ListType = ' + IntToStr(LServiceType));
                  TAnimalColour : SQL.Add('AND   ListType = ' + IntToStr(LAnimalColour));
                  TObservedBy   : SQL.Add('AND   ListType = ' + IntToStr(LObservedBy));
                  TCulledCode   : SQL.Add('AND   ListType = ' + IntToStr(LCulledCode));
                  TMortality    : SQL.Add('AND   ListType = ' + IntToStr(LMortality));
                  TFeedCategory : SQL.Add('AND   ListType = ' + IntToStr(LFeedCategory));
               end;
               if NOT ( sGenLookUp.DataSet.FieldByName('ID').IsNull ) then
                  SQL.Add('AND ID <> ' + sGenLookUp.DataSet.FieldByName('ID').AsString);
               Open;
            end;
         if GenQuery.RecordCount > 0 then
            raise ErrorMsg.CreateFmt('Description %s is already in use',[(Sender as TField).AsString]);
      end;
end;

procedure TWinData.MediAdminAdminCodeValidate(Sender: TField);
begin
   if (Sender as TField).IsNull then
      raise ErrorMsg.CreateFmt('Code is Required',[nil])
   else
      begin
         with GenQuery do
            begin
               SQL.Clear;
               SQL.Add('SELECT AdMinCode FROM ' + MediAdmin.TableName);
               SQL.Add('WHERE UPPER(AdminCode) = "' + UPPERCASE((Sender as TField).AsString) + '"');
               if NOT ( dsMediAdmin.DataSet.FieldByName('ID').IsNull ) then
                  SQL.Add('AND ID <> ' + dsMediAdmin.DataSet.FieldByName('ID').AsString);
               Open;
            end;
         if GenQuery.RecordCount > 0 then
            raise ErrorMsg.CreateFmt('Code %s is already in use',[(Sender as TField).AsString]);
      end;
end;

procedure TWinData.MediAdminBeforeDelete(DataSet: TDataSet);
begin
    try
       if NOT CheckHealth.Active then
          CheckHealth.Open;
       // Check the Buyer isn't being used by any records
       if CheckHealth.Locate('AdminBy',DataSet.FieldByName('ID').AsInteger,[]) then
          begin
             MessageDLG('Administrator is in use - cannot delete',mtwarning,[mbOK],0);
             SysUtils.Abort;  // Cancel the Deletion
          end;
    except
        SysUtils.Abort;
    end;
end;

procedure TWinData.MedicineBeforeDelete(DataSet: TDataSet);
begin
    try
       if NOT CheckHealth.Active then
          CheckHealth.Open;
       // Check the Buyer isn't being used by any records
       if CheckHealth.Locate('DrugUsed',DataSet.FieldByName('ID').AsInteger,[]) then
          begin
             MessageDLG('Medicine is in use - cannot delete',mtwarning,[mbOK],0);
             SysUtils.Abort;  // Cancel the Deletion
          end;
    except
        SysUtils.Abort;
    end;
end;

procedure TWinData.AnimalFileByIDLactNoValidate(Sender: TField);
begin
   // Make sure the Lactation No is NOT blank - causes index problems
   if (Sender as TField).IsNull then
       raise ErrorMsg.CreateFmt('Lactation Number must be 0 - 99',[nil])//SP 03/07/00 Must raise error message to prevent blank lact no's.
      //(Sender as TField).AsInteger := 0;
end;

procedure TWinData.GenLookUpLookUpCodeValidate(Sender: TField);
begin
   if (GenLookUpType = TAnimalColour) then
      begin
         if (Sender as TField).IsNull then
            raise ErrorMsg.CreateFmt('Description is Required',[nil])
         else
            begin
               with GenQuery do
                  begin
                     SQL.Clear;
                     SQL.Add('SELECT LookUpCode FROM ' + GenLookUp.TableName);
                     SQL.Add('WHERE UPPER(LookUpCode) = "' + UPPERCASE((Sender as TField).AsString) + '"');
                     SQL.Add('AND   ListType = ' + IntToStr(LAnimalColour));
                     if NOT ( sGenLookUp.DataSet.FieldByName('ID').IsNull ) then
                        SQL.Add('AND ID <> ' + sGenLookUp.DataSet.FieldByName('ID').AsString);
                     Open;
                  end;
               if GenQuery.RecordCount > 0 then
                  raise ErrorMsg.CreateFmt('Code %s is already in use',[(Sender as TField).AsString]);
            end;
      end
   else if (GenLookUpType = THealthCode) then
      begin
         if NOT (Sender as TField).IsNull then
            begin
               with GenQuery do
                  begin
                     SQL.Clear;
                     SQL.Add('SELECT LookUpCode FROM ' + GenLookUp.TableName);
                     SQL.Add('WHERE UPPER(LookUpCode) = "' + UPPERCASE((Sender as TField).AsString) + '"');
                     SQL.Add('AND   ListType = ' + IntToStr(LHealthCode));
                     if NOT ( sGenLookUp.DataSet.FieldByName('ID').IsNull ) then
                        SQL.Add('AND ID <> ' + sGenLookUp.DataSet.FieldByName('ID').AsString);
                     Open;
                  end;
               if GenQuery.RecordCount > 0 then
                  raise ErrorMsg.CreateFmt('Code %s is already in use',[(Sender as TField).AsString]);
            end;
      end;
end;

procedure TWinData.GenLookUpBeforePost(DataSet: TDataSet);
begin
   if (GenLookUpType = TAnimalColour) then
      if GenLookUpLookUpCode.IsNull then
         begin
            MessageDLG('Colour Code must be entered',mtwarning,[mbOK],0);
            SysUtils.Abort;  // Cancel the Deletion
         end;
end;

// tries to link Calves to Dams using DOB and DAmID in Animals.DB
function TWinData.ReLinkCalvesToDams(CalledFromDairyData : Boolean) : Boolean;
var
   TempAnimals,
   AllCalvingEvents : TQuery;
   UpdateCalvings   : TTable;
   MyGauge          : TProgressBar;
   EventDate        : TDateTime;
   ICBFNormalBirthTypeID : Integer;

    // Set the Animal File Query to All Animals with a DAMID and Date Of Birth the same
    // As the Calving Event Date
    function SelectAnimals (AID : Integer; DateOfBirth : TDateTime) : Boolean;
    begin
        try
           RESULT := FALSE;
           with TempAnimals do
              begin
                  // This contains all the Calving Events.
                  SQL.Clear;
                  SQL.Add('SELECT A.ID, A.DateOfBirth, A.DamID FROM Animals A');
                  SQL.Add('WHERE A.DamID=' + IntToStr(AID));
                  SQL.Add('AND   A.DateOfBirth="' + FormatDateTime(cUSDateStyle,DateOfBirth) + '"');
                  Open;
                  First;
                  RESULT := ( NOT IsEmpty );
              end;
        except
           ShowMessage('Cannot Activate Animals Selection');
        end;
    end;


    function ICBF_NormalBirthType_ID : Integer;
    begin
       Result := 0;
       with TQuery.Create(nil) do
          try
             DatabaseName := AliasName;
             SQL.Text := 'SELECT DISTINCT ID FROM "GenLook.DB" where ListType = ' + IntToStr(LBirthType) + ' AND Description = ''ICBF-Normal''';
             Open;
             try
                First;
                Result := FieldByName('ID').AsInteger;
             finally
                Close;
             end;
          finally
             Free;
          end;
    end;


begin
   EventDate := IncMonth(Date,-3);
   ICBFNormalBirthTypeID := ICBF_NormalBirthType_ID;
   try
      RESULT := FALSE;
      if NOT CalledFromDairyData then
         begin
           MyGauge := TProgressBar.Create(nil);
//           MyGauge.Parent := Menuform.pUpdateCalvings;
           MyGauge.Parent := Screen.ActiveForm;
           MyGauge.Align := alBottom;
           MyGauge.Height := 35;
           MyGauge.Step   := 1;
           MyGauge.Enabled := TRUE;
           MyGauge.Show;
           MyGauge.ReFresh;
           Screen.ActiveForm.Refresh;
         end
      else
         begin
           MyGauge := TProgressBar.Create(nil);
           MyGauge.Parent := Screen.ActiveForm;
           MyGauge.Align := alBottom;
           MyGauge.Height := 50;
           MyGauge.Step   := 1;
           MyGauge.Enabled := TRUE;
           MyGauge.Show;
           MyGauge.ReFresh;
           Screen.ActiveForm.Refresh;
         end;
      AllCalvingEvents := TQuery.Create(nil);
      TempAnimals := TQuery.Create(nil);
      UpdateCalvings := TTable.Create(nil);
      UpdateCalvings.DataBaseName := KingData.DatabaseName;
      UpdateCalvings.TableName := Calvings.TableName;
      UpdateCalvings.Open;
      TempAnimals.DataBaseName := KingData.DatabaseName;
      with AllCalvingEvents do
         begin
            DataBaseName := KingData.DatabaseName;
            // This contains all the Calving Events.
            SQL.Clear;
            SQL.Add('SELECT E.ID EID, E.AnimalID AID, E.EventDate EDate FROM Events E');
            SQL.Add('WHERE E.EventType=' + IntToStr(CCalvingEvent));
            SQL.Add('AND (E.EventDate > ' + '''' + FormatDateTime(cUSDateStyle,EventDate) + '''' +')');
            Open;
            // Set the Gauge Max to the No. of calving event records
            MyGauge.Max := RecordCount;
            if NOT IsEmpty then  // If there are some records process them
               while NOT EOF do
                  begin
                     // Select Animals with this date of Birth and this DAMID
                     if SelectAnimals(FieldByName('AID').AsInteger, FieldByName('EDate').AsDateTime ) then
                        // If you find some animals process them and update the Calving Events.
                        while NOT TempAnimals.EOF do
                           begin
                              // Find the Actual Calving record in Calvings.db
                              if UpdateCalvings.Locate('EventID',AllCalvingEvents.FieldByName('EID').AsInteger,[] ) then
                                 begin
                                    {if NOT ((TempAnimals.FieldByName('ID').AsInteger =
                                             UpDateCalvings.FieldByName('ID1').AsInteger) or
                                            (TempAnimals.FieldByName('ID').AsInteger =
                                             UpDateCalvings.FieldByName('ID2').AsInteger) or
                                            (TempAnimals.FieldByName('ID').AsInteger =
                                             UpDateCalvings.FieldByName('ID3').AsInteger) or
                                            (TempAnimals.FieldByName('ID').AsInteger =
                                             UpDateCalvings.FieldByName('ID4').AsInteger)) then
                                       begin
                                          UpdateCalvings.Edit;
                                          if UpDateCalvings.FieldByName('ID1').AsInteger = 0 then
                                             begin
                                                UpDateCalvings.FieldByName('ID1').AsInteger := TempAnimals.FieldByName('ID').AsInteger;
                                                UpDateCalvings.FieldByName('ID1Notified').AsBoolean := TRUE;
                                                UpDateCalvings.FieldByName('ID1HFSNotified').AsBoolean := TRUE;
                                             end
                                          else if UpDateCalvings.FieldByName('ID2').AsInteger = 0 then
                                             begin
                                                UpDateCalvings.FieldByName('ID2').AsInteger := TempAnimals.FieldByName('ID').AsInteger;
                                                UpDateCalvings.FieldByName('ID2Notified').AsBoolean := TRUE;
                                                UpDateCalvings.FieldByName('ID2HFSNotified').AsBoolean := TRUE;
                                             end
                                          else if UpDateCalvings.FieldByName('ID3').AsInteger = 0 then
                                             begin
                                                UpDateCalvings.FieldByName('ID3').AsInteger := TempAnimals.FieldByName('ID').AsInteger;
                                                UpDateCalvings.FieldByName('ID3Notified').AsBoolean := TRUE;
                                                UpDateCalvings.FieldByName('ID3HFSNotified').AsBoolean := TRUE;
                                             end
                                          else if UpDateCalvings.FieldByName('ID4').AsInteger = 0 then
                                             begin
                                                UpDateCalvings.FieldByName('ID4').AsInteger := TempAnimals.FieldByName('ID').AsInteger;
                                                UpDateCalvings.FieldByName('ID4Notified').AsBoolean := TRUE;
                                                UpDateCalvings.FieldByName('ID4HFSNotified').AsBoolean := TRUE;
                                             end;
                                          UpdateCalvings.Post;
                                       end;}
                                       // 25/04/01 SP taken to much time to update existing records, only create new records
                                 end
                              else // Insert a New Record
                                 begin
                                    UpdateCalvings.Append;
                                    UpdateCalvings.FieldByName('EventID').AsInteger := AllCalvingEvents.FieldByName('EID').AsInteger;
                                    UpDateCalvings.FieldByName('ID1').AsInteger := TempAnimals.FieldByName('ID').AsInteger;
                                    UpDateCalvings.FieldByName('ID1Notified').AsBoolean := FALSE;
                                    UpDateCalvings.FieldByName('ID1HFSNotified').AsBoolean := FALSE;
                                    UpDateCalvings.FieldByName('ID2Notified').AsBoolean := FALSE;
                                    UpDateCalvings.FieldByName('ID2HFSNotified').AsBoolean := FALSE;
                                    UpDateCalvings.FieldByName('ID3Notified').AsBoolean := FALSE;
                                    UpDateCalvings.FieldByName('ID3HFSNotified').AsBoolean := FALSE;
                                    UpDateCalvings.FieldByName('ID4Notified').AsBoolean := FALSE;
                                    UpDateCalvings.FieldByName('ID4HFSNotified').AsBoolean := FALSE;
                                    UpDateCalvings.FieldByName('BirthType').AsInteger := ICBFNormalBirthTypeID;
                                    UpDateCalvings.FieldByName('CalfDead1').AsBoolean       := False;
                                    UpDateCalvings.FieldByName('CalfDead2').AsBoolean       := False;
                                    UpDateCalvings.FieldByName('CalfDead3').AsBoolean       := False;
                                    UpDateCalvings.FieldByName('CalfDead4').AsBoolean       := False;
                                    UpDateCalvings.FieldByName('ID1ComplianceCert').AsBoolean       := False;
                                    UpDateCalvings.FieldByName('ID2ComplianceCert').AsBoolean       := False;
                                    UpDateCalvings.FieldByName('ID3ComplianceCert').AsBoolean       := False;
                                    UpDateCalvings.FieldByName('ID4ComplianceCert').AsBoolean       := False;
                                    UpdateCalvings.Post;
                                 end;
                              TempAnimals.Next;  // Next Animal
                           end;
                     MyGauge.StepIt;
                     Next; // Next Calving Event
                  end;
         end;
      RESULT := TRUE;
   finally
      AllCalvingEvents.Free;
      TempAnimals.Free;
      UpdateCalvings.Free;
      MyGauge.Destroy;
   end;
end;

procedure TWinData.FeedEventsEndDateChange(Sender: TField);
begin
   // calculate stock
   if FeedTypes.Locate('ID',FeedEvents.FieldByName('FeedType').AsInteger,[]) then
      with FeedTypes do
         begin
            edit;
            FieldByName('Stock').AsFloat := (FieldByName('Stock').AsFloat -
                                             ((FeedEvents.FieldByName('QuantDay').AsFloat) *
                                              (FeedEvents.FieldByName('EndDate').AsDateTime -
                                               FeedEvents.FieldByName('AllocDate').AsDateTime)));
            post;
         end;
end;

procedure TWinData.CustomersNewRecord(DataSet: TDataSet);
begin
   // ensure slaughter boolean false on new record
{
   Customers.FieldByName('Slaughter').AsBoolean := False;
   Customers.FieldByName('CMMSForms').AsBoolean := False; // SP 28/01/2003
}
   Customers.FieldByName('AuthorisedDisposalPlace').AsBoolean := False;
   if NewCustomerAttributes <> [] then
      begin
         Customers.FieldByName('Slaughter').AsBoolean := ( caSlaughterEligibility in NewCustomerAttributes );
         Customers.FieldByName('CMMSForms').AsBoolean := ( caCMMSRegistered in NewCustomerAttributes );
         Customers.FieldByName('MeatFactory').AsBoolean := ( caMeatFactory in NewCustomerAttributes );
      end
   else
      begin
         Customers.FieldByName('Slaughter').AsBoolean := False;
         Customers.FieldByName('CMMSForms').AsBoolean := False;
         Customers.FieldByName('MeatFactory').AsBoolean := False;
      end
end;


procedure TWinData.AnimalFileByIDAnimalNoChange(Sender: TField);
begin
   // flag NewID event for icbf - 8/12/00 - kr
{   if NOT (AnimalFileByID.State in [dsInsert, dsBrowse]) then
      begin
         IDEvent := True;
// ******* use these if record of old/new animalno is needed ******** //
//         NewIDValue := AnimalFileByIDAnimalNo.NewValue;
//         OldIDValue := AnimalFileByIDAnimalNo.OldValue;
      end;
}
 // Above moved to AnimalFileByIDBeforePost

end;

procedure TWinData.FeedsAfterScroll(DataSet: TDataSet);
begin
   // update feed grid - 18/12/00 - kr
{   if (MenuUnit.Menuform.EventGrid.DataSource = FeedsSource) then
      begin
         qFeeds.Close;
         qFeeds.ParamByName('ID').AsInteger := AnimalFileByIDID.AsInteger;
         qFeeds.Open;
      end;

}
end;

procedure TWinData.AnimalFileByIDBrucellosisValidate(Sender: TField);
begin
   if (Sender as TField).AsDateTime <> 0 then
      if AnimalFileByIDDateOfBirth.AsDateTime <> 0 then
         if AnimalFileByIDDateOfBirth.AsDateTime > (Sender as TField).AsDateTime then
            raise ErrorMsg.CreateFmt('TB Test Date %s is before Date of Birth %s',
               [(Sender as TField).AsString,AnimalFileByIDDateOfBirth.AsString]);
end;

(*
Procedure TWinData.AnimalEventSQL;
var
   BK : Integer;
begin
   // This is acting like indexes would do, displaying all events based on LactNo.
   // This was introduced by KB when animalfilebyID2 was created.
   With WinData.qAnimalEvents do
      begin
         // Never alter this SQL.
         try
            BK := FieldByName('ID').AsInteger;
            Close;
            SQL.Clear;
            SQL.ADD('Select * From Events');
            SQL.ADD('Where (AnimalID = ' + WinData.AnimalFileByID2ID.AsString + ') ');
            if WinData.Events.MasterFields = 'ID;LactNo' then
               SQL.ADD('AND (AnimalLactNo = ' + WinData.AnimalFileById2LactNo.AsString + ')');
            SQL.Add('ORDER BY EventDate, ID ');
            Prepare;
            Open;

            { Book mark was used, but caused some problems with the Event Grid, wasn't updating properly }
            try
               Locate('ID', BK, []);
            except
               First;
            end;

         except
         end;
      end;
end;
  *)
function TWinData.GetLastEventFUpdate : TDateTime;
begin
  { with defaults do
      begin
         Open;
         try
            Result := FieldByName('LastEventFileUpdate').AsDateTime;
         except
            //
         end;
         Close;
      end;}
end;

procedure TWinData.SetLastEventFUpdate(Value: TDateTime);
begin
{   try
      with Defaults do
         begin
            Open;
            First;
            if EOF then
               begin
                  Insert;
                  FieldByName('LastEventFileUpdate').AsDateTime := Value;
               end
            else
               begin
                  Edit;
                  FieldByName('LastEventFileUpdate').AsDateTime := Value;
               end;
            Post;
         end;
   finally
      Defaults.Close;
   end;}
end;

function TWinData.EuroUpdate : Boolean;
var
   UnZipArray : array[0..50] of char;
   DataFolder : String;
   OKToBackUp : Boolean;
begin
   DataFolder := WinData.KingData.Directory;
   try
      try
         // First make sure all herds are irish before converting
         if MessageDLG('Do you wish to convert your price data from £IR to Euro?',mtConfirmation,[mbYes,mbNo],0) = idYes then
            begin
               MessageDLG('Please insert a NEW backup disk into Floppy Drive',mtWarning,[mbOK],0);
               UpdatingToEuro := True;
               if not TfmDataBackup.execute(daBackup) then
                  begin
                     MessageDLG('Conversion process will only be done after backup is completed',mtInformation,[mbOK],0);
                     Exit;
                  end
               else
                  begin
                     KingData.Close;
                     if EuroCurrencyUpdate then
                        begin
                           UpdatingToEuro := FALSE;
                           OpenAndCheckTables;
                           MenuForm.SetUpQuery;
                           MessageDLG('Euro conversion complete',mtInformation,[mbOk],0);
                        end
                     else
                        begin
                           try
                              // restore the backup taken.
                              if FileExists('C:\Kingswood Herd Management\Archive\EConvert\HerdBackUp.zip') then
                                 begin
                                    try
                                       DataFolder := WinData.KingData.Directory;
                                       WinData.KingData.CloseDataSets; // Close the Dataset
                                       WinData.KingData.Close;         // Close the Database
                                       OKToBackUp := TRUE;
                                    except
                                       OKToBackUp := FALSE;
                                       ShowMessage('Error occured Closing Database - ReStart Program and try again'+
                                                    #13#13 + 'BACKUP/RESTORE has failed Contact Kingwood');
                                    end;

                                    if OKToBackUp then
                                       try
                                          CloseFile(Def.DefFile);
                                       except
                                          OkToBackUp := FALSE;
                                          ShowMessage('Error occured Closing definition - ReStart Program and try again'+
                                                      #13#13 + 'BACKUP/RESTORE has failed Contact Kingwood');
                                       end;

                                    StrPCopy(UnZipArray, '"' + DataFolder + '"' + #0);
                                    Unzip.lpszDestination.SetText(UnZipArray);
                                    unzip.lpszZipFile.SetText('C:\Kingswood Herd Management\Archive\EConvert\HerdBackUp.zip' + #0);
                                    unzip.lpszFileSpec.SetText('*.*' + #0);

                                    if Unzip.Execute(UNZIP_EXTRACT) then
                                      //
                                 end;
                           except
                              MessageDLG('Error in conversion process, contact Kingswood Computing',mtWarning,[mbOK],0);
                           end;
                           UpdatingToEuro := FALSE;
                           OpenAndCheckTables;
                           MenuForm.SetUpQuery;
                           MessageDLG('Unable to convert your price data, contact Kingswood',mtWarning,[mbOK],0);
                        end;
                  end;
            end
         else
            MessageDLG('Euro conversion canceled',mtWarning,[mbOk],0);
      except
         MessageDlg('Cannot Update Price Data, contact Kingswood',mtError,[mbOK],0);
      end;
   finally
      //
   end;
end;

function TWinData.EuroCurrencyUpdate: Boolean;
const
   FName = 'C:\Kingswood Herd Management\ErrorLog.txt';
var
   MyTable : TTable;
   F : TextFile;
begin
   MyTable := TTable.Create(nil);
   MyTable.DatabaseName := KingData.DatabaseName;
   AssignFile(F,FName);
   ReWrite(F);
   RESULT := TRUE;
   try
      try
         try
            MyTable.TableName := 'BullSemenStk.db';
            MyTable.Open;
            try
               with GenQuery do
                  begin
                     SQL.Clear;
                     SQL.Add('UPDATE '+MyTable.TableName+' SET PricePerStraw = (PricePerStraw/'+FloatToStr(cEuro)+')');
                     ExecSQL;
                  end;
            except
               WriteLn(F,'Error updating BullSemenStk.db');
               RESULT := FALSE;
            end;
         finally
            MyTable.Close;
         end;

         try
            MyTable.TableName := 'Buyers.db';
            MyTable.Open;
            try
               with GenQuery do
                  begin
                     SQL.Clear;
                     SQL.Add('UPDATE '+MyTable.TableName+' SET Commission = (Commission/'+FloatToStr(cEuro)+')');
                     ExecSQL;
                  end;
            except
               WriteLn(F,'Error updating Buyers.db');
               RESULT := FALSE;
            end;
         finally
            MyTable.Close;
         end;

         try
            MyTable.TableName := 'Customers.db';
            MyTable.Open;
            try
               with GenQuery do
                  begin
                     SQL.Clear;
                     SQL.Add('UPDATE '+MyTable.TableName+' SET Deductions = (Deductions/'+FloatToStr(cEuro)+'),');
                     SQL.Add('                                 Transport  = (Transport/'+FloatToStr(cEuro)+') ');
                     ExecSQL;
                  end;
            except
               WriteLn(F,'Error updating Customers.db');
               RESULT := FALSE;
            end;
         finally
            MyTable.Close;
         end;

         try
            MyTable.TableName := 'Deductions.db';
            MyTable.Open;
            try
               with GenQuery do
                  begin
                     SQL.Clear;
                     SQL.Add('UPDATE '+MyTable.TableName+' SET Deducted = (Deducted/'+FloatToStr(cEuro)+'),');
                     SQL.Add('                                 VAT      = (VAT/'+FloatToStr(cEuro)+') ');
                     ExecSQL;
                  end;
            except
               WriteLn(F,'Error updating Deductions.db');
               RESULT := FALSE;
            end;
         finally
            MyTable.Close;
         end;

         // Problem here!!
         try
            MyTable.TableName := 'Defaults.db';
            MyTable.Open;
            try
               with GenQuery do
                  begin
                     SQL.Clear;
                     SQL.Add('UPDATE '+MyTable.TableName+' SET VAT            = (VAT/'+FloatToStr(cEuro)+')         , ');
                     SQL.Add('                                 AmtBullPrem    = (AmtBullPrem/'+FloatToStr(cEuro)+') , ');
                     SQL.Add('                                 Amt10MthPrem   = (Amt10MthPrem/'+FloatToStr(cEuro)+'), ');
                     SQL.Add('                                 Amt22MthPrem   = (Amt22MthPrem/'+FloatToStr(cEuro)+'), ');
                     SQL.Add('                                 AmtSlghtPrem   = (AmtSlghtPrem/'+FloatToStr(cEuro)+'), ');
                     SQL.Add('                                 HeifSlghtPrem  = (HeifSlghtPrem/'+FloatToStr(cEuro)+') ');
                     ExecSQL;
                  end;
            except
               WriteLn(F,'Error updating Defaults.db');
               RESULT := FALSE;
            end;
         finally
            MyTable.Close;
         end;

         try
            MyTable.TableName := 'Ext001.db';
            MyTable.Open;
            try
               with GenQuery do
                  begin
                     SQL.Clear;
                     SQL.Add('UPDATE '+MyTable.TableName+' SET ExtAmt        = (ExtAmt/'+FloatToStr(cEuro)+'), ');
                     SQL.Add('                                 PremAmt       = (PremAmt/'+FloatToStr(cEuro)+') ');
                     ExecSQL;
                  end;
            except
               WriteLn(F,'Error updating Ext001.db');
               RESULT := FALSE;
            end;
         finally
            MyTable.Close;
         end;

         try
            MyTable.TableName := 'FdStkEvents.db';
            MyTable.Open;
            try
               with GenQuery do
                  begin
                     SQL.Clear;
                     SQL.Add('UPDATE '+MyTable.TableName+' SET UnitCost   = (UnitCost/'+FloatToStr(cEuro)+'), ');
                     SQL.Add('                                 OtherCosts = (OtherCosts/'+FloatToStr(cEuro)+') ');
                     ExecSQL;
                 end;
            except
               WriteLn(F,'Error updating FdStkEvents.db');
               RESULT := FALSE;
            end;
         finally
            MyTable.Close;
         end;

         try
            MyTable.TableName := 'FeedEvents.db';
            MyTable.Open;
            try
               with GenQuery do
                 begin
                    SQL.Clear;
                    SQL.Add('UPDATE '+MyTable.TableName+' SET CostDay   = (CostDay/'+FloatToStr(cEuro)+'), ');
                    SQL.Add('                                 TotalCost = (TotalCost/'+FloatToStr(cEuro)+') ');
                    ExecSQL;
                 end;
            except
               WriteLn(F,'Error updating FeedEvents.db');
               RESULT := FALSE;
            end;
         finally
             MyTable.Close;
         end;

         try
            MyTable.TableName := 'FeedRegime.db';
            MyTable.Open;
            try
               with GenQuery do
                  begin
                     SQL.Clear;
                     SQL.Add('UPDATE '+MyTable.TableName+' SET CostDay   = (CostDay/'+FloatToStr(cEuro)+') ');
                     ExecSQL;
                  end;
            except
               WriteLn(F,'Error updating FeedRegime.db');
               RESULT := FALSE;
            end;
         finally;
             MyTable.Close;
         end;

         try
            MyTable.TableName := 'FeedTypes.db';
            MyTable.Open;
            try
               with GenQuery do
                  begin
                     SQL.Clear;
                     SQL.Add('UPDATE '+MyTable.TableName+' SET UnitCost   = (UnitCost/'+FloatToStr(cEuro)+'), ');
                     SQL.Add('                                 DefCostTon = (DefCostTon/'+FloatToStr(cEuro)+') ');
                     ExecSQL;
                  end;
           except
              WriteLn(F,'Error updating FeedTypes.db');
              RESULT := FALSE;
           end;
        finally;
            MyTable.Close;
        end;

        try
           MyTable.TableName := 'Health.db';
           MyTable.Open;
           try
              with GenQuery do
                 begin
                    SQL.Clear;
                    SQL.Add('UPDATE '+MyTable.TableName+' SET DrugCost   = (DrugCost/'+FloatToStr(cEuro)+'), ');
                    SQL.Add('                                 PurchUnitCost = (PurchUnitCost/'+FloatToStr(cEuro)+') ');
                    ExecSQL;
                end;
           except
              WriteLn(F,'Error updating Health.db');
              RESULT := FALSE;
           end;
        finally;
            MyTable.Close;
        end;

        try
           MyTable.TableName := 'Medicine.db';
           MyTable.Open;
           try
              with GenQuery do
                 begin
                    SQL.Clear;
                    SQL.Add('UPDATE '+MyTable.TableName+' SET CostPurchUnit   = (CostPurchUnit/'+FloatToStr(cEuro)+') ');
                    ExecSQL;
                 end;
           except
              WriteLn(F,'Error updating Medicine.db');
              RESULT := FALSE;
           end;
        finally;
            MyTable.Close;
        end;

        try
           MyTable.TableName := 'MediPur.db';
           MyTable.Open;
           try
              with GenQuery do
                 begin
                    SQL.Clear;
                    SQL.Add('UPDATE '+MyTable.TableName+' SET CostUnit   = (CostUnit/'+FloatToStr(cEuro)+') ');
                    ExecSQL;
                 end;
           except
              WriteLn(F,'Error updating MediPur.db');
              RESULT := FALSE;
           end;
        finally;
            MyTable.Close;
        end;

        try
           MyTable.TableName := 'Owners.db';
           MyTable.Open;
           try
              with GenQuery do
                 begin
                    SQL.Clear;
                    SQL.Add('UPDATE '+MyTable.TableName+' SET FixedCosts = (FixedCosts/'+FloatToStr(cEuro)+') ,');
                    SQL.Add('                                 Deductions = (Deductions/'+FloatToStr(cEuro)+') ,');
                    SQL.Add('                                 ProtPrice  = (ProtPrice/'+FloatToStr(cEuro)+')  ,');
                    SQL.Add('                                 LactPrice  = (LactPrice/'+FloatToStr(cEuro)+')  ,');
                    SQL.Add('                                 BFatPrice  = (BFatPrice/'+FloatToStr(cEuro)+')  ,');
                    SQL.Add('                                 MilkPrice  = (MilkPrice/'+FloatToStr(cEuro)+')  ,');
                    SQL.Add('                                 VATRate    = (VATRate/'+FloatToStr(cEuro)+')     ');
                    ExecSQL;
                end;
           except
              WriteLn(F,'Error updating Owners.db');
              RESULT := FALSE;
           end;
        finally;
            MyTable.Close;
        end;

        try
           MyTable.TableName := 'Purchases.db';
           MyTable.Open;
           try
              with GenQuery do
                 begin
                   SQL.Clear;
                   SQL.Add('UPDATE '+MyTable.TableName+' SET Price         = (Price/'+FloatToStr(cEuro)+'), ');
                   SQL.Add('                                 SupplierCosts = (SupplierCosts/'+FloatToStr(cEuro)+'), ');
                   SQL.Add('                                 BuyerCosts    = (BuyerCosts/'+FloatToStr(cEuro)+') ');
                   ExecSQL;
                 end;
           except
              WriteLn(F,'Error updating Purchases.db');
              RESULT := FALSE;
           end;
        finally;
            MyTable.Close;
        end;

        try
          MyTable.TableName := 'PurchGrpData.db';
          MyTable.Open;
          try
             with GenQuery do
                begin
                   SQL.Clear;
                   SQL.Add('UPDATE '+MyTable.TableName+' SET CostIntoPen   =  (CostIntoPen/'+FloatToStr(cEuro)+'), ');
                   SQL.Add('                                 SupplierCosts =  (SupplierCosts/'+FloatToStr(cEuro)+'), ');
                   SQL.Add('                                 BuyerCosts    =  (BuyerCosts/'+FloatToStr(cEuro)+') ');
                   ExecSQL;
                end;
          except
              WriteLn(F,'Error updating PurchGrpData.db');
              RESULT := FALSE;
          end;
        finally;
           MyTable.Close;
        end;

        // Problem here
        try
           MyTable.TableName := 'PurchGrpHeader.db';
           MyTable.Open;
           try
              with GenQuery do
                 begin
                    SQL.Clear;
                    SQL.Add('UPDATE '+MyTable.TableName+' SET VAT              =  (VAT/'+FloatToStr(cEuro)+'),           ');
                    SQL.Add('                                 SupplierCosts    =  (SupplierCosts/'+FloatToStr(cEuro)+'), ');
                    SQL.Add('                                 BuyerCosts       =  (BuyerCosts/'+FloatToStr(cEuro)+'),    ');
                    SQL.Add('                                 MartCost         =  (MartCost/'+FloatToStr(cEuro)+'),      ');
                    SQL.Add('                                 TotMartPrice      = (TotMartPrice/'+FloatToStr(cEuro)+'),   ');
                    SQL.Add('                                 TotCostIntoPen   =  (TotCostIntoPen/'+FloatToStr(cEuro)+') ');
                    ExecSQL;
                 end;
           except
              WriteLn(F,'Error updating PurchGrpHeader.db');
              RESULT := FALSE;
           end;
        finally;
            MyTable.Close;
        end;

        try
           MyTable.TableName := 'SaleGrps.db';
           MyTable.Open;
           try
              with GenQuery do
                 begin
                    SQL.Clear;
                    SQL.Add('UPDATE '+MyTable.TableName+' SET TotalValue      =  (TotalValue/'+FloatToStr(cEuro)+'), ');
                    SQL.Add('                                 TotalDeductions =  (TotalDeductions/'+FloatToStr(cEuro)+'), ');
                    SQL.Add('                                 PaymentAmt      =  (PaymentAmt/'+FloatToStr(cEuro)+') ');
                    ExecSQL;
                 end;
           except
              WriteLn(F,'Error updating SaleGrps.db');
              RESULT := FALSE;
           end;
        finally;
            MyTable.Close;
        end;

        try
           MyTable.TableName := 'SalesDeaths.db';
           MyTable.Open;
           try
              with GenQuery do
                 begin
                    SQL.Clear;
                    SQL.Add('UPDATE '+MyTable.TableName+' SET Price         =  (Price/'+FloatToStr(cEuro)+'), ');
                    SQL.Add('                                 CustomerCosts =  (CustomerCosts/'+FloatToStr(cEuro)+') ');
                    ExecSQL;
                 end;
           except
              WriteLn(F,'Error updating SalesDeaths.db');
              RESULT := FALSE;
           end;
        finally;
            MyTable.Close;
        end;

        try
           MyTable.TableName := 'SubsidyPayments.db';
           MyTable.Open;
           try
              with GenQuery do
                 begin
                    SQL.Clear;
                    SQL.Add('UPDATE '+MyTable.TableName+' SET Amount =  (Amount/'+FloatToStr(cEuro)+') ');
                    ExecSQL;
                 end;
           except
              WriteLn(F,'Error updating SubsidyPayments.db');
              RESULT := FALSE;
           end;
        finally;
           MyTable.Close;
        end;

        try
           MyTable.TableName := 'SuppliersBreeders.db';
           MyTable.Open;
           try
              with GenQuery do
                 begin
                    SQL.Clear;
                    SQL.Add('UPDATE '+MyTable.TableName+' SET Commission =  (Commission/'+FloatToStr(cEuro)+'), ');
                    SQL.Add('                                 Transport  =  (Transport/'+FloatToStr(cEuro)+') ');
                    ExecSQL;
                 end;
           except
              WriteLn(F,'Error updating SuppliersBreeders.db');
              RESULT := FALSE;
           end;
        finally;
            MyTable.Close;
        end;

      if RESULT then
         try
            MyTable.TableName := 'Defaults.db';
            MyTable.Open;
            try
               with GenQuery do
                  begin
                     SQL.Clear;
                     SQL.Add('UPDATE '+MyTable.TableName+' SET EConvert = True,    ');
                     SQL.Add('                                 ReportInEuro = True ');
                     ExecSQL;
                  end;
            except
               WriteLn(F,'Error updating the EConvert field in Defaults.db');
               RESULT := FALSE;
            end;
         finally;
             MyTable.Close;
         end;

         try
            // delete trouble-shootin file if successful
            CloseFile(F);
            DeleteFile(FName);
         except
            //
         end;

      except
         RESULT := FALSE;
         CloseFile(F);
      end;

   finally
      MyTable.Close;
//      CloseFile(F);
   end;
end;

function TWinData.OkToConvertToEuro: Boolean;
var
   OkToProceed : Boolean;
begin
   try
      OwnerFile.First;
      while NOT OwnerFile.EOF do
         begin
            if OwnerFile.FieldByName('HerdIdentity').AsString <> 'NONE' then
               begin
                  OkToProceed := OwnerFile.FieldByName('Country').AsInteger = 1;
                  if NOT OkToProceed then
                     begin
                        RESULT := FALSE;
                        Exit;
                     end;
                  OwnerFile.Next;
               end
            else
               OwnerFile.Next;
         end;
      RESULT := OkToProceed;
   except
      RESULT := FALSE;
   end;
end;

procedure TWinData.ReIndex(TblName,MyIndex,MyField: String; MyOptions: TIndexOptions);
var
   MyTable : TTable;
begin
     try
        MyTable := TTable.Create(nil);
        MyTable.DatabaseName := WinData.KingData.DatabaseName;
        MyTable.TableName := TblName;
        MyTable.AddIndex(MyIndex,MyField, MyOptions);

     finally
        MyTable.Close;
        MyTable.Free;
     end;
end;

function TWinData.CheckIfInGroup(AID: Integer; GType: String;
   const ShowConfirmMsg : Boolean = True): Boolean;
var
   MyQuery : TQuery;
begin
   try
      // get all group records for animal
      Result := FALSE;
      MyQuery := TQuery.Create(nil);
      MyQuery.DatabaseName := WinData.KingData.DatabaseName;
      MyQuery.SQL.Add('SELECT GroupID, AnimalID, GroupType FROM grps, grplinks');
      MyQuery.SQL.Add('WHERE (AnimalID=' + IntToStr(AID) + ')');
      MyQuery.SQL.Add('AND   (GroupType="' + GType + '")');
      MyQuery.SQL.Add('AND   (ID=GroupID)');
      MyQuery.Open;
      if (NOT MyQuery.IsEmpty) then
         begin
            Result := TRUE;
            if ShowConfirmMsg then
               begin
                  if MessageDLG('This animal is already in a ' + GType + ' Group - remove it from that Group',mtWarning,[mbYes,mbNo],0) = mrNo then
                     Exit;
               end;
            while NOT MyQuery.EOF do
               begin
                  // remove all previous group links for animal
                  WinData.GroupLinks.Filter := 'GroupID = ' + MyQuery.FieldByName('GroupID').AsString + ' And AnimalID = ' + MyQuery.FieldByName('AnimalID').AsString;
                  WinData.GroupLinks.Filtered := TRUE;
                  while NOT WinData.GroupLinks.EOF do
                     WinData.GroupLinks.Delete;
                  WinData.GroupLinks.Filter := '';
                  WinData.GroupLinks.Filtered := FALSE;
                  MyQuery.Next;
               end;
            Result := False;
         end;
   finally
      MyQuery.Close;
      MyQuery.Free;
   end;
end;

procedure TWinData.AddToGroup(AID: Integer; GroupID: Integer; AllowDeletion: Boolean;
              const DateJoined : TDateTime; gType : String; ATagNo : String;
              const ShowConfirmMsg : Boolean = True );
var
   qFeed : TQuery;
   StatusInfo : TStatusInfo;
   SaleInfo : Variant;
   SaleDate : Variant;
   CustomerID : Variant;
   WeaningDate : TDateTime;
   HerdType : THerdType;
   LactNo : Integer;

   DateOfBirth : TDateTime;
   CheckWeaning : Boolean;
begin
   if ( GroupID <= 0 ) then
      begin
         MessageDlg('Animal has not been assigned to group.',mtError,[mbOK],0);
         Exit;
      end;

   Try
      if ( gType = '' ) and ( GroupID > 0 ) then
         begin
            // SP 08/04/2005 Find gType by using GroupID

            with TQuery.Create(nil) do
               try
                  DatabaseName := AliasName;
                  SQL.Add('Select GroupType From Grps Where ID = :GroupID');
                  Params[0].Value := GroupID;

                  Active := True;
                  try
                     First;
                     gType := FieldByName('GroupType').AsString;
                  finally
                     Active := False;
                  end;
               finally
                  Free;
               end;
         end;

      if gType = 'Feed' then
         begin
            // Set the "EndDate" to any Feed Regime events if animal
            // is being transfered from existing feed group.
            with TQuery.Create(nil) do
               try
                  DatabaseName := AliasName;
                  SQL.Add('UPDATE FeedEvents SET EndDate = "' + FormatDateTime(cUSDateStyle,DateJoined) + '" ');
                  SQL.Add('WHERE ( AnimalID = :AAID ) AND ( EndDate IS NULL ) ');
                  Params[0].AsInteger := AID;
                  ExecSQL;
               finally
                  Free;
               end;
         end;

      qFeed := TQuery.Create(nil);
      qFeed.DatabaseName := KingData.DatabaseName;
      if NOT WinData.GroupLinks.Locate('AnimalID;GroupID',VarArrayOf([AID,GroupID]),[]) then
         begin
            // check for animal record in another group
            if NOT CheckIfInGroup(AID, gType, False) then
               begin
                  // Transfer from the Group Grid to the table

                  if gType = 'Sales' then
                     begin
                        SaleInfo := Groups.Lookup('ID',GroupID, 'EventDate;DestSource');
                        if not VarIsNull(SaleInfo) then
                           begin
                              SaleDate := SaleInfo[0];
                              CustomerID := SaleInfo[1];

                              if ( SaleDate > 0 ) then
                                 begin
                                    HerdType := HerdLookup.GetHerdType(HerdIDByAnimalID(AID));
                                    if ( HerdType <> htBeef)  then
                                       begin
                                          LactNo := GetAnimalInfo(AID, 'LactNo');
                                          if LactNo = 0 then
                                             begin
                                                CheckWeaning := False;
                                                DateOfBirth := GetAnimalInfo(AID, 'DateOfBirth');
                                                if DateOfBirth > 0 then
                                                   begin
                                                      if (HerdType = htSuckler) then
                                                         begin
                                                            // CheckWeaning = True if animal is less than or equal to 12 months of age.
                                                            CheckWeaning := (DateOfBirth >= IncMonth(Date, -12));
                                                         end
                                                      else if (HerdType = htDairy) then
                                                         begin
                                                            // CheckWeaning = True if animal is less than or equal to 12 months of age and greater than or equal to 10 weeks.
                                                            CheckWeaning := ((DateOfBirth >= IncMonth(Date, -12)) and (DateOfBirth <= IncDay(Date,-70)));
                                                         end;
                                                      if CheckWeaning then
                                                         begin
                                                            WeaningDate := EventDataHelper.GetLastEventDate(AID, CWeaningEvent);
                                                            if WeaningDate > 0 then
                                                               begin
                                                                  if ( SaleDate >= WeaningDate ) and ( SaleDate <= WeaningDate+14 ) then
                                                                     if MessageDlg(Format('This calf "%s" has a Weaning event recorded in the past 2 weeks.'+#13#10+
                                                                                          'Do you want to include the animal in the sales group?',[GetAnimalInfo(AID, 'NatIDNum')]),mtWarning,[mbYes,mbNo],0) = idNo then
                                                                        begin
                                                                           SysUtils.Abort;
                                                                        end;
                                                               end
                                                            else
                                                               begin
                                                                  if MessageDlg(Format('This calf "%s" does not have a Weaning event recorded.'+#13#10+
                                                                                       'Do you want to include the animal in the sales group?',[GetAnimalInfo(AID, 'NatIDNum')]),mtWarning,[mbYes,mbNo],0) = idNo then
                                                                     begin
                                                                        SysUtils.Abort;
                                                                     end;
                                                               end;
                                                         end;
                                                   end;
                                             end;
                                       end;
                                 end;

                              if not VarIsNull( SaleDate > 0 ) and not VarIsNull( CustomerID > 0 ) and
                                 ( SaleDate > 0 ) and ( CustomerID > 0 ) then
                                 begin
                                    GetPreSaleStatusInfo( AID, SaleDate, StatusInfo,CustomerID );

                                    if EventDataHelper.GetLastEventDate(AID, -1, cPurchaseEvent) > 0 then // MK - 29.03.07
                                       begin
                                          if (StatusInfo.CheckMinimumDaysOnFarm) and (StatusInfo.NoDaysOnFarm < WinData.GlobalSettings.MinimumDaysToBeKeptOnFarmBeforeSale) then
                                             if MessageDlg(Format('This animal has not been on the farm for a minimum of %d days.'+#13#10+'Do you want to continue?',[WinData.GlobalSettings.MinimumDaysToBeKeptOnFarmBeforeSale]),mtWarning,[mbYes,mbNo],0) = idNo then
                                             SysUtils.Abort;

                                             if ( StatusInfo.CheckTBTest) and ( StatusInfo.TBTestDate <= IncMonth(Date, -12) ) then
                                             if MessageDlg('No TB Test Date has been found for this animal within a year from date of sale.'+#13#10+
                                                           'Do you want to continue?',mtWarning,[mbYes,mbNo],0) = idNo then
                                             SysUtils.Abort;

                                          if StatusInfo.CheckBrucellosis then
                                             if ( StatusInfo.BruceDate < ( Date - MinimumBrucellosisTestDays ) ) then
                                                if MessageDlg('No Brucellosis Test Date has been found for this animal within 30 days from date of sale.'+#13#10+
                                                              'Do you want to continue?',mtWarning,[mbYes,mbNo],0) = idNo then
                                                    SysUtils.Abort;
                                       end
                                    else
                                       begin
                                          //  if StatusInfo.NoDaysOnFarm < MinimumDaysOnFarm then
                                            //   if MessageDlg(Format('This animal has not been on the farm for a minimum of %d days.'+#13#10+
                                              // 'Do you want to continue?',[MinimumDaysOnFarm]),mtWarning,[mbYes,mbNo],0) = idNo then
                                                //  Abort;

                                          if ( StatusInfo.NoDaysOnFarm >= MaxDaysForDiseaseTestCheck ) then
                                             begin
                                                if DateOfBirth > IncMonth(Date, -12) then
                                                   begin
                                                      if ( StatusInfo.CheckTBTest) and ( StatusInfo.TBTestDate <= IncMonth(Date, -12) ) then
                                                         begin
                                                            if MessageDlg('No TB Test Date has been found for this animal'+#13#10+
                                                               'Do you want to continue?',mtWarning,[mbYes,mbNo],0) = idNo then
                                                                SysUtils.Abort;
                                                         end;
                                                   end
                                                else
                                                   begin
                                                      if ( StatusInfo.CheckTBTest) and ( StatusInfo.TBTestDate <= IncMonth(Date, -12) ) then
                                                         begin
                                                            if MessageDlg('No TB Test Date has been found for this animal in the past year.'+#13#10+
                                                                'Do you want to continue?',mtWarning,[mbYes,mbNo],0) = idNo then
                                                                 SysUtils.Abort;
                                                         end
                                                    end;
                                             end;

                                          if StatusInfo.CheckBrucellosis then
                                              if ( StatusInfo.NoDaysOnFarm >= MaxDaysForDiseaseTestCheck ) and ( StatusInfo.BruceDate < ( Date - MinimumBrucellosisTestDays ) ) then
                                                if MessageDlg('No Brucellosis Test Date has been found for this animal within 30 days from date of sale.'+#13#10+
                                                   'Do you want to continue?',mtWarning,[mbYes,mbNo],0) = idNo then
                                             SysUtils.Abort;
                                       end;
                                 end;
                           end;
                     end;

                  WinData.GroupLinks.Append;
                  WinData.GroupLinks.FieldByName('AnimalID').AsInteger    := AID;
                  WinData.GroupLinks.FieldByName('GroupID').AsInteger     := GroupID;
                  WinData.GroupLinks.FieldByName('DateJoined').AsDateTime := DateJoined;
                  WinData.GroupLinks.Post;

                  // if feed group
                  if gType = 'Feed' then
                     begin
                        if ShowConfirmMsg then
                           begin
                              if Messagedlg('Start animal "'+ ATagNo +
                                            '" on new group''s current feed regime?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
                                 exit;
                           end;
                        // find current group feed events
                        with qFeed do
                           begin
                              SQL.Clear;
                              SQL.Add('SELECT * FROM FeedRegime');
                              SQL.Add('WHERE GroupID = '+ IntToStr(GroupID));
                              open;
                              first;
                           end;
                        // allocate feed events to new animal
                        while NOT qFeed.EOF do
                           begin
                              WinData.FeedEvents.Append;
                              WinData.FeedEvents.FieldByName('AnimalID').AsInteger   := AID;
                              WinData.FeedEvents.FieldByName('FeedType').AsInteger   := qFeed.FieldByName('FeedType').AsInteger;
                              if ( DateJoined < qFeed.FieldByName('AllocDate').AsDateTime ) then
                                 WinData.FeedEvents.FieldByName('AllocDate').AsDateTime := qFeed.FieldByName('AllocDate').AsDateTime
                              else
                                 WinData.FeedEvents.FieldByName('AllocDate').AsDateTime := DateJoined;
                              WinData.FeedEvents.FieldByName('QuantDay').AsFloat     := qFeed.FieldByName('QuantDay').AsFloat;
                              WinData.FeedEvents.FieldByName('CostDay').AsFloat      := qFeed.FieldByName('CostDay').AsFloat;
                              WinData.FeedEvents.Post;
                              qFeed.Next;
                           end;
                     end

               end;
         end
      // YES
      else
         // Delete the Animal From the Group Grid
         if AllowDeletion then
            begin
               // search for existing animal feed event
               if gType = 'Feed' then
                  begin
                     with qFeed do
                        begin
                           SQL.Clear;
                           SQL.Add('SELECT * FROM FeedEvents');
                           SQL.Add('WHERE AnimalID = '+IntToStr(AID));
                           SQL.Add('AND   EndDate IS NULL');
                           open;
                        end;
                     qFeed.First;
                     if NOT qFeed.EOF then
                        begin
                           if ( not ShowConfirmMsg ) or
                             ( messagedlg('Animal ' + AnimalFileByIdAnimalNo.AsString +
                                         ' is on a current feeding regime,'+#13+
                                         ' Do you want to continue (and end feed)?',
                                         mtWarning,[mbYes,mbNo],0) = mrYes ) then
                              begin
                                 // delete from group
                                 WinData.GroupLinks.Delete;
                                 // end feed regime
                                 while NOT qFeed.EOF do
                                    begin
                                       if WinData.FeedEvents.Locate('ID',qFeed.FieldByName('ID').AsInteger,[]) then
                                          begin
                                             WinData.FeedEvents.edit;
                                             WinData.FeedEvents.FieldByName('EndDate').AsDateTime := DateJoined;
                                             WinData.FeedEvents.post;
                                          end;
                                       qFeed.Next;
                                    end;
                              end;
                        end
                     else
                        WinData.GroupLinks.Delete;
                  end
               else
                  WinData.GroupLinks.Delete;

            end;
   finally
      RemoveFromEventLookupData(AID, cFeedingEvent); // Remove old feed grp to update grid display
      AddToEventLookupData(AID, cFeedingEvent);  // Add any new feed grp to update grid display
      qFeed.Close;
      qFeed.Free;
   end;
end;

function TWinData.UpdateCountries : Boolean;
var
   MyTable : TTable;
begin
   RESULT := FALSE;
   try
      try
         with MyTable do
            begin
               MyTable := TTable.Create(nil);
               DataBaseName := KingData.DataBaseName;
               TableName := 'Countries.db';
               Open;
               if NOT Locate('Name','POLAND',[]) then
                  begin
                     Append;
                     FieldByName('ID').AsInteger := 13;
                     FieldbyName('Name').AsString := 'POLAND';
                     FieldByName('UserCanDelete').AsBoolean := FALSE;
                     Post;
                     RESULT := TRUE;
                  end
               else
                  RESULT := TRUE;
           end;
      except
        //
      end;
   finally
     MyTable.Close;
     MyTable.Free;
   end;
end;

function TWinData.CheckSlaughterEligibility: Boolean;
var
   MyQuery : TQuery;
   MyProgBar : TProgressBar;
   i : SmallInt;
   CutOffDate : TDateTime;
   Temp : TTable;
begin
   // SP 08/11/2001
   // Update SalesDeaths table, set Slaughter = true where Customer is Eligible for Slaughter.
   RESULT := False;
   MyQuery := TQuery.Create(nil);
   Temp := TTable.Create(nil);
   try
         CutOffDate := IncMonth(Date,-12);

         MyQuery.DataBaseName := KingData.DataBaseName;

         with Temp do
            begin
               DataBaseName := KingData.DatabaseName;
               TableType := ttParadox;
               TableName := 'Tmp1';

               with FieldDefs do
                  begin
                     Add('ID',ftAutoInc,0,FALSE);
                     Add('EventID',ftInteger,0,FALSE);
                  end;

               CreateTable;
               Open;
            end;

         with MyQuery do
            begin
               { Find all animals sold to a Slaughter Premium Eligble Customer, check if animals  }
               { are eligible, if so ensure that the Slaughter Boolean in SaleDeath table is True }
               SQL.Clear;
               SQL.Add('SELECT A.ID AnimalID, A.DateOfBirth, E.AnimalID, E.ID EventID, E.EventDate SaleDate, C.ID CID FROM Animals A');
               SQL.Add('LEFT JOIN Events E      ON (A.ID=E.AnimalID) ');
               SQL.Add('LEFT JOIN SalesDeaths S ON (E.ID=S.EventID) ');
               SQL.Add('LEFT JOIN Customers C   ON (S.Customer=C.ID) ');
               SQL.Add('WHERE (E.EventType = '+IntToStr(CSaleDeathEvent)+') ');
               SQL.Add('AND   (A.DateOfBirth IS NOT NULL) '); // Dont include animals that have no DOB
               SQL.Add('AND   (C.Slaughter=True) ');          // check the Customer Slaughter is true
               SQL.Add('AND   (S.Sold = True) ');             // Make sure the animal was sold and not culled
               Open;

               if NOT IsEmpty then
                  begin
                     MyProgBar := TProgressBar.Create(nil);
                     try
                        try
                           i := 0;
                           MyProgBar.Parent := Screen.ActiveForm;
                           MyProgBar.Height := 20;
                           MyProgBar.Align := alBottom;
                           MyProgBar.Min := 0;
                           MyProgBar.Max := MyQuery.RecordCount;
                           MyProgBar.Show;
                           Screen.ActiveForm.Refresh;
                        except
                           //
                        end;

                        First;
                        while NOT EOF do
                           begin
                              if CheckSlaughter(MyQuery.FieldByName('AnimalID').AsInteger, MyQuery.FieldByName('DateOfBirth').AsDateTime, MyQuery.FieldByName('SaleDate').AsDateTime) then
                                 begin
                                    Temp.Insert;
                                    Temp.FieldByName('EventID').AsInteger := MyQuery.FieldByName('EventID').AsInteger;
                                    Temp.Post;
                                 end;
                              inc(i);
                              MyProgBar.Position := i;
                              Next;
                           end;

                        with MyQuery do
                           begin
                              SQL.Clear;
                              SQL.Add('UPDATE SalesDeaths S SET S.Slaughter = TRUE     ');
                              SQL.Add('WHERE (S.EventID IN (SELECT EventID FROM Tmp1)) ');
                              ExecSQL;
                           end;
                     finally
                        MyProgBar.Parent := nil;
                        MyProgBar.Free;
                     end;
                  end;
            end;

         Temp.Active := False;
         Temp.EmptyTable;
         Temp.Active := True;

         with MyQuery do
            begin
               { Find all Sale Events sold with the Slaughter Boolean = True,            }
               { Loop through the resulting dataset, check the Slaughter Eligibility     }
               { Status of the Customer animal was sold too, if its not True, change the }
               { Slaughter boolean in SaleDeath Event to False }
               SQL.Clear;
               SQL.Add('SELECT A.ID AnimalID, A.DateOfBirth, E.AnimalID, E.ID EventID, E.EventDate SaleDate, C.ID CID FROM Animals A');
               SQL.Add('LEFT JOIN Events E      ON (A.ID=E.AnimalID) ');
               SQL.Add('LEFT JOIN SalesDeaths S ON (E.ID=S.EventID) ');
               SQL.Add('LEFT JOIN Customers C   ON (S.Customer=C.ID) ');
               SQL.Add('WHERE (E.EventType = '+IntToStr(CSaleDeathEvent)+') ');
               SQL.Add('AND   (A.DateOfBirth IS NOT NULL) '); // Dont include animals that have no DOB
               SQL.Add('AND   (C.Slaughter=False)  ');        // check the Customer Slaughter is true
               SQL.Add('AND   (S.Sold = True)      ');        // Make sure the animal was sold and not culled
               SQL.Add('AND   (S.Slaughter = True) ');        // Only events that are currently True (Eligible)
               Open;

               if NOT IsEmpty then
                  begin
                     MyProgBar := TProgressBar.Create(nil);
                     try
                        try
                           i := 0;
                           MyProgBar.Parent := Screen.ActiveForm;
                           MyProgBar.Height := 20;
                           MyProgBar.Align := alBottom;
                           MyProgBar.Min := 0;
                           MyProgBar.Max := MyQuery.RecordCount;
                           MyProgBar.Show;
                           Screen.ActiveForm.Refresh;
                        except
                           //
                        end;

                        First;
                        while NOT EOF do
                           begin
                              Temp.Insert;
                              Temp.FieldByName('EventID').AsInteger := MyQuery.FieldByName('EventID').AsInteger;
                              Temp.Post;

                              Inc(i);
                              MyProgBar.Position := i;
                              Next;
                           end;

                        with MyQuery do
                           begin
                              SQL.Clear;
                              SQL.Add('UPDATE SalesDeaths S SET S.Slaughter = False    ');
                              SQL.Add('WHERE (S.EventID IN (SELECT EventID FROM Tmp1)) ');
                              ExecSQL;
                           end;
                     finally
                        MyProgBar.Parent := nil;
                        MyProgBar.Free;
                     end;
                  end;
            end;

      Result := True;
   finally
      Temp.Close;
      Temp.DeleteTable;
      Temp.Free;

      MyQuery.Close;
      MyQuery.Free;
   end;
end;


function TWinData.GetMilkRecDir: String;
begin
   with Defaults do
      try
         Defaults.Open;
         Defaults.First;
         RESULT := Defaults.FieldByName('MilkRecDir').AsString;
         Defaults.Close;
      except
        //
      end;
end;

procedure TWinData.SetMilkRecDir(MilkRecDir: String);
begin
   with Defaults do
      try
         Defaults.Open;
         Defaults.First;
         Defaults.Edit;
         Defaults.FieldByName('MilkRecDir').AsString := MilkRecDir;
         Defaults.Post;
         Defaults.Close;
      except
        //
      end;
end;

function TWinData.HelpSocketHTMLHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
   CallHelp := True;
end;

function TWinData.PremiumFix : Boolean;
var
   MyEvents,
   MyBeefSubsidy,
   MyLookUpDamSire,
   MyPremiumType,
   tEventID : TTable;
   MyQuery,
   GetPrem : TQuery;
   DOB,
   NewDate : TDateTime;
   Sex : String;
   NoMonths : Integer;
   BullAppliedFor,
   FirstAppliedFor,
   SecondAppliedFor : Boolean;
   BullPremEID,
   FirstPremEID,
   SecondPremEID : Integer;
   MyProgBar : TProgressBar;
   MyPanel : TPanel;
   i : Integer;
begin

   RESULT := TRUE;
   if CheckPremiumEligibility then
      try
         try
            MyLookUpDamSire := TTable.Create(nil);
            MyLookUpDamSire.DatabaseName := KingData.DatabaseName;
            MyLookUpDamSire.TableName := LookUpDamSire.TableName;
            MyLookUpDamSire.Open;

            MyBeefSubsidy := TTable.Create(nil);
            MyBeefSubsidy.DatabaseName := KingData.DatabaseName;
            MyBeefSubsidy.TableName := BeefSubsidy.TableName;
            MyBeefSubsidy.Open;

            MyPremiumType := TTable.Create(nil);
            MyPremiumType.DatabaseName := KingData.DatabaseName;
            MyPremiumType.TableName := PremiumType.TableName;
            MyPremiumType.Open;

            tEventID := TTable.Create(nil);
            tEventID.DatabaseName := KingData.DatabaseName;
            tEventID.TableType := ttDefault;
            tEventID.TableName := 'TempIDs';
            tEventID.FieldDefs.Add('EventID',ftInteger,0,FALSE);
            tEventID.CreateTable;
            tEventID.Open;

            MyPanel := TPanel.Create(nil);
            MyPanel.Parent := Screen.ActiveForm;
            MyPanel.Font.Size := 8;
            MyPanel.Height := 20;
            MyPanel.Align := alBottom;
            MyPanel.Caption := 'Please wait...';
            MyPanel.Show;

            MyProgBar := TProgressBar.Create(nil);
            MyProgBar.Parent := Screen.ActiveForm;
            MyProgBar.Hide;
            MyProgBar.Height := 20;
            MyProgBar.Align := alBottom;
            Screen.ActiveForm.Refresh;

            MyQuery := TQuery.Create(nil);
            MyQuery.DataBaseName := KingData.DataBaseName;

            GetPrem := TQuery.Create(nil);
            GetPrem.DataBaseName := KingData.DataBaseName;


            // Reset all male animal lact's back to 0
            with MyQuery do
               begin
                  SQL.Clear;
                  SQL.Add('UPDATE Events E SET E.AnimalLactNo = 0 ');
                  SQL.Add('WHERE (E.AnimalID IN (SELECT A.ID FROM Animals A WHERE (A.Sex<>"Female")))');
                  ExecSQL;
               end;

            // now delete any prem events in events table that don't exist in Beef Sub table.
            with MyQuery do
               begin
                  SQL.Clear;
                  SQL.Add('DELETE FROM Events E ');
                  SQL.Add('WHERE (E.EventType IN ('+IntToStr(CPremiumBullEvent)+','+IntToStr(CPremium10Event)+','+IntToStr(CPremium22Event)+')) ');
                  SQL.Add('AND NOT (E.ID IN (SELECT EventID FROM BEEFSUB))');
                  ExecSQL;
               end;

            // delete all the female's with premium events
            with MyQuery do
               begin
                  // First delete all premium records in the beefsub table that belong to females.
                  SQL.Clear;
                  SQL.Add('DELETE FROM BeefSub B WHERE (B.EventID IN ');
                  SQL.Add('                            (SELECT E.ID FROM Events E ');
                  SQL.Add('			       LEFT JOIN Animals A ON (A.ID=E.AnimalID) ');
                  SQL.Add('			       WHERE EventType IN ('+IntToStr(CPremiumBullEvent)+','+IntToStr(CPremium10Event)+','+IntToStr(CPremium22Event)+') ');
                  SQL.Add('			       AND A.Sex="Female")) ');
                  ExecSQL;

                  // Now delete the remaining premium records in the Events table that belong to females.
                  SQL.Clear;
                  SQL.Add('DELETE FROM Events E WHERE (E.ID IN ');
                  SQL.Add('                            (SELECT E2.ID FROM Events E2 ');
                  SQL.Add('			       LEFT JOIN Animals A ON (A.ID=E2.AnimalID)');
                  SQL.Add('			       WHERE E2.EventType IN ('+IntToStr(CPremiumBullEvent)+','+IntToStr(CPremium10Event)+','+IntToStr(CPremium22Event)+') ');
                  SQL.Add('			       AND A.Sex="Female")) ');
                  ExecSQL;
               end;

            // Now select all premium events from events table.
            with MyQuery do
               begin
                  SQL.Clear;
                  SQL.Add('SELECT * FROM events');
                  SQL.Add('WHERE ( EventType = ' + IntToStr(CPremium10Event) + ')');
                  SQL.Add('   OR ( EventType = ' + IntToStr(CPremium22Event) + ')');
                  SQL.Add('   OR ( EventType = ' + IntToStr(CPremiumBullEvent) + ')');
                  Open;

                  First;
                  // loop tru and validate.
                  MyPanel.Hide;

                  MyProgBar.Min := 0;
                  MyProgBar.Max := MyQuery.RecordCount;
                  MyProgBar.Show;

                  while NOT MyQuery.EOF do
                     begin
                        if MyLookUpDamSire.Locate('ID',MyQuery.FieldByName('AnimalID').AsInteger,[]) then
                           begin
                              DOB := MyLookUpDamSire.FieldByName('DateOfBirth').AsDateTime;
                              Sex := MyLookUpDamSire.FieldByName('Sex').AsString;

                              if Sex = 'Bull' then
                                 begin
                                    NoMonths := GetNoMonthsOrDaysForPrem(MyPremiumType,M,B);
                                    NewDate := IncMonth(DOB, NoMonths);
                                    BullAppliedFor := False;

                                    with GetPrem do
                                       begin
                                          SQL.Clear;
                                          SQL.Add('Select * From BeefSub B ');
                                          SQL.Add('Where B.AnimalID = ('+MyLookUpDamSire.FieldByName('ID').AsString +')');
                                          SQL.Add('And (B.PremiumType = "B") ');
                                          Open;
                                          if NOT GetPrem.IsEmpty then
                                             begin
                                                if GetPrem.RecordCount > 1 then
                                                   begin
                                                      GetPrem.First;
                                                      While NOT GetPrem.EOF do
                                                         begin
                                                            if NOT(BullAppliedFor) then
                                                               if GetPrem.FieldByName('ApplicationDate').AsDateTime > 0 then
                                                                  BullAppliedFor := True;
                                                            GetPrem.Next;
                                                         end;

                                                      GetPrem.First;
                                                      if BullAppliedFor then
                                                         begin
                                                            While NOT GetPrem.EOF do
                                                               begin
                                                                  // Get all the Event ID's of applics not made, insert them into TempIDs
                                                                  if GetPrem.FieldByName('ApplicationDate').AsDateTime <= 0 then
                                                                     begin
                                                                        tEventID.Insert;
                                                                        tEventID.FieldByName('EventID').AsInteger := GetPrem.FieldByName('EventID').AsInteger;
                                                                        tEventID.Post;
                                                                     end;
                                                                  GetPrem.Next;
                                                               end;
                                                         end
                                                      else
                                                         begin
                                                            // Keep the first one!
                                                            GetPrem.Next;
                                                            While NOT GetPrem.EOF do
                                                               begin
                                                                  tEventID.Insert;
                                                                  tEventID.FieldByName('EventID').AsInteger := GetPrem.FieldByName('EventID').AsInteger;
                                                                  tEventID.Post;
                                                                  GetPrem.Next;
                                                               end;
                                                         end;
                                                   end;
                                             end;
                                       end
                                 end
                              else if Sex = 'Steer' then
                                 begin
                                    NoMonths := GetNoMonthsOrDaysForPrem(MyPremiumType,M,F);
                                    NewDate := IncMonth(DOB, NoMonths);
                                    FirstAppliedFor := False;

                                    with GetPrem do
                                       begin
                                          SQL.Clear;
                                          SQL.Add('Select * From BeefSub B ');
                                          SQL.Add('Where B.AnimalID = ('+MyLookUpDamSire.FieldByName('ID').AsString +')');
                                          SQL.Add('And (B.PremiumType = "F") ');
                                          Open;
                                          if NOT GetPrem.IsEmpty then
                                             begin
                                                if GetPrem.RecordCount > 1 then
                                                   begin
                                                      GetPrem.First;
                                                      While NOT GetPrem.EOF do
                                                         begin
                                                            if NOT(FirstAppliedFor) then
                                                               if GetPrem.FieldByName('ApplicationDate').AsDateTime > 0 then
                                                                  FirstAppliedFor := True;
                                                            GetPrem.Next;
                                                         end;

                                                      GetPrem.First;
                                                      if FirstAppliedFor then
                                                         begin
                                                            While NOT GetPrem.EOF do
                                                               begin
                                                                  // Get all the Event ID's of applics not made, insert them into TempIDs
                                                                  if GetPrem.FieldByName('ApplicationDate').AsDateTime <= 0 then
                                                                     begin
                                                                        tEventID.Insert;
                                                                        tEventID.FieldByName('EventID').AsInteger := GetPrem.FieldByName('EventID').AsInteger;
                                                                        tEventID.Post;
                                                                     end;
                                                                  GetPrem.Next;
                                                               end;
                                                         end
                                                      else
                                                         begin
                                                            // Keep the first one!
                                                            GetPrem.Next;
                                                            While NOT GetPrem.EOF do
                                                               begin
                                                                  tEventID.Insert;
                                                                  tEventID.FieldByName('EventID').AsInteger := GetPrem.FieldByName('EventID').AsInteger;
                                                                  tEventID.Post;
                                                                  GetPrem.Next;
                                                               end;
                                                         end;
                                                   end;
                                             end;
                                       end;


                                    NoMonths := GetNoMonthsOrDaysForPrem(MyPremiumType,M,S);
                                    NewDate := IncMonth(DOB, NoMonths);
                                    SecondAppliedFor := False;

                                    with GetPrem do
                                       begin
                                          SQL.Clear;
                                          SQL.Add('Select * From BeefSub B ');
                                          SQL.Add('Where B.AnimalID = ('+MyLookUpDamSire.FieldByName('ID').AsString +')');
                                          SQL.Add('And (B.PremiumType = "S") ');
                                          Open;
                                          if NOT GetPrem.IsEmpty then
                                             begin
                                                if GetPrem.RecordCount > 1 then
                                                   begin
                                                      GetPrem.First;
                                                      While NOT GetPrem.EOF do
                                                         begin
                                                            if NOT(SecondAppliedFor) then
                                                               if GetPrem.FieldByName('ApplicationDate').AsDateTime > 0 then
                                                                  SecondAppliedFor := True;
                                                            GetPrem.Next;
                                                         end;

                                                      GetPrem.First;
                                                      if SecondAppliedFor then
                                                         begin
                                                            While NOT GetPrem.EOF do
                                                               begin
                                                                  // Get all the Event ID's of applics not made, insert them into TempIDs
                                                                  if GetPrem.FieldByName('ApplicationDate').AsDateTime <= 0 then
                                                                     begin
                                                                        tEventID.Insert;
                                                                        tEventID.FieldByName('EventID').AsInteger := GetPrem.FieldByName('EventID').AsInteger;
                                                                        tEventID.Post;
                                                                     end;
                                                                  GetPrem.Next;
                                                               end;
                                                         end
                                                      else
                                                         begin
                                                            // Keep the first one!
                                                            GetPrem.Next;
                                                            While NOT GetPrem.EOF do
                                                               begin
                                                                  tEventID.Insert;
                                                                  tEventID.FieldByName('EventID').AsInteger := GetPrem.FieldByName('EventID').AsInteger;
                                                                  tEventID.Post;
                                                                  GetPrem.Next;
                                                               end;
                                                         end;
                                                   end;
                                             end;
                                       end;
                                 end;

                           end;
                           inc(i);
                           MyProgBar.Position := i;
                           Screen.ActiveForm.Refresh;
                           MyQuery.Next;
                     end;
               end;

               with MyQuery do
                  begin
                     SQL.Clear;
                     SQL.Add('DELETE FROM BeefSub B WHERE (B.EventID IN (SELECT EventID FROM TempIDs)) ');
                     ExecSQL;

                     SQL.Clear;
                     SQL.Add('DELETE FROM Events E WHERE (E.ID IN (SELECT EventID FROM TempIDs)) ');
                     ExecSQL;
                  end;

         except
            RESULT := FALSE;
            MessageDlg('Unable to complete premium update, contact Kingswood',mtError,[mbOK],0);
         end;
      finally
         MyProgBar.Hide;
         MyPanel.Hide;
         MyLookUpDamSire.Close;
         MyLookUpDamSire.Free;
         MyBeefSubsidy.Close;
         MyBeefSubsidy.Free;
         MyPremiumType.Close;
         MyPremiumType.Free;
         tEventID.Close;
         tEventID.DeleteTable;
         tEventID.Free;
         MyQuery.Close;
         MyQuery.Free;
         GetPrem.Close;
         GetPrem.Free;
         Screen.ActiveForm.Refresh;
      end;
end;

function TWinData.GetICBFMMR: Boolean;
begin
   with defaults do
      try
         Open;
         First;
         RESULT := FieldByName('ICBFMMR').AsBoolean;
         Close;
      except
        //
      end;
end;

procedure TWinData.SetICBFMMR(const Value: Boolean);
begin
   // SP MMR
   with Defaults do
      try
         Open;
         if RecordCount > 0 then
            begin
               First;
               Edit;
               FieldByName('ICBFMMR').AsBoolean := Value;
               Post;
            end;

      finally
        Close;
      end;
end;

function TWinData.GetUseEuro: Boolean;
begin
   with Defaults do
      begin
         Open;
         First;
         RESULT := FieldByName('EConvert').AsBoolean; //DefaultsEuro.Value;
         Close;
      end;
end;

procedure TWinData.SetUseEuro(const Value: Boolean);
begin
   with Defaults do
      begin
         Open;
         First;
         Edit;
         FieldByName('EConvert').AsBoolean := Value;
         Post;
         Close;
      end;
end;

function TWinData.GetReportInEuro: Boolean;
begin
   with Defaults do
      begin
         Open;
         First;
         RESULT := FieldByName('ReportInEuro').AsBoolean; //DefaultsEuro.Value;
         Close;
      end;
end;

procedure TWinData.SetReportInEuro(const Value: Boolean);
begin
   with Defaults do
      begin
         Open;
         First;
         Edit;
         FieldByName('ReportInEuro').AsBoolean := Value;
         Post;
         Close;
      end;
end;

function TWinData.UpdateSuckPremTable: Boolean;
var
   GenQuery : TQuery;
   MyTable : TTable;
   GenBool : Boolean;
begin
   RESULT := FALSE;
   GenBool := False;
   MyTable := TTable.Create(nil);
   GenQuery := TQuery.Create(nil);
   try
      GenQuery.DataBaseName := KingData.DataBaseName;
      MyTable.DatabaseName := KingData.DatabaseName;
      MyTable.TableName := 'sAppliedFor.db';

      MyTable.Open;
      try
         GenBool := ( MyTable.FieldDefs.IndexOf('ApplicationDate') < 0 );

         if GenBool then
            begin
               with GenQuery do
                  begin
                     MyTable.Close;
                     SQL.Clear;
                     SQL.Add('ALTER TABLE SAppliedFor ADD ApplicationDate DATE, ADD RetensionDate DATE ');
                     ExecSQL;
                     RESULT := TRUE;
                  end;
            end
         else
            RESULT := TRUE;
      finally
         MyTable.Close;
         GenQuery.Close;
      end;
   finally
      MyTable.Free;
      GenQuery.Free;
   end;
end;

function TWinData.CreateSuckSubsTable: Boolean;
var
   MyTable : TTable;
   GenBool : Boolean;
begin
   RESULT := FALSE;
   MyTable := TTable.Create(nil);
   try
      with MyTable do
         begin
            DataBaseName := KingData.DataBaseName;
            TableType := ttParadox;
            TableName := 'SuckApplicReplace.db';

            GenBool := MyTable.Exists;
            if NOT GenBool then
               begin
                  with FieldDefs do
                     begin
                        Add('ID',ftAutoInc,0,True);
                        Add('LastAID',ftInteger,0,False);
                        Add('NewAID',ftInteger,0,False);
                        Add('Date',ftDate,0,False);
                        Add('ReplaceDate',ftDate,0,False);
                        Add('SuckApplicID',ftInteger,0,False);
                        Add('SuckApplicDate',ftDate,0,False);
                        Add('Description',ftString,20,False);
                        Add('Comment',ftString,30,False);

                        with indexdefs do
                           begin
                              Clear;
                              Add('','ID',[ixPrimary,ixUnique]);
                           end;
                     end;
                  CreateTable;
                  Open;
                  RESULT := TRUE;
                  Close;
               end
            else
               RESULT := TRUE;
         end;
   finally
      MyTable.Free;
   end;
end;


procedure TWinData.SuckReplaceAfterPost(DataSet: TDataSet);
begin
   KingData.ApplyUpdates([SuckReplace]);
end;

function TWinData.IsAnimalUnderRetention(AID: Integer;
  EDate: TDateTime): Boolean;
var
   MyQuery : TQuery;
   SAppliedFor : TTable;
   ApplicDate : TDateTime;
   Cow,
   HasPrem : Boolean;
   CutOffDate : TDateTime;
begin

   HasPrem := False;
   ApplicDate := 0;

   dSuckHerdID     := 0;
   dSuckApplicID   := 0;
   dSuckApplicDate := 0;
   dRetensionDate  := 0;

   RESULT := FALSE;

   try
      try
         { NB: For suckler premium only 1 application per year per herd is allowed. }

         MyQuery := TQuery.Create(nil);
         MyQuery.DataBaseName := KingData.DataBaseName;

         SAppliedFor := TTable.Create(nil);
         SAppliedFor.DatabaseName := KingData.DataBaseName;
         SAppliedFor.TableName := 'SAppliedFor.db';
         SAppliedFor.Open;

         { Only look for animals that have applied premium from the start date. }
         CutOffDate := StrToDate(SPOpeningDate);

         with MyQuery do
            begin
               SQL.Clear;
               SQL.Add('SELECT MAX(DateOfApplic) ApplicDate FROM '+tSApplic.TableName+'');
               SQL.Add('WHERE (DateOfApplic IS NOT NULL)');
               SQL.Add('AND   (DateOfApplic >= ' + '''' + FormatDateTime(cUSDateStyle,CutOffDate) + '''' +')');
               SQL.Add('AND   (HerdID = '+IntToStr(AnimalFileByIDHerdID.AsInteger)+')');
               Open;

               if MyQuery.FieldByName('ApplicDate').AsDateTime > 0 then
                  begin
                     { An Application has been made for this HerdID, get the App. Data }
                     dSuckApplicDate := MyQuery.FieldByName('ApplicDate').AsDateTime; // Store the App Date
                     dSuckHerdID     := AnimalFileByIDHerdID.AsInteger; // Store the App Herd ID
                  end
               else
                  begin
                     if EDate <= 0 then // might need to change this
                        MessageDlg('No Suckler Applications for this herd have been made',mtInformation,[mbOK],0);
                     Exit;
                  end;

            end;

         { Ok, now see if [Arg AID] was in the application. if so store relevant info in vars }
         if sAppliedFor.Locate('AnimalID;ApplicationDate',VarArrayOf([AID, dSuckApplicDate]),[]) then
            begin
               dSuckApplicID   := sAppliedFor.FieldByName('ApplicationID').AsInteger;
               dRetensionDate  := sAppliedFor.FieldByName('RetensionDate').AsDateTime;
               dLactNo         := sAppliedFor.FieldByName('LactNo').AsInteger;
               HasPrem := True;
            end;

         if HasPrem then
            begin
               // Check to see if the event falls within retension period. if so then go ahead with replacement.
               if EDate > 0 then
                  begin
                    { If EDate is NOT greater than Rentention Date return false, user not allowed be substituted, else return true }
                     if EDate <= dRetensionDate then
                        RESULT := TRUE
                     else
                        RESULT := FALSE;
                  end
               else
                  begin
                     { If EDate = 0 then the animal can be substituted }

                     WinData.CheckEvents.Filter := '';
                     WinData.CheckEvents.Filtered := False;

                     { Get the status of the animal when the application was made }
                     { For heifers this can obviously change, they could have become cow since application }
                     WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(WinData.AnimalFileByIDID.AsInteger) + ') And (EventType = ' + IntToStr(CCalvingEvent) + ')';
                     WinData.CheckEvents.Filtered := True;
                     WinData.CheckEvents.First;
                     while NOT WinData.CheckEvents.EOF do
                        begin
                           Cow := WinData.CheckEvents.FieldByName('EventDate').AsDateTime < WinData.dSuckApplicDate;
                           WinData.CheckEvents.Next;
                        end;

                     if NOT Cow then
                        begin
                           // If the animal wasn't a cow before the application, see if it is now. Check to see if a calving date exists between
                           // Application Date and Retention date

                           // If has calved since, which means the user ignored the replacement warning, then let them proceed with replacement now.
                           WinData.CheckEvents.First;
                           while NOT WinData.CheckEvents.EOF do
                              begin
                                 if WinData.CheckEvents.FieldByName('EventDate').AsDateTime >= WinData.dSuckApplicDate then
                                    if WinData.CheckEvents.FieldByName('EventDate').AsDateTime <= dRetensionDate then
                                       begin
                                          RESULT := True;
                                          Break;
                                       end;

//                                 if NOT RESULT then
                                 WinData.CheckEvents.Next;
                              end;
                        end;

                     // Clear the Filter
                     WinData.CheckEvents.Filter := '';
                     WinData.CheckEvents.Filtered := False;

                     // If animal has been sold/killed since, which means the user ignored the replacement warning, then let them proceed with replacement now.
                     if NOT RESULT then
                        if WinData.CheckEvents.Locate('AnimalID;EventType',VarArrayOf([WinData.AnimalFileByIDID.AsInteger,CSaleDeathEvent]),[]) then
                           begin
                              if WinData.CheckEvents.FieldByName('EventDate').AsDateTime >= dSuckApplicDate then
                                 if WinData.CheckEvents.FieldByName('EventDate').AsDateTime <= dRetensionDate then
                                    RESULT := True;
                           end;
                     // else if neither of above just give message
                     if NOT RESULT then
                        MessageDlg('Animal must have appropriate event recorded before proceeding with replacement',mtInformation,[mbOK],0);
                  end;
            end
         else
            begin
               if EDate <= 0 then
                  MessageDlg('Animal has not been applied for this year',mtInformation,[mbOK],0);
               RESULT := FALSE;
            end;
      except
         RESULT := FALSE;
      end;
   finally
      MyQuery.Close;
      MyQuery.Free;
      SAppliedFor.Close;
      SAppliedFor.Free;
   end;
end;

procedure TWinData.SuckReplaceAfterInsert(DataSet: TDataSet);
begin
   DataSet.FieldByName('Comment').AsString := 'Suckler Cow Replacement';
end;

function TWinData.CreateSuckQuotaField: Boolean;
var
   MyTable : TTable;
   MyQuery : TQuery;
   GenBool : Boolean;
begin
   RESULT := False;
   try
      try
         MyTable := TTable.Create(nil);
         MyTable.DatabaseName := KingData.DatabaseName;
         MyTable.TableName := 'Owners';
         MyTable.Open;

         MyQuery := TQuery.Create(nil);
         MyQuery.DatabaseName := KingData.DatabaseName;

         GenBool := (MyTable.FieldDefs.IndexOf('SuckQuota') < 0);
         MyTable.Close;
         if GenBool then
            begin
               MyQuery.SQL.Clear;
               MyQuery.SQL.Add('ALTER TABLE Owners ADD SuckQuota Integer');
               MyQuery.ExecSQL;

               MyQuery.SQL.Clear;
               MyQuery.SQL.Add('Update Owners Set SuckQuota = 0');
               MyQuery.ExecSQL;

               MyQuery.SQL.Clear;
               MyQuery.SQL.Add('ALTER TABLE Owners ADD MilkQuota Float');
               MyQuery.ExecSQL;

               MyQuery.SQL.Clear;
               MyQuery.SQL.Add('Update Owners Set MilkQuota = 0');
               MyQuery.ExecSQL;

               RESULT := True;
            end
         else
            RESULT := True;
      except
        //
      end;
   finally
      MyTable.Close;
      MyTable.Free;
      MyQuery.Close;
      MyQuery.Free;
   end;
end;

function TWinData.AmmendSuckTable: Boolean;
var
   GenQuery : TQuery;
   MyTable : TTable;
   GenBool : Boolean;
begin
   RESULT := FALSE;
   GenBool := False;
   try
      try
         GenQuery := TQuery.Create(nil);
         GenQuery.DataBaseName := KingData.DataBaseName;

         MyTable := TTable.Create(nil);
         MyTable.DatabaseName := KingData.DatabaseName;
         MyTable.TableName := 'sApplic.db';
         MyTable.Open;

         GenBool := ( MyTable.FieldDefs.IndexOf('MinHeifer') < 0 );
         MyTable.Close;

         if GenBool then
            begin
               with GenQuery do
                  begin
                     SQL.Clear;
                     SQL.Add('ALTER TABLE SApplic ADD MinHeifer Integer,      ');
                     SQL.Add('                    ADD MaxHeifer Integer,      ');
                     SQL.Add('                    ADD HeifersApplied Integer, ');
                     SQL.Add('                    ADD CowsApplied Integer     ');
                     ExecSQL;

                     SQL.Clear;
                     SQL.Add('ALTER TABLE SAppliedFor ADD LactNo Integer      ');
                     ExecSQL;

                     RESULT := TRUE;
                  end
            end
         else
            RESULT := TRUE;
      except
      end;
   finally
      MyTable.Close;
      MyTable.Free;
      GenQuery.Close;
      GenQuery.Free;
   end;
end;

function TWinData.AmmendReplaceTable: Boolean;
var
   q : TQuery;
   GenBool : Boolean;
   MyTable : TTable;
begin
   try
      RESULT := False;
      try

         // This function is for data that was updated with an early test version.
         // Field Date is longer to be used, use replace date.
         MyTable := TTable.Create(nil);
         MyTable.DataBaseName := KingData.DataBaseName;
         MyTable.TableName := 'SuckApplicReplace';

         MyTable.Open;
         GenBool := ((SuckReplace.FieldDefs.IndexOf('ReplaceDate') < 0) AND (SuckReplace.FieldDefs.IndexOf('Date') > 0));
         MyTable.Close;

         if GenBool then
            begin
               q := TQuery.Create(nil);
               q.DataBaseName := KingData.DataBaseName;

               with q do
                  begin
                     SQL.Clear;
                     SQL.Add('ALTER TABLE '+MyTable.TableName+' ADD ReplaceDate Date ');
                     ExecSQL;
                     RESULT := True;
                  end;
            end
         else
            RESULT := True;
      except
         //
      end;
   finally
      if GenBool then
         begin
            q.Close;
            q.Free;
         end;
      MyTable.Free;
   end;

end;

function TWinData.UpdateICBFDeleteTable: Boolean;
var
   qICBFUpdate : TQuery;
   GenBool : Boolean;
   MyTable : TTable;
begin
   try
      RESULT := False;
      try

         MyTable := TTable.Create(nil);
         MyTable.DataBaseName := KingData.DataBaseName;
         MyTable.TableName := 'ICBFDelete';

         MyTable.Open;
         GenBool := (MyTable.FieldDefs.IndexOf('HerdID') < 0);
         MyTable.Close;

         if GenBool then
            begin
               qICBFUpdate := TQuery.Create(nil);
               qICBFUpdate.DataBaseName := KingData.DataBaseName;

               with qICBFUpdate do
                  begin
                     SQL.Clear;
                     SQL.Add('ALTER TABLE ICBFDelete ADD HerdID Integer ');
                     ExecSQL;
                     RESULT := True;
                  end;
            end
         else
            RESULT := True;

      except
         //
      end;

   finally
      if GenBool then
         begin
            qICBFUpdate.Close;
            qICBFUpdate.Free;
         end;
      MyTable.Free;
   end;

end;

function TWinData.AsgnHIDICBFDeleteEvents: Boolean;
begin
   // When first created the ICBF Delete table did not contain the HerdId of the Animal who's event was being deleted.
end;

function TWinData.ModifySuckField: Boolean;
var
   qICBFUpdate : TQuery;
   GenBool : Boolean;
   MyTable : TTable;
   TmpStr : String;
begin
   try
      RESULT := False;
      try
         // Change in the datatype of SuckQuota.
         MyTable := TTable.Create(nil);
         MyTable.DataBaseName := KingData.DataBaseName;
         MyTable.TableName := 'Owners';

         MyTable.Open;
         GenBool := ((MyTable.FieldDefs.IndexOf('SuckQuota') > 0) AND (MyTable.FieldDefs.IndexOf('SucklerQuota') < 0));
         MyTable.Close;

         if GenBool then
            begin
               qICBFUpdate := TQuery.Create(nil);
               qICBFUpdate.DataBaseName := KingData.DataBaseName;

               with qICBFUpdate do
                  begin
                     SQL.Clear;
                     SQL.Add('ALTER TABLE Owners ADD SucklerQuota Float ');
                     ExecSQL;

                     MyTable.Open;
                     MyTable.First;
                     While NOT MyTable.Eof do
                        begin
                           if NOT(MyTable.FieldByName('SuckQuota').IsNull) then
                              begin
                                 MyTable.Edit;
                                 TmpStr := IntToStr(MyTable.FieldByName('SuckQuota').AsInteger);
                                 MyTable.FieldByName('SucklerQuota').AsFloat := StrToFloat(TmpStr);
                                 MyTable.Post;
                              end;
                           MyTable.Next;
                        end;

                     MyTable.Close;

                     SQL.Clear;
                     SQL.Add('ALTER TABLE Owners Drop SuckQuota');
                     ExecSQL;

                     RESULT := True;
                  end;
            end
         else
            RESULT := True;

      except
         //
      end;

   finally
      if GenBool then
         begin
            qICBFUpdate.Close;
            qICBFUpdate.Free;
         end;
      MyTable.Free;
   end;
end;

function TWinData.KRound(Value: Double): Double;
var
   Position : Integer;
   Sub : String;
begin
   try
      RESULT := 0;
      If Pos('.',FloatToStr(Value)) > 0 then
         begin
            Position := Pos('.',FloatToStr(Value));
            Sub := Copy(FloatToStr(Value), Position+1, 1);
            if StrToInt(Sub) >= 1 then
               Value := (Value+1);
            RESULT := Trunc(Value);
         end
      else
         RESULT := Value;
   except
     //
   end;
end;

procedure TWinData.IncDecAnimalsApplied(DoWhat: Integer);
begin
   // dSuckApplicID is got while checking if animal is under retention.

{ cIncCows = 0;  cDecCows = 1;  cIncHefs = 2;   cDecHefs = 3;

  if animal has claimed suckler premium, and is Sold/Killed Off/ or in case of Heifer, Calved then
  decrease the number of a) CowsApplied d) HeifersApplied

  When Replacement event has taken place the increase the number of a) CowsApplied d) HeifersApplied }

   try
      with tsApplic do
         begin
            Open;
            if Locate('ID', dSuckApplicID, [] ) then
               begin
                  Edit;
                  case DoWhat of
                     0 : begin
                            tsApplic.FieldByName('CowsApplied').AsInteger    := (tsApplic.FieldByName('CowsApplied').AsInteger+1);
                         end;
                     1 : begin
                            tsApplic.FieldByName('CowsApplied').AsInteger    := (tsApplic.FieldByName('CowsApplied').AsInteger-1);
                         end;
                     2 : begin
                            tsApplic.FieldByName('HeifersApplied').AsInteger := (tsApplic.FieldByName('HeifersApplied').AsInteger+1);
                         end;
                     3 : begin
                            tsApplic.FieldByName('HeifersApplied').AsInteger := (tsApplic.FieldByName('HeifersApplied').AsInteger-1);
                         end;
                  end;
                  Post;
               end;
         end;
   finally
      //
   end;
end;

function TWinData.CheckRetentionMsg : Boolean;
var
   ACount : TQuery;
   nYear,
   nMonth,
   nDay : Word;
begin
   try
      with ACount do
         begin
            ACount := TQuery.Create(nil);
            DataBaseName := WinData.KingData.DataBaseName;

            DecodeDate(Date, nYear, nMonth, nDay);

            SQL.Clear;
            SQL.Add('SELECT MinHeifer, HeifersApplied, HerdID FROM SApplic');
            SQL.Add('WHERE (YearOfApplic = ' + '''' + IntToStr(nYear) + '''' +')');
            SQL.Add('AND  (HerdID= ' + IntToStr(WinData.dSuckHerdID) + ')');
            Open;

            RESULT := ((ACount.FieldByName('HeifersApplied').AsInteger) <= (ACount.FieldByName('MinHeifer').AsInteger));

         end;
   finally
      ACount.Close;
      ACount.Free;
   end;
end;

function TWinData.HasSaleDeath(AnimalID, HerdID: Integer): Boolean;
begin
   qSaleExists.Active := False;
   qSaleExists.Params[0].Value := AnimalID;
   qSaleExists.Prepared := True;
   qSaleExists.Active := True;
   try
      Result := qSaleExists.FieldByName('CountOfSale').AsInteger > 0;
   finally
      qSaleExists.Active := False;
   end;

{   WinData.LookUpSaleDeath.Open;
   try


      // SP, to prevent user editing Sale/Death event from the Sale/Death Icon in MenuUnit. requested by "GL"
      if WinData.CheckEvents.Locate('AnimalID;HerdID;EventType',VarArrayOf([AnimalID, HerdID, CSaleDeathEvent ]),[]) then
      //   if WinData.LookUpSaleDeath.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger, []) then
            Result := True
         else
            Result := False;
   finally
      WinData.LookUpSaleDeath.Close;
   end;
}
end;

function TWinData.CheckBreedTable : Boolean;
var
   i : Integer;
   GenBool : Boolean;
begin
   Result := False;
   try
      with Breeds do
         begin
            Breeds.Open;
            GenBool := not(Locate('Code', 'BFX', [loCaseInsensitive]));
            if GenBool then
               begin
                  i := 0;
                  while i <= (High(iBreedCodes)) do
                     begin
                        if NOT(Locate('Code', iBreedCodes[i], [loCaseInsensitive])) then
                           begin
                              Append;
                              FieldByName('Name').AsString := iBreedNames[i];
                              FieldByName('Code').AsString := iBreedCodes[i];
                              FieldByName('GestationPeriod').AsInteger := cGestationPeriod;
                              FieldByName('EligibleforPremium').AsBoolean := True;
                              FieldByName('Selected').AsBoolean := False;
                              Post;
                           end;
                        Inc(i);
                     end;
                  dbiSaveChanges(Breeds.Handle);
               end;
            Breeds.Close;
            Result := True;
         end;
   except
      if ( Breeds.Active ) and ( Breeds.State in dsEditModes ) then
         Breeds.CancelUpdates;
   end;
end;

function TWinData.UpdateMedicines: Boolean;
var
   i : ShortInt;
begin
{   with WinData.Medicine do
      begin
         for i := 1 to 89 do
            begin
               Append;
               Case i of
                    0 : begin
                           FieldByName('Name').AsString := 'Albex 2.5%';
                           FieldByName('WithDrawal').AsInteger := 14;
                        end;
                    1 : begin
                           FieldByName('Name').AsString := '';
                           FieldByName('WithDrawal').AsInteger := ;
                        end;
                    2 : begin
                           FieldByName('Name').AsString := '';
                           FieldByName('WithDrawal').AsInteger := ;
                        end;
                    4 : begin
                           FieldByName('Name').AsString := '';
                           FieldByName('WithDrawal').AsInteger := ;
                        end;
                    5 : begin
                           FieldByName('Name').AsString := '';
                           FieldByName('WithDrawal').AsInteger := ;
                        end;

               end;
               Post;
            end;
         DBISaveChanges(Medicine.Handle);
      end;
}
end;

procedure TWinData.PremiaDefaultsAfterPost(DataSet: TDataSet);
begin
   KingData.ApplyUpdates([PremiaDefaults]);
end;


function TWinData.MooreParkUpdate: Boolean;
var
   i : ShortInt;
   GenQuery : TQuery;
   TempTable : TTable;
   GenBool : Boolean;
begin
   Result := False;
   try
      { Update GenLook Table }
      try
         Result := False;
         i := 0;
         // Add Embryo Lookups
         with GenLookUp do
            begin
               if not GenLookUp.Active then
                  GenLookUp.Active := True;

               GenBool := Locate('LookupCode', 'ETFH', []);

               if not GenBool then
                  while i <= 1 do
                     begin
                        Append;
                        case i of
                           0 : begin
                                  FieldByName('ListType').AsInteger      := LEmbryoType;
                                  FieldByName('Description').AsString    := 'Fresh - Embryo Transfer';
                                  FieldByName('UserCanDelete').AsBoolean := False;
                                  FieldByName('LookupCode').AsString     := 'ETFH';
                               end;
                           1 : begin
                                  FieldByName('ListType').AsInteger      := LEmbryoType;
                                  FieldByName('Description').AsString    := 'Frozen - Embryo Transfer';
                                  FieldByName('UserCanDelete').AsBoolean := False;
                                  FieldByName('LookupCode').AsString     := 'ETFN';
                               end;
{                           2 : begin
                                  FieldByName('ListType').AsInteger      := LIntExamRes;
                                  FieldByName('Description').AsString    := 'Main Result';
                                  FieldByName('UserCanDelete').AsBoolean := False;
                                  FieldByName('LookupCode').AsString     := 'MR';
                               end;
                           3 : begin
                                  FieldByName('ListType').AsInteger      := LIntExamRes;
                                  FieldByName('Description').AsString    := 'Second Result';
                                  FieldByName('UserCanDelete').AsBoolean := False;
                                  FieldByName('LookupCode').AsString     := 'SR';
                               end;
                           4 : begin
                                  FieldByName('ListType').AsInteger      := LIntExamRes;
                                  FieldByName('Description').AsString    := 'Third Result';
                                  FieldByName('UserCanDelete').AsBoolean := False;
                                  FieldByName('LookupCode').AsString     := 'TR';
                               end;
                           5 : begin
                                  FieldByName('ListType').AsInteger      := LIntExamRea;
                                  FieldByName('Description').AsString    := 'Exam Reason';
                                  FieldByName('UserCanDelete').AsBoolean := False;
                                  FieldByName('LookupCode').AsString     := 'ER';
                               end;
                           6 : begin
                                  FieldByName('ListType').AsInteger      := LIntExamMet;
                                  FieldByName('Description').AsString    := 'Exam Method';
                                  FieldByName('UserCanDelete').AsBoolean := False;
                                  FieldByName('LookupCode').AsString     := 'EM';
                               end;
}                        end;
                        Inc(i);
                        Post;
                     end;
            end;
      GenBool := False;
      except
      end;

      try
         // Alter Events Table
         with GenQuery do
            begin
               GenQuery := TQuery.Create(nil);
               DataBaseName := WinData.KingData.DataBaseName;

               { Events Table }
               CheckEvents.Active := True;
               GenBool := CheckEvents.FieldDefs.IndexOf('MPNotified') <= 0;
               CheckEvents.Active := False;

               if GenBool then
                  begin
                     Close;
                     SQL.Clear;
                     SQL.Add('ALTER TABLE Events ADD MPNotified Boolean, ');
                     SQL.Add('                   ADD MPAction   Char(1)  ');
                     ExecSQL;

                     Close;
                     SQL.Clear;
                     SQL.Add('UPDATE Events Set MPNotified = False,');
                     SQL.Add('                  MPAction   = "A"  ');
                     ExecSQL;

                     GenBool := False;
                  end;

               { Health Table }
               CheckHealth.Active := True;
               GenBool := CheckHealth.FieldDefs.IndexOf('VetPresc') <= 0;
               CheckHealth.Active := False;

               if GenBool then
                  begin
                     Close;
                     SQL.Clear;
                     SQL.Add('ALTER TABLE Health ADD VetPresc  Integer ');
                     ExecSQL;

                     Close;
                     SQL.Clear;
                     SQL.Add('UPDATE Health Set VetPresc = 0 ');
                     ExecSQL;
                     GenBool := False;
                  end;

               { Health Table }
{               CheckHealth.Active := True;
               GenBool := CheckHealth.FieldDefs.IndexOf('BatchNo') <= 0;
               CheckHealth.Active := False;

               if GenBool then
                  begin
                     Close;
                     SQL.Clear;
                     SQL.Add('ALTER TABLE Health ADD BatchNo Char(15) ');
                     ExecSQL;
                     GenBool := False;
                  end;
}
               { PedDetails Table }
               try
                  tPedDetails.Active := True;
                  GenBool := tPedDetails.FieldDefs.IndexOf('GradeUpCode') <= 0;
                  tPedDetails.Active := False;

                  if GenBool then
                     begin
                        Close;
                        SQL.Clear;
                        SQL.Add('ALTER TABLE PedDetails ADD GradeUpCode Char(5) ');
                        ExecSQL;
                     end;
               except

               end;
            end;
      finally
         GenQuery.Close;
         GenQuery.Free;
      end;

      try
         TempTable    :=  TTable.Create(nil);
         TempTable.DataBaseName := KingData.DataBaseName;
         TempTable.TableType    := ttParadox;

         if not ConditionScore.Exists then
            with TempTable do
               begin
                  TableName    := 'ConditionScore';

                  with FieldDefs do
                     begin
                        Clear;
                        Add('EventID'  , ftInteger, 0, False);
                        Add('Score'    , ftInteger, 0, False);
                     end;

                  with IndexDefs do
                     begin
                        Clear;
                        Add('iEventID', 'EventID', [ixUnique, ixPrimary]);
                     end;
                  CreateTable;
               end;

         if not DiagnoseProblem.Exists then
            with TempTable do
               begin
                  TableName    := 'DiagnoseProblem';
                  TableType    := ttParadox;

                  with FieldDefs do
                     begin
                        Clear;
                        Add('EventID'     , ftInteger, 0, False);
                        Add('iCode' , ftInteger, 0, False);
                     end;

                  with IndexDefs do
                     begin
                        Clear;
                        Add('iEventID', 'EventID', [ixUnique, ixPrimary]);
                     end;
                  CreateTable;
               end;

         if not EmbryoTransfer.Exists then
            with TempTable do
               begin
                  TableName    := 'EmbryoTransfer';

                  with FieldDefs do
                     begin
                        Clear;
                        Add('EventID'    , ftInteger, 0, False);
                        Add('DonorDamID' , ftInteger, 0, False);
                        Add('SireID'     , ftInteger, 0, False);
                        Add('EmbryoType' , ftInteger, 0, False);
                        Add('ET1Number'  , ftString, 15, False);
                     end;

                  with IndexDefs do
                     begin
                        Clear;
                        Add('iEventID', 'EventID', [ixUnique, ixPrimary]);
                     end;
                  CreateTable;
               end;

         if not IntExam.Exists then
            with TempTable do
               begin
                  TableName    := 'IntExam';

                  with FieldDefs do
                     begin
                        Clear;
                        Add('EventID'    , ftInteger, 0, False);
                        Add('Method'     , ftInteger, 0, False);
                        Add('Reason'     , ftInteger, 0, False);
                        Add('MainResult' , ftInteger, 0, False);
                        Add('Result2'    , ftInteger, 0, False);
                        Add('Result3'    , ftInteger, 0, False);
                     end;

                  with IndexDefs do
                     begin
                        Clear;
                        Add('iEventID', 'EventID', [ixUnique, ixPrimary]);
                     end;
                  CreateTable;
               end;

         if not BullInOut.Exists then
            with TempTable do
               begin
                  TableName    := 'BullInOut';

                  with FieldDefs do
                     begin
                        Clear;
                        Add('EventID'  , ftInteger, 0, False);
                        Add('BullID'   , ftInteger, 0, False);
                        Add('BullIn'   , ftBoolean, 0, False);
                     end;

                  with IndexDefs do
                     begin
                        Clear;
                        Add('iEventID', 'EventID', [ixUnique, ixPrimary]);
                     end;
                  CreateTable;
               end;

         if not MPDelete.Exists then
            // Create New MPDelete Table
            with TempTable do
               begin
                  TableName    := 'MPDelete';

                  with FieldDefs do
                     begin
                        Clear;
                        Add('EventID'  , ftInteger, 0, False);
                        Add('EventType', ftInteger, 0, False);
                        Add('EventDate', ftDate   , 0, False);
                        Add('HerdID',    ftInteger, 0, False);
                        Add('Action',    ftString , 1, False);
                        Add('Notified',  ftBoolean, 0, False);
                     end;

                  with IndexDefs do
                     begin
                        Clear;
                        Add('iEventID', 'EventID', [ixUnique, ixPrimary]);
                        Add('iEventIDDate', 'EventID;EventDate', [ixCaseInsensitive]);
                     end;

                  CreateTable;
               end;
      finally
         TempTable.Close;
         TempTable.Free;
      end;
      Result := True;
   except
   end;
end;

function TWinData.GetHerdIdentifier: String;
begin
   with OwnerFile do
      begin
         if not Active then
            Active := True;

         if OwnerFile.Locate('ID', UserDefaultHerdID, []) then
            Result := OwnerFile.FieldByName('HerdIdentifier').AsString
         else
            Result := '';
      end;
end;

procedure TWinData.BullInOutNewRecord(DataSet: TDataSet);
begin
   if DataSet.State in ([dsInsert, dsEdit]) then
      if EventType = TRunBullIn then
         DataSet.FieldByName('BullIn').AsBoolean := True
      else if EventType = TRunBullOut then
         DataSet.FieldByName('BullIn').AsBoolean := False;
end;


procedure TWinData.UpdateAnimalSex(Sex: String);
begin
   AnimalFileByID.Edit;
   if Sex = 'Bull' then
      begin
         if ((AnimalFileByIDSex.AsString = 'Bull') AND (WinData.AnimalFileByIDLactNo.ASInteger = 0)) then
            if AnimalFileByIDID.AsInteger = EventsAnimalID.AsInteger then
               AnimalFileByIDSex.AsString := 'Steer';
      end
   else
      begin
         if ((AnimalFileByIDSex.AsString = 'Steer') AND (WinData.AnimalFileByIDLactNo.ASInteger = 0)) then
            if AnimalFileByIDID.AsInteger = EventsAnimalID.AsInteger then
               AnimalFileByIDSex.AsString := 'Bull';
      end;
   AnimalFileByID.Post;
end;

procedure TWinData.CustomersSlaughterChange(Sender: TField);
begin
   {
   if Customers.State = dsEdit then
      if (Sender as TField).NewValue <> (Sender as TField).OldValue then
          if not CheckSlaughterEligibility then
             MessageDlg('Unable to calculate Slaughter Premium Eligibility, close program and reboot',mtWarning,[mbOk],0);
   }
end;

function TWinData.RemoveOldExtDefaults : Boolean;
var
   MyTable : TTable;
begin
   try
      Result := False;
      with MyTable do
         begin
            MyTable := TTable.Create(nil);
            DatabaseName := KingData.DatabaseName;
            TableName := 'PremiaDefaults';

            if Exists then
               begin
                  if Active then
                     Active := False;
                  try
                     DeleteTable;
                  except
                  end;
                  Result := True;
               end
            else
               Result := True;
         end;
   finally
      MyTable.Close;
      MyTable.Free;
   end;
end;

function TWinData.GetDefAccsCompany : String;
begin
  { with qOwners do
      begin
         ParamByName('ID').AsInteger := UserDefaultHerdID;
         Open;
         Result := qOwners.FieldByName('DefAccComp').Value;
         Close;
      end;}
end;

procedure TWinData.SetDefAccsCompany(const Value: String);
begin
   {OwnerFile.Edit;
   OwnerFileDefAccComp.AsString := Value;
   OwnerFile.Post;}
end;

function TWinData.HerdType: String;
begin
   WinData.ThisHerdType.Close;
   WinData.ThisHerdType.ParamByName('HerdID').AsInteger := AnimalFileByIDHerdID.AsInteger;
   WinData.ThisHerdType.Open;
   Result := ThisHerdTypeDescription.AsString;
end;

procedure TWinData.PremiaDefaultsHerdIDChange(Sender: TField);
begin
   PremiaDefaults.Edit;
end;

function TWinData.DefCountry(HerdID : Integer): TCountry;
var
   TempOwner : TTable;
   Country : Integer;
begin
   Country := 1;
   with TempOwner do
      try
         TempOwner    := TTable.Create(nil);
         DatabaseName := KingData.DatabaseName;
         TableName    := OwnerFile.TableName;
         Open;

         if HerdID <= 0 then
            begin
               if Locate('HerdIdentity', 'NONE', [loCaseInsensitive] ) then
                  if not FieldByName('Country').IsNull then
                     Country := FieldByName('Country').AsInteger
            end
         else
            begin
               if Locate('ID', HerdID, [loCaseInsensitive] ) then
                  Country := FieldByName('Country').AsInteger
            end;

         case Country of
            1  : Result := Ireland;
            7  : Result := England;
            12 : Result := NIreland;
            13 : Result := Poland;
         else
            Result := Other;
         end;

      finally
         Close;
         Free;
      end;
end;

function TWinData.UpdDefaultsSrchField: Boolean;
var
   tOwners : TTable;
begin
   Result := False;
   { }
   with tOwners do
      try
         tOwners := TTable.Create(nil);
         DatabaseName := KingData.DatabaseName;
         TableName := OwnerFile.TableName;

         Open;
         First;

         while not eof do
            begin
               if FieldByName('SearchField').IsNull then
                  begin
                     Edit;
                     FieldByName('SearchField').AsString := 'AnimalNo';
                     Post;
                  end;
               Next;
            end;
         Result := True;
      finally
         Close;
         Free;
      end;
end;

function TWinData.CreateLstkDefValue: Boolean; //jt 17/07/2002
var
   TmpTable: TTable;
begin
   Result := False;
   with TmpTable do
      try
         TmpTable:= TTable.Create(nil);
         DatabaseName := KingData.DatabaseName;
         TableName := 'LiveStockValues';

         if not Exists then
            with FieldDefs do
               begin
                  Clear;
                  Add('HerdID',ftInteger,0,False);
                  Add('CowsInMilk',ftfloat,0,False);
                  Add('CowsDry',ftfloat,0,False);
                  Add('BullBeef',ftfloat,0,False);
                  Add('BullBreed',ftfloat,0,False);
                  Add('Heifer06',ftfloat,0,False);
                  Add('Heifer612',ftfloat,0,False);
                  Add('Heifer1218',ftfloat,0,False);
                  Add('Heifer1824',ftfloat,0,False);
                  Add('Heifer24Plus',ftfloat,0,False);
                  Add('Steer06',ftfloat,0,False);
                  Add('Steer612',ftfloat,0,False);
                  Add('Steer1218',ftfloat,0,False);
                  Add('Steer1824',ftfloat,0,False);
                  Add('Steer24Plus',ftfloat,0,False);
                  Add('WP_Catt0_12',ftInteger,0,False);
                  Add('WP_Catt12_24',ftInteger,0,False);
                  Add('WP_Catt24Plus',ftInteger,0,False);
                  Add('WP_DairyCows',ftInteger,0,False);
                  Add('WP_SucklerCows',ftInteger,0,False);
                  Add('WP_Rams',ftInteger,0,False);      //JT left out check with GL
                  Add('WP_EwesMountain',ftInteger,0,False);
                  Add('WP_EwesLowland',ftInteger,0,False);
                  Add('WP_HoggetsMountain',ftInteger,0,False);
                  Add('WP_HoggetsLowland',ftInteger,0,False);
                  Add('WP_Lambs',ftInteger,0,False);     //JT left out check with GL

                  Add('OpeningValue',ftfloat,0,False);
                  Add('ClosingValue',ftfloat,0,False);

                  Add('FromDate',ftDate,0,False);   //NN 24/09/2002 To implement date in Herd/Accounts Reports
                  Add('ToDate',ftDate,0,False);

                  Add('AvgDairyPerc',ftfloat,0,False);
                  Add('AvgCattlePerc',ftfloat,0,False);
                  Add('AvgReplacePerc',ftfloat,0,False);

                  // 18/11/09 [V4.0 R0.4] /MK Additional Feature - New Fields for Pedigree Values
                  Add('PedigreeCowsInMilk',ftfloat,0,False);
                  Add('PedigreeCowsDry',ftfloat,0,False);
                  Add('PedigreeBullBeef',ftfloat,0,False);
                  Add('PedigreeBullBreed',ftfloat,0,False);
                  Add('PedigreeHeifer06',ftfloat,0,False);
                  Add('PedigreeHeifer612',ftfloat,0,False);
                  Add('PedigreeHeifer1218',ftfloat,0,False);
                  Add('PedigreeHeifer1824',ftfloat,0,False);
                  Add('PedigreeHeifer24Plus',ftfloat,0,False);
                  Add('PedigreeSteer06',ftfloat,0,False);
                  Add('PedigreeSteer612',ftfloat,0,False);
                  Add('PedigreeSteer1218',ftfloat,0,False);
                  Add('PedigreeSteer1824',ftfloat,0,False);
                  Add('PedigreeSteer24Plus',ftfloat,0,False);
                  Add('PedigreeBullBeef06',ftfloat,0,False);
                  Add('PedigreeBullBeef612',ftfloat,0,False);
                  Add('PedigreeBullBeef12Plus',ftfloat,0,False);
                  Add('EnterpriseType',ftString,20,False);
                  Add('PedigreeOpeningValue',ftfloat,0,False);
                  Add('PedigreeClosingValue',ftfloat,0,False);

                  IndexDefs.Add( '','HerdID',[ixUnique,ixPrimary] );
                  CreateTable;
                  Result := True;
               end
         else
            Result := True;
      finally
         Close;
         Free;
      end;
end;

function TWinData.CustomerEligSlght(CustID: Integer): Boolean;
begin
   result := false;
   if CustID = 0 then Exit;
   if WinData.Customers.Locate('ID', CustID, []) then
      Result := WinData.Customers.FieldByName('Slaughter').AsBoolean;
end;

function TWinData.CheckSlaughter(AID: Integer; DateOfBirth,
  SaleDate: TDateTime): Boolean;
var
   CalcDay,
   CalcMonth,
   CalcYear : String;
   CalcDay2,
   CalcMonth2,
   CalcYear2 : String;
   EligibleDate : TDateTime;
begin
   RESULT := False;
   EligibleDate := IncMonth(DateOfBirth, 8);

   if SaleDate < EligibleDate then
      Exit;

   if not CheckEvents.Active then
       CheckEvents.Active := True;

   try
      if CheckEvents.Locate('AnimalID;EventType',
                               VarArrayOf([AID,cPurchaseEvent]),[]) then
         EligibleDate := IncMonth(CheckEvents.FieldByName('EventDate').AsDateTime, 2)
      else
         EligibleDate := IncMonth(DateOfBirth, 2);
   except
      on E : Exception do
         Raise Exception.Create(E.message);
   end;


   if SaleDate <> 0 then
      begin
         if (SaleDate)>=(EligibleDate) then
            RESULT := True;
      end;
end;

function TWinData.FixHealthEvents: Boolean;
var
   TempSQL : TQuery;
begin
{
  Bug up to V3.5 R8.6
  On deletion of Health/DryOff Event
  Only Record in Health table was
  deleted, leaving record in Events.db
  This procedure will tidy the Events table.
}
   with TempSQL do
      try
         TempSQL := TQuery.Create(nil);
         TempSQL.DatabaseName := KingData.DatabaseName;
         with SQL do
            begin
               Add('DELETE FROM Events E                                                  ');
               Add('WHERE NOT(E.ID IN (SELECT H.EventID FROM "Health.db" H))              ');
               Add('AND E.EventType ('+IntToStr(CHealthEvent)+','+IntToStr(CDryOffEvent)+') ');
               ExecSQL;
            end;
      finally
         TempSQL.Close;
         TempSQL.Free;
      end;
end;

function TWinData.GetAccsCompany(const HerdID: Byte): String;
begin
   // SP 16/09/02
   Result := 'Accs';
   if HerdID = 0 then
      Exit
   else if ((HerdID <> NONEHerdID) and (OwnerFile.Locate('ID',HerdID,[]))) then
      Result := UPPERCASE(Trim(OwnerFile.FieldByName('DefAccComp').AsString));
end;

function TWinData.GetSearchPhoneLink: Boolean;
begin
   with Defaults do
      try
         Open;
         First;
         Result := ((FieldByName('PhoneLink').AsBoolean) and (FieldByName('PhoneLinkType').AsInteger <> plNOLINK));
         Close;
      except
        if Defaults.Active then
           Defaults.Active := False;
      end;

end;

procedure TWinData.SetSearchPhoneLink(const Value: Boolean);
begin
   with Defaults do
      try
         Open;
         First;
         Edit;
         FieldByName('PhoneLink').AsBoolean := Value;
         Post;
         Close;
      except
        if Defaults.Active then
           Defaults.Active := False;
      end;

end;

function TWinData.MakeAnimalWasteProd: Boolean;
var
   AnimalWasteProd : TTable;
begin
   with AnimalWasteProd do
      try
         AnimalWasteProd := TTable.Create(nil);
         AnimalWasteProd.DatabaseName := WinData.KingData.DatabaseName;
         TableName := 'AnimalWasteProd';
         TableType := ttParadox;

         if not Exists then
            begin
               with FieldDefs do
                  begin
                     Add('ID',ftAutoInc,0,False);
                     Add('Enterprise',ftString,30,False); // Animal Type
                     Add('Average',ftFloat,0,False);
                     Add('N-KG',ftInteger,0,False ); // Nitrogen
                     Add('TotalN',ftFloat,0,False );
                     Add('P-KG',ftInteger,0,False ); //Phosphorus
                     Add('TotalP',ftFloat,0,False );
                  end;
               with IndexDefs do
                  begin
                     Clear;
                     Add('','ID',[ixPrimary,ixUnique]);
                  end;

               CreateTable;
               Result := True;
            end
         else
            Result := True;
      finally
         Close;
         Free;
      end;
end;

{ SP 15/11/2002 }
function TWinData.GetLastVersionUpdate: TDateTime;
begin
   with Defaults do
      begin
         Open;
         First;
         RESULT := FieldByName('LastVerUpdate').AsDateTime;
         Close;
      end;

end;

function TWinData.GetPhoneLinkType: SmallInt;
begin
   with Defaults do
      begin
         Open;
         First;
         RESULT := FieldByName('PhoneLinkType').AsInteger;
         Close;
      end;

end;
{ SP 15/11/2002 }

{ SP 15/11/2002 }
procedure TWinData.SetLastVersionUpdate(const Value: TDateTime);
begin
   with Defaults do
      begin
         Open;
         First;
         Edit;
         FieldByName('LastVerUpdate').AsDateTime := Value;
         Post;
         Close;
      end;
end;

procedure TWinData.SetPhoneLinkType(const Value: SmallInt);
begin
   with Defaults do
      begin
         Open;
         First;
         Edit;
         FieldByName('PhoneLinkType').AsInteger := Value;
         Post;
         Close;
      end;
end;
{ SP 15/11/2002 }

function TWinData.UpdateBreedsCase : Boolean;
var
   TempStr : String;
   AlreadyOpen : Boolean;
begin

   Result := True;
   with Breeds do
      begin
         if not Active then
            begin
               Active := True;
               AlreadyOpen := True;
            end;

         First;
         while not eof do
            begin
               try
                  if Length(FieldByName('Code').AsString) > 0 then
                     begin
                        Edit;
                        FieldByName('Name').AsString := CapitalizeString(FieldByName('Name').AsString);
                        Post;
                     end;
               except
               end;
               Next;
            end;
         Active := AlreadyOpen;
         Result := True;
      end;
end;


function TWinData.GetCurrentYear: Integer;
var
   Y, M, D : Word;
begin
   DecodeDate(Date, Y, M, D);
   Result := Y;
end;

function TWinData.SuckApplicApplied(HerdID, Year : Integer) : Boolean;
var
   AlreadyOpen : Boolean;
begin
   RESULT := FALSE;
   with WinData.tSApplic do
      begin
         AlreadyOpen := True;
         if not Active then
            begin
               Active := True;
               AlreadyOpen := False;
            end;
         Result := WinData.tSApplic.Locate('HerdID;YearOfApplic', VarArrayOf([HerdID, Year]), []);
         Active := AlreadyOpen;
      end;
end;

function TWinData.ParlourFileExists: Boolean;
begin
   Result := False;
   try
      Result := FileExists(ExtractFilePath(ParamStr(0))+ParlourFilePath);
   except
   end;
end;

procedure TWinData.CreateParlourEvents;
var
   FFile : String;
begin
   { SP 19/12/2002 }
   FFile := (ExtractFilePath(ParamStr(0))+ParlourFilePath);
   if FileExists(FFile) then
      with TCreateEvents.Create do
         try
            LinkType := esParlourLink;
            EventFile := FFile;
            CreateEvents;
            try
               DeleteFile(EventFile);
            except
               MessageDlg('Unable to delete Parlour Event File.',mtWarning,[mbOK],0);
            end;
         finally
            Free;
         end;
end;

function TWinData.SortByCheckDigit(NatID: String): String;
var
   sCheckDigit, TempNatID : String;
begin
   Result := NatID;
   if WinData.WhatStyleNatID(NatID, False) = Style1999 then
      begin
         NatID := WinData.StripAllSpaces(NatID);
         sCheckDigit := Copy(TempNatID, Length(TempNatID)-4, 1);
         Delete(TempNatID, Length(TempNatID)-4, 1);
         Insert(sCheckDigit, TempNatID, Length(TempNatID)+1);
         Result := PadLeft(NatID, '0', 20);
      end;
end;

function TWinData.GetSlghtAmount: Double;
begin
   Result := 0;
   with PremiaDefaults do
      try
         Active := True;
         try
            if Locate('Year', FPremiumYear, []) then
               Result := FieldByName('SlgthPrem').AsFloat;
         except
         end;
      finally
         Active := False;
      end;
end;

procedure TWinData.SetSlghtAmount(const Value: Double);
begin
   with PremiaDefaults do
      try
         Active := True;
         First;
         if Value > 0 then
            if Locate('Year', FPremiumYear, []) then
               try
                  Edit;
                  FieldByName('SlgthPrem').AsFloat := Value;
                  Post;
               except
               end;
      finally
         Active := False;
      end;
end;

function TWinData.GetSlghtTopupAmount: Double;
begin
   Result := 0;
   with PremiaDefaults do
      try
         Active := True;
         if Locate('Year', FPremiumYear, []) then
            Result := FieldByName('SlgthTopUpPrem').AsFloat; // Normal amount + Heifer top-up.
      finally
         Active := False;
      end;
end;

procedure TWinData.SetSlghtTopupAmount(const Value: Double);
begin
   with PremiaDefaults do
      try
         Active := True;
         First;
         if Value > 0 then
            if Locate('Year', FPremiumYear, []) then
               begin
                  Edit;
                  FieldByName('SlgthTopUpPrem').AsFloat := Value;
                  Post;
               end;
      finally
         Active := False;
      end;
end;

function TWinData.GetBullAmount: Double;
begin
   Result := 0;
   with PremiaDefaults do
      try
         Active := True;
         First;
         if Locate('Year', FPremiumYear, []) then
            Result := FieldByName('Bull').AsFloat;
      finally
         Active := False;
      end;
end;

procedure TWinData.SetBullAmount(const Value: Double);
begin
   with PremiaDefaults do
      try
         Active := True;
         First;
         if Value > 0 then
            if Locate('Year', FPremiumYear, []) then
               begin
                  Edit;
                  FieldByName('Bull').AsFloat := Value;
                  Post;
               end;
      finally
         Active := False;
      end;
end;

function TWinData.GetFirstAmount: Double;
begin
   Result := 0;
   with PremiaDefaults do
      try
         Active := True;
         if Locate('Year', FPremiumYear, []) then
            Result := FieldByName('Month10').AsFloat;
      finally
         Active := False;
      end;
end;

procedure TWinData.SetFirstAmount(const Value: Double);
begin
   with PremiaDefaults do
      try
         Active := True;
         First;
         if Value > 0 then
            if Locate('Year', FPremiumYear, []) then
               begin
                  Edit;
                  FieldByName('Month10').AsFloat := Value;
                  Post;
               end;
      finally
         if Active then
            Active := False;
      end;
end;

function TWinData.GetSecondAmount: Double;
begin
   Result := 0;
   with PremiaDefaults do
      try
         Active := True;
         if Locate('Year', FPremiumYear, []) then
            Result := FieldByName('Month22').AsFloat;
      finally
         Active := False;
      end;
end;


procedure TWinData.SetSecondAmount(const Value: Double);
begin
   with PremiaDefaults do
      try
         Active := True;
         First;
         if Value > 0 then
            if Locate('Year', FPremiumYear, []) then
               begin
                  Edit;
                  FieldByName('Month22').AsFloat := Value;
                  Post;
               end;
      finally
         Active := False;
      end;

end;

function TWinData.GetSuckAmount: Double;
begin
   Result := 0;
   with PremiaDefaults do
      try
         Active := True;
         if Locate('Year', FPremiumYear, []) then
            Result := FieldByName('SuckCowHeif').AsFloat;
      finally
         Active := False;
      end;
end;

procedure TWinData.SetSuckAmount(const Value: Double);
begin
   with PremiaDefaults do
      try
         Active := True;
         First;
         if Value > 0 then
            if Locate('Year', FPremiumYear, []) then
               begin
                  Edit;
                  FieldByName('SuckCowHeif').AsFloat := Value;
                  Post;
               end;
      finally
         Active := False;
      end;
end;

function TWinData.GetSuckTopupAmount: Double;
begin
   Result := 0;
   with PremiaDefaults do
      try
         Active := True;
         if Locate('Year', FPremiumYear, []) then
            Result := FieldByName('SuckHeifTopup').AsFloat;
      finally
         Active := False;
      end;
end;


procedure TWinData.SetSuckTopupAmount(const Value: Double);
begin
   with PremiaDefaults do
      try
         Active := True;
         if Value > 0 then
            if Locate('Year', FPremiumYear, []) then
               begin
                  Edit;
                  FieldByName('SuckHeifTopup').AsFloat := Value;
                  Post;
               end;
      finally
         Active := False;
      end;
end;

procedure TWinData.SetPremiumYear(const Value: Integer);
begin
  FPremiumYear := Value;
end;

procedure TWinData.DefaultsAfterPost(DataSet: TDataSet);
begin
   DBISaveChanges(Defaults.Handle);
end;

procedure TWinData.CowExtBeforePost(DataSet: TDataSet);
begin
   LookUpDamSire.Filter := '';
   LookUpDamSire.Filtered := False;
   if LookUpDamSire.Locate('ID', DataSet.FieldByName('AnimalID').AsInteger, []) then
      if LookUpDamSire.FieldByName('Sex').AsString <> 'Female' then
         Dataset.Cancel;
end;

procedure TWinData.BullCowExtFix;
var
   GenQuery,
   MyQuery : TQuery;
begin
   { Bulls Ext record was gettin saved to the CowExt Table.}
   { Delete any bull records in CowExt.db }

   if CreateTQuery(MyQuery, nil, KingData.DatabaseName ) then
      with MyQuery do
         begin
            try
               SQL.Clear;
               SQL.Add('Delete From CowExt C');
               SQL.Add('Where (C.AnimalID IN');
               SQL.Add('(Select A.ID From Animals A ');
               SQL.Add('Where UPPER(A.Sex) <> "FEMALE"))');
               ExecSQL;
            except
              on E : Exception do
                 ShowMessage(E.Message);
            end;

            try
               SQL.Clear;
               SQL.Add('Delete From BullExt B');
               SQL.Add('Where (B.AnimalID IN');
               SQL.Add('(Select A.ID From Animals A ');
               SQL.Add('Where UPPER(A.Sex) <> "BULL"))');
               ExecSQL;
            except
              on E : Exception do
                 ShowMessage(E.Message);
            end;
            MyQuery.Active := False;
            MyQuery.Free;
            //Hide Splash Message content
            SplashForm.lStartmessage.Hide;
            ReIndexAll(True);
            SplashForm.lStartmessage.Show;
         end
   else
      MessageDlg('WARNING: Unable to update animal extension tables, contact Kingswood',mtWarning,[mbOk],0);
end;

function TWinData.CreateTQuery(var GenQuery : TQuery; const FOwner : TComponent; const DBName : String) : Boolean;
begin
   Result := False;
   with GenQuery do
      Try
         GenQuery := TQuery.Create(FOwner);
         if DBName <> '' then
           GenQuery.DatabaseName := DBName
         else
           GenQuery.DatabaseName := KingData.DatabaseName;
         Result := True;
      except
      end;
end;

function TWinData.CreateTTable(var GenTable: TTable; FOwner: TComponent;
  const DBName, TblName: String): Boolean;
begin
   Result := False;
   with GenTable do
      Try
         GenTable := TTable.Create(FOwner);
         if DBName <> '' then
            GenTable.DataBaseName := DBName
         else
            GenTable.DatabaseName := KingData.DatabaseName;
         GenTable.TableType := ttParadox;
         GenTable.Tablename := TblName;

         Result := True;
      except
      end;
end;

function TWinData.CreateQuotaTable: Boolean;
var
   QuotaTable : TTable;
begin
   Result := False;
   CreateTTable(QuotaTable, nil, KingData.DataBaseName, 'QuotaDefaults.db');
   if QuotaTable.Exists then
     QuotaTable.DeleteTable;

   with QuotaTable do
      try
//         TableName := 'QuotaDefaults.db';
         with FieldDefs do
            begin
               Clear;
               Add('MilkUnits',ftString,10,False);
               Add('AnnualQuota',ftFloat,0,False);
               Add('MilkSupply',ftFloat,0,False);
               Add('AFirstCalverDY',ftFloat,0,False);
               Add('AOlderCowsDY',ftFloat,0,False);
               Add('ACullBarrenDY',ftFloat,0,False);
               Add('AFirstCalverDtoDO',ftInteger,0,False);
               Add('AOlderCowsDtoDO',ftInteger,0,False);
               Add('ACullBarrenDate',ftDate,0,False);
               Add('BFirstCalverDY',ftFloat,0,False);
               Add('BOlderCowsDY',ftFloat,0,False);
               Add('AvgDaysCalvesFed',ftInteger,0,False);
               Add('LitreGallonsPerDay',ftFloat,0,False);
               Add('AdjustQuota',ftBoolean,0,False);
               Add('ReferenceBFat',ftFloat,0,False);
               Add('ExpectedBFat',ftFloat,0,False);
               Add('AdjustAmount',ftFloat,0,False);
               Add('QuotaAmount',ftFloat,0,False);
               Add('LastMilkDate',ftDate,0,False);
               Add('UseHerdDryOff',ftBoolean,0,False);  //KVB 08/02/2001
               Add('HerdDryOffDate',ftDate,0,False);  //KVB 08/02/2001
            end;

         // Since the Table was Created a new record needs to be inserted
         CreateTable;
         Active := True;
         Insert;
         FieldByName('AdjustQuota').AsBoolean := False;
         FieldByName('UseHerdDryOff').AsBoolean := False;  //KVB 08/02/2001
         Post;
         DbiSaveChanges(QuotaTable.Handle);
         Active := False;
         Free;
         Result := True;
      except
         on E : Exception do
            MessageDlg(E.Message, mtError, [mbOk],0);
      end;
end;

procedure TWinData.OtherIDsAfterPost(DataSet: TDataSet);
begin
   DbiSaveChanges(OtherIDs.Handle);
end;

procedure TWinData.IDFileAfterPost(DataSet: TDataSet);
begin
   DbiSaveChanges(IDFile.Handle);
end;

procedure TWinData.AnimalFileByIDAfterOpen(DataSet: TDataSet);
begin
   try
      qRetag.Active := False;   // Shows Retagging on Main Grid
      qRetag.Active := True;
      qTempTag.Active := False; // Shows Temporary Tag on Main Grid
      qTempTag.Active := True;
      RefreshDamSireLookupTable(True);
      RefreshDamSireLookupTable(False);
   except
   end;
end;

function TWinData.NISystem : Boolean;
var
   tOwners : TTable;
begin
   Result := False;
   tOwners := TTable.Create(nil);

   with tOwners do
      try
         DatabaseName := 'kingswd';
         TableName := 'owners';
         Active := True;
         First;
         while not eof do
            begin
               if (UpperCase(FieldByName('HerdIdentity').AsString) <> 'NONE') and (FieldByName('Country').AsInteger = 1) then
                  begin
                     Result := False;
                     Break;
                  end;
               tOwners.Next;
            end;

         if not Result then // Check if any NI herds
            begin
               First;
               while not eof do
                  begin
                     if (UpperCase(FieldByName('HerdIdentity').AsString) <> 'NONE') and (FieldByName('Country').AsInteger = 12) then
                        begin
                           Result := True;
                           Break;
                        end;
                     tOwners.Next;
                  end;
            end;
      finally
         Close;
         Free;
      end;
end;


procedure TWinData.MenuItemClick(Sender: TObject; pmMenu : TPopupMenu);
var
   x,
   Count,
   nGroupIndex,
   nTag : Byte;

begin
   nTag := (Sender as TMenuItem).Tag;
   nGroupIndex := (Sender as TMenuItem).GroupIndex;
   for x := 0 to Pred(pmMenu.Items.Count) do
      begin
         if ((Sender As TMenuItem).Parent.Items[x].Tag <> nTag) and ((Sender As TMenuItem).Parent.Items[x].GroupIndex = nGroupIndex) then
            (Sender As TMenuItem).Parent.Items[x].Checked := False
         else if ((Sender As TMenuItem).Parent.Items[x].Tag = nTag) and ((Sender As TMenuItem).Parent.Items[x].GroupIndex = nGroupIndex) then
            (Sender As TMenuItem).Parent.Items[x].Checked := True;
      end;
end;

procedure TWinData.LoadPreferences;
var
   fs : TFileStream;
   Reg : TRegistry;
   TempStr : string;
   i : integer;
   bSavePreferences : Boolean;
   DBName : string;
begin
   bSavePreferences := False;

   FillChar(GlobalSettings, SizeOf(GlobalSettings), NullTerminator);
   DBName := KingswdDatabaseName;

   Reg := TRegistry.Create;
   try
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      if Reg.OpenKey(cGSRegPathHerd+DBName, FALSE) then // Preferences Exist.
         begin
            GlobalSettings.ShowCalfReg := Reg.ReadBool(cGSPromptCalfReg);
            GlobalSettings.SaveAnother := Reg.ReadBool(cGSSaveAnotherEvent);
            GlobalSettings.PhoneLinkOnStartup := Reg.ReadBool(cGSPhoneLinkOnStartup);
            GlobalSettings.NewVersionReminder := Reg.ReadBool(cGSNewVersionReminder);
            GlobalSettings.BackupReminder := Reg.ReadBool(cGSBackupReminder);
            GlobalSettings.BackupTestFile:= Reg.ReadBool(cGSBackupTestFile);
            GlobalSettings.BackupSpanDisks := Reg.ReadBool(cGSBackupSpanDisks);
            GlobalSettings.BackupArchiveFile := Reg.ReadBool(cGSBackupArchiveFile);
            Reg.ReadBinaryData(cGSHerdProtection, GlobalSettings.HerdPassword, SizeOf(THerdPassword));
            GlobalSettings.NatIDToAnimalNo := Reg.ReadBool(cGSNatIDToAnimalNo);
            GlobalSettings.BladeRegistered := Reg.ReadBool(cGSBladeRegistered);
            GlobalSettings.RenumAnimalNo := Reg.ReadBool(cGSRenumberAnimalNo);
            GlobalSettings.MandatoryBreedingEvents := Reg.ReadBool(cGSMandatoryBreedingEvents);
            TempStr := Reg.ReadString(cGSReNumFormat);
            if ( TempStr <> '' ) then
               begin
                  for i := 0 to Length(TempStr)-1 do
                     GlobalSettings.ReNumFormat[i] := TempStr[i+1];
               end;
            GlobalSettings.MandatoryDryOffEvent := Reg.ReadBool(cGSMandatoryDryOffEvent); // enforce all dryoff events before calving animal.
            GlobalSettings.BackupStoreRegFiles := Reg.ReadBool(cGSBackupStoreRegFiles); // Indication to store Bandon/ICBF Registration Files.
            GlobalSettings.BackupStorePedigreeImages := Reg.ReadBool(cGSBackupStorePedigreeImages);
            if Reg.ValueExists(cGSUseBarcodeScanner) then
               GlobalSettings.UseBarcodeScanner := Reg.ReadBool(cGSUseBarcodeScanner)
            else
               begin
                  // Get the UseScanner Boolean from table save to reg.
                  with TTable.Create(nil) do
                     try
                        DatabaseName := AliasName;
                        TableName := 'defaults';
                        Open;
                        try
                           First;
                           Reg.WriteBool(cGSUseBarcodeScanner, FieldByName('UseScanner').AsBoolean);
                        finally
                           Close;
                        end;
                     finally
                        Free;
                     end;
               end;
            if Reg.ValueExists(cGSDefaultMaleSex) then
               GlobalSettings.DefaultMaleSex := Reg.ReadString(cGSDefaultMaleSex);

            if Reg.ValueExists(cGSDefaultHealthComment) then
               GlobalSettings.HealthCodeDefaultCommentIndex := Reg.ReadInteger(cGSDefaultHealthComment);

            if Reg.ValueExists(cGSNationalIDAnimalNo) then
               GlobalSettings.NationalIDAnimalNumber := Reg.ReadInteger(cGSNationalIDAnimalNo)
            else
               GlobalSettings.NationalIDAnimalNumber := 0;

            if GlobalSettings.NationalIDAnimalNumber > 0 then
               begin
                  // convert old NationalIDAnimalNumber to tag store data.
                  ConvertTagPreferenceToTagStoreData;
                  bSavePreferences := True;
               end;

            if Reg.ValueExists(cGSAllowDuplicateTagNos) then
               GlobalSettings.AllowDuplicateTags := Reg.ReadBool(cGSAllowDuplicateTagNos)
            else
               GlobalSettings.AllowDuplicateTags := False;
            if Reg.ValueExists(cGSDefaultExitAfterSale) then
               GlobalSettings.DefaultExitAfterSale := Reg.ReadBool(cGSDefaultExitAfterSale)
            else
               GlobalSettings.DefaultExitAfterSale := False;

            if Reg.ValueExists(cGSDefaultMaleBreedingStatus) then
               GlobalSettings.DefaultMaleBreedingStatus := Reg.ReadBool(cGSDefaultMaleBreedingStatus)
            else
               GlobalSettings.DefaultMaleBreedingStatus := False;

            if Reg.ValueExists(cGSWeighingEventChangeAnimalFocusAfterSave) then
               GlobalSettings.WeighingEventChangeAnimalFocusAfterSave := Reg.ReadBool(cGSWeighingEventChangeAnimalFocusAfterSave)
            else
               GlobalSettings.WeighingEventChangeAnimalFocusAfterSave := False;

            if Reg.ValueExists(cGSUseIEPrefixForNatIDSearch) then
               GlobalSettings.UseIEPrefixForNatIDSearch := Reg.ReadBool(cGSUseIEPrefixForNatIDSearch)
            else
               GlobalSettings.UseIEPrefixForNatIDSearch := False;

            if Reg.ValueExists(cGSDisplayGettingStarted) then
               GlobalSettings.DisplayGettingStarted := Reg.ReadBool(cGSDisplayGettingStarted)
            else
               GlobalSettings.DisplayGettingStarted := False;

            if Reg.ValueExists(cGSAnimalGridSireField) then
               GlobalSettings.AnimalGridSireField := Reg.ReadString(cGSAnimalGridSireField)
            else
               GlobalSettings.AnimalGridSireField := 'Animal No';

{            if Reg.ValueExists(cGSNonBreedingBullHighlightNoMonths) then
               GlobalSettings.NonBreedingBullHighlightNoMonths := Reg.ReadInteger(cGSNonBreedingBullHighlightNoMonths)
            else
               GlobalSettings.NonBreedingBullHighlightNoMonths := 22;

            if Reg.ValueExists(cGSNonBreedingBullHighlightColour) then
               GlobalSettings.NonBreedingBullHighlightColour := TColor(Reg.ReadInteger(cGSNonBreedingBullHighlightColour))
            else
               GlobalSettings.NonBreedingBullHighlightColour := Integer(clBlue);

            if Reg.ValueExists(cGSNonBreedingBullHighlightBold) then
               GlobalSettings.NonBreedingBullHighlightBold := Reg.ReadBool(cGSNonBreedingBullHighlightBold)
            else
               GlobalSettings.NonBreedingBullHighlightBold := True;
}

            if Reg.ValueExists(cGSBeefBullAttrNoMonthsFrom) then
               GlobalSettings.BeefBullAttrNoMonthsFrom := Reg.ReadInteger(cGSBeefBullAttrNoMonthsFrom)
            else
               GlobalSettings.BeefBullAttrNoMonthsFrom := 22;

            if Reg.ValueExists(cGSBeefBullAttrNoMonthsTo) then
               GlobalSettings.BeefBullAttrNoMonthsTo := Reg.ReadInteger(cGSBeefBullAttrNoMonthsTo)
            else
               GlobalSettings.BeefBullAttrNoMonthsTo := 22;

            if Reg.ValueExists(cGSBeefBullAttrNoMonthsOver) then
               GlobalSettings.BeefBullAttrNoMonthsOver := Reg.ReadInteger(cGSBeefBullAttrNoMonthsOver)
            else
               GlobalSettings.BeefBullAttrNoMonthsOver := 22;

            if Reg.ValueExists(cGSBeefBullAttrColourBetween) then
               GlobalSettings.BeefBullAttrColourBetween := TColor(Reg.ReadInteger(cGSBeefBullAttrColourBetween))
            else
               GlobalSettings.BeefBullAttrColourBetween := Integer(clBlue);

            if Reg.ValueExists(cGSBeefBullAttrBoldBetween) then
               GlobalSettings.BeefBullAttrBoldBetween := Reg.ReadBool(cGSBeefBullAttrBoldBetween)
            else
               GlobalSettings.BeefBullAttrBoldBetween := True;

            if Reg.ValueExists(cGSBeefBullAttrColourOver) then
               GlobalSettings.BeefBullAttrColourOver := TColor(Reg.ReadInteger(cGSBeefBullAttrColourOver))
            else
               GlobalSettings.BeefBullAttrColourOver := Integer(clBlue);

            if Reg.ValueExists(cGSBeefBullAttrBoldOver) then
               GlobalSettings.BeefBullAttrBoldOver := Reg.ReadBool(cGSBeefBullAttrBoldOver)
            else
               GlobalSettings.BeefBullAttrBoldOver := True;


{

            if Reg.ValueExists(cGSNonBreedingFemaleHighlightNoMonths) then
               GlobalSettings.NonBreedingFemaleHighlightNoMonths := Reg.ReadInteger(cGSNonBreedingFemaleHighlightNoMonths)
            else
               GlobalSettings.NonBreedingFemaleHighlightNoMonths := 21;

            if Reg.ValueExists(cGSNonBreedingFemaleHighlightColour) then
               GlobalSettings.NonBreedingFemaleHighlightColour := TColor(Reg.ReadInteger(cGSNonBreedingFemaleHighlightColour))
            else
               GlobalSettings.NonBreedingFemaleHighlightColour := Integer(clBlue);

            if Reg.ValueExists(cGSNonBreedingFemaleHighlightBold) then
               GlobalSettings.NonBreedingFemaleHighlightBold := Reg.ReadBool(cGSNonBreedingFemaleHighlightBold)
            else
               GlobalSettings.NonBreedingFemaleHighlightBold := True;

}

            if Reg.ValueExists(cGSBeefFemaleAttrNoMonthsFrom) then
               GlobalSettings.BeefFemaleAttrNoMonthsFrom := Reg.ReadInteger(cGSBeefFemaleAttrNoMonthsFrom)
            else
               GlobalSettings.BeefFemaleAttrNoMonthsFrom := 21;

            if Reg.ValueExists(cGSBeefFemaleAttrNoMonthsTo) then
               GlobalSettings.BeefFemaleAttrNoMonthsTo := Reg.ReadInteger(cGSBeefFemaleAttrNoMonthsTo)
            else
               GlobalSettings.BeefFemaleAttrNoMonthsTo := 21;

            if Reg.ValueExists(cGSBeefFemaleAttrNoMonthsOver) then
               GlobalSettings.BeefFemaleAttrNoMonthsOver := Reg.ReadInteger(cGSBeefFemaleAttrNoMonthsOver)
            else
               GlobalSettings.BeefFemaleAttrNoMonthsOver := 21;

            if Reg.ValueExists(cGSBeefFemaleAttrColourBetween) then
               GlobalSettings.BeefFemaleAttrColourBetween := TColor(Reg.ReadInteger(cGSBeefFemaleAttrColourBetween))
            else
               GlobalSettings.BeefFemaleAttrColourBetween := Integer(clBlue);

            if Reg.ValueExists(cGSBeefFemaleAttrBoldBetween) then
               GlobalSettings.BeefFemaleAttrBoldBetween := Reg.ReadBool(cGSBeefFemaleAttrBoldBetween)
            else
               GlobalSettings.BeefFemaleAttrBoldBetween := True;

            if Reg.ValueExists(cGSBeefFemaleAttrColourOver) then
               GlobalSettings.BeefFemaleAttrColourOver := TColor(Reg.ReadInteger(cGSBeefFemaleAttrColourOver))
            else
               GlobalSettings.BeefFemaleAttrColourOver := Integer(clBlue);

            if Reg.ValueExists(cGSBeefFemaleAttrBoldOver) then
               GlobalSettings.BeefFemaleAttrBoldOver := Reg.ReadBool(cGSBeefFemaleAttrBoldOver)
            else
               GlobalSettings.BeefFemaleAttrBoldOver := True;
{

            if Reg.ValueExists(cGSSteerHighlightNoMonths) then
               GlobalSettings.SteerHighlightNoMonths := Reg.ReadInteger(cGSSteerHighlightNoMonths)
            else
               GlobalSettings.SteerHighlightNoMonths := 28;

            if Reg.ValueExists(cGSSteerHighlightColour) then
               GlobalSettings.SteerHighlightColour := TColor(Reg.ReadInteger(cGSSteerHighlightColour))
            else
               GlobalSettings.SteerHighlightColour := Integer(clBlue);

            if Reg.ValueExists(cGSSteerHighlightBold) then
               GlobalSettings.SteerHighlightBold := Reg.ReadBool(cGSSteerHighlightBold)
            else
               GlobalSettings.SteerHighlightBold := True;

}
            if Reg.ValueExists(cGSSteerAttrNoMonthsFrom) then
               GlobalSettings.SteerAttrNoMonthsFrom := Reg.ReadInteger(cGSSteerAttrNoMonthsFrom)
            else
               GlobalSettings.SteerAttrNoMonthsFrom := 28;

            if Reg.ValueExists(cGSSteerAttrNoMonthsTo) then
               GlobalSettings.SteerAttrNoMonthsTo := Reg.ReadInteger(cGSSteerAttrNoMonthsTo)
            else
               GlobalSettings.SteerAttrNoMonthsTo := 28;

            if Reg.ValueExists(cGSSteerAttrNoMonthsOver) then
               GlobalSettings.SteerAttrNoMonthsOver := Reg.ReadInteger(cGSSteerAttrNoMonthsOver)
            else
               GlobalSettings.SteerAttrNoMonthsOver := 28;

            if Reg.ValueExists(cGSSteerAttrColourBetween) then
               GlobalSettings.SteerAttrColourBetween := TColor(Reg.ReadInteger(cGSSteerAttrColourBetween))
            else
               GlobalSettings.SteerAttrColourBetween := Integer(clBlue);

            if Reg.ValueExists(cGSSteerAttrBoldBetween) then
               GlobalSettings.SteerAttrBoldBetween := Reg.ReadBool(cGSSteerAttrBoldBetween)
            else
               GlobalSettings.SteerAttrBoldBetween := True;

            if Reg.ValueExists(cGSSteerAttrColourOver) then
               GlobalSettings.SteerAttrColourOver := TColor(Reg.ReadInteger(cGSSteerAttrColourOver))
            else
               GlobalSettings.SteerAttrColourOver := Integer(clBlue);

            if Reg.ValueExists(cGSSteerAttrBoldOver) then
               GlobalSettings.SteerAttrBoldOver := Reg.ReadBool(cGSSteerAttrBoldOver)
            else
               GlobalSettings.SteerAttrBoldOver := True;


            if Reg.ValueExists(cGSDisplayTBTestDateWarningBeforeSale) then
               GlobalSettings.DisplayTBTestDateWarningBeforeSale := Reg.ReadBool(cGSDisplayTBTestDateWarningBeforeSale)
            else
               GlobalSettings.DisplayTBTestDateWarningBeforeSale := True;

            if Reg.ValueExists(cGSDisplayBruceTestDateWarningBeforeSale) then
               GlobalSettings.DisplayBruceTestDateWarningBeforeSale := Reg.ReadBool(cGSDisplayBruceTestDateWarningBeforeSale)
            else
               GlobalSettings.DisplayBruceTestDateWarningBeforeSale := True;

            if Reg.ValueExists(cGSDisplayMinimumDaysOnFarmWarningBeforeSale) then
               GlobalSettings.DisplayMinimumDaysOnFarmWarningBeforeSale := Reg.ReadBool(cGSDisplayMinimumDaysOnFarmWarningBeforeSale)
            else
               GlobalSettings.DisplayMinimumDaysOnFarmWarningBeforeSale := True;

            if Reg.ValueExists(cGSMinimumDaysToBeKeptOnFarmBeforeSale) then
               GlobalSettings.MinimumDaysToBeKeptOnFarmBeforeSale := Reg.ReadInteger(cGSMinimumDaysToBeKeptOnFarmBeforeSale)
            else
               GlobalSettings.MinimumDaysToBeKeptOnFarmBeforeSale := DefaultMinimumDaysOnFarm; // default to 45 days.

            if Reg.ValueExists(cGSDisplayAnimalComments) then
               GlobalSettings.DisplayAnimalComments := Reg.ReadBool(cGSDisplayAnimalComments)
            else
               GlobalSettings.DisplayAnimalComments := False;

            if Reg.ValueExists(cGSAnimalWeighingGraphXAxisValue) then
               GlobalSettings.AnimalWeighingGraphXAxisValue := Reg.ReadInteger(cGSAnimalWeighingGraphXAxisValue)
            else
               GlobalSettings.AnimalWeighingGraphXAxisValue := 100;

            if Reg.ValueExists(cGSAnimalWeighingGraphXAxisVariable) then
               GlobalSettings.AnimalWeighingGraphXAxisVariable := Reg.ReadBool(cGSAnimalWeighingGraphXAxisVariable)
            else
               GlobalSettings.AnimalWeighingGraphXAxisVariable := False;

            if Reg.ValueExists(cGSDisplayMovementFeedColsInGridView) then
               GlobalSettings.DisplayMovementFeedColsInGridView := Reg.ReadBool(cGSDisplayMovementFeedColsInGridView)
            else
               GlobalSettings.DisplayMovementFeedColsInGridView := False;

            if Reg.ValueExists(cGSDownloadMailAttachments) then
               GlobalSettings.DownloadMailAttachments := Reg.ReadBool(cGSDownloadMailAttachments)
            else
               GlobalSettings.DownloadMailAttachments := False;

            if Reg.ValueExists(cGSAnimalGridHideSearchBar) then
               GlobalSettings.AnimalGridHideSearchBar := Reg.ReadBool(cGSAnimalGridHideSearchBar)
            else
               GlobalSettings.AnimalGridHideSearchBar := False;

         end
      else if FileExists(  KingData.Directory+sSettingsFile ) then   // Old format
         begin
            fs := TFileStream.Create(KingData.Directory+sSettingsFile, fmOpenRead);
            try
               fs.Seek(-Sizeof(TGlobalSettings), soFromEnd);
               fs.Read(GlobalSettings, SizeOf(TGlobalSettings));
            finally
               fs.Free;
            end;

            if Reg.OpenKey(cGSRegPathHerd+DBName, TRUE) then // Write stored Preferences
               begin
                  Reg.WriteBool(cGSPromptCalfReg, GlobalSettings.ShowCalfReg);
                  Reg.WriteBool(cGSSaveAnotherEvent, GlobalSettings.SaveAnother);
                  Reg.WriteBool(cGSPhoneLinkOnStartup, GlobalSettings.PhoneLinkOnStartup);
                  Reg.WriteBool(cGSNewVersionReminder, GlobalSettings.NewVersionReminder);
                  Reg.WriteBool(cGSBackupReminder, GlobalSettings.BackupReminder);
                  Reg.WriteBool(cGSBackupTestFile, GlobalSettings.BackupTestFile);
                  Reg.WriteBool(cGSBackupSpanDisks, GlobalSettings.BackupSpanDisks);
                  Reg.WriteBool(cGSBackupArchiveFile, GlobalSettings.BackupArchiveFile);
                  Reg.WriteBinaryData(cGSHerdProtection, GlobalSettings.HerdPassword, SizeOf(THerdPassword));
                  Reg.WriteBool(cGSNatIDToAnimalNo, GlobalSettings.NatIDToAnimalNo);
                  Reg.WriteBool(cGSBladeRegistered, GlobalSettings.BladeRegistered);
                  Reg.WriteBool(cGSRenumberAnimalNo, GlobalSettings.RenumAnimalNo);
                  Reg.WriteBool(cGSMandatoryBreedingEvents, GlobalSettings.MandatoryBreedingEvents);
                  Reg.WriteString(cGSReNumFormat, GlobalSettings.ReNumFormat);
                  // enforce all dryoff events before calving animal.
                  Reg.WriteBool(cGSMandatoryDryOffEvent, GlobalSettings.MandatoryDryOffEvent);
                  // store Bandon/ICBF Registration Files.
                  Reg.WriteBool(cGSBackupStoreRegFiles, GlobalSettings.BackupStoreRegFiles);
                   // store Pedigree Images
                  Reg.WriteBool(cGSBackupStorePedigreeImages, GlobalSettings.BackupStorePedigreeImages);
                  // Get the UseScanner Boolean from table save to reg.
                  with Defaults do
                     begin
                        Open;
                        try
                           First;
                           Reg.WriteBool(cGSUseBarcodeScanner, FieldByName('UseScanner').AsBoolean);
                        finally
                           Close;
                        end
                     end;
                  Reg.WriteString(cGSDefaultMaleSex, 'Steer');
                  Reg.WriteInteger(cGSNationalIDAnimalNo, 0);
                  Reg.WriteBool(cGSAllowDuplicateTagNos, False);
                  Reg.WriteBool(cGSDefaultExitAfterSale, False);
                  Reg.WriteBool(cGSDefaultMaleBreedingStatus, False);
                  Reg.WriteBool(cGSWeighingEventChangeAnimalFocusAfterSave, False);
                  Reg.WriteBool(cGSUseIEPrefixForNatIDSearch, False);
                  Reg.WriteBool(cGSDisplayGettingStarted, False);
                  Reg.WriteString(cGSAnimalGridSireField, 'Animal No');

                  {Reg.WriteInteger(cGSNonBreedingBullHighlightNoMonths, 22);
                  Reg.WriteInteger(cGSNonBreedingBullHighlightColour, Integer(clBlue));
                  Reg.WriteBool(cGSNonBreedingBullHighlightBold, True);
                  Reg.WriteInteger(cGSNonBreedingFemaleHighlightNoMonths, 21);
                  Reg.WriteInteger(cGSNonBreedingFemaleHighlightColour, Integer(clBlue));
                  Reg.WriteBool(cGSNonBreedingFemaleHighlightBold, True);
                  Reg.WriteInteger(cGSSteerHighlightNoMonths, 28);
                  Reg.WriteInteger(cGSSteerHighlightColour, Integer(clBlue));
                  Reg.WriteBool(cGSSteerHighlightBold, True);}

                  Reg.WriteInteger(cGSBeefBullAttrNoMonthsFrom,22);
                  Reg.WriteInteger(cGSBeefBullAttrNoMonthsTo,22);
                  Reg.WriteInteger(cGSBeefBullAttrNoMonthsOver,22);
                  Reg.WriteInteger(cGSBeefBullAttrColourBetween, Integer(clBlue));
                  Reg.WriteBool(cGSBeefBullAttrBoldBetween, True);
                  Reg.WriteInteger(cGSBeefBullAttrColourOver, Integer(clBlue));
                  Reg.WriteBool(cGSBeefBullAttrBoldOver, True);

                  Reg.WriteInteger(cGSBeefFemaleAttrNoMonthsFrom,21);
                  Reg.WriteInteger(cGSBeefFemaleAttrNoMonthsTo,21);
                  Reg.WriteInteger(cGSBeefFemaleAttrNoMonthsOver,21);
                  Reg.WriteInteger(cGSBeefFemaleAttrColourBetween, Integer(clBlue));
                  Reg.WriteBool(cGSBeefFemaleAttrBoldBetween, True);
                  Reg.WriteInteger(cGSBeefFemaleAttrColourOver, Integer(clBlue));
                  Reg.WriteBool(cGSBeefFemaleAttrBoldOver, True);

                  Reg.WriteInteger(cGSSteerAttrNoMonthsFrom,28);
                  Reg.WriteInteger(cGSSteerAttrNoMonthsTo,28);
                  Reg.WriteInteger(cGSSteerAttrNoMonthsOver,28);
                  Reg.WriteInteger(cGSSteerAttrColourBetween, Integer(clBlue));
                  Reg.WriteBool(cGSSteerAttrBoldBetween, True);
                  Reg.WriteInteger(cGSSteerAttrColourOver, Integer(clBlue));
                  Reg.WriteBool(cGSSteerAttrBoldOver, True);

                  Reg.WriteBool(cGSDisplayTBTestDateWarningBeforeSale, True);
                  Reg.WriteBool(cGSDisplayBruceTestDateWarningBeforeSale, True);
                  Reg.WriteBool(cGSDisplayMinimumDaysOnFarmWarningBeforeSale, True);
                  Reg.WriteInteger(cGSMinimumDaysToBeKeptOnFarmBeforeSale, 45);
                  Reg.WriteBool(cGSDisplayAnimalComments, False);
                  Reg.WriteInteger(cGSAnimalWeighingGraphXAxisValue,100);
                  Reg.WriteBool(cGSAnimalWeighingGraphXAxisVariable, False);
                  Reg.WriteBool(cGSDisplayMovementFeedColsInGridView, False);
                  Reg.WriteBool(cGSDownloadMailAttachments, False);
                  Reg.WriteBool(cGSAnimalGridHideSearchBar, False)
               end;
         end
      else
         begin
            if Reg.OpenKey(cGSRegPathHerd+DBName, TRUE) then // Write new Preferences to registry
               begin
                  Reg.WriteBool(cGSPromptCalfReg, TRUE);
                  Reg.WriteBool(cGSSaveAnotherEvent, TRUE);
                  Reg.WriteBool(cGSPhoneLinkOnStartup, FALSE);
                  Reg.WriteBool(cGSNewVersionReminder, TRUE);
                  Reg.WriteBool(cGSBackupReminder, TRUE);
                  Reg.WriteBool(cGSBackupTestFile, TRUE);
                  Reg.WriteBool(cGSBackupSpanDisks, FALSE);
                  Reg.WriteBool(cGSBackupArchiveFile, TRUE);
                  Reg.WriteBinaryData(cGSHerdProtection, GlobalSettings.HerdPassword, SizeOf(THerdPassword));
                  Reg.WriteBool(cGSNatIDToAnimalNo, FALSE);
                  Reg.WriteBool(cGSBladeRegistered, FALSE);
                  Reg.WriteBool(cGSRenumberAnimalNo, FALSE);
                  Reg.WriteBool(cGSMandatoryBreedingEvents, FALSE);
                  Reg.WriteString(cGSReNumFormat, '');
                  // enforce all dryoff events before calving animal if Milk Recording
                  Reg.WriteBool(cGSMandatoryDryOffEvent, Def.Definition.dUseMilkRec);
                  // Indication to store Bandon/ICBF Registration Files.
                  Reg.WriteBool(cGSBackupStoreRegFiles, FALSE);
                  Reg.WriteBool(cGSBackupStorePedigreeImages, FALSE);
                  // Get the UseScanner Boolean from table save to reg.
                  with Defaults do
                     begin
                        Open;
                        try
                           First;
                           Reg.WriteBool(cGSUseBarcodeScanner, FieldByName('UseScanner').AsBoolean);
                        finally
                           Close;
                        end
                     end;
                  Reg.WriteString(cGSAnimalGridSireField, 'Animal No');
                  Reg.WriteString(cGSDefaultMaleSex, 'Steer');
                  Reg.WriteInteger(cGSNationalIDAnimalNo, 0);
                  Reg.WriteBool(cGSAllowDuplicateTagNos, False);
                  Reg.WriteBool(cGSDefaultExitAfterSale, True);
                  Reg.WriteBool(cGSDefaultMaleBreedingStatus, False);
                  Reg.WriteBool(cGSWeighingEventChangeAnimalFocusAfterSave, False);
                  Reg.WriteBool(cGSUseIEPrefixForNatIDSearch, True);
                  if RegisteredCountry = Ireland then
                     begin
                       // ShowMessage('Country Ireland');
                        Reg.WriteBool(cGSDisplayGettingStarted, True)
                     end
                  else
                     begin
                        //ShowMessage('Country not Ireland');
                        Reg.WriteBool(cGSDisplayGettingStarted, False);
                     end;
                  {Reg.WriteInteger(cGSNonBreedingBullHighlightNoMonths, 22);
                  Reg.WriteInteger(cGSNonBreedingBullHighlightColour, Integer(clBlue));
                  Reg.WriteBool(cGSNonBreedingBullHighlightBold, True);
                  Reg.WriteInteger(cGSNonBreedingFemaleHighlightNoMonths, 21);
                  Reg.WriteInteger(cGSNonBreedingFemaleHighlightColour, Integer(clBlue));
                  Reg.WriteBool(cGSNonBreedingFemaleHighlightBold, True);
                  Reg.WriteInteger(cGSSteerHighlightNoMonths, 28);
                  Reg.WriteInteger(cGSSteerHighlightColour, Integer(clBlue));
                  Reg.WriteBool(cGSSteerHighlightBold, True);
                  }

                  Reg.WriteInteger(cGSBeefBullAttrNoMonthsFrom,22);
                  Reg.WriteInteger(cGSBeefBullAttrNoMonthsTo,22);
                  Reg.WriteInteger(cGSBeefBullAttrNoMonthsOver,22);
                  Reg.WriteInteger(cGSBeefBullAttrColourBetween, Integer(clBlue));
                  Reg.WriteBool(cGSBeefBullAttrBoldBetween, True);
                  Reg.WriteInteger(cGSBeefBullAttrColourOver, Integer(clBlue));
                  Reg.WriteBool(cGSBeefBullAttrBoldOver, True);

                  Reg.WriteInteger(cGSBeefFemaleAttrNoMonthsFrom,21);
                  Reg.WriteInteger(cGSBeefFemaleAttrNoMonthsTo,21);
                  Reg.WriteInteger(cGSBeefFemaleAttrNoMonthsOver,21);
                  Reg.WriteInteger(cGSBeefFemaleAttrColourBetween, Integer(clBlue));
                  Reg.WriteBool(cGSBeefFemaleAttrBoldBetween, True);
                  Reg.WriteInteger(cGSBeefFemaleAttrColourOver, Integer(clBlue));
                  Reg.WriteBool(cGSBeefFemaleAttrBoldOver, True);

                  Reg.WriteInteger(cGSSteerAttrNoMonthsFrom,28);
                  Reg.WriteInteger(cGSSteerAttrNoMonthsTo,28);
                  Reg.WriteInteger(cGSSteerAttrNoMonthsOver,28);
                  Reg.WriteInteger(cGSSteerAttrColourBetween, Integer(clBlue));
                  Reg.WriteBool(cGSSteerAttrBoldBetween, True);
                  Reg.WriteInteger(cGSSteerAttrColourOver, Integer(clBlue));
                  Reg.WriteBool(cGSSteerAttrBoldOver, True);

                  Reg.WriteBool(cGSDisplayTBTestDateWarningBeforeSale, True);
                  Reg.WriteBool(cGSDisplayBruceTestDateWarningBeforeSale, True);
                  Reg.WriteBool(cGSDisplayMinimumDaysOnFarmWarningBeforeSale, True);
                  Reg.WriteInteger(cGSMinimumDaysToBeKeptOnFarmBeforeSale, 45);
                  Reg.WriteBool(cGSDisplayAnimalComments, False);
                  Reg.WriteInteger(cGSAnimalWeighingGraphXAxisValue,100);
                  Reg.WriteBool(cGSAnimalWeighingGraphXAxisVariable,False);
                  Reg.WriteBool(cGSDisplayMovementFeedColsInGridView, False);
                  Reg.WriteBool(cGSDownloadMailAttachments, False);
                  Reg.WriteBool(cGSAnimalGridHideSearchBar, False);
                  LoadPreferences;
               end;
         end;

      // 03/02/2009 [Dev V3.8 R 5.9 ] /SP : Program Change - Introduction of new Preference Class
      CreatePreferenceObj(cGSRegPathHerd, DBName, '');

      // 03/02/2009 [Dev V3.8 R 5.9 ] /SP : Program Change - New preference "Use New Report Layout Style", allows user to toggle between old Report Screen and New Report Screen.
      if not Preferences.PreferenceExists(cGSReportLayoutStyle) then
         begin
            if WinData.SystemRegisteredCountry = Ireland then
               Preferences.ValueAsString[cGSReportLayoutStyle] := 'NEWLAYOUT'
            else
               Preferences.ValueAsString[cGSReportLayoutStyle] := 'OLDLAYOUT'
         end
      else
         begin
            // Change in defaults for version 3.9 8.6, default to the new report layout if country is registered in Ireland
            if ( CurrentDBVersion < 3986 ) and ( WinData.SystemRegisteredCountry = Ireland ) then
               Preferences.ValueAsString[cGSReportLayoutStyle] := 'NEWLAYOUT'
         end;

      // 17/02/2009 /SP [Dev 3.9 6.2]
      if not Preferences.PreferenceExists(cGSService_RecordCScore) then
         Preferences.ValueAsBoolean[cGSService_RecordCScore] := False;
      // 17/02/2009 /SP [Dev 3.9 6.2]
      if not Preferences.PreferenceExists(cGSCalving_RecordCScore) then
         Preferences.ValueAsBoolean[cGSCalving_RecordCScore] := False;

      // 17/02/2009 /SP [Dev 3.9 6.2]
      if not Preferences.PreferenceExists(cGSService_RecordHealth) then
         Preferences.ValueAsBoolean[cGSService_RecordHealth] := False;
      // 17/02/2009 /SP [Dev 3.9 6.2]
      if not Preferences.PreferenceExists(cGSCalving_RecordHealth) then
         begin
            Preferences.ValueAsBoolean[cGSCalving_RecordHealth] := False;
            Preferences.ValueAsString[cGSCalving_RecordHealthCode] := 'RP'; // Default to retained placenta
         end;
      // 08/01/2010 /SP [Dev 4.0 2.3]
      if not Preferences.PreferenceExists(cGSCalving_AutoCompletePDA) then
         Preferences.ValueAsBoolean[cGSCalving_AutoCompletePDA] := False;

      // 28/01/2010 /SP [Dev 4.0 2.4]
      if not Preferences.PreferenceExists(cGSCTSBirthsRemoveNatIdNoFormatting) then
         Preferences.ValueAsBoolean[cGSCTSBirthsRemoveNatIdNoFormatting] := False;

      if not Preferences.PreferenceExists(cGSCTSReconcileUsingNatIdNoFormatting) then
         Preferences.ValueAsBoolean[cGSCTSReconcileUsingNatIdNoFormatting] := False;

   finally
      Reg.CloseKey;
      Reg.Free;
      if bSavePreferences then
         SavePreferences;
   end;
   GS_SetSireField;
end;

procedure TWinData.SavePreferences;
var
   Reg : TRegistry;
   DBName : String;
begin
   DBName := KingswdDatabaseName;

   SearchPhoneLink := GlobalSettings.PhoneLinkOnStartup;
   if BOOL(MenuForm) then
      begin
         if GlobalSettings.PhoneLinkOnStartup then
            SendMessage(MenuForm.Handle, WM_plActivate, 0, 0)
         else
            SendMessage(MenuForm.Handle, WM_plDeActivate, 0, 0);

{         if GlobalSettings.DisplayBreedCode then
            SendMessage(MenuForm.Handle, WM_MainDisplayBreedCode, 0, 0)
         else
            SendMessage(MenuForm.Handle, WM_MainHideBreedCode, 0, 0);

         if GlobalSettings.BladeRegistered then
            SendMessage(MenuForm.Handle, WM_BladeRegistered, 0, 0)
         else
            SendMessage(MenuForm.Handle, WM_BladeNotRegistered, 0, 0);
}
      end;

   Reg := TRegistry.Create;
   try
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      if Reg.OpenKey(cGSRegPathHerd+DBName, TRUE) then // Write stored Preferences
         begin
            Reg.WriteBool(cGSPromptCalfReg, GlobalSettings.ShowCalfReg);
            Reg.WriteBool(cGSSaveAnotherEvent, GlobalSettings.SaveAnother);
            Reg.WriteBool(cGSPhoneLinkOnStartup, GlobalSettings.PhoneLinkOnStartup);
            Reg.WriteBool(cGSNewVersionReminder, GlobalSettings.NewVersionReminder);
            Reg.WriteBool(cGSBackupReminder, GlobalSettings.BackupReminder);
            Reg.WriteBool(cGSBackupTestFile, GlobalSettings.BackupTestFile);
            Reg.WriteBool(cGSBackupSpanDisks, GlobalSettings.BackupSpanDisks);
            Reg.WriteBool(cGSBackupArchiveFile, GlobalSettings.BackupArchiveFile);
            Reg.WriteBinaryData(cGSHerdProtection, GlobalSettings.HerdPassword, SizeOf(THerdPassword));
            Reg.WriteBool(cGSNatIDToAnimalNo, GlobalSettings.NatIDToAnimalNo);
            Reg.WriteBool(cGSBladeRegistered, GlobalSettings.BladeRegistered);
            Reg.WriteBool(cGSRenumberAnimalNo, GlobalSettings.RenumAnimalNo);
            Reg.WriteBool(cGSMandatoryBreedingEvents, GlobalSettings.MandatoryBreedingEvents);
            Reg.WriteString(cGSReNumFormat, GlobalSettings.ReNumFormat);
            // enforce all dryoff events before calving animal.
            Reg.WriteBool(cGSMandatoryDryOffEvent, GlobalSettings.MandatoryDryOffEvent);
            // store Bandon/ICBF Registration Files.
            Reg.WriteBool(cGSBackupStoreRegFiles, GlobalSettings.BackupStoreRegFiles);
             // store Pedigree Images
            Reg.WriteBool(cGSBackupStorePedigreeImages, GlobalSettings.BackupStorePedigreeImages);
            Reg.WriteBool(cGSUseBarcodeScanner, GlobalSettings.UseBarcodeScanner);
            Reg.WriteString(cGSDefaultMaleSex, GlobalSettings.DefaultMaleSex);
            Reg.WriteInteger(cGSDefaultHealthComment, GlobalSettings.HealthCodeDefaultCommentIndex);
            Reg.WriteInteger(cGSNationalIDAnimalNo, GlobalSettings.NationalIDAnimalNumber);
            Reg.WriteBool(cGSAllowDuplicateTagNos, GlobalSettings.AllowDuplicateTags);
            Reg.WriteBool(cGSDefaultExitAfterSale, GlobalSettings.DefaultExitAfterSale);
            Reg.WriteBool(cGSDefaultMaleBreedingStatus, GlobalSettings.DefaultMaleBreedingStatus);
            Reg.WriteBool(cGSWeighingEventChangeAnimalFocusAfterSave,GlobalSettings.WeighingEventChangeAnimalFocusAfterSave);
            Reg.WriteBool(cGSUseIEPrefixForNatIDSearch,GlobalSettings.UseIEPrefixForNatIDSearch);
            Reg.WriteBool(cGSDisplayGettingStarted, GlobalSettings.DisplayGettingStarted);
            Reg.WriteString(cGSAnimalGridSireField, GlobalSettings.AnimalGridSireField);

            {
            Reg.WriteInteger(cGSNonBreedingBullHighlightNoMonths, GlobalSettings.NonBreedingBullHighlightNoMonths);
            Reg.WriteInteger(cGSNonBreedingBullHighlightColour, GlobalSettings.NonBreedingBullHighlightColour);
            Reg.WriteBool(cGSNonBreedingBullHighlightBold, GlobalSettings.NonBreedingBullHighlightBold);
            Reg.WriteInteger(cGSNonBreedingFemaleHighlightNoMonths, GlobalSettings.NonBreedingFemaleHighlightNoMonths);
            Reg.WriteInteger(cGSNonBreedingFemaleHighlightColour, GlobalSettings.NonBreedingFemaleHighlightColour);
            Reg.WriteBool(cGSNonBreedingFemaleHighlightBold, GlobalSettings.NonBreedingFemaleHighlightBold);
            Reg.WriteInteger(cGSSteerHighlightNoMonths, GlobalSettings.SteerHighlightNoMonths);
            Reg.WriteInteger(cGSSteerHighlightColour, GlobalSettings.SteerHighlightColour);
            Reg.WriteBool(cGSSteerHighlightBold, GlobalSettings.SteerHighlightBold);
            }

            Reg.WriteInteger(cGSBeefBullAttrNoMonthsFrom,GlobalSettings.BeefBullAttrNoMonthsFrom);
            Reg.WriteInteger(cGSBeefBullAttrNoMonthsTo,GlobalSettings.BeefBullAttrNoMonthsTo);
            Reg.WriteInteger(cGSBeefBullAttrNoMonthsOver,GlobalSettings.BeefBullAttrNoMonthsOver);
            Reg.WriteInteger(cGSBeefBullAttrColourBetween, GlobalSettings.BeefBullAttrColourBetween);
            Reg.WriteBool(cGSBeefBullAttrBoldBetween, GlobalSettings.BeefBullAttrBoldBetween);
            Reg.WriteInteger(cGSBeefBullAttrColourOver, GlobalSettings.BeefBullAttrColourOver);
            Reg.WriteBool(cGSBeefBullAttrBoldOver, GlobalSettings.BeefBullAttrBoldOver);

            Reg.WriteInteger(cGSBeefFemaleAttrNoMonthsFrom,GlobalSettings.BeefFemaleAttrNoMonthsFrom);
            Reg.WriteInteger(cGSBeefFemaleAttrNoMonthsTo,GlobalSettings.BeefFemaleAttrNoMonthsTo);
            Reg.WriteInteger(cGSBeefFemaleAttrNoMonthsOver,GlobalSettings.BeefFemaleAttrNoMonthsOver);
            Reg.WriteInteger(cGSBeefFemaleAttrColourBetween, GlobalSettings.BeefFemaleAttrColourBetween);
            Reg.WriteBool(cGSBeefFemaleAttrBoldBetween, GlobalSettings.BeefFemaleAttrBoldBetween);
            Reg.WriteInteger(cGSBeefFemaleAttrColourOver, GlobalSettings.BeefFemaleAttrColourOver);
            Reg.WriteBool(cGSBeefFemaleAttrBoldOver, GlobalSettings.BeefFemaleAttrBoldOver);

            Reg.WriteInteger(cGSSteerAttrNoMonthsFrom,GlobalSettings.SteerAttrNoMonthsFrom);
            Reg.WriteInteger(cGSSteerAttrNoMonthsTo,GlobalSettings.SteerAttrNoMonthsTo);
            Reg.WriteInteger(cGSSteerAttrNoMonthsOver,GlobalSettings.SteerAttrNoMonthsOver);
            Reg.WriteInteger(cGSSteerAttrColourBetween, GlobalSettings.SteerAttrColourBetween);
            Reg.WriteBool(cGSSteerAttrBoldBetween, GlobalSettings.SteerAttrBoldBetween);
            Reg.WriteInteger(cGSSteerAttrColourOver, GlobalSettings.SteerAttrColourOver);
            Reg.WriteBool(cGSSteerAttrBoldOver, GlobalSettings.SteerAttrBoldOver);


            Reg.WriteBool(cGSDisplayTBTestDateWarningBeforeSale, GlobalSettings.DisplayTBTestDateWarningBeforeSale);
            Reg.WriteBool(cGSDisplayBruceTestDateWarningBeforeSale, GlobalSettings.DisplayBruceTestDateWarningBeforeSale);
            Reg.WriteBool(cGSDisplayMinimumDaysOnFarmWarningBeforeSale, GlobalSettings.DisplayMinimumDaysOnFarmWarningBeforeSale);
            Reg.WriteInteger(cGSMinimumDaysToBeKeptOnFarmBeforeSale, GlobalSettings.MinimumDaysToBeKeptOnFarmBeforeSale);
            Reg.WriteBool(cGSDisplayAnimalComments, GlobalSettings.DisplayAnimalComments);
            Reg.WriteInteger(cGSAnimalWeighingGraphXAxisValue,GlobalSettings.AnimalWeighingGraphXAxisValue);
            Reg.WriteBool(cGSAnimalWeighingGraphXAxisVariable, GlobalSettings.AnimalWeighingGraphXAxisVariable);
            Reg.WriteBool(cGSDisplayMovementFeedColsInGridView, GlobalSettings.DisplayMovementFeedColsInGridView);
            Reg.WriteBool(cGSDownloadMailAttachments, GlobalSettings.DownloadMailAttachments);
            Reg.WriteBool(cGSAnimalGridHideSearchBar, GlobalSettings.AnimalGridHideSearchBar);
         end;
   finally
      Reg.CloseKey;
      Reg.Free;
   end;
end;

procedure TWinData.FeedEventsAfterDelete(DataSet: TDataSet);
begin
   KingData.ApplyUpdates([FeedEvents]);
end;

procedure TWinData.FeedEventsAfterPost(DataSet: TDataSet);
begin
   KingData.ApplyUpdates([FeedEvents]);
end;

function TWinData.CheckNINatID(const sNatID : String; var FormattedNatID : String;
       FormatWithPaddedZeros : Boolean) : Boolean;
const
   Divider = 7;
var
   NumAlready : Boolean;
   StartPos, Len, i, x : Integer;
   Remainder : Byte;
   NatIDComponents : array [0..3] of String;
   TempNatID, CalcStr : String;

   procedure PrepStr(var Str : String);
   const
      DoubleSpace = '  ';
      DoubleFSlash = '//';
      DoubleBSlash = '\\ ';
      DoubleHyphen = '--';
   begin

      Str := Trim(Str);
      while Pos(DoubleSpace, Str) > 0 do
         Delete(Str, Pos(DoubleSpace, Str), 1);

      while Pos(DoubleFSlash, Str) > 0 do
         Delete(Str, Pos(DoubleFSlash, Str), 1);

      while Pos(DoubleBSlash, Str) > 0 do
         Delete(Str, Pos(DoubleBSlash, Str), 1);

      while Pos(DoubleHyphen, Str) > 0 do
         Delete(Str, Pos(DoubleHyphen, Str), 1);

      if (Copy(sNatID, 1, 4) = 'UK 9') or
         (Copy(sNatID, 1, 4) = 'UK-9') or
         (Copy(sNatID, 1, 4) = 'UK/9') or
         (Copy(sNatID, 1, 4) = 'UK\9') then
      System.Delete(TempNatID, 3, 1)
   end;

   function PadLeftZero(Str : String; Count : Byte) : String;
   begin
      while Length(Str) < Count do
         Str := '0'+Str;
      Result := Str;
   end;

begin
   Result := False;

   if  Trim(sNatID) = '' then Exit;

   TempNatID := sNatID;
   PrepStr(TempNatID);

   Len := Length(TempNatID);
   StartPos := 1;
   NumAlready := False;

   { Check that its a valid NI Tag }
   for x := StartPos to Len do
      begin
         if ( TempNatID[x] <> '9' ) then
            begin
               if ( TempNatID[x] in ['0'..'8'] ) then
                  begin
                     NumAlready := True;
                     Break;
                  end;
            end
         else
            Break;
      end;

   if NumAlready then
      begin
         Result := False;
         Exit;
      end;

   for x := Low(NatIDComponents) to High(NatIDComponents) do
      begin
         Len := Length(TempNatID);
         for i := StartPos to Len do
            if TempNatID[i] in (['\', '/', '-', ' ']) then
               Break;
         NatIDComponents[x] := Trim(Copy(TempNatID, StartPos, i-StartPos));
         StartPos := i+1;
      end;

   CalcStr := Copy(NatIDComponents[0], 3, 1);
   CalcStr := CalcStr + Copy(NatIDComponents[1], 1, 2);
   CalcStr := CalcStr + PadLeftZero(Copy(NatIDComponents[1], 3, 4), 4);
   CalcStr := CalcStr + PadLeftZero(NatIDComponents[2], 4);

   Remainder := (StrToInt64(CalcStr) mod Divider);
   Inc(Remainder);
   if NatIDComponents[0] = 'UK9' then NatIDComponents[0] := 'UK 9'; // reset the 'UK9' to offical 'UK 9' format
   if FormatWithPaddedZeros then
      begin
         FormattedNatID := NatIDComponents[0]+' '+PadLeftZero(NatIDComponents[1],5)+' '+NatIDComponents[2]+' '+NatIDComponents[3];
      end
   else
      begin
         FormattedNatID := NatIDComponents[0]+' '+NatIDComponents[1]+' '+NatIDComponents[2]+' '+NatIDComponents[3];
      end;
   try
      Result := Remainder = StrToInt(NatIDComponents[3]);
   except
      Result := False;
   end;
end;

function TWinData.IsNINatID(sNatID: String): Boolean;
begin
   Result := Copy( UPPERCASE( StripAllNomNumAlpha( sNatID )), 1, 3 ) = 'UK9' ;
end;

function TWinData.HerdHasIHMs(HerdID: Integer): Boolean;
var
   qIHM : TQuery;
begin
   if HerdID > 0 then
      begin
         qIHM := TQuery.Create(nil);
         try
            qIHM.DatabaseName := KingData.DatabaseName;
            qIHM.SQL.Clear;
            qIHM.SQL.Add('Select * From IHM ');
            qIHM.SQL.Add('Where (LastHerdID = :LHID) OR (NewHerdID = :NHID)');
            qIHM.Params[0].AsInteger := HerdID;
            qIHM.Params[1].AsInteger := qIHM.Params[0].AsInteger;
            qIHM.Open;
            qIHM.First;
            Result := qIHM.RecordCount > 0;
         finally
            qIHM.Close;
            qIHM.Free;
         end;
      end
   else
      begin
         if tIntHerd.Active then
            Result := tIntHerd.RecordCount > 0;
      end;
end;

function TWinData.GetFieldsRepsVerNo: Integer;
var
   Reg : TRegistry;
begin
   Result := 0;
   Reg := TRegistry.Create;
   try
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      if Reg.OpenKey(Reg_FieldsReps, True) then
         if not Reg.ValueExists('VerNo') then
            Reg.WriteInteger('VerNo', Result);
         Result := Reg.ReadInteger('VerNo');
      Reg.CloseKey;
   finally
      Reg.Free;
   end;
end;

function TWinData.RemovePassBlanks(RemStr: array of Byte): String;
var
   i : 0..9;
begin
   i := 0;
   while i < high(i) do
      if (RemStr[i] = 0) then
         Exit
      else
         begin
            Result := Result + Chr(RemStr[i] xor 2);
            Inc(i);
         end;
end;

procedure TWinData.SetHerdDBPassword(const Value: String);
var
   i : byte;
   NewPassword : String;
begin
   NewPassword := Trim(Value);
   with GlobalSettings do
      begin
         FillChar(GlobalSettings.HerdPassword, Sizeof(GlobalSettings.HerdPassword), 0);
         if ( NewPassword <> '' ) then
            begin
               for i := 0 to Length(Value)-1 do
                  GlobalSettings.HerdPassword[i] := (Ord(Value[i+1]) xor 2);
            end;
      end;
end;

function TWinData.GetHerdDBPassword: String;
begin
   Result := RemovePassBlanks(WinData.GlobalSettings.HerdPassword);
end;
{
function TWinData.LoadBtnImage(BtnImg: Integer): TBitMap;
begin
   try
      Result := TBitmap.Create;
      Result.Transparent := True;
      if BtnImg = cBtnImgHelp then
         Result := Menuform.ImgHelp.Picture.Bitmap
      else
         Images.GetBitmap(BtnImg, Result);
   except
   end;
end;
}
procedure TWinData.SaveNokiaIniSettings(ComNumber, NokiaConnectionType: Byte);
var
  IniFile : TIniFile;
  IniFileName : String;
begin
   IniFileName := IniDir + cPhoneLinkIniFile;
   if not FileExists(IniFileName) then
      begin
         ComNumber := 1;
         NokiaConnectionType := 1;
      end
   else
      begin
         IniFile := TIniFile.Create(IniFileName);
         IniFile.WriteInteger(IniNokia, IniComPort, ComNumber);
         IniFile.WriteInteger(IniNokia, IniNokiaConnectionType, NokiaConnectionType);
         IniFile.Free;
      end;
end;

procedure TWinData.LoadNokiaIniSettings(var ComNumber,
  NokiaConnectionType: Byte);
var
  IniFile : TIniFile;
  IniFileName : String;
begin
   IniFileName := IniDir + cPhoneLinkIniFile;
   if not FileExists(IniFileName) then
      CreateNokiaIniSettings
   else
      begin
         IniFile := TIniFile.Create(IniFileName);
         ComNumber := IniFile.ReadInteger(IniNokia, IniComPort, -1);
         NokiaConnectionType := IniFile.ReadInteger(IniNokia, IniNokiaConnectionType, 1);
         IniFile.Free;
      end;
end;

procedure TWinData.CreateNokiaIniSettings;
var
  sStrings : TStringList;
  IniFile : TIniFile;
  IniFileName : String;
begin
   IniFileName := IniDir + cPhoneLinkIniFile;
   IniFile := TIniFile.Create(IniFileName);
   sStrings := TStringList.Create;
   sStrings.Clear;
   sStrings.Append('['+IniNokia+']');
   sStrings.Append(#13);
   sStrings.Append(IniComPort+'='+IntToStr(1)+'');
   sStrings.Append(IniNokiaConnectionType+'='+IntToStr(1)+'');
   sStrings.Append(#13);
   sStrings.Append('['+IniSiemens+']');
   sStrings.Append(IniComPort+'=1');
   sStrings.SaveToFile(IniFileName);
   IniFile.Free;
end;

procedure TWinData.CrushDiskTransAfterInsert(DataSet: TDataSet);
begin
 {  if ( CrushDiskTrans.State = dsInsert ) then
      CrushDiskTrans.FieldByName('DiskID').AsInteger := CrushDisk.FieldByName('ID').AsInteger;
 }
end;

procedure TWinData.CrushDiskAfterPost(DataSet: TDataSet);
begin
   DBISaveChanges(CrushDisk.Handle);
end;

procedure TWinData.CrushDiskTransAfterPost(DataSet: TDataSet);
begin
   DBISaveChanges(CrushDiskTrans.Handle);
end;

procedure TWinData.CrushDiskBeforeClose(DataSet: TDataSet);
begin
   if CrushDisk.State in dsEditModes then
      CrushDisk.Post;
end;

procedure TWinData.CrushDiskTransBeforeClose(DataSet: TDataSet);
begin
   if CrushDiskTrans.State in dsEditModes then
      CrushDiskTrans.Post;
end;

procedure TWinData.LoadBtnImage(Glyph : TBitMap; Index : Integer);
begin
   try
      Images.GetBitmap(Index, Glyph);
      Glyph.Transparent := True;
   except
   end;
end;

procedure TWinData.SetFieldsRepsVerNo(const Value: Integer);
var
   Reg : TRegistry;
begin
   if Value <= 0 then
      Exit;

   Reg := TRegistry.Create;
   try
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      if Reg.OpenKey(Reg_FieldsReps, True) then
         Reg.WriteInteger('VerNo', Value);
      Reg.CloseKey;
   finally
      Reg.Free;
   end;
end;

procedure TWinData.SQLEmptyTable(TblName: String);
var
   qEmpty : TQuery;
begin
   WinData.CreateTQuery(qEmpty,nil,'');
   with qEmpty do
      try
         SQL.Clear;
         SQL.Add('DELETE FROM '+TblName);
         ExecSQL;
      finally
         Free;
      end;
end;

procedure TWinData.CreateAFilters;
begin
   if FilteredAnimals.Exists then
      FilteredAnimals.DeleteTable;

   with GenQuery do
      try
         try
            SQL.Clear;
            SQL.Add('CREATE TABLE "AFilters.db"');
                  SQL.Add('(');
                  SQL.Add(' AID     INTEGER,');
            SQL.Add(' PRIMARY KEY(AID)');
            SQL.Add(')');
            ExecSQL; // Create the TABLE
         except
            Close;
            raise Exception.Create('Cannot create AFilters.db'+#13#10+cErrorContact);
         end;
      finally
         Close;
      end;
end;

procedure TWinData.GroupLinksAfterPost(DataSet: TDataSet);
begin
   DBISaveChanges(WinData.GroupLinks.Handle);
end;

procedure TWinData.FdStkEventsBeforePost(DataSet: TDataSet);
begin
   FdStkEventsBladeNotified.Value := False;
end;

function TWinData.CheckAnimalNoInUse(const AnimalNo: String;
  const HerdId: Integer): TAnimalCheck;
Var
   TestStr      : String;
begin
   // Used to see if the user wants to undelete a animal
   Result := AllOk;
   TestStr := StripSpaces(AnimalNo);
   if Length(TestStr) > 0 then
      // See if you can find the AnimalNo
      if LookUpDamSire.Locate('AnimalNo;HerdID',VarArrayOf([AnimalNo,HerdId]),[loCaseInsensitive] ) then
         Result := Entered;
end;

function TWinData.GetProjCalvingInfo(const AnimalID,
  LactNo: Integer): TCalvingInfo;
Var
   LastBull, NoOfCalves, NoDaysPreg, Gestation : Integer;
   ProjDate, TestDate, LastCalvingDate, LastServiceDate, LastPDDate : TDateTime;
begin
   with Result do
      begin
         ProjCalvingDate := 0;
         PregStatus := psNotPregnant;
         NoCalves := 0;
      end;
   LastBull := 0;
   Gestation := 283; // set default gestation, service info might contain bull gestation if so change default

   // Check the Last Calving Date Assign to variable
   WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(AnimalID) + ') And (AnimalLactNo = ' + IntToStr(LactNo) + ') And (EventType = ' + IntToStr(CCalvingEvent) + ')';
   WinData.CheckEvents.Filtered := True;
   if WinData.CheckEvents.FindLast then LastCalvingDate := WinData.CheckEvents.FieldbyName('EventDate').AsDateTime;

   // Clear the Filter
   WinData.CheckEvents.Filter := '';
   WinData.CheckEvents.Filtered := False;

   // Check the Last Service Against the Date today if it's more than 10 days display Message
   WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(AnimalID) + ') And (AnimalLactNo = ' + IntToStr(LactNo) + ') And (EventType = ' + IntToStr(CServiceEvent) + ')';
   WinData.CheckEvents.Filtered := True;
   if WinData.CheckEvents.FindLast then
      begin
          TestDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
          // Check the Last Service Date Assign to variable
          LastServiceDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
          // Check the Calving Record for the Bull used in last service
          if WinData.LookUpServices.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) then
             Begin
                Gestation := BreedingDataHelper.GetGestation ( WinData.LookUpServices.FieldByName('ServiceBull').AsInteger );
                if Gestation <= 0 then Gestation := 283;
                WinData.LastBull := WinData.LookUpServices.FieldByName('ServiceBull').AsInteger;
             end;
          Result.PregStatus := psUndefined;
          Result.ProjCalvingDate := ( TestDate + Gestation ); // Projected Date
          Result.NoCalves := 1;
      end;
   // Clear the Filter
   WinData.CheckEvents.Filter := '';
   WinData.CheckEvents.Filtered := False;

   // Check the PD Scan
   WinData.CheckEvents.Filter := '(AnimalID = ' + IntToStr(AnimalID) + ') And (AnimalLactNo = ' + IntToStr(LactNo) + ') And (EventType = ' + IntToStr(CPregDiagEvent) + ')';
   WinData.CheckEvents.Filtered := True;
   if WinData.CheckEvents.FindLast then
      begin
         // Only get preg diag info if PD Date is >= LastService
         // If Service after PD then take service info above.
         if WinData.CheckEvents.FieldByName('EventDate').AsDateTime >= LastServiceDate then
            // Check the Pregnancy Diagnosis Record for the No of Days Pregnant
            if WinData.LookUpPDs.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[]) then
               begin
                  if WinData.LookUpPDs.FieldByName('PregnancyStatus').AsBoolean then
                     begin
                        TestDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                        LastPDDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                        NoDaysPreg := WinData.LookUpPDs.FieldByName('DaysInCalf').AsInteger;

                        if WinData.LookUpPDs.FieldByName('NoCalves').AsInteger > 0 then
                           Result.NoCalves := WinData.LookUpPDs.FieldByName('NoCalves').AsInteger
                        else
                           Result.NoCalves := 1;

                        if ( NoDaysPreg > 0 ) and ( NoDaysPreg <= Gestation ) then
                           begin
                              Result.PregStatus := psPregnant;
                              Result.ProjCalvingDate := TestDate + ( Gestation - NoDaysPreg ) // Projected Date
                           end
                        else
                           begin
                              // if no. of days in calf is empty, project from last service date + Gest period
                              if LastServiceDate > 0 then
                                 begin
                                    Result.PregStatus := psUndefined;
                                    Result.ProjCalvingDate := LastServiceDate + Gestation; // Projected Date
                                    //Result.NoCalves := 1; default to Nocalves from Preg Diag
                                 end
                              else
                                 begin
                                    Result.PregStatus := psNotPregnant;
                                    Result.ProjCalvingDate := 0;
                                    Result.NoCalves := 0;
                                 end;
                           end;
                     end
                  else
                     begin
                        Result.ProjCalvingDate := 0; // Projected Date
                        Result.PregStatus := psNotPregnant;
                        Result.NoCalves := 0;
                        LastPDDate := WinData.CheckEvents.FieldByName('EventDate').AsDateTime;
                     end;
               end;
      end;

   // Clear the Filter
   WinData.CheckEvents.Filter := '';
   WinData.CheckEvents.Filtered := False;

   // No if calving event is lastest
   if  ((( LastCalvingDate > 0 ) and ( LastServiceDate > 0 ) and ( LastCalvingDate > LastServiceDate ))  or
        (( LastCalvingDate > 0 ) and ( LastPDDate > 0 ) and (LastCalvingDate > LastPDDate)))  then
      begin
         Result.ProjCalvingDate := 0;
         Result.PregStatus := psNotPregnant;
         Result.NoCalves := 0;
      end;
//   else if ((Result.ProjCalvingDate > 0 ) and (( Result.ProjCalvingDate + 30 ) < Now())) then
//      begin
//         Result.PregStatus := psUndefined;
//      end;
end;

procedure TWinData.AddRemoveProtectedTables(AddPassword: Boolean);
var
   SearchRec : TSearchRec;
   ATable : TTable;
   i : Integer;
   sTableName, sDataPath, sTempDir : string;
   DBList : TStringList;
   bFindResult : Boolean;

   procedure Setup;
   var
      ScanDir : String;
   begin
      sTempDir := IncludeTrailingBackslash(DataPath) + 'temp'+FormatDateTime('hhnnss', now);
      CreateDirectory(sTempDir);

      DBList.Clear;

      ScanDir := IncludeTrailingBackslash( sDataPath );
      bFindResult := (FindFirst( ScanDir + '*.*', faAnyFile , SearchRec ) =0);
      if bFindResult then
        begin
           repeat
              if ( SearchRec.Name <> '.' ) and ( SearchRec.Name <> '..' ) then
                 begin
                    DBList.Add(ScanDir + SearchRec.Name);
                 end;
              bFindResult := (FindNext( SearchRec ) = 0);
           until
              not bFindResult;
           SysUtils.FindClose( SearchRec ) ;
        end;
      DBList.Sorted := True;
   end;

   procedure BackupTable;
   var
      i : Integer;
      SearchTableName : string;
      bFileFound : Boolean;
   begin
      bFileFound := False;
      for i := 0 to DBList.Count-1 do
         begin
            SearchTableName := ChangeFileExt(ExtractFileName(DBList.Strings[i]),'');
            if (UPPERCASE(SearchTableName) = UPPERCASE(sTableName)) then
               begin
                  CopyFile ( pChar(DBList.Strings[i]), pChar(IncludeTrailingBackslash(sTempDir) + ExtractFileName(DBList.strings[i])),False);
                  bFileFound := True;
               end
            else if bFileFound then // file name has been processed will not find more on sorted list break for loop
               Break;
           end;
   end;

   procedure RestoreTable;
   var
      i : Integer;
      ScanDir, SearchTableName : string;
   begin
      ScanDir := IncludeTrailingBackslash( sTempDir );
      bFindResult := (FindFirst( ScanDir + '*.*', faAnyFile , SearchRec ) =0);
      if bFindResult then
        begin
           repeat
              if ( SearchRec.Name <> '.' ) and ( SearchRec.Name <> '..' ) then
                 begin
                    SearchTableName := ChangeFileExt(SearchRec.Name, '');
                    if Pos(UPPERCASE(sTableName), UPPERCASE(SearchTableName)) > -1 then
                       CopyFile ( pChar(IncludeTrailingBackslash(sTempDir) + SearchRec.Name), pChar(IncludeTrailingBackslash(sDataPath) + SearchRec.Name),True);
                 end;
              bFindResult := (FindNext( SearchRec ) = 0);
           until
              not bFindResult;
           SysUtils.FindClose( SearchRec ) ;
        end;
   end;

   procedure Cleanup;
   begin
      DeleteFolder(sTempDir,False);
   end;

begin
   DBList := TStringList.Create;
   try
      ATable := TTable.Create(nil);
      with ATable do
         try
            if not KingData.Connected then
               begin
                  // need to reopen the database to access the directory path.
                  KingData.Open;
                  sDataPath := KingData.Directory;
                  KingData.Close;
               end
            else
               sDataPath := KingData.Directory;

            if AddPassword then
               Setup;
            DatabaseName := KingData.DatabaseName;
            try
               for i := Low(AProtectedTables) to High(AProtectedTables) do
                  begin
                     TableName := AProtectedTables[i];
                     Exclusive := True;
                     Active := True;
                     try
                        if AddPassword then { Add the password to table }
                           begin
                              // before adding password to the table, take a copy of the table/indides
                              // into temp store. There is a problem that ocurrs frequently which seems
                              // to either corrupt the table of remove(delete) then table from the
                              // data folder.
                              // 1. Take a copy of table/indices
                              // 2. Add password to the table
                              // 3. Check table still exists, if not restore the table from the temp backup.
                              sTableName := ChangeFileExt(ATable.TableName,'');

                              // Table Backup of Table
                              BackupTable;

                              // Add password to table.
                              AddMasterPassword(ATable, MASTER_PASSWORD);
                           end
                        else
                           RemoveMasterPassword(ATable); { Clear the current password }
                     finally
                        Active := False;
                        if AddPassword then
                           begin
                              if not FileExists(IncludeTrailingBackslash(sDataPath) + sTableName + '.db') then
                                 begin
                                    // if the table does not exist restore from backup.
                                    RestoreTable;
                                 end;
                             Cleanup;
                           end;

                     end;
                  end;
            except
               MessageDlg( AProtectedTables[i]+ ' table restructure failed!',mtError,[mbOK],0);
            end;
         finally
            Free;
         end;
   finally
      FreeAndNil(DBList);
      RemoveDir(sTempDir);
   end;
end;

procedure TWinData.SetDisplayNews(const Value: Boolean);
begin
   Defaults.Open;
   with Defaults do
      try
         First;
            if FieldbyName('ShowMessage').AsBoolean <> Value then
               begin
                  Edit;
                  try
                     FieldbyName('ShowMessage').AsBoolean := Value;
                     Post;
                  except
                    Cancel;
                  end;
               end;
      finally
        Close;
      end;
end;

function TWinData.GetDisplayNews: Boolean;
begin
   Defaults.Open;
   with Defaults do
      try
         First;
         Result := FieldbyName('ShowMessage').AsBoolean;
      finally
        Close;
      end;

end;

procedure TWinData.CheckICBFCountry;
begin
{   if WinData.GlobalSettings.ICBFRegistered then
      begin
         if WinData.DefCountry(WinData.UserDefaultHerdID) = Ireland then
            WinData.GlobalSettings.ICBFRegistered := True
         else
            WinData.GlobalSettings.ICBFRegistered := False;
      end;
}
end;

function TWinData.IrishSystem: Boolean; // JT
begin
   Result := False;
   with OwnerFile do
      begin
         First;
         while not eof do
            begin
               if (UpperCase(FieldByName('HerdIdentity').AsString) <> 'NONE') and (FieldByName('Country').AsInteger = 1) then
                  begin
                     Result := True;
                     Break;
                  end;
               OwnerFile.Next;
            end;

         if Result then // Check if any irish herds
            begin
               First;
               while not eof do
                  begin
                     if (UpperCase(FieldByName('HerdIdentity').AsString) <> 'NONE') and (FieldByName('Country').AsInteger = 12) then
                        begin
                           Result := False;
                           Break;
                        end;
                     OwnerFile.Next;
                  end;
            end;
      end;
end;

function TWinData.CheckEventExists(AID, ALact, AEventType: Integer): Boolean;
var
  AlreadyActive : Boolean;
begin
   AlreadyActive := CheckEvents.Active;
   if not AlreadyActive then
      CheckEvents.Active := True
   else
      CheckEvents.Refresh;
   try

      if ALact > -1 then
         Result := Windata.CheckEvents.Locate('AnimalID;AnimalLactNo;EventType', VarArrayOf([AID, ALact, AEventType]),[])
      else
         Result := Windata.CheckEvents.Locate('AnimalID;EventType', VarArrayOf([AID, AEventType]),[])
   finally
      CheckEvents.active := AlreadyActive;
   end;
end;

function TWinData.CheckEventExists(AID, AEventType : Integer; AEventDate : TDateTime) : Boolean;
var
   AlreadyActive : Boolean;
begin
   AlreadyActive := CheckEvents.Active;
   if not AlreadyActive then
      CheckEvents.Active := True
   else
      CheckEvents.Refresh;
   try
      Result := Windata.CheckEvents.Locate('AnimalID;EventType;EventDate', VarArrayOf([AID, AEventType,AEventDate]),[])
   finally
      CheckEvents.active := AlreadyActive;
   end;
end;

procedure TWinData.CalcCalvingDate(const AID, LactNo,PlannedBull: integer;
  TestDate: TDateTime; var ProjCalvingDate: TDateTime;
  var CalvIndex: Integer);
var
   NoDays     : Double;
   GestPeriod : Integer;
   ThisTestDate   : TDateTime;
begin
   CalvIndex:=0;
   ProjCalvingDate:=0;
   // SP 04/10/2004. moved from Services, now used in PregDiag Event.
   GestPeriod := BreedingDataHelper.GetGestation ( PlannedBull ); // Default to 283 days if PlannedBull = 0
   if ( TestDate > 0 ) then
      TestDate := ( TestDate + GestPeriod );
   ProjCalvingDate := TestDate;
   // Calcalate the Projected Calving Index - Last Calving Date - Last Service Date
   if CheckEvents.Locate('AnimalId;AnimalLactNo;EventType',VarArrayOf([AID,LactNo,CCalvingEvent]),[]) then
      CalvIndex := Round( TestDate - CheckEvents.FieldByName('EventDate').AsDateTime );
end;

procedure TWinData.LastServiceDetails(const AID, LactNo: Integer;
  var EventDate : TDateTime; var BullUsed, ServiceType, NoStraws, GenDam: Integer);
begin
   BullUsed := 0;
   ServiceType := 0;
   NoStraws := 0;
   GenDam := 0;
   EventDate := 0;

   CheckEvents.Filter := Format(cEventLactFilterStr, [AID,LactNo,CServiceEvent]);
   CheckEvents.Filtered := True;
   try
      if CheckEvents.FindLast then
         begin
            EventDate := CheckEvents.FieldByName('EventDate').AsDateTime;
            if LookUpServices.Locate('EventID', CheckEvents['ID'], []) then
               begin
                  if ( LookUpServices.FieldByName('ServiceBull').AsInteger > 0 ) then
                     BullUsed := LookUpServices.FieldByName('ServiceBull').AsInteger;
                  if ( LookUpServices.FieldByName('ServiceType').AsInteger > 0 ) then
                     ServiceType := LookUpServices.FieldByName('ServiceType').AsInteger;
                  if ( LookUpServices.FieldByName('AmountOfStraw').AsInteger > 0 ) then
                     NoStraws := LookUpServices.FieldByName('AmountOfStraw').AsInteger;
                  if ( LookUpServices.FieldByName('GeneticDam').AsInteger > 0 ) then
                     GenDam := LookUpServices.FieldByName('GeneticDam').AsInteger;
               end;
         end;
   finally
      CheckEvents.Filter := '';
      CheckEvents.Filtered := False;
   end;

end;

procedure TWinData.HandleException(E : Exception; const Dataset : TBDEDataset = nil);
var
   tblName : string;
begin
   tblName := '';
   if E is EDatabaseError then
      begin
         if Dataset <> nil then
            begin

               if Uppercase(E.Message)  = 'TABLE IS NOT INDEXED.' then
                  begin
                     //ReIndexTable( TTable( Dataset )) ;
                     ReIndexAll(False);
                  end
               else
                  begin

                     if ( Dataset is TTable ) then
                        tblName := ( Dataset as TTable ).TableName;

                     if Dataset.State in dsEditModes then
                        Dataset.Cancel;

                     if tblName <> '' then
                        raise EDatabaseError.Create(e.Message + ' Table '+tblName)
                     else
                        raise EDatabaseError.Create(E.Message);
                  end;
            end;

      end
   else if E is Exception then
      raise Exception.Create(E.Message);
end;

procedure TWinData.DeletedCalvingsAfterPost(DataSet: TDataSet);
begin
 //  DBISaveChanges(DeletedCalvings.Handle);
end;

procedure TWinData.ClearEventFilter;
begin
   CheckEvents.Filter := '';
   CheckEvents.Filtered := False;
end;

procedure TWinData.GetPurchaseEventDetails(const AID : Integer;
  var PurchaseRecord: PPurchaseRecord);
var
  AlreadyActive : Boolean;
begin

   FillChar(PurchaseRecord^, SizeOf(TPurchaseRecord), 0);
   AlreadyActive := LookUpPurchases.Active;
   if not AlreadyActive then
      LookUpPurchases.Active := True;

   CheckEvents.Filter := Format(cEventFilterStr, [AID,CPurchaseEvent]);
   CheckEvents.Filtered := True;

   try
      if CheckEvents.FindLast then
         begin
            PurchaseRecord^.Date := CheckEvents.FieldByName('EventDate').AsDateTime;
            if LookUpPurchases.Locate('EventID', CheckEvents['ID'], []) then
               begin
                  if ( LookUpPurchases.FieldByName('Weight').AsFloat > 0 ) then
                     PurchaseRecord^.Weight :=  LookUpPurchases.FieldByName('Weight').AsFloat;
                  if ( LookUpPurchases.FieldByName('Price').AsFloat > 0 ) then
                     PurchaseRecord^.Price :=  LookUpPurchases.FieldByName('Price').AsFloat;
                  if ( LookUpPurchases.FieldByName('Buyer').AsInteger > 0 ) then
                     begin
                        PurchaseRecord^.Buyer := LookUpPurchases.FieldByName('Buyer').AsInteger;

                        if Buyers.Locate('ID', PurchaseRecord^.Buyer, []) then
                           PurchaseRecord^.sBuyer := Buyers.FieldByName('Name').AsString;
                     end;
                  if ( LookUpPurchases.FieldByName('Supplier').AsInteger > 0 ) then
                     begin
                        PurchaseRecord^.Supplier := LookUpPurchases.FieldByName('Supplier').AsInteger;

                        if Suppliers.Locate('ID', PurchaseRecord^.Supplier, []) then
                           begin
                              PurchaseRecord^.sSupplier := Suppliers.FieldByName('Name').AsString;
                              PurchaseRecord^.sSupplierHerdIdent := Suppliers.FieldByName('Name').AsString;
                           end;
                     end;
               end;
         end;
   finally
      CheckEvents.Filter := '';
      CheckEvents.Filtered := False;
      LookUpPurchases.Active := AlreadyActive;

   end;

end;

procedure TWinData.GetWeighingEventDetails(const AID, LactNo : Integer;
   var WeighingRecord : PWeighingRecord);
var
  LastIndexName : string;
  AlreadyActive : Boolean;
begin
   FillChar(WeighingRecord^, SizeOf(TWeighingRecord), 0);

   AlreadyActive := LookupWeighings.Active;
   if not AlreadyActive then
      LookupWeighings.Active := True;

   LastIndexName := '';
   if CheckEvents.IndexName <> 'iEventDate' then
      begin
         LastIndexName := CheckEvents.IndexName;
         CheckEvents.IndexName := 'iEventDate';
      end;

   if ( LactNo > -1 ) then
      CheckEvents.Filter := Format(cEventLactFilterStr, [AID,LactNo,cWeightEvent])
   else
      CheckEvents.Filter := Format(cEventFilterStr, [AID,cWeightEvent]);
   CheckEvents.Filtered := True;

   try
      if CheckEvents.FindLast then
         begin
            WeighingRecord^.Date := CheckEvents.FieldByName('EventDate').AsDateTime;
            if LookupWeighings.Locate('EventID', CheckEvents['ID'], []) then
               begin
                  if ( LookupWeighings.FieldByName('Weight').AsFloat > 0 ) then
                     WeighingRecord^.Weight :=  LookupWeighings.FieldByName('Weight').AsFloat;
               end;
         end;
   finally
      CheckEvents.Filter := '';
      CheckEvents.Filtered := False;
      if LastIndexName <> '' then
         CheckEvents.IndexName := LastIndexName;

      LookupWeighings.Active := AlreadyActive;
   end;

end;

function TWinData.LUValue(const AnimalID: Integer): double;
begin
   Result := 0;
   try
   finally
   end;
end;

procedure TWinData.LookupTablesActive(const Open: Boolean;
  const Tables: array of TTable);
var
  i : byte;
begin
   for i := Low(Tables) to High(Tables) do
      Tables[i].Active := Open;
end;

procedure TWinData.GetGroupAnimals(const GrpID : Integer;
   var AList: TList);
begin

   if ( AList <> nil ) then
      begin
         AList.Clear;
         with TQuery.Create(nil) do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('Select Distinct(AnimalID) From GrpLinks Where (GroupID = :AGroupID) And AnimalID > 0');
               Params[0].AsInteger := GrpID;
               Open;
               try

                  if not IsEmpty then
                     begin
                        First;
                        while not eof do
                           begin
                              AList.Add(pointer(FieldByName('AnimalID').AsInteger));
                              Next;
                           end;
                     end;
               finally
                  Close;
               end;
            finally
               Free;
            end;
      end;
end;

function TWinData.SortByNatIDByFarmNo(const NatID: string): string;
var
   Digits, TempNatID : String;
   Len : Integer;
begin
   //Result := NatID;
   Result := '';
   TempNatID := WinData.StripAllSpaces(NatID);
   if ( WinData.WhatStyleNatID(NatID, False) = Style1999 ) then
      begin
         Digits := Copy(TempNatID, Length(TempNatID)-3, 4);
         Result := PadLeft(Digits, '0', 20);
      end
   else if IsNINatID(NatID) then
      begin
         if ( Length(TempNatID) in [11..14] ) then
            begin
               Digits := Copy(Copy(TempNatID, Length(TempNatID)-4, 5), 1, 4);
               Result := PadLeft(Digits, '0', 20);
            end;
      end;
end;

function TWinData.ValidNITagNo(TagNo: string): Boolean;
var
   FormattedTag : String;
begin
   Result := CheckNINatID(TagNo, FormattedTag);
end;

function TWinData.GetICBFMatchField: string;
var
   Reg : TRegistry;
begin
   Result := 'AnimalNo';
   Reg := TRegistry.Create;
   try
      Reg.RootKey := HKEY_USERS;
      { Reg_ICBFMatchField = HKEY_USERS\.DEFAULT\Software\Kingswood\HERD\ICBFMatchField }
      if Reg.OpenKey(Reg_ICBFMatchField, True) then
         begin
            if not Reg.ValueExists('Value') then
               Reg.WriteString('Value', Result);
            Result := Reg.ReadString('Value');
            Reg.CloseKey;
         end;
   finally
      Reg.Free;
   end;
end;

procedure TWinData.SetICBFMatchField(const Value: string);
var
   Reg : TRegistry;
begin
   Reg := TRegistry.Create;
   try
      Reg.RootKey := HKEY_USERS;
      if Reg.OpenKey(Reg_ICBFMatchField, True) then
         Reg.WriteString('Value', Value);
      Reg.CloseKey;
   finally
      Reg.Free;
   end;
end;

procedure TWinData.CustomersAfterPost(DataSet: TDataSet);
begin
   NewCustomerAttributes := [];
end;

function TWinData.OpenTable(ATable : TTable;
 CachedUpdateMode : Boolean = False) : Boolean;
begin
   Result := False;
   try
      ATable.Active := True;
      ATable.CachedUpdates := CachedUpdateMode;
      Result := True;
   except
      on E : EDatabaseError do
         begin
            if Uppercase(E.Message)  = 'TABLE IS NOT INDEXED.' then
               begin
                  ReIndexAll(False);
                  ATable.Active := True;
                  ATable.CachedUpdates := CachedUpdateMode;
                  Result := True;
               end;
         end;
   end;
end;

procedure TWinData.CreateRestorePoint;
begin
   try
      RestorePoint.ZipDirectory := DataPath;
      if DirectoryExists( RestorePoint.ZipDirectory ) then
         begin
            RestorePoint.OutputName := UPPERCASE(ExtractDirFromPath(RestorePoint.ZipDirectory));
            RestorePoint.CreatePoint;
         end;
   except
   end;
end;

procedure TWinData.SetInHerdStatus(const InHerd : Boolean; const AID : Integer = 0);
var
   AnimalID : Integer;
begin
   AnimalID := 0;
   if AID = 0 then // use animalfilebyidid
      begin
         if AnimalFileByIDID.AsInteger > 0 then
            AnimalID := AnimalFileByIDID.AsInteger;
      end
   else
      AnimalID := AID;

   if AnimalID > 0 then
      begin
         SetInHerd.ParamByName('AID').AsInteger := AnimalID;
         SetInHerd.ParamByName('AInHerd').AsBoolean := InHerd;
         try
            SetInHerd.ExecSQL;
         except
            raise Exception.Create('Cannot set Inherd status - contact Kingswood ');
         end;
      end;
end;

procedure TWinData.tBlupNewRecord(DataSet: TDataSet);
begin
   tBlup.FieldByName('AnimalID').AsInteger := AnimalFileByIDID.AsInteger;
end;

procedure TWinData.tBlupAfterPost(DataSet: TDataSet);
begin
   DBISaveChanges(tBlup.Handle);
end;

procedure TWinData.tBlupAfterDelete(DataSet: TDataSet);
begin
   DBISaveChanges(tBlup.Handle);
end;
{
function TWinData.CreateSortNatIDString(const NatID: string; const AHerdID : Integer): String; // SP
var
   SpaceCount : Integer;
   tNatID : string;
   tNINatID : string;
   i, nPos : integer;
begin
   Result := NatID;
   if ( Length(NatID) > 0 ) then
      begin
         tNatID := RemoveCheckDigit(NatID);
         tNatID := StripAllNomNumAlpha(tNatID);
         if Copy(tNatID, 1, 2) = 'UK' then
            begin
               tNINatID := NatID;

               tNINatID := ReplaceAllNonAlphaChars(tNINatID, ' ');
               SpaceCount := GetTokenCount(tNINatID, ' ');
               if (SpaceCount = 0) then
                  begin
                     if Length(tNatID) = 14 then
                       begin
                          Result := Copy(tNatID, Length(tNatID)-4, 5);
                          Result := InsertZeros(Result, 20);
                       end;
                  end
               else
                  begin
                     if SpaceCount in [3,4] then
                        begin
                           i := 0;
                           while i < SpaceCount-1 do
                              begin
                                 Inc(i);
                                 nPos := Pos(' ', tNINatID);
                                 Delete(tNINatID, 1, nPos);
                              end;
                           tNINatID := StripAllNomNumAlpha(tNINatID);
                           Result := InsertZeros(tNINatID, 20);
                        end
                     else if SpaceCount = 1 then
                        begin
                           nPos := Pos(' ', tNINatID);
                           Delete(tNINatID, 1, nPos);
                           tNINatID := StripAllNomNumAlpha(tNINatID);
                           if Length(tNINatID) <= 6 then
                              Result := InsertZeros(tNINatID, 20);
                        end;
                  end;
            end
         else
            begin
               if AHerdID > 0 then
                  begin
                     if HerdLookup.CountryByHerdID(AHerdID) = NIreland then
                        begin
                           if WhatStyleNatID(tNatID, False) = Style1999 then
                              begin
                                 if Copy(tNatID, 1, 2) = 'IE' then
                                    begin
                                       Delete(tNatID, 1, 2);
                                       tNatID := '9'+tNatID;
                                       Result := InsertZeros(tNatID, 20);
                                    end;
                              end;
                        end;
                  end
               else
                  Result := InsertZeros(tNatID, 20);
            end;
      end;
end;
}
function TWinData.NextAnimalID: Integer;
begin
   Result := NewID;
end;

function TWinData.NextEventID: Integer;
begin
   Result := NewOtherID;
end;

procedure TWinData.BullExtAfterPost(DataSet: TDataSet);
begin
   DBIForceWrite( BullExt );
end;

procedure TWinData.BullExtAfterDelete(DataSet: TDataSet);
begin
   DBIForceWrite( BullExt );
end;

procedure TWinData.CowExtAfterDelete(DataSet: TDataSet);
begin
   DBIForceWrite( CowExt );
end;

procedure TWinData.CowExtAfterPost(DataSet: TDataSet);
begin
   DBIForceWrite( CowExt );
end;

procedure TWinData.ClearPasswordFromTables;
var
   Reg : TRegistry;
begin
   // only do this once! clear passwords for all protected tables.
   Reg := TRegistry.create;
   try
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      if Reg.OpenKey('SOFTWARE\Kingswood\Herd\Misc\'+KingswdDatabaseName, TRUE) then
         begin
            if not Reg.ValueExists('ClearPassword') then
               begin
                  AddRemoveProtectedTables(False);  // clear all passwords!
                  Reg.WriteBool('ClearPassword', TRUE);
               end;
            Reg.CloseKey;
         end;

   finally
      Reg.Free;
   end;
end;

function TWinData.EventsRecorded(const AID: Integer): Boolean;
begin
   with qEventsRecorded do
      begin
         Params[0].Value := AID;
         Prepared := True;
         Active := True;
         try
            Result := ( FieldByName('CID').AsInteger > 0 );
         finally
            Active := False;
         end;
      end;
end;

procedure TWinData.EventsAfterInsert(DataSet: TDataSet);
begin
   if (EventType in [ TSaleDeath, TPreSale]) then
      begin
         SaleDeath.Append;
         if ActivePDAEvents then
            begin
               if SaleDeathRecord <> nil then
                  begin
                     if SaleDeathRecord^.EventDate > 0 then
                        EventsEventDate.Value := SaleDeathRecord^.EventDate
                     else
                        EventsEventDate.Value := Date;
                     if SaleDeathRecord^.Comment <> '' then
                        EventsEventDesc.Value := SaleDeathRecord^.Comment
                     else if SaleDeathRecord^.Sold then
                        EventsEventDesc.Value := 'Sale'
                     else
                        EventsEventDesc.Value := 'Death'
                  end;
            end;
      end;
end;

function TWinData.SortAnimalNoString(InStr: string): string;

var
  i : Integer;
  tstr : string;
begin
   InStr := StripAllNomNumAlpha(InStr);
   tStr := InStr;
   for i := Length(tstr) downto 1 do
      begin
         if (InStr[i] in ['A'..'Z']) then
            Delete(tStr, i, 1)
         else
            Break;
      end;
   Result := InsertZeros(tstr, 10 );
end;

{procedure TWinData.UpgradeTableLevel;
const
  ParadoxTableLevel = 7;
var
   TableList : TStringList;
   i : Integer;
   TempTable : TTable;
begin
   try
      try
         RestorePoint.ZipDirectory := DataPath;
         if DirectoryExists( RestorePoint.ZipDirectory ) then
            begin
               RestorePoint.OutputName := 'preparadoxupdate';
               RestorePoint.CreatePoint;
            end;
      except
      end;

      TableList := TStringList.Create;
      Session.GetTableNames('KINGSWD', '*.db', False, False, TableList);
      TempTable := TTable.Create(nil);
      try
        TempTable.DatabaseName := AliasName;
        for i := 0 to TableList.Count-1 do
           begin
              TempTable.TableName := TableList.Strings[i];
              TempTable.Active := True;
              try
                 if GetTableLevel(TempTable) < ParadoxTableLevel then
                    //ChangeLevel(KingData.Handle, TempTable.TableName, IntToStr( ParadoxTableLevel));
                    PackTable( TempTable );

              finally
                 TempTable.Active := false;
              end;
           end;
      finally
         TableList.Free;
         TempTable.Free;
      end;
   finally
   end;
end;
{
procedure TWinData.UpgradeTableLevels;
const CheckTables : array [0..0] of string = ('MilkDisk.db');
var
   TempTable : TTable;
begin
   TempTable := TTable.Create(nil);
   try
   TempTable.DatabaseName := AliasName;

   for i := 0 to Length( CheckTables ) do
      begin
         TempTable.TableName := CheckTables[i];
         if GetTableLevel(TempTable) < ParadoxTableLevel then
            ChangeLevel(KingData.Handle, TempTable.TableName, IntToStr( ParadoxTableLevel));
      end;
   finally
      TempTable.Free;
   end;
end;
}

function TWinData.CreateYoungStockEBIValues(
   const HerdID : Integer) : Integer;
var
   tCowExt, tBullExt, tYoungStock : TTable;
   DamID, SireID : Integer;
   DamEBI , SireEBI, YoungStockEBI : Variant;
   FemaleSex : Boolean;
   YoungStockRecFound : Boolean;
begin
   Result := 0;
   CreateTTable(tCowExt, nil, AliasName, 'CowExt');
   CreateTTable(tBullExt, nil, AliasName, 'BullExt');
   CreateTTable(tYoungStock, nil, AliasName, 'Animals');

   tCowExt.Active := True;
   tBullExt.Active := True;
   tYoungStock.Active := True;
   try

      tYoungStock.Filter := '( Inherd = True ) and ( LactNo = 0 ) and ( Breeding = True ) and ( Sex <> ''Steer'' )';
      if HerdID > 0 then
         tYoungStock.Filter := Format(tYoungStock.Filter + ' and ( HerdID = %d )', [HerdID]) ;

      tYoungStock.Filtered := True;

      YoungStockRecFound := tYoungStock.FindFirst;
      while YoungStockRecFound do
         begin

            DamEBI  := 0;
            SireEBI := 0;
            YoungStockEBI := 0;
            try

               FemaleSex := UPPERCASE(tYoungStock.FieldByName('Sex').AsString) = 'FEMALE';

               DamID   := tYoungStock.FieldByName('DamID').AsInteger;
               SireID  := tYoungStock.FieldByName('SireID').AsInteger;

               if ( DamID > 0 ) then
                  DamEBI  := tCowExt.Lookup('AnimalID', DamID, 'EBI');
               if ( SireID > 0 ) then
                  SireEBI := tBullExt.Lookup('AnimalID', SireID, 'RBI');

               try
                 YoungStockEBI := ( ( DamEBI + SireEBI ) / 2 );
               except
               end;

               {if ( DamEBI > 0 ) and ( SireEBI > 0 ) then
                  begin
                     YoungStockEBI := ( ( DamEBI + SireEBI ) / 2 );
                  end
               else if ( DamEBI > 0 ) then
                  begin
                     YoungStockEBI := DamEBI;
                  end
               else
                  begin
                     YoungStockEBI := SireEBI;
                  end;}

               if ( YoungStockEBI > 0 ) then
                  begin
                     if FemaleSex then
                        begin

                           if tCowExt.Locate('AnimalID', tYoungStock.FieldByName('ID').AsInteger, []) then
                              tCowExt.Edit
                           else
                              tCowExt.Append;

                           try
                              if ( tCowExt.State = dsInsert ) then
                                 tCowExt.FieldByName('AnimalID').AsInteger := tYoungStock.FieldByName('ID').AsInteger;
                              tCowExt.FieldByName('EBI').AsFloat := YoungStockEBI;
                              tCowExt.Post;
                              DBISaveChanges(tCowExt.Handle);
                              Inc(Result);
                           except
                              tCowExt.Cancel;
                           end;

                        end
                     else
                        begin

                           if tBullExt.Locate('AnimalID', tYoungStock.FieldByName('ID').AsInteger, []) then
                              tBullExt.Edit
                           else
                              tBullExt.Append;

                           try
                              if ( tBullExt.State = dsInsert ) then
                                 tBullExt.FieldByName('AnimalID').AsInteger := tYoungStock.FieldByName('ID').AsInteger;
                              tBullExt.FieldByName('RBI').AsFloat := YoungStockEBI;
                              tBullExt.Post;
                              DBISaveChanges(tBullExt.Handle);
                              Inc(Result);
                           except
                              tBullExt.Cancel;
                           end;

                        end;
                  end;
            finally
               YoungStockRecFound :=  tYoungStock.FindNext;
            end;

         end;
   finally
      tCowExt.Close;
      tCowExt.Free;
      tBullExt.Close;
      tBullExt.Free;
      tYoungStock.Close;
      tYoungStock.Free;
   end;


end;

function TWinData.CalcDrugCost(const ThisDrugUsed : Integer;
 const ThisRateOfApplic : Double; const NoOfDoses : Integer = 1) : Double;
var
   QuantityUsed,
   PurchUnit,
   UnitUsed   : Double;
begin
   if WinData.Medicine.Locate('ID',ThisDrugUsed,[]) then
      if WinData.Units.Locate('ID', WinData.Medicine.FieldByName('DoseUnit').Value,[]) then
         begin
            UnitUsed := WinData.Units.FieldByName('Multiplier').AsFloat;
            if WinData.Units.Locate('ID', WinData.Medicine.FieldByName('PurchUnit').Value,[]) then
               begin
                  PurchUnit := WinData.Units.FieldByName('Multiplier').AsFloat;
                  QuantityUsed := ( UnitUsed * ThisRateOfApplic );
                  if ( PurchUnit <> 0 ) then
                     Result := QuantityUsed * ( WinData.Medicine.FieldByName('CostPurchUnit').AsFloat / PurchUnit );
                  if (NoOfDoses>1) then
                     Result := ( Result * NoOfDoses );

               end;
         end;
end;

function TWinData.CheckCMMSAllocation(APermitType : TNBASPermits): Boolean;
var
   sPermitType : Char;
begin
   Result := True;

   case APermitType of
      NBAS31G : sPermitType := 'G';
   else
      raise Exception.Create('Invalid form type');
   end;

   with CMMSPermits do
      begin
         if ( RecordCount <> 0 ) then
            begin
               First;
               Filter := 'AllocationsUsed = False AND PermitType = '''+sPermitType+'''';
               Filtered := True;
               try
                  Result := RecordCount <= 0;
               finally
                  Filter := '';
                  Filtered := False;
               end;
            end;
      end;
end;

procedure TWinData.CMMSPermitsAfterPost(DataSet: TDataSet);
begin
   if not CMMSPermits.CachedUpdates then
      DBIForceWrite(CMMSPermits);
end;

procedure TWinData.CMMSPermitsNewRecord(DataSet: TDataSet);
begin
   CMMSPermits.FieldByName('AllocationsUsed').AsBoolean := False;
   CMMSPermits.FieldByName('Remaining').AsInteger := 0;
   CMMSPermits.FieldByName('UpdateDate').AsDateTime := Date;
end;

procedure TWinData.CMMSPermitsBeforePost(DataSet: TDataSet);
begin
   if CMMSPermits.FieldByName('Remaining').AsInteger <= 0 then
      begin
         CMMSPermits.FieldByName('AllocationsUsed').AsBoolean := True;
         //MessageDlg('All CMMS Permit allocations have been used',mtInformation,[mbOK],0);
      end;
end;

function TWinData.ExtractHerdIdentifier(NatIDMask: string; const AFormatResult : Boolean) : string;
begin
end;

procedure TWinData.AnimalFileByIDBeforeInsert(DataSet: TDataSet);
begin
   AnimalFileByIDNatIDNum.EditMask := DefaultNatIDMask;
end;

function TWinData.GetUserDefaultHerdCountry: TCountry;
begin
   Result := DefCountry( UserDefaultHerdID );
end;

procedure TWinData.CreatePDAEvents(const ADisplayMsgIfNoEvents : Boolean);
begin
   if def.Definition.dUsePhoneLink then
      begin
         with TCreateEvents.create do
            try
               LinkType  := esPDA;
               DisplayMsgIfNoEvents := ADisplayMsgIfNoEvents;
               CreateEvents;
            finally
               Free;
            end;
      end;
end;

procedure TWinData.CreatePhoneLinkEvents;
begin
   try
      if def.Definition.dUsePhoneLink then
         begin
            { do check here for SMS Files! }
            if WinData.SearchPhoneLink then // SP 27/09/2002.
               begin
                  with TCreateEvents.create do
                     try
                        if ( WinData.PhoneLinkType in ([plNOKIA, plSIEMENS]) ) then
                           begin
                              LinkType  := TEventFileSource( WinData.PhoneLinkType );
                              CreateEvents;
                           end;
                     finally
                        Free;
                        if MenuForm <> nil then
                           MenuForm.SetupQuery(True);
                     end;
               end;
         end;
   except
   end;
end;

procedure TWinData.EuroCheck;
begin
   if NOT UseEuro then
      Begin
         if OkToConvertToEuro then // checks to make sure all herds are Irish before attempting to convert to the euro currency.
            begin
               if EuroUpdate then
                  MenuForm.SetUpQuery;
            end
      end
   else
      begin
         if UseEuro then
            begin
               if DefCountry(UserDefaultHerdID) = Ireland then
                  CurrencyString := '€'
            end
         else
            CurrencyString := '£';

         UpdatingToEuro := False;
         if Date < StrToDate('01/04/2002') then
            MessageDLG('You have converted your price data to Euros.'+#13+
                       'Please ensure ALL prices are entered in Euros €',mtInformation,[mbOK],0);
      end;
end;

function TWinData.CheckDealerHerd(const AHerdID: Integer): Boolean;
var
   tHerdID : String;
begin
   Result := True;
   with GenQuery do
      begin   // Bring in Herd Owner Details
         SQL.Clear;
         SQL.Add('SELECT HerdIdentity ');
         SQL.Add('FROM Owners O ');
         SQL.Add('WHERE (O.ID = :AHerdID=)');
         Params[0].AsInteger := AHerdID;
         Prepared := True;
         Open;
         try
            First;
            if FieldByName('HerdIdentity').AsString <> '' then
               begin
                  tHerdId := UPPERCASE(Trim(FieldByName('HerdIdentity').AsString));
                  Result := ( Copy(tHerdID, 5, 2) = '85' );
               end;
         finally
            Close;
         end;
      end;

end;

function TWinData.ActivePDAEvents(const IsTopMost : Boolean) : Boolean;
var
   i : Integer;
begin
   Result := False;
   for i := 0 to Screen.FormCount-1 do
      if Screen.Forms[i].Name = 'PhoneLinkEventsReview' then
         begin

            // if IsTopMost then all validation routines for calving event
            // should not be handled through normal validation routines.
            if ( IsTopMost ) then
               begin
                  Result := ( Screen.ActiveForm = PhoneLinkEventsReview );
                  Break;
               end
            else
               Result := True;
         end;
end;

procedure TWinData.MedicineNewRecord(DataSet: TDataSet);
begin
   // Set synch to PDA
   MedicineInUse.AsBoolean := TRUE;
end;

function TWinData.CheckNatIDNumInHerd(const ANatIDNum: string; const AHerdID : Integer): TCheckNationalIDRecord;
var
   qNatIDs : TQuery;
begin
   Result.InHerd := False;
   qNatIDs := TQuery.Create(nil);
   with qNatIDs do
      try
         DatabaseName := AliasName;

         SQL.Clear;
         SQL.Add('SELECT Distinct A.NatIDNum, O.HerdIdentity');
         SQL.Add('FROM Animals A');
         SQL.Add('LEFT JOIN Owners O ON (O.ID=A.HerdID)');
         SQL.Add('Where A.NatIDNum =:ANatIDNum');
         SQL.Add('And ( A.InHerd = True )');
         SQL.Add('And ( A.HerdID = :AHerdID )');
         Params[0].AsString := ANatIDNum;
         Params[1].AsInteger := AHerdID;

         Open;
         try
            if not IsEmpty then
               begin
                  Result.Inherd := True;
                  Result.HerdNo := FieldByName('HerdIdentity').AsString;
               end;
         finally
            Close;
         end;

         if not Result.Inherd then
            begin
               // Check if the animal tag exists in the database but sold from herd.
               SQL.Clear;
               SQL.Add('SELECT Distinct A.ID, A.NatIDNum, O.HerdIdentity');
               SQL.Add('FROM Animals A');
               SQL.Add('LEFT JOIN Events E ON (E.AnimalID=A.ID)');
               SQL.Add('LEFT JOIN SalesDeaths S ON (S.EventID=E.ID)');
               SQL.Add('LEFT JOIN Owners O ON (O.ID=A.HerdID)');
               SQL.Add('Where (A.NatIDNum =:ANatIDNum)');
               SQL.Add('And (A.InHerd = False)');
               SQL.Add('And ( A.HerdID = :AHerdID )');
               SQL.Add('And (E.EventType = 11)');
               SQL.Add('And (E.EventDate >=:ADate)');
               SQL.Add('And (S.Sold = True)');
               Params[0].AsString := ANatIDNum;
               Params[1].AsInteger := AHerdID;
               Params[2].AsDateTime := IncMonth(Date, -24);
               Open;
               try
                  if not IsEmpty then
                     begin
                        Result.Sold := True;
                        Result.HerdNo := FieldByName('HerdIdentity').AsString;
                        Result.OldAID := Fields[0].AsInteger;
                     end;
               finally
                  Close;
               end;
            end;
      finally
         FreeAndNil(qNatIDs);
      end;
end;

procedure TWinData.CheckAISireRegister;
var
   RecNo : Integer;
   tBullExt : TTable;

   tAnimals : TTable;
   DBName : string;
begin

   RecNo := 0;
   DBName := KingswdDatabaseName;
   GetRegValue(cGSAISireUpdateRegPath+DBName,'RecNo', RecNo);
   if RecNo = 0 then
      KRoutines.SetRegValue(cGSAISireUpdateRegPath+DBName,'RecNo', Sires.RecordCount)
   else if RecNo <> Sires.RecordCount then
      begin
         KRoutines.SetRegValue(cGSAISireUpdateRegPath+DBName,'RecNo', Sires.RecordCount);

         CreateTTable(tAnimals, nil,AliasName,LookUpDamSire.TableName);
         CreateTTable(tBullExt, nil,AliasName,BullExt.TableName);
         tAnimals.Active := True;
         tBullExt.Active := True;

         Screen.Cursor := crHourGlass;

         ShowProgressIndicator('Updating AI Sires, please wait...', 0, Sires.RecordCount, 1);
         try
            with Sires do
               begin
                  First;
                  while not Eof do
                     begin
                         if tAnimals.Locate('AnimalNo',Sires.FieldByName('AICode').AsString,[]) then
                            begin
                               if tBullExt.Locate('AnimalID', tAnimals.FieldByName('ID').AsInteger,[]) then
                                  begin
                                     tBullExt.Edit;
                                     try
                                        tBullExt.FieldByName('Country').Value := FieldByName('Country').Value;
                                        tBullExt.FieldByName('Source').Value := FieldByName('Source').Value;
                                        tBullExt.FieldByName('RBI').AsFloat := FieldByName('RBI').AsFloat;
                                        tBullExt.FieldByName('MilkPredDiff').Value := FieldByName('MilkPredDiff').Value;
                                        tBullExt.FieldByName('FatKgs').Value := FieldByName('FatKgs').Value;
                                        tBullExt.FieldByName('FatPerc').Value := FieldByName('FatPerc').Value;
                                        tBullExt.FieldByName('ProtKgs').Value := FieldByName('ProtKgs').Value;
                                        tBullExt.FieldByName('ProtPerc').Value := FieldByName('ProtPerc').Value;
                                        tBullExt.FieldByName('Reliability').Value := FieldByName('Reliability').Value;
                                        tBullExt.FieldByName('CalvingDifficulty').Value := FieldByName('CalvingDifficulty').Value;
                                        tBullExt.Post;
                                     except
                                        tBullExt.Cancel;
                                     end;
                                  end;
                            end;
                        Next;
                        ProgressIndicator.StepIt;
                     end;
               end;
         finally
            tAnimals.Active := False;
            tBullExt.Active := False;
            FreeAndNil(tAnimals);
            FreeAndNil(tBullExt);
            ProgressIndicator.Close;
            Screen.Cursor := crDefault;
         end;
      end;
   Sires.active := False;
end;

procedure TWinData.TempCalvingBeforeCancel(DataSet: TDataSet);
begin
   RollbackTagAutoGenNumber;
end;

procedure TWinData.EventsBeforeCancel(DataSet: TDataSet);
begin
   if Events.State = dsInsert then
      begin
         case Events.FieldByName('EventType').Value of
           CCalvingEvent :
               begin
                  if TempCalving.State in dsEditModes then
                     TempCalving.Cancel;
                  TempCalving.First;
                  while not TempCalving.Eof do
                     begin
                        TempCalving.Delete;
                     end;
               end;
           CDisbuddingEvent :
               begin
                  if DisbuddingEventID.AsInteger = EventID.AsInteger then
                     Disbudding.Delete;
               end;
           CMealFeedingEvent :
               begin
                  if MealFeedingEventID.AsInteger = EventID.AsInteger then
                     MealFeeding.Delete;
               end;
           CWeaningEvent :
               begin
                  if WeaningEventID.AsInteger = EventID.AsInteger then
                     Weaning.Delete;
               end;
        end;
      end;
end;

function TWinData.DataSetApplyUpdates(DataSet: TDataSet; Apply : Boolean;
   DisplayUserPrompt : Boolean = True): Boolean;
begin
   Result := True;
   with TDBDataSet(DataSet) do
   begin
      if (State in dsEditModes) or UpdatesPending then
         begin
            if Apply then
               begin
                  Database.ApplyUpdates([DataSet as TDBDataSet]);
                  { Always call CancelUpdates to remove any discard changes }
                  CancelUpdates;
               end
            else //if DatasetModified(TDBDataSet(DataSet)) then
               begin
                  if not DisplayUserPrompt then
                     CancelUpdates
                  else if (MessageDlg('Unsaved changes, exit anyway?',mtConfirmation,[mbYes,mbCancel],0) = mrYes) then
                     begin
                        CancelUpdates;
                     end
                  else
                     Result := False;
               end;
         end;
   end;
end;

procedure TWinData.AnimalFileByIDCalcFields(DataSet: TDataSet);
var
   EBI : Variant;
   DOB, PurchDate, SaleDate : Variant;
   PurchNoDays : Variant;
   NoDays, NoDaysOnThisHerd : Integer;
begin
   if not (  Dataset.State in dsEditModes )  then
      begin
         if ( Dataset.FieldByName('Sex').AsString = 'Female' ) then
            begin
               EBI := AnimalFileByIDFemale_EBI.Value;
               if EBI <> Null then
                  AnimalFileByIDEBI.AsFloat := EBI;
            end
         else if ( Dataset.FieldByName('Sex').AsString = 'Bull' ) then
            begin
               EBI := AnimalFileByIDBull_EBI.Value;
               if EBI <> Null then
                  AnimalFileByIDEBI.AsFloat := EBI
            end;

         if AnimalFileByIDEBI.AsFloat = 0 then
            AnimalFileByIDEBI.Clear; // do not show 0 value EBI, this would be misleading.
      end;

   if GlobalSettings.DisplayMovementFeedColsInGridView then
     begin
         NoDays := 0;
         if ( AnimalFileByID.FieldByName('PurchDate').AsDateTime > 0 ) and ( AnimalFileByID.FieldByName('SaleDate').AsDateTime = 0 ) then
            begin
               PurchDate   := AnimalFileByID.FieldByName('PurchDate').AsDateTime;
               PurchNoDays := AnimalFileByID.FieldByName('PurchFQASDays').AsInteger;

               if PurchNoDays > 0 then
                  NoDays := Trunc( Date - PurchDate) + Integer(PurchNoDays)
               else
                  NoDays := Trunc( Date - PurchDate);
               NoDaysOnThisHerd := Trunc( Date - PurchDate);
            end
         else if ( AnimalFileByID.FieldByName('PurchDate').AsDateTime > 0 ) and ( AnimalFileByID.FieldByName('SaleDate').AsDateTime > 0 ) then
            begin
               PurchDate   := AnimalFileByID.FieldByName('PurchDate').AsDateTime;
               SaleDate := AnimalFileByID.FieldByName('SaleDate').AsDateTime;

               NoDaysOnThisHerd := Trunc( SaleDate - PurchDate);
            end
         else if ( AnimalFileByIDDateOfBirth.AsDateTime > 0 ) and ( AnimalFileByID.FieldByName('SaleDate').AsDateTime > 0 ) then
            begin
               DOB := AnimalFileByIDDateOfBirth.AsDateTime;
               SaleDate := AnimalFileByID.FieldByName('SaleDate').AsDateTime;

               NoDaysOnThisHerd := Trunc( SaleDate - DOB );
            end
         else if ( AnimalFileByIDDateOfBirth.AsDateTime > 0 ) then
            begin
               DOB := AnimalFileByIDDateOfBirth.AsDateTime;
               if (DOB>0) then
                  NoDays := Trunc( Date - DOB);
               NoDaysOnThisHerd := NoDays;
            end;
         AnimalFileByIDNoDaysOnThisFarm.AsInteger := NoDaysOnThisHerd;
         AnimalFileByIDPurchFQAS.AsBoolean := (NoDays > 90);
      end;
end;

function TWinData.CalcDrugWithdrawalDate(const AStartDate: TDateTime;
  const AWithdrawalDays, ANoDays: Integer): TDateTime;
var
   NoDays,WithdrawalDays : Integer;
begin
   NoDays := ANoDays;
   if ( NoDays <= 0 ) then NoDays := 1;
   if ( AWithdrawalDays < 0 ) then WithdrawalDays := 1;
   Result := AStartDate + (NoDays-1) + AWithdrawalDays;
end;

procedure TWinData.ServicesAfterInsert(DataSet: TDataSet);
begin
   if ServiceDefaults <> nil then
      begin
         ServicesAmountOfStraw.Value := ServiceDefaults.NumOfStraws;
         ServicesServiceType.Value := ServiceDefaults.ServiceType;
         ServicesServiceBull.Value := ServiceDefaults.BullUsed;
      end
   else
      ServicesAmountOfStraw.AsFloat := 1.0;
end;

procedure TWinData.BullingsAfterInsert(DataSet: TDataSet);
begin
   if BullingDefaults <> nil then
      begin
         BullingsPlannedBull.Value := BullingDefaults.PlannedBull;
         BullingsObservedBy.Value := BullingDefaults.ObservedBy;
      end;
end;

function TWinData.PedigreeNamePrefix(const HerdID: Integer): String;
begin
   Result := '';
   if OwnerFile.Locate('ID', HerdID, []) then
      Result := Trim(OwnerFile.FieldByName('HerdPreFix').AsString);
end;

procedure TWinData.PregDiagPregnancyStatusChange(Sender: TField);
//var
  // DaysInCalf, Pregnant : Variant;
begin
 {  if PregDiagPregnancyStatus.AsBoolean then
      begin
         GetDefaultPDDataFromLastService( DaysInCalf, Pregnant);
         PregDiag.FieldByName('DaysInCalf').Value := DaysInCalf;
         PregDiag.FieldByName('NoCalves').Value := 1;
      end
   else
      begin
         PregDiag.FieldByName('DaysInCalf').Value := 0;
         PregDiag.FieldByName('NoCalves').Value := 0;
      end;    }
end;

procedure TWinData.GetDefaultPDDataFromLastService(var DaysInCalf, Pregnant : Variant);
var
   LastServiceDate : TDateTime;
   BullID, ServeType, NoStraws, GDam : Integer;
   nDaysInCalf : Integer;
begin
    // Set the Preg Status to TRUE.
   WinData.LastServiceDetails(WinData.AnimalFileByIDID.AsInteger,
                              WinData.AnimalFileByIDLactNo.AsInteger,
                              LastServiceDate, BullID, ServeType, NoStraws, GDam);
   if ( LastServiceDate > 0 ) and ( EventsEventDate.AsDateTime > 0 ) and ( EventsEventDate.AsDateTime > LastServiceDate ) then
      begin
         nDaysInCalf := Trunc(EventsEventDate.AsDateTime - LastServiceDate);
         DaysInCalf := nDaysInCalf;
         Pregnant := True;
      end
   else
      begin
         DaysInCalf := Null;
         Pregnant := True;
      end;
end;

function TWinData.HerdSpecies(AHerdID : Integer): String;
begin
   Result := cSpecies_Bovine;

   if ((AHerdID = -1) and (UserDefaultHerdID <= 0 )) then Exit;

   with TQuery.Create(nil) do
      try
         DatabaseName := KingData.DatabaseName;
         SQL.Clear;
         SQL.Add('SELECT DISTINCT G.Description');
         SQL.Add('FROM GenLook G');
         SQL.Add('LEFT JOIN Owners O ON (O.Species=G.ID)');
         SQL.Add('WHERE G.ListType = '+IntToStr(LSpecies));
         SQL.Add('AND O.ID = :HerdID ');
         if AHerdID = -1 then
            ParamByName('HerdID').AsInteger := UserDefaultHerdID
         else
            ParamByName('HerdID').AsInteger := AHerdID;
         Open;
         Result := FieldByName('Description').AsString;
      finally
         Close;
         Free;
      end;
end;

function TWinData.GetGoatTagFormat: String;
var
  bAlreadyActive : Boolean;
begin
   Result := '';
   with Defaults do
      begin
         bAlreadyActive := Active;
         if not bAlreadyActive then Open;
         First;
         Result := Defaults.FieldByName('GoatTagFormat').AsString;
         Active := bAlreadyActive;
      end;
end;

procedure TWinData.SetGoatTagFormat(const Value: String);
var
  bAlreadyActive : Boolean;
  NewMask : String;
  i : Integer;
  tValue : String;
begin
   tValue := Value;
   if tValue[6] <> ' ' then
      System.Insert(' ',tValue,6);
   for i := 1 to Length(tValue) do
       NewMask := NewMask + '\' + tValue[i];

   with Defaults do
      begin
         if not bAlreadyActive then Open;
         bAlreadyActive := Active;
         First;
         if Defaults.FieldByName('GoatTagFormat').AsString <> NewMask + ' 0 00000;1;_' then
            begin
               Edit;
               Defaults.FieldByName('GoatTagFormat').AsString := NewMask + ' 0 00000;1;_';
               Post;
            end;
         Active := bAlreadyActive;
      end;
end;

function TWinData.HerdInUse(const AHerdID: Integer): Boolean;
begin
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('Select Count(ID) CountOfID From Animals where HerdID = :AHerdID');
         Params[0].AsInteger := AHerdID;
         Prepared := True;
         Active := True;
         try
            First;
            Result := ( FieldByName('CountOfID').AsInteger > 0 );
         finally
            Active := False;
         end;
      end;
end;

function TWinData.HerdType_BeefID: Integer;
begin
   Result := 25;
   if GenLookUp.Locate('ListType;Description',VarArrayOf([LHerdType,'BEEF']),[loCaseInsensitive]) then
      Result := GenLookUpID.AsInteger;

end;

function TWinData.HerdType_DairyID: Integer;
begin
   Result := 24;
   if GenLookUp.Locate('ListType;Description',VarArrayOf([LHerdType,'DAIRY']),[loCaseInsensitive]) then
      Result := GenLookUpID.AsInteger;
end;

function TWinData.HerdType_SucklerID: Integer;
begin
   Result := 26;
   if GenLookUp.Locate('ListType;Description',VarArrayOf([LHerdType,'SUCKLER']),[loCaseInsensitive]) then
      Result := GenLookUpID.AsInteger;
end;

function TWinData.SpeciesByID(const SID: Integer): String;
begin
   Result := cSpecies_Bovine;
   if GenLookUp.Locate('ID;ListType',VarArrayOf([SID,LSpecies]),[loCaseInsensitive]) then
      Result := GenLookUpDescription.AsString;
end;

procedure TWinData.MilkCumulativeCalcFields(DataSet: TDataSet);
begin
   if MilkCumulative.FieldByName('BfatPerc305').AsFloat > 0 then
      MilkCumulative305BFatKgs.Value := ((MilkCumulative.FieldByName('BfatPerc305').AsFloat / 100 ) * (MilkCumulative.FieldByName('Yield305').AsFloat));

   if MilkCumulative.FieldByName('ProtPerc305').AsFloat > 0 then
      MilkCumulative305ProtKgs.Value := ((MilkCumulative.FieldByName('ProtPerc305').AsFloat / 100 ) * (MilkCumulative.FieldByName('Yield305').AsFloat));

   MilkCumulative305TotalSolids.Value := (MilkCumulative305BFatKgs.Value + MilkCumulative305ProtKgs.Value);

   if MilkCumulative.FieldByName('CumBfatPerc').AsFloat > 0 then
      MilkCumulativeCumBFatKgs.Value :=  ((MilkCumulative.FieldByName('CumBfatPerc').AsFloat / 100 ) * (MilkCumulative.FieldByName('CumYield').AsFloat));

   if MilkCumulative.FieldByName('CumProtPerc').AsFloat > 0 then
      MilkCumulativeCumProtKgs.Value := ((MilkCumulative.FieldByName('CumProtPerc').AsFloat / 100 ) * (MilkCumulative.FieldByName('CumYield').AsFloat));

   MilkCumulativeCumTotalSolids.Value := (MilkCumulativeCumBFatKgs.Value + MilkCumulativeCumProtKgs.Value);

end;

function TWinData.GetDefaultHerdID: Integer;
var
   AlreadyOpen : Boolean;
begin
   Result := 0;
   AlreadyOpen := True;
   if not OwnerFile.Active then
      begin
         OwnerFile.Active := True;
         AlreadyOpen := False;
      end;
   try

      OwnerFile.First;
      if OwnerFile.RecordCount = 2 then
         begin
            OwnerFile.Next;// skip the non-herd
            Result := OwnerFile.FieldByName('ID').AsInteger; // return id of only other herd.
         end
   finally
      OwnerFile.Active := AlreadyOpen;
   end;
end;

function TWinData.GetCrossBreed(ABreedID : Integer): Integer; // SP 05/12/2006
var
   BreedCode : String[6];
   BreedLen : Word;
begin
   Result := 0;
   try
   if Breeds.Locate('ID', ABreedID, []) then
      begin
         BreedCode := UPPERCASE(TRIM(Breeds.FieldByName('Code').AsString));
         BreedLen := Length(BreedCode);
         if BreedLen > 0 then
            begin
               if ((BreedCode[BreedLen]) = 'X') then
                  Result := Breeds.FieldByName('ID').AsInteger
               else
                  begin
                     BreedCode := BreedCode + 'X';
                     if Breeds.Locate('Code', BreedCode, []) then
                        Result := Breeds.FieldByName('ID').AsInteger
                  end;
            end;
      end;
   except
   end;
end;


function TWinData.GetForageArea: Double;
begin
   with OwnerFile do
      if FindField('ForageAreaHa') <> nil then
         begin
            if Locate('ID', WinData.UserDefaultHerdID,[loCaseInsensitive]) then
               Result := FieldByName('ForageAreaHa').AsFloat;
         end;
end;

function TWinData.RoundUp(Value: Double): Double;
var
  t : double;
begin
   Result := Value;
   t := frac( Value );
   if t >= 0.5 then
      Result := Value + 1;
end;

procedure TWinData.AnimalFileByIDBeforeCancel(DataSet: TDataSet);
begin

   if AnimalFileByID.State = dsInsert then
      begin
         if AnimalFileByIDSex.AsString = cSex_Bull then
            begin
               if tBullSemen.State in dsEditModes then
                  tBullSemen.Cancel;

               if tBullExt.State in dsEditModes then
                  tBullSemen.Cancel;
            end
         else if AnimalFileByIDSex.AsString = cSex_Female then
            begin
               if ( CowExt.State in dsEditModes ) then
                  CowExt.Cancel;
            end;

         if ( tBlup.State in dsEditModes ) then
            tBlup.Cancel;
      end;
end;

procedure TWinData.MedicineBeforePost(DataSet: TDataSet);
begin
   if Medicine.FieldByName('PurchUnit').AsFloat > 0 then
      begin
            if WinData.Units.Locate('ID', Medicine.FieldByName('PurchUnit').Value,[]) then
               begin
                  if ( WinData.Units.FieldByName('Multiplier').AsFloat > 0 ) then
                     Medicine.FieldByName('StockLevel').AsFloat := (Medicine.FieldByName('QuantityInStock').AsFloat * WinData.Units.FieldByName('Multiplier').AsFloat);
               end;
      end;
end;

procedure TWinData.SetCMMSDataStartUpDate(const Value: TDateTime);
var
   bCloseTable : Boolean;
begin
   if not Defaults.Active then
      begin
         bCloseTable := True;
         Defaults.Active := True;
      end
   else
      bCloseTable := True;

   if Defaults.FindField('CMMSDataStartUpDate') <> nil then
      begin
         Defaults.First;
         Defaults.Edit;
         Defaults.FieldByName('CMMSDataStartUpDate').AsDateTime := Value;
         Defaults.Post;
      end;// 01/07/2007
   Defaults.Active := bCloseTable;
end;

function TWinData.GetCMMSDataStartUpDate: TDateTime;
var
   bCloseTable : Boolean;
begin
   Result := 0;
   if not Defaults.Active then
      begin
         bCloseTable := True;
         Defaults.Active := True;
      end
   else
      bCloseTable := True;

   if Defaults.FindField('CMMSDataStartUpDate') <> nil then
      begin
         Defaults.First;
         Result := Defaults.FieldByName('CMMSDataStartUpDate').AsDateTime;
      end;// 01/07/2007
   Defaults.Active := bCloseTable;
end;

function TWinData.GetDryDate(const AID, LactNo : Integer): TDateTime;
begin
   Result := EventDataHelper.GetLastEventDate(AID, LactNo, cDryOffEvent);
end;

function  TWinData.ClearPostivePregDiag(const AAnimalID, ALactNo : Integer;
  const AServiceDate : TDateTime) : Boolean;
var
   EID : Integer;
begin
   Result := True;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT E.ID FROM Events E ');
         SQL.Add('WHERE (E.AnimalID = '+IntToStr(AAnimalID)+')');
         SQL.Add('AND   (E.AnimalLactNo = '+IntToStr(ALactNo)+')');
         SQL.Add('AND   (E.EventType = '+IntToStr(CPregDiagEvent)+')');
         SQL.Add('AND   (E.EventDate <= ' + '''' + FormatDateTime(cUSDateStyle,AServiceDate) + '''' +')');
         Open;
         try
            First;
            EID := FieldByName('ID').AsInteger;
         finally
            Close;
         end;

         if EID > 0 then
            begin
               SQL.Clear;
               SQL.Add('Select PregnancyStatus From PregnancyDiag where Eventid=:EID ');
               SQL.Add('and PregnancyStatus = True');
               Params[0].AsInteger := EID;
               Open;
               if not IsEmpty then
                  begin
                     if MessageDlg('This animal has been diagnosed in calf.'+ cCRLF +
                                   'Do you wish to continue?',mtConfirmation,[mbYes,mbNo],0) = mryes then
                        begin
                           SQL.Clear;
                           SQL.Add('UPDATE PregnancyDiag SET PregnancyStatus = False, DAYSINCALF = 0, NoCalves = 0 where Eventid=:EID and PregnancyStatus = True');
                           Params[0].AsInteger := EID;
                           ExecSQL;

                           MessageDlg('Pregnancy Diagnosis event details have been reset.',mtInformation,[mbOK],0);
                        end
                     else
                        Result := False;
                  end;
            end;
      finally
         Free;
      end;
end;

function TWinData.GetDefaultHerdIdentifierMask: string;
var
   HerdID : Integer;
   i : Integer;
   NewMask : string;
begin
   HerdID := WinData.UserDefaultHerdID;
   // Get the Default Herd Identifier
   if DefCountry(AnimalFileByIDHerdID.AsInteger) = Ireland then
      begin
         NewMask := 'IE 00 00000';
         Result := '';
         if HerdID <> NONEHerdID then
            begin
               if OwnerFile.Locate('ID', HerdID, []) then
                  begin
                     if ( Length(OwnerFileHerdIdentifier.AsString) = 7 ) then
                        begin
                           if StringAllNumbers(OwnerFileHerdIdentifier.AsString) then
                              begin
                                 ReplaceChar(NewMask, OwnerFileHerdIdentifier.AsString[1], 4);
                                 ReplaceChar(NewMask, OwnerFileHerdIdentifier.AsString[2], 5);
                                 ReplaceChar(NewMask, OwnerFileHerdIdentifier.AsString[3], 7);
                                 ReplaceChar(NewMask, OwnerFileHerdIdentifier.AsString[4], 8);
                                 ReplaceChar(NewMask, OwnerFileHerdIdentifier.AsString[5], 9);
                                 ReplaceChar(NewMask, OwnerFileHerdIdentifier.AsString[6], 10);
                                 ReplaceChar(NewMask, OwnerFileHerdIdentifier.AsString[7], 11);
                                 for i := 1 to Length(NewMask) do
                                    Result := Result + '\' + NewMask[i];
                                 Result := Result +';1;_';
                              end;
                        end;
                  end;
            end;
      end
   else if DefCountry(AnimalFileByIDHerdID.AsInteger) = NIreland then
      begin
         NewMask := 'UK 9 000000';
         Result := '';
         if HerdID <> NONEHerdID then
            begin
               if OwnerFile.Locate('ID', HerdID, []) then
                  begin
                     if ( Length(OwnerFileHerdIdentifier.AsString) = 6 ) then
                        begin
                           if StringAllNumbers(OwnerFileHerdIdentifier.AsString) then
                              begin
                                 ReplaceChar(NewMask, OwnerFileHerdIdentifier.AsString[1], 6);
                                 ReplaceChar(NewMask, OwnerFileHerdIdentifier.AsString[2], 7);
                                 ReplaceChar(NewMask, OwnerFileHerdIdentifier.AsString[3], 8);
                                 ReplaceChar(NewMask, OwnerFileHerdIdentifier.AsString[4], 9);
                                 ReplaceChar(NewMask, OwnerFileHerdIdentifier.AsString[5], 10);
                                 ReplaceChar(NewMask, OwnerFileHerdIdentifier.AsString[6], 11);
                                 ReplaceChar(NewMask, OwnerFileHerdIdentifier.AsString[7], 12);
                                 for i := 1 to Length(NewMask) do
                                    Result := Result + '\' + NewMask[i];
                                 Result := Result +';1;_';
                              end;
                        end;
                  end;
            end;
      end;
end;

function TWinData.HerdIdentifierByHerdID(AHerdID: Integer): String;
var
   i : Integer;
   HerdIdentifierOK : Boolean;
begin
   HerdIdentifierOK := True;
   if OwnerFile.Locate('ID',AHerdID,[]) then
      begin
         if WinData.OwnerFileHerdIdentifier.IsNull then
            begin
               MessageDlg('Your Herd Designator has not been entered. Please enter in Herd Setup.'+#13+
                          'Your Herd Designator must be a 7 digit number without spaces or separators',mtInformation,[mbOK],0);
               HerdIdentifierOK := False;
               uHerdSetUp.ShowTheForm(FALSE,'HerdIdentifier');
               SysUtils.Abort;
            end
         else if Length(WinData.OwnerFileHerdIdentifier.AsString) <> 7 then
            begin
               MessageDlg('Your Herd Designator '+WinData.OwnerFileHerdIdentifier.AsString+' is not valid.'+#13+
                          'Your Herd Designator must be a 7 digit number without spaces or separators',mtError,[mbOK],0);
               HerdIdentifierOK := False;
               uHerdSetUp.ShowTheForm(FALSE,'HerdIdentifier');
               SysUtils.Abort;
            end
         else
            begin
               for i := 1 to Length(OwnerFileHerdIdentifier.AsString) do
                  begin
                     if NOT (OwnerFileHerdIdentifier.AsString[i] IN (['0'..'9'])) then
                        begin
                           MessageDlg('Your Herd Designator '+OwnerFileHerdIdentifier.AsString+' is not valid. '+#13+
                                      'Your Herd Designator must be a 7 digit number without spaces or separators',mtError,[mbOK],0);
                           HerdIdentifierOK := False;
                           uHerdSetUp.ShowTheForm(FALSE,'HerdIdentifier');
                           SysUtils.Abort;
                        end;
                  end;
            end;
      end
   else
      HerdIdentifierOK := False;

   if HerdIdentifierOK then
      begin
         Result := OwnerFileHerdIdentifier.AsString;
      end;

end;


function TWinData.GetDefaultNatIDMaskFromHerdIdentifierMask: string;
var
   tDefaultHerdIdentifierMask : string;
begin
   if DefCountry(AnimalFileByIDHerdID.AsInteger) = Ireland then
      begin
         tDefaultHerdIdentifierMask := DefaultHerdIdentifierMask;
         if Pos(';1;_', tDefaultHerdIdentifierMask) > 0 then
            Delete(tDefaultHerdIdentifierMask, Pos(';1;_', tDefaultHerdIdentifierMask), 4);
         Result := tDefaultHerdIdentifierMask + ' 0 0000;1;_';
      end
   else if DefCountry(AnimalFileByIDHerdID.AsInteger) = NIreland then
      begin
         tDefaultHerdIdentifierMask := DefaultHerdIdentifierMask;
         if Pos(';1;_', tDefaultHerdIdentifierMask) > 0 then
            Delete(tDefaultHerdIdentifierMask, Pos(';1;_', tDefaultHerdIdentifierMask), 4);
         Result := tDefaultHerdIdentifierMask + ' 0aaa A;1;_';
      end;
end;

procedure TWinData.CheckEventConsistency;
var
   Result : Integer;
   Params: TParams;
   ResultTable : TTable;
   Cursor: hDBICur;
begin
    Params := TParams.Create;
    ResultTable := TTable.Create(nil);
    try

    Params.CreateParam(ftInteger, 'AID', ptInput);
    Params[0].AsInteger := CheckEventID;

    Result := KingData.Execute('Select * from Events where ID = :AID',Params, False,@Cursor );
    TDBDataSet(ResultTable).Handle := Cursor;
    ResultTable.Active := True;
    try
       Result := ResultTable.RecordCount;
    finally
       ResultTable.Active := False;
    end;


    if Result <> 1 then
       begin
          raise exception.Create('Database Error. This event could not be saved - contact Kingswood');
       end
    else
       begin
          Result := KingData.Execute('Select * from '+sSubEventTable+' where EventID = :AID',Params,False,@Cursor);
          TDBDataSet(ResultTable).Handle := Cursor;
          ResultTable.Active := True;
          try
             Result := ResultTable.RecordCount;
          finally
             ResultTable.Active := False;
          end;
          if Result <> 1 then
             begin
                raise exception.Create('Database Error. This event could not be saved - contact Kingswood');
             end;
       end;
    finally
       FreeAndNil(Params);
       FreeAndNil(ResultTable);
    end;
end;

procedure TWinData.QueryICBFRegistrations;
{const
   QueryTxt ='Select Count(ID) CID From Events Where EventType = :d and ICBFNotified = False';
var
   PromptUser : Boolean;
begin
   PromptUser := False;
   with TQuery.create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add(QueryTxt);
         Params[0].AsInteger := CMealFeedingEvent;
         Open;
         try
            PromptUser := if FieldByName('CID').AsInteger > 0);
               begin
                  if MessageDlg('Suckler Cow Scheme - '+cCRLF+cCRLF+
                                'Meal Feeding events have not been registered with ICBF.'+cCRLF+cCRLF+
                                'Do you want to register events now?',mtConfirmation,[mbYes, mbNo],0) = idYes then
                     begin
                        uICBFEventExport.ShowTheForm;
                     end;
               end;
         finally
            Close;
         end;

         SQL.Clear;
         SQL.Add(QueryTxt);
         Params[0].AsInteger := CWeaningEvent;
         Open;
         try
            if FieldByName('CID').AsInteger > 0 then
               begin
                  if MessageDlg('Suckler Cow Scheme - '+cCRLF+cCRLF+
                                'Weaning events have not been registered with ICBF.'+cCRLF+cCRLF+
                                'Do you want to register events now?',mtConfirmation,[mbYes, mbNo],0) = idYes then
                     begin
                        uICBFEventExport.ShowTheForm;
                     end;
               end;
         finally
            Close;
         end;

         SQL.Clear;
         SQL.Add(QueryTxt);
         SQL.Add('And EventDate >= "'+FormatDateTime(cUSDateStyle, EnCodeDate(2008,01,01))+'"');
         Params[0].AsInteger := CCalvingEvent;
         Open;
         try
            if FieldByName('CID').AsInteger > 0 then
               begin
                  if MessageDlg('Suckler Cow Scheme - '+cCRLF+cCRLF+
                                'Calving events have not been registered with ICBF.'+cCRLFx2+
                                'Do you want to register Calving events now?',mtConfirmation,[mbYes, mbNo],0) = idYes then
                     begin
                        uICBFEventExport.ShowTheForm;
                     end;
               end;
         finally
            Close;
         end;

      finally
         Free;
      end;}

   function CheckCalving : Boolean;
   const
       QueryTxt = 'Select Count(ID) CID From Events Where EventType = :d';
   var
      EventCount : Integer;   
   begin
      Result := False;
      EventCount := 0;
       with TQuery.create(nil) do
          try
             DatabaseName := AliasName;
             SQL.Clear;
             SQL.Add(QueryTxt);


             Params[0].AsInteger := CMealFeedingEvent;
             Open;
             try
                Inc( EventCount, FieldByName('CID').AsInteger);
             finally
                Close;
             end;

             Params[0].AsInteger := CWeaningEvent;
             Open;
             try
                Inc( EventCount, FieldByName('CID').AsInteger);
             finally
                Close;
             end;

             Params[0].AsInteger := CDisbuddingEvent;
             Open;
             try
                Inc( EventCount, FieldByName('CID').AsInteger);
             finally
                Close;
             end;

             Params[0].AsInteger := CDisbuddingNAEvent;
             Open;
             try
                Inc( EventCount, FieldByName('CID').AsInteger);
             finally
                Close;
             end;

             Params[0].AsInteger := CCastrationNAEvent;
             Open;
             try
                Inc( EventCount, FieldByName('CID').AsInteger);
             finally
                Close;
             end;

             Result := (EventCount>0);
          finally
             Free;
          end;

   end;

const
   QueryTxt ='Select Count(ID) CID From Events Where EventType = :d and ICBFNotified = False';
var
   CalvingCount, MealFeedingCount, WeaningCount : Integer;
   Events : string;
   DisplayReminder : Boolean;
begin
   if not(SystemRegisteredCountry = Ireland) then Exit;

   DisplayReminder := True;

   // do not remind user to send ICBF email if one has already been sent today
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select ICBFExportDate From Owners Where HerdIdentity<>"NONE"');
         Open;
         try
            First;
            while not eof do
               begin
                  if Fields[0].AsDateTime >= Date then
                     begin
                        DisplayReminder := False;
                        Break;
                     end;
                  Next;
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;

   if DisplayReminder then
      begin
         CalvingCount := 0;
         MealFeedingCount := 0;
         WeaningCount := 0;
         with TQuery.create(nil) do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add(QueryTxt);
               // Check MealFeeding events
               Params[0].AsInteger := CMealFeedingEvent;
               Open;
               try
                  MealFeedingCount := FieldByName('CID').AsInteger;
               finally
                  Close;
               end;

               SQL.Clear;
               SQL.Add(QueryTxt);
               // Check Weaning events
               Params[0].AsInteger := CWeaningEvent;
               Open;
               try
                  WeaningCount := FieldByName('CID').AsInteger;
               finally
                  Close;
               end;

               if CheckCalving then
                  begin
                     SQL.Clear;
                     SQL.Add(QueryTxt);
                     SQL.Add('And EventDate >= "'+FormatDateTime(cUSDateStyle, EnCodeDate(2008,01,01))+'"');
                     Params[0].AsInteger := CCalvingEvent;
                     Open;
                     try
                        CalvingCount := FieldByName('CID').AsInteger;
                     finally
                        Close;
                     end;
                  end;

               if CalvingCount > 0 then
                  Events := 'Calving/';
               if WeaningCount > 0 then
                  Events := Events + 'Weaning/';
               if MealFeedingCount > 0 then
                  Events := Events + 'Meal Feeding';


               DisplayReminder := (CalvingCount>0) or (MealFeedingCount>0) or (WeaningCount>0);
               if DisplayReminder then
                  begin
                     if Events <> '' then
                        begin
                           if Events[length( Events )] = '/' then
                              System.delete(events, length( Events ),1);
                        end;

                     if MessageDlg('Animal Welfare Scheme - '+cCRLF+cCRLF+
                                   events +' Events have not been registered with ICBF.'+cCRLF+cCRLF+
                                   'Do you want to register these events now?',mtConfirmation,[mbYes, mbNo],0) = idYes then
                        begin
                           uICBFEventExport.ShowTheForm;
                        end;
                  end;
            finally
               Free;
            end;
      end;
end;

function TWinData.GetBreedID(ABreedCode: string): Integer;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Add('Select ID From Breeds Where Code = :ACode');
         Params[0].AsString := ABreedCode;
         Open;
         try
            First;
            Result := FieldByName('ID').AsInteger;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

function TWinData.GetBreedCodeByPedigreeBreed(
  APedigreeCode: TPedigreeBreedCode): string;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Add('Select Code From Breeds Where PedigreeBreed = :ACode');
         Params[0].AsString := APedigreeCode;
         Open;
         try
            First;
            Result := FieldByName('Code').AsString;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;



procedure TWinData.tRemarksAfterPost(DataSet: TDataSet);
begin
   DBIForceWrite(tRemarks);
end;

function TWinData.QueryNoOfWeanings(
  const ADateOfWeaning: TDateTime): Integer;
begin
   // Check on the no. of weanings re-introduced 11/08/2010 requested by GL.
   // Orginally removed from program at request of unknown farmer.

   with TQuery.Create(nil) do
      try

        DatabaseName := AliasName;

        SQL.Add('SELECT COUNT(ID) CID FROM Events');
        SQL.Add('WHERE EventType = :EventType');
        SQL.Add('AND EventDate = :EventDate');
        Params[0].AsInteger := CWeaningEvent;
        Params[1].AsDateTime := ADateOfWeaning;
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

function TWinData.CastrationQueryWeaning(const AAnimalID : Integer;
   ACastrationDate : TDateTime; var AWeaningDate : TDateTime) : Boolean;
var
   MinCastrationDate, MaxCastrationDate : TDateTime;
begin
   Result := True;
   AWeaningDate := EventDataHelper.GetLastEventDate(AAnimalID,CWeaningEvent);
   if AWeaningDate > 0 then
      begin
         // Castration Date must be at least 4 weeks before weaning, or at least two weeks after weaning.
         MinCastrationDate  := IncDay(AWeaningDate, -28);
         MaxCastrationDate  := IncDay(AWeaningDate, 14);
         if ( ACastrationDate >= MinCastrationDate) and (ACastrationDate <= MaxCastrationDate) then
            begin
               Result := false;
            end;
      end;
end;

function TWinData.WeaningQueryCastration(const AAnimalID : Integer;
  AWeaningDate : TDateTime; var ACastrationDate : TDateTime) : Boolean;
var
   MinCastrationDate, MaxCastrationDate : TDateTime;
begin
   Result := True;
   ACastrationDate := EventDataHelper.GetLastEventDate(AAnimalID,CCastrateEvent);
   if ACastrationDate > 0 then
      begin
         MinCastrationDate  := IncDay(AWeaningDate, -28);
         MaxCastrationDate  := IncDay(AWeaningDate, 14);
         if ( ACastrationDate >= MinCastrationDate) and (ACastrationDate <= MaxCastrationDate) then
            begin
               Result := false;
            end;
      end;
end;

function TWinData.MealFeedingQueryWeaning(const AAnimalID : Integer;
  AMealFeedingDate : TDateTime; var AWeaningDate : TDateTime) : Boolean;
var
   MinWeaningDate: TDateTime;
begin
   Result := True;
   AWeaningDate := EventDataHelper.GetLastEventDate(AAnimalID, CWeaningEvent);
   if AWeaningDate > 0 then
      begin
         MinWeaningDate := IncDay(AWeaningDate, -28);
         if ( AMealFeedingDate >= MinWeaningDate) then
            begin
               Result := False;
            end;
      end;
end;

function TWinData.WeaningQueryMealFeeding(const AAnimalID : Integer;
 AWeaningDate : TDateTime; var AMealFeedingDate : TDateTime) : Boolean;
var
   MinMealFeedingDate : TDateTime;
begin
   Result := True;
   AMealFeedingDate := EventDataHelper.GetLastEventDate(AAnimalID,CMealFeedingEvent);
   if AMealFeedingDate > 0 then
      begin
         MinMealFeedingDate := IncDay(AWeaningDate, -28);
         if AMealFeedingDate >= MinMealFeedingDate then
            begin
               Result := False;
            end;
      end;
end;


procedure TWinData.CalvingsAfterPost(DataSet: TDataSet);
begin
   DbiSaveChanges( Calvings.Handle);
end;

function TWinData.HerdIDByAnimalID(AAnimalID: Integer): Integer;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Add('Select HerdID From Animals Where ID=:ID');
         Params[0].AsInteger := AAnimalID;
         Open;
         try
            First;
            Result := FieldByName('HerdID').AsInteger;
         finally
            Close;
         end;

      finally
         Free;
      end;
end;

procedure TWinData.FertTreatmentsAfterDelete(DataSet: TDataSet);
begin
  DbiSaveChanges(WinData.FertTreatments.Handle);
  if HerdLookup.QueryFertTreatments.Active then
     begin
        // only refresh when dataset is already active
        HerdLookup.QueryFertTreatments.Active := False;
        HerdLookup.QueryFertTreatments.Active := True;
     end;
end;

procedure TWinData.FertTreatmentsAfterPost(DataSet: TDataSet);
begin
  DbiSaveChanges(WinData.FertTreatments.Handle);
  if HerdLookup.QueryFertTreatments.Active then
     begin
        // only refresh when dataset is already active
        HerdLookup.QueryFertTreatments.Active := False;
        HerdLookup.QueryFertTreatments.Active := True;
     end;
end;

procedure TWinData.FertProgramsAfterPost(DataSet: TDataSet);
begin
  DbiSaveChanges(WinData.FertTreatments.Handle);
end;

procedure TWinData.FertProgramsAfterDelete(DataSet: TDataSet);
begin
  DbiSaveChanges(WinData.FertTreatments.Handle);
end;

procedure TWinData.FertProgramsBeforePost(DataSet: TDataSet);
begin
   if Dataset.state = dsInsert then
      begin
         if Dataset.FieldByName('Code').AsString <> '' then
            if not HerdLookup.CheckUniqueFieldValue('FertPrograms', 'Code', Dataset.FieldByName('Code').AsString) then
              begin
                 MessageDlg(Format('Code "%s" is already in use.',[Dataset.FieldByName('Code').AsString]),mtError,[mbOk],0);
                 SysUtils.Abort;
              end;
      end;
end;

procedure TWinData.FertTreatmentsBeforePost(DataSet: TDataSet);
begin
   if Dataset.state = dsInsert then
      begin
         if Dataset.FieldByName('Code').AsString <> '' then
            if not HerdLookup.CheckUniqueFieldValue('FertTreatments', 'Code', Dataset.FieldByName('Code').AsString) then
              begin
                 MessageDlg(Format('Code "%s" is already in use.',[Dataset.FieldByName('Code').AsString]),mtError,[mbOk],0);
                 SysUtils.Abort;
              end;
      end;

   if Dataset.FieldByName('StartDay').AsInteger  <= -1 then
      begin
         MessageDlg('Field Start Days must have a value.',mtError,[mbOk],0);
         SysUtils.Abort;
      end;
end;


procedure TWinData.FertTreatmentsBeforeInsert(DataSet: TDataSet);
begin
   if FertPrograms.State = dsInsert then
      begin
         MessageDlg('You must save Program before entering associated treatments.',mtInformation,[mbOk],0);
         SysUtils.Abort;
      end;
end;

function TWinData.CreateCowFertilityRecord(AID: Integer): Boolean;
var
   CreateRecord : Boolean;
begin
    Result := false;
   with TQuery.Create(nil) do
   try
      DatabaseName := AliasName;
      SQL.Clear;
      SQL.Add('SELECT AnimalID FROM CowFertility WHERE AnimalID=:AID');
      Params[0].asInteger := AID;

      Open;
      try
         First;
         CreateRecord := FieldByName('AnimalID').AsInteger<=0;
      finally
         Close;
      end;

      if CreateRecord then
         begin
            SQL.Clear;
            SQL.Add('INSERT INTO CowFertility (AnimalID)');
            SQL.Add('VALUES (:AnimalID)');
            Params[0].asInteger := AID;
            ExecSQL;
         end;
      Result := True;
   finally
      Free;
   end;
end;

function TWinData.UpdateCowFertilityCulledStatus(AID : Integer; const Culled : Boolean;
  const ACullingDate : TDateTime): Boolean;
var
   ToBeCulledEvent : TToBeCulledEvent;
begin
   Result := False;
   if CreateCowFertilityRecord(AID) then
      begin
         with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('UPDATE CowFertility SET CULLED=:CULLED WHERE AnimalID=:AID');
            Params[0].AsBoolean := Culled;
            Params[1].asInteger := AID;
            ExecSQL;
            Result := True;
         finally
            Free;
         end;

         if Result then
            begin


               if ( ACullingDate>0 ) and ( EventDataHelper.GetLastEventDate(WinData.AnimalFileByIDID.AsInteger, CToBeCulledEvent)<=0)then
                  begin
                     ToBeCulledEvent := TToBeCulledEvent.Create('CUL');
                     try
                        ToBeCulledEvent.Append;
                        try
                           ToBeCulledEvent.AnimalID := WinData.AnimalFileByIDID.AsInteger;
                           ToBeCulledEvent.AnimalLactNo := WinData.AnimalFileByIDLactNo.AsInteger;
                           ToBeCulledEvent.AnimalHerdID := WinData.AnimalFileByIDHerdID.AsInteger;
                           ToBeCulledEvent.EventDate := ACullingDate;
                           ToBeCulledEvent.EventComment := 'To be culled';
                           ToBeCulledEvent.EventSource := sINTERNAL;
                           ToBeCulledEvent.Post;
                        except
                           ToBeCulledEvent.Cancel;
                        end;
                     finally
                        FreeAndNil(ToBeCulledEvent);
                     end;
                  end

               else if not Culled then
                  begin
                     // Remove ToBeCulled event if found.
                     if EventDataHelper.GetLastEventDate(WinData.AnimalFileByIDID.AsInteger, CToBeCulledEvent) > 0 then
                        begin
                           with TQuery.Create(nil) do
                           try
                              DatabaseName := AliasName;
                              SQL.Clear;
                              SQL.Add('DELETE FROM Events WHERE AnimalID=:AID And EventType =:EventType');
                              Params[0].asInteger := AID;
                              Params[1].asInteger := CToBeCulledEvent;
                              ExecSQL;
                           finally
                              Free;
                           end;
                        end
                  end;
            end;
      end;
end;

function TWinData.ETCalving(AAnimalID, ALactNo: Integer): Boolean;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Add('Select Count(ID) CID From Events E ');
         SQL.Add('Left Join Services S ON (S.EventID=E.ID) ');
         SQL.Add('Left Join GenLook G ON (S.ServiceType=G.ID) ');
         SQL.Add('Where E.AnimalID=:AnimalID');
         SQL.Add('And E.AnimalLactNo=:AnimalLactNo');
         SQL.Add('And E.EventType =:EventType');
         SQL.Add('And G.LookupCode = "ET"');
         Params[0].AsInteger := AAnimalID;
         Params[1].AsInteger := ALactNo;
         Params[2].AsInteger := CServiceEvent;
         Open;
         try
            Result := FieldByName('CID').AsInteger>0;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TWinData.Table_ReIndex(ATable: TTable);
begin
   ReIndexTable(ATable);
end;

procedure TWinData.ReIndexCalvings;
begin
   try
      Table_ReIndex(Calvings);
   except
      MessageDlg('Unable to access calvings.db - contact Kingswood',mtError,[mbOK],0);
   end;
end;

function TWinData.SystemRegisteredCountry: TCountry;
begin
   Result := FSystemRegisteredCountry;
   if Result = Other then
      begin
         Result := Other; // default to Ireland.
         with TQuery.Create(nil) do
            try
               DatabaseName := AliasName;
               SQL.Text := 'Select HerdIdentity, Country From Owners';
               Active := True;
               try
                  First;
                  while not eof do
                     begin
                        if (UpperCase(FieldByName('HerdIdentity').AsString) <> 'NONE') then
                           begin
                              case FieldByName('Country').AsInteger of
                                 1 : Result := Ireland;
                                 7 : Result := England;
                                 12 : Result := NIreland;
                              end;
                              Break;
                           end;
                        Next;
                     end;
               finally
                  Active := False;
               end;
            finally
               Free;
            end;
         FSystemRegisteredCountry := Result;
      end;
end;

procedure TWinData.GS_SetSireField;
begin

   if AnimalFileByID.Active then Exit; // LookupField cannot be updated when dataset is active.

   if GlobalSettings.AnimalGridSireField <> '' then
      begin

         if GlobalSettings.AnimalGridSireField = 'Herd Book No' then
            AnimalFileByIDSireNo.LookupResultField := 'HerdBookNo'
         else if GlobalSettings.AnimalGridSireField = 'Name' then
            AnimalFileByIDSireNo.LookupResultField := GlobalSettings.AnimalGridSireField
         else
            AnimalFileByIDSireNo.LookupResultField := 'AnimalNo';
      end
   else
      AnimalFileByIDSireNo.LookupResultField := 'AnimalNo';
end;

procedure TWinData.HealthDrugUsedChange(Sender: TField);
begin
   HealthPurchUnitCost.Clear;
   HealthDoseUnitUsed.Clear;
   HealthPurchUnitUsed.Clear;
   WinData.CalcCostAndQtyUsed( WinData.HealthDrugUsed.AsInteger, WinData.HealthRateApplic.AsFloat, WinData.Health );
end;

procedure TWinData.HealthRateApplicChange(Sender: TField);
begin
   WinData.CalcCostAndQtyUsed( WinData.HealthDrugUsed.AsInteger, WinData.HealthRateApplic.AsFloat, WinData.Health );
end;

procedure TWinData.GetEventLookupData(AOpen : Boolean);
var
   QGridPurchData : TQuery;
   QGridSaleData : TQuery;
   QGridFeedData : TQuery;
begin
   if GlobalSettings.DisplayMovementFeedColsInGridView then
      begin
         if AOpen then
            begin

               if MDGridPurchData = nil then
                  MDGridPurchData := TdxMemData.Create(nil)
               else
                  MDGridPurchData.Close;
               if MDGridSaleData = nil then
                  MDGridSaleData := TdxMemData.Create(nil)
               else
                  MDGridSaleData.Close;
               if MDGridFeedData = nil then
                  MDGridFeedData := TdxMemData.Create(nil)
               else
                  MDGridFeedData.Close;

               QGridPurchData := TQuery.Create(nil);
               QGridPurchData.DatabaseName := AliasName;
               with QGridPurchData do
                  try
                     DatabaseName := AliasName;
                     SQL.Clear;
                     SQL.Add(' SELECT PE.AnimalID AnimalID, PE.EventDate PurchDate, P.Price PurchPrice, S.Name SupplierName, P.LotNumber PurchLotNumber, P.FQASDays PurchFQASDays, PE.EventDesc PurchComment');
                     SQL.Add(' FROM Events PE');
                     SQL.Add(' LEFT JOIN Purchases P ON (P.EventID=PE.ID)');
                     SQL.Add(' LEFT JOIN SuppliersBreeders S ON (S.ID=P.Supplier)');
                     SQL.Add(' WHERE (PE.EventType=12)');
                     Open;
                     MDGridPurchData.BeforePost := MDGridPurchDataBeforePost;
                     MDGridPurchData.CopyFromDataSet( QGridPurchData);

                  finally
                     Close;
                     Free;
                  end;

               QGridSaleData := TQuery.Create(nil);
               QGridSaleData.DatabaseName := AliasName;
               with QGridSaleData do
                  try
                     DatabaseName := AliasName;
                     SQL.Clear;
                     SQL.Add(' SELECT SE.AnimalID AnimalID, SE.EventDate SaleDate');
                     SQL.Add(' FROM Events SE');
                     SQL.Add(' WHERE (SE.EventType=11)');
                     Open;
                     MDGridSaleData.CopyFromDataSet( QGridSaleData );
                  finally
                     Close;
                     Free;
                  end;

               QGridFeedData := TQuery.Create(nil);
               QGridFeedData.DatabaseName := AliasName;
               with QGridFeedData do
                  try
                     DatabaseName := AliasName;
                     SQL.Clear;
                     SQL.Add(' SELECT GL.AnimalID AnimalID, G.Description FeedGrpDesc');
                     SQL.Add(' FROM grps G, grplinks GL');
                     SQL.Add(' WHERE (g.Id= gl.GroupID) AND (UPPER(G.GroupType)= ' + UPPERCASE(QuotedStr(iGroupIdentities[1])) + ')');
                     Open;
                     MDGridFeedData.CopyFromDataSet( QGridFeedData );
                  finally
                     Close;
                     Free;
                  end;
            end
         else
            begin
               if MDGridPurchData <> nil then
                  begin
                     MDGridPurchData.Close;
                     FreeAndNil(MDGridPurchData);
                  end;
               if MDGridSaleData <> nil then
                  begin
                     MDGridSaleData.Close;
                     FreeAndNil(MDGridSaleData);
                  end;
               if MDGridFeedData <> nil then
                  begin
                     MDGridFeedData.Close;
                     FreeAndNil(MDGridFeedData);
                  end;
            end;
      end;
end;

procedure TWinData.AnimalFileByIDBeforeOpen(DataSet: TDataSet);
var
   sKeyField : string;
   sLookupKeyField : string;
   sFieldName : string;
begin
   if GlobalSettings.DisplayMovementFeedColsInGridView then
      begin
         GetEventLookupData(True);

         sKeyField := 'ID';
         sLookupKeyField := 'AnimalID';
         sFieldName      := 'PurchDate';
         if AnimalFileByID.FindField(sFieldName) = nil then
            begin
               with TDateField.Create(AnimalFileByID) do
                  begin
                     FieldName := sFieldName;
                     FieldKind := fkLookup;
                     LookupDataSet := MDGridPurchData;
                     KeyFields := sKeyField;
                     LookupKeyFields := sLookupKeyField;
                     LookupResultField := sFieldName;
                     Dataset := AnimalFileByID;
                  end;
            end;

         sFieldName := 'PurchPrice';
         if AnimalFileByID.FindField(sFieldName) = nil then
            begin
               with TFloatField.Create(nil) do
                  begin
                     FieldName := sFieldName;
                     FieldKind := fkLookup;
                     LookupDataSet := MDGridPurchData;
                     KeyFields := sKeyField;
                     LookupKeyFields := sLookupKeyField;
                     LookupResultField := sFieldName;
                     Dataset := AnimalFileByID;
                  end;
            end;

         sFieldName := 'PurchLotNumber';
         if AnimalFileByID.FindField(sFieldName) = nil then
            begin
               with TStringField.Create(nil) do
                  begin
                     FieldName := sFieldName;
                     FieldKind := fkLookup;
                     LookupDataSet := MDGridPurchData;
                     KeyFields := sKeyField;
                     LookupKeyFields := sLookupKeyField;
                     LookupResultField := sFieldName;
                     Dataset := AnimalFileByID;
                  end;
            end;
      {
         sFieldName := 'PurchFQAS';
         if AnimalFileByID.FindField(sFieldName) = nil then
            begin
               with TBooleanField.Create(nil) do
                  begin
                     FieldName := sFieldName;
                     FieldKind := fkCalculated;
                     Dataset := AnimalFileByID;
                     OnGetText := AnimalFileByIDPurchFQASGetText;
                  end;
            end;
      }
         sFieldName := 'PurchFQASDays';
         if AnimalFileByID.FindField(sFieldName) = nil then
            begin
               with TIntegerField.Create(nil) do
                  begin
                     FieldName := sFieldName;
                     FieldKind := fkLookup;
                     LookupDataSet := MDGridPurchData;
                     KeyFields := sKeyField;
                     LookupKeyFields := sLookupKeyField;
                     LookupResultField := sFieldName;
                     Dataset := AnimalFileByID;
                  end;
            end;

         sFieldName := 'SupplierName';
         if AnimalFileByID.FindField(sFieldName) = nil then
            begin
               with TStringField.Create(nil) do
                  begin
                     FieldName := sFieldName;
                     FieldKind := fkLookup;
                     LookupDataSet := MDGridPurchData;
                     KeyFields := sKeyField;
                     LookupKeyFields := sLookupKeyField;
                     LookupResultField := sFieldName;
                     Dataset := AnimalFileByID;
                  end;
            end;

         sFieldName := 'PurchComment';
         if AnimalFileByID.FindField(sFieldName) = nil then
            begin
               with TStringField.Create(nil) do
                  begin
                     FieldName := sFieldName;
                     FieldKind := fkLookup;
                     LookupDataSet := MDGridPurchData;
                     KeyFields := sKeyField;
                     LookupKeyFields := sLookupKeyField;
                     LookupResultField := sFieldName;
                     Dataset := AnimalFileByID;
                  end;
            end;

         sFieldName := 'SaleDate';
         if AnimalFileByID.FindField(sFieldName) = nil then
            begin
               with TDateField.Create(AnimalFileByID) do
                  begin
                     FieldName := sFieldName;
                     FieldKind := fkLookup;
                     LookupDataSet := MDGridSaleData;
                     KeyFields := sKeyField;
                     LookupKeyFields := sLookupKeyField;
                     LookupResultField := sFieldName;
                     Dataset := AnimalFileByID;
                  end;

            end;

         sFieldName := 'FeedGrpDesc';
         if AnimalFileByID.FindField(sFieldName) = nil then
            begin
               with TStringField.Create(AnimalFileByID) do
                  begin
                     FieldName := sFieldName;
                     FieldKind := fkLookup;
                     LookupDataSet := MDGridFeedData;
                     KeyFields := sKeyField;
                     LookupKeyFields := sLookupKeyField;
                     LookupResultField := sFieldName;
                     Dataset := AnimalFileByID;
                  end;

            end;
      end;
end;

procedure TWinData.AddToEventLookupData(AAnimalID, AEventType: Integer);
var
   QGridPurchData : TQuery;
   QGridSaleData : TQuery;
   QGridFeedData : TQuery;
   i : Integer;
begin

   if GlobalSettings.DisplayMovementFeedColsInGridView then
      begin
         case AEventType of
           cPurchaseEvent : begin
                               QGridPurchData := TQuery.Create(nil);
                               QGridPurchData.DatabaseName := AliasName;
                               with QGridPurchData do
                                  try
                                     DatabaseName := AliasName;
                                     SQL.Clear;
                                     SQL.Add(' SELECT PE.AnimalID AnimalID, PE.EventDate PurchDate, P.Price PurchPrice, S.Name SupplierName, P.LotNumber PurchLotNumber, P.FQASDays PurchFQASDays, PE.EventDesc PurchComment');
                                     SQL.Add(' FROM Events PE');
                                     SQL.Add(' LEFT JOIN Purchases P ON (P.EventID=PE.ID)');
                                     SQL.Add(' LEFT JOIN SuppliersBreeders S ON (S.ID=P.Supplier)');
                                     SQL.Add(' WHERE (PE.AnimalID=:AnimalID) AND (PE.EventType=12)');
                                     Params[0].AsInteger := AAnimalID;
                                     Open;
                                     if not MDGridPurchData.Locate('AnimalID', QGridPurchData.FieldByName('AnimalID').Value, [] ) then
                                        MDGridPurchData.Append
                                     else
                                        MDGridPurchData.Edit;
                                     if not Fields[0].IsNull then
                                        MDGridPurchData.FieldByName('AnimalID').Value := QGridPurchData.FieldByName('AnimalID').Value;
                                     if not Fields[1].IsNull then
                                        MDGridPurchData.FieldByName('PurchDate').Value := QGridPurchData.FieldByName('PurchDate').Value;
                                     if not Fields[2].IsNull then
                                        MDGridPurchData.FieldByName('PurchPrice').Value := QGridPurchData.FieldByName('PurchPrice').Value;
                                     if not Fields[3].IsNull then
                                        MDGridPurchData.FieldByName('SupplierName').Value := QGridPurchData.FieldByName('SupplierName').Value;
                                     if not Fields[4].IsNull then
                                        MDGridPurchData.FieldByName('PurchLotNumber').Value := QGridPurchData.FieldByName('PurchLotNumber').Value;
                                     if not Fields[5].IsNull then
                                        MDGridPurchData.FieldByName('PurchFQASDays').Value := QGridPurchData.FieldByName('PurchFQASDays').Value;
                                     if not Fields[6].IsNull then
                                        MDGridPurchData.FieldByName('PurchComment').Value := QGridPurchData.FieldByName('PurchComment').Value;
                                      MDGridPurchData.Post;
                                  finally
                                     Close;
                                     Free;
                                  end;
                              end;
           cSaleDeathEvent : begin
                                QGridSaleData := TQuery.Create(nil);
                                QGridSaleData.DatabaseName := AliasName;
                                with QGridSaleData do
                                   try
                                      DatabaseName := AliasName;
                                      SQL.Clear;
                                      SQL.Add(' SELECT SE.AnimalID AnimalID, SE.EventDate SaleDate');
                                      SQL.Add(' FROM Events SE');
                                      SQL.Add(' WHERE (SE.AnimalID=:AnimalID) AND (SE.EventType=11)');
                                      Params[0].AsInteger := AAnimalID;
                                      Open;

                                      if not MDGridSaleData.Locate('AnimalID', QGridSaleData.FieldByName('AnimalID').Value, [] ) then
                                         MDGridSaleData.Append
                                      else
                                         MDGridSaleData.Edit;
                                      MDGridSaleData.FieldByName('AnimalID').Value := FieldByName('AnimalID').Value;
                                      MDGridSaleData.FieldByName('SaleDate').Value := FieldByName('SaleDate').Value;
                                      MDGridSaleData.Post;
                                   finally
                                      Close;
                                      Free;
                                   end;
                              end;
          cFeedingEvent     : begin
                                 QGridFeedData := TQuery.Create(nil);
                                 QGridFeedData.DatabaseName := AliasName;
                                 with QGridFeedData do
                                    try
                                       DatabaseName := AliasName;
                                       SQL.Clear;
                                       SQL.Add(' SELECT GL.AnimalID AnimalID, G.Description FeedGrpDesc');
                                       SQL.Add(' FROM grps G, grplinks GL');
                                       SQL.Add(' WHERE (g.Id= gl.GroupID ) AND (GL.AnimalID=:AnimalID) AND (UPPER(G.GroupType)= ' + UPPERCASE(QuotedStr(iGroupIdentities[1])) + ')');
                                       Params[0].AsInteger := AAnimalID;
                                       Open;

                                       if not MDGridFeedData.Locate('AnimalID', QGridFeedData.FieldByName('AnimalID').Value, [] ) then
                                          MDGridFeedData.Append
                                       else
                                          MDGridFeedData.Edit;
                                       MDGridFeedData.FieldByName('AnimalID').Value := FieldByName('AnimalID').Value;
                                       MDGridFeedData.FieldByName('FeedGrpDesc').Value := FieldByName('FeedGrpDesc').Value;
                                       MDGridFeedData.Post;
                                    finally
                                       Close;
                                       Free;
                                    end;
                                 end;
          end;
      end;
end;

procedure TWinData.RemoveFromEventLookupData(AAnimalID, AEventType: Integer);
begin
   if GlobalSettings.DisplayMovementFeedColsInGridView then
      begin

         case AEventType of
           cPurchaseEvent : begin
                               if MDGridPurchData.Locate('AnimalID', AAnimalID, []) then
                                  MDGridPurchData.Delete;
                              end;
           cSaleDeathEvent : begin
                               if MDGridSaleData.Locate('AnimalID', AAnimalID, []) then
                                  MDGridSaleData.Delete;
                              end;
          cFeedingEvent     : begin
                               if MDGridFeedData.Locate('AnimalID', AAnimalID, []) then
                                  MDGridFeedData.Delete;
                              end;
          end;
      end;
end;

procedure TWinData.MDGridPurchDataBeforePost(Sender: TDataSet);
begin
end;

procedure TWinData.BuyersAfterPost(DataSet: TDataSet);
var
  ID : Integer;
begin
   if BuyersDefaultBuyer.AsBoolean then
      begin
         ID := BuyersID.AsInteger;
         with TQuery.Create(nil) do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('UPDATE Buyers SET DefaultBuyer = FALSE WHERE ID<>:ID');
               Params[0].AsInteger := ID;
               ExecSQL;
            finally
               Buyers.DisableControls;
               try
                  Buyers.Refresh;
                  Buyers.Locate('ID',ID,[]);
               finally
                  Buyers.EnableControls;
               end;
               Free;
            end;
      end;
end;

procedure TWinData.BuyersNewRecord(DataSet: TDataSet);
begin
   BuyersDefaultBuyer.AsBoolean := False;
end;

procedure TWinData.AnimalFileByIDBreedingGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin

end;

procedure TWinData.AnimalFileByIDPurchFQASGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
   if AnimalFileByID.FieldByName('PurchFQAS').AsBoolean then
      Text := 'Yes'
   else
      Text := 'No';
end;


procedure TWinData.ViewMailBox;
var
   Result : Boolean;
begin
   if WinData.AdvisoryRoleActive then
      begin
         MessageDlg(cAdvisoryAccessMsg,mtWarning,[mbOK],0);
         exit;
      end;

   SetCurrentDir(ApplicationPath);
   if FileExists( IncludeTrailingBackslash(ApplicationPath)+KingswoodMailBoxDLL) then
      begin
          DLLHandle := LoadLibrary(KingswoodMailBoxDLL);
          if DLLHandle <> 0 then
             begin
                try
                  @ReceiveMail := GetProcAddress(DLLHandle, cFuncName_ReceiveMail);
                  if @ReceiveMail <> nil then
                     begin
                        if DefaultEmailClient <> cEmailClient_MS then
                           Result := ReceiveMail(cCalfRegEmail,'');
                     end
                  else
                     MessageDlg(Format(cKingswoodMailBoxDLLCallToFunctionFailed,[cFuncName_ReceiveMail]),mtError,[mbOk],0);
                finally
                   FreeLibrary(DLLHandle);
                end;
             end
          else
             MessageDlg(cKingswoodMailBoxDLLUnableToLoad,mtError,[mbOk],0);
       end
   else
      MessageDlg(cKingswoodMailBoxDLLNotFound,mtError,[mbOk],0);
end;

function TWinData.GetDefaultEmailClient: string;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT DefaultEmailClient FROM Defaults');
         try
            Open;
            try
              First;
              Result := Trim(Fields[0].AsString);
            finally
              Close;
            end;
         except
            on e : exception do
              begin
                 raise Exception.Create('Could not determine Default Email Client value - '+cCRLFx2 + e.Message);
              end;
         end;
      finally
         Free;
      end;

{   GetRegValue(Reg_DefaultPath + 'Email Client' + DataDir, 'Client', Result);
   if Trim(Result) = '' then
      begin
      Result := cEmailClient_MS;
      end;
}
end;

procedure TWinData.SetDefaultEmailClient(const Value: string);
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('UPDATE Defaults SET DefaultEmailClient =:DEC');
         Params[0].AsString := Trim(Value);
         try
            ExecSQL
         except
            on e : exception do
              begin
                 raise Exception.Create('Could not update Default Email Client value - '+cCRLFx2 + e.Message);
              end;
         end;
      finally
         Free;
      end;
//   SetRegValue(Reg_DefaultPath + 'Email Client' + DataDir, 'Client', Value);
end;

procedure TWinData.AnimalsExtAfterPost(DataSet: TDataSet);
begin
   DBIForceWrite(AnimalsExt);
end;

procedure TWinData.AnimalsExtAfterDelete(DataSet: TDataSet);
begin
   DBIForceWrite(AnimalsExt);
end;

procedure TWinData.CreateAnimalExtRecord;
begin

   if not ( WinData.AnimalFileByID.ControlsDisabled ) then
      begin
         if (WinData.AnimalsExt.RecordCount = 0) then
            begin
               WinData.AnimalsExt.Append;
               try
                  WinData.AnimalsExt.Post;
               except
                  on E : EDatabaseError do
                     begin
                        WinData.AnimalsExt.Cancel;
                        raise EDatabaseError.Create(E.Message);
                     end;
               end;
            end;
      end;
end;

procedure TWinData.RefreshDamSireLookupTable(ASires : Boolean);
begin
   if ASires then
      begin
         SireQuery.Close;
         SireQuery.Open;
      end
   else
      begin
         DamQuery.Close;
         DamQuery.Open;
      end;
end;

function TWinData.GetLastRestoreDate: TDateTime;
begin
   Result := Date;
   // open and read the Last BackUp Date
   with Defaults do
      begin
         Open;
         try
            if RecordCount > 0 then
               ReSult := FieldByName('RestoreDate').AsDateTime;
         finally
            Close;
         end;
      end;
end;

procedure TWinData.SetLastRestoreDate(const Value: TDateTime);
begin
   // Set the Last Date a Backup was taken
   with Defaults do
      begin
        Open;
        try
           if RecordCount > 0 then
              begin
                 Edit;
                 FieldByName('RestoreDate').AsDateTime := Value;
                 Post;
              end;
         finally
           Close;
         end;
         DbiSaveChanges(Defaults.Handle);
      end;

end;

procedure TWinData.TempCalvingBeforeDelete(DataSet: TDataSet);
begin
   RollbackTagAutoGenNumber;
end;

procedure TWinData.ConvertTagPreferenceToTagStoreData;
var
   tOwnerFile : TTable;
begin
   tOwnerFile := TTable.Create(nil);
   tOwnerFile.DatabaseName := AliasName;
   tOwnerFile.TableName := 'Owners';
   tOwnerFile.Open;

   tOwnerFile.Filter := 'HerdIdentity <>''NONE''';
   tOwnerFile.Filtered := True;
   try
      if tOwnerFile.FindFirst then
         begin
            if tOwnerFile.FieldByName('NextNatID').IsNull then
               begin
                  tOwnerFile.Edit;
                  try
                     tOwnerFile.FieldByName('NextNatID').AsInteger := GlobalSettings.NationalIDAnimalNumber;
                     tOwnerFile.FieldByName('NatIDNumInputStyle').AsInteger := cInputNatIDStyle_AutoGenInput;
                     // set the preference to 0 so this proc will not be called again.
                     GlobalSettings.NationalIDAnimalNumber := 0;
                     tOwnerFile.Post;
                  except
                     on e : exception do
                        begin
                           tOwnerFile.Cancel;
                           raise Exception.Create(E.Message);
                        end;
                  end;
               end;
         end;
   finally
      tOwnerFile.Filtered := False;
      tOwnerFile.Filter := '';
      tOwnerFile.EnableControls;
      FreeAndNil(tOwnerFile);
   end;
end;

procedure TWinData.TempCalvingCalfDeadChange(Sender: TField);
var
   RegCountry : TCountry;
   CheckDigit, nPos : Integer;
   sAnimalNo, HerdIdentifier :string;
   CheckTagNo, NewID, FormattedStr : String;
   bLeadZero : Boolean;
begin
   RegCountry := DefCountry(TempCalvingHerdID.AsInteger);

//   if (ActivePDAEvents) or (HerdLookup.HerdOwnerData.InputNatIDStyle <> cInputNatIDStyle_AutoGenInput) then
//       Exit;

   if TempCalvingCalfDead.AsBoolean then
      begin
         if (RegCountry = NIreland) then
            begin
               RollbackTagAutoGenNumber;

               DeadCalfNatIDValue := AnimalFileByIDNatIDNum.AsString;
               DeadCalfNatIDValue := StripAllNomNumAlpha(DeadCalfNatIDValue);
               if Copy(DeadCalfNatIDValue, 1,3) = 'UK9' then
                  Delete(DeadCalfNatIDValue,1,3)
               else if Copy(DeadCalfNatIDValue, 1,2) = 'IE' then
                  Delete(DeadCalfNatIDValue,1,2);

               DeadCalfNatIDValue := DeadCalfNatIDValue + FormatDateTime('mm',Date) + FormatDateTime('yy',Date) + IntToStr(TempCalving.RecordCount+1);
               if Length(WinData.DeadCalfNatIDValue) > 16 then
                  begin
                     // Truncate the string to length 16
                     DeadCalfNatIDValue := Copy(DeadCalfNatIDValue, Length(DeadCalfNatIDValue)-15, Length(DeadCalfNatIDValue));
                  end;

               DeadCalfNatIDValue := 'DEAD'+DeadCalfNatIDValue;

               if TempCalvingCalfDead.AsBoolean then
                  begin
                     TempCalvingNatID.AsString := '';
                     TempCalvingNatID.AsString := DeadCalfNatIDValue;
                  end
               else
                  begin
                     if (TempCalvingNatID.AsString = DeadCalfNatIDValue) then
                        begin
                           TempCalvingNatID.Clear;
                           TempCalvingNatID.EditMask := DefaultNatIDMaskFromHerdIdentifierMask;
                        end;
                  end;
            end
         else
            begin
               // only rollback where valid tag found.
               if ( WhatStyleNatID( TempCalvingNatID.AsString, False ) = Style1999 ) and (not(RollBackTag))  then
                   RollbackTagAutoGenNumber;
            end;
      end
   else
      begin
         if (ActivePDAEvents) or (HerdLookup.HerdOwnerData.InputNatIDStyle <> cInputNatIDStyle_AutoGenInput) then
             Exit
         else
            begin
               bLeadZero := HerdLookup.HerdOwnerData.NatIDLeadZero;
               if HerdLookup.HerdOwnerData.RegisteredCountry = Ireland then
                  begin
                     HerdIdentifier := HerdLookup.HerdOwnerData.HerdIdentifier;
                     if not (NatIDGenerated) then
                        begin
                     // Auto Generate Irish Tag.
                           for CheckDigit := 1 to 9 do
                              begin
                                 NewID := '';
                                 CheckTagNo := 'IE ' + HerdIdentifier + IntToStr(CheckDigit) + PadLeft(IntToStr(HerdLookup.HerdOwnerData.NextNatID),'0',4);
                                 if CheckNatID(CheckTagNo, NewID, True) then
                                    begin
                                       TempCalvingNatID.EditMask := '';
                                       TempCalvingNatID.Value := NewID;
                                       HerdLookup.HerdOwnerData.NextNatID := HerdLookup.HerdOwnerData.NextNatID+1;
                                       NatIDGenerated := True;
                                       Break;
                                    end;
                              end;
                        end;
                  end
               else
                        begin
                           HerdIdentifier := HerdLookup.HerdOwnerData.HerdIdentifier;
                           // Auto Generate Northern Irish Tag.
                           for CheckDigit := 1 to 7 do
                              begin
                                 NewID := '';
                                 if bLeadZero then
                                    sAnimalNo := PadLeft(IntToStr(HerdLookup.HerdOwnerData.NextNatID), '0', 4)
                                 else
                                    sAnimalNo := IntToStr(HerdLookup.HerdOwnerData.NextNatID);
                                 // very important for UK9 tag... include the spaces between HerdNo, AnimalNo                and              Check Digit
                                       if ((CheckNINatID( 'UK 9 ' + HerdIdentifier + ' ' + sAnimalNo + ' ' + IntToStr(CheckDigit) , NewID)) and (CheckDigit<=7)) then
                                          begin
                                             TempCalvingNatID.EditMask := '';
                                             TempCalvingNatID.Value := NewID;
                                             HerdLookup.HerdOwnerData.NextNatID := HerdLookup.HerdOwnerData.NextNatID+1;
                                             NatIDGenerated := True;
                                             Break;
                                          end;
                              end;
                        end
            end;
      end;

  { if ( Events.State = dsInsert ) then
      begin
         RegCountry := DefCountry(TempCalvingHerdID.AsInteger);
         if (RegCountry = NIreland) then
            begin
               if DeadCalfNatIDValue = '' then
                  begin
                     DeadCalfNatIDValue := AnimalFileByIDNatIDNum.AsString;
                     DeadCalfNatIDValue := StripAllNomNumAlpha(DeadCalfNatIDValue);
                     if ( Copy(DeadCalfNatIDValue, 1,3) = 'UK9' ) or ( Copy(DeadCalfNatIDValue, 1,2) = 'IE' ) then
                        Delete(DeadCalfNatIDValue,1,3);
                     DeadCalfNatIDValue := 'DEAD'+DeadCalfNatIDValue+ FormatDateTime('mm',date) + FormatDateTime('yy',date) + IntToStr(TempCalving.RecNo);
                     if TempCalvingCalfDead.AsBoolean then
                        begin
                           TempCalvingNatID.AsString := '';
                           TempCalvingNatID.AsString := DeadCalfNatIDValue;
                        end
                     else
                        begin
                           if (TempCalvingNatID.AsString = DeadCalfNatIDValue) then
                              begin
                                 TempCalvingNatID.Clear;
                                 TempCalvingNatID.EditMask := DefaultNatIDMask;
                              end;
                        end;
                  end;
            end  }
{
         else if (RegCountry = Ireland) then
            begin
               TempCalvingNatID.Clear;
               TempCalvingNatID.EditMask := DefaultNatIDMask;
            end;
}
{
         else if (RegCountry = Ireland) then
            begin
               // If calf is marked as dead, we should clear the Nat id. Mask
               // allowing the user to input a free format natidnum if desired.
               if ( Sender.AsBoolean ) and FullTermCalving = False then
                  begin
                     TempCalvingNatID.EditMask := '';
                     TempCalvingNatID.Value := '';
                  end
               else
                  begin
                     TempCalvingNatID.Value := '';
                     TempCalvingNatID.EditMask := DefaultNatIDMask;
                     //if (Length(Trim(TempCalvingNatID.AsString)) = 0) then
                     //   TempCalvingNatID.EditMask := DefaultNatIDMaskFromHerdIdentifierMask; // reset the editmask if live calf
                  end;
            end;
}

    //  end;
end;

function TWinData.GetNatIDNumHerdIdentifier(AHerdID: Integer): string;
var
   tResult : string;
   i : Integer;
begin
   HerdLookup.HerdOwnerData.HerdID := AHerdID;
   tResult := Trim(HerdLookup.HerdOwnerData.HerdIdentifier);
   if HerdLookup.HerdOwnerData.RegisteredCountry = Ireland then
      begin
         tResult := 'IE '+tResult;
         Insert(' ',tResult, 6);
      end
   else if HerdLookup.HerdOwnerData.RegisteredCountry = NIreland then
      begin
         tResult := 'UK 9 '+tResult;
      end;
   Result := tResult;
end;

function TWinData.DownloadEmailAttachments : Integer;
begin
   if WinData.AdvisoryRoleActive then
      begin
         MessageDlg(cAdvisoryAccessMsg,mtWarning,[mbOK],0);
         exit;
      end;

   Result := 0;
   SetCurrentDir(ApplicationPath);
   if FileExists( IncludeTrailingBackslash(ApplicationPath)+KingswoodMailBoxDLL) then
      begin
          DLLHandle := LoadLibrary(KingswoodMailBoxDLL);
          if DLLHandle <> 0 then
             begin
                try
                  @DownloadAttachments := GetProcAddress(DLLHandle, cProcName_DownloadAttachments);
                  if @DownloadAttachments <> nil then
                     begin
                        Result := DownloadAttachments;
                     end
                  else
                     MessageDlg(Format(cKingswoodMailBoxDLLCallToFunctionFailed,[cProcName_DownloadAttachments]),mtError,[mbOk],0);
                finally
                   FreeLibrary(DLLHandle);
                end;
             end
          else
             MessageDlg(cKingswoodMailBoxDLLUnableToLoad,mtError,[mbOk],0);
       end
   else
      MessageDlg(cKingswoodMailBoxDLLNotFound,mtError,[mbOk],0);
end;


procedure TWinData.PurchasesHaulageChange(Sender: TField);
begin
   // Update the SupplierCosts Field to contain transaction related costs.
   // These Transaction related costs will overwrite the default values
   // retrieved from the Supplier/Buyer (Transport/Commission) Costs
   if WinData.Purchases.State in dsEditModes then
      PurchasesSupplierCosts.AsFloat := PurchasesHaulage.AsFloat + PurchasesCommission.AsFloat;
end;

procedure TWinData.PurchasesCommissionChange(Sender: TField);
begin
   // Update the SupplierCosts Field to contain transaction related costs.
   // These Transaction related costs will overwrite the default values
   // retrieved from the Supplier/Buyer (Transport/Commission) Costs
   if WinData.Purchases.State in dsEditModes then
      PurchasesSupplierCosts.AsFloat := PurchasesCommission.AsFloat + PurchasesHaulage.AsFloat;
end;

procedure TWinData.PurchasesBeforePost(DataSet: TDataSet);
begin
   // Update the SupplierCosts Field to contain transaction related costs.
   // These Transaction related costs will overwrite the default values
   // retrieved from the Supplier/Buyer (Transport/Commission) Costs
   if (PurchasesCommission.AsFloat>0) or (PurchasesHaulage.AsFloat>0) then
       PurchasesSupplierCosts.AsFloat := PurchasesCommission.AsFloat + PurchasesHaulage.AsFloat;

end;

procedure TWinData.NotifiyMovementsToHUK(AnimalData: array of Integer);
var
   i : Integer;
   LastHerdID : Integer;
   bOkToNotify : Boolean;
   AnimalList : TStringList;
begin
   // 29/01/09 [V3.9 R5.8] /SP Additional Feature - Notify HUK of animals moved onto farm, using grid and cart


   if MessageDlg('Do you want to notifiy HUK (Holstein UK) of these animal(s)?',mtConfirmation,[mbYes,mbNo],0) = idNo then exit;
      begin

         bOkToNotify := True;
         LastHerdID := 0;
         for i := 0 to Length(AnimalData)-1 do
            begin
               // make sure animals belong to only one herd.
               if LastHerdID = 0 then
                  LastHerdID := HerdIDByAnimalID( AnimalData[i] )
               else if HerdIDByAnimalID( AnimalData[i] ) <> LastHerdID then
                  begin
                     bOkToNotify := False;
                     Break;
                  end;
            end;

         if not bOkToNotify then
            begin
               MessageDlg('You have selected animals that belong to two different herds.'+cCRLF+
                          'Please ensure only animals belonging to one herd are selected.',mtWarning,[mbOK],0);
               Exit;
            end;

         AnimalList := TStringList.Create;
         try
            with TQuery.Create(nil) do
               try
                  DatabaseName := AliasName;
                  SQL.Add(InsertSelect(['A.ID','A.NatIDNum','A.Name','A.HerdBookNo','A.SortNatID','E.EventDate','B.PedigreeBreed']));
                  SQL.Add(InsertFROM(['Animals A']));
                  SQL.Add(InsertJOIN('Events E','E.AnimalID','A.ID'));
                  SQL.Add(InsertJOIN('Breeds B','B.ID','A.PrimaryBreed'));
                  SQL.Add(InsertWHERE(['E.EventType'],['12']));
                  SQL.Add(InsertAND(['A.ID'], [IntArrayToSQLInString(AnimalData)], opIN));
                  SQL.Add(InsertORDER(['A.SortNatID']));
                  Open;

                  if (RecordCount <= 0) then
                     begin
                        MessageDlg('There are no animals with purchase events found.'+cCRLFx2+
                                   'Notifications can only be sent when the animal(s) have purchase events recorded.',mtWarning,[mbOK],0);
                        Exit;
                     end
                  else if (RecordCount <> Length(AnimalData)) then
                     begin
                        MessageDlg('Some animals have been ignored.'+cCRLFx2+
                                   'Notifications can only be sent when the animal(s) have purchase events recorded.',mtWarning,[mbOK],0);
                     end;

                  First;



                  AnimalList.Add( PadRIGHT('National Id. Number',' ',25) + ' ' + PadRIGHT('Animal Name',' ',40)  + ' ' + PadRIGHT('Herd Book No.',' ',30)  + ' ' + PadRIGHT('Pedigree Breed No.',' ',20));
                  while not eof do
                     begin
                        AnimalList.Add( PadRIGHT(FieldByName('NatIDNum').AsString,' ',25) + ' ' + PadRIGHT(FieldByName('Name').AsString,' ',40)  + ' ' + PadRIGHT(FieldByName('HerdBookNo').AsString,' ',30)  + ' ' + PadRIGHT(FieldByName('PedigreeBreed').AsString,' ',20));
                        Next;
                     end;

                  with MAPIMail do
                     begin
                        Reset;
                        ToRecipient.Text := 'susanboughton@holstein-uk.org';
                        Subject := 'HUK Member - Animal Moved-On Notification';

                        HerdLookup.HerdOwnerData.HerdID := LastHerdID;

                        MessageBody.Text := 'Name: ' + HerdLookup.HerdOwnerData.HerdOwnerName + cCRLFx2 +
                                            'Herd Number: ' + HerdLookup.HerdOwnerData.HerdIdentity + cCRLFx2 +
                                            'Herd Prefix: ' + HerdLookup.HerdOwnerData.HerdPrefix + cCRLFx2 +
                                            'Animal Listing:' + cCRLFx2 + cCRLFx2 + AnimalList.Text;
                        SendMail;
                     end;
               finally
                  Close;
                  Free;
               end;
         finally
            FreeAndNil(AnimalList)
         end;
      end;
end;

procedure TWinData.qHealthCodesBeforeOpen(DataSet: TDataSet);
begin
   TQuery(Dataset).Params[0].Value := LHealthCode;

end;

function TWinData.GetBeefAISireFileName: string;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add(InsertSELECT(['BeefAISireFileName']));
         SQL.Add(InsertFROM([Defaults.TableName]));
         try
            Open;
            try
              First;
              Result := Trim(Fields[0].AsString);
            finally
              Close;
            end;
         except
            on e : exception do
              raise Exception.Create(E.Message);
         end;
      finally
         Free;
      end;
end;

procedure TWinData.SetBeefAISireFileName(const Value: string);
var
  FileName : string;
begin
   FileName := ApplicationPath + GetBeefAISireFileName;
   if FileExists(FileName) then DeleteFile(FileName);

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add( InsertUPDATE(Defaults.TableName,['BeefAISireFileName'],[':f']));
         Params[0].AsString := Trim(Value);
         try
            ExecSQL;
         except
            on e : exception do
              raise Exception.Create(E.Message);
         end;
      finally
         Free;
      end;
end;

procedure TWinData.CheckInBreeding(AServingAnimal : string;
   ABullID, ADamID, ASireID : Integer);
var
  DSIRE,
  DSSIRE,
  SSIRE,
  SSSIRE : Integer;
begin
   // Planned Sire
   if ( ASireID > 0 ) then
      begin
         if ASireID = ABullID then
            begin
               if MessageDlg(Format('WARNING: Service Sire is sire of this animal "%s"'+cCRLF+'Do you want to continue?',[AServingAnimal]),mtWarning,[mbYes,mbNo],0) = idNo then
                  SysUtils.Abort;
            end
         else
            begin
               if WinData.LookUpDamSire.Locate('ID', ASireID,[] ) then
                  begin
                     SSIRE := WinData.LookUpDamSire.FieldByName('SireID').AsInteger;
                     if (SSIRE = ABullID )then
                        begin
                           if MessageDlg(Format('WARNING: Service Sire, is the Sires Sire of this animal "%s"'+cCRLF+'Do you want to continue?',[AServingAnimal]),mtWarning,[mbYes,mbNo],0) = idNo then
                              SysUtils.Abort;
                        end
                     else
                        begin
                           if WinData.LookUpDamSire.Locate('ID',SSIRE,[] ) then
                              begin
                                 SSSIRE := WinData.LookUpDamSire.FieldByName('SireID').AsInteger;
                                 if (SSSIRE = ABullID) then
                                    begin
                                       if MessageDlg(Format('WARNING: Service Sire, is the Sires Sire Sire of this animal "%s"'+cCRLF+'Do you want to continue?',[AServingAnimal]),mtWarning,[mbYes,mbNo],0) = idNo then
                                          SysUtils.Abort;
                                    end;
                              end;
                        end;
                  end;
            end;
      end;

   if ( ADamID > 0 ) then
      begin
         if WinData.LookUpDamSire.Locate('ID', ADamID,[] ) then
            begin
               DSIRE := WinData.LookUpDamSire.FieldByName('SireID').AsInteger;
               if ( DSIRE = ABullID ) then
                  begin
                     if MessageDlg(Format('WARNING: Service Sire, is the Dams Sire of this animal "%s"'+cCRLF+'Do you want to continue?',[AServingAnimal]),mtWarning,[mbYes,mbNo],0) = idNo then
                        SysUtils.Abort;
                  end
               else
                  begin
                     if WinData.LookUpDamSire.Locate('ID', DSIRE,[] ) then
                        begin
                           DSSIRE := WinData.LookUpDamSire.FieldByName('SireID').AsInteger;
                           if (DSSIRE = ABullID) then
                              begin
                                 if MessageDlg(Format('WARNING: Service Sire, is the Dams Sire Sire of this animal "%s"'+cCRLF+'Do you want to continue?',[AServingAnimal]),mtWarning,[mbYes,mbNo],0) = idNo then
                                    SysUtils.Abort;
                              end;
                        end;
                  end;
            end;
      end;
end;

procedure TWinData.MoveIDsToAFilter;
begin
   WinData.MoveIDs.Destination := Windata.FilteredAnimals;
   WinData.MoveIDs.Source := Windata.AnimalFileByID;
   try
      // Set the Filter Options
      WinData.GenQuery.SQL.Clear;
      WinData.GenQuery.SQL.Add('DELETE FROM ' + WinData.FilteredAnimals.TableName);
      WinData.GenQuery.ExecSQL;

      MoveIDs.Execute;
   except
      on e : Exception do
         begin
            MessageDlg(E.Message+' Cannot copy IDs, program will rebuild indexes'+#13#10+cErrorContact,mtError,[mbOK],0);
            WinData.KingData.CloseDataSets; // Close the Dataset
            WinData.KingData.Close;         // Close the Database
            ReIndexAll(True);
            WinData.OpenAndCheckTables;
         end;
   end;
end;

function TWinData.EventDataHelper: TEventDataHelper;
begin
   if FEventDataHelper = nil then
      FEventDataHelper := TEventDataHelper.Create;
   Result := FEventDataHelper;
end;

function TWinData.BreedingDataHelper: TBreedingDataHelper;
begin
   if FBreedingDataHelper = nil then
      FBreedingDataHelper := TBreedingDataHelper.Create;
   Result := FBreedingDataHelper;
end;

// 14/04/09 [V3.9 R6.7] /MK Additional Feature - New Public Function allow Calvings to
// show the ICBF Survey as ICBF Normal when New Calving Event created.
function TWinData.ICBF_NormalBirthType_ID: Integer;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Text := 'SELECT DISTINCT ID FROM "GenLook.DB" where ListType = ' + IntToStr(LBirthType) + ' AND Description = ''ICBF-Normal''';
         Open;
         try
            First;
            Result := FieldByName('ID').AsInteger;
         finally
            Close;
         end;
      finally
         Free;
   end
end;

function TWinData.GetCurrentDBVersion: Integer;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT UpdateNo FROM Defaults');
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

procedure TWinData.SaleDeathColdDeadWtChange(Sender: TField);
begin
   if FCalculateLiveAndDeadWeight then
      CalculateLiveAndDeadWeight
end;

procedure TWinData.SaleDeathKillOutChange(Sender: TField);
begin
   if FCalculateLiveAndDeadWeight then
      CalculateLiveAndDeadWeight;
end;

procedure TWinData.SaleDeathWeightChange(Sender: TField);
begin
   if FCalculateLiveAndDeadWeight then
      CalculateLiveAndDeadWeight;
end;

procedure TWinData.CalculateLiveAndDeadWeight;
var
   KillOutCalculator : TKillOutCalculator;
   TempFloat, KillOutPerc : Double;

   function CalcKillOutPerc : Double;
   begin
      KillOutCalculator := TKillOutCalculator.Create;
      try
         Result := KillOutCalculator.Calculate(WinData.AnimalFileByIDSex.AsString,WinData.AnimalFileByIDPrimaryBreed.AsInteger,WinData.AnimalFileByIDLactNo.AsInteger);
      finally
         FreeAndNil(KillOutCalculator);
      end;
   end;
begin
   if ( Events.State in dsEditModes ) and (SaleDeath.State in dsEditModes ) then
      begin
         FCalculateLiveAndDeadWeight := False;
         try
            if ( SaleDeathColdDeadWt.AsFloat > 0 ) and  ( SaleDeathWeight.AsFloat <= 0 ) then
               begin
                  if ( SaleDeathKillOut.AsFloat <= 0 ) then
                     begin
                        KillOutPerc := CalcKillOutPerc;
                        SaleDeathKillOut.AsFloat := KillOutPerc;
                     end
                  else
                     KillOutPerc := SaleDeathKillOut.AsFloat;

                  SaleDeathWeight.AsFloat := (( SaleDeathColdDeadWt.AsFloat * 100) / KillOutPerc );
               end
            {

            // Removed SP ColdDeadWt should not be calculated from live weight. GL 15/01/2010
            else if ( SaleDeathColdDeadWt.AsFloat <= 0 ) and ( SaleDeathWeight.AsFloat > 0 ) then
               begin
                  if ( SaleDeathKillOut.AsFloat <= 0 ) then
                     begin
                        KillOutPerc := CalcKillOutPerc;
                        SaleDeathKillOut.AsFloat := KillOutPerc;
                     end
                  else
                     KillOutPerc := SaleDeathKillOut.AsFloat;

                  SaleDeathColdDeadWt.AsFloat := ( SaleDeathWeight.AsFloat * ( KillOutPerc / 100) );
               end}
            else if ( SaleDeathColdDeadWt.AsFloat > 0 ) and ( SaleDeathWeight.AsFloat > 0 ) then
               begin
                  try
                     SaleDeathKillOut.AsFloat := ( SaleDeathColdDeadWt.AsFloat / SaleDeathWeight.AsFloat )*100;
                  except
                  end;
               end;
         finally
           FCalculateLiveAndDeadWeight := True;
         end;
      end;
end;

function TWinData.GetKingswdDatabaseName: string;
begin
   Result := UPPERCASE(ExtractDirFromPath(kRoutines.DataPath));
   if Trim(Result) = '' then
      raise Exception.Create('Database not connected.');
end;

procedure TWinData.EditMailboxSettings;
begin
   if WinData.AdvisoryRoleActive then
      begin
         MessageDlg(cAdvisoryAccessMsg,mtWarning,[mbOK],0);
         exit;
      end;

   SetCurrentDir(ApplicationPath);
   if FileExists( IncludeTrailingBackslash(ApplicationPath)+ KingswoodMailBoxDLL) then
      begin
          DLLHandle := LoadLibrary(KingswoodMailBoxDLL);
          if DLLHandle <> 0 then
             begin
                try
                  @EMailLoginSetting := GetProcAddress(DLLHandle, 'EMailLoginSetting');
                  if @EMailLoginSetting <> nil then
                     EMailLoginSetting
                  else
                     MessageDlg(Format(cKingswoodMailBoxDLLCallToFunctionFailed,['EMailLoginSetting']),mtError,[mbOk],0);
                finally
                   FreeLibrary(DLLHandle);
                end;
             end
          else
             MessageDlg(cKingswoodMailBoxDLLUnableToLoad,mtError,[mbOk],0);
       end
   else
        MessageDlg(cKingswoodMailBoxDLLNotFound,mtError,[mbOk],0);
end;

function TWinData.AdvisoryRoleActive: Boolean;
begin
   with KAC do
     begin
        Result := (( Active ) and
                   ( IsAdvisor ) and
                   ( UPPERCASE(AdvisorDBName) = cAdvisorDBName ) and
                   ( UPPERCASE(DataDir) = cAdvisorDBName )
                  );
     end;

end;

function TWinData.GetInMemoryDataset(const ADatabaseName, AQuery : String) : TdxMemData;
var
   query : TQuery;
begin
   query := Tquery.create(nil);
   with query do
      try
         DatabaseName := ADatabaseName;
         sql.Text := AQuery;
         Active := True;

         result := TdxMemData.Create(nil);
         result.LoadFromDataSet(query);
      finally
         Active := False;
         FreeAndNil(query);
      end;
end;

procedure TWinData.cxHintShowHint(Sender: TObject; var HintStr: String;
  var CanShow: Boolean; var HintInfo: THintInfo);
begin
   //  05/05/10 [V4.0 R3.5] /MK Additional Feature -  Added cxHint to show hints on Report View buttons

   cxHint.HintStyle.Standard := False;
   cxHint.HintStyle.Animate := cxhaActivate;
   cxHint.HintStyle.AnimationDelay := 100;
   cxHint.HintStyle.BorderColor := clWindowFrame;
   cxHint.HintStyle.CallOutPosition := cxbpTopLeft;
   with cxHint.HintStyle.CaptionFont do
      begin
         Name := 'Segoe UI';
         Size := 8;
         Style := [fsBold];
      end;
   with cxHint.HintStyle.CaptionFont do
      begin
         Name := 'Segoe UI';
         Size := 8;
         Style := [fsBold];
      end;
   cxHint.HintStyle.IconSize := cxisDefault;
   cxHint.HintStyle.IconType := cxhiNone;
   cxHint.HintStyle.Rounded := True;
   cxHint.HintStyle.RoundRadius := 15;

end;

procedure TWinData.CallHintStyle;
begin
   cxHint.HintStyle.Standard := False;
   cxHint.HintStyle.Animate := cxhaActivate;
   cxHint.HintStyle.AnimationDelay := 100;
   cxHint.HintStyle.BorderColor := clWindowFrame;
   cxHint.HintStyle.CallOutPosition := cxbpTopLeft;
   with cxHint.HintStyle.CaptionFont do
      begin
         Name := 'Segoe UI';
         Size := 8;
         Style := [fsBold];
      end;
   with cxHint.HintStyle.CaptionFont do
      begin
         Name := 'Segoe UI';
         Size := 8;
         Style := [fsBold];
      end;
   cxHint.HintStyle.IconSize := cxisDefault;
   cxHint.HintStyle.IconType := cxhiNone;
   cxHint.HintStyle.Rounded := True;
   cxHint.HintStyle.RoundRadius := 15;

end;

procedure TWinData.SendSimpleEmail(AToAddress, ACCAddress,
   ASubject, ABody: string);
var
   bConnected : Boolean;
   SendMailResult : Integer;
   emptyToAddress : Boolean;
begin
   bConnected := False;
   SendMailResult := -1;
   emptyToAddress := ( Length(Trim(AToAddress)) <= 0 );
   if ((DefaultEmailClient = cEmailClient_MS) or (emptyToAddress)) then
      begin
         with MAPIMail do
            begin
               Reset;
               if (emptyToAddress=False) then
                  ToRecipient.Add(AToAddress)
               else
                  MessageDlg('You must enter the recipient email address into the "To" box before sending the email message.',mtWarning,[mbOK],0);
               Subject := ASubject;
               if ( Length(Trim(ACCAddress)) > 0 ) then
                 CcRecipient.Add(ACCAddress);
               MessageBody.Text := ABody;
               SendMail;
            end;
      end
   else
      begin
         bConnected := IsNetConnected;
         if not bConnected then
            ShowConnectForm(bConnected);

         if bConnected then
            begin
              SetCurrentDir(ApplicationPath);
              if FileExists( IncludeTrailingBackslash(ApplicationPath)+ KingswoodMailBoxDLL) then
                 begin
                    DLLHandle := LoadLibrary(KingswoodMailBoxDLL);
                    if DLLHandle <> 0 then
                       begin
                          try
                            @SendSimpleEmailProc := GetProcAddress(DLLHandle, 'SendSimpleEmail');
                            if @SendSimpleEmailProc <> nil then
                               begin
                                  SendMailResult := SendSimpleEmailProc(PChar(AToAddress), PChar(ACCAddress), PChar(ASubject), PChar(ABody));
                                  case SendMailResult of
                                    -1 : MessageDlg(cEMailSendError_1,mtError,[mbOK],0);
                                     0 : MessageDlg(Format('Email successfully sent to "%s".',[AToAddress]),mtInformation,[mbOK],0);
                                     1 : MessageDlg(cEMailSendError_2,mtError,[mbOK],0);
                                     2,4 : MessageDlg(cEMailSendError_3,mtError,[mbOK],0);
                                     3 : MessageDlg(cEMailSendError_4,mtError,[mbOK],0);
                                  end;
                               end
                            else
                               MessageDlg(Format(cKingswoodMailBoxDLLCallToFunctionFailed,['SendSimpleEmail']),mtError,[mbOk],0);
                          finally
                             FreeLibrary(DLLHandle);
                          end;
                       end
                    else
                       MessageDlg(cKingswoodMailBoxDLLUnableToLoad,mtError,[mbOk],0);
                 end
              else
                 MessageDlg(cKingswoodMailBoxDLLNotFound,mtError,[mbOk],0);
            end
         else
            MessageDlg(cINTERNET_CONNECTION_NOT_ESTABLISHED,mtError,[mbOK],0);
      end;
end;

function TWinData.StripAllAlphaButNum(StrToStrip: String): String;
var
   j:integer;
   st : string;
begin
   St := StripAllSpaces(StrToStrip);
   if Length(St)>0 then
      begin
         j := length(St);
         while (j>1) do
            begin
               if NOT ( St[j] in ['0'..'9'] ) then
                  Delete(St,j,1);
               Dec(j);
            end;
      end;
   Result := St;
end;

procedure TWinData.TempCalvingCalcFields(DataSet: TDataSet);
begin
   TempCalvingCalcNatId.AsString := TempCalvingNatID.AsString
end;

procedure TWinData.TempCalvingAfterScroll(DataSet: TDataSet);
begin
   if ( Events.State = dsInsert ) then
      begin
         if ( TempCalvingCalfDead.AsBoolean ) then
            begin
               if DefCountry(AnimalFileByIDHerdID.AsInteger) = NIreland then
                  if DeadCalfNatIDValue <> '' then
                     TempCalvingNatID.EditMask := '';
            end
         else
            begin
               if ( DefCountry(AnimalFileByIDHerdID.AsInteger) in [Ireland, NIreland] ) then
                  TempCalvingNatID.EditMask := DefaultNatIDMaskFromHerdIdentifierMask
               else
                  TempCalvingNatID.EditMask := DefaultNatIDMask;
            end;
      end;
end;

procedure TWinData.RollbackTagAutoGenNumber;
begin
    // Update the National Identity Animal Number (Automatic Numbering)
   // decrement the natidno
   RollBackTag := True;  
   HerdLookup.HerdOwnerData.HerdID := TempCalvingHerdID.AsInteger;
   if (HerdLookup.HerdOwnerData.InputNatIDStyle = cInputNatIDStyle_AutoGenInput) then
      begin
         HerdLookup.HerdOwnerData.NextNatID := HerdLookup.HerdOwnerData.NextNatID-1;
      end;
end;

function TWinData.CreateAbortedTag(ADamNatID: String): String;
begin
   Result := StripAllNomNumAlpha(ADamNatID);
   if ( Copy(Result, 1,2) = 'IE' ) then
      Delete(Result,1,2);
   Result := 'ABOR'+Result+ FormatDateTime('mm',date) + FormatDateTime('yy',date);
   if Length(Result) > 20 then
      Result := Copy(Result, 1, 20);
end;


end.
