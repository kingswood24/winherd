
unit MenuUnit;


{ NOTE: New Fields Added to Animalstable must be defined in the cxAnimalGrid Column Definition }

  // ***********************************************************************************************

  // TO DO : Grid Columns Damanimalno, DamNatID, SireAnimalNo must create sort click!!!!!!!!!!!!!!!

  // ***********************************************************************************************

{

 ------------------------------------------------------------------------------
 SP 30/09/2002:-

 New Procedure EnableBtn.
 To Disable a report button when clicked, and Enable it when report is closed.

 SP 30/09/2002.

 ------------------------------------------------------------------------------

 SP 15/11/2002:-

 OnFormActivate

 Remind user to download latest version.

 SP 15/11/2002:-

 ------------------------------------------------------------------------------

 SP 03/12/2002:-

 bBullsUsedInHerd button renamed to Bull Report and is now on gCowManagement
 group box.
 bSireSelect and bBrowseSireReg moved to the gQuotaPlanner group box.
 BullReports Group Box, which included the 3 above buttons was deleted.

 SP 03/12/2002.

 ------------------------------------------------------------------------------

 SP 30/01/2003:-

 If Herd is NI registered or "All Herds" is selected then hide
 Inter Herd Tranfer button.

 SP 30/01/2003.

 ------------------------------------------------------------------------------

 SP 13/02/2003:-

 Group Events and Management button's repositioned. Swapped around.

 SP 03/12/2003.

 ------------------------------------------------------------------------------

 SP 23/03/2003:- V3.6 R5.5

 New Module BeefAdmin Added to def.
 If def doesn't include BeefAdmin Hide Premiums and Premium Planner Reports/Menu Item.

 Show Events History/Current Lactation Button above event grid
 Show Feed Events/Events Button above event grid

 New column on animal grid TT ( Temp Tag )
 Option to display either Temp Tag or Retag Field. (Right click on grid to change between fields )

 Livestock Reconciliation - asked for by peter cosgrave.

 SP 23/03/2003:- V3.6 R5.5
 ------------------------------------------------------------------------------


 06/01/09 [V3.9 R5.6] /SP Additional Feature - Default cmboSearchColumns.ItemIndex to WinData.SearchField Value.
                                             eg. WinData.SearchField = 'AnimalNo' ... cmboSearchColumns.Text = 'Animal No.'

 08/01/2009 [V3.9 R5.7] /SP Additional Feature - Introduction of New Reports Screen Layout

 28/01/2009 [V3.9 R5.8] /SP Additional Feature - if NIreland system allow user to access https://eservices.ruralni.gov.uk/profile/login.asp via sbMartMovement click

 29/01/2009 [V3.9 R5.8] /SP Additional Feature - Notify HUK of animals moved onto farm, using grid and cart.

 29/01/2009 [V3.9 R5.8] /SP Bug Fix - Sort grid by Animal No., before animal no search is allowed. This is to facilitate an orderly search

 19/02/2009 [V3.9 R6.3] /SP Program Change - MainMenu - changed item captions / swapped items positions in the NewFeatures1 MenuItem.

 25/02/2009 [V3.9 R6.4] /SP Bug Fix - Calving Button Click - check if animal animal is cow before dry off check

 25/02/2009 [V3.9 R6.5] /SP Program Change - Allow easy access to Group Events, allow access to each group event
                       via the individual event.

 11/03/2009 [Dev V3.9 R6.6] /SP Program Change - Removed the option for Historical Livestock Nutrient Report ( for all countries "GL")

 23/07/10 [V4.0 R4.0] /MK Bug Fix - Days on Farm does not include Sale Date.

 17/08/10 [V4.0 R4.5] /MK Bug Fix - Check for AIBullListUpdate where HerdType <> Beef and Country is Ireland. 
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, Menus, ExtCtrls, DBCtrls, ComCtrls,
  RXCtrls, Adgrad, RXLookup, Db, DBTables, RXDBCtrl, ToolWin,
  RXSplit, Mask, ToolEdit, RXShell, TB97Tlbr, TB97Ctls, TB97, Registry,
  TJpgImg, DbPrgrss, kwDBNavigator, ImgList, jpeg, Tips,
  GenTypesConst, DBCtrlsEh, DynaZip, DynaLibU, RxGIF, KActionList,PhoneLink,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, dxmdaset, cxSplitter,
  cxGraphics, cxStyles, cxCustomData, cxDBData, LMDWebBase, LMDRAS,
  cxContainer, cxEdit, cxImage, cxDBEditRepository, ActnList, dxPSCore,
  dxPScxCommon, dxPScxGridLnk, cxButtons, cxPC, cxCheckBox, KRxSpeedButton,
  cxHint, cxLabel, cxTextEdit, cxMemo, cxDBEdit, cxGroupBox, DateUtil,
  dxStatusBar, cxMaskEdit, cxDropDownEdit, LMDWebConfig,
  LMDWebHTTPGet, LMDDownload;

type
  TcxPageControlAccess = class(TcxPageControl);
  TSystemType = (stStandard, stPDAStandalone);
  TDoWhat = (AddAnimal,AmendDeleteAnimal);
  TMoveToMovement = (SwitchToMovement,DoNotSwitchToMovement);
  TMenuForm = class(TForm)
    pGrid: TPanel;
    Gradient: TAdrockGradientFill;
    pManagement: TPanel;
    pCalfRegCMMS: TPanel;
    pMovements: TPanel;
    pVet: TPanel;
    Lbreeding1: TBevel;
    LBreeding2: TBevel;
    lOtherEvents: TBevel;
    Lvet: TBevel;
    LMovements: TBevel;
    LPremium: TBevel;
    lManagement2: TBevel;
    PrinterSetup: TPrinterSetupDialog;
    ShowIcon: TRxTrayIcon;
    IconMenu: TPopupMenu;
    KingswoodHerdManagement1: TMenuItem;
    Exit2: TMenuItem;
    About2: TMenuItem;
    N3: TMenuItem;
    pM1: TPanel;
    pM2: TPanel;
    pm4: TPanel;
    PicWeight: TImage;
    sbWeight: TSpeedButton;
    picMilk: TImage;
    sbMilkRec: TSpeedButton;
    pHerdRec: TPanel;
    sbCMMSRecon: TSpeedButton;
    ShowMenu1: TMenuItem;
    N20: TMenuItem;
    Dock97: TDock97;
    Toolbar97: TToolbar97;
    sbExit: TRxSpeedButton;
    sbAnimalsPaddocks: TRxSpeedButton;
    sbHelp: TRxSpeedButton;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;
    Panel1: TPanel;
    mGroup: TPopupMenu;
    lHerdFarm: TLabel;
    cbDefaultHerd: TRxDBLookupCombo;
    ToolbarSep975: TToolbarSep97;
    sbBackup: TRxSpeedButton;
    ToolbarSep976: TToolbarSep97;
    BackUpTimer: TTimer;
    sbAccounts: TRxSpeedButton;
    ToolbarSep977: TToolbarSep97;
    PM7: TPanel;
    Image20: TImage;
    sbParlour: TSpeedButton;
    AMTip: TTips;
    pmEventChange: TPopupMenu;
    Events: TMenuItem;
    Feeds: TMenuItem;
    sbSheep: TRxSpeedButton;
    ToolbarSep978: TToolbarSep97;
    pm9: TPanel;
    picRationCalc: TImage;
    picPreSale: TImage;
    sbRationCalc: TSpeedButton;
    pFeedAlloc: TPanel;
    iFeedAlloc: TImage;
    sbFeedAlloc: TSpeedButton;
    pFeedPurch: TPanel;
    iFeedPurch: TImage;
    sbFeedPurch: TSpeedButton;
    pVetTreat: TPanel;
    iVetTreat: TImage;
    sbVetTreat: TSpeedButton;
    pVetPurch: TPanel;
    iVetPurch: TImage;
    Purchbutton: TSpeedButton;
    pReports: TPanel;
    rgCurrency: TRadioGroup;
    gHerdReps: TGroupBox;
    bBovineHerdReg: TSpeedButton;
    bStockInHerd: TSpeedButton;
    SpeedButton7: TSpeedButton;
    gCowManagement: TGroupBox;
    sbHeatService: TSpeedButton;
    sbHerdRG: TSpeedButton;
    sbWeighing2: TSpeedButton;
    gMilkAnalysis: TGroupBox;
    bCowsInMilk: TSpeedButton;
    SpeedButton4: TSpeedButton;
    bBestCowsInHerd: TSpeedButton;
    sbMilkDiskReview: TSpeedButton;
    sbMilkSysRec: TSpeedButton;
    gVetReps: TGroupBox;
    bMedicalTreatments: TSpeedButton;
    sbVetTreatmentPurch: TSpeedButton;
    gbPedigree: TGroupBox;
    sbHUKIReg: TSpeedButton;
    sbHerdBrochure: TSpeedButton;
    sbSalesCatalogue: TSpeedButton;
    sbPedigreeRG: TSpeedButton;
    gQuotaPlanner: TGroupBox;
    sbFertilityTreatmentChart: TKRxSpeedButton;
    sbFertIndices: TKRxSpeedButton;
    sbFertAnalysis: TSpeedButton;
    gbBeefManagement: TGroupBox;
    SpeedButton16: TSpeedButton;
    sbWeighing: TSpeedButton;
    sbBeefPurchGrpRep: TSpeedButton;
    sbBeefRG: TSpeedButton;
    sbLivestockValuationRpt: TSpeedButton;
    AdrockGradientFill3: TAdrockGradientFill;
    lManagement1: TBevel;
    Panel2: TPanel;
    Image18: TImage;
    SalesButton: TSpeedButton;
    pMart: TPanel;
    sbMartMovements: TKRxSpeedButton;
    Image3: TImage;
    pPurchase: TPanel;
    bBreeding: TRxSpeedButton;
    bMovements: TRxSpeedButton;
    bHealth: TRxSpeedButton;
    bPremium: TRxSpeedButton;
    bManagement: TRxSpeedButton;
    bOtherEvents1: TRxSpeedButton;
    gbPremiumPlanner1: TGroupBox;
    SpeedButton8: TSpeedButton;
    sbExtensLivestkProj: TSpeedButton;
    SpeedButton2: TSpeedButton;
    sbTempMovements: TRxSpeedButton;
    sbHealthRG: TSpeedButton;
    vSplitter: TRxSplitter;
    sbCowFertilityRG: TSpeedButton;
    sbWeighingEvent: TKRxSpeedButton;
    ConditionScore1: TMenuItem;
    Castrate1: TMenuItem;
    Abortion1: TMenuItem;
    DiagnoseProblem1: TMenuItem;
    EmbryoImplantTransfer1: TMenuItem;
    Mastitis1: TMenuItem;
    TobeCulled1: TMenuItem;
    Wean1: TMenuItem;
    InternalExam1: TMenuItem;
    BullIn1: TMenuItem;
    BullOut1: TMenuItem;
    N22: TMenuItem;
    CreateMooreParkExportFile1: TMenuItem;
    pCalfReg: TPanel;
    sbRegistration: TSpeedButton;
    CalfRegImage: TImage;
    pICBF: TPanel;
    imgPedigreeReg: TImage;
    sbPedigreeReg: TSpeedButton;
    gbSalesEligibility: TGroupBox;
    SpeedButton17: TRxSpeedButton;
    SpeedButton1: TSpeedButton;
    sbSalesPlanner: TSpeedButton;
    MainMenu: TMainMenu;
    Animals: TMenuItem;
    ShowHintsatStartup: TMenuItem;
    N9: TMenuItem;
    Exit1: TMenuItem;
    AnimalsEvents: TMenuItem;
    Breeding1: TMenuItem;
    HeatBulling1: TMenuItem;
    Service1: TMenuItem;
    ScanningPDs1: TMenuItem;
    DryingOff1: TMenuItem;
    Calving1: TMenuItem;
    MovementsRegister1: TMenuItem;
    SalesDeaths1: TMenuItem;
    TemporaryMovement1: TMenuItem;
    ReTagging1: TMenuItem;
    RegisterRemarks1: TMenuItem;
    InterHerd1: TMenuItem;
    Veterinary1: TMenuItem;
    Purchases1: TMenuItem;
    Treatments1: TMenuItem;
    FeedPurchases1: TMenuItem;
    FeedAllocation1: TMenuItem;
    Premium1: TMenuItem;
    N1st2ndBull1: TMenuItem;
    Suckler1: TMenuItem;
    Slaughter1: TMenuItem;
    Management1: TMenuItem;
    AnimalWeighing1: TMenuItem;
    MilkRecording1: TMenuItem;
    ParlourLink1: TMenuItem;
    PreSale1: TMenuItem;
    View1: TMenuItem;
    Menu1: TMenuItem;
    ToolBar2: TMenuItem;
    N17: TMenuItem;
    EventIcons1: TMenuItem;
    Gradient1: TMenuItem;
    N18: TMenuItem;
    Statusbar1: TMenuItem;
    ResolutionOptions1: TMenuItem;
    AnimalsReports: TMenuItem;
    HerdReports1: TMenuItem;
    BovineHerdRegister1: TMenuItem;
    StockOnHand1: TMenuItem;
    PurchaseSalesAnalysis1: TMenuItem;
    SlaughterPremiumReport1: TMenuItem;
    PremiumPlanner1: TMenuItem;
    Extensification1: TMenuItem;
    StockingDensityRestrictions1: TMenuItem;
    PremiumHistoryEligibility1: TMenuItem;
    SlaughterPremiumReport2: TMenuItem;
    SalesEligibility1: TMenuItem;
    SalesPlanner1: TMenuItem;
    RestrictedAnimalsReport2: TMenuItem;
    DiseaseTestStatus1: TMenuItem;
    VeterinaryReports1: TMenuItem;
    VeterinaryTreatments1: TMenuItem;
    VeterinaryPurchases1: TMenuItem;
    CowManagementReports1: TMenuItem;
    HeatsAndServices1: TMenuItem;
    DueService1: TMenuItem;
    DuePregnancyDiagnosis1: TMenuItem;
    DueForDryingOff1: TMenuItem;
    DueToCalve1: TMenuItem;
    BeefManagement1: TMenuItem;
    SalesReport1: TMenuItem;
    MovementPermits1: TMenuItem;
    Weighing1: TMenuItem;
    BeefPurchaseGroups: TMenuItem;
    N8: TMenuItem;
    BullsUsedInHerd1: TMenuItem;
    Dairy1: TMenuItem;
    QuotaPlanner1: TMenuItem;
    HerdFertility1: TMenuItem;
    N7: TMenuItem;
    MilkAnalysisReports1: TMenuItem;
    BestCowsInHerd1: TMenuItem;
    MilkDiskReview1: TMenuItem;
    MonthlyMilkAnalysis1: TMenuItem;
    MilkProductionGraphs1: TMenuItem;
    PedigreeReports1: TMenuItem;
    HFSRegistration1: TMenuItem;
    HerdBrochure1: TMenuItem;
    SalesCatelog1: TMenuItem;
    N10: TMenuItem;
    SetCurrency: TMenuItem;
    Euro: TMenuItem;
    Pound: TMenuItem;
    PrintSetup1: TMenuItem;
    AnimalsSystem: TMenuItem;
    TakeBackup1: TMenuItem;
    AutoBackup1: TMenuItem;
    N12: TMenuItem;
    HerdSettings1: TMenuItem;
    PremiaValues1: TMenuItem;
    MilkDiskParameters1: TMenuItem;
    SetNationalIDtype1: TMenuItem;
    InventoryValuations1: TMenuItem;
    N15: TMenuItem;
    Breeds1: TMenuItem;
    Buyers1: TMenuItem;
    Customers1: TMenuItem;
    Suppliers1: TMenuItem;
    Manufacturers1: TMenuItem;
    Medicines1: TMenuItem;
    FeedTypes1: TMenuItem;
    SystemUsers1: TMenuItem;
    Units1: TMenuItem;
    DefaultAccsCompany1: TMenuItem;
    N16: TMenuItem;
    RecalculateEligibility2: TMenuItem;
    BeefPremium1: TMenuItem;
    SlaughterPremium1: TMenuItem;
    RebuildIndexes1: TMenuItem;
    ReLinkCalves1: TMenuItem;
    Help1: TMenuItem;
    Contents1: TMenuItem;
    Index1: TMenuItem;
    SearchforHelpOn1: TMenuItem;
    HowtoUseHelp1: TMenuItem;
    Tipoftheday1: TMenuItem;
    N21: TMenuItem;
    VisitKingswoodOnline1: TMenuItem;
    HerdManagement1: TMenuItem;
    EmailKingswood1: TMenuItem;
    KingswoodComputing1: TMenuItem;
    Bandon1: TMenuItem;
    ICBF1: TMenuItem;
    N14: TMenuItem;
    About1: TMenuItem;
    NewVersion1: TMenuItem;
    ChecknewVersion1: TMenuItem;
    miPhoneLink: TMenuItem;
    CheckPhoneLinkOnStartup: TMenuItem;
    CallKings: TMenuItem;
    SelectSMSReceiver1: TMenuItem;
    NokiaLink1: TMenuItem;
    SiemensGSMModule1: TMenuItem;
    Settings1: TMenuItem;
    bSireSelect: TSpeedButton;
    bBrowseSireReg: TSpeedButton;
    bBullsUsedInHerd: TSpeedButton;
    StoreImages: TImageList;
    PopupMenu1: TPopupMenu;
    RetagColumn1: TMenuItem;
    TempTagColumn1: TMenuItem;
    Checkfornewevents1: TMenuItem;
    N5: TMenuItem;
    Perferences1: TMenuItem;
    ToolbarSep979: TToolbarSep97;
    RxSpeedButton2: TRxSpeedButton;
    Blade1: TMenuItem;
    sbCalfPerformance: TSpeedButton;
    NICalfRegImg: TImage;
    ImageList1: TImageList;
    Unzip: TUnzipFile;
    TermsofUse1: TMenuItem;
    sbStockRestric: TRxSpeedButton;
    mStockRestrict: TPopupMenu;
    StockingDensityrestrictions2: TMenuItem;
    sbHerdReconciliation: TSpeedButton;
    PopSWS: TPopupMenu;
    HerdReconciliation1: TMenuItem;
    MenuItem1: TMenuItem;
    FloppyDisk1: TMenuItem;
    Desktop1: TMenuItem;
    popGridCols: TPopupMenu;
    DisplayColumns1: TMenuItem;
    DownloadToPhone1: TMenuItem;
    sbDairyBM: TSpeedButton;
    Brow1: TMenuItem;
    BrowseSireRegister1: TMenuItem;
    SireSelection1: TMenuItem;
    miFertRepGen: TMenuItem;
    miPedigreeRG: TMenuItem;
    DairyBenchmarks1: TMenuItem;
    Weighing2: TMenuItem;
    miHerdRG: TMenuItem;
    miCalfPerform: TMenuItem;
    miHealthRG: TMenuItem;
    CMMSReconciliation1: TMenuItem;
    UpdateAnimalNumberField1: TMenuItem;
    ImgBandon: TImage;
    BreedingActionLists: TPopupMenu;
    DueService2: TMenuItem;
    DuePregnancyDiagnosis2: TMenuItem;
    DueForDryingOff2: TMenuItem;
    DueToCalve2: TMenuItem;
    RxSpeedButton3: TRxSpeedButton;
    sbActivitiesSinceLastTest: TSpeedButton;
    sbMilkReportGeneratorRG: TSpeedButton;
    sbDairyHealthCert: TSpeedButton;
    miMilkReportGeneratorRG: TMenuItem;
    BreedingActionLists1: TMenuItem;
    RecentActivitiesList1: TMenuItem;
    DairyHerdHealthCert1: TMenuItem;
    sbSCCAnalysisRpt: TSpeedButton;
    miPDALink: TMenuItem;
    Settings2: TMenuItem;
    ExportToPDA: TMenuItem;
    N11: TMenuItem;
    Image4: TImage;
    DownloadEvents1: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyleAnimalNormal: TcxStyle;
    cxStyleNoneHerdAncestor: TcxStyle;
    cxStyleNoneHerd: TcxStyle;
    cxStyle1: TcxStyle;
    Utilities1: TMenuItem;
    CreateEBIValuesYoungstockonly1: TMenuItem;
    DefaultColumnHeader: TcxStyle;
    SelectedColumnHeader: TcxStyle;
    UpdateAnimalLactations1: TMenuItem;
    tbDownload: TToolbarButton97;
    pAnimalGrid: TPanel;
    AnimalsEventsSplitter: TcxSplitter;
    pSearch: TPanel;
    Bevel2: TBevel;
    sbAnimalView: TRxSpeedButton;
    Bevel1: TBevel;
    cbAllAnimals: TDBCheckBoxEh;
    cbSearch: TDBCheckBoxEh;
    cxAnimalGrid: TcxGrid;
    cxAnimalGridView: TcxGridDBTableView;
    cxAnimalGridViewAnimalNo: TcxGridDBColumn;
    cxAnimalGridViewNatIDNum: TcxGridDBColumn;
    cxAnimalGridViewSortAnimalNo: TcxGridDBColumn;
    cxAnimalGridViewSex: TcxGridDBColumn;
    cxAnimalGridViewDateOfBirth: TcxGridDBColumn;
    cxAnimalGridViewLactNo: TcxGridDBColumn;
    cxAnimalGridViewName: TcxGridDBColumn;
    cxAnimalGridViewHerdBookNo: TcxGridDBColumn;
    cxAnimalGridViewBirthWeight: TcxGridDBColumn;
    cxAnimalGridViewBrucellosis: TcxGridDBColumn;
    cxAnimalGridViewTBTestDate: TcxGridDBColumn;
    cxAnimalGridViewBreedCode: TcxGridDBColumn;
    cxAnimalGridViewColourCode: TcxGridDBColumn;
    cxAnimalGridViewRT: TcxGridDBColumn;
    cxAnimalGridViewTT: TcxGridDBColumn;
    cxAnimalGridViewDamNo: TcxGridDBColumn;
    cxAnimalGridViewSireNo: TcxGridDBColumn;
    cxAnimalGridLevel1: TcxGridLevel;
    gbLivestockSummaryReports: TGroupBox;
    sbLivestockInventory: TSpeedButton;
    sbProfitMonitorSummary: TKRxSpeedButton;
    sbREPSReport: TKRxSpeedButton;
    StatusBar: TStatusBar;
    pFilter: TPanel;
    sbFilters: TKRxSpeedButton;
    sbClearFilter: TRxSpeedButton;
    lRecNo: TLabel;
    sbHerdStats: TRxSpeedButton;
    Label1: TLabel;
    imgBarcode: TcxImage;
    RxSpeedButton4: TRxSpeedButton;
    cxEditRepository1: TcxEditRepository;
    riEventTypes: TcxEditRepositoryLookupComboBoxItem;
    riHerdCombo: TcxEditRepositoryLookupComboBoxItem;
    RxSpeedButton5: TRxSpeedButton;
    ActionList1: TActionList;
    actPrintGrid: TAction;
    ComponentPrinter: TdxComponentPrinter;
    AnimalGridPrinterLink: TdxGridReportLink;
    actEventHistory: TAction;
    sbEventGrid: TKRxSpeedButton;
    actClearFilter: TAction;
    cxAnimalGridViewEBI: TcxGridDBColumn;
    cxAnimalGridViewSortNatID: TcxGridDBColumn;
    cxAnimalGridViewSearchNatID: TcxGridDBColumn;
    cxAnimalGridViewHerdID: TcxGridDBColumn;
    cxAnimalGridViewAncestor: TcxGridDBColumn;
    cxAnimalGridViewBreeding: TcxGridDBColumn;
    cxAnimalGridViewDamAnimalNo: TcxGridDBColumn;
    cxAnimalGridViewDamNoHidden: TcxGridDBColumn;
    cxAnimalGridViewSireNoHidden: TcxGridDBColumn;
    cxAnimalGridViewDamAnimalNoHidden: TcxGridDBColumn;
    cxAnimalGridViewDamIDHidden: TcxGridDBColumn;
    cxAnimalGridViewSireIDHidden: TcxGridDBColumn;
    BreedingPageControl: TcxPageControl;
    tsBreeding: TcxTabSheet;
    tsOtherBreeding: TcxTabSheet;
    pmHerdFertility: TPopupMenu;
    SeasonalCalvingHerds1: TMenuItem;
    SpreadCalvingHerds1: TMenuItem;
    PremiumHistoryReport1: TMenuItem;
    N13: TMenuItem;
    miDARDDairyFertilityBenchmarks: TMenuItem;
    GridRecord: TcxStyle;
    MachineryLink: TMenuItem;
    N19: TMenuItem;
    sbCAFREFertList: TKRxSpeedButton;
    sbAddAnimalType: TKRxSpeedButton;
    PopupMenu2: TPopupMenu;
    Image2: TImage;
    pBeefSales: TPanel;
    Image24: TImage;
    SpeedButton20: TSpeedButton;
    DueToBeCulled1: TMenuItem;
    pmAddAnimalType: TPopupMenu;
    InherdAnimal: TMenuItem;
    AISireProvenDairy: TMenuItem;
    AISireTestBeef: TMenuItem;
    NonHerdAncestor1: TMenuItem;
    sbPurchase: TKRxSpeedButton;
    Image1: TImage;
    sbMachinery: TKRxSpeedButton;
    tsMachinery: TToolbarSep97;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    actNavFirst: TAction;
    actNavPrevious: TAction;
    actNavNext: TAction;
    actNavLast: TAction;
    imgHUKICalfReg: TImage;
    imgICBFEvents: TImage;
    CreateCISExportFile1: TMenuItem;
    ICBFRegistration1: TMenuItem;
    CalfRegistration2: TMenuItem;
    N24: TMenuItem;
    pmDiseaseTestStatus: TPopupMenu;
    DiseaseTestStatus2: TMenuItem;
    sbLivestockNutrientProjection: TKRxSpeedButton;
    pmLivestockNutrientProduction: TPopupMenu;
    Historical1: TMenuItem;
    AddNewBreed1: TMenuItem;
    TemporaryMovement2: TMenuItem;
    N25: TMenuItem;
    GettingStarted1: TMenuItem;
    pLostTagReplacements: TPanel;
    Image6: TImage;
    sbTagReplacement: TSpeedButton;
    pCMMSMovementsIn: TPanel;
    ImgMovements: TImage;
    sbCMMSMovementsIn: TSpeedButton;
    pmRegisterRemarks: TPopupMenu;
    RegisterRemarks3: TMenuItem;
    tsGettingStart: TToolbarSep97;
    Panel11: TPanel;
    Image7: TImage;
    sbRegisterRemark: TSpeedButton;
    sbGettingStarted: TcxButton;
    CMMSFileImport1: TMenuItem;
    RunPDAHerdInstaller: TMenuItem;
    RunPDAFieldsInstaller: TMenuItem;
    N26: TMenuItem;
    HistoricalCalving1: TMenuItem;
    HerdUtils1: TMenuItem;
    MealFeeding1: TMenuItem;
    Disbudding1: TMenuItem;
    imgCalfWeaning: TImage;
    imgDryOff: TImage;
    ICBFPCDownload1: TMenuItem;
    ImportICBFData1: TMenuItem;
    SystemFiles1: TMenuItem;
    SystemParameters1: TMenuItem;
    N4: TMenuItem;
    LivestockProductionRate1: TMenuItem;
    ResetAnimalGridColumns1: TMenuItem;
    sbaccsdbs: TKRxSpeedButton;
    pmAccsDatabases: TPopupMenu;
    cxLabel1: TcxLabel;
    sbIndividualCowFertDropDown: TKRxSpeedButton;
    pmFertilityTreatmentsReport: TPopupMenu;
    FertilityTreatmentsReport1: TMenuItem;
    sbVeterinaryDropdown: TKRxSpeedButton;
    MedicineStock1: TMenuItem;
    pmQuotaPlanner: TPopupMenu;
    FertilityTreatmentChart1: TMenuItem;
    GrasslandManagement1: TMenuItem;
    GrassIntakeGrowth1: TMenuItem;
    FertilityPrograms1: TMenuItem;
    sbTagReplacements2: TKRxSpeedButton;
    pmTagReplacements: TPopupMenu;
    MenuItem3: TMenuItem;
    Panel13: TPanel;
    EventGrid: TcxGrid;
    EventGridAnimalEventsView: TcxGridDBTableView;
    EventGridAnimalEventsViewEventType: TcxGridDBColumn;
    EventGridAnimalEventsViewEventDate: TcxGridDBColumn;
    EventGridAnimalEventsViewEventDesc: TcxGridDBColumn;
    EventGridAnimalEventsViewAnimalLactNo: TcxGridDBColumn;
    EventGridFeedEventsView: TcxGridDBTableView;
    EventGridFeedEventsViewAllocDate: TcxGridDBColumn;
    EventGridFeedEventsViewQuantDay: TcxGridDBColumn;
    EventGridFeedEventsViewFeedName: TcxGridDBColumn;
    EventGridLevel: TcxGridLevel;
    pEventActions: TPanel;
    sbHideEvents: TSpeedButton;
    cbAllEvents: TDBCheckBoxEh;
    cbFeedEvents: TDBCheckBoxEh;
    KingswoodHerdDevelopments1: TMenuItem;
    NewFeatures1: TMenuItem;
    N27: TMenuItem;
    sbAddAnimalToCart: TKRxSpeedButton;
    KRxSpeedButton4: TKRxSpeedButton;
    pmCart: TPopupMenu;
    AddToQueue1: TMenuItem;
    ClearCart1: TMenuItem;
    N29: TMenuItem;
    ViewCart1: TMenuItem;
    ImgCMMSPermits: TImage;
    ImgMovementsIn: TImage;
    DefaultHealthEventsAPHISMovementsIn1: TMenuItem;
    cxAnimalGridViewPurchDate: TcxGridDBColumn;
    cxAnimalGridViewPurchPrice: TcxGridDBColumn;
    cxAnimalGridViewSupplierName: TcxGridDBColumn;
    cxAnimalGridViewLotNumber: TcxGridDBColumn;
    cxAnimalGridViewPurchFQAS: TcxGridDBColumn;
    cxAnimalGridViewPurchComment: TcxGridDBColumn;
    cxAnimalGridViewSaleDate: TcxGridDBColumn;
    cxAnimalGridViewFeedGrpDesc: TcxGridDBColumn;
    cxAnimalGridViewPurchFQASDays: TcxGridDBColumn;
    sbAHPISMovementsIn: TRxSpeedButton;
    pmAPHISMovementsIn: TPopupMenu;
    APHISMovementsIn1: TMenuItem;
    N30: TMenuItem;
    DefaultEmailClient1: TMenuItem;
    sbLiveStockNutrientHistorical: TKRxSpeedButton;
    AnimalCartHintStyleController: TcxHintStyleController;
    HintTimer: TTimer;
    Help2: TMenuItem;
    gbAnimalComments: TcxGroupBox;
    mAnimalComments: TcxDBMemo;
    AnimalCommentsSplitter: TcxSplitter;
    pmdeleteevent: TPopupMenu;
    DeleteEvent1: TMenuItem;
    cxStyle2: TcxStyle;
    BeefHeifersBetween: TcxStyle;
    BeefHeifersOver: TcxStyle;
    BeefBullsBetween: TcxStyle;
    BeefBullsOver: TcxStyle;
    SteersBetween: TcxStyle;
    SteersOver: TcxStyle;
    GoTo1: TMenuItem;
    OnFarmEvents1: TMenuItem;
    FileExport1: TMenuItem;
    TagReplacementForm1: TMenuItem;
    cxAnimalGridViewID: TcxGridDBColumn;
    sbFilterMenu: TKRxSpeedButton;
    pmFilterMenu: TPopupMenu;
    ClearFilter1: TMenuItem;
    GoTo2: TMenuItem;
    OnFarmEvents2: TMenuItem;
    N28: TMenuItem;
    Help3: TMenuItem;
    pmOnFarmEvents: TPopupMenu;
    AddAlltoCart1: TMenuItem;
    N32: TMenuItem;
    cxAnimalGridViewDaysOnFarm: TcxGridDBColumn;
    sbSalesPlannerReports: TRxSpeedButton;
    pmSalesEligibiltyMenu: TPopupMenu;
    FQASReport1: TMenuItem;
    NonFQASReport1: TMenuItem;
    N30Month30Day1: TMenuItem;
    N30Month10Day1: TMenuItem;
    miTestFacility: TMenuItem;
    cxAnimalGridViewPedigree: TcxGridDBColumn;
    GroupSetup1: TMenuItem;
    FilterCart1: TMenuItem;
    Email1: TMenuItem;
    ViewMailBox2: TMenuItem;
    DownloadEmailAttachments1: TMenuItem;
    N33: TMenuItem;
    pcMultipleAnimals: TcxPageControl;
    tsMultipleAnimals: TcxTabSheet;
    tsAnimalGroups: TcxTabSheet;
    pMultipleAnimals: TPanel;
    Panel8: TPanel;
    Image22: TImage;
    SpeedButton10: TSpeedButton;
    pFileImport: TPanel;
    Image25: TImage;
    SpeedButton21: TSpeedButton;
    pFileExport: TPanel;
    Image26: TImage;
    SpeedButton22: TSpeedButton;
    pAnimalGroups: TPanel;
    pGroupSetup: TPanel;
    sbGroupSetup: TSpeedButton;
    Image15: TImage;
    pGroupUpdate: TPanel;
    Image5: TImage;
    sbGroupUpdate: TRxSpeedButton;
    pBeefPurch: TPanel;
    Image23: TImage;
    SpeedButton19: TSpeedButton;
    pGroupSales: TPanel;
    Image19: TImage;
    sbGroupSales: TKRxSpeedButton;
    CheckUpdates1: TMenuItem;
    N1: TMenuItem;
    BackupRestore1: TMenuItem;
    PDAReports: TMenuItem;
    VeterinaryTreatments2: TMenuItem;
    BovineHerdRegister2: TMenuItem;
    N2: TMenuItem;
    ICBFIHFARegistration1: TMenuItem;
    CalfRegistration1: TMenuItem;
    RecentChanges1: TMenuItem;
    N6: TMenuItem;
    cxLabel2: TcxLabel;
    teSearchText: TcxTextEdit;
    cxLabel3: TcxLabel;
    btnSearch: TcxButton;
    N23: TMenuItem;
    NotifyHUK1: TMenuItem;
    N31: TMenuItem;
    sbVetTreatmentsEvent: TKRxSpeedButton;
    bOtherEvents: TKRxSpeedButton;
    Panel3: TPanel;
    cmboSearchColumns: TcxComboBox;
    sbTagReplacements: TKRxSpeedButton;
    pmRetagging: TPopupMenu;
    Retagging2: TMenuItem;
    sbReports: TToolbarButton97;
    cxImage1: TcxImage;
    N34: TMenuItem;
    DownloadKingswoodInstaller1: TMenuItem;
    sbPurchaseEventDropDown: TRxSpeedButton;
    BlockSales1: TMenuItem;
    Panel18: TPanel;
    Image14: TImage;
    SpeedButton6: TSpeedButton;
    Panel14: TPanel;
    Image10: TImage;
    sbBulling: TSpeedButton;
    sbBullingEvent: TKRxSpeedButton;
    Panel4: TPanel;
    Image8: TImage;
    sbService: TSpeedButton;
    sbServiceEvent: TKRxSpeedButton;
    Panel15: TPanel;
    Image12: TImage;
    sbPds: TSpeedButton;
    sbScanPDEvent: TKRxSpeedButton;
    pDryOff: TPanel;
    ImgMilking: TImage;
    sbDryingOff: TSpeedButton;
    sbDryOffEvent: TKRxSpeedButton;
    Panel17: TPanel;
    Image13: TImage;
    sbCalving: TSpeedButton;
    btnOtherEvents: TRxSpeedButton;
    Panel5: TPanel;
    Image9: TImage;
    btnWeaning: TSpeedButton;
    btnWeaningEvent: TKRxSpeedButton;
    Panel7: TPanel;
    Image11: TImage;
    SpeedButton3: TKRxSpeedButton;
    Panel9: TPanel;
    Image16: TImage;
    btnCastrate: TSpeedButton;
    btnCastrateEvent: TKRxSpeedButton;
    Panel10: TPanel;
    Image17: TImage;
    btnMealFeeding: TSpeedButton;
    btnMealFeedingEvent: TKRxSpeedButton;
    Panel12: TPanel;
    Image21: TImage;
    btnDisbudding: TRxSpeedButton;
    btnDisbuddingEvent: TKRxSpeedButton;
    ksbDownloadInstaller: TKRxSpeedButton;
    pmDownloadInstaller: TPopupMenu;
    DownloadKingswoodInstaller2: TMenuItem;
    N35: TMenuItem;
    EmailSettings1: TMenuItem;
    miFacilitator: TMenuItem;
    miDownloadClientData: TMenuItem;
    procedure ExitButtonClick(Sender: TObject);
    procedure BullingButtonClick(Sender: TObject);
    procedure WeightButtonClick(Sender: TObject);
    procedure bReportsClick(Sender: TObject);
    procedure bMilkClick(Sender: TObject);
    procedure ServiceClick(Sender: TObject);
    procedure PDsButtonClick(Sender: TObject);
    procedure DryOffButtonClick(Sender: TObject);
    procedure HealthClick(Sender: TObject);
    procedure CalvingButtonClick(Sender: TObject);
    procedure PurchButtonClickClick(Sender: TObject);
    procedure sbAddClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SalesButton1Click(Sender: TObject);
    procedure sbMilkRec1Click(Sender: TObject);
    procedure bBackUpClick(Sender: TObject);
    procedure bSystemClick(Sender: TObject);
    procedure cbDefaultHerd1Change(Sender: TObject);
    procedure bHealth2Click(Sender: TObject);
    procedure bManagement2Click(Sender: TObject);
    procedure bBreeding2Exit(Sender: TObject);
    procedure ReIndex1Click(Sender: TObject);
    procedure BovineHerdRegister1Click(Sender: TObject);
    procedure StockOnHand1Click(Sender: TObject);
    procedure PurchaseSalesAnalysis1Click(Sender: TObject);
    procedure PremiumReport1Click(Sender: TObject);
    procedure VeterinaryTreatments1Click(Sender: TObject);
    procedure VeterinaryPurchases1Click(Sender: TObject);
    procedure CalfRegistration1Click(Sender: TObject);
    procedure HeatsAndServices1Click(Sender: TObject);
    procedure BullsUsedInHerd1Click(Sender: TObject);
    procedure BrowseSireRegister1Click(Sender: TObject);
    procedure SireSelection1Click(Sender: TObject);
    procedure QuotaPlanner1Click(Sender: TObject);
    procedure BestCowsInHerd1Click(Sender: TObject);
    procedure CowEnrolmentFormMR21Click(Sender: TObject);
    procedure MilkProductionGraphs1Click(Sender: TObject);
    procedure HerdBrochure1Click(Sender: TObject);
    procedure SalesCatelog1Click(Sender: TObject);
    procedure FirstAnimal1Click(Sender: TObject);
    procedure NextAnimal1Click(Sender: TObject);
    procedure PreviousAnimal1Click(Sender: TObject);
    procedure LastAnimal1Click(Sender: TObject);
    procedure PrintSetup1Click(Sender: TObject);
    procedure HerdSettings1Click(Sender: TObject);
    procedure MilkDiskParameters1Click(Sender: TObject);
    procedure SetNationalIDtype1Click(Sender: TObject);
    procedure Customers1Click(Sender: TObject);
    procedure Suppliers1Click(Sender: TObject);
    procedure Breeds1Click(Sender: TObject);
    procedure Buyers1Click(Sender: TObject);
    procedure SystemUsers1Click(Sender: TObject);
    procedure Medicines1Click(Sender: TObject);
    procedure Units1Click(Sender: TObject);
    procedure Menu1Click(Sender: TObject);
    procedure Statusbar1Click(Sender: TObject);
    procedure ToolBar2Click(Sender: TObject);
    procedure Gradient1Click(Sender: TObject);
    procedure sbHelp1Click(Sender: TObject);
    procedure sbSuckReplaceClick(Sender: TObject);
    procedure VisitKingswoodOnline1Click(Sender: TObject);
    procedure HerdManagement1Click(Sender: TObject);
    procedure Index1Click(Sender: TObject);
    procedure SearchforHelpOn1Click(Sender: TObject);
    procedure HowtoUseHelp1Click(Sender: TObject);
    procedure SalesReport1Click(Sender: TObject);
    procedure ResolutionOptions1Click(Sender: TObject);
    procedure EventIcons1Click(Sender: TObject);
    procedure MovementPermits1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbFiltersClick(Sender: TObject);
//    procedure qAnimalsAfterScroll(DataSet: TDataSet);
    procedure KingswoodHerdManagement1Click(Sender: TObject);
    procedure Weighing1Click(Sender: TObject);
    procedure sbActivitiesSinceLastTestClick(Sender: TObject);
    procedure sbMilkDiskReviewClick(Sender: TObject);
    procedure sbAnimalsPaddocks1Click(Sender: TObject);
    procedure eNatIDNumExit(Sender: TObject);
    procedure ShowHintsatStartupClick(Sender: TObject);
    procedure AMTipExecuted(Sender: TObject; StartNextTime: Boolean);
    procedure sbBeefPurchGrpRepClick(Sender: TObject);
    procedure ReLinkCalves1Click(Sender: TObject);
    procedure sbICBFRegClick(Sender: TObject);
    procedure BackUpTimerTimer(Sender: TObject);
    procedure AutoBackup1Click(Sender: TObject);
    procedure sbFeedPurchClick(Sender: TObject);
    procedure sbFeedAllocClick(Sender: TObject);
    procedure Manufacturers1Click(Sender: TObject);
    procedure sbAccountsClick(Sender: TObject);
    procedure sbReportGenerator(Sender: TObject);
    procedure FeedTypes1Click(Sender: TObject);
    procedure AMTipBtnCloseClick(Sender: TObject);
    procedure ePartialSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbSheepClick(Sender: TObject);
    procedure sbRationCalcClick(Sender: TObject);
    procedure sbMilkSysRecClick(Sender: TObject);
    procedure EuroClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure PoundClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbPrintClick(Sender: TObject);
    procedure SlaughterPremiumReport1Click(Sender: TObject);
    procedure RestrictedAnimalsReport1Click(Sender: TObject);
    procedure rgCurrencyClick(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure sbHerdStatsClick(Sender: TObject);
    procedure sbPedigreeRegClick(Sender: TObject);
    procedure sbRegistrationClick(Sender: TObject);
    procedure DefaultAccsCompany1Click(Sender: TObject);
    procedure ConditionScore1Click(Sender: TObject);
    procedure PremiaValues1Click(Sender: TObject);
    procedure bOtherEvents2Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure pBeefSalesClick(Sender: TObject);
    procedure pFileImportClick(Sender: TObject);
    procedure pFileExportClick(Sender: TObject);
    procedure Panel8Click(Sender: TObject);
    procedure bPremiumClick(Sender: TObject);
    procedure bBreedingClick(Sender: TObject);
    procedure bMovementsClick(Sender: TObject);
    procedure sbExtensLivestkProjClick(Sender: TObject);
    procedure sbRepLivestkInventClick(Sender: TObject);
    procedure cbSearch8Click(Sender: TObject);
    procedure ePartialSearchChange(Sender: TObject);
    procedure sbLocateClick(Sender: TObject);
    procedure sbNatIdSearchResetClick(Sender: TObject);
    procedure sbAnimalViewClick(Sender: TObject);
    procedure sbFertAnalysisClick(Sender: TObject);
    procedure CreateMooreParkExportFile1Click(Sender: TObject);
    procedure sbSalesPlannerClick(Sender: TObject);
    procedure DiseaseTestStatus1Click(Sender: TObject);
    procedure RestrictedAnimalsReport2Click(Sender: TObject);
    procedure SalesPlanner1Click(Sender: TObject);
    procedure PremiumHistoryEligibility1Click(Sender: TObject);
    procedure StockingDensityRestrictions1Click(Sender: TObject);
    procedure Extensification1Click(Sender: TObject);
    procedure SlaughterPremium1Click(Sender: TObject);
    procedure BeefPremium1Click(Sender: TObject);
    procedure KingswoodComputing1Click(Sender: TObject);
    procedure Bandon1Click(Sender: TObject);
    procedure ICBF1Click(Sender: TObject);
    procedure CheckPhoneLinkOnStartupClick(Sender: TObject);
    procedure InventoryValuations1Click(Sender: TObject);
    procedure NokiaLink1Click(Sender: TObject);
    procedure sbParlourClick(Sender: TObject);
    procedure cbAllAnimalsClick(Sender: TObject);
    procedure cbAllEventsClick(Sender: TObject);
    procedure cbFeedEventsClick(Sender: TObject);
    procedure Settings1Click(Sender: TObject);
    procedure Checkfornewevents1Click(Sender: TObject);
    procedure Perferences1Click(Sender: TObject);
    procedure SiemensGSMModule1Click(Sender: TObject);
    procedure MilkTank1Click(Sender: TObject);
    procedure RxSpeedButton2Click(Sender: TObject);
    procedure picPreSaleClick(Sender: TObject);
    procedure Blade1Click(Sender: TObject);
    procedure TermsofUse1Click(Sender: TObject);
    procedure sbHerdReconciliationClick(Sender: TObject);
    procedure sbHideEventsClick(Sender: TObject);
    procedure DownloadToPhone1Click(Sender: TObject);
    procedure sbDairyBMClick(Sender: TObject);
    procedure UpdateAnimalNumberField1Click(Sender: TObject);
    procedure DueService2Click(Sender: TObject);
    procedure DuePregnancyDiagnosis2Click(Sender: TObject);
    procedure DueForDryingOff2Click(Sender: TObject);
    procedure DueToCalve2Click(Sender: TObject);
    procedure sbMilkReportGeneratorRGClick(Sender: TObject);
    procedure sbDairyHealthCertClick(Sender: TObject);
    procedure sbBackupClick(Sender: TObject);
    procedure sbSCCAnalysisRptClick(Sender: TObject);
    procedure Settings2Click(Sender: TObject);
    procedure ExportToPDAClick(Sender: TObject);
    procedure sbCMMSReconClick(Sender: TObject);
    procedure DownloadEvents1Click(Sender: TObject);
    procedure EventGridAnimalEventsViewDblClick(Sender: TObject);
    procedure cxAnimalGridViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxAnimalGridViewSortNatIDGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cxAnimalGridViewSortAnimalNoGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cxAnimalGridViewRTGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cxAnimalGridViewTTGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure AnimalsEventsSplitterAfterClose(Sender: TObject);
    procedure AnimalsEventsSplitterBeforeOpen(Sender: TObject;
      var NewSize: Integer; var AllowOpen: Boolean);
    procedure sbGroupUpdateClick(Sender: TObject);
    procedure EventGridFeedEventsViewDblClick(Sender: TObject);
    procedure cxAnimalGridViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxAnimalGridViewDataControllerFilterBeforeChange(
      Sender: TcxDBDataFilterCriteria; ADataSet: TDataSet;
      const AFilterText: String);
    procedure CreateEBIValuesYoungstockonly1Click(Sender: TObject);
    procedure cxAnimalGridViewNatIDNumHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewAnimalNoHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewSexHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewDateOfBirthHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewLactNoHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewNameHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewHerdBookNoHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewBirthWeightHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewBrucellosisHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewTBTestDateHeaderClick(Sender: TObject);
    procedure UpdateAnimalLactations1Click(Sender: TObject);
    procedure tbDownloadClick(Sender: TObject);
    procedure sbProfitMonitorSummaryClick(Sender: TObject);
    procedure sbLivestockInventoryClick(Sender: TObject);
    procedure sbREPSReportClick(Sender: TObject);
    procedure eNatIDNumEnter(Sender: TObject);
    procedure RxSpeedButton4Click(Sender: TObject);
    procedure cxAnimalGridViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure actPrintGridExecute(Sender: TObject);
    procedure actEventHistoryExecute(Sender: TObject);
    procedure actClearFilterExecute(Sender: TObject);
    procedure cxAnimalGridViewSortAnimalNoHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewSortNatIDHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewEBIHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewBreedCodeHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewColourCodeHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewRTHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewTTHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewDamAnimalNoHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewDamNoHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewSireNoHeaderClick(Sender: TObject);
    procedure cxAnimalGridViewDamNoGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure cxAnimalGridViewDamAnimalNoGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure cxAnimalGridViewSireNoGetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
      var AText: String);
    procedure cxAnimalGridViewDamAnimalNoGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cxAnimalGridViewDamNoGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cxAnimalGridViewSireNoGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cxAnimalGridViewDamAnimalNoGetFilterValues(
      Sender: TcxCustomGridTableItem; AValueList: TcxDataFilterValueList);
    procedure cxAnimalGridViewDamNoGetFilterValues(
      Sender: TcxCustomGridTableItem; AValueList: TcxDataFilterValueList);
    procedure cxAnimalGridViewSireNoGetFilterValues(
      Sender: TcxCustomGridTableItem; AValueList: TcxDataFilterValueList);
    procedure cxAnimalGridViewDamNoGetFilterDisplayText(
      Sender: TcxCustomGridTableItem; const AValue: Variant;
      var ADisplayText: String);
    procedure cxAnimalGridViewSireNoGetFilterDisplayText(
      Sender: TcxCustomGridTableItem; const AValue: Variant;
      var ADisplayText: String);
    procedure cxAnimalGridViewDamAnimalNoGetFilterDisplayText(
      Sender: TcxCustomGridTableItem; const AValue: Variant;
      var ADisplayText: String);
    procedure BreedingPageControlDrawTabEx(AControl: TcxCustomTabControl;
      ATab: TcxTab; Font: TFont);
    procedure SeasonalCalvingHerds1Click(Sender: TObject);
    procedure SpreadCalvingHerds1Click(Sender: TObject);
    procedure PremiumHistoryReport1Click(Sender: TObject);
    procedure miDARDDairyFertilityBenchmarksClick(Sender: TObject);
    procedure AnimalGridNavBeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MachineryLinkClick(Sender: TObject);
    procedure cxAnimalGridViewEBICustomDrawHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure BreedingPageControlDrawTab(AControl: TcxCustomTabControl;
      ATab: TcxTab; var DefaultDraw: Boolean);
    procedure sbCAFREFertListClick(Sender: TObject);
    procedure HintStyleControllerShowHint(Sender: TObject;
      var HintStr: String; var CanShow: Boolean; var HintInfo: THintInfo);
    procedure sbCAFREFertListMouseLeave(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbAddAnimalTypeClick(Sender: TObject);
    procedure BreedingPageControlPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure cxAnimalGridViewEBIGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure DueToBeCulled1Click(Sender: TObject);
    procedure InherdAnimalClick(Sender: TObject);
    procedure AISireProvenDairyClick(Sender: TObject);
    procedure AISireTestBeefClick(Sender: TObject);
    procedure NonHerdAncestor1Click(Sender: TObject);
    procedure sbGroupSalesClick(Sender: TObject);
    procedure sbPurchaseClick(Sender: TObject);
    procedure SwitchTo1Click(Sender: TObject);
    procedure ViewAnimalEvent1Click(Sender: TObject);
    procedure actNavFirstExecute(Sender: TObject);
    procedure actNavFirstUpdate(Sender: TObject);
    procedure actNavPreviousUpdate(Sender: TObject);
    procedure actNavNextUpdate(Sender: TObject);
    procedure actNavLastExecute(Sender: TObject);
    procedure actNavLastUpdate(Sender: TObject);
    procedure actNavPreviousExecute(Sender: TObject);
    procedure actNavNextExecute(Sender: TObject);
    procedure ICBFEventRegistration1Click(Sender: TObject);
    procedure CreateCISExportFile1Click(Sender: TObject);
    procedure DiseaseTestStatus2Click(Sender: TObject);
    procedure Historical1Click(Sender: TObject);
    procedure AddNewBreed1Click(Sender: TObject);
    procedure sbMachineryClick(Sender: TObject);
    procedure sbMartMovementsClick(Sender: TObject);
    procedure TemporaryMovement2Click(Sender: TObject);
    procedure GettingStarted1Click(Sender: TObject);
    procedure sbGettingStarte2dClick(Sender: TObject);
    procedure sbRegisterRemarkClick(Sender: TObject);
    procedure sbGettingStartedClick(Sender: TObject);
    procedure CMMSFileImport1Click(Sender: TObject);
    procedure RunPDAHerdInstallerClick(Sender: TObject);
    procedure RunPDAFieldsInstallerClick(Sender: TObject);
    procedure HistoricalCalving1Click(Sender: TObject);
    procedure HerdUtils1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ImportICBFData1Click(Sender: TObject);
    procedure LivestockProductionRate1Click(Sender: TObject);
    procedure ResetAnimalGridColumns1Click(Sender: TObject);
    procedure cxAnimalGridViewDataControllerFilterChanged(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure AccsDatabasesClick(Sender: TObject);
    procedure FertilityTreatmentsReport1Click(Sender: TObject);
    procedure pmFertilityTreatmentsReportPopup(Sender: TObject);
    procedure MedicineStock1Click(Sender: TObject);
    procedure FertilityPrograms1Click(Sender: TObject);
    procedure ReplacementTagForm1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure eNameSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FertilityTreatmentChart1Click(Sender: TObject);
    procedure KingswoodHerdDevelopments1Click(Sender: TObject);
    procedure AddToQueue1Click(Sender: TObject);
    procedure ClearCart1Click(Sender: TObject);
    procedure sbAddAnimalToCartClick(Sender: TObject);
    procedure CTSLogin1Click(Sender: TObject);
    procedure DefaultHealthEventsAPHISMovementsIn1Click(Sender: TObject);
    procedure APHISMovementsIn1Click(Sender: TObject);
    procedure DefaultEmailClient1Click(Sender: TObject);
    procedure sbLivestockNutrientProjectionClick(Sender: TObject);
    procedure AnimalCartHintStyleControllerShowHint(Sender: TObject;
      var HintStr: String; var CanShow: Boolean; var HintInfo: THintInfo);
    procedure HintTimerTimer(Sender: TObject);
    procedure Help2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EventGridAnimalEventsViewCellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure DeleteEvent1Click(Sender: TObject);
    procedure FileExport1Click(Sender: TObject);
    procedure TagReplacementForm1Click(Sender: TObject);
    procedure ViewCart1Click(Sender: TObject);
    procedure Help3Click(Sender: TObject);

    procedure GroupHealthClick(Sender : TObject);
    procedure GroupBullingClick(Sender : TObject);
    procedure GroupServiceClick(Sender : TObject);
    procedure GroupDryOffClick(Sender : TObject);
    procedure GroupWeighingClick(Sender : TObject);
    procedure GroupPregDiagClick(Sender : TObject);
    procedure GroupTBTestClick(Sender : TObject);
    procedure GroupBruceTestClick(Sender : TObject);
    procedure GroupTempMoveClick(Sender : TObject);
    procedure AddAlltoCart1Click(Sender: TObject);
    procedure SalesPlanner2Click(Sender: TObject);
    procedure FQASReport1Click(Sender: TObject);
    procedure NonFQASReport1Click(Sender: TObject);
    procedure N30Month30Day1Click(Sender: TObject);
    procedure N30Month10Day1Click(Sender: TObject);
    procedure GroupSetup1Click(Sender: TObject);
    procedure FilterCart1Click(Sender: TObject);
    procedure pmCartPopup(Sender: TObject);
    procedure DownloadEmailAttachments1Click(Sender: TObject);
    procedure ViewMailBox2Click(Sender: TObject);
    procedure sbGroupSetupClick(Sender: TObject);
    procedure pcMultipleAnimalsChange(Sender: TObject);
    procedure pcMultipleAnimalsDrawTabEx(AControl: TcxCustomTabControl;
      ATab: TcxTab; Font: TFont);
    procedure pcMultipleAnimalsDrawTab(AControl: TcxCustomTabControl;
      ATab: TcxTab; var DefaultDraw: Boolean);
    procedure RecentChanges1Click(Sender: TObject);
    procedure cmboSearchColumnsPropertiesChange(Sender: TObject);
    procedure cmboSearchColumnsPropertiesEditValueChanged(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure teSearchTextEnter(Sender: TObject);
    procedure teSearchTextPropertiesChange(Sender: TObject);
    procedure teSearchTextKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbAPHISEPermitClick(Sender: TObject);
    procedure NotifyHUK1Click(Sender: TObject);
    procedure miTestFacilityClick(Sender: TObject);
    procedure teSearchTextExit(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure bOtherEventsClick(Sender: TObject);
    procedure AnimalsEventsSplitterCanResize(Sender: TObject;
      var NewSize: Integer; var Accept: Boolean);
    procedure Retagging2Click(Sender: TObject);
    procedure sbTagReplacementClick(Sender: TObject);
    procedure sbHUKIRegClick(Sender: TObject);
    procedure cxImage1Click(Sender: TObject);
    procedure DownloadKingswoodInstaller1Click(Sender: TObject);
    procedure DownloadKingswoodInstaller2Click(Sender: TObject);
    procedure EmailSettings1Click(Sender: TObject);
    procedure miDownloadClientDataClick(Sender: TObject);

  private
    { Private declarations }
    Reg : TRegistry;
    FormActivateTriggered,
    iSortAsc   : Boolean;
    sCurrIndex : String;
    CurrAnimal : Integer;
    WhichReg : TCountry;
    SuckMenuItem : TMenuItem;

    LastHerdID : SmallInt;
    AllAnimalsShowing : Boolean; // Set this boolean to stop setupForm event being fired after change to cbDefaultHerd.value
    PL : TPhoneLink;
    GridSettingsIniPath : String;

    AnimalCartFiltered : Boolean;
    GettingStartedScrActive : Boolean;


    FSearchColumn : TcxGridDBColumn;


    pmHeatBullingEvent: TPopupMenu;
    pmServiceEvent: TPopupMenu;
    pmScanPDEvent: TPopupMenu;
    pmDryOffEvent: TPopupMenu;
    pmVetTreatmentsEvent: TPopupMenu;
    pmWeighingEvent : TPopupMenu;
    pmDisbuddingEvent : TPopupMenu;
    pmCastrationEvent : TPopupMenu;
    pmStartMealFeedEvent : TPopupMenu;
    pmWeaningEvent : TPopupMenu;
    pmPurchaseEvent : TPopupMenu;


    miHeatBullingSingleEvent: TMenuItem;
    miHeatBullingMultiEvent: TMenuItem;

    miServiceSingleEvent: TMenuItem;
    miServiceMultiEvent: TMenuItem;

    miScanPDSingleEvent: TMenuItem;
    miScanPDMultiEvent: TMenuItem;

    miDryOffSingleEvent: TMenuItem;
    miDryOffMultiEvent: TMenuItem;

    miVetTreatmentsSingleEvent: TMenuItem;
    miVetTreatmentsMultiEvent: TMenuItem;

    miPurchaseMultiEvent : TMenuItem;

    miWeighingSingleEvent: TMenuItem;
    miWeighingMultiEvent: TMenuItem;
    miWeighingLW: TMenuItem;
    miWeighingIHM: TMenuItem;
    miWeighingMICrushDisk: TMenuItem;

    procedure SetUpForm;
    procedure HideModules;
//    function ActiveMovements ( MoveToRecord : Boolean ) : Boolean;
    procedure HideAll;
    procedure CheckMods;
    procedure ReportsCheckMods;
//    procedure ViewOrAddAnimal(DoWhat: TDoWhat);
    procedure SetCurrIndex(Value: String);
    procedure SetSortAsc(Value: Boolean);
//    procedure SetUpGrid;
//    procedure HideAnimalModules;
    procedure SetThePanelWidths;
    function  CheckAnimalOKforBreeding: Boolean;

    function ShowParlourLink : Boolean;
    function ShowRationCalcLink : Boolean;
    function ShowAccsDef : Boolean;
    procedure ShowCrushFile(Sender : TObject);

    procedure SetDataSources;
    procedure ReplaceClick(Sender : TObject);
    procedure LWClick(Sender : TObject);
    procedure InterHerdClick(Sender : TObject);
    procedure RefreshForm;
    function GetDefCountry: TCountry;
    procedure EnableBtn(Sender : TObject); //; Enable : Boolean);
    procedure LoadAllAnimals(bSaleDeaths : Boolean);
    procedure DoGridSort;
    procedure AppMinimize(Sender: TObject);
    procedure AppRestore (Sender: TObject);
    procedure PLActivate(var msg: TMessage); message WM_plActivate;
    procedure PLDeActivate(var msg: TMessage); message WM_plDeActivate;
    procedure BladeRegistered(var msg: TMessage); message WM_BladeRegistered;
    procedure BladeNotRegistered(var msg: TMessage); message WM_BladeNotRegistered;
    procedure ShowReportsScreen(var msg: TMessage); message WM_ShowReportsScreen;
    procedure ShowSucklerCowEvents(var msg: TMessage); message WM_ShowSucklerCowEvents;

    procedure WMQueryEndSession( var Message: TWMQueryEndSession); message WM_QUERYENDSESSION;
    procedure RefreshGridViewExternalData(var msg: TMessage); message WM_RefreshGridViewExternalData;
    procedure RunActionLists;
    procedure CheckSelectedHerd;
    procedure ResetColumnHeader(const ASelectedColumnIndex : Integer);
    procedure UpdateStatusBar;
    procedure ViewAnimal;
    procedure DoLocate(var Message:TMessage); message WM_Locate;

    procedure SetNatIDSearchText;

    procedure MovementsInClick(Sender : TObject);
    procedure CMMSPermitsClick(Sender : TObject);
    procedure CTSMovementsClick(Sender : TObject);
    procedure ShowGettingStarted(AUserView : Boolean = False);
    procedure ResetAnimalGridColumns;
    procedure StoreAnimalGridView;
    procedure RestoreAnimalGridView;
    procedure LoadAccountsCompanies();

    procedure SetGridStyles;

    procedure AddAllAnimalsToCart;
    procedure SetCartButtonStyle(const AStyleNormal : Boolean);

    procedure ShowFactorySales;
    procedure ShowMartImport;

    procedure ResizePageControl(APageControl : TcxPageControl);
    procedure BuildSearchColumnList;
    procedure SearchForAnimal;
    procedure SetSearchPanelVisible(const AVisible : Boolean);
    procedure ShowGroupEventClick(Sender : TObject);
    procedure ShowAWGroupEventClick(Sender : TObject);
    procedure ShowAWEventReview(Sender : TObject);
    procedure ShowGroupEvent(AEventType : Integer);
    procedure ShowAWGroupEvent(AEventType : Integer);
    procedure pmWeighingEventOnPopup(Sender: TObject);
    procedure UpdateBarcodeScannerControls;
   public
    { Public declarations }
    pbBar : TProgressbar;
    CheckCalfReg : Boolean;
    ReloadSetupQuery : Boolean;
    procedure Download;
    property CurrIndex : String read sCurrIndex write SetCurrIndex;
    property SortAsc : Boolean read iSortAsc write SetSortAsc;
    procedure SetUpQuery(const ReloadSQLFilter : Boolean = False);
    procedure SetUpCartQuery;
    procedure PartialSearch(const StartIndex : Integer = 0);
    procedure NameSearch(const AStartIndex : Integer = 0);
    procedure AddSearchNatIDData;
    procedure AddAnimal;
    procedure BuildOnFarmEventsMenu(AOwner : TMenu; AOwnerItem : TMenuItem);
  end;

var
   Menuform : TMenuForm;
   ActionList : TKActionList;

   SystemType : TSystemType;

implementation
uses
    Def, uSalesDeaths, DairyData, SetUpAnimals, Bullings, Services, PregDiag,
    Weighing, uHealth,uCalvings, uMediPurch, uMilkRec,
    uFilters, uSystem, uPurchases, uIndexes, uReTag, uGeneralRemark,
    uInterHerd, uTempMovements, HealthFilterU, ActionReminderFilt,
    ShellAPI, uCControl,
    // Added 11/06/1999 - FK
    BullReportsFilt, CowRepFilt, uCowEnrolFilt, BreedingAnalysisFilt, uHFSCalfReg,
    BrowseRegisterU, uHerdBrochureFlt, StockInHerdFilt, uDailyYieldGraph,
    uCalfRegFlt, uSalesReport, uTBTestDtRep, uSalesCatalogueFlt,
    uHeatServiceFilt, uUnitsSetUp, uMedicineSetUp, uCustomers, uSuppliers, uBuyers,
    uHerdSetUp, uDefaults, SetUpBreeds, uSetUpUsers, uSetUpMilkDisk, {uSlghtPremScr,}
    uMovPerRep,uWeighingFilt, uGroupSetUp, uLivestocksum,
    uEventsByGroup, uActiv, uMilkDiskReview, uBBPPurchScr,uPurchGrpRep,
    uFertIndicesRpt, QRExtra, HerdPassword,
    // ICBF event registration unit
    uICBFEventExport,
    // Factory Dockets
    uRemittance,
    // feed costs  19/5/00 - kr
    uManufacturers, uFeedPurch, uFeedAlloc, uFeedTypes,
    // Cattle movement notification report
//    uMoveNotify,
    // New Milk Recording Report SP 13/06/01
    uMilkRecSysScr,
    // Retag Screen SP 15/06/01
    uRetagScr, uRestrictAnimals, uGridPrint,
    // New Suckler 2002 unit
//    uSuckApplic,
    // New SucklFer 2002 Replacement Facility.
  //  uSuckSubstitute,
    // Import/Export Animal Facility
    uKImport, uAccDefComp, uMPEvents, MooreParkExport,
    { New Web Download Facility }
    uDownload,  FertAnalysisRpt, SaleEligibility, uAccsReps, { AnimalWaste, }
    uLiveStockValues, uCreateEvents, uSQLFilters, uQuotaMan, uPreSale, uHerdRec,
    uNokiaSettings, uGlobalSettings, uFeedAllocEdit, KRoutines,
    uCrushDiskWeigh, uPedUpgradeReport, uHerdSelect, uMilkTankRead, KDBRoutines,
    uCMMSPermits, uBlade, { uPhoneLinkDownload, } uRationPerformMonitor,uUpdateAnimalNo,
    uAPHISRegistration, uDairyHerdHealthCert, SCCAnalysis, uPDAReportDefaults,
    uPDAExportSynch, cxUtils, uGroupUpdate, uGroupReport, cxFilter, FileCtrl, LiveStkClass,
    uHerdLookup, uEventFilter, cxDBLookupComboBox, uImageStore,
    uReproductiveSummaryInterface, uUpdateTables, uFertilityBenchmarking,
    uCAFREFertListData, cxLookAndFeelPainters, cxGridCommon, uDueToBeCulled,
    uHUKIFarmEvents, uNutrientProductionProjectionRptScr, AnimalWaste,
    uMartImport, uGettingStarted, uNINutrientProductionProjectionRptScr,
    uCMMSFileImport,uMartImportTypes, PDAConst, uCalvingHistoryEntry,
    uICBFPCDownloadImporter, uSetupWasteProdRates,
    uAWEventsByGroup, uFertilityTreatmentsReport,
    uSetupFertPrograms, uFertTreatmentsReview,
    uTagReplacementForm, uVersionHistory, uAnimalCart, uCTSLoginInfo,
    uCTSBirthReg, uCTSMovementReg, uCTSCattleOnHolding, uGridColourSelection,
    uHerdStatistics, uMovementsInHealthDefaultsGrid, uStockValuations,
    uEmailClient, uMailBoxHelper, uAnimalCartView, uSelectDamID, uDataBackup,
    EventRecording, uFileAttachmentImport, uNationalID,
    uBeefSalesCatalogue, uUKSireRegister, uReports, udatafix, uPreferences,
    uBeefProfitMonitor, uBeefAISireRegister, uAWReviewEvents,
    uRemittanceConvert, uAnimalEventTransfer, LMDWebDownloadFormUnit,
    UserMsgConst, uKingswoodController, uDataDownload; {uTestForm;}


{$R *.DFM}

//Type
//    TkwCurrentScreen = (UsingPaddocks, UsingAnimals);

var
//   CurrentScreen : TkwCurrentScreen;
   OldWindowProc : Pointer; {Variable for the old windows proc}
//   MyMsg : DWord; {custom systemwide message}
   MyMsg : LongInt; {custom systemwide message}

function NewWindowProc(WindowHandle: hWnd; TheMessage: LongInt; ParamW: LongInt; ParamL: LongInt): LongInt stdcall;
begin
   if TheMessage = MyMsg  then
      begin
         // Tell the application to restore, let it restore the form
         SendMessage(Application.handle, WM_SYSCOMMAND, SC_RESTORE, 0);
         SetForegroundWindow(Application.Handle);
         // We handled the message - we are done
         Result := 0;
         exit;
      end;
   // Call the original winproc
   Result := CallWindowProc(OldWindowProc, WindowHandle, TheMessage, ParamW, ParamL);
end;

procedure TMenuForm.SetCurrIndex(Value: String);
var
   i : Integer;
   CurrField : String;
begin
   if (Value <> sCurrIndex) then
      sCurrIndex := Value
   else
      begin
         // Set the Sort Order Property
         if SortAsc then
            SortAsc := FALSE
         else
            SortAsc := TRUE;
      end;
end;

procedure TMenuForm.SetSortAsc(Value: Boolean);
begin
   if (Value <> iSortAsc) then
      iSortAsc := Value;
end;

procedure TMenuForm.ExitButtonClick(Sender: TObject);
begin
   Close;
end;

procedure TMenuForm.BullingButtonClick(Sender: TObject);
begin
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
      if CheckAnimalOKforBreeding then
         Bullings.ShowBulling(AddBulling); // Display the Bulling  Form
end;

procedure TMenuForm.WeightButtonClick(Sender: TObject);
begin
   {
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
   *****************************************************************************
   Removed by SP 12/12/2003 requested by GL (for Richard Bourns) to facilitate weighin recording
   during Bed & Breakfast movements
   *****************************************************************************
   }

   Weighing.ShowWeight(AddWeight);
end;

procedure TMenuForm.ReportsCheckMods;
var
   RegCountry : TCountry;
   HerdType : string;
begin
   HerdType := HerdLookup.GetHerdTypeAsString(StrToInt(cbDefaultHerd.Value));

   try
      RegCountry := WinData.DefCountry(StrToInt(cbDefaultHerd.Value));
   except
      RegCountry := Ireland;
   end;
   //First Hide All Uneeded:

{   if RegCountry = Ireland then
      rgCurrency.Visible := WinData.UseEuro
   else
      rgCurrency.Visible := False;
}
   gCowManagement.Visible := False;
   gQuotaPlanner.Visible := False;
   gbBeefManagement.Visible := False;
   // if ( Def.Definition.dUsePremiums ) then
   // Check if (1) BEEF Admin Basic - always Show
   // Herd Reports + Veterinary Reps

   // Check if (2) Suckler Cow Events
   if (Def.Definition.dUseManCal) then
      gCowManagement.Visible := True;

   // Check if (3) Quota Man
   if (Def.Definition.dUseQuotaMan) then
      begin
         { SP 03/12/2002 }
         gQuotaPlanner.Visible := True;
//         sbVeterinaryDropdown.Visible := False;
//         bMedicalTreatments.Width := 190;
         // bBullsUsedInHerd.Visible := True;
         //bBrowseSireReg.Visible := True;
         //bSireSelect.Visible := True;
         //gQuotaPlanner.Visible := True;

      end
   else
      begin
//         sbVeterinaryDropdown.Visible := True;
//         bMedicalTreatments.Width := 169;
      end;

   // Check if (4) Milk Recording
   if (Def.Definition.dUseMilkRec) then
      begin
         gMilkAnalysis.Visible := True;
      end
   else
      begin
         gMilkAnalysis.Visible := False;
         sbSCCAnalysisRpt.Visible := False;
         sbVetTreatmentPurch.Top := 41;
         sbHealthRG.Top := 66;
         gVetReps.Height := 94;
      end;

   // Check if (5) Pedigree
   if (Def.Definition.dUsePedigree) then
      gbPedigree.Visible := True
   Else
      gbPedigree.Visible := False;

   // Check if (6) BEEF MANAGEMENT (KVB's)
   if (Def.Definition.dUseBeefMan) then
      gbBeefManagement.Visible := True;

   { SP 03/12/2002 }
   if (Def.Definition.dUseManCal) AND (Def.Definition.dUseBeefMan) then
      begin
         sbWeighing2.Visible    := False;
         bBullsUsedInHerd.Top   := 148;
         sbHerdRG.Top           := 174;
         sbCalfPerformance.top  := 200;
         gCowManagement.Height  := 227;
      end;

//Joanne Tighe 4/5/04
   if WhichReg = NIreland then
      begin
         sbHerdReconciliation.Visible := False;
         bStockInHerd.Top := 69;
         gHerdReps.Height := 97;
      end
   else
      begin
         sbHerdReconciliation.Visible := True;
         gHerdReps.Height := 126;
         bStockInHerd.Top := 96;
      end;

{
   11/03/2009 [Dev V3.9 R6.6] /SP Program Change - Removed the option for Historical Livestock Nutrient Report ( for all countries "GL")

   if ( WhichReg = Ireland ) then
      begin
         sbLivestockNutrientProjection.Width := 169;
         sbLiveStockNutrientHistorical.Show;
      end
   else
      begin
         sbLivestockNutrientProjection.Width := 190;
         sbLiveStockNutrientHistorical.Hide;
      end;}
   sbLivestockNutrientProjection.Width := 190;
   sbLiveStockNutrientHistorical.Hide;

   if HerdType <> cDairyHerd then
      begin
         sbHUKIReg.Visible := False;
         sbHerdBrochure.Top := 18;
         sbSalesCatalogue.Top := 41;
         sbPedigreeRG.Top := 64;
         gbPedigree.Height := 91;
      end
   else
      begin
         sbHUKIReg.Visible := True;
         sbHerdBrochure.Top := 41;
         sbSalesCatalogue.Top := 64;
         sbPedigreeRG.Top := 87;
         gbPedigree.Height := 113;
      end;

   sbSalesPlannerReports.Visible := (WinData.SystemRegisteredCountry=NIreland);
   if sbSalesPlannerReports.Visible then
      sbSalesPlanner.Width := 169
   else
      sbSalesPlanner.Width := 190;

   sbProfitMonitorSummary.HighLight := (HerdType <> cDairyHerd);
end;

procedure TMenuForm.bReportsClick(Sender: TObject);
begin
   // 03/02/2009 [Dev V3.8 R 5.9 ] /SP : Program Change - New preference "Use New Report Layout Style",
   // allows user to toggle between old Report Screen and New Report Screen.

   if UPPERCASE(Preferences.ValueAsString[cGSReportLayoutStyle]) = 'OLDLAYOUT' then
      begin
         ReportsCheckMods;
         if sbReports.Caption = 'Re&ports' then
            begin
               WinData.ExportToPDA := FALSE;

      {         if rgCurrency.Visible then
                  if WinData.ReportInEuro then
                     rgCurrency.ItemIndex := 0
                  else
                     rgCurrency.ItemIndex := 1;
      }
               StoreImages.Clear;
               StoreImages.Add(sbReports.Glyph,nil);
               sbReports.Caption := 'E&xit';
               sbReports.Glyph := sbExit.Glyph;
               pReports.Align := Alclient;
               pFilter.Hide;
               pReports.BringToFront;
               pReports.Visible := True;
               EventIcons1Click(sender);

               sbExit.Enabled := False;
               Animals.Enabled := False;
               AnimalsEvents.Enabled := False;
               view1.Enabled := False;
               AnimalsSystem.Enabled := False;
      //         sbAnimalsPaddocks.Enabled := FALSE;
               NewVersion1.Enabled := False;
               miPhoneLink.Enabled := False;
               miPDALink.Enabled := False;
               sbGettingStarted.Enabled := False;

            end
         else
            begin
               pFilter.Show;
               sbReports.Glyph := nil;
               StoreImages.GetBitmap(0,sbReports.Glyph);
               sbReports.Caption := 'Re&ports';
               sbExit.Enabled := True;
      //         sbViewDetails.Enabled := True;
               Animals.Enabled := True;
               AnimalsEvents.Enabled := True;
               view1.Enabled := True;
               AnimalsSystem.Enabled := True;
               pReports.Visible := False;
      //         sbAnimalsPaddocks.Enabled := TRUE;
               miPhoneLink.Enabled := def.Definition.dUsePhoneLink;
               NewVersion1.Enabled := True;
               miPDALink.Enabled := miPhoneLink.Enabled; // PhoneLink module will include PDA
               EventIcons1Click(sender);
               sbGettingStarted.Enabled := True;

               Update;

               //if ( WinData.GlobalSettings.DisplayGettingStarted ) and ( ShowReportsScreenMsgCalled ) then
               if ( GettingStartedScrActive ) then
                  begin
                     GettingStartedScrActive := False;
                     ShowGettingStarted;
                  end;

            end;
      end
   else
      begin
         TfmReports.ShowReports(WinData.UserDefaultHerdID); // 08/01/09 [V3.9 R5.7] /SP Introduction of New Reports Screen Layout
         sbReports.Down := False;
         if ( GettingStartedScrActive ) then
            begin
               GettingStartedScrActive := False;
               ShowGettingStarted;
            end;
      end;

   Update;
end;

procedure TMenuForm.bMilkClick(Sender: TObject);
begin
   BreedingPageControl.Hide;
//   pBreeding.hide;
   pVet.hide;
   pMovements.hide;
   pManagement.hide;
   pManagement.show;
end;

procedure TMenuForm.ServiceClick(Sender: TObject);
begin
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
      // Check the Animal Sex
      if CheckAnimalOKforBreeding then
         // Display the Services Form
         Services.ShowService(AddService);
end;

procedure TMenuForm.PDsButtonClick(Sender: TObject);
begin
{var
   ServiceRequired : Boolean;
begin
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
      // Check the Animal Sex
      if CheckAnimalOKforBreeding then
        begin

           if WinData.GlobalSettings.MandatoryBreedingEvents then
              begin
                 If not Windata.Events.Locate('AnimalID;AnimalLactNo;EventType',
                                              VarArrayOf([WinData.AnimalFileByIDID.Value,
                                              WinData.AnimalFileByIDLactNo.Value,
                                              CServiceEvent]),[]) then
                    Messagedlg ('This Cow has no Service Record',mtError,[mbok],0)
                 else
                    PregDiag.ShowPD(AddPD)
              end
          else
             PregDiag.ShowPD(AddPD)
        end;
      }
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
      // Check the Animal Sex
      if CheckAnimalOKforBreeding then
        begin

           if WinData.GlobalSettings.MandatoryBreedingEvents then
              begin
                 If NOT Windata.Events.Locate('AnimalID;AnimalLactNo;EventType',
                                              VarArrayOf([WinData.AnimalFileByIDID.Value,
                                              WinData.AnimalFileByIDLactNo.Value,
                                              CServiceEvent]),[]) then
                    begin
                       Messagedlg ('This Cow has no Service Record',mtError,[mbok],0);
                       Abort;
                    end;
                 If NOT Windata.Events.Locate('AnimalID;AnimalLactNo;EventType',
                                              VarArrayOf([WinData.AnimalFileByIDID.Value,
                                              WinData.AnimalFileByIDLactNo.Value,
                                              CPregDiagEvent]),[]) then
                    PregDiag.ShowPD(AddPD)
                 else
                    Messagedlg ('This Cow has a PD Record',mtInformation,[mbok],0);
              end
           // Test the Animal hasn't already got a PD Record for this Lactation
           else if NOT Windata.Events.Locate('AnimalID;AnimalLactNo;EventType',
                                        VarArrayOf([WinData.AnimalFileByIDID.Value,
                                        WinData.AnimalFileByIDLactNo.Value,
                                        CPregDiagEvent]),[]) then
              PregDiag.ShowPD(AddPD)
           else
              Messagedlg ('This Cow has a PD Record',mtinformation,[mbok],0);
        end; // Joanne Tighe 29/3/2004

   // refresh grid for possible event ( To be Culled ) created by the PregDiag event properties.
end;

procedure TMenuForm.DryOffButtonClick(Sender: TObject);
var
   OKcontinue : Boolean;
   HerdType : THerdType;
begin
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
      // Check the Animal Sex
      if CheckAnimalOKforBreeding then
         begin
            OKContinue := TRUE;
            // 0 Lactation animals should have a Calving date to be dried Off
            if ( WinData.AnimalFileByIDLactNo.AsInteger = 0 ) then
               OkContinue := ( MessageDLG('Animal has no Calving Date (Lactation 0)' + #13 +
                                          'Do you want to continue',mtWarning,[mbYes,mbNo],0) = mrYes );
            if OKContinue then
               begin
                  if WinData.GlobalSettings.MandatoryBreedingEvents then
                     begin
                        if not ( WinData.CheckEventExists(WinData.AnimalFileByIDID.Value, WinData.AnimalFileByIDLactNo.Value, CServiceEvent) ) then
                           begin
                              Messagedlg ('This Cow has no Service Record',mtinformation,[mbok],0);
                              Abort;
                           end;
                        if not ( WinData.CheckEventExists(WinData.AnimalFileByIDID.Value, WinData.AnimalFileByIDLactNo.Value, CPregDiagEvent) ) then
                           begin
                              Messagedlg ('This Cow has no PD Record',mtinformation,[mbok],0);
                              Abort;
                           end;
                     end;

                   HerdType := HerdLookup.GetHerdType(WinData.AnimalFileByIDHerdID.AsInteger);

                      {begin
                         if not ( WinData.CheckEventExists(WinData.AnimalFileByIDID.Value, WinData.AnimalFileByIDLactNo.Value, CWeaningEvent) ) then
                            uMPEvents.ShowTheForm(EWNC, AddAWE, 'Weaning')
                         else
                            Messagedlg ('This animal has a Weaning record',mtinformation,[mbok],0);
                      end}

                   if HerdType <> htBeef then
                      begin
                         if not ( WinData.CheckEventExists(WinData.AnimalFileByIDID.Value, WinData.AnimalFileByIDLactNo.Value, CDryOffEvent) ) then
                            uHealth.ShowHealth(AddDryingOff)
                         else
                            Messagedlg ('This Cow has a Drying Off Record',mtinformation,[mbok],0);
                     end;
               end;
         end;
end;

procedure TMenuForm.HealthClick(Sender: TObject);
begin
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
      uHealth.ShowHealth(AddHealth);
end;

procedure TMenuForm.CalvingButtonClick(Sender: TObject);
    procedure ShowCalvingScr;
    var
       Country : TCountry;
    begin
       Country := WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger);
       if (Country = Ireland) then
          begin
             Windata.HerdIdentifierByHerdID(WinData.AnimalFileByIDHerdID.AsInteger);
          end
       else if ( WinData.GlobalSettings.NatIDToAnimalNo ) and ( Country = NIreland ) then
          begin
             // if NI herd, check for existance of Herd Identifier. If found
             // we can use this number to determine what value (from the natidnum)
             // should be inserted into the animalno field.
             if WinData.OwnerFile.Locate('ID', WinData.AnimalFileByIDHerdID.AsInteger,[ ]) then
                begin
                   if WinData.OwnerFileHerdIdentifier.AsString = '' then
                      begin
                         if MessageDlg('Your Herd Designator number cannot be found. '+#13#10+
                                       'This number is used to create the calf number.'+#13#10+#13#10+
                                       'Do you want to enter your Herd Designator number now?',mtConfirmation,[mbYes,mbNo],0) = idYes then
                            begin
                               uHerdSetup.ShowTheForm(False, 'HerdIdentifier');
                            end;
                      end;
                end;
          end;

       CheckCalfReg := False;
       uCalvings.ShowCalvings(Add);

       if WinData.ShowCalfRegReminder then
          begin
             WinData.ShowCalfRegReminder := False;
             if MessageDlg('Do you want to complete Calf Registration for this calf?', mtConfirmation, [mbYes,mbNo],0) = idYes then
                begin
                   sbRegistration.Click;
                end;
          end;

    end;
var
   HerdType : THerdType;
begin
   HerdType := HerdLookup.GetHerdType(WinData.AnimalFileByIDHerdID.AsInteger);
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
         begin
            // Check the Animal Sex
            if CheckAnimalOKforBreeding then
               begin
                  // check old enough to breed

                  if WinData.HerdSpecies = cSpecies_Goats then
                     begin
                        { Check GOAT under 9 months }
                        { V3.8 R0.5 }
                        if (WinData.AnimalFileByIdDateOfBirth.AsDateTime > IncMonth(Date, -9)) then
                            raise errormsg.CreateFmt(cCalvingAnimalUnder9Mths,[WinData.AnimalFileByIDNatIDNum.AsString, 9, FormatDate(Date,dsIrish)])
                        else if (WinData.AnimalFileByIdDateOfBirth.AsDateTime > IncMonth(Date, -18)) then
                           begin
                              if MessageDlg(Format(cCalvingAnimalUnder18Mths,[WinData.AnimalFileByIDNatIDNum.AsString,18,FormatDate(Date,dsIrish)]),mtWarning,[mbYes,mbNo],0) = mrNo then
                                 Abort;
                           end;
                     end
                  else
                     begin
                        if (WinData.AnimalFileByIdDateOfBirth.AsDateTime > IncMonth(Date, -12)) then
                           raise errormsg.CreateFmt(cCalvingAnimalUnder12Mths,[WinData.AnimalFileByIDNatIDNum.AsString, 12, FormatDate(Date,dsIrish)])
                        else
                          { Check if animal is under 18 months old, if so warn user }
                          { V3.8 R0.5 }

                          if (WinData.AnimalFileByIdDateOfBirth.AsDateTime > IncMonth(Date, -18)) then
                             if MessageDlg(Format(cCalvingAnimalUnder18Mths,[WinData.AnimalFileByIDNatIDNum.AsString,18,FormatDate(Date,dsIrish)]),mtWarning,[mbYes,mbNo],0) = mrNo then
                                Abort;
                          { # V3.8 R0.5 }
                     end;

                   if ( HerdType = htDairy ) then { A check if Dry Off required for dairy herds }
                      begin
                         if ( WinData.CheckEventExists(WinData.AnimalFileByIDID.Value, WinData.AnimalFileByIDLactNo.Value, CDryOffEvent) ) then
                            ShowCalvingScr
                         { 25/02/2009 V3.9 R6.5 Check if animal animal is cow before dry off check }
                         else if ( WinData.AnimalFileByIDLactNo.Value > 0 ) then
                            begin
                               if ( WinData.GlobalSettings.MandatoryBreedingEvents ) or ( WinData.GlobalSettings.MandatoryDryOffEvent ) then
                                  Messagedlg('This Cow has no Drying Off Record',mtinformation,[mbok],0)
                               else
                                  ShowCalvingScr
                            end
                         else
                            ShowCalvingScr
                      end
                   else { A check for Dry Off is not required for non dairy herds. }
                      ShowCalvingScr
               end;
         end;
   EventGridAnimalEventsView.DataController.RefreshExternalData; // in case of CONDITION SCORE / HEALTH event recorded at time of calving.
end;

procedure TMenuForm.PurchButtonClickClick(Sender: TObject);
begin
   TfMediPurch.Execute;
end;

procedure TMenuForm.sbAddClick(Sender: TObject);
begin
   AddAnimal;
end;

procedure TMenuForm.HideModules;
begin
   bBreeding.Visible := False;      // Button
   lBreeding1.Visible := False;     // Line
   lBreeding2.Visible := False;     // Line
//   pBreeding.Visible := False;      // Panel
   BreedingPageControl.Hide;

   Breeding1.Visible := False;      // Menu
   pICBF.Visible:= False;
   pCalfReg.Visible:= False;
//   pP3.Visible:= False;
//   pP2.Visible:= False;
   pM2.Visible:= False;
   pM4.Visible:= False;
   Suckler1.Visible := False;
   Management1.Visible := False;
   AnimalWeighing1.Visible := False;
   CowManagementReports1.Visible := False;
//   BullReports1.Visible := False;
   bManagement.Visible := False;
   MilkRecording1.Visible := False;
   MilkAnalysisReports1.Visible := False;
   PedigreeReports1.Visible := False;
   BrowseSireRegister1.Visible := False;
   SireSelection1.Visible := False;
   QuotaPlanner1.Visible := False;
   BeefManagement1.Visible := False; // Keiths MOD
   Slaughter1.Visible := False;
   Presale1.Visible := False;
//   sbWeight.Width:=115;
//   sbLiveWeight.Width:=0;
//   gVetReps.Height:= 73;
end;

procedure TMenuForm.CheckMods;
var
  SysRegCountry : TCountry;
begin
   bPremium.Top := 140;
   bPremium.Visible := True;
   bOtherEvents.Top := 168;
   bOtherEvents.Visible := True;
   bManagement.Top := 196;
   bManagement.Visible := True;

   // Check if (1) BEEF Admin Basic
   if (Def.Definition.dUsePremiums) then
      begin
         bPremiumClick(nil);
         // Feed Purchases available with Admin
         pFeedPurch.Visible      := True;
         FeedPurchases1.Visible  := True;
         // Vet Purchases available with Admin
         pVetPurch.Visible       := True;
         Purchases1.Visible      := True;
         // Vet Treatments available with Admin
         pVetTreat.Visible       := True;
         Treatments1.Visible     := True;
      end;

   // Check if (2) Suckler Cow Events
   if (Def.Definition.dUseManCal) then
      begin
         bBreeding.Visible       := True;
         bManagement.Top               := 196;
         bManagement.Visible           := True;
//         LManagement1.Visible          := True;
//         LManagement2.Visible          := True;
         { DO NOT CHANGE THIS !!}

         pCalfReg.Show;

//         if WhichReg = Ireland then
//            pICBF.Show
//         else
//            pICBF.Hide;

         { DO NOT CHANGE THIS !!}
         pM1.Visible                   := True;
         Breeding1.Visible             := True;
         Suckler1.Visible              := True;
         Management1.Visible           := True;
         AnimalWeighing1.Visible       := True;
         CowManagementReports1.Visible := True;
         ReLinkCalves1.Visible         := True;
//         pOtherEvents.Visible             := True;
     end
   else
      begin
         pCalfReg.Visible              := False;
         pICBF.Visible                 := False;
         ReLinkCalves1.Visible         := False;

         bManagement.Visible           := False;
//         LManagement1.Visible          := False;
//         LManagement2.Visible          := False;
//         pOtherEvents.Visible          := False;
      end;

   // Check if (3) Quota Man
   if (Def.Definition.dUseQuotaMan) then
      begin
         QuotaPlanner1.Visible         := True;
         BrowseSireRegister1.Visible   := True;
         SireSelection1.Visible        := True;
         pm4.Visible                   := True;
      end
   else
      pm4.Visible                      := False;

   // Check if (4) Milk Recording
   if (Def.Definition.dUseMilkRec) then
      begin
         Dairy1.Visible                := True;
         MilkDiskParameters1.Visible   := True;
         pFeedAlloc.Visible            := True;
         FeedTypes1.Visible            := True;
         FeedAllocation1.Visible       := True;
         Manufacturers1.Visible        := True;
      end
   else
      begin
         Dairy1.Visible                := False;
         MilkDiskParameters1.Visible   := False;
         pFeedAlloc.Visible            := False;
         FeedTypes1.Visible            := False;
         FeedAllocation1.Visible       := False;
         Manufacturers1.Visible        := False;
      end;

   // Check if (5) Pedigree
   if (Def.Definition.dUsePedigree) then
      PedigreeReports1.Visible         := True
   else
      PedigreeReports1.Visible         := False;

   // Check if (6) BEEF MANAGEMENT (KVB's)
   if (Def.Definition.dUseBeefMan) then
      begin
         bManagement.Visible           := True;
         BeefManagement1.Visible       := True;
         Slaughter1.Visible            := True;
         Presale1.Visible              := True;
//         sbWeight.Width:=100;
//         sbLiveWeight.Width:=16;
         pBeefPurch.Visible := True; // SP 20/06/2002
         pGroupSales.Visible := True; // SP 26/10/2006
         pFeedAlloc.Visible            := True;
         FeedTypes1.Visible            := True;
         FeedAllocation1.Visible       := True;
         Manufacturers1.Visible        := True;
      end
   else
      begin
         BeefManagement1.Visible       := False;
         Slaughter1.Visible            := False;
         Presale1.Visible              := False;
//         sbWeight.Width:=115;
//         sbLiveWeight.Width:=0;
         pFeedAlloc.Visible            := False;
         FeedTypes1.Visible            := False;
         FeedAllocation1.Visible       := False;
         Manufacturers1.Visible        := False;
         pBeefPurch.Visible := False; // SP 20/06/2002
         pGroupSales.Visible := False; // SP 26/10/2006
      end;

   if ( Def.Definition.dUseMilkRec ) OR ( Def.Definition.dUseBeefMan ) then   // Added by KB 24/10/00 FeedPurch/FeedAlloc to appear ONLY with MilkRec & BeefMan Mods.
      begin
         cbFeedEvents.Visible          := True; // SP 29/05/2003
         pFeedAlloc.Visible            := True;
         FeedTypes1.Visible            := True;
         FeedAllocation1.Visible       := True;
         Manufacturers1.Visible        := True;
      end
   else
      begin
         cbFeedEvents.Visible          := False; // SP 29/05/2003
         pFeedAlloc.Visible            := False;
         FeedTypes1.Visible            := False;
         FeedAllocation1.Visible       := False;
         Manufacturers1.Visible        := False;
      end;

   if (Def.Definition.dUseManCal) OR (Def.Definition.dUseBeefMan) then
      begin
         GroupSetup1.Visible := True;
         tsAnimalGroups.Visible := True;
         //pBeefSales.Visible := True; // SP 09/03/2005 Requested by Gerry
      end
   else
      begin
         GroupSetup1.Visible := False;
         tsAnimalGroups.Visible := False;
         //pBeefSales.Visible := False; // SP 09/03/2005 Requested by Gerry
      end;

   pBeefSales.Visible := True; // SP 06/09/2006 Requested by Gerry

   // Do a check for the Parlour exe, if ParLink.exe is in Herd Dir then show Parlink Icon
   if ShowRationCalcLink then
      pm9.Visible := True
   else
      pm9.Visible := False;

   // Do a check for the RationCalc exe, if ParLink.exe is in Herd Dir then show RationCalc link Icon
   if ShowParlourLink then
      pm7.Visible := True
   else
      pm7.Visible := False;

   sbCMMSRecon.Caption := 'Reconcile Herd';
   SysRegCountry := WinData.SystemRegisteredCountry;

   if SysRegCountry = England then
      sbCMMSRecon.Caption := 'CTS Cattle On...';


   if ( SysRegCountry = NIreland ) then
      begin
         sbMartMovements.Caption := 'APHIS E Permit';
         sbMartMovements.OnClick := sbAPHISEPermitClick;
      end
   else
      begin
         sbMartMovements.OnClick := sbMartMovementsClick;
         sbMartMovements.Caption := 'Mart Files';
      end

{   if not (Def.Definition.dBeefAdmin) then
      begin
         PremiumPlanner1.Visible := False;
         gbPremiumPlanner.Visible := False;
         gbSalesEligibility.Top := gbPremiumPlanner.Top;
        gVetReps.Top := gbSalesEligibility.Top+gbSalesEligibility.Height+4;
      end
   else
      begin
         PremiumPlanner1.Visible := True;
         gbPremiumPlanner.Visible := True;
         gbPremiumPlanner.Top := 159;
         gbSalesEligibility.Top := 261;
         gVetReps.Top := 361;
      end;
   }
end;

procedure TMenuForm.SetUpForm;
var
   SystemRegCountry : TCountry;
   RegCountry : TCountry;
   HerdType : string;
   ResetBeefCols : Boolean;
begin
   SystemRegCountry := WinData.SystemRegisteredCountry;
   if SystemType = stPDAStandalone then
      begin
         vSplitter.Hide;
         Gradient.Height := 0;
         pGrid.Align := alClient;
         sbReports.Visible := False;
         ToolbarSep973.Visible := False;
         sbAnimalsPaddocks.Visible := False;
         ToolbarSep978.Visible := False;
         sbSheep.Visible := False;
         ToolbarSep977.Visible := False;
         sbAccounts.Visible := False;
         ToolbarSep976.Visible := False;
         sbMachinery.Visible := False;
         tsMachinery.Visible := False;
         sbGettingStarted.Visible := False;
         tsGettingStart.Visible := False;
         //Animals.Visible := False;
         AnimalsEvents.Visible := False;
         View1.Visible := False;
         AnimalsReports.Visible := False;
         miPhoneLink.Visible := False;
         sbHerdStats.Visible := False;
         PDAReports.Visible := True;
      end
   else
      begin
         try
            PDAReports.Visible := False;
            WinData.UserDefaultHerdID := StrToInt(cbDefaultHerd.Value);
            RegCountry := WinData.DefCountry(WinData.UserDefaultHerdID);
         except
            RegCountry := Ireland;
         end;

         sbGettingStarted.Visible := ( WinData.GlobalSettings.DisplayGettingStarted );
         tsGettingStart.Visible := sbGettingStarted.Visible;
         {GettingStarted1.Visible := RegisteredCountry = Ireland;// Display only if country is Ireland}
         sbMachinery.Visible := not sbGettingStarted.Visible;
         tsMachinery.Visible := not sbGettingStarted.Visible;;

         if not sbGettingStarted.Visible then
            begin
               // only show machinery link when getting started is not visible and machinery program exists
               MachineryLink.Visible := FileExists(cMachineryExePath);
               N19.Visible := MachineryLink.Visible;
            end;

         WhichReg := RegCountry;
         HerdType := UpperCase(WinData.UserTypeOfHerd);
      //   if not ( HerdType in ['DAIRY','BEEF','SUCKLER'] ) then
      //      HerdType := 'DAIRY';

         sbAnimalsPaddocks.Enabled := FileExists(ExtractFilePath(ParamStr(0))+'paddocks.exe '); // MK 19.08.09
         sbMachinery.Enabled := FileExists('C:\Machinery\Machinery.exe');  // MK 23.03.07
         sbAccounts.Enabled := FileExists('C:\Kingsacc\Winaccs.exe');   // MK 23.03.07
         sbaccsdbs.Visible := sbAccounts.Enabled;
         if sbAccounts.enabled then
            LoadAccountsCompanies();
         sbSheep.Enabled := FileExists('C:\KSheep\Ksheepw.exe');   // MK 23.03.07
         pGroupUpdate.Visible := (Def.Definition.dUseManCal) OR (Def.Definition.dUseBeefMan);

         Self.Enabled := False;
         HideModules;
         DefaultAccsCompany1.Visible := ShowAccsDef;

         if WhichReg <> Ireland then
            sbREPSReport.Caption := 'Monthly Livestock Report'
         else
            sbREPSReport.Caption := 'REPS Report';

         if WhichReg = Ireland then
            begin
               sbHUKIReg.Caption := 'IHFA Upgrade Report';
               CalfRegImage.Picture := ImgBandon.Picture;
               sbRegistration.caption := 'Calf Registration';
               imgPedigreeReg.Picture := imgICBFEvents.Picture;
               sbPedigreeReg.Caption := 'ICBF/Breed Soc.';
               if HerdType <> UPPERCASE(cBeefHerd) then
                  begin
                     bPremium.Caption := 'Register/Calf Reg';
                  end
               else
                  begin
                     bPremium.Caption := 'Register';
                  end;
               sbCMMSMovementsIn.Caption := 'Movmnt. Permits';
               sbCMMSMovementsIn.OnClick := CMMSPermitsClick;
               ImgMovements.Picture.Bitmap := nil;
               ImgMovements.Picture := ImgCMMSPermits.Picture;
               sbAHPISMovementsIn.Visible := False;
               sbCMMSMovementsIn.Width := 115;
            end
         else if WhichReg = NIreland then
            begin
               miDARDDairyFertilityBenchmarks.Visible := True;
               N13.Visible := True;
               CalfRegImage.Picture.Bitmap := nil;
               ImageList1.GetBitmap(1, CalfRegImage.Picture.Bitmap);
               sbRegistration.caption := 'APHIS Reg.';
               sbHUKIReg.Caption := 'HUKI Registration';
               imgPedigreeReg.Picture := imgHUKICalfReg.Picture;
               sbPedigreeReg.Caption := sbHUKIReg.Caption;

               if HerdType <> UPPERCASE(cBeefHerd) then
                  begin
                     bPremium.Caption := 'Register/Calf Reg';
                  end
               else
                  begin
                     bPremium.Caption := 'Register';
                  end;

               sbCMMSMovementsIn.Caption := 'APHIS Movement';
               sbCMMSMovementsIn.OnClick := MovementsInClick;
               sbAHPISMovementsIn.Visible := False;
               sbCMMSMovementsIn.Width := 115;
               ImgMovements.Picture.Bitmap := nil;
               ImgMovements.Picture := ImgCMMSPermits.Picture;
            end
         else if WhichReg = England then
            begin
               miDARDDairyFertilityBenchmarks.Visible := False;
               N13.Visible := False;
               CalfRegImage.Picture.Bitmap := nil;
               ImageList1.GetBitmap(2, CalfRegImage.Picture.Bitmap);
               sbRegistration.caption := 'CTS Birth Reg.';
               sbHUKIReg.Caption := 'HUKI Registration';
               if HerdType <> UPPERCASE(cBeefHerd) then
                  begin
                     bPremium.Caption := 'Register/Calf Reg';
                  end
               else
                  begin
                     bPremium.Caption := 'Register';
                  end;
               imgPedigreeReg.Picture := imgHUKICalfReg.Picture;
               sbPedigreeReg.Caption := 'HUKI Registration';
               sbCMMSMovementsIn.Caption := 'CTS Move.';
               sbCMMSMovementsIn.OnClick := CTSMovementsClick;
               sbAHPISMovementsIn.Visible := True;
               sbCMMSMovementsIn.Width := 100;
               ImgMovements.Picture.Bitmap := nil;
               ImageList1.GetBitmap(2, ImgMovements.Picture.Bitmap);
            end
         else
            begin
               miDARDDairyFertilityBenchmarks.Visible := False;
               N13.Visible := False;
               ImageList1.GetBitmap(1, CalfRegImage.Picture.Bitmap);
               sbRegistration.caption := 'APHIS Reg.';
               sbHUKIReg.Caption := 'HUKI Registration';
               if HerdType <> UPPERCASE(cBeefHerd) then
                  begin
                     bPremium.Caption := 'Register/Calf Reg';
                  end
               else
                  begin
                     bPremium.Caption := 'Register';
                  end;
               //pAPHISMovementsIn.Hide;
               imgPedigreeReg.Picture := imgHUKICalfReg.Picture;
               sbPedigreeReg.Caption := 'HUKI Registration';
               ImgMovements.Picture.Bitmap := nil;
               ImgMovements.Picture := ImgCMMSPermits.Picture;
               sbAHPISMovementsIn.Visible := False;
               sbCMMSMovementsIn.Width := 115;
            end;
         // 1 Pic  = 119  // 2 Pics = 235   // 3 Pics = 351   // 4 Pics = 467  // 5 Pics = 579
         // All Buttons etc have been hidden (HideModules), these show them back

         if WhichReg = Ireland then
            begin
               CreateMooreParkExportFile1.Visible := True;
               CreateCISExportFile1.Visible := False;

            end
         else
            begin
               CreateMooreParkExportFile1.Visible := False;
               CreateCISExportFile1.Visible := True;

               CreateCISExportFile1.Enabled := Def.Definition.dUseMilkRec;

            end;

         if HerdType = 'DAIRY' then
            begin
               bBreeding.Caption := 'Breeding/Welfare';
               sbDryingOff.Caption := 'Drying Off';
               ImgMilking.Picture.Assign(imgDryOff.Picture);
               sbDryingOff.Visible := True;
               sbDryOffEvent.Visible := True;
               ImgMilking.Visible := True;

               tsBreeding.Visible := True;
               BreedingPageControl.ActivePage :=  tsBreeding;
//               BreedingPageControl.HideTabs := True;
               tsOtherBreeding.TabVisible := True;

               //Image14.Left := 462;
               //sbCalving.Left := 463;
               //btnOtherEvents.Left := sbCalving.Left+sbCalving.Width-1;
//               BreedingPageControl.Width := 582;
               pDryOff.Show;
               BreedingPageControl.Width := 582;



               CheckMods;
               if (Def.Definition.dUseManCal) then
                  begin
                    // if WhichReg <> Ireland then
                      //  pICBF.Hide
//                     else
//                        pICBF.Show;

                     pCalfReg.Show
                  end
               else
                  begin
                     pM4.Hide;
                     pCalfReg.Hide;
                     pICBF.Hide;
                  end;

               if (Def.Definition.dUseQuotaMan) then
                   begin
                      //pMooreParkOtherEvents.Show;
                      pM4.Show;
                   end
               else
                  begin
                     //pMooreParkOtherEvents.Hide;
                     pM4.Hide;
                  end;

               if (Def.Definition.dUseMilkRec) then
                  begin
                     pM2.Show;
//                     sbWeight.Width := 115;
//                     sbLiveWeight.Width := 0;
                     Management1.Visible := True;
                     MilkRecording1.Visible := True;
                     MilkAnalysisReports1.Visible := True;
                     BrowseSireRegister1.Visible := True;
                     SireSelection1.Visible := True;
                     QuotaPlanner1.Visible := True;
                  end;

               if (Def.Definition.dUseBeefMan) then
                  begin
                     pM4.Hide;
                     pM2.Hide;
//                     sbWeight.Width := 115;
//                     sbLiveWeight.Width := 0;
                  end;

               if (Def.Definition.dUseBeefMan) and (Def.Definition.dUseMilkRec) then
                  begin
                     pM2.Show;
                     pM4.Show;
//                     sbWeight.Width     := 100;
//                     sbLiveWeight.Width := 16;
                  end;

      //         if WhichReg <> Ireland then
        //          pHerdRec.Visible := False
          //     else
                  pHerdRec.Visible := True;
                  pICBF.Show;

               bBreedingClick(nil);
            end
         else if HerdType = 'SUCKLER' then
            begin
               bBreeding.Caption := 'Breeding/Welfare';
               sbDryingOff.Caption := 'Drying Off';
               ImgMilking.Picture.Assign(imgDryOff.Picture);
               sbDryingOff.Visible := True;
               sbDryOffEvent.Visible := True;
               ImgMilking.Visible := True;

               tsOtherBreeding.TabVisible := True;
               pDryOff.Hide;
               BreedingPageControl.Width := 486;


               //ImgMilking.Picture := imgCalfWeaning.Picture;
               CheckMods;
               if (Def.Definition.dUseManCal) then
                  begin
                     Suckler1.Visible  := True;
//                     if WhichReg <> Ireland then
//                        pICBF.Hide
  //                   else
                     //pICBF.Show;
                     pICBF.Show;

                     pCalfReg.Show
                  end
               else // for mod 1, suckler herd.
                  begin
                     pCalfReg.Hide;
                     pICBF.Hide;
                     pM4.Hide;
//                     sbWeight.Width:=115;
//                     sbLiveWeight.Width:=0;
                  end;

               if (Def.Definition.dUseQuotaMan) then
                  pM4.Show
               else
                  pM4.Hide;

               //case of Suckler herd with KVB's Beef Management
               pM2.Hide;
               if (Def.Definition.dUseBeefMan) Then
                  begin
                     pM4.hide;
//                     sbWeight.Width:=115;
//                     sbLiveWeight.Width:=0;
                  end;

{               if (Def.Definition.dUseQuotaMan) then
                   begin
                      pMooreParkOtherEvents.Show;
                   end
               else
                  begin
                     pMooreParkOtherEvents.Hide;
                  end;
}
      //         if WhichReg = NIreland then
      //            pHerdRec.Visible := False
      //         else
                  pHerdRec.Visible := True;
               bBreedingClick(nil);
            end
         else if HerdType = 'BEEF' then
            begin
               CheckMods;
//               pMooreParkOtherEvents.Hide;
               pCalfReg.Hide;
               pICBF.Hide;
               Suckler1.Visible  := False;
               bBreeding.Visible := False;
               Breeding1.Visible := False;
      //         pP2.Hide;

               if (Def.Definition.dUseQuotaMan) then
                  pM4.Hide;

               if (Def.Definition.dUseBeefMan) OR (Def.Definition.dUseManCal)  then // KVB's Mod
                  begin
                     AnimalWeighing1.Visible := True;
                     MilkRecording1.Visible := False;
//                     sbWeight.Width:=100;
//                     sbLiveWeight.Width:=16;
                     pM1.Show;
                     pM2.hide;
                  end;

      {         if not Def.Definition.dBeefAdmin then
                  begin
      //                bPremium.Visible := False;
      //                LPremium.Visible := False;
                      bManagement.Top := bOtherEvents.Top;
                      bOtherEvents.Top := bPremium.Top;
                      lManagement1.Hide;
                      lManagement2.Hide;
                      bMovements.Click;
                  end
               else
                  begin
      //               bPremium.Visible := True;
      //               LPremium.Visible := True;
      //               bPremium.Top  := 140;
                     bOtherEvents.Top := 168;
                     bManagement.Top := 196;
                     lManagement1.Show;
                     lManagement2.Show;
                  end;
      }
      //         if WhichReg = NIreland then
      //            pHerdRec.Visible := False
      //       else
                  pHerdRec.Visible := True;
                bPremiumClick(nil);
             end;
//          else
//             sbLiveWeight.Width:=16;

         SetThePanelWidths;
         if WinData.UseScanner then
            begin
               imgBarcode.Visible := True;
               //lNatIDNumSearch.Caption := 'Scan Nat. Id. No.';
            end
         else
            begin
               imgBarcode.Visible := False;
               //lNatIDNumSearch.Caption := 'Nat. Id. No.';
            end;

         if (Def.Definition.dUseManCal) then
            // breeding herd
            begin
               sbAddAnimalType.DropDownMenu := pmAddAnimalType;
{              if WinData.SystemRegisteredCountry = Ireland then
                  pmAddAnimalType.Items[1].Caption := 'AI Sires (ICBF)'
               else
                  pmAddAnimalType.Items[1].Caption := 'AI Sires';}

            end
         else
            // Non-breeding herd
            sbAddAnimalType.DropDownMenu := nil;
      end;

   Self.Enabled := True;
   ICBFPCDownload1.Visible := (pICBF.Visible) and (sbPedigreeReg.Caption = 'ICBF/Breed Soc.');

   CreateEBIValuesYoungstockonly1.Visible := (SystemRegCountry=Ireland);
   CMMSFileImport1.Visible := (SystemRegCountry=Ireland);
   UpdateAnimalNumberField1.Visible := (SystemRegCountry=Ireland);
   PremiumHistoryReport1.Visible := (SystemRegCountry=Ireland);
   DefaultHealthEventsAPHISMovementsIn1.Visible := (SystemRegCountry<>Ireland);

   if (SystemRegCountry=Ireland) and ( Def.Definition.dUseMilkRec ) then
      begin
         cxAnimalGridViewEBI.Visible := True;
         cxAnimalGridViewEBI.Hidden := False;
      end;

   if HerdType = cBeefHerd then
      begin
         cxAnimalGridViewHerdBookNo.Visible := False;
         cxAnimalGridViewHerdBookNo.Hidden := True;

         cxAnimalGridViewName.Visible := False;
         cxAnimalGridViewName.Hidden := True;
      end
   else
      begin
         cxAnimalGridViewHerdBookNo.Hidden := False; // if previous herd was beef and subsequently changed
         cxAnimalGridViewName.Hidden := False;
      end;

   if (SystemRegCountry=Ireland) then
      begin
         sbTagReplacement.Caption := 'Order Tags';
         sbTagReplacement.Width := 100;
         sbTagReplacements.Visible := True;
         sbTagReplacement.OnClick := sbTagReplacementClick;
      end
   else
      begin
         sbTagReplacement.Caption := 'Retagging';
         sbTagReplacement.Width := 115;
         sbTagReplacements.Visible := False;
         sbTagReplacement.OnClick := Retagging2Click;
      end;

   if WinData.GlobalSettings.DisplayMovementFeedColsInGridView then
      begin
         GetRegValue(Reg_DefaultPath + 'Misc\' + DataDir + '\' + 'ResetBeefGridCols', 'Reset', ResetBeefCols );

         if ResetBeefCols then   // This value is set to true when DisplayMovementFeedColsInGridView value is changed in uGlobalSettings.pas
            begin
               SetRegValue(Reg_DefaultPath + 'Misc\' + DataDir + '\' + 'ResetBeefGridCols', 'Reset', False );
               cxAnimalGridViewDaysOnFarm.Hidden := False;
               cxAnimalGridViewDaysOnFarm.Visible := True;
               if (SystemRegCountry=Ireland) then
                  begin
                     cxAnimalGridViewPurchFQASDays.Hidden := True;
                     cxAnimalGridViewPurchFQASDays.Visible := False;
                     cxAnimalGridViewPurchFQAS.Hidden := True;
                     cxAnimalGridViewPurchFQASDays.Visible := False;
                  end
               else
                  begin
                     cxAnimalGridViewPurchFQASDays.Hidden := False;
                     cxAnimalGridViewPurchFQASDays.Visible := True;
                     cxAnimalGridViewPurchFQAS.Hidden := False;
                     cxAnimalGridViewPurchFQASDays.Visible := True;
                  end;
              cxAnimalGridViewFeedGrpDesc.Hidden := False;
              cxAnimalGridViewFeedGrpDesc.Visible := True;

              cxAnimalGridViewSaleDate.Hidden := False;
              cxAnimalGridViewSaleDate.Visible := True;

              cxAnimalGridViewPurchComment.Hidden := False;
              cxAnimalGridViewPurchComment.Visible := True;

              cxAnimalGridViewPurchFQAS.Hidden := False;
              cxAnimalGridViewPurchFQAS.Visible := True;

              cxAnimalGridViewLotNumber.Hidden := False;
              cxAnimalGridViewLotNumber.Visible := True;

              cxAnimalGridViewSupplierName.Hidden := False;
              cxAnimalGridViewSupplierName.Visible := True;

              cxAnimalGridViewPurchPrice.Hidden := False;
              cxAnimalGridViewPurchPrice.Visible := True;

              cxAnimalGridViewPurchDate.Hidden := False;
              cxAnimalGridViewPurchDate.Visible := True;
           end;
      end
   else
      begin
         cxAnimalGridViewDaysOnFarm.Hidden := True;
         cxAnimalGridViewDaysOnFarm.Visible := False;

         cxAnimalGridViewPurchFQASDays.Hidden := True;
         cxAnimalGridViewPurchFQASDays.Visible := False;

         cxAnimalGridViewFeedGrpDesc.Hidden := True;
         cxAnimalGridViewFeedGrpDesc.Visible := False;

         cxAnimalGridViewSaleDate.Hidden := True;
         cxAnimalGridViewSaleDate.Visible := False;

         cxAnimalGridViewPurchComment.Hidden := True;
         cxAnimalGridViewPurchComment.Visible := False;

         cxAnimalGridViewPurchFQAS.Hidden := True;
         cxAnimalGridViewPurchFQAS.Visible := False;

         cxAnimalGridViewLotNumber.Hidden := True;
         cxAnimalGridViewLotNumber.Visible := False;

         cxAnimalGridViewSupplierName.Hidden := True;
         cxAnimalGridViewSupplierName.Visible := False;

         cxAnimalGridViewPurchPrice.Hidden := True;
         cxAnimalGridViewPurchPrice.Visible := False;

         cxAnimalGridViewPurchDate.Hidden := True;
         cxAnimalGridViewPurchDate.Visible := False;
      end;

//   eNameSearch.Visible := HerdType <> cBeefHerd;
//   lSearchAnimalName.Visible := eNameSearch.Visible;
//   sbNameLocate.Visible := eNameSearch.Visible;
//   sbNameReset.Visible := eNameSearch.Visible;

   gbAnimalComments.Visible := WinData.GlobalSettings.DisplayAnimalComments;
   AnimalCommentsSplitter.Visible := gbAnimalComments.Visible;

   ResizePageControl(pcMultipleAnimals);
   UpdateStatusBar;
end;

procedure TMenuForm.SetThePanelWidths;
   function SetTheWidth(CPanel: TPanel) : Integer;
   var
      i,
      PanelWidth : Integer;
   begin
      PanelWidth := 0;
      with CPanel do
         begin
            for i := 0 to ControlCount-1 do
               begin
                  if (Controls[i] is TPanel) then
                     if (Controls[i] as TPanel).Visible then
                           PanelWidth := (Controls[i] as TPanel).Width + PanelWidth;
               end;
            Result := PanelWidth + 4;
         end;
   end;
begin
   pMovements.Width := SetTheWidth(pMovements);
   pManagement.Width := SetTheWidth(pManagement);
   pCalfRegCMMS.Width := SetTheWidth(pCalfRegCMMS);
   pVet.Width := SetTheWidth(pVet);
//   pOtherEvents.Width := SetTheWidth(pOtherEvents);
end;

procedure TMenuForm.SetUpQuery(const ReloadSQLFilter : Boolean);
var
   GroupsToCheck : String;
   SQLFilter : TSQLFilter;
   FilterResult : Boolean; // SP 25/09/2002:-

   procedure InherdAnimalsOnly;
   begin
      // Never alter this first line to go over 2 line as the Mass Events uses it
      with WinData.AnimalFileByID.SQL do
         begin
            Clear;
            Add('SELECT DISTINCT (A.ID), A.* FROM Animals A    ');
            Add('WHERE (AnimalDeleted=FALSE)');
            Add('AND   (InHerd=TRUE)        ');
            if WinData.UserDefaultHerdID > 0 then
               Add('AND (HerdID = ' + IntToStr(WinData.UserDefaultHerdID) + ')')
            else
               Add('AND (HerdID <> ' + IntToStr(WinData.NONEHerdID) + ')');
         end;
   end;

   procedure HandleError;
   begin
      ShowMessage('Unable to load filters, contact Kingswood');
      InherdAnimalsOnly;
      DoGridSort;
      WinData.AnimalFileByID.Prepare;
      WinData.AnimalFileByID.Open;

   end;

   procedure DoSQLFilter;
   var
      GroupsToCheck : String;
   begin

      with WinData.AnimalFileByID.SQL do
         begin
            Clear;
            if WinData.AreGroupsSelected(GroupsToCheck) then
               Add('SELECT DISTINCT (A.ID), A.* FROM Animals A, GrpLinks G')
            else
               Add('SELECT DISTINCT (A.ID), A.* FROM Animals A');


            if Length(fFilters.InnerJoinSQLEvents) > 0 then
               begin
                  Strings[0] := Strings[0] + ' , Events E';
                  Add(fFilters.InnerJoinSQLEvents);
                  if Length(fFilters.EventDateRangeSQL ) > 0 then
                     Add(fFilters.EventDateRangeSQL);
                  Add('AND (AnimalDeleted=FALSE)');
               end
            else
               Add('WHERE (AnimalDeleted=FALSE) ');

            if GroupsToCheck <> '' then
               begin
                  Add('AND ((A.ID = G.AnimalID)');
                  Add('AND  (G.GroupID IN ' + GroupsToCheck + '))');
               end;

            if fFilters.BreedsSQL <> '' then
               Add('AND PrimaryBreed IN '+FFilters.BreedsSQL+'');

            if SQLFilter.SQLOp <> sqlBreedingStock then
               begin
                  if Length(fFilters.SexSQL) > 0 then
                     Add(fFilters.SexSQL);
               end;

            // Check the Filter Forms info
            if Length(fFilters.DOBSQL) > 0 then
               Add(fFilters.DOBSQL)
            else if (fFilters.AgeInMonthsFilterSQL <> '') then
               Add(fFilters.AgeInMonthsFilterSQL);

            if Length(fFilters.LactSQL) > 0 then
               Add(fFilters.LactSQL);
            Add('AND A.ID IN (SELECT DISTINCT F.AnimalID FROM sqlflters F )');
         end;
   end;

var
   SqlText : String;
   OldAnimalFileByIDSqlText : String;
begin
   { SP 25/09/2002: New Filters Added.
                    SQL layout and syntax changed }
   Update;
   // open form for viewing (add = false, view = true)
   cxAnimalGridView.DataController.BeginFullUpdate;
   WinData.AnimalFileByID.DisableControls;
   try

   // Save the current Animals ID
   if ( not Assigned(OnActivate)) and (WinData.AnimalFileByID.Active) then // form is displayed on screen.
      CurrAnimal := WinData.AnimalFileByIdID.AsInteger
   else
      CurrAnimal := 0;


   if ReloadSQLFilter then

   with WinData do
      begin
         OldAnimalFileByIDSqlText := AnimalFileByID.SQL.Text;
         AnimalFileByID.SQL.Clear;

         { Populate SearchNatID Field, strip NatID string of all None Alpha/Num Chars, allows user to search on natid without spaces/hyphens etc.  }
         AddSearchNatIDData;

         if WinData.ActiveFilter then
            begin
               // SP 25/09/2002:-
               if ( fFilters.ShowAnimalsOnStockDate ) or ( fFilters.ShowAnimalsBornIntoHerd ) or ( fFilters.FemaleStatus <> fsNone ) then
                  try
                     SQLFilter := TSQLFilter.Create;
                     SQLFilter.HerdID   := WinData.UserDefaultHerdID;
                     if fFilters.ShowAnimalsOnStockDate then
                        begin
                           SQLFilter.SQLOp := sqlAllStock;
                           SQLFilter.StockDate := fFilters.dStockDate;
                        end
                     else if (fFilters.FemaleStatus <> fsNone) then
                        SQLFilter.SQLOp := sqlBreedingStock
                     else if ( fFilters.ShowAnimalsBornIntoHerd ) then
                        SQLFilter.SQLOp := sqlBornIntoHerd;

                     if (SQLFilter.SQLOp = sqlBreedingStock) then // SP 25/09/2002:-
                        begin
                           if not ( fFilters.FilterTable.FieldByName('LactFrom').IsNull ) then
                              try
                                 SQLFilter.FromLact := StrToInt(fFilters.FilterTable.FieldByName('LactFrom').AsString); { Might need to be removed }
                              except
                                 SQLFilter.FromLact := 0;
                              end;

                           if not ( fFilters.FilterTable.FieldByName('LactTo').IsNull ) then
                              try
                                 SQLFilter.ToLact := StrToInt(fFilters.FilterTable.FieldByName('LactTo').AsString); { Might need to be removed }
                              except
                                 SQLFilter.ToLact := 0;
                              end;

                           FilterResult := False;
                           case fFilters.FemaleStatus of
                              fsInMilk       : FilterResult := SQLFilter.OpenSQL(cInMilk);
                              fsDry          : FilterResult := SQLFilter.OpenSQL(cDry);
                              fsNotServed    : FilterResult := SQLFilter.OpenSQL(cNotServed);
                              fsServedNotPDd : FilterResult := SQLFilter.OpenSQL(cServedNotPDd);
                              fsNotPregnant  : FilterResult := SQLFilter.OpenSQL(cNotPregnant);
                              fsPregnant     : FilterResult := SQLFilter.OpenSQL(cPregnant)
                           end;

                           if FilterResult then
                              begin
                                 DoSQLFilter;
                                 DoGridSort;
                                 AnimalFileByID.Prepare;
                                 AnimalFileByID.Open;
                              end
                           else
                              HandleError;
                        end
                     else if SQLFilter.SQLOp = sqlAllStock then
                        begin
                           if SQLFilter.OpenSQL(cAllStockOnDate) then
                              begin
                                 DoSQLFilter;
                                 DoGridSort;
                                 AnimalFileByID.Prepare;
                                 AnimalFileByID.Open;
                              end
                           else
                              HandleError;
                        end
                     else if SQLFilter.SQLOp = sqlBornIntoHerd then
                        begin
                           if SQLFilter.OpenSQL(cBornIntoHerd) then
                              begin
                                 DoSQLFilter;
                                 DoGridSort;
                                 AnimalFileByID.Prepare;
                                 AnimalFileByID.Open;
                              end
                           else
                              HandleError;
                        end;
                  finally
                     FreeAndNil(SQLFilter);
                  end
               else
                  begin
                     if Length(fFilters.AIBullSQL) > 0 then
                        begin
                           AnimalFileByID.SQL.Add('SELECT DISTINCT (A.ID), A.* FROM Animals A');
                           AnimalFileByID.SQL.Add('LEFT JOIN BullSemenStk S ON (A.ID=S.AnimalID)  ');
                           AnimalFileByID.SQL.Add(fFilters.AIBullSQL);
                           AnimalFileByID.SQL.Add('AND (A.HerdID = ' + IntToStr(WinData.NONEHerdID) + ')');
                           AnimalFileByID.SQL.Add('AND (A.AnimalDeleted=FALSE) AND (S.InUse=True) ');
                           if fFilters.BreedsSQL <> '' then
                              AnimalFileByID.SQL.Add('AND PrimaryBreed IN '+FFilters.BreedsSQL+'');
                           DoGridSort;
                        end
                     else if Length(fFilters.RetagSQL) > 0 then
                        begin
                           AnimalFileByID.SQL.Add('SELECT DISTINCT (A.ID), A.* FROM Animals A');
                           AnimalFileByID.SQL.Add('LEFT JOIN Afdoa AF ON (AF.AID=A.ID)');
                           AnimalFileByID.SQL.Add(fFilters.RetagSQL);
                           AnimalFileByID.SQL.Add('AND (A.HerdID = ' + IntToStr(WinData.UserDefaultHerdID) + ')');
                           AnimalFileByID.SQL.Add('AND (A.AnimalDeleted=FALSE)');
                           AnimalFileByID.SQL.Add('AND (InHerd=TRUE)');
                           if fFilters.BreedsSQL <> '' then
                              AnimalFileByID.SQL.Add('AND PrimaryBreed IN '+FFilters.BreedsSQL+'');
                           DoGridSort;
                        end
                     else if Length(fFilters.LeftHerdSQL) > 0 then
                        begin
                           AnimalFileByID.SQL.Add('SELECT DISTINCT (A.ID), A.* FROM Animals A');
                           AnimalFileByID.SQL.Add(fFilters.LeftHerdSQL);
                           AnimalFileByID.SQL.Add('AND (A.HerdID = ' + IntToStr(WinData.UserDefaultHerdID) + ')');
                           AnimalFileByID.SQL.Add('AND (A.AnimalDeleted=FALSE)');
                           if fFilters.BreedsSQL <> '' then
                              AnimalFileByID.SQL.Add('AND PrimaryBreed IN '+FFilters.BreedsSQL+'');
                           DoGridSort;
                        end
                     else if Length(fFilters.NoneHerdSQL) > 0 then
                        begin
                           AnimalFileByID.SQL.Add('SELECT DISTINCT (A.ID), A.* FROM Animals A');
                           AnimalFileByID.SQL.Add(fFilters.NoneHerdSQL);
                           AnimalFileByID.SQL.Add('AND (A.AnimalDeleted=FALSE)');
                           if fFilters.BreedsSQL <> '' then
                              AnimalFileByID.SQL.Add('AND PrimaryBreed IN '+FFilters.BreedsSQL+'');

                           DoGridSort;
                        end
                     else if ((Length(fFilters.BreedingSQL) > 0) OR (Length(fFilters.NonBreedingSQL) > 0) OR (Length(fFilters.DairySQL) > 0) OR (Length(fFilters.BeefSQL) > 0)
                          AND (GroupsToCheck <> '') AND (fFilters.CheckForEvents = TRUE)) then
                        begin

                           SqlText := 'SELECT DISTINCT (A.ID), A.* FROM Animals A';
                           if Length(fFilters.InnerJoinSQLEvents) > 0 then
                              InsertStr(', Events', Sqltext, Length(Sqltext)+1);
                           if AreGroupsSelected(GroupsToCheck) then
                              InsertStr(', GrpLinks G', Sqltext, Length(Sqltext)+1);

                           AnimalFileByID.SQL.Add(Sqltext);
                           if ((Length(fFilters.DairySQL) > 0) or (Length(fFilters.BeefSQL) > 0)) then
                              AnimalFileByID.SQL.Add('LEFT JOIN Breeds B On (B.ID=A.PrimaryBreed) ');

                           if Length(fFilters.InnerJoinSQLEvents) > 0 then
                              begin
                                 AnimalFileByID.SQL.Add(fFilters.InnerJoinSQLEvents);
                                 if Length(fFilters.EventDateRangeSQL ) > 0 then
                                    AnimalFileByID.SQL.Add(fFilters.EventDateRangeSQL);
                                 AnimalFileByID.SQL.Add('AND (AnimalDeleted=FALSE)');
                              end
                           else
                              AnimalFileByID.SQL.Add('WHERE (AnimalDeleted=FALSE)');

                           if fFilters.BreedsSQL <> '' then
                              AnimalFileByID.SQL.Add('AND PrimaryBreed IN '+FFilters.BreedsSQL+'');
                           if ((Length(fFilters.NonBreedingSQL) > 0) AND (Length(fFilters.BreedingSQL) > 0)) then
                              AnimalFileByID.SQL.Add('AND A.Breeding IS NOT NULL ')
                           else if (Length(fFilters.BreedingSQL) > 0)  then
                              AnimalFileByID.SQL.Add(fFilters.BreedingSQL)
                           else if (Length(fFilters.NonBreedingSQL) > 0) then
                              AnimalFileByID.SQL.Add(fFilters.NonBreedingSQL);

                           if ((Length(fFilters.DairySQL) > 0) and (Length(fFilters.BeefSQL) > 0)) then
                              AnimalFileByID.SQL.Add('AND B.EligibleforPremium IS NOT NULL ')
                           else if (Length(fFilters.DairySQL) > 0) and (Length(fFilters.BeefSQL) <= 0) then
                              AnimalFileByID.SQL.Add(fFilters.DairySQL)
                           else if (Length(fFilters.BeefSQL) > 0) and (Length(fFilters.DairySQL) <= 0) then
                              AnimalFileByID.SQL.Add(fFilters.BeefSQL);

                           if GroupsToCheck <> '' then
                              begin
                                 AnimalFileByID.SQL.Add('AND ((A.ID = G.AnimalID)');
                                 AnimalFileByID.SQL.Add('AND  (G.GroupID IN ' + GroupsToCheck + '))');
                              end;

                           if (not fFilters.ShowSales ) and ( not WinData.ShowAllAnimals ) then
                              AnimalFileByID.SQL.Add('AND (InHerd=TRUE)');

                           if WinData.UserDefaultHerdID > 0 then
                              AnimalFileByID.SQL.Add('AND (HerdID = ' + IntToStr(WinData.UserDefaultHerdID) + ')')
                           else if NOT WinData.ShowAllAnimals then
                              AnimalFileByID.SQL.Add('AND (HerdID <> ' + IntToStr(WinData.NONEHerdID) + ')');

                           // Check the Filter Forms info
                           if (NOT(Length(fFilters.AIBullSQL) > 0)) then
                              if Length(fFilters.SexSQL) > 0 then
                                 AnimalFileByID.SQL.Add(fFilters.SexSQL);

                           // Check the Filter Forms info
                           if Length(fFilters.DOBSQL) > 0 then
                              AnimalFileByID.SQL.Add(fFilters.DOBSQL)
                           else if (fFilters.AgeInMonthsFilterSQL <> '') then
                              AnimalFileByID.SQL.Add(fFilters.AgeInMonthsFilterSQL);

                           // Check the Filter Forms info for Lactation Number
                           if (NOT(Length(fFilters.AIBullSQL) > 0)) then
                              if Length(fFilters.LactSQL) > 0 then
                                 AnimalFileByID.SQL.Add(fFilters.LactSQL);

                           DoGridSort;

                        end
                     else if ((Length(fFilters.BreedingSQL) > 0) OR (Length(fFilters.NonBreedingSQL) > 0) OR (Length(fFilters.DairySQL) > 0) OR (Length(fFilters.BeefSQL) > 0)
                          AND (GroupsToCheck = '') AND (fFilters.CheckForEvents = FALSE)) then
                        begin
                           if AreGroupsSelected(GroupsToCheck) then
                              AnimalFileByID.SQL.Add('SELECT DISTINCT (A.ID), A.* FROM Animals A, GrpLinks G')
                           else
                              AnimalFileByID.SQL.Add('SELECT DISTINCT (A.ID), A.* FROM Animals A');
                           AnimalFileByID.SQL.Add('WHERE (AnimalDeleted=FALSE)');
                           if fFilters.BreedsSQL <> '' then
                              AnimalFileByID.SQL.Add('AND PrimaryBreed IN '+FFilters.BreedsSQL+'');
                           if ((Length(fFilters.NonBreedingSQL) > 0) AND (Length(fFilters.BreedingSQL) > 0)) then
                              AnimalFileByID.SQL.Add('AND A.Breeding IS NOT NULL ')
                           else if (Length(fFilters.BreedingSQL) > 0)  then
                              AnimalFileByID.SQL.Add(fFilters.BreedingSQL)
                           else if (Length(fFilters.NonBreedingSQL) > 0) then
                              AnimalFileByID.SQL.Add(fFilters.NonBreedingSQL);
                           if ((Length(fFilters.DairySQL) > 0) AND (Length(fFilters.BeefSQL) > 0)) then
                              AnimalFileByID.SQL.Add('AND B.EligibleforPremium IS NOT NULL ')
                           else if (Length(fFilters.DairySQL) > 0) then
                              AnimalFileByID.SQL.Add(fFilters.DairySQL)
                           else if (Length(fFilters.BeefSQL) > 0) then
                              AnimalFileByID.SQL.Add(fFilters.BeefSQL);
                           if ( NOT WinData.ShowAllAnimals ) And ( NOT fFilters.ShowSales ) then
                              AnimalFileByID.SQL.Add('AND (InHerd=TRUE)');
                           if WinData.UserDefaultHerdID > 0 then
                              AnimalFileByID.SQL.Add('AND (HerdID = ' + IntToStr(WinData.UserDefaultHerdID) + ')')
                           else if NOT WinData.ShowAllAnimals then
                              AnimalFileByID.SQL.Add('AND (HerdID <> ' + IntToStr(WinData.NONEHerdID) + ')');

                           // Check the Filter Forms info
                           if (NOT(Length(fFilters.AIBullSQL) > 0)) then
                              if Length(fFilters.SexSQL) > 0 then
                                 AnimalFileByID.SQL.Add(fFilters.SexSQL);

                           // Check the Filter Forms info
                           if Length(fFilters.DOBSQL) > 0 then
                              AnimalFileByID.SQL.Add(fFilters.DOBSQL)
                           else if (fFilters.AgeInMonthsFilterSQL <> '') then
                              AnimalFileByID.SQL.Add(fFilters.AgeInMonthsFilterSQL);

                           // Check the Filter Forms info for Lactation Number
                           if (NOT(Length(fFilters.AIBullSQL) > 0)) then
                              if Length(fFilters.LactSQL) > 0 then
                                 AnimalFileByID.SQL.Add(fFilters.LactSQL);

                           DoGridSort;

                        end;

//                     if cxAnimalGridView.DataController.Filter.Active then
  //                      begin


    //                    end

                     AnimalFileByID.Prepare;
                     AnimalFileByID.Open;
                  end;



            end
         else if ( WinData.UserDefaultHerdID = AllHerds ) then
             LoadAllAnimals(False)
         else
            begin
               InherdAnimalsOnly;
               DoGridSort;
               AnimalFileByID.Prepare;
               AnimalFileByID.Open;
            end;
      end
   else
      begin
         OldAnimalFileByIDSqlText := Windata.AnimalFileByID.SQL.Text;
         Windata.AnimalFileByID.SQL.Clear;
         Windata.AnimalFileByID.SQL.Text := OldAnimalFileByIDSqlText;
         WinData.AnimalFileByID.Prepare;
         WinData.AnimalFileByID.Open;
      end;

   WinData.MoveIDsToAFilter;

   finally
      try
         cxAnimalGridView.DataController.EndFullUpdate;
         Windata.AnimalFileByID.EnableControls;
      except
         ResetAnimalGridColumns;
         RestoreAnimalGridView;
      end;

      cxAnimalGridView.Datacontroller.BeginLocate;
      try
         if (CurrAnimal>0) then
            cxAnimalGridView.DataController.LocateByKey(CurrAnimal)
         else
            if (WinData.AnimalFileByID.RecordCount>0) then
               cxAnimalGridView.DataController.FocusedRowIndex := 0;
      finally
         cxAnimalGridView.Datacontroller.EndLocate;
      end;
   end;

   if WinData.ActiveFilter then
      begin
         sbFilters.Caption := 'Fi&lter On ';
         sbFilters.Font.Size := 8;
         sbFilters.Font.Style := [fsBold,fsItalic];
         sbFilters.Font.Color := clBlue;
      end
   else if cxAnimalGridView.DataController.Filter.FilterText <> '' then
      begin
         cxAnimalGridView.DataController.Filter.Active := True;
      end
   else
      begin
         sbFilters.Caption := 'Fi&lter';
         sbFilters.Font.Size := 8;
         sbFilters.Font.Style := [];
         sbFilters.Font.Color := clBlack;
      end;

   Update;
end;

procedure TMenuForm.FormActivate(Sender: TObject);
var
  HerdType : tHerdType;
begin
   OnActivate := nil;
   BuildSearchColumnList;

   Caption := 'Kingswood Herd Management - '+HerdVerNo;

   pSearch.Height := 89;
   Bevel1.Width := PSearch.Width-1;

   CheckPhoneLinkOnStartup.Checked := WinData.SearchPhoneLink; // SP 27/09/2002.
   ShowHintsatStartup.Checked := WinData.ShowHints;

   //HideModules; // Hide unneeded buttons depending on DEF file.

   case WinData.PhoneLinkType of
      plNOKIA   : NokiaLink1.Checked := TRUE;
      plSIEMENS : SiemensGSMModule1.Checked := TRUE
   else
      begin
         NokiaLink1.Checked := False;
         SiemensGSMModule1.Checked := False;
      end;
   end;

   Application.ProcessMessages;
   WinData.EuroCheck;

   if ( WinData.GlobalSettings.BackupReminder ) then
      begin
         if (( WinData.LastBackUpDate + 30) < Date ) and ( WinData.LastBackUpDate > 0 ) then
            begin
               if MessageDLG('It is ' + FloatToStrF(Date() - WinData.LastBackUpDate, ffFixed, 4 , 0 ) + ' Days since you took a Backup' + #13#10 +
                             'Do you want to take one now',mtWarning,[mbYes,mbNo],0) = mrYes then
                  bBackUpClick(Sender);
               Update;
            end;
      end;

//   vSplitter.BringToFront;
//   pGrid.BringToFront;

   HerdType := HerdLookup.GetHerdType(WinData.AnimalFileByIDHerdID.AsInteger);
   if ( HerdType <> htBeef ) and  ( WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger) = Ireland ) then
      WinData.CheckAISireRegister;

   Update;

   // See if you need to show the Hints
   if WinData.ShowHints then
      begin
         AMTip.AutoLoad := WinData.ShowHints;
         AMTip.Execute;
      end;

   if (WinData.DisplayNews) then
      ShowVersionHistory([Ireland]) ;

  WinData.CreatePhoneLinkEvents;
  Update;
  WinData.CreatePDAEvents(False);
  Update;
  WinData.CreateParlourEvents;
  Update;
   try
     if WinData.GlobalSettings.NewVersionReminder then
        begin
           { SP 15/11/2002:- Remind user to download latest version }
           if WinData.LastVersionUpdate <= IncMonth(Date, -3) then
              begin
                 WinData.LastVersionUpdate := Date; // Now update database.
                 if MessageDlg('Do you wish to download latest version of Kingswood Herd?',
                               mtConfirmation,[mbYes, mbNo],0) = idYes then
                       WinData.CreateAndShowForm(TDownload);
              end;
           { SP 15/11/2002:- }
        end;
   except
   end;


   WinData.QueryICBFRegistrations;
   Update;

   RunActionLists;
   MenuForm.sbExit.Enabled := True;
   Update;

   if ((WinData.SystemRegisteredCountry=Ireland) and (WinData.DefaultEmailClient <> cEmailClient_MS)) then
      begin
         if MessageDlg( cEmailInbox_CheckNewMessages, mtConfirmation,[mbYes,MbNo],0) = idYes then
            WinData.ViewMailBox;
      end;

   if ( WinData.GlobalSettings.DisplayGettingStarted ) then
      begin
         ShowGettingStarted;
      end;

   Update;
end;

procedure TMenuForm.SalesButton1Click(Sender: TObject);
var
   CallSetupQuery : Boolean;
begin
   // ensure animal has breed assigned before allowing sale/death event.
   If WinData.AnimalFileByIDPrimaryBreed.AsInteger <= 0 then
      begin
         MessageDLG('Animal Breed must be entered before entering Sale/Death Event',mtWarning,[mbOK],0);
         Abort;
      end;

   if NOT WinData.HasSaleDeath(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger) then
      begin
         if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                        WinData.AnimalFileByIDHerdID.AsInteger,
                                        WinData.AnimalFileByIDAnimalNo.AsString,
                                        WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
         begin
            // Need to locate a Sales Record for an animal if it exists.
            if WinData.Events.Locate('AnimalId;EventType',VarArrayOf([WinData.AnimalFileByIDID.AsVariant, cSaleDeathEvent]),[] ) then
               CallSetupQuery := uSalesDeaths.ShowSalesDeaths(AmendSaleDeath, False)  //Changed Procedure call to include PreSale Boolean
            else   // Create a new Sales record
               CallSetupQuery := uSalesDeaths.ShowSalesDeaths(AddSaleDeath, False);   //Changed Procedure call to include PreSale Boolean
            if CallSetupQuery then
               SetUpQuery;
         end;
      end
   else
      MessageDlg('Sale/Death event already exists',mtInformation,[mbOK],0);
end;

procedure TMenuForm.sbMilkRec1Click(Sender: TObject);
var
   FileName : string;
   NoOfAttachments : Integer;
begin
   CheckSelectedHerd;
   if ((WinData.SystemRegisteredCountry =Ireland) AND (WinData.ICBFMMR)) then
      begin
          if WinData.GlobalSettings.DownloadMailAttachments then
            begin
               if MessageDlg(cEmail_DownloadAttachmentConfirm,mtConfirmation,[mbYes,mbNo],0) = idYes then
                  begin
                     Update;
                     NoOfAttachments := WinData.DownloadEmailAttachments;
                     if ( NoOfAttachments > 0 ) then
                        MessageDlg(Format(cEmail_NewAttachmentsDownloaded,[NoOfAttachments]),mtInformation,[mbOk],0)
                     else
                        MessageDlg(cEmail_NoNewAttachments,mtInformation,[mbOk],0);
                  end;

               FileName := TfmFileAttachmentImport.execute(itICBF);
               if (FileExists(FileName)) then
                  begin
                     TfMilkRec.ImportICBFFile(FileName);
                  end;
            end
         else
            begin
               uMilkRec.CreateAndShow(1);
            end;
      end
   else
      uMilkRec.CreateAndShow(0);
end;

procedure TMenuForm.bBackUpClick(Sender: TObject);
begin
   TfmDataBackup.execute
end;

procedure TMenuForm.bSystemClick(Sender: TObject);
begin
   uSystem.ShowForm(Sys);
end;

procedure TMenuForm.cbDefaultHerd1Change(Sender: TObject);
begin
   Enabled := False;
   Screen.Cursor := crHourGlass;
   Update;
   try
   if cbDefaultHerd.Value = '' then Exit;
   if not AllAnimalsShowing then
      begin
         if WinData.UserDefaultHerdID <> StrToInt(cbDefaultHerd.Value) then
            begin
               WinData.UserDefaultHerdID := StrToInt(cbDefaultHerd.Value);
               WinData.UserDefaultHerdID;  // Set the UserHerdType
               if sbAccounts.Enabled then
                  LoadAccountsCompanies();
               SetUpQuery(True);
            end;
         SetupForm;
      end;
   finally
      Enabled := True;
      Screen.Cursor := crDefault;
   end;
end;

procedure TMenuForm.HideAll;
begin
   lBreeding1.Hide;
   lBreeding2.Hide;
//   pBreeding.Hide;
   BreedingPageControl.Hide;

   lMovements.Hide;
   pMovements.Hide;
   lVet.Hide;
   pVet.Hide;
   lPremium.Hide;
   pCalfRegCMMS.Hide;
   lManagement1.Hide;
   lManagement2.Hide;
//   lManagement2.Hide;
   pManagement.Hide;
   lOtherEvents.Hide;
//   lOtherEvents2.Hide;
   pcMultipleAnimals.Hide;
   bOtherEvents.font.Color := clBlack;
   bOtherEvents.font.Style := [];
   bPremium.font.Color := clBlack;
   bManagement.font.Color := clBlack;
   bMovements.font.Color := clBlack;
   bHealth.font.Color := clBlack;
   bBreeding.font.Color := clBlack;
   bPremium.font.Style := [];
   bManagement.font.Style := [];
   bMovements.font.Style := [];
   bHealth.font.Style := [];
   bBreeding.font.Style := [];
end;

procedure TMenuForm.bHealth2Click(Sender: TObject);
begin
   If bHealth.Visible Then
      begin
         HideAll;
         bHealth.Down := True;
         pVet.Top := BreedingPageControl.Top;
         pVet.left := BreedingPageControl.left;
//         pVet.Top := pBreeding.Top;
//         pVet.left := pBreeding.left;
         lvet.show;
         pVet.Show;
         bHealth.font.Color := clBlue;
         bHealth.font.Style := [fsUnderline];
      end;
end;

procedure TMenuForm.bOtherEvents2Click(Sender: TObject);
begin
   // SP "17/06/2002"
   if bOtherEvents.Visible Then
      begin
         HideAll;
         bOtherEvents.Down := True;
         pcMultipleAnimals.Top  := BreedingPageControl.Top;
         pcMultipleAnimals.Left := BreedingPageControl.Left;
//         pOtherEvents.Top  := pBreeding.Top;
//         pOtherEvents.Left := pBreeding.Left;
         case bOtherEvents.Top of
            168 : lOtherEvents.Show;
            140 : LPremium.Show;
         end;
         pcMultipleAnimals.Visible := True;
         bOtherEvents.font.Color := clBlue;
         bOtherEvents.font.Style := [fsUnderline];
      end;
end;

procedure TMenuForm.bManagement2Click(Sender: TObject);
begin

   If (bManagement.Visible) then
      begin
         HideAll;
         bManagement.Down := True;
         pManagement.Top := BreedingPageControl.Top;
         pManagement.left := BreedingPageControl.left;
    //     pManagement.Top := pBreeding.Top;
  //       pManagement.left := pBreeding.left;
         case bManagement.Top of
            196 : begin
                     lManagement1.show;
                     lManagement2.show;
                  end;
            168 : lOtherEvents.Show;
         end;
         pManagement.show;
         bManagement.font.Color := clBlue;
         bManagement.font.Style := [fsUnderline];
      end;
end;


procedure TMenuForm.bBreeding2Exit(Sender: TObject);
begin
   (sender as Tbitbtn).font.Color := clblack;
   (sender as Tbitbtn).font.Style := [];
end;

procedure TMenuForm.ReIndex1Click(Sender: TObject);
begin
   ReIndexAll(True);
   WinData.OpenAndCheckTables;
   WinData.AnimalFileByID.Active := True;
end;

procedure TMenuForm.BovineHerdRegister1Click(Sender: TObject);
begin
   EnableBtn(Sender);;
   try
      RefreshForm;
      WinData.CreateAndShowForm(TCowRepfilter);
   finally
      EnableBtn(Sender);;
   end;
end;

procedure TMenuForm.StockOnHand1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      RefreshForm;
      StockInHerdFilt.ShowForm( StockOnHand );
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.PurchaseSalesAnalysis1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      RefreshForm;
      StockInHerdFilt.ShowForm(PurchSales);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.PremiumReport1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      RefreshForm;
      StockInHerdFilt.ShowForm(Premiums);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.VeterinaryTreatments1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      RefreshForm;
      HealthFilterU.ReportType := rtMediTreat;
      try
         Application.CreateForm(THeatlthFilter, HeatlthFilter);
         HeatlthFilter.ShowModal;
      except
         ShowMessage('Cannot show this Form - close program and re-boot');
      end;
   finally
      HeatlthFilter.Free;
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.VeterinaryPurchases1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      try
         RefreshForm;
         HealthFilterU.ReportType := rtMediFeedPurch;
         Application.CreateForm(THeatlthFilter, HeatlthFilter);
         HeatlthFilter.ShowModal;
      except
         ShowMessage('Cannot show this Form - close program and re-boot');
      end;
   finally
      HeatlthFilter.Free;
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.CalfRegistration1Click(Sender: TObject);
begin
   uCalfRegFlt.ShowForm;
end;

procedure TMenuForm.HeatsAndServices1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      uHeatServiceFilt.ShowTheForm;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.BullsUsedInHerd1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      BullReportsFilt.ShowForm(2);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.BrowseSireRegister1Click(Sender: TObject);
var
   id : Integer;
   CallSetupQuery : Boolean;
begin
   CallSetupQuery := False;
   EnableBtn(Sender);
   try
      id := WinData.AnimalFileByIDID.AsInteger;
      try
         cxAnimalGridView.DataController.BeginFullUpdate;
         cxAnimalGridView.DataController.LockDataChangedNotify;
         try
            if WinData.SystemRegisteredCountry = Ireland then
               begin
                  if HerdLookup.GetHerdTypeAsString(WinData.UserDefaultHerdID) = cDairyHerd then
                     begin
                        CallSetupQuery := True;
                        WinData.CreateAndShowForm(TBrowseSireRegister)
                     end
                  else
                     TfmBeefAISireRegister.execute(TfmBeefAISireRegister,CallSetupQuery);
               end
            else
               TfmUKSireRegister.execute(TfmUKSireRegister,CallSetupQuery);

            Screen.Cursor := crHourGlass;
            try
               if CallSetupQuery then
                  begin
                     WinData.AnimalFileByID.Close;
                     WinData.AnimalFileByID.Open;
                  end;
               cxAnimalGridView.Datacontroller.BeginLocate;
               try
                  WinData.AnimalFileByID.Locate('ID', id, []);
                  Update;
               finally
                  cxAnimalGridView.Datacontroller.EndLocate;
               end;
            finally
               Screen.Cursor := crDefault;
            end;
         except
         end;
      finally
         cxAnimalGridView.DataController.UnLockDataChangedNotify;
         cxAnimalGridView.DataController.EndFullUpdate;
      end;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.SireSelection1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      BullReportsFilt.ShowForm(1);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.QuotaPlanner1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
     TfmFertTreatmentsReview.Execute;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.BestCowsInHerd1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      BreedingAnalysisFilt.ShowForm;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.CowEnrolmentFormMR21Click(Sender: TObject);
begin
   uCowEnrolFilt.ShowForm;
end;

procedure TMenuForm.MilkProductionGraphs1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      uDailyYieldGraph.ShowForm;
   finally
     EnableBtn(Sender);
   end;
end;

procedure TMenuForm.HerdBrochure1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      uHerdBrochureFlt.ShowForm;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.SalesCatelog1Click(Sender: TObject);
var
   HerdType : THerdType;
begin
   CheckSelectedHerd;
   try
      EnableBtn(Sender);
      HerdType := HerdLookup.GetHerdType(WinData.UserDefaultHerdID);
      if HerdType = htDairy then
         uSalesCatalogueFlt.ShowForm
      else
         TfmBeefSalesCatalogue.execute(TfmBeefSalesCatalogue);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.FirstAnimal1Click(Sender: TObject);
begin
   cxAnimalGridView.DataController.DataSet.First;
end;

procedure TMenuForm.NextAnimal1Click(Sender: TObject);
begin
   cxAnimalGridView.DataController.DataSet.Next;
end;

procedure TMenuForm.PreviousAnimal1Click(Sender: TObject);
begin
   cxAnimalGridView.DataController.DataSet.Prior;
end;

procedure TMenuForm.LastAnimal1Click(Sender: TObject);
begin
   cxAnimalGridView.DataController.DataSet.Last;
end;

procedure TMenuForm.PrintSetup1Click(Sender: TObject);
begin
   PrinterSetup.Execute;
end;

procedure TMenuForm.HerdSettings1Click(Sender: TObject);
begin
   WinData.CreateAndShowForm(TfHerdSetUp);
   SetUpForm;
end;

procedure TMenuForm.MilkDiskParameters1Click(Sender: TObject);
begin
   uSetUpMilkDisk.CreateAndShow;
end;

procedure TMenuForm.SetNationalIDtype1Click(Sender: TObject);
begin
   CheckSelectedHerd;
   WinData.CreateAndShowForm(TfDefaults);
end;

procedure TMenuForm.Customers1Click(Sender: TObject);
var
   ID : Integer;
begin
   uCustomers.ShowTheForm(TRUE, ID);
end;

procedure TMenuForm.Suppliers1Click(Sender: TObject);
var
   ID : Integer;
begin
   uSuppliers.ShowTheForm(TRUE, ID);
end;

procedure TMenuForm.Breeds1Click(Sender: TObject);
begin
   SetUpBreeds.ShowTheForm(FALSE);
end;

procedure TMenuForm.Buyers1Click(Sender: TObject);
var
   ID : Integer;
begin
   uBuyers.ShowTheForm(TRUE, ID);
end;

procedure TMenuForm.SystemUsers1Click(Sender: TObject);
begin
//   WinData.CreateAndShowForm(TfSetUpUsers);
   uSetupUsers.ShowTheForm(False);
end;

procedure TMenuForm.Medicines1Click(Sender: TObject);
begin
   uMedicineSetUp.ShowTheForm(TRUE);
end;

procedure TMenuForm.Units1Click(Sender: TObject);
begin
   uUnitsSetUp.ShowTheForm(TRUE);
end;

procedure TMenuForm.Menu1Click(Sender: TObject);
var
   i : Integer;
begin
   if Menu1.Checked then
      try
         for i := 0 to MainMenu.Items.Count-1 do
            MainMenu.Items[i].Visible := FALSE;
         Menu1.Checked := FALSE;
      except
         //
      end;
end;

procedure TMenuForm.Statusbar1Click(Sender: TObject);
begin
   if Statusbar1.Checked then
      Statusbar.Hide
   else
      Statusbar.Show;
   Statusbar1.Checked := NOT(Statusbar1.Checked);
end;

procedure TMenuForm.ToolBar2Click(Sender: TObject);
begin
   If Dock97.Visible Then
      begin
         Dock97.Hide;
         Toolbar2.Checked := False;
      end
   else
      begin
         Dock97.Show;
         Toolbar2.Checked := True;
      end;
   EventIcons1Click(Sender);
end;

procedure TMenuForm.Gradient1Click(Sender: TObject);
begin
   If Gradient1.Checked Then
      begin
         Gradient.ColorStart := clBtnFace;
         Gradient.ColorEnd := clBtnFace;
         Gradient1.Checked := False;
      end
   Else
      begin
         Gradient.ColorStart := clWhite;
         Gradient.ColorEnd := clTeal;
         Gradient1.Checked := True;
      end;
      Gradient.SendToBack;
      Screen.ActiveForm.Refresh;
end;

{ New Help page for Getting Started - MK 26/05/08
procedure TMenuForm.sbHelp1Click(Sender: TObject);
begin
   if pReports.Visible then
      WinData.HTMLHelp('printscreen.htm')
   else
      WinData.HTMLHelp('Menu.htm');
end;}

procedure TMenuForm.sbHelp1Click(Sender: TObject);
begin
   if WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger) = Ireland then
      begin
         WinData.HTMLHelp('gettingstarted.htm');
      end
   else if WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger) = NIreland then
      begin
         WinData.HTMLHelp('gettingstartedNI.htm');
      end
   else if WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger) = England then
      begin
         WinData.HTMLHelp('gettingstartedGB.htm');
      end;
end;

procedure TMenuForm.sbSuckReplaceClick(Sender: TObject);
begin
   ReplaceClick(nil);
end;

procedure TMenuForm.VisitKingswoodOnline1Click(Sender: TObject);
begin
   OpenUrl('http://www.kingswood.ie/');
end;

procedure TMenuForm.HerdManagement1Click(Sender: TObject);
begin
   OpenUrl('http://www.kingswood.ie/index.php?id=13');
end;

procedure TMenuForm.Index1Click(Sender: TObject);
begin
   WinData.HTMLHelp('index.htm');
   Windata.HelpSocket.ShowIndexTAB;
end;

procedure TMenuForm.SearchforHelpOn1Click(Sender: TObject);
begin
   Windata.HelpSocket.ShowSearchTab;
   WinData.HTMLHelp('index.htm');
end;

procedure TMenuForm.HowtoUseHelp1Click(Sender: TObject);
begin
   WinData.HTMLHelp('howtousehelp.htm');
end;

procedure TMenuForm.SalesReport1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      // KB's Sales Report
      uSalesReport.ShowTheForm;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.ResolutionOptions1Click(Sender: TObject);
begin
   uSystem.ShowForm(Res);
end;

procedure TMenuForm.EventIcons1Click(Sender: TObject);
begin
   if EventIcons1.Checked = True then
      begin
         vSplitter.Hide;
         Gradient.Height := 0;
         pGrid.Top := 283 + 173;
         EventIcons1.Checked := False;
      end
   else
      begin
         pGrid.Height := 283;
         Gradient.Height := 173;
         vSplitter.Show;
         EventIcons1.Checked := True;
      end;
end;

procedure TMenuForm.MovementPermits1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      CheckSelectedHerd;
      TfmStockValuationReport.ShowStockValuationReport;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.FormCreate(Sender: TObject);
const
   cSingleEvent = 'Single %s Event';
   cMultipleEvent = 'Block %ss';

var
   EmailClient : string;
   ItemIndex : Integer;
begin
   miTestFacility.Visible := DirectoryExists('C:\Kingswood\Output\Winherd\Development\Compiled'); // debug

   // Register a custom windows message
   MyMsg := RegisterWindowMessage('Kingswood Herd Management');
   // Set MenuForm's windows proc to ours and remember the old window proc
   OldWindowProc := Pointer(SetWindowLong(MenuForm.Handle,GWL_WNDPROC,LongInt(@NewWindowProc)));

   SetGridStyles;

   ReloadSetupQuery := False;

   GettingStartedScrActive := False;

   if Def.Definition.dPDAStandalone then
      SystemType := stPDAStandalone
   else
      SystemType := stStandard;

   BreedingPageControl.ActivePage := tsBreeding;
   Windata.ReportInEuro := True; // do not change this value!!!
 //  pOtherEvents.Top  := BreedingPageControl.Top;
  // pOtherEvents.Left := BreedingPageControl.Left;
   Application.OnMinimize := MenuForm.AppMinimize;
   Application.OnRestore := MenuForm.AppRestore;

   SetDataSources;
   RestoreAnimalGridView;
   kRoutines.CheckHighLightedControls(Self, clRed);
   WinData.LoadBtnImage(sbExit.Glyph, cBtnImgExit);
   WinData.LoadBtnImage(sbReports.Glyph, cBtnImgPrint);
   WinData.LoadBtnImage(sbHelp.Glyph, cBtnImgHelp);
   WinData.LoadBtnImage(sbBackup.Glyph, cBtnImgFloppy2);
//   WinData.LoadBtnImage(sbAddAnimal.Glyph, cBtnImgAdd);

//   EventGridAnimalEventsViewEventType.Properties.look
   Blade1.Visible := WinData.GlobalSettings.BladeRegistered;
   DefaultEmailClient1.Visible := (WinData.SystemRegisteredCountry=Ireland) and ( FileExists(IncludeTrailingBackslash( ApplicationPath ) + KingswoodMailBoxDLL));

   Email1.Visible := ((WinData.SystemRegisteredCountry=Ireland) and (WinData.DefaultEmailClient <> cEmailClient_MS));

   AllAnimalsShowing := False;
   RetagColumn1.Checked := True;

   Reg := TRegistry.Create;

   pmHeatBullingEvent := TPopupMenu.Create(nil);

   miHeatBullingSingleEvent := TMenuItem.Create(pmHeatBullingEvent);
   miHeatBullingSingleEvent.Caption := Format(cSingleEvent, [cStrHeatBulling]);
   miHeatBullingSingleEvent.OnClick := sbBulling.OnClick;

   miHeatBullingMultiEvent := TMenuItem.Create(pmHeatBullingEvent);
   miHeatBullingMultiEvent.Caption := Format(cMultipleEvent, [cStrHeatBulling]);
   miHeatBullingMultiEvent.Tag := CBullingEvent;
   miHeatBullingMultiEvent.OnClick := ShowGroupEventClick;
   pmHeatBullingEvent.Items.Add([miHeatBullingSingleEvent,miHeatBullingMultiEvent]);
   sbBullingEvent.DropDownMenu := pmHeatBullingEvent;

   pmServiceEvent := TPopupMenu.Create(nil);
   miServiceSingleEvent := TMenuItem.Create(pmServiceEvent);
   miServiceSingleEvent.Caption := Format(cSingleEvent, [cStrService]);
   miServiceSingleEvent.OnClick := sbService.OnClick;

   miServiceMultiEvent := TMenuItem.Create(pmServiceEvent);
   miServiceMultiEvent.Caption := Format(cMultipleEvent, [cStrService]);
   miServiceMultiEvent.Tag := CServiceEvent;
   miServiceMultiEvent.OnClick := ShowGroupEventClick;
   pmServiceEvent.Items.Add([miServiceSingleEvent,miServiceMultiEvent]);
   sbServiceEvent.DropDownMenu := pmServiceEvent;

   pmScanPDEvent := TPopupMenu.Create(nil);
   miScanPDSingleEvent := TMenuItem.Create(pmScanPDEvent);
   miScanPDSingleEvent.Caption := Format(cSingleEvent, [cStrPregDiagnosis]);
   miScanPDSingleEvent.OnClick := sbPds.OnClick;

   miScanPDMultiEvent := TMenuItem.Create(pmScanPDEvent);
   miScanPDMultiEvent.Caption := Format(cMultipleEvent, [cStrPregDiagnosis]);
   miScanPDMultiEvent.Tag := CPregDiagEvent;
   miScanPDMultiEvent.OnClick := ShowGroupEventClick;
   pmScanPDEvent.Items.Add([miScanPDSingleEvent,miScanPDMultiEvent]);
   sbScanPDEvent.DropDownMenu := pmScanPDEvent;

   pmDryOffEvent := TPopupMenu.Create(nil);
   miDryOffSingleEvent := TMenuItem.Create(pmDryOffEvent);
   miDryOffSingleEvent.Caption := Format(cSingleEvent, [cStrDryOff]);
   miDryOffSingleEvent.OnClick := sbDryingOff.OnClick;

   miDryOffMultiEvent := TMenuItem.Create(pmDryOffEvent);
   miDryOffMultiEvent.Caption := Format(cMultipleEvent, [cStrDryOff]);
   miDryOffMultiEvent.Tag := CDryOffEvent;
   miDryOffMultiEvent.OnClick := ShowGroupEventClick;
   pmDryOffEvent.Items.Add([miDryOffSingleEvent,miDryOffMultiEvent]);
   sbDryOffEvent.DropDownMenu := pmDryOffEvent;

   pmVetTreatmentsEvent := TPopupMenu.Create(nil);
   miVetTreatmentsSingleEvent := TMenuItem.Create(pmVetTreatmentsEvent);
   miVetTreatmentsSingleEvent.Caption := Format(cSingleEvent, [cStrVetTreatment]);
   miVetTreatmentsSingleEvent.OnClick := sbVetTreat.OnClick;

   miVetTreatmentsMultiEvent := TMenuItem.Create(pmVetTreatmentsEvent);
   miVetTreatmentsMultiEvent.Caption := Format(cMultipleEvent, [cStrVetTreatment]);
   miVetTreatmentsMultiEvent.Tag := CHealthEvent;
   miVetTreatmentsMultiEvent.OnClick := ShowGroupEventClick;
   pmVetTreatmentsEvent.Items.Add([miVetTreatmentsSingleEvent,miVetTreatmentsMultiEvent]);
   sbVetTreatmentsEvent.DropDownMenu := pmVetTreatmentsEvent;

   pmWeighingEvent := TPopupMenu.Create(nil);
   pmWeighingEvent.OnPopup := pmWeighingEventOnPopup;
   miWeighingLW := TMenuItem.Create(pmWeighingEvent);
   miWeighingLW.OnClick := LWClick;
   miWeighingLW.Caption := '&Pre-Sale Weighing';

   pmPurchaseEvent := TPopupMenu.Create(nil);
   miPurchaseMultiEvent := TMenuItem.Create(pmPurchaseEvent);
   miPurchaseMultiEvent.Caption := Format(cMultipleEvent, [cStrPurchase]);
   miPurchaseMultiEvent.Tag := CPurchaseEvent;
   miPurchaseMultiEvent.OnClick := pFileImportClick;
   pmPurchaseEvent.Items.Add([miPurchaseMultiEvent]);
   sbPurchaseEventDropDown.DropDownMenu := pmPurchaseEvent;

   miWeighingIHM := TMenuItem.Create(pmWeighingEvent);
   miWeighingIHM.OnClick := InterHerdClick;
   miWeighingIHM.Caption := '&Inter Herd Movement';

   miWeighingMICrushDisk := TMenuItem.Create(pmWeighingEvent);
   miWeighingMICrushDisk.OnClick := ShowCrushFile;
   miWeighingMICrushDisk.Caption := '&Crush Weighing Disk';

   miWeighingSingleEvent := TMenuItem.Create(pmWeighingEvent);
   miWeighingSingleEvent.Caption := Format(cSingleEvent, [cStrWeighing]);;
   miWeighingSingleEvent.OnClick := sbWeight.OnClick;

   miWeighingMultiEvent := TMenuItem.Create(pmWeighingEvent);
   miWeighingMultiEvent.Caption := Format(cMultipleEvent, [cStrWeighing]);;
   miWeighingMultiEvent.Tag := CWeightEvent;
   miWeighingMultiEvent.OnClick := ShowGroupEventClick;
   pmWeighingEvent.Items.Add([miWeighingSingleEvent,miWeighingMultiEvent,miWeighingLW,miWeighingIHM,miWeighingMICrushDisk]);
   sbWeighingEvent.DropDownMenu := pmWeighingEvent;

   pmDisbuddingEvent := TPopupMenu.Create(nil);
   with pmDisbuddingEvent do
      begin
         Items.Add( TMenuItem.Create(pmDisbuddingEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := Format(cSingleEvent, [cStrDisbudding]);
         Items[ItemIndex].OnClick := btnDisbudding.OnClick;
         Items[ItemIndex].Tag := btnDisbudding.Tag;

         Items.Add( TMenuItem.Create(pmDisbuddingEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := Format(cMultipleEvent, [cStrDisbudding]);
         Items[ItemIndex].OnClick := ShowAWGroupEventClick;
         Items[ItemIndex].Tag := CDisbuddingEvent;

         Items.Add( TMenuItem.Create(pmDisbuddingEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := '-';

         Items.Add( TMenuItem.Create(pmDisbuddingEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := cReviewAnimalWelfareEvents;
         Items[ItemIndex].OnClick := ShowAWEventReview;
      end;
   btnDisbuddingEvent.DropDownMenu := pmDisbuddingEvent;

   pmCastrationEvent := TPopupMenu.Create(nil);
   with pmCastrationEvent do
      begin
         Items.Add( TMenuItem.Create(pmCastrationEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := Format(cSingleEvent, [cStrCastration]);
         Items[ItemIndex].OnClick := btnCastrate.OnClick;
         Items[ItemIndex].Tag := btnCastrate.Tag;

         Items.Add( TMenuItem.Create(pmCastrationEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := Format(cMultipleEvent, [cStrCastration]);
         Items[ItemIndex].OnClick := ShowAWGroupEventClick;
         Items[ItemIndex].Tag := CCastrateEvent;

         Items.Add( TMenuItem.Create(pmCastrationEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := '-';

         Items.Add( TMenuItem.Create(pmCastrationEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := cReviewAnimalWelfareEvents;
         Items[ItemIndex].OnClick :=  ShowAWEventReview;
      end;
   btnCastrateEvent.DropDownMenu := pmCastrationEvent;

   pmStartMealFeedEvent := TPopupMenu.Create(nil);
   with pmStartMealFeedEvent do
      begin
         Items.Add( TMenuItem.Create(pmStartMealFeedEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := Format(cSingleEvent, [cStrMealFeeding]);
         Items[ItemIndex].OnClick := btnMealFeeding.OnClick;
         Items[ItemIndex].Tag := btnMealFeeding.Tag;

         Items.Add( TMenuItem.Create(pmStartMealFeedEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := Format(cMultipleEvent, [cStrMealFeeding]);
         Items[ItemIndex].OnClick := ShowAWGroupEventClick;
         Items[ItemIndex].Tag := CMealFeedingEvent;

         Items.Add( TMenuItem.Create(pmStartMealFeedEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := '-';

         Items.Add( TMenuItem.Create(pmStartMealFeedEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := cReviewAnimalWelfareEvents;
         Items[ItemIndex].OnClick :=  ShowAWEventReview;
      end;
   btnMealFeedingEvent.DropDownMenu := pmStartMealFeedEvent;

   pmWeaningEvent := TPopupMenu.Create(nil);
   with pmWeaningEvent do
      begin
         Items.Add( TMenuItem.Create(pmWeaningEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := Format(cSingleEvent, [cStrWeaning]);
         Items[ItemIndex].OnClick := btnWeaning.OnClick;
         Items[ItemIndex].Tag := btnWeaning.Tag;

         Items.Add( TMenuItem.Create(pmWeaningEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := Format(cMultipleEvent, [cStrWeaning]);
         Items[ItemIndex].OnClick := ShowAWGroupEventClick;
         Items[ItemIndex].Tag := CWeaningEvent;

         Items.Add( TMenuItem.Create(pmWeaningEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := '-';

         Items.Add( TMenuItem.Create(pmWeaningEvent) );
         ItemIndex := Items.Count-1;
         Items[ItemIndex].Caption := cReviewAnimalWelfareEvents;
         Items[ItemIndex].OnClick :=  ShowAWEventReview;
      end;
   btnWeaningEvent.DropDownMenu := pmWeaningEvent;


   BuildOnFarmEventsMenu(pmFilterMenu, OnFarmEvents1);
   BuildOnFarmEventsMenu(pmFilterMenu, OnFarmEvents2);



   miPhoneLink.Enabled := def.Definition.dUsePhoneLink;
   miPDALink.Enabled := def.Definition.dUsePhoneLink; // PhoneLink module will include PDA

   ksbDownloadInstaller.Visible := not FileExists(ApplicationPath + cKInstallerProgram);

   miFacilitator.Visible := WinData.AdvisoryRoleActive;

   CurrIndex := 'SortAnimalNo';
   SortAsc := TRUE;
   ShowIcon.Active := TRUE;

   // set id event flag - 8/12/00 - kr
   WinData.IDEvent := False;

   // fill in tips - kr 19/10/00
   if WinData.ShowHints then
      try
         Reg.RootKey := HKEY_CURRENT_USER;
         if (Reg.OpenKey('Software\Kingswood\KHMTips',False)) then
            AMTip.LoadFromRegistry('Software\Kingswood\KHMTips',True)
         else
            try
               AMTip.TipsToShow.LoadFromFile(ApplicationPath + 'KHMTips.txt');
            except
               messagedlg('Tips are unavailable - Please contact Kingswood',mtInformation,[mbOK],0);
            end;
      finally
         Reg.Free;
      end;

   if WinData.ActiveFilter then
      WinData.ActiveFilter := False;

   cbDefaultHerd.Value := IntToStr(WinData.UserDefaultHerdID);
   SetupForm;


   if ( WinData.AnimalFileByID.Active ) and (WinData.AnimalFileByID.RecordCount > 0 ) then
      WinData.AnimalFileByID.First;

   if Def.Definition.dUsePhoneLink then
      begin
         if ( WinData.PDALinkExport <> nil ) then
            ExportToPDA.Enabled := WinData.PDALinkExport.Active;
      end;

   RunPDAHerdInstaller.Enabled := PDAHerdInstallerExists;
   RunPDAFieldsInstaller.Enabled := PDAFieldsInstallerExists;


   lRecNo.Caption := '';
   UpdateStatusBar;
   AnimalCartFiltered := False;

//   BreedingPageControl.TabWidth := ( BreedingPageControl.Width DIV BreedingPageControl.PageCount) -5;
   SetUpQuery(True);

   SetSearchPanelVisible(not WinData.GlobalSettings.AnimalGridHideSearchBar);
end;

procedure TMenuForm.FormDestroy(Sender: TObject);
begin
   if pmHeatBullingEvent <> nil then
      FreeAndNil(pmHeatBullingEvent);
   if pmServiceEvent <> nil then
      FreeAndNil(pmServiceEvent);
   if pmScanPDEvent <> nil then
      FreeAndNil(pmScanPDEvent);
   if pmDryOffEvent <> nil then
      FreeAndNil(pmDryOffEvent);
   if pmVetTreatmentsEvent <> nil then
      FreeAndNil(pmVetTreatmentsEvent);
   if pmWeighingEvent <> nil then
      FreeAndNil(pmWeighingEvent);
   if pmDisbuddingEvent <> nil then
      FreeAndNil(pmDisbuddingEvent);
   if pmCastrationEvent <> nil then
      FreeAndNil(pmCastrationEvent);
   if pmStartMealFeedEvent <> nil then
      FreeAndNil(pmStartMealFeedEvent);
   if pmWeaningEvent <> nil then
      FreeAndNil(pmWeaningEvent);
   if pmPurchaseEvent <> nil then
      FreeAndNil(pmPurchaseEvent);


   StoreAnimalGridView;
   // Set MenuForm's window proc back to it's original procedure
   SetWindowLong(MenuForm.Handle,GWL_WNDPROC,LongInt(OldWindowProc));
end;

procedure TMenuForm.sbFiltersClick(Sender: TObject);
begin
   fFilters.ShowForm;
   //sbClearFilter.Visible := WinData.ActiveFilter;
   //sbFilterMenu.Enabled := WinData.ActiveFilter;
end;

procedure TMenuForm.KingswoodHerdManagement1Click(Sender: TObject);
begin
   Application.Restore;
   Application.BringToFront;
end;

procedure TMenuForm.Weighing1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      uWeighingFilt.ShowTheForm;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.sbActivitiesSinceLastTestClick(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      uActiv.ShowForm;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.sbMilkSysRecClick(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      WinData.CreateAndShowForm(TfMilkRecSysScr);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.sbMilkDiskReviewClick(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      uMilkDiskReview.CreateAndShow;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.sbAnimalsPaddocks1Click(Sender: TObject);
begin
   sbAnimalsPaddocks.Enabled := False;
   try
      WinData.CallProg.Fields;
   finally
      sbAnimalsPaddocks.Enabled := True;
   end;
end;

procedure TMenuForm.eNatIDNumExit(Sender: TObject);
//var
//   NewNatID : String;
begin
{   eAnimalNo.Text := '';
   if WinData.UseScanner then
      begin
         if ( Length ( eNatIDNum.Text ) > 0 ) then
            begin
               Screen.Cursor := crHourGlass;
               cxAnimalGridView.DataController.BeginLocate;
               try
                  cxAnimalGridView.DataController.Dataset.First;
                  if not cxAnimalGridView.DataController.Dataset.Locate('SearchNatID',eNatIDNum.Text ,[]) then
                     begin
                        cxAnimalGridView.DataController.FocusedRowIndex := 0;
                        ShowMessage('Cannot find Nat. Id. No.:' + eNatIDNum.Text);
                     end
               finally
                  cxAnimalGridView.DataController.EndLocate;
                  Screen.Cursor := crDefault;
               end;
            end;
      end;}
end;

procedure TMenuForm.ShowHintsatStartupClick(Sender: TObject);
begin
   if ShowHintsatStartUp.Checked then
      ShowHintsatStartUp.Checked := FALSE
   else
      ShowHintsatStartUp.Checked := TRUE;
   WinData.ShowHints := ShowHintsatStartUp.Checked;
end;

procedure TMenuForm.AMTipExecuted(Sender: TObject; StartNextTime: Boolean);
begin
   WinData.ShowHints := StartNextTime;
end;

procedure TMenuForm.sbBeefPurchGrpRepClick(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      uPurchGrpRep.ShowTheForm;
   finally
      EnableBtn(Sender);
   end;
end;

function TMenuForm.CheckAnimalOKforBreeding : Boolean;
begin
   // Assumes you are using the Current record from the Animals Table
   RESULT := FALSE;
   if NOT ( WinData.AnimalFileByIDBreeding.AsBoolean ) then // Must be a breeding Animal
      ShowMessage('Animal is marked as NOT used for Breeding')
   else if ( WinData.AnimalFileByIdSex.Value = 'Female' ) then // Check the Animal Sex
      RESULT := TRUE
   else if ( WinData.AnimalFileById.IsEmpty ) then
      ShowMessage('No Animals Showing')
   else
      ShowMessage('This is a Male Animal');
end;

procedure TMenuForm.sbICBFRegClick(Sender: TObject);
begin
   uICBFEventExport.ShowTheForm;
end;

procedure TMenuForm.BackUpTimerTimer(Sender: TObject);
begin
   // if menuform is active call backup every hour
   // else > one hour and not active change timer to every 5 seconds
   // until menuform is reactivated and call backup  -  added 31/3/00 kr
   if Self.Active then
      begin
         if MessageDlg('It has been one hour since you opened this program.'+#13+
                       'Would you like to back-up your information?',
                                      mtInformation,[mbYes,mbNo],0) = mrYes then
            begin
               sbBackupClick(Sender)
            end
         else
            try
               // close & re-open tables and database
               WinData.KingData.CloseDataSets;
               WinData.OpenTables;

            except
               ShowMessage('An Error has occured with the Database - ReStart Program' +
                            #13#13 + 'If problem persists Contact Kingwood');
            end;
         Backuptimer.Interval := 3600000;
      end
end;

procedure TMenuForm.AutoBackup1Click(Sender: TObject);
begin
   if AutoBackup1.Checked = True then
      begin
         BackUpTimer.Interval := 0;
         AutoBackUp1.Checked  := False;
      end
   else
      begin
         BackUpTimer.Interval := 360000;
         AutoBackUp1.Checked  := True;
      end;
end;

procedure TMenuForm.sbFeedPurchClick(Sender: TObject);
begin
   WinData.FdStkEvents.Append;
   WinData.CreateAndShowForm(TfFeedPurch);
end;

procedure TMenuForm.sbFeedAllocClick(Sender: TObject);
begin
   // Kill the link to AnimalFileByID

   WinData.FeedEvents.DisableControls;
   WinData.FeedEvents.MasterFields := '';
   WinData.FeedEvents.MasterSource := nil;

   uFeedAlloc.ShowTheForm(0);

   // Reset the link to AnimalFileByID
   WinData.FeedEvents.MasterFields := 'ID';
   WinData.FeedEvents.MasterSource := Windata.AnimalSourceByID;
   WinData.FeedEvents.EnableControls;

end;

procedure TMenuForm.Manufacturers1Click(Sender: TObject);
begin
   uManufacturers.ShowTheForm(TRUE);
end;

procedure TMenuForm.sbAccountsClick(Sender: TObject);
begin
   if sbReports.Down then
      WinData.CreateAndShowForm(TfmAccsReps)
   else
      begin
         sbAccounts.Enabled := False;
         try
            if Definition.dUseKingsAccs then
               WinData.CallProg.Accounts(' M ' + RegistrySerialNum, WinData.UserDefaultHerdID)
            else
               WinData.CallProg.Accounts(' M ', WinData.UserDefaultHerdID);
         finally
            sbAccounts.Enabled := True;
         end;
      end;
end;

procedure TMenuForm.sbSheepClick(Sender: TObject);
begin
   sbSheep.Enabled := False;
   try
      WinData.CallProg.Sheep;
   finally
      sbSheep.Enabled := True;
   end;
end;

procedure TMenuForm.sbReportGenerator(Sender: TObject);
var
   ButtonName : string;
begin
   EnableBtn(Sender);
   try
      RefreshForm;
      // hint should have been used!
      if ( Sender is TMenuItem ) then
         ButtonName := (Sender As TMenuItem).Name
      else
         ButtonName := (Sender As TSpeedButton).Name;

      // check sender then open report generator and pass parameters
      if ((ButtonName = 'sbHerdRG') or (ButtonName = 'miHerdRG')) then
         WinData.CallProg.ReportGenerator(rgmHerd)
      else if ((ButtonName = 'sbHealthRG') or (ButtonName = 'miHealthRG')) then
         WinData.CallProg.ReportGenerator(rgmHealth)
      else if ((ButtonName = 'sbCowFertilityRG') or (ButtonName = 'miFertRepGen')) then
         WinData.CallProg.ReportGenerator(rgmCowFertility)
      else if  ((ButtonName = 'sbPedigreeRG') or (ButtonName = 'miPedigreeRG')) then
         WinData.CallProg.ReportGenerator(rgmPedigree)
      else if  ((ButtonName = 'sbCalfPerformance') or (ButtonName = 'miCalfPerform')) then
         WinData.CallProg.ReportGenerator(rgmCalfPerformance)
      else if  ((ButtonName = 'sbMilkReportGeneratorRG') or (ButtonName = 'miMilkReportGeneratorRG')) then
         WinData.CallProg.ReportGenerator(rgmMilkPerformance);

   finally
      EnableBtn(Sender);
   end;

end;

procedure TMenuForm.FeedTypes1Click(Sender: TObject);
begin
   uFeedTypes.ShowTheForm(TRUE);
end;

procedure TMenuForm.AMTipBtnCloseClick(Sender: TObject);
begin
   // save any tip changes
   AMTip.SaveToRegistry('Software\Kingswood\KHMTips');
end;

// introduced 24/20/00 - kr - Redone later SP
procedure TMenuForm.PartialSearch(const StartIndex : Integer);
//begin
{   // loop thro' table for match
   while NOT WinData.AnimalSourceByID.DataSet.Eof do
      begin
         // exit if found
         if WinData.ActiveFilter then
            begin
               if (Pos(UpperCase(ePartialSearch.Text), UpperCase(WinData.AnimalSourceByID.DataSet.FieldByName('NatIDNum').AsString)) > 0)
                  and (WinData.FilteredAnimals.Locate('AID',WinData.AnimalSourceByID.DataSet.FieldByName('ID').AsInteger,[])) then
                  Exit;
               WinData.AnimalSourceByID.DataSet.Next;
            end
         else
            begin
               if (Pos(UpperCase(ePartialSearch.Text),UpperCase(WinData.AnimalSourceByID.DataSet.FieldByName('NatIDNum').AsString)) > 0) then
                  Exit;
               WinData.AnimalSourceByID.DataSet.Next;
            end;
      end;

   // if not found
   if WinData.AnimalSourceByID.DataSet.Eof then
      begin
         Messagedlg('There has been no further match found for "'+ePartialSearch.Text+'"',mtInformation,[mbOK],0);
         WinData.AnimalSourceByID.DataSet.First;
         sbLocate.Caption := 'Start';
      end;
}
{var
   NatIDValue : String;
   NatIdColIndex : Integer;
   OrigNatIDSearch : Boolean;
   i : Integer;
   RecFound : Boolean;
   NatIDStr : string;
   MessageSubText : String;
   }
begin

   // Start to Search for this Animals National ID
(*   Screen.Cursor := crHourGlass;
   try
      if Length(Trim(ePartialSearch.Text)) > 0 then
         begin
            NatIDValue := WinData.StripAllNomNumAlpha(UPPERCASE(ePartialSearch.Text));
            OrigNatIDSearch := Pos(' ', NatIDValue) > 0;
            if OrigNatIDSearch then
               NatIdColIndex := cxAnimalGridViewNatIDNum.Index
            else
               NatIdColIndex := cxAnimalGridViewSearchNatID.Index;

            with cxAnimalGridView.DataController do
               begin
                  RecFound := False;
                  for i := StartIndex to RecordCount - 1 do
                     begin
                        NatIDStr := VarToStr(Values[ i, NatIdColIndex]);
                        if Pos( NatIDValue, NatIDStr) > 0 then
                           begin
                              cxAnimalGridView.DataController.FocusedRecordIndex := i;
                              RecFound := True;
                              Break;
                           end;
                     end;
               end;

            if not RecFound then
               begin
                  if StartIndex > 0 then
                     MessageSubText := 'further '
                  else
                     MessageSubText := '';
                  cxAnimalGridView.DataController.FocusedRowIndex := 0;
                  MessageDlg(Format('Partial search "%s" did not return any %sresults.',[ePartialSearch.Text,MessageSubText]),mtInformation,[mbOK],0)
               end;
         end;
   finally
      Screen.Cursor := crDefault;
   end; *)
end;

procedure TMenuForm.ePartialSearchKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   //
end;

procedure TMenuForm.sbRationCalcClick(Sender: TObject);
begin
   WinData.CallProg.RationCalc;
end;

procedure TMenuForm.EuroClick(Sender: TObject);
begin
   Euro.Checked := True;
   Pound.Checked := False;
   WinData.ReportInEuro := Euro.Checked;
end;

procedure TMenuForm.PoundClick(Sender: TObject);
begin
   Pound.Checked := True;
   Euro.Checked := False;
   WinData.ReportInEuro := Euro.Checked;
end;

procedure TMenuForm.SpeedButton1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      RefreshForm;
      WinData.CreateAndShowForm(TfRestrictAnimals);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.SpeedButton2Click(Sender: TObject);
begin
{   EnableBtn(Sender);
   try
      RefreshForm;
      uSlghtPremRep.ShowTheForm;
   finally
      EnableBtn(Sender);
   end;
}
end;

procedure TMenuForm.sbPrintClick(Sender: TObject);
begin
 {  with TfGridPrint.Create(nil) do
      try
         Print;
      finally
         Free;
      end; }
end;

procedure TMenuForm.SlaughterPremiumReport1Click(Sender: TObject);
begin
   // Show the Slaughter Premium Report.
   //uSlghtPremRep.ShowTheForm;
end;

procedure TMenuForm.RestrictedAnimalsReport1Click(Sender: TObject);
begin
   // Show the Restricted Animals Report.
   WinData.CreateAndShowForm(TfRestrictAnimals);
end;

procedure TMenuForm.rgCurrencyClick(Sender: TObject);
begin
{   if rgCurrency.ItemIndex = 0 then
      Windata.ReportInEuro := True
   else
      Windata.ReportInEuro := False;
}
end;

function TMenuForm.ShowParlourLink: Boolean;
var
   ParlinkPath : String;
begin
   Result := False;
   ParlinkPath := ExtractFilePath(ParamStr(0))+'Parlink.exe';
   try
      if FileExists(ParlinkPath) and ( Def.Definition.dUseParlour )then
         Result := True
      else
         Result := False;
   except
   end;
end;

function TMenuForm.ShowRationCalcLink: Boolean;
var
   RationCalcPath : String;
begin
   Result := False;
   RationCalcPath := ExtractFilePath(ParamStr(0))+'Ration.exe';
   try
      if FileExists(RationCalcPath) and ( Def.Definition.dUseRationCalc )then
         Result := True
      else
         Result := False;
   except
   end;
end;

procedure TMenuForm.SpeedButton11Click(Sender: TObject);
begin
   //WinData.CreateAndShowForm(TPremiaPayments);
end;

procedure TMenuForm.sbHerdStatsClick(Sender: TObject);
begin
   try
      Application.CreateForm(TfmHerdStatistics, fmHerdStatistics);
      fmHerdStatistics.ShowModal;
   finally
      fmHerdStatistics.Free;
   end;
end;

procedure TMenuForm.sbPedigreeRegClick(Sender: TObject);
begin
   if WhichReg = Ireland then
      uICBFEventExport.ShowTheForm
   else // for both NI and England
      begin
         cxAnimalGridView.DataController.BeginFullUpdate;
         try
            uHFSCalfReg.ShowForm;
         finally
            cxAnimalGridView.DataController.EndFullUpdate;
         end;
      end;
end;

procedure TMenuForm.sbRegistrationClick(Sender: TObject);
begin
   CheckSelectedHerd;
   if WhichReg = NIreland then
      uAPHISRegistration.ShowForm(APHISBirths)
   else if WhichReg = England then
      TfmCTSWSBirthReg.Execute
   else
      uCalfRegFlt.ShowForm;
   if ReloadSetupQuery then
      begin
         ReloadSetupQuery := false;
         SetUpQuery();
      end;
end;

procedure TMenuForm.DefaultAccsCompany1Click(Sender: TObject);
begin
   WinData.CreateAndShowForm(TAccDefComp);
end;

function TMenuForm.ShowAccsDef: Boolean;
begin
   Result := False;
   try
      if FileExists('C:\KingsAcc\WinAccs.exe') then
         Result := True
      else
         Result := False;
   except
   end;
end;

procedure TMenuForm.ConditionScore1Click(Sender: TObject);
var
   FormCaption : String;
   Tag : Integer;
begin

   if ( Sender is TMenuItem ) then
      begin
         Tag := (Sender as TMenuItem).Tag;
         FormCaption := (Sender As TMenuItem).Caption;
      end
   else if ( Sender is TSpeedButton ) then
      begin
         Tag := (Sender as TSpeedButton).Tag;
         FormCaption := (Sender As TSpeedButton).Caption;
      end
   else if ( Sender is TRxSpeedButton ) then
      begin
         Tag := (Sender as TRxSpeedButton).Tag;
         FormCaption := (Sender As TRxSpeedButton).Caption;
      end;

   if ( Tag > -1 ) then

   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
         Case Tag of
                { Condition Score }
            0 : if (WinData.AnimalFileByIDSex.AsString <> 'Female') then
                   MessageDlg('Animal sex must be female!',mtInformation,[mbOK],0)
                else
                   uMPEvents.ShowTheForm(ECON, AddAWE, FormCaption);
                { Castrate }
            1 : if (WinData.AnimalFileByIDSex.AsString <> 'Bull') then
                   MessageDlg('Animal sex must be a Bull!',mtInformation,[mbOK],0)
                else
                   begin
                      uMPEvents.ShowTheForm(ECST, AddAWE, FormCaption);
                      SetUpQuery;
                   end;
                { Abortion }
            2 : if (WinData.AnimalFileByIDSex.AsString <> 'Female') then
                   MessageDlg('Animal sex must be female!',mtInformation,[mbOK],0)
                else
                   uMPEvents.ShowTheForm(EABR, AddAWE, FormCaption);
                { Diagnose Problem }
            3 : if (WinData.AnimalFileByIDSex.AsString <> 'Female') then
                   MessageDlg('Animal sex must be female!',mtInformation,[mbOK],0)
                else
                   uMPEvents.ShowTheForm(EDNP, AddAWE, FormCaption);
                { Embryo Implant/Transfer }
            4 : if (WinData.AnimalFileByIDSex.AsString <> 'Female') then
                   MessageDlg('Animal sex must be female!',mtInformation,[mbOK],0)
                else
                   uMPEvents.ShowTheForm(EIMP, AddAWE, FormCaption);
                { Mastitis }
            5 : if WinData.AnimalFileByIDSex.AsString <> 'Female' then
                   MessageDlg('Animal sex must be female!',mtInformation,[mbOK],0)
                else
                   uMPEvents.ShowTheForm(EMST, AddAWE, FormCaption);
                { To be Cull *** Check what Sex conditions apply }
            6 : uMPEvents.ShowTheForm(ETBC, AddAWE, FormCaption);
                { Wean }
            7 : if ((WinData.AnimalFileByIDSex.AsString <> 'Female') AND (WinData.AnimalFileByIDLactNo.AsInteger > 0)) then
                   MessageDlg('Animal sex must be female!',mtInformation,[mbOK],0)
                else
                   uMPEvents.ShowTheForm(EWNC, AddAWE, FormCaption);
                { Internal Exam }
            8 : if WinData.AnimalFileByIDSex.AsString <> 'Female' then
                   MessageDlg('Animal sex must be female!',mtInformation,[mbOK],0)
                else
                   uMPEvents.ShowTheForm(EINT, AddAWE, FormCaption);
                { Run Bull In }
            9 : if WinData.AnimalFileByIDSex.AsString <> 'Female' then
                   MessageDlg('Animal sex must be female!',mtInformation,[mbOK],0)
                else
                   uMPEvents.ShowTheForm(ERBI, AddAWE, FormCaption);
                { Run Bull Out }
            10: if WinData.AnimalFileByIDSex.AsString <> 'Female' then
                   MessageDlg('Animal sex must be female!',mtInformation,[mbOK],0)
                else
                   uMPEvents.ShowTheForm(ERBO, AddAWE, FormCaption);
            11: uMPEvents.ShowTheForm(EMLF, AddAWE, FormCaption);
            12: uMPEvents.ShowTheForm(EDBU, AddAWE, FormCaption)
         end;
end;

procedure TMenuForm.PremiaValues1Click(Sender: TObject);
begin
//   WinData.CreateAndShowForm(TfExtDefaults);
end;

function TMenuForm.GetDefCountry: TCountry;
begin
   Result := Ireland;
   if cbDefaultHerd.Value = '0' then
      Result := Ireland
   else if WinData.OwnerFile.Locate('ID', cbDefaultHerd.Value,[] ) then
      if WinData.OwnerFile.FieldByName('Country').AsInteger = 12 then
         Result := NIreland
      else if WinData.OwnerFile.FieldByName('Country').AsInteger = 1 then
         Result := Ireland
      else
         Result := Other;
end;

procedure TMenuForm.SetDataSources;
begin
   { Assign at runtime, due to corruption in linking to dairy data. }
//   AnimalGridNav.DataSource   := WinData.AnimalSourceByID;
   cbDefaultHerd.LookupSource := WinData.dsHerdDefaults;
   riEventTypes.Properties.ListSource := HerdLookup.dsEventTypes;
   riHerdCombo.Properties.ListSource := WinData.dsHerdDefaults;
end;

procedure TMenuForm.SpeedButton19Click(Sender: TObject);
begin
   uBBPPurchScr.CreateAndShow;
end;

procedure TMenuForm.pBeefSalesClick(Sender: TObject);
begin
   ShowFactorySales;
end;

procedure TMenuForm.pFileImportClick(Sender: TObject);
var
   DatabaseUpdated : Boolean;
begin
   UKImport.CreateShowForm(TPurchase, DatabaseUpdated, False);
   Application.ProcessMessages;

   if DatabaseUpdated then
      begin

         Menuform.Enabled := False; // prevent any clicking during database operations
         try
            WinData.KingData.CloseDataSets; // Close the Dataset
            WinData.OpenAndCheckTables;
            SetupQuery(True);
         finally
            Menuform.Enabled := True; // Release
         end;

      end;
end;

procedure TMenuForm.pFileExportClick(Sender: TObject);
var
   DatabaseUpdated : Boolean;
begin
   UKImport.CreateShowForm(TSaleDeath, DatabaseUpdated, False);
   Application.ProcessMessages;

   if DatabaseUpdated then
      begin

         Menuform.Enabled := False; // prevent any clicking during database operations
         try
            WinData.KingData.CloseDataSets; // Close the Dataset
            WinData.OpenAndCheckTables;
            SetupQuery(True);
         finally
            Menuform.Enabled := True; // Release
         end;

      end;
end;

procedure TMenuForm.Panel8Click(Sender: TObject);
begin
   CheckSelectedHerd;
   uEventsByGroup.ShowTheForm(TNoEvent,True,True);
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.bPremiumClick(Sender: TObject);
begin
   if bPremium.Visible Then
      begin
         HideAll;
         bPremium.Down := True;
         pCalfRegCMMS.Top := BreedingPageControl.Top;
         pCalfRegCMMS.left := BreedingPageControl.left;
//         pCalfRegCMMS.Top := pBreeding.Top;
  //       pCalfRegCMMS.left := pBreeding.left;
         LPremium.Show;                          
         pCalfRegCMMS.Show;
         bPremium.font.Color := clBlue;
         bPremium.font.Style := [fsUnderline];
      end;
end;

procedure TMenuForm.bBreedingClick(Sender: TObject);
begin
   if bBreeding.Visible Then
      begin
         HideAll;
         bBreeding.Down := True;
         Lbreeding1.Show;
         LBreeding2.Show;
//         pBreeding.show;
         BreedingPageControl.show;
         bBreeding.font.Color := clBlue;
         bBreeding.font.Style := [fsUnderline];
      end;
end;

procedure TMenuForm.bMovementsClick(Sender: TObject);
begin
   If bMovements.Visible Then
      begin
         HideAll;
         bMovements.Down := True;
         pMovements.Top := BreedingPageControl.Top;
         pMovements.left := BreedingPageControl.left;
//         pMovements.Top := pBreeding.Top;
//         pMovements.left := pBreeding.left;
         lMovements.show;
         pMovements.show;
         bMovements.font.Color := clBlue;
         bMovements.font.Style := [fsUnderline];
      end;
end;

procedure TMenuForm.sbExtensLivestkProjClick(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      RefreshForm;
      uLivestockSum.ShowTheForm(Extens, nil);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.sbRepLivestkInventClick(Sender: TObject);
begin
  { EnableBtn(Sender);
   try
      RefreshForm;
      uLivestockSum.ShowTheForm(RepsStkInvent, nil);
   finally
      EnableBtn(Sender);
   end;}
end;

procedure TMenuForm.InterHerdClick(Sender: TObject);
begin
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
   begin
      uInterHerd.ShowInterHerd(AddInterHerd);
      SetUpQuery;
   end;
end;

procedure TMenuForm.ReplaceClick(Sender: TObject);
begin
{   if WinData.AnimalFileByIDSex.AsString <> 'Female' then
      MessageDlg('This is not a female animal',mtInformation,[mbOK],0)
   else
      begin
         if WinData.IsAnimalUnderRetention(WinData.AnimalFileByIDID.AsInteger,0) then
            begin
               if WinData.CheckEvents.Locate('AnimalID;EventType', VarArrayOf([WinData.AnimalFileByIDID.AsInteger, CSaleDeathEvent]),[]) then
                  uSuckSubstitute.ShowForm(WinData.AnimalFileByIDID.AsInteger,'',WinData.CheckEvents.FieldByName('EventDate').AsDateTime)
               else
                  MessageDlg('You can only replace an animal that has a Sale/Death event recorded',mtInformation,[mbOK],0);
            end;
      end;}
end;

procedure TMenuForm.cbSearch8Click(Sender: TObject);
begin
{   with cbSearch do
     if Checked then
        begin
           Font.Color := clBlue;
           PSearch.Height := 89;
        end
     else
        begin
           Font.Color := clBlack;
           PSearch.Height := 23;
        end;

   Bevel1.Width := PSearch.Width-1;

   //eAnimalNo.Text := '';

   //eNatIDNum.Text := '';
   SetNatIDSearchText;
//   ePartialSearch.Text := '';
   //eAnimalNo.SetFocus;
   // Load NatID Mask Here!
   }
end;

procedure TMenuForm.ePartialSearchChange(Sender: TObject);
begin
{   if sbLocate.Caption <> 'Start' then
      begin
        sbLocate.Width := 43;
        sbLocate.Caption := 'Start';
      end;}
end;

procedure TMenuForm.sbLocateClick(Sender: TObject);
//var
  //StartIndex : Integer;
begin
{   if Length(Trim(ePartialSearch.Text)) > 0 then
      begin
         Screen.Cursor := crHourGlass;
         try
            if sbLocate.Caption = 'Start' then
               begin
                  StartIndex := 0;
                  sbLocate.Width := 57;
                  sbLocate.Caption := 'Continue';
               end
            else
               begin
                  StartIndex := cxAnimalGridView.DataController.FocusedRecordIndex+1;
               end;
            if StartIndex < 0 then StartIndex := 0;
            PartialSearch(StartIndex);
         finally
            Screen.Cursor := crDefault;
         end;
      end;}
end;

procedure TMenuForm.sbNatIdSearchResetClick(Sender: TObject);
begin
//   eAnimalNo.Text := '';
   SetNatIDSearchText;
//   eNatIDNum.Text := 'IE';
end;

procedure TMenuForm.sbAnimalViewClick(Sender: TObject);
begin
   ViewAnimal;
end;

procedure TMenuForm.RefreshForm;
begin
   MenuForm.Refresh;
end;

procedure TMenuForm.sbFertAnalysisClick(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      FertAnalysisRpt.ShowTheForm;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.LWClick(Sender: TObject);
begin
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
      uPreSale.ShowPreSale(AddPreSale);
//      uSalesDeaths.ShowSalesDeaths(AddSaleDeath, True);
end;

procedure TMenuForm.CreateMooreParkExportFile1Click(Sender: TObject);
begin
   CheckSelectedHerd;
   Update;
   MooreParkExport.CreateExportFile(WinData.UserDefaultHerdID);
   Update;
end;

procedure TMenuForm.sbSalesPlannerClick(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      SaleEligibility.CreateAndShow(rtSalesPlanner);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.DiseaseTestStatus1Click(Sender: TObject);
begin
   RefreshForm;
   // KB's TB test Date Report
   uTBTestDtRep.ShowTheForm;
end;

procedure TMenuForm.RestrictedAnimalsReport2Click(Sender: TObject);
begin
   RefreshForm;
   WinData.CreateAndShowForm(TfRestrictAnimals);
end;

procedure TMenuForm.SalesPlanner1Click(Sender: TObject);
begin
  SaleEligibility.CreateAndShow(rtSalesPlanner);
end;

procedure TMenuForm.PremiumHistoryEligibility1Click(Sender: TObject);
begin
   RefreshForm;
   StockInHerdFilt.ShowForm(Premiums);
end;

procedure TMenuForm.StockingDensityRestrictions1Click(Sender: TObject);
begin
{   RefreshForm;
   if cbDefaultHerd.Text = 'All Herds' then
      MessageDlg(cAllHerdsSelected +' before'+#13+'entering to Stocking Density Restrictions',mtinformation,[mbok],0);
   if WinData.OwnerFile.Locate('ID',cbDefaultHerd.Value,[] ) then
      if WinData.OwnerFile.FieldByName('Country').AsInteger <> 1 then
         uApplications.ShowTheForm(NIreland, True)
      else
         uApplications.ShowTheForm(Ireland, True);}
end;

procedure TMenuForm.Extensification1Click(Sender: TObject);
begin
   RefreshForm;
   uLivestockSum.ShowTheForm(Extens, nil);
end;

procedure TMenuForm.SlaughterPremium1Click(Sender: TObject);
begin
   HerdPassword.CreateAndShow(SlaughterPremiums);
end;

procedure TMenuForm.BeefPremium1Click(Sender: TObject);
begin
   HerdPassword.CreateAndShow(BeefPremiums);
end;

procedure TMenuForm.ReLinkCalves1Click(Sender: TObject);
begin
   HerdPassword.CreateAndShow(CalvingEvents);
end;

procedure TMenuForm.KingswoodComputing1Click(Sender: TObject);
begin
   ShellExecute(Self.Handle,'open','mailto:info@kingswood.ie',nil,nil,SW_SHOWNORMAL);
end;

procedure TMenuForm.Bandon1Click(Sender: TObject);
begin
   ShellExecute(Self.Handle,'open','mailto:ereg@sws.ie',nil,nil,SW_SHOWNORMAL);
end;

procedure TMenuForm.ICBF1Click(Sender: TObject);
begin
   ShellExecute(Self.Handle,'open','mailto:animalevents@icbf.com',nil,nil,SW_SHOWNORMAL);
end;

procedure TMenuForm.EnableBtn(Sender: TObject);
begin
   if Sender is TSpeedButton then
      with (Sender as TSpeedButton) do // SP 30/09/2002
         Enabled := not Enabled;
         {if Enable then
            Enabled := True
         else
            Enabled := False;
         }
end;

procedure TMenuForm.CheckPhoneLinkOnStartupClick(Sender: TObject);
begin
   // SP 27/09/2002
   if CheckPhoneLinkOnStartup.Checked then
      CheckPhoneLinkOnStartup.Checked := False
   else
      CheckPhoneLinkOnStartup.Checked := True;
   WinData.SearchPhoneLink  := CheckPhoneLinkOnStartup.Checked;
   // SP 27/09/2002.
end;

procedure TMenuForm.InventoryValuations1Click(Sender: TObject);
begin
   WinData.CreateAndShowForm(TfmLiveStockValues);
end;

procedure TMenuForm.NokiaLink1Click(Sender: TObject);
begin
   NokiaLink1.Checked := True;
   SiemensGSMModule1.Checked := False;
end;

procedure TMenuForm.sbParlourClick(Sender: TObject);
begin
   WinData.CallProg.ParlourLink;
end;

procedure TMenuForm.LoadAllAnimals(bSaleDeaths : Boolean);
begin
   cxAnimalGridView.DataController.BeginFullUpdate;
   WinData.AnimalFileByID.DisableControls;
   try
      WinData.AnimalFileByID.Active := False;
      WinData.AnimalFileByID.SQL.Clear;
      WinData.AnimalFileByID.SQL.Add('SELECT * FROM Animals A    ');
      WinData.AnimalFileByID.SQL.Add('WHERE (AnimalDeleted=FALSE)');
      if not bSaleDeaths then
         WinData.AnimalFileByID.SQL.Add('AND InHerd = True        ');
      DoGridSort;
      WinData.AnimalFileByID.Prepare;
      WinData.AnimalFileByID.Active := True;
      WinData.MoveIDsToAFilter;
   finally
      WinData.AnimalFileByID.EnableControls;
      cxAnimalGridView.DataController.EndFullUpdate;
   end;
end;

procedure TMenuForm.cbAllAnimalsClick(Sender: TObject);
begin
   Update;
   Enabled := False;
   try
      WinData.ShowAllAnimals := cbAllAnimals.Checked;
      if cbAllAnimals.Checked then
         begin
            color := clWhite;
            cbAllAnimals.Font.Color := clBlue;
            AllAnimalsShowing := True;
            LastHerdID := WinData.UserDefaultHerdID;
            Screen.Cursor := crHourglass;
            cbDefaultHerd.KeyValue := AllHerds;
            Screen.Cursor := crHourglass;
            try
               Update;
               LoadAllAnimals(True);
            finally
               Screen.Cursor := crDefault;
            end;
         end
      else
         begin
            color := clBtnFace;
            cbAllAnimals.Font.Color := clBlack;
            cbDefaultHerd.KeyValue := LastHerdID;
            AllAnimalsShowing := False;
            Screen.Cursor := crHourglass;
            try
               Update;
               SetUpQuery(True);
            finally
               Screen.Cursor := crDefault;
            end;
         end;
   finally
      Enabled := True;
      Update;
   end;
end;

procedure TMenuForm.cbAllEventsClick(Sender: TObject);
begin
   if cbFeedEvents.Checked then
      begin
         cbFeedEvents.Font.Color := clBlack;
         cbFeedEvents.Checked := False;
      end;

   if cbAllEvents.Checked then
      begin
         EventGridAnimalEventsViewAnimalLactNo.Options.Filtering := True;
         cbAllEvents.Font.Color := clBlue;
         WinData.Events.MasterFields := 'ID';
      end
   else
      begin
         EventGridAnimalEventsViewAnimalLactNo.Options.Filtering := False;
         cbAllEvents.Font.Color := clBlack;
         WinData.Events.MasterFields := 'ID;LactNo';
      end;
end;

procedure TMenuForm.cbFeedEventsClick(Sender: TObject);
begin
   if cbFeedEvents.Checked then
      begin
         cbFeedEvents.Font.Color := clBlue;
         cbAllEvents.Checked := False;
         cbAllEvents.Font.Color := clBlack;
         cbAllEvents.Enabled := False;
         EventGridLevel.GridView := EventGridFeedEventsView;
      end
   else
      begin
         EventGridLevel.GridView := EventGridAnimalEventsView;
         cbFeedEvents.Font.Color := clBlack;
         cbFeedEvents.Checked := False;
         cbAllEvents.Enabled := True;
         cbAllEventsClick(nil);
      end;
end;

procedure TMenuForm.Settings1Click(Sender: TObject);
begin
   PL := TPhoneLink.Create;
   try
      PL.ShowSettings;
   finally
      PL.Free;
   end;
end;

procedure TMenuForm.Checkfornewevents1Click(Sender: TObject);
begin
   if def.Definition.dUsePhoneLink then
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
            end;
      end;
end;

procedure TMenuForm.Perferences1Click(Sender: TObject);
begin
   Windata.CreateAndShowForm(TfmGlobalSettings);
   SetGridStyles;
   Email1.Visible := ((WinData.SystemRegisteredCountry=Ireland) and (WinData.DefaultEmailClient <> cEmailClient_MS));
   SetSearchPanelVisible(not WinData.GlobalSettings.AnimalGridHideSearchBar); // <<< SetNatIDSearchText; called in this proc
   UpdateBarcodeScannerControls;
end;

procedure TMenuForm.DoGridSort;
begin
   with WinData.AnimalFileByID.SQL do
      begin
         if CurrIndex = '' then
            CurrIndex := 'SortAnimalNo';
         Add('ORDER BY '+CurrIndex+' '); // else just order by AnimalNo
         if SortAsc then
            Add('Asc')
         else
            Add('Desc');
      end;
end;

procedure TMenuForm.SiemensGSMModule1Click(Sender: TObject);
begin
   WinData.PhoneLinkType := plSIEMENS;
   SiemensGSMModule1.Checked := True;
   NokiaLink1.Checked := False;
end;

procedure TMenuForm.Download;

   procedure CloseAndOpenDownloader;
   begin
      WinData.KingData.CloseDataSets;
      WinData.KingData.Close;
      WinExec(PChar(ApplicationPath + 'Kdownload.exe'), SW_SHOWNORMAL);
      Application.Terminate;
      Application.ProcessMessages;
   end;

   procedure CloseAndOpenKInstaller;
   begin
      WinData.KingData.CloseDataSets;
      WinData.KingData.Close;
      WinExec(PChar(ApplicationPath + cKInstallerProgram), SW_SHOWNORMAL);
      Application.Terminate;
      Application.ProcessMessages;
   end;
var
   KInstallerNewVerPath : string;
begin

   if MessageDlg('It is strongly recommended to take a backup before proceeding. '+#13+
                 'Take backup now?',mtConfirmation,[mbYes,mbNo],0) = idYes then
      sbBackupClick(sbBackup);
   Update;
   if MessageDlg('Kingswood Herd will now check for latest update,'+#13+
                  'do you wish to continue ?',mtConfirmation,[mbYes, mbNo],0) = idYes then

   if FileExists( ApplicationPath + cKInstallerProgram ) then
      begin
         Update;
         Screen.Cursor := crHourglass;
         KInstallerNewVerPath := ApplicationPath + 'KInstaller\'+cKInstallerProgram;
         if FileExists(KInstallerNewVerPath) then
            begin
               if CopyFile(PChar(KInstallerNewVerPath), PChar(ApplicationPath + cKInstallerProgram), False) then
                  begin
                     //SysUtils.DeleteFile(ApplicationPath + 'KInstaller\'+cKInstallerProgram);
                     //SysUtils.DeleteFile(ApplicationPath + 'KInstaller\'+cKInstallerUpdate);
                     DeleteDirectory(ApplicationPath + 'KInstaller');
                     CloseAndOpenKInstaller;
                  end
               else
                  MessageDLG('Error installing the Kingswood iInstaller program - contact Kingswood.',mtWarning,[mbOK],0);
            end
         else
            CloseAndOpenKInstaller;
      end
   else if FileExists(ApplicationPath + 'KDownload.exe') or FileExists(ApplicationPath + 'Web\kdownload.zip') then
      begin
         if FileExists(ApplicationPath + 'Web\kdownload.zip') then
            begin
               Update;
               Screen.Cursor := crHourglass;
               if Unzip.Execute(UNZIP_EXTRACT) then
                  begin
                     Screen.Cursor := crDefault;
                     CloseAndOpenDownloader
                  end
               else
                  begin
                     Screen.Cursor := crDefault;
                     MessageDLG('An error has occurred, contact Kingswood',mtWarning,[mbOK],0);
                  end;
            end
         else
            begin
               Update;
               CloseAndOpenDownloader;
            end;
      end
   else
      WinData.CreateAndShowForm(TDownload);
end;

procedure TMenuForm.PLActivate(var msg: TMessage);
begin
   if msg.Msg = WM_PLActivate then
      if not CheckPhoneLinkOnStartup.Checked then
         CheckPhoneLinkOnStartup.Checked := True;
end;

procedure TMenuForm.PLDeActivate(var msg: TMessage);
begin
   if msg.Msg = WM_PLDeActivate then
      if CheckPhoneLinkOnStartup.Checked then
         CheckPhoneLinkOnStartup.Checked := False;
end;

procedure TMenuForm.ShowCrushFile(Sender : TObject);
begin
   uCrushDiskWeigh.ShowTheForm;
end;

procedure TMenuForm.MilkTank1Click(Sender: TObject);
begin
//   WinData.CreateAndShowForm(TfmMilkTankRead);
end;

procedure TMenuForm.RxSpeedButton2Click(Sender: TObject);
begin
   WinData.CreateAndShowForm(TfmMilkTankRead);
end;

procedure TMenuForm.picPreSaleClick(Sender: TObject);
begin
   WinData.CreateAndShowForm(TfmMilkTankRead);
end;

procedure TMenuForm.Blade1Click(Sender: TObject);
begin
   CheckSelectedHerd;
   WinData.CreateAndShowForm(TfmBlade);
end;

procedure TMenuForm.BladeNotRegistered(var msg: TMessage);
begin
   if Msg.Msg = WM_BladeNotRegistered then
      begin
         Blade1.Visible := False;
      end;
end;

procedure TMenuForm.BladeRegistered(var msg: TMessage);
begin
   if Msg.Msg = WM_BladeRegistered then
      begin
         Blade1.Visible := True;
      end;
end;

procedure TMenuForm.TermsofUse1Click(Sender: TObject);
begin
   uSystem.ShowForm(TOU);
end;

procedure TMenuForm.sbHerdReconciliationClick(Sender: TObject);
begin
   CheckSelectedHerd;
   uHerdRec.CreateAndShow(cbDefaultHerd.KeyValue);
end;


procedure TMenuForm.AddSearchNatIDData;
{ Populate SearchNatID Field, strip NatID string of all None Alpha/Num Chars,
  allows user to search on natid without spaces/hyphens etc. }
begin
   with TTable.Create(nil) do
     try
        databasename := 'kingswd';
        tablename := 'animals';
        open;
        while not eof do
           begin
              if Length(FieldByName('NatIDNum').AsString) > 0 then
                 begin
                    Edit;
                    try
                       FieldByName('SearchNatID').AsString := WinData.StripAllNomNumAlpha(UPPERCASE(FieldByName('NatIDNum').AsString));

                       if NatIDKind(FieldByName('NatIDNum').AsString) = nkUK9 then
                          begin
                             FieldByName('LocateNatID').AsString := UK9NatIDNumber.CreateLocateNatID(UPPERCASE(FieldByName('NatIDNum').AsString));
                          end
                       else
                          begin
                             FieldByName('LocateNatID').AsString := WinData.StripAllNomNumAlpha(UPPERCASE(FieldByName('NatIDNum').AsString));
                             if WinData.UseScanner then
                                begin
                                   if Copy(FieldByName('LocateNatID').AsString,1,2) = 'IE' then
                                      FieldByName('LocateNatID').AsString := Copy(FieldByName('LocateNatID').AsString, 3, MaxInt);
                                end;
                          end;
                       Post;
                    except
                       Cancel;
                    end;
                 end;
              Next;
           end;
     finally
        Close;
        Free;
     end;
end;

procedure TMenuForm.WMQueryEndSession(var Message: TWMQueryEndSession);
begin
   Message.Result := 0;
   MessageDlg('Windows shutdown disabled! '+ #13#10 +
              'Please exit from Kingswood Herd before shutting windows down.',mtWarning,[mbOK],0);
end;

procedure TMenuForm.sbHideEventsClick(Sender: TObject);
begin
   sbHideEvents.Down := not sbHideEvents.Down;
   if AnimalsEventsSplitter.State = ssClosed then
      begin
         AnimalsEventsSplitter.State := ssOpened;
         sbHideEvents.Caption := '&Hide Events';
         cbAllEvents.Visible := True;
         cbFeedEvents.Visible := True;
         Update;
      end
   else
      begin
         AnimalsEventsSplitter.State := ssClosed;
         sbHideEvents.Caption := '&Show Events';
         cbAllEvents.Visible := False;
         cbFeedEvents.Visible := False;
         Update;
      end;
end;

procedure TMenuForm.DownloadToPhone1Click(Sender: TObject);
begin
   //uPhoneLinkDownload.ShowTheForm(WinData.UserDefaultHerdID);
end;

procedure TMenuForm.sbDairyBMClick(Sender: TObject);
begin
   with TRationPerformMonitor.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
end;

procedure TMenuForm.UpdateAnimalNumberField1Click(Sender: TObject);
begin
   if TUpdateAnimalNo.DoAnimalNoUpdate then
      SetupQuery;
end;

procedure TMenuForm.AppMinimize(Sender: TObject);
begin
   ShowWindow(Application.Handle, SW_MINIMIZE);
end;

procedure TMenuForm.AppRestore(Sender: TObject);
begin
   ShowWindow(Application.Handle, SW_SHOWNORMAL);
end;

procedure TMenuForm.RunActionLists;
begin
   ActionList := TKActionList.Create;
   try
      if ActionList.Enabled then
        if MessageDlg('Would you like to view Action Reminder Reports now?',mtConfirmation,[mbYes,mbNo],0) = idYes then
           begin
              Update;
              ActionReminderFilt.RunReport(rmProAction, ActionList.ReportsToRun);
           end;
   finally
      FreeAndNil(ActionList);
   end;
end;

procedure TMenuForm.DueService2Click(Sender: TObject);
begin
   EnableBtn(Sender);
   ActionReminderFilter := TActionReminderFilter.Create(nil);
   try
      ActionReminderFilter.pDueForDryingOff.Hide;
      ActionReminderFilter.pDueToCalve.Hide;
      ActionReminderFilter.pDueToPD.Hide;
      ActionReminderFilter.pDueFirstService.Show;
      ActionReminderFilter.Caption := 'Due Service';
      ActionReminderFilter.ShowModal;
   finally
      ActionReminderFilter.Free;
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.DuePregnancyDiagnosis2Click(Sender: TObject);
begin
   EnableBtn(Sender);
   ActionReminderFilter := TActionReminderFilter.Create(nil);
   try
      ActionReminderFilter.pDueForDryingOff.Hide;
      ActionReminderFilter.pDueToCalve.Hide;
      ActionReminderFilter.pDueFirstService.Hide;
      ActionReminderFilter.pDueToPD.Show;
      ActionReminderFilter.Caption := 'Due Pregnancy Diagnosis';
      ActionReminderFilter.ShowModal;
   finally
      ActionReminderFilter.Free;
      EnableBtn(Sender);
   end;

end;

procedure TMenuForm.DueForDryingOff2Click(Sender: TObject);
begin
   EnableBtn(Sender);
   ActionReminderFilter := TActionReminderFilter.Create(nil);
   try
      ActionReminderFilter.pDueFirstService.Hide;
      ActionReminderFilter.pDueToCalve.Hide;
      ActionReminderFilter.pDueToPD.Hide;
      ActionReminderFilter.pDueForDryingOff.Show;
      ActionReminderFilter.Caption := 'Due For Drying Off';
      ActionReminderFilter.ShowModal;
   finally
      ActionReminderFilter.Free;
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.DueToCalve2Click(Sender: TObject);
begin
   EnableBtn(Sender);
   ActionReminderFilter := TActionReminderFilter.Create(nil);
   try
      ActionReminderFilter.pDueForDryingOff.Hide;
      ActionReminderFilter.pDueFirstService.Hide;
      ActionReminderFilter.pDueToPD.Hide;
      ActionReminderFilter.pDueToCalve.Show;
      ActionReminderFilter.Caption := 'Due To Calve';
      ActionReminderFilter.ShowModal;
   finally
      ActionReminderFilter.Free;
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.sbMilkReportGeneratorRGClick(Sender: TObject);
begin
   MessageDlg('The new Milk Analysis Report Generator will be available soon',mtInformation,[mbOK],0)
end;

procedure TMenuForm.sbDairyHealthCertClick(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      WinData.CreateAndShowForm(TDairyHerdHealthCert);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.sbBackupClick(Sender: TObject);
begin
   TfmDataBackup.execute
end;

procedure TMenuForm.sbSCCAnalysisRptClick(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      SCCAnalysis.ShowForm;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.Settings2Click(Sender: TObject);
begin
   WinData.CreateAndShowForm(TPDAReportDefaults);
   if not ExportToPDA.Enabled then // will be disabled before user chooses settings for the first time.
      ExportToPDA.Enabled := True; // only download, reg entries are setup from PDAReportDefaults scr.
end;

procedure TMenuForm.ExportToPDAClick(Sender: TObject);
begin
   CheckSelectedHerd;
   WinData.CreateAndShowForm(TPDAExportSynch);
end;

procedure TMenuForm.CheckSelectedHerd;
begin
   if cbDefaultHerd.Text = 'All Herds' then
      begin
         MessageDlg(cAllHerdsSelected, mtInformation,[mbok],0);
         cbDefaultHerd.DropDown;
         Abort;
      end
end;

procedure TMenuForm.sbCMMSReconClick(Sender: TObject);
var
   Country : TCountry;
begin
   CheckSelectedHerd;
   Country := WinData.DefCountry(WinData.UserDefaultHerdID);
   if Country = NIreland then
      WinData.CallProg.HerdReconciliation
   else if Country = England then
      TfmCTSCattleOnHolding.Execute
   else
      uHerdRec.CreateAndShow(cbDefaultHerd.KeyValue);
end;

procedure TMenuForm.DownloadEvents1Click(Sender: TObject);
begin
   WinData.CreatePDAEvents(True);
end;

procedure TMenuForm.EventGridAnimalEventsViewDblClick(Sender: TObject);
//var
 //  HitTestElement : Integer;
//begin
  // HitTestElement := GetGridElementClassType(EventGridAnimalEventsView);
   //if not ( HitTestElement in [htRecord, 237] ) then
    /////  Exit;
var
  P: TPoint;
  AHitTest: TcxCustomGridHitTest;
begin
  GetCursorPos(P);
  P := TcxGridSite(Sender).ScreenToClient(P);
  AHitTest := TcxGridSite(Sender).GridView.ViewInfo.GetHitTest(P);
  if AHitTest.HitTestCode = htNavigator then  //check if a navigator button has been clicked
    Exit;

    //your code
     Case WinData.EventsEventType.AsInteger Of
      CWeightEvent   : Weighing.ShowWeight(AmendWeight);
      CBullingEvent  : Bullings.ShowBulling(AmendBulling);
      CServiceEvent  : Services.ShowService(AmendService);
      CPregDiagEvent : PregDiag.ShowPD(AmendPD);
      CCalvingEvent  : begin
                          WinData.EventType := TCalving;
                          uCalvings.ShowCalvings(Amending);
                       end;
      CDryOffEvent   : uHealth.ShowHealth(AmendDryingOff);
      CHealthEvent   : uHealth.ShowHealth(AmendHealth);
      CSaleDeathEvent: begin
                          if WinData.AnimalFileByIDInHerd.AsBoolean = True then //Check that InHerd = True for PreSale
//                                uSalesDeaths.ShowSalesDeaths(AmendSaleDeath, True)   //PreSale
                             uPreSale.ShowPreSale(AmendPreSale)
                          else
                             uSalesDeaths.ShowSalesDeaths(AmendSaleDeath, False); //Changed procedure call to include PreSales Boolean.
                       end;
      CPurchaseEvent : begin
                          WinData.EventType := TPurchase;
                          uPurchases.ShowForm;
                          cxAnimalGridView.DataController.BeginFullUpdate;
                          try
                            cxAnimalGridView.DataController.RefreshExternalData;
                          finally
                            cxAnimalGridView.DataController.EndFullUpdate;
                          end;
                       end;
      CMovementEvent   : uTempMovements.ShowMovement(AmendMovement);
      // Moore Park Start,
      CAbortionEvent   : uMPEvents.ShowTheForm(EABR, AmendAWE, Abortion1.Caption);
      CCastrateEvent   : uMPEvents.ShowTheForm(ECST, AmendAWE, Castrate1.Caption);
      CCondScoreEvent  : uMPEvents.ShowTheForm(ECON, AmendAWE, ConditionScore1.Caption);
      CDiagProblemEvent: uMPEvents.ShowTheForm(EDNP, AmendAWE, DiagnoseProblem1.Caption);
      CEmbryoTransEvent: uMPEvents.ShowTheForm(EIMP, AmendAWE, EmbryoImplantTransfer1.Caption);
      CMastitisEvent   : uMPEvents.ShowTheForm(EMST, AmendAWE, Mastitis1.Caption);
      CToBeCulledEvent : uMPEvents.ShowTheForm(ETBC, AmendAWE, TobeCulled1.Caption);
      CWeaningEvent    : uMPEvents.ShowTheForm(EWNC, AmendAWE, Wean1.Caption);
      CIntExamEvent    : uMPEvents.ShowTheForm(EINT, AmendAWE, InternalExam1.Caption);
      CStockBullIn     : uMPEvents.ShowTheForm(ERBI, AmendAWE, BullIn1.Caption);
      CStockBullOut    : uMPEvents.ShowTheForm(ERBO, AmendAWE, BullOut1.Caption);
      CMealFeedingEvent : uMPEvents.ShowTheForm(EMLF, AmendAWE, MealFeeding1.Caption);
      CDisbuddingEvent : uMPEvents.ShowTheForm(EDBU, AmendAWE, Disbudding1.Caption);
      { Moore Park End. }
   end;
   EventGridAnimalEventsView.DataController.RefreshExternalData;

end;

procedure TMenuForm.cxAnimalGridViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
{var
   CalcMonth : TDateTime;
   AnimalSex : String;
   UsedForBreeding : Boolean;
begin
   if ARecord <> nil then
      begin
         if ARecord.Values[cxAnimalGridViewHerdID.Index] = WinData.NONEHerdID then
            begin
               if ARecord.Values[cxAnimalGridViewAncestor.Index] = False then
                  AStyle := cxStyleNoneHerd
               else
                  AStyle := cxStyleNoneHerdAncestor;
            end
         else
            begin
               AnimalSex := ARecord.Values[cxAnimalGridViewSex.Index];
               UsedForBreeding := ARecord.Values[cxAnimalGridViewBreeding.Index];

               if ( not VarIsNull(AnimalSex)) and ( not VarIsNull(UsedForBreeding)) then
                  begin
                     if ( AnimalSex = cSex_Steer ) then
                        begin
                           CalcMonth := IncMonth(Date, -28);
                           if (( ARecord.Values[cxAnimalGridViewDateOfBirth.Index] <= CalcMonth) AND ( ARecord.Values[cxAnimalGridViewBreeding.Index] = False)) then
                              AStyle := cxStyleBeefAnimalOver28Months;
                        end
                     else if ( AnimalSex = cSex_Female ) and (not UsedForBreeding) then
                        begin
                           CalcMonth := IncMonth(Date, -21);
                           if (( ARecord.Values[cxAnimalGridViewDateOfBirth.Index] <= CalcMonth) and (ARecord.Values[cxAnimalGridViewLactNo.Index] = 0)) then
                              AStyle := cxStyleBeefAnimalOver28Months;
                        end
                     else if ( AnimalSex = cSex_Bull ) and (not UsedForBreeding) then
                        begin
                           CalcMonth := IncMonth(Date, -22);
                           if ( ARecord.Values[cxAnimalGridViewDateOfBirth.Index] <= CalcMonth)  then
                              AStyle := cxStyleBeefAnimalOver28Months;
                        end;
                  end;
            end;
      end;}
var
   CalcMonth : TDateTime;
   AnimalSex : String;
   UsedForBreeding : Boolean;
   NoMonths : Integer;
   HighlightColour : TColor;
   HighlightBold : Boolean;
   DateOfBirth, AFromDate, AToDate, ADateOver : TDateTime;
   ID : Integer;
begin
   if ARecord <> nil then
      begin
         if ARecord.Values[cxAnimalGridViewHerdID.Index] = WinData.NONEHerdID then
            begin
               if ARecord.Values[cxAnimalGridViewAncestor.Index] = False then
                  AStyle := cxStyleNoneHerd
               else
                  AStyle := cxStyleNoneHerdAncestor;
            end
         else
            begin
               AStyle := cxStyleAnimalNormal;

               if ARecord.Values[cxAnimalGridViewID.Index] <> Null then
                  ID := ARecord.Values[cxAnimalGridViewID.Index];
               if ( not VarIsNull(ARecord.Values[cxAnimalGridViewDateOfBirth.Index]) ) and ( not VarIsNull(ARecord.Values[cxAnimalGridViewBreeding.Index]) )
                   and ( not VarIsNull(ARecord.Values[cxAnimalGridViewSex.Index]) ) and ( not VarIsNull(ARecord.Values[cxAnimalGridViewSex.Index]) ) then
                  begin
                     AnimalSex := ARecord.Values[cxAnimalGridViewSex.Index];
                     UsedForBreeding := ARecord.Values[cxAnimalGridViewBreeding.Index];
                     DateOfBirth := ARecord.Values[cxAnimalGridViewDateOfBirth.Index];
                     if ( not VarIsNull(AnimalSex)) and ( not VarIsNull(UsedForBreeding)) then
                        begin
                           if (not UsedForBreeding) then
                              begin
                                 if ( AnimalSex = cSex_Steer ) then
                                    begin
                                       NoMonths := WinData.GlobalSettings.SteerAttrNoMonthsFrom;
                                       AFromDate := IncMonth(Date, -NoMonths);

                                       NoMonths := WinData.GlobalSettings.SteerAttrNoMonthsTo;
                                       AToDate := IncMonth(Date, -NoMonths);

                                       NoMonths := WinData.GlobalSettings.SteerAttrNoMonthsOver;
                                       ADateOver := IncMonth(Date, -NoMonths);

                                       if DateInRange(DateOfBirth, AFromDate, AToDate) then
                                          AStyle := SteersBetween
                                       else if (DateOfBirth<ADateOver) then
                                          AStyle := SteersOver;
                                    end
                                 else if ( AnimalSex = cSex_Female ) and (not UsedForBreeding) then
                                    begin
                                       NoMonths := WinData.GlobalSettings.BeefFemaleAttrNoMonthsFrom;
                                       AFromDate := IncMonth(Date, -NoMonths);

                                       NoMonths := WinData.GlobalSettings.BeefFemaleAttrNoMonthsTo;
                                       AToDate := IncMonth(Date, -NoMonths);

                                       NoMonths := WinData.GlobalSettings.BeefFemaleAttrNoMonthsOver;
                                       ADateOver := IncMonth(Date, -NoMonths);

                                       if DateInRange(DateOfBirth, AFromDate, AToDate) then
                                          AStyle := BeefHeifersBetween
                                       else if (DateOfBirth<ADateOver) then
                                          AStyle := BeefHeifersOver;
                                    end
                                 else if ( AnimalSex = cSex_Bull ) and (not UsedForBreeding) then
                                    begin
                                       NoMonths := WinData.GlobalSettings.BeefBullAttrNoMonthsFrom;
                                       AFromDate := IncMonth(Date, -NoMonths);

                                       NoMonths := WinData.GlobalSettings.BeefBullAttrNoMonthsTo;
                                       AToDate := IncMonth(Date, -NoMonths);

                                       NoMonths := WinData.GlobalSettings.BeefBullAttrNoMonthsOver;
                                       ADateOver := IncMonth(Date, -NoMonths);

                                       if DateInRange(DateOfBirth, AFromDate, AToDate) then
                                          AStyle := BeefBullsBetween
                                       else if (DateOfBirth<ADateOver) then
                                          AStyle := BeefBullsOver;
                                    end;
                              end
                        end;
                     if (ID>0) then
                        begin
                           if AnimalCart.InCart(ID) then
                              AStyle.Color := clSilver
                           else
                              AStyle.Color := $20000000;
                        end;
                  end;
            end;
      end;
end;

procedure TMenuForm.cxAnimalGridViewSortNatIDGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if ARecord <> nil then
      AText := ARecord.DisplayTexts[cxAnimalGridViewNatIDNum.Index]
   else
      AText := '';

end;

procedure TMenuForm.cxAnimalGridViewSortAnimalNoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if ARecord <> nil then
      AText := ARecord.DisplayTexts[cxAnimalGridViewAnimalNo.Index]
   else
      AText := '';

end;

procedure TMenuForm.cxAnimalGridViewRTGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   AText := '';
   if ARecord <> nil then
      begin
         if ARecord.Values[cxAnimalGridViewRT.Index] = True then
            AText := 'RT';
      end;
end;

procedure TMenuForm.cxAnimalGridViewTTGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   AText := '';
   if ARecord <> nil then
      begin
         if ARecord.Values[cxAnimalGridViewTT.Index] = True then
            AText := 'TT';
      end;
end;

procedure TMenuForm.AnimalsEventsSplitterAfterClose(Sender: TObject);
begin
   sbHideEvents.Caption := '&Show Events';
   cbAllEvents.Visible := False;
   cbFeedEvents.Visible := False;
end;

procedure TMenuForm.AnimalsEventsSplitterBeforeOpen(Sender: TObject;
  var NewSize: Integer; var AllowOpen: Boolean);
begin
   sbHideEvents.Caption := '&Hide Events';
   cbAllEvents.Visible := True;
   cbFeedEvents.Visible := True;
end;

procedure TMenuForm.sbGroupUpdateClick(Sender: TObject);
begin
   Update;
   TfmGroupUpdate.ShowForm(WinData.AnimalFileByIDID.AsInteger);
end;

procedure TMenuForm.EventGridFeedEventsViewDblClick(Sender: TObject);
begin
   if ( WinData.FeedEvents.RecordCount > 0 ) then
      WinData.CreateAndShowForm(TfmFeedAllocEdit);
end;

procedure TMenuForm.cxAnimalGridViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
   if cxAnimalGridView.DataController.DataSet.State = dsBrowse then
      if cxAnimalGridView.DataController.Filter.FilterText = '' then
         lRecNo.Caption := IntToStr(cxAnimalGridView.DataController.GetFocusedRowIndex + 1) +' of '+ IntToStr(cxAnimalGridView.DataController.DataSet.recordCount)
      else
         lRecNo.Caption := IntToStr(cxAnimalGridView.DataController.GetFocusedRowIndex + 1) +' of '+ IntToStr(cxAnimalGridView.DataController.RecordCount);
   if AFocusedRecord <> nil then
      begin
         if EventGridAnimalEventsView.DataController.RecNo > 0 then
            begin
               EventGridAnimalEventsView.DataController.FocusedRowIndex := 0;
            end;
      end;
end;

procedure TMenuForm.cxAnimalGridViewDataControllerFilterBeforeChange(
  Sender: TcxDBDataFilterCriteria; ADataSet: TDataSet;
  const AFilterText: String);
begin
   if AFilterText <> '' then
      begin
         if not WinData.ActiveFilter then
            WinData.ActiveFilter := TRUE;
         sbFilters.Caption := 'Fi&lter On ';
         sbFilters.Font.Size := 10;
         sbFilters.Font.Style := [fsBold,fsItalic];
         sbFilters.Font.Color := clBlue;
      end
   else if not WinData.ActiveFilter then
      begin
         WinData.ActiveFilter := False;
         sbFilters.Caption := 'Fi&lter';
         sbFilters.Font.Size := 8;
         sbFilters.Font.Style := [];
         sbFilters.Font.Color := clBlack;
      end;
   //sbFilterMenu.Enabled := WinData.ActiveFilter;
//   sbClearFilter.Visible := WinData.ActiveFilter;
   Update;
end;

procedure TMenuForm.CreateEBIValuesYoungstockonly1Click(Sender: TObject);
begin
   if Messagedlg('The new EBI value will be derived from the Dam and Sire of the animal.' + cCRLF + cCRLF +
                 'Update all young stock with derived EBI values?',mtConfirmation,[mbYes,mbNo],0) = idYes then
      MessageDlg( IntToStr (  WinData.CreateYoungStockEBIValues( WinData.UserDefaultHerdID ) ) + ' young stock updated',mtInformation,[mbOK],0);
end;

procedure TMenuForm.cxAnimalGridViewNatIDNumHeaderClick(Sender: TObject);
begin
 ResetColumnHeader( cxAnimalGridViewNatIDNum.Index );

end;

procedure TMenuForm.cxAnimalGridViewAnimalNoHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewAnimalNo.Index );

end;

procedure TMenuForm.cxAnimalGridViewSexHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewSex.Index );

end;

procedure TMenuForm.cxAnimalGridViewDateOfBirthHeaderClick(
  Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewDateOfBirth.Index );

end;

procedure TMenuForm.cxAnimalGridViewLactNoHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewLactNo.Index );

end;

procedure TMenuForm.cxAnimalGridViewNameHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewName.Index );

end;

procedure TMenuForm.cxAnimalGridViewHerdBookNoHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewHerdBookNo.Index );

end;

procedure TMenuForm.cxAnimalGridViewBirthWeightHeaderClick(
  Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewBirthWeight.Index );
end;

procedure TMenuForm.cxAnimalGridViewBrucellosisHeaderClick(
  Sender: TObject);
begin
  ResetColumnHeader( cxAnimalGridViewBrucellosis.Index );
end;

procedure TMenuForm.cxAnimalGridViewTBTestDateHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewTBTestDate.Index );
end;

procedure TMenuForm.ResetColumnHeader(const ASelectedColumnIndex : Integer);
var
   ColIndex : Integer;
begin
   (*
   sbPartialSearchReset.Click(); {  Sort changed. Thus, focusedrecordindex is reset to 0. Update the partial search... V3.8 R0.5 }
   *)
   for ColIndex := 0 to cxAnimalGridView.ColumnCount-1 do
      begin
         if ColIndex = ASelectedColumnIndex then
            begin
               if cxAnimalGridView.Columns[ColIndex] <> nil then
                  cxAnimalGridView.Columns[ColIndex].Styles.Header := SelectedColumnHeader;
            end
         else
            begin
               if cxAnimalGridView.Columns[ColIndex] <> nil then
                  cxAnimalGridView.Columns[ColIndex].Styles.Header := DefaultColumnHeader;
            end;
      end;
end;

procedure TMenuForm.UpdateAnimalLactations1Click(Sender: TObject);
begin
   if ( WinData.AnimalFileByIDSex.AsString = cSex_Female ) then
      begin
         if UpdateLactNo(WinData.AnimalFileByIDID.AsInteger) then
            begin
               SetupQuery;
            end;
      end
   else
      MessageDlg('The animal selected is not a female animal.',mtInformation,[mbOK],0)
end;

procedure TMenuForm.tbDownloadClick(Sender: TObject);
begin
   Download;
end;

procedure TMenuForm.sbProfitMonitorSummaryClick(Sender: TObject);
begin
   CheckSelectedHerd;
   HerdLookup.HerdOwnerData.HerdID := WinData.UserDefaultHerdID;
   if HerdLookup.HerdOwnerData.HerdType = cDairyHerd then
      LiveStkClass.RunReport(WinData.UserDefaultHerdID)
   else
      TfmBeefProfitMonitor.Execute(WinData.UserDefaultHerdID)
end;

procedure TMenuForm.sbLivestockInventoryClick(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      RefreshForm;
      uLivestockSum.ShowTheForm(rtLSInventory, nil, sbLivestockInventory.Caption );
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.sbREPSReportClick(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      RefreshForm;
      uLivestockSum.ShowTheForm(rtREPS, nil, sbREPSReport.Caption );
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.UpdateStatusBar;
begin
   StatusBar.Panels.Items[1].Text := HerdVerNo; // Set the Version Number into the Panel.
   if WinData.UseScanner then
      StatusBar.Panels.Items[2].Text := cBarCodeScannerOnCaption
   else
      StatusBar.Panels.Items[2].Text := cBarCodeScannerOffCaption;
   if WinData.SearchField = 'AnimalNo' then
      StatusBar.Panels.Items[3].Text := 'Search By: '+cxAnimalGridViewAnimalNo.Caption
   else
      StatusBar.Panels.Items[3].Text := 'Search By: '+cxAnimalGridViewNatIDNum.Caption;
   try
      StatusBar.Panels.Items[4].Text := 'Herd Type: '+ HerdLookup.GetHerdTypeAsString(StrToInt(cbDefaultHerd.Value));
   except
      StatusBar.Panels.Items[4].Text := '';
   end;
   StatusBar.Panels.Items[5].Text := 'Database: '+ExtractDirFromPath(ExcludeTrailingBackslash(WinData.KingData.Directory));
end;

procedure TMenuForm.eNatIDNumEnter(Sender: TObject);
begin
   //if eNatIDNum.Text = 'IE' then
     // eNatIDNum.SelStart := 3;
end;

procedure TMenuForm.RxSpeedButton4Click(Sender: TObject);
begin
   WinData.CreateAndShowForm(TfmAccsReps)
end;

procedure TMenuForm.ViewAnimal;
   procedure ViewSetUpScr;
   var
      MyBookMark : TBookMark;
      OldRecNo : Integer;
      CallSetupQuery : Boolean;
   begin
      // open form for viewing (add = false, view = true)
      Update;

      try
         cxAnimalGridView.DataController.BeginFullUpdate;
         cxAnimalGridView.DataController.LockDataChangedNotify;
         CallSetupQuery := fSetUpAnimals.ShowForm(True);
      finally
         //cxAnimalGridView.DataController.UnLockDataChangedNotify;
         cxAnimalGridView.DataController.EndFullUpdate;
      end;
   end;

var
   AValue : Variant;
   ViewAnimalScr : Boolean;
begin
    ViewAnimalScr := True;
    with cxAnimalGridView.DataController do
       begin
          AValue := Values[FocusedRecordIndex, GetItemByFieldName('RT').Index];
          if not VarIsNull(AValue) then
             begin
                if AValue = True then
                   begin
                      if MessageDlg('Do you wish to view the Retag Screen?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
                         uReTagScr.ShowTheForm(Retag)
                   end
             end;

          AValue := Values[FocusedRecordIndex, GetItemByFieldName('TT').Index];
          if not VarIsNull(AValue) then
             begin
                if AValue = True then
                   begin
                      if MessageDlg('Do you wish to view the Temporary Tag Screen?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
                         uReTagScr.ShowTheForm(Temptag)
                   end
             end;
          ViewSetUpScr;
       end;
end;

procedure TMenuForm.DoLocate(var Message: TMessage);
var
  AView: TcxGridDBTableView;
  ARecordIndex: integer;
begin
  AView := TcxGridDBTableView(TObject(Message.lParam));
  ARecordIndex := Integer(Message.wParam);
  with AView.DataController do
    LocateByKey(WinData.AnimalFileByIDID.AsInteger);
end;

procedure TMenuForm.cxAnimalGridViewCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
   ViewAnimal;
   //if RecordIndex <> -1 then
   //  PostMessage(Handle, WM_Locate, Integer(RecordIndex),Integer(TcxGridDBTableView(TcxGridSite(Sender).GridView)));
   AHandled := True;
end;

procedure TMenuForm.actPrintGridExecute(Sender: TObject);
begin
   if not AnimalGridPrinterLink.PreviewExists then
      AnimalGridPrinterLink.Preview;
end;

procedure TMenuForm.actEventHistoryExecute(Sender: TObject);
var
   AllAnimalsShown : Boolean;
begin
   Update;
   if not WinData.ShowAllAnimals then
      begin
         Update;
         AllAnimalsShown := False;
         cbAllAnimals.Checked := True;
         cbAllAnimalsClick(cbAllAnimals);
         Update;
      end
   else
      begin
         AllAnimalsShown := True;
      end;

   cbAllEvents.Checked := True;
   cbAllEventsClick(cbAllEvents);

   screen.Cursor := crHourGlass;
   try
      cxAnimalGridView.DataController.BeginFullUpdate;
   finally
      screen.Cursor := crDefault;
   end;
   try
      with TEventFilter.Create(nil) do
         try
            ShowModal;
         finally
            Free;
         end;
      Update;
   finally
      screen.Cursor := crHourGlass;
      try
         cxAnimalGridView.DataController.EndFullUpdate;
      finally
         screen.Cursor := crDefault;
      end;
   end;

   Update;
   if not AllAnimalsShown then
      begin
         cbAllAnimals.Checked := False;
         cbAllAnimalsClick(cbAllAnimals);
      end;
   cbAllEvents.Checked := False;
   cbAllEventsClick(cbAllEvents);
end;

procedure TMenuForm.actClearFilterExecute(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   Enabled := False;
   try
   if ( WinData.ActiveFilter ) or ( AllAnimalsShowing ) or ( cxAnimalGridView.DataController.Filter.Active ) or ( AnimalCartFiltered ) then
      begin

         cbAllAnimals.Checked := False;
         cbAllAnimals.Font.Color := clBlack;
         WinData.ActiveFilter := FALSE;
         fFilters.ResetFilters;
         if cxAnimalGridView.DataController.Filter.Active then
            begin
               cxAnimalGridView.DataController.Filter.beginUpdate;
               cxAnimalGridView.DataController.Filter.Clear;
               cxAnimalGridView.DataController.Filter.EndUpdate;
                  cxAnimalGridView.DataController.Filter.Active := False;
            end;

         if AnimalCartFiltered then
            AnimalCartFiltered := False;

         Menuform.SetUpQuery(True);
      end;
   finally
//      sbFilterMenu.Enabled := False;
//      sbClearFilter.Visible := False;
      Enabled := True;
      Screen.Cursor := crDefault;
   end;
end;

procedure TMenuForm.cxAnimalGridViewSortAnimalNoHeaderClick(
  Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewSortAnimalNo.Index );
end;

procedure TMenuForm.cxAnimalGridViewSortNatIDHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewSortNatID.Index );
end;

procedure TMenuForm.cxAnimalGridViewEBIHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewEBI.Index );
end;

procedure TMenuForm.cxAnimalGridViewBreedCodeHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewBreedCode.Index );
end;

procedure TMenuForm.cxAnimalGridViewColourCodeHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewColourCode.Index );
end;

procedure TMenuForm.cxAnimalGridViewRTHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewRT.Index );
end;

procedure TMenuForm.cxAnimalGridViewTTHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewTT.Index );
end;

procedure TMenuForm.cxAnimalGridViewDamAnimalNoHeaderClick(
  Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewDamAnimalNo.Index );
end;

procedure TMenuForm.cxAnimalGridViewDamNoHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewDamNo.Index );
end;

procedure TMenuForm.cxAnimalGridViewSireNoHeaderClick(Sender: TObject);
begin
   ResetColumnHeader( cxAnimalGridViewSireNo.Index );
end;

procedure TMenuForm.cxAnimalGridViewDamNoGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
begin
   //AText := WinData.CreateSortNatIDString(AText);
end;

procedure TMenuForm.cxAnimalGridViewDamAnimalNoGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
begin
   AText := WinData.SortAnimalNoString(AText);
end;

procedure TMenuForm.cxAnimalGridViewSireNoGetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer;
  var AText: String);
begin
   AText := WinData.SortAnimalNoString(AText);
end;

procedure TMenuForm.cxAnimalGridViewDamAnimalNoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if ARecord <> nil then
      if ARecord.Values[cxAnimalGridViewDamAnimalNoHidden.Index] <> Null then
         AText := ARecord.Values[cxAnimalGridViewDamAnimalNoHidden.Index]
      else
         AText := '';
end;

procedure TMenuForm.cxAnimalGridViewDamNoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if ARecord <> nil then
      if ARecord.Values[cxAnimalGridViewDamNoHidden.Index] <> Null then
         AText := ARecord.Values[cxAnimalGridViewDamNoHidden.Index]
      else
         AText := '';
end;

procedure TMenuForm.cxAnimalGridViewSireNoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if ARecord <> nil then
      if ARecord.Values[cxAnimalGridViewSireNoHidden.Index] <> Null then
         AText := ARecord.Values[cxAnimalGridViewSireNoHidden.Index]
      else
         AText := '';
end;

procedure TMenuForm.cxAnimalGridViewDamAnimalNoGetFilterValues(
  Sender: TcxCustomGridTableItem; AValueList: TcxDataFilterValueList);
begin
   cxUtils.GetFilterValueList(cxAnimalGridViewDamIDHidden,AValueList,False);
end;

procedure TMenuForm.cxAnimalGridViewDamNoGetFilterValues(
  Sender: TcxCustomGridTableItem; AValueList: TcxDataFilterValueList);
begin
   cxUtils.GetFilterValueList(cxAnimalGridViewDamIDHidden,AValueList,False);
end;

procedure TMenuForm.cxAnimalGridViewSireNoGetFilterValues(
  Sender: TcxCustomGridTableItem; AValueList: TcxDataFilterValueList);
var
  ValueList: TcxDataFilterValueList;
begin
   cxUtils.GetFilterValueList(cxAnimalGridViewSireIDHidden, AValueList, False);
end;

procedure TMenuForm.cxAnimalGridViewDamNoGetFilterDisplayText(
  Sender: TcxCustomGridTableItem; const AValue: Variant;
  var ADisplayText: String);
var
   DisplayValue : Variant;
begin
   try
   if ( AValue <> Null ) then
      begin
         DisplayValue := WinData.DamQuery.Lookup('ID', AValue, 'NatIDNum');
         if ( DisplayValue <> Null ) then
            ADisplayText := DisplayValue;
      end;
   finally
   end;
end;

procedure TMenuForm.cxAnimalGridViewSireNoGetFilterDisplayText(
  Sender: TcxCustomGridTableItem; const AValue: Variant;
  var ADisplayText: String);
var
   DisplayValue : Variant;
begin
   try
   if ( AValue <> Null ) then
      begin
         DisplayValue := WinData.SireQuery.Lookup('ID', AValue, 'AnimalNo');
         if ( DisplayValue <> Null ) then
            ADisplayText := DisplayValue;
      end;
   finally
   end;
end;

procedure TMenuForm.cxAnimalGridViewDamAnimalNoGetFilterDisplayText(
  Sender: TcxCustomGridTableItem; const AValue: Variant;
  var ADisplayText: String);
var
   DisplayValue : Variant;
begin
   try
   if ( AValue <> Null ) then
      begin
         DisplayValue := WinData.DamQuery.Lookup('ID', AValue, 'AnimalNo');
         if ( DisplayValue <> Null ) then
            ADisplayText := DisplayValue;
      end;
   finally
   end;
end;

procedure TMenuForm.BreedingPageControlDrawTabEx(
  AControl: TcxCustomTabControl; ATab: TcxTab; Font: TFont);
begin
   if TcxPageControl(AControl).ActivePageIndex = ATab.Index then
      begin
         Font.Color := clBlue;
      end;
end;

procedure TMenuForm.SeasonalCalvingHerds1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      uFertIndicesRpt.ShowTheForm;
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.SpreadCalvingHerds1Click(Sender: TObject);
begin
   PreviewReproductiveSummary;
end;

procedure TMenuForm.PremiumHistoryReport1Click(Sender: TObject);
begin
   StockInHerdFilt.ShowForm(Premiums);
end;

procedure TMenuForm.miDARDDairyFertilityBenchmarksClick(Sender: TObject);
begin
   CheckSelectedHerd;
   TfmFertilityBenchmarking.Show;
end;

procedure TMenuForm.AnimalGridNavBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
   case Button of
      nbFirst : begin
                   if cxAnimalGridView.DataController.FocusedRowIndex <> 0 then
                      cxAnimalGridView.DataController.FocusedRowIndex := 0;
                end;
      nbPrior : begin
                   if cxAnimalGridView.DataController.FocusedRowIndex > 0 then
                      cxAnimalGridView.DataController.FocusedRowIndex := cxAnimalGridView.DataController.FocusedRowIndex-1;
                end;
      nbNext  : begin
                   if cxAnimalGridView.DataController.FocusedRowIndex < cxAnimalGridView.DataController.DataSet.RecordCount then
                      cxAnimalGridView.DataController.FocusedRowIndex := cxAnimalGridView.DataController.FocusedRowIndex+1;
                end;
      nbLast  : begin
                   if cxAnimalGridView.DataController.FocusedRowIndex < cxAnimalGridView.DataController.DataSet.RecordCount then
                      cxAnimalGridView.DataController.FocusedRowIndex := cxAnimalGridView.DataController.DataSet.RecordCount;
                end;
   end;
   Abort;
end;

procedure TMenuForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if WinData.ActiveFilter then
      WinData.ActiveFilter := False;
   Def.Definition.dShutDownOK := TRUE;
   Application.Terminate;
   Application.ProcessMessages;
end;

procedure TMenuForm.MachineryLinkClick(Sender: TObject);
begin
   WinData.CallProg.Machinery;
end;

procedure TMenuForm.cxAnimalGridViewEBICustomDrawHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
{var I : Integer;
begin

  with AViewInfo do
  begin
    TMyLookAndFeelPainter.DrawHeader(ACanvas, Bounds, TextAreaBounds,Neighbors,
    Borders, cxbsDefault, AlignmentHorz, AlignmentVert, MultiLine, False,
    Text, Params.Font, Params.TextColor, Params.Color);
    for I := 0 to AreaViewInfoCount - 1 do
    begin
      if AreaViewInfos[I] is TcxGridColumnHeaderSortingMarkViewInfo then
        LookAndFeelPainter.DrawSortingMark(ACanvas, TcxGridColumnHeaderSortingMarkViewInfo(AreaViewInfos[I]).Bounds,
        Column.SortOrder = soAscending);
      if AreaViewInfos[I] is TcxGridColumnHeaderFilterButtonViewInfo then
        LookAndFeelPainter.DrawFilterDropDownButton(ACanvas, AreaViewInfos[I].Bounds,
        GridCellStateToButtonState(AreaViewInfos[I].State), TcxGridColumnHeaderFilterButtonViewInfo(AreaViewInfos[I]).Active);
    end;
  end;
  ADone := True;
}

end;

procedure TMenuForm.BreedingPageControlDrawTab(
  AControl: TcxCustomTabControl; ATab: TcxTab; var DefaultDraw: Boolean);
{var
  R: TRect;
  Bitmap: TBitmap;
  ABrush: TBrush;}
begin
{
   if ATab.Index = tsOtherBreeding.TabIndex then
      begin
         with AControl.Canvas do
         begin

            if ATab.Selected then
               R := ATab.NormalRect
            else
               begin
                   R := ATab.NormalRect;
                   R.Left := R.Left+1;
               end;
            // painting the focus rectangle
            FrameRect(R, NewFeatureHighlightControlColour);
            InflateRect(R, -1, -1);
            FrameRect(R, clRed);
            InflateRect(R, -1, -1);


            Windows.FillRect(Handle, R, tsOtherBreeding.Brush.Handle);
           // painting the tab caption
            Font.Color := clBlack;
           if ATab.IsMainTab then
             Font.Color := clBlue
           else
             Font.Color := clBlack;
           Brush.Style := bsClear;
           DrawText(ATab.Caption, R, cxAlignHCenter);

           Brush.Style := bsSolid;
           Font.Style := [];
         end;
         // prohibiting default painting
         DefaultDraw := False;
      end
   else
      DefaultDraw := True;    }
end;

procedure TMenuForm.sbCAFREFertListClick(Sender: TObject);
begin
   WinData.CreateAndShowForm( TfmCAFREFertListData );
end;

procedure TMenuForm.HintStyleControllerShowHint(Sender: TObject;
  var HintStr: String; var CanShow: Boolean; var HintInfo: THintInfo);
begin
   HintInfo.HideTimeout := 50;
end;

procedure TMenuForm.sbCAFREFertListMouseLeave(Sender: TObject);
begin
//   HintStyleController.HideHint;
end;

procedure TMenuForm.SetNatIDSearchText;
begin
   if ( cmboSearchColumns.ItemIndex = 1 ) and ( WinData.GlobalSettings.UseIEPrefixForNatIDSearch ) then
      begin
         teSearchText.Properties.OnChange := nil;
         teSearchText.Text := 'IE';
         teSearchText.Properties.OnChange := teSearchTextPropertiesChange;
      end;
end;

procedure TMenuForm.FormShow(Sender: TObject);
begin
   
   cxAnimalGridView.DataController.FocusedRowIndex := 0;
end;

procedure TMenuForm.AddAnimal;
var
  id : Integer;
begin
      try
         cxAnimalGridView.DataController.BeginFullUpdate;
         cxAnimalGridView.DataController.LockDataChangedNotify;
         WinData.AnimalFileByID.Append;
         try
            // open form for adding (add = false, view = true)
            fSetUpAnimals.ShowForm(False);

            id := WinData.AnimalFileByIDID.AsInteger;
            WinData.AnimalFileByID.DisableControls;
            Screen.Cursor := crHourGlass;
            try
               WinData.AnimalFileByID.Close;
               WinData.AnimalFileByID.Open;
               WinData.MoveIDsToAFilter;
               cxAnimalGridView.Datacontroller.BeginLocate;
               try
                  WinData.AnimalFileByID.Locate('ID', id, []);
                  Update;
               finally
                  cxAnimalGridView.Datacontroller.EndLocate;
               end;

            finally
               Screen.Cursor := crDefault;
               WinData.AnimalFileByID.EnableControls;
            end;
         except
            WinData.AnimalFileByID.Cancel;
         end;
      finally
         cxAnimalGridView.DataController.UnLockDataChangedNotify;
         cxAnimalGridView.DataController.EndFullUpdate;
      end;
   Update;
end;

procedure TMenuForm.sbAddAnimalTypeClick(Sender: TObject);
begin
   AddAnimal;
end;

procedure TMenuForm.BreedingPageControlPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
   if NewPage = tsBreeding then
      begin
         if HerdLookup.GetHerdType(WinData.AnimalFileByIDHerdID.AsInteger) = htSuckler then
            BreedingPageControl.Width := 486
         else
            BreedingPageControl.Width := 582;
      end
   else if NewPage = tsOtherBreeding then
      begin
         BreedingPageControl.Width := 483;
      end;
end;

procedure TMenuForm.cxAnimalGridViewEBIGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if AText <> '' then
      AText := AText + '   '; // pad out ebi value as so the value is not abscured by the proceeding column grid value
end;

procedure TMenuForm.DueToBeCulled1Click(Sender: TObject);
begin
   uDueToBeCulled.ShowForm;
end;

procedure TMenuForm.InherdAnimalClick(Sender: TObject);
begin
   CheckSelectedHerd;
   AddAnimal;
end;

procedure TMenuForm.AISireProvenDairyClick(Sender: TObject);
begin
   BrowseSireRegister1Click(BrowseSireRegister);
end;

procedure TMenuForm.AISireTestBeefClick(Sender: TObject);
begin
   fSetUpAnimals.DefaultAnimalType := atAIBullTestBeef;
   AddAnimal;
end;

procedure TMenuForm.NonHerdAncestor1Click(Sender: TObject);
begin
   fSetUpAnimals.DefaultAnimalType := atNonHerdAncestor;
   AddAnimal;
end;

procedure TMenuForm.sbGroupSalesClick(Sender: TObject);
begin
   uGroupSetUp.ShowTheForm(0, True);
end;

procedure TMenuForm.CMMSPermitsClick(Sender: TObject);
begin
   Update;
   uCMMSPermits.ShowForm(WinData.UserDefaultHerdID,0,NBAS31A);
   Update;
end;

procedure TMenuForm.MovementsInClick(Sender: TObject);
begin
   Update;
   CheckSelectedHerd;
   TfmMartImport.open(mftAHPIS,WinData.userDefaultHerdID);
   SetUpQuery;
   Update;
end;

procedure TMenuForm.sbPurchaseClick(Sender: TObject);
begin
   AddAnimal;
end;

procedure TMenuForm.SwitchTo1Click(Sender: TObject);
begin
   TfmHUKIFarmEvents.InitializeExport(WinData.UserDefaultHerdID);
end;

procedure TMenuForm.ViewAnimalEvent1Click(Sender: TObject);
begin
   EventGridAnimalEventsViewDblClick(EventGridAnimalEventsView);
end;

procedure TMenuForm.actNavFirstExecute(Sender: TObject);
begin
// V3.8 R0.5
   cxAnimalGridView.DataController.FocusedRowIndex := 0;
end;

procedure TMenuForm.actNavFirstUpdate(Sender: TObject);
begin
// V3.8 R0.5
   actNavFirst.Enabled := cxAnimalGridView.DataController.FocusedRowIndex > 0;
end;

procedure TMenuForm.actNavPreviousUpdate(Sender: TObject);
begin
// V3.8 R0.5
   actNavPrevious.Enabled := cxAnimalGridView.DataController.FocusedRowIndex > 0;
end;

procedure TMenuForm.actNavNextUpdate(Sender: TObject);
begin
// V3.8 R0.5
   actNavNext.Enabled := not ( cxAnimalGridView.DataController.FocusedRowIndex + 1 =
                               cxAnimalGridView.DataController.RecordCount )
end;

procedure TMenuForm.actNavLastExecute(Sender: TObject);
begin
// V3.8 R0.5
   if cxAnimalGridView.DataController.FocusedRowIndex < cxAnimalGridView.DataController.DataSet.RecordCount then
      cxAnimalGridView.DataController.FocusedRowIndex := cxAnimalGridView.DataController.DataSet.RecordCount;
end;

procedure TMenuForm.actNavLastUpdate(Sender: TObject);
begin
// V3.8 R0.5
   actNavLast.Enabled := not ( cxAnimalGridView.DataController.FocusedRowIndex + 1 =
                               cxAnimalGridView.DataController.RecordCount )

end;

procedure TMenuForm.actNavPreviousExecute(Sender: TObject);
begin
// V3.8 R0.5
   cxAnimalGridView.DataController.FocusedRowIndex := cxAnimalGridView.DataController.FocusedRowIndex-1;
end;

procedure TMenuForm.actNavNextExecute(Sender: TObject);
begin
// V3.8 R0.5
   if cxAnimalGridView.DataController.FocusedRowIndex < cxAnimalGridView.DataController.DataSet.RecordCount then
      cxAnimalGridView.DataController.FocusedRowIndex := cxAnimalGridView.DataController.FocusedRowIndex+1;
end;

procedure TMenuForm.ICBFEventRegistration1Click(Sender: TObject);
begin
   uICBFEventExport.ShowTheForm;
end;

procedure TMenuForm.CreateCISExportFile1Click(Sender: TObject);
begin
   TfmHUKIFarmEvents.InitializeExport(WinData.UserDefaultHerdID);
end;

procedure TMenuForm.DiseaseTestStatus2Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      RefreshForm;
      // KB's TB test Date Report
      uTBTestDtRep.ShowTheForm;
   finally
      EnableBtn(Sender);
   end;

end;

procedure TMenuForm.Historical1Click(Sender: TObject);
begin
   Update;
   AnimalWaste.CreateAndShow;
   Update;
end;

procedure TMenuForm.AddNewBreed1Click(Sender: TObject);
begin
   SetUpBreeds.ShowTheForm(TRUE);
end;

procedure TMenuForm.sbMachineryClick(Sender: TObject);
begin
   WinData.CallProg.Machinery;
end;

procedure TMenuForm.sbMartMovementsClick(Sender: TObject);
begin
   ShowMartImport;
end;

procedure TMenuForm.TemporaryMovement2Click(Sender: TObject);
begin
   // Create and Show the Temporary Movements Form
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
      uTempMovements.ShowMovement(AddMovement);
end;

procedure TMenuForm.GettingStarted1Click(Sender: TObject);
begin
   ShowGettingStarted(True);
end;

procedure TMenuForm.ShowGettingStarted(AUserView : Boolean);
begin
   Screen.Cursor := crHourGlass;
   try
      cxAnimalGridView.DataController.BeginFullUpdate;
      EventGridAnimalEventsView.DataController.BeginFullUpdate;
   finally
      Screen.Cursor := crDefault;
   end;

   try
      if AUserView then
         TfmGettingStarted.Run(False, WinData.SystemRegisteredCountry)
      else
         begin
            WinData.GlobalSettings.DisplayGettingStarted := ( not TfmGettingStarted.Run(True,WinData.SystemRegisteredCountry) );
            WinData.SavePreferences;
         end;

      SetupQuery;
   finally
      Screen.Cursor := crHourGlass;
      try
         cxAnimalGridView.DataController.EndFullUpdate;
         EventGridAnimalEventsView.DataController.EndFullUpdate;
      finally
         Screen.Cursor := crDefault;
      end;
      Email1.Visible := ((WinData.SystemRegisteredCountry=Ireland) and (WinData.DefaultEmailClient <> cEmailClient_MS));
   end;
end;

procedure TMenuForm.ShowReportsScreen(var msg: TMessage);
var
   pt : TPoint;
begin
   if msg.Msg = WM_ShowReportsScreen then
      begin

         if msg.WParam = Integer(fmGettingStarted) then
            begin
               GettingStartedScrActive := True;
               fmGettingStarted.Close;
               sbReports.Down := True;
               sbReports.Click;
            end;

         if msg.WParam = cGoToFertTreatmentChart then
            begin
               if gQuotaPlanner.Visible then
                  begin
                     sbReports.Down := True;
                     sbReports.Click;
                     sbFertilityTreatmentChart.Click;
                  end;
            end
         else if msg.WParam = cGoToTagReplacementsMainScr then
            begin
               // also, not yet used. cGoToTagReplacementsRptScr
               bPremium.Click;
               sbTagReplacement.Click;
            end;
      end;
end;

procedure TMenuForm.sbGettingStarte2dClick(Sender: TObject);
begin
   ShowGettingStarted(True);
end;

procedure TMenuForm.sbRegisterRemarkClick(Sender: TObject);
begin
   // Open the General Remarks
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
      uGeneralRemark.ShowGeneralRemark;

end;

procedure TMenuForm.sbGettingStartedClick(Sender: TObject);
begin
   ShowGettingStarted;
end;

procedure TMenuForm.CMMSFileImport1Click(Sender: TObject);
begin
   CheckSelectedHerd;
   TfmCMMSFileImport.ShowForm;
end;

procedure TMenuForm.RunPDAHerdInstallerClick(Sender: TObject);
begin
   if MessageDlg(cInstallConfirmMsg,mtConfirmation,[mbYes,mbNo],0) = mrYes then
      begin
         SetCurrentDir(cPDAHerdInstallDir);
         ShellExecute( 0, 'open', pChar(PDAHerdInstallerPath), nil, nil, SW_SHOWNORMAL );
         SetCurrentDir(ApplicationPath);
      end;
end;


procedure TMenuForm.RunPDAFieldsInstallerClick(Sender: TObject);
begin
   if MessageDlg(cInstallConfirmMsg,mtConfirmation,[mbYes,mbNo],0) = mrYes then
      begin
         SetCurrentDir(cPDAFieldsInstallDir);
         ShellExecute( 0, 'open', pChar(PDAFieldsInstallerPath), nil, nil, SW_SHOWNORMAL );
         SetCurrentDir(ApplicationPath);
      end;
end;

procedure TMenuForm.HistoricalCalving1Click(Sender: TObject);
begin
   if TfmCalvingHistoryEntry.CreateCalving(WiNdata.AnimalFileByIDID.AsInteger) then
      begin
         EventGridAnimalEventsView.DataController.RefreshExternalData;
      end;
end;

procedure TMenuForm.HerdUtils1Click(Sender: TObject);
begin
   WinData.KingData.CloseDataSets; // Close the Dataset
   WinData.KingData.Close;         // Close the Database
   update;
   try
      Windata.CallProg.HerdUtils;
   finally
      Update;
      WinData.OpenAndCheckTables;
   end;
end;

procedure TMenuForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   WinData.QueryICBFRegistrations;
end;

procedure TMenuForm.ImportICBFData1Click(Sender: TObject);
begin
   CheckSelectedHerd;
   if TfmICBFPCDownloadImporter.Execute(WinData.UserDefaultHerdID) then
      begin
         EventGridAnimalEventsView.DataController.RefreshExternalData;
         cxAnimalGridView.DataController.RefreshExternalData;
         WinData.qObservedBy.Close;
         WinData.qObservedBy.Open;
      end;
end;

procedure TMenuForm.LivestockProductionRate1Click(Sender: TObject);
begin
   CheckSelectedHerd;
   TfmSetupWasteProdRates.ShowForm( WinData.GetHerdCountry(WinData.OwnerFile, cbDefaultHerd.Value));
end;

procedure TMenuForm.ResetAnimalGridColumns1Click(Sender: TObject);
begin
   ResetAnimalGridColumns;
end;

procedure TMenuForm.ResetAnimalGridColumns;
var
   i : Integer;
begin
   for i := 0 to cxAnimalGridView.ColumnCount-1 do
      begin
         cxAnimalGridView.Columns[i].Visible := not cxAnimalGridView.Columns[i].Hidden;
      end;
   // Ensure these columns always remain visible.
   try
      cxAnimalGridViewSortAnimalNo.Visible := True;
   except
      on e : exception do showmessage(e.message);
   end;
   cxAnimalGridViewSortNatID.Visible := True;
   StoreAnimalGridView;
end;

procedure TMenuForm.RestoreAnimalGridView;
begin
   GridSettingsIniPath := IncludeTrailingBackslash( WinData.KingData.Directory ) + cGridColLayoutFile;
   try
      if FileExists( GridSettingsIniPath ) then
         cxAnimalGridView.RestoreFromIniFile(GridSettingsIniPath, True,False)
      else
         begin
            cxAnimalGridView.StoreToIniFile(GridSettingsIniPath, True);//Save default view
         end;
      // Show the EBI column on the main grid, if the milk recording module is present and the
      // version number is less than 3780
   except
   end;
end;

procedure TMenuForm.StoreAnimalGridView;
begin
   if FileExists(GridSettingsIniPath) then DeleteFile(GridSettingsIniPath);

   if GridSettingsIniPath <> '' then
      try
         cxAnimalGridView.StoreToIniFile( GridSettingsIniPath, True);
      except
      end;
end;

procedure TMenuForm.cxAnimalGridViewDataControllerFilterChanged(
  Sender: TObject);
   procedure RemoveIDS;
   begin
      with WinData.GenQuery do
         try
            SQL.Clear;
            SQL.Add('DELETE FROM ' + WinData.FilteredAnimals.TableName);
            ExecSQL;
         except
            MessageDlg('Cannot delete IDs, program will rebuild indexes'+#13#10+cErrorContact,mtError,[mbOK],0);
         end;
   end;
var
   i : Integer;
   vID : Variant;
begin
   with cxAnimalGridView.DataController do
      begin
         if Filter.Active then
            begin
              if FilteredRecordCount > 0 then
                 begin
                    RemoveIDS;
                    for i := 0 to FilteredRecordCount - 1 do
                        begin
                           vID := GetRecordId(FilteredRecordIndex[I]);
                           with WinData.GenQuery do
                              try
                                 SQL.Clear;
                                 SQL.Add('INSERT INTO ' + WinData.FilteredAnimals.TableName+' (AID)');
                                 SQL.Add('VALUES ('+IntToStr(vID)+')');
                                 ExecSQL;
                              except
                                 MessageDlg('Cannot delete IDs, program will rebuild indexes'+#13#10+cErrorContact,mtError,[mbOK],0);
                                 Abort;
                              end;
                        end;
                 end;
            end;
      end;end;

procedure TMenuForm.SpeedButton3Click(Sender: TObject);
begin
   TfmAWEventsByGroup.ShowAWEventsByGroup(WinData.UserDefaultHerdID, TDisbudding);
   SetUpQuery;
 //  cxAnimalGridView.DataController.RefreshExternalData;
end;

procedure TMenuForm.ShowSucklerCowEvents(var msg: TMessage);
var
   HerdType : THerdType;
begin
   if msg.Msg = WM_ShowSucklerCowEvents then
      begin
         fmGettingStarted.Close;
         bBreeding.Click;
         BreedingPageControl.ActivePage := tsOtherBreeding;
      end;
end;

procedure TMenuForm.AccsDatabasesClick(Sender: TObject);
begin
   if (Sender is TMenuItem) then
      begin
         if Definition.dUseKingsAccs then
            WinData.CallProg.Accounts((Sender as TMenuItem).Hint, RegistrySerialNum)
         else
            WinData.CallProg.Accounts((Sender as TMenuItem).Hint);
      end;
end;

procedure TMenuForm.LoadAccountsCompanies;
var
   AccsComps : TStringList;
   i : Integer;
   mi : TMenuItem;
begin
   AccsComps := TStringList.Create;
   try
      RetrieveAvailableWinAccsDatabases(AccsComps);
      AccsComps.Sort;
      pmAccsDatabases.Items.Clear;
      for i := 0 to AccsComps.Count-1 do
         begin
            mi := TMenuItem.Create(nil);
            if AccsComps.Strings[i] = WinData.GetAccsCompany(WinData.UserDefaultHerdID) then
               mi.Caption := AccsComps.Strings[i] + ' (Default)'
            else
               mi.Caption := AccsComps.Strings[i];
            mi.OnClick := AccsDatabasesClick;
            mi.Hint := AccsComps.Strings[i];
            pmAccsDatabases.Items.Add(mi);
         end;
   finally
      FreeAndNil(AccsComps);
   end;
end;

procedure TMenuForm.FertilityTreatmentsReport1Click(Sender: TObject);
begin
   TfmFertilityTreatmentsReport.ShowReportScreen;
end;

procedure TMenuForm.pmFertilityTreatmentsReportPopup(Sender: TObject);
begin

   FertilityTreatmentsReport1.Visible := Def.Definition.dUseQuotaMan;
end;

procedure TMenuForm.MedicineStock1Click(Sender: TObject);
begin
   uMedicineSetUp.ShowTheForm(False, True);
end;

procedure TMenuForm.FertilityPrograms1Click(Sender: TObject);
begin
   TfmSetupFertPrograms.Execute;
end;

procedure TMenuForm.ReplacementTagForm1Click(Sender: TObject);
begin
   TfmTagReplacementForm.Execute;
end;

procedure TMenuForm.MenuItem3Click(Sender: TObject);
begin
   TfmTagReplacementForm.Execute;
end;

procedure TMenuForm.NameSearch(const AStartIndex: Integer);
begin
end;

procedure TMenuForm.eNameSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//
end;

procedure TMenuForm.FertilityTreatmentChart1Click(Sender: TObject);
begin
   uQuotaMan.ShowForm;
end;

procedure TMenuForm.KingswoodHerdDevelopments1Click(Sender: TObject);
const
   cRecentChangesURL = 'http://kingswood.ie/index.php?id=13';
var
   OffLineHelpFile : String;
begin
  if ( not IsNetConnected ) then
     begin
        // view offline edition
        ForceApplicationDirectories('Help\History');
        OffLineHelpFile := ApplicationPath + 'Help\History\Winherd.html';
        if FileExists(OffLineHelpFile) then
           begin
              ShellExecute(Self.Handle,'open',PChar(OffLineHelpFile),nil,nil,SW_SHOWNORMAL);
           end
        else
           MessageDlg('File cannot be found. '+cErrorContact,mtInformation,[mbok],0);
     end
  else
     // View online edition
     OpenUrl(cRecentChangesURL);
end;

procedure TMenuForm.AddToQueue1Click(Sender: TObject);
begin
   sbAddAnimalToCart.Click;
end;

procedure TMenuForm.ClearCart1Click(Sender: TObject);
begin
   if not AnimalCart.IsEmpty then
      begin
         if MessageDlg(Format('Clear all animals (%d) from the Cart, are you sure?',[AnimalCart.Count]),mtConfirmation,[mbYes,mbNo],0) = idYes then
            begin
               AnimalCart.ClearCart;
               cxAnimalGrid.LayoutChanged; // force update of styles
               SetCartButtonStyle(AnimalCart.IsEmpty);
            end;
         if AnimalCartFiltered then
            begin
               FilterCart1.Default := False;
               AnimalCartFiltered := False;
               FilterCart1.Caption := 'Filter Cart';
               actClearFilter.Execute;
            end;
      end
   else
      MessageDlg('There are currently no animals in the Cart to clear.',mtInformation,[mbOK],0);
end;

procedure TMenuForm.sbAddAnimalToCartClick(Sender: TObject);
var
   pt : TPoint;
   Hint : string;
begin
   if ( not AnimalCart.InCart(WinData.AnimalFileByIDID.AsInteger)) then
      begin
         AnimalCart.AddToCart(WinData.AnimalFileByIDID.AsInteger);
         pt.x := 0;
         pt.y := 0;
         pt := cxAnimalGrid.ClientToScreen(pt);
         AnimalCartHintStyleController.HideHint;
         Hint := Format('Animal "%s" has been added to the Cart',[WinData.AnimalFileByIDNatIDNum.AsString]);
         HintTimer.Enabled := True;
         try
            AnimalCartHintStyleController.ShowHint(pt.x, pt.y, 'Animal Cart', Hint);
         finally
         end;
      end
   else
      begin
         if MessageDlg('This animal is already in the Cart.'+cCRLFx2 +
                       'Do you want to remove it from the Cart?',mtConfirmation,[mbYes, mbNo],0) = idYes then
            AnimalCart.RemoveFromCart(WinData.AnimalFileByIDID.AsInteger);
      end;
   cxAnimalGrid.LayoutChanged; // force update of styles

   SetCartButtonStyle(AnimalCart.IsEmpty);
end;

procedure TMenuForm.CTSLogin1Click(Sender: TObject);
begin
   TfmCTSLoginInfo.Execute;
end;

procedure TMenuForm.CTSMovementsClick(Sender: TObject);
begin
   Update;
   TfmCTSWSMovementReg.Execute;
   Update;
end;

procedure TMenuForm.RefreshGridViewExternalData(var msg: TMessage);
begin
   if msg.Msg = WM_RefreshGridViewExternalData then
      begin
         cxAnimalGridView.DataController.BeginFullUpdate;
         try
           cxAnimalGridView.DataController.RefreshExternalData;
         finally
           cxAnimalGridView.DataController.EndFullUpdate;
         end;
      end;
end;

procedure TMenuForm.DefaultHealthEventsAPHISMovementsIn1Click(Sender: TObject);
begin
  TfmMovementsInHealthDefaultsGrid.ShowMovementsInHealthDefaultGrid;
end;

procedure TMenuForm.APHISMovementsIn1Click(Sender: TObject);
begin
   MovementsInClick(Sender);
end;

procedure TMenuForm.DefaultEmailClient1Click(Sender: TObject);
begin
   TfmEmailClient.Execute;
   Email1.Visible := (WinData.DefaultEmailClient <> cEmailClient_MS);
end;

procedure TMenuForm.sbLivestockNutrientProjectionClick(Sender: TObject);
begin
   Update;                      //
   if WhichReg = Ireland then
      TfmNutrientProductionProjectionRptScr.ShowForm
   else
      TfmNINutrientProductionProjectionRptScr.ShowForm;
   Update;
end;

procedure TMenuForm.AnimalCartHintStyleControllerShowHint(Sender: TObject;
  var HintStr: String; var CanShow: Boolean; var HintInfo: THintInfo);
begin
   HintInfo.HideTimeout := 50;
end;

procedure TMenuForm.HintTimerTimer(Sender: TObject);
begin
   HintTimer.Enabled := False;
   AnimalCartHintStyleController.HideHint;
end;

procedure TMenuForm.Help2Click(Sender: TObject);
begin
   WinData.HTMLHelp('CartAnimals.htm');
end;

procedure TMenuForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN then
      begin
         if ActiveControl = teSearchText then
            begin
               if Trim(teSearchText.Text) <> '' then
                  btnSearch.Click;
            end
      end;
end;

procedure TMenuForm.EventGridAnimalEventsViewCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
   pt : tPoint;
begin
   if (EventGridAnimalEventsView.DataController.FocusedRecordIndex > -1) then
      begin
         if (WinData.EventsEventType.AsInteger in [CDisbuddingNAEvent,CCastrationNAEvent]) then
            begin
               GetCursorPos(pt);
               pmdeleteevent.Popup(pt.x,pt.y);
            end;
      end;
end;

procedure TMenuForm.DeleteEvent1Click(Sender: TObject);
begin
   if (WinData.EventsEventType.AsInteger in [CDisbuddingNAEvent,CCastrationNAEvent]) then
      begin
         if MessageDlg('Delete event, are you sure?',mtConfirmation,[mbYes,mbNo],0) = idYes then
            WinData.Events.Delete;
      end;
end;

procedure TMenuForm.SetGridStyles;
begin
   //
   BeefHeifersBetween.TextColor := TColor(WinData.GlobalSettings.BeefFemaleAttrColourBetween);
   if WinData.GlobalSettings.BeefFemaleAttrBoldBetween then
      BeefHeifersBetween.Font.Style := [fsBold]
   else
      BeefHeifersBetween.Font.Style := [];
   BeefHeifersOver.TextColor := TColor(WinData.GlobalSettings.BeefFemaleAttrColourOver);
   if WinData.GlobalSettings.BeefFemaleAttrBoldOver then
      BeefHeifersOver.Font.Style := [fsBold]
   else
      BeefHeifersOver.Font.Style := [];

   BeefBullsBetween.TextColor := TColor(WinData.GlobalSettings.BeefBullAttrColourBetween);
   if WinData.GlobalSettings.BeefBullAttrBoldBetween then
      BeefBullsBetween.Font.Style := [fsBold]
   else
      BeefBullsBetween.Font.Style := [];

   BeefBullsOver.TextColor := TColor(WinData.GlobalSettings.BeefBullAttrColourOver);
   if WinData.GlobalSettings.BeefBullAttrBoldBetween then
      BeefBullsOver.Font.Style := [fsBold]
   else
      BeefBullsOver.Font.Style := [];

   SteersBetween.TextColor := TColor(WinData.GlobalSettings.SteerAttrColourBetween);
   if WinData.GlobalSettings.BeefBullAttrBoldBetween then
      SteersBetween.Font.Style := [fsBold]
   else
      SteersBetween.Font.Style := [];
   SteersOver.TextColor := TColor(WinData.GlobalSettings.SteerAttrColourOver);
   if WinData.GlobalSettings.BeefBullAttrBoldBetween then
      SteersOver.Font.Style := [fsBold]
   else
      SteersOver.Font.Style := [];
   cxAnimalGrid.LayoutChanged; // force update of styles
end;

procedure TMenuForm.FileExport1Click(Sender: TObject);
var
   dbUpdated : Boolean;
begin
   if not (AnimalCart.IsEmpty) then
      begin
         UKImport.CreateShowForm(TSaleDeath, dbUpdated, True);
         Application.ProcessMessages;
         if dbUpdated then
            begin
               Menuform.Enabled := False; // prevent any clicking during database operations
               try
                  SetupQuery;
               finally
                  Menuform.Enabled := True; // Release
               end;
            end;
      end
   else
      MessageDlg(cMsg_NoAnimalsInCart,mtInformation,[mbOK],0);
end;

procedure TMenuForm.TagReplacementForm1Click(Sender: TObject);
begin
   if not (AnimalCart.IsEmpty) then
      TfmTagReplacementForm.Execute(True)
   else
      MessageDlg(cMsg_NoAnimalsInCart,mtInformation,[mbOK],0);
end;

procedure TMenuForm.ViewCart1Click(Sender: TObject);
begin
   TfmAnimalCartView.ViewAnimalCart;
   cxAnimalGrid.LayoutChanged; // force update of styles
end;

procedure TMenuForm.Help3Click(Sender: TObject);
begin
   WinData.HTMLHelp('Filter.htm');
end;

procedure TMenuForm.BuildOnFarmEventsMenu(AOwner: TMenu;
  AOwnerItem: TMenuItem);
var
   subitem, subitem2 : TMenuItem;
begin
   subitem := TMenuItem.Create(AOwner);
   subitem.Caption := 'Health Event';
   subitem.OnClick := GroupHealthClick;
   AOwnerItem.Add(subitem);

   if (Def.Definition.dUseManCal) then
      begin
         subitem  := TMenuItem.Create(AOwner);
         subitem.Caption := 'Service Event';
         subitem.OnClick := GroupServiceClick;
         AOwnerItem.Add(subitem);

         subitem  := TMenuItem.Create(AOwner);
         subitem.Caption := 'Preg. Diag. Event';
         subitem.OnClick := GroupPregDiagClick;
         AOwnerItem.Add(subitem);
      end;

   subitem  := TMenuItem.Create(AOwner);
   subitem.Caption := 'Dry Off Event';
   subitem.OnClick := GroupDryOffClick;
   AOwnerItem.Add(subitem);

   if (Def.Definition.dUseQuotaMan) or
      (Def.Definition.dUseManCal) or
      (Def.Definition.dUseBeefMan) then
      begin
         subitem  := TMenuItem.Create(AOwner);
         subitem.Caption := 'Weighing Event';
         subitem.OnClick := GroupWeighingClick;
         AOwnerItem.Add(subitem);
      end;

   subitem  := TMenuItem.Create(AOwner);
   subitem.Caption := 'TB Test Date';
   subitem.OnClick := GroupTBTestClick;
   AOwnerItem.Add(subitem);

   subitem  := TMenuItem.Create(AOwner);
   subitem.Caption := 'Brucellosis Event';
   subitem.OnClick := GroupBruceTestClick;
   AOwnerItem.Add(subitem);

   subitem  := TMenuItem.Create(AOwner);
   subitem.Caption := 'Temporary Movement Event';
   subitem.OnClick := GroupTempMoveClick;
   AOwnerItem.Add(subitem);
end;

procedure TMenuForm.GroupBruceTestClick(Sender: TObject);
begin
   CheckSelectedHerd;
   uEventsByGroup.ShowTheForm(TBruceTest,True,True);
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.GroupBullingClick(Sender: TObject);
begin
   CheckSelectedHerd;
   uEventsByGroup.ShowTheForm(TBulling,True,True);
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.GroupDryOffClick(Sender: TObject);
begin
   CheckSelectedHerd;
   uEventsByGroup.ShowTheForm(TDryOff,True,True);
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.GroupHealthClick(Sender: TObject);
begin
   CheckSelectedHerd;
   uEventsByGroup.ShowTheForm(THealth,True,True);
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.GroupPregDiagClick(Sender: TObject);
begin
   CheckSelectedHerd;
   uEventsByGroup.ShowTheForm(TPregDiag,True,True);
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.GroupServiceClick(Sender: TObject);
begin
   CheckSelectedHerd;
   uEventsByGroup.ShowTheForm(TService,True,True);
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.GroupTBTestClick(Sender: TObject);
begin
   CheckSelectedHerd;
   uEventsByGroup.ShowTheForm(TTBTestDate,True,True);
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.GroupTempMoveClick(Sender: TObject);
begin
   CheckSelectedHerd;
   uEventsByGroup.ShowTheForm(TMovement,True,True);
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.GroupWeighingClick(Sender: TObject);
begin
   CheckSelectedHerd;
   uEventsByGroup.ShowTheForm(TWeight,True,True);
   // Call the Animals Query to refresh the Data.
   SetUpQuery;
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.AddAllAnimalsToCart;
var
   pt : TPoint;
   Hint : string;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select Distinct(AID) From AFilters');
         Open;
         try
            First;
            while not eof do
               begin
                  if ( not AnimalCart.InCart(Fields[0].AsInteger)) then
                     AnimalCart.AddToCart(Fields[0].AsInteger);
                  Next;
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;
   cxAnimalGrid.LayoutChanged; // force update of styles
   try
      pt.x := 0;
      pt.y := 0;
      pt := cxAnimalGrid.ClientToScreen(pt);
      AnimalCartHintStyleController.HideHint;
      HintTimer.Enabled := True;
      AnimalCartHintStyleController.ShowHint(pt.x, pt.y, 'Animal Cart', 'All animals have been added to the Cart.');
   finally
   end;
   SetCartButtonStyle(AnimalCart.IsEmpty);
end;

procedure TMenuForm.AddAlltoCart1Click(Sender: TObject);
begin
   AddAllAnimalsToCart;
end;

procedure TMenuForm.SetCartButtonStyle(const AStyleNormal: Boolean);
begin
   if AStyleNormal then
      begin
         sbAddAnimalToCart.Font.Size := 8;
         sbAddAnimalToCart.Font.Style := [];
         sbAddAnimalToCart.Font.Color := clBlack;
      end
   else
      begin
         sbAddAnimalToCart.Font.Size := 8;
         sbAddAnimalToCart.Font.Style := [fsBold,fsItalic];
         sbAddAnimalToCart.Font.Color := clBlue;
      end;
end;

procedure TMenuForm.SalesPlanner2Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      SaleEligibility.CreateAndShow(rtSalesPlanner);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.FQASReport1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      SaleEligibility.CreateAndShow(rtFQAS);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.NonFQASReport1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      SaleEligibility.CreateAndShow(rtNonFQAS);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.N30Month30Day1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      SaleEligibility.CreateAndShow(rt30mth30Day);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.N30Month10Day1Click(Sender: TObject);
begin
   EnableBtn(Sender);
   try
      SaleEligibility.CreateAndShow(rt30mth10Day);
   finally
      EnableBtn(Sender);
   end;
end;

procedure TMenuForm.GroupSetup1Click(Sender: TObject);
begin
   uGroupSetUp.ShowTheForm(0);  //Ind = 0 shows standard form
   SetUpQuery;
end;

procedure TMenuForm.FilterCart1Click(Sender: TObject);
begin
   FilterCart1.Default := not FilterCart1.Default;
   if FilterCart1.Default then
      begin
         FilterCart1.Caption := 'Clear Filter';
         //FilterCart1.Default := True;
         SetUpCartQuery();
      end
   else
      begin
         FilterCart1.Caption := 'Filter Cart';
         actClearFilter.Execute;
      end;
   cbAllAnimals.Enabled := not (FilterCart1.Default);
   cbDefaultHerd.Enabled := not (FilterCart1.Default);
   sbFilters.Enabled := not (FilterCart1.Default);
   sbFilterMenu.Enabled := not (FilterCart1.Default);
   sbEventGrid.Enabled := not (FilterCart1.Default);
end;

procedure TMenuForm.SetUpCartQuery;
begin
   if AnimalCart.IsEmpty then
      MessageDlg('There are currently no animals in the Cart.',mtInformation,[mbOK],0)
   else
      begin
         with WinData.AnimalFileByID.SQL do
            begin
               Clear;
               Add('SELECT DISTINCT (A.ID), A.* FROM Animals A    ');
               Add('WHERE (AnimalDeleted=FALSE)');
               Add('AND A.ID IN '+ AnimalCart.AnimalCartDataAsWideString);
               WinData.AnimalFileByID.Open;
               AnimalCartFiltered := True;
               WinData.MoveIDsToAFilter;
               WinData.ActiveFilter := TRUE;

            end;
      end;
end;

procedure TMenuForm.pmCartPopup(Sender: TObject);
begin
   FilterCart1.Enabled := not(AnimalCart.IsEmpty);
   ClearCart1.Enabled := FilterCart1.Enabled;
   ViewCart1.Enabled := FilterCart1.Enabled;
   GoTo1.Enabled := FilterCart1.Enabled;
   NotifyHUK1.Visible := ((Def.Definition.dUsePedigree) and ( WinData.SystemRegisteredCountry=NIreland ));
   N23.Visible := NotifyHUK1.Visible;
end;

procedure TMenuForm.DownloadEmailAttachments1Click(Sender: TObject);
var
   NoOfAttachments : Integer;
begin
   NoOfAttachments := WinData.DownloadEmailAttachments;
   if ( NoOfAttachments > 0 ) then
      MessageDlg(Format(cEmail_NewAttachmentsDownloaded,[NoOfAttachments]),mtInformation,[mbOk],0)
   else
      MessageDlg(cEmail_NoNewAttachments,mtInformation,[mbOk],0);
end;

procedure TMenuForm.ViewMailBox2Click(Sender: TObject);
begin
   WinData.ViewMailBox;
end;

procedure TMenuForm.ShowFactorySales;
var
   FileName : string;
   NoOfAttachments : Integer;
begin
   CheckSelectedHerd;
   if WinData.GlobalSettings.DownloadMailAttachments then
      begin
         if MessageDlg(cEmail_DownloadAttachmentConfirm,mtConfirmation,[mbYes,mbNo],0) = idYes then
            begin
               Update;
               NoOfAttachments := WinData.DownloadEmailAttachments;
               if ( NoOfAttachments > 0 ) then
                  MessageDlg(Format(cEmail_NewAttachmentsDownloaded,[NoOfAttachments]),mtInformation,[mbOk],0)
               else
                  MessageDlg(cEmail_NoNewAttachments,mtInformation,[mbOk],0);
            end;
         Update;
         FileName := TfmFileAttachmentImport.execute(itFactorySales);
         if (FileName <> '') then
            begin
               TfRemittance.Create(Self).ExecuteFile(FileName);
               SetUpQuery;
            end;
      end
   else
      begin
         TfRemittance.Create(Self).Execute;
         SetUpQuery;
      end;
end;

procedure TMenuForm.ShowMartImport;
var
   FileName : string;
   NoOfAttachments : Integer;
begin
   if WinData.GlobalSettings.DownloadMailAttachments then
      begin
         if MessageDlg(cEmail_DownloadAttachmentConfirm,mtConfirmation,[mbYes,mbNo],0) = idYes then
            begin
               Update;
               NoOfAttachments := WinData.DownloadEmailAttachments;
               if ( NoOfAttachments > 0 ) then
                  MessageDlg(Format(cEmail_NewAttachmentsDownloaded,[NoOfAttachments]),mtInformation,[mbOk],0)
               else
                  MessageDlg(cEmail_NoNewAttachments,mtInformation,[mbOk],0);
               Update;
            end;

         FileName := TfmFileAttachmentImport.execute(itMart);
         if (FileExists(FileName)) then
            begin
               TfmMartImport.open(mftMART,WinData.userDefaultHerdID,FileName);
               SetUpQuery;
            end;
      end
   else
      begin
         TfmMartImport.open(mftMART,WinData.userDefaultHerdID);
         SetUpQuery;
      end;
end;

procedure TMenuForm.sbGroupSetupClick(Sender: TObject);
begin
   uGroupSetUp.ShowTheForm(0);  //Ind = 0 shows standard form
   SetUpQuery;
end;

procedure TMenuForm.ResizePageControl(APageControl: TcxPageControl);

   function CountOfVisibleIcons(APanel : TPanel) : Integer;
   var
      i : Integer;
   begin
      Result := 0;

      for i := 0 to APanel.ControlCount-1 do
         if (APanel.Controls[i] is TPanel) then
            if (((APanel.Controls[i] as TPanel).Visible) and ((APanel.Controls[i] as TPanel).Tag = 1)) then
               Inc(Result);
   end;

var
   PageIndex : Integer;
begin
   if APageControl.Name = 'pcMultipleAnimals' then
      begin
         PageIndex := APageControl.ActivePageIndex;

         if PageIndex = 0 then
            APageControl.Width := (( CountOfVisibleIcons(pMultipleAnimals) * 115 ) + 3)
         else if PageIndex = 1 then
            APageControl.Width := (( CountOfVisibleIcons(pAnimalGroups) * 115 ) + 3);
      end;
end;

procedure TMenuForm.pcMultipleAnimalsChange(Sender: TObject);
begin
   TcxPageControlAccess(pcMultipleAnimals).TabCaptionAlignment := taLeftJustify;
   ResizePageControl(pcMultipleAnimals);
end;

procedure TMenuForm.pcMultipleAnimalsDrawTabEx(
  AControl: TcxCustomTabControl; ATab: TcxTab; Font: TFont);
begin
   if TcxPageControl(AControl).ActivePageIndex = ATab.Index then
      begin
         Font.Color := clBlue;
      end;
end;

procedure TMenuForm.pcMultipleAnimalsDrawTab(AControl: TcxCustomTabControl;
  ATab: TcxTab; var DefaultDraw: Boolean);
var
  R: TRect;
  Bitmap: TBitmap;
  ABrush: TBrush;
begin

//   if ATab.Index = tsAnimalGroups.TabIndex then
  //    begin
         with AControl.Canvas do
         begin

            if ATab.Selected then
               R := ATab.NormalRect
            else
               begin
                   R := ATab.NormalRect;
                   R.Left := R.Left+1;
               end;
            // painting the focus rectangle
            FrameRect(R, NewFeatureHighlightControlColour);
            InflateRect(R, -1, -1);
            FrameRect(R, clRed);
            InflateRect(R, -1, -1);


            Windows.FillRect(Handle, R, tsAnimalGroups.Brush.Handle);
           // painting the tab caption
            Font.Color := clBlack;
           if ATab.IsMainTab then
             Font.Color := clBlue
           else
             Font.Color := clBlack;

           Font.Style := [];
           Font.Name := 'Verdana';
           Font.Size := 8;
           Brush.Style := bsClear;
           DrawText(ATab.Caption, R, cxAlignHCenter);

           Brush.Style := bsSolid;
         end;
         // prohibiting default painting
         DefaultDraw := False;
    //  end
  // else
    //  DefaultDraw := True;

end;

procedure TMenuForm.RecentChanges1Click(Sender: TObject);
begin
   ShowVersionHistory([WinData.DefCountry( WinData.UserDefaultHerdID)]);
end;

procedure TMenuForm.SearchForAnimal;
var
  SearchText, SearchField : string;
  StartIndex : Integer;
  ModifiedSearchText : string;
  SearchColIndex : Integer;
  SearchOnSearchField : Boolean;
  FieldValue : Variant;
  MessageSubText : String;
  i : Integer;
  Success : Boolean;
  nRowCount : Integer;
begin
  inherited;

  FSearchColumn := TcxGridDBColumn(cmboSearchColumns.ItemObject);

  if FSearchColumn = nil then Exit;

  with cxAnimalGridView do
     begin
        Screen.Cursor := crHourGlass;
        DataController.BeginLocate;
        Success := False;
        try
           SearchText := Trim(teSearchText.Text);
           if SearchText <> '' then
              begin
                 SearchText := UPPERCASE(teSearchText.Text);
                 SearchColIndex := FSearchColumn.Index;
                 SearchOnSearchField := False;
                 StartIndex := 0;
                 if (cmboSearchColumns.ItemIndex in [0,1]) then
                    begin
                       SearchText := WinData.StripAllNomNumAlpha(UPPERCASE(teSearchText.Text));
                       SearchOnSearchField := not(Pos(' ', SearchText) > 0);
                       if SearchOnSearchField then
                          SearchColIndex := cxAnimalGridViewSearchNatID.Index;
                    end;

                 if (cmboSearchColumns.ItemIndex in [0,3]) then
                    begin
                       if btnSearch.Caption = 'Start' then
                          btnSearch.Caption := 'Continue'
                       else
                          StartIndex := cxAnimalGridView.Controller.FocusedRowIndex+1;
                       if StartIndex < 0 then StartIndex := 0;
                    end;

                 with cxAnimalGridView.ViewData do
                    begin
                       Success := False;

                       nRowCount := RowCount;
                       for i := StartIndex to nRowCount - 1 do
                          begin
                             FieldValue := VarToStr(Rows[i].Values[SearchColIndex]);

                             if not VarIsNull(FieldValue) then
                                begin
                                   FieldValue := UPPERCASE(FieldValue);
                                   if (cmboSearchColumns.ItemIndex = 2) then
                                      begin
                                         if (SearchText = Copy(FieldValue, 1, Length(SearchText))) then
                                            begin
                                               cxAnimalGridView.DataController.FocusedRecordIndex := Rows[i].RecordIndex;
                                               Success := True;
                                               Break;
                                            end;
                                      end
                                   else
                                      begin
                                         if Pos( SearchText, FieldValue) > 0 then
                                            begin
                                               cxAnimalGridView.DataController.FocusedRecordIndex := Rows[i].RecordIndex;;
                                               Success := True;
                                               Break;
                                            end;
                                      end;
                                end;
                          end;
                    end;

                 {with cxAnimalGridView.DataController do
                    begin
                       Success := False;
                       for i := StartIndex to RecordCount - 1 do
                          begin
                             FieldValue := VarToStr(Values[ i, SearchColIndex]);

                             if not VarIsNull(FieldValue) then
                                begin
                                   FieldValue := UPPERCASE(FieldValue);
                                   if (cmboSearchColumns.Text = cxAnimalGridViewAnimalNo.Caption) then
                                      begin
                                         if (SearchText = Copy(FieldValue, 1, Length(SearchText))) then
                                            begin
                                               cxAnimalGridView.DataController.FocusedRecordIndex := i;
                                               Success := True;
                                               Break;
                                            end;
                                      end
                                   else
                                      begin
                                         if Pos( SearchText, FieldValue) > 0 then
                                            begin
                                               cxAnimalGridView.DataController.FocusedRecordIndex := i;
                                               Success := True;
                                               Break;
                                            end;
                                      end;
                                end;
                          end;
                    end;}
                 if not Success then
                    begin
                       if StartIndex > 0 then
                          MessageSubText := 'further '
                       else
                          MessageSubText := '';
                       cxAnimalGridView.DataController.FocusedRowIndex := 0;
                       MessageDlg(Format('The search for "%s" did not return any %sresults.',[teSearchText.Text,MessageSubText]),mtInformation,[mbOK],0);

                       if (cmboSearchColumns.ItemIndex in [0,3]) then
                          begin
                             btnSearch.Caption := 'Start';
                             teSearchText.SetFocus;
                          end;
                    end;
              end
           else
              DataController.DataSet.First;
        finally
           DataController.EndLocate;
           Screen.Cursor := crDefault;
        end;
     end;
end;

procedure TMenuForm.BuildSearchColumnList;
var
   i : Integer;
begin
   cmboSearchColumns.Properties.Items.Clear;
   cmboSearchColumns.Properties.Items.AddObject('Nat. Id. No. (Part)', cxAnimalGridViewNatIDNum);
   cmboSearchColumns.Properties.Items.AddObject('Nat. Id. No. (Full)', cxAnimalGridViewNatIDNum);
   cmboSearchColumns.Properties.Items.AddObject(cxAnimalGridViewAnimalNo.Caption, cxAnimalGridViewAnimalNo);
   if not(cxAnimalGridViewName.Hidden) and (cxAnimalGridViewName.Visible) then
      cmboSearchColumns.Properties.Items.AddObject(cxAnimalGridViewName.Caption, cxAnimalGridViewName);

   if WinData.SearchField = cxAnimalGridViewAnimalNo.DataBinding.FieldName then // Animal No.
      cmboSearchColumns.ItemIndex := cmboSearchColumns.Properties.Items.IndexOf(cxAnimalGridViewAnimalNo.Caption) // Default to animal no
   else
      cmboSearchColumns.ItemIndex := 0;
end;

procedure TMenuForm.cmboSearchColumnsPropertiesChange(Sender: TObject);
begin
   teSearchText.Text := '';
   if (cmboSearchColumns.ItemIndex in [0,3]) then
      btnSearch.Caption := 'Start'
   else
      btnSearch.Caption := 'Reset';
   SetNatIDSearchText;
   cxAnimalGridView.Controller.FocusedRowIndex := 0;
   teSearchText.SetFocus;
end;

procedure TMenuForm.cmboSearchColumnsPropertiesEditValueChanged(
  Sender: TObject);
begin
  FSearchColumn := nil;
  if ( cmboSearchColumns.ItemIndex > -1 ) then
     begin
        FSearchColumn := TcxGridDBColumn(cmboSearchColumns.ItemObject);

     end;
end;

procedure TMenuForm.btnSearchClick(Sender: TObject);
begin
   if (cmboSearchColumns.ItemIndex in [1,2]) then
      begin
         teSearchText.Text := ''; // Reset the search text.
         cxAnimalGridView.Controller.FocusedRowIndex := 0;
         SetNatIDSearchText;
      end
   else
      begin
         if (cmboSearchColumns.ItemIndex = 0) then
         // only select all for part. nat. id. - this allows
         // the user to efficently search for a number of animals
            teSearchText.SelectAll;
         SearchForAnimal;
      end;
end;

procedure TMenuForm.teSearchTextEnter(Sender: TObject);
begin
   // 29/01/09 [V3.9 R5.8] /SP Bug Fix - Sort grid by Animal No., before animal no search is allowed. This is to facilitate an orderly search
   if cmboSearchColumns.Text = 'Animal No.' then
      begin
         cxAnimalGridView.DataController.ClearSorting(False);
         cxAnimalGridViewSortAnimalNo.SortOrder := soAscending;
      end;

   if teSearchText.Text = 'IE' then
      teSearchText.SelStart := 3
   else
      teSearchText.SelectAll;
end;

procedure TMenuForm.teSearchTextPropertiesChange(Sender: TObject);
begin
   if ( WinData.UseScanner ) and ( cmboSearchColumns.ItemIndex = 1 ) then Exit;

   if (cmboSearchColumns.ItemIndex in [1,2]) then
      begin
         btnSearch.Caption := 'Reset';
         if Trim(teSearchText.Text) <> '' then
            begin
               SearchForAnimal;
            end
         else
            cxAnimalGridView.Controller.FocusedRowIndex := 0;
      end
   else
      begin
         btnSearch.Caption := 'Start';
         cxAnimalGridView.Controller.FocusedRowIndex := 0;
      end;
end;

procedure TMenuForm.teSearchTextKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if ( WinData.UseScanner ) and ( cmboSearchColumns.ItemIndex = 1 ) then Exit;

   if Key = VK_RETURN then
      begin
         SearchForAnimal;
         teSearchText.SelectAll;
      end;
end;

procedure TMenuForm.SetSearchPanelVisible(const AVisible: Boolean);
begin
   if AVisible then
      begin
         PSearch.Height := 89;
      end
   else
      begin
         PSearch.Height := 23;
      end;
   Bevel1.Width := PSearch.Width-1;
   SetNatIDSearchText;
end;

procedure TMenuForm.sbAPHISEPermitClick(Sender: TObject);
begin
   OpenUrl('https://eservices.ruralni.gov.uk/profile/login.asp');
end;

procedure TMenuForm.NotifyHUK1Click(Sender: TObject);
begin
   WinData.NotifiyMovementsToHUK(AnimalCart.AnimalCartData);
end;

procedure TMenuForm.miTestFacilityClick(Sender: TObject);
begin
   //TfmRemittanceConvert.ShowConverter;
   //TfmAnimalEventTransfer.execute( TfmAnimalEventTransfer );
//   TfmPrinterSetup.ShowPrinterSetup;
{   with TfmWin64TestForm.Create(nil) do
      try
         ShowModal;
      finally
        Free;
      end;
      }
end;

procedure TMenuForm.teSearchTextExit(Sender: TObject);
var
   NewNatID : String;
begin
    if ( cmboSearchColumns.ItemIndex = 1 ) and ( WinData.UseScanner ) and ( Length ( teSearchText.Text ) > 0 ) then
      begin
         Screen.Cursor := crHourGlass;
         cxAnimalGridView.DataController.BeginLocate;
         NewNatID := teSearchText.Text;
         try
            cxAnimalGridView.DataController.Dataset.First;
            if not cxAnimalGridView.DataController.Dataset.Locate('LocateNatID',NewNatID,[]) then
               begin
                  cxAnimalGridView.DataController.FocusedRowIndex := 0;
                  Update;
                  Windows.Beep(1000,750);
               end;
            teSearchText.Text := '';
            PostMessage(teSearchText.Handle, WM_SETFOCUS,0,0);
         finally
            cxAnimalGridView.DataController.EndLocate;
            Screen.Cursor := crDefault;
         end;
      end;
end;

procedure TMenuForm.FormResize(Sender: TObject);
begin
   pGrid.Width := ClientWidth;
   pGrid.Align := alClient;
   Gradient.Width := ClientWidth;
   Toolbar97.Width := ClientWidth;
   pFilter.Width := ClientWidth;
   StatusBar.Width := ClientWidth;
   Update;
end;

procedure TMenuForm.ShowGroupEvent(AEventType: Integer);
begin
   CheckSelectedHerd;
   case AEventType of
      CBullingEvent : uEventsByGroup.ShowTheForm(TBulling,False,False);
      CServiceEvent : uEventsByGroup.ShowTheForm(TService,False,False);
      CPregDiagEvent : uEventsByGroup.ShowTheForm(TPregDiag,False,False);
      CDryOffEvent : uEventsByGroup.ShowTheForm(TDryOff,False,False);
      cWeightEvent : uEventsByGroup.ShowTheForm(TWeight,False,False);
      cHealthEvent : uEventsByGroup.ShowTheForm(THealth,False,False);
   else
      uEventsByGroup.ShowTheForm(TNoEvent,False,False)
   end;
end;

procedure TMenuForm.ShowGroupEventClick(Sender: TObject);
begin
   if ( Sender is TMenuItem ) then
      ShowGroupEvent( (Sender as TMenuItem ).Tag);
   EventGridAnimalEventsView.DataController.RefreshExternalData;
end;

procedure TMenuForm.pmWeighingEventOnPopup(Sender: TObject);
begin
   miWeighingIHM.Visible := (WinData.SystemRegisteredCountry=NIreland);
end;

procedure TMenuForm.bOtherEventsClick(Sender: TObject);
begin
   // SP "17/06/2002"
   if bOtherEvents.Visible Then
      begin
         HideAll;
         bOtherEvents.Down := True;
         pcMultipleAnimals.Top  := BreedingPageControl.Top;
         pcMultipleAnimals.Left := BreedingPageControl.Left;
//         pOtherEvents.Top  := pBreeding.Top;
//         pOtherEvents.Left := pBreeding.Left;
         case bOtherEvents.Top of
            168 : lOtherEvents.Show;
            140 : LPremium.Show;
         end;
         pcMultipleAnimals.Visible := True;
         bOtherEvents.font.Color := clBlue;
         bOtherEvents.font.Style := [fsUnderline];
      end;

end;

procedure TMenuForm.ShowAWGroupEventClick(Sender: TObject);
begin
   if ( Sender is TMenuItem ) then
      ShowAWGroupEvent( (Sender as TMenuItem ).Tag);
end;

procedure TMenuForm.ShowAWGroupEvent(AEventType: Integer);
begin
   CheckSelectedHerd;
   case AEventType of
      CDisbuddingEvent : TfmAWEventsByGroup.ShowAWEventsByGroup(WinData.UserDefaultHerdID, TDisbudding);
      CCastrateEvent : TfmAWEventsByGroup.ShowAWEventsByGroup(WinData.UserDefaultHerdID, TCastrate );
      CMealFeedingEvent : TfmAWEventsByGroup.ShowAWEventsByGroup(WinData.UserDefaultHerdID, TMealFeeding);
      CWeaningEvent : TfmAWEventsByGroup.ShowAWEventsByGroup(WinData.UserDefaultHerdID, TWean);
   end;
end;

procedure TMenuForm.UpdateBarcodeScannerControls;
var
   bUsingScanner : Boolean;
begin
   bUsingScanner := WinData.GlobalSettings.UseBarcodeScanner;
   imgBarcode.Visible := bUsingScanner;
   if bUsingScanner then
      StatusBar.Panels.Items[2].Text := cBarCodeScannerOnCaption
   else
      StatusBar.Panels.Items[2].Text := cBarCodeScannerOffCaption;
end;

procedure TMenuForm.AnimalsEventsSplitterCanResize(Sender: TObject;
  var NewSize: Integer; var Accept: Boolean);
begin
   if cxAnimalGrid.Width > 520 then
      Bevel2.Width := cxAnimalGrid.Width
   else
      Bevel2.Width := 520;
end;

procedure TMenuForm.Retagging2Click(Sender: TObject);
begin
   // Show the ReTag Form
   if NOT WinData.ActiveMovements(WinData.AnimalFileByIDID.AsInteger,
                                  WinData.AnimalFileByIDHerdID.AsInteger,
                                  WinData.AnimalFileByIDAnimalNo.AsString,
                                  WinData.AnimalFileByIDNatIDNum.AsString,FALSE) then
      begin
         uReTag.ShowReTag(WinData.DefCountry(WinData.AnimalFileByIDHerdID.AsInteger));
         SetUpQuery;
      end;
end;

procedure TMenuForm.sbTagReplacementClick(Sender: TObject);
begin
   TfmTagReplacementForm.Execute;
end;

procedure TMenuForm.sbHUKIRegClick(Sender: TObject);
begin
   if sbHUKIReg.Caption = 'HUKI Registration' then
      begin
         cxAnimalGridView.DataController.BeginFullUpdate;
         try
            uHFSCalfReg.ShowForm;
         finally
            cxAnimalGridView.DataController.EndFullUpdate;
         end;
      end
   else
      begin
         Application.CreateForm(TfmPedUpgradeReport, fmPedUpgradeReport);
         try
            fmPedUpgradeReport.ShowModal;
         finally
            if fmPedUpgradeReport <> nil then
               FreeAndNil(fmPedUpgradeReport);
         end;
      end;
end;

procedure TMenuForm.cxImage1Click(Sender: TObject);
begin
   ShellExecute(Self.Handle,'open','www.logmein123.com',nil,nil,SW_SHOWNORMAL);

end;

procedure TMenuForm.ShowAWEventReview(Sender: TObject);
begin
   TfmAWReviewEvents.Show(FHerdID);
end;

procedure TMenuForm.DownloadKingswoodInstaller1Click(Sender: TObject);
var
   GetkInstaller : TLMDWebHTTPGet;
   LMDWebDownload : TLMDWebDownload;
begin
   if IsNetConnected then
      begin
         GetkInstaller := TLMDWebHTTPGet.Create(nil);
         with GetkInstaller do
            try
               URL := 'http://www.kingswood.ie/download/winherd/kinstaller.exe';
               DownloadDir := 'C:\Kingswood Herd Management\';
               DestinationName := 'kinstaller.exe';
               InteractiveProcess;
            finally
               Free;
            end;
      end
   else
      MessageDlg(cINTERNET_CONNECTION_NOT_ESTABLISHED,mtError,[mbOK],0);
end;

procedure TMenuForm.DownloadKingswoodInstaller2Click(Sender: TObject);
begin
   if MessageDlg('You are about to download the new Kingswood Installer program.'+cCRLF+
                 'This new program requires a connection speed that is not possible'+cCRLF+
                 'with the normal dialup connection. Therefore it is recommended'+cCRLF+
                 'that you only download this program if you have a broadband connection.'+cCRLFx2+
                 'Do you want to continue with the download?',mtConfirmation,[mbYes,mbNo],0) = idYes then
   DownloadKingswoodInstaller1Click(nil);
   ksbDownloadInstaller.Visible := not FileExists(ApplicationPath + cKInstallerProgram);
end;

procedure TMenuForm.EmailSettings1Click(Sender: TObject);
begin
   WinData.EditMailboxSettings;
end;

procedure TMenuForm.miDownloadClientDataClick(Sender: TObject);
begin
   TfmDataDownload.DownloadClientData;
end;

initialization
   { Tell Delphi to hide it's hidden application window for now to avoid }
   { a "fsplash" on the taskbar if we halt due to another instance }
    ShowWindow(Application.Handle, SW_HIDE);
end.
