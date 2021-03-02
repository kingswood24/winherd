{
   17/02/11 [V4.0 R8.2] /MK Change - If Location Fields In Owner's Table Are Null Then NatIDFormatting Preference Is True and
                                     ShowMessage That Locations Do Not Exist and Herd Setup screen then shows.

   12/03/11 [V4.0 R8.7] /MK Additional Feature - Added Print Button For Calves To Be Registered and Calves Registered screens.

   12/04/11 [V4.0 R9.5] /MK Additional Feature - Check To See if CTSLogInDetails Exits Before Sending Request.

   19/04/11 [V4.0 R9.8] /MK Bug - Fixed Check As It Wasn't Checking the Data Directory Properly.

   23/02/12 [V5.0 R4.0] /MK Change - Check For Blank Sex and Breed Of Calves Before Registering.

   09/02/13 [V5.1 R4.1] /MK Additional Feature - LoadBirthsToRegister - Check to see if RelinkCalvesToDams needs to run.

   26/06/13 [V5.1 R7.5] /MK Additional Feature - Added link to Calves Registered.

   06/05/16 [V5.5 R5.4] /MK Change - LoadBirthsToBeRegistered - Added code to the sql below to check further to see if the calf was registered previously
                                                                and the Calvings.ID[]CTSReg value was not updated but the CTSRequest.Registered value was updated - Julie Granger.

   14/09/18 [V5.8 R2.8] /MK Bug Fix - LoadBirthsToBeRegistered - Deleted animals were being included.
                            Change - actRegisterCTSExecute - If any of the 3 fields (NatID, Sex, Breed) are Null then sort by the field, give error and exit out of procedure.
                                   - When the user clicks bbRemoveNatIdFormatting then apply the change without exiting from the screen.

   25/09/18 [V5.8 R3.0] /MK Bug Fix - actRegisterCTSExecute - Only show errors about blank tags, sex or breed if in the registering tab not results tab - Heulwen (Dales).

   22/10/18 [V5.8 R4.0] /MK Bug Fix - actRegisterCTSExecute - When looping for bNullRecordsFound only do check if check is False.
                                                            - Instead of GoToError change to raise Exception.Create as GoToError was appearing even if there were no animals in results page.

   13/03/19 [V5.8 R8.0] /MK Change - New private variable FNullRecordsFound used when loading animals and registering calves to show error if null NatID, Sex or Breed.
                                   - New procedure, SortByNullRecordsFound, uused when loading animals and registering calves to sort grid by NullRecords.
                            Bug Fix - NullRecords check when registering calves should only apply to selected records - Joey (Muldowney's Garrel herd).       

   25/02/21 [V5.9 R9.0] /MK Change - LoadBirthsToBeRegistered - If the sire has a tag number the use that as the identifier else use Animal No./Short Name - Wendy Radley/Muldowney.
                                   - Changed caption of Sire NatId to Sire Identifier to show the user that the sire can be the tag or animal no.
}

unit uCTSBirthReg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Db,
  DBTables, dxStatusBar, cxPC, ActnList, Menus, dxBar, dxBarExtItems,
  cxGridBandedTableView, cxGridDBBandedTableView, StdCtrls, cxButtons,
  cxStyles, cxLabel, cxContainer, cxEdit, cxGroupBox, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxHyperLinkEdit, uCTSHelper, dxPSCore,
  dxPScxCommon, dxPScxGridLnk, cxSplitter, uCTSLoginData, uCalfRegReview,
  cxCustomData;

type
  TCheckType = (ctNatID, ctSex, ctBreed);
  
  TfmCTSWSBirthReg = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    ActionList1: TActionList;
    actExit: TAction;
    actLogin: TAction;
    PageControl: TcxPageControl;
    tsToBeRegistered: TcxTabSheet;
    tsPreviousResults: TcxTabSheet;
    tsRegistrationResults: TcxTabSheet;
    RegBirthGridLevel: TcxGridLevel;
    RegBirthGrid: TcxGrid;
    tmpCTSBirths: TTable;
    dstmpCTSBirths: TDataSource;
    QueryDamSire: TQuery;
    GenQuery: TQuery;
    tmpCTSBirthsID: TAutoIncField;
    tmpCTSBirthsEventID: TIntegerField;
    tmpCTSBirthsAnimalID: TIntegerField;
    tmpCTSBirthsNatIDNum: TStringField;
    tmpCTSBirthsOutputNatIDNum: TStringField;
    tmpCTSBirthsSortNatIDNum: TStringField;
    tmpCTSBirthsSex: TStringField;
    tmpCTSBirthsDateOfBirth: TDateField;
    tmpCTSBirthsBreed: TStringField;
    tmpCTSBirthsEID: TStringField;
    tmpCTSBirthsOutputDamNatIDNum: TStringField;
    tmpCTSBirthsDamNatIDNum: TStringField;
    tmpCTSBirthsDamSortNatIDNum: TStringField;
    tmpCTSBirthsOutputSurrogateNatIDNum: TStringField;
    tmpCTSBirthsSurrogateNatIDNum: TStringField;
    tmpCTSBirthsSurrogateSortNatIDNum: TStringField;
    tmpCTSBirthsOutputSireNatIDNum: TStringField;
    tmpCTSBirthsSireNatIDNum: TStringField;
    tmpCTSBirthsSireSortNatIDNum: TStringField;
    tmpCTSBirthsBLoc: TStringField;
    tmpCTSBirthsBSLoc: TStringField;
    tmpCTSBirthsPLoc: TStringField;
    tmpCTSBirthsPSLoc: TStringField;
    tmpCTSBirthsIgnoreWarnings: TBooleanField;
    tmpCTSBirthsSelected: TBooleanField;
    tmpCTSBirthsCTSBatchID: TIntegerField;
    tmpCTSBirthsRegistered: TBooleanField;
    cxStyleRepository1: TcxStyleRepository;
    cxStyleRegistered: TcxStyle;
    cxStyleNotRegistered: TcxStyle;
    cxStyleDefault: TcxStyle;
    blbRegisterCTS: TdxBarLargeButton;
    actRegisterCTS: TAction;
    blbLoadTestData: TdxBarLargeButton;
    Births: TTable;
    BirthsID: TAutoIncField;
    BirthsCTSBatchID: TIntegerField;
    BirthsEventID: TIntegerField;
    BirthsAnimalID: TIntegerField;
    BirthsNatIDNum: TStringField;
    BirthsOutputNatIDNum: TStringField;
    BirthsSortNatIDNum: TStringField;
    BirthsSex: TStringField;
    BirthsDateOfBirth: TDateField;
    BirthsBreed: TStringField;
    BirthsEID: TStringField;
    BirthsOutputDamNatIDNum: TStringField;
    BirthsDamNatIDNum: TStringField;
    BirthsDamSortNatIDNum: TStringField;
    BirthsOutputSurrogateNatIDNum: TStringField;
    BirthsSurrogateNatIDNum: TStringField;
    BirthsSurrogateSortNatIDNum: TStringField;
    BirthsOutputSireNatIDNum: TStringField;
    BirthsSireNatIDNum: TStringField;
    BirthsSireSortNatIDNum: TStringField;
    BirthsBLoc: TStringField;
    BirthsBSLoc: TStringField;
    BirthsPLoc: TStringField;
    BirthsPSLoc: TStringField;
    BirthsIgnoreWarnings: TBooleanField;
    BirthsSelected: TBooleanField;
    BirthsRegistered: TBooleanField;
    RegBirthGridDBTableView: TcxGridDBTableView;
    RegBirthGridDBTableViewID: TcxGridDBColumn;
    RegBirthGridDBTableViewEventID: TcxGridDBColumn;
    RegBirthGridDBTableViewAnimalID: TcxGridDBColumn;
    RegBirthGridDBTableViewNatIDNum: TcxGridDBColumn;
    RegBirthGridDBTableViewOutputNatIDNum: TcxGridDBColumn;
    RegBirthGridDBTableViewSortNatIDNum: TcxGridDBColumn;
    RegBirthGridDBTableViewSex: TcxGridDBColumn;
    RegBirthGridDBTableViewDateOfBirth: TcxGridDBColumn;
    RegBirthGridDBTableViewBreed: TcxGridDBColumn;
    RegBirthGridDBTableViewEID: TcxGridDBColumn;
    RegBirthGridDBTableViewOutputDamNatIDNum: TcxGridDBColumn;
    RegBirthGridDBTableViewDamNatIDNum: TcxGridDBColumn;
    RegBirthGridDBTableViewDamSortNatIDNum: TcxGridDBColumn;
    RegBirthGridDBTableViewOutputSurrogateNatIDNum: TcxGridDBColumn;
    RegBirthGridDBTableViewSurrogateNatIDNum: TcxGridDBColumn;
    RegBirthGridDBTableViewSurrogateSortNatIDNum: TcxGridDBColumn;
    RegBirthGridDBTableViewOutputSireNatIDNum: TcxGridDBColumn;
    RegBirthGridDBTableViewSireNatIDNum: TcxGridDBColumn;
    RegBirthGridDBTableViewSireSortNatIDNum: TcxGridDBColumn;
    RegBirthGridDBTableViewBLoc: TcxGridDBColumn;
    RegBirthGridDBTableViewBSLoc: TcxGridDBColumn;
    RegBirthGridDBTableViewPLoc: TcxGridDBColumn;
    RegBirthGridDBTableViewPSLoc: TcxGridDBColumn;
    RegBirthGridDBTableViewIgnoreWarnings: TcxGridDBColumn;
    RegBirthGridDBTableViewSelected: TcxGridDBColumn;
    RegBirthGridDBTableViewCTSBatchID: TcxGridDBColumn;
    RegBirthGridDBTableViewRegistered: TcxGridDBColumn;
    RegBirthGridDBTableViewStatus: TcxGridDBColumn;
    gbRegistrationResults: TcxGroupBox;
    cxLabel5: TcxLabel;
    cxLabel2: TcxLabel;
    cmboView: TcxComboBox;
    blbHelp: TdxBarLargeButton;
    actHelp: TAction;
    dxBarStatic1: TdxBarStatic;
    cxLabel4: TcxLabel;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    actCheckCTSWSStatus: TAction;
    StatusBar: TdxStatusBar;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton3: TdxBarButton;
    actViewCTSExceptions: TAction;
    QueryCTSRequests: TQuery;
    PreviousResultsGrid: TcxGrid;
    PreviousResultsGridTableView: TcxGridDBTableView;
    PreviousResultsGridTableViewAnimalID: TcxGridDBColumn;
    PreviousResultsGridTableViewNatIDNum: TcxGridDBColumn;
    PreviousResultsGridTableViewSortNatIDNum: TcxGridDBColumn;
    PreviousResultsGridTableViewSex: TcxGridDBColumn;
    PreviousResultsGridTableViewDateOfBirth: TcxGridDBColumn;
    PreviousResultsGridTableViewBreed: TcxGridDBColumn;
    PreviousResultsGridTableViewDamNatIDNum: TcxGridDBColumn;
    PreviousResultsGridTableViewDamSortNatIDNum: TcxGridDBColumn;
    PreviousResultsGridTableViewSurrogateNatIDNum: TcxGridDBColumn;
    PreviousResultsGridTableViewSurrogateSortNatIDNum: TcxGridDBColumn;
    PreviousResultsGridTableViewSireNatIDNum: TcxGridDBColumn;
    PreviousResultsGridTableViewSireSortNatIDNum: TcxGridDBColumn;
    PreviousResultsGridLevel: TcxGridLevel;
    dsQueryCTSRequests: TDataSource;
    PreviousResultsGridTableViewStatus: TcxGridDBColumn;
    PreviousResultsGridTableViewRequestDate: TcxGridDBColumn;
    PreviousResultsGridTableViewRegistered: TcxGridDBColumn;
    gbRegistrationResultsNos: TcxGroupBox;
    lCalvesAccepted: TcxLabel;
    lCalvesRejected: TcxLabel;
    lNoRejected: TcxLabel;
    lNoAccepted: TcxLabel;
    gbPreviousResultsNos: TcxGroupBox;
    lCalves: TcxLabel;
    lNoOfCalves: TcxLabel;
    GridPopupMenu: TdxBarPopupMenu;
    bbChangeDamNatID: TdxBarButton;
    bbChangeSireNatID: TdxBarButton;
    bbChangeSurrDamNatID: TdxBarButton;
    actChangeSireNatIDNum: TAction;
    actChangeDamNatIDNum: TAction;
    actChangeSurrogateDamNatIDNum: TAction;
    tmpCTSBirthsDamID: TIntegerField;
    tmpCTSBirthsSurrogateDamID: TIntegerField;
    tmpCTSBirthsSireID: TIntegerField;
    QueryCTSRequestsDamNatID: TStringField;
    QueryCTSRequestsGenDamNatID: TStringField;
    QueryCTSRequestsID: TIntegerField;
    QueryCTSRequestsRequestdate: TDateTimeField;
    QueryCTSRequestsCTSBatchID: TIntegerField;
    QueryCTSRequestsRegistered: TBooleanField;
    QueryCTSRequestsAnimalID: TIntegerField;
    QueryCTSRequestsWarnings: TBooleanField;
    QueryCTSRequestsTxnId: TStringField;
    QueryCTSRequestsNatIDNum: TStringField;
    QueryCTSRequestsSex: TStringField;
    QueryCTSRequestsDateOfBirth: TDateField;
    QueryCTSRequestsSortNatID: TStringField;
    QueryCTSRequestsDamNatIDNum: TStringField;
    QueryCTSRequestsDamSortNatID: TStringField;
    QueryCTSRequestsSireNatIDNum: TStringField;
    QueryCTSRequestsSireSortNatID: TStringField;
    QueryCTSRequestsDonorDamNatID: TStringField;
    QueryCTSRequestsDonorDamSortNatID: TStringField;
    QueryCTSRequestsBreedCode: TStringField;
    bbRemoveSireNatIdNum: TdxBarButton;
    bbRemoveSurrogateNatIdNum: TdxBarButton;
    actRemoveSireNatIdNum: TAction;
    actRemoveSurrogateNatIdNum: TAction;
    dxBarButton4: TdxBarButton;
    actRemovePermanently: TAction;
    tmpCTSBirthsCalvingFieldName: TStringField;
    bbRemoveNatIdFormatting: TdxBarButton;
    actRemoveAllPermanently: TAction;
    dxBarButton5: TdxBarButton;
    actRemoveAllBullCalves: TAction;
    tmpCTSBirthsDBSex: TStringField;
    dxBarButton6: TdxBarButton;
    ComponentPrinter: TdxComponentPrinter;
    actPrintGrid: TAction;
    blbPrint: TdxBarLargeButton;
    dxBarInPlaceSubItem1: TdxBarInPlaceSubItem;
    dxBarSpinEdit1: TdxBarSpinEdit;
    dxBarToolbarsListItem1: TdxBarToolbarsListItem;
    dxBarImageCombo1: TdxBarImageCombo;
    dxBarTreeViewCombo1: TdxBarTreeViewCombo;
    cxSplitter1: TcxSplitter;
    ToBeRegBirthComponentPrinterLink: TdxGridReportLink;
    CalvesRegisteredComponentPrinterLink: TdxGridReportLink;
    bbCalvesRegistered: TdxBarButton;
    procedure FormCreate(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actLoginExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PageControlPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure actRegisterCTSExecute(Sender: TObject);
    procedure blbLoadTestDataClick(Sender: TObject);
    procedure RegBirthGridDBTableViewStatusPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure RegBirthGridDBTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cmboViewPropertiesChange(Sender: TObject);
    procedure actCheckCTSWSStatusExecute(Sender: TObject);
    procedure actHelpExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure tmpCTSBirthsAfterPost(DataSet: TDataSet);
    procedure actViewCTSExceptionsExecute(Sender: TObject);
    procedure RegisteredGridTableViewStatusPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure RegisteredGridTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure tsRegistrationResultsShow(Sender: TObject);
    procedure tsPreviousResultsShow(Sender: TObject);
    procedure RegBirthGridDBTableViewSireSortNatIDNumGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure RegBirthGridDBTableViewSurrogateSortNatIDNumGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure RegBirthGridDBTableViewDamSortNatIDNumGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure RegBirthGridDBTableViewSortNatIDNumGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure actChangeSireNatIDNumExecute(Sender: TObject);
    procedure RegBirthGridDBTableViewCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure actChangeDamNatIDNumExecute(Sender: TObject);
    procedure actChangeSurrogateDamNatIDNumExecute(Sender: TObject);
    procedure GridPopupMenuPopup(Sender: TObject);
    procedure QueryCTSRequestsCalcFields(DataSet: TDataSet);
    procedure actRemoveSireNatIdNumExecute(Sender: TObject);
    procedure actRemoveSurrogateNatIdNumExecute(Sender: TObject);
    procedure actRemovePermanentlyExecute(Sender: TObject);
    procedure bbRemoveNatIdFormattingClick(Sender: TObject);
    procedure actRemoveAllPermanentlyExecute(Sender: TObject);
    procedure actRemoveAllBullCalvesExecute(Sender: TObject);
    procedure actPrintGridExecute(Sender: TObject);
    procedure bbCalvesRegisteredClick(Sender: TObject);
  private
    { Private declarations }
    bSuccess : Boolean;
    PLoc,PSLoc,BLoc,BSLoc : string;
    CTSBatchID : Integer;
    ThisHerdID : Integer;
    CTSBirthsView : TCTSView;
    FNullRecordsFound : Boolean;
    function CountOfAnimals(ARegistered : Boolean) : Integer;
    procedure LoadBirthsToBeRegistered();
    function Call_Register_Births_Request : Boolean;
    procedure DisplayResults;
    procedure UpdateHerdDatabase;
    function CountOfSelected : Integer;
    procedure ViewPreviousResults(ARegisteredView : TRegisteredView) ;
    procedure UpdateAnimals_NatIDNum(ANatIDFieldName, AIDFieldName: string);
    procedure Remove_NatIDNum(ANatIDFieldName: string);
    function RegisterCalfRecord(AEventID : Integer; ACalfField : string) : Boolean;
    procedure UpdateStatusBar;
    procedure SortByNullRecordsFound;
  public
    { Public declarations }
    class procedure Execute;
  end;

var
  fmCTSWSBirthReg: TfmCTSWSBirthReg;

implementation

uses
   uImageStore, DairyData, KRoutines, KDBRoutines, uCTSLoginInfo,
   GenTypesConst, uCTSRegResults, BDE, uCTSExceptions, MenuUnit,
   uPreferences, uHerdSetUp;

{$R *.DFM}

{ TForm1 }

class procedure TfmCTSWSBirthReg.Execute;
begin
   with TfmCTSWSBirthReg.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmCTSWSBirthReg.LoadBirthsToBeRegistered;
var
   sSireId : String;

   // Check Breed code is len 1-5 UPPER
   // Sex Length 1 value f or m
   procedure LoadBirths;
   var
      i : byte;
   begin
      //BirthTable.AfterScroll := nil; // stop unwanted flickering of nav bar buttons.
      tmpCTSBirths.DisableControls;

      with GenQuery do
         begin
            for i := 1 to 4 do
               begin
                  SQL.Clear;
                  SQL.Add('INSERT INTO tmpCTSBirths ( EventID, AnimalID, CalvingFieldName )');
                  case i of
                     1 : SQL.Add('SELECT EventID, ID1, ''ID1CTSReg''');
                     2 : SQL.Add('SELECT EventID, ID2, ''ID2CTSReg''');
                     3 : SQL.Add('SELECT EventID, ID3, ''ID3CTSReg''');
                     4 : SQL.Add('SELECT EventID, ID4, ''ID4CTSReg''');
                  end;
                  SQL.Add('FROM "Calvings.DB"');
                  //   06/05/16 [V5.5 R5.4] /MK Change - Added code to the sql below to check further to see if the calf was registered previously
                  //                                     and the Calvings.ID[]CTSReg value was not updated but the CTSRequest.Registered value was updated - Julie Granger.
                  case i of
                     1 : begin
                            SQL.Add('WHERE (ID1CTSReg = FALSE )');
                            SQL.Add('AND   (ID1 > 0)');
                            SQL.Add('AND   (CalfDead1 = FALSE)');
                            SQL.Add('AND   (ID1 NOT IN (SELECT AnimalID');
                            SQL.Add('                   FROM CTSRequest');
                            SQL.Add('                   WHERE (Registered = TRUE)');
                            SQL.Add('                   AND   (RequestType = 1)))');
                         end;
                     2 : begin
                            SQL.Add('WHERE (ID2CTSReg = FALSE)');
                            SQL.Add('AND   (ID2 > 0)');
                            SQL.Add('AND   (CalfDead2 = FALSE)');
                            SQL.Add('AND   (ID2 NOT IN (SELECT AnimalID');
                            SQL.Add('                   FROM CTSRequest');
                            SQL.Add('                   WHERE (Registered = TRUE)');
                            SQL.Add('                   AND   (RequestType = 1)))');
                         end;
                     3 : begin
                            SQL.Add('WHERE (ID3CTSReg = FALSE)');
                            SQL.Add('AND   (ID3 > 0)');
                            SQL.Add('AND   (CalfDead3 = FALSE)');
                            SQL.Add('AND   (ID3 NOT IN (SELECT AnimalID');
                            SQL.Add('                   FROM CTSRequest');
                            SQL.Add('                   WHERE (Registered = TRUE)');
                            SQL.Add('                   AND   (RequestType = 1)))');
                         end;
                     4 : begin
                            SQL.Add('WHERE (ID4CTSReg = FALSE)');
                            SQL.Add('AND   (ID4 > 0)');
                            SQL.Add('AND   (CalfDead4 = FALSE)');
                            SQL.Add('AND   (ID4 NOT IN (SELECT AnimalID');
                            SQL.Add('                   FROM CTSRequest');
                            SQL.Add('                   WHERE (Registered = TRUE)');
                            SQL.Add('                   AND   (RequestType = 1)))');
                         end;
                  end;
                  ExecSQL;
               end;

            SQL.Clear;
            SQL.Add('DELETE FROM tmpCTSBirths');
            SQL.Add('WHERE AnimalID NOT IN (SELECT ID FROM Animals WHERE (HerdID = :AHerdID))');
            Params[0].AsInteger := ThisHerdID;
            ExecSQL;

            SQL.Clear;
            SQL.Add('DELETE FROM tmpCTSBirths');
            //   14/09/18 [V5.8 R2.8] /MK Bug Fix - Delete animals were being included.
            SQL.Add('WHERE AnimalID IN (SELECT ID FROM Animals WHERE (HerdID = :AHerdID) AND ((InHerd = False) OR (AnimalDeleted = True)) )');
            Params[0].AsInteger := ThisHerdID;
            ExecSQL;

            tmpCTSBirths.Refresh;
            SQL.Clear;
            SQL.Add('SELECT ID, AnimalNo, NatIDNum, SortNatId, Colour, PrimaryBreed, Sex, DateOfBirth, DamID, DonorDamID, SireID, HerdID ');
            SQL.Add('FROM Animals A, tmpCTSBirths T');
            SQL.Add('WHERE (T.AnimalID=A.ID)');
            SQL.Add('ORDER BY ID ');
            Open;

            try
               First;
               while not eof do
                  begin
                     if tmpCTSBirths.Locate('AnimalID', FieldByName('ID').Value,[] ) then
                        begin
                           tmpCTSBirths.Edit;
                           try
                              tmpCTSBirths.FieldByName('Selected').AsBoolean := True;
                              tmpCTSBirths.FieldByName('Registered').AsBoolean := False;
                              tmpCTSBirths.FieldByName('IgnoreWarnings').AsBoolean := False;
                              tmpCTSBirths.FieldByName('NatIDNum').AsString := FieldByName('NatIDNum').AsString;
                              if ( bbRemoveNatIdFormatting.Down ) then
                                 tmpCTSBirths.FieldByName('OutputNatIDNum').AsString := WinData.StripAllSpaces(FieldByName('NatIDNum').AsString)
                              else
                                 tmpCTSBirths.FieldByName('OutputNatIDNum').AsString := FieldByName('NatIDNum').AsString;
                              tmpCTSBirths.FieldByName('SortNatIDNum').AsString := FieldByName('SortNatID').AsString;
                              tmpCTSBirths.FieldByName('BLoc').AsString := BLoc;
                              tmpCTSBirths.FieldByName('BSLoc').AsString := BSLoc;
                              tmpCTSBirths.FieldByName('PLoc').AsString := PLoc;
                              tmpCTSBirths.FieldByName('PSLoc').AsString := PSLoc;
                              if FieldByName('Sex').AsString = cSex_Female then
                                 tmpCTSBirths.FieldByName('Sex').AsString := 'F'
                              else
                                 tmpCTSBirths.FieldByName('Sex').AsString := 'M';
                              tmpCTSBirths.FieldByName('DBSex').AsString := FieldByName('Sex').AsString;

                              tmpCTSBirths.FieldByName('DateOfBirth').AsDateTime := FieldByName('DateOfBirth').AsDateTime;
                              // Now try locate the calf's breed and breed code
                              if WinData.Breeds.Locate('ID',FieldByName('PrimaryBreed').Value,[] ) then
                                 tmpCTSBirths.FieldByName('Breed').AsString := UPPERCASE(WinData.Breeds.FieldByName('Code').AsString);

                              if FieldByName('DonorDamID').AsInteger > 0 then
                                 begin
                                    // Get the Gen Dam Nat ID.
                                    QueryDamSire.Close;
                                    QueryDamSire.Params[0].AsInteger := FieldByName('DonorDamID').AsInteger;
                                    QueryDamSire.Open;

                                    if ( bbRemoveNatIdFormatting.Down ) then
                                       tmpCTSBirths.FieldByName('OutputDamNatIDNum').AsString := WinData.StripAllSpaces(QueryDamSire.FieldByName('NatIDNum').AsString)
                                    else
                                       tmpCTSBirths.FieldByName('OutputDamNatIDNum').AsString := QueryDamSire.FieldByName('NatIDNum').AsString;
                                    tmpCTSBirths.FieldByName('DamNatIDNum').AsString := QueryDamSire.FieldByName('NatIDNum').AsString;
                                    tmpCTSBirths.FieldByName('DamSortNatIDNum').AsString := QueryDamSire.FieldByName('SortNatID').AsString;
                                    tmpCTSBirths.FieldByName('DamID').AsInteger := FieldByName('DonorDamID').AsInteger;

                                    // Get the Surrogate Dam Nat ID.
                                    QueryDamSire.Close;
                                    QueryDamSire.Params[0].AsInteger := FieldByName('DamID').AsInteger;
                                    QueryDamSire.Open;

                                    if ( bbRemoveNatIdFormatting.Down ) then
                                       tmpCTSBirths.FieldByName('OutputSurrogateNatIDNum').AsString := WinData.StripAllSpaces(QueryDamSire.FieldByName('NatIDNum').AsString)
                                    else
                                       tmpCTSBirths.FieldByName('OutputSurrogateNatIDNum').AsString := QueryDamSire.FieldByName('NatIDNum').AsString;
                                    tmpCTSBirths.FieldByName('SurrogateNatIDNum').AsString := QueryDamSire.FieldByName('NatIDNum').AsString;
                                    tmpCTSBirths.FieldByName('SurrogateSortNatIDNum').AsString := QueryDamSire.FieldByName('SortNatID').AsString;
                                    tmpCTSBirths.FieldByName('SurrogateDamID').AsInteger := FieldByName('DamID').AsInteger;

                                 end
                              else
                                 begin
                                    // Get the Gen Dam Nat ID.
                                    QueryDamSire.Close;
                                    QueryDamSire.Params[0].AsInteger := FieldByName('DamID').AsInteger;
                                    QueryDamSire.Open;

                                    tmpCTSBirths.FieldByName('DamID').AsInteger := FieldByName('DamID').AsInteger;
                                    if ( bbRemoveNatIdFormatting.Down ) then
                                       tmpCTSBirths.FieldByName('OutputDamNatIDNum').AsString := WinData.StripAllSpaces(QueryDamSire.FieldByName('NatIDNum').AsString)
                                    else
                                       tmpCTSBirths.FieldByName('OutputDamNatIDNum').AsString := QueryDamSire.FieldByName('NatIDNum').AsString;
                                    tmpCTSBirths.FieldByName('DamNatIDNum').AsString := QueryDamSire.FieldByName('NatIDNum').AsString;
                                    tmpCTSBirths.FieldByName('DamSortNatIDNum').AsString := QueryDamSire.FieldByName('SortNatID').AsString;
                                 end;

                              if FieldByName('SireID').AsInteger > 0 then
                                 begin
                                    // Get the Sire Nat ID.
                                    QueryDamSire.Close;
                                    QueryDamSire.Params[0].AsInteger := FieldByName('SireID').AsInteger;
                                    QueryDamSire.Open;

                                    //   25/02/21 [V5.9 R9.0] /MK Change - If the sire has a tag number the use that as the identifier else use Animal No./Short Name - Wendy Radley/Muldowney.
                                    if ( (Length(QueryDamSire.FieldByName('NatIDNum').AsString) > 0) and
                                         ((IsValidIrishHerdID(QueryDamSire.FieldByName('NatIDNum').AsString)) or (IsValidUKHerdID(QueryDamSire.FieldByName('NatIDNum').AsString))) ) then
                                       begin
                                          sSireId := QueryDamSire.FieldByName('NatIDNum').AsString;
                                          tmpCTSBirths.FieldByName('SireSortNatIDNum').AsString := QueryDamSire.FieldByName('SortNatID').AsString;
                                       end
                                    else if ( Length(QueryDamSire.FieldByName('AnimalNo').AsString) > 0 ) then
                                       begin
                                          sSireId := QueryDamSire.FieldByName('AnimalNo').AsString;
                                          tmpCTSBirths.FieldByName('SireSortNatIDNum').AsString := QueryDamSire.FieldByName('SortAnimalNo').AsString;
                                       end
                                    else if ( Length(QueryDamSire.FieldByName('Name').AsString) > 0 ) then
                                       sSireId := Copy(QueryDamSire.FieldByName('Name').AsString,0,14)
                                    else if ( Length(QueryDamSire.FieldByName('UKAISireCode').AsString) > 0 ) then
                                       sSireId := QueryDamSire.FieldByName('UKAISireCode').AsString;

                                    tmpCTSBirths.FieldByName('SireID').AsInteger := FieldByName('SireID').AsInteger;
                                    if ( bbRemoveNatIdFormatting.Down ) then
                                       tmpCTSBirths.FieldByName('OutputSireNatIDNum').AsString := WinData.StripAllSpaces(sSireId)
                                    else
                                       tmpCTSBirths.FieldByName('OutputSireNatIDNum').AsString := sSireId;
                                    tmpCTSBirths.FieldByName('SireNatIDNum').AsString := sSireId;
                                 end;

                              tmpCTSBirths.Post;
                           except
                              on E : EDatabaseError do
                                  begin
                                     tmpCTSBirths.Cancel;
                                     MessageDlg(Format('Failed to create animal birth record. ID: %s',[ FieldByName('NatIDNum').AsString]),mtError,[mbOK],0);
                                  end;
                           end;
                        end;
                     Next;
                  end;
            finally
               Close;
               tmpCTSBirths.Refresh;
               tmpCTSBirths.First;
               tmpCTSBirths.EnableControls;
            end;
         end;
   end;

begin

   RegBirthGridDBTableView.DataController.BeginFullUpdate;
   Screen.Cursor := crHourGlass;
   try
      with tmpCTSBirths do
         begin
            if Filtered then
               begin
                  Filter := '';
                  Filtered := False;
               end;
            if Active then
               begin
                  Active := False;
               end;

            if Exists then
               DeleteTable;

            with FieldDefs do
               begin
                  Clear;
                  Add('ID', ftAutoInc);
                  Add('CTSBatchID', ftInteger);
                  Add('EventID', ftInteger);
                  Add('AnimalID', ftInteger);
                  Add('NatIDNum', ftString, 20);
                  Add('OutputNatIDNum', ftString, 14);
                  Add('SortNatIDNum', ftString, 20);
                  Add('Sex', ftString, 6);
                  Add('DBSex', ftString, 6);
                  Add('DateOfBirth', ftDate);
                  Add('Breed', ftString, 6);
                  Add('EID', ftString, 20);
                  Add('OutputDamNatIDNum', ftString, 14);
                  Add('DamID', ftInteger);
                  Add('DamNatIDNum', ftString, 20);
                  Add('DamSortNatIDNum', ftString, 20);
                  Add('SurrogateDamID', ftInteger);
                  Add('OutputSurrogateNatIDNum', ftString, 14);
                  Add('SurrogateNatIDNum', ftString, 20);
                  Add('SurrogateSortNatIDNum', ftString, 20);
                  Add('SireID', ftInteger);
                  Add('OutputSireNatIDNum', ftString, 14);
                  Add('SireNatIDNum', ftString, 20);
                  Add('SireSortNatIDNum', ftString, 20);
                  Add('BLoc', ftString, 20);
                  Add('BSLoc', ftString, 20);
                  Add('PLoc', ftString, 20);
                  Add('PSLoc', ftString, 20);
                  Add('IgnoreWarnings', ftBoolean);
                  Add('Selected', ftBoolean);
                  Add('Registered', ftBoolean);
                  Add('CalvingFieldName', ftString, 10);
               end;

            with IndexDefs do
               begin
                  Clear;
                  Add('iID', 'ID', [ixPrimary,ixUnique]);
                  { Ascending }
                  Add('iAnimalID', 'AnimalID',[ixCaseInsensitive]);
                  Add('iEventID', 'EventID',[ixCaseInsensitive]);
               end;

            CreateTable;
            Open;

            //   09/02/13 [V5.1 R4.1] /MK Additional Feature - Check to see if RelinkCalvesToDams needs to run.
            WinData.CheckForRelinkCalvesToDams(cCheckCalvesForOneMonth);

            LoadBirths;

            SortByNullRecordsFound;
         end;
   finally
      RegBirthGridDBTableView.DataController.RefreshExternalData;
      RegBirthGridDBTableView.DataController.EndFullUpdate;
      Screen.Cursor := crDefault;
   end;
end;


procedure TfmCTSWSBirthReg.FormCreate(Sender: TObject);
var
   vPLoc, vPSLoc,
   vBLoc, vBSLoc : Variant;
begin
   ImageStore := TImageStore.Create(nil);
   ThisHerdID := WinData.UserDefaultHerdID;

   vPLoc := Windata.OwnerFile.Lookup('ID', ThisHerdID, 'PLoc');
   if VarIsNull(vPLoc) then
      begin
         MessageDlg('Please enter the CPH Birth Location, CPH Postal Location and CPH Holding Location as your Holding Number',mtError,[mbOk],0);
         WinData.CreateAndShowForm(TfHerdSetUp);
         bbRemoveNatIdFormatting.Down := True;
         Preferences.ValueAsBoolean[cGSCTSBirthsRemoveNatIdNoFormatting] := True;
         Preferences.ValueAsBoolean[cGSCTSMovementsRemoveNatIdNoFormatting] := True;
         Preferences.ValueAsBoolean[cGSCTSReconcileUsingNatIdNoFormatting] := True;
      end
   else
      begin
         bbRemoveNatIdFormatting.Down := Preferences.ValueAsBoolean[cGSCTSBirthsRemoveNatIdNoFormatting];

         if not VarIsNull(vPLoc) then
            PLoc := vPLoc;

         vPSLoc := Windata.OwnerFile.Lookup('ID', ThisHerdID, 'PSLoc');
         if not VarIsNull(vPSLoc) then
            PSLoc := vPSLoc;

         vBLoc := Windata.OwnerFile.Lookup('ID', ThisHerdID, 'BLoc');
         if not VarIsNull(vBLoc) then
            BLoc := vBLoc;

         vBSLoc := Windata.OwnerFile.Lookup('ID', ThisHerdID, 'BSLoc');
         if not VarIsNull(vBSLoc) then
            BSLoc := vBSLoc;
      end;

   PageControl.ActivePage := nil;
   PageControl.ActivePage := tsToBeRegistered;

   FNullRecordsFound := False;
end;

procedure TfmCTSWSBirthReg.actExitExecute(Sender: TObject);
begin
   Close;
end;

procedure TfmCTSWSBirthReg.actLoginExecute(Sender: TObject);
begin
   TfmCTSLoginInfo.Execute;
end;

procedure TfmCTSWSBirthReg.FormDestroy(Sender: TObject);
begin
   Preferences.ValueAsBoolean[cGSCTSBirthsRemoveNatIdNoFormatting] := bbRemoveNatIdFormatting.Down;
   FreeAndNil(ImageStore);
end;

function TfmCTSWSBirthReg.Call_Register_Births_Request : Boolean;
var
  Register_Births_Request :TRegister_Births_Request;
  SetURLType : TSetURLType;
begin
   Result := False;
   SetCurrentDir(ApplicationPath);
   if FileExists( IncludeTrailingBackslash(ApplicationPath)+ CTSWSDLL) then
      begin
         DLLHandle := LoadLibrary(CTSWSDLL);
         if DLLHandle <> 0 then
            begin
               try
                 @SetURLType := GetProcAddress(DLLHandle, 'SetURLType');
                 if @SetURLType <> nil then
                    SetURLType(1);
                 @Register_Births_Request := GetProcAddress(DLLHandle, 'Register_Births_Request');
                 if @Register_Births_Request <> nil then
                    Result := Register_Births_Request(CTSBatchID)
                 else
                    MessageDlg('Call to function '+CTSWSDLL+'.Register_Births_Request in DLL failed!',mtError,[mbOk],0);
               finally
                  FreeLibrary(DLLHandle);
               end;
            end
         else
            MessageDlg('Unable to load DLL '+CTSWSDLL,mtError,[mbOk],0);
      end
   else
      MessageDlg('DLL '+CTSWSDLL+' not found - contact Kingswood Computing',mtError,[mbOk],0);
end;

procedure TfmCTSWSBirthReg.DisplayResults;
begin
   tmpCTSBirths.Refresh;
   lNoAccepted.Caption := Format('%d',[CountOfAnimals(True)]);
   lNoRejected.Caption := Format('%d',[CountOfAnimals(False)]);
   PageControl.ActivePage := tsRegistrationResults;
  // tsToBeRegistered.TabVisible := False;
end;

procedure TfmCTSWSBirthReg.PageControlPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
   Update;
   if NewPage = tsRegistrationResults then
      begin
         if not bSuccess then
            begin
               AllowChange := False;
               MessageDlg('No registration details have been sent yet.',mtInformation,[mbOK],0);
            end
         else
            begin
               CTSBirthsView := bvRegistrationResults;
               gbRegistrationResults.Parent := tsRegistrationResults;
               gbPreviousResultsNos.Visible := False;
               gbRegistrationResultsNos.Visible := True;
               RegBirthGrid.Parent := tsRegistrationResults;
               RegBirthGrid.Top := 80;
               RegBirthGrid.Height := 335;
               RegBirthGridDBTableView.Styles.OnGetContentStyle := RegBirthGridDBTableViewStylesGetContentStyle;
               RegBirthGridDBTableViewStatus.Visible := True;
               RegBirthGridDBTableViewSelected.Visible := False;
               RegBirthGridDBTableViewIgnoreWarnings.Visible := False;
            end;
      end
   else if NewPage = tsToBeRegistered then
      begin
         CTSBirthsView := bvToBeRegistered;
         LoadBirthsToBeRegistered;
         RegBirthGrid.Top := 22;
         RegBirthGrid.Height := 390;
         RegBirthGridDBTableView.Styles.OnGetContentStyle := nil;
         RegBirthGrid.Parent := tsToBeRegistered;
         RegBirthGridDBTableViewStatus.Visible := False;
         RegBirthGridDBTableViewSelected.Visible := True;
         RegBirthGridDBTableViewIgnoreWarnings.Visible := True;
      end
   else if NewPage = tsPreviousResults then
      begin
         CTSBirthsView := bvPreviousResults;
         gbRegistrationResults.Parent := tsPreviousResults;
         gbPreviousResultsNos.Visible := True;
         gbRegistrationResultsNos.Visible := False;
         RegBirthGridDBTableView.Styles.OnGetContentStyle := nil;
      end;
   if AllowChange then
      if PageControl.ActivePage = tsPreviousResults then
         begin
            if QueryCTSRequests.Active then QueryCTSRequests.Active := False;
         end;
end;

procedure TfmCTSWSBirthReg.actRegisterCTSExecute(Sender: TObject);
var
   i : Integer;
label
   GoToError;
begin
   SortByNullRecordsFound;
   
   //   25/09/18 [V5.8 R3.0] /MK Bug Fix - Only show errors about blank tags, sex or breed if in the registering tab not results tab - Heulwen (Dales).
   //   22/10/18 [V5.8 R4.0] /MK Bug Fix - Instead of GoToError change to raise Exception.Create as GoToError was appearing even if there were no animals in results page.
   if ( PageControl.ActivePageIndex = tsToBeRegistered.PageIndex ) and ( FNullRecordsFound ) then
      raise Exception.Create('Nat. ID. No/Breed/Sex missing for selected animals.'+#13+
                             'Please check that all animals have a Nat. ID. No./breed/sex before registering.');

   if not FileExists(pChar(IncludeTrailingBackslash(DataPath) +  'ctsws.config')) then
      begin
         MessageDlg('No CTS LogIn Information Found', mtError,[mbOK],0);
         actLogin.Execute;
         if not FileExists(pChar(IncludeTrailingBackslash(DataPath) +  'ctsws.config')) then
            Exit;
      end;

   if WinData.AdvisoryRoleActive then
      begin
         MessageDlg(cAdvisoryAccessMsg,mtWarning,[mbOK],0);
         Exit;
      end;

   if CountOfSelected <= 0 then
      begin
         MessageDlg('No births have been selected!',mtWarning,[mbOK],0);
         Exit;
      end;

   CTSBatchID := GetCTSBatchID(ThisHerdID);
   if CTSBatchID = 0 then
      begin
         raise Exception.Create('Invalid CTSBatchID found');
      end;

   // populate outgoing request with batchid .
   with tmpCTSBirths do
      begin
         DisableControls;
         try
            First;
            while not eof do
               begin
                  if FieldByName('Selected').AsBoolean then
                     begin
                        Edit;
                        FieldByName('CTSBatchID').AsInteger := CTSBatchID;
                        Post;
                     end;
                  Next;
               end;
         finally
            EnableControls;
         end;
      end;

   bSuccess := Call_Register_Births_Request;
   if bSuccess then
      UpdateHerdDatabase;
end;

procedure TfmCTSWSBirthReg.blbLoadTestDataClick(Sender: TObject);
begin
   with tmpCTSBirths do
      begin
         Close;
         EmptyTable;
         Open;

         Births.Open;
         Births.First;
         while not Births.eof do
            begin
               tmpCTSBirths.Append;
               tmpCTSBirthsCTSBatchID.asInteger := BirthsCTSBatchID.AsInteger;
               tmpCTSBirthsAnimalID.AsInteger := BirthsAnimalID.AsInteger;
               tmpCTSBirthsNatIDNum.AsString := BirthsOutputNatIDNum.AsString;
               tmpCTSBirthsOutputNatIDNum.AsString := BirthsOutputNatIDNum.AsString;
               tmpCTSBirthsDateOfBirth.AsDateTime := BirthsDateOfBirth.AsDateTime;
               tmpCTSBirthsBreed.AsString := BirthsBreed.AsString;
               tmpCTSBirthsSex.AsString := BirthsSex.AsString;
               tmpCTSBirthsEID.AsString := BirthsEID.AsString;
               tmpCTSBirthsDamNatIDNum.AsString := BirthsOutputDamNatIDNum.AsString;
               tmpCTSBirthsOutputDamNatIDNum.AsString := BirthsOutputDamNatIDNum.AsString;
               tmpCTSBirthsSurrogateNatIDNum.AsString := BirthsOutputSurrogateNatIDNum.AsString;
               tmpCTSBirthsOutputSurrogateNatIDNum.AsString := BirthsOutputSurrogateNatIDNum.AsString;
               tmpCTSBirthsSireNatIDNum.AsString:= BirthsOutputSireNatIDNum.AsString;
               tmpCTSBirthsOutputSireNatIDNum.AsString:= BirthsOutputSireNatIDNum.AsString;
               tmpCTSBirthsBLoc.AsString:= BirthsBLoc.AsString;
               tmpCTSBirthsBSLoc.AsString:= BirthsBSLoc.AsString;
               tmpCTSBirthsPLoc.AsString:= BirthsPLoc.AsString;
               tmpCTSBirthsPSLoc.AsString:= BirthsPSLoc.AsString;
               tmpCTSBirthsIgnoreWarnings.AsBoolean:= BirthsIgnoreWarnings.AsBoolean;
               tmpCTSBirthsSelected.AsBoolean := BirthsSelected.AsBoolean;
               tmpCTSBirthsRegistered.AsBoolean := False;
               tmpCTSBirths.Post;
               Births.Next;
            end;
            Births.Close;
      end;
end;

procedure TfmCTSWSBirthReg.RegBirthGridDBTableViewStatusPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
   if bSuccess then
      begin
         if tmpCTSBirths.FieldByName('Registered').AsBoolean then
            MessageDlg('This calf record was accepted.',mtInformation,[mbOK],0)
         else
            TfmCTSRegResults.DisplayRejectionResults(rtBirth, tmpCTSBirths.FieldByName('NatIDNum').AsString, tmpCTSBirths.FieldByName('AnimalID').AsInteger, CTSBatchID)
      end
   else
      begin
         MessageDlg('This calf record has not been registered with CTS Online.',mtWarning,[mbOK],0);
      end;

end;

procedure TfmCTSWSBirthReg.RegBirthGridDBTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
var
   vRegistered : Variant;
begin
   if ARecord <> nil then
      begin
         vRegistered := ARecord.Values[RegBirthGridDBTableViewRegistered.Index];
         if not VarIsNull(vRegistered) then
            begin
               if (vRegistered = True) then
                  AStyle := cxStyleRegistered
               else
                  AStyle := cxStyleNotRegistered;
            end
         else
            AStyle := cxStyleDefault;
      end;
end;

function TfmCTSWSBirthReg.CountOfAnimals(ARegistered: Boolean): Integer;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;

         SQL.Text := 'SELECT COUNT(ID) CID FROM tmpCTSBirths WHERE Registered=:Registered AND Selected=True';
         Params[0].AsBoolean := ARegistered;
         Open;
         try
            First;
            Result := FieldByName('CID').AsInteger;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfmCTSWSBirthReg.cmboViewPropertiesChange(Sender: TObject);
begin
   if (CTSBirthsView = bvRegistrationResults ) then
      begin
         RegBirthGridDBTableView.DataController.BeginFullUpdate;
         try
            case cmboView.ItemIndex of
               0 : begin
                      tmpCTSBirths.Filter := '((Selected = True) AND (Registered=False))';
                      tmpCTSBirths.Filtered := True;
                   end;
               1 : begin
                      tmpCTSBirths.Filter := '((Selected = True) AND (Registered=True))';
                      tmpCTSBirths.Filtered := True;
                   end;
            else if cmboView.ItemIndex >-1 then
               begin
                  tmpCTSBirths.Filter := '(Selected = True)';
                  tmpCTSBirths.Filtered := False;
               end;
         end;
         finally
            RegBirthGridDBTableView.DataController.EndFullUpdate;
         end;
      end
   else if (CTSBirthsView = bvPreviousResults ) then
      begin
         PreviousResultsGridTableView.DataController.BeginFullUpdate;
         try
            case cmboView.ItemIndex of
               0 : begin
                      ViewPreviousResults(rvRejected);
                      PreviousResultsGridTableViewRegistered.Visible := False;
                      lNoOfCalves.Style.TextColor := clRed;
                      lCalves.Caption := 'Calves Rejected:';
                   end;
               1 : begin
                      ViewPreviousResults(rvAccepted);
                      PreviousResultsGridTableViewRegistered.Visible := False;
                      lNoOfCalves.Style.TextColor := clGreen;
                      lCalves.Caption := 'Calves Accepted:';
                   end;
            else if cmboView.ItemIndex >-1 then
               begin
                  PreviousResultsGridTableViewRegistered.Visible := True;
                  ViewPreviousResults(rvAll);
                  lNoOfCalves.Style.TextColor := clWindowText;
                  lCalves.Caption := 'All Calves:';
               end;
            end;
         finally
            PreviousResultsGridTableView.DataController.EndFullUpdate;
         end;

      end;
end;

procedure TfmCTSWSBirthReg.UpdateHerdDatabase;
begin
   try
      with GenQuery do
         begin
            SQL.Clear;
            SQL.Add('Select EventID, CalvingFieldName From tmpCTSBirths');
            SQL.Add('Where (Selected=True)');
            SQL.Add('And (Registered=True)');
            Open;
            try
               First;
               while ( not(Eof) ) do
                  begin
                     RegisterCalfRecord(GenQuery.FieldByName('EventID').AsInteger, GenQuery.FieldByName('CalvingFieldName').AsString );
                     Next;
                  end;
            finally
               Close;
            end;
         end;
         DisplayResults;
   finally
   end;
end;

procedure TfmCTSWSBirthReg.actCheckCTSWSStatusExecute(Sender: TObject);
begin
   CheckCTSWSStatus;
end;

procedure TfmCTSWSBirthReg.actHelpExecute(Sender: TObject);
begin
   WinData.HTMLHelp('ctsbirthreg.htm');
end;

procedure TfmCTSWSBirthReg.FormKeyPress(Sender: TObject; var Key: Char);
begin
  // if key = 'a' then
    //  blbLoadTestData.Click;
end;

procedure TfmCTSWSBirthReg.tmpCTSBirthsAfterPost(DataSet: TDataSet);
begin
   UpdateStatusBar;
end;

function TfmCTSWSBirthReg.CountOfSelected: Integer;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;

         SQL.Text := 'SELECT COUNT(ID) CID FROM tmpCTSBirths WHERE Selected=True';
         Open;
         try
            First;
            Result := FieldByName('CID').AsInteger;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfmCTSWSBirthReg.actViewCTSExceptionsExecute(Sender: TObject);
begin
   TfmCTSExceptions.ViewCTSExceptions;
end;

procedure TfmCTSWSBirthReg.ViewPreviousResults(ARegisteredView : TRegisteredView);
begin
   Update;
   Screen.Cursor := crHourGlass;
   try
      QueryCTSRequests.SQL.Clear;
      QueryCTSRequests.SQL.Add('SELECT Ctsrequest.ID, Ctsrequest.Requestdate, Ctsrequest.CTSBatchID, Ctsrequest.Registered, Ctsrequest.AnimalID, Ctsrequest.Warnings, Ctsrequest.TxnId, Animals.NatIDNum, Animals.Sex, ');
      QueryCTSRequests.SQL.Add('Animals.DateOfBirth, ASDAM.SortNatID, ASDAM.NatIDNum DamNatIDNum, ASDAM.NatIDNum DamSortNatID, ASIRE.NatIDNum SireNatIDNum,');
      QueryCTSRequests.SQL.Add('ASIRE.SortNatID SireSortNatID, AGDAM.NatIDNum DonorDamNatID, AGDAM.SortNatID DonorDamSortNatID, Breeds.Code BreedCode');
      QueryCTSRequests.SQL.Add('FROM "CTSRequest.DB" Ctsrequest');
      QueryCTSRequests.SQL.Add('INNER JOIN "animals.DB" Animals ON  (Animals.ID = Ctsrequest.AnimalID)');
      QueryCTSRequests.SQL.Add('LEFT OUTER JOIN "animals.DB" ASDAM ON  (ASDAM.ID = Animals.DamID)');
      QueryCTSRequests.SQL.Add('LEFT OUTER JOIN "animals.DB" ASIRE ON  (ASIRE.ID = Animals.SireID)');
      QueryCTSRequests.SQL.Add('LEFT OUTER JOIN "animals.DB" AGDAM ON  (AGDAM.ID = Animals.DonorDamID)');
      QueryCTSRequests.SQL.Add('LEFT OUTER JOIN "Breeds.DB" Breeds ON  (Breeds.ID = Animals.PrimaryBreed)');
      if ( ARegisteredView = rvRejected ) then
         begin
            QueryCTSRequests.SQL.Add('WHERE   (Ctsrequest.Registered = False) AND  (Ctsrequest.RequestType = 1) ');// AND  Ctsrequest.AnimalID NOT IN');
         end
      else if ( ARegisteredView = rvAccepted ) then
         begin
            QueryCTSRequests.SQL.Add('WHERE (Ctsrequest.Registered = TRUE) AND  (Ctsrequest.RequestType = 1)');
         end
      else
         begin
            QueryCTSRequests.SQL.Add('WHERE (Ctsrequest.RequestType = 1)');
         end;
      QueryCTSRequests.Open;
      lNoOfCalves.Caption := Format('%d',[QueryCTSRequests.RecordCount]);
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TfmCTSWSBirthReg.RegisteredGridTableViewStatusPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
   if not QueryCTSRequests.FieldByName('Registered').AsBoolean then
      TfmCTSRegResults.DisplayRejectionResults(rtBirth, QueryCTSRequests.FieldByName('NatIDNum').AsString, QueryCTSRequests.FieldByName('AnimalID').AsInteger, QueryCTSRequests.FieldByName('CTSBatchID').AsInteger)
   else
      MessageDlg('This calf record has been accepted.',mtInformation,[mbOk],0);
end;

procedure TfmCTSWSBirthReg.RegisteredGridTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
var
   vRegistered : Variant;
begin
   if ARecord <> nil then
      begin
         vRegistered := ARecord.Values[PreviousResultsGridTableViewRegistered.Index];
         if not VarIsNull(vRegistered) then
            begin
               if (vRegistered = True) then
                  AStyle := cxStyleRegistered
               else
                  AStyle := cxStyleNotRegistered;
            end
         else
            AStyle := cxStyleDefault;
      end;
end;

procedure TfmCTSWSBirthReg.tsRegistrationResultsShow(Sender: TObject);
begin
   cmboView.ItemIndex := -1;
   cmboView.ItemIndex := 0;   // Triggers action to load results into grid
end;

procedure TfmCTSWSBirthReg.tsPreviousResultsShow(Sender: TObject);
begin
   cmboView.ItemIndex := -1;
   cmboView.ItemIndex := 1;   // Triggers action to load previous results into grid
end;

procedure TfmCTSWSBirthReg.RegBirthGridDBTableViewSireSortNatIDNumGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if ARecord <> nil then
      AText := ARecord.DisplayTexts[RegBirthGridDBTableViewSireNatIDNum.Index]
   else
      AText := '';
end;

procedure TfmCTSWSBirthReg.RegBirthGridDBTableViewSurrogateSortNatIDNumGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if ARecord <> nil then
      AText := ARecord.DisplayTexts[RegBirthGridDBTableViewSurrogateNatIDNum.Index]
   else
      AText := '';

end;

procedure TfmCTSWSBirthReg.RegBirthGridDBTableViewDamSortNatIDNumGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if ARecord <> nil then
      AText := ARecord.DisplayTexts[RegBirthGridDBTableViewDamNatIDNum.Index]
   else
      AText := '';
end;

procedure TfmCTSWSBirthReg.RegBirthGridDBTableViewSortNatIDNumGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if ARecord <> nil then
      AText := ARecord.DisplayTexts[RegBirthGridDBTableViewNatIDNum.Index]
   else
      AText := '';
end;

procedure TfmCTSWSBirthReg.RegBirthGridDBTableViewCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  AColumn : TcxGridDBColumn;
begin
   if PageControl.ActivePage <> tsToBeRegistered then Exit;

   AColumn := (Sender as TcxGridDBTableView).Controller.FocusedColumn as TcxGridDBColumn;
   if AColumn.DataBinding.FieldName = 'SireSortNatIDNum' then
      begin
         actChangeSireNatIDNum.Execute;
      end
   else if AColumn.DataBinding.FieldName = 'DamSortNatIDNum' then
      begin
         actChangeDamNatIDNum.Execute;
      end
   else if AColumn.DataBinding.FieldName = 'SurrogateSortNatIDNum' then
      begin
         actChangeSurrogateDamNatIDNum.Execute;
      end;
end;

procedure TfmCTSWSBirthReg.actChangeSireNatIDNumExecute(Sender: TObject);
begin
   UpdateAnimals_NatIDNum('SireNatIDNum','SireID');
end;

procedure TfmCTSWSBirthReg.actChangeDamNatIDNumExecute(Sender: TObject);
begin
   UpdateAnimals_NatIDNum('DamNatIDNum','DamID');
end;

procedure TfmCTSWSBirthReg.UpdateAnimals_NatIDNum(ANatIDFieldName, AIDFieldName: string);
var
   NatIDNum : string;
   ID : Integer;
begin
   NatIDNum := tmpCTSBirths.FieldByName(ANatIDFieldName).AsString;
   if ( Trim(NatIDNum) <> '' ) and ( InputQuery('Change Nat. Id. No.', 'New Nat. Id. No.', NatIDNum) ) then
      begin
         if MessageDlg(Format(cNatIdChangeConfirmMsg,[NatIDNum]),mtConfirmation,[mbyes,mbNo],0) = idYes then
            begin
               // Now update Animals Table.
               with TQuery.Create(nil) do
                  try
                     DatabaseName := AliasName;

                     SQL.Text := 'UPDATE '+tmpCTSBirths.TableName+' SET Output'+ANatIDFieldName+' = :NatIDNum WHERE '+ANatIDFieldName+' =:NatIDNum2';
                     Params[0].AsString := NatIDNum;
                     Params[1].AsString := tmpCTSBirths.FieldByName(ANatIDFieldName).AsString;
                     ExecSQL;

                     SQL.Text := 'UPDATE '+tmpCTSBirths.TableName+' SET '+ANatIDFieldName+' = :NatIDNum WHERE '+ANatIDFieldName+' =:NatIDNum2';
                     Params[0].AsString := NatIDNum;
                     Params[1].AsString := tmpCTSBirths.FieldByName(ANatIDFieldName).AsString;
                     ExecSQL;

                     tmpCTSBirths.DisableControls;
                     try
                        ID := tmpCTSBirthsID.AsInteger;
                        tmpCTSBirths.Refresh;
                     finally
                        tmpCTSBirths.Locate('ID', ID,[]);
                        tmpCTSBirths.EnableControls;
                     end;

                  finally
                     Free;
                  end;

              // tmpCTSBirths.Edit;
              // tmpCTSBirths.FieldByName(ANatIDFieldName).AsString := NatIDNum;
              // tmpCTSBirths.FieldByName('Output'+ANatIDFieldName).AsString := NatIDNum;
              // tmpCTSBirths.Post;

               // Now update Animals Table.
               with TQuery.Create(nil) do
                  try
                     DatabaseName := AliasName;
                     SQL.Text := 'UPDATE Animals SET NatIDNum = :NatIDNum WHERE ID =:ID';
                     Params[0].AsString := NatIDNum;
                     Params[1].AsInteger := tmpCTSBirths.FieldByName(AIDFieldName).AsInteger;
                     ExecSQL;
                     if not Menuform.ReloadSetupQuery then
                        Menuform.ReloadSetupQuery := True;
                  finally
                     Free;
                  end;
            end;
      end;
end;

procedure TfmCTSWSBirthReg.actChangeSurrogateDamNatIDNumExecute(
  Sender: TObject);
begin
   UpdateAnimals_NatIDNum('SurrogateNatIDNum','SurrogateDamID');
end;

procedure TfmCTSWSBirthReg.GridPopupMenuPopup(Sender: TObject);
var
  AColumn : TcxGridDBColumn;
begin

   if PageControl.ActivePage <> tsToBeRegistered then SysUtils.Abort;

   AColumn := RegBirthGridDBTableView.Controller.FocusedColumn as TcxGridDBColumn;
   if (AColumn.DataBinding.FieldName = 'SireSortNatIDNum') then
      begin
         bbChangeSireNatID.Visible := ivAlways;
         bbChangeDamNatID.Visible := ivNever;
         bbChangeSurrDamNatID.Visible := ivNever;
         bbRemoveSurrogateNatIdNum.Visible := ivNever;
         bbRemoveSireNatIdNum.Visible := ivAlways;
      end
   else if AColumn.DataBinding.FieldName = 'DamSortNatIDNum' then
      begin
         bbChangeSireNatID.Visible := ivNever;
         bbChangeDamNatID.Visible := ivAlways;
         bbChangeSurrDamNatID.Visible := ivNever;
         bbRemoveSurrogateNatIdNum.Visible := ivNever;
         bbRemoveSireNatIdNum.Visible := ivNever;
      end
   else if AColumn.DataBinding.FieldName = 'SurrogateSortNatIDNum' then
      begin
         bbChangeSireNatID.Visible := ivNever;
         bbChangeDamNatID.Visible := ivNever;
         bbChangeSurrDamNatID.Visible := ivAlways;
         bbRemoveSurrogateNatIdNum.Visible := ivAlways;
         bbRemoveSireNatIdNum.Visible := ivNever;
      end
   else
      begin
         bbChangeSireNatID.Visible := ivNever;
         bbChangeDamNatID.Visible := ivNever;
         bbChangeSurrDamNatID.Visible := ivNever;
         bbRemoveSurrogateNatIdNum.Visible := ivNever;
         bbRemoveSireNatIdNum.Visible := ivNever;
      end;
//      SysUtils.Abort; // do not popup
end;

procedure TfmCTSWSBirthReg.QueryCTSRequestsCalcFields(DataSet: TDataSet);
begin
   if QueryCTSRequests.Active then
      begin
         if QueryCTSRequests.FieldByName('DonorDamNatID').AsString <> '' then
            begin
               QueryCTSRequestsGenDamNatID.AsString := QueryCTSRequests.FieldByName('DonorDamNatID').AsString;
               QueryCTSRequestsDamNatID.AsString := QueryCTSRequests.FieldByName('DamNatIDNum').AsString;
            end
         else
            QueryCTSRequestsGenDamNatID.AsString := QueryCTSRequests.FieldByName('DamNatIDNum').AsString;
      end;
end;

procedure TfmCTSWSBirthReg.Remove_NatIDNum(ANatIDFieldName: string);
begin
   if tmpCTSBirths.FieldByName(ANatIDFieldName).AsString <> '' then
      begin
         if MessageDlg(cNatIdRemoveConfirmMsg,mtConfirmation,[mbyes,mbNo],0) = idYes then
            begin
               tmpCTSBirths.Edit;
               tmpCTSBirths.FieldByName(ANatIDFieldName).AsString := '';
               tmpCTSBirths.FieldByName('Output'+ANatIDFieldName).AsString := '';
               tmpCTSBirths.Post;
            end;
      end
   else
      MessageDlg('There is no Nat. Id. No. to remove.',mtInformation,[mbOK],0);
end;

procedure TfmCTSWSBirthReg.actRemoveSireNatIdNumExecute(Sender: TObject);
begin
   Remove_NatIDNum('SireNatIDNum');
end;

procedure TfmCTSWSBirthReg.actRemoveSurrogateNatIdNumExecute(
  Sender: TObject);
begin
   Remove_NatIDNum('SurrogateNatIDNum');
end;

procedure TfmCTSWSBirthReg.actRemovePermanentlyExecute(Sender: TObject);
begin
   if MessageDlg('Are you sure you want to permanently remove this calf record?',mtConfirmation,[mbYes,mbNo],0) = idYes then
      begin
         if RegisterCalfRecord(tmpCTSBirths.FieldByName('EventID').AsInteger, tmpCTSBirths.FieldByName('CalvingFieldName').AsString ) then
            begin
               tmpCTSBirths.Delete;
               MessageDlg('Calf record permanently removed.',mtInformation,[mbOK],0);
            end
         else
            begin
               MessageDlg('Failed to remove calf record.',mtError,[mbOK],0);
            end;
      end;
   UpdateStatusBar;
end;

function TfmCTSWSBirthReg.RegisterCalfRecord(AEventID: Integer;
  ACalfField: string): Boolean;
begin
   Result := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add(Format('UPDATE Calvings SET %s = TRUE Where EventID=:EventID',[ACalfField]));
         Params[0].AsInteger := AEventID;
         ExecSQL;
         Result := True;
      finally
         Free;
      end;
end;

procedure TfmCTSWSBirthReg.bbRemoveNatIdFormattingClick(Sender: TObject);
begin
   LoadBirthsToBeRegistered;
end;

procedure TfmCTSWSBirthReg.actRemoveAllPermanentlyExecute(Sender: TObject);
begin
   if MessageDlg('Are you sure you want to permanently remove ALL calf registration records?',mtConfirmation,[mbYes,mbNo],0) = idYes then
      begin
         Update;
         Screen.Cursor := crHourGlass;
         tmpCTSBirths.DisableControls;
         try
            tmpCTSBirths.First;
            while tmpCTSBirths.recordCount > 0 do
               begin
                 if RegisterCalfRecord(tmpCTSBirths.FieldByName('EventID').AsInteger, tmpCTSBirths.FieldByName('CalvingFieldName').AsString ) then
                    begin
                        tmpCTSBirths.Delete;
                       //MessageDlg('Movement record permanently removed.',mtInformation,[mbOK],0);
                    end
                 else
                    begin
                       MessageDlg('Failed to remove calf record.',mtError,[mbOK],0);
                    end;
               end;
         finally
            tmpCTSBirths.EnableControls;
            UpdateStatusBar;
            Screen.Cursor := crDefault;
         end;
      end;
end;

procedure TfmCTSWSBirthReg.actRemoveAllBullCalvesExecute(Sender: TObject);
begin
   if MessageDlg('Are you sure you want to remove ALL Bull calves from registration permanently?',mtConfirmation,[mbYes,mbNo],0) = idYes then
      begin
         Update;
         Screen.Cursor := crHourGlass;
         tmpCTSBirths.DisableControls;
         try
            tmpCTSBirths.First;
            while not tmpCTSBirths.Eof do
               begin
                  if tmpCTSBirths.FieldByName('DBSex').AsString <> cSex_Bull then
                     begin
                        tmpCTSBirths.Next;
                        Continue;
                     end;

                  if RegisterCalfRecord(tmpCTSBirths.FieldByName('EventID').AsInteger, tmpCTSBirths.FieldByName('CalvingFieldName').AsString ) then
                     begin
                         tmpCTSBirths.Delete;
                        //MessageDlg('Movement record permanently removed.',mtInformation,[mbOK],0);
                     end
                  else
                     begin
                        MessageDlg('Failed to remove calf record.',mtError,[mbOK],0);
                     end;
                  tmpCTSBirths.Next;
               end;
         finally
            tmpCTSBirths.EnableControls;
            UpdateStatusBar;
            Screen.Cursor := crDefault;
         end;
      end;
end;

procedure TfmCTSWSBirthReg.UpdateStatusBar;
begin
   StatusBar.Panels[0].Text := Format('No. of selected birth records: %d',[CountOfSelected]);
end;

procedure TfmCTSWSBirthReg.actPrintGridExecute(Sender: TObject);
begin
   if Length(ComponentPrinter.PrintTitle) = 0 then
      ComponentPrinter.PrintTitle := 'Kingswood Grid Print';
   if PageControl.ActivePageIndex = 0 then
      ToBeRegBirthComponentPrinterLink.Preview
   else if PageControl.ActivePageIndex = 2 then
      CalvesRegisteredComponentPrinterLink.Preview;
end;

procedure TfmCTSWSBirthReg.bbCalvesRegisteredClick(Sender: TObject);
begin
   WinData.CreateAndShowForm(TfmCalfRegReview);
end;

procedure TfmCTSWSBirthReg.SortByNullRecordsFound;

   function NullRecordsFounds (ACheckType : TCheckType ): Boolean;
   begin
      Result := False;
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT Count(ID)');
            SQL.Add('FROM '+tmpCTSBirths.TableName);
            SQL.Add('WHERE Selected = True');
            case ACheckType of
                ctNatID : SQL.Add('AND ( NatIDNum IS Null )');
                ctSex : SQL.Add('AND ( Sex IS Null )');
                ctBreed : SQL.Add('AND ( Breed IS Null )');
            end;
            Open;
            try
               First;
               Result := ( Fields[0].AsInteger > 0 );
            finally
               Close;
            end;
         finally
            Free;
         end;
   end;

var
   i : Integer;
begin
   FNullRecordsFound := False;
   for i := 1 to 3 do
      case i of
         1 : begin
                FNullRecordsFound := NullRecordsFounds(ctNatID);
                if FNullRecordsFound then
                   RegBirthGridDBTableViewNatIDNum.SortOrder := soAscending;
             end;
         2 : begin
                if ( FNullRecordsFound ) then Continue;
                FNullRecordsFound := NullRecordsFounds(ctSex);
                if FNullRecordsFound then
                   RegBirthGridDBTableViewSex.SortOrder := soAscending;
             end;
         3 : begin
                if ( FNullRecordsFound ) then Continue;
                FNullRecordsFound := NullRecordsFounds(ctBreed);
                if FNullRecordsFound then
                   RegBirthGridDBTableViewBreed.SortOrder := soAscending;
             end;
      end;
end;

end.
