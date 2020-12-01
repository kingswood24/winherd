{
  ----------------------------------------------------------------------------

  11/03/2003 SP:-

  Fixed: Bull Premium Status not working correctly.

  11/03/2003 SP.

  ----------------------------------------------------------------------------

  05/10/10 [V4.0 R4.9] /MK Additional Feature - WriteEvents - If FCTSRegMarkAsRegistered then Events(Sale or Purchase).CTSReg := False
                                                              Else Events(Sale or Purchase).CTSReg := True.

  25/02/11 [V4.0 R8.4] /MK Bug - uKImport - Fixed Bug Where Brucellosis Date and TBTestDate were not saving to Animals Table.

  05/12/11 [V5.0 R2.4] /MK Bug Fix - Customer Drop-Down-Width Was Lower Than Component Width.

  07/02/12 [V5.0 R3.7] /MK Change - FindAnimal - Removed The Search For AnimalNo - Causing Problems.

  15/02/12 [V5.0 R3.8] /MK Change - New Options For Ignore Event Messages & In Animal Numbers - Reset (Existing Animal No. will be left empty).
                                  - New Options Are Not The Defaults.
                                  - If Ignore Event Messages Then Do Not Show Screen To Allow The User To Select Which Animal To Transfer Events From And To.
                                  - If Reset (Existing Animal No. will be left empty) Then Old AnimalNo Will Be Renumberd To Blank.

  21/03/12 [V5.0 R4.5] /MK Change - CustomerCloseUp - Re-Open Query To Get New Customer Entry.

  22/05/12 [V5.0 R7.0] /MK Additional Feature - Added Grade Field For Sale Event Only.

  24/05/12 [V5.0 R7.0] /MK Bug Fix - FindAnimal Defaults AnimalNo To Null So Search Can Work With Or Without AnimalNo.

  24/05/12 [V5.0 R7.0] /MK Additional Feature - If Not MultiHerd Database Then Set lcbHerdLookup To DefaultHerdID.

  24/05/12 [V5.0 R7.0] /MK Additional Feature - All Manual Entry Of Purchased Animals.

  31/05/12 [V5.0 R7.0] /MK Bug Fix - Fixed Tab Order Sequence Of Panels.

  11/10/12 [V5.1 R0.3] /MK Change - ExportToXML - Introduced new logic to save multiple files if AnimalCount is more than FMaxAnimalsInXMLExport.
                                  - Store FMaxAnimalsInXMLExport to registry as 100. This will allow Kingswood tech support to change this key
                                    to a smaller value should it need to be changed.

  16/10/12 [V5.1 R0.4] /MK Change - Customer Lookup - Changed ListStle to Delimted and changed to Delimter to "-" so Herd Number shows after Name.

  12/11/12 [V5.1 R0.9] /MK Additional Feature - Added Sale and Purchase CrushXML functions.

  30/11/12 [V5.1 R1.3] /MK Change - Sort qCustomers by Name.

  14/12/12 [V5.1 R3.5] /MK Additional Feature - Added the TransponderNo to the Import and Export XML procedures.

  08/01/13 [V5.1 R3.7] /MK Bug Fix - AnimalDataGridManualNatIDNumValidate - New checked added for AllowDuplicateNatID's.

  28/03/13 [V5.1 R5.4] /MK Change - Changed Customers/Supplier/Buyer Combo.LookupSource to look at new WinData.QueryCustomers/QuerySuppliers/QueryBuyers.

  24/06/13 [V5.1 R7.5] /MK Change - If animal has AnimalNo then, if Beef Herd, don't create NewID event.

  09/12/13 [V5.2 R6.8] /MK Bug Fix - Check for animal no in all herds not just current herd.

  29/01/14 [V5.2 R7.8] /MK Bug Fix - AnimalNoValidate - If bbRenumberExistingAnimal.Down then don't give warning for Animal No.

  07/02/14 [V5.2 R8.1] /MK Bug Fix - SaleDateChange - Removed lines to stop error on SetFocus and to move forward after
                                                      SaleDateChange to set group boxes to enabled.

  24/07/14 [V5.3 R4.0] /MK Change - Show the DeleteAnimal option if animals are loaded from an import file.

  24/11/14 [V5.3 R9.0] /MK Change - WriteEvents - Purchase - When creating events check to see if event already exists.
                                                           - AnimalFileByID.BeforePost creates events for the animal that are in the database before
                                                             the animal was sold to the herd that its coming from.

  27/01/15 [V5.4 R2.6] /MK Change - CreateShowForm - Added new field to show animals that are StillOffFarm by Temp Movement.
                                  - LoadExportData - Set StillOffFarm by active tempmovement event of animals in grid.
                                  - btnCreateSalesClick - Check to see if any animals have are StillOffFarm.

  25/02/15 [V5.4 R2.7] /MK Bug Fix - FormActivate - Delphi lost the lookup sources for these components.

  19/11/15 [V5.5 R0.8] /MK Bug Fix - ValidateNos - Only re number animals that are not in the existing herd i.e. have not been purchased already - M.Callan.
                                   - CheckAnimalExists - This function was not used so I changed to show AnimalID of animal with SearchNatID
                                                         that exists in the herd that animals are being being purchased.
                                   - WriteEvents/Purchases - Use CheckAnimalExists to see if animal is already in herd animal is purchased into.

  24/11/15 [V5.5 R1.0] /MK Bug Fix - btnCreateSales - Check for temp movements incorrectly using Count(AID) in SQL where * is better for recordcount > 0 check.

  27/11/15 [V5.5 R1.4] /MK Bug Fix - ValidateNos - Only re number animals that are InHerd = False in the database.

  04/03/16 [V5.5 R4.2] /MK Bug Fix - UpdateAncestry - Because the program wasn't checking for animal numbers it was causing duplicate AI bulls to be created.

  07/03/16 [V5.5 R4.2] /MK Bug Fix - WriteEvents(TSaleDeath) - Finally phase of renumbering animal - TempAnimalNo was not being assigned Trim(WinData.AnimalFileByIDAnimalNo.AsString)

  18/07/16 [V5.5 R6.5] /MK Bug Fix - btnSelectPurchaseFileClick - BreedCode Column Property Class was not assiged before ImportGrid is shown. Probably lost with Delphi glitch.

  17/10/16 [V5.6 R2.0] /MK Change - SCC was left out of the Milk Recording transfer - Michael Callan.

  26/10/16 [V5.6 R2.7] /MK Change - UpdateMilkDiskTrans as well for databases with more than one herd i.e. Michael Callan only.

  27/10/16 [V5.6 R2.7] /MK Bug Fix - Renumber an animal from the HerdID that the animal was located in from WinData.FHerdIDList.

  18/01/17 [V5.6 R4.0] /MK Bug Fix - LoadExportData - BreedCode Column Property Class was not assiged before ExportGrid is shown. Probably lost with Delphi glitch.

  07/07/17 [V5.6 R9.1] /MK Change - AnimalDataGridManualNatIDNumValidate - Remove country code, if found, from tag and add correct country code depending on Dept. algorithm.

  21/09/17 [V5.7 R3.0] /MK Change - btnCreateSalesClick - Check for culling reason is unnessecary - GL request.

  22/09/17 [V5.7 R3.0] /MK Bug Fix - SalesGrpCloseUp, PurchGrpCloseUp - Made changes to show the appropriate Group Setup screen.
                           Change - btnCreateSalesClick - Added check for feed events after the sales date.

  21/11/17 [V5.7 R4.6] /MK Change - btnCreateSalesClick - Use UpdateGridData for SaleDate just in case the SaleDate was never passed into grid after group was loaded - Michael Callan.

  14/05/18 [V5.8 R0.1] /MK Change - Added the Batch Group combobox.
                                  - Added the Purchase Group and Batch Group combobox columns to the Animal grid.
                                  - Added the capability, on Update Herd Register, to add the animals to the group selected from the grid not the header.
                           Additional Feature - WriteEvents - If animal is saved and there are default treatments then saved the default treatments also.

  07/06/18 [V5.8 R0.6] /MK Change - AddAnimalToXMLFile - Add NationalID number to CrushXML file.

  23/05/19 [V5.8 R9.2] /MK Change - Included the Vaccination events in the export and import of health and dry off events.

  14/10/19 [V5.9 R0.9] /MK Additional Feature - WriteEvents - When an animal is sold and Parlour user with RemoveTransponderAfterSale preference tick, remove TransponderNo from animal.

  19/12/19 [V5.9 R1.5] /MK Additional Feature - importFromXML - If the file coming in does not contain the name/transponder/herdbook/dam/sire and the animal originated from
                                                                this herd then bring in the name/transponder/herdbook/dam/sire from previous instance if it existed.

  20/12/19 [V5.9 R1.5] /MK Additional Feature - Allow import/export of A1A2 result - Pat Ryan.

  12/03/20 [V5.9 R2.8] /MK Additional Feature - Added the capability to export VPANo with Health/DryOff/Vaccination events.
                                              - When importing these events search for VPANo in current medicine table or search for it in the DrugListing.xml file.

  11/06/20 [V5.9 R4.8] /MK Additional Feature - Added the capabilty to export and import weighing events - Alan Gilligan.
                                              - Added a new event source for sKImport to better understand where an event was saved from.
}

unit uKImport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ToolEdit, RxLookup, StdCtrls, Mask, DBCtrls,
  ExtCtrls, kwDBNavigator, RXCtrls, ComCtrls, ToolWin, Db, DBTables,
  CurrEdit, GenTypesConst, Buttons, BDE, Menus, DBGridEh, PrnDbgeh,
  cxControls, cxContainer, cxEdit, cxGroupBox, cxButtons, dxStatusBar,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, dxBar, ActnList, dxBarExtItems, cxNavigator,
  cxDBNavigator,cxProgressBar, xml_generator, MSXML2_TLB, cxCustomData,
  cxDropDownEdit, cxTextEdit, cxDBEdit, cxDBLookupComboBox, cxHyperLinkEdit,
  cxCalendar, cxGridCardView, uPreferences, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, uCrushXML, DairyData, KRoutines, uHerdLookup, uAnimal,
  uDrugFinder, uApplicationLog;

