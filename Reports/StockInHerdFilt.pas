unit StockInHerdFilt;
{
 ------------------------------------------------------------------------------

 13/09/02 SP -

 Suckler Premium Report -
 Changes to the Sort Order / Sort By Captions.

 ______________________________________________________________________________

 SP 25/09/2002:-

 cbUseFiltersStockOnHand: Caption changed from "Use Filters" to
                           "Use Animal Grid Filter"

 SP 25/09/2002.

 ------------------------------------------------------------------------------

 SP 15/10/2002:-

 Inter Herd Transfer fix. for premium reports.
 qApplications modified.

 SP 15/10/2002.
 Rel 3.5 9.3

 ------------------------------------------------------------------------------

 SP 21/11/2002:- 3611

 Stock On Hand Rep. Breed Name Caption Changed to Breed Code.
 Other Caption Sizes changed.

 SP 21/11/2002.  3611

 ------------------------------------------------------------------------------
 SP 11/03/2003:-

   1) Purchased animals only, wasn't picking up animals correctly.
   2) All options -
      a) The Purch/Sale/Death info is now gathered by one procedure "LoadPurchSaleDeathData"
         rather than 3 seperate procedures.

  No longer using

    procedure LoadSalesData;
    procedure LoadSalesOnly;
    procedure LoadBornAnimals;

 LoadPurchSaleDeathData does the lot!

 SP 11/03/2003.

 ------------------------------------------------------------------------------

 SP 01/05/2003:-

 Date of birth range stock on hand report.

 FromDate <> 0 and ToDate <> 0
 FromDate > 0 and ToDate <= 0
 FromDate <= 0 and ToDate > 0

 SP 01/05/2003.

 ------------------------------------------------------------------------------

 25/08/10 [V4.0 R4.6] /MK Change - Dunbia Change to Sort By HerdID and then SortByType Date Removed - GL - Because Coolmore Stud
                                   Wants To Sort Just By Date - Dunbia Should Just Print Separate Reports

 06/09/11 [V5.0 R0.5] /MK Change - Changed rgInclude.ItemIndex[3].Caption To All Animals As Requested By GL.

 21/03/12 [V5.0 R4.5] /MK Change - HerdReconciliation1Click - New Boolean Check For Reconcile By Cards Checked Here.

 02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.

 02/04/12 [V5.0 R4.8] /MK Change - New Boolean Check For If Clicked From Main Grid.

 16/10/12 [V5.1 R0.4] /MK Bug Fix - Removed not cbUseFilter.Checked as report was only showing those animals that

 05/12/12 [V5.1 R3.5] /MK Bug Fix - LoadOtherData - Program was displaying the wrong LactNo for historical stock date.

 28/03/13 [V5.1 R5.4] /MK Change - Changed combo's LookupSource to new DairyData DataSource's for customers and suppliers.

 09/04/13 [V5.1 R6.2] /MK Bug Fix - Made change to pPurchSales.SQL's for rgInclude.Items 0,1&2 so that animals with Blank Breeds appear on the report.

 18/06/13 [V5.1 R7.4] /MK Additional Feature - If HerdType is Beef and Def.Defintion.dUseBeefMan then change last calving date
                                               to Quality Assured.

 16/09/13 [V5.2 R1.3] /MK Additional Feature - Added AFromBordBia boolean to ShowTheForm to tell if unit is opened from Bord Bia screen.
                                             - If AFromBordBia then default to Deaths only and last 12 months for date.

 20/02/14 [V5.2 R8.4] /MK Bug Fix - Stock on Hand/In Milk report was not including animals that did not have a calving event
                                    unlike what the MainGrid Select Category In Milk was doing.
                                  - Stock on Hand/In Milk report was including animals that were breeding
                                    unlike what the MainGrid Select Category In Milk was doing.

 07/05/14 [V5.3 R0.0] /MK Bug Fix - Set IdArray back to zero for each animal in DuplicateAnimals.Strings.
                                    Program was adding to each animal from DuplicateAnimals.Strings to this array
                                    and always returning all events of these animals instead of just the events
                                    of the two ids for DuplicateAnimals.Strings.

 13/06/14 [V5.3 R1.8] /MK Bug Fix - LoadOtherData - Calvings - Used left join instead as program crashed with some sets of data - TGM/K&W Morrow.

 05/09/14 [V5.3 R5.9] /MK Bug Fix - qPurchSales - Change to query to allow for new changes to Average and Summary expressions on report.

 11/09/14 [V5.3 R6.1] /MK Change - pPurchSales - Added new rgInclude.ItemIndex for All Animals - GL Request.
                                               - If All Animals then do not show date select for either sales or purchases but show Customer/Supplier select - Gl Request.
                                               - Changed caption of rgInclude.Items to match web app - Gl Request - . All Animals
                                                                                                                    . All Purchased Animals
                                                                                                                    . All Sold Animals
                                                                                                                    . All Dead Animals
                                                                                                                    . BOTH Purchase and Sold
                                                                                                                    . Purchased (&Not Sold)

 07/11/14 [V5.3 R8.2] /MK Bug Fix - pPurchSales - Default from BordBia to Deaths - With change to items in rgInclude (above) this was never changed - DOM.

 13/11/14 [V5.3 R8.9] /MK Bug Fix - ViewBtnClick - Purchase NOT Sold initial query was adding purchase date as the date of birth.
                                                 - ToPurchDate can be null so check for null sales dates depending on From/To Date Filters.
                                                 - SaleDate can be null so check for null sales dates depending on From/To Date Filters.
                          Additional Feature - ViewBtnClick - New function created to add sql text whether WhereIn is True or False.
                                                            - If Purchased AND Sold then delete animals that died.
                                             - LoadPurchSaleDeathData - Looking at new uMovementDataHelper.Sales/Purchase TempTables instead of WinData.CheckEvents
                                                                        to make this procedure quicker.
                          Change - LoadPurchSaleDeathData - If not purchase/sale date found then PurchDate/SalesDate in TempTable should be null.

 01/10/15 [V5.4 R9.3] /MK Bug Fix - Changes made to last SQL in PurchSales to filter report by Sale or Purchase date as well as supplier and customer.
                                    Emer Howard reported a bug where the Purchases Not Sold was not filtering by Supplier.

 05/10/15 [V5.4 R9.4] /MK Bug Fix - AddPurchDateFilter - This function was using the Sale date components not the Purchase date components.

 25/11/15 [V5.5 R1.2] /MK Bug Fix - StockOnHand - InMilk - Showing in milk animals even if cows had dryoff events with DateRequired date.
                                                - DryOff - Not showing dry animals if they had dryoff events with DateRequired date.

 04/04/16 [V5.5 R5.7] /MK Bug Fix - Check for Crush User's to show Q/A. If beef user then show Purchase Date - Slyvia Tracey.

 03/10/17 [V5.7 R3.5] /MK Change - Don't change caption of favourites button just tick it and change the colour to blue like Apply Filter check box - SP request.
                                 - Added progress bar and egg timer to the Purchase Sales Analysis Report.

 13/07/18 [V5.8 R0.9] /MK Additional Feature - Added a new Options button on the ToolBar.
                                             - Options button links to new TfmReportOptions form.
                                             - Removed include options from Purchase Sales Analysis report as they were added to the TfmReportOptions form.

 16/07/18 [V5.8 R0.9] /MK Additional Feature - Added sort by Check Digit, Last 4 digits to sort by list for PurchSalesAnal report - Jackie (Quinn's).

 30/07/18 [V5.8 R2.0] /MK Additional Feature - LoadScreenDefaults/SaveScreenDefaults - Added code to store selection from new uReportOptions RadioGroup Include Purchase Details.
                                             - If Include Last Purchase Details then only show one instance of the animal within the date range provided.
                                             - If Include All Purchase Details then show all instances of the animal within the filter.

 27/08/18 [V5.8 R2.5] /MK Change - Changed order of title bar so that Options is before Help.                                                

 18/04/19 [V5.8 R9.0] /MK Change - ViewBtnClick - Save stock on hand report to txt file for debugging differences between animal counts - Michael Callan.

 16/08/19 [V5.9 R0.0] /MK Change - LoadPurchSaleDeathData - As we already have the sale date locate TempSaleEvents by sale date to remove pre-sale events also.

 14/05/20 [V5.9 R4.6] /MK Change - LoadOtherData - Made changes to use the BreedingDataHelper & MovementDataHelper TempTables instead of the Events table to try fix issues with the Stock on Hand Report.

 07/09/20 [V5.9 R5.9] /MK Bug Fix - Moved the delete table of my table to after the object is created. When deleting this table on FormDestroy sometimes it would show table is busy error - Mary Garvey.
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ToolEdit, RXSpin, ExtCtrls, RXLookup, Db,
  Qrctrls, quickrpt, DBTables, RXCtrls, ComCtrls, ToolWin, Printers,
  DbPrgrss, Menus, QRExport, uHerdLookup, KDBRoutines, ReportDefaults,
  cxRadioGroup, cxCheckBox, cxControls, cxContainer, cxEdit, cxLabel,
  cxHint, Def, DateUtil, cxProgressBar, uReportOptions, GenTypesConst,
  ChkDebug, uBreedingDataHelper;

type
  TReportType = (PurchSales, StockOnHand, Premiums);
  TSortNatIDType = (stCheckDigit, stLastFourDigits);
  TStockInHerdFilter = class(TForm)
    pPurchSales: TPanel;
    pStockOnHand: TPanel;
    qStockOnHand: TQuery;
    pPremiums: TPanel;
    DateGroup: TRadioGroup;
    IncAnimalsSold: TCheckBox;
    AppDate: TRxDBLookupCombo;
    GenQuery: TQuery;
    cbToBeAppliedFor: TCheckBox;
    EligibilityDate: TDateEdit;
    rgInclude: TRadioGroup;
    qApplications: TQuery;
    dsApplications: TDataSource;
    rgSortBy: TRadioGroup;
    rgSortOrder: TRadioGroup;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbView: TRxSpeedButton;
    sbPrint: TRxSpeedButton;
    ToolButton3: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton5: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    ComboHerd: TRxDBLookupCombo;
    Label3: TLabel;
    DateRequired: TDateEdit;
    PrintDialog1: TPrintDialog;
    qPurchSales: TQuery;
    Label4: TLabel;
    Bevel1: TBevel;
    LDOBTo: TLabel;
    LDOBFrom: TLabel;
    FromDOB: TDateEdit;
    ToDOB: TDateEdit;
    rgReportOn: TRadioGroup;
    pFemales: TPanel;
    LFrom: TLabel;
    Lto: TLabel;
    FromLact: TRxSpinEdit;
    ToLact: TRxSpinEdit;
    cbUseFilter: TCheckBox;
    CloneTable: TTable;
    pSupplierCustomer: TPanel;
    lSupplier: TLabel;
    cbSupplier: TRxDBLookupCombo;
    cbCustomer: TRxDBLookupCombo;
    lCustomer: TLabel;
    pSaleDates: TPanel;
    SwitchLabel: TLabel;
    FromSaleDate: TDateEdit;
    Label2: TLabel;
    ToSaleDate: TDateEdit;
    pPurchaseDates: TPanel;
    ToPurchDate: TDateEdit;
    Label5: TLabel;
    FromPurchDate: TDateEdit;
    Label6: TLabel;
    pbStockBar: TProgressBar;
    rgDamDisplay: TRadioGroup;
    Label7: TLabel;
    SWSQuery: TQuery;
    PopSWS: TPopupMenu;
    FloppyDisk1: TMenuItem;
    Desktop1: TMenuItem;
    qIHM: TQuery;
    TempIHM: TTable;
    qCurrency: TQuery;
    rgpremtype: TRadioGroup;
    popHerdRecon: TPopupMenu;
    HerdRecon: TMenuItem;
    rgSTag: TRadioGroup;
    HerdReconciliation1: TMenuItem;
    N1: TMenuItem;
    sbSws: TRxSpeedButton;
    QueryPurchaseInfo: TQuery;
    cbFavourite: TcxCheckBox;
    pbReport: TcxProgressBar;
    btnOptions: TRxSpeedButton;
    tbOptionsSep: TToolButton;
    procedure ExitBtnClick(Sender: TObject);
    procedure ViewBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DateGroupClick(Sender: TObject);
    procedure rgReportOnClick(Sender: TObject);
    procedure ComboHerdCloseUp(Sender: TObject);
    procedure rgIncludeClick(Sender: TObject);
    procedure PadRight(Var St : String; Len : Integer);
    Function  StripPunctuation ( StrToStrip : String ) : String;
    procedure Desktop1Click(Sender: TObject);
    procedure FloppyDisk1Click(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure rgpremtypeClick(Sender: TObject);
    procedure HerdReconClick(Sender: TObject);
    procedure ComboHerdChange(Sender: TObject);
    procedure rgSTagClick(Sender: TObject);
    procedure HerdReconciliation1Click(Sender: TObject);
    procedure cbUseFilterClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbViewMouseLeave(Sender: TObject);
    procedure cbFavouritePropertiesChange(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
  private
    { Private declarations }
    MyTable : TTable;
    TempSws : TTable;
    IntHerdTrans : TTable;
    EightMonth : String[10];
    CurrYear   : String[4];
    FHerdType : THerdType;
    LastReportOnIndex : Integer;
    FReportType: TReportType;
    StockOnHandDefault : TStockOnHandDefaults;
    PurchaseSalesDefaults : TPurchaseSalesDefaults;
    FFromBordBia : Boolean;
    FPurchSalesOptions : TPurchSalesOptions;

    procedure LoadOtherData;
    procedure CreateStockTable;
    procedure CreatePremTable;
    procedure CreateTempSws;
    procedure CreatePurchSalesTable;

    procedure LoadPurchSaleDeathData;

    procedure SetUpApplications;
    procedure AddAnimalInfo;
    procedure CreateSwsFiles;
    procedure CreateSuckTable;
    procedure CreateNatIDSort(SortNatIDType : TSortNatIDType);

    procedure SetUpHerdReconciliation;
    { PurchSales Report }
    procedure WhichDisplayTag;
    procedure SetHerdType;
    procedure LoadScreenDefaults(ReportType : TReportType);
    procedure SaveScreenDefaults(ReportType : TReportType);

    procedure CreateSOHLogFileHeader;
    function GetSOHSelectionsString: String;
  public
    { Public declarations }
    SuckTable : TTable;
  end;


  procedure ShowForm(WhichReport: TReportType; const AFromBordBia : Boolean = False);

var
  StockInHerdFilter: TStockInHerdFilter;


implementation
uses
    DairyData, SuckPremReport,
    uHerdRec, uSelectHerd, MenuUnit, uStockOnHandReport,
    uPurchSalesReport, kRoutines, uPremiumReport, SQLHelper;

{$R *.DFM}
procedure ShowForm(WhichReport:TReportType; const AFromBordBia : Boolean = False);
var
   i : integer;
begin
   try
      try
         Application.CreateForm(TStockInHerdFilter,StockInHerdFilter);
         for i := 0 to StockInHerdFilter.ComponentCount-1 do
           if (StockInHerdFilter.Components[i] is TDateEdit) then
             begin
                if (StockInHerdFilter.Components[i] as TDateEdit).DefaultToday then
                   (StockInHerdFilter.Components[i] as TDateEdit).Date := Now()
                else
                   (StockInHerdFilter.Components[i] as TDateEdit).Text := '';
             end;
      except
         ShowMessage('Cannot create form - Close program and re-boot');
      end;

      with StockInHerdFilter do
        begin
//           ComboHerd.DataSource := WinData.dsHerdDefaults;
           FReportType := WhichReport;
           cbUseFilter.Checked := WinData.ActiveFilter;
           FFromBordBia := AFromBordBia;
           case WhichReport of
               PurchSales :  begin
                                MyTable := TTable.Create(nil);
                                CreatePurchSalesTable;
                                sbSws.Hide;
                                pStockOnHand.Hide;
                                pPurchSales.Show;
                                cbSupplier.Value := '0';
                                cbCustomer.Value := '0';
                                pPremiums.Hide;
                                Caption := 'Purchase / Sales Analysis';
                                // assign Windata datasources to components.
                                cbSupplier.LookupSource := WinData.dsQuerySuppliers;
                                cbCustomer.LookupSource := WinData.dsQueryCustomers;
                                cbUseFilter.Parent := pPurchSales;
                                if cbUseFilter.Checked then
                                   begin
                                      pSupplierCustomer.Top := 40;
                                      pSupplierCustomer.Height := 109;
                                      lSupplier.Top := 22;
                                      cbSupplier.Top := 18;
                                      lCustomer.Top := 75;
                                      cbCustomer.Top := 71;
                                   //   cbUseFilter.Show;
                                   end
                                else
                                   begin
                                      pSupplierCustomer.Top := 9;
                                      pSupplierCustomer.Height := 140;
                                      lSupplier.Top := 40;
                                      cbSupplier.Top := 36;
                                      lCustomer.Top := 89;
                                      cbCustomer.Top := 85;
                                     // cbUseFilter.Hide;
                                   end;
                                if ( FFromBordBia ) and ( FReportType = PurchSales ) then
                                   begin
                                      //   07/11/14 [V5.3 R8.2] /MK Bug Fix - With change to items in rgInclude this was never changed - DOM.
                                      rgInclude.ItemIndex := 3;
                                      FromSaleDate.Date := IncYear(Date,-1);
                                      ToSaleDate.Date := Date;
                                      Caption := 'Deaths';
                                   end;
                                rgSortBy.Top := 324;
                                rgSortOrder.Top := 324;
                                pbReport.Top := 442;
                                pbReport.Visible := False;
                                Height := 508;
                             end;
               StockOnHand : begin
                                MyTable := TTable.Create(nil);
                                sbSws.Show;
                                CreateStockTable;
                                pStockOnHand.Show;
                                pPurchSales.Hide;
                                pPremiums.Hide;
                                rgreporton.ItemIndex := 6;  // Set to All
                                LastReportOnIndex := -1; // do not change this value without changing rgReportOnClick proc.
                                Caption := 'Stock On Hand';
                                cbUseFilter.Parent := pStockOnHand;
                                rgSortBy.Top := 340;
                                rgSortOrder.Top := 340;
                                pbReport.Top := 458;
                                pbReport.Visible := False;
                                Height := 522;
                             end;
               Premiums :    begin
                                CreateSuckTable;
                                sbSws.Hide;
                                pPremiums.Show;
                                AppDate.Show;
                                EligibilityDate.Hide;
                                cbToBeAppliedFor.Hide;
                                pStockOnHand.Hide;
                                pPurchSales.Hide;
                                Caption := 'Premiums Report';
                             end;
          end;

          if ( WinData.FBordBiaBlockPrint ) then
              sbPrint.Click
          else if ( not(WinData.ExportToPDA) ) then
             ShowModal
          else
             begin
               sbView.Click;
             end;
        end;
   finally
      with StockInHerdFilter do
         begin
            Free;
         end;
   end;
end;


procedure TStockInHerdFilter.ExitBtnClick(Sender: TObject);
begin
//   rgSortby.items.Clear;
   Close;
   WinData.cxHint.HideHint;   
end;

procedure TStockInHerdFilter.CreatePurchSalesTable;
begin
     with MyTable do
        begin
           DatabaseName := WinData.KingData.DatabaseName;
           TableName := 'PurchSales';
           if Exists then
              DeleteTable;
           FieldDefs.Add('ID',ftAutoInc);
           FieldDefs.Add('AnimalNo',ftString,20,FALSE);
           FieldDefs.Add('SortAnimalNo',ftString,20,FALSE);
           FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
           FieldDefs.Add('NatID',ftString,20,FALSE);
           FieldDefs.Add('SortNatID',ftString,20,FALSE);
           FieldDefs.Add('Sex',ftString,10,FALSE);
           FieldDefs.Add('DOB',ftDate,0,FALSE);
           FieldDefs.Add('BCode',ftString,6,FALSE);
           FieldDefs.Add('BuyerID',ftInteger);
           FieldDefs.Add('Buyer',ftString,30,FALSE);
           FieldDefs.Add('HerdIDno',ftInteger,0,FALSE);
           FieldDefs.Add('PEventID',ftInteger,0,FALSE);
           FieldDefs.Add('PurchDate',ftDate,0,FALSE);
           FieldDefs.Add('PurchWeight',ftFloat,0,FALSE);
           FieldDefs.Add('PurchPrice',ftFloat,0,FALSE);
           FieldDefs.Add('PurchGrade',ftString,15,FALSE);
           FieldDefs.Add('SEventID',ftInteger,0,FALSE);
           FieldDefs.Add('SupplierID',ftInteger,0,FALSE);
           FieldDefs.Add('Supplier',ftString,50,FALSE);
           FieldDefs.Add('SalesDate',ftDate,0,FALSE);
           FieldDefs.Add('SalesWeight',ftFloat,0,FALSE);
           FieldDefs.Add('SalesPrice',ftFloat,0,FALSE);
           FieldDefs.Add('SalesGrade',ftString,15,FALSE);
           FieldDefs.Add('CustomerID',ftInteger,0,FALSE);
           FieldDefs.Add('Customer',ftString,50,FALSE);
//           FieldDefs.Add('Margin',ftFloat,0,FALSE);
           FieldDefs.Add('Sold',ftBoolean,0,False);
           FieldDefs.Add('HerdIdentity',ftString,20,FALSE); // request of Dunbia 11/08
           FieldDefs.Add('PreloadedPurchSalesInfo',ftBoolean,0,False);
           CreateTable;
           Open;
        end;
end;

procedure TStockInHerdFilter.CreateStockTable;
begin
     with MyTable do
        begin
           DatabaseName := WinData.KingData.DatabaseName;
           TableName := 'StockOnHand';
           if Exists then
              DeleteTable;

           FieldDefs.Add('AnimalNo',ftString,20,FALSE);
           FieldDefs.Add('SortAnimalNo',ftString,20,FALSE);
           FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
           FieldDefs.Add('ihmAID',ftInteger,0,FALSE);
           FieldDefs.Add('LactNo',ftInteger,0,FALSE);
           FieldDefs.Add('NatID',ftString,20,FALSE);
           FieldDefs.Add('SortNatID',ftString,20,FALSE);
           FieldDefs.Add('Sex',ftString,10,FALSE);
           FieldDefs.Add('BreedID',ftInteger,0,FALSE);
           FieldDefs.Add('BreedCode',ftString,6,FALSE);
           FieldDefs.Add('DOB',ftDate,0,FALSE);
           FieldDefs.Add('Breeding',ftBoolean,0,FALSE);
           FieldDefs.Add('PurchDate',ftDate,0,FALSE);
           FieldDefs.Add('PurchPlace',ftString,30,FALSE);
           FieldDefs.Add('MonthsOnFarm',ftFloat,0,FALSE);
           FieldDefs.Add('FirstPrem',ftString,20,FALSE); // added 3
           FieldDefs.Add('SecondPrem',ftString,20,FALSE);
           FieldDefs.Add('BullPrem',ftString,20,FALSE);
           FieldDefs.Add('SireID',ftInteger,0,FALSE);
           FieldDefs.Add('SireCode',ftString,10,FALSE);
           FieldDefs.Add('DamID',ftString,20,FALSE);
           FieldDefs.Add('DamCode',ftString,10,FALSE);
           FieldDefs.Add('LastCalvingDate',ftDate,0,FALSE);
           FieldDefs.Add('HerdIdentity',ftString,15,FALSE);
           FieldDefs.Add('DateMoved',ftDate,0,FALSE);
           FieldDefs.Add('LastHerdId',ftInteger,0,FALSE);
           FieldDefs.Add('NewHerdId',ftInteger,0,FALSE);
           FieldDefs.Add('HerdID',ftInteger,0,FALSE);
           FieldDefs.Add('QualityAssured',ftBoolean);
           CreateTable;
           Open;
        end;
end;

procedure TStockInHerdFilter.CreateTempSws;
begin
   TempSws := TTable.Create(nil);
   with TempSws do
      begin
         DatabaseName := WinData.KingData.DatabaseName;
         TableName := 'TempSws';
         if Exists then
            DeleteTable;
         FieldDefs.Add('HerdIdentity',ftString,15,FALSE); // Added for SWS files
         FieldDefs.Add('NatID',ftString,20,FALSE);
         FieldDefs.Add('SortNatID',ftString,20,FALSE);
         FieldDefs.Add('DOB',ftDate,0,FALSE);
         FieldDefs.Add('AnimalID',ftInteger,0,FALSE);
         CreateTable;
         Open;
      end;
{
     with TempIHM do
        begin
           TempIHM := TTable.Create(nil);
           TempIHM.TableType := ttParadox;
           TempIHM.TableName := 'TempSOHIHM';
           TempIHM.DatabaseName := WinData.KingData.DatabaseName;

           TempIHM.FieldDefs.Add('ID',ftInteger,0,False);
           TempIHM.FieldDefs.Add('DateMoved',ftDate,0,False);
           TempIHM.FieldDefs.Add('LastHerdID',ftInteger,0,False);
           TempIHM.FieldDefs.Add('Include',ftBoolean,0,False);

           TempIHM.CreateTable;
           TempIHM.Open;
        end;
}
end;

procedure TStockInHerdFilter.CreatePremTable;
begin
     with MyTable do
        begin
           // This Table Structure MUST be the same as in uApplications PremTable !!!!
           TableType := ttParadox;
           TableName := 'TempPrm';
           if Exists then
              DeleteTable;
           DatabaseName := WinData.KingData.DatabaseName;
           FieldDefs.Add('AID',ftInteger,0,False);        // Animal ID
           FieldDefs.Add('PremiumType',ftString,1,False);
           FieldDefs.Add('AnimalCode',ftString,20,False); // Animal Code
           FieldDefs.Add('SortAnimalNo',ftString,20,False); // Animal Code
           FieldDefs.Add('NatID',ftString,20,False);      // Nat id of the Animal
           FieldDefs.Add('SortNatID',ftString,20,False);      // Nat id of the Animal
           FieldDefs.Add('DOB',ftDate,0,False);           // Date of Birth of the Animal
           FieldDefs.Add('Sex',ftString,10,False);
           FieldDefs.Add('Herd',ftString,15,False);
           FieldDefs.Add('TestEligDate',ftDate,0,False);
           FieldDefs.Add('EventID',ftInteger,0,False);    // Event ID
           FieldDefs.Add('PremiumName',ftString,20,False);
           FieldDefs.Add('Name',FtString,20,False);
           FieldDefs.Add('Printed',ftBoolean,0,False);
           FieldDefs.Add('FirstPrem',ftString,20,FALSE); // added 3
           FieldDefs.Add('SecondPrem',ftString,20,FALSE);
           FieldDefs.Add('BullPrem',ftString,20,FALSE);
           FieldDefs.Add('CountryCode',ftString,3,False);
           FieldDefs.Add('AnimalHerdNo',ftString,6,False);
           FieldDefs.Add('BarNo',ftString,4,False);
           FieldDefs.Add('CheckDigit',ftString,1,False);
           FieldDefs.Add('NDay',ftFloat,0,False);
           FieldDefs.Add('NMonth',ftFloat,0,False);
           FieldDefs.Add('NYear',ftFloat,0,False);
           FieldDefs.Add('FirstName',ftString,20,False);
           FieldDefs.Add('SurName',ftString,20,False);
           FieldDefs.Add('NName',ftString,20,False);
           CreateTable;
           Open;
        end;
end;

procedure TStockInHerdFilter.LoadOtherData;
var
   ProgInt,
   ProgPos : Integer;
   BreedingDataHelper : TBreedingDataHelper;
begin
   //   16/10/12 [V5.1 R0.4] /MK Bug Fix - Removed not cbUseFilter.Checked as report was only showing those animals that
   //                                      were in the filter and not applying Stock on Hand filter on top of main grid filter.
   //                                      This code was added before we had the option of printing animals on main grid.
   //if NOT cbUseFilter.Checked then

   //   14/05/20 [V5.9 R4.6] /MK Change - Made changes to use the MovementDataHelper TempTables instead of the Events table to try fix issues with the Stock on Hand Report.
   AddToDebugLogFile(WinData.KingData.Directory,'SOH - CreateTempMovementEventTables Start');
   WinData.MovementDataHelper.CreateTempMovementEventTables;
   if ( not(WinData.MovementDataHelper.TempPurchEvents.Active) ) then
      WinData.MovementDataHelper.TempPurchEvents.Active := True;
   if ( not(WinData.MovementDataHelper.TempSaleEvents.Active) ) then
      WinData.MovementDataHelper.TempSaleEvents.Active := True;
   AddToDebugLogFile(WinData.KingData.Directory,'SOH - CreateTempMovementEventTables End');

   CreateSOHLogFileHeader;
   AddToDebugLogFile(WinData.KingData.Directory,'Before Movement Information Removed');
   with GenQuery do
      begin
         SQL.Clear;
         SQL.Add('DELETE FROM StockOnHand');
         SQL.Add('WHERE (DOB IS NOT NULL)');
         SQL.Add('AND  (DOB > "' + FormatDateTime(cUSDateStyle,DateRequired.Date) + '")');
         ExecSQL;
         pbStockBar.Position := 12;

         // Delete based on Purchase
         SQL.Clear;
         SQL.Add('DELETE FROM StockOnHand');
         SQL.Add('WHERE ( AnimalID IN (');
         SQL.Add(' SELECT AnimalID');
         SQL.Add(' FROM '+WinData.MovementDataHelper.TempPurchEvents.TableName);
         SQL.Add(' WHERE ( EventDate > "' + FormatDateTime(cUSDateStyle,DateRequired.Date) + '")))');
         ExecSQL;

         pbStockBar.Position := 15;
         // Delete based on Sales
         SQL.Clear;
         SQL.Add('DELETE FROM StockOnHand');
         SQL.Add('WHERE ( AnimalID IN (');
         SQL.Add(' SELECT AnimalID');
         SQL.Add(' FROM '+WinData.MovementDataHelper.TempSaleEvents.TableName);
         SQL.Add(' WHERE ( EventDate <= "' + FormatDateTime(cUSDateStyle,DateRequired.Date) + '")))');
         ExecSQL;
      end;
   pbStockBar.Position := 18;

   MyTable.Close;
   MyTable.Open;

   //   14/05/20 [V5.9 R4.6] /MK Change - Made changes to use the BreedingDataHelper TempTables instead of the Events table to try fix issues with the Stock on Hand Report.
   BreedingDataHelper := TBreedingDataHelper.Create;
   try
      BreedingDataHelper.CreateTempBreedingDataTables;

      // fix for herds with no calvings - 6/11/00 - kr
      AddToDebugLogFile(WinData.KingData.Directory,'Before Movement Information Removed');
      with GenQuery do
         begin
            // if Beef Herd show purchase instead of last calving
            if ( Length(ComboHerd.Value) > 0 ) and  (FHerdType = htBeef ) then
               with MyTable do
                  begin // if all herds is selected show calving date.
                     First;
                     QueryPurchaseInfo.Active := True;
                     try
                        while not eof do
                           begin
                              Application.ProcessMessages;
                              if QueryPurchaseInfo.Locate('AnimalID', MyTable.FieldByName('AnimalID').AsInteger, []) then
                                 begin
                                    MyTable.Edit;
                                    MyTable.FieldByName('PurchDate').AsDateTime := QueryPurchaseInfo.FieldByName('eventdate').asDateTime;
                                    MyTable.Post;
                                 end;
                              Next;
                           end;
                     finally
                        QueryPurchaseInfo.Active := False;
                        AddToDebugLogFile(WinData.KingData.Directory,'After Purchase Details Are Added');
                     end;
                  end
            else
               begin
                  // Update the Last Calving Date of Female or All Animals
                  if ( rgReportOn.ItemIndex in [3..6] ) then
                     begin
                        // add calving dates & lactations for cows with calvings BEFORE stock date - kr 8/8/00
                        //   13/06/14 [V5.3 R1.8] /MK Bug Fix - Used left join instead as program crashed with some sets of data - TGM/K&W Morrow.
                        SQL.Clear;
                        SQL.Add('SELECT DISTINCT E.AnimalID AID, MAX(E.EventDate) LastCalving, MAX(E.AnimalLactNo) LastLact');
                        SQL.Add('FROM '+BreedingDataHelper.TempCalvings.TableName+' E');
                        SQL.Add('LEFT JOIN StockOnHand S ON (S.AnimalID=E.AnimalID)');
                        SQL.Add('WHERE (E.EventDate <= "' + FormatDateTime(cUSDateStyle,DateRequired.Date) + '")');
                        SQL.Add('AND   (UPPER(S.Sex)= "FEMALE")');
                        SQL.Add('AND   (S.LactNo>0)');
                        SQL.Add('GROUP BY AID');
                        try
                           Open;
                        except
                           on e : Exception do
                              ShowMessage(e.Message);
                        end;
                        ProgPos := 0;
                        ProgInt := Round(GenQuery.RecordCount/70);
                        First;
                        while NOT EOF do
                           begin
                              if MyTable.Locate('AnimalID',GenQuery.FieldByName('AID').AsInteger,[]) then
                                 begin
                                    MyTable.Edit;
                                    MyTable.FieldByName('LastCalvingDate').AsDateTime := GenQuery.FieldByName('LastCalving').AsDateTime;
                                    MyTable.FieldByName('LactNo').AsInteger := GenQuery.FieldByName('LastLact').AsInteger;
                                    MyTable.Post;
                                 end;
                              Next;
                              Inc(ProgPos);
                              if ProgPos > ProgInt then
                                 begin
                                    pbStockBar.StepIt;
                                    ProgPos := 0;
                                 end;
                           end;
                        Close;
                        MyTable.Close;
                        MyTable.Open;
                        AddToDebugLogFile(WinData.KingData.Directory,'After Calving Details = '+IntToStr(MyTable.RecordCount));

                        // add lactation info for cows with calvings AFTER stock date - kr 8/8/00
                        SQL.Clear;
                        SQL.Add('SELECT DISTINCT E.AnimalID AID, MIN(E.EventDate) FirstCalving, MIN(E.AnimalLactNo) FirstLact');
                        SQL.Add('FROM '+BreedingDataHelper.TempCalvings.TableName+' E');
                        SQL.Add('WHERE (E.AnimalID NOT IN (SELECT DISTINCT AnimalID');
                        SQL.Add('                     	FROM StockOnHand');
                        SQL.Add('            	        WHERE (LastCalvingDate IS NOT NULL)))');
                        SQL.Add('GROUP BY AnimalID, EventDate, AnimalLactNo');

                        //   05/12/12 [V5.1 R3.5] /MK Bug Fix - Program was displaying the wrong LactNo for historical stock date.
                        //                                      if animal had 0 lact at the time of Stock Date.
                        SQL.Add('ORDER BY AnimalID, FirstLact Desc');

                        Open;
                        First;
                        while ( NOT(EOF) ) do
                           begin
                              if (MyTable.Locate('AnimalID',GenQuery.FieldByName('AID').AsInteger,[])) and
                                 (NOT(GenQuery.FieldByName('FirstLact').IsNull)) then
                                     if GenQuery.FieldByName('FirstLact').Asinteger > 0 then
                                        begin
                                           MyTable.Edit;
                                           MyTable.FieldByName('LactNo').AsInteger := (GenQuery.FieldByName('FirstLact').AsInteger - 1);
                                           MyTable.Post;
                                        end;
                              Next;
                           end;

                        MyTable.Close;
                        MyTable.Open;
                        AddToDebugLogFile(WinData.KingData.Directory,'After Calving Details After Stock Date = '+IntToStr(MyTable.RecordCount));
                     end;
                  end;

            // Delete female animals without drying off / in milk
            if (rgReportOn.ItemIndex = 4) then // in milk
               begin
                  // Delete if they DO NOT have a Calving event
                  {
                  SQL.Clear;
                  SQL.Add('DELETE FROM StockOnHand');
                  SQL.Add('WHERE NOT( AnimalID IN (');
                  SQL.Add(' SELECT AnimalID FROM Events');
                  SQL.Add(' WHERE ( StockOnHand.AnimalID=Events.AnimalID)');
                  SQL.Add(' AND   ( StockOnHand.LactNo=Events.AnimalLactNo)');
                  SQL.Add(' AND   ( EventType = ' + IntToStr(CCalvingEvent) + ')))');
                  // SQL.Add('AND   ( StockOnHand.LactNo >=1 )');
                  ExecSQL;
                  }

                  // Delete if they have a drying off event
                  SQL.Clear;
                  SQL.Add('DELETE FROM StockOnHand');
                  SQL.Add('WHERE ( AnimalID IN (');
                  SQL.Add(' SELECT AnimalID');
                  SQL.Add(' FROM '+BreedingDataHelper.TempDryingOffs.TableName+' E');
                  SQL.Add(' WHERE ( StockOnHand.AnimalID=E.AnimalID)');
                  SQL.Add(' AND   ( StockOnHand.LactNo=E.AnimalLactNo)');
                  //   25/11/15 [V5.5 R1.2] /MK Bug Fix - Showing in milk animals even if cows had dryoff events with DateRequired date.
                  SQL.Add(' AND   ( E.EventDate <= "' + FormatDateTime(cUSDateStyle,DateRequired.Date) + '")))');
                  SQL.Add('OR (LactNo <= 0)');
                  SQL.Add('OR (Breeding = False)');

                  MyTable.Close;
                  MyTable.Open;
                  AddToDebugLogFile(WinData.KingData.Directory,'After In Milk Query = '+IntToStr(MyTable.RecordCount));
                  ExecSQL;
               end
            Else
               if ( rgReportOn.ItemIndex = 5 ) then // Drying off animals
                  begin
                     SQL.Clear;
                     SQL.Add('DELETE FROM StockOnHand');
                     SQL.Add('WHERE NOT( AnimalID IN (');
                     SQL.Add(' SELECT AnimalID');
                     SQL.Add(' FROM '+BreedingDataHelper.TempDryingOffs.TableName+' E');
                     SQL.Add(' WHERE ( StockOnHand.AnimalID=E.AnimalID)');
                     SQL.Add(' AND   ( StockOnHand.LactNo=E.AnimalLactNo)');
                     //   25/11/15 [V5.5 R1.2] /MK Bug Fix - Not showing dry animals if they had dryoff events with DateRequired date.
                     SQL.Add(' AND   ( E.EventDate <= "' + FormatDateTime(cUSDateStyle,DateRequired.Date) + '")))');
                     SQL.Add('OR (Breeding = False)');
                     ExecSQL;

                     MyTable.Close;
                     MyTable.Open;
                     AddToDebugLogFile(WinData.KingData.Directory,'After Dry Query = '+IntToStr(MyTable.RecordCount));
                     ExecSQL;
                  end;
         end;
      AddToDebugLogFile(WinData.KingData.Directory,'-----------------------');
   finally
      if ( BreedingDataHelper <> nil ) then
         FreeAndNil(BreedingDataHelper);
   end;
end;

procedure TStockInHerdFilter.WhichDisplayTag;
begin
   (*
   with fmPurchSalesReport do
      if rgSTag.ItemIndex = 0 then
         begin
            lDisplayTag.Caption := 'Animal No.';
            QRDBText8.DataField := 'AnimalNo';

            { Column Header Band }
            qrPLine.Left := 219;
            lPurchases.Left := 380;
            qrPLine.Width :=  377;

            qrSLine.Left := 644;
            qrPLine.Width := 344;
            lSales.Left := 816;

            lSex.Left := 73;
            lBreed.Left := 108;
            lDob.Left := 156;
            lDate.Left := 219;
            lWeight.Left := 287;
            lPrice.Left := 339;
            lBuyer.Left := 397;
            qrlSupplier.Left := 481;
            lSDate.Left := 644;
            lSWeight.Left := 706;
            lSPrice.Left := 760;
            lSGrade.Left := 813;
            lSCustomer.Left := 855;
            lGrossMargin.Left := 994;

            { Detail Band }
            QRExpr11.Left := 73 ;
            qrDBBCode.Left := 108;
            qrDBDOB.Left := 156;
            qrDBPDate.Left := 219;
            qrDBWeight.Left := 287;
            qrDBPPrice.Left := 339;
            qrDBPBuyer.Left := 397;
            qrDBPSupplier.Left := 481;
            qrDBSDate.Left := 644;
            qrDBSWeight.Left := 706;
            qrDBSPrice.Left := 760;
            qrDBSGrade.Left := 813;
            qrDBSCustomer.Left := 855;
            Margin.Left := 994;

         end
      else
         begin
            lDisplayTag.Caption := 'Nat. Id. No.';
            QRDBText8.DataField := 'NatID';

            { Column Header Band }
            qrPLine.Left := 255;
            qrPLine.Width :=  384;
            lPurchases.Left := 396;

            qrSLine.Left := 652;
            qrPLine.Width :=  337;
            lSales.Left := 816;

            lSex.Left := 123;
            lBreed.Left := 154;
            lDob.Left := 200;
            lDate.Left := 255;
            lWeight.Left := 315;
            lPrice.Left := 365;
            lBuyer.Left := 417;
            qrlSupplier.Left := 501;
            lSDate.Left := 662;
            lSWeight.Left := 726;
            lSPrice.Left := 778;
            lSGrade.Left := 833;
            lSCustomer.Left := 875;
            lGrossMargin.Left := 1004;

            { Detail Band }
            QRExpr11.Left := 123;
            qrDBBCode.Left := 154;
            qrDBDOB.Left := 200;
            qrDBPDate.Left := 255;
            qrDBWeight.Left := 315;
            qrDBPPrice.Left := 365;
            qrDBPBuyer.Left := 417;
            qrDBPSupplier.Left := 501;
            qrDBSDate.Left := 662;
            qrDBSWeight.Left := 726;
            qrDBSPrice.Left := 778;
            qrDBSGrade.Left := 833;
            qrDBSCustomer.Left := 875;
            Margin.Left := 1004;
         end;

   with MyTable do
      begin
         First;
         while NOT ( MyTable.EOF ) do
            begin
               if rgSTag.ItemIndex = 0 then
                  begin
                     Edit;
                     MyTable.FieldByName('NatID').AsString := MyTable.FieldByName('AnimalNo').AsString;
                     Post;
                  end;
               Next;
            end;
      end;
   *)
end;

procedure TStockInHerdFilter.LoadPurchSaleDeathData; { SP 11/03/2003 }
var
   DupQuery : TQuery;
   DuplicateAnimals : TStringList;
   id, i, j : Integer;
   IdArray : array of Integer;
   PurchFound : Boolean;
   SaleFound : Boolean;

   EventDetailsArray : TEventDetailsArray;
   vEventDate, vString, vSold : Variant;
   PurchDate, SaleDate : TDateTime;
begin
   WinData.LookUpSaleDeath.Open;
   WinData.LookUpPurchases.Open;

   if ( FPurchSalesOptions.IncludeLastPurchaseDetails ) then
      begin
         SetLength(IdArray, 0);
         DuplicateAnimals := TStringList.Create;

         DupQuery := TQuery.Create(nil);
         try
            DupQuery.Databasename := AliasName;
            DupQuery.SQL.Add(InsertSELECT(['NatIDNum']));
            DupQuery.SQL.Add(InsertFROM(['Animals']));
            DupQuery.SQL.Add(InsertWHERE(['NatIDNum'], [':NatID']));

            pbReport.Visible := ( MyTable.RecordCount > 0 );
            if ( pbReport.Visible ) then
               begin
                  pbReport.Properties.Min := 1;
                  pbReport.Properties.Max := MyTable.RecordCount;
                  Application.ProcessMessages;
                  Update;
               end;

            MyTable.First;
            while NOT ( MyTable.EOF ) do
               begin
                  DupQuery.Close;
                  DupQuery.Params[0].AsString := MyTable.FieldByName('NatID').AsString;
                  DupQuery.Open;
                  try
                     DupQuery.First;
                     if (DupQuery.RecordCount>1) then
                        begin
                           if DuplicateAnimals.IndexOf( MyTable.FieldByName('NatID').AsString ) = -1 then
                              DuplicateAnimals.Add( MyTable.FieldByName('NatID').AsString );
                        end;
                  finally
                     DupQuery.Close;
                  end;
                  pbReport.Position := pbReport.Position + 1;
                  Application.ProcessMessages;
                  Update;
                  MyTable.Next;
               end;

            if ( DuplicateAnimals.Count > 0 ) then
               begin
                  pbReport.Properties.Min := 1;
                  pbReport.Properties.Max := DuplicateAnimals.Count;
                  pbReport.Position := 1;
                  Application.ProcessMessages;
                  Update;
                  for i := 0 to DuplicateAnimals.Count-1 do
                     begin
                        DupQuery.Close;
                        DupQuery.SQL.Clear;
                        DupQuery.SQL.Add('SELECT *');
                        DupQuery.SQL.Add('FROM '+MyTable.TableName);
                        DupQuery.SQL.Add('WHERE NatID = :NatID');
                        DupQuery.SQL.Add('ORDER By ID DESC');
                        DupQuery.Params[0].AsString := DuplicateAnimals[i];
                        DupQuery.Open;
                        if ( DupQuery.RecordCount = 0 ) then Continue;
                        DupQuery.First;
                        DupQuery.Next;
                        while ( not(DupQuery.Eof) ) do
                           begin
                              Id := DupQuery.FieldByName('ID').AsInteger;
                              with TQuery.Create(nil) do
                                 try
                                    DatabaseName := AliasName;
                                    SQL.Add(InsertDELETE(MyTable.TableName));
                                    SQL.Add(InsertWHERE(['NatID'],['"'+DuplicateAnimals.Strings[i]+'"']));
                                    SQL.Add(InsertAND(['ID'],[':Id'],opEquals));
                                    Params[0].AsInteger := Id;
                                    ExecSQL;
                                 finally
                                    Free;
                                 end;
                              DupQuery.Next;
                           end;
                        {
                        if MyTable.Locate('NatID', DuplicateAnimals.Strings[i], []) then
                           begin
                              id := MyTable.FieldByName('ID').AsInteger;
                              if ( id > 0 ) then
                                 begin
                                    with TQuery.Create(nil) do
                                       try
                                          DatabaseName := AliasName;
                                          SQL.Add(InsertDELETE(MyTable.TableName));
                                          SQL.Add(InsertWHERE(['NatID'],['"'+DuplicateAnimals.Strings[i]+'"']));
                                          SQL.Add(InsertAND(['ID'],[':Id'],opNOT));
                                          Params[0].AsInteger := Id;
                                          //ShowMessage(SQl.Text);
                                          ExecSQL;

                                          MyTable.Refresh;
                                       finally
                                          Free;
                                       end;
                                 end;

                              // now we need to select from the database all movement events relating NatID

                              // 1. Get the ID of all tags = DuplicateAnimals.Strings[i] from animals table.
                              with TQuery.Create(nil) do
                                 try
                                    DatabaseName := AliasName;
                                    SQL.Clear;
                                    SQL.Add(InsertSELECT(['ID']));
                                    SQL.Add(InsertFROM(['Animals']));
                                    SQL.Add(InsertWHERE(['NatIdNum'],[':NatIDNum']));
                                    SQL.Add(InsertAND(['AnimalDeleted'],['False']));
                                    Params[0].AsString := DuplicateAnimals.Strings[i];
                                    Open;
                                    try
                                       First;

                                       //   07/05/14 [V5.3 R0.0] /MK Bug Fix - Set IdArray back to zero for each animal in DuplicateAnimals.Strings.
                                       //                                      Program was adding to each animal from DuplicateAnimals.Strings to this array
                                       //                                      and always returning all events of these animals instead of just the events
                                       //                                      of the two ids for DuplicateAnimals.Strings.
                                       SetLength(IdArray,0);

                                       while not eof do
                                          begin
                                             SetLength(IdArray, Length(IdArray)+1);
                                             IdArray[Length(IdArray)-1] := Fields[0].AsInteger;
                                             Next;
                                          end;
                                    finally
                                       Close;
                                    end;
                                 finally
                                    Free;
                                 end;

                              // 2. now retrieve all events belonging to Ids contained in IdArray
                              with TQuery.Create(nil) do
                                 try
                                    DatabaseName := AliasName;
                                    SQL.Clear;
                                    SQL.Add(InsertSELECT(['ID', 'AnimalID', 'EventType','EventDate']));
                                    SQL.Add(InsertFROM(['Events']));
                                    SQL.Add('WHERE AnimalID IN '+IntArrayToSQLInString(IdArray));
                                    SQL.Add('AND EventType IN (11,12)');
                                    SQL.Add(InsertORDER(['EventDate']));
                                    Open;
                                    try
                                       First;

                                       if ( FieldByName('EventType').AsInteger = cPurchaseEvent ) then
                                          begin
                                             EventDetailsArray := HerdLookup.GetEventDetails(FieldByName('AnimalID').AsInteger,cPurchaseEvent);
                                             for j := Low(EventDetailsArray) to High(EventDetailsArray) do
                                                begin
                                                   vEventDate := EventDetailsArray[j].Event[3];
                                                   if not VarIsNull(vEventDate) then
                                                      begin
                                                         PurchDate := vEventDate;

                                                         MyTable.Edit;
                                                         MyTable.FieldByName('PreloadedPurchSalesInfo').AsBoolean := True;
                                                         MyTable.FieldByName('PurchDate').Value := PurchDate;
                                                         MyTable.FieldByName('SupplierID').Value := EventDetailsArray[j].SubEvent[1];
                                                         MyTable.FieldByName('PurchPrice').Value := EventDetailsArray[j].SubEvent[2];
                                                         MyTable.FieldByName('PurchWeight').Value := EventDetailsArray[j].SubEvent[3];
                                                         MyTable.FieldByName('BuyerID').Value := EventDetailsArray[j].SubEvent[5];
                                                         if not MyTable.FieldByName('SupplierID').IsNull then
                                                            begin
                                                               if WinData.Suppliers.Locate('ID',WinData.LookUpPurchases.FieldByName('Supplier').AsInteger,[]) then
                                                                  MyTable.FieldByName('Supplier').AsString := WinData.Suppliers.FieldByName('Name').AsString;
                                                            end;
                                                         if not MyTable.FieldByName('BuyerID').IsNull then
                                                            begin
                                                               if WinData.Buyers.Locate('ID',WinData.LookUpPurchases.FieldByName('Buyer').AsInteger,[]) then
                                                                  MyTable.FieldByName('Buyer').AsString := WinData.Buyers.FieldByName('Name').AsString;
                                                            end;
                                                         MyTable.Post;
                                                      end;
                                                end;
                                          end;

                                       if (RecordCount>1) then
                                          Last;

                                       if ( FieldByName('EventType').AsInteger = cSaleDeathEvent ) then
                                          begin
                                             EventDetailsArray := HerdLookup.GetEventDetails(FieldByName('AnimalID').AsInteger,cSaleDeathEvent);
                                             for j := Low(EventDetailsArray) to High(EventDetailsArray) do
                                                begin
                                                   vSold := EventDetailsArray[j].SubEvent[1];
                                                   if not VarIsNull(vSold) then
                                                      begin
                                                         MyTable.Edit;
                                                         MyTable.FieldByName('PreloadedPurchSalesInfo').AsBoolean := True;
                                                         MyTable.FieldByName('SalesDate').Value := EventDetailsArray[j].Event[3];

                                                         MyTable.FieldByName('SalesGrade').Value := EventDetailsArray[j].SubEvent[5];

                                                         if ( FPurchSalesOptions.IncludeLiveWeight ) then
                                                            MyTable.FieldByName('SalesWeight').Value :=  EventDetailsArray[j].SubEvent[4]
                                                         else if ( FPurchSalesOptions.IncludeDeadWeight ) then
                                                            MyTable.FieldByName('SalesWeight').Value := EventDetailsArray[j].SubEvent[7];

                                                         MyTable.FieldByName('SalesPrice').Value := EventDetailsArray[j].SubEvent[3];
                                                         MyTable.FieldByName('CustomerID').Value := EventDetailsArray[j].SubEvent[2];
                                                         if WinData.Customers.Locate('ID',MyTable.FieldByName('CustomerID').AsInteger,[]) then
                                                            MyTable.FieldByName('Customer').AsString := WinData.Customers.FieldByName('Name').AsString;
                                                         MyTable.Post;
                                                      end;
                                                end;
                                          end;
                                    finally
                                       Close;
                                    end;
                                 finally
                                    Free;
                                 end;
                           end;
                        }
                        pbReport.Position := pbReport.Position + 1;
                        Application.ProcessMessages;
                        Update;
                     end;
               end;
         finally
            if ( DupQuery <> nil ) then
               begin
                  DupQuery.Close;
                  FreeAndNil(DupQuery);
               end;
         end;
      end;

   WinData.MovementDataHelper.CreateTempMovementEventTables;
   if ( not(WinData.MovementDataHelper.TempPurchEvents.Active) ) then
      WinData.MovementDataHelper.TempPurchEvents.Active := True;
   if ( not(WinData.MovementDataHelper.TempSaleEvents.Active) ) then
      WinData.MovementDataHelper.TempSaleEvents.Active := True;

   pbReport.Visible := ( MyTable.RecordCount > 0 );
   if ( pbReport.Visible ) then
      begin
         pbReport.Properties.Min := 1;
         pbReport.Properties.Max := MyTable.RecordCount;
         pbReport.Position := 1;
         Application.ProcessMessages;
         Update;
      end;
   with MyTable do
      begin
         First;
         while NOT ( MyTable.EOF ) do
            begin
               if not(MyTable.FieldByName('PreloadedPurchSalesInfo').AsBoolean) then
                  begin
                     Edit;
                     if WinData.MovementDataHelper.TempPurchEvents.Locate('AnimalId', FieldByName('AnimalId').AsInteger,[] ) then
                         begin
                            Fieldbyname('PurchDate').AsDateTime := Windata.MovementDataHelper.TempPurchEvents.FieldByName('EventDate').AsDateTime;
                            if WinData.LookUpPurchases.Locate('EventID', Windata.MovementDataHelper.TempPurchEvents.FieldByName('EventID').AsInteger,[]) then
                               begin
                                    FieldByName('PurchGrade').AsString := WinData.LookUpPurchases.FieldByName('Grade').AsString;
                                    FieldByName('PurchWeight').AsFloat := WinData.LookUpPurchases.FieldByName('Weight').AsFloat;
                                    FieldByName('PurchPrice').AsFloat := WinData.LookUpPurchases.FieldByName('Price').AsFloat;
                                    FieldByName('SupplierID').AsInteger := WinData.LookUpPurchases.FieldByName('Supplier').AsInteger;

                                    if WinData.Suppliers.Locate('ID',WinData.LookUpPurchases.FieldByName('Supplier').AsInteger,[]) then
                                       FieldByName('Supplier').AsString := WinData.Suppliers.FieldByName('Name').AsString;
                                    if WinData.Buyers.Locate('ID',WinData.LookUpPurchases.FieldByName('Buyer').AsInteger,[]) then
                                       FieldByName('Buyer').AsString := WinData.Buyers.FieldByName('Name').AsString;
                               end;
                         end
                     else
                        //   13/11/14 [V5.3 R8.9] /MK Change - If not purchase date found then PurchDate in TempTable should be null.
                        Fieldbyname('PurchDate').AsVariant := Null;

                     //   16/08/19 [V5.9 R0.0] /MK Change - As we already have the sale date locate TempSaleEvents by sale date to remove pre-sale events also.
                     // Lookup the Sales Event
                     if ( WinData.MovementDataHelper.TempSaleEvents.Locate('AnimalId;EventDate', VarArrayOf([MyTable.FieldByName('AnimalId').AsInteger,MyTable.FieldByName('SalesDate').AsDateTime]),[]) ) or
                        ( WinData.MovementDataHelper.TempSaleEvents.Locate('AnimalId', MyTable.FieldByName('AnimalId').AsInteger,[]) ) then
                        begin
                           FieldByName('SalesDate').AsDateTime := WinData.MovementDataHelper.TempSaleEvents.FieldByName('EventDate').AsDateTime;
                           if WinData.LookUpSaleDeath.Locate('EventID',WinData.MovementDataHelper.TempSaleEvents.FieldByName('EventID').AsInteger,[]) then
                              begin
                                 FieldByName('SalesGrade').AsString := WinData.LookUpSaleDeath.FieldByName('Grade').AsString;

                                 if ( FPurchSalesOptions.IncludeLiveWeight ) then // SP 07/08/09
                                    FieldByName('SalesWeight').AsFloat := WinData.LookUpSaleDeath.FieldByName('Weight').AsFloat
                                 else if ( FPurchSalesOptions.IncludeDeadWeight ) then
                                    FieldByName('SalesWeight').AsFloat := WinData.LookUpSaleDeath.FieldByName('ColdDeadWt').AsFloat;

                                 FieldByName('SalesPrice').AsFloat := WinData.LookUpSaleDeath.FieldByName('Price').AsFloat;
                                 FieldByName('CustomerID').AsInteger := WinData.LookUpSaleDeath.FieldByName('Customer').AsInteger;
                                 if WinData.Customers.Locate('ID',WinData.LookUpSaleDeath.FieldByName('Customer').AsInteger,[]) then
                                    FieldByName('Customer').AsString := WinData.Customers.FieldByName('Name').AsString;
                              end;
                        end
                     else
                        //   13/11/14 [V5.3 R8.9] /MK Change - If not sales date found then SalesDate in TempTable should be null.
                        FieldByName('SalesDate').AsVariant := Null;
                     Post;
                  end;
               pbReport.Position := pbReport.Position + 1;
               Application.ProcessMessages;
               Update;
               Next;
            end;
      end;
   WinData.LookUpSaleDeath.Close;
   WinData.LookUpPurchases.Close;
end;

procedure TStockInHerdFilter.AddAnimalInfo;
var
   i : Integer;
begin
    for i := 0 to WinData.AnimalFileByID.SQL.Count-1 do
       if ( POS('WHERE',WinData.AnimalFileById.SQL.Strings[i] ) <> 0 ) or
          ( POS('AND',WinData.AnimalFileById.SQL.Strings[i] ) <> 0 ) then
          qStockOnHand.SQL.Add(WinData.AnimalFileById.SQL.Strings[i]);
end;

procedure TStockInHerdFilter.ViewBtnClick(Sender: TObject);
var
  WhereIn, Proceed : Boolean;
  I, Start, Stop: Integer;
  GroupsToCheck : String;
  CurrAID : SmallInt;
  TempStr : String;
  TempDate : TDateTime;
  IHMAnimals : String;
  IHMMovements : Boolean;
  slDebugFile : TStringList;

  //   05/10/15 [V5.4 R9.4] /MK Bug Fix - This function was using the Sale date components not the Purchase date components.
  function AddPurchDateFilter : String;
  begin
     Result := '';
     if ( FromPurchDate.Date <> 0 ) And ( ToPurchDate.Date <> 0 ) then
        Result := ('( PurchDate Between "' + FormatDateTime(cUSDateStyle,FromPurchDate.Date) + '" And "' + FormatDateTime(cUSDateStyle,ToPurchDate.Date) + '")')
     else if ( FromPurchDate.Date = 0 ) and ( ToPurchDate.Date > 0 ) then
        Result := ('( PurchDate IS NOT NULL AND PurchDate <"' + FormatDateTime(cUSDateStyle,ToPurchDate.Date) + '")')
     else if ( FromPurchDate.Date > 0 ) and ( ToPurchDate.Date = 0 ) then
        Result := ('( PurchDate > "' + FormatDateTime(cUSDateStyle,FromPurchDate.Date) + '" AND PurchDate IS NOT NULL)')
     else if ( FromPurchDate.Date = 0 ) and ( ToPurchDate.Date = 0 ) then
        Result := ('( PurchDate IS NOT NULL)');
  end;

  function GetDeadAnimals : PIntegerArray;
  var
     qDeadAnimals : TQuery;
  begin
     SetLength(Result,0);
     qDeadAnimals := TQuery.Create(nil);
     with qDeadAnimals do
        try
           DatabaseName := AliasName;
           SQL.Clear;
           SQL.Add('SELECT Distinct(A.ID)');
           SQL.Add('FROM Animals A');
           SQL.Add('LEFT JOIN Events E On (E.AnimalID = A.ID)');
           SQL.Add('LEFT JOIN SalesDeaths S ON (S.EventID = E.ID)');
           SQL.Add('WHERE S.Sold = FALSE');
           try
              Open;
              First;
              while ( not(Eof) ) do
                 begin
                    SetLength(Result,Length(Result)+1);
                    Result[Length(Result)-1] := Fields[0].AsInteger;
                    Next;
                 end;
           except
              on e : Exception do
                 ShowMessage(e.Message);
           end;
        finally
           Free;
        end;
  end;

begin

   WinData.cxHint.HideHint;
   WinData.CanShowStandardReportHint := False;

   try
      Proceed := False;
      SetHerdType;
      if pPremiums.Visible then
         try
            fmPremiumReport := TfmPremiumReport.Create(Self);
            qStockOnHand.Close;
            qStockOnHand.SQL.Clear;
            fmPremiumReport.PremVerLabel.Caption := 'Herd Management ' + HerdVerNo; // Added 11/12/98 - FK
            sbView.Enabled := False;
            sbPrint.Enabled := False;

            if rgpremtype.ItemIndex = 0 then
               begin
                  Case DateGroup.itemIndex Of
                     0 : Begin
                            qStockOnHand.sql.Clear;
                            { SP 15/10/2002 modified }
                            qStockOnHand.sql.Add('SELECT DISTINCT B.PremiumType, B.EligibilityDate, B.ApplicationDate, A."Date", A.Description, ');
                            qStockOnHand.sql.Add('                AN.AnimalNo, AN.SortAnimalNo, AN.NatIDNum, AN.SortNatID, AN.DateOfBirth, O.HerdIdentity ');
                            qStockOnHand.sql.Add('FROM BeefSub B                                                  ');
                            qStockOnHand.sql.Add('LEFT JOIN Applications A ON (A.ApplicationID=B.ApplicationID)   ');
                            qStockOnHand.sql.Add('LEFT JOIN Animals AN     ON (AN.ID=B.AnimalID)                  ');
                            qStockOnHand.sql.Add('LEFT JOIN Owners O       ON (A.HerdID=O.ID)                     ');
                            qStockOnHand.SQL.Add('WHERE ( NOT (AN.HerdID = ' + IntToStr(WinData.NONEHerdID) + ')) ');
                            qStockOnHand.SQL.Add('AND ( AN.AnimalDeleted = FALSE )');
                            if ( Length(ComboHerd.Value) > 0 ) then
                               qStockOnHand.SQL.ADD(' AND ( AN.HerdID = "' + ComboHerd.Value + '" )');
                            if ( Length(AppDate.Value) = 0 ) then
                               Begin
                                  Proceed := False;
                                  AppDate.SetFocus;
                               End
                            Else
                               Begin
                                  Proceed := True;
                                  qStockOnHand.SQL.ADD(' AND ( A.ApplicationID = "' + AppDate.Value + '" )');
                                  case rgSortBy.ItemIndex of
                                     0 : begin // Sort By Animal No
                                            qStockOnHand.SQL.ADD(' ORDER BY AN.SortAnimalNo');
                                            fmPremiumReport.PremSortLabel.Caption := 'Ordered By Animal Number';
                                         end;
                                     1 : begin //Sort By national ID
                                            qStockOnHand.SQL.ADD(' ORDER BY AN.SortNatID');
                                            fmPremiumReport.PremSortLabel.Caption := 'Ordered By National ID Number';
                                         end;
                                     2 : begin // Sort By Purchase Date
                                            qStockOnHand.SQL.ADD(' ORDER BY AN.DateOfBirth');
                                            fmPremiumReport.PremSortLabel.Caption := 'Ordered By Date Of Birth';
                                         end;
                                  end;
                                  fmPremiumReport.PremDateType.Caption := 'Application Date: ' + AppDate.Text;
                               End;
                         End;
                     1 : Begin
                            Proceed := True;
                            MyTable := TTable.Create(nil);
                            CreatePremTable;
//                            fApplications.RunApplicQuery(MyTable, GenQuery, EligibilityDate.Date, ComboHerd.Value, Report, cbToBeAppliedFor.Checked  );
                            if cbToBeAppliedFor.Checked then
                               begin
                                  qStockOnHand.sql.Add('SELECT DISTINCT AID, AnimalCode AnimalNo, SortAnimalNo, NatId NatIDNum, SortNatID, DOB DateOfBirth, Herd HerdIdentity, TestEligDate EligibilityDate, PremiumType');
                                  qStockOnHand.sql.Add('FROM TempPrm');
                                  fmPremiumReport.qrApplicDate.Enabled := FALSE;
                               end
                            else
                               begin
                                  qStockOnHand.sql.Add('SELECT DISTINCT AID, AnimalCode AnimalNo, SortAnimalNo, NatId NatIDNum, SortNatID, DOB DateOfBirth, Herd HerdIdentity,');
                                  qStockOnHand.sql.Add('TestEligDate EligibilityDate, PremiumType, b.ApplicationDate');
                                  qStockOnHand.sql.Add('FROM TempPrm, "beefsub.db" b,"applications.db" a');
                                  qStockOnHand.sql.Add('WHERE (b.applicationID = a.ApplicationID)');
                                  qStockOnHand.sql.Add('AND (TempPrm.AID = b.AnimalID)');
                                  qStockOnHand.sql.Add('AND (TempPrm.PremiumType = b.PremiumType)');
                                  fmPremiumReport.qrApplicDate.Enabled := TRUE;
                               end;
                            case RgSortBy.ItemIndex of
                               0 : begin // Sort By Animal No
                                      qStockOnHand.SQL.ADD('ORDER BY SortAnimalNo');
                                      fmPremiumReport.PremSortLabel.Caption := 'Ordered By Animal Number';
                                   end;
                               1 : begin //Sort By national ID
                                      qStockOnHand.SQL.ADD('ORDER BY SortNatID');
                                      fmPremiumReport.PremSortLabel.Caption := 'Ordered By National ID Number';
                                   end;
                               2 : begin // Sort By Purchase Date
                                      qStockOnHand.SQL.ADD('ORDER BY DateOfBirth');
                                      fmPremiumReport.PremSortLabel.Caption := 'Ordered By Date Of Birth';
                                   end;
                               3 : begin // Sort By PremiumType
                                      qStockOnHand.SQL.ADD('ORDER BY PremiumType');
                                      fmPremiumReport.PremSortLabel.Caption := 'Ordered By Premium Type';
                                   end;
                            end;
                            fmPremiumReport.PremDateType.Caption := 'Eligibility Date: ' + EligibilityDate.Text;
                         End;
                  End;

                  If Proceed = True Then
                     Begin
                        case rgSortOrder.ItemIndex of
                           0  : begin
                                   qStockOnHand.SQL.Add(' Asc');
                                   fmPremiumReport.PremOrderLabel.Caption := 'In Ascending Order';
                                end;
                           1  : begin
                                   qStockOnHand.SQL.Add(' Desc');//desceding
                                   fmPremiumReport.PremOrderLabel.Caption := 'In Descending Order';
                                end;
                        end;
                        qStockOnHand.Open;
                        if ( Sender as TRxSpeedButton ).Name = 'sbView' then
                           Begin
                              fmPremiumReport.PremRptTitle.Font.Color := ClRed;
                              fmPremiumReport.PremRepFirstPrem.Font.Color := clgreen;
                              fmPremiumReport.PremDetail.Font.color := clNavy;

                              fmPremiumReport.PremiumScr.Preview;
                           End
                        else
                           begin
                              fmPremiumReport.PremRptTitle.Font.Color := ClBlack;
                              fmPremiumReport.PremRepFirstPrem.Font.Color := clblack;
                              fmPremiumReport.PremDetail.Font.color := clblack;
                              Windata.CallPrintDialog(fmPremiumReport.PremiumScr);
                           End;
                     End;
               end
            else
               begin
                  case DateGroup.ItemIndex of
                     0 : with qStockOnHand do
                            begin
                               SQL.Clear;
                               SQL.Add('DELETE FROM SuckPrem ');
                               ExecSQL;

                               SQL.Clear;
                               SQL.Add('INSERT INTO SuckPrem ');
                               SQL.Add('                (AnimalID, NatIDNum, SortNatID, AnimalNo, SortAnimalNo, DOB, InHerd, CurrLact, Breed, ');
                               SQL.Add('                 ApplicationDate, Description, RetensionDate, ApplicLact, YearOfApplic ) ');
                               SQL.Add('SELECT DISTINCT A.ID, A.NatIDNum, A.SortNatID, A.AnimalNo, A.SortAnimalNo, A.DateOfBirth, A.InHerd, A.LactNo, B.Code, ');
                               SQL.Add('                S2.DateOfApplic, S2.Description, S.RetensionDate, S.LactNo, S2.YearOfApplic ');
                               SQL.Add('FROM Animals A                                           ');
                               SQL.Add('LEFT JOIN sAppliedFor S        ON (S.AnimalID=A.ID)      ');
                               SQL.Add('LEFT JOIN SApplic S2           ON (S2.ID=S.ApplicationID)');
                               SQL.Add('LEFT JOIN Breeds B             ON (B.ID=A.PrimaryBreed)  ');
                               if AppDate.Value <> '' then
                                  SQL.Add('WHERE (S2.ID = '+AppDate.Value+')                     ')
                               else
                                  SQL.Add('WHERE (S2.ID > "0")                                   ');
                               SQL.Add('AND (S2.HerdID = "' + ComboHerd.Value + '" )             ');
                               ExecSQL;
                               if SuckTable.RecordCount > 0 then
                                  begin
                                     proceed := True;
                                     with SuckTable do
                                        begin
                                           First;
                                           While NOT EOF do
                                              begin
                                                 // Get the Last Calving for each animal before the Cow Suck Applic Date
                                                 GenQuery.SQL.Clear;
                                                 GenQuery.SQL.Add('SELECT MAX(EventDate) LastCalvingDate FROM Events ');
                                                 GenQuery.SQL.Add('WHERE (AnimalID = '+IntToStr(SuckTable.FieldByName('AnimalID').AsInteger)+')');
//                                                 GenQuery.SQL.Add('AND   (EventDate < "' + FormatDateTime(cUSDateStyle,SuckTable.FieldByName('ApplicationDate').AsDateTime) + '")');
                                                 GenQuery.SQL.Add('AND   (EventType = '+IntToStr(CCalvingEvent)+')');
                                                 GenQuery.Open;
                                                 if GenQuery.FieldByName('LastCalvingDate').AsDateTime > 0 then
                                                    begin
                                                       SuckTable.Edit;
                                                       SuckTable.FieldByName('LastCalvingDate').AsDateTime := GenQuery.FieldByName('LastCalvingDate').AsDateTime;
                                                       SuckTable.Post;
                                                    end;
                                                 Next;
                                              end;
                                        end;
                                  end
                               else
                                  begin
                                     Proceed := False;
                                     AppDate.SetFocus;
                                  end;
                            end;
                     1 : with qStockOnHand do
                            begin
                               SQL.Clear;
                               SQL.Add('DELETE FROM SuckPrem ');
                               ExecSQL;

                               // All eligible Animals
                               EightMonth := FormatDateTime(cUSDateStyle,IncMonth(Date,-8));
                               CurrYear   := FormatDateTime('yyyy', Date);

                               SQL.Clear;
                               SQL.Add('INSERT INTO SuckPrem (AnimalID, NatIDNum, SortNatID, AnimalNo, SortAnimalNo, DOB, CurrLact, Breed) ');
                               SQL.Add('SELECT DISTINCT       A.ID, A.NatIDNum, A.SortNatID, A.AnimalNo, A.SortAnimalNo, A.DateOfBirth, A.LactNo, B.Code ');
                               SQL.Add('FROM Animals A ');
                               SQL.Add('LEFT JOIN Breeds B ON (B.ID=A.PrimaryBreed)  ');
                               SQL.Add('WHERE (A.DateOfBirth <= "' + EightMonth + '")');
                               SQL.Add('AND   (A.NatIdNum IS NOT NULL)');
                               SQL.Add('AND   (A.AnimalDeleted=FALSE)');
                               SQL.Add('AND   (A.Sex="Female")');
                               SQL.Add('AND   (A.InHerd=TRUE)');
                               SQL.Add('AND   (B.EligibleForPremium=TRUE)');
                               SQL.Add('AND   (A.ID NOT IN (SELECT DISTINCT S.AnimalID FROM sAppliedFor S ');
                               SQL.Add('                    WHERE (EXTRACT(Year FROM S.ApplicationDate)) ="'+CurrYear+'"))');
                               SQL.Add('AND   (A.HerdID= ' + (ComboHerd.Value) + ')');
                               ExecSQL;

                               if SuckTable.RecordCount > 0 then
                                  begin
                                     proceed := True;
                                     with SuckTable do
                                        begin
                                           First;
                                           While NOT EOF do
                                              begin
                                                 // Get the Last Calving for each animal before the Cow Suck Applic Date
                                                 GenQuery.SQL.Clear;
                                                 GenQuery.SQL.Add('SELECT MAX(EventDate) LastCalvingDate FROM Events ');
                                                 GenQuery.SQL.Add('WHERE (AnimalID = '+IntToStr(SuckTable.FieldByName('AnimalID').AsInteger)+')');
//                                                 GenQuery.SQL.Add('AND   (EventDate < "' + FormatDateTime(cUSDateStyle,SuckTable.FieldByName('ApplicationDate').AsDateTime) + '")');
                                                 GenQuery.SQL.Add('AND   (EventType = '+IntToStr(CCalvingEvent)+')');
                                                 GenQuery.Open;
                                                 if GenQuery.FieldByName('LastCalvingDate').AsDateTime > 0 then
                                                    begin
                                                       SuckTable.Edit;
                                                       SuckTable.FieldByName('LastCalvingDate').AsDateTime := GenQuery.FieldByName('LastCalvingDate').AsDateTime;
                                                       SuckTable.Post;
                                                    end;
                                                 Next;
                                              end;
                                        end;
                                  end
                               else
                                  begin
                                     Proceed := False;
                                     MessageDlg('There are no eligle animals found for Suckler Cow Replacements',mtINformation,[mbOk],0);
                                  end;
                            end;
                  end;

                  if Proceed then
                     begin
                        Try
                           Application.CreateForm(TfSuckPremReport, fSuckPremReport);
                           fSuckPremReport.CowPremiumScr.DataSet := GenQuery;

                           With GenQuery do
                              begin
                                 SQL.Clear;
                                 SQL.Add('SELECT * FROM '+SuckTable.TableName+'');
                                 case RgSortBy.ItemIndex of
                                    0 : begin // Sort By Animal No
                                           SQL.ADD('ORDER BY SortAnimalNo');
                                           Case DateGroup.ItemIndex of
                                              0 : fSuckPremReport.PremSortLabel.Caption := 'Animal Number'; { 1) 13/09/02 SP - }
                                              1 : fSuckPremReport.PremSortLabel2.Caption := 'Animal Number'; { 1) 13/09/02 SP - }
                                           end;
                                        end;
                                    1 : begin //Sort By national ID
                                           SQL.ADD('ORDER BY SortNatID');
                                           Case DateGroup.ItemIndex of
                                              0 : fSuckPremReport.PremSortLabel.Caption := 'National ID Number'; { 1) 13/09/02 SP - }
                                              1 : fSuckPremReport.PremSortLabel2.Caption := 'National ID Number';{ 1) 13/09/02 SP - }
                                           end;
                                        end;
                                    2 : begin
                                           SQL.ADD('ORDER BY DOB');
                                           Case DateGroup.ItemIndex of
                                              0 : fSuckPremReport.PremSortLabel.Caption := 'Date Of Birth'; { 1) 13/09/02 SP - }
                                              1 : fSuckPremReport.PremSortLabel2.Caption := 'Date Of Birth'; { 1) 13/09/02 SP - }
                                           end;
                                        end;
                                    3 : begin
                                           SQL.ADD('ORDER BY LastCalvingDate');
                                           Case DateGroup.ItemIndex of
                                              0 : fSuckPremReport.PremSortLabel.Caption := 'Last Calving Date'; { 1) 13/09/02 SP - }
                                              1 : fSuckPremReport.PremSortLabel2.Caption := 'Last Calving Date'; { 1) 13/09/02 SP - }
                                           end;
                                        end;
                                 end;
                                 case rgSortOrder.ItemIndex of
                                    0  : begin
                                            qStockOnHand.SQL.Add(' Asc');
                                            Case DateGroup.ItemIndex of
                                               0 : fSuckPremReport.PremOrderLabel.Caption := 'Ascending'; { 1) 13/09/02 SP - }
                                               1 : fSuckPremReport.PremOrderLabel2.Caption := 'Ascending'; { 1) 13/09/02 SP - }
                                            end;
                                         end;
                                    1  : begin
                                            qStockOnHand.SQL.Add(' Desc');//desceding
                                            Case DateGroup.ItemIndex of
                                               0 : fSuckPremReport.PremOrderLabel.Caption := 'Descending'; { 1) 13/09/02 SP - }
                                               1 : fSuckPremReport.PremOrderLabel2.Caption := 'Descending'; { 1) 13/09/02 SP - }
                                            end;
                                         end;
                                 end;
                                 Open;
                              end;

                           fSuckPremReport.PremVerLabel.Caption := 'Herd Management ' + HerdVerNo; // Added 11/12/98 - FK

                           Case DateGroup.ItemIndex of
                              0 : if ( Sender as TRxSpeedButton ).Name = 'sbView' then
                                     fSuckPremReport.CowPremiumScr.Preview
                                  else
                                     Windata.CallPrintDialog(fSuckPremReport.CowPremiumScr);
                              1 : if ( Sender as TRxSpeedButton ).Name = 'sbView' then
                                     fSuckPremReport.EligibleReplace.Preview
                                  else
                                     Windata.CallPrintDialog(fSuckPremReport.EligibleReplace);
                           end;

                        except
                           MessageDlg('Unable to process report, contact Kingswood',mtError,[mbOK],0);
                        end;

                     end;
               end;
         finally
            if ((DateGroup.itemIndex = 1) AND (rgpremtype.ItemIndex = 0))  then
               begin
                  MyTable.Close;
                  MyTable.DeleteTable;
                  MyTable.Free;
                  sbView.Enabled := True;
                  sbPrint.Enabled := True;
               end;
            fmPremiumReport.Free;
         end
      else if pStockOnHand.Visible then
         begin



            fmStockOnHandReport := TfmStockOnHandReport.Create(nil);
            if NOT(rgReportOn.ItemIndex in ([4, 5])) then
               if DateRequired.Date > Date then
                  begin
                     MessageDlg('Stock date cannot be after today, resetting to Today',mtError,[mbok],0);
                     DateRequired.Date := Date;
                     Abort;
                  end;
            sbView.Enabled := False;
            sbPrint.Enabled := False;
            pbStockBar.Show;
            pbStockBar.Min := 0;

            fmStockOnHandReport.VerLabel.Caption := 'Herd Management ' + HerdVerNo; // Added 11/12/98 - FK
            fmStockOnHandReport.lRepDate.Caption := DateRequired.Text;

            qStockOnHand.sql.Clear;
            qStockOnHand.Close;
            qStockOnHand.sql.Add('DELETE FROM StockOnHand');
            qStockOnHand.ExecSQL;

            pbStockBar.Position := 2;
            qStockOnHand.Sql.Clear;
            qStockOnHand.Sql.Add('INSERT INTO StockOnHand (AnimalNo, SortAnimalNo, ');
            qStockOnHand.Sql.Add('                         AnimalID, LactNo, NatID, ');
            qStockOnHand.Sql.Add('                         SortNatId, Sex, BreedCode, ');
            qStockOnHand.Sql.Add('                         DOB, Breeding, QualityAssured, SireCode, DamID, DamCode) ');
            qStockOnHand.sql.Add('SELECT DISTINCT A.AnimalNo, A.SortAnimalNo, A.ID, ');
            qStockOnHand.sql.Add('                A.Lactno, A.NatIDNum, A.SortNatID, ');
            qStockOnHand.Sql.Add('                A.Sex, B.Code, A.DateOfBirth, A.Breeding, A.QualityAssured,');
            qStockOnHand.sql.Add('                ASire.AnimalNo, AA.NatIDNum, AA.AnimalNo');
            qStockOnHand.sql.Add('FROM Animals A');
            qStockOnHand.SQL.Add('LEFT JOIN Breeds B      ON (A.PrimaryBreed=B.ID)');
            qStockOnHand.SQL.Add('LEFT JOIN Animals ASire ON (A.SireID=ASire.ID)  ');
            qStockOnHand.SQL.Add('LEFT JOIN Animals AA    ON (A.DamID = AA.ID)    ');
            if cbUseFilter.Checked then
               qStockOnHand.SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (A.ID=FA.AID)');
            qStockOnHand.SQL.Add('WHERE (NOT( A.HerdID = ' + IntToStr(WinData.NONEHerdID) + '))');
            qStockOnHand.SQL.ADD('AND (A.AnimalDeleted = FALSE)');
            if ( FromDOB.Date <> 0 ) And ( ToDOB.Date <> 0 ) Then
               qStockOnHand.SQL.Add('And (A.DateOfBirth Between ' + '''' + FormatDateTime(cUSDateStyle,FromDOB.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToDOB.Date) + '''' + ')')
            else if ( FromDOB.Date <> 0 ) and ( ToDOB.Date <= 0 ) Then
               qStockOnHand.SQL.Add('And (A.DateOfBirth > ' + '''' + FormatDateTime(cUSDateStyle,FromDOB.Date) + '''' + ') ')
            else if ( FromDOB.Date <= 0 ) and ( ToDOB.Date <> 0 ) Then
               qStockOnHand.SQL.Add('And (A.DateOfBirth < ' + '''' + FormatDateTime(cUSDateStyle,ToDOB.Date) + '''' + ') ');

            case rgReportOn.ItemIndex of
               0 : begin //
                      qStockOnHand.SQL.ADD('AND (A.Sex <> "Female")');
                      fmStockOnHandReport.TypeLabel.Caption := 'Stock On Hand Report Of Males';
                   end;
               1 : begin //
                      qStockOnHand.SQL.ADD('AND (A.Sex = "Bull")');
                      fmStockOnHandReport.TypeLabel.Caption := 'Stock On Hand Report Of Bulls';
                   end;
               2 : begin //
                      qStockOnHand.SQL.ADD('AND (A.Sex = "Steer")');
                      fmStockOnHandReport.TypeLabel.Caption := 'Stock On Hand Report Of Steers';
                   end;
               3 : begin //
                      qStockOnHand.SQL.ADD('AND (A.Sex = "Female")');
                      fmStockOnHandReport.TypeLabel.Caption := 'Stock On Hand Report Of Females';
                   end;
               4 : begin //
                      qStockOnHand.SQL.ADD('AND (A.Sex = "Female")');
                      fmStockOnHandReport.TypeLabel.Caption := 'Stock On Hand Report Of Females In Milk';
                   end;
               5 : begin //
                      qStockOnHand.SQL.ADD('AND (A.Sex = "Female")');
                      fmStockOnHandReport.TypeLabel.Caption := 'Stock On Hand Report Of Females Dried Off';
                   end;
               6 : fmStockOnHandReport.TypeLabel.Caption := 'Stock On Hand Report Of All Animals';
            end;

            if ( Length(ComboHerd.Value) > 0 ) then                                 // Inter herd transfers
               qStockOnHand.SQL.ADD(' AND (A.HerdID = "' + ComboHerd.Value + '") ');

            if ( Length(ComboHerd.Value) > 0 ) then
               IHMMovements := WinData.HerdHasIHMs(StrToInt(ComboHerd.Value))
            else
               begin
                  WinData.dsHerdDefaults.Dataset.First;
                  while not WinData.dsHerdDefaults.Dataset.eof do
                     begin
                        IHMMovements := WinData.HerdHasIHMs(WinData.dsHerdDefaults.Dataset.FieldByName('ID').AsInteger);
                        if IHMMovements then
                           Break;
                        WinData.dsHerdDefaults.Dataset.Next;
                     end;
               end;

            if IHMMovements then
               qStockOnHand.SQL.Add('AND NOT(A.ID IN (Select Distinct AnimalID From IHM)) ');

            qStockOnHand.ExecSQL;

            if IHMMovements then
               begin
                  if ( Length(ComboHerd.Value) > 0 ) then
                     IHMAnimals := GetIHMAnimals(DateRequired.Date, ComboHerd.KeyValue, True)
                  else
                     begin
                        IHMAnimals := '';
                        WinData.dsHerdDefaults.Dataset.First;
                        while not WinData.dsHerdDefaults.Dataset.eof do
                           begin
                              IHMAnimals := IHMAnimals + GetIHMAnimals(DateRequired.Date, WinData.dsHerdDefaults.Dataset.FieldByName('ID').AsInteger, False);
                              WinData.dsHerdDefaults.Dataset.Next;
                           end;
                        if IHMAnimals = '' then
                           IHMAnimals := '()'
                        else
                           IHMAnimals := '(' + IHMAnimals + ')';
                     end;

                  if ( IHMAnimals <> '()' ) then
                     begin
                        qStockOnHand.Close;
                        qStockOnHand.Sql.Clear;
                        qStockOnHand.Sql.Add('INSERT INTO StockOnHand (AnimalNo, SortAnimalNo, ');
                        qStockOnHand.Sql.Add('                         AnimalID, LactNo, NatID, ');
                        qStockOnHand.Sql.Add('                         SortNatId, Sex, BreedCode, ');
                        qStockOnHand.Sql.Add('                         DOB, QualityAssured, SireCode, DamID, DamCode) ');
                        qStockOnHand.sql.Add('SELECT DISTINCT A.AnimalNo, A.SortAnimalNo, A.ID, ');
                        qStockOnHand.sql.Add('                A.Lactno, A.NatIDNum, A.SortNatID, ');
                        qStockOnHand.Sql.Add('                A.Sex, B.Code, A.DateOfBirth, A.QualityAssured,');
                        qStockOnHand.sql.Add('                ASire.AnimalNo, AA.NatIDNum, AA.AnimalNo');
                        qStockOnHand.sql.Add('FROM Animals A                                          ');
                        qStockOnHand.SQL.Add('LEFT JOIN Breeds B      ON (A.PrimaryBreed=B.ID)        ');
                        qStockOnHand.SQL.Add('LEFT JOIN Animals ASire ON (A.SireID=ASire.ID)          ');
                        qStockOnHand.SQL.Add('LEFT JOIN Animals AA    ON (A.DamID = AA.ID)            ');
                        qStockOnHand.SQL.Add('INNER JOIN IHM I ON (I.AnimalID = A.ID)                 ');
                        qStockOnHand.SQL.Add('WHERE (A.ID IN '+IHMAnimals+') ');
                        if ( FromDOB.Date <> 0 ) And ( ToDOB.Date <> 0 ) Then
                           qStockOnHand.SQL.Add('And (A.DateOfBirth Between ' + '''' + FormatDateTime(cUSDateStyle,FromDOB.Date) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,ToDOB.Date) + '''' + ')')
                        else if ( FromDOB.Date <> 0 ) and ( ToDOB.Date <= 0 ) Then
                           qStockOnHand.SQL.Add('And (A.DateOfBirth > ' + '''' + FormatDateTime(cUSDateStyle,FromDOB.Date) + '''' + ') ')
                        else if ( FromDOB.Date <= 0 ) and ( ToDOB.Date <> 0 ) Then
                           qStockOnHand.SQL.Add('And (A.DateOfBirth < ' + '''' + FormatDateTime(cUSDateStyle,ToDOB.Date) + '''' + ') ');
                        case rgReportOn.ItemIndex of
                           0 : qStockOnHand.SQL.ADD('AND (A.Sex <> "Female")');
                           1 : qStockOnHand.SQL.ADD('AND (A.Sex = "Bull")');
                           2 : qStockOnHand.SQL.ADD('AND (A.Sex = "Steer")');
                           3,4,5 : qStockOnHand.SQL.ADD('AND (A.Sex = "Female")');
                        end;
                        qStockOnHand.ExecSQL;
                     end;
               end;

            pbStockBar.Position := 6;

            // check which field is shown for Dam
            if WinData.OwnerFile.FieldByName('SearchField').AsString = 'Animal No' then
               fmStockOnHandReport.dbDam.DataField := 'DamCode'
            else
               fmStockOnHandReport.dbDam.DataField := 'DamID';

            // Gets all other data to be associated with an animal
            pbStockBar.Position := 8;
            LoadOtherData; // LOAD OTHER DATA HERE!!
            qStockOnHand.sql.Clear;

            pbStockBar.Position := 90;
            if rgReportOn.ItemIndex in [ 3, 4, 5, 6] then
               qStockOnHand.sql.Add('SELECT * FROM StockOnHand where (LactNo >= ' + FromLact.Text + ') and (Lactno <= ' + ToLact.Text + ')')
            else
                qStockOnHand.sql.Add('SELECT * FROM StockOnHand');
            pbStockBar.Position := 92;

            if ( FromDOB.Date <> 0 ) And ( ToDOB.Date <> 0 ) then
               begin
                  fmStockOnHandReport.lDOBTextFrom.Caption := 'Date of Birth from:';
                  fmStockOnHandReport.lDOBTextTo.Caption := 'To:';
                  fmStockOnHandReport.lStockDOBFrom.Caption := FormatDateTime(cIrishDateStyle,FromDOB.Date);
                  fmStockOnHandReport.lStockDOBTo.Caption := FormatDateTime(cIrishDateStyle,ToDOB.Date);
               end
            else
               begin
                  fmStockOnHandReport.lDOBTextFrom.Caption := '';
                  fmStockOnHandReport.lDOBTextTo.Caption := '';
                  fmStockOnHandReport.lStockDOBFrom.Caption := '';
                  fmStockOnHandReport.lStockDOBTo.Caption := '';
               end;
            pbStockBar.Position := 94;
            fmStockOnHandReport.SortLabel.Left := (fmStockOnHandReport.TypeLabel.Left + fmStockOnHandReport.TypeLabel.Width + 10);

            if FHerdType = htBeef then
               begin
                  fmStockOnHandReport.EventLabel.DataField := 'PurchDate';
                  fmStockOnHandReport.lPurchCalving.Caption := 'Purchase Date';
               end
            else
               begin
                  fmStockOnHandReport.EventLabel.DataField := 'LastCalvingDate';
                  fmStockOnHandReport.lPurchCalving.Caption := 'Calving Date';
               end;

            case rgSortBy.ItemIndex of
               0 : begin // Sort By Animal No
                      qStockOnHand.SQL.ADD('ORDER BY SortAnimalNo');
                      fmStockOnHandReport.SortLabel.Caption := ',Ordered By Animal Number';
                   end;
               1 : begin //Sort By national ID
                      qStockOnHand.SQL.ADD('ORDER BY SortNatID');
                      fmStockOnHandReport.SortLabel.Caption := ',Ordered By National ID Number';
                   end;
               2,3 : begin
                        if rgSortBy.ItemIndex = 2 then
                           begin
                              CreateNatIDSort(stCheckDigit);
                              fmStockOnHandReport.SortLabel.Caption := ',Ordered By Nat. Id. Check Digit';
                           end
                        else
                           begin
                              CreateNatIDSort(stLastFourDigits);
                              fmStockOnHandReport.SortLabel.Caption := ',Ordered By Nat. Id. (Last Four Digits)';
                           end;
                        qStockOnHand.SQL.ADD('ORDER BY SortNatID');
                     end;
               4 : begin
                      qStockOnHand.SQL.ADD('ORDER BY DOB');
                      fmStockOnHandReport.SortLabel.Caption := ',Ordered By Date Of Birth';
                   end;
               5 : begin
                      qStockOnHand.SQL.ADD('ORDER BY LactNo');
                      fmStockOnHandReport.SortLabel.Caption := ',Ordered By Lactation Number';
                   end;
               6 : Begin
                      if FHerdType = htBeef then
                         begin
                            qStockOnHand.SQL.ADD('ORDER BY PurchDate');
                            fmStockOnHandReport.SortLabel.Caption := ',Ordered By Purchase Date';
                         end
                      else
                         begin
                            qStockOnHand.SQL.ADD('ORDER BY LastCalvingDate');
                            fmStockOnHandReport.SortLabel.Caption := ',Ordered By Calving Date';
                         end;
                   end;
            end;

            pbStockBar.Position := 96;
            fmStockOnHandReport.OrderLabel.Left := (fmStockOnHandReport.SortLabel.Left + fmStockOnHandReport.SortLabel.Width + 10);
            case rgSortOrder.ItemIndex of
               0  : begin
                       qStockOnHand.SQL.Add('Asc');
                       fmStockOnHandReport.OrderLabel.Caption := ',In Ascending Order';
                    end;
               1  : begin
                       qStockOnHand.SQL.Add('Desc');//desceding
                       fmStockOnHandReport.OrderLabel.Caption := ',In Descending Order';
                    end;
            end;
            pbStockBar.Position := 98;
            fmStockOnHandReport.qrUsingFilters.Left := (fmStockOnHandReport.OrderLabel.Left + fmStockOnHandReport.OrderLabel.Width + 10);
            if cbUseFilter.Checked then
               fmStockOnHandReport.qrUsingFilters.Caption := ',(Using Filters)'
            else
               fmStockOnHandReport.qrUsingFilters.Caption := '';
            qStockOnHand.Open;
            //   18/04/19 [V5.8 R9.0] /MK Change - Save stock on hand report to txt file for debugging differences between animal counts - Michael Callan. 
            if ( qStockOnHand.RecordCount > 0 ) then
               begin
                  slDebugFile := TStringList.Create();
                  try
                     slDebugFile.Add(GetSOHSelectionsString);
                     slDebugFile.Add('AnimalCount = '+IntToStr(qStockOnHand.RecordCount));
                     slDebugFile.Add('AnimalID');
                     qStockOnHand.First;
                     while ( not(qStockOnHand.Eof) ) do
                        begin
                           slDebugFile.Add(IntToStr(qStockOnHand.FieldByName('AnimalID').AsInteger));
                           qStockOnHand.Next;
                        end;
                  finally
                     if ( slDebugFile <> nil ) then
                        begin
                           slDebugFile.SaveToFile(IncludeTrailingBackslash(WinData.KingData.Directory)+'SOH_'+ComboHerd.Text+'_'+FormatDateTime('ddMMyyHHss',Now)+'.txt');
                           FreeAndNil(slDebugFile);
                        end;
                  end;
               end;

            if (rgDamDisplay.ItemIndex = 0) then
               begin
                  fmStockOnHandReport.dbDam.DataField := 'DamID';
                  fmStockOnHandReport.qrlDamDisplay.Caption := 'DamNatID';
               end
            else
               begin
                  fmStockOnHandReport.dbDam.DataField := 'DamCode';
                  fmStockOnHandReport.qrlDamDisplay.Caption := 'DamNumber';
               end;

            fmStockOnHandReport.lHerdID.Caption := ComboHerd.Text;

            pbStockBar.Position := pbStockBar.Max;

            //   04/04/16 [V5.5 R5.7] /MK Bug Fix - Check for Crush User's to show Q/A. If beef user then show Purchase Date - Slyvia Tracey.
            if ( Def.Definition.dUseCrush ) and ( FHerdType = htBeef ) then
               begin
                  with fmStockOnHandReport do
                     begin
                        lPurchCalving.Caption := 'Q.A';
                        lPurchCalving.Top := 126;
                        EventLabel.Mask := '';
                        EventLabel.DataField := 'QualityAssured';
                     end;
               end
            else if ( FHerdType = htBeef ) then
               begin
                  with fmStockOnHandReport do
                     begin
                        lPurchCalving.Caption := 'Purchase Date';
                        lPurchCalving.Top := 114;
                        EventLabel.Mask := 'dd/mm/yy';
                        EventLabel.DataField := 'PurchDate';
                     end;
               end
            else
               begin
                  with fmStockOnHandReport do
                     begin
                        lPurchCalving.Caption := 'Calving Date';
                        lPurchCalving.Top := 114;
                        EventLabel.Mask := 'dd/mm/yy';
                        EventLabel.DataField := 'LastCalvingDate';
                     end;
               end;

            if WinData.ExportToPDA then
               begin
                  WinData.PDALinkExport.ExportReport( fmStockOnHandReport.StockOnHandScr );
               end
            else if ( Sender as TRxSpeedButton ).Name = 'sbView' then
               begin
                  fmStockOnHandReport.StockRptTitle.Font.Color := ClRed;
                  fmStockOnHandReport.StockDetail.Font.color := clNavy;
                  fmStockOnHandReport.StockOnHandScr.Preview;
               End
            else
               begin
                  fmStockOnHandReport.StockRptTitle.Font.Color := ClBlack;
                  fmStockOnHandReport.StockDetail.Font.color := clBlack;
                  Windata.CallPrintDialog(fmStockOnHandReport.StockOnHandScr);
               End;

            pbStockBar.Hide;
            sbView.Enabled := True;
            sbPrint.Enabled := True;
                  //Free;
            //   end;
            fmStockOnHandReport.Free;
         end
      else if pPurchSales.Visible then   // Purchase / Sales Analyis --- uses StockinHerd.pas
         begin
            Screen.Cursor := crHourGlass;

            fmPurchSalesReport := TfmPurchSalesReport.Create(nil);
            fmPurchSalesReport.PrintHerdField := ComboHerd.Value = '0';
            fmPurchSalesReport.qrlHerdIdentity.Caption := ComboHerd.Text;
            sbView.Enabled := False;
            sbPrint.Enabled := False;
            fmPurchSalesReport.PurchSalesVerLabel.Caption := 'Herd Management ' + HerdVerNo; // Added 11/12/98 - FK
            qPurchSales.SQL.Clear;
            qPurchSales.Close;

            qPurchSales.SQL.Add('DELETE FROM PurchSales');
            qPurchSales.ExecSQL;

            qPurchSales.SQL.Clear;
            if rgInclude.ItemIndex = 1 then // Purchased only
                 begin
                    qPurchSales.SQL.Add('INSERT INTO PurchSales (AnimalID, AnimalNo, SortAnimalNo, NatId, SortNatID, HerdIDNo, ');
                    qPurchSales.SQL.Add('                        BCode, DOB, Sex, HerdIdentity)');
                    qPurchSales.SQL.Add('SELECT DISTINCT D.ID, D.AnimalNo, D.SortAnimalNo, D.NatIDNum, D.SortNatID, D.HerdID, ');
                    qPurchSales.SQL.Add('                B.Code, D.DateOfBirth, D.Sex, O.HerdIdentity ');
                    qPurchSales.SQL.Add('FROM Animals D');
                    // INNER JOIN last to ensure you get all animals
                    if cbUseFilter.Checked then
                       qPurchSales.SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (D.ID=FA.AID)');
                    qPurchSales.SQL.Add('LEFT JOIN Breeds B     ON (D.PrimaryBreed=B.ID)');
                    qPurchSales.SQL.Add('LEFT JOIN Events D2    ON (D.ID=D2.AnimalID)');
                    qPurchSales.SQL.Add('LEFT JOIN Purchases D1 ON (D2.ID=D1.EventID)');
                    qPurchSales.SQL.Add('LEFT JOIN ' + WinData.Suppliers.TableName + ' S ON (S.ID=D1.Supplier)');
                    qPurchSales.SQL.Add('LEFT JOIN Owners O  ON (O.ID=D.HerdID)');
                    qPurchSales.SQL.Add('WHERE ( NOT (D.HerdID = ' + IntToStr(WinData.NONEHerdID) + '))');
                    qPurchSales.SQL.Add('AND   ( D.AnimalDeleted = FALSE)');
                    qPurchSales.SQL.Add('AND   ( D2.EventType=' + IntToStr(CPurchaseEvent) + ')');
                    if cbSupplier.Value <> '0' then
                       qPurchSales.SQL.Add('AND ( D1.Supplier=' + cbSupplier.Value + ')');
                    if cbUseFilter.Checked then
                       fmPurchSalesReport.qrUsingSalesFilter.Caption := 'Using Filter'
                    else
                       fmPurchSalesReport.qrUsingSalesFilter.Caption := '';
                 end
              else if rgInclude.ItemIndex = 2 then // sold Only
                  begin
                     qPurchSales.SQL.Add('INSERT INTO PurchSales (AnimalID, AnimalNo, SortAnimalNo, NatId, SortNatId, HerdIDNo, SalesWeight, SalesGrade, SalesPrice, SalesDate, SEventID,');
                     qPurchSales.SQL.Add('                        BCode, DOB, Sex, HerdIdentity)');
                     qPurchSales.SQL.Add('SELECT DISTINCT D.ID, D.AnimalNo, D.SortAnimalno, D.NatIDNum, D.SortNatID, D.HerdID, S.Weight, S.Grade, S.Price, D2.EventDate, D2.ID,');
                     qPurchSales.SQL.Add('                        B.Code, D.DateOfBirth, D.Sex, O.HerdIdentity ');
                     qPurchSales.SQL.Add('FROM Animals D');
                     // INNER JOIN last to ensure you get all animals
                     if cbUseFilter.Checked then
                        qPurchSales.SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (D.ID=FA.AID)');
                     qPurchSales.SQL.Add('LEFT JOIN Breeds B ON (D.PrimaryBreed=B.ID)');
                     qPurchSales.SQL.Add('LEFT JOIN Events D2 ON (D.ID=D2.AnimalID)');
                     qPurchSales.SQL.Add('LEFT JOIN SalesDeaths S ON (D2.ID=S.EventID)');
                     qPurchSales.SQL.Add('LEFT JOIN ' + WinData.Customers.TableName + ' C ON (C.ID=S.Customer)');
                     qPurchSales.SQL.Add('LEFT JOIN Owners O  ON (O.ID=D.HerdID)');
                     qPurchSales.SQL.Add('WHERE (NOT (D.HerdID = ' + IntToStr(WinData.NONEHerdID) + '))');
                     qPurchSales.SQL.Add('AND   (D.AnimalDeleted = FALSE)');
                     qPurchSales.SQL.Add('AND   (D2.EventType=' + IntToStr(CSaleDeathEvent) + ')');
                     qPurchSales.SQL.Add('AND   (S.Sold= True)');
                     // Limit it to this Supplier
                     if cbCustomer.Value <> '0' then
                        qPurchSales.SQL.Add('AND (S.Customer=' + cbCustomer.Value + ')');

                     if cbUseFilter.Checked then
                        fmPurchSalesReport.qrUsingSalesFilter.Caption := 'Using Filter'
                     else
                        fmPurchSalesReport.qrUsingSalesFilter.Caption := '';
                  end
              else if rgInclude.ItemIndex = 3 then // Deaths Only
                  begin
                     qPurchSales.SQL.Add('INSERT INTO PurchSales (AnimalID, AnimalNo, SortAnimalNo, NatId, SortNatId, HerdIDNo, SalesWeight, SalesGrade, SalesPrice, SalesDate, SEventID, Customer, CustomerID,');
                     qPurchSales.SQL.Add('                        BCode, DOB, Sex, HerdIdentity)');
                     qPurchSales.SQL.Add('SELECT DISTINCT D.ID, D.AnimalNo, D.SortAnimalno, D.NatIDNum, D.SortNatID, D.HerdID, S.Weight, S.Grade, S.Price, D2.EventDate, D2.ID, C.Name, C.ID,');
                     qPurchSales.SQL.Add('                        B.Code, D.DateOfBirth, D.Sex, O.HerdIdentity ');
                     qPurchSales.SQL.Add('FROM Animals D');
                     // INNER JOIN last to ensure you get all animals
                     if cbUseFilter.Checked then
                        qPurchSales.SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (D.ID=FA.AID)');
                     qPurchSales.SQL.Add('LEFT JOIN Breeds B  ON (B.ID=D.PrimaryBreed)');
                     qPurchSales.SQL.Add('LEFT JOIN Events D2 ON (D.ID = D2.AnimalID)');
                     qPurchSales.SQL.Add('LEFT JOIN SalesDeaths S ON (D2.ID = S.EventID)');
                     qPurchSales.SQL.Add('LEFT JOIN ' + WinData.Customers.TableName + ' C ON (C.ID=S.Customer)');
                     qPurchSales.SQL.Add('LEFT JOIN Owners O  ON (O.ID=D.HerdID)');
                     qPurchSales.SQL.Add('WHERE ( NOT (D.HerdID = ' + IntToStr(WinData.NONEHerdID) + '))');
                     qPurchSales.SQL.Add('AND   ( D.AnimalDeleted = FALSE)');
                     qPurchSales.SQL.Add('AND   ( D2.EventType=' + IntToStr(CSaleDeathEvent) + ' )');
                     qPurchSales.SQL.Add('AND   ( S.Sold= False )');
                     // Limit it to this Supplier
                     if cbCustomer.Value <> '0' then
                        qPurchSales.SQL.Add('AND (S.Customer=' + cbCustomer.Value + ')');

                     if cbUseFilter.Checked then
                        fmPurchSalesReport.qrUsingSalesFilter.Caption := 'Using Filter'
                     else
                        fmPurchSalesReport.qrUsingSalesFilter.Caption := '';
                  end
              else if rgInclude.ItemIndex in [0,4,5] then // All of 'em !
                  begin
                      //   13/11/14 [V5.3 R8.9] /MK Bug Fix - Initial query was adding the purchase date as the DateofBirth
                      qPurchSales.SQL.Add('INSERT INTO PurchSales (AnimalID, AnimalNo, SortAnimalNo, NatId, SortNatID, HerdIDNo,');
                      qPurchSales.SQL.Add('                        BCode, DOB, Sex, HerdIdentity)');
                      qPurchSales.SQL.Add('SELECT DISTINCT D.ID, D.AnimalNo, D.SortAnimalNo, D.NatIDNum, D.SortNatID, D.HerdID,');
                      qPurchSales.SQL.Add('                        B.Code, D.DateOfBirth, D.Sex, O.HerdIdentity ');
                      qPurchSales.SQL.Add('FROM Animals D');
                     if cbUseFilter.Checked then  // SP To bring in filtered animals into rpt. 06/11/00
                        begin
                           qPurchSales.SQL.Add('INNER JOIN ' + WinData.FilteredAnimals.TableName + ' FA ON (D.ID=FA.AID)');
                           fmPurchSalesReport.qrUsingSalesFilter.Caption := 'Using Filter'
                        end
                     else
                        fmPurchSalesReport.qrUsingSalesFilter.Caption := '';  // SP To bring in filtered animals into rpt. 06/11/00
                      qPurchSales.SQL.Add('LEFT JOIN Breeds B  ON (B.ID=D.PrimaryBreed)');
                      qPurchSales.SQL.Add('LEFT JOIN Owners O  ON (O.ID=D.HerdID)');
                      qPurchSales.SQL.Add('WHERE ( NOT (D.HerdID = ' + IntToStr(WinData.NONEHerdID) + '))');
                      qPurchSales.SQL.Add('AND ( D.AnimalDeleted = FALSE)');
                      if rgInclude.ItemIndex = 5 then // We only want purchased animals not yet sold
                         begin
                            qPurchSales.SQL.Add('AND ( D.InHerd = True ) ');
                            qPurchSales.SQL.Add('AND (D.ID IN (Select Distinct E.AnimalId From Events E Where E.EventType = '+IntToStr(cPurchaseEvent)+')) ');
                         end;
                  end;

              if ( ComboHerd.Value <> '0' ) then
                 qPurchSales.SQL.Add(' AND ( D.HerdID = "' + ComboHerd.value + '" )');

              if rgInclude.ItemIndex = 1 then  // Purchases
                 begin
                    if ( FromPurchDate.Date <> 0 ) And ( ToPurchDate.Date <> 0 ) then
                       qPurchSales.SQL.Add('And (D2.eventDate Between ' + '''' + FormatDateTime(cUSDateStyle,StrToDate(FromPurchDate.Text)) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,StrToDate(ToPurchDate.Text)) + '''' + ')')
                 end
              else if rgInclude.ItemIndex = 2 then  // Sales
                 begin
                    if ( FromSaleDate.Date <> 0 ) And ( ToSaleDate.Date <> 0 ) then
                       qPurchSales.SQL.Add('And (D2.eventDate Between ' + '''' + FormatDateTime(cUSDateStyle,StrToDate(FromSaleDate.Text)) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,StrToDate(ToSaleDate.Text)) + '''' + ')');
                 end;

              qPurchSales.ExecSQL;
              LoadPurchSaleDeathData; // SP 11/03/2003
              // SP/KB 05/07/00 Fixed the Sales rpt so that dead animals do not appear.
              // Also changed the name of the date field (Sale death from / Death date from)

              // First set currency if user select �
              if WinData.UseEuro AND NOT(WinData.ReportInEuro) then
                    begin
                       qPurchSales.sql.Clear;
                       qPurchSales.SQL.Add('Update PurchSales Set PurchPrice = (PurchPrice*'+FloatToStr(cEuro)+'),');
                       qPurchSales.SQL.Add('                      SalesPrice  = (SalesPrice*'+FloatToStr(cEuro)+')  ');
                       qPurchSales.ExecSQL;
                    end;

              qPurchSales.sql.Clear;
              qPurchSales.SQL.Add('DELETE FROM PurchSales');
              qPurchSales.SQL.Add('WHERE NOT ID IN (');
              qPurchSales.SQL.Add('SELECT ID FROM PurchSales');
              WhereIn := FALSE;

              if ( rgInclude.ItemIndex in [1,5] ) then // Purchase
                 begin
                    if ( FromPurchDate.Date <> 0 ) And ( ToPurchDate.Date <> 0 ) then
                       begin
                          qPurchSales.SQL.Add('Where PurchDate Between ' + '''' + FormatDateTime(cUSDateStyle,StrToDate(FromPurchDate.Text)) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,StrToDate(ToPurchDate.Text)) + '''' + '');
                          WhereIn := TRUE;
                       end;
                 end
              else if rgInclude.ItemIndex in [2,3] then // All Sold Animals or All Dead Animals
                 begin
                    if ( FromSaleDate.Date <> 0 ) And ( ToSaleDate.Date <> 0 ) then
                       begin
                          qPurchSales.SQL.Add('Where SalesDate Between ' + '''' + FormatDateTime(cUSDateStyle,StrToDate(FromSaleDate.Text)) + '''' + ' And ' + '''' + FormatDateTime(cUSDateStyle,StrToDate(ToSaleDate.Text)) + '''' + '');
                          WhereIn := TRUE;
                       end;
                 end
              else if rgInclude.ItemIndex = 4 then // Purchased And Sold
                 begin
                     //   13/11/14 [V5.3 R8.9] /MK Bug Fix - SaleDate can be null so check for null sales dates depending on From/To Date Filters.
                    if ( FromSaleDate.Date <> 0 ) And ( ToSaleDate.Date <> 0 ) then
                       begin
                          qPurchSales.SQL.Add('WHERE (SalesDate Between "' + FormatDateTime(cUSDateStyle,FromSaleDate.Date) + '" AND "' + FormatDateTime(cUSDateStyle,ToSaleDate.Date) + '")');
                          WhereIn := TRUE;
                       end
                    else if ( FromSaleDate.Date = 0 ) and ( ToSaleDate.Date > 0 ) then
                       begin
                          qPurchSales.SQL.Add('WHERE (SalesDate IS NOT NULL AND SalesDate <"' + FormatDateTime(cUSDateStyle,ToSaleDate.Date) + '")');
                          WhereIn := TRUE;
                       end
                    else if ( FromSaleDate.Date > 0 ) and ( ToSaleDate.Date = 0 ) then
                       begin
                          qPurchSales.SQL.Add('WHERE (SalesDate > "' + FormatDateTime(cUSDateStyle,FromSaleDate.Date) + '" AND SalesDate IS NOT NULL)');
                          WhereIn := TRUE;
                       end
                    else if ( FromSaleDate.Date = 0 ) and ( ToSaleDate.Date = 0 ) then
                       begin
                          qPurchSales.SQL.Add('WHERE (SalesDate IS NOT NULL)');
                          WhereIn := TRUE;
                       end;

                    // For A Chosen Customer
                    if ( cbCustomer.Value <> '0' ) then
                       if WhereIn then
                          qPurchSales.SQL.Add('AND (CustomerID=' + cbCustomer.Value + ')')
                       else
                          begin
                             qPurchSales.SQL.Add('WHERE (CustomerID=' + cbCustomer.Value + ')');
                             WhereIn := TRUE;
                          end;

                    //   13/11/14 [V5.3 R8.9] /MK Bug Fix - ToPurchDate can be null so check for null sales dates depending on From/To Date Filters.
                    //                            Additional Feature - New function created to add sql text whether WhereIn is True or False.
                    if WhereIn then
                       qPurchSales.SQL.Add('  AND '+AddPurchDateFilter+'')
                    else
                       begin
                          //qPurchSales.SQL.Add('  WHERE ( PurchDate Between "' + FormatDateTime(cUSDateStyle,StrToDate(FromPurchDate.Text)) + '" And "' + FormatDateTime(cUSDateStyle,StrToDate(ToPurchDate.Text)) + '")');
                          qPurchSales.SQL.Add('  WHERE '+AddPurchDateFilter+'');
                          WhereIn := TRUE;
                       end;

                    // For A Chosen Supplier
                    if ( cbSupplier.Value <> '0' ) then
                       if WhereIn then
                          qPurchSales.SQL.Add('AND (SupplierID=' + cbSupplier.Value + ')')
                       else
                          begin
                             qPurchSales.SQL.Add('WHERE (SupplierID=' + cbSupplier.Value + ')');
                             WhereIn := TRUE;
                          end;
                 end;

              if ( rgInclude.ItemIndex in [0,2,3,4] ) and ( cbCustomer.Value <> '0' ) then
                 begin
                    if WhereIn then
                       qPurchSales.SQL.Add('AND (CustomerID=' + cbCustomer.Value + ')')
                    else
                       begin
                          qPurchSales.SQL.Add('WHERE (CustomerID=' + cbCustomer.Value + ')');
                          WhereIn := TRUE;
                       end
                 end
              else if ( rgInclude.ItemIndex in [1,4,5] ) And ( cbSupplier.Value <> '0' ) then
                 begin
                    if WhereIn then
                       qPurchSales.SQL.Add('AND (SupplierID=' + cbSupplier.Value + ')')
                    else
                       begin
                          qPurchSales.SQL.Add('WHERE (SupplierID=' + cbSupplier.Value + ')');
                          WhereIn := TRUE;
                       end;
                 end;

              qPurchSales.SQL.Add(')');
              try
                 qPurchSales.ExecSQL;
              except
                 on e : Exception do
                    ShowMessage(e.Message);
              end;

              //   13/11/14 [V5.3 R8.9] /MK Additional Feature - If Purchased AND Sold then delete animals that died
              if ( rgInclude.ItemIndex = 4 ) then
                 begin
                    qPurchSales.SQL.Clear;
                    qPurchSales.SQL.Add('DELETE FROM PurchSales');
                    qPurchSales.SQL.Add('WHERE AnimalID IN '+IntArrayToSQLInString(GetDeadAnimals)+'');
                    try
                       qPurchSales.ExecSQL;
                    except
                       on e : Exception do
                          ShowMessage(e.Message);
                    end;
                 end;

              //  25/08/10 [V4.0 R4.6] /MK Change - Dunbia Change to Sort By HerdID and then SortByType Date Removed - GL - Because Coolmore Stud
              //                                    Wants To Sort Just By Date - Dunbia Should Just Print Separate Reports
              qPurchSales.SQL.Clear;
              qPurchSales.SQL.Add('SELECT * FROM PurchSales');

              case rgSortBy.ItemIndex Of
                 0 : begin
                        qPurchSales.SQL.Add('ORDER BY SortAnimalNo');
                        fmPurchSalesReport.PurchSalesSortLabel.Caption := 'Ordered By Animal Number';
                     end;
                 1, 2, 3 : begin
                              qPurchSales.SQL.Add('ORDER BY SortNatID'); //Sort By national ID
                              if ( rgSortBy.ItemIndex = 1 ) then
                                 fmPurchSalesReport.PurchSalesSortLabel.Caption := 'Ordered By National ID Number'
                              else if ( rgSortBy.ItemIndex = 2 ) then
                                 begin
                                    CreateNatIDSort(stCheckDigit);
                                    fmPurchSalesReport.PurchSalesSortLabel.Caption := ',Ordered By Nat. Id. Check Digit';
                                 end
                              else if ( rgSortBy.ItemIndex = 3 ) then
                                 begin
                                    CreateNatIDSort(stLastFourDigits);
                                    fmPurchSalesReport.PurchSalesSortLabel.Caption := 'Ordered By National ID Number';
                                 end;
                           end;
                 4 : begin
                        case rgInclude.ItemIndex of
                           1,5 : begin
                                    qPurchSales.SQL.Add('ORDER BY PurchDate');
                                    fmPurchSalesReport.PurchSalesSortLabel.Caption := 'Ordered By Purchase Date';
                                 end;
                           2,3 : begin
                                    qPurchSales.SQL.Add('ORDER BY SalesDate');
                                    fmPurchSalesReport.PurchSalesSortLabel.Caption := 'Ordered By Sales Date';
                                 end;
                           0, 4 : begin // Sort By sale Date
                                     qPurchSales.SQL.Add('ORDER BY SalesDate');
                                     fmPurchSalesReport.PurchSalesSortLabel.Caption := 'Ordered By Sales Date';
                                  end;
                        end;
                     end;
                 5 : begin // Sort By sale Date
                        qPurchSales.SQL.Add('ORDER BY PurchDate');
                        fmPurchSalesReport.PurchSalesSortLabel.Caption := 'Ordered By Purchase Date';
                     end;
              end;

              case rgSortOrder.ItemIndex Of
                   0  : begin
                             qPurchSales.SQL.Add('Asc');
                             fmPurchSalesReport.PurchSalesOrderLabel.Caption := 'In Ascending Order';
                        end;
                   1  : begin
                             qPurchSales.SQL.Add('Desc');//desceding
                             fmPurchSalesReport.PurchSalesOrderLabel.Caption := 'In Descending Order';
                        end;
              end;

              fmPurchSalesReport.LSaleOrDeathFrom.Caption := SwitchLabel.Caption;

              fmPurchSalesReport.lFromPurch.Caption := '';
              fmPurchSalesReport.lToPurch.Caption := '';
              fmPurchSalesReport.lFromSale.Caption := '';
              fmPurchSalesReport.lToSale.Caption := '';
              if (rgInclude.ItemIndex in [1,4,5]) then
                 begin
                    if (FromPurchDate.Date>0) then
                       fmPurchSalesReport.lFromPurch.Caption := FormatDate(FromPurchDate.Date, dsIrish);

                    if (ToPurchDate.Date>0) then
                       fmPurchSalesReport.lToPurch.Caption := FormatDate(ToPurchDate.Date, dsIrish);

                    if (rgInclude.ItemIndex in [1,5]) then
                       begin
                          fmPurchSalesReport.LSaleOrDeathFrom.Caption := '';
                          fmPurchSalesReport.LSaleOrDeathTo.Caption := '';
                       end;
                 end;

              if (rgInclude.ItemIndex in [2,3,4]) then
                 begin
                    if (FromSaleDate.Date>0) then
                       fmPurchSalesReport.lFromSale.Caption := FormatDate(FromSaleDate.Date, dsIrish);

                    if (ToSaleDate.Date>0) then
                       fmPurchSalesReport.lToSale.Caption := FormatDate(ToSaleDate.Date, dsIrish);

                    if (rgInclude.ItemIndex in [2,3]) then
                       begin
                          fmPurchSalesReport.LPurchFrom.Caption := '';
                          fmPurchSalesReport.LPurchTo.Caption := '';
                          fmPurchSalesReport.lFromSale.Top := fmPurchSalesReport.lFromPurch.Top;;
                          fmPurchSalesReport.lToSale.Top := fmPurchSalesReport.lFromPurch.Top;;
                          fmPurchSalesReport.LSaleOrDeathFrom.Top := fmPurchSalesReport.lFromPurch.Top;
                          fmPurchSalesReport.LSaleOrDeathTo.Top := fmPurchSalesReport.lFromPurch.Top;
                       end
                 end;

              qPurchSales.Open;

              if ( rgInclude.ItemIndex = 1 ) then
                 begin
                    fmPurchSalesReport.lSales.Left := 795;
                    fmPurchSalesReport.lSales.Caption := 'Sales/Deaths';
                 end
              else if ( rgInclude.ItemIndex = 3 ) then
                 begin
                    fmPurchSalesReport.lSales.Left := 814;
                    fmPurchSalesReport.lSales.Caption := 'Deaths';
                 end
              else
                 begin
                    fmPurchSalesReport.lSales.Left := 814;
                    fmPurchSalesReport.lSales.Caption := 'Sales';
                 end;

              fmPurchSalesReport.qrlCustomTitle.Caption := FPurchSalesOptions.ReportTitle;

              Screen.Cursor := crDefault;

              if WinData.ExportToPDA then
                 WinData.PDALinkExport.ExportReport( fmPurchSalesReport.PurchaseSalesScr )
              else if ( Sender as TRxSpeedButton ).Name = 'sbView' then
                 begin
                    fmPurchSalesReport.PurchSalesRptTitle.Font.Color := ClRed;
                    fmPurchSalesReport.PurchSalesDetail.Font.color := clNavy;
                    if ( FFromBordBia ) then
                       fmPurchSalesReport.PurchSalesRptTitle.Caption := 'Deaths Report';
                    fmPurchSalesReport.PurchaseSalesScr.Preview;
                 end
              else
                  begin
                     fmPurchSalesReport.PurchSalesRptTitle.Font.Color := clBlack;
                     fmPurchSalesReport.PurchSalesDetail.Font.color := clBlack;
                     if ( FFromBordBia ) then
                        fmPurchSalesReport.PurchSalesRptTitle.Caption := 'Deaths Report';
                     WinData.CallPrintDialog(fmPurchSalesReport.PurchaseSalesScr);
                  end;

              pbReport.Visible := False;
              Application.ProcessMessages;
              Update;
         end;
   finally
      sbView.Enabled := True;
      sbPrint.Enabled := True;
   end;

end;

procedure TStockInHerdFilter.FormShow(Sender: TObject);
var
   Today : Shortstring;
   OwnerRec : TBookmark;
begin
   sbSws.Hide;
   if pPremiums.showing then
      begin
         rgSortBy.Items.Clear;
         rgSortBy.Items.Add('&Animal Number');
         rgSortBy.Items.Add('&National Identity Number');
         rgSortBy.Items.Add('Date Of &Birth');
      end
   else if pPurchSales.Showing then
      begin
         rgSortBy.Items.Clear;
         rgSortBy.Items.Add('&Animal Number');
         rgSortBy.Items.Add('&National Identity Number');
         rgSortBy.Items.Add('Nat. &Id No. (Check Digit)');
         if WinData.DefCountry(StrToInt(ComboHerd.Value)) = Ireland then
            rgSortBy.Items.Add('Nat. &Id No. (Last 4 Digits)')
         else
            rgSortBy.Items.Add('Nat. &Id No. ( Bar No. )');
         rgSortBy.Items.Add('&Sale Date');
         rgSortBy.Items.Add('&Purchase Date');
      end
   else if pStockOnHand.Showing then
      begin
         rgSortby.items.Clear;
         pbStockBar.Position := 0;
         sbView.Enabled := True;
         sbPrint.Enabled := True;
      end;

   rgSortby.ItemIndex := 0;
   rgSortOrder.ItemIndex := 0;
   Today := DateToStr(Date);
   if ( not(FFromBordBia) ) then
      begin
         ToSaleDate.Text := FormatDateTime(cIrishDateStyle,StrToDate(Today));
         FromSaleDate.Date := Now()-731;//SP 16/01/01 to set date 2 years from the To Date
         FromPurchDate.Date := Now()-731; //SP 20/11/00
      end;
   ToPurchDate.Text := ToSaleDate.Text;
   pSaleDates.Hide;
   pPurchaseDates.Hide;

   EligibilityDate.Text := FormatDateTime(cIrishDateStyle,StrToDate(Today));
   ComboHerd.Value := IntToStr(WinData.UserDefaultHerdID);
   SetHerdType;
   // update report on radio group active
   if pStockOnHand.Visible then
      rgReportOn.OnClick(Sender)
   else if pPremiums.Visible then
      begin
          rgpremtypeClick(Sender);
          DateGroupClick(Sender);
      end;
   rgIncludeClick(Sender);  // Set the Sales
   if ( not(FFromBordBia) ) then
      LoadScreenDefaults(FReportType);

   //   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
   if ( FReportType = StockOnHand ) then
      begin
         WinData.UpdateRecentReportUsage(cStockOnHandRep);
         cbFavourite.Checked := WinData.IsReportFavourite(cStockOnHandRep)
      end
   else if ( FReportType = PurchSales ) then
      begin
         WinData.UpdateRecentReportUsage(cPurchSalesAnalysisRep);
         cbFavourite.Checked := WinData.IsReportFavourite(cPurchSalesAnalysisRep);
      end;
end;

procedure TStockInHerdFilter.FormCreate(Sender: TObject);
begin
   WinData.CanShowStandardReportHint := True;

   WinData.QueryCustomers.Close;
   WinData.QueryCustomers.Open;

   WinData.QuerySuppliers.Close;
   WinData.QuerySuppliers.Open;

   ComboHerd.LookupSource := WinData.dsHerdDefaults;

   rgReportOn.Items.Clear;
   rgReportOn.Items.Add('&Male');
   rgReportOn.Items.Add('&Bulls');
   rgReportOn.Items.Add('&Steers');
   // Next 3 are used to Call the Code to get the Calving Date
   rgReportOn.Items.Add('&Females');  { 4 }
   rgReportOn.Items.Add('&In Milk');  { 5 }
   rgReportOn.Items.Add('&Dried Off');  { 6 }
   rgReportOn.Items.Add('&All');      { 7 }
end;

procedure TStockInHerdFilter.SetUpApplications;
begin
   if rgPremType.ItemIndex = 0 then
      begin
         with qApplications do
            begin
               SQL.Clear;
               { SP 15/10/2002 qApplications modified }
               SQL.Add('SELECT DISTINCT A.ApplicationID, A.ApplicationType, A."Date", A.Description');
               SQL.Add('FROM Applications A, Beefsub B ');
               SQL.Add('WHERE (A.ApplicationID = B.ApplicationID)');
               if ComboHerd.Value > '0' then
                  SQL.Add('AND (A.HerdID= ' + ComboHerd.Value + ')');
               SQL.Add('ORDER BY A."Date" desc');
               Open;
            end;
      end
   else
      begin
         with qApplications do
            begin
               SQL.Clear;
               SQL.Add('SELECT DISTINCT s.ID PremID, s.DateOfApplic, s.Description');
               SQL.Add('FROM sApplic s ');
               if ComboHerd.Value > '0' then
                  SQL.Add('WHERE (s.HerdID= ' + ComboHerd.Value + ')');
               SQL.Add('ORDER BY s.DateOfApplic desc');
               Open;
            end;
      end
end;

procedure TStockInHerdFilter.DateGroupClick(Sender: TObject);
begin
   if rgpremtype.ItemIndex = 0 then
      begin
         if DateGroup.ItemIndex = 0 then
            begin
               AppDate.Visible := True;
               EligibilityDate.Visible := False;
               cbToBeAppliedFor.Visible := False;
            end
         else
            begin
               AppDate.Visible := False;
               EligibilityDate.Visible := True;
               cbToBeAppliedFor.Visible := True;
            end;
      end
   else
      begin
         cbToBeAppliedFor.Visible := False;
         EligibilityDate.Visible := False;
         if DateGroup.ItemIndex = 0 then
            begin
               AppDate.Visible := True;
            end
         else
            AppDate.Visible := False;
      end;
end;

procedure TStockInHerdFilter.rgReportOnClick(Sender: TObject);
begin
     SetHerdType;
     if pStockOnHand.Showing then
        begin
           if rgReportOn.itemIndex in [3,4,5,6] then // Females Only
              begin
                 if not ( LastReportOnIndex in [3,4,5,6] ) then // only change where Necessary
                    begin
                       pFemales.Show;
                       rgSortby.items.Clear;
                       rgSortby.items.add('&Animal Number');
                       rgSortby.items.add('&National Identity Number');
                       rgSortBy.Items.Add('Nat. &Id No. (Check Digit)');
                       if WinData.DefCountry(StrToInt(ComboHerd.Value)) = Ireland then
                          rgSortBy.Items.Add('Nat. &Id No. (Last 4 Digits)')
                       else
                          rgSortBy.Items.Add('Nat. &Id No. ( Bar No. )');
                       rgSortby.items.add('Date Of &Birth');
                       rgSortBy.Items.Add('&Lactation Number');
                       if FHerdType = htBeef then
                          rgSortBy.Items.Add('&Purchase Date')
                       else
                          rgSortBy.Items.Add('Cal&ving Date');
                       rgSortby.Width := 350;
                       rgSortby.columns := 2;
                       rgSortOrder.Width := 118;
                       rgSortOrder.left :=  404;
                       LastReportOnIndex := rgReportOn.itemIndex;
                    end;
              end
           else
              Begin
                 if ( LastReportOnIndex in [3,4,5,6] ) then // only change where Necessary
                    begin
                       pFemales.Hide;
                       rgSortby.items.Clear;
                       //rgSortby.items.BeginUpdate;
                       rgSortby.items.add('&Animal Number');
                       rgSortby.items.add('&National Identity Number');
                       rgSortBy.Items.Add('Nat. &Id No. (Check Digit)');
                       rgSortBy.Items.Add('Nat. &Id No. (Last 4 Digits)');
                       rgSortby.items.add('Date Of &Birth');
                       //rgSortby.items.EndUpdate;
                       rgSortby.Width := 246;
                       rgSortby.columns := 1;
                       rgSortOrder.Width := 191;
                       rgSortOrder.left :=  328;
                       LastReportOnIndex := rgReportOn.itemIndex;
                    end
              End;
           rgSortBy.ItemIndex := 0;
        end
end;

procedure TStockInHerdFilter.ComboHerdCloseUp(Sender: TObject);
begin
   SetUpHerdReconciliation;
    if pPremiums.Visible then
       SetUpApplications;
//   rgReportOnClick(Self); // Setup the sort field options
end;

procedure TStockInHerdFilter.rgIncludeClick(Sender: TObject);
begin
   if pPurchSales.Showing then
      begin
         rgSortby.items.BeginUpdate;
         try
            rgSortby.items.Clear;
            rgSortby.items.add('&Animal Number');
            rgSortBy.Items.Add('&National Identity Number');
            rgSortBy.Items.Add('Nat. &Id No. (Check Digit)');
            if WinData.DefCountry(StrToInt(ComboHerd.Value)) = Ireland then
               rgSortBy.Items.Add('Nat. &Id No. (Last 4 Digits)')
            else
               rgSortBy.Items.Add('Nat. &Id No. ( Bar No. )');
            if (rgInclude.ItemIndex = 1 ) then
               rgSortby.items.add('&Purchase Date')
            else if (rgInclude.ItemIndex = 2) then
               rgSortby.items.add('&Sale Date')
            else if (rgInclude.ItemIndex = 3) then
               rgSortby.items.add('&Date of Death')
            else if (rgInclude.ItemIndex = 4) then
               begin
                  rgSortby.items.add('&Sale Date');
                  rgSortby.items.add('&Purchase Date');
               end;
         finally
            rgSortby.ItemIndex := 0;
            rgSortby.items.EndUpdate;
         end;
      end;

   lSupplier.Visible := (rgInclude.ItemIndex in [0,1,4,5] );
   cbSupplier.Visible := lSupplier.Visible;

   lCustomer.Visible := (rgInclude.ItemIndex in [0,2,3,4] );
   cbCustomer.Visible := lCustomer.Visible;

    pSaleDates.Hide;
    pPurchaseDates.Hide;
    cbSupplier.Value := '0';
    cbCustomer.Value := '0';

    pPurchaseDates.Visible := ( rgInclude.ItemIndex <> 0 );
    pSaleDates.Visible := ( rgInclude.ItemIndex <> 0 );

    case rgInclude.ItemIndex of
       1,
       5  : begin
              pPurchaseDates.Show;
              pPurchaseDates.Top := 155;
              pSaleDates.Hide;
           end;
       2,
       3 : begin
              pSaleDates.Show;
              pSaleDates.Top := 155;
              pPurchaseDates.Hide;
              if ( rgInclude.ItemIndex = 2 ) then
                 SwitchLabel.Caption := 'Sales Date From'
              else if ( rgInclude.ItemIndex = 3 ) then
                 SwitchLabel.Caption := 'Death Date From';
           end;
       4 : begin
              pPurchaseDates.Show;
              pPurchaseDates.Top := 155;
              pSaleDates.Show;
              pSaleDates.Top := 196;
              SwitchLabel.Caption := 'Sales Date From';
           end;
    end;
end;

procedure TStockInHerdFilter.PadRight(Var St : String; Len : Integer);
begin
   while Length(St) < Len Do
      St := St + ' ';
end;

function TStockInHerdFilter.StripPunctuation(StrToStrip: String ): String;
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

procedure TStockInHerdFilter.CreateSwsFiles;
Var
   ItemCount : Integer;
   SwsHFile : TextFile;
   SwsAFile : TextFile;
   eMailDir,
   Buffer,
   FlDir,
   FieldToFile : String;
   SWSDate : TDateTime;
   Result : Boolean;
begin
   SWSDate := Date;
   CreateTempSws;
   try
      pbStockBar.Position := pbStockBar.Min;
      with GenQuery do
         begin   // Bring in Herd Owner Details
            SQL.Clear;
            SQL.Add('SELECT HerdIdentity, Name, Address1, Address2, Address3');      //KVB HerdIdentifier not HerdIdentity???
            SQL.Add('FROM Owners O');                                                //SP Wrong Keith, HerdIdentity not HerdIdentifier!!!
            SQL.Add('WHERE (O.ID = "' + ComboHerd.Value + '" )');
            Open;
         end;
      pbStockBar.Position := 10;

         // Check if saving to floppy
      if FloppyDisk1.Checked = True then
         begin
            try
               FlDir := 'A:\';
            except
               //
            end;

            try
               FlDir := FlDir +  'HR2000_H.Dat';
               AssignFile(SWSHFile, FlDir );
               ReWrite(SWSHFile);
            except
              //
            end;
         end
      else   // or desktop
         begin
            try
               eMailDir := 'C:\Windows\Desktop\HR 2000';
               mkDir (eMailDir);
            except
               //
            end;

            try
               eMailDir := eMailDir +  '\HR2000_H.Dat';
               AssignFile(SWSHFile, eMailDir );
               ReWrite(SWSHFile);
            except
               //
            end;

         end;
         pbStockBar.Position := 20;

         begin
            ItemCount := 0;
            Buffer := '';
            while (ItemCount <= 4) do
               begin
                  FieldToFile := '';
                  //Herd Identity
                  if (ItemCount = 0) then
                     begin
                        FieldToFile := (GenQuery.Fields[ItemCount].AsString);
                        PadRight(FieldToFile,8);
                     end;
                  // Name
                  if (ItemCount = 1) then
                     begin
                        FieldToFile := (GenQuery.Fields[ItemCount].AsString);
                        PadRight(FieldToFile,35);
                     end;
                  // Address 1
                  if (ItemCount = 2) then
                     begin
                        FieldToFile := (GenQuery.Fields[ItemCount].AsString);
                        PadRight(FieldToFile,35);
                     end;
                  // Address 2
                  if (ItemCount = 3) then
                     begin
                        FieldToFile := (GenQuery.Fields[ItemCount].AsString);
                        PadRight(FieldToFile,35);
                     end;
                  // Address 3
                  if (ItemCount = 4) then
                     begin
                        FieldToFile := (GenQuery.Fields[ItemCount].AsString);
                        PadRight(FieldToFile,35);
                     end;
                     // Add to buffer
                     Buffer := Buffer + FieldToFile;
                     Inc(ItemCount);
               end;
               // Write line to SwsHFile
               WriteLn(SwsHFile,Buffer);
         end;
         CloseFile(SwsHFile);
         pbStockBar.Position := 30;
            //////////////////////////////////////////////////////////////////////////

         // Empty table
         with GenQuery do
            begin
               SQL.Clear;
               SQL.Add('Delete From TempSws');
               ExecSQL;
            end;

         // Fill table
         with GenQuery do
            begin
               SQL.Clear;
               SQL.Add('INSERT INTO TempSws ( HerdIdentity, NatID, SortNatId, DOB, AnimalID)');
               SQL.Add('SELECT DISTINCT O.HerdIdentity, A.NatIDNum, A.SortNatID, A.DateOfBirth, A.ID');
               SQL.Add('FROM Animals A, Owners O');
               SQL.Add('WHERE (O.ID=A.HerdID)');
               SQL.ADD('AND (A.AnimalDeleted = FALSE)');
               SQL.ADD('AND (A.HerdID = "' + ComboHerd.Value + '")');
               ExecSQL;
            end;
         pbStockBar.Position := 40;

         // Delete based on DOB
         with GenQuery do
            begin
               SQL.Clear;
               SQL.Add('DELETE FROM TempSws');
               SQL.Add('WHERE (DOB > "' + FormatDateTime(cUSDateStyle,SWSDate) + '")');
               ExecSQL;
            end;
         pbStockBar.Position := 50;

         // Delete based on Purchase
         with GenQuery do
            begin
               SQL.Clear;
               SQL.Add('DELETE FROM TempSws');
               SQL.Add('WHERE ( AnimalID IN (');
               SQL.Add(' SELECT AnimalID FROM events');
               SQL.Add(' WHERE ( EventDate > "' + FormatDateTime(cUSDateStyle,SWSDate) + '")');
               SQL.Add(' AND   ( EventType = ' + IntToStr(CPurchaseEvent) + ')))');
               ExecSQL;
            end;
         pbStockBar.Position := 60;

         // Delete based on Sales
         with GenQuery do
            begin
               SQL.Clear;
               SQL.Add('DELETE FROM TempSws');
               SQL.Add('WHERE ( AnimalID IN (');
               SQL.Add(' SELECT AnimalID FROM events');
               SQL.Add(' WHERE ( EventDate < "' + FormatDateTime(cUSDateStyle,SWSDate) + '")');
               SQL.Add(' AND   ( EventType = ' + IntToStr(CSaleDeathEvent) + ')))');
               ExecSQL;
            end;
         pbStockBar.Position := 70;

         // Delete based on Inter Herd
         with GenQuery Do
            begin
               SQL.Clear;
               SQL.Add('DELETE FROM TempSws');
               SQL.Add('WHERE (AnimalID IN (');
               SQL.Add('  SELECT AnimalID FROM IHM');
               SQL.Add('  WHERE (DateMoved < "' + FormatDateTime(cUSDateStyle,SWSDate) + '")');
               SQL.Add('  AND (NewHerdID <> "' + ComboHerd.Value + '")))');
               ExecSQL;
            end;
         pbStockBar.Position := 80;

         with GenQuery Do
            begin
               SQL.Clear;
               SQL.Add('SELECT HerdIdentity, NatId, SortNatID, DOB, AnimalID');
               SQL.Add('FROM TempSws');
               SQL.ADD('ORDER BY SortNatID ASC');
               ExecSQL;
            end;

         if FloppyDisk1.Checked = True then
            begin
               try
                  FlDir := 'A:\';
                  //mkDir (FlDir);
               except
                  //
               end;

               try
                  FlDir := FlDir +  'HR2000_A.Dat';
                  AssignFile(SWSAFile, FlDir );
                  ReWrite(SWSAFile);
               except
                  //
               end;
            end
         else
            begin
               try
                  eMailDir := 'C:\Windows\Desktop\HR 2000';
                  mkDir (eMailDir);
               except
                  //
               end;

               try
                  eMailDir := eMailDir +  '\HR2000_A.Dat';
                  AssignFile(SWSAFile, eMailDir );
                  ReWrite(SWSAFile);
               except
                  //
               end;
            end;

         pbStockBar.Position := 90;

         if (TempSws.RecordCount > 0) then
            begin
               // Loop through table
               TempSws.First;
               while (NOT TempSws.EOF) do
                  begin
                     ItemCount := 0;
                     Buffer := '';
                     while (ItemCount <= 1) do
                        begin
                           FieldToFile := '';
                           // Herd Identity
                           if ItemCount = 0 then
                              begin
                                 FieldToFile := (TempSws.Fields[ItemCount].AsString);
                                 PadRight(FieldToFile,8);
                              end;
                           // NatIdNum
                           if (ItemCount = 1) then
                              begin
                                 FieldToFile := StripPunctuation(TempSws.Fields[ItemCount].AsString);
                                 PadRight(FieldToFile,30);
                              end;
                           // Add to buffer
                              Buffer := Buffer + FieldToFile;
                              Inc(ItemCount);
                        end;
                        WriteLn(SwsAFile,Buffer);
                        TempSws.Next;
                  end;
               pbStockBar.Position := 99;
            end;
      CloseFile(SwsAFile);
      pbStockBar.Position := pbStockBar.Max;
      pbStockBar.Hide;

      TempSws.Close;
      TempSws.DeleteTable;
      TempSws.Free;
   except
      MessageDlg('Cannot create files',mtError,[mbOK],0);
   end;

   FloppyDisk1.Checked := False;
   Desktop1.Checked := False;
end;

procedure TStockInHerdFilter.Desktop1Click(Sender: TObject);
begin
   if ComboHerd.Text = 'All Herds' then
      ShowMessage('All Herds is currently selected, please select your herd')
   else
      begin
         pbStockBar.Position := 0;
         pbStockBar.Show;
         Desktop1.Checked := True;
         FloppyDisk1.Checked := False;
         MessageDlg('The files will be saved to a folder on the Desktop, HR2000'+#13+
                    'Copy both files onto a formatted floppy disk, labeled with'+#13+
                    'your BTE Herdnumber.',mtConfirmation,[mbOK],0);
         CreateSwsFiles;
      end;
end;

procedure TStockInHerdFilter.FloppyDisk1Click(Sender: TObject);
begin
   if ComboHerd.Text = 'All Herds' then
      ShowMessage('All Herds is currently selected, please select your herd')
   else
      begin
         pbStockBar.Position := 0;
         pbStockBar.Show;
         FloppyDisk1.Checked := True;
         Desktop1.Checked := False;
         MessageDlg('Please insert a formatted floppy disk, labeled with'+#13+
                    'your BTE Herdnumber into the floppy drive and click OK.',mtConfirmation,[mbOK],0);
         CreateSwsFiles;
      end;
end;

procedure TStockInHerdFilter.sbHelpClick(Sender: TObject);
begin
   if pStockOnHand.Visible = True then
      WinData.HTMLHelp('soh.htm')
   else if pPurchSales.Visible = True then
      WinData.HTMLHelp('PurSalesRpt.htm')
   else
      WinData.HTMLHelp('PremRpt.htm');
end;

procedure TStockInHerdFilter.rgpremtypeClick(Sender: TObject);
begin
   AppDate.LookupSource := nil;
   SetUpApplications;
   if rgPremType.ItemIndex = 0 then
      begin
         DateGroup.Items.Clear;
         DateGroup.Items.Add('&Application Date');
         DateGroup.Items.Add('&Eligibility Date');
         cbToBeAppliedFor.Show;
         IncAnimalsSold.Show;
         AppDate.Top := 76;
         AppDate.LookupField := 'ApplicationID';
         AppDate.LookupDisplay := 'Date;Description';
         AppDate.LookupSource := dsApplications;
         AppDate.DisplayEmpty := '';
         rgSortby.items.Clear;
         rgSortby.items.add('&Animal Number');
         rgSortby.items.add('&National Identity Number');
         rgSortby.items.add('Date Of &Birth');
      end
   else
      begin
         DateGroup.Items.Clear;
         DateGroup.Items.Add('&Application Date');
         DateGroup.Items.Add('&Eligible For Replacements');
         EligibilityDate.Hide;
         cbToBeAppliedFor.Hide;
         IncAnimalsSold.Hide;
         AppDate.Top := 76;
         AppDate.LookupField := 'PremID';
         AppDate.LookupDisplay := 'DateOfApplic;Description';
         AppDate.LookupSource := dsApplications;
         AppDate.DisplayEmpty := 'All Applications';
         rgSortby.items.Clear;
         rgSortby.items.add('&Animal Number');
         rgSortby.items.add('&National Identity Number');
         rgSortby.items.add('Date Of &Birth');
         rgSortby.items.add('&Last Calving Date');
      end;
   DateGroup.ItemIndex := 0;
   rgSortby.ItemIndex := 0;
end;

procedure TStockInHerdFilter.CreateSuckTable;
begin
   try
      with StockInHerdFilter.SuckTable do
         begin
            SuckTable := TTable.Create(nil);
            SuckTable.TableType := ttParadox;
            SuckTable.TableName := 'SuckPrem.db';
            SuckTable.DatabaseName := WinData.KingData.DatabaseName;

            with SuckTable.FieldDefs do
               begin
                  Add('AnimalID',ftInteger,0,False);
                  Add('NatIDNum',ftString,20,False);
                  Add('SortNatID',ftString,20,False);
                  Add('AnimalNo',ftString,10,False);
                  Add('SortAnimalNo',ftString,10,False);
                  Add('CurrLact',ftInteger,0,False);
                  Add('ApplicLact',ftInteger,0,False);
                  Add('Breed',ftString,10,False);
                  Add('DOB',ftDate,0,False);
                  Add('RetensionDate',ftDate,0,False);
                  Add('RNatID',ftString,20,False); // Replaced Animal.
                  Add('ReplaceDate',ftDate,0,False);
                  Add('ApplicationDate',ftDate,0,False);
                  Add('Description',ftString,30,False);
                  Add('LastCalvingDate',ftDate,0,False);
                  Add('InHerd',ftBoolean,0,False);
                  Add('YearOfApplic',ftInteger,0,False);
               end;
               SuckTable.CreateTable;
               SuckTable.Open;
         end;

   except
      MessageDlg('Cannot create table, close program and reboot',mtError,[mbOK],0);
   end
end;

procedure TStockInHerdFilter.CreateNatIDSort(SortNatIDType : TSortNatIDType);
var
   SortStr : String;
begin
   with MyTable do
      begin
         First;
         while not eof do
            begin
               Application.ProcessMessages;
               Edit;
               try
                  if ( SortNatIDType = stCheckDigit ) then
                     SortStr := WinData.SortByCheckDigit(MyTable.FieldByName('NatID').AsString)
                  else
                     SortStr := WinData.SortByNatIDByFarmNo(MyTable.FieldByName('NatID').AsString);

                  if SortStr <> '' then
                     MyTable.FieldByName('SortNatID').AsString := SortStr; // Saved returned SortStr, if SortStr is empty use existing SortNatID Value

                  Post;
               except
                  Cancel;
               end;
               Next;
            end;
      end;
end;

procedure TStockInHerdFilter.SetUpHerdReconciliation;
begin
   if ComboHerd.Value <> '' then
      begin
         if WinData.DefCountry(StrToInt(ComboHerd.Value)) = Ireland then
            sbSws.DropDownMenu := PopSWS
         else
            sbSws.DropDownMenu := popHerdRecon;
      end
end;

procedure TStockInHerdFilter.HerdReconClick(Sender: TObject);
begin
   WinData.CallProg.HerdReconciliation;
end;

procedure TStockInHerdFilter.ComboHerdChange(Sender: TObject);
begin
   SetUpHerdReconciliation;
   rgReportOnClick(Self); // Setup the sort field options
end;

procedure TStockInHerdFilter.rgSTagClick(Sender: TObject);
begin
//   rgIncludeClick(nil);
end;

procedure TStockInHerdFilter.HerdReconciliation1Click(Sender: TObject);
begin
   if (ComboHerd.Text = '') or (ComboHerd.Text = 'All Herds') then
      MessageDlg('Please select your herd be continuing',mtInformation,[mbOk],0)
   else
      //   21/03/12 [V5.0 R4.5] /MK Change - New Boolean Check For Reconcile By Cards Checked Here.
      //   02/04/12 [V5.0 R4.8] /MK Change - New Boolean Check For If Clicked From Main Grid.
      uHerdRec.CreateAndShow(ComboHerd.KeyValue, False, True);
end;

{
function TStockInHerdFilter.GetInterAnimals(const ADate : TDateTime; const AHerdID : Integer) : String;
var
   IHMQuery,
   IHMDelete : TQuery;
   IHMTable : TTable;
   IDs : String;
   FirstID, Include, OrigHerd : Boolean;
   TempStr : String;
begin
   Result := '()';
   FirstID := True;

   IHMQuery := TQuery.Create(nil);
   IHMQuery.DatabaseName := WinData.KingData.DatabaseName;

   IHMDelete := TQuery.Create(nil);
   IHMDelete.DatabaseName := WinData.KingData.DatabaseName;

   IHMTable := TTable.Create(nil);
   IHMTable.DatabaseName := WinData.KingData.DatabaseName;
   IHMTable.TableName := 'IHMTable';
   IHMTable.FieldDefs.Clear;
   IHMTable.FieldDefs.Add('AnimalID', ftInteger, 0, False);
   IHMTable.FieldDefs.Add('LastHerdID', ftInteger, 0, False);
   IHMTable.FieldDefs.Add('NewHerdID', ftInteger, 0, False);
   IHMTable.FieldDefs.Add('DateMoved', ftDateTime, 0, False);
   IHMTable.CreateTable;
   IHMTable.Open;

   IHMDelete.SQL.Clear;
   IHMDelete.SQL.Add('Delete From IHMTable where AnimalID = :AID');


   IHMQuery.SQL.Add('Insert Into IHMTable (AnimalID, LastHerdID, NewHerdID, DateMoved) ');
   IHMQuery.SQL.Add('Select Distinct I.AnimalID, I.LastHerdID, I.NewHerdID, I.DateMoved From IHM I ');
   IHMQuery.ExecSQL;
   IHMQuery.SQL.Clear;
   IHMQuery.SQL.Add('Select * from IHMTable Where AnimalID =:AID');
   IHMQuery.SQL.Add('ORDER BY LastHerdID ');

   while IHMTable.RecordCount > 0 do
      begin
         IHMTable.First;

         IHMQuery.Params[0].AsInteger := IHMTable.FieldByName('AnimalID').AsInteger;
         IHMQuery.Open;

         IHMQuery.First;
         while not IHMQuery.eof do
            begin
               OrigHerd := IHMQuery.FieldByName('LastHerdID').AsInteger = AHerdID;
               if OrigHerd then
                  begin         // If DateMoved is after ADate then Include = True;
                     Include := IHMQuery.FieldByName('DateMoved').AsDateTime > ADate; // Sold after Adate.
                  end
               else
                  begin         // If DateMoved is before ADate then Include = True;
                     if not Include then
                        Include := IHMQuery.FieldByName('DateMoved').AsDateTime <= ADate
                  end;
               IHMQuery.Next;
            end;

         if Include then
            begin
               if FirstID then
                  begin
                     FirstID := False;
                     TempStr := '('+IHMTable.FieldByName('AnimalID').AsString
                  end
               else
                  TempStr := TempStr+ ',' + IHMTable.FieldByName('AnimalID').AsString;
            end;
         IHMDelete.Params[0].AsInteger := IHMTable.FieldByName('AnimalID').AsInteger;
         IHMDelete.ExecSQL;

         IHMQuery.Close;
      end;

   TempStr := TempStr + ')';
   if TempStr <> Result then
      Result := TempStr;

   IHMDelete.Close;
   IHMDelete.Free;

   IHMQuery.Close;
   IHMQuery.Free;

   IHMTable.Close;
   IHMTable.DeleteTable;
   IHMTable.Free;

end;
}
procedure TStockInHerdFilter.SetHerdType;
begin
   try
      FHerdType := HerdLookup.GetHerdType(StrToInt(ComboHerd.Value));
   except
      FHerdType := htDairy; // Default to dairy.
   end;

end;

procedure TStockInHerdFilter.cbUseFilterClick(Sender: TObject);
begin
   if cbUseFilter.Checked then
      begin
         if not WinData.ActiveFilter then
            begin
               cbUseFilter.State := cbUnchecked;
               MessageDlg(cNoFilterApplied,mtInformation,[mbOk],0);
            end
         else
            cbUseFilter.Font.Color := clBlue;
      end
   else
      cbUseFilter.Font.Color := clBlack;
end;

procedure TStockInHerdFilter.LoadScreenDefaults(ReportType : TReportType);
var
   DateRange : TDateRange;
   LactRange : TIntRange;
begin
   if ReportType = StockOnHand then
      begin
         StockOnHandDefault := TStockOnHandDefaults.Create(cRD_StockOnHand);
         try
            { Stock Date NOT REQUIRED }
            { Lactation Number }
           // LactRange := StockOnHandDefault.LactRange;
           // FromLact.AsInteger := LactRange.IntFrom;
           // ToLact.AsInteger := LactRange.IntTo;
           // { Date of birth }
           // DateRange := StockOnHandDefault.DOBRange;
           // if DateRange.FromDate > 0 then
           //    FromDOB.Date := DateRange.FromDate;
           // if DateRange.ToDate > 0 then
           //    TODOB.Date := DateRange.ToDate;
            { Dam Display Field }
            rgDamDisplay.ItemIndex := StockOnHandDefault.DisplayDamField;
            { Report On  - DO NOT CHANGE THIS SEQUENCE  ReportOn needs to be setup before setting the sort field values }
            rgReportOn.ItemIndex := StockOnHandDefault.ReportOn;
            { Sort Field  }
            rgSortBy.ItemIndex := StockOnHandDefault.SortField;
            { Sort Order }
            rgSortOrder.ItemIndex := StockOnHandDefault.SortOrder;
         finally
            FreeAndNil(StockOnHandDefault);
         end;
      end
   else

   if ( ReportType = PurchSales ) then
      begin
         PurchaseSalesDefaults := TPurchaseSalesDefaults.Create(cRD_PurchSales);
         try
            try
               if PurchaseSalesDefaults.Supplier > 0 then
                  cbSupplier.Value := IntToStr(PurchaseSalesDefaults.Supplier);
            except
            end;
            try
               if PurchaseSalesDefaults.Customer > 0 then
                  cbCustomer.Value := IntToStr(PurchaseSalesDefaults.Customer);
            except
            end;
            if PurchaseSalesDefaults.SaleInterval > 0 then
               FromSaleDate.Date := Trunc( Date - PurchaseSalesDefaults.SaleInterval);
            if PurchaseSalesDefaults.PurchaseInterval > 0 then
               FromPurchDate.Date := Trunc( Date - PurchaseSalesDefaults.PurchaseInterval);
            FPurchSalesOptions.IncludeLastPurchaseDetails := PurchaseSalesDefaults.IncludeLastPurchaseDetails;
            FPurchSalesOptions.IncludeAllPurchaseDetails := PurchaseSalesDefaults.IncludeAllPurchaseDetails;
            { Report On  - DO NOT CHANGE THIS SEQUENCE  ReportOn needs to be setup before setting the sort field values }
            rgInclude.ItemIndex := PurchaseSalesDefaults.ReportOn;
            { Sort Field  }
            rgSortBy.ItemIndex := PurchaseSalesDefaults.SortField;
            { Sort Order }
            rgSortOrder.ItemIndex := PurchaseSalesDefaults.SortOrder;
            { Include NatIDNum or AnimalNo }
//            rgSTag.ItemIndex := PurchaseSalesDefaults.IdentityField;
         finally
            FreeAndNil(PurchaseSalesDefaults);
         end;
      end;

end;

procedure TStockInHerdFilter.SaveScreenDefaults(ReportType: TReportType);
var
   DateRange : TDateRange;
   LactRange : TIntRange;
begin
   if ReportType = StockOnHand then
      begin
         StockOnHandDefault := TStockOnHandDefaults.Create(cRD_StockOnHand);
         try
            { Stock Date NOT REQUIRED }
            //LactRange.IntFrom := FromLact.AsInteger;
            //LactRange.IntTo := ToLact.AsInteger;
            //StockOnHandDefault.LactRange := LactRange;
            //DateRange.FromDate := FromDOB.Date;
            //DateRange.ToDate := TODOB.Date;
            //StockOnHandDefault.DOBRange := DateRange;
            StockOnHandDefault.DisplayDamField := rgDamDisplay.ItemIndex;
            StockOnHandDefault.ReportOn := rgReportOn.ItemIndex;
            StockOnHandDefault.SortField := rgSortBy.ItemIndex;
            StockOnHandDefault.SortOrder := rgSortOrder.ItemIndex;
         finally
            FreeAndNil(StockOnHandDefault);
         end;
      end
   else
   if ReportType = PurchSales then
      begin
         PurchaseSalesDefaults := TPurchaseSalesDefaults.Create(cRD_PurchSales);
         try
            try
               PurchaseSalesDefaults.Supplier := StrToInt(cbSupplier.Value);
            except
            end;
            try
               PurchaseSalesDefaults.Customer := StrToInt(cbCustomer.Value);
            except
            end;
            PurchaseSalesDefaults.SaleInterval := Trunc( ToSaleDate.Date - FromSaleDate.Date );
            PurchaseSalesDefaults.PurchaseInterval := Trunc( ToPurchDate.Date - FromPurchDate.Date );
            PurchaseSalesDefaults.IncludeLastPurchaseDetails := FPurchSalesOptions.IncludeLastPurchaseDetails;
            PurchaseSalesDefaults.IncludeAllPurchaseDetails := FPurchSalesOptions.IncludeAllPurchaseDetails;
            PurchaseSalesDefaults.ReportOn  := rgInclude.ItemIndex;
            PurchaseSalesDefaults.SortField := rgSortBy.ItemIndex;
            PurchaseSalesDefaults.SortOrder := rgSortOrder.ItemIndex;
         finally
            FreeAndNil(PurchaseSalesDefaults);
         end;
      end;
end;

procedure TStockInHerdFilter.FormDestroy(Sender: TObject);
begin
   if ( FReportType = StockOnHand ) then
      begin
         MyTable.Close;
         MyTable.Free;
      end
   else if ( FReportType = PurchSales ) then
      begin
         MyTable.Close;
         MyTable.DeleteTable;
      end
   else if ( FReportType = Premiums ) then
      begin
         SuckTable.Close;
         SuckTable.DeleteTable;
      end;
   if ( not(FFromBordBia) ) then
      SaveScreenDefaults(FReportType);
end;

procedure TStockInHerdFilter.FormActivate(Sender: TObject);
var
   pt : TPoint;
begin
   // 05/05/10 [V4.0 R3.5] /MK Additional Feature - Added Hint to View
   if pStockOnHand.Visible then
      if WinData.CanShowStandardReportHint then
         begin
            WinData.CallHintStyle;
            pt.x := 0;
            pt.y := 0;
            pt := sbView.ClientToScreen(pt);
            WinData.cxHint.ShowHint( pt.x , pt.y , 'View Report', 'Click here to view standard report');
         end;

   btnOptions.Width := 65;
   tbOptionsSep.Width := 8;
   btnOptions.Visible := ( FReportType = PurchSales );
   tbOptionsSep.Visible := btnOptions.Visible;
   if ( not(tbOptionsSep.Visible) ) then
      begin
         btnOptions.Width := 1;
         tbOptionsSep.Width := 1;
      end;

   FPurchSalesOptions.IncludeLiveWeight := True;
   FPurchSalesOptions.IncludeDeadWeight := False;
   FPurchSalesOptions.ReportTitle := '';

   OnActivate := nil;
end;

procedure TStockInHerdFilter.sbViewMouseLeave(Sender: TObject);
begin
   WinData.cxHint.HideHint;
end;

//   02/04/12 [V5.0 R4.8] /MK Additional Feature - Favourite Button Added.
procedure TStockInHerdFilter.cbFavouritePropertiesChange(Sender: TObject);
begin
   if cbFavourite.Checked then
      begin
         if ( FReportType = StockOnHand ) then
            WinData.SetReportAsFavourite(cStockOnHandRep,True)
         else
            WinData.SetReportAsFavourite(cPurchSalesAnalysisRep,True);
         cbFavourite.Style.TextColor := clBlue;
         cbFavourite.StyleHot.TextColor := clBlue;
      end
   else
      begin
         if ( FReportType = StockOnHand ) then
            WinData.SetReportAsFavourite(cStockOnHandRep,False)
         else
            WinData.SetReportAsFavourite(cPurchSalesAnalysisRep,False);
         cbFavourite.Style.TextColor := clBlack;
         cbFavourite.StyleHot.TextColor := clBlack;
      end;
   Application.ProcessMessages;
   Update;
end;

procedure TStockInHerdFilter.CreateSOHLogFileHeader;
begin
   if ( Length(GetSOHSelectionsString) > 0 ) then
      AddToDebugLogFile(WinData.KingData.Directory,GetSOHSelectionsString);
end;

function TStockInHerdFilter.GetSOHSelectionsString : String;
var
   sSelections : String;

   procedure AddToSelection ( ASelection : String );
   begin
      if ( Length(Result) > 0 ) then
         Result := Result + cCRLF;
      Result := Result + ASelection;
   end;

begin
   Result := '';
   if ( pStockOnHand.Visible ) then
      begin
         AddToSelection('Stock On Hand '+DateToStr(Now));
         if ( DateRequired.Date > 0 ) then
            AddToSelection('Report On '+DateToStr(DateRequired.Date));
         if ( FromDOB.Date > 0 ) then
            AddToSelection('Date Of Birth From '+DateToStr(FromDOB.Date));
         if ( ToDOB.Date > 0 ) then
            AddToSelection('Date Of Birth To '+DateToStr(ToDOB.Date));
         case rgReportOn.ItemIndex of
            0 : AddToSelection('Males Only');
            1 : AddToSelection('Bulls Only');
            2 : AddToSelection('Steers Only');
            3 : AddToSelection('Females Only');
            4 : AddToSelection('In Milk Only');
            5 : AddToSelection('Dried Only');
            6 : AddToSelection('All');
         end;
         if ( FromLact.Value >= 0 ) then
            AddToSelection('From Lacation '+FloatToStr(FromLact.Value));
         if ( ToLact.Value >= 0 ) then
            AddToSelection('To Lacation '+FloatToStr(ToLact.Value));
      end;
end;

procedure TStockInHerdFilter.btnOptionsClick(Sender: TObject);
var
   APurchSalesOptions : TPurchSalesOptions;
begin
   APurchSalesOptions := FPurchSalesOptions;
   TfmReportOptions.ShowPurchSalesOptions(APurchSalesOptions, otPurchSales);
   FPurchSalesOptions := APurchSalesOptions;
end;

end.

