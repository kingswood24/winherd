{
  04/02/2009 [Rel V3.9 R4.9, Dev V3.9 R5.9] /SP Program Improvement - New edit allowing user to scan either tag or dob/sex/breed .

  04/10/11 [V5.0 R1.0] /MK Additional Feature - Various Changes Made For Crush System To Updates Animals In Herd With Purchase Details.

  06/10/11 [V5.0 R1.2] /MK Additional Feature - New StartNewLot Procedure

  25/10/11 [V5.0 R2.2] /MK Bug - If TBTestDate Entered On Crush System Then Update Animals With TBTestDate.

  16/01/12 [V5.0 R3.4] /MK Bug Fix - Only Checking If VarIsNull - Also Checking For If AID = 0.

  01/08/12 [V5.0 R8.3] /MK Change - NatIDNumValidate, SearchForAnimalClick - Purchase Weight should always be the first weighing event found.

  28/03/13 [V5.1 R5.4] /MK Change - Changed Supplier Combo.LookupSource to look at new WinData.QuerySuppliers.

  02/10/14 [V5.3 R7.4] /MK Change - bCalcClick - Added code to calc cost based on total cost/weight of animals in a LotNo.

  16/03/16 [V5.5 R5.4] /MK Change - qBatchNum - Changed query to sort by description.

  11/10/16 [V5.6 R0.9] /MK Change - Changed LotNo to a String field - IAD.
                                  - Added Mixed to Sex drop-down-list - IAD.

  20/10/16 [V5.6 R2.5] /MK Bug Fix - LotNumber never saved to the purchase table.
                                   - LotNumber never saved to the XML file.

  01/11/16 [V5.6 R2.9] /MK Bug Fix - SupplierChange, BuyerChange - No locates done on the Suppliers or Buyers table for newly selected value - IAD.                                                                     

  14/09/17 [V5.7 R3.0] /MK Change - Changed WinData.AddToGroup to WinData.GroupManager.AddToGroup for more accurate calculation of FeedAllocation date based on purchase/birth date. 

  22/09/17 [V5.7 R3.0] /MK Bug Fix - PurchBatchNumCloseUp - Refresh purchase groups dataset after uGroupSetup closes to get any new groups created.

  25/10/17 [V5.7 R4.1] /MK Change - tPurchGrpDataNatIDNumSetText - If tag entered is without IE or 372 then add the IE/372 and validate it.

  07/06/18 [V5.8 R0.6] /MK Change - AddAnimalToXMLFile - Add NationalID number to CrushXML file.
}

unit uBBPPurchScr;

interface

{
  SP 25/10/2002:-

  Crush Weighing File Routine.

  SP 25/10/2002.
}

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, Forms, DBCtrls, DB, DBTables, Mask, ExtCtrls, Buttons, RXLookup,
  RXCtrls, ComCtrls, ToolWin, Grids, DBGrids, RXDBCtrl, ToolEdit, CurrEdit,
  Menus, RXSplit, kwDBNavigator, DBGridEh, Dialogs, uSPParser, uCrush,
  uCrushHelper, jpeg, cxImage, cxControls, cxContainer, cxEdit, cxTextEdit,
  GenTypesConst, cxLabel, cxButtons, uCrushPurchGrpAnimalSearch, uCrushXML,
  EventRecording, KDBRoutines, uAnimal;