type
  TExportAnimals = (eaCart, eaGroup);
  TPremiumStatus = Array [0..2] of Boolean;
  TFileOperation = (FSuccess, FSuccessHiddenWrite, FReadError, FWriteError, FUnknown, FFileAlreadyExists, FAborted);
  TfKImport = class(TForm)
    qPurchGrp: TQuery;
    CurrTableHeader: TTable;
    CurrTableData: TTable;
    dsCurrTableHeader: TDataSource;
    dsCurrTableData: TDataSource;
    qSalesGrp: TQuery;
    dsSalesGrp: TDataSource;
    dsPurchGrp: TDataSource;
    GetFile: TFilenameEdit;
    qExistingNo: TQuery;
    PopupMenu1: TPopupMenu;
    IgnoreAnimalNumber1: TMenuItem;
    ModifyAnimalNumber1: TMenuItem;
    IncludePremiumStatus: TMenuItem;
    PrintGrid: TPrintDBGridEh;
    PopupMenu2: TPopupMenu;
    PrintGrid1: TMenuItem;
    N1: TMenuItem;
    DuplicateAnimalsNumbers1: TMenuItem;
    CreatePurchaseEvents: TMenuItem;
    IncludeAncestorAnimals: TMenuItem;
    Include1: TMenuItem;
    UpdateAnimalNumber: TQuery;
    pSalePanel: TPanel;
    gbLoadSaleAnimals: TcxGroupBox;
    Label1: TLabel;
    SalesGrp: TRxDBLookupCombo;
    Label16: TLabel;
    btnLoadFromCart: TcxButton;
    gbSalesDetails: TcxGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    SaleDate: TDBDateEdit;
    Customer: TRxDBLookupCombo;
    Label4: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label15: TLabel;
    Weight: TDBEdit;
    SaleComment: TDBEdit;
    Price: TDBEdit;
    DBEdit2: TDBEdit;
    Label17: TLabel;
    pPurchPanel: TPanel;
    gbDestinationHerd: TcxGroupBox;
    gbPurchDetails: TcxGroupBox;
    Label6: TLabel;
    PurchDate: TDBDateEdit;
    Label8: TLabel;
    Supplier: TRxDBLookupCombo;
    Label10: TLabel;
    Buyer: TRxDBLookupCombo;
    Label11: TLabel;
    PurchPrice: TDBEdit;
    Label12: TLabel;
    PurchWeight: TDBEdit;
    Label14: TLabel;
    DBEdit1: TDBEdit;
    Label31: TLabel;
    PurchComment: TDBEdit;
    gbSelectPurchFile: TcxGroupBox;
    Label5: TLabel;
    btnSelectPurchaseFile: TcxButton;
    StatusBar: TdxStatusBar;
    pComplete: TPanel;
    gbCompleteTrans: TcxGroupBox;
    lNoAnimalsInCart: TLabel;
    btnUpdateTables: TcxButton;
    btnCreateSales: TcxButton;
    gbReview: TcxGroupBox;
    AnimalGrid: TDBGridEh;
    Panel1: TPanel;
    pbProgBar: TProgressBar;
    lTotal: TLabel;
    Label19: TLabel;
    rxcCulling: TRxDBLookupCombo;
    Label18: TLabel;
    PurchGrp: TRxDBLookupCombo;
    Label27: TLabel;
    lcbHerdLookup: TRxDBLookupCombo;
    AnimalDataGrid: TcxGrid;
    AnimalDataGridDBTableView: TcxGridDBTableView;
    AnimalDataGridLevel: TcxGridLevel;
    AnimalDataGridDBTableViewNatIDNo: TcxGridDBColumn;
    AnimalDataGridDBTableViewAnimalNo: TcxGridDBColumn;
    AnimalDataGridDBTableViewDOB: TcxGridDBColumn;
    AnimalDataGridDBTableViewSex: TcxGridDBColumn;
    AnimalDataGridDBTableViewPrice: TcxGridDBColumn;
    AnimalDataGridDBTableViewWeight: TcxGridDBColumn;
    AnimalDataGridDBTableViewLotNo: TcxGridDBColumn;
    AnimalDataGridDBTableViewComment: TcxGridDBColumn;
    AnimalDataGridDBBandedTableView: TcxGridDBBandedTableView;
    AnimalDataGridDBBandedTableViewID: TcxGridDBBandedColumn;
    AnimalDataGridDBBandedTableViewAID: TcxGridDBBandedColumn;
    AnimalDataGridDBBandedTableViewAnimalNo: TcxGridDBBandedColumn;
    AnimalDataGridDBBandedTableViewSortAnimalNo: TcxGridDBBandedColumn;
    AnimalDataGridDBBandedTableViewNatIDNum: TcxGridDBBandedColumn;
    AnimalDataGridDBBandedTableViewSortNatID: TcxGridDBBandedColumn;
    AnimalDataGridDBBandedTableViewDateOfBirth: TcxGridDBBandedColumn;
    AnimalDataGridDBBandedTableViewLactNo: TcxGridDBBandedColumn;
    AnimalDataGridDBBandedTableViewColourCode: TcxGridDBBandedColumn;
    AnimalDataGridDBBandedTableViewSex: TcxGridDBBandedColumn;
    AnimalDataGridDBBandedTableViewName: TcxGridDBBandedColumn;
    AnimalDataGridDBBandedTableViewHerdBookNo: TcxGridDBBandedColumn;
    AnimalDataGridDBBandedTableViewBreedCode: TcxGridDBBandedColumn;
    AnimalDataGridDBBandedTableViewBreeding: TcxGridDBBandedColumn;
    AnimalDataGridDBBandedTableViewTBTestDate: TcxGridDBBandedColumn;
    AnimalDataGridDBBandedTableViewBruceDate: TcxGridDBBandedColumn;
    AnimalDataGridDBBandedTableViewDamIDNum: TcxGridDBBandedColumn;
    AnimalDataGridDBBandedTableViewSireIDNum: TcxGridDBBandedColumn;
    AnimalDataGridDBBandedTableViewPrice: TcxGridDBBandedColumn;
    AnimalDataGridDBBandedTableViewWeight: TcxGridDBBandedColumn;
    AnimalDataGridDBBandedTableViewLotNumber: TcxGridDBBandedColumn;
    AnimalDataGridDBBandedTableViewComment: TcxGridDBBandedColumn;
    BarManager: TdxBarManager;
    blbExit: TdxBarLargeButton;
    blbAccounts: TdxBarLargeButton;
    blbOptions: TdxBarLargeButton;
    blbHelp: TdxBarLargeButton;
    ActionList: TActionList;
    actExit: TAction;
    actAccounts: TAction;
    actHelp: TAction;
    pmOptions: TdxBarPopupMenu;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    bbIgnoreAnimalNumber: TdxBarButton;
    bbModifyAnimalNumber: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxStatusBar1Container2: TdxStatusBarContainerControl;
    OpenDialog: TOpenDialog;
    btnReviewData: TcxButton;
    bbImportAsOldFormat: TdxBarButton;
    bbIgnoreEventMessages: TdxBarButton;
    bbRenumberExistingAnimal: TdxBarButton;
    AnimalDataGridDBBandedTableViewGrade: TcxGridDBBandedColumn;
    Label13: TLabel;
    Label20: TLabel;
    btnPurchManually: TcxButton;
    pTableControl: TPanel;
    btnAddAnimal: TcxButton;
    btnDeleteAnimal: TcxButton;
    cxDBNavigator1: TcxDBNavigator;
    AnimalDataGridDBBandedTableViewStillOffFarm: TcxGridDBBandedColumn;
    lBatchGroup: TLabel;
    dblcBatchGroups: TRxDBLookupCombo;
    dsBatchGroups: TDataSource;
    qBatchGroups: TQuery;
    AnimalDataGridDBBandedTableViewPurchaseGroup: TcxGridDBBandedColumn;
    AnimalDataGridDBBandedTableViewBatchGroup: TcxGridDBBandedColumn;
    qClearTransponderNo: TQuery;
    AnimalDataGridDBBandedTableViewA1A2Result: TcxGridDBBandedColumn;
    procedure PurchGrpCloseUp(Sender: TObject);
    procedure SalesGrpExit(Sender: TObject);
    procedure SalesGrpCloseUp(Sender: TObject);
    procedure btnCreateSalesClick(Sender: TObject);
    procedure sbRemoveClick(Sender: TObject);
    procedure SaleDateChange(Sender: TObject);
    procedure AnimalGridDblClick(Sender: TObject);
    procedure CurrTableHeaderNewRecord(DataSet: TDataSet);
    procedure PurchGrpDropDown(Sender: TObject);
    procedure SupplierCloseUp(Sender: TObject);
    procedure BuyerCloseUp(Sender: TObject);
    procedure SalesGrpDropDown(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SalesGrpChange(Sender: TObject);
    procedure ModifyAnimalNumber1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure IncludePremiumStatusClick(Sender: TObject);
    procedure PrintGrid1Click(Sender: TObject);
    procedure WeightEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CreatePurchaseEventsClick(Sender: TObject);
    procedure IncludeAncestorAnimalsClick(Sender: TObject);
    procedure btnUpdateTablesClick(Sender: TObject);
    procedure btnSelectPurchaseFileClick(Sender: TObject);
    procedure btnLoadFromCartClick(Sender: TObject);
    procedure SaleDateExit(Sender: TObject);
    procedure PriceExit(Sender: TObject);
    procedure PurchPriceExit(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure rxcCullingExit(Sender: TObject);
    procedure AnimalDataGridDBBandedTableViewDblClick(Sender: TObject);
    procedure actHelpExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actAccountsExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnReviewDataClick(Sender: TObject);
    procedure bbImportAsOldFormatClick(Sender: TObject);
    procedure bbModifyAnimalNumberClick(Sender: TObject);
    procedure bbIgnoreAnimalNumberClick(Sender: TObject);
    procedure bbRenumberExistingAnimalClick(Sender: TObject);
    procedure bbIgnoreEventMessagesClick(Sender: TObject);
    procedure btnPurchManuallyClick(Sender: TObject);
    procedure CurrTableDataNewRecord(DataSet: TDataSet);
    procedure btnAddAnimalClick(Sender: TObject);
    procedure btnDeleteAnimalClick(Sender: TObject);
    procedure CustomerCloseUp(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dblcBatchGroupsCloseUp(Sender: TObject);
    procedure dblcBatchGroupsDropDown(Sender: TObject);
    procedure PurchGrpChange(Sender: TObject);
    procedure dblcBatchGroupsChange(Sender: TObject);
  private
    function GetMovementStoreBackupDir: string;
    function GetMovementStorePathDir: string;
    procedure AnimalDataGridManualAnimalNoValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure AnimalDataGridManualNatIDNumValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure AnimalDataGridManualDateOfBirthValidate(
      Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure AnimalDataGridManualSexEditValueChanged(
      Sender: TObject);
    procedure AnimalDataGridManualKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure AnimalDataGridManualCellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure AddRecord;
    procedure CheckAnimalsTable;
    procedure ProcessBarCodeScan(ABarcodeText : String);
    procedure UpdateGroups(AGroupType: TGroupType; ASelectedGroup : Integer);
  private
    { Private declarations }

    FDOMDocument : IXMLDOMDocument;

    FFieldToFile,
    FBuffer : String;
    EID : Integer;
    TextF : TextFile;
    GenQuery : TQuery;
    DoWhat : TEventType;
    Path : String;
    CustEligForSlght : Boolean;
    CustCosts : Double;
    FileName : String;
    NewNo : String;
    FDatabaseUpdated : Boolean;
    BreedTable : TTable;
    FProgressBar : TcxProgressBar;

    FPregDiagTable, FHealthTable, FBullingTable, FServiceTable, FWeighingTable : TTable;
    FEventDataSource : TDataSource;

    FCTSRegMarkAsRegistered : Boolean;

    FManualPurchase : Boolean;

    FHyperLink : TcxHyperLinkEdit;

    FMaxAnimalsInXMLExport : Integer;

    FHerdType : THerdType;

    FMedicineTable : TTable;

    function ProcessFile(DoWhat : TEventType; FPath : String) : TFileOperation;
    procedure EmptyTables;
    function exportToXML : Boolean;
    function importFromXML : Boolean;
    procedure LoadExportData(AExportAnimals : TExportAnimals);
    procedure SetDataFields(DoWhat : TEventType);
    procedure SetGridCols(DoWhat : TEventType);
    procedure StripRight (var StrToStrip : String; Len : Integer);
    procedure StripLeft (var StrToStrip : String; Len : Integer);
    procedure PadRight(Var St : String; Len : Integer);
    procedure PadLeft(Var St : String; Len : Integer);

    procedure QueryParent(const AParentID : Integer; var AParentNode : IXMLDOMElement );
    function WriteEvents(DoWhat : TEventType) : Boolean;
    function CheckSlaughter(AID : Integer; DateOfBirth : TDateTime; SaleDate : TDateTime): Boolean;
    procedure CustomerSlaughter(CustID : Integer);
//    function CheckValidNatIDs : Boolean;
    procedure StripLeadingAndTrailingAlphas ( var st:string );
    function CheckExistingNum : String;
    function CheckPremiumStatus(AnimalID : Integer; Sex : String) : TPremiumStatus;
    procedure CheckInput;
    procedure ValidateNos;
    function IncludeCount : Integer;
    function AddNewBreed(BreedCode : String) : Integer;
    procedure UpdateAncestry;
    procedure UpdateGridData(AFieldName : string);
    procedure UpdateRecordCount;
    procedure EnableGroupBox(AGroupBox : TcxGroupBox; const AEnable : Boolean);

    function GetFileName: Boolean;

    function CheckAnimalExists(ANatIdNum : String) : Integer;
    function UpdateSireDamID(ASex : String; ASiblingId, AParentId : Integer) : Boolean;
    //   07/02/12 [V5.0 R3.7] /MK Change - FindAnimal - Removed The Search For AnimalNo - Causing Problems.
    //   24/05/12 [V5.0 R7.0] /MK Bug Fix - FindAnimal Defaults AnimalNo To Null So Search Can Work With Or Without AnimalNo.
    function FindAnimal(const ANatIdNum, AHerdBookNo, AName, ASex : string; AAnimalNo : String = '') : Integer;

    procedure CheckCTSMovementReg;
    procedure MyFormCloseQuery(Sender: TObject; var CanClose: Boolean);

    property MovementStoreDir : string read GetMovementStorePathDir;
    property MovementStoreBackupDir : string read GetMovementStoreBackupDir;
    procedure FHyperLinkEditClick(Sender: TObject);

  public
    { Public declarations }
    FAncestryTable, FEventTable, FLactationTable : TTable;
  end;

  procedure CreateShowForm(PurchOrSale : TEventType; var ADatabaseUpdated : Boolean; const LoadFromCart : Boolean);

var
  fKImport: TfKImport;

{const
   FileSuccess    = 0;
   FileReadError  = 1;
   FileWriteError = 2;
 }
implementation
uses
   MenuUnit,
   uGroupSetUp,
   uCustomers,
   uSuppliers,
   uBuyers,
   uEditInfo,
   EventRecording,
   Def, uAnimalCart, FileCtrl, uImageStore,
   ComObj, ActiveX, uMovementsEventReview, uMovementsImportOptions;

{$R *.DFM}
procedure CreateShowForm(PurchOrSale : TEventType; var ADatabaseUpdated : Boolean; const LoadFromCart : Boolean);
begin
   Application.CreateForm(TfKImport, fKImport);
   with fKImport do
      begin
         try
            //   15/02/12 [V5.0 R3.8] /MK Change - New Boolean In WinData Set By bbIgnoreEventMessages.
            WinData.FKImportIgnoreEventMessages := bbIgnoreEventMessages.Down;

            // Create Gen Query!
            GenQuery := TQuery.Create(nil);
            GenQuery.DataBaseName := WinData.KingData.DataBaseName;

            FProgressBar.Visible := False; // Hide progress bar!

            btnAddAnimal.Visible := False;
            btnDeleteAnimal.Visible := False;

            DoWhat := PurchOrSale;
            if PurchOrSale = TSaleDeath then
               begin
                  btnReviewData.Visible := False;

                  if AnimalCart.IsEmpty then
                     begin
                        lNoAnimalsInCart.Caption := 'No animals found in cart';
                        btnLoadFromCart.Visible := False;
                        ActiveControl := SalesGrp;
                     end
                  else
                     begin
                        ActiveControl := btnLoadFromCart;
                     end;

                  gbReview.Caption := 'Step 3 - Review/Edit';
                  gbCompleteTrans.Caption := 'Step 4 - Complete';

                  Customer.LookupSource := WinData.dsQueryCustomers;

                  btnCreateSales.Visible := True;
                  btnUpdateTables.Visible := False;
                  btnCreateSales.Left := 14;

                  { First Create the Sales Header Table }
                  with CurrTableHeader do
                     begin
                        DataBaseName := WinData.KingData.DataBaseName;
                        TableName    := 'TempTableHeader.db';

                        with FieldDefs do
                           begin
                              Add('HeaderID',ftAutoInc,0,False);
                              Add('SalesGrp',ftInteger,0,False);
                              Add('SaleDate',ftDate,0,False);
                              Add('CustomerID',ftInteger,0,False);
                              Add('Price',ftCurrency,0,False);
                              Add('Weight',ftFloat,0,False);
                              Add('Comment',ftString,20,False);
                              Add('LotNumber',ftString,10,False);
                              Add('CullingReason',ftInteger,0,False);
                           end;

                        with IndexDefs do
                           begin
                              Clear;
                              Add('','HeaderID',[ixPrimary,ixUnique]);
                           end;

                        CreateTable;
                        Open;
                     end;

                  { Now ceate the Sales Animal Data Table }
                  with CurrTableData do
                     begin
                        DataBaseName := WinData.KingData.DataBaseName;
                        TableName    := 'TempTableData.db';

                        with FieldDefs do
                           begin
                              Add('ID',ftAutoInc,0,False);
                              Add('AID',ftInteger,0,False);
                              Add('AnimalNo',ftString,10,False);
                              Add('SortAnimalNo',ftString,10,False);
                              Add('NatIDNum',ftString,20,False);
                              Add('SortNatID',ftString,20,False);
                              Add('DateOfBirth',ftDate,0,False);
                              Add('LactNo',ftInteger,0,False);
                              Add('ColourCode',ftString,6,False);
                              Add('Sex',ftString,10,False);
                              Add('TransponderNo',ftString,20);
                              Add('Name',ftString,40,False);
                              Add('HerdBookNo',ftString,20,False);
                              Add('BreedCode',ftString,6,False);
                              Add('Breeding',ftBoolean,0,False);
                              Add('UsedForBreeding',ftString,3,False);
                              Add('TBTestDate',ftDate,0,False);
                              Add('BruceDate',ftDate,0,False);
                              Add('A1A2Result',ftString,5,False);
                              Add('DamID',ftInteger);
                              Add('DamIDNum',ftString,20,False);
                              Add('SireID',ftInteger);
                              Add('SireIDNum',ftString,20,False);
                              Add('SaleDate',ftDate,0,False);
                              Add('Customer',ftString,30,False);
                              Add('Price',ftCurrency,0,False);

                              //   22/05/12 [V5.0 R7.0] /MK Additional Feature - Added Grade Field.
                              Add('Grade',ftString,15,False);

                              Add('Weight',ftFloat,0,False);
                              Add('Comment',ftString,20,False);
                              Add('HerdID',ftInteger,0,False);
                              Add('F',ftBoolean,0,False);
                              Add('S',ftBoolean,0,False);
                              Add('B',ftBoolean,0,False);
                              Add('LotNumber',ftString,10,False);
                              Add('CullingReason',ftInteger,0,False);
                              Add('IgnorePurchaseEvent',ftBoolean,0,False);

                              //   27/01/15 [V5.4 R2.6] /MK Change - Added new field to show animals that are StillOffFarm by Temp Movement.
                              Add ('StillOffFarm',ftBoolean);

                              Add('BatchGroup',ftInteger);
                              Add('PurchaseGroup',ftInteger);
                           end;

                        with IndexDefs do
                           begin
                              Clear;
                              Add('','ID',[ixPrimary,ixUnique]);
                              Add('iAID','AID',[ixCaseInSensitive]);
                           end;

                        CreateTable;
                        Open;
                     end;

                  qSalesGrp.Open; { Open drop down list for Sales Groups }

                  PPurchPanel.Hide; { Hide Purchases Panel }
                  pSalePanel.Show;  { Show Sales Panel }

                  btnUpdateTables.Visible := False;
                  Caption := 'Movements Out'; // Form caption

                  // This must be assigned at runtime, will create exception if assigned at design time
                  // and
                  rxcCulling.DataField := 'CullingReason';

                  if LoadFromCart then
                     begin
                        btnLoadFromCart.Click;
                        btnLoadFromCart.Enabled := False;
                        SalesGrp.Enabled := False;
                        gbLoadSaleAnimals.Enabled := False;
                        Label1.Enabled := False;
                        Label16.Enabled := False;
                        Label17.Enabled := False;
                     end
                  else
                     begin
                        EnableGroupBox(gbSalesDetails,False);
                        EnableGroupBox(gbReview,False);
                        EnableGroupBox(gbCompleteTrans,False);
                     end;
               end
            else
               begin
                  //   22/05/12 [V5.0 R7.0] /MK Additional Feature - Remove Grade Field For Purchase Event.
                  AnimalDataGridDBBandedTableViewGrade.Visible := False;
                  AnimalDataGridDBBandedTableViewStillOffFarm.Visible := False;

                  Supplier.LookupSource := WinData.dsQuerySuppliers;
                  Buyer.LookupSource := WinData.dsQueryBuyers;

                  btnReviewData.Visible := True;
                  btnReviewData.Enabled := False;

                  gbReview.Caption := 'Step 4 - Review/Edit';
                  gbCompleteTrans.Caption := 'Step 5 - Complete';

                  ActiveControl := btnSelectPurchaseFile;

                  btnCreateSales.Visible := False;
                  btnUpdateTables.Visible := True;
                  btnUpdateTables.Left := 14;

                  { First Create the Purch Header Table }
                  with CurrTableHeader do
                     begin
                        DataBaseName := WinData.KingData.DataBaseName;
                        TableName    := 'TempTableHeader.db';

                        with FieldDefs do
                           begin
                              Add('HeaderID',ftAutoInc,0,False);
                              Add('PurchGrp',ftInteger,0,False);
                              Add('BatchGrp',ftInteger,0,False);
                              Add('PurchDate',ftDate,0,False);
                              Add('HerdID',ftInteger,0,False);
                              Add('SupplierID',ftInteger,0,False);
                              Add('BuyerID',ftInteger,0,False);
                              Add('Price',ftCurrency,0,False);
                              Add('Weight',ftFloat,0,False);
                              Add('Comment',ftString,20,False);
                              Add('LotNumber',ftString,10,False);
                           end;

                        with IndexDefs do
                           begin
                              Clear;
                              Add('','HeaderID',[ixPrimary,ixUnique]);
                           end;

                        CreateTable;
                        Open;
                     end;

                  { Now ceate the Purch Animal Data Table. }
                  with CurrTableData do
                     begin
                        DataBaseName := WinData.KingData.DataBaseName;
                        TableName    := 'TempTableData.db';

                        with FieldDefs do
                           begin
                              Add('ID',ftAutoInc,0,False);
                              Add('AID',ftInteger,0,False);
                              Add('AnimalNo',ftString,10,False);
                              Add('SortAnimalNo',ftString,10,False);
                              Add('NatIDNum',ftString,20,False);
                              Add('SortNatID',ftString,20,False);
                              Add('DateOfBirth',ftDate,0,False);
                              Add('LactNo',ftInteger,0,False);
                              Add('TransponderNo',ftString,20);
                              Add('ColourCode',ftString,6,False);
                              Add('Sex',ftString,10,False);
                              Add('Name',ftString,40,False);
                              Add('HerdBookNo',ftString,20,False);
                              Add('BreedCode',ftString,6,False);
                              Add('Breeding',ftBoolean,0,False);
                              Add('UsedForBreeding',ftString,3,False);
                              Add('TBTestDate',ftDate,0,False);
                              Add('BruceDate',ftDate,0,False);
                              Add('A1A2Result',ftString,5,False);
                              Add('DamIDNum',ftString,20,False); // Dam NatID Number
                              Add('SireIDNum',ftString,20,False); // Sire NatD Number
                              Add('PurchDate',ftDate,0,False);

                              //   22/05/12 [V5.0 R7.0] /MK Additional Feature - Added Grade Field.
                              Add('Grade',ftString,15,False);

                              Add('Price',ftCurrency,0,False);
                              Add('Weight',ftFloat,0,False);
                              Add('Comment',ftString,20,False);
                              Add('Include', ftBoolean, 0, False);

                              Add('F',ftBoolean,0,False);
                              Add('S',ftBoolean,0,False);
                              Add('B',ftBoolean,0,False);
                              Add('LotNumber',ftString,10,False);
                              Add('IgnorePurchaseEvent',ftBoolean,0,False);

                              Add('BatchGroup',ftInteger);
                              Add('PurchaseGroup',ftInteger);
                           end;

                        with IndexDefs do
                           begin
                              Clear;
                              Add('','ID',[ixPrimary,ixUnique]);
                              Add('iAID','AID',[ixCaseInSensitive]);
                           end;

                        CreateTable;
                        Open;
                     end;

                  qPurchGrp.Open; { Open drop down datasource list for Purchase Groups }

                  qBatchGroups.Open; { Open drop down datasource list for Purchase Groups }

                  PPurchPanel.Show; { Show Purchases Panel }
                  pSalePanel.Hide;  { Hide Sales Panel }

                  btnUpdateTables.Visible := True;
                  Caption := 'Movements In'; // Form caption

                  EnableGroupBox(gbReview,False);
                  EnableGroupBox(gbCompleteTrans,False);
                  EnableGroupBox(gbDestinationHerd,False);
                  EnableGroupBox(gbPurchDetails,False);
               end;

            FAncestryTable := TTable.Create(nil);
            with FAncestryTable do
               begin
                  DataBaseName := WinData.KingData.DataBaseName;
                  TableName    := 'tmpMovementAncestry.db';
                  if Exists then DeleteTable;

                  with FieldDefs do
                     begin
                        Add('ID',ftAutoInc,0,False);
                        Add('RefID',ftInteger,0,False);
                        Add('AnimalNo',ftString,10,False);
                        Add('NatIDNum',ftString,20,False);
                        Add('DateOfBirth',ftDate,0,False);
                        Add('LactNo',ftInteger,0,False);
                        Add('Sex',ftString,10,False);
                        Add('Name',ftString,40,False);
                        Add('HerdBookNo',ftString,20,False);
                        Add('BreedCode',ftString,6,False);
                        Add('Colour',ftString,6,False);
                        Add('SireID',ftInteger);
                        Add('DamID',ftInteger);
                     end;

                  with IndexDefs do
                     begin
                        Clear;
                        Add('','ID',[ixPrimary,ixUnique]);
                        Add('iRefID','RefID',[ixCaseInSensitive]);
                        Add('iSireID','SireID',[ixCaseInSensitive]);
                        Add('iDamID','DamID',[ixCaseInSensitive]);
                     end;
                  CreateTable;
                  Open;
               end;

            FEventTable := TTable.Create(nil);
            with FEventTable do
               begin
                  DataBaseName := WinData.KingData.DataBaseName;
                  TableName    := 'tmpMovementEvents.db';
                  if Exists then DeleteTable;

                  with FieldDefs do
                     begin
                        Add('ID',ftAutoInc,0,False);
                        Add('RefID',ftInteger,0,False);
                        Add('EventType',ftInteger);
                        Add('EventDate',ftDateTime);
                        Add('EventDesc',ftString,40);
                        Add('AnimalLactNo',ftInteger);
                     end;

                  with IndexDefs do
                     begin
                        Clear;
                        Add('','ID',[ixPrimary,ixUnique]);
                        Add('iRefID','RefID',[ixCaseInSensitive]);
                     end;
                  CreateTable;
                  Open;
               end;

            FLactationTable := TTable.Create(nil);
            with FLactationTable do
               begin
                  DataBaseName := WinData.KingData.DataBaseName;
                  TableName    := 'tmpMovementLact.db';
                  if Exists then DeleteTable;

                  with FieldDefs do
                     begin
                        Add('ID',ftAutoInc);
                        Add('RefID',ftInteger);
                        Add('LactNo',ftInteger);
                        Add('DY',ftFloat);
                        Add('DBPc',ftFloat);
                        Add('DPPc',ftFloat);
                        Add('DLPc',ftFloat);
                        Add('CY',ftFloat);
                        Add('CBPc',ftFloat);
                        Add('CPPc',ftFloat);
                        Add('CLPc',ftFloat);
                        Add('Recs',ftInteger);
                        Add('DIM',ftInteger);
                        Add('Y305',ftFloat);
                        Add('BPc305',ftFloat);
                        Add('PPc305',ftFloat);
                        Add('LPc305',ftFloat);
                        Add('SCC',ftFloat);
                     end;

                  with IndexDefs do
                     begin
                        Clear;
                        Add('','ID',[ixPrimary,ixUnique]);
                        Add('iRefID','RefID',[ixCaseInSensitive]);
                     end;
                  CreateTable;
                  Open;
               end;

            FPregDiagTable := TTable.Create(nil);
            with FPregDiagTable do
               begin
                  DataBaseName := WinData.KingData.DataBaseName;
                  TableName    := 'tmpMovementPregDiag.db';
                  if Exists then DeleteTable;

                  with FieldDefs do
                     begin
                        Add('ID',ftAutoInc);
                        Add('RefID',ftInteger);
                        Add('PregnancyStatus',ftBoolean);
                        Add('DaysInCalf',ftInteger);
                        Add('NoOfCalves',ftInteger);
                     end;

                  with IndexDefs do
                     begin
                        Clear;
                        Add('','ID',[ixPrimary,ixUnique]);
                        Add('iRefID','RefID',[ixCaseInSensitive]);
                     end;
                  CreateTable;
                  Open;
               end;

            FHealthTable := TTable.Create(nil);
            with FHealthTable do
               begin
                  DataBaseName := WinData.KingData.DataBaseName;
                  TableName    := 'tmpMovementHealth.db';
                  if Exists then DeleteTable;

                  with FieldDefs do
                     begin
                        Add('ID',ftAutoInc);
                        Add('RefID',ftInteger);
                        Add('DrugUsed',ftInteger);
                        Add('DrugCode',ftString,10);
                        Add('VPANo',ftString,20);
                        Add('ApplicRate',ftFloat);
                     end;

                  with IndexDefs do
                     begin
                        Clear;
                        Add('','ID',[ixPrimary,ixUnique]);
                        Add('iRefID','RefID',[ixCaseInSensitive]);
                     end;
                  CreateTable;
                  Open;
               end;

            FBullingTable := TTable.Create(nil);
            with FBullingTable do
               begin
                  DataBaseName := WinData.KingData.DataBaseName;
                  TableName    := 'tmpMovementBulling.db';
                  if Exists then DeleteTable;

                  with FieldDefs do
                     begin
                        Add('ID',ftAutoInc);
                        Add('RefID',ftInteger);
                        Add('AnimalNo',ftString,10,False);
                        Add('NatIDNum',ftString,20,False);
                        Add('DateOfBirth',ftDateTime,0,False);
                        //Add('LactNo',ftInteger,0,False);
                        //Add('ColourCode',ftString,6,False);
                        Add('Sex',ftString,10,False);
                        Add('Name',ftString,40,False);
                        Add('HerdBookNo',ftString,20,False);
                        Add('BreedCode',ftString,6,False);
                     end;

                  with IndexDefs do
                     begin
                        Clear;
                        Add('','ID',[ixPrimary,ixUnique]);
                        Add('iRefID','RefID',[ixCaseInSensitive]);
                     end;
                  CreateTable;
                  Open;
               end;

            FServiceTable := TTable.Create(nil);
            with FServiceTable do
               begin
                  DataBaseName := WinData.KingData.DataBaseName;
                  TableName    := 'tmpMovementService.db';
                  if Exists then DeleteTable;

                  with FieldDefs do
                     begin
                        Add('ID',ftAutoInc);
                        Add('RefID',ftInteger);
                        Add('AnimalNo',ftString,10,False);
                        Add('NatIDNum',ftString,20,False);
                        Add('DateOfBirth',ftDateTime,0,False);
                        //Add('LactNo',ftInteger,0,False);
                        //Add('ColourCode',ftString,6,False);
                        Add('Sex',ftString,10,False);
                        Add('Name',ftString,40,False);
                        Add('HerdBookNo',ftString,20,False);
                        Add('BreedCode',ftString,6,False);
                     end;

                  with IndexDefs do
                     begin
                        Clear;
                        Add('','ID',[ixPrimary,ixUnique]);
                        Add('iRefID','RefID',[ixCaseInSensitive]);
                     end;
                  CreateTable;
                  Open;
               end;

            FWeighingTable := TTable.Create(nil);
            with FWeighingTable do
               begin
                  DatabaseName := WinData.KingData.DatabaseName;
                  TableName := 'tmpMovementWeighing.db';
                  if Exists then DeleteTable;

                  with FieldDefs do
                     begin
                        Add('ID',ftAutoInc);
                        Add('RefID',ftInteger);
                        Add('AnimalNo',ftString,10,False);
                        Add('NatIDNum',ftString,20,False);
                        Add('DateOfBirth',ftDateTime,0,False);
                        //Add('LactNo',ftInteger,0,False);
                        //Add('ColourCode',ftString,6,False);
                        Add('Sex',ftString,10,False);
                        Add('Name',ftString,40,False);
                        Add('HerdBookNo',ftString,20,False);
                        Add('BreedCode',ftString,6,False);
                        Add('Weight',ftFloat,0,False);
                     end;

                  with IndexDefs do
                     begin
                        Clear;
                        Add('','ID',[ixPrimary,ixUnique]);
                        Add('iRefID','RefID',[ixCaseInSensitive]);
                     end;
                  CreateTable;
                  Open;
               end;

            FEventDataSource := TDataSource.Create(nil);
            FEventDataSource.DataSet := FEventTable;

            FHyperLink := TcxHyperLinkEdit.Create(nil);
            with FHyperLink do
               begin
                  Parent := pTableControl;
                  Top := btnDeleteAnimal.Top + 2;
                  Left := btnDeleteAnimal.Left + btnDeleteAnimal.Width + 5;
                  if ( WinData.GlobalSettings.UseBarcodeScanner ) then
                     Text := 'Disable Barcode Scanner'
                  else
                     Text := 'Enable Barcode Scanner';
                  AutoSize := False;
                  Width := 155;
                  Properties.Prefix := '';
                  Properties.ReadOnly := True;
                  Properties.SingleClick := True;
                  Style.BorderStyle := ebsNone;
                  Style.Color := clBtnFace;
                  Style.Edges := [];

                  Visible := False;
                  OnClick := FHyperLinkEditClick;
               end;

            FHerdType := HerdLookup.GetHerdType(WinData.UserDefaultHerdID);

            WinData.QueryCustomers.Active := True;
            SetDataFields(PurchOrSale); { Set Data fields for components use PurchOrSale to define datafields }
            SetGridCols(PurchOrSale);   { Hide/Show Grid Colums use PurchOrSale to define cols }

            ShowModal; { Show Form }
         finally
            CurrTableHeader.Close;
            CurrTableData.Close;
            FreeAndNil(CurrTableHeader);
            FreeAndNil(CurrTableData);
            FreeAndNil(FHyperLink);
            GenQuery.Close;
            FreeAndNil(GenQuery);
            ADatabaseUpdated := FDatabaseUpdated;
            FreeAndNil(fKImport); //
         end;
      end;
end;

procedure TfKImport.PurchGrpCloseUp(Sender: TObject);
var
   GroupID : SmallInt;
begin
   if (PurchGrp.Value = '0') then
      begin
         uGroupSetUp.ShowTheFormID(3, GroupID); { Show the Groups form if Combo box value is empty }
         qPurchGrp.Close;
         qPurchGrp.Open;
         if ( GroupID <> 0 ) then
            PurchGrp.Value := IntToStr(GroupID);
      end;
end;

function TfKImport.ProcessFile(DoWhat : TEventType; FPath : String) : TFileOperation;
var
   D,M,Y : Word;
   ItemCount : Integer;
   S : String;
   HiddenFileWrite : Boolean;
   Aborted : Boolean;

   function AddToBuffer(Buffer, Field : String) : String;
   begin
      { Add String(FieldToFile) to buffer }
       FBuffer := Buffer + Field;
       FFieldToFile := '';
   end;

   function GetFileName: Boolean;
   begin
      FileName := StripAllNomNumAlpha( Customer.Text ) + ' '+ FormatDateTime('ddmmyy',Date) + '.dat';
      if InputQuery('Confirm/Change Filename', 'Filename', FileName) then
         Result := Length(FileName) > 0
      else
         Aborted := True;
   end;

begin
   Result := FUnknown;
   CurrTableData.DisableControls;
   DecodeDate(Date, Y, M, D);

   case DoWhat of
      TSaleDeath : begin
                      if exportToXML then
                         Result := FSuccess
                   end;
      TPurchase  : try
                      { Do Purchases }
                      CurrTableData.Close;
                      CurrTableData.EmptyTable;
                      CurrTableData.Open;
                      AssignFile(TextF, FPath); { Initialize file with variable }
                      ReSet(TextF); { Create & Open File }
                      while not eof(TextF) do
                         begin

                            FillChar(FBuffer,SizeOf(FBuffer),Chr(0));
                            ReadLn(Textf, FBuffer);

                            if Trim(FBuffer) <> '' then
                               begin
                                  if CurrTableData.RecordCount > 0 then
                                     CurrTableData.Append
                                  else
                                     CurrTableData.Insert;

                                  S := Copy(FBuffer, 1, 10);
                                  StripLeadingAndTrailingAlphas(S);
                                  if S <> '' then
                                     CurrTableData.FieldByName('AnimalNo').AsString := S;

                                  S := Copy(FBuffer, 11, 20);
                                  StripLeadingAndTrailingAlphas(S);
                                  if S <> '' then
                                     CurrTableData.FieldByName('NatIDNum').AsString := S;

                                  S := Copy(FBuffer, 31, 10 );
                                  StripLeadingAndTrailingAlphas(S);
                                  if S <> '' then
                                     CurrTableData.FieldByName('DateOfBirth').AsDateTime := StrToDate(S);

                                  S := Copy(FBuffer, 41, 2 );
                                  StripLeadingAndTrailingAlphas(S);
                                  if S <> '' then
                                     CurrTableData.FieldByName('LactNo').AsInteger := StrToInt(S);

                                  S := Copy(FBuffer, 43, 3);
                                  StripLeadingAndTrailingAlphas(S);
                                  if S <> '' then
                                     CurrTableData.FieldByName('ColourCode').AsString := S;

                                  S := Copy(FBuffer, 46, 1);
                                  if S = 'F' then
                                     CurrTableData.FieldByName('Sex').AsString := 'Female'
                                  else if S = 'B' then
                                     CurrTableData.FieldByName('Sex').AsString := 'Bull'
                                  else
                                     CurrTableData.FieldByName('Sex').AsString := 'Steer';

                                  S := Copy(FBuffer, 47, 40);
                                  StripLeadingAndTrailingAlphas(S);
                                  if S <> '' then
                                     CurrTableData.FieldByName('Name').AsString := S;

                                  S := Copy(FBuffer, 87, 16);
                                  StripLeadingAndTrailingAlphas(S);
                                  if S <> '' then
                                     CurrTableData.FieldByName('HerdBookNo').AsString := S;

                                  S := Copy(FBuffer, 103, 3);
                                  StripLeadingAndTrailingAlphas(S);
                                  if S <> '' then
                                     CurrTableData.FieldByName('BreedCode').AsString := S;

                                  S := Copy(FBuffer, 106, 1 );
                                  StripLeadingAndTrailingAlphas(S);
                                  if S = 'T' then
                                     CurrTableData.FieldByName('Breeding').AsBoolean := True
                                  else
                                     CurrTableData.FieldByName('Breeding').AsBoolean := False;

                                  S := Copy(FBuffer, 107, 10);
                                  StripLeadingAndTrailingAlphas(S);
                                  if S <> '' then
                                     CurrTableData.FieldByName('TBTestDate').AsDateTime := StrToDate(S);

                                  S := Copy(FBuffer, 117, 10);
                                  StripLeadingAndTrailingAlphas(S);
                                  if S <> '' then
                                     CurrTableData.FieldByName('BruceDate').AsDateTime := StrToDate(S);

                                  S := Copy(FBuffer, 127, 20 );
                                  StripLeadingAndTrailingAlphas(S);
                                  if S <> '' then
                                     CurrTableData.FieldByName('DamIDNum').AsString := S;

                                  S := Copy(FBuffer, 147, 20);
                                  StripLeadingAndTrailingAlphas(S);
                                  if S <> '' then
                                     CurrTableData.FieldByName('SireIDNum').AsString := S;

                                  try
                                     S := (Copy(FBuffer, 167, 30));
                                     StripLeadingAndTrailingAlphas(S);
                                     if S <> '' then
                                        CurrTableData.FieldByName('Customer').AsString := S;
                                  except
                                     CurrTableData.FieldByName('Customer').AsString := S;
                                  end;

                                  try
                                     S := (Copy(FBuffer, 197, 10));
                                     StripLeadingAndTrailingAlphas(S);
                                     if S <> '' then
                                        CurrTableData.FieldByName('Price').AsFloat := StrToFloat(S);
                                  except
                                     CurrTableData.FieldByName('Price').AsFloat := 0;
                                  end;
                                  try
                                     S := (Copy(FBuffer, 207, 10));
                                     StripLeadingAndTrailingAlphas(S);
                                     if S <> '' then
                                        CurrTableData.FieldByName('Weight').AsFloat := StrToFloat(S);
                                  except
                                     CurrTableData.FieldByName('Weight').AsFloat := 0;
                                  end;

                                  try
                                     S := (Copy(FBuffer, 217, 1));
                                     StripLeadingAndTrailingAlphas(S);
                                     if S <> '' then
                                        if S = 'T' then
                                           CurrTableData.FieldByName('B').AsBoolean := True
                                        else
                                           CurrTableData.FieldByName('B').AsBoolean := False;
                                  except
                                     CurrTableData.FieldByName('B').AsBoolean := False;
                                  end;
                                  try
                                     S := (Copy(FBuffer, 218, 1));
                                     StripLeadingAndTrailingAlphas(S);
                                     if S <> '' then
                                        if S = 'T' then
                                           CurrTableData.FieldByName('F').AsBoolean := True
                                        else
                                           CurrTableData.FieldByName('F').AsBoolean := False;
                                  except
                                     CurrTableData.FieldByName('F').AsBoolean := False;
                                  end;

                                  try
                                     S := (Copy(FBuffer, 219, 1));
                                     StripLeadingAndTrailingAlphas(S);
                                     if S <> '' then
                                        if S = 'T' then
                                           CurrTableData.FieldByName('S').AsBoolean := True
                                        else
                                           CurrTableData.FieldByName('S').AsBoolean := False;
                                  except
                                     CurrTableData.FieldByName('S').AsBoolean := False;
                                  end;

                                  try
                                     S := (Copy(FBuffer, 220, 10));
                                     StripLeadingAndTrailingAlphas(S);
                                     if S <> '' then
                                        CurrTableData.FieldByName('LotNumber').AsString := Trim(S);
                                  except
                                     CurrTableData.FieldByName('LotNumber').AsString := '';
                                  end;

                                  CurrTableData.FieldByName('Include').AsBoolean := True;
                                  CurrTableData.FieldByName('PurchaseGroup').AsInteger := 0;
                                  CurrTableData.FieldByName('BatchGroup').AsInteger := 0;
                                  CurrTableData.Post;
                               end;
                         end;
                      CurrTableData.First;
                      btnUpdateTables.Enabled := True;
                      Result := FSuccess;
                   except
                      Result := FReadError;
                   end;
   end;
   CurrTableData.FlushBuffers;
   CurrTableData.EnableControls;
end;

procedure TfKImport.EmptyTables;
begin
   { Delete contents of both tables }
   with GenQuery do
      begin
         { First the Header table }
         SQL.Clear;
         SQL.Add('DELETE FROM "TempTableHeader.db" ');
         ExecSQL;

         { First the Data table }
         SQL.Clear;
         SQL.Add('DELETE FROM "TempTableData.db" ');
         ExecSQL;
      end;
end;

procedure TfKImport.SetDataFields(DoWhat: TEventType);
begin
   // Set Datafields
   if DoWhat = TSaleDeath then
      begin
         SalesGrp.DataField      := 'SalesGrp';
         SaleDate.DataField      := 'SaleDate';
         Customer.DataField      := 'CustomerID';
         Customer.LookupDisplay  := 'Name;BTEHerdNo';
         Price.DataField         := 'Price';
         Weight.DataField        := 'Weight';
         SaleComment.DataField   := 'Comment';
      end
   else
      begin
         PurchGrp.DataField        := 'PurchGrp';
         dblcBatchGroups.DataField := 'BatchGrp';
         PurchDate.DataField       := 'PurchDate';
         lcbHerdLookup.DataField   := 'HerdID';
         Supplier.DataField        := 'SupplierID';
         Buyer.DataField           := 'BuyerID';
         PurchComment.DataField    := 'Comment';
         PurchPrice.DataField      := 'Price';
      end;
end;

procedure TfKImport.SetGridCols(DoWhat: TEventType);
begin
   AnimalDataGridDBBandedTableViewName.Visible := ( DoWhat = TPurchase ) and ( FHerdType in [htSuckler, htDairy] );
   AnimalDataGridDBBandedTableViewHerdBookNo.Visible := ( DoWhat = TPurchase ) and ( FHerdType in [htSuckler, htDairy] );
   AnimalDataGridDBBandedTableViewTBTestDate.Visible := ( DoWhat = TPurchase ) and ( FHerdType in [htSuckler, htDairy] );
   AnimalDataGridDBBandedTableViewBruceDate.Visible := ( DoWhat = TPurchase ) and ( FHerdType in [htSuckler, htDairy] );
   AnimalDataGridDBBandedTableViewDamIDNum.Visible := ( DoWhat = TPurchase ) and ( FHerdType in [htSuckler, htDairy] );
   AnimalDataGridDBBandedTableViewSireIDNum.Visible := ( DoWhat = TPurchase ) and ( FHerdType in [htSuckler, htDairy] );
   AnimalDataGridDBBandedTableViewLactNo.Visible := ( DoWhat = TPurchase ) and ( FHerdType in [htSuckler, htDairy] );
   AnimalDataGridDBBandedTableViewBreeding.Visible := ( DoWhat = TPurchase ) and ( FHerdType in [htSuckler, htDairy] );
end;

procedure TfKImport.LoadExportData(AExportAnimals : TExportAnimals);
var
   iPremiaStatus : TPremiumStatus;
begin

   if ( not(AExportAnimals in ([eaGroup,eaCart])) ) then
      Exit;

   { Delete contents of tables }
   EmptyTables;
   { Insert animal details into Data Table }
   AnimalGrid.DataSource.Dataset.DisableControls; // Disable controls

   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('INSERT INTO TempTableData                                                                                                  ');
         SQL.Add('            (AID, NatIDNum, SortNatID, AnimalNo, SortAnimalNo, DateOfBirth, LactNo, ColourCode,                            ');
         SQL.Add('             Sex, Name, HerdBookNo, BreedCode, Breeding, TBTestDate, BruceDate, DamID,                                     ');
         SQL.Add('             DamIDNum, TransponderNo, SireID, SireIDNum, HerdID, A1A2Result)                                               ');
         SQL.Add('SELECT DISTINCT A.ID, A.NatIDNum, A.SortNatID, A.AnimalNo, A.SortAnimalNo, A.DateOfBirth, A.LactNo, G2.LookupCode, A.Sex,  ');
         SQL.Add('                A.Name, A.HerdBookNo, B.Code, A.Breeding, A.TBTestDate, A.Brucellosis, ADam.ID, ADam.NatIDNum,             ');
         SQL.Add('                A.TransponderNo, ASire.ID, ASire.NatIDNum, A.HerdID, D.A1A2                                                ');
         SQL.Add('FROM Animals A                                    ');
         if (AExportAnimals = eaGroup) then
             SQL.Add('RIGHT JOIN GrpLinks G   ON (A.ID=G.AnimalID)  '); // Ensure we get all Animals in Group
         SQL.Add('LEFT JOIN Animals ADam  ON (A.DamID=ADam.ID)      '); // Get Dam NatID if any
         SQL.Add('LEFT JOIN Animals ASire ON (A.SireID=ASire.ID)    '); // Get Sire NatID if any
         SQL.Add('LEFT JOIN Breeds B      ON (A.PrimaryBreed=B.ID)  '); // Get Breed Code if any
         SQL.Add('LEFT JOIN GenLook G2    ON (A.Colour=G2.ID)       '); // Get Colour Code if any
         SQL.Add('LEFT JOIN DNAResults D  ON (D.AnimalID=A.ID)      '); 
         if (AExportAnimals = eaGroup) then
            SQL.Add('WHERE (G.GroupID='+SalesGrp.Value+')             ')
         else if (AExportAnimals = eaCart) then
            SQL.Add('WHERE (A.ID IN '+AnimalCart.AnimalCartDataAsWideString+') ');
         SQL.Add('AND   (A.InHerd=True)                            ');
         SQL.Add('AND   (A.NatIDNum IS NOT NULL)                   ');
         SQL.Add('AND   (A.AnimalDeleted = False)                  ');
         SQL.Add('AND   (A.DateOfBirth IS NOT NULL)                ');
         SQL.Add('AND   (A.ID NOT IN (SELECT AnimalID FROM Events');
         SQL.Add('                    WHERE ( EventType = ' + IntToStr(CSaleDeathEvent) + ')))');
         Prepare;
         try
            ExecSQL;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      end;

   //   27/01/15 [V5.4 R2.6] /MK Change - Set new field StillOffFarm from tempmovements of animals.
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('UPDATE '+CurrTableData.TableName+'');
         SQL.Add('SET StillOffFarm = False');
         try
            ExecSQL;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;

         SQL.Clear;
         SQL.Add('SELECT TM.EventID, E.AnimalID, TM.StillOffFarm');
         SQL.Add('FROM movements TM');
         SQL.Add('LEFT JOIN Events E On (E.ID = TM.EventID)');
         SQL.Add('LEFT JOIN TempTableData TD On (TD.AID = E.AnimalID)');
         SQL.Add('WHERE (E.AnimalID = TM.AID)');
         SQL.Add('AND   (TM.StillOffFarm = True)');
         try
            Open;
            First;
            while ( not(Eof) ) do
               begin
                  if ( CurrTableData.Locate('AID',Fields[1].AsInteger,[]) ) then
                     try
                        CurrTableData.Edit;
                        CurrTableData.FieldByName('StillOffFarm').AsBoolean := Fields[2].AsBoolean;
                        CurrTableData.Post;
                     except
                        on e : Exception do
                           ShowMessage(e.Message);
                     end;
                  Next;
               end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      end;

   AnimalGrid.DataSource.Dataset.Refresh;
   AnimalGrid.DataSource.Dataset.EnableControls; // Show Records after SQL Insert.

   if AnimalGrid.DataSource.Dataset.RecordCount > 0 then
      begin
         if (AExportAnimals = eaGroup) and ( SalesGrp.Value > '0' ) then
            begin
               if WinData.Groups.Locate('ID', StrToInt(SalesGrp.Value), []) then
                  begin
                     if WinData.Groups.FieldByName('EventDate').AsDateTime > 0 then
                        SaleDate.Date := WinData.Groups.FieldByName('EventDate').AsDateTime;

                     if WinData.Groups.FieldByName('DestSource').AsInteger > 0 then
                        try
                          Customer.Value := IntToStr(WinData.Groups.FieldByName('DestSource').AsInteger);
                        except
                        end;
                  end;
            end;
         EnableGroupBox(gbSalesDetails,True);
         EnableGroupBox(gbReview,True);
         EnableGroupBox(gbCompleteTrans,True);
      end
   else
      MessageDlg('No animals have been found!',mtInformation,[mbOK],0);

   //   18/01/17 [V5.6 R4.0] /MK Bug Fix - BreedCode Column Property Class was not assiged before ExportGrid is shown. Probably lost with Delphi glitch.
   with AnimalDataGridDBBandedTableView do
      begin
         with AnimalDataGridDBBandedTableViewBreedCode do
            begin
               Width := 50;
               PropertiesClass := TcxLookupComboBoxProperties;
               with TcxLookupComboBoxProperties(Properties) do
                  begin
                     Alignment.Horz := taLeftJustify;
                     Alignment.Vert := taVCenter;
                     ListSource := WinData.BreedsSource;
                     ListFieldNames := 'Code;Name';
                     KeyFieldNames := 'Code';
                     DropDownWidth := 200;
                     ListOptions.ShowHeader := False;
                  end;
            end;
      end;

   UpdateRecordCount;
end;

procedure TfKImport.SalesGrpExit(Sender: TObject);
begin
   if ( SalesGrp.Value = '0' ) or ( SalesGrp.Value = '' ) then { ensure a group is selected for use }
      begin
           MessageDlg('Please select a Sales Group', mtInformation,[mbOK],0);
           SalesGrp.SetFocus;
      end
   else
      LoadExportData(eaGroup);  { if group is selected load animals from group }
end;

procedure TfKImport.SalesGrpCloseUp(Sender: TObject);
var
   GroupID : SmallInt;
begin
   if (SalesGrp.Value = '0') then
      begin
         uGroupSetUp.ShowTheFormID(3, GroupID, True); { Show the Groups form if Combo box value is empty }
         qSalesGrp.Close;
         qSalesGrp.Open;
         if GroupID <> 0 then
            SalesGrp.KeyValue := GroupID;
      end;
end;

procedure TfKImport.btnCreateSalesClick(Sender: TObject);
var
   FileResult : TFileOperation;
   iaAnimalIDs : array of Integer;
begin
   Self.Enabled := False;
   try
      if CurrTableData.RecordCount <= 0 then
         begin
            MessageDlg('There are no animals to be exported!',mtInformation,[mbOk],0);
            Exit;
         end;

      if (Customer.Value = '0') or (Customer.Value = '') then
         begin
            MessageDlg('Customer must be entered before continuing',mtWarning,[mbOk],0);
            Customer.DropDown;
            Exit;
         end;

      if ( SaleDate.Date <= 0 ) then
         begin
            MessageDlg('Sale date must be entered.',mtWarning,[mbOk],0);
            Exit;
         end
      else
         //   21/11/17 [V5.7 R4.6] /MK Change - Use UpdateGridData for SaleDate just in case the SaleDate was never passed into grid after group was loaded.
         UpdateGridData('SaleDate');

      {
      //   21/09/17 [V5.7 R3.0] /MK Change - Check for culling reason is unnessecary - GL request.
      if ( rxcCulling.Value = '0' ) then
         begin
            if MessageDlg('No Culling Reason has been selected, do you want to continue?',mtWarning,[mbYes,mbNO],0) = idNo then
               Exit;
         end;
      }

      //   27/01/15 [V5.4 R2.6] /MK Change - Check to see if there are animals that are still off farm for temp movement.
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            //   24/11/15 [V5.5 R1.0] /MK Bug Fix - Incorrectly using Count(AID) in SQL where * is better for recordcount > 0 check.
            SQL.Add('SELECT *');
            SQL.Add('FROM '+CurrTableData.TableName+'');
            SQL.Add('WHERE StillOffFarm = True');
            try
               Open;
               if ( RecordCount > 0 ) then
                  if ( MessageDlg('Some animals have an active Temporary Movement event.'+cCRLF+
                                  'Do you wish to continue?',mtConfirmation,[mbYes,mbNo],0) = mrNo ) then Exit;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;

      //   22/09/17 [V5.7 R3.0] /MK Bug Fix - Added check for feed events after the sales date.
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT T.AID, T.NatIDNum, F.AllocDate');
            SQL.Add('FROM TempTableData T');
            SQL.Add('LEFT JOIN FeedEvents F ON (F.AnimalID = T.AID)');
            SQL.Add('WHERE (F.EndDate IS NULL)');
            SQL.Add('AND   (F.AllocDate >= "'+FormatDateTime(cUSDateStyle,SaleDate.Date)+'")');
            try
               Open;
               if ( RecordCount > 0 ) then
                  begin
                     First;
                     MessageDlg(Format('This animal has active feed event(s) on or after %s.'+cCRLF+
                                       'Feeds cannot be ended before this date.'+cCRLF+
                                       'Please change the date of movement to after this date.',
                                       [FormatDateTime(cIrishDateStyle,
                                                       FieldByName('AllocDate').AsDateTime)]),
                                       mtError,[mbOK],0);
                     SaleDate.SetFocus;
                     Exit;
                  end;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;

      FileResult := ProcessFile(TSaleDeath, '');

      if ( FileResult <> FSuccess ) then
         begin
            MessageDlg('Movement out has been cancelled.',mtWarning,[mbOK],0);
            Exit;
         end;

      if WriteEvents(TSaleDeath) then
         begin
            if FileResult = FSuccess then
               MessageDlg(Format('%d sale events have been successfully created and a file saved to:'+cCRLFx2+
                                 '%s',[CurrTableData.RecordCount,Path]),mtInformation,[mbOK],0)
            else if FileResult = FSuccessHiddenWrite then
               MessageDlg(Format('%d sale events have been successfully created.',[CurrTableData.RecordCount]),mtInformation,[mbOK],0);
            EmptyTables;
            AnimalGrid.DataSource:= nil;
            Close;
         end;
   finally
      Self.Enabled := True;
   end;
end;

procedure TfKImport.PadLeft(var St: String; Len: Integer);
begin
   // Pad Spaces to Left of String
   while Length(St) < Len Do
      St := ' ' + St;
end;

procedure TfKImport.PadRight(var St: String; Len: Integer);
begin
   // Pad Spaces to Right of String
   while Length(St) < Len Do
      St := St + ' ';
end;

procedure TfKImport.StripLeft(var StrToStrip: String; Len: Integer);
begin
   // Strip spaces to Left of String
   while Length(StrToStrip) > Len Do
      Delete(StrToStrip,1,1);
end;

procedure TfKImport.StripRight(var StrToStrip: String; Len: Integer);
begin
   // Strip spaces to Right of String
   while Length(StrToStrip) > Len Do
      Delete(StrToStrip,(Length(StrToStrip)),1);
end;

{function TfKImport.StripPunctuation(StrToStrip: String): String;
var
   i,
   LenOfStr : Integer;
   TempStr  : String;
begin
   TempStr := StrToStrip;
   LenOfStr := Length(TempStr);
   if (LenOfStr > 0) then
      for i := 1 to LenOfStr do
         if NOT (TempStr[i] IN ['A'..'Z','a'..'z','0'..'9']) then
            Delete(TempStr,i,1);
   Result := TempStr;
end;
}
procedure TfKImport.sbRemoveClick(Sender: TObject);
begin
   try
      AnimalGrid.SelectedRows.Delete;
   except
      //
   end;
end;

function TfKImport.WriteEvents(DoWhat: TEventType) : Boolean;
var
   AID : Integer;
   BuyerCosts,
   SupplierCosts : Currency;
   DamID,
   SireID : Integer;
   TempNum : String;
   SaleEvent : TSaleDeathEvent;
   PurchEvent : TPurchaseEvent;
   Progress : Integer;
   TempAnimalNo : String[10];
   AnimalFileByIDSQL : WideString;
   AnimalSaved : Boolean;

   ServiceEvent : TServiceEvent;
   BullingEvent : TBullingEvent;
   HealthEvent : THealthEvent;
   CalvingEvent : TCalvingEvent;
   PregDiagEvent : TPregDiagEvent;
   WeighingEvent : TWeighingEvent;

   qDefaultHealthEvents : TQuery;
   fDefaultHealthMulitiplier : Double;

   Animal : TAnimal;

   procedure UpdateMilkDiskTransInfo (AAnimalID : Integer);
   var
      qMilkDiskTrans : TQuery;
      sNatID : String;
      iAID : Integer;
   begin
      if ( AAnimalID = 0 ) then Exit;
      qMilkDiskTrans := TQuery.Create(nil);
      with qMilkDiskTrans do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT NatIDNum');
            SQL.Add('FROM Animals');
            SQL.Add('WHERE ID = '+IntToStr(AAnimalID)+'');
            try
               Open;
               if ( RecordCount = 0 ) then Exit;
               if ( Length(Fields[0].AsString) = 0 ) then Exit;
               sNatID := '';
               sNatID := Fields[0].AsString;
               Close;
               SQL.Clear;
               SQL.Add('SELECT ID');
               SQL.Add('FROM Animals');
               SQL.Add('WHERE NatIDNum = "'+sNatID+'"');
               SQL.Add('AND InHerd = False');
               SQL.Add('AND HerdID <> '+IntToStr(WinData.UserDefaultHerdID)+'');
               SQL.Add('AND ID IN (SELECT AnimalID FROM MilkDiskTrans)');
               Open;
               if ( RecordCount = 0 ) then Exit;
               if ( Fields[0].AsInteger = 0 ) then Exit;
               iAID := 0;
               iAID := Fields[0].AsInteger;
               Close;
               SQL.Clear;
               SQL.Add('UPDATE MilkDiskTrans');
               SQL.Add('SET AnimalID = '+IntToStr(AAnimalID)+'');
               SQL.Add('WHERE AnimalID = '+IntToStr(iAID)+'');
               ExecSQL;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;
   end;

   function AddBull(ATable : TTable) : Integer;
   var
      Bull : TAnimalRecord;
   begin
      //   24/05/12 [V5.0 R7.0] /MK Bug Fix - FindAnimal Defaults AnimalNo To Null So Search Can Work With Or Without AnimalNo.
      if ( ATable.FieldByName('AnimalNo').AsString <> '' ) then
         begin
            Result := ( FindAnimal(ATable.FieldByName('NatIdNum').AsString,
                                   ATable.FieldByName('HerdBookNo').AsString,
                                   ATable.FieldByName('Name').AsString,'Bull',
                                   ATable.FieldByName('AnimalNo').AsString) );
         end
      else
         begin
            Result := ( FindAnimal(ATable.FieldByName('NatIdNum').AsString,
                                   ATable.FieldByName('HerdBookNo').AsString,
                                   ATable.FieldByName('Name').AsString,'Bull') );
         end;

      if ( Result <= 0 ) then
         begin
            Bull := TAnimalRecord.Create;
            with Bull do
               try
                  try
                     RaiseExceptions := False;
                     ValidateBreed := False;
                     ValidateColour := False;
                     ValidateDOB := False;
                     ValidateIdTags := False;
                     AddToNoneHerd;
                     HerdBookNo := ATable.FieldByName('HerdBookNo').AsString;
                     AnimalNo := ATable.FieldByName('AnimalNo').AsString;
                     NatIDNum := ATable.FieldByName('NatIdNum').AsString;
                     Name := ATable.FieldByName('Name').AsString;
                     Sex := cSex_Bull;
                     PrimaryBreedCode := ATable.FieldByName('BreedCode').AsString;
                     if ( Save ) then
                        Result := Id;
                  except
                     Cancel;
                  end;
               finally
                  FreeAndNil(Bull);
               end;
         end;
   end;

begin
   Result := False;
   WinData.MassSalesUpdate := True;
   WinData.IsItPreSale := False;
   WinData.AnimalFileByID.DisableControls;
   Progress := 1;

   CheckCTSMovementReg;
   try
      case DoWhat of
         TSaleDeath : begin
                         { Loop through table, write sale event for all animals }
                         { Initialize progress bar}
                         FProgressBar.Visible := True;
                         FProgressBar.Properties.Min := 0;
                         FProgressBar.Properties.Max := CurrTableData.RecordCount;
                         SaleEvent := TSaleDeathEvent.Create('SDRec'); // Create instance of TSaleDeath Event Class
                         with CurrTableData do
                            try
                               First;
                               while ( not(Eof) ) do
                                  begin
                                     Application.ProcessMessages;
                                     SaleEvent.Append;
                                     SaleEvent.EventType := TSaleDeath;
                                     SaleEvent.AnimalID := CurrTableData.FieldByName('AID').AsInteger;
                                     SaleEvent.AnimalLactNo := CurrTableData.FieldByName('LactNo').AsInteger;
                                     SaleEvent.AnimalHerdID := CurrTableData.FieldByName('HerdID').AsInteger;
                                     SaleEvent.EventDate := CurrTableData.FieldByName('SaleDate').AsDateTime;
                                     SaleEvent.EventComment := CurrTableData.FieldByName('Comment').AsString;
                                     SaleEvent.Sold := TRUE;
                                     SaleEvent.Customer := CurrTableHeader.FieldByName('CustomerID').AsInteger;
                                     SaleEvent.Price := CurrTableData.FieldByName('Price').AsCurrency;
                                     SaleEvent.Weight := CurrTableData.FieldByName('Weight').AsFloat;

                                     //   22/05/12 [V5.0 R7.0] /MK Additional Feature - Added Grade Field.
                                     SaleEvent.Grade := CurrTableData.FieldByName('Grade').AsString;

                                     SaleEvent.Notified := FALSE;
                                     SaleEvent.PreSale := FALSE;
                                     SaleEvent.CustomerCosts := CustCosts;
                                     SaleEvent.Culled := CurrTableData.FieldByName('CullingReason').AsInteger;
                                     SaleEvent.Slaughter := CheckSlaughter(CurrTableData.FieldByName('AID').AsInteger,
                                                                                                 CurrTableData.FieldByName('DateOfBirth').AsDateTime,
                                                                                                 CurrTableData.FieldByName('SaleDate').AsDateTime);
                                     //  05/10/10 [V4.0 R4.9] /MK Additional Feature - If SaleEvent.CTSReg Null Set To False.
                                     if FCTSRegMarkAsRegistered then
                                        SaleEvent.CTSReg := True
                                     else
                                        SaleEvent.CTSReg := False;

                                     SaleEvent.Post;
                                     WinData.AddToEventLookupData(CurrTableData.FieldByName('AID').AsInteger, CSaleDeathEvent);
                                     FProgressBar.Position := CurrTableData.RecNo;

                                     if ( Def.Definition.dUseCrush ) then
                                        begin
                                           with TCrushXMLExport.Create do
                                              try
                                                 with FSaleAnimal do
                                                    begin
                                                       AnimalID := CurrTableData.FieldByName('AID').AsInteger;
                                                       Animal := GetAnimal(CurrTableData.FieldByName('AID').AsInteger);
                                                       if ( Animal <> nil ) then
                                                          NatIDNum := Animal.NatIdNum;
                                                       EventID := SaleEvent.EventID;
                                                       EventDate := CurrTableData.FieldByName('SaleDate').AsDateTime;
                                                       CustomerID := CurrTableHeader.FieldByName('CustomerID').AsInteger;
                                                       AnimalWeight := CurrTableData.FieldByName('Weight').AsFloat;
                                                       AnimalPrice := CurrTableData.FieldByName('Price').AsFloat;
                                                       TBTestDate := CurrTableData.FieldByName('TBTestDate').AsDateTime;
                                                       BruTestDate := CurrTableData.FieldByName('BruceDate').AsDateTime;
                                                       CustomerCosts := CustCosts;
                                                       Grade := CurrTableData.FieldByName('Grade').AsString;
                                                       PreSale := False;
                                                       SoldStatus := True;
                                                    end;
                                                 if ( IsValidEvent(etSale) ) then
                                                    begin
                                                       CreateorOpenXMLFile(etSale);
                                                       AddAnimalToXMLFile(etSale);
                                                    end;
                                              finally
                                                 Free
                                              end;
                                        end;
                                     Next;
                                  end;
                            finally
                                SaleEvent.Free;
                                FDatabaseUpdated := True;
                                if ( WinData.GlobalSettings.RenumAnimalNo ) then //joanne tighe 10/3/04
                                   try
                                      AnimalFileByIDSQL := WinData.AnimalFileByID.Text;
                                      WinData.AnimalFileByID.Close;
                                      WinData.AnimalFileByID.SQL.Clear;
                                      WinData.AnimalFileByID.SQL.Add('Select * from Animals Where Inherd = False');
                                      WinData.AnimalFileByID.Open;
                                      with CurrTableData do
                                         try
                                            First;
                                            while ( not(Eof) ) do
                                               begin
                                                  if ( WinData.AnimalFileByID.Locate('ID', CurrTableData.FieldByName('AID').AsInteger, []) ) then
                                                     begin
                                                        if ( Length(Trim(WinData.AnimalFileByIDAnimalNo.AsString)) > 0 ) then
                                                           begin
                                                              if ( WinData.GlobalSettings.ReNumFormat = '/yy' ) then
                                                                 begin
                                                                    if ( Length(Trim(WinData.AnimalFileByIDAnimalNo.AsString)) <= 6 ) then
                                                                       begin
                                                                          //   07/03/16 [V5.5 R4.2] /MK Bug Fix - TempAnimalNo was not being assigned Trim(WinData.AnimalFileByIDAnimalNo.AsString)
                                                                          TempAnimalNo := ( Trim(WinData.AnimalFileByIDAnimalNo.AsString) +'/' + FormatDateTime('yy', Date) );
                                                                          if ( Length(TempAnimalNo) > 0 ) then
                                                                             if ( WinData.CheckAnimalNoInUse(TempAnimalNo, WinData.AnimalFileByIDHerdID.AsInteger) = Allok ) then
                                                                                try
                                                                                   UpdateAnimalNumber.Close;
                                                                                   UpdateAnimalNumber.Params[0].AsString := TempAnimalNo;
                                                                                   UpdateAnimalNumber.Params[1].AsInteger := CurrTableData.FieldByName('AID').AsInteger;
                                                                                   UpdateAnimalNumber.ExecSQL;
                                                                                   if ( FHerdType <> htBeef ) then
                                                                                      begin
                                                                                         with TNewIDEvent.Create('tmp001') do
                                                                                            try
                                                                                               TSubEventTable := nil;
                                                                                               Append;
                                                                                               EventType := TNewID;
                                                                                               AnimalID := CurrTableData.FieldByName('AID').AsInteger;
                                                                                               AnimalLactNo := CurrTableData.FieldByName('LactNo').AsInteger;
                                                                                               EventDate := Date;
                                                                                               EventComment := 'New ID Allocation';
                                                                                               AnimalHerdID := CurrTableData.FieldByName('HerdID').AsInteger;
                                                                                               Post;
                                                                                            finally
                                                                                               Free;
                                                                                            end;
                                                                                      end;
                                                                                except
                                                                                   MessageDlg('Failed to Re-number Animal', mtInformation,[mbOK],0);
                                                                                end;
                                                                       end
                                                                    else
                                                                       MessageDlg('The Animal Number cannot be changed, new value exceeds maximum field size of 10.', mtInformation,[mbOK],0);
                                                                 end
                                                              else
                                                                 begin
                                                                    if ( Length(Trim(WinData.AnimalFileByIDAnimalNo.AsString)) <= 7 ) then
                                                                       begin
                                                                          //   07/03/16 [V5.5 R4.2] /MK Bug Fix - TempAnimalNo was not being assigned Trim(WinData.AnimalFileByIDAnimalNo.AsString)
                                                                          TempAnimalNo := ( Trim(WinData.AnimalFileByIDAnimalNo.AsString) +'(' + FormatDateTime('yy', Date) + ')');
                                                                          if ( Length(TempAnimalNo) > 0 ) then
                                                                             if ( WinData.CheckAnimalNoInUse(TempAnimalNo, WinData.AnimalFileByIDHerdID.AsInteger) = Allok ) then
                                                                                try
                                                                                   UpdateAnimalNumber.Close;
                                                                                   UpdateAnimalNumber.Params[0].AsString := TempAnimalNo;
                                                                                   UpdateAnimalNumber.Params[1].AsInteger := CurrTableData.FieldByName('AID').AsInteger;
                                                                                   UpdateAnimalNumber.ExecSQL;
                                                                                   if ( FHerdType <> htBeef ) then
                                                                                      begin
                                                                                         with TNewIDEvent.Create('tmp001') do
                                                                                            try
                                                                                               TSubEventTable := nil;
                                                                                               Append;
                                                                                               EventType := TNewID;
                                                                                               AnimalID := CurrTableData.FieldByName('AID').AsInteger;
                                                                                               AnimalHerdID := CurrTableData.FieldByName('HerdID').AsInteger;
                                                                                               AnimalLactNo := CurrTableData.FieldByName('LactNo').AsInteger;
                                                                                               EventDate := Date;
                                                                                               EventComment := 'New ID Allocation';
                                                                                               Post;
                                                                                            finally
                                                                                               Free;
                                                                                            end;
                                                                                      end;
                                                                                except
                                                                                   MessageDlg('Failed to Re-number Animal', mtInformation,[mbOK],0);
                                                                                end;
                                                                       end
                                                                    else
                                                                       MessageDlg('The Animal Number cannot be changed, new value exceeds maximum field size of 10.', mtInformation,[mbOK],0);
                                                                 end;
                                                           end;
                                                     end;
                                                  Next;
                                               end;
                                         finally
                                         end;
                                   finally
                                      WinData.AnimalFileByID.Close;
                                      WinData.AnimalFileByID.Sql.Clear;
                                      WinData.AnimalFileByID.SQL.Add(AnimalFileByIDSQL);
                                      WinData.AnimalFileByID.Open;
                                   end;

                                //   14/10/19 [V5.9 R0.9] /MK Additional Feature - When an animal is sold and Parlour user with RemoveTransponderAfterSale preference tick, remove TransponderNo from animal.
                                if ( Def.Definition.dUseParlour ) and ( WinData.GlobalSettings.RemoveTransponderAfterSale ) then
                                   begin
                                      qClearTransponderNo.Close;
                                      qClearTransponderNo.Params[0].AsInteger := CurrTableData.FieldByName('AID').AsInteger;
                                      qClearTransponderNo.ExecSQL;
                                   end;
                            end;
                         Result := True;
                         FProgressBar.Visible := False;
                      end;
         TPurchase :  begin
                         CheckInput;
                         ValidateNos;
                         if IncludeCount <= 0 then
                            begin
                               MessageDlg('There are no animals to be imported!',mtInformation,[mbOK],0);
                               Exit;
                            end;

                         try
                            try
                               if MessageDlg('Update animal database?',mtConfirmation,[mbYes, mbNo],0) = idNo then
                                  SysUtils.Abort;


                               SupplierCosts := 0;
                               BuyerCosts := 0;
                               if (Trim(Supplier.Value) <> '') and (Trim(Supplier.Value) <> '0') then
                                  try
                                     if WinData.Suppliers.Locate('ID', StrToInt(Supplier.Value), []) then
                                        SupplierCosts := WinData.SuppliersCommission.AsFloat + WinData.SuppliersTransport.AsFloat;
                                  except
                                     MessageDlg('Invalid customer selected!',mtError,[mbOK],0)
                                  end;

                               if (Trim(Buyer.Value) <> '') and (Trim(Buyer.Value) <> '0') then
                                  try
                                     if WinData.Buyers.Locate('ID', StrToInt(Buyer.Value), []) then
                                        BuyerCosts := WinData.BuyersCommission.AsFloat;
                                  except
                                     MessageDlg('Invalid Buyer selected!',mtError,[mbOK],0)
                                  end;

                               { Create Animal & Purchase Records }
                               { Loop through Data table, create Animal, Events and Save Animals to the Purch grp. }
                               WinData.GroupLinks.Open;
                               FProgressBar.Visible := True;
                               FProgressBar.Properties.Min := 0;
                               FProgressBar.Properties.Max := CurrTableData.RecordCount;
                               WinData.PurchaseGroupImport := True;

                               PurchEvent := TPurchaseEvent.Create('pdb');

                               if not bbImportAsOldFormat.Down then
                                  begin
                                     BullingEvent  := TBullingEvent.Create('bullingdb');
                                     ServiceEvent  := TServiceEvent.Create('servicedb');
                                     HealthEvent   := THealthEvent.Create('healthdb');
                                     CalvingEvent  := TCalvingEvent.Create('calvingdb');
                                     PregDiagEvent := TPregDiagEvent.Create('pregdiagdb');
                                     WeighingEvent := TWeighingEvent.Create('weighingdb');
                                  end;

                               qDefaultHealthEvents := TQuery.Create(nil);
                               qDefaultHealthEvents.DatabaseName := AliasName;
                               qDefaultHealthEvents.SQL.Clear;
                               qDefaultHealthEvents.SQL.Add('SELECT *');
                               qDefaultHealthEvents.SQL.Add('FROM DefaultHealthEvents');
                               qDefaultHealthEvents.Open;

                               with CurrTableData do
                                  begin
                                     First;
                                     While NOT(EOF) do
                                        begin
                                           Application.ProcessMessages;
                                           if CurrTableData.FieldByName('Include').AsBoolean then
                                              begin
                                                 EID    := 0; { reset EID }
                                                 AID    := 0;
                                                 DamID  := 0;
                                                 SireID := 0;
                                                 AnimalSaved := False;

                                                 if ( (UpperCase(CurrTableData.FieldByName('Sex').AsString) = 'BULL') or
                                                      (UpperCase(CurrTableData.FieldByName('Sex').AsString) = 'STEER') ) then
                                                    if ( CurrTableData.FieldByName('LactNo').AsInteger > 0 ) then
                                                        begin
                                                           CurrTableData.Edit;
                                                           CurrTableData.FieldByName('LactNo').AsInteger := 0;
                                                           CurrTableData.Post;
                                                        end;

                                                 AID := CheckAnimalExists(CurrTableData.FieldByName('NatIDNum').AsString);
                                                 if ( AID <= 0 ) then
                                                    begin
                                                       WinData.AnimalFileByID.Append;
                                                       try
                                                          WinData.AnimalFileByIDNatIDNum.AsString := CurrTableData.FieldByName('NatIDNum').AsString;
                                                          WinData.AnimalFileByIDAnimalNo.AsString := CurrTableData.FieldByName('AnimalNo').AsString;

                                                          if ( not(FManualPurchase) ) then
                                                             begin
                                                                if WinData.Breeds.Locate('Code', CurrTableData.FieldByName('BreedCode').AsString, []) then
                                                                   WinData.AnimalFileByIDPrimaryBreed.AsInteger := WinData.Breeds.FieldByName('ID').AsInteger
                                                                else
                                                                   WinData.AnimalFileByIDPrimaryBreed.AsInteger := AddNewBreed(CurrTableData.FieldByName('BreedCode').AsString);

                                                                if CurrTableData.FieldByName('DateOfBirth').AsDateTime > 0 then
                                                                   WinData.AnimalFileByIDDateOfBirth.AsDateTime := CurrTableData.FieldByName('DateOfBirth').AsDateTime
                                                                else
                                                                   WinData.AnimalFileByIDDateOfBirth.AsDateTime := StrToDate('01/01/1995');
                                                             end
                                                          else
                                                             begin
                                                                if ( CurrTableData.FieldByName('BreedCode').AsString <> '' ) then
                                                                   begin
                                                                      if ( WinData.Breeds.Locate('Code', CurrTableData.FieldByName('BreedCode').AsString, []) ) then
                                                                         WinData.AnimalFileByIDPrimaryBreed.AsInteger := WinData.Breeds.FieldByName('ID').AsInteger
                                                                      else
                                                                         begin
                                                                            if ( MessageDlg('Invalid Breed Code entered.',mtError,[mbOK],0) = mrOK ) then
                                                                               SysUtils.Abort;
                                                                         end;
                                                                   end;

                                                                if CurrTableData.FieldByName('DateOfBirth').AsDateTime > 0 then
                                                                   WinData.AnimalFileByIDDateOfBirth.AsDateTime := CurrTableData.FieldByName('DateOfBirth').AsDateTime
                                                                else
                                                                   raise ErrorMsg.CreateFmt('You must enter a date of birth for this animal.',[nil])
                                                             end;

                                                          if WinData.GenLookUp.Locate('LookupCode', CurrTableData.FieldByName('ColourCode').AsString, []) then
                                                             WinData.AnimalFileByIDColour.AsInteger := WinData.GenLookUp.FieldByName('ID').AsInteger;
                                                          if CurrTableData.FieldByName('TBTestDate').AsDateTime > 0 then
                                                             WinData.AnimalFileByIDTBTestDate.AsDateTime := CurrTableData.FieldByName('TBTestDate').AsDateTime;
                                                          if CurrTableData.FieldByName('BruceDate').AsDateTime > 0 then
                                                             WinData.AnimalFileByIDBrucellosis.AsDateTime := CurrTableData.FieldByName('BruceDate').AsDateTime;
                                                          WinData.AnimalFileByIDSex.AsString := CurrTableData.FieldByName('Sex').AsString;
                                                          WinData.AnimalFileByIDBreeding.AsBoolean := CurrTableData.FieldByName('Breeding').AsBoolean;
                                                          WinData.AnimalFileByIDLactNo.Value := CurrTableData.FieldByName('LactNo').AsInteger;
                                                          WinData.AnimalFileByIDHerdID.AsInteger := StrToInt(lcbHerdLookup.Value);
                                                          WinData.AnimalFileByIDName.AsString := CurrTableData.FieldByName('Name').AsString;
                                                          WinData.AnimalFileByIDHerdBookNo.AsString := CurrTableData.FieldByName('HerdBookNo').AsString;
                                                          WinData.AnimalFileByIDTransponderNo.AsString := CurrTableData.FieldByName('TransponderNo').AsString;

                                                          if DamID > 0 then
                                                             WinData.AnimalFileByIDDamID.AsInteger := DamID;
                                                          if SireID > 0 then
                                                             WinData.AnimalFileByIDSireID.AsInteger := SireID;

                                                          WinData.AnimalFileByID.Post;
                                                          AID := WinData.AnimalFileByIDID.AsInteger;
                                                          AnimalSaved := True;
                                                       except
                                                          on E : Exception do
                                                             begin
                                                                WinData.AnimalFileByID.Cancel;
                                                                ShowMessage(E.Message);
                                                             end;
                                                       end;

                                                       if ( CreatePurchaseEvents.Checked) and ( AnimalSaved ) and
                                                          ( not(CurrTableData.FieldByName('IgnorePurchaseEvent').AsBoolean) ) then
                                                          begin
                                                             { Sets Event Type to Purchase }
                                                             { Setting events to Append/Insert will also Append/Insert Purchase Table }
                                                             PurchEvent.Append;
                                                             PurchEvent.EventType := TPurchase;
                                                             PurchEvent.AnimalID    := AID;
                                                             PurchEvent.AnimalLactNo := CurrTableData.FieldByName('LactNo').AsInteger;
                                                             PurchEvent.EventDate   := PurchDate.Date;
                                                             if Trim(CurrTableData.FieldByName('Comment').AsString) = '' then
                                                                PurchEvent.EventComment   := 'Purchase'
                                                             else
                                                                PurchEvent.EventComment   := CurrTableData.FieldByName('Comment').AsString;

                                                             PurchEvent.AnimalHerdID      := StrToInt(lcbHerdLookup.Value);
                                                             PurchEvent.Supplier  := CurrTableHeader.FieldByName('SupplierID').AsInteger;
                                                             PurchEvent.Buyer   := CurrTableHeader.FieldByName('BuyerID').AsInteger;
                                                             PurchEvent.Price    := CurrTableData.FieldByName('Price').AsFloat;
                                                             PurchEvent.Weight   := CurrTableData.FieldByName('Weight').AsFloat;
                                                             PurchEvent.LotNumber   := CurrTableData.FieldByName('LotNumber').AsString;
                                                             PurchEvent.EventSource := sKImport;
                                                             //  05/10/10 [V4.0 R4.9] /MK Additional Feature - If PurchEvent.CTSReg Null Set To False.
                                                             if FCTSRegMarkAsRegistered then
                                                                PurchEvent.CTSReg := True
                                                             else
                                                                PurchEvent.CTSReg := False;
                                                             PurchEvent.Post;

                                                             // update EventLookupData;
                                                             WinData.AddToEventLookupData( AID, cPurchaseEvent);

                                                             //   12/11/12 [V5.1 R0.9] /MK Additional Feature - Added function for CrushXMLExport
                                                             if ( Def.Definition.dUseCrush ) then
                                                                begin
                                                                   with TCrushXMLExport.Create do
                                                                      try
                                                                         with FPurchaseAnimal do
                                                                            begin
                                                                               AnimalID := AID;
                                                                               Animal := GetAnimal(AID);
                                                                               if ( Animal <> nil ) then
                                                                                  NatIDNum := Animal.NatIdNum;
                                                                               SupplierID := CurrTableHeader.FieldByName('SupplierID').AsInteger;
                                                                               PurBuyer := CurrTableHeader.FieldByName('BuyerID').AsInteger;
                                                                               EventDate := PurchDate.Date;
                                                                               AnimalWeight := CurrTableData.FieldByName('Weight').AsFloat;
                                                                               AnimalPrice := CurrTableData.FieldByName('Price').AsFloat;
                                                                               Grade := CurrTableData.FieldByName('Grade').AsString;
                                                                               TBTestDate := CurrTableData.FieldByName('TBTestDate').AsDateTime;
                                                                               BruTestDate := CurrTableData.FieldByName('BruceDate').AsDateTime;
                                                                            end;
                                                                         if ( IsValidEvent(etPurchase) ) then
                                                                            begin
                                                                               CreateorOpenXMLFile(etPurchase);
                                                                               AddAnimalToXMLFile(etPurchase);
                                                                            end;
                                                                      finally
                                                                         Free
                                                                      end;
                                                                end;
                                                          end;
                                                    end;

                                                 if (AnimalSaved) and (FEventTable.RecordCount > 0) then
                                                    begin
                                                       FEventTable.First;
                                                       while not FEventTable.eof do
                                                          begin
                                                             if FEventTable.FieldByName('EventType').AsInteger = CBullingEvent then
                                                                begin
                                                                   if ( FBullingTable.RecordCount > 0 ) then
                                                                      begin
                                                                         if ( not(WinData.EventDataHelper.CheckEventExists(AID,FEventTable.FieldByName('AnimalLactNo').AsInteger,
                                                                                                                           FEventTable.FieldByName('EventType').AsInteger,
                                                                                                                           FEventTable.FieldByName('EventDate').AsDateTime) ) ) then
                                                                            begin
                                                                               BullingEvent.Append;
                                                                               try
                                                                                  BullingEvent.AnimalID := AID;
                                                                                  BullingEvent.PlannedBull := AddBull(FBullingTable);
                                                                                  BullingEvent.EventDate := FEventTable.FieldByName('EventDate').AsDateTime;
                                                                                  BullingEvent.EventComment := FEventTable.FieldByName('EventDesc').AsString;
                                                                                  BullingEvent.AnimalLactNo := FEventTable.FieldByName('AnimalLactNo').AsInteger;
                                                                                  BullingEvent.AnimalHerdID := WinData.AnimalFileByIDHerdID.AsInteger;
                                                                                  BullingEvent.EventSource := sKImport;
                                                                                  BullingEvent.Post;
                                                                               except
                                                                                  BullingEvent.Cancel;
                                                                               end;
                                                                            end;
                                                                      end;
                                                                end
                                                             else if FEventTable.FieldByName('EventType').AsInteger = CServiceEvent then
                                                                begin
                                                                   if ( FServiceTable.RecordCount > 0 ) then
                                                                      begin
                                                                         if ( not(WinData.EventDataHelper.CheckEventExists(AID,FEventTable.FieldByName('AnimalLactNo').AsInteger,
                                                                                                                           FEventTable.FieldByName('EventType').AsInteger,
                                                                                                                           FEventTable.FieldByName('EventDate').AsDateTime) ) ) then
                                                                            begin
                                                                               ServiceEvent.Append;
                                                                               try
                                                                                  ServiceEvent.AnimalID := AID;
                                                                                  ServiceEvent.ServiceBull := AddBull(FServiceTable);
                                                                                  ServiceEvent.EventDate := FEventTable.FieldByName('EventDate').AsDateTime;
                                                                                  ServiceEvent.EventComment := FEventTable.FieldByName('EventDesc').AsString;
                                                                                  ServiceEvent.AnimalLactNo := FEventTable.FieldByName('AnimalLactNo').AsInteger;
                                                                                  ServiceEvent.EventSource := sKImport;
                                                                                  ServiceEvent.AnimalHerdID := WinData.AnimalFileByIDHerdID.AsInteger;
                                                                                  ServiceEvent.Post;
                                                                               except
                                                                                  ServiceEvent.Cancel;
                                                                               end;
                                                                            end;
                                                                      end;
                                                                end
                                                             else if FEventTable.FieldByName('EventType').AsInteger = CPregDiagEvent then
                                                                begin
                                                                   if ( FPregDiagTable.RecordCount > 0 ) then
                                                                      begin
                                                                         if ( not(WinData.EventDataHelper.CheckEventExists(AID,FEventTable.FieldByName('AnimalLactNo').AsInteger,
                                                                                                                           FEventTable.FieldByName('EventType').AsInteger,
                                                                                                                           FEventTable.FieldByName('EventDate').AsDateTime) ) ) then
                                                                            begin
                                                                               PregDiagEvent.Append;
                                                                               try
                                                                                  PregDiagEvent.AnimalID := AID;
                                                                                  PregDiagEvent.NoCalves := FPregDiagTable.FieldByName('NoOfCalves').AsInteger;
                                                                                  PregDiagEvent.DaysInCalf := FPregDiagTable.FieldByName('DaysInCalf').AsInteger;
                                                                                  PregDiagEvent.PregnancyStatus := FPregDiagTable.FieldByName('PregnancyStatus').AsBoolean;
                                                                                  PregDiagEvent.EventDate := FEventTable.FieldByName('EventDate').AsDateTime;
                                                                                  PregDiagEvent.EventComment := FEventTable.FieldByName('EventDesc').AsString;
                                                                                  PregDiagEvent.AnimalLactNo := FEventTable.FieldByName('AnimalLactNo').AsInteger;
                                                                                  PregDiagEvent.EventSource := sKImport;
                                                                                  PregDiagEvent.AnimalHerdID := WinData.AnimalFileByIDHerdID.AsInteger;
                                                                                  PregDiagEvent.Post;
                                                                               except
                                                                                  PregDiagEvent.Cancel;
                                                                               end;
                                                                            end;
                                                                      end;
                                                                end
                                                             else if FEventTable.FieldByName('EventType').AsInteger in [CDryOffEvent,CHealthEvent,CHerdVaccination] then
                                                                begin
                                                                   if ( FHealthTable.RecordCount > 0 ) then
                                                                      begin
                                                                         if ( not(WinData.EventDataHelper.CheckEventExists(AID,FEventTable.FieldByName('AnimalLactNo').AsInteger,
                                                                                                                           FEventTable.FieldByName('EventType').AsInteger,
                                                                                                                           FEventTable.FieldByName('EventDate').AsDateTime) ) ) then
                                                                            begin
                                                                               HealthEvent.Append;
                                                                               try
                                                                                  HealthEvent.AnimalID := AID;
                                                                                  HealthEvent.DrugUsed := FHealthTable.FieldByName('DrugUsed').AsInteger;
                                                                                  HealthEvent.RateApplic := FHealthTable.FieldByName('ApplicRate').AsInteger;
                                                                                  case FEventTable.FieldByName('EventType').AsInteger of
                                                                                     CHealthEvent : HealthEvent.EventType := THealth;
                                                                                     CDryOffEvent : HealthEvent.EventType := TDryOff;
                                                                                     CHerdVaccination : HealthEvent.EventType := THerdVaccination;
                                                                                  end;
                                                                                  HealthEvent.DryOffEvent := (FEventTable.FieldByName('EventType').AsInteger = CDryOffEvent);
                                                                                  HealthEvent.EventDate := FEventTable.FieldByName('EventDate').AsDateTime;
                                                                                  HealthEvent.EventComment := FEventTable.FieldByName('EventDesc').AsString;
                                                                                  HealthEvent.AnimalLactNo := FEventTable.FieldByName('AnimalLactNo').AsInteger;
                                                                                  HealthEvent.EventSource := sKImport;
                                                                                  HealthEvent.AnimalHerdID := WinData.AnimalFileByIDHerdID.AsInteger;
                                                                                  //   28/08/13 [V5.2 R0.2] /MK Change - Added Manual Comment Boolean.
                                                                                  HealthEvent.ManualComment := False;
                                                                                  HealthEvent.Post;
                                                                               except
                                                                                  HealthEvent.Cancel;
                                                                               end;
                                                                            end;
                                                                      end;
                                                                end
                                                             else if FEventTable.FieldByName('EventType').AsInteger = CCalvingEvent then
                                                                begin
                                                                   if ( not(WinData.EventDataHelper.CheckEventExists(AID,FEventTable.FieldByName('AnimalLactNo').AsInteger,
                                                                                                                     FEventTable.FieldByName('EventType').AsInteger,
                                                                                                                     FEventTable.FieldByName('EventDate').AsDateTime) ) ) then
                                                                      begin
                                                                         CalvingEvent.Append;
                                                                         try
                                                                            CalvingEvent.AnimalID := AID;
                                                                            CalvingEvent.EventDate := FEventTable.FieldByName('EventDate').AsDateTime;
                                                                            CalvingEvent.EventComment := FEventTable.FieldByName('EventDesc').AsString;
                                                                            CalvingEvent.AnimalLactNo := FEventTable.FieldByName('AnimalLactNo').AsInteger;
                                                                            CalvingEvent.EventSource := sKImport;
                                                                            CalvingEvent.AnimalHerdID := WinData.AnimalFileByIDHerdID.AsInteger;
                                                                            CalvingEvent.Post;
                                                                         except
                                                                            CalvingEvent.Cancel;
                                                                         end;
                                                                      end;
                                                                end
                                                             else if FEventTable.FieldByName('EventType').AsInteger = CWeightEvent then
                                                                begin
                                                                   if ( FWeighingTable.RecordCount > 0 ) then
                                                                      begin
                                                                         if ( not(WinData.EventDataHelper.CheckEventExists(AID,FEventTable.FieldByName('AnimalLactNo').AsInteger,
                                                                                                                           FEventTable.FieldByName('EventType').AsInteger,
                                                                                                                           FEventTable.FieldByName('EventDate').AsDateTime) ) ) then
                                                                            begin
                                                                               WeighingEvent.Append;
                                                                               try
                                                                                  WeighingEvent.AnimalID := AID;
                                                                                  WeighingEvent.Weight := FWeighingTable.FieldByName('Weight').AsFloat;
                                                                                  WeighingEvent.EventDate := FEventTable.FieldByName('EventDate').AsDateTime;
                                                                                  WeighingEvent.EventComment := FEventTable.FieldByName('EventDesc').AsString;
                                                                                  WeighingEvent.AnimalLactNo := FEventTable.FieldByName('AnimalLactNo').AsInteger;
                                                                                  WeighingEvent.EventSource := sKImport;
                                                                                  WeighingEvent.AnimalHerdID := WinData.AnimalFileByIDHerdID.AsInteger;
                                                                                  WeighingEvent.Post;
                                                                               except
                                                                                  WeighingEvent.Cancel;
                                                                               end;
                                                                            end;
                                                                      end;
                                                                end;
                                                             FEventTable.Next;
                                                          end;
                                                    end;

                                                 if ( FLactationTable.RecordCount > 0 ) then
                                                    begin
                                                       FLactationTable.First;
                                                       while not FLactationTable.eof do
                                                          begin
                                                             with TQuery.Create(nil) do
                                                             begin
                                                                DatabaseName := AliasName;
                                                                SQL.Clear;
                                                                SQL.Add('INSERT INTO MilkDisk ');
                                                                SQL.Add(' (AnimalID, LactNo, DailyYield, DailyBfatPerc, DailyProtPerc, DailyLactosePerc,');
                                                                SQL.Add('  CumYield, CumBfatPerc, CumProtPerc, CumLactosePerc,');
                                                                SQL.Add('  NoOfRecordings,DaysInMilk,');
                                                                SQL.Add('  Yield305, BfatPerc305, ProtPerc305, LactosePerc305, SCC) ');
                                                                SQL.Add('VALUES (:AnimalID, :LactNo, :DailyYield, :DailyBfatPerc, :DailyProtPerc, :DailyLactosePerc,');
                                                                SQL.Add('  :CumYield, :CumBfatPerc, :CumProtPerc, :CumLactosePerc,');
                                                                SQL.Add('  :NoOfRecordings, :DaysInMilk,');
                                                                SQL.Add('  :Yield305, :BfatPerc305, :ProtPerc305, :LactosePerc305, :SCC) ');
                                                                Params[0].AsInteger := AID;
                                                                Params[1].AsSmallInt := FLactationTable.FieldByName('LactNo').AsInteger;
                                                                Params[2].AsFloat := FLactationTable.FieldByName('DY').AsFloat;
                                                                Params[3].AsFloat := FLactationTable.FieldByName('DBPc').AsFloat;
                                                                Params[4].AsFloat := FLactationTable.FieldByName('DPPc').AsFloat;
                                                                Params[5].AsFloat := FLactationTable.FieldByName('DLPc').AsFloat;
                                                                Params[6].AsFloat := FLactationTable.FieldByName('CY').AsFloat;
                                                                Params[7].AsFloat := FLactationTable.FieldByName('CBPc').AsFloat;
                                                                Params[8].AsFloat := FLactationTable.FieldByName('CPPc').AsFloat;
                                                                Params[9].AsFloat := FLactationTable.FieldByName('CLPc').AsFloat;
                                                                Params[10].AsSmallInt := FLactationTable.FieldByName('Recs').AsInteger;
                                                                Params[11].AsSmallInt := FLactationTable.FieldByName('DIM').AsInteger;
                                                                Params[12].AsFloat := FLactationTable.FieldByName('Y305').AsFloat;
                                                                Params[13].AsFloat := FLactationTable.FieldByName('BPc305').AsFloat;
                                                                Params[14].AsFloat := FLactationTable.FieldByName('PPc305').AsFloat;
                                                                Params[15].AsFloat := FLactationTable.FieldByName('LPc305').AsFloat;
                                                                Params[16].AsFloat := FLactationTable.FieldByName('SCC').AsFloat;
                                                                ExecSQL;
                                                             end;

                                                             FLactationTable.Next;
                                                          end;

                                                       // 26/10/16 [V5.6 R2.7] MK Change -  
                                                       // Update MilkDiskTrans AnimalID to new AnimalID so that current lact information is changed.
                                                       // This can only be done where the user has the 2 herds in the one database.
                                                       // Will try and extend this at a later stage to export MilkDiskTrans info to XML and import it.
                                                       // This is only being done for Michael Callan who has 2 herds in the one database for now.
                                                       UpdateMilkDiskTransInfo(AID);
                                                    end;

                                                 if (AnimalSaved) and ( CurrTableData.FieldByName('PurchaseGroup').AsInteger > 0 ) then
                                                    begin
                                                       WinData.GroupLinks.Append;
                                                       WinData.GroupLinks.FieldByName('AnimalID').AsInteger := AID;
                                                       WinData.GroupLinks.FieldByName('GroupID').AsInteger :=  CurrTableData.FieldByName('PurchaseGroup').AsInteger;
                                                       WinData.GroupLinks.FieldByName('DateJoined').AsDateTime := CurrTableHeader.FieldByName('PurchDate').AsDateTime;
                                                       WinData.GroupLinks.Post;
                                                    end;

                                                 if (AnimalSaved) and ( CurrTableData.FieldByName('BatchGroup').AsInteger > 0 ) then
                                                    begin
                                                       WinData.GroupLinks.Append;
                                                       WinData.GroupLinks.FieldByName('AnimalID').AsInteger := AID;
                                                       WinData.GroupLinks.FieldByName('GroupID').AsInteger :=  CurrTableData.FieldByName('BatchGroup').AsInteger;
                                                       WinData.GroupLinks.FieldByName('DateJoined').AsDateTime := CurrTableHeader.FieldByName('PurchDate').AsDateTime;
                                                       WinData.GroupLinks.Post;
                                                    end;

                                                 if ( AnimalSaved ) and ( Length(CurrTableData.FieldByName('A1A2Result').AsString) > 0 ) then
                                                    with TQuery.Create(nil) do
                                                       try
                                                          DatabaseName := AliasName;
                                                          SQL.Clear;
                                                          SQL.Add('SELECT *');
                                                          SQL.Add('FROM DNAResults');
                                                          SQL.Add('WHERE AnimalID = :AID');
                                                          Params[0].AsInteger := AID;
                                                          try
                                                             Open;
                                                             if ( RecordCount > 0 ) then
                                                                begin
                                                                   if ( Length(FieldByName('A1A2').AsString) > 0 ) then
                                                                      begin
                                                                         Close;
                                                                         SQL.Clear;
                                                                         SQL.Add('UPDATE DNAResults');
                                                                         SQL.Add('SET A1A2 = :DNAResult');
                                                                         SQL.Add('WHERE AnimalID = :AID');
                                                                         Params[0].AsString := CurrTableData.FieldByName('A1A2Result').AsString;
                                                                         Params[1].AsInteger := AID;
                                                                         ExecSQL;
                                                                      end;
                                                                end
                                                             else
                                                                begin
                                                                   Close;
                                                                   SQL.Clear;
                                                                   SQL.Add('INSERT INTO DNAResults (AnimalID, A1A2)');
                                                                   SQL.Add('VALUES (:AID, :DNAResult)');
                                                                   Params[0].AsInteger := AID;
                                                                   Params[1].AsString := CurrTableData.FieldByName('A1A2Result').AsString;
                                                                   ExecSQL;
                                                                end;
                                                          except
                                                             on e : Exception do
                                                                ShowDebugMessage(e.Message);
                                                          end;
                                                       finally
                                                          Free;
                                                       end;

                                                 //   14/05/18 [V5.8 R0.1] /MK Additional Feature - If animal is saved and there are default treatments then saved the default treatments also.
                                                 if ( AnimalSaved ) and ( qDefaultHealthEvents.RecordCount > 0 ) then
                                                    begin
                                                       qDefaultHealthEvents.First;
                                                       while ( not(qDefaultHealthEvents.Eof) ) do
                                                          begin
                                                             if ( not(WinData.EventDataHelper.CheckEventExists(AID,CurrTableData.FieldByName('LactNo').AsInteger,
                                                                                                               FEventTable.FieldByName('EventType').AsInteger,
                                                                                                               PurchDate.Date) ) ) then
                                                                   HealthEvent.Append;
                                                                   try
                                                                      HealthEvent.AnimalID := AID;
                                                                      HealthEvent.EventDate := PurchDate.Date;
                                                                      HealthEvent.AnimalLactNo := CurrTableData.FieldByName('LactNo').AsInteger;
                                                                      HealthEvent.EventSource := sKImport;
                                                                      HealthEvent.AnimalHerdID := WinData.AnimalFileByIDHerdID.AsInteger;
                                                                      HealthEvent.ManualComment := False;
                                                                      HealthEvent.DryOffEvent := False;
                                                                      HealthEvent.DrugUsed := qDefaultHealthEvents.FieldByName('DrugID').AsInteger;

                                                                      if ( qDefaultHealthEvents.FieldByName('ApplicRatePerKgs').AsFloat > 0 ) and
                                                                         ( CurrTableData.FieldByName('Weight').AsFloat > 0 ) then
                                                                         begin
                                                                            fDefaultHealthMulitiplier := ( CurrTableData.FieldByName('Weight').AsFloat /
                                                                                                           qDefaultHealthEvents.FieldByName('ApplicRatePerKgs').AsFloat );
                                                                            HealthEvent.RateApplic := ( qDefaultHealthEvents.FieldByName('ApplicRate').AsFloat *
                                                                                                        fDefaultHealthMulitiplier );
                                                                         end
                                                                      else if ( qDefaultHealthEvents.FieldByName('ApplicRate').AsFloat > 0 ) then
                                                                         HealthEvent.RateApplic := qDefaultHealthEvents.FieldByName('ApplicRate').AsFloat;

                                                                      if ( HealthEvent.DrugUsed > 0 ) and ( HealthEvent.RateApplic > 0 ) then
                                                                         HealthEvent.EventComment := GetHealthCommentByName_Unit_ApplicRate(HealthEvent.DrugUsed,
                                                                                                                                            HealthEvent.RateApplic,
                                                                                                                                            THealth)
                                                                      else
                                                                         HealthEvent.EventComment := 'Health';

                                                                      HealthEvent.Post;
                                                                   except
                                                                      HealthEvent.Cancel;
                                                                   end;

                                                             qDefaultHealthEvents.Next;
                                                          end;
                                                    end;

                                                 if ( AID > 0 ) then
                                                    begin
                                                       CurrTableData.Edit;
                                                       CurrTableData.FieldByName('AID').AsInteger := AID;
                                                       CurrTableData.Post;
                                                    end;
                                              end;
                                              FProgressBar.Position := Progress;
                                              Inc(Progress);
                                              CurrTableData.Next;
                                        end;
                                        FProgressBar.Visible := False;
                                        Result := True;
                                  end;
                               FDatabaseUpdated := True;
                               WinData.AnimalFileByID.ApplyUpdates;
                               UpdateAncestry;
                               MessageDlg('Purchase of Animals complete!',mtInformation,[mbOK],0);
                            except
                               on e : exception do
                                  begin
                                      WinData.AnimalFileByID.CancelUpdates;
                                      raise Exception.Create(e.message);
                                  end;
                            end;
                         finally
                            FreeAndNil(PurchEvent);
                            FreeAndNil(BullingEvent);
                            FreeAndNil(ServiceEvent);
                            FreeAndNil(HealthEvent);
                            FreeAndNil(CalvingEvent);
                            FreeAndNil(PregDiagEvent);
                            FreeAndNil(WeighingEvent);

                            if ( qDefaultHealthEvents <> nil ) then
                               begin
                                  qDefaultHealthEvents.Close;
                                  FreeAndNil(qDefaultHealthEvents);
                               end;

                            WinData.PurchaseGroupImport := False;
                         end;
                      end;
      end;
   finally
      WinData.MassSalesUpdate := False;
      WinData.AnimalFileByID.EnableControls;
   end;
end;

function TfKImport.CheckSlaughter(AID: Integer; DateOfBirth,
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
   if DateOfBirth <= 0 then
      Exit;

   EligibleDate := IncMonth(DateOfBirth, 8);

   if SaleDate < EligibleDate then
      Exit;

   if WinData.CheckEvents.Locate('AnimalID;EventType',
                            VarArrayOf([AID,cPurchaseEvent]),[]) then
      EligibleDate := IncMonth(WinData.CheckEvents.FieldByName('EventDate').AsDateTime, 2)
   else
      EligibleDate := IncMonth(DateOfBirth, 2);

   if SaleDate <> 0 then
      begin
         if (SaleDate)>=(EligibleDate) then
            RESULT := True;
      end;
end;

procedure TfKImport.CustomerSlaughter(CustID: Integer);
begin
   if WinData.Customers.Locate('ID', CustID, []) then
      begin
         CustEligForSlght := WinData.CustomersSlaughter.AsBoolean;
         CustCosts        := WinData.CustomersTransport.AsFloat+WinData.CustomersDeductions.AsFloat;
      end;
end;

procedure TfKImport.SaleDateChange(Sender: TObject);
begin
   if (Sender As TDBDateEdit).Date > Date then
      begin
         MessageDlg(''+(Sender as TDBDateEdit).Hint+' cannot be after today, re-setting to today''s date',mtError,[mbOK],0);
         (Sender as TDBDateEdit).Date := Date;
         //   07/02/14 [V5.2 R8.1] /MK Bug Fix - Removed the lines below to stop error on SetFocus and
         //                                      to move forward after SaleDateChange to set group boxes to enabled.
         //(Sender as TDBDateEdit).SetFocus;
         //SysUtils.Abort;
      end
end;

(*
function TfKImport.CheckValidNatIDs : Boolean;
var
   nIndex : TBookMark;
begin
   with CurrTableData do
      begin
         First;
         while not(eof) do
            begin
               { Now records are on screen, Loop through table,and validate NatID Num's }
               if NOT(WinData.WhatStyleNatID(CurrTableData.FieldByName('NatIDNum').AsString, False ) IN ([Style1999,Style1996,StylePre1996])) then
                  begin
                     nIndex := AnimalGrid.DataSource.DataSet.GetBookmark;
                     AnimalGrid.DataSource.DataSet.GotoBookmark(nIndex);
                     AnimalGrid.DataSource.DataSet.FreeBookmark(nIndex);
                     Result := False;
                     Exit;
                  end;
               Next;
            end;
        Result := True;
     end;
end;
*)

procedure TfKImport.AnimalGridDblClick(Sender: TObject);
begin
   if CurrTableData.RecordCount > 0 then
      begin
         CurrTableData.Edit;
         try
            Application.CreateForm(TfEditInfo, fEditInfo);
            case DoWhat of
               TSaleDeath : fEditInfo.ShowTheForm(CurrTableData.FieldByName('NatIDNum').AsString, TSaleDeath);
               TPurchase :  fEditInfo.ShowTheForm(CurrTableData.FieldByName('NatIDNum').AsString, TPurchase);
            end;
         finally
            fEditInfo.Free;
         end;
      end;
end;

procedure TfKImport.CurrTableHeaderNewRecord(DataSet: TDataSet);
begin
   if (DataSet.FieldDefs.IndexOf('SaleDate') > 0) then
      begin
         DataSet.FieldByName('SaleDate').AsDateTime := Date;
         DataSet.FieldByName('Comment').AsString := 'Sale';
      end
   else
      begin
         DataSet.FieldByName('PurchDate').AsDateTime := Date;
         DataSet.FieldByName('Comment').AsString := 'Purchase';
      end;

   DataSet.FieldByName('Weight').AsFloat := 0;
   DataSet.FieldByName('Price').AsCurrency := 0;
end;

procedure TfKImport.PurchGrpDropDown(Sender: TObject);
begin
   qPurchGrp.Close;
   qPurchGrp.Open;
end;

procedure TfKImport.SupplierCloseUp(Sender: TObject);
var
   ID : Integer;
begin
   if ( Supplier.Value = '0' ) then
      begin
         uSuppliers.ShowTheForm(True, ID);
         WinData.QuerySuppliers.Close;
         WinData.QuerySuppliers.Open;
         Supplier.KeyValue := ID;
      end;
end;

procedure TfKImport.BuyerCloseUp(Sender: TObject);
var
   ID : Integer;
begin
   if (Buyer.Value = '0') then
      begin
         uBuyers.ShowTheForm(TRUE, ID);
         WinData.QueryBuyers.Close;
         WinData.QueryBuyers.Open;
         Buyer.KeyValue := ID;
      end;
end;

procedure TfKImport.StripLeadingAndTrailingAlphas(var st: string);
var
   i : SmallInt;
begin
  if Length(St)>0 then
    begin
      i := 1;
      i := Length(St);
      while ((i>0) And (St[i] = ' ')) do
         begin
            Delete ( St, i, 1 );
            Dec ( i );
         end;
    end;
end;

procedure TfKImport.SalesGrpDropDown(Sender: TObject);
begin
   qSalesGrp.Close;
   qSalesGrp.Open;
end;

procedure TfKImport.FormShow(Sender: TObject);
begin
   btnUpdateTables.Enabled := False;
end;

procedure TfKImport.SalesGrpChange(Sender: TObject);
begin
   if (SalesGrp.Value <> '0') and (SalesGrp.Value <> '') then
      LoadExportData(eaGroup);  { if group is selected load animals from group }
end;

function TfKImport.CheckExistingNum : String;
begin
   if MessageDlg(Format('Animal Number %s already exists. Do you want to re-number animal?',[CurrTableData.FieldByName('AnimalNo').AsString]),mtConfirmation,[mbYes, mbNo],0) = idYes then
      InputQuery('Enter new animal number', 'New Number', NewNo)
   else
      Result := '';

   if NewNo <> '' then
      begin
         repeat
            qExistingNo.Close;
            qExistingNo.ParamByName('AnimalNum').AsString := UPPERCASE(NewNo);
            qExistingNo.ParamByName('HerdID').AsInteger := StrToInt(lcbHerdLookup.Value);
            qExistingNo.Open;

            if qExistingNo.RecordCount > 0 then
               begin
                  if MessageDlg(Format('Animal Number %s already exists. Do you want to re-number animal?',[CurrTableData.FieldByName('AnimalNo').AsString]),mtConfirmation,[mbYes, mbNo],0) = idYes then
                     InputQuery('Enter new animal number', 'New Number', NewNo)
                  else
                     Result := '';
               end
            else
               Result := NewNo;
         until
            qExistingNo.RecordCount <= 0;
         Result := UPPERCASE(NewNo);
      end;
end;

procedure TfKImport.ModifyAnimalNumber1Click(Sender: TObject);
begin
   if (Sender as TMenuItem).Checked then
      (Sender as TMenuItem).Checked := False
   else
      (Sender as TMenuItem).Checked := True;
end;

procedure TfKImport.FormCreate(Sender: TObject);
var
   APanel: TdxStatusBarPanel;
   APanelStyle: TdxStatusBarContainerPanelStyle;
begin
   //WinData.LoadBtnImage(sbExit.Glyph, cBtnImgExit);
   //WinData.LoadBtnImage(sbHelp.Glyph, cBtnImgHelp);
   WinData.ShowDOBMessage := False;
   FDatabaseUpdated := False;

   WinData.QueryCustomers.Close;
   WinData.QueryCustomers.Open;

   WinData.QuerySuppliers.Close;
   WinData.QuerySuppliers.Open;

   WinData.QueryBuyers.Close;
   WinData.QueryBuyers.Open;

   APanel := StatusBar.Panels[2];
   APanel.PanelStyleClass := TdxStatusBarContainerPanelStyle;
   APanelStyle := TdxStatusBarContainerPanelStyle(APanel.PanelStyle);
   APanelStyle.AlignControl := True;

   FProgressBar := TcxProgressBar.Create(nil);
   FProgressBar.Properties.Max := 100;
   FProgressBar.Parent := APanelStyle.Container;
   FProgressBar.Style.LookAndFeel.NativeStyle := True;
   FProgressBar.Visible := False;

   CoInitialize(nil);
   FDOMDocument := nil;

   // If registry key for MaxAnimalsInXMLExportFile does not exist then create one and default it to 100.
   if ( not(Preferences.PreferenceExists(cMaxAnimalsInXMLExportFile)) ) then
      Preferences.ValueAsInteger[cMaxAnimalsInXMLExportFile] := 100;

   // Read MaxAnimalsInXMLExportFile registry key as FMaxAnimalsInXMLExport.
   FMaxAnimalsInXMLExport := Preferences.ValueAsInteger[cMaxAnimalsInXMLExportFile];

   FMedicineTable := TTable.Create(nil);
   FMedicineTable.DatabaseName := AliasName;
   FMedicineTable.TableName := 'Medicine';
   FMedicineTable.Open;
end;

procedure TfKImport.IncludePremiumStatusClick(Sender: TObject);
begin
   (Sender as TMenuItem).Checked := not(Sender as TMenuItem).Checked;
end;

function TfKImport.CheckPremiumStatus(AnimalID : Integer; Sex : String): TPremiumStatus;
begin
   FillChar(Result, SizeOf(Result), False);
   if Sex = 'Bull' then
      begin
         if WinData.BeefSubsidy.Locate('AnimalID;PremiumType',VarArrayOf([AnimalID,'B']),[] ) then
            if WinData.BeefSubsidy.FieldByName('ApplicationID').AsInteger = -1 then
               Result[0] := True; // Animal is Eligible
      end
   else
      begin
         if WinData.BeefSubsidy.Locate('AnimalID;PremiumType',VarArrayOf([AnimalID,'F']),[] ) then
            if WinData.BeefSubsidy.FieldByName('ApplicationID').AsInteger = -1 then
               Result[1] := True;
         if WinData.BeefSubsidy.Locate('AnimalID;PremiumType',VarArrayOf([AnimalID,'S']),[] ) then
            if WinData.BeefSubsidy.FieldByName('ApplicationID').AsInteger = -1 then
               Result[2] := True;
      end;
end;

procedure TfKImport.PrintGrid1Click(Sender: TObject);
begin
   PrintGrid.Preview;
end;

procedure TfKImport.WeightEnter(Sender: TObject);
begin
//   ((Sender as TDBEdit).Field as TFloatField).DisplayFormat := '#.##Kg';
end;

procedure TfKImport.CheckInput;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT Count(ID)');
         SQL.Add('FROM '+CurrTableData.TableName+' ');
         SQL.Add('WHERE NatIDNum Is Null');
         SQL.Add('OR DateOfBirth Is Null');
         SQL.Add('OR Sex Is Null');
         SQL.Add('OR BreedCode Is Null');
         Open;
         try
            First;
            if ( Fields[0].AsInteger > 0 ) then
               begin
                  MessageDlg('Animal(s) cannot be saved.'+cCRLF+
                             'Please check all required fields are entered.',mtError,[mbOK],0);
                  Sysutils.Abort;
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;

   if PurchDate.Date <= 0 then
      begin
         MessageDlg('Purchase Date must be entered',mtError,[mbOk],0);
         PurchDate.SetFocus;
         Sysutils.Abort;
      end
   else if ( lcbHerdLookup.Value = '0') or ( lcbHerdLookup.Value = '')  then
      begin
         MessageDlg('Destination Herd must be entered.',mtError,[mbOk],0);
         lcbHerdLookup.DropDown;
         lcbHerdLookup.SetFocus;
         Sysutils.Abort;
      end
   else if (Supplier.Value = '0') or (Supplier.Value = '') then
      begin
         MessageDLG('Supplier must be entered.',mtWarning,[mbOK],0);
         Supplier.DropDown;
         Supplier.SetFocus;
         Sysutils.Abort;
      end;
end;

procedure TfKImport.ValidateNos;
var
  TempNum : String;
  CheckNationalIDRecord : TCheckNationalIDRecord;
  i,
  AnimalNoFoundInHerdId : Integer;
  InHerdAnimalNoFound : Boolean;

  procedure UpdateExistingAnimalNo (AAnimalID : Integer);
  var
     qUpdateAnimalNo : TQuery;
  begin
     qUpdateAnimalNo := TQuery.Create(nil);
     with qUpdateAnimalNo do
        try
           DatabaseName := AliasName;
           SQL.Clear;
           SQL.Add('SELECT Count(ID)');
           SQL.Add('FROM Animals');
           SQL.Add('WHERE ID = '+IntToStr(AAnimalID)+' ');
           SQL.Add('AND InHerd = True');
           Open;
           if ( Fields[0].AsInteger = 0 ) then
              begin
                 SQL.Clear;
                 SQL.Add('UPDATE Animals SET AnimalNo = "" ');
                 SQL.Add('WHERE ID = '+IntToStr(AAnimalID)+' ');
                 ExecSQL;
              end
           else
              begin
                 TempNum := CheckExistingNum;
                 SQL.Clear;
                 SQL.Add('UPDATE Animals SET AnimalNo = :TempNo ');
                 SQL.Add('WHERE ID = '+IntToStr(AAnimalID)+' ');
                 Params[0].AsString := TempNum;
                 ExecSQL;
              end;
        finally
           Free;
        end;
  end;

begin
   with CurrTableData do
      begin
         First;
         while not (eof) do
            begin
               TempNum := '';
               if Length(CurrTableData.FieldByName('AnimalNo').AsString) > 0 then
                   begin
                      InHerdAnimalNoFound := False;
                      for i := 0 to Length(WinData.FHerdIDList) do
                         begin
                            AnimalNoFoundInHerdId := 0;
                            InHerdAnimalNoFound := ( WinData.LookUpDamSire.Locate('AnimalNo;HerdID',VarArrayOf([CurrTableData.FieldByName('AnimalNo').AsString,WinData.FHerdIDList[i]]),[]) );
                            if InHerdAnimalNoFound then
                               begin
                                  AnimalNoFoundInHerdId := WinData.FHerdIDList[i];
                                  Break;
                               end;
                         end;

                      //if WinData.LookUpDamSire.Locate('AnimalNo;HerdID',VarArrayOf([CurrTableData.FieldByName('AnimalNo').AsString, StrToInt(lcbHerdLookup.Value)]), [loCaseInsensitive]) then
                      if ( InHerdAnimalNoFound ) then
                         begin
                            CurrTableData.Edit;
                            if ( bbModifyAnimalNumber.Down ) then
                               begin
                                  TempNum := CheckExistingNum;
                                  CurrTableData.FieldByName('AnimalNo').AsString := TempNum;
                               end
                            //   15/02/12 [V5.0 R3.8] /MK Change - Old AnimalNo Will Be Renumberd To Blank.
                            else if ( bbRenumberExistingAnimal.Down ) then
                               begin
                                  //   19/11/15 [V5.5 R0.8] /MK Bug Fix - Only re number animals that are not in the existing herd i.e. have not been purchased already.
                                  //   if ( not(WinData.LookUpDamSire.Locate('AnimalNo;HerdID',VarArrayOf([CurrTableData.FieldByName('AnimalNo').AsString,StrToInt(lcbHerdLookup.Value)]),[])) ) or
                                  //   27/11/15 [V5.5 R1.4] /MK Bug Fix - Only re number animals that are InHerd = False in the database.
                                  //   27/10/16 [V5.6 R2.7] /MK Bug Fix - Renumber an animal from the HerdID that the animal was located in from WinData.FHerdIDList.
                                  if ( AnimalNoFoundInHerdId > 0 ) then
                                     begin
                                        if ( WinData.LookUpDamSire.Locate('AnimalNo;HerdID;InHerd',VarArrayOf([CurrTableData.FieldByName('AnimalNo').AsString,AnimalNoFoundInHerdId,False]),[]) ) then
                                           UpdateExistingAnimalNo(WinData.LookupDamSire.FieldByName('ID').AsInteger);
                                     end
                                  else
                                     begin
                                        if ( WinData.LookUpDamSire.Locate('AnimalNo;InHerd',VarArrayOf([CurrTableData.FieldByName('AnimalNo').AsString,False]),[]) ) then
                                           UpdateExistingAnimalNo(WinData.LookupDamSire.FieldByName('ID').AsInteger);
                                     end;
                               end
                            else
                               CurrTableData.FieldByName('AnimalNo').AsString := '';
                            CurrTableData.Post;
                         end;
                   end;

               if not WinData.GlobalSettings.AllowDuplicateTags then
                  {begin
                     // To allow multiple Animals in herd. Check if currently in Herd.
                     CheckNationalIDRecord := WinData.CheckNatIDNumInHerd(CurrTableData.FieldByName('NatIDNum').AsString);
                     if CheckNationalIDRecord.Inherd then
                        begin
                           MessageDlg(Format('Cannot save animal details.'+cCRLF+'This animal %s is currently in herd %s',
                                         [CurrTableData.FieldByName('NatIDNum').AsString,CheckNationalIDRecord.Herd]),mtInformation,[mbOK],0);
                           CurrTableData.Edit;
                           CurrTableData.FieldByName('Include').AsBoolean := False;
                           CurrTableData.Post;
                        end;
                  end}
                  begin
                     // Only search for natID as it is being enter, dont take count of spaces etc.
                     if WinData.LookUpDamSire.Locate('NatIDNum', CurrTableData.FieldByName('NatIDNum').AsString,[loCaseInsensitive]) then
                        begin
                           MessageDlg(Format('National ID number "%s" already exists.'+#13+
                                             'Animal will be ignored',[CurrTableData.FieldByName('NatIDNum').AsString]),mtWarning,[mbOK],0);

                           // Animal must already be in database, just ignore
                           CurrTableData.Edit;
                           CurrTableData.FieldByName('Include').AsBoolean := False;
                           CurrTableData.Post;
                        end;
                  end;
               Next;
            end;
      end;
end;

function TfKImport.IncludeCount: Integer;
begin
   Result := 0;
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('Select Count(Include) CInclude From TempTableData Where Include = True');
         Open;
         Result := GenQuery.FieldByName('CInclude').AsInteger;
         Close;
      end;
end;

procedure TfKImport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   WinData.ShowDOBMessage := True;
end;

function TfKImport.AddNewBreed(BreedCode: String): Integer;
var
   sBreedCode : String;
begin
   Result := 0;

   sBreedCode := Trim(BreedCode);
   if sBreedCode = '' then Exit;

   try
      BreedTable := TTable.Create(nil);
      BreedTable.DatabaseName := WinData.KingData.DatabaseName;
      BreedTable.TableName := 'Breeds';
      BreedTable.Open;

      if not BreedTable.Locate('Code', sBreedCode, []) then
         begin
            BreedTable.Append;
            BreedTable.FieldByName('Code').AsString := sBreedCode;
            BreedTable.FieldByName('Name').AsString := sBreedCode;
            BreedTable.FieldByName('EligibleforPremium').AsBoolean := True;
            BreedTable.FieldByName('GestationPeriod').AsInteger := cGestationPeriod;
            BreedTable.Post;
            Result := BreedTable.FieldByName('ID').AsInteger;
         end;

   finally
     BreedTable.Close;
     BreedTable.Free;
   end;

end;

procedure TfKImport.UpdateAncestry;

  procedure CreateAncestor(ANatID, ASex : String; ADescendantID : Integer);
  var
     AncestorId : Integer;
     AnimalRecord : TAnimalRecord;
  begin
     AnimalRecord := TAnimalRecord.Create;
     try
        AnimalRecord.Add;
        AnimalRecord.ValidateColour := False;
        AnimalRecord.ValidateBreed := False;
        AnimalRecord.ValidateDOB := False;
        AnimalRecord.ValidateIdTags := False;
        AnimalRecord.AddToNoneHerd;
        if ( UpperCase(ASex) = 'F' ) then
           AnimalRecord.Sex := 'Female'
        else
           AnimalRecord.Sex := 'Bull';
        AnimalRecord.LactNo := 0;
        AnimalRecord.Save;
        AncestorId := AnimalRecord.ID;
     finally
        FreeAndNil(AnimalRecord);
     end;

     if ( AncestorId > 0 ) and ( ADescendantID > 0 ) then
        with TQuery.Create(nil) do
           try
              DatabaseName := AliasName;
              SQL.Clear;
              SQL.Add('UPDATE Animals');
              if ( UpperCase(ASex) = 'F' ) then
                 SQL.Add('SET DamID = '+IntToStr(AncestorID)+'')
              else
                 SQL.Add('SET SireID = '+IntToStr(AncestorID)+'');
              SQL.Add('WHERE ID = '+IntToStr(ADescendantID)+'');
              try
                 ExecSQL;
              except
                 on e : Exception do
                    ShowMessage(e.Message);
              end;
           finally
              Free;
           end;
  end;

var
   Progress : Integer;
   Parent : TAnimalRecord;
   ParentID : Integer;
begin
   FProgressBar.Visible := True;
   FProgressBar.Properties.Min := 0;
   FProgressBar.Properties.Max := CurrTableData.RecordCount;
   Progress := 1;

   if ( IncludeAncestorAnimals.Checked ) and ( bbImportAsOldFormat.Down ) then
      begin
         WinData.LookUpDamSire.Close; // Refresh Table.
         WinData.LookUpDamSire.Open;
         with CurrTableData do
            begin
               First;
               while not Eof do
                  begin
                     if CurrTableData.FieldByName('Include').AsBoolean then
                        Application.ProcessMessages;
                     if (Length(FieldByName('DamIDNum').AsString) > 0) then
                        if WinData.LookUpDamSire.Locate('NatIDNum', CurrTableData.FieldByName('DamIDNum').AsString, []) then
                           begin
                              Windata.AnimalFileByID.Edit;
                              Windata.AnimalFileByIDDamID.AsInteger := WinData.LookUpDamSire.FieldByName('ID').AsInteger;
                              Windata.AnimalFileByID.Post;
                           end
                        else
                           CreateAncestor(FieldByName('DamIDNum').AsString, 'F', CurrTableData.FieldByName('AID').AsInteger);

                     if (Length(CurrTableData.FieldByName('SireIDNum').AsString) > 0) then
                        if WinData.LookUpDamSire.Locate('NatIDNum', CurrTableData.FieldByName('SireIDNum').AsString, []) then
                           begin
                              Windata.AnimalFileByID.Edit;
                              Windata.AnimalFileByIDSireID.AsInteger := WinData.LookUpDamSire.FieldByName('ID').AsInteger;
                              Windata.AnimalFileByID.Post;
                           end
                        else
                           CreateAncestor(FieldByName('SireIDNum').AsString, 'M', CurrTableData.FieldByName('AID').AsInteger);

                     FProgressBar.Position := Progress;
                     Inc(Progress);
                     Next;
                  end;
            end;
         end
      else
         begin
            with CurrTableData do
               begin
                  First;
                  while ( not(Eof) ) do
                     begin
                        Application.ProcessMessages;

                        if ( not(FieldByName('Include').AsBoolean) ) then
                           begin
                              Next;
                              Continue;
                           end;

                        if ( FAncestryTable.RecordCount > 0 ) then
                           begin
                              FAncestryTable.First;
                              while ( not(FAncestryTable.Eof) ) do
                                 begin
                                    //   07/02/12 [V5.0 R3.7] /MK Change - FindAnimal - Removed The Search For AnimalNo - Causing Problems.
                                    //   04/03/16 [V5.5 R4.2] /MK Bug Fix - Because the program wasn't checking for animal numbers it was causing duplicate AI bulls to be created. 
                                    if ( UpperCase(FAncestryTable.FieldByName('Sex').AsString) <> 'BULL' ) then
                                       ParentID := FindAnimal(FAncestryTable.FieldByName('NatIdNum').AsString,
                                                              FAncestryTable.FieldByName('HerdBookNo').AsString,
                                                              FAncestryTable.FieldByName('Name').AsString,
                                                              FAncestryTable.FieldByName('Sex').AsString)
                                    else
                                       ParentID := FindAnimal(FAncestryTable.FieldByName('NatIdNum').AsString,
                                                              FAncestryTable.FieldByName('HerdBookNo').AsString,
                                                              FAncestryTable.FieldByName('Name').AsString,
                                                              FAncestryTable.FieldByName('Sex').AsString,
                                                              FAncestryTable.FieldByName('AnimalNo').AsString);
                                    if ( ParentID <= 0 ) then
                                       begin
                                          Parent := TAnimalRecord.Create(WinData.KingData);
                                          with Parent do
                                             try
                                                try
                                                   AddToNoneHerd;
                                                   ValidateBreed := False;
                                                   ValidateColour := False;
                                                   ValidateDOB := False;
                                                   ValidateIdTags := False;
                                                   HerdBookNo := FAncestryTable.FieldByName('HerdBookNo').AsString;
                                                   AnimalNo := FAncestryTable.FieldByName('AnimalNo').AsString;
                                                   NatIDNum := FAncestryTable.FieldByName('NatIdNum').AsString;
                                                   Name := FAncestryTable.FieldByName('Name').AsString;
                                                   Sex := FAncestryTable.FieldByName('Sex').AsString;
                                                   PrimaryBreedCode := FAncestryTable.FieldByName('BreedCode').AsString;
                                                   if ( Save ) then
                                                      ParentID := ID;
                                                except
                                                   Cancel;
                                                end;
                                             finally
                                                FreeAndNil(Parent);
                                             end;
                                       end;
                                    //WinData.AnimalFileByID.Edit;
                                    UpdateSireDamID(FAncestryTable.FieldByName('Sex').AsString, CurrTableData.FieldByName('AID').AsInteger, ParentID);
                                    FAncestryTable.Next;
                                 end;
                           end;
                        Next;
                        FProgressBar.Position := Progress;
                        Inc(Progress);
                     end;
               end;
        end;

   FProgressBar.Position := 0;
   FProgressBar.Visible := False;
end;

procedure TfKImport.CreatePurchaseEventsClick(Sender: TObject);
begin
   (Sender as TMenuItem).Checked := not(Sender as TMenuItem).Checked;
end;

procedure TfKImport.IncludeAncestorAnimalsClick(Sender: TObject);
begin
   (Sender as TMenuItem).Checked := not(Sender as TMenuItem).Checked;
end;

procedure TfKImport.btnUpdateTablesClick(Sender: TObject);
begin
   WriteEvents(TPurchase);
   EmptyTables;
   AnimalGrid.DataSource:= nil;
   Close;
end;

procedure TfKImport.btnSelectPurchaseFileClick(Sender: TObject);
var
  ProcessFileState : TFileOperation;
  importOk : Boolean;
begin
   Self.Enabled := False;
   try
      //   18/07/16 [V5.5 R6.5] /MK Bug Fix - BreedCode Column Property Class was not assiged before ImportGrid is shown. Probably lost with Delphi glitch.
      with AnimalDataGridDBBandedTableView do
         begin
            with AnimalDataGridDBBandedTableViewBreedCode do
               begin
                  Width := 50;
                  PropertiesClass := TcxLookupComboBoxProperties;
                  with TcxLookupComboBoxProperties(Properties) do
                     begin
                        Alignment.Horz := taLeftJustify;
                        Alignment.Vert := taVCenter;
                        ListSource := WinData.BreedsSource;
                        ListFieldNames := 'Code;Name';
                        KeyFieldNames := 'Code';
                        DropDownWidth := 200;
                        ListOptions.ShowHeader := False;
                     end;
               end;
         end;

      if not bbImportAsOldFormat.Down then
         begin
            importOk := importFromXML;
            EnableGroupBox(gbPurchDetails,True);
            EnableGroupBox(gbDestinationHerd,True);
            EnableGroupBox(gbReview,True);
            EnableGroupBox(gbCompleteTrans,True);
            UpdateRecordCount;
            if importOk then
               MessageDlg('Movement In file successfully imported.',mtInformation,[mbOK],0);
         end
      else
         begin
            GetFile.InitialDir := MovementStoreDir;
            GetFile.DoClick;
            if FileExists(GetFile.FileName) then
               begin
                  ProcessFileState := ProcessFile(TPurchase, GetFile.FileName);
                  if ProcessFileState = FReadError then
                     begin
                        MessageDlg('Error reading from import file, contact Kingswood',mtError,[mbOK],0);
                     end
                  else if ProcessFileState = FSuccess then
                     begin
                        EnableGroupBox(gbPurchDetails,True);
                        EnableGroupBox(gbDestinationHerd,True);
                        EnableGroupBox(gbReview,True);
                        EnableGroupBox(gbCompleteTrans,True);
                        UpdateRecordCount;
                        MessageDlg('Purchase file read successfully!',mtInformation,[mbOK],0);
                     end
                  else
                     begin
                        MessageDlg('Error processing import file, contact Kingswood',mtError,[mbOK],0);
                     end;
               end;
         end;

   finally
      Self.Enabled := True;
      btnDeleteAnimal.Visible := ( CurrTableData.RecordCount > 0 );
      if ( not(btnAddAnimal.Visible) ) then
         btnDeleteAnimal.Left := btnAddAnimal.Left;
   end;

end;

procedure TfKImport.btnLoadFromCartClick(Sender: TObject);
begin
   LoadExportData(eaCart);  { if group is selected load animals from group }
end;

procedure TfKImport.UpdateGridData(AFieldName: string);
var
   MyBookMark : Integer;
begin
   if CurrTableData.RecordCount <= 0 then Exit;

   { Ensure all header date is sent to each record.
     if the user clicks on update without exiting
     any db component, posting makes sure all records
     get updated with the input info. }

   { Update Data table, with information from the Header Table }
   FProgressBar.Properties.Min := 0;
   FProgressBar.Properties.Max := CurrTableData.RecordCount;
   FProgressBar.Visible := True;

   MyBookMark := CurrTableData.RecNo;
   CurrTableData.DisableControls;
   try
      with CurrTableData do
         begin
            First;
            while NOT EOF do
               begin
                  Edit;
                  {Only write  }

                  if CurrTableData.FindField('PurchDate') <> nil then
                      begin
                         if CurrTableData.FieldByName('PurchDate').AsDateTime <= 0 then
                            CurrTableData.FieldByName('PurchDate').AsDateTime := Date;
                      end;
                  if CurrTableData.FindField('SaleDate') <> nil then
                      begin
                         if CurrTableData.FieldByName('SaleDate').AsDateTime <= 0 then
                            CurrTableData.FieldByName('SaleDate').AsDateTime := Date;
                      end;

                  CurrTableData.FieldByName(AFieldName).Clear;
                  CurrTableData.FieldByName(AFieldName).Value := CurrTableHeader.FieldByName(AFieldName).Value;
                  Post;
                  Next;
                  FProgressBar.position := CurrTableData.RecNo;
               end;
         end;

      CurrTableData.Refresh;
      try
         CurrTableData.RecNo := MyBookMark;
      except
         CurrTableData.First;
      end;

   finally
      FProgressBar.Visible := False;
      CurrTableData.EnableControls;
   end;
end;

procedure TfKImport.SaleDateExit(Sender: TObject);
begin
   UpdateGridData((Sender As TDBDateEdit).DataField);
end;

procedure TfKImport.PriceExit(Sender: TObject);
begin
   UpdateGridData((Sender As TDBEdit).DataField);
end;

procedure TfKImport.PurchPriceExit(Sender: TObject);
begin
   if ( not(FManualPurchase) ) then
      UpdateGridData((Sender As TDBEdit).DataField);
end;

procedure TfKImport.UpdateRecordCount;
var
   RecordCount : Integer;
begin
   RecordCount := 0;
   if CurrTableData.Active then
      if FManualPurchase then
         RecordCount := CurrTableData.RecordCount+1
      else
         RecordCount := CurrTableData.RecordCount;
   lTotal.Caption := Format('Total: %d',[RecordCount]);
end;

procedure TfKImport.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin

   if Button = nbDelete then
      begin
         if MessageDlg('Are you sure you want to remove this animal?',mtConfirmation,[mbYes,mbNo],0) = idYes then
            CurrTableData.Delete;
         UpdateRecordCount;
         SysUtils.Abort;
      end;

end;

procedure TfKImport.rxcCullingExit(Sender: TObject);
begin
   UpdateGridData((Sender As TRxDBLookupCombo).DataField);
end;

procedure TfKImport.EnableGroupBox(AGroupBox : TcxGroupBox; const AEnable : Boolean);
var
   i : integer;
begin
   for i := 0 to AGroupBox.ControlCount-1 do
      begin
         AGroupBox.Controls[i].Enabled := AEnable;
         //   24/05/12 [V5.0 R7.0] /MK Additional Feature - If Not MultiHerd Database Then Set HerdLookup To DefaultHerdID.
         if ( AGroupBox.Controls[i].Name = 'lcbHerdLookup' ) then
            begin
               if ( not(WinData.MultiHerd) ) then
                  lcbHerdLookup.KeyValue := WinData.DefaultHerdID;
            end;
      end;
end;

function TfKImport.GetMovementStoreBackupDir: string;
begin
   Result := IncludeTrailingBackslash( MovementStoreDir + 'Backup' );
end;

function TfKImport.GetMovementStorePathDir: string;
begin
   Result := IncludeTrailingBackslash( ApplicationPath + 'Kingswood Movements' );
end;

procedure TfKImport.AnimalDataGridDBBandedTableViewDblClick(
  Sender: TObject);
begin
   if (CurrTableData.RecordCount > 0) then
      begin
         CurrTableData.Edit;
         try
            Application.CreateForm(TfEditInfo, fEditInfo);
            case DoWhat of
               TSaleDeath : fEditInfo.ShowTheForm(CurrTableData.FieldByName('NatIDNum').AsString, TSaleDeath);
               TPurchase : TfmMovementsEventReview.EventReview(CurrTableData.FieldByName('NatIDNum').AsString);
            end;
         finally
            fEditInfo.Free;
         end;
      end;
end;

procedure TfKImport.actHelpExecute(Sender: TObject);
begin
   if DoWhat = TPurchase then
      WinData.HTMLHelp('fileimport.htm')
   else
      WinData.HTMLHelp('fileexport.htm');
end;

procedure TfKImport.actExitExecute(Sender: TObject);
var
   i : Integer;
begin
   if ( CurrTableData.State in dsEditModes ) then
      begin
         CurrTableData.Post;
      end;
   if (CurrTableData.RecordCount > 0 ) then
      begin
         if ( CurrTableData.RecordCount >= 1 ) then
            begin
               CurrTableData.First;
               if ( CurrTableData.FieldByName('AnimalNo').AsString <> '' ) or
                  ( CurrTableData.FieldByName('NatIDNum').AsString <> '' ) or
                  ( CurrTableData.FieldByName('DateOfBirth').AsDateTime > 0 ) or
                  ( CurrTableData.FieldByName('Sex').AsString <> '' ) or
                  ( CurrTableData.FieldByName('BreedCode').AsString <> '' ) then
                  begin
                     if ( DoWhat = TPurchase ) then
                        begin
                           if ( MessageDlg('Animal purchase has not been saved'+cCRLF+
                                           'Are you sure you want to exit',mtWarning,[mbYes,mbNo],0) = mrYes ) then
                              Close;
                        end
                     else if ( DoWhat = TSaleDeath ) then
                        begin
                           if ( MessageDlg('Animal sales has not been saved'+cCRLF+
                                           'Are you sure you want to exit',mtWarning,[mbYes,mbNo],0) = mrYes ) then
                              Close;
                        end;
                  end
               else
                  Close;
            end
         else
            Close;
      end
   else
      Close;
end;

procedure TfKImport.actAccountsExecute(Sender: TObject);
begin
   if DoWhat = TPurchase then
      begin
         if Definition.dUseKingsAccs then
            WinData.CallProg.Accounts(' P ' + RegistrySerialNum, WinData.UserDefaultHerdID)
         else
            WinData.CallProg.Accounts(' P ', WinData.UserDefaultHerdID)
      end
   else
      if Definition.dUseKingsAccs then
         WinData.CallProg.Accounts(' S ' + RegistrySerialNum, WinData.UserDefaultHerdID)
      else
         WinData.CallProg.Accounts(' S ', WinData.UserDefaultHerdID);

end;

procedure TfKImport.FormDestroy(Sender: TObject);
begin
   FreeAndNil(FProgressBar);

   if Assigned(FEventDataSource) then
      begin
         FEventDataSource.DataSet := nil;
         FreeAndNil(FEventDataSource);
      end;

   if Assigned(FAncestryTable) then
      begin
         FAncestryTable.Close;
         FAncestryTable.DeleteTable;
         FreeAndNil(FAncestryTable);
      end;

   if Assigned(FEventTable) then
      begin
         FEventTable.Close;
         FEventTable.DeleteTable;
         FreeAndNil(FEventTable);
      end;

   if Assigned(FLactationTable) then
      begin
         FLactationTable.Close;
         FLactationTable.DeleteTable;
         FreeAndNil(FLactationTable);
      end;

   if Assigned(FPregDiagTable) then
      begin
         FPregDiagTable.Close;
         FPregDiagTable.DeleteTable;
         FreeAndNil(FPregDiagTable);
      end;

   if Assigned(FHealthTable) then
      begin
         FHealthTable.Close;
         FHealthTable.DeleteTable;
         FreeAndNil(FHealthTable);
      end;

   if Assigned(FBullingTable) then
      begin
         FBullingTable.Close;
         FBullingTable.DeleteTable;
         FreeAndNil(FBullingTable);
      end;

   if Assigned(FServiceTable) then
      begin
         FServiceTable.Close;
         FServiceTable.DeleteTable;
         FreeAndNil(FServiceTable);
      end;

   if ( FMedicineTable <> nil ) then
      FreeAndNil(FMedicineTable);

   if ( Assigned(FWeighingTable) ) then
      begin
         FWeighingTable.Close;
         FWeighingTable.DeleteTable;
         FreeAndNil(FWeighingTable);
      end;

   if ( HerdLookup.qExistingVPADrugs.Active ) then
      HerdLookup.qExistingVPADrugs.Close;
end;

function TfKImport.exportToXML : Boolean;
var
   D,
   M,
   Y : Word;
   ItemCount : Integer;
   S : String;
   HiddenFileWrite : Boolean;

   XMLDOMNodeList : IXMLDOMNodeList;
   XMLDOMNode, MovementXMLDOMNode, AnimalsNode : IXMLDOMNode;
   AnimalXMLDOMNode : IXMLDOMElement;

   EventDetailXMLDOMNode : IXMLDOMNode;
   EventsNode, EventNode : IXMLDOMElement;

   LactDetailNode : IXMLDOMNode;
   LactHistoryNode, LactNode : IXMLDOMElement;

   AnimalDetailXMLDOMNode : IXMLDOMElement;

   ProcInstr : IXMLDOMProcessingInstruction; // XML declaration

   FEventQuery : TQuery;
   FSubEventQuery : TQuery;

   FLactQuery : TQuery;
   CheckLactHistory : Boolean;

   DamNode : IXMLDOMElement;
   SireNode : IXMLDOMElement;
   BullNode : IXMLDOMElement;

   tmpNode : IXMLDOMNode;

   // New integers introduced to store Animal Count and File Count.
   iAnimalCount, iFileCount : Integer;

   // New boolean created to store when a nex XML file is generated.
   NewFileCreated : Boolean;

begin
   Result := false;

   CurrTableData.DisableControls;
   DecodeDate(Date, Y, M, D);

   if not DirectoryExists(MovementStoreDir) then
      CreateDir(MovementStoreDir);
   if not DirectoryExists(MovementStoreBackupDir) then
      CreateDir(MovementStoreBackupDir);

   FEventQuery := TQuery.Create(nil);
   FEventQuery.DatabaseName := AliasName;
   FEventQuery.SQL.Add('SELECT ID, AnimalLactNo, EventDate, EventType, EventDesc');
   FEventQuery.SQL.Add('FROM Events ');
   FEventQuery.SQL.Add('WHERE ( AnimalID=:AID ) ');
   FEventQuery.SQL.Add('AND EventType IN (1,2,3,4,5,6,7,38)');
   FEventQuery.SQL.Add('ORDER BY AnimalLactNo, EventDate');

   FSubEventQuery := TQuery.Create(nil);
   FSubEventQuery.DatabaseName := AliasName;

   FLactQuery := TQuery.Create(nil);
   FLactQuery.DatabaseName := AliasName;
   FLactQuery.SQL.Text := 'Select * From MilkDisk Where AnimalID=:AID Order By LactNo';

   FDOMDocument := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
   ProcInstr := FDOMDocument.createProcessingInstruction('xml', 'version="1.0" encoding="UTF-8"'); // encoding="UTF-8"');
   FDOMDocument.appendChild(ProcInstr); // Add XML Declaration

   MovementXMLDOMNode := FDOMDocument.createElement('KingswoodMovements'); // Create Root Node
   FDOMDocument.appendChild(MovementXMLDOMNode); // Add Root Node

   AnimalsNode := FDOMDocument.createElement('Animals');
   MovementXMLDOMNode.appendChild(AnimalsNode);

   if MessageDlg('Do you want to create a Movement file for use with another herd?',mtConfirmation,[mbYes,mbNo],0) = idYes then
      begin
         HiddenFileWrite := False;
         while (GetFileName = False) do
            begin
               MessageDlg('File name must be entered before proceeding.',mtWarning,[mbOk],0);
               GetFileName;
            end;
         Update;
         Path := IncludeTrailingBackslash(MovementStoreDir)+FileName;
         if (FileExists(Path)) then
            begin
               MessageDlg(Format('File "%s" already exists, aborting...',[Path]),mtError,[mbOK],0);
               Path := '';
               Exit;
            end;
      end
   else
      begin
         // Store file just in case user makes a mistake, this
         // will allow them to access the file if needed.
         HiddenFileWrite := True;
         FileName := StripAllNomNumAlpha( Customer.Text ) + FormatDateTime(' dd mm yy hh nn',now)+'.xml';
         Path := IncludeTrailingBackslash(MovementStoreBackupDir) + FileName;
      end;

   CurrTableData.DisableControls; { Disable controls }
   try
      with CurrTableData do { Loop through table, write data file }
      begin
         First;
         // Set iAnimalCount to zero to start with.
         iAnimalCount := 0;
         // Set iFileCount to 1 to start with.
         iFileCount := 1;
         while not eof do
            begin
               if ( (Copy(Path,Length(Path)-5,2) = '#'+IntToStr(iFileCount)) and (not(NewFileCreated)) ) then
                  begin
                     // If the file number of the last created XML file is the same as the file count and no new file has been created
                     // then create a new XML file.
                     FDOMDocument := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
                     ProcInstr := FDOMDocument.createProcessingInstruction('xml', 'version="1.0" encoding="UTF-8"'); // encoding="UTF-8"');
                     FDOMDocument.appendChild(ProcInstr); // Add XML Declaration

                     MovementXMLDOMNode := FDOMDocument.createElement('KingswoodMovements'); // Create Root Node
                     FDOMDocument.appendChild(MovementXMLDOMNode); // Add Root Node

                     AnimalsNode := FDOMDocument.createElement('Animals');
                     MovementXMLDOMNode.appendChild(AnimalsNode);

                     // Set file created to True.
                     NewFileCreated := True;

                     // Increase the file count after each new XML file is created.
                     Inc(iFileCount);
                  end;

               AnimalXMLDOMNode := FDOMDocument.createElement('Animal'); // Create Animal Node
               AnimalsNode.appendChild(AnimalXMLDOMNode); // Add Animal Node

               CheckLactHistory := (( CurrTableData.FieldByName('Sex').Value = 'Female') and ( CurrTableData.FieldByName('LactNo').Value > 0 ));
               { AnimalNo 10(Char) }
               if CurrTableData.FieldByName('AnimalNo').Value <> Null then
                  begin
                     FFieldToFile := (CurrTableData.FieldByName('AnimalNo').Value);
                     AnimalDetailXMLDOMNode := FDOMDocument.createElement('AnimalNo');
                     AnimalDetailXMLDOMNode.text := FFieldToFile;
                     AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                  end;

               { NatIDNum 20(Char) }
               if CurrTableData.FieldByName('NatIDNum').Value <> Null then
                  begin
                     FFieldToFile := (CurrTableData.FieldByName('NatIDNum').Value);
                     AnimalDetailXMLDOMNode := FDOMDocument.createElement('NatIDNum');
                     AnimalDetailXMLDOMNode.text := FFieldToFile;
                     AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                  end;

               { DateOfBirth 10(Char) }
               if CurrTableData.FieldByName('DateOfBirth').Value > 0 then
                  begin
                     FFieldToFile := (DateToStr(CurrTableData.FieldByName('DateOfBirth').AsDateTime));
                     AnimalDetailXMLDOMNode := FDOMDocument.createElement('DOB');
                     AnimalDetailXMLDOMNode.text := FFieldToFile;
                     AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                  end;

               { BreedCode 3(Char) }
               if CurrTableData.FieldByName('BreedCode').Value <> Null then
                  begin
                     FFieldToFile := CurrTableData.FieldByName('BreedCode').Value;
                     AnimalDetailXMLDOMNode := FDOMDocument.createElement('BreedCode');
                     AnimalDetailXMLDOMNode.text := FFieldToFile;
                     AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                  end;

               { Sex 1(Char) }
               if CurrTableData.FieldByName('Sex').Value = 'Female' then
                  FFieldToFile := 'Female'
               else if CurrTableData.FieldByName('Sex').Value = 'Bull' then
                  FFieldToFile := 'Bull'
               else if CurrTableData.FieldByName('Sex').Value = 'Steer' then
                  FFieldToFile := 'Steer';

               AnimalDetailXMLDOMNode := FDOMDocument.createElement('Sex');
               AnimalDetailXMLDOMNode.text := FFieldToFile;
               AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

               if ( FFieldToFile = 'Female' ) then
                  begin
                     FFieldToFile := (IntToStr(CurrTableData.FieldByName('LactNo').Value));

                     AnimalDetailXMLDOMNode := FDOMDocument.createElement('LactNo');
                     AnimalDetailXMLDOMNode.text := FFieldToFile;
                     AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                  end;
               FFieldToFile := '';

               { Colour Code 3(Char) }
               if CurrTableData.FieldByName('ColourCode').Value <> Null then
                  begin
                     FFieldToFile := (CurrTableData.FieldByName('ColourCode').Value);
                     AnimalDetailXMLDOMNode := FDOMDocument.createElement('ColourCode');
                     AnimalDetailXMLDOMNode.text := FFieldToFile;
                     AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                  end;

               { Name 40(Char) }
               if CurrTableData.FieldByName('Name').Value <> Null then
                  begin
                     FFieldToFile := CurrTableData.FieldByName('Name').Value;
                     AnimalDetailXMLDOMNode := FDOMDocument.createElement('Name');
                     AnimalDetailXMLDOMNode.text := FFieldToFile;
                     AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                  end;

               { HerdBookNo 16(Char) }
               if CurrTableData.FieldByName('HerdBookNo').Value <> Null then
                  begin
                     FFieldToFile := CurrTableData.FieldByName('HerdBookNo').Value;
                     AnimalDetailXMLDOMNode := FDOMDocument.createElement('HerdBookNo');
                     AnimalDetailXMLDOMNode.text := FFieldToFile;
                     AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                  end;

               { TransponderNo 20(Char) }
               if CurrTableData.FieldByName('TransponderNo').Value <> Null then
                  begin
                     FFieldToFile := CurrTableData.FieldByName('TransponderNo').Value;
                     AnimalDetailXMLDOMNode := FDOMDocument.createElement('TransponderNo');
                     AnimalDetailXMLDOMNode.text := FFieldToFile;
                     AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                  end;

               { Breeding 1(Char) }
               if CurrTableData.FieldByName('Breeding').Value then
                  FFieldToFile := 'True'
               else
                  FFieldToFile := 'False';

               AnimalDetailXMLDOMNode := FDOMDocument.createElement('Breeding');
               AnimalDetailXMLDOMNode.text := FFieldToFile;
               AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

               FFieldToFile := '';

               { TBTest Date 10(Char) 15 - Bruce Test Date 10(Char) }
                if CurrTableData.FieldByName('TBTestDate').Value > 0 then
                   begin
                      FFieldToFile := (DateToStr(CurrTableData.FieldByName('TBTestDate').Value));
                      AnimalDetailXMLDOMNode := FDOMDocument.createElement('TBTestDate');
                      AnimalDetailXMLDOMNode.text := FFieldToFile;
                      AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                   end;

               { TBTest Date 10(Char) 15 - Bruce Test Date 10(Char) }
               if CurrTableData.FieldByName('BruceDate').Value > 0 then
                  begin
                     FFieldToFile := (DateToStr(CurrTableData.FieldByName('BruceDate').Value));
                     AnimalDetailXMLDOMNode := FDOMDocument.createElement('BruceDate');
                     AnimalDetailXMLDOMNode.text := FFieldToFile;
                     AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                  end;

               if ( CurrTableData.FieldByName('A1A2Result').Value <> Null ) then
                  begin
                     FFieldToFile := CurrTableData.FieldByName('A1A2Result').Value;
                     AnimalDetailXMLDOMNode := FDOMDocument.createElement('A1A2Result');
                     AnimalDetailXMLDOMNode.text := FFieldToFile;
                     AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                  end;

               { 16 - Dam NatID Num 20(Char) 17 - Sire NatID Num 20(Char) }
               if CurrTableData.FieldByName('DamIDNum').Value <> Null then
                  begin
                     FFieldToFile := (CurrTableData.FieldByName('DamIDNum').Value);
                     AnimalDetailXMLDOMNode := FDOMDocument.createElement('DamIDNum');
                     AnimalDetailXMLDOMNode.text := FFieldToFile;
                     AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                  end;

               if CurrTableData.FieldByName('SireIDNum').Value <> Null then
                  begin
                     FFieldToFile := (CurrTableData.FieldByName('SireIDNum').Value);
                     AnimalDetailXMLDOMNode := FDOMDocument.createElement('SireIDNum');
                     AnimalDetailXMLDOMNode.text := FFieldToFile;
                     AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                  end;

               if CurrTableData.FieldByName('Price').Value <> Null then
                  begin
                     FFieldToFile := (CurrTableData.FieldByName('Price').Value);
                     AnimalDetailXMLDOMNode := FDOMDocument.createElement('Price');
                     AnimalDetailXMLDOMNode.text := FFieldToFile;
                     AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                  end;

               if CurrTableData.FieldByName('Weight').Value <> Null then
                  begin
                     FFieldToFile := CurrTableData.FieldByName('Weight').Value;
                     AnimalDetailXMLDOMNode := FDOMDocument.createElement('Weight');
                     AnimalDetailXMLDOMNode.text := FFieldToFile;
                     AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                  end;

               if CurrTableData.FieldByName('LotNumber').Value <> Null then
                  begin
                     FFieldToFile := CurrTableData.FieldByName('LotNumber').Value;
                     AnimalDetailXMLDOMNode := FDOMDocument.createElement('LotNumber');
                     AnimalDetailXMLDOMNode.text := FFieldToFile;
                     AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
                  end;

               if ( CurrTableData.FieldByName('DamID').AsInteger > 0 ) then
                  begin
                     QueryParent(CurrTableData.FieldByName('DamID').AsInteger,AnimalXMLDOMNode);
                  end;
               if ( CurrTableData.FieldByName('SireID').AsInteger > 0 ) then
                  begin
                     QueryParent(CurrTableData.FieldByName('SireID').AsInteger,AnimalXMLDOMNode);
                  end;

               if True then
                  begin
                     EventsNode := FDOMDocument.createElement('Events');
                     AnimalXMLDOMNode.appendChild(EventsNode);

                     FEventQuery.Active := False;
                     FEventQuery.Params[0].AsInteger := CurrTableData.FieldByName('AID').AsInteger;
                     FEventQuery.Active := True;
                     try

                        if ( FEventQuery.RecordCount > 0 ) then
                           begin

                              FEventQuery.First;
                              while not FEventQuery.eof do
                                 begin
                                    EventNode := FDOMDocument.createElement('Event');
                                    EventNode.setAttribute('Type', FEventQuery.FieldByName('EventType').AsInteger);
                                    EventNode.setAttribute('LactNo', FEventQuery.FieldByName('AnimalLactNo').AsInteger);

                                    EventDetailXMLDOMNode := FDOMDocument.createElement('EventDate');
                                    EventDetailXMLDOMNode.text := DateToStr(FEventQuery.FieldByName('EventDate').AsDateTime);
                                    EventNode.appendChild(EventDetailXMLDOMNode);

                                    EventDetailXMLDOMNode := FDOMDocument.createElement('EventDesc');
                                    EventDetailXMLDOMNode.text := FEventQuery.FieldByName('EventDesc').AsString;
                                    EventNode.appendChild(EventDetailXMLDOMNode);

                                    case FEventQuery.FieldByName('EventType').AsInteger of
                                       1 : begin
                                              FSubEventQuery.SQL.Clear;
                                              FSubEventQuery.SQL.Add('SELECT A.AnimalNo, A.NatIdNum, A.DateOfBirth, A.Name, A.HerdBookNo, B.Code');
                                              FSubEventQuery.SQL.Add('FROM Animals A');
                                              FSubEventQuery.SQL.Add('LEFT JOIN Breeds B ON (B.ID=A.PrimaryBreed)');
                                              FSubEventQuery.SQL.Add('WHERE (A.ID = (SELECT PlannedBull From Bullings');
                                              FSubEventQuery.SQL.Add('               WHERE (EventID=:EID)))');
                                              FSubEventQuery.SQL.Add('AND (( A.AnimalNo IS NOT NULL ) OR ( A.NatIdNum IS NOT NULL ) OR ( A.Name IS NOT NULL ) OR ( A.HerdBookNo IS NOT NULL ) ) ');
                                              FSubEventQuery.Params[0].AsInteger := FEventQuery.FieldByName('ID').AsInteger;
                                              FSubEventQuery.Open;

                                              try
                                                 if FSubEventQuery.RecordCount > 0 then
                                                    begin
                                                       FSubEventQuery.First;

                                                       BullNode := FDOMDocument.createElement('PlannedBull');

                                                       tmpNode := FDOMDocument.createElement('AnimalNo');
                                                       tmpNode.text := FSubEventQuery.FieldByName('AnimalNo').AsString;
                                                       BullNode.appendChild(tmpNode);

                                                       tmpNode := FDOMDocument.createElement('NatIdNum');
                                                       tmpNode.text := FSubEventQuery.FieldByName('NatIdNum').AsString;
                                                       BullNode.appendChild(tmpNode);

                                                       tmpNode := FDOMDocument.createElement('DOB');
                                                       tmpNode.text := DateToStr(FSubEventQuery.FieldByName('DateOfBirth').AsDateTime);
                                                       BullNode.appendChild(tmpNode);

                                                       tmpNode := FDOMDocument.createElement('Name');
                                                       tmpNode.text := FSubEventQuery.FieldByName('Name').AsString;
                                                       BullNode.appendChild(tmpNode);

                                                       tmpNode := FDOMDocument.createElement('HerdBookNo');
                                                       tmpNode.text := FSubEventQuery.FieldByName('HerdBookNo').AsString;
                                                       BullNode.appendChild(tmpNode);

                                                       tmpNode := FDOMDocument.createElement('Breed');
                                                       tmpNode.text := FSubEventQuery.FieldByName('Code').AsString;
                                                       BullNode.appendChild(tmpNode);

                                                       EventNode.appendChild(BullNode);
                                                    end;
                                              finally
                                                 FSubEventQuery.Close;
                                              end;
                                           end;
                                       2 : begin
                                              FSubEventQuery.SQL.Clear;
                                              FSubEventQuery.SQL.Add('SELECT A.AnimalNo, A.NatIdNum, A.DateOfBirth, A.Name, B.Code');
                                              FSubEventQuery.SQL.Add('FROM Animals A');
                                              FSubEventQuery.SQL.Add('LEFT JOIN Breeds B ON (B.ID=A.PrimaryBreed)');
                                              FSubEventQuery.SQL.Add('WHERE (A.ID = (SELECT ServiceBull From Services');
                                              FSubEventQuery.SQL.Add('              WHERE (EventID=:EID)))');
                                              FSubEventQuery.SQL.Add('AND (( A.AnimalNo IS NOT NULL ) OR ( A.NatIdNum IS NOT NULL ) OR ( A.Name IS NOT NULL ) OR ( A.HerdBookNo IS NOT NULL ) ) ');
                                              FSubEventQuery.Params[0].AsInteger := FEventQuery.FieldByName('ID').AsInteger;
                                              FSubEventQuery.Open;

                                              try
                                                 if FSubEventQuery.RecordCount > 0 then
                                                    begin
                                                       FSubEventQuery.First;

                                                       BullNode := FDOMDocument.createElement('ServiceBull');

                                                       tmpNode := FDOMDocument.createElement('AnimalNo');
                                                       tmpNode.text := FSubEventQuery.FieldByName('AnimalNo').AsString;
                                                       BullNode.appendChild(tmpNode);

                                                       tmpNode := FDOMDocument.createElement('NatIdNum');
                                                       tmpNode.text := FSubEventQuery.FieldByName('NatIdNum').AsString;
                                                       BullNode.appendChild(tmpNode);

                                                       tmpNode := FDOMDocument.createElement('DOB');
                                                       tmpNode.text := DateToStr(FSubEventQuery.FieldByName('DateOfBirth').AsDateTime);
                                                       BullNode.appendChild(tmpNode);

                                                       tmpNode := FDOMDocument.createElement('Name');
                                                       tmpNode.text := FSubEventQuery.FieldByName('Name').AsString;
                                                       BullNode.appendChild(tmpNode);

                                                       tmpNode := FDOMDocument.createElement('Breed');
                                                       tmpNode.text := FSubEventQuery.FieldByName('Code').AsString;
                                                       BullNode.appendChild(tmpNode);

                                                       EventNode.appendChild(BullNode);
                                                    end;
                                              finally
                                                 FSubEventQuery.Close;
                                              end;
                                           end;
                                       3 : begin
                                              FSubEventQuery.SQL.Clear;
                                              FSubEventQuery.SQL.Add('SELECT P.PregnancyStatus, P.NoCalves, P.DaysInCalf');
                                              FSubEventQuery.SQL.Add('FROM PregnancyDiag P');
                                              FSubEventQuery.SQL.Add('WHERE (P.EventID=:EID)');
                                              FSubEventQuery.Params[0].AsInteger := FEventQuery.FieldByName('ID').AsInteger;
                                              FSubEventQuery.Open;

                                              try
                                                 if FSubEventQuery.RecordCount > 0 then
                                                    begin

                                                       FSubEventQuery.First;

                                                       EventDetailXMLDOMNode := FDOMDocument.createElement('PregnancyStatus');
                                                       if FSubEventQuery.FieldByName('PregnancyStatus').AsBoolean then
                                                          EventDetailXMLDOMNode.text := 'Pregnant'
                                                       else
                                                          EventDetailXMLDOMNode.text := 'Not Pregnant';
                                                       EventNode.appendChild(EventDetailXMLDOMNode);

                                                       EventDetailXMLDOMNode := FDOMDocument.createElement('NoCalves');
                                                       EventDetailXMLDOMNode.text := IntToStr(FSubEventQuery.FieldByName('NoCalves').AsInteger);
                                                       EventNode.appendChild(EventDetailXMLDOMNode);

                                                       EventDetailXMLDOMNode := FDOMDocument.createElement('DaysInCalf');
                                                       EventDetailXMLDOMNode.text := IntToStr(FSubEventQuery.FieldByName('DaysInCalf').AsInteger);
                                                       EventNode.appendChild(EventDetailXMLDOMNode);
                                                    end;

                                              finally
                                                 FSubEventQuery.Close;
                                              end;

                                           end;
                                       4,
                                       6,
                                      38 : begin
                                              FSubEventQuery.SQL.Clear;
                                              FSubEventQuery.SQL.Add('SELECT M.DrugCode, H.RateApplic, M.VPANo ');
                                              FSubEventQuery.SQL.Add('FROM Health H');
                                              FSubEventQuery.SQL.Add('LEFT JOIN Medicine M ON (M.ID=H.DrugUsed)');
                                              FSubEventQuery.SQL.Add('WHERE (H.EventID=:EID)');
                                              FSubEventQuery.Params[0].AsInteger := FEventQuery.FieldByName('ID').AsInteger;
                                              FSubEventQuery.Open;

                                              try
                                                 if FSubEventQuery.RecordCount > 0 then
                                                    begin
                                                       FSubEventQuery.First;

                                                       EventDetailXMLDOMNode := FDOMDocument.createElement('DrugCode');
                                                       EventDetailXMLDOMNode.text := FSubEventQuery.FieldByName('DrugCode').AsString;
                                                       EventNode.appendChild(EventDetailXMLDOMNode);

                                                       EventDetailXMLDOMNode := FDOMDocument.createElement('ApplicRate');
                                                       EventDetailXMLDOMNode.text := FloatToStr(FSubEventQuery.FieldByName('RateApplic').AsFloat);
                                                       EventNode.appendChild(EventDetailXMLDOMNode);

                                                       EventDetailXMLDOMNode := FDOMDocument.createElement('VPANo');
                                                       EventDetailXMLDOMNode.text := StripDecimalFromStr(FSubEventQuery.FieldByName('VPANo').AsString);
                                                       EventNode.appendChild(EventDetailXMLDOMNode);
                                                    end;

                                              finally
                                                 FSubEventQuery.Close;
                                              end;

                                           end;
                                       5 : begin
                                              // Calving nothing to export yet 10 /2/ 10
                                           end;
                                       7 : begin
                                              FSubEventQuery.SQL.Clear;
                                              FSubEventQuery.SQL.Add('SELECT W.Weight');
                                              FSubEventQuery.SQL.Add('FROM Weights W');
                                              FSubEventQuery.SQL.Add('WHERE W.EventID = :EID');
                                              FSubEventQuery.Params[0].AsInteger := FEventQuery.FieldByName('ID').AsInteger;
                                              FSubEventQuery.Open;
                                              try
                                                 if ( FSubEventQuery.RecordCount > 0 ) then
                                                    begin
                                                       FSubEventQuery.First;

                                                       EventDetailXMLDOMNode := FDOMDocument.createElement('Weight');
                                                       EventDetailXMLDOMNode.text := FloatToStr(FSubEventQuery.FieldByName('Weight').AsFloat);
                                                       EventNode.appendChild(EventDetailXMLDOMNode);
                                                    end;
                                              finally
                                                 FSubEventQuery.Close;
                                              end;
                                           end;
                                    end;

                                    EventsNode.appendChild(EventNode);
                                    FEventQuery.Next;
                                 end;
                           end
                     finally
                        FEventQuery.Active := False;
                     end;
                  end;

               if CheckLactHistory then
                  begin
                     LactHistoryNode := FDOMDocument.createElement('Lactations');
                     AnimalXMLDOMNode.appendChild(LactHistoryNode);

                     FLactQuery.Active := False;
                     FLactQuery.Params[0].AsInteger := CurrTableData.FieldByName('AID').AsInteger;
                     FLactQuery.Active := True;
                     try

                        if ( FLactQuery.RecordCount > 0 ) then
                           begin

                              FLactQuery.First;
                              while not FLactQuery.eof do
                                 begin
                                    LactNode := FDOMDocument.createElement('Lact');
                                    LactNode.setAttribute('No', FLactQuery.FieldByName('LactNo').AsInteger);

                                    LactDetailNode := FDOMDocument.createElement('DY');
                                    LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('DailyYield').AsFloat);
                                    LactNode.appendChild(LactDetailNode);

                                    LactDetailNode := FDOMDocument.createElement('DBPc');
                                    LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('DailyBfatPerc').AsFloat);
                                    LactNode.appendChild(LactDetailNode);

                                    LactDetailNode := FDOMDocument.createElement('DPPc');
                                    LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('DailyProtPerc').AsFloat);
                                    LactNode.appendChild(LactDetailNode);

                                    LactDetailNode := FDOMDocument.createElement('DLPc');
                                    LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('DailyLactosePerc').AsFloat);
                                    LactNode.appendChild(LactDetailNode);

                                    LactDetailNode := FDOMDocument.createElement('CY');
                                    LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('CumYield').AsFloat);
                                    LactNode.appendChild(LactDetailNode);

                                    LactDetailNode := FDOMDocument.createElement('CBPc');
                                    LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('CumBfatPerc').AsFloat);
                                    LactNode.appendChild(LactDetailNode);

                                    LactDetailNode := FDOMDocument.createElement('CPPc');
                                    LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('CumProtPerc').AsFloat);
                                    LactNode.appendChild(LactDetailNode);

                                    LactDetailNode := FDOMDocument.createElement('CLPc');
                                    LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('CumLactosePerc').AsFloat);
                                    LactNode.appendChild(LactDetailNode);

                                    LactDetailNode := FDOMDocument.createElement('Recs');
                                    LactDetailNode.text := IntToStr(FLactQuery.FieldByName('NoOfRecordings').AsInteger);
                                    LactNode.appendChild(LactDetailNode);

                                    LactDetailNode := FDOMDocument.createElement('DIM');
                                    LactDetailNode.text := IntToStr(FLactQuery.FieldByName('DaysInMilk').AsInteger);
                                    LactNode.appendChild(LactDetailNode);

                                    LactDetailNode := FDOMDocument.createElement('Y305');
                                    LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('Yield305').AsFloat);
                                    LactNode.appendChild(LactDetailNode);

                                    LactDetailNode := FDOMDocument.createElement('BPc305');
                                    LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('BfatPerc305').AsFloat);
                                    LactNode.appendChild(LactDetailNode);

                                    LactDetailNode := FDOMDocument.createElement('PPc305');
                                    LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('ProtPerc305').AsFloat);
                                    LactNode.appendChild(LactDetailNode);

                                    LactDetailNode := FDOMDocument.createElement('LPc305');
                                    LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('LactosePerc305').AsFloat);
                                    LactNode.appendChild(LactDetailNode);

                                    LactDetailNode := FDOMDocument.createElement('SCC');
                                    LactDetailNode.text := FloatToStr(FLactQuery.FieldByName('SCC').AsFloat);
                                    LactNode.appendChild(LactDetailNode);

                                    LactHistoryNode.appendChild(LactNode);

                                    FLactQuery.Next;
                                 end;
                           end
                     finally
                        FLactQuery.Active := False;
                     end;
                  end;

               Inc(iAnimalCount);
               // If the animal count is FMaxAnimalsInXMLExport and the first file then create file name with #1 at the end.
               if ( (iAnimalCount div FMaxAnimalsInXMLExport) = 1 ) and ( iFileCount = 1 ) then
                  begin
                     if ( Copy(Path,Length(Path)-3,4) ) = '.xml' then
                        Path := Copy(Path,0,Length(Path)-4)+'#1.xml';
                     FDOMDocument.Save(Path);
                     NewFileCreated := False;
                  end
               // If the animal count is the file count * FMaxAnimalsInXMLExport then this must be the next file to create.
               else if ( (iAnimalCount = ( iFileCount * FMaxAnimalsInXMLExport )) ) then
                  begin
                     if ( Copy(Path,Length(Path)-3,4) ) = '.xml' then
                        Path := Copy(Path,0,Length(Path)-6)+'#'+IntToStr(iFileCount)+'.xml';
                     FDOMDocument.Save(Path);
                     NewFileCreated := False;
                  end;

               Next;
           end;
     end;

     // If the first file has been created the save the remainder of animals that were put into the last XML file
     // then save this remainder to its own XML file.
     if ( iFileCount > 1 ) then
        begin
           if ( Copy(Path,Length(Path)-5,1) ) = '#' then
              Path := Copy(Path,0,Length(Path)-6)+'#'+IntToStr(iFileCount)+'.xml';
           FDOMDocument.Save(Path);
        end
     else
        // Else if only one file was created then save the file without a "#" at the end of the file name. 
        FDOMDocument.Save(Path);

     Result := FileExists(Path);
     if not FileExists(Path) then
        raise Exception.Create('Error creating file. Contact Kingswood Computing Ltd.');
   finally
      CurrTableData.First;
      CurrTableData.EnableControls;
   end;
end;

procedure TfKImport.QueryParent(const AParentID : Integer;
   var AParentNode : IXMLDOMElement );
var
   ParentQuery : TQuery;
   Node, NodeDetail : IXMLDOMElement;
begin
   ParentQuery := TQuery.Create(nil);
   ParentQuery.DatabaseName := AliasName;

   with ParentQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT DISTINCT A.ID, A.NatIDNum, A.AnimalNo, A.DateOfBirth,');
         SQL.Add('                A.LactNo, A.Sex, A.Name, A.HerdBookNo, A.DamID,');
         SQL.Add('                A.SireID, B.Code, G.LookupCode');
         SQL.Add('FROM Animals A');
         SQL.Add('LEFT JOIN Breeds B ON (A.PrimaryBreed=B.ID)');
         SQL.Add('LEFT JOIN GenLook G ON (A.Colour=G.ID)');
         SQL.Add('WHERE (A.ID = :ID)');
         Params[0].AsInteger := AParentID;
         Open;

         First;

         if FieldByName('Sex').AsString = 'Female' then
            Node := FDOMDocument.createElement('Dam')
         else
            Node := FDOMDocument.createElement('Sire');

         NodeDetail := FDOMDocument.createElement('NatIDNum');
         NodeDetail.Text := ParentQuery.FieldByName('NatIDNum').AsString;
         Node.AppendChild(NodeDetail);

         NodeDetail := FDOMDocument.createElement('AnimalNo');
         NodeDetail.Text := ParentQuery.FieldByName('AnimalNo').AsString;
         Node.AppendChild(NodeDetail);

         NodeDetail := FDOMDocument.createElement('Sex');
         NodeDetail.Text := ParentQuery.FieldByName('Sex').AsString;
         Node.AppendChild(NodeDetail);

         NodeDetail := FDOMDocument.createElement('DOB');
         NodeDetail.Text := DateToStr(ParentQuery.FieldByName('DateOfBirth').AsDateTime);
         Node.AppendChild(NodeDetail);

         if ( FieldByName('Sex').AsString = 'Female' ) then
            begin
               NodeDetail := FDOMDocument.createElement('LactNo');
               NodeDetail.Text := IntToStr(ParentQuery.FieldByName('LactNo').AsInteger);
               Node.AppendChild(NodeDetail);
            end;

         NodeDetail := FDOMDocument.createElement('Breed');
         NodeDetail.Text := ParentQuery.FieldByName('Code').AsString;
         Node.AppendChild(NodeDetail);

         NodeDetail := FDOMDocument.createElement('Colour');
         NodeDetail.Text := ParentQuery.FieldByName('LookupCode').AsString;
         Node.AppendChild(NodeDetail);

         {if ( FieldByName('DamID').AsInteger > 0 ) then
            begin
               QueryAncestry(ParentQuery.FieldByName('DamID').AsInteger, Node);
            end;
         if ( FieldByName('SireID').AsInteger > 0 ) then
            begin
               QueryAncestry(ParentQuery.FieldByName('SireID').AsInteger, Node);
            end;}

         AParentNode.appendChild(node);
         Close;
         FreeAndNil(ParentQuery);
      end;