type
  TfBBPPurchScr = class(TForm)
    ToolBar1: TToolBar;                                                                                         
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton2: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton4: TToolButton;
    tPurchGrpHeader: TTable;
    dsPurchGrpHeader: TDataSource;
    tPurchGrpData: TTable;
    dsPurchGrpData: TDataSource;
    tPurchGrpDataID: TAutoIncField;
    tPurchGrpDataSeqNum: TSmallintField;
    tPurchGrpDataNatIDNum: TStringField;
    tPurchGrpDataAnimalNo: TStringField;
    tPurchGrpDataPrimaryBreed: TIntegerField;
    tPurchGrpDataWeight: TFloatField;
    tPurchGrpDataEventDesc: TStringField;
    tPurchGrpDataGrade: TStringField;
    tPurchGrpDataColour: TIntegerField;
    tPurchGrpDataMartPrice: TFloatField;
    tPurchGrpDataCostIntoPen: TFloatField;
    tPurchGrpDataDateOfBirth: TDateField;
    tPurchGrpDataTBTestDate: TDateField;
    tPurchGrpDataEventDate: TDateField;
    tPurchGrpDataSupplierID: TIntegerField;
    tPurchGrpDataBuyerID: TIntegerField;
    tPurchGrpDataGroupID: TIntegerField;
    tPurchGrpDataPenID: TIntegerField;
    tPurchGrpDataBreeding: TBooleanField;
    tPurchGrpDataLactationNumber: TSmallintField;
    tPurchGrpDataSupplierCosts: TFloatField;
    tPurchGrpDataBuyerCosts: TFloatField;
    pPurchGrp: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    dbcbSex: TDBComboBox;
    dbPurchGrpNum: TDBEdit;
    dbPurchGrpMartWt: TDBEdit;
    dbPurchGrpMartCost: TDBEdit;
    HerdLookup: TRxDBLookupCombo;
    DBCheckBox1: TDBCheckBox;
    dbPurchGrpLactation: TDBEdit;
    Supplier: TRxDBLookupCombo;
    Buyers: TRxDBLookupCombo;
    dbPurchGrpDesc: TDBEdit;
    dbdPurchGrpDate: TDBDateEdit;
    OtherCosts: TCurrencyEdit;
    dbPurchGrpVar: TDBEdit;
    dbPurchGrpVAT: TDBEdit;
    dbcbGroupNum: TRxDBLookupCombo;
    dbcbPenNum: TRxDBLookupCombo;
    PurchBatchNum: TRxDBLookupCombo;
    qGeneral: TQuery;
    dsGeneral: TDataSource;
    qBatchNum: TQuery;
    qPenNum: TQuery;
    qPurchGrpNum: TQuery;
    dsBatchNum: TDataSource;
    dsPenNum: TDataSource;
    dsPurchGrpNum: TDataSource;
    tPurchGrpDataBreedName: TStringField;
    tPurchGrpDataBatchName: TStringField;
    tPurchGrpDataPenName: TStringField;
    tPurchGrpDataColourName: TStringField;
    tPurchGrpDataSupplierName: TStringField;
    tPurchGrpDataBuyerName: TStringField;
    tPurchGrpHeaderID: TAutoIncField;
    tPurchGrpHeaderPurchGroupID: TIntegerField;
    tPurchGrpHeaderPurchGrpCode: TStringField;
    tPurchGrpHeaderPurchaseDate: TDateField;
    tPurchGrpHeaderSupplierID: TIntegerField;
    tPurchGrpHeaderSupplierCosts: TFloatField;
    tPurchGrpHeaderBuyerID: TIntegerField;
    tPurchGrpHeaderBuyerCosts: TFloatField;
    tPurchGrpHeaderSex: TStringField;
    tPurchGrpHeaderNumber: TSmallintField;
    tPurchGrpHeaderMartWeight: TFloatField;
    tPurchGrpHeaderMartCost: TFloatField;
    tPurchGrpHeaderVAT: TFloatField;
    tPurchGrpHeaderHerdID: TIntegerField;
    tPurchGrpHeaderGroupID: TIntegerField;
    tPurchGrpHeaderPenID: TIntegerField;
    tPurchGrpHeaderBreeding: TBooleanField;
    tPurchGrpHeaderLactationNumber: TSmallintField;
    tPurchGrpHeaderEventDesc: TStringField;
    tPurchGrpHeaderOfficePhase1: TBooleanField;
    tPurchGrpHeaderTagWtVsMartWtVar: TFloatField;
    tPurchGrpHeaderDataPosted: TBooleanField;
    tPurchGrpHeaderTotWeight: TFloatField;
    tPurchGrpHeaderTotMartPrice: TFloatField;
    tPurchGrpHeaderTotCostIntoPen: TFloatField;
    bDelete: TRxSpeedButton;
    bCalc: TRxSpeedButton;
    Panel1: TPanel;
    RxSplitter1: TRxSplitter;
    tPurchGrpDataPurchGrpHeaderID: TIntegerField;
    LookUpPurchGrpData: TTable;
    dbPurchGrpCode: TDBText;
    bUpdateDBs: TRxSpeedButton;
    ToolButton1: TToolButton;
    tPurchGrpDataFirstPrem: TBooleanField;
    tPurchGrpDataSecondPrem: TBooleanField;
    tPurchGrpDataBullPrem: TBooleanField;
    tPurchGrpHeaderActualNumber: TSmallintField;
    RxSpeedButton2: TRxSpeedButton;
    ToolButton5: TToolButton;
    CfDivider: TToolButton;
    cwfOpen: TOpenDialog;
    Label4: TLabel;
    tPurchGrpDataMatched: TBooleanField;
    Parser: TSPParser;
    gData: TDBGridEh;
    tPurchGrpDatacGroupID: TIntegerField;
    tPurchGrpDataSex: TStringField;
    pDelete: TPanel;
    Label1: TLabel;
    rbDelete: TRadioGroup;
    bOK: TButton;
    RxSpeedButton3: TRxSpeedButton;
    ToolButton6: TToolButton;
    pmOptions: TPopupMenu;
    miMatchtoCrushFile: TMenuItem;
    miAutomaticGridUpdates: TMenuItem;
    pmGridColumns: TPopupMenu;
    UpdateProgress: TProgressBar;
    Panel2: TPanel;
    lTotalWt: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lTotalNum: TLabel;
    dbtActualNumber: TDBText;
    dbtTotWeight: TDBText;
    dbtTotMartPrice: TDBText;
    dbtTotCostIntoPen: TDBText;
    sbDeleteCurrent: TRxSpeedButton;
    DBNavigator: TKwDBNavigator;
    tPurchGrpDataAID: TIntegerField;
    tPurchGrpDataEID: TIntegerField;
    CustomizeGridColumns1: TMenuItem;
    sbCrushData: TRxSpeedButton;
    ToolButton7: TToolButton;
    pBarcode: TPanel;
    Label7: TLabel;
    teBarcode: TcxTextEdit;
    imgBarcode: TcxImage;
    Label9: TLabel;
    pWarningPanel: TPanel;
    lWarningPanelLabel: TcxLabel;
    ErrorTimer: TTimer;
    btnSearchForAnimal: TcxButton;
    tPurchGrpDataSearchNatID: TStringField;
    tPurchGrpDataLotNo: TStringField;
    procedure FormShow(Sender: TObject);
    procedure dbcbGroupNumCloseUp(Sender: TObject);
    procedure dbcbPenNumCloseUp(Sender: TObject);
    procedure tPurchGrpDataNewRecord(DataSet: TDataSet);
    procedure PurchBatchNumCloseUp(Sender: TObject);
    procedure dbPurchGrpVATExit(Sender: TObject);
    procedure gDataColEnter(Sender: TObject);
    procedure bUpdateDBsClick(Sender: TObject);
    procedure bModifyGridClick(Sender: TObject);
    procedure dbcbGroupNumDropDown(Sender: TObject);
    procedure dbcbPenNumDropDown(Sender: TObject);
    procedure bDeleteClick(Sender: TObject);
    procedure bOKClick(Sender: TObject);
    procedure bCalcClick(Sender: TObject);
    procedure tPurchGrpDataDateOfBirthValidate(Sender: TField);
    procedure tPurchGrpDataTBTestDateValidate(Sender: TField);
    procedure tPurchGrpHeaderBeforeDelete(DataSet: TDataSet);
    procedure PurchBatchNumDropDown(Sender: TObject);
    procedure tPurchGrpDataNatIDNumValidate(Sender: TField);
    procedure tPurchGrpDataAnimalNoValidate(Sender: TField);
    procedure tPurchGrpDataNatIDNumGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure tPurchGrpDataNatIDNumSetText(Sender: TField; const Text: String);
    procedure tPurchGrpDataAnimalNoGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure tPurchGrpDataAnimalNoSetText(Sender: TField; const Text: String);
    procedure tPurchGrpDataDateOfBirthSetText(Sender: TField; const Text: String);
    procedure tPurchGrpDataTBTestDateSetText(Sender: TField; const Text: String);
    procedure tPurchGrpDataEventDateSetText(Sender: TField; const Text: String);
    procedure tPurchGrpDataAfterDelete(DataSet: TDataSet);
    procedure tPurchGrpDataEventDateValidate(Sender: TField);
    procedure SupplierChange(Sender: TObject);
    procedure dbcbSexChange(Sender: TObject);
    procedure BuyersChange(Sender: TObject);
    procedure HerdLookupChange(Sender: TObject);
    procedure dbcbGroupNumChange(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure dbPurchGrpDescChange(Sender: TObject);
    procedure dbcbPenNumChange(Sender: TObject);
    procedure dbPurchGrpLactationChange(Sender: TObject);
    procedure gDataColExit(Sender: TObject);
    procedure tPurchGrpDataAfterPost(DataSet: TDataSet);
    procedure PurchBatchNumChange(Sender: TObject);
    procedure PurchBatchNumExit(Sender: TObject);
    procedure tPurchGrpDataSexValidate(Sender: TField);
    procedure tPurchGrpDataFirstPremValidate(Sender: TField);
    procedure tPurchGrpDataSecondPremValidate(Sender: TField);
    procedure tPurchGrpDataBullPremValidate(Sender: TField);
    procedure RxSpeedButton2Click(Sender: TObject);
    procedure sbCrushDataClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tPurchGrpHeaderBeforePost(DataSet: TDataSet);
    procedure tPurchGrpHeaderBeforeInsert(DataSet: TDataSet);
    procedure sbDeleteCurrentClick(Sender: TObject);
    procedure gDataGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure tPurchGrpDataBreedingValidate(Sender: TField);
    procedure FormDestroy(Sender: TObject);
    procedure miMatchtoCrushFileClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure miAutomaticGridUpdatesClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure dbdPurchGrpDateExit(Sender: TObject);
    procedure CustomizeGridColumns1Click(Sender: TObject);
    procedure SupplierCloseUp(Sender: TObject);
    procedure BuyersCloseUp(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure pBarcodeClick(Sender: TObject);
    procedure teBarcodeExit(Sender: TObject);
    procedure ErrorTimerTimer(Sender: TObject);
    procedure btnSearchForAnimalClick(Sender: TObject);
  private
    function GetMatchAnimalsToCrushFile: Boolean;
    procedure SetMatchAnimalsToCrushFile(const Value: Boolean);
    function GetAutoGridUpdate: Boolean;
    procedure SetAutoGridUpdate(const Value: Boolean);
    procedure ReadBarcodeOuput(var msg: TMessage); message WM_ReadBarcodeOuput;
    //   06/10/11 [V5.0 R1.2] /MK Additional Feature - New StartNewLot Procedure
    procedure StartNewLot;
  private
    { private declarations }
    ColNum : Integer;
    CrushQuery : TQuery;
    BarCodeSex : string;
    strErrorMsg : string;
    FSearchForm : TfmCrushGrpPurchAnimalSearch;
    FLotPurchGrpID : Integer;
    { Crush System }
    procedure NewPurchGrpProc(PBatNum : Integer);
    procedure BatchEndCalcs;
    procedure BatchNumDropDownList;
    procedure PenNumDropDownList;
    procedure PurchGrpDropDownList;
    procedure CountSumTotals;
    function CheckRequiredFields : Boolean;
    procedure FindHeader;
    function CheckBullPrem : Boolean;
    function CheckFirstPrem : Boolean;
    function CheckSecondPrem : Boolean;
    { Crush System }
    procedure MatchToCrush(const NatID : String);
    function GetActualNumberInGroup : Integer;

    procedure gridColMIClick(Sender : TObject);

    procedure ProcessBarcodeScan;

    property MatchAnimalsToCrushFile : Boolean read GetMatchAnimalsToCrushFile write SetMatchAnimalsToCrushFile;
    property AutoGridUpdate : Boolean read GetAutoGridUpdate write SetAutoGridUpdate;

  public
    { public declarations }
  end;


const
   Reg_AutoGridUpdate = 'AutoGridUpdate';

procedure CreateAndShow;

implementation
uses
    BDE,
    uSuppliers,
    uBuyers,
    uHerdSetUp,
    uGroupSetUp,
    DairyData,
    MenuUnit,
    KRoutines,
    Def,
    gridcols;

var
  fBBPPurchScr: TfBBPPurchScr;

{$R *.DFM}

procedure CreateAndShow;
begin
   Application.CreateForm(TfBBPPurchScr, fBBPPurchScr );
   try
      fBBPPurchScr.ShowModal;
   finally
      if fBBPPurchScr <> nil then
         begin
            fBBPPurchScr.Free;
         end;
   end;
end;

procedure TfBBPPurchScr.FormShow(Sender: TObject);
begin

     try
        //First hide pDelete panel
        pDelete.Hide;

        miMatchtoCrushFile.Checked := MatchAnimalsToCrushFile;
        miAutomaticGridUpdates.Checked := AutoGridUpdate;
        sbCrushData.Visible := miMatchtoCrushFile.Checked;

        if miMatchtoCrushFile.Checked then
           begin
              Global_Crush.InvokeReview := True;
              Global_Crush.CrushFileType := cftPurchase;
           end;

        PurchBatchNum.SetFocus;     //Sets Focus on Purchase Batch Number
        ColNum := 1;                //Sets Column Number in grid

        //Now to open some SQL's to provide the drop down lists for some fields
        BatchNumDropDownList;
        PenNumDropDownList;
        PurchGrpDropDownList;

        //Now to select the fist tPurchGrpHeader record
        if tPurchGrpHeader.RecordCount > 0 then
           begin
                tPurchGrpHeader.First;
                tPurchGrpHeader.Edit;
                //The following line causes the OnChange event to activate.
                //PurchBatchNum.Value := tPurchGrpHeader.FieldByName('PurchGrpCode').AsString;
                OtherCosts.Value := tPurchGrpHeader.FieldByName('SupplierCosts').AsFloat +
                                    tPurchGrpHeader.FieldByName('BuyerCosts').AsFloat
           end;
     finally
         // Set the Drop Down to the current record in the Query of Available Purchase Headers
         if ( NOT qPurchGrpNum.IsEmpty ) then
            PurchBatchNum.Value := qPurchGrpNum.FieldByName('ID').AsString;
     end;
end;

procedure TfBBPPurchScr.BatchNumDropDownList;
Begin
   qBatchNum.Close;  //Will refresh the drop down list
   qBatchNum.Open;
End;

procedure TfBBPPurchScr.PenNumDropDownList;
Begin
   qPenNum.Close;     //Will refresh the drop down list
   qPenNum.Open;
End;

procedure TfBBPPurchScr.PurchGrpDropDownList;
Begin
   qPurchGrpNum.Close;    //Will refresh the drop down list
   qPurchGrpNum.Open;
End;

procedure TfBBPPurchScr.dbcbGroupNumCloseUp(Sender: TObject);
var
   GroupID : SmallInt;
begin
   if dbcbGroupNum.Value = '0' then
      Begin   //Show shortened version of the uGroupSetUp form for Batches setup
         uGroupSetUp.ShowTheFormID(1, GroupID);   // Ind = 1 displays shortened version for Groups
         if GroupID <> 0 then
            dbcbPenNum.KeyValue := GroupID;
      End;
end;

procedure TfBBPPurchScr.dbcbPenNumCloseUp(Sender: TObject);
var
   GroupID : SmallInt;
begin
   if dbcbPenNum.Value = '0' then
      begin  //Show shortened version of the uGroupSetUp form for Pens setup
         uGroupSetUp.ShowTheFormID(2, GroupID);   // Ind = 2 displays shortened version for Pens
         if GroupID <> 0 then
            dbcbPenNum.KeyValue := GroupID;
      end;
end;

procedure TfBBPPurchScr.tPurchGrpDataNewRecord(DataSet: TDataSet);
begin
     //First need to create a new record in tPurchGrpData as the OnChange events for
     //each field in tPurchGrpData write the changes in values for tPurchGrpData
     //to tPurchGrpData
     tPurchGrpData.FieldByName('PurchGrpHeaderID').AsInteger := tPurchGrpHeader.FieldByName('ID').AsInteger;
     tPurchGrpData.FieldByName('EventDesc').AsString := tPurchGrpHeader.FieldByName('EventDesc').AsString;
     tPurchGrpData.FieldByName('EventDate').AsDateTime := tPurchGrpHeader.FieldByName('PurchaseDate').AsDateTime;
     tPurchGrpData.FieldByName('SupplierID').AsInteger := tPurchGrpHeader.FieldByName('SupplierID').AsInteger;
     tPurchGrpData.FieldByName('BuyerID').AsInteger := tPurchGrpHeader.FieldByName('BuyerID').AsInteger;
     tPurchGrpData.FieldByName('Sex').AsString := tPurchGrpHeader.FieldByName('Sex').AsString;
     tPurchGrpData.FieldByName('GroupID').AsInteger := tPurchGrpHeader.FieldByName('GroupID').AsInteger;
     tPurchGrpData.FieldByName('PenID').AsInteger := tPurchGrpHeader.FieldByName('PenID').AsInteger;
     tPurchGrpData.FieldByName('Breeding').AsBoolean := tPurchGrpHeader.FieldByName('Breeding').AsBoolean;
     tPurchGrpData.FieldByName('LactationNumber').AsInteger := tPurchGrpHeader.FieldByName('LactationNumber').AsInteger;
     tPurchGrpData.FieldByName('SupplierCosts').AsFloat := tPurchGrpHeader.FieldByName('SupplierCosts').AsFloat;
     tPurchGrpData.FieldByName('BuyerCosts').AsFloat := tPurchGrpHeader.FieldByName('BuyerCosts').AsFloat;
     tPurchGrpData.FieldByName('FirstPrem').AsBoolean := False;
     tPurchGrpData.FieldByName('SecondPrem').AsBoolean := False;
     tPurchGrpData.FIeldByName('BullPrem').AsBoolean := False;

     CountSumTotals;  //Now to add one to the ActualNumber
end;

procedure TfBBPPurchScr.FindHeader;
Var
   NumID : Integer;
   NumCode : String;
begin

   // Do we need to load new crush file ?
   // We do need to load previous entries.
   if not( VarIsNull(PurchBatchNum.KeyValue) ) then
      begin
         NumID := qPurchGrpNum.FieldbyName('ID').AsInteger;   //Records ID
         NumCode := qPurchGrpNum.FieldbyName('Code').AsString;   //Records Code

         if ( tPurchGrpHeader.RecordCount = 0 ) then
            begin   //Strange things happen with a locate on a table with no records
               If tPurchGrpHeader.State = dsEdit then
                  tPurchGrpHeader.CancelUpdates; // Open;   // Ensures that  two records do not get posted
               If tPurchGrpHeader.State <> dsInsert then
                  tPurchGrpHeader.Append;    //Puts table in Insert mode
               //Now to record and reset the rAutomaticGridUpdate boolean
               NewPurchGrpProc(NumID);
            end
         else
            begin    //At least one record exists
               //Now to record and reset the rAutomaticGridUpdate boolean


               if ( Not tPurchGrpHeader.Locate('PurchGroupID', NumID, [loPartialKey]) ) then
                  begin   //Need to create a new record in tPurchGrpHeader.db
                     If tPurchGrpHeader.State = dsEdit then
                        tPurchGrpHeader.CancelUpdates; // Open;   // Ensures that  two records do not get posted
                     If tPurchGrpHeader.State <> dsInsert then
                        tPurchGrpHeader.Append;   //Puts table in Insert mode
                     NewPurchGrpProc(NumID);
                  end
               else    //Record in tPurchGrpHeader.db exists, need to edit it
                  begin
                     tPurchGrpHeader.Edit;
                     //Now to update Transport & Commission figure
                     OtherCosts.Value := tPurchGrpHeader.FieldByName('SupplierCosts').AsFloat +
                                         tPurchGrpHeader.FieldByName('BuyerCosts').AsFloat;
                  end;
            end;
      end;


end;

procedure TfBBPPurchScr.PurchBatchNumCloseUp(Sender: TObject);
var
   GroupID : SmallInt;
begin
     // First record PurchBatchNum.Value
     if ( PurchBatchNum.Value = '0' ) then
         begin    //Now to add new Purchase Group
             uGroupSetUp.ShowTheFormID(3, GroupID);   // Ind = 1 displays shortened version for Groups
             //   22/09/17 [V5.7 R3.0] /MK Bug Fix - Refresh purchase groups dataset after uGroupSetup closes to get any new groups created.
             dsPurchGrpNum.DataSet.Close;
             dsPurchGrpNum.DataSet.Open;
             if GroupID <> 0 then
                PurchBatchNum.KeyValue := IntToStr(GroupID);
         end
     else     //Need to locate the corresponding group in tPurchGrpHeader.db
         FindHeader;
end;

procedure TfBBPPurchScr.NewPurchGrpProc(PBatNum : Integer);
begin
     //Now to prefill the Comment field and set Data Posted to False
//     tPurchGrpHeader.FieldByName('ID').AsInteger := ????;
     tPurchGrpHeader.FieldByName('EventDesc').AsString := 'Purchase';
//     tPurchGrpHeader.FieldByName('DataPosted').AsBoolean := False; //WinHerd Databases
     //Need to prefill VAT with correct value. This needs to be modified to obtain it's
     //value from the defaults.db table.
     tPurchGrpHeader.FieldByName('VAT').AsFloat := WinData.VATRate;
     //Need to default HerdID if only one exists
     tPurchGrpHeader.FieldByName('HerdID').AsInteger := WinData.UserDefaultHerdID;
     if tPurchGrpHeader.FieldByName('HerdID').AsInteger <= 0 then
        tPurchGrpHeader.FieldByName('HerdID').AsInteger := WinData.DefaultHerdID;

     //Need to default 'Use For Breeding' and 'Current Lactation Number' if a Beef Herd
     If ( WinData.OwnerFile.Locate('ID', tPurchGrpHeader.FieldByName('HerdID').AsInteger, [loPartialKey]) ) then
        If ( WinData.OwnerFile.FieldByName('TypeOfHerd').AsInteger = 25 ) then
           Begin
                tPurchGrpHeader.FieldByName('Breeding').AsBoolean := False;
                tPurchGrpHeader.FieldByName('LactationNumber').AsInteger := 0;
           End;

     //Get Grps.db 'ID' and put it into PurchGrpHeader.db 'PurchGroupID'
     If ( WinData.Groups.Locate('ID', PBatNum, [loPartialKey]) ) then
        Begin
             tPurchGrpHeader.FieldByName('PurchGroupID').AsInteger := WinData.Groups.FieldByName('ID').AsInteger;
             tPurchGrpHeader.FieldByName('PurchGrpCode').AsString := WinData.Groups.FieldByName('Code').AsString;
        End
     Else
         Begin
              tPurchGrpHeader.FieldByName('PurchGroupID').AsInteger := 0;
              tPurchGrpHeader.FieldByName('PurchGrpCode').AsString := '0';
         End;
     tPurchGrpHeader.Post;    //Posts new record, creating a new tPurchGrpHeader.db 'ID'
end;

procedure TfBBPPurchScr.dbPurchGrpVATExit(Sender: TObject);
begin
     //Need to post data if required.
     If tPurchGrpHeader.State = dsEdit then
        tPurchGrpHeader.Post;
     //First need to compare value with VATRegistered boolean
     If (( tPurchGrpHeader.FieldByName('HerdID').AsInteger <> WinData.NONEHerdID ) AND ( WinData.OwnerFile.Locate('ID', tPurchGrpHeader.FieldByName('HerdID').AsVariant, [loPartialKey]) )) then
        Begin
             If (( WinData.OwnerFileVATRegistered.AsBoolean = True ) AND ( tPurchGrpHeader.FieldByName('VAT').AsFloat = 0 )) then
                MessageDlg('VAT should not be zero for a VAT Registered Herd',mtInformation,[mbOK],0)
             Else If (( WinData.OwnerFileVATRegistered.AsBoolean = False ) AND ( tPurchGrpHeader.FieldByName('VAT').AsFloat <> 0 )) then
                MessageDlg('VAT should be zero for a non-VAT Registered Herd',mtInformation,[mbOK],0)
             Else if tPurchGrpHeader.FieldByName('VAT').AsFloat <> WinData.VATRate then
                     if ( MessageDlg('Do you wish to use this new value as the new VAT default?',mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
                        WinData.VATRate := tPurchGrpHeader.FieldByName('VAT').AsFloat;
        End
     Else
         Begin
              //Need to check if the value has been changed and if so, then need to check if this
              //is to be the new default value.
              if tPurchGrpHeader.FieldByName('VAT').AsFloat <> WinData.VATRate then
                 if ( MessageDlg('Do you wish to use this new value as the new VAT default?',mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
                    WinData.VATRate := tPurchGrpHeader.FieldByName('VAT').AsFloat;
         End;
end;

procedure TfBBPPurchScr.gDataColEnter(Sender: TObject);
begin
     //Need to determine which column has just been exited - gData.Col is an
     //integer giving the column number (0 for first) in the grid as shown on the screen
     ColNum := gData.Col;
end;

procedure TfBBPPurchScr.bUpdateDBsClick(Sender: TObject);
var
   RecTotWeight : Double;

   FirstPremMonths : Smallint;
   SecondPremMonths : Smallint;
   BullPremMonths : Smallint;

   tAnimals,
   tEvents,
   tPurchases : TTable;

   procedure AddAnimalToGroup(AID : Integer);
   begin
      if ( tPurchGrpHeader.FieldByName('PurchGroupID').AsInteger <> 0 ) then
         WinData.GroupManager.AddToGroup(AID, tPurchGrpHeader.FieldByName('PurchGroupID').AsInteger,
                                         FALSE, tPurchGrpData.FieldByName('EventDate').AsDateTime,
                                         tPurchGrpData.FieldByName('NatIDNum').Value);

      if ( tPurchGrpData.FieldByName('GroupID').AsInteger <> 0 ) then
         WinData.GroupManager.AddToGroup(AID, tPurchGrpData.FieldByName('GroupID').AsInteger,
                                         FALSE, tPurchGrpData.FieldByName('EventDate').AsDateTime,
                                         tPurchGrpData.FieldByName('NatIDNum').Value);

      if ( tPurchGrpData.FieldByName('PenID').AsInteger <> 0 ) then
         WinData.GroupManager.AddToGroup(AID, tPurchGrpData.FieldByName('PenID').AsInteger,
                                         FALSE, tPurchGrpData.FieldByName('EventDate').AsDateTime,
                                         tPurchGrpData.FieldByName('NatIDNum').Value);
   end;

   procedure ProcessPurchaseEvent;
   var
      iAnimalID,
      iSupplierID,
      iPurBuyer : Integer;
      dEventDate,
      dTBTestDate : TDateTime;
      fAnimalWeight,
      fAnimalPrice,
      fSupplierCosts,
      fBuyerCosts : Double;
      sGrade,
      sLotNo : String;
      Animal : TAnimal;
   begin
      iAnimalID := 0;
      iSupplierID := 0;
      iPurBuyer := 0;
      dEventDate := 0;
      dTBTestDate := 0;
      fAnimalWeight := 0;
      fAnimalPrice := 0;
      fSupplierCosts := 0;
      fBuyerCosts := 0;
      sGrade := '';
      sLotNo := '';

      //   16/01/12 [V5.0 R3.4] /MK Bug Fix - Only Checking If VarIsNull - Also Checking For If AID = 0.
      if ( VarIsNull(tPurchGrpData.FieldByName('AID').AsInteger) or (tPurchGrpData.FieldByName('AID').AsInteger = 0) ) then
         begin
            tPurchGrpData.Edit;
            tPurchGrpData.FieldByName('AID').AsInteger := tAnimals.FieldByName('ID').Value;
            tPurchGrpData.Post;
         end;

      if ( tAnimals.Locate('ID',tPurchGrpData.FieldByName('AID').AsInteger,[]) ) then
         if tPurchGrpData.FieldByName('TBTestDate').AsDateTime > 0 then
            begin
               dTBTestDate := tPurchGrpData.FieldByName('TBTestDate').AsDateTime;
               tAnimals.Edit;
               tAnimals.FieldByName('TBTestDate').AsDateTime := tPurchGrpData.FieldByName('TBTestDate').AsDateTime;
               tAnimals.Post;
            end;

      if ( tPurchGrpData.FieldByName('AID').AsInteger > 0 ) then
         begin
            // Now to check that there is a Purchase Date and Supplier ID
            if (( tPurchGrpData.FieldByName('EventDate').AsDateTime > 0 ) AND ( tPurchGrpData.FieldByName('SupplierID').AsInteger > 0 ))then
               begin
                  if not tEvents.Locate('AnimalID;EventType',VarArrayOf([tPurchGrpData.FieldByName('AID').Value, CPurchaseEvent]),[]) then
                     begin
                        tEvents.Append;
                        try
                           tEvents.FieldByName('ID').Value := WinData.NextEventID;
                           tEvents.FieldByName('AnimalID').Value := tPurchGrpData.FieldByName('AID').AsInteger;
                           iAnimalID := tPurchGrpData.FieldByName('AID').AsInteger;
                           tEvents.FieldByName('EventType').Value := cPurchaseEvent;
                           tEvents.FieldByName('AnimalLactNo').Value := tPurchGrpData.FieldByName('LactationNumber').Value;
                           tEvents.FieldByName('EventDate').Value := tPurchGrpData.FieldByName('EventDate').Value;
                           dEventDate := tPurchGrpData.FieldByName('EventDate').AsDateTime;
                           tEvents.FieldByName('EventDesc').Value := tPurchGrpData.FieldByName('EventDesc').Value;
                           tEvents.FieldByName('HerdID').Value := tAnimals.FieldByName('HerdID').AsInteger;
                           tEvents.Post;
                        except
                           tEvents.Cancel;
                           raise ErrorMsg.CreateFmt('Cannot create Purchase event for animal %s',[tPurchGrpData.FieldByName('NatIDNum').Value]);
                        end;
                     end;

                  if not tPurchases.Locate('EventID', tEvents.FieldByName('ID').AsInteger, []) then
                     begin
                        tPurchases.Append;
                        try
                           tPurchases.FieldByName('EventID').Value := tEvents.FieldByName('ID').AsInteger;
                           tPurchases.FieldByName('Supplier').Value := tPurchGrpData.FieldByName('SupplierID').Value;
                           iSupplierID := tPurchGrpData.FieldByName('SupplierID').AsInteger;
                           tPurchases.FieldByName('Price').AsFloat := tPurchGrpData.FieldByName('MartPrice').AsFloat;
                           if ( tPurchases.FieldByName('Price').AsFloat > 0 ) then
                              fAnimalPrice := tPurchGrpData.FieldByName('MartPrice').AsFloat;
                           tPurchases.FieldByName('Weight').Value := tPurchGrpData.FieldByName('Weight').Value;
                           if ( not(VarIsNull(tPurchGrpData.FieldByName('Weight').Value)) ) then
                              fAnimalWeight := tPurchGrpData.FieldByName('Weight').Value;
                           tPurchases.FieldByName('Grade').Value := tPurchGrpData.FieldByName('Grade').Value;
                           if ( not(VarIsNull(tPurchGrpData.FieldByName('Grade').Value)) ) then
                              sGrade := tPurchGrpData.FieldByName('Grade').Value;
                           tPurchases.FieldByName('Buyer').Value := tPurchGrpData.FieldByName('BuyerID').Value;
                           if ( not(VarIsNull(tPurchGrpData.FieldByName('BuyerID').Value)) ) then
                              iPurBuyer := tPurchGrpData.FieldByName('BuyerID').Value;
                           tPurchases.FieldByName('SupplierCosts').Value := tPurchGrpData.FieldByName('SupplierCosts').Value;
                           if ( not(VarIsNull(tPurchGrpData.FieldByName('SupplierCosts').Value)) ) then
                              fSupplierCosts := tPurchGrpData.FieldByName('SupplierCosts').Value;
                           tPurchases.FieldByName('BuyerCosts').Value := tPurchGrpData.FieldByName('BuyerCosts').Value;
                           if ( not(VarIsNull(tPurchGrpData.FieldByName('BuyerCosts').Value)) ) then
                              fBuyerCosts := tPurchGrpData.FieldByName('BuyerCosts').Value;
                           //   20/10/16 [V5.6 R2.5] /MK Bug Fix - Lot Number was never saving to the purchase table or the XML file that is created - IAD.
                           tPurchases.FieldByName('LotNumber').Value := tPurchGrpData.FieldByName('LotNo').Value;
                           if ( not(VarIsNull(tPurchGrpData.FieldByName('LotNo').Value)) ) then
                              sLotNo := tPurchGrpData.FieldByName('LotNo').Value;
                           tPurchases.Post;
                        except
                           tPurchases.Cancel;
                           raise ErrorMsg.CreateFmt('Cannot create Purchase event for animal %s',[tPurchGrpData.FieldByName('NatIDNum').Value]);
                        end;
                     end;

                  if ( Def.Definition.dUseCrush )then
                     begin
                        with TCrushXMLExport.Create do
                           try
                              with FPurchaseAnimal do
                                 begin
                                    AnimalID := iAnimalID;
                                    Animal := GetAnimal(iAnimalID);
                                    if ( Animal <> nil ) then
                                       NatIDNum := Animal.NatIdNum;
                                    SupplierID := iSupplierID;
                                    PurBuyer := iPurBuyer;
                                    EventDate := dEventDate;
                                    AnimalWeight := fAnimalWeight;
                                    AnimalPrice := fAnimalPrice;
                                    SupplierCosts := fSupplierCosts;
                                    BuyerCosts := fBuyerCosts;
                                    Grade := sGrade;
                                    //   20/10/16 [V5.6 R2.5] /MK Bug Fix - LotNo left out of export XML file.
                                    LotNo := sLotNo;
                                    TBTestDate := dTBTestDate;
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

               // Now to create up to three new GroupLinks.db records
               // First the Purchase Group Record

               if VarIsNull(tPurchGrpData.FieldByName('AID').AsInteger) then
                  AddAnimalToGroup(tAnimals.FieldByName('ID').Value)
               else
                  AddAnimalToGroup(tPurchGrpData.FieldByName('AID').AsInteger);
         end;
     end;

   function NatIDExists(const NatIDStr : String) : Boolean;
   begin
      Result := WinData.LookUpDamSire.Locate('NatIDNum', NatIDStr, [] );
   end;

begin
   try
      StrToInt(dbPurchGrpNum.Text);
   except
      MessageDlg('Number of animals in Batch needs to be input',mtError,[mbOK],0);
      Exit;
   end;

    if miMatchtoCrushFile.Checked then
       begin
          if GetActualNumberInGroup <> StrToInt(dbPurchGrpNum.Text) then
             if MessageDlg(Format('The total number of matched animals does not correspond to the number imported from crush file(s)'+#13#10+
                                  'for group "%s" '+#13#10+#13#10+'Continue anyway?',[WinData.LookupGroups.Lookup('ID', qPurchGrpNum.FieldByName('ID').AsInteger, 'Description')]), mtWarning,[mbYes, mbNo],0) = idNo then
                Exit;
       end
    else if ( WinData.GlobalSettings.DisplayCrushScreen ) then
       begin
          if GetActualNumberInGroup <> StrToInt(dbPurchGrpNum.Text) then
             if MessageDlg(Format('The total number of matched animals does not correspond to the total number'+#13#10+
                                  'for group "%s" '+#13#10+#13#10+'Continue anyway?',[WinData.LookupGroups.Lookup('ID', qPurchGrpNum.FieldByName('ID').AsInteger, 'Description')]), mtWarning,[mbYes, mbNo],0) = idNo then
                Exit;
       end;

     CountSumTotals;
     //RecTotWeight := tPurchGrpHeader.FieldByName('TotWeight').AsFloat;  //Record TotWeight

     if tPurchGrpHeader.State in dsEditModes then
        tPurchGrpHeader.Post;

     //Need to check whether to perform Batch End Calculations
     if (Trim(dbPurchGrpNum.Text) = '' ) or ( dbPurchGrpNum.Text = '0') then
        MessageDlg('Number of animals in Batch needs to be input',mtError,[mbOK],0)
     else if (( tPurchGrpHeader.FieldByName('HerdID').AsInteger = WinData.NONEHerdID ) OR (NOT WinData.OwnerFile.Locate('ID', tPurchGrpHeader.FieldByName('HerdID').AsVariant, []) )) then
        MessageDlg('A valid Herd ID must be selected',mtError,[mbOK],0)
     else if ((tPurchGrpHeader.FieldByName('MartWeight').AsFloat < 1 ) AND (WinData.OwnerFilePurchWeighing.AsBoolean = True ))  then
        MessageDlg('Mart Weight needs to be input', mtError, [mbok],0)
     else if ((tPurchGrpHeader.FieldByName('TotWeight').AsFloat < 1 ) AND (WinData.OwnerFilePurchWeighing.AsBoolean = True )) then
        MessageDlg('Animal Weights need to be input', mtError, [mbok],0)
     else
        begin
           // Now do calculations
           // Now to check that all Nat ID Numbers and Animal Numbers have been entered
           if ( CheckRequiredFields ) AND (tPurchGrpHeader.FieldByName('HerdID').AsString <> '' ) then
              begin
                 tAnimals := TTable.Create(nil);
                 tEvents := TTable.Create(nil);
                 tPurchases := TTable.Create(nil);
                 try
                    tAnimals.DatabaseName := AliasName;
                    tAnimals.TableName := 'animals';
                    tAnimals.Active := True;

                    tEvents.DatabaseName := AliasName;
                    tEvents.TableName := 'events';
                    tEvents.Active := True;

                    tPurchases.DatabaseName := AliasName;
                    tPurchases.TableName := 'purchases';
                    tPurchases.Active := True;

                    if (MessageDlg('Please Confirm that you wish to update the WinHerd Databases, having first ensured that input of ALL data has been completed AND that ALL Calculations (if required) have been performed.', mtConfirmation, [mbYes, mbCancel], 0) = mrYes) then
                       begin
                          //Now to copy all data in tPurchGrpData to the WinHerd database
                          if ( WinData.GlobalSettings.DisplayCrushScreen ) then
                             bCalc.Click;

                          tPurchGrpData.First;
                          while ( not tPurchGrpData.EOF ) do
                             begin
                                if not ( NatIDExists(  tPurchGrpData.FieldByName('NatIDNum').Value ) ) then
                                   begin
                                      if ( tPurchGrpData.FieldByName('AID').AsInteger <= 0 ) then
                                         begin
                                            tAnimals.Append;
                                            try
                                               tAnimals.FieldByName('ID').Value := WinData.NextAnimalID;
                                               tAnimals.FieldByName('NatIDNum').Value := tPurchGrpData.FieldByName('NatIDNum').Value;
                                               tAnimals.FieldByName('SortNatID').Value := CreateSortNatIDString(tAnimals.FieldByName('NatIDNum').Value,tPurchGrpHeader.FieldByName('HerdID').Value);
                                               tAnimals.FieldByName('AnimalNo').Value := tPurchGrpData.FieldByName('AnimalNo').Value;
                                               tAnimals.FieldByName('SortAnimalNo').Value := WinData.InsertZeros(tPurchGrpData.FieldByName('AnimalNo').AsString, 10);
                                               tAnimals.FieldByName('AnimalDeleted').Value := False;
                                               tAnimals.FieldByName('InHerd').Value := TRUE;
                                               tAnimals.FieldByName('PrimaryBreed').Value := tPurchGrpData.FieldByName('PrimaryBreed').Value;
                                               tAnimals.FieldByName('Colour').Value := tPurchGrpData.FieldByName('Colour').Value;
                                               tAnimals.FieldByName('DateOfBirth').Value := tPurchGrpData.FieldByName('DateOfBirth').Value;
                                               tAnimals.FieldByName('TBTestDate').Value := tPurchGrpData.FieldByName('TBTestDate').Value;
                                               tAnimals.FieldByName('Sex').Value := tPurchGrpData.FieldByName('Sex').Value;
                                               tAnimals.FieldByName('Breeding').Value := tPurchGrpData.FieldByName('Breeding').Value;
                                               tAnimals.FieldByName('LactNo').Value := tPurchGrpData.FieldByName('LactationNumber').Value;
                                               tAnimals.FieldByName('HerdID').Value := tPurchGrpHeader.FieldByName('HerdID').Value;
                                               tAnimals.FieldByName('SeqNo').Value := WinData.GetSeqNo(tAnimals.FieldByName('HerdID').Value);
                                               tAnimals.Post;
                                            except
                                               tAnimals.Cancel;
                                               raise ErrorMsg.CreateFmt('A problem has occurred saving animal %s',[tPurchGrpData.FieldByName('NatIDNum').Value]);
                                            end;

                                            ProcessPurchaseEvent;

                                         end; // EndIf AID <= 0
                                   end
                                else if ( WinData.GlobalSettings.DisplayCrushScreen ) then
                                   ProcessPurchaseEvent
                                else
                                   MessageDlg(Format('National Identity Number "%s" already found in database.', [tPurchGrpData.FieldByName('NatIDNum').Value]),mtWarning,[mbOK],0);


                                tPurchGrpData.Next;
                             end;

                          DBISaveChanges(tAnimals.Handle);
                          DBISaveChanges(tEvents.Handle);
                          DBISaveChanges(tPurchases.Handle);

                          //All records have been posted, now to delete all the records in the
                          //Purchase Group from the tPurchGrpData and tPurchGrpData tables
                          tPurchGrpData.First;
                          //while ( NOT tPurchGrpData.EOF ) do
                          //   tPurchGrpData.Delete;     //Deletes record

                          tPurchGrpHeader.Edit;
                          //Now to indicate that the Purchase Group has been posted
                          //tPurchGrpHeader.FieldByName('DataPosted').AsBoolean := True;
                          //And update the Actual Number of animals in Batch
                          //tPurchGrpHeader.FieldByName('ActualNumber').AsInteger := 0;
                          //tPurchGrpHeader.FieldByName('TotWeight').AsFloat := RecTotWeight;
                          tPurchGrpHeader.Post;
                          //Now to refresh the grid
                          gData.Refresh;
                          //Now to reset the BatchUpdate indicator
                          //Now to display a message confirming the posting of the Purchase Group

                          MessageDlg('WinHerd Databases updated', mtInformation, [mbOK], 0);

                          //   06/10/11 [V5.0 R1.2] /MK Additional Feature - New StartNewLot Procedure
                          if ( WinData.GlobalSettings.DisplayCrushScreen ) and ( FLotPurchGrpID > 0 ) then
                             StartNewLot;
                       end;
                 finally
                    tAnimals.Close;
                    tEvents.Close;
                    tPurchases.Close;

                    tAnimals.Free;
                    tEvents.Free;
                    tPurchases.Free;
                 end;
              end;
        end;
End;

Function TfBBPPurchScr.CheckRequiredFields : Boolean;
begin
   Result := True;
   tPurchGrpData.First;
   //Need to check if all Animal Numbers and all National Identity Numbers
   //have been input and are therefore valid
   while ( Not tPurchGrpData.EOF ) do
      begin
         if tPurchGrpData.FieldByName('AID').AsInteger <= 0 then
            begin
               if tPurchGrpData.FieldByName('NatIDNum').AsString = '' then
                  Result := False;
               if tPurchGrpData.FieldByName('DateOfBirth').AsDateTime = 0 then
                  Result := False;
               if tPurchGrpData.FieldByName('EventDate').AsDateTime = 0 then
                  Result := False;
               if tPurchGrpData.FieldByName('SupplierID').AsInteger < 1 then
                  Result := False;
               if (( tPurchGrpData.FieldByName('Sex').AsString <> 'Steer' ) AND
                   ( tPurchGrpData.FieldByName('Sex').AsString <> 'Bull' ) AND
                   ( tPurchGrpData.FieldByName('Sex').AsString <> 'Female' )) then
                  Result := False;
            end;
         tPurchGrpData.Next;
      end;
end;

procedure TfBBPPurchScr.bModifyGridClick(Sender: TObject);
begin
     //Do not need code to modify grid
end;

procedure TfBBPPurchScr.BatchEndCalcs;
var
   TotMartPrice : Double;
   TotCostIntoPen : Double;
   MartCostLessVAT : Double;
begin
   //First need to locate Herd in Owner File
   if (WinData.OwnerFile.Locate('ID', tPurchGrpHeader.FieldByName('HerdID').AsVariant, [loPartialKey]) ) then
      begin
         // First need to make some checks - already checked that there are animals and that
         // the Actual Number of animals equals the input Number of animals
         if ((tPurchGrpHeader.FieldByName('MartWeight').AsFloat < 1 ) AND (WinData.OwnerFilePurchWeighing.AsBoolean = True )) then
            MessageDlg('Mart Weight needs to be input', mtError, [mbok],0)
         else if ((tPurchGrpHeader.FieldByName('TotWeight').AsFloat < 1 ) AND (WinData.OwnerFilePurchWeighing.AsBoolean = True )) then
            MessageDlg('Animal Weights need to be input', mtError, [mbok],0)
         else
            begin   //Now do calculations
               //Need to do Batch End Calculations
               //First initiate variables
               TotMartPrice := 0;
               TotCostIntoPen := 0;
               //MartCostLessVAT is a constant that is not held, need to calculate it
               if (WinData.OwnerFileVATRegistered.AsBoolean = True ) then
                  MartCostLessVAT := (Round(( tPurchGrpHeader.FieldByName('MartCost').AsFloat * 10000 )/( 100 + tPurchGrpHeader.FieldByName('VAT').AsFloat )) / 100 )
               else
                   MartCostLessVAT := tPurchGrpHeader.FieldByName('MartCost').AsFloat;
               //Now to step through tPurchGrpData table
               with tPurchGrpData do
                  begin
                     First;
                     while NOT ( tPurchGrpData.EOF ) do
                        begin
                           Edit;
                           //First calculate the individual Mart Price figures:
                           //Individual Mart Price is the total Mart price based on the proportion of
                           //the measured weight to the total measured weight
          //                 FieldByName('MartPrice').AsFloat := (Round(( tPurchGrpHeader.FieldByName('MartCost').AsFloat * tPurchGrpData.FieldByName('Weight').AsFloat * 100 )/( tPurchGrpheader.FieldByName('TotWeight').AsFloat )) / 100 );
                           //MartPrice should exclude VAT as should Cost Into Pen - so apportion
                           //MartCostLessVAT by the ratio of Weight to the Total Weight.
                           if (( tPurchGrpheader.FieldByName('TotWeight').AsFloat > 0 ) AND ( WinData.OwnerFilePurchWeighing.AsBoolean = True )) then
                              FieldByName('MartPrice').AsFloat := (Round(( MartCostLessVAT * tPurchGrpData.FieldByName('Weight').AsFloat * 100 )/( tPurchGrpheader.FieldByName('TotWeight').AsFloat )) / 100 )
                           else  //If not Purchase Weighing, then MartPrice is the MartCost divided by the number of animals.
                               FieldByName('MartPrice').AsFloat := (Round(( MartCostLessVAT * 100 )/( tPurchGrpheader.FieldByName('Number').AsFloat )) / 100 );
                           //Add to total
                           TotMartPrice := TotMartPrice + tPurchGrpData.FieldByName('MartPrice').AsFloat;

                           //Second calculate the individual Cost Into Pen figures:
                           //Individual Cost into Pen figure is the total Mart Cost less VAT, divided
                           //by the total measured weight multiplied by the individual weight plus
                           //transport and commission costs.
                           if (( tPurchGrpheader.FieldByName('TotWeight').AsFloat > 0 ) AND ( WinData.OwnerFilePurchWeighing.AsBoolean = True )) then
                              //tPurchGrpData.FieldByName('CostIntoPen').AsFloat := (Round(( MartCostLessVAT * tPurchGrpData.FieldByName('Weight').AsFloat * 100 )/( tPurchGrpheader.FieldByName('TotWeight').AsFloat )) / 100 ) + OtherCosts.Value
                              tPurchGrpData.FieldByName('CostIntoPen').AsFloat := tPurchGrpData.FieldByName('MartPrice').AsFloat + OtherCosts.Value
                           else
                               //tPurchGrpData.FieldByName('CostIntoPen').AsFloat := (Round(( MartCostLessVAT * 100 )/( tPurchGrpheader.FieldByName('Number').AsFloat )) / 100 ) + OtherCosts.Value;
                               tPurchGrpData.FieldByName('CostIntoPen').AsFloat := tPurchGrpData.FieldByName('MartPrice').AsFloat + OtherCosts.Value;
                           //Add to total
                           TotCostIntoPen := TotCostIntoPen + tPurchGrpData.FieldByName('CostIntoPen').AsFloat;

                           Post;
                           Next;
                        end;  //EndWhile Not (tPurchGprTempData.EOF) do
                  end;    //EndWith

               tPurchGrpHeader.Edit;
               //The Total Mart Price field onscreen is automatically updated.
               tPurchGrpHeader.FieldByName('TotMartPrice').AsFloat := TotMartPrice;
               //Now to update the Total Cost Into Pen field onscreen
               tPurchGrpHeader.FieldByName('TotCostIntoPen').AsFloat := TotCostIntoPen;
               //Last calculate the Tagging Weight Versus Mart Weight Variance
               if (( tPurchGrpHeader.FieldByName('MartWeight').AsFloat > 0 ) and ( tPurchGrpHeader.FieldByName('TotWeight').AsFloat > 0 )) then
                  tPurchGrpHeader.FieldByName('TagWtVsMartWtVar').AsFloat := (( tPurchGrpHeader.FieldByName('MartWeight').AsFloat - tPurchGrpheader.FieldByName('TotWeight').AsFloat ) * 100 )/ tPurchGrpHeader.FieldByName('MartWeight').AsFloat
               else
                   tPurchGrpHeader.FieldByName('TagWtVsMartWtVar').AsFloat := 0;
               tPurchGrpHeader.Post;

               tPurchGrpData.First;
               //Now to refresh the grid
               gData.Refresh;

            end;  //End Else Do calculations

   end;  //End If WinData.OwnerFile.Locate
end;

procedure TfBBPPurchScr.dbcbGroupNumDropDown(Sender: TObject);
begin
   //Need to call SQL to regenerate drop down list in case it has been modified.
   BatchNumDropDownList;
end;

procedure TfBBPPurchScr.dbcbPenNumDropDown(Sender: TObject);
begin
   //Need to call SQL to regenerate drop down list in case it has been modified.
   PenNumDropDownList;
end;

procedure TfBBPPurchScr.bDeleteClick(Sender: TObject);
begin
   //Display Panel
   pDelete.Show;
   pDelete.Refresh;
   pDelete.BringToFront;
end;

procedure TfBBPPurchScr.bOKClick(Sender: TObject);
Var
   ID : integer;

begin
     //Need to obtain option selected and hide panel
     pDelete.Hide;

     Case rbDelete.ItemIndex Of
          0 : Begin   //Cancel Delete request

              End;
          1 : Begin   //Delete selected Row in Grid
                   //First confirm delete request
                   If ( MessageDlg('Please Confirm that you wish to delete the selected row', mtConfirmation, [mbOK, mbCancel], 0) = mrOK ) then
                      Begin
                           //First locate tPurchGrpData record and delete
                           if not tPurchGrpData.IsEmpty then
                              tPurchGrpData.Delete;
                           gData.Refresh;
                      End;
              End;
          2 : Begin   //Delete entire Purchase Group
//                   MessageDlg('This option is not currently available',mtInformation,[mbok],0);
                   If ( MessageDlg('Please Confirm that you wish to delete the entire Purchase Group', mtConfirmation, [mbOK, mbCancel], 0) = mrOK ) then
                      Begin
                           //Now to delete tPurchGprHeader record
                           if not tPurchGrpHeader.IsEmpty then
                              tPurchGrpHeader.Delete
                           else
                              begin
                                 tPurchGrpData.First;
                                 while NOT tPurchGrpData.EOF do
                                    tPurchGrpData.Delete;
                              end;

                           //Now to Refresh Grid
                           gData.Refresh;

                           PurchBatchNum.SetFocus;
                           ColNum := 1;
                      End;
              End;   //End Delete Entire Group
     End;

     //Now to reset panel to default value of Cancel
     rbDelete.ItemIndex := 0;
end;

procedure TfBBPPurchScr.bCalcClick(Sender: TObject);

   procedure UpdatePriceBasedOnLotNo;
   var
      WeighingRecord : PWeighingRecord;
      qLotNos,
      qTotalMartCost_Weight : TQuery;
      TotMartCost, TotMartWeight, VatRate : Double;
      VatRegistered : Boolean;
   begin
      if ( not(tPurchGrpData.Active) ) then
         tPurchGrpData.Active := True;

      qLotNos := TQuery.Create(nil);
      with qLotNos do
         begin
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT Distinct(LotNo)');
            SQL.Add('FROM '+tPurchGrpData.TableName+'');
            try
               Open;
               First;
               while ( not(Eof) ) do
                  begin
                     if ( qLotNos.FieldByName('LotNo').AsString <> '' ) then
                        begin
                           TotMartCost := 0;
                           TotMartWeight := 0;
                           qTotalMartCost_Weight := TQuery.Create(nil);
                           with qTotalMartCost_Weight do
                              try
                                 DatabaseName := AliasName;
                                 SQL.Clear;
                                 SQL.Add('SELECT SUM(Weight), SUM(MartPrice)');
                                 SQL.Add('FROM '+tPurchGrpData.TableName+'');
                                 SQL.Add('WHERE LotNo = "'+qLotNos.FieldByName('LotNo').AsString+'"');
                                 try
                                    // For each LotNo get the TotalCrushWeight from weights imported from Crush
                                    // and get the TotalPrice from the Mart file.
                                    Open;
                                    TotMartWeight := qTotalMartCost_Weight.Fields[0].AsFloat;
                                    TotMartCost := qTotalMartCost_Weight.Fields[1].AsFloat;
                                 except
                                    on e : Exception do
                                       ShowMessage(e.Message);
                                 end;

                                 tPurchGrpData.First;
                                 while ( not(tPurchGrpData.Eof) ) do
                                    begin
                                       if ( tPurchGrpData.FieldByName('LotNo').AsString = qLotNos.FieldByName('LotNo').AsString ) then
                                          try
                                             tPurchGrpData.Edit;
                                             // Calculate the new price of the animal based on the TotalMartCost, individual crush weight and TotalCrushWeight like uBBPPurchScr does.
                                             tPurchGrpData.FieldByName('MartPrice').AsFloat := (Round(( TotMartCost * tPurchGrpData.FieldByName('Weight').AsFloat * 100 )/( TotMartWeight )) / 100 );
                                             tPurchGrpData.Post;
                                          except
                                             on e : Exception do
                                                ShowMessage(e.Message);
                                          end;
                                       tPurchGrpData.Next;
                                    end;

                              finally
                                 Free;
                              end;
                        end;
                     Next;
                  end;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         end;

      qLotNos.Close;
      FreeAndNil(qLotNos);
   end;

begin
     If ( tPurchGrpHeader.FieldByName('HerdID').AsInteger = 0 ) then
             MessageDlg('Herd ID must be selected',mtInformation,[mbOK],0)
     Else
         Begin   //Do calculations
              CountSumTotals;
              If ( MessageDlg('Do you wish to proceed with calculations of Mart Price and Cost Into Pen?',mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
                 Begin
                      //Need to check whether to perform Batch End Calculations
                      if (( tPurchGrpHeader.FieldByName('Number').AsInteger <> 0) and ( dbPurchGrpNum.Text = tPurchGrpheader.FieldByName('ActualNumber').AsString )) then
                         begin
                            BatchEndCalcs;

                            //   02/10/14 [V5.3 R7.4] /MK Change - Added code to calc cost based on total cost/weight of animals in a LotNo.
                            if ( Def.Definition.dUseCrush )then
                               UpdatePriceBasedOnLotNo;
                         end
                      else
                          MessageDlg('Actual Number In Batch does not match the Number In Batch',mtInformation,[mbOK],0);
                 End

         end;  //EndElse Do Calculations
end;

procedure TfBBPPurchScr.CountSumTotals;
begin

   if ( NOT tPurchGrpHeaderID.IsNull ) then
       with qGeneral do
          begin
             Close;
             SQL.Clear;
             SQL.Add('SELECT COUNT(ID) NoRecords, SUM(Weight) TotalWeight, ');
             SQL.Add('SUM(MartPrice) TotMartPrice, SUM(CostIntoPen) TotCostIntoPen FROM ' + tPurchGrpData.TableName);
             SQL.Add('WHERE PurchGrpHeaderID = ' + tPurchGrpHeaderID.AsString);
             Open;

             if NOT ( tPurchGrpHeader.State in dsEditModes ) then
                tPurchGrpHeader.Edit;

             if ( NOT IsEmpty ) then
                begin
                   tPurchGrpHeaderTotWeight.AsFloat := qGeneral.FieldByName('TotalWeight').AsFloat;
                   tPurchGrpHeaderActualNumber.AsInteger := qGeneral.FieldByName('NoRecords').AsInteger;
                   tPurchGrpHeaderTotMartPrice.AsFloat := qGeneral.FieldByName('TotMartPrice').AsFloat;
                   tPurchGrpHeaderTotCostIntoPen.AsFloat := qGeneral.FieldByName('TotCostIntoPen').AsFloat;
                end
             else
                begin
                   tPurchGrpHeaderTotWeight.AsFloat := 0;
                   tPurchGrpHeaderActualNumber.AsInteger := 0;
                   tPurchGrpHeaderTotMartPrice.AsFloat := 0;
                   tPurchGrpHeaderTotCostIntoPen.AsFloat := 0;
                end;
          end;
end;

procedure TfBBPPurchScr.tPurchGrpDataDateOfBirthValidate(Sender: TField);
begin
     if (Sender as TField).AsDateTime = 0 then
        raise ErrorMsg.CreateFmt('Date Of Birth must be entered',[nil])
     else
         Begin
              if (tPurchGrpDataTBTestDate.AsDateTime > 0) then
                 begin
                      if (tPurchGrpDataTBTestDate.AsDateTime < (Sender as TField).AsDateTime) then
                         raise ErrorMsg.CreateFmt('Date Of Birth MUST be before TB test date',[nil]);
                 end;
              if (tPurchGrpDataEventDate.AsDateTime > 0) then
                 begin
                      if (tPurchGrpDataEventDate.AsDateTime < (Sender as TField).AsDateTime) then
                         raise ErrorMsg.CreateFmt('Date Of Birth MUST be on or before Purchase Date',[nil]);
                 end;
         end;
end;

procedure TfBBPPurchScr.tPurchGrpDataTBTestDateValidate(Sender: TField);
begin
     if (Sender as TField).AsDateTime > 0 then
         begin
            if (tPurchGrpDataDateOfBirth.AsDateTime > (Sender as TField).AsDateTime) then
               raise ErrorMsg.CreateFmt('TB test date MUST be after Date Of Birth',[nil]);
         end;
end;

procedure TfBBPPurchScr.tPurchGrpHeaderBeforeDelete(DataSet: TDataSet);
begin
     // Delete all associated Records from the Data table BEFORE deleting Header
     if tPurchGrpData.State in dsEditModes then
        tPurchGrpData.Cancel;
     tPurchGrpData.First;
     while NOT tPurchGrpData.EOF do
        tPurchGrpData.Delete;
end;

procedure TfBBPPurchScr.PurchBatchNumDropDown(Sender: TObject);
begin
    try
        PurchGrpDropDownList;
    except
        ShowMessage('Cannot Get list of Purchase Groups');
    end;
end;

// National ID Number validation Start
procedure TfBBPPurchScr.tPurchGrpDataNatIDNumValidate(Sender: TField);
var
   Located : Boolean;
   CrushWeight : Double;
   ExistAnimalID,
   ExistLactNo : Integer;
   WeighingRecord : PWeighingRecord;
begin
   GetMem(WeighingRecord, SizeOf(TWeighingRecord));

   if Length((Sender as TField).AsString) > 0 then
      begin
         Located := WinData.LookUpDamSire.Locate('NatIDNum', (Sender as TField).AsString, [loPartialKey] );

         if ( Located ) and ( WinData.GlobalSettings.DisplayCrushScreen) then
            begin
               ExistAnimalID := WinData.LookUpDamSire.FieldByName('ID').AsInteger;
               tPurchGrpData.FieldByName('AnimalNo').Value := WinData.LookUpDamSire.FieldByName('AnimalNo').AsString;
               tPurchGrpData.FieldByName('PrimaryBreed').Value := WinData.LookUpDamSire.FieldByName('PrimaryBreed').AsInteger;
               tPurchGrpData.FieldByName('Sex').Value := WinData.LookUpDamSire.FieldByName('Sex').AsString;
               tPurchGrpData.FieldByName('DateOfBirth').Value := WinData.LookUpDamSire.FieldByName('DateOfBirth').AsDateTime;
               tPurchGrpData.FieldByName('LactationNumber').Value := WinData.LookUpDamSire.FieldByName('LactNo').AsInteger;
               tPurchGrpData.FieldByName('cGroupID').Value := StrToInt(PurchBatchNum.Value);
               tPurchGrpData.FieldByName('Matched').AsBoolean := True;
               ExistLactNo := tPurchGrpData.FieldByName('LactationNumber').Value;

               //  01/08/12 [V5.0 R8.3] /MK Change - Purchase Weight should always be the first weighing event found.
               WinData.GetWeighingEventDetails(ExistAnimalID,ExistLactNo,'First',WeighingRecord);
               if WeighingRecord.Weight > 0 then
                  begin
                     tPurchGrpData.FieldByName('Weight').Value := WeighingRecord.Weight;
                  end;

            end;

         if not Located then
            Located := LookUpPurchGrpData.Locate('NatIDNum', (Sender as TField).AsString, [loPartialKey] );
         if (( Located ) and ( tPurchGrpData.FieldByName('ID').AsInteger <> LookUpPurchGrpData.FieldByName('ID').AsInteger )) then
            if not(WinData.GlobalSettings.DisplayCrushScreen) then
               raise ErrorMsg.CreateFmt('National ID already entered',[nil]);
      end;
end;

procedure TfBBPPurchScr.tPurchGrpDataNatIDNumGetText(Sender: TField; var Text: String; DisplayText: Boolean);
var
   FormattedStr : String;
begin
   Text := UpperCase((Sender as TField).AsString);
   if ( not(CheckNatID(Text, FormattedStr,FALSE)) ) then   //Checks for a valid NatID Number format
      raise ErrorMsg.CreateFmt('Invalid National ID',[nil])
   else
      Text := FormattedStr;
end;

procedure TfBBPPurchScr.tPurchGrpDataNatIDNumSetText(Sender: TField; const Text: String);
var
   UpperTxt,
   FormattedStr : String;
   MatchStr : String;
   CheckIrishTagStr : String;
begin
   UpperTxt := UpperCase(Text);
   if ( not(CheckNatID(UpperTxt, FormattedStr,FALSE)) ) then   //Checks for a valid NatID Number format
      raise ErrorMsg.CreateFmt('Invalid National ID',[nil])
   else
      begin
         //   25/10/17 [V5.7 R4.1] /MK Change - If tag entered is without IE or 372 then add the IE/372 and validate it.
         CheckIrishTagStr := StripAllSpaces(UpperTxt);
         if ( Length(CheckIrishTagStr) = 12 ) then
            begin
               if ( IsIETag(CheckIrishTagStr) ) then
                  UpperTxt := 'IE'+CheckIrishTagStr
               else if ( Is372Tag(CheckIrishTagStr) ) then
                  UpperTxt := '372'+CheckIrishTagStr;
               if NOT CheckNatID(UpperTxt, FormattedStr,TRUE) then   //Checks for a valid NatID Number format
                  raise ErrorMsg.CreateFmt(cInvalid_NatIdNo,[nil])
            end;
         (Sender as TField).AsString := FormattedStr;
      end;

   if miMatchtoCrushFile.Checked then
      begin
         MatchStr := WinData.StripAllSpaces(Text);
         if Length(MatchStr) > 0 then
            MatchToCrush(MatchStr);
      end;

end;
// National ID Number validation End

// Animal No validation Start
procedure TfBBPPurchScr.tPurchGrpDataAnimalNoValidate(Sender: TField);
begin
   if (Length(trim((Sender as TField).AsString)) <= 0 ) then exit; //SP
   if ( WinData.LookUpDamSire.Locate('AnimalNo', (Sender as TField).AsString, [loPartialKey] )) or
      (( LookUpPurchGrpData.Locate('AnimalNo', (Sender as TField).AsString, [loPartialKey] )) And
       ( tPurchGrpData.FieldByName('ID').AsInteger <> LookUpPurchGrpData.FieldByName('ID').AsInteger )) then
          if not(WinData.GlobalSettings.DisplayCrushScreen) then
             raise ErrorMsg.CreateFmt('Animal No already entered',[nil]);
end;

procedure TfBBPPurchScr.tPurchGrpDataAnimalNoGetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
   Text := UpperCase((Sender as TField).AsString);
end;

procedure TfBBPPurchScr.tPurchGrpDataAnimalNoSetText(Sender: TField; const Text: String);
begin
   (Sender as TField).AsString := UpperCase(Text);
end;
// Animal No validation end

procedure TfBBPPurchScr.tPurchGrpDataDateOfBirthSetText(Sender: TField; const Text: String);
var
   Str : String;
   YY : String;
begin
   //Need to insert date delimeters into the numeric string if they do not already exist.
   if ( Length(Text) = 6 ) or ( Length(Text) = 8) then
      begin
         if Pos('/', Text) = 0 then
            begin
               Str := Text;
               Insert('/', Str, 3);
               Insert('/', Str, 6);
               if ( Length(Str) = 8 ) then  //Does not have a century
                  begin
                     YY := Copy(Str,7,2);  //Copies year
                     Str := Copy(Str,1,6);  //Truncates Str to exclude year
                     If ( YY >= '00' ) And ( YY <= '60' ) then
                        YY := '20' + YY       //Assumes 21st century
                     else
                         YY := '19' + YY;     //Assumes 20th century
                     Str := Str + YY;
                  end;
               (Sender as TField).AsString := Str;
            end
         else  //Delimiters exists in string - check for century
            if ( Length(Text) = 8 ) then  //Does not have a century
               begin
                    YY := Copy(Text,7,2);  //Copies year
                    Str := Copy(Text,1,6);  //Truncates Str to exclude year
                    If ( YY >= '00' ) And ( YY <= '60' ) then
                       YY := '20' + YY       //Assumes 21st century
                    else
                        YY := '19' + YY;     //Assumes 20th century
                    Str := Str + YY;
                    (Sender as TField).AsString := Str;
               end
            else      //Has delimiters and century
               (Sender as TField).AsString := Text;
      end
   else
       (Sender as TField).AsString := Text;
end;

procedure TfBBPPurchScr.tPurchGrpDataTBTestDateSetText(Sender: TField; const Text: String);
var
   Str : String;
   YY : String;
begin
   //Need to insert date delimeters into the numeric string if they do not already exist.
   if ( Length(Text) = 6 ) or ( Length(Text) = 8) then
      Begin
         if Pos('/', Text) = 0 then
            begin
                 Str := Text;
                 Insert('/', Str, 3);
                 Insert('/', Str, 6);
                 if ( Length(Str) = 8 ) then  //Does not have a century
                    begin
                       YY := Copy(Str,7,2);  //Copies year
                       Str := Copy(Str,1,6);  //Truncates Str to exclude year
                       If ( YY >= '00' ) And ( YY <= '60' ) then
                          YY := '20' + YY       //Assumes 21st century
                       else
                           YY := '19' + YY;     //Assumes 20th century
                       Str := Str + YY;
                    end;
                 (Sender as TField).AsString := Str;
            end
         else  //Delimiters exists in string - check for century
            if ( Length(Text) = 8 ) then  //Does not have a century
               begin
                    YY := Copy(Text,7,2);  //Copies year
                    Str := Copy(Text,1,6);  //Truncates Str to exclude year
                    If ( YY >= '00' ) And ( YY <= '60' ) then
                       YY := '20' + YY       //Assumes 21st century
                    else
                        YY := '19' + YY;     //Assumes 20th century
                    Str := Str + YY;
                    (Sender as TField).AsString := Str;
               end
            else      //Has delimiters and century
               (Sender as TField).AsString := Text;
      End
   else
       (Sender as TField).AsString := Text;
end;

procedure TfBBPPurchScr.tPurchGrpDataEventDateSetText(Sender: TField; const Text: String);
Var
   Str : String;
begin
   //Need to insert date delimeters into the numeric strin if they do not already exist.
   if ( Length(Text) = 6 ) OR ( Length(Text) = 8) then
      begin
           if ( Pos('/', Text) = 0 ) then
              begin
                   Str := Text;
                   Insert('/', Str, 3);
                   Insert('/', Str, 6);
                   (Sender as TField).AsString := Str;
              end
           else
             (Sender as TField).AsString := Text;
      end
   else
       (Sender as TField).AsString := Text;
end;

procedure TfBBPPurchScr.tPurchGrpDataAfterDelete(DataSet: TDataSet);
begin
   //Now need to update all the totals
   CountSumTotals;
end;

procedure TfBBPPurchScr.tPurchGrpDataEventDateValidate(Sender: TField);
begin
   if ( (Sender as TField).AsDateTime > 0 ) then
       begin
          if (tPurchGrpDataDateOfBirth.AsDateTime > (Sender as TField).AsDateTime) then
             raise ErrorMsg.CreateFmt('Purchase Date MUST be after Date Of Birth',[nil]);
       end;
end;

procedure TfBBPPurchScr.SupplierChange(Sender: TObject);
begin
   if ( Supplier.Value <> '0' ) then
      try
         // If Suppliers has been modified then update SupplierCosts
         if ( tPurchGrpHeader.State = dsEdit ) then
            begin
               if ( WinData.Suppliers.Locate('ID',Supplier.Value,[]) ) then
               tPurchGrpHeader.FieldByName('SupplierCosts').AsFloat := WinData.Suppliers.FieldByName('Commission').AsFloat +
                                                                       WinData.Suppliers.FieldByName('Transport').AsFloat;
               tPurchGrpHeader.Post;
               //Now to update Transport & Commission figure
               OtherCosts.Value := tPurchGrpHeader.FieldByName('SupplierCosts').AsFloat + tPurchGrpHeader.FieldByName('BuyerCosts').AsFloat;
            end;

          if ( miAutomaticGridUpdates.Checked ) then
             begin
                UpdateProgress.Max := tPurchGrpData.RecordCount;
                UpdateProgress.Visible := True;
                tPurchGrpData.First;
                try
                   while ( not tPurchGrpData.EOF ) do
                      begin
                         tPurchGrpData.Edit;
                         tPurchGrpData.FieldByName('SupplierID').AsInteger := StrToInt(Supplier.Value);
                         tPurchGrpData.Post;
                         tPurchGrpData.Next;
                         UpdateProgress.Position := tPurchGrpData.RecNo;
                      end;
                finally
                   UpdateProgress.Visible := False;
                   UpdateProgress.Position := 0;
                end;
             end;
      except
         MessageDlg('Failed to update Supplier Details',mtInformation,[mbOK],0);
      end;
end;

procedure TfBBPPurchScr.dbcbSexChange(Sender: TObject);
begin
   if ( not(miAutomaticGridUpdates.Checked) ) then Exit;

   //First need to check that there will be no conflicts over premiums.
   if (( dbcbSex.Text = 'Steer' ) AND ( CheckBullPrem = True )) then
      raise ErrorMsg.CreateFmt('Cannot change "Sex" to Steer as some animals have Bull Premiums',[nil])
   else if (( dbcbSex.Text = 'Bull' ) AND (( CheckFirstPrem = True ) OR ( CheckSecondPrem = True ))) then
      raise ErrorMsg.CreateFmt('Cannot change "Sex" to Bull as some animals have First or Second Premiums',[nil])
   else if (( dbcbSex.Text = 'Female' ) AND (( CheckFirstPrem = True ) OR ( CheckSecondPrem = True ) OR ( CheckBullPrem = True ))) then
      raise ErrorMsg.CreateFmt('Cannot change "Sex" to Female as some animals have Premiums',[nil])
   else
       begin
          if ( (not(dbcbSex.Text = cSex_Female)) and (not(dbcbSex.Text = 'Mixed')) ) then
             begin
                tPurchGrpHeader.Edit;
                try
                   tPurchGrpHeader.FieldByName('LactationNumber').AsInteger := 0;
                except
                   tPurchGrpHeader.Post;
                end;
             end;

          tPurchGrpData.First;
          while ( not tPurchGrpData.EOF ) do
             begin
                tPurchGrpData.Edit;
                tPurchGrpData.FieldByName('Sex').AsString := dbcbSex.Text;
                tPurchGrpData.Post;
                tPurchGrpData.Next;
             end;
       end;
end;

function TfBBPPurchScr.CheckFirstPrem : Boolean;
begin
   Result := False;
   qGeneral.SQL.Clear;
   qGeneral.SQL.Add('SELECT * FROM ' + tPurchGrpData.TableName);
   qGeneral.SQL.Add('WHERE (FirstPrem = True)');
   qGeneral.Open;
   Result := ( qGeneral.RecordCount > 0 )
End;

function TfBBPPurchScr.CheckSecondPrem : Boolean;
begin
   Result := False;
   qGeneral.SQL.Clear;
   qGeneral.SQL.Add('SELECT * FROM ' + tPurchGrpData.TableName);
   qGeneral.SQL.Add('WHERE (SecondPrem = True)');
   qGeneral.Open;
   Result := ( qGeneral.RecordCount > 0 )
end;

function TfBBPPurchScr.CheckBullPrem : Boolean;
begin
   Result := False;
   qGeneral.SQL.Clear;
   qGeneral.SQL.Add('SELECT * FROM ' + tPurchGrpData.TableName);
   qGeneral.SQL.Add('WHERE (BullPrem = True)');
   qGeneral.Open;
   Result := ( qGeneral.RecordCount > 0 )
end;

procedure TfBBPPurchScr.BuyersChange(Sender: TObject);
begin
   if ( Buyers.Value <> '0' ) then
       try
          begin      //If Buyers has been modified then
             if ( tPurchGrpHeader.State = dsEdit ) then
                begin
                   if ( WinData.Buyers.Locate('ID',Buyers.Value,[]) ) then
                      tPurchGrpHeader.FieldByName('BuyerCosts').AsFloat := WinData.Buyers.FieldByName('Commission').AsFloat;
                   tPurchGrpHeader.Post;
                   //Now to update the Transport & Commission display field
                   OtherCosts.Value := tPurchGrpHeader.FieldByName('SupplierCosts').AsFloat +
                                       tPurchGrpHeader.FieldByName('BuyerCosts').AsFloat
                end;
          end;
       except
       end;

   if ( miAutomaticGridUpdates.Checked ) then
      begin
         tPurchGrpData.First;
         while ( not(tPurchGrpData.EOF) ) do
            begin
               tPurchGrpData.Edit;
               tPurchGrpData.FieldByName('BuyerID').AsInteger := StrToInt(Buyers.Value);
               tPurchGrpData.Post;
               tPurchGrpData.Next;
            end;
      end;
end;

procedure TfBBPPurchScr.HerdLookupChange(Sender: TObject);
begin
     if ( HerdLookUp.Value = '0' ) then
        WinData.CreateAndShowForm(TfHerdSetUp)
     else
        If ( tPurchGrpHeader.State = dsEdit ) then
           Begin
              //Need to default 'Use For Breeding' and 'Current Lactation Number' if a Beef Herd
              if ( WinData.OwnerFile.Locate('ID', HerdLookUp.Value, [loPartialKey]) ) then
                 if ( WinData.OwnerFile.FieldByName('TypeOfHerd').AsInteger = 25 ) then
                    begin
                         tPurchGrpHeader.FieldByName('Breeding').AsBoolean := False;
                         tPurchGrpHeader.FieldByName('LactationNumber').AsInteger := 0;
                    end;
              tPurchGrpHeader.Post;
              //Need to check VATRegistered Boolean and VAT figure
              if (( WinData.OwnerFile.FieldByName('VATRegistered').AsBoolean = True ) AND (tPurchGrpHeader.FieldByName('VAT').AsFloat = 0 )) then
                 MessageDlg('VAT should not be zero for a VAT Registered Herd',mtInformation,[mbOK],0)
              else If (( WinData.OwnerFileVATRegistered.AsBoolean = False ) AND ( tPurchGrpHeader.FieldByName('VAT').AsFloat <> 0 )) then
                      MessageDlg('VAT should be zero for a non-VAT Registered Herd',mtInformation,[mbOK],0);
           end;
     //HerdID not held in tPurchGrpData so do not need to update grid.
end;

procedure TfBBPPurchScr.dbcbGroupNumChange(Sender: TObject);
begin
   if ( miAutomaticGridUpdates.Checked ) then
      begin
         tPurchGrpData.First;
         while ( not(tPurchGrpData.EOF) ) do
            begin
               tPurchGrpData.Edit;
               tPurchGrpData.FieldByName('GroupID').AsInteger := StrToInt(dbcbGroupNum.Value);
               tPurchGrpData.Post;
               tPurchGrpData.Next;
            end;
      end;
end;

procedure TfBBPPurchScr.DBCheckBox1Click(Sender: TObject);
begin
   if ( miAutomaticGridUpdates.Checked ) then
      begin
         tPurchGrpData.First;
         while ( not(tPurchGrpData.EOF) ) do
            begin
               tPurchGrpData.Edit;
               tPurchGrpData.FieldByName('Breeding').AsBoolean := DBCheckBox1.Checked;
               tPurchGrpData.Post;
               tPurchGrpData.Next;
            end;
      end;
end;

procedure TfBBPPurchScr.dbPurchGrpDescChange(Sender: TObject);
begin
   if ( miAutomaticGridUpdates.Checked ) then
      begin
         tPurchGrpData.First;
         while ( not(tPurchGrpData.EOF) ) do
            begin
               tPurchGrpData.Edit;
               tPurchGrpData.FieldByName('EventDesc').AsString := dbPurchGrpDesc.Text;
               tPurchGrpData.Post;
               tPurchGrpData.Next;
            end;
      end;
end;

procedure TfBBPPurchScr.dbcbPenNumChange(Sender: TObject);
begin
   if ( miAutomaticGridUpdates.Checked ) then
      begin
         tPurchGrpData.First;
         while ( not(tPurchGrpData.EOF) ) do
            begin
               tPurchGrpData.Edit;
               tPurchGrpData.FieldByName('PenID').AsInteger := StrToInt(dbcbPenNum.Value);
               tPurchGrpData.Post;
               tPurchGrpData.Next;
            end;
      end;
end;

procedure TfBBPPurchScr.dbPurchGrpLactationChange(Sender: TObject);
begin
   if ( miAutomaticGridUpdates.Checked ) then
      begin
         tPurchGrpData.First;
         while ( not(tPurchGrpData.EOF) ) do
            begin
               tPurchGrpData.Edit;
               tPurchGrpData.FieldByName('LactationNumber').AsInteger := StrToInt(dbPurchGrpLactation.Text);
               tPurchGrpData.Post;
               tPurchGrpData.Next;
            end;
      end;
end;

procedure TfBBPPurchScr.gDataColExit(Sender: TObject);
begin
   if ( tPurchGrpData.State in dsEditModes ) then
      if ( gData.SelectedField.FieldName = 'Weight' ) or
         ( gData.SelectedField.FieldName = 'MartPrice' ) or
         ( gData.SelectedField.FieldName = 'CostIntoPen' ) then
         begin
            tPurchGrpData.Post;
            CountSumTotals;
         end
   else if ( gData.SelectedField.FieldName = 'Sex' ) and (Length(Trim(tPurchGrpData.FieldByName('Sex').AsString)) > 6) then
      begin
         if Trim(BarCodeSex) <> '' then
            tPurchGrpData.FieldByName('Sex').AsString := BarCodeSex
         else if Trim(dbcbSex.Text) <> '' then
            tPurchGrpData.FieldByName('Sex').AsString := dbcbSex.Text
         else
            tPurchGrpData.FieldByName('Sex').AsString := 'Steer';
      end;
end;

procedure TfBBPPurchScr.tPurchGrpDataAfterPost(DataSet: TDataSet);
begin
   CountSumTotals;
end;

procedure TfBBPPurchScr.PurchBatchNumChange(Sender: TObject);
begin
   FindHeader;
end;

procedure TfBBPPurchScr.PurchBatchNumExit(Sender: TObject);
begin
   //Now to ensure that a nonzero value has been selected
   if ( PurchBatchNum.Value = '0' ) OR ( PurchBatchNum.Value = '' ) then
      begin
           MessageDlg('Please select a Purchase Group', mtInformation,[mbOK],0);
           PurchBatchNum.SetFocus;
      end;
end;

procedure TfBBPPurchScr.tPurchGrpDataSexValidate(Sender: TField);
var
   ScanStr,
   MyString : String;
begin
   ScanStr := (Sender as TField).AsString;
   if (Length(ScanStr) >= 11) then
      try
         tPurchGrpData.FieldByName('DateOfBirth').AsDateTime := StrToDate(Copy(ScanStr, 1, 2) + '/' + Copy(ScanStr, 3, 2)+ '/' + Copy(ScanStr, 5, 4));

         MyString := (UPPERCASE(Copy(ScanStr, 10, (Strlen(PChar(ScanStr)) - 9))));
         WinData.Breeds.First;
         if WinData.Breeds.Locate('Code', MyString,[]) then
            tPurchGrpData.FieldByName('PrimaryBreed').AsInteger := WinData.Breeds.FieldByName('ID').AsInteger
         else
            begin
               ShowMessage('Animal Breed ''' + (UpperCase(Copy(ScanStr, 10, Strlen(PChar(ScanStr))))) + '''  not in table, please add'  + #13 + 'breed code');
               tPurchGrpData.FieldByName('PrimaryBreed').Clear;
            end;

         if (UPPERCASE(Copy(ScanStr, 9, 1)) = 'F') then
            BarCodeSex := 'Female'
         else
            BarCodeSex := 'Steer';

      except
         MessageDlg('Unable to determine barcode'+cErrorContact,mtInformation,[mbok],0);
      end;

   if (( (Sender as TField).AsString <> 'Steer' ) AND (( tPurchGrpData.FieldByName('FirstPrem').AsBoolean = True ) or
                                                       ( tPurchGrpData.FieldByName('SecondPrem').AsBoolean = True ))) then
      begin
         tPurchGrpData.FieldByName('FirstPrem').AsBoolean := False;
         tPurchGrpData.FieldByName('SecondPrem').AsBoolean := False;
         raise ErrorMsg.CreateFmt('Only Steers are eligible for First or Second Premiums',[nil]);
      end;

   if (( (Sender as TField).AsString <> 'Bull' ) AND ( tPurchGrpData.FieldByName('BullPrem').AsBoolean = True )) then
      begin
         tPurchGrpData.FieldByName('BullPrem').AsBoolean := False;
         raise ErrorMsg.CreateFmt('Only Bulls are eligible for Bull Premiums',[nil]);
      end;
end;

procedure TfBBPPurchScr.tPurchGrpDataFirstPremValidate(Sender: TField);
begin
   if (( (Sender as TField).AsBoolean = True ) AND ( tPurchGrpData.FieldByName('Sex').AsString <> 'Steer' )) then
      begin
         (Sender as TField).AsBoolean := False;
         raise ErrorMsg.CreateFmt('Only Steers are eligible for First or Second Premiums',[nil]);
      end;
end;

procedure TfBBPPurchScr.tPurchGrpDataSecondPremValidate(Sender: TField);
begin
     If (( (Sender as TField).AsBoolean = True ) AND ( tPurchGrpData.FieldByName('Sex').AsString <> 'Steer' )) then
        begin
           (Sender as TField).AsBoolean := False;
           raise ErrorMsg.CreateFmt('Only Steers are eligible for First or Second Premiums',[nil]);
        end;
end;

procedure TfBBPPurchScr.tPurchGrpDataBullPremValidate(Sender: TField);
begin
     If (( (Sender as TField).AsBoolean = True ) AND ( tPurchGrpData.FieldByName('Sex').AsString <> 'Bull' )) then
        begin
           (Sender as TField).AsBoolean := False;
           raise ErrorMsg.CreateFmt('Only Bulls are eligible for Bull Premiums',[nil]);
        end;
end;

procedure TfBBPPurchScr.RxSpeedButton2Click(Sender: TObject);
begin
   if Definition.dUseKingsAccs then
      WinData.CallProg.Accounts(' P ' + RegistrySerialNum, WinData.UserDefaultHerdID)
   else
      WinData.CallProg.Accounts(' P ', WinData.UserDefaultHerdID);
end;

procedure TfBBPPurchScr.sbCrushDataClick(Sender: TObject);
begin
   if Global_Crush <> nil then
      Global_Crush.ShowCrushDataLoad;
end;

procedure TfBBPPurchScr.FormCreate(Sender: TObject);
var
   i : Integer;
   mi : TMenuItem;
begin
   if (WinData.GlobalSettings.DisplayCrushScreen) then
      begin
         Label7.Visible := False;
         imgBarcode.Visible := Label7.Visible;
         teBarcode.Visible := Label7.Visible;
         Label9.Visible := imgBarcode.Visible;
         btnSearchForAnimal.Visible := True;
         btnSearchForAnimal.Left := Label7.Left;
         pBarcode.Height := 40;
         Label23.Caption := 'Total Crush Weight';
         Label24.Caption := 'Mart Lot Cost';
         Label22.Caption := 'Number In Lot';
      end
   else if (WinData.GlobalSettings.UseBarcodeScanner) then
      begin
         Label7.Visible := True;
         imgBarcode.Visible := Label7.Visible;
         Label9.Visible := imgBarcode.Visible;
         btnSearchForAnimal.Visible := False;
         pBarcode.Height := 64;
         Label23.Caption := 'Mart Weight';
         Label24.Caption := 'Mart Cost';
         Label22.Caption := 'Number In Group';
      end
   else
      begin
         pBarcode.Visible := False;
         Label23.Caption := 'Mart Weight';
         Label24.Caption := 'Mart Cost';
         Label22.Caption := 'Number In Group';
      end;

   WinData.LookupGroups.Open;
   LookUpPurchGrpData.Open;
   tPurchGrpHeader.Open;
   tPurchGrpData.Open;

   WinData.QuerySuppliers.Close;
   WinData.QuerySuppliers.Open;

   if FileExists(ExtractFilePath(ParamStr(0))+ 'gl1') then
      DeleteFile( PChar(ExtractFilePath(ParamStr(0)) + 'gl1') ) // delete old grid layout
   else if FileExists(IncludeTrailingBackslash(DataPath)+cGrpPurchGridLayoutFile) then
      gData.Columns.LoadFromFile(IncludeTrailingBackslash(DataPath)+cGrpPurchGridLayoutFile)
   else
      begin
         // Set column defaults for use with/without barcode scanner
         if Windata.UseScanner then
            begin
            end
         else
            begin
            end;
      end;

   for i := 0 to gData.Columns.Count-1 do
      begin
         mi := TMenuItem.Create(pmGridColumns);
         if gData.Columns[i].Visible then
            mi.Checked := True
         else
            mi.Checked := False;
         mi.Caption := gData.Columns[i].Title.Caption;
         mi.Tag := i;
         mi.OnClick := gridColMIClick;
         pmGridColumns.Items.Add(mi);
      end;

   pWarningPanel.Left := (Width div 2) - ( pWarningPanel.Width div 2) -1;
   pWarningPanel.Top := (Height div 2) - ( pWarningPanel.Height div 2) -1;
end;

procedure TfBBPPurchScr.MatchToCrush(const NatID: String);
begin
   if ( Global_Crush = nil ) then
      raise Exception.Create('TCrush Instance not created');

   if ( not(GetMatchAnimalsToCrushFile) ) then Exit;

   if ( Global_Crush.UpdateHasTag(NatID) ) then
      begin
         if ( not(tPurchGrpData.State in dsEditModes) ) then
            tPurchGrpData.Edit;

         tPurchGrpData.FieldByName('AnimalNo').AsString    := Global_Crush.CrushRecord.AnimalNum;
         tPurchGrpData.FieldByName('Weight').AsFloat       := Global_Crush.CrushRecord.Weight;
         tPurchGrpData.FieldByName('EventDate').AsDateTime := Global_Crush.CrushRecord.DateOfWeighing;
         if tPurchGrpData.FieldByName('EventDesc').AsString = '' then
            tPurchGrpData.FieldByName('EventDesc').AsString := 'Purchase';

         try
            tPurchGrpData.FieldByName('cGroupID').AsInteger := StrToInt(PurchBatchNum.Value);
         except
         end;

         tPurchGrpData.FieldByName('Matched').AsBoolean := True;
      end
   else
      begin
         tPurchGrpData.FieldByName('Matched').AsBoolean := False;
      end;
end;

procedure TfBBPPurchScr.tPurchGrpHeaderBeforePost(DataSet: TDataSet);
begin
   if tPurchGrpHeader.State in dsEditModes then
      if tPurchGrpHeader.FieldByName('PurchGroupID').AsInteger <= 0 then
         tPurchGrpHeader.Cancel;
end;

procedure TfBBPPurchScr.tPurchGrpHeaderBeforeInsert(DataSet: TDataSet);
begin
   if ( PurchBatchNum.Value = '0' ) then
      tPurchGrpHeader.Cancel;
end;

function TfBBPPurchScr.GetActualNumberInGroup: Integer;
begin
   Result := 0;
   if tPurchGrpData.State in dsEditModes then
      try
         tPurchGrpData.Post;
      except
      end;
   qGeneral.SQL.Clear;
   qGeneral.SQL.Add('Select Count(ID) CountOfMatched From PurchGrpData Where (cGroupID = '+PurchBatchNum.Value+') And ( Matched = True ) ');
   qGeneral.Active := True;
   try
      qGeneral.First;
      if qGeneral.FieldByName('CountOfMatched').AsInteger > 0 then
         Result := qGeneral.FieldByName('CountOfMatched').AsInteger;
   finally
      qGeneral.Active := False;
   end;
end;

procedure TfBBPPurchScr.sbDeleteCurrentClick(Sender: TObject);
begin
   try
      if tPurchGrpData.Active then
         if tPurchGrpData.RecordCount > 0 then
            if MessageDlg('Delete current animal record?', mtConfirmation, [mbYes, mbNo],0) = idYes then
               tPurchGrpData.Delete;
   except
      MessageDlg('Unable to delete animal record', mterror, [mbok],0);
   end;

end;

procedure TfBBPPurchScr.gDataGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
   if miMatchtoCrushFile.Checked then
      begin
         if ( tPurchGrpData.State <> dsInactive ) and ( tPurchGrpData.RecordCount > 0 ) then
            if ( tPurchGrpData.FieldByName('Matched').AsBoolean = False ) then
               AFont.Color := clRed;
      end;
end;

procedure TfBBPPurchScr.tPurchGrpDataBreedingValidate(Sender: TField);
begin
     If ( tPurchGrpData.FieldByName('Sex').Asstring = 'Steer' ) AND ( tPurchGrpData.FieldByName('Breeding').AsBoolean) then
        raise ErrorMsg.Create('Steers cannot be used for breeding');
end;

function TfBBPPurchScr.GetMatchAnimalsToCrushFile: Boolean;
begin
   GetRegValue(Reg_DefaultPath + Reg_BeefGrpPurchIdent, Reg_UseCrushFileIdent, Result);
end;

procedure TfBBPPurchScr.SetMatchAnimalsToCrushFile(const Value: Boolean);
begin
   SetRegValue(Reg_DefaultPath + Reg_BeefGrpPurchIdent, Reg_UseCrushFileIdent, Value);
end;

function TfBBPPurchScr.GetAutoGridUpdate: Boolean;
begin
   GetRegValue(Reg_DefaultPath + Reg_BeefGrpPurchIdent, Reg_AutoGridUpdate, Result);
end;

procedure TfBBPPurchScr.SetAutoGridUpdate(const Value: Boolean);
begin
   SetRegValue(Reg_DefaultPath + Reg_BeefGrpPurchIdent, Reg_AutoGridUpdate, Value);
end;

procedure TfBBPPurchScr.miMatchtoCrushFileClick(Sender: TObject);
begin
   miMatchtoCrushFile.Checked := not (miMatchtoCrushFile.Checked);
   MatchAnimalsToCrushFile := miMatchtoCrushFile.Checked;
   sbCrushData.Visible := miMatchtoCrushFile.Checked;
end;

procedure TfBBPPurchScr.miAutomaticGridUpdatesClick(Sender: TObject);
begin
   miAutomaticGridUpdates.Checked := not (miAutomaticGridUpdates.Checked);
   AutoGridUpdate := miAutomaticGridUpdates.Checked;
end;

procedure TfBBPPurchScr.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   //First need to post data if required.
   if tPurchGrpHeader.State = dsEdit then
      tPurchGrpHeader.Post;
   if tPurchGrpData.State = dsEdit then
      tPurchGrpData.Post;

    // Need to check if calculations need to be performed.
    if tPurchGrpHeader.FieldByName('Number').AsInteger <= tPurchGrpHeader.FieldByName('ActualNumber').AsInteger then
       begin
          if ( tPurchGrpheader.FieldByName('TotMartPrice').AsFloat < 1 ) and ( tPurchGrpData.RecordCount > 0 ) then
             begin

                if Application.MessageBox('Do you wish to perform calculations before exiting?', 'Kingswood Herd', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = idNo then
                   begin
                        miAutomaticGridUpdates.Checked := False;  //Prevents updates on Exit
                        Close;
                   end
                else
                   bCalc.Click;
               End
            Else
                Begin
                     miAutomaticGridUpdates.Checked := False;  //Prevents updates on Exit
                     Close;
                End;
       End
    else
        Begin
             miAutomaticGridUpdates.Checked := False;  //Prevents updates on Exit
             Close;
        End;
end;

procedure TfBBPPurchScr.FormDestroy(Sender: TObject);
begin
   LookUpPurchGrpData.Close;
   tPurchGrpHeader.Close;
   tPurchGrpData.Close;
   WinData.LookupGroups.Close;
   gData.Columns.SaveToFile(IncludeTrailingBackslash(DataPath)+cGrpPurchGridLayoutFile);
   Menuform.SetUpQuery;
   if FSearchForm <> nil then
      FreeAndNil(FSearchForm);
end;


procedure TfBBPPurchScr.gridColMIClick(Sender: TObject);
begin
   if ( Sender is TMenuItem ) then
      begin
         ( Sender as TMenuItem ).Checked := not (( Sender as TMenuItem ).Checked);
         gData.Columns[( Sender as TMenuItem ).Tag].Visible := ( Sender as TMenuItem ).Checked;
      end;
end;

procedure TfBBPPurchScr.sbExitClick(Sender: TObject);
begin
   Close;
end;

procedure TfBBPPurchScr.dbdPurchGrpDateExit(Sender: TObject);
begin
   // Need to post data if required
   if tPurchGrpHeader.State = dsEdit then
      tPurchGrpHeader.Post;

    // Can only get this to work on the OnExit event
    if miAutomaticGridUpdates.Checked = True then
       begin
          tPurchGrpData.First;
          while ( Not tPurchGrpData.EOF ) do
             begin
                tPurchGrpData.Edit;
                tPurchGrpData.FieldByName('EventDate').AsDateTime := dbdPurchGrpDate.Field.AsDateTime;
                tPurchGrpData.Post;
                tPurchGrpData.Next;
             end;
       end;

end;

procedure TfBBPPurchScr.CustomizeGridColumns1Click(Sender: TObject);
var
   i : integer;
begin
   TfmGridCols.ShowForm(gData.Columns, [], EhDbGridCols, DataPath, cGrpPurchGridLayoutFile);
   for i := 0 to gData.Columns.count-1 do
      pmGridColumns.Items[i].Checked := gData.Columns[i].Visible;
end;

procedure TfBBPPurchScr.SupplierCloseUp(Sender: TObject);
var
   ID : Integer;
begin
   if ( Supplier.Value = '0' ) then
      begin
         uSuppliers.ShowTheForm(True, ID);
         Supplier.KeyValue := ID;
      end;
end;

procedure TfBBPPurchScr.BuyersCloseUp(Sender: TObject);
var
   ID : Integer;
begin
   if (Buyers.Value = '0') then
      begin
         uBuyers.ShowTheForm(TRUE, ID);
         Buyers.KeyValue := ID;
      end;
end;

procedure TfBBPPurchScr.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('grouppurch.htm');
end;

procedure TfBBPPurchScr.pBarcodeClick(Sender: TObject);
begin
   teBarcode.SetFocus;
end;

procedure TfBBPPurchScr.teBarcodeExit(Sender: TObject);
begin
   if not(WinData.GlobalSettings.DisplayCrushScreen) then
      PostMessage(Handle, WM_ReadBarcodeOuput, 0,0);
end;

procedure TfBBPPurchScr.ReadBarcodeOuput(var msg: TMessage);
begin
   if msg.Msg = WM_ReadBarcodeOuput then
      begin
         ProcessBarcodeScan;
      end;
end;

procedure TfBBPPurchScr.ProcessBarcodeScan;
var
   MyString : string;
   RaiseError : Boolean;
begin
   // 04/02/2009 [Rel V3.9 R4.9, Dev V3.9 R5.9] /SP Program Improvement - New edit allowing user to scan either tag or dob/sex/breed .

   RaiseError := False;
   if Trim(teBarcode.Text) = '' then exit;

   if WhatStyleNatID( teBarcode.Text, TRUE) <> StyleUnKnown then
      begin
         Screen.Cursor := crHourGlass;
         Beep(3500,100);
         try
            tPurchGrpData.Append;
            if not (tPurchGrpData.State in dsEditModes) then
               tPurchGrpData.Edit;
            try
               tPurchGrpDataNatIDNum.AsString := teBarcode.Text;
            except
               on e : exception do
                  begin
                     strErrorMsg := E.Message;
                     RaiseError := True;
                     lWarningPanelLabel.Caption := E.Message;
                     pWarningPanel.Visible := True;
                     Update;
                     tPurchGrpData.Delete;
                     //ErrorTimer.Enabled := True;
                  end;
            end;
            teBarcode.Text := '';
            PostMessage(teBarcode.Handle, WM_SETFOCUS,0,0);
            if RaiseError then
               begin
                  teBarcode.Properties.ReadOnly := True;
                  Beep(1000,750);
                  ErrorTimer.Enabled := True;
               end;
         finally
            Screen.Cursor := crDefault;
         end;
      end
   else if (Length(teBarcode.Text) >= 11) then
      try
         Screen.Cursor := crHourGlass;
         Beep(3500,100);
         try
            if not(tPurchGrpData.State in dsEditModes) then
               begin
                  if Trim(tPurchGrpDataNatIDNum.AsString) <> '' then
                     begin
                        tPurchGrpData.Edit;
                     end
                  else
                     begin
                        teBarcode.Text := '';
                        Beep(1000,750);
                     end;
               end;

            if (tPurchGrpData.State in dsEditModes) then
               begin
                  tPurchGrpData.FieldByName('DateOfBirth').AsDateTime := StrToDate(Copy(teBarcode.Text, 1, 2) + '/' + Copy(teBarcode.Text, 3, 2)+ '/' + Copy(teBarcode.Text, 5, 4));

                  MyString := (UPPERCASE(Copy(teBarcode.Text, 10, (Strlen(PChar(teBarcode.Text)) - 9))));
                  WinData.Breeds.First;
                  if WinData.Breeds.Locate('Code', MyString,[]) then
                     tPurchGrpData.FieldByName('PrimaryBreed').AsInteger := WinData.Breeds.FieldByName('ID').AsInteger
                  else
                     begin
                        ShowMessage('Animal Breed ''' + (UpperCase(Copy(teBarcode.Text, 10, Strlen(PChar(teBarcode.Text))))) + '''  not in table, please add'  + #13 + 'breed code');
                        tPurchGrpData.FieldByName('PrimaryBreed').Clear;
                     end;

                  if (UPPERCASE(Copy(teBarcode.Text, 9, 1)) = 'F') then
                     tPurchGrpData.FieldByName('Sex').AsString := cSex_Female
                  else
                     tPurchGrpData.FieldByName('Sex').AsString := cSex_Steer;
                  teBarcode.Text := '';
                  PostMessage(teBarcode.Handle, WM_SETFOCUS,0,0);
               end;
         finally
            Screen.Cursor := crDefault;
         end;
      except
         teBarcode.Text := '';
         Beep(1000,750);
      end
   else
      begin
         Beep(1000,750);
         teBarcode.Text := '';
      end;
end;

procedure TfBBPPurchScr.ErrorTimerTimer(Sender: TObject);
begin
   ErrorTimer.Enabled := False;
   pWarningPanel.Visible := False;
   teBarcode.Properties.ReadOnly := False;
end;

procedure TfBBPPurchScr.btnSearchForAnimalClick(Sender: TObject);
var
   AnimalID,
   LactNo : Integer;
   WeighingRecord : PWeighingRecord;

   procedure ProcessAnimal(AAnimalID : Integer);
   var
      TotalMartWeight : Double;
   begin
      GetMem(WeighingRecord, SizeOf(TWeighingRecord));
      if ( WinData.AnimalFileByID.Locate('ID',AAnimalID,[]) ) then
         begin
            tPurchGrpData.Edit;
            tPurchGrpData.FieldByName('AnimalNo').Value := WinData.AnimalFileByID.FieldByName('AnimalNo').AsString;
            tPurchGrpData.FieldByName('NatIDNum').Value := WinData.AnimalFileByID.FieldByName('NatIDNum').AsString;
            tPurchGrpData.FieldByName('PrimaryBreed').Value := WinData.AnimalFileByID.FieldByName('PrimaryBreed').AsInteger;
            tPurchGrpData.FieldByName('Sex').Value := WinData.AnimalFileByID.FieldByName('Sex').AsString;
            tPurchGrpData.FieldByName('DateOfBirth').Value := WinData.AnimalFileByID.FieldByName('DateOfBirth').AsDateTime;
            tPurchGrpData.FieldByName('LactationNumber').Value := WinData.AnimalFileByID.FieldByName('LactNo').AsInteger;
            tPurchGrpData.FieldByName('cGroupID').Value := StrToInt(PurchBatchNum.Value);
            FLotPurchGrpID := tPurchGrpData.FieldByName('cGroupID').Value;
            tPurchGrpData.FieldByName('Matched').AsBoolean := True;
            LactNo := tPurchGrpData.FieldByName('LactationNumber').Value;
            tPurchGrpData.FieldByName('AID').Value := AAnimalID;

            //  01/08/12 [V5.0 R8.3] /MK Change - Purchase Weight should always be the first weighing event found.
            WinData.GetWeighingEventDetails(AnimalID,LactNo,'First',WeighingRecord);
            if WeighingRecord.Weight > 0 then
               begin
                  tPurchGrpData.FieldByName('Weight').Value := WeighingRecord.Weight;
                  TotalMartWeight := tPurchGrpData.FieldByName('Weight').Value;
               end;

            tPurchGrpData.Post;
            CountSumTotals;

            if tPurchGrpHeader.State in dsEditModes then
               begin
                  tPurchGrpHeader.FieldByName('MartWeight').AsFloat := tPurchGrpHeader.FieldByName('MartWeight').AsFloat + TotalMartWeight;
                  tPurchGrpHeader.Post;
               end;
         end;
   end;

   function PurchaseEventFound (AAnimalID : Integer) : Boolean;
   begin
      Result := False;
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT ID FROM Events');
            SQL.Add('WHERE AnimalID = :AAnimalID');
            SQL.Add('AND EventType = '+IntToStr(CPurchaseEvent)+' ');
            Params[0].AsInteger := AAnimalID;
            Open;
            try
               First;
               Result := Fields[0].AsInteger > 0;
            finally
               Close;
            end;
         finally
            Free;
         end;
   end;

begin
   if FSearchForm = nil then
      begin
         FSearchForm := TfmCrushGrpPurchAnimalSearch.Create(nil);
      end
   else
      begin
         FSearchForm.btnClear.Click;
      end;

   AnimalId := FSearchForm.GetAnimalId();
   if (AnimalID > 0) and not(PurchaseEventFound(AnimalID)) then
      begin
         tPurchGrpData.Append;
         ProcessAnimal(AnimalID);
      end
   else if (AnimalID = 0) then
      begin
         MessageDlg('Animal not found',mtError,[mbOK],0);
         Exit;
      end
   else
      MessageDlg('Animal already purchased',mtError,[mbOK],0);
end;

//   06/10/11 [V5.0 R1.2] /MK Additional Feature - New StartNewLot Procedure
procedure TfBBPPurchScr.StartNewLot;
begin
   if not(tPurchGrpHeader.Active) then
      tPurchGrpHeader.Active := True;

   if not tPurchGrpData.IsEmpty then
      begin
         tPurchGrpData.First;
         while NOT tPurchGrpData.EOF do
            tPurchGrpData.Delete;
      end;

   gData.Refresh;

   tPurchGrpHeader.Last;
   tPurchGrpHeader.Edit;
   tPurchGrpHeader.FieldByName('MartWeight').Clear;
   tPurchGrpHeader.FieldByName('MartCost').Clear;
   tPurchGrpHeader.FieldByName('ActualNumber').Clear;
   tPurchGrpHeader.FieldByName('Number').Clear;
   tPurchGrpHeader.FieldByName('TotWeight').Clear;
   tPurchGrpHeader.FieldByName('TotMartPrice').Clear;
   tPurchGrpHeader.FieldByName('TotCostIntoPen').Clear;
   tPurchGrpHeader.Post;

   gData.Refresh;
end;

end.