end;

function TfKImport.GetFileName: Boolean;
begin
   FileName := StripAllNomNumAlpha( Customer.Text ) + ' '+ FormatDateTime('ddmmyy',Date) + '.xml';
   if InputQuery('Confirm Filename', 'Filename', FileName) then
      Result := Length(FileName) > 0
   else
      SysUtils.Abort;
end;

function TfKImport.importFromXML : Boolean;

  function CreateAnimalRecordFromXML (ANode : IXMLDOMElement) : TAnimalRec;
  var
     AncestorNode : IXMLDOMElement;
     node : IXMLDOMNode;
  begin
     Result.LactNo := 0;
     Result.AnimalNo := '';
     Result.NatIDNum := '';
     Result.BreedCode := '';
     Result.Sex := '';
     Result.DateOfBirth := 0;

     if ANode = nil then exit;

     if not ANode.hasChildNodes then exit;

     node := ANode.selectSingleNode('NatIDNum');
     if ( node <> nil ) then
        Result.NatIDNum := node.text;

     node := ANode.selectSingleNode('AnimalNo');
     if ( node <> nil ) then
        Result.AnimalNo := node.text;

     node := ANode.selectSingleNode('DOB');
     if ( node <> nil ) then
        Result.DateOfBirth := StrToDate(node.Text);

     node := ANode.selectSingleNode('Sex');
     if ( node <> nil ) then
        Result.Sex := node.text;

     if ( Result.Sex = 'Female' ) then
        begin
           node := ANode.selectSingleNode('LactNo');
           if ( node <> nil ) then
              Result.LactNo := StrToInt(node.text);
        end;

     node := ANode.selectSingleNode('Breed');
     if ( node <> nil ) then
        Result.BreedCode := node.text;

     node := ANode.selectSingleNode('Colour');
     if ( node <> nil ) then
        Result.ColourCode := node.text;
  end;

  procedure CreateAncestryTree(AAnimalRec : TAnimalRec);
  begin
     if ( Length(AAnimalRec.Sex) = 0 ) then Exit;

     FAncestryTable.Append;
     try
        FAncestryTable.FieldByName('RefID').AsInteger := CurrTableData.FieldByName('ID').AsInteger;
        FAncestryTable.FieldByName('NatIDNum').AsString := AAnimalRec.NatIDNum;
        FAncestryTable.FieldByName('AnimalNo').AsString := AAnimalRec.AnimalNo;
        FAncestryTable.FieldByName('DateOfBirth').AsDateTime := AAnimalRec.DateOfBirth;
        FAncestryTable.FieldByName('Sex').AsString := AAnimalRec.Sex;
        if FAncestryTable.FieldByName('Sex').AsString = 'Female' then
           begin
              FAncestryTable.FieldByName('LactNo').AsInteger := AAnimalRec.LactNo;
              CurrTableData.Edit;
              if FAncestryTable.FieldByName('NatIDNum').AsString <> '' then
                 CurrTableData.FieldByName('DamIDNum').AsString := FAncestryTable.FieldByName('NatIDNum').AsString
              else
                 CurrTableData.FieldByName('DamIDNum').AsString := FAncestryTable.FieldByName('AnimalNo').AsString;
              CurrTableData.Post;
           end
        else
           begin
              CurrTableData.Edit;
              if FAncestryTable.FieldByName('NatIDNum').AsString <> '' then
                 CurrTableData.FieldByName('SireIDNum').AsString := FAncestryTable.FieldByName('NatIDNum').AsString
              else
                 CurrTableData.FieldByName('SireIDNum').AsString := FAncestryTable.FieldByName('AnimalNo').AsString;
              CurrTableData.Post;
           end;

        FAncestryTable.FieldByName('BreedCode').AsString := AAnimalRec.BreedCode;
        FAncestryTable.FieldByName('Colour').AsString := AAnimalRec.ColourCode;
        FAncestryTable.Post;
     except
        FAncestryTable.Cancel;
     end;

    { while True do
        begin
           AncestorNode := ANode.nextSibling as IXMLDOMElement;
           if AncestorNode = nil then Break;

           if ( node.nodeName = 'Dam' ) or ( Node.nodeName = 'Sire' ) then
              CreateAncestryTree(AncestorNode );
        end;}
  end;

var
   nodeList : IXMLDOMNodeList;
   node : IXMLDOMElement;
   Ancestornode : IXMLDOMElement;
   sibNode : IXMLDOMNode;
   FieldValue : string;

   EventList : IXMLDOMNodeList;
   EventNode : IXMLDOMElement;
   LactationList : IXMLDOMNodeList;
   LactationNode : IXMLDOMElement;

   BullNode : IXMLDOMElement;
   tmpNode : IXMLDOMNode;
   s : string;

   ImportBreedingEvents, ImportHealthEvents,
   ImportDamSireDetails, ImportMilkLactDetails,
   ImportWeighingEvents : Boolean;

   ExistAnimal,
   ExistAnimalDam,
   ExistAnimalSire : TAnimal;

   DamAnimalRec,
   SireAnimalRec : TAnimalRec;

   DrugItem : TDrugItem;
   sVPANo : String;
begin
   Result := False;

   btnReviewData.Enabled := False;
   Screen.Cursor := crHourGlass;
   try
      OpenDialog.InitialDir := MovementStoreDir;
      OpenDialog.Execute;
      FileName := OpenDialog.FileName;
      if not Fileexists(FileName) then exit;

      CurrTableData.Close;
      CurrTableData.EmptyTable;
      CurrTableData.Open;

      if ( FEventTable.RecordCount > 0 ) then
         begin
            FEventTable.Close;
            FEventTable.EmptyTable;
            FEventTable.Open;
         end;
      if ( FAncestryTable.RecordCount > 0 ) then
         begin
            FAncestryTable.Close;
            FAncestryTable.EmptyTable;
            FAncestryTable.Open;
         end;

      if ( FLactationTable.RecordCount > 0 ) then
         begin
            FLactationTable.Close;
            FLactationTable.EmptyTable;
            FLactationTable.Open;
         end;

      if ( FBullingTable.RecordCount > 0 ) then
         begin
            FBullingTable.Close;
            FBullingTable.EmptyTable;
            FBullingTable.Open;
         end;

      if ( FServiceTable.RecordCount > 0 ) then
         begin
            FServiceTable.Close;
            FServiceTable.EmptyTable;
            FServiceTable.Open;
         end;

      if ( FPregDiagTable.RecordCount > 0 ) then
         begin
            FPregDiagTable.Close;
            FPregDiagTable.EmptyTable;
            FPregDiagTable.Open;
         end;

      if ( FHealthTable.RecordCount > 0 ) then
         begin
            FHealthTable.Close;
            FHealthTable.EmptyTable;
            FHealthTable.Open;
         end;

      if ( FWeighingTable.RecordCount > 0 ) then
         begin
            FWeighingTable.Close;
            FWeighingTable.EmptyTable;
            FWeighingTable.Open;
         end;

      if not TfmMovementsImportOptions.ShowImportOptions(FileName,ImportBreedingEvents,ImportHealthEvents,
                                                         ImportDamSireDetails,ImportMilkLactDetails,ImportWeighingEvents) then
         SysUtils.Abort;

      update;

      FDOMDocument := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
      FDOMDocument.load(FileName);

      nodeList := FDOMDocument.selectNodes('//Animal');

      if ( nodeList <> nil ) then
         begin
            while (true) do
               begin
                  node := nodeList.nextNode as IXMLDOMElement;

                  if node = nil then
                     Break;

                  CurrTableData.Append;

                  sibNode := node.selectSingleNode('AnimalNo');
                  if ( sibNode <> nil ) then
                     begin
                        FieldValue := sibNode.Text;
                        StripLeadingAndTrailingAlphas(FieldValue);
                        if ( FieldValue <> '' ) then
                           CurrTableData.FieldByName('AnimalNo').AsString := FieldValue;
                     end;

                  sibNode := node.selectSingleNode('NatIDNum');
                  if ( sibNode <> nil ) then
                     begin
                        FieldValue := sibNode.Text;
                        StripLeadingAndTrailingAlphas(FieldValue);
                        if ( FieldValue <> '' ) then
                           CurrTableData.FieldByName('NatIDNum').AsString := FieldValue;
                     end;
                  ExistAnimal := GetAnimal(CurrTableData.FieldByName('NatIDNum').AsString,False,WinData.UserDefaultHerdID);

                  sibNode := node.selectSingleNode('Sex');
                  if ( sibNode <> nil ) then
                     begin
                        FieldValue := sibNode.Text;
                        StripLeadingAndTrailingAlphas(FieldValue);
                        if ( FieldValue <> '' ) then
                           begin
                              CurrTableData.FieldByName('Sex').AsString := FieldValue;
                              if ((FieldValue <> cSex_Female) and (FieldValue <> cSex_Bull) and (FieldValue <> cSex_Steer)) then
                                 begin
                                    CurrTableData.Cancel;
                                    Continue;
                                 end;
                           end;
                     end;

                  sibNode := node.selectSingleNode('DOB');
                  if ( sibNode <> nil ) then
                     begin
                        FieldValue := sibNode.Text;
                        StripLeadingAndTrailingAlphas(FieldValue);
                        if ( FieldValue <> '' ) then
                           try
                              CurrTableData.FieldByName('DateOfBirth').AsDateTime := StrToDate(FieldValue);
                           except
                           end;
                     end;

                  sibNode := node.selectSingleNode('LactNo');
                  if ( sibNode <> nil ) then
                     begin
                        FieldValue := sibNode.Text;
                        StripLeadingAndTrailingAlphas(FieldValue);
                        if ( FieldValue <> '' ) then
                           try
                              CurrTableData.FieldByName('LactNo').AsInteger := StrToInt(FieldValue);
                           except
                           end;
                     end;

                  sibNode := node.selectSingleNode('BreedCode');
                  if ( sibNode <> nil ) then
                     begin
                        FieldValue := sibNode.Text;
                        StripLeadingAndTrailingAlphas(FieldValue);
                        if ( FieldValue <> '' ) then
                           CurrTableData.FieldByName('BreedCode').AsString := FieldValue;
                     end;

                  sibNode := node.selectSingleNode('ColourCode');
                  if ( sibNode <> nil ) then
                     begin
                        FieldValue := sibNode.Text;
                        StripLeadingAndTrailingAlphas(FieldValue);
                        if ( FieldValue <> '' ) then
                           CurrTableData.FieldByName('ColourCode').AsString := FieldValue;
                     end;

                  sibNode := node.selectSingleNode('Name');
                  if ( sibNode <> nil ) then
                     begin
                        FieldValue := sibNode.Text;
                        StripLeadingAndTrailingAlphas(FieldValue);
                        if ( FieldValue <> '' ) then
                           CurrTableData.FieldByName('Name').AsString := FieldValue;
                     end;
                  //   19/12/19 [V5.9 R1.5] /MK Additional Feature - If the file coming in does not contain the name and the animal originated from
                  //                                                 this herd then bring in the name from previous instance if it existed.
                  if ( Length(CurrTableData.FieldByName('Name').AsString) = 0 ) and ( (ExistAnimal <> nil) and (Length(ExistAnimal.Name) > 0) ) then
                     CurrTableData.FieldByName('Name').AsString := ExistAnimal.Name;

                  sibNode := node.selectSingleNode('TransponderNo');
                  if ( sibNode <> nil ) then
                     begin
                        FieldValue := sibNode.Text;
                        StripLeadingAndTrailingAlphas(FieldValue);
                        if ( FieldValue <> '' ) then
                           CurrTableData.FieldByName('TransponderNo').AsString := FieldValue;
                     end;
                  //   19/12/19 [V5.9 R1.5] /MK Additional Feature - If the file coming in does not contain the transponder and the animal originated from
                  //                                                 this herd then bring in the transponder from previous instance if it existed.
                  if ( Length(CurrTableData.FieldByName('TransponderNo').AsString) = 0 ) and ( (ExistAnimal <> nil) and (Length(ExistAnimal.TransponderNo) > 0) ) then
                     CurrTableData.FieldByName('TransponderNo').AsString := ExistAnimal.TransponderNo;

                  sibNode := node.selectSingleNode('HerdBookNo');
                  if ( sibNode <> nil ) then
                     begin
                        FieldValue := sibNode.Text;
                        StripLeadingAndTrailingAlphas(FieldValue);
                        if ( FieldValue <> '' ) then
                           CurrTableData.FieldByName('HerdBookNo').AsString := FieldValue;
                     end;
                  //   19/12/19 [V5.9 R1.5] /MK Additional Feature - If the file coming in does not contain the herdbookno and the animal originated from
                  //                                                 this herd then bring in the herdbookno from previous instance if it existed.
                  if ( Length(CurrTableData.FieldByName('HerdBookNo').AsString) = 0 ) and ( (ExistAnimal <> nil) and (Length(ExistAnimal.HerdBookNo) > 0) ) then
                     CurrTableData.FieldByName('HerdBookNo').AsString := ExistAnimal.HerdBookNo;

                  sibNode := node.selectSingleNode('Breeding');
                  if ( sibNode <> nil ) then
                     begin
                        FieldValue := sibNode.Text;
                        StripLeadingAndTrailingAlphas(FieldValue);
                        if ( FieldValue <> '' ) then
                           CurrTableData.FieldByName('Breeding').AsBoolean := (CompareText( UPPERCASE(FieldValue), 'TRUE') = 0);
                     end;

                  sibNode := node.selectSingleNode('BruceDate');
                  if ( sibNode <> nil ) then
                     begin
                        FieldValue := sibNode.Text;
                        StripLeadingAndTrailingAlphas(FieldValue);
                        if ( FieldValue <> '' ) then
                           try
                              CurrTableData.FieldByName('BruceDate').AsDateTime := StrToDate(FieldValue);
                           except
                           end;
                     end;

                  sibNode := node.selectSingleNode('TBTestDate');
                  if ( sibNode <> nil ) then
                     begin
                        FieldValue := sibNode.Text;
                        StripLeadingAndTrailingAlphas(FieldValue);
                        if ( FieldValue <> '' ) then
                           try
                              CurrTableData.FieldByName('TBTestDate').AsDateTime := StrToDate(FieldValue);
                           except
                           end;
                     end;

                  sibNode := node.selectSingleNode('Price');
                  if ( sibNode <> nil ) then
                     begin
                        FieldValue := sibNode.Text;
                        StripLeadingAndTrailingAlphas(FieldValue);
                        if ( FieldValue <> '' ) then
                           try
                              CurrTableData.FieldByName('Price').AsFloat := StrToFloat(FieldValue);
                           except
                           end;
                     end;

                  sibNode := node.selectSingleNode('Weight');
                  if ( sibNode <> nil ) then
                     begin
                        FieldValue := sibNode.Text;
                        StripLeadingAndTrailingAlphas(FieldValue);
                        if ( FieldValue <> '' ) then
                           try
                              CurrTableData.FieldByName('Weight').AsFloat := StrToFloat(FieldValue);
                           except
                           end;
                     end;

                  sibNode := node.selectSingleNode('LotNumber');
                  if ( sibNode <> nil ) then
                     begin
                        FieldValue := sibNode.Text;
                        StripLeadingAndTrailingAlphas(FieldValue);
                        if ( FieldValue <> '' ) then
                           CurrTableData.FieldByName('LotNumber').AsString := FieldValue;
                     end;

                  sibNode := node.selectSingleNode('A1A2Result');
                  if ( sibNode <> nil ) then
                     begin
                        FieldValue := sibNode.Text;
                        StripLeadingAndTrailingAlphas(FieldValue);
                        if ( FieldValue <> '' ) then
                           CurrTableData.FieldByName('A1A2Result').AsString := FieldValue;
                     end;

                  CurrTableData.FieldByName('Include').AsBoolean := True;
                  CurrTableData.FieldByName('IgnorePurchaseEvent').AsBoolean := not (CreatePurchaseEvents.Checked);
                  CurrTableData.Post;

                  if ( ImportDamSireDetails ) then
                     begin
                        Ancestornode := node.selectSingleNode('Dam') as IXMLDOMElement;
                        //   19/12/19 [V5.9 R1.5] /MK Additional Feature - If the file coming in does not contain the dam information and the animal originated from
                        //                                                 this herd then bring in the dam info from previous instance if it existed.
                        if ( Ancestornode <> nil ) then
                           CreateAncestryTree(CreateAnimalRecordFromXML(Ancestornode))
                        else
                           begin
                              if ( ExistAnimal <> nil ) then
                                 if ( ExistAnimal.DamId > 0 ) then
                                    begin
                                       ExistAnimalDam := GetAnimal(ExistAnimal.DamID);
                                       if ( ExistAnimalDam <> nil ) then
                                          begin
                                             DamAnimalRec.AnimalID := ExistAnimalDam.ID;
                                             DamAnimalRec.AnimalNo := ExistAnimalDam.AnimalNo;
                                             DamAnimalRec.NatIDNum := ExistAnimalDam.NatIdNum;
                                             DamAnimalRec.Sex := ExistAnimalDam.Sex;
                                             DamAnimalRec.BreedCode := ExistAnimalDam.BreedCode;
                                             DamAnimalRec.ColourCode := ExistAnimalDam.ColourCode;
                                             DamAnimalRec.DateOfBirth := ExistAnimalDam.DateOfBirth;
                                             CreateAncestryTree(DamAnimalRec);
                                          end;
                                    end;
                           end;

                        Ancestornode := node.selectSingleNode('Sire') as IXMLDOMElement;
                        //   19/12/19 [V5.9 R1.5] /MK Additional Feature - If the file coming in does not contain the sire information and the animal originated from
                        //                                                 this herd then bring in the sire info from previous instance if it existed.
                        if ( Ancestornode <> nil ) then
                           CreateAncestryTree(CreateAnimalRecordFromXML(Ancestornode))
                        else
                           begin
                              if ( ExistAnimal <> nil ) then
                                 if ( ExistAnimal.SireID > 0 ) then
                                    begin
                                       ExistAnimalSire := GetAnimal(ExistAnimal.SireID);
                                       if ( ExistAnimalSire <> nil ) then
                                          begin
                                             SireAnimalRec.AnimalID := ExistAnimalSire.ID;
                                             SireAnimalRec.AnimalNo := ExistAnimalSire.AnimalNo;
                                             SireAnimalRec.NatIDNum := ExistAnimalSire.NatIdNum;
                                             SireAnimalRec.Sex := ExistAnimalSire.Sex;
                                             SireAnimalRec.BreedCode := ExistAnimalSire.BreedCode;
                                             SireAnimalRec.ColourCode := ExistAnimalSire.ColourCode;
                                             SireAnimalRec.DateOfBirth := ExistAnimalSire.DateOfBirth;
                                             CreateAncestryTree(SireAnimalRec);
                                          end;
                                    end;
                           end;

                     end;

                  tmpNode := node.selectSingleNode('Events');

                  if tmpNode <> nil then
                     begin
                        EventList := tmpNode.selectNodes('Event');
                        if EventList <> nil then
                        while (true) do
                           begin
                              EventNode := EventList.nextNode as IXMLDOMElement;

                              if EventNode = nil then
                                 Break;

                              FEventTable.Append;
                              try
                                 FEventTable.FieldByName('RefID').AsInteger := CurrTableData.FieldByName('ID').AsInteger;
                                 FEventTable.FieldByName('EventType').AsInteger := StrToInt(EventNode.getAttribute('Type'));

                                 if ( FEventTable.FieldByName('EventType').AsInteger in [CHealthEvent, CHerdVaccination] ) and  ( not ImportHealthEvents ) then
                                    begin
                                       FEventTable.Cancel;
                                       Continue;
                                    end
                                 else if ( FEventTable.FieldByName('EventType').AsInteger in [1..5] ) and ( not ImportBreedingEvents ) then
                                    begin
                                       FEventTable.Cancel;
                                       Continue;
                                    end
                                 else if ( FEventTable.FieldByName('EventType').AsInteger = CWeightEvent ) and ( not ImportWeighingEvents ) then
                                    begin
                                       FEventTable.Cancel;
                                       Continue;
                                    end;

                                 FEventTable.FieldByName('AnimalLactNo').AsInteger := StrToInt(EventNode.getAttribute('LactNo'));

                                 tmpNode := EventNode.selectSingleNode('EventDate');
                                 if tmpNode <> nil then
                                    FEventTable.FieldByName('EventDate').AsDateTime := StrToDate(tmpNode.text);

                                 tmpNode := EventNode.selectSingleNode('EventDesc');
                                 if tmpNode <> nil then
                                    FEventTable.FieldByName('EventDesc').AsString := tmpNode.text;

                                 FEventTable.Post;

                                 case FEventTable.FieldByName('EventType').AsInteger of
                                    1 : begin
                                           BullNode := EventNode.selectSingleNode('PlannedBull') as IXMLDOMElement;
                                           if BullNode <> nil then
                                              begin
                                                 FBullingTable.Append;
                                                 FBullingTable.FieldByName('RefId').AsInteger := FEventTable.FieldByName('ID').AsInteger;
                                                 try
                                                    tmpNode := BullNode.selectSingleNode('AnimalNo');
                                                    if tmpNode <> nil then
                                                       FBullingTable.FieldByName('AnimalNo').AsString := tmpNode.text;

                                                    tmpNode := BullNode.selectSingleNode('NatIdNum');
                                                    if tmpNode <> nil then
                                                       FBullingTable.FieldByName('NatIdNum').AsString := tmpNode.text;

                                                    tmpNode := BullNode.selectSingleNode('DOB');
                                                    if tmpNode <> nil then
                                                       try
                                                          FBullingTable.FieldByName('DateOfBirth').AsDateTime := StrToDate(tmpNode.text);
                                                       except
                                                       end;

                                                    tmpNode := BullNode.selectSingleNode('Name');
                                                    if tmpNode <> nil then
                                                       FBullingTable.FieldByName('Name').AsString := tmpNode.text;

                                                    tmpNode := BullNode.selectSingleNode('Breed');
                                                    if tmpNode <> nil then
                                                       FBullingTable.FieldByName('BreedCode').AsString := tmpNode.text;

                                                    tmpNode := BullNode.selectSingleNode('HerdBookNo');
                                                    if tmpNode <> nil then
                                                       FBullingTable.FieldByName('HerdBookNo').AsString := tmpNode.text;
                                                    FBullingTable.Post;
                                                 except
                                                    FBullingTable.Cancel;
                                                 end;

                                              end;

                                        end;
                                    2 : begin
                                           BullNode := EventNode.selectSingleNode('ServiceBull') as IXMLDOMElement;
                                           if BullNode <> nil then
                                              begin

                                                 FServiceTable.Append;
                                                 FServiceTable.FieldByName('RefId').AsInteger := FEventTable.FieldByName('ID').AsInteger;
                                                 try
                                                    tmpNode := BullNode.selectSingleNode('AnimalNo');
                                                    if tmpNode <> nil then
                                                       FServiceTable.FieldByName('AnimalNo').AsString := tmpNode.text;

                                                    tmpNode := BullNode.selectSingleNode('NatIdNum');
                                                    if tmpNode <> nil then
                                                       FServiceTable.FieldByName('NatIdNum').AsString := tmpNode.text;

                                                    tmpNode := BullNode.selectSingleNode('DOB');
                                                    if tmpNode <> nil then
                                                       try
                                                          FServiceTable.FieldByName('DateOfBirth').AsDateTime := StrToDate(tmpNode.text);
                                                       except
                                                       end;

                                                    tmpNode := BullNode.selectSingleNode('Name');
                                                    if tmpNode <> nil then
                                                       FServiceTable.FieldByName('Name').AsString := tmpNode.text;

                                                    tmpNode := BullNode.selectSingleNode('Breed');
                                                    if tmpNode <> nil then
                                                       FServiceTable.FieldByName('BreedCode').AsString := tmpNode.text;

                                                    tmpNode := BullNode.selectSingleNode('HerdBookNo');
                                                    if tmpNode <> nil then
                                                       FServiceTable.FieldByName('HerdBookNo').AsString := tmpNode.text;
                                                    FServiceTable.Post;
                                                 except
                                                    FServiceTable.Cancel;
                                                 end;
                                              end;
                                        end;
                                    3 : begin
                                           FPregDiagTable.Append;
                                           FPregDiagTable.FieldByName('RefId').AsInteger := FEventTable.FieldByName('ID').AsInteger;
                                           try
                                              tmpNode := EventNode.selectSingleNode('PregnancyStatus');
                                              if tmpNode <> nil then
                                                 FPregDiagTable.FieldByName('PregnancyStatus').AsBoolean := (CompareText(tmpNode.text, 'Pregnant')=0);

                                              tmpNode := EventNode.selectSingleNode('NoCalves');
                                              if tmpNode <> nil then
                                                 try
                                                    FPregDiagTable.FieldByName('NoOfCalves').AsInteger := StrToInt(tmpNode.text);
                                                 except
                                                 end;

                                              tmpNode := EventNode.selectSingleNode('DaysInCalf');
                                              if tmpNode <> nil then
                                                 try
                                                    FPregDiagTable.FieldByName('DaysInCalf').AsInteger := StrToInt(tmpNode.text);
                                                 except
                                                 end;
                                              FPregDiagTable.Post;
                                           except
                                              FPregDiagTable.Cancel;
                                           end;
                                        end;
                                    4,
                                    6,
                                   38 : begin
                                           FHealthTable.Append;
                                           FHealthTable.FieldByName('RefId').AsInteger := FEventTable.FieldByName('ID').AsInteger;
                                           try
                                              tmpNode := EventNode.selectSingleNode('DrugCode');
                                              if tmpNode <> nil then
                                                 FHealthTable.FieldByName('DrugCode').AsString := tmpNode.text;

                                              tmpNode := EventNode.selectSingleNode('ApplicRate');
                                              if tmpNode <> nil then
                                                 try
                                                    FHealthTable.FieldByName('ApplicRate').AsFloat := StrToFloat(tmpNode.text);
                                                 except
                                                 end;

                                              tmpNode := EventNode.selectSingleNode('VPANo');
                                              if ( tmpNode <> nil ) and ( Length(tmpNode.Text) > 0 ) then
                                                 begin
                                                    sVPANo := StripDecimalFromStr(tmpNode.text);
                                                    FHealthTable.FieldByName('VPANo').AsString := sVPANo;
                                                    HerdLookup.qExistingVPADrugs.Close;
                                                    HerdLookup.qExistingVPADrugs.Open;
                                                    if ( HerdLookup.qExistingVPADrugs.Locate('VPANo',sVPANo,[]) ) then
                                                       FHealthTable.FieldByName('DrugUsed').AsInteger := HerdLookup.qExistingVPADrugs.FieldByName('ID').AsInteger
                                                    else
                                                       begin
                                                          DrugItem := TfmDrugFinder.FindDrugItemByVPA(sVPANo);
                                                          if ( DrugItem <> nil ) then
                                                             try
                                                                FMedicineTable.Append;
                                                                FMedicineTable.FieldByName('DrugCode').AsString := GetNewDrugCode;
                                                                FMedicineTable.FieldByName('Name').AsString := DrugItem.DrugName;
                                                                FMedicineTable.FieldByName('InUse').AsBoolean := True;
                                                                FMedicineTable.FieldByName('VPANo').AsString := sVPANo;
                                                                FMedicineTable.FieldByName('MediGroup').AsInteger := DrugItem.MedicineGroup;
                                                                FMedicineTable.FieldByName('DoseUnit').AsInteger := DrugItem.UnitUsed;
                                                                FMedicineTable.FieldByName('PurchUnit').AsInteger := DrugItem.UnitUsed;
                                                                FMedicineTable.Post;
                                                                FHealthTable.FieldByName('DrugUsed').AsInteger := FMedicineTable.FieldByName('ID').AsInteger;
                                                             except
                                                                on e : Exception do
                                                                   begin
                                                                      ApplicationLog.LogException(e);
                                                                      ApplicationLog.LogError('VetLink Import Error - Error creating drug for VPANo %s '+sVPANo);
                                                                   end;
                                                             end;
                                                       end;
                                                 end;

                                              FHealthTable.Post;
                                           except
                                              FHealthTable.Cancel;
                                           end;
                                        end;
                                   7 : begin
                                          FWeighingTable.Append;
                                          FWeighingTable.FieldByName('RefId').AsInteger := FEventTable.FieldByName('ID').AsInteger;
                                          try
                                             tmpNode := EventNode.selectSingleNode('Weight');
                                             if tmpNode <> nil then
                                                FWeighingTable.FieldByName('Weight').AsFloat := StrToFloat(tmpNode.text);
                                             FWeighingTable.Post;
                                          except
                                             FWeighingTable.Cancel;
                                          end;
                                       end;
                                 end;
                              except
                                 FEventTable.Cancel;
                              end;
                           end;
                     end;

                  if ( ImportMilkLactDetails ) then
                     begin
                        tmpNode := node.selectSingleNode('Lactations');
                        if tmpNode <> nil then
                           begin
                              LactationList := tmpNode.selectNodes('Lact');
                              if LactationList <> nil then
                              while (true) do
                                 begin
                                    LactationNode := LactationList.nextNode as IXMLDOMElement;

                                    if LactationNode = nil then
                                       Break;

                                    FLactationTable.Append;
                                    try
                                       FLactationTable.FieldByName('RefID').AsInteger := CurrTableData.FieldByName('ID').AsInteger;
                                       FLactationTable.FieldByName('LactNo').AsInteger := StrToInt(LactationNode.getAttribute('No'));

                                       tmpNode := LactationNode.selectSingleNode('DY');
                                       if tmpNode <> nil then
                                          FLactationTable.FieldByName('DY').AsFloat := StrToFloat(tmpNode.text);

                                       tmpNode := LactationNode.selectSingleNode('DBPc');
                                       if tmpNode <> nil then
                                          FLactationTable.FieldByName('DBPc').AsFloat := StrToFloat(tmpNode.text);

                                       tmpNode := LactationNode.selectSingleNode('DPPc');
                                       if tmpNode <> nil then
                                          FLactationTable.FieldByName('DPPc').AsFloat := StrToFloat(tmpNode.text);

                                       tmpNode := LactationNode.selectSingleNode('DLPc');
                                       if tmpNode <> nil then
                                          FLactationTable.FieldByName('DLPc').AsFloat := StrToFloat(tmpNode.text);

                                       tmpNode := LactationNode.selectSingleNode('CY');
                                       if tmpNode <> nil then
                                          FLactationTable.FieldByName('CY').AsFloat := StrToFloat(tmpNode.text);

                                       tmpNode := LactationNode.selectSingleNode('CBPc');
                                       if tmpNode <> nil then
                                          FLactationTable.FieldByName('CBPc').AsFloat := StrToFloat(tmpNode.text);

                                       tmpNode := LactationNode.selectSingleNode('CPPc');
                                       if tmpNode <> nil then
                                          FLactationTable.FieldByName('CPPc').AsFloat := StrToFloat(tmpNode.text);

                                       tmpNode := LactationNode.selectSingleNode('CLPc');
                                       if tmpNode <> nil then
                                          FLactationTable.FieldByName('CLPc').AsFloat := StrToFloat(tmpNode.text);

                                       tmpNode := LactationNode.selectSingleNode('Recs');
                                       if tmpNode <> nil then
                                          FLactationTable.FieldByName('Recs').AsInteger := StrToInt(tmpNode.text);

                                       tmpNode := LactationNode.selectSingleNode('DIM');
                                       if tmpNode <> nil then
                                          FLactationTable.FieldByName('DIM').AsInteger := StrToInt(tmpNode.text);

                                       tmpNode := LactationNode.selectSingleNode('Y305');
                                       if tmpNode <> nil then
                                          FLactationTable.FieldByName('Y305').AsFloat := StrToFloat(tmpNode.text);

                                       tmpNode := LactationNode.selectSingleNode('BPc305');
                                       if tmpNode <> nil then
                                          FLactationTable.FieldByName('BPc305').AsFloat := StrToFloat(tmpNode.text);

                                       tmpNode := LactationNode.selectSingleNode('PPc305');
                                       if tmpNode <> nil then
                                          FLactationTable.FieldByName('PPc305').AsFloat := StrToFloat(tmpNode.text);

                                       tmpNode := LactationNode.selectSingleNode('LPc305');
                                       if tmpNode <> nil then
                                          FLactationTable.FieldByName('LPc305').AsFloat := StrToFloat(tmpNode.text);

                                       tmpNode := LactationNode.selectSingleNode('SCC');
                                       if tmpNode <> nil then
                                          FLactationTable.FieldByName('SCC').AsFloat := StrToFloat(tmpNode.text);

                                       FLactationTable.Post;
                                    except
                                       FLactationTable.Cancel;
                                    end;
                                 end;
                           end;
                     end;
               end;

            FAncestryTable.IndexName := 'iRefID';
            FAncestryTable.MasterFields := 'ID';
            FAncestryTable.MasterSource := dsCurrTableData;

            FEventTable.IndexName := 'iRefID';
            FEventTable.MasterFields := 'ID';
            FEventTable.MasterSource := dsCurrTableData;

            FLactationTable.IndexName := 'iRefID';
            FLactationTable.MasterFields := 'ID';
            FLactationTable.MasterSource := dsCurrTableData;

            FBullingTable.IndexName := 'iRefID';
            FBullingTable.MasterFields := 'ID';
            FBullingTable.MasterSource := FEventDataSource;

            FServiceTable.IndexName := 'iRefID';
            FServiceTable.MasterFields := 'ID';
            FServiceTable.MasterSource := FEventDataSource;

            FPregDiagTable.IndexName := 'iRefID';
            FPregDiagTable.MasterFields := 'ID';
            FPregDiagTable.MasterSource := FEventDataSource;

            FHealthTable.IndexName := 'iRefID';
            FHealthTable.MasterFields := 'ID';
            FHealthTable.MasterSource := FEventDataSource;

            FWeighingTable.IndexName := 'iRefID';
            FWeighingTable.MasterFields := 'ID';
            FWeighingTable.MasterSource := FEventDataSource;

            Result := True;
         end;
   finally
      btnReviewData.Enabled := True;
      AnimalDataGridDBBandedTableView.Controller.FocusedRowIndex := 0;
      Screen.Cursor := crDefault;
   end;
end;

procedure TfKImport.btnReviewDataClick(Sender: TObject);
begin
   if (CurrTableData.Active) and (CurrTableData.RecordCount>0) then
      TfmMovementsEventReview.EventReview(CurrTableData.FieldByName('NatIDNum').AsString);
end;

procedure TfKImport.bbImportAsOldFormatClick(Sender: TObject);
begin
   if bbImportAsOldFormat.Down then
      begin
         OpenDialog.Filter := 'DAT File|*.dat';
      end
   else
      begin
         OpenDialog.Filter := 'XML File|*.xml';
      end;
end;

function TfKImport.CheckAnimalExists(ANatIdNum: String): Integer;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Add('SELECT ID');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE ( SearchNatID LIKE "%'+StripAllSpaces(ANatIDNum)+'%" )');
         SQL.Add('AND   ( InHerd = TRUE )');
         SQL.Add('AND   ( HerdID = '+lcbHerdLookup.Value+' )');
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

function TfKImport.UpdateSireDamID(ASex : String;
  ASiblingId, AParentId : Integer) : Boolean;
var
   FieldName : string;
begin
   Result := False;
   with TQuery.Create(nil) do
      try
         try
            DatabaseName := AliasName;
            if ( ASex = 'Female' ) then
               FieldName := 'DamID'
            else
               FieldName := 'SireID';

            SQL.Add('UPDATE Animals SET '+FieldName+' =:ID WHERE (ID = :ID1) ');
            Params[0].AsInteger := AParentId;
            Params[1].AsInteger := ASiblingId;
            ExecSQL;
            Result := True;
         except
         end;
      finally
         Free;
      end;
end;

procedure TfKImport.CheckCTSMovementReg;
var
   confirmForm : TForm;
   rg : TRadioGroup;
   lb : TLabel;
   RegisteredCountry : TCountry;
begin
   FCTSRegMarkAsRegistered := False;

   RegisteredCountry := Other;
   if ( DoWhat = TSaleDeath ) then
      RegisteredCountry := WinData.DefCountry(WinData.UserDefaultHerdID)
   else
      begin
         if (( lcbHerdLookup.Value <> '' ) and  ( lcbHerdLookup.Value <> '0' ) ) then
            RegisteredCountry := WinData.DefCountry(lcbHerdLookup.KeyValue);
       end;

   if not (RegisteredCountry in ([Scotland, England])) then Exit;

   confirmForm := TForm.Create(nil);
   confirmForm.Position := poDesktopCenter;
   confirmForm.BorderStyle := bsDialog;
   confirmForm.ClientHeight := 200;
   confirmForm.ClientWidth := 450;
   confirmForm.Font.Name := 'Segoe UI';
   confirmForm.Font.Size := 8;
   confirmForm.Caption := 'CTS Movement Confirmation';


   rg := TRadioGroup.Create(confirmForm);
   with rg do
      begin
         Parent := confirmForm;
         ParentFont := True;
         Caption := 'Select option to continue';
         Top := 20;
         Height := 100;
         Width := 400;
         Left := 25;
         Name := 'RG';
         Items.Add('Notify CTS of these movements.');
         Items.Add('Do not notify CTS of these movements.');
         ItemIndex := 0;
      end;

    lb := TLabel.Create(confirmForm);
    with lb do
       begin
          Parent := confirmForm;
          ParentFont := True;
          Font.Color := clRed;
          Font.Style := [];
          Left := 25;
          Top := ( rg.Top + rg.Height ) + 5;
          WordWrap := True;
          Height := Height * 2;
          Width := 400;
          Caption := 'If you choose the first option, these movements will appear the next time you register movements with CTS.';
       end;

    with TButton.Create(confirmForm) do
       begin
          Caption := 'Select';
          ParentFont := True;
          Default := True;
          Top := ( lb.Top + lb.Height ) + 15;
          Width := 65;
          Left := 360;
          Parent := confirmForm;
          ModalResult := mrOK;
       end;

   confirmForm.OnCloseQuery := MyFormCloseQuery;
   confirmForm.ShowModal;
   FCTSRegMarkAsRegistered := rg.ItemIndex=1;
   FreeAndNil(confirmForm);
end;

procedure TfKImport.MyFormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
   rg : TRadioGroup;
begin

   if ( Sender is TForm) then
      begin
         rg := TRadioGroup((Sender as TForm).FindComponent('RG'));
         if rg <> nil then
            begin
               if rg.ItemIndex = 0 then
                  begin
                     CanClose := (MessageDlg('You have choosen to notify CTS of these movements at next CTS registration.'+cCRLFx2+'Click Yes to confirm.',mtConfirmation,[mbYes,mbNo],0)=IdYes);
                  end
               else
                  begin
                     CanClose := (MessageDlg('You have choosen to ignore these movements at next CTS registration.'+cCRLFx2+'Click Yes to confirm.',mtConfirmation,[mbYes,mbNo],0)=IdYes);
                  end;
            end;
      end;
end;

function TfKImport.FindAnimal(const ANatIdNum, AHerdBookNo,
  AName, ASex: string; AAnimalNo : String = ''): Integer;
var
   qFindAnimal : TQuery;
begin
   qFindAnimal := TQuery.Create(nil);
   with qFindAnimal do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID '); // latest instance of animal
         SQL.Add('FROM Animals ');
         SQL.Add('WHERE ( NatIdNum=:NatIdNum )');
         SQL.Add('OR    ( Name=:Name )');
         SQL.Add('OR    ( HerdBookNo=:AHerdBookNo )');

         //   24/05/12 [V5.0 R7.0] /MK Bug Fix - FindAnimal Defaults AnimalNo To Null So Search Can Work With Or Without AnimalNo.
         if ( AAnimalNo <> '' ) then
            SQL.Add('OR ( AnimalNo=:AnimalNo )');

         SQL.Add('AND ( Sex=:Sex )');

         Params[0].AsString := ANatIdNum;
         Params[1].AsString := AName;
         Params[2].AsString := AHerdBookNo;

         //   24/05/12 [V5.0 R7.0] /MK Bug Fix - FindAnimal Defaults AnimalNo To Null So Search Can Work With Or Without AnimalNo.
         if ( AAnimalNo <> '' ) then
            begin
               Params[3].AsString := AAnimalNo;
               Params[4].AsString := ASex;
            end
         else
            Params[3].AsString := ASex;

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

procedure TfKImport.bbModifyAnimalNumberClick(Sender: TObject);
begin
   if ( bbModifyAnimalNumber.Down ) then
      begin
         bbIgnoreAnimalNumber.Down := False;
         bbRenumberExistingAnimal.Down := False;
      end;
end;

procedure TfKImport.bbIgnoreAnimalNumberClick(Sender: TObject);
begin
   if ( bbIgnoreAnimalNumber.Down ) then
      begin
         bbModifyAnimalNumber.Down := False;
         bbRenumberExistingAnimal.Down := False;
      end;
end;

procedure TfKImport.bbRenumberExistingAnimalClick(Sender: TObject);
begin
   if ( bbRenumberExistingAnimal.Down ) then
      begin
         bbModifyAnimalNumber.Down := False;
         bbIgnoreAnimalNumber.Down := False;
      end;
end;

procedure TfKImport.bbIgnoreEventMessagesClick(Sender: TObject);
begin
   WinData.FKImportIgnoreEventMessages := bbIgnoreEventMessages.Down;
end;

procedure TfKImport.btnPurchManuallyClick(Sender: TObject);
begin
   btnSelectPurchaseFile.Enabled := False;
   btnAddAnimal.Left := 14;
   btnAddAnimal.Visible := True;
   btnAddAnimal.Enabled := True;
   btnDeleteAnimal.Left := 95;
   btnDeleteAnimal.Visible := True;
   btnDeleteAnimal.Enabled := False;
   AnimalGrid.DataSource.Dataset.EnableControls;
   EnableGroupBox(gbPurchDetails,True);
   EnableGroupBox(gbDestinationHerd,True);
   EnableGroupBox(gbReview,True);
   EnableGroupBox(gbCompleteTrans,True);
   FHyperLink.Visible := True;
   btnPurchManually.Default := False;
   gbReview.Caption := 'Step 4 - Add Animals';
   btnReviewData.Visible := False;
   lTotal.Left := 202;

   // Set Focus In ComboBox That Has No Value Or Set Focus To The Grid.
   if ( (lcbHerdLookup.Value = '') or (lcbHerdLookup.Value = '0') ) then
      lcbHerdLookup.SetFocus
   else if ( (Supplier.Value = '') or (Supplier.Value = '0') ) then
      Supplier.SetFocus
   else
      AnimalDataGrid.SetFocus;

   with AnimalDataGridDBBandedTableView do
      begin
         DataController.Options := [dcoAssignGroupingValues,dcoAssignMasterDetailKeys,dcoSaveExpanding,dcoImmediatePost];
         OptionsBehavior.FocusCellOnTab := True;
         OptionsData.Editing := True;
         OptionsData.Appending := True;
         OptionsSelection.CellSelect := True;
         OnKeyDown := AnimalDataGridManualKeyDown;
         OnCellClick := AnimalDataGridManualCellClick;
         with AnimalDataGridDBBandedTableViewAnimalNo do
            begin
               PropertiesClass := TcxTextEditProperties;
               with TcxTextEditProperties(Properties) do
                  begin
                     CharCase := ecUpperCase;
                     OnValidate := AnimalDataGridManualAnimalNoValidate;
                  end;
            end;

         with AnimalDataGridDBBandedTableViewNatIDNum do
            begin
               PropertiesClass := TcxTextEditProperties;
               with TcxTextEditProperties(Properties) do
                  begin
                     CharCase := ecUpperCase;
                     OnValidate := AnimalDataGridManualNatIDNumValidate;
                  end;
            end;

         if ( WinData.GlobalSettings.UseBarcodeScanner ) then
             begin
                 with AnimalDataGridDBBandedTableViewDateOfBirth do
                    begin
                       PropertiesClass := TcxTextEditProperties;
                       with TcxTextEditProperties(Properties) do
                          begin
                             OnValidate := AnimalDataGridManualDateOfBirthValidate;
                          end;
                    end;
             end;

         with AnimalDataGridDBBandedTableViewSex do
            begin
               PropertiesClass := TcxComboBoxProperties;
               with TcxComboBoxProperties(Properties) do
                  begin
                     Items.BeginUpdate;
                     Items.Clear;
                     Items.Add('Female');
                     Items.Add('Bull');
                     Items.Add('Steer');
                     Items.EndUpdate;
                     DropDownListStyle := lsFixedList;
                     OnEditValueChanged := AnimalDataGridManualSexEditValueChanged;
                  end;
            end;

         with AnimalDataGridDBBandedTableViewBreedCode do
            begin
               Width := 70;
               PropertiesClass := TcxLookupComboBoxProperties;
               with TcxLookupComboBoxProperties(Properties) do
                  begin
                     Alignment.Horz := taLeftJustify;
                     Alignment.Vert := taVCenter;
                     ListSource := WinData.BreedsSource;
                     ListFieldNames := 'Code;Name';
                     KeyFieldNames := 'Code';
                     DropDownWidth := 200;
                     ListOptions.ShowHeader := False;
                  end;
            end;

         with AnimalDataGridDBBandedTableViewColourCode do
            begin
               Width := 70;
               PropertiesClass := TcxLookupComboBoxProperties;
               with TcxLookupComboBoxProperties(Properties) do
                  begin
                     Alignment.Horz := taLeftJustify;
                     Alignment.Vert := taVCenter;
                     ListSource := WinData.dsAnimalColours;
                     ListFieldNames := 'Description';
                     KeyFieldNames := 'LookupCode';
                     DropDownWidth := 120;
                     ListOptions.ShowHeader := False;
                  end;
            end;

         with AnimalDataGridDBBandedTableViewLactNo do
            begin
               Options.Editing := False;
            end;

         with AnimalDataGridDBBandedTableViewDamIDNum do
            begin
               Visible := False;
            end;

         with AnimalDataGridDBBandedTableViewSireIDNum do
            begin
               Visible := False;
            end;

         with AnimalDataGridDBBandedTableViewPurchaseGroup do
            begin
               Options.Editing := True;
               DataBinding.FieldName := 'PurchaseGroup';
               Visible := ( DoWhat = TPurchase ) and ( FHerdType = htBeef );
            end;

         with AnimalDataGridDBBandedTableViewBatchGroup do
            begin
               Options.Editing := True;
               DataBinding.FieldName := 'BatchGroup';
               Visible := ( DoWhat = TPurchase ) and ( FHerdType = htBeef );
            end;
      end;

   FManualPurchase := True;
end;

procedure TfKImport.CurrTableDataNewRecord(DataSet: TDataSet);
begin
   if ( FManualPurchase ) then
      CurrTableData.FieldByName('Include').AsBoolean := True;
   btnDeleteAnimal.Enabled := True;
   UpdateRecordCount;
end;

procedure TfKImport.AnimalDataGridManualAnimalNoValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
   AnimalNo : String;
begin
   AnimalNo := UpperCase(DisplayValue);
   if ( AnimalNo <> '' ) then
      begin
         if ( not(Windata.CheckAnimalNoInUse(AnimalNo, WinData.DefaultHerdID) = Allok) ) then
            begin
               //   29/01/14 [V5.2 R7.8] /MK Bug Fix - If bbRenumberExistingAnimal.Down then don't give warning for Animal No.
               if ( not(bbRenumberExistingAnimal.Down) ) then
                  raise ErrorMsg.CreateFmt('Animal Number already in use.',[nil])
            end
         else
            DisplayValue := AnimalNo;
      end
end;

procedure TfKImport.AnimalDataGridManualNatIDNumValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
var
   UpperTxt,
   NatIdNum,
   FormattedStr : String;

   procedure FormatDisplayValue;
   begin
      DisplayValue := FormattedStr;
   end;

begin
   NatIDNum := DisplayValue;
   //   07/07/17 [V5.6 R9.1] /MK Change - Remove country code, if found, from tag and add correct country code depending on Dept. algorithm.
   UpperTxt := StripAllSpaces(UpperCase(NatIDNum));
   //   03/10/17 [V5.7 R2.9] /MK Bug Fix - Program was trying to format an English tag to show an IE - Ed Dale's reported. 
   if ( not((IsNINatID(UpperTxt)) or (IsEngNatID(UpperTxt))) ) then
      begin
         if ( (Length(UpperTxt) = 14) and (Copy(UpperTxt,1,2) = 'IE') ) then
            UpperTxt := Copy(UpperTxt,3,12)
         else if ( (Length(UpperTxt) = 15) and (Copy(UpperTxt,1,3) = '372') ) then
            UpperTxt := Copy(UpperTxt,4,12);
         if ( IsIETag(UpperTxt) ) then
            UpperTxt := 'IE'+UpperTxt
         else if ( Is372Tag(UpperTxt) ) then
            UpperTxt := '372'+UpperTxt;
      end;
   if ( not( CheckNatID(UpperTxt, FormattedStr, True)) )then   //Checks for a valid NatID Number format
      raise ErrorMsg.CreateFmt('Invalid National ID entered.',[nil]);
   try
      if ( (WinData.GlobalSettings.AllowDuplicateTags) and (WinData.LookUpDamSire.Locate('NatIDNum',FormattedStr,[])) ) then
         FormatDisplayValue
      else if ( not(WinData.LookUpDamSire.Locate('NatIDNum',FormattedStr,[])) ) then
         FormatDisplayValue
      else
         MessageDlg('National ID already entered.',mtError,[mbOK],0);
   finally
   end;
end;

procedure TfKImport.AnimalDataGridManualKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if ( Key = VK_DOWN ) then
      begin
         AddRecord;
      end;
end;

procedure TfKImport.AddRecord;
begin
   if ( CurrTableData.RecordCount > 0 ) then
      begin
         CheckAnimalsTable;
         if ( CurrTableData.State = dsInsert ) then
            begin
               CurrTableData.Post;
               CurrTableData.Append;
            end
         else
            CurrTableData.Append;
      end
   else
      CurrTableData.Append;
   AnimalDataGridDBBandedTableViewLactNo.Options.Editing := False;

   if ( CurrTableHeader.FieldByName('Comment').AsString <> '' ) then
      CurrTableData.FieldByName('Comment').AsString := CurrTableHeader.FieldByName('Comment').AsString;
   if ( CurrTableHeader.FieldByName('Price').AsFloat > 0 ) then
      CurrTableData.FieldByName('Price').AsFloat := CurrTableHeader.FieldByName('Price').AsFloat;
   if ( CurrTableHeader.FieldByName('Weight').AsFloat > 0 ) then
      CurrTableData.FieldByName('Weight').AsFloat := CurrTableHeader.FieldByName('Weight').AsFloat;
   if ( CurrTableHeader.FieldByName('LotNumber').AsString <> '' ) then
      CurrTableData.FieldByName('LotNumber').AsString := CurrTableHeader.FieldByName('LotNumber').AsString;
   if ( StrToInt(PurchGrp.Value) > 0 ) then
      CurrTableData.FieldByName('PurchaseGroup').AsInteger := StrToInt(PurchGrp.Value);
   if ( StrToInt(dblcBatchGroups.Value) > 0 ) then
      CurrTableData.FieldByName('BatchGroup').AsInteger := StrToInt(dblcBatchGroups.Value);

   AnimalDataGridDBBandedTableView.Controller.FocusedItem := AnimalDataGridDBBandedTableView.FindItemByID(AnimalDataGridDBBandedTableViewAnimalNo.Index);
   AnimalDataGrid.SetFocus;
end;

procedure TfKImport.btnAddAnimalClick(Sender: TObject);
begin
   AddRecord;
end;

procedure TfKImport.btnDeleteAnimalClick(Sender: TObject);
begin
   CurrTableData.Delete;
   lTotal.Caption := Format('Total: %d',[CurrTableData.RecordCount]);
end;

procedure TfKImport.CheckAnimalsTable;
begin
   if ( not(CurrTableData.FieldByName('NatIDNum').AsString <> '') ) then
      begin
         MessageDlg('National ID Number must be entered',mtError,[mbOK],0);
         SysUtils.Abort
      end;
   if ( CurrTableData.FieldByName('DateOfBirth').AsDateTime = 0 ) then
      begin
         MessageDlg('Date Of Birth must be entered',mtError,[mbOK],0);
         SysUtils.Abort
      end;
   if ( not(CurrTableData.FieldByName('Sex').AsString <> '') ) then
      begin
         MessageDlg('Sex must be entered',mtError,[mbOK],0);
         SysUtils.Abort
      end;
   if ( not(CurrTableData.FieldByName('BreedCode').AsString <> '') ) then
      begin
         MessageDlg('Breed Code must be entered',mtError,[mbOK],0);
         SysUtils.Abort
      end;
end;

procedure TfKImport.AnimalDataGridManualSexEditValueChanged(
  Sender: TObject);
var
   AnimalSex : String;
begin
   with AnimalDataGridDBBandedTableView.DataController do
      begin
         AnimalDataGridDBBandedTableView.Controller.EditingController.Edit.PostEditValue;
         AnimalSex := UpperCase(AnimalDataGridDBBandedTableViewSex.EditValue);
         if ( AnimalSex = 'FEMALE' ) then
            AnimalDataGridDBBandedTableViewLactNo.Options.Editing := True;
      end;
end;

procedure TfKImport.ProcessBarCodeScan(ABarcodeText : String);
var
   MyString : string;
   RaiseError : Boolean;
begin
   RaiseError := False;
   if Trim(ABarcodeText) = '' then exit;

   if (Length(ABarcodeText) >= 11) then
      try
         Screen.Cursor := crHourGlass;
         try
            if (CurrTableData.State in dsEditModes) then
               begin
                  CurrTableData.FieldByName('DateOfBirth').AsDateTime := StrToDate(Copy(ABarcodeText, 1, 2) + '/' + Copy(ABarcodeText, 3, 2)+ '/' + Copy(ABarcodeText, 5, 4));

                  MyString := (UPPERCASE(Copy(ABarcodeText, 10, (Strlen(PChar(ABarcodeText)) - 9))));
                  WinData.Breeds.First;
                  if WinData.Breeds.Locate('Code', MyString,[]) then
                     CurrTableData.FieldByName('BreedCode').AsString := WinData.Breeds.FieldByName('Code').AsString
                  else
                     begin
                        ShowMessage('Animal Breed ''' + (UpperCase(Copy(ABarcodeText, 10, Strlen(PChar(ABarcodeText))))) + '''  not in table');
                        CurrTableData.FieldByName('PrimaryBreed').Clear;
                     end;

                  if (UPPERCASE(Copy(ABarcodeText, 9, 1)) = 'F') then
                     CurrTableData.FieldByName('Sex').AsString := cSex_Female
                  else if (UPPERCASE(Copy(ABarcodeText, 9, 1)) = 'B') then
                     CurrTableData.FieldByName('Sex').AsString := cSex_Bull
                  else
                     CurrTableData.FieldByName('Sex').AsString := cSex_Steer;
                  ABarcodeText := '';
               end;
         finally
            Screen.Cursor := crDefault;
         end;
      except
         ABarcodeText := '';
      end
   else
      begin
         ABarcodeText := '';
      end;
end;

procedure TfKImport.AnimalDataGridManualDateOfBirthValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
   ProcessBarCodeScan(DisplayValue);
end;

procedure TfKImport.FHyperLinkEditClick(Sender: TObject);
begin
   if ( FHyperLink.Text = 'Disable Barcode Scanner' ) then
      begin
         WinData.GlobalSettings.UseBarcodeScanner := False;
         FHyperLink.Text := 'Enable Barcode Scanner';
         with AnimalDataGridDBBandedTableView do
            begin
                with AnimalDataGridDBBandedTableViewDateOfBirth do
                   begin
                      PropertiesClass := TcxDateEditProperties;
                   end;
            end;
      end
   else if ( FHyperLink.Text = 'Enable Barcode Scanner' ) then
      begin
         WinData.GlobalSettings.UseBarcodeScanner := True;
         FHyperLink.Text := 'Disable Barcode Scanner';
         with AnimalDataGridDBBandedTableView do
            begin
                with AnimalDataGridDBBandedTableViewDateOfBirth do
                   begin
                      PropertiesClass := TcxTextEditProperties;
                      with TcxTextEditProperties(Properties) do
                         begin
                            OnValidate := AnimalDataGridManualDateOfBirthValidate;
                         end;
                   end;
            end;
      end;
end;

procedure TfKImport.AnimalDataGridManualCellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
   if ( Sender.IndexOfItem(AnimalDataGridDBBandedTableViewLactNo) = AnimalDataGridDBBandedTableViewLactNo.Index ) then
      if ( UpperCase(CurrTableData.FieldByName('Sex').AsString) = 'FEMALE' ) then
         AnimalDataGridDBBandedTableViewLactNo.Options.Editing := True
      else
         AnimalDataGridDBBandedTableViewLactNo.Options.Editing := False;
end;

procedure TfKImport.CustomerCloseUp(Sender: TObject);
var
   ID : Integer;
begin
   if ( Customer.Value = '0' ) then
      begin
         uCustomers.ShowTheForm(True, ID);
         //   21/03/12 [V5.0 R4.5] /MK Change - Re-Open Query To Get New Customer Entry.
         WinData.QueryCustomers.Active := False;
         WinData.QueryCustomers.Active := True;
         Customer.KeyValue := ID;
         CustomerSlaughter(ID);
      end
   else if ( Customer.Value <> '' ) then
      CustomerSlaughter(StrToInt(Customer.Value));
end;

procedure TfKImport.FormActivate(Sender: TObject);
begin
   //   25/02/15 [V5.4 R2.6] /MK Bug Fix - Delphi lost the lookup sources for these components.
   Customer.LookupSource := WinData.dsQueryCustomers;
   rxcCulling.LookupSource := WinData.dsCulling;
   lcbHerdLookup.LookupSource := WinData.dsHerdDefaults;
   Supplier.LookupSource := WinData.dsQuerySuppliers;
   Buyer.LookupSource := WinData.dsQueryBuyers;
end;

procedure TfKImport.dblcBatchGroupsCloseUp(Sender: TObject);
var
   GroupID : SmallInt;
begin
   if ( dblcBatchGroups.Value = '0' ) then
      begin
         uGroupSetUp.ShowTheFormID(1, GroupID); { Show the Groups form if Combo box value is empty }
         qBatchGroups.Close;
         qBatchGroups.Open;
         if ( GroupID <> 0 ) then
            dblcBatchGroups.Value := IntToStr(GroupID);
      end;
end;

procedure TfKImport.dblcBatchGroupsDropDown(Sender: TObject);
begin
   qBatchGroups.Close;
   qBatchGroups.Open;
end;

procedure TfKImport.UpdateGroups(AGroupType : TGroupType; ASelectedGroup : Integer);
var
   qGroups : TQuery;
   sHeaderFieldName,
   sDetailFieldName : String;
begin
   if ( ASelectedGroup = 0 ) then Exit;
   case AGroupType of
       gtNone     : Exit;
       gtBatch    : begin
                       sHeaderFieldName := 'BatchGrp';
                       sDetailFieldName := 'BatchGroup';
                    end;
       gtPurchase : begin
                       sHeaderFieldName := 'PurchGrp';
                       sDetailFieldName := 'PurchaseGroup';
                    end;
   end;
   if ( Length(sHeaderFieldName) = 0 ) or ( Length(sDetailFieldName) = 0 ) then Exit;

   qGroups := TQuery.Create(nil);
   try
      qGroups.DatabaseName := AliasName;
      
      qGroups.SQL.Clear;
      qGroups.SQL.Add('UPDATE '+CurrTableHeader.TableName);
      qGroups.SQL.Add('SET '+sHeaderFieldName+' = '+IntToStr(ASelectedGroup)+'');
      qGroups.ExecSQL;

      qGroups.SQL.Clear;
      qGroups.SQL.Add('UPDATE '+CurrTableData.TableName);
      qGroups.SQL.Add('SET '+sDetailFieldName+' = '+IntToStr(ASelectedGroup)+'');
      qGroups.ExecSQL;

      CurrTableData.Close;
      CurrTableData.Open;
   finally
      if ( qGroups <> nil ) then
         begin
            qGroups.Close;
            FreeAndNil(qGroups);
         end;
   end;
end;

procedure TfKImport.PurchGrpChange(Sender: TObject);
begin
   UpdateGroups(gtPurchase,StrToInt(PurchGrp.Value));
end;

procedure TfKImport.dblcBatchGroupsChange(Sender: TObject);
begin
   UpdateGroups(gtBatch,StrToInt(dblcBatchGroups.Value));
end;

end.
