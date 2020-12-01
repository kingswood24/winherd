{
   15/01/2009 [V3.9 R5.8] /SP Bug Fix - Exclude dead animals from movement dataset

   17/02/11 [V4.0 R8.2] /MK Change - If Location Fields In Owner's Table Are Null Then NatIDFormatting Preference Is True and
                                     ShowMessage That Locations Do Not Exist and Herd Setup screen then shows.

   12/03/11 [V4.0 R8.7] /MK Additional Feature - Added Print Button For Movements To Be Registered And Movements Registered.

   12/04/11 [V4.0 R9.5] /MK Additional Feature - Check To See if CTSLogInDetails Exits Before Sending Request.

   19/04/11 [V4.0 R9.8] /MK Bug - Fixed Check As It Wasn't Checking the Data Directory Properly.

   14/09/18 [V5.8 R2.8] /MK Change - When the user clicks bbRemoveNatIdFormatting then apply the change without exiting from the screen.   
}

unit uCTSMovementReg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGrid, cxPC, ActnList,
  dxBar, dxBarExtItems, Db, DBTables, dxStatusBar, cxStyles, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLabel, cxContainer, cxEdit, cxGroupBox,
  cxGridDBTableView, cxHyperLinkEdit, uCTSHelper, dxPSCore, dxPScxCommon,
  dxPScxGridLnk;

type
  TfmCTSWSMovementReg = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    ActionList1: TActionList;
    actExit: TAction;
    actLogin: TAction;
    PageControl: TcxPageControl;
    tsToBeRegistered: TcxTabSheet;
    RegMovementsGrid: TcxGrid;
    RegMovementsGridLevel: TcxGridLevel;
    tsRegistrationResults: TcxTabSheet;
    tsPreviousResults: TcxTabSheet;
    tmpCTSMovements: TTable;
    GenQuery: TQuery;
    dstmpCTSMovements: TDataSource;
    tmpCTSMovementsID: TAutoIncField;
    tmpCTSMovementsEventID: TIntegerField;
    tmpCTSMovementsAnimalID: TIntegerField;
    tmpCTSMovementsMovedFromTo: TStringField;
    tmpCTSMovementsNatIDNum: TStringField;
    tmpCTSMovementsOutputNatIDNum: TStringField;
    tmpCTSMovementsSortNatIDNum: TStringField;
    tmpCTSMovementsEID: TStringField;
    tmpCTSMovementsLoc: TStringField;
    tmpCTSMovementsSLoc: TStringField;
    tmpCTSMovementsMType: TStringField;
    tmpCTSMovementsMDate: TDateTimeField;
    tmpCTSMovementsRefNum: TStringField;
    tmpCTSMovementsIgnoreWarnings: TBooleanField;
    tmpCTSMovementsSelected: TBooleanField;
    StatusBar: TdxStatusBar;
    cxStyleRepository1: TcxStyleRepository;
    cxStyleRegistered: TcxStyle;
    cxStyleNotRegistered: TcxStyle;
    cxStyleDefault: TcxStyle;
    tmpCTSMovementsCTSBatchID: TIntegerField;
    tmpCTSMovementsRegistered: TBooleanField;
    blbRegisterCTS: TdxBarLargeButton;
    actRegisterCTS: TAction;
    gbRegistrationResults: TcxGroupBox;
    cxLabel5: TcxLabel;
    cxLabel2: TcxLabel;
    cmboView: TcxComboBox;
    RegMovementsGridDBTableView: TcxGridDBTableView;
    RegMovementsGridDBTableViewID: TcxGridDBColumn;
    RegMovementsGridDBTableViewEventID: TcxGridDBColumn;
    RegMovementsGridDBTableViewAnimalID: TcxGridDBColumn;
    RegMovementsGridDBTableViewMovedFromTo: TcxGridDBColumn;
    RegMovementsGridDBTableViewNatIDNum: TcxGridDBColumn;
    RegMovementsGridDBTableViewOutputNatIDNum: TcxGridDBColumn;
    RegMovementsGridDBTableViewSortNatIDNum: TcxGridDBColumn;
    RegMovementsGridDBTableViewEID: TcxGridDBColumn;
    RegMovementsGridDBTableViewLoc: TcxGridDBColumn;
    RegMovementsGridDBTableViewSLoc: TcxGridDBColumn;
    RegMovementsGridDBTableViewMType: TcxGridDBColumn;
    RegMovementsGridDBTableViewMDate: TcxGridDBColumn;
    RegMovementsGridDBTableViewRefNum: TcxGridDBColumn;
    RegMovementsGridDBTableViewIgnoreWarnings: TcxGridDBColumn;
    RegMovementsGridDBTableViewSelected: TcxGridDBColumn;
    RegMovementsGridDBTableViewCTSBatchID: TcxGridDBColumn;
    RegMovementsGridDBTableViewRegistered: TcxGridDBColumn;
    RegMovementsGridDBTableViewStatus: TcxGridDBColumn;
    blbTestData: TdxBarLargeButton;
    Movements: TTable;
    MovementsID: TAutoIncField;
    MovementsCTSBatchID: TIntegerField;
    MovementsEventID: TIntegerField;
    MovementsAnimalID: TIntegerField;
    MovementsMovedFromTo: TStringField;
    MovementsNatIDNum: TStringField;
    MovementsOutputNatIDNum: TStringField;
    MovementsSortNatIDNum: TStringField;
    MovementsEID: TStringField;
    MovementsLoc: TStringField;
    MovementsSLoc: TStringField;
    MovementsMType: TStringField;
    MovementsMDate: TDateTimeField;
    MovementsRefNum: TStringField;
    MovementsIgnoreWarnings: TBooleanField;
    MovementsSelected: TBooleanField;
    MovementsRegistered: TBooleanField;
    blbHelp: TdxBarLargeButton;
    actHelp: TAction;
    dxBarStatic1: TdxBarStatic;
    dxBarLargeButton3: TdxBarLargeButton;
    cxLabel4: TcxLabel;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    actCheckCTSWSStatus: TAction;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton3: TdxBarButton;
    actViewCTSExceptions: TAction;
    PreviousResultsGrid: TcxGrid;
    PreviousResultsGridTableView: TcxGridDBTableView;
    PreviousResultsGridTableViewID: TcxGridDBColumn;
    PreviousResultsGridTableViewStatus: TcxGridDBColumn;
    PreviousResultsGridTableViewAnimalID: TcxGridDBColumn;
    PreviousResultsGridTableViewNatIDNum: TcxGridDBColumn;
    PreviousResultsGridTableViewMType: TcxGridDBColumn;
    PreviousResultsGridTableViewOutputNatIDNum: TcxGridDBColumn;
    PreviousResultsGridTableViewSortNatIDNum: TcxGridDBColumn;
    PreviousResultsGridTableViewRegistered: TcxGridDBColumn;
    PreviousResultsGridLevel: TcxGridLevel;
    PreviousResultsGridTableViewRegisteredDate: TcxGridDBColumn;
    PreviousResultsGridTableViewSex: TcxGridDBColumn;
    PreviousResultsGridTableViewDateOfBirth: TcxGridDBColumn;
    PreviousResultsGridTableViewBreedCode: TcxGridDBColumn;
    QueryCTSRequests: TQuery;
    dsQueryCTSRequests: TDataSource;
    gbRegistrationResultsNos: TcxGroupBox;
    lMovementsRejected: TcxLabel;
    lMovementsAccepted: TcxLabel;
    lNoMovementsAccepted: TcxLabel;
    lNoMovementsRejected: TcxLabel;
    gbPreviousResultsNos: TcxGroupBox;
    lMovements: TcxLabel;
    lNoOfMovements: TcxLabel;
    actChangeNatIDNum: TAction;
    GridPopupMenu: TdxBarPopupMenu;
    dxBarButton4: TdxBarButton;
    actRemovePermanently: TAction;
    dxBarButton5: TdxBarButton;
    bbRemoveNatIdFormatting: TdxBarButton;
    actRemoveAllPermanently: TAction;
    dxBarButton6: TdxBarButton;
    dxComponentPrinter: TdxComponentPrinter;
    RegMovmentsComponentPrinterLink: TdxGridReportLink;
    PreRegMovementsComponentPrinterLink: TdxGridReportLink;
    blbPrint: TdxBarLargeButton;
    actPrint: TAction;
    procedure FormCreate(Sender: TObject);
    procedure actLoginExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure PageControlPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure actRegisterCTSExecute(Sender: TObject);
    procedure RegMovementsGridDBTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cmboViewPropertiesChange(Sender: TObject);
    procedure blbTestDataClick(Sender: TObject);
    procedure hleCTSStatusClick(Sender: TObject);
    procedure actCheckCTSWSStatusExecute(Sender: TObject);
    procedure actHelpExecute(Sender: TObject);
    procedure RegMovementsGridDBTableViewStatusPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure tmpCTSMovementsAfterPost(DataSet: TDataSet);
    procedure actViewCTSExceptionsExecute(Sender: TObject);
    procedure tsPreviousResultsShow(Sender: TObject);
    procedure tsRegistrationResultsShow(Sender: TObject);
    procedure PreviousResultsGridTableViewStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure PreviousResultsGridTableViewStatusPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure RegMovementsGridDBTableViewSortNatIDNumGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure actChangeNatIDNumExecute(Sender: TObject);
    procedure GridPopupMenuPopup(Sender: TObject);
    procedure RegMovementsGridDBTableViewCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure actRemovePermanentlyExecute(Sender: TObject);
    procedure bbRemoveNatIdFormattingClick(Sender: TObject);
    procedure actRemoveAllPermanentlyExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
  private
    { Private declarations }
    bSuccess : Boolean;
    ThisHerdID : Integer;
    CTSBatchID : Integer;
    CTSMovementsView : TCTSView;
    procedure LoadMovementsToBeRegistered();
    function Call_Register_Movements_Request : Boolean;
    procedure DisplayResults;
    function CountOfMovements(ARegistered : Boolean) : Integer;
    function CountOfSelected : Integer;
    procedure UpdateHerdDatabase;
    procedure ViewPreviousResults(ARegisteredView : TRegisteredView) ;
    procedure UpdateAnimals_NatIDNum(ANatIDFieldName, AIDFieldName: string);
    function RegisterMovementRecord(AEventID : Integer; AMType : string) : Boolean;
  public
    { Public declarations }
    class procedure Execute;
  end;

var
  fmCTSWSMovementReg: TfmCTSWSMovementReg;

implementation

uses uCTSLoginInfo, DairyData, uImageStore, GenTypesConst, KRoutines,
     uCTSRegResults, uCTSExceptions, MenuUnit, uHerdLookup, uPreferences,
  uHerdSetUp;

{$R *.DFM}

{ TfmCTSWSMovementReg }

class procedure TfmCTSWSMovementReg.Execute;
begin
    with TfmCTSWSMovementReg.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmCTSWSMovementReg.LoadMovementsToBeRegistered;
var
   Loc, SLoc, MHSID : string;

   procedure LoadSales;
   begin
      Update;
      with GenQuery do
         begin
            SQL.Clear;
            SQL.Add('SELECT DISTINCT (A.ID), A.NatIDNum, A.SortNatID, E.ID EventID, E.EventDate, C.Name CustomerName, C.LocationID, C.SubLocationID, C.MHSId, S.Sold');
            SQL.Add('FROM Animals A');
            SQL.Add('LEFT JOIN Events E ON (E.AnimalID = A.ID)');
            SQL.Add('LEFT JOIN SalesDeaths S ON (S.EventID = E.ID)');
            SQL.Add('LEFT JOIN Customers C ON (C.ID = S.Customer)');
            SQL.Add('WHERE (E.EventType = :AEventType )');
            SQL.Add('AND (A.HerdID = :AHerdID )');
            SQL.Add('AND (E.HerdID = A.HerdID )');
            SQL.Add('AND (A.InHerd=FALSE)');
            SQL.Add('AND (S.CTSReg=FALSE)');

            // SQL.Add('AND (S.Sold=TRUE)'); // 15/01/2009 [V3.9 R5.8] /SP Bug Fix - Exclude dead animals from movement dataset

            // 28/03/11 - Introduction of death registrations

            SQL.Add('ORDER BY A.ID');
            Params[0].AsInteger := CSaleDeathEvent;
            Params[1].AsInteger := ThisHerdID;
            Prepare;
            Open;

            tmpCTSMovements.DisableControls;
            try
               First;
               while not eof do
                  begin
                     tmpCTSMovements.Append;
                     try
                        tmpCTSMovements.FieldByName('Selected').AsBoolean := True;
                        tmpCTSMovements.FieldByName('Registered').AsBoolean := False;
                        tmpCTSMovements.FieldByName('AnimalID').AsInteger := FieldByName('ID').AsInteger;
                        tmpCTSMovements.FieldByName('EventID').AsInteger := FieldByName('EventID').AsInteger;
                        tmpCTSMovements.FieldByName('NatIDNum').AsString := FieldByName('NatIDNum').AsString;
                        tmpCTSMovements.FieldByName('SortNatIDNum').AsString := FieldByName('SortNatID').AsString;
                        if bbRemoveNatIdFormatting.Down then
                           tmpCTSMovements.FieldByName('OutputNatIDNum').AsString := WinData.StripAllSpaces(FieldByName('NatIDNum').AsString)
                        else
                           tmpCTSMovements.FieldByName('OutputNatIDNum').AsString := FieldByName('NatIDNum').AsString;
                        tmpCTSMovements.FieldByName('MovedFromTo').AsString := FieldByName('CustomerName').AsString;
                        if Loc <> '' then
                           tmpCTSMovements.FieldByName('Loc').AsString := Loc
                        else if MHSID <> '' then
                           tmpCTSMovements.FieldByName('Loc').AsString := MHSID;
                        tmpCTSMovements.FieldByName('SLoc').AsString := SLoc;

                        if GenQuery.FieldByName('Sold').AsBoolean then
                           tmpCTSMovements.FieldByName('MType').AsString := 'off'
                        else
                           // 28/03/11 - Introduction of death registrations.
                           tmpCTSMovements.FieldByName('MType').AsString := 'death';

                        tmpCTSMovements.FieldByName('MDate').AsDateTime := FieldByName('EventDate').AsDateTime;
                        tmpCTSMovements.FieldByName('RefNum').AsString := '';
                        tmpCTSMovements.Post;
                     except
                        on E : EDatabaseError do
                           begin
                              tmpCTSMovements.Cancel;
                              MessageDlg(Format('Failed to create animal movement record. ID: %s',[ FieldByName('NatIDNum').AsString]),mtError,[mbOK],0);
                           end;
                     end;
                     Next; // GenQuery
                  end;
            finally
               Close;  // GenQuery
               tmpCTSMovements.Refresh;
               tmpCTSMovements.First;
               tmpCTSMovements.EnableControls;
            end;
         end;
   end;

   procedure LoadPurchases;
   begin
      Update;
      with GenQuery do
         begin
            SQL.Clear;
            SQL.Add('SELECT DISTINCT (A.ID), A.NatIDNum, A.SortNatID, E.ID EventID, E.EventDate, S.Name SupplierName, S.LocationID, S.SubLocationID, S.MHSId, P.LotNumber');
            SQL.Add('FROM Animals A');
            SQL.Add('LEFT JOIN Events E ON (E.AnimalID = A.ID)');
            SQL.Add('LEFT JOIN Purchases P ON (P.EventID = E.ID)');
            SQL.Add('LEFT JOIN SuppliersBreeders S ON (S.ID = P.Supplier)');
            SQL.Add('WHERE (E.EventType = :AEventType )');
            SQL.Add('AND (A.HerdID = :AHerdID )');
            SQL.Add('AND (E.HerdID = A.HerdID )');
            SQL.Add('AND (P.CTSReg<>TRUE)');
            SQL.Add('ORDER BY A.ID');
            Params[0].AsInteger := CPurchaseEvent;
            Params[1].AsInteger := ThisHerdID;
            Prepare;
            Open;

            tmpCTSMovements.DisableControls;
            try
               First;
               while not eof do
                  begin
                     tmpCTSMovements.Append;
                     try
                        tmpCTSMovements.FieldByName('Selected').AsBoolean := True;
                        tmpCTSMovements.FieldByName('Registered').AsBoolean := False;
                        tmpCTSMovements.FieldByName('AnimalID').AsInteger := FieldByName('ID').AsInteger;
                        tmpCTSMovements.FieldByName('EventID').AsInteger := FieldByName('EventID').AsInteger;
                        tmpCTSMovements.FieldByName('NatIDNum').AsString := FieldByName('NatIDNum').AsString;
                        tmpCTSMovements.FieldByName('SortNatIDNum').AsString := FieldByName('SortNatID').AsString;
                        if bbRemoveNatIdFormatting.Down then
                           tmpCTSMovements.FieldByName('OutputNatIDNum').AsString := WinData.StripAllSpaces(FieldByName('NatIDNum').AsString)
                        else
                           tmpCTSMovements.FieldByName('OutputNatIDNum').AsString := FieldByName('NatIDNum').AsString;
                        tmpCTSMovements.FieldByName('MovedFromTo').AsString := FieldByName('SupplierName').AsString;

{                        if FieldByName('LocationID').AsString <> '' then
                           tmpCTSMovements.FieldByName('Loc').AsString := FieldByName('LocationID').AsString
                        else if FieldByName('MHSId').AsString <> '' then
                           tmpCTSMovements.FieldByName('Loc').AsString := FieldByName('MHSId').AsString;
                        tmpCTSMovements.FieldByName('SLoc').AsString := FieldByName('SubLocationID').AsString;
}
                        if Loc <> '' then
                           tmpCTSMovements.FieldByName('Loc').AsString := Loc
                        else if MHSID <> '' then
                           tmpCTSMovements.FieldByName('Loc').AsString := MHSID;
                        tmpCTSMovements.FieldByName('SLoc').AsString := SLoc;

                        tmpCTSMovements.FieldByName('MType').AsString := 'on';
                        tmpCTSMovements.FieldByName('MDate').AsDateTime := FieldByName('EventDate').AsDateTime;
                        tmpCTSMovements.FieldByName('RefNum').AsString := FieldByName('LotNumber').AsString;
                        tmpCTSMovements.Post;
                     except
                        on E : EDatabaseError do
                           begin
                              tmpCTSMovements.Cancel;
                              MessageDlg(Format('Failed to create animal movement record. ID: %s',[ FieldByName('NatIDNum').AsString]),mtError,[mbOK],0);
                           end;
                     end;
                     Next; // GenQuery
                  end;
            finally
               Close;  // GenQuery
               tmpCTSMovements.Refresh;
               tmpCTSMovements.First;
               tmpCTSMovements.EnableControls;
            end;
         end;
   end;

begin
   HerdLookup.HerdOwnerData.HerdID := ThisHerdID;
   Loc := HerdLookup.HerdOwnerData.HoldingLoc;
   SLoc := HerdLookup.HerdOwnerData.HoldingSLoc;
   MHSID := HerdLookup.HerdOwnerData.MHSId;

   RegMovementsGridDBTableView.DataController.BeginFullUpdate;
   Screen.Cursor := crHourGlass;
   try
      with tmpCTSMovements do
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
                  Add('MovedFromTo', ftString, 30);
                  Add('NatIDNum', ftString, 20);
                  Add('OutputNatIDNum', ftString, 14);
                  Add('SortNatIDNum', ftString, 20);
                  Add('EID', ftString, 20);
                  Add('Loc', ftString, 20);
                  Add('SLoc', ftString, 20);
                  Add('MType', ftString, 6);
                  Add('MDate', ftDateTime);
                  Add('RefNum', ftString, 2);
                  Add('IgnoreWarnings', ftBoolean);
                  Add('Selected', ftBoolean);
                  Add('Registered', ftBoolean);
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
            LoadSales;
            LoadPurchases;
         end;
   finally
      RegMovementsGridDBTableView.DataController.RefreshExternalData;
      RegMovementsGridDBTableView.DataController.EndFullUpdate;
      Screen.Cursor := crDefault;
   end;
end;

procedure TfmCTSWSMovementReg.FormCreate(Sender: TObject);
var
   vPLoc : Variant;
begin
   ThisHerdID := WinData.UserDefaultHerdID;
   ImageStore := TImageStore.Create(nil);
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
      bbRemoveNatIdFormatting.Down := Preferences.ValueAsBoolean[cGSCTSMovementsRemoveNatIdNoFormatting];

   PageControl.ActivePage := nil;
   PageControl.ActivePage := tsToBeRegistered;
end;

procedure TfmCTSWSMovementReg.actLoginExecute(Sender: TObject);
begin
   TfmCTSLoginInfo.Execute;
end;

procedure TfmCTSWSMovementReg.FormDestroy(Sender: TObject);
begin
   Preferences.ValueAsBoolean[cGSCTSMovementsRemoveNatIdNoFormatting] := bbRemoveNatIdFormatting.Down;
   FreeAndNil(ImageStore);
end;

function TfmCTSWSMovementReg.Call_Register_Movements_Request : Boolean;
var
  Register_Movements_Request :TRegister_Movements_Request;
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
                 @Register_Movements_Request := GetProcAddress(DLLHandle, 'Register_Movements_Request');
                 if @Register_Movements_Request <> nil then
                    Result := Register_Movements_Request(CTSBatchID)
                 else
                    MessageDlg('Call to function '+CTSWSDLL+'.Register_Movements_Request in DLL failed!',mtError,[mbOk],0);
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

procedure TfmCTSWSMovementReg.actExitExecute(Sender: TObject);
begin
   Close;
end;

procedure TfmCTSWSMovementReg.DisplayResults;
begin
   tmpCTSMovements.Refresh;
   lNoMovementsAccepted.Caption := Format('%d',[CountOfMovements(True)]);
   lNoMovementsRejected.Caption := Format('%d',[CountOfMovements(False)]);
   PageControl.ActivePage := tsRegistrationResults;
//   tsToBeRegistered.TabVisible := False;
end;

procedure TfmCTSWSMovementReg.PageControlPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
   if NewPage = tsRegistrationResults then
      begin
         if not bSuccess then
            begin
               AllowChange := False;
               MessageDlg('No registration details have been sent yet.',mtInformation,[mbOK],0);
            end
         else
            begin
               CTSMovementsView := bvRegistrationResults;
               cmboView.ItemIndex := 0;
               gbRegistrationResults.Parent := tsRegistrationResults;
               gbPreviousResultsNos.Visible := False;
               gbRegistrationResultsNos.Visible := True;
               RegMovementsGrid.Parent := tsRegistrationResults;
               RegMovementsGrid.Top := 80;
               RegMovementsGrid.Height := 335;
               RegMovementsGridDBTableView.Styles.OnGetContentStyle := RegMovementsGridDBTableViewStylesGetContentStyle;
               RegMovementsGridDBTableViewStatus.Visible := True;
               RegMovementsGridDBTableViewSelected.Visible := False;
               RegMovementsGridDBTableViewIgnoreWarnings.Visible := False;
            end;
      end
   else if NewPage = tsToBeRegistered then
      begin
         CTSMovementsView := bvToBeRegistered;
         LoadMovementsToBeRegistered;
         RegMovementsGrid.Top := 22;
         RegMovementsGrid.Height := 390;
         RegMovementsGridDBTableView.Styles.OnGetContentStyle := nil;
         RegMovementsGrid.Parent := tsToBeRegistered;
         RegMovementsGridDBTableViewStatus.Visible := False;
         RegMovementsGridDBTableViewSelected.Visible := True;
         RegMovementsGridDBTableViewIgnoreWarnings.Visible := True;
      end
   else if NewPage = tsPreviousResults then
      begin
         CTSMovementsView := bvPreviousResults;
         gbRegistrationResults.Parent := tsPreviousResults;
         gbPreviousResultsNos.Visible := True;
         gbRegistrationResultsNos.Visible := False;
         RegMovementsGridDBTableView.Styles.OnGetContentStyle := nil;
      end;
   if AllowChange then
      if PageControl.ActivePage = tsPreviousResults then
         begin
            if QueryCTSRequests.Active then QueryCTSRequests.Active := False;
         end;

end;

procedure TfmCTSWSMovementReg.actRegisterCTSExecute(Sender: TObject);
begin
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
         exit;
      end;

   if CountOfSelected <= 0 then
      begin
         MessageDlg('No movements have been selected!',mtWarning,[mbOK],0);
         Exit;
      end;

   CTSBatchID := GetCTSBatchID(ThisHerdID);
   if CTSBatchID = 0 then
      begin
         raise Exception.Create('Invalid CTSBatchID found');
      end;
   // populate outgoing request with batchid .
   with tmpCTSMovements do
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
   bSuccess := Call_Register_Movements_Request;
   if bSuccess then
      UpdateHerdDatabase;
end;

procedure TfmCTSWSMovementReg.RegMovementsGridDBTableViewStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
var
  vRegistered : Variant;
begin
   if ARecord <> nil then
      begin
         vRegistered := ARecord.Values[RegMovementsGridDBTableViewRegistered.Index];
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

function TfmCTSWSMovementReg.CountOfMovements(
  ARegistered: Boolean): Integer;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;

         SQL.Text := 'SELECT COUNT(ID) CID FROM tmpCTSMovements WHERE Registered=:Registered AND Selected=True';
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

procedure TfmCTSWSMovementReg.cmboViewPropertiesChange(Sender: TObject);
begin
   if (CTSMovementsView = bvRegistrationResults ) then
      begin
         RegMovementsGridDBTableView.DataController.BeginFullUpdate;
         try
            case cmboView.ItemIndex of
               0 : begin
                      tmpCTSMovements.Filter := '((Selected = True) AND (Registered=False))';
                      tmpCTSMovements.Filtered := True;
                   end;
               1 : begin
                      tmpCTSMovements.Filter := '((Selected = True) AND (Registered=True))';
                      tmpCTSMovements.Filtered := True;
                   end;
            else
               begin
                  tmpCTSMovements.Filter := '(Selected = True)';
                  tmpCTSMovements.Filtered := False;
               end;
         end;
         finally
            RegMovementsGridDBTableView.DataController.EndFullUpdate;
         end;
      end
   else if (CTSMovementsView = bvPreviousResults ) then
      begin
         PreviousResultsGridTableView.DataController.BeginFullUpdate;
         try
            case cmboView.ItemIndex of
               0 : begin
                      ViewPreviousResults(rvRejected);
                      PreviousResultsGridTableViewRegistered.Visible := False;
                      lNoOfMovements.Style.TextColor := clRed;
                      lMovements.Caption := 'Movements Rejected:';
                   end;
               1 : begin
                      ViewPreviousResults(rvAccepted);
                      PreviousResultsGridTableViewRegistered.Visible := False;
                      lNoOfMovements.Style.TextColor := clGreen;
                      lMovements.Caption := 'Movements Accepted:';
                   end;
            else if cmboView.ItemIndex >-1 then
               begin
                  PreviousResultsGridTableViewRegistered.Visible := True;
                  ViewPreviousResults(rvAll);
                  lNoOfMovements.Style.TextColor := clWindowText;
                  lMovements.Caption := 'All Movements:';
               end;
            end;
         finally
            PreviousResultsGridTableView.DataController.EndFullUpdate;
         end;

      end;

end;

procedure TfmCTSWSMovementReg.blbTestDataClick(Sender: TObject);
begin
   with tmpCTSMovements do
      begin
         Close;
         EmptyTable;
         Open;

         Movements.Open;
         Movements.First;
         while not Movements.eof do
            begin
               tmpCTSMovements.Append;
               tmpCTSMovementsCTSBatchID.asInteger := MovementsCTSBatchID.AsInteger;
               tmpCTSMovementsAnimalID.AsInteger := MovementsAnimalID.AsInteger;
               tmpCTSMovementsNatIDNum.AsString := MovementsNatIDNum.AsString;
               tmpCTSMovementsOutputNatIDNum.AsString := MovementsNatIDNum.AsString;
               tmpCTSMovementsOutputNatIDNum.AsString := MovementsOutputNatIDNum.AsString;
               tmpCTSMovementsEID.AsString := MovementsEID.AsString;
               tmpCTSMovementsLoc.AsString:= MovementsLoc.AsString;
               tmpCTSMovementsSLoc.AsString:= MovementsSLoc.AsString;
               tmpCTSMovementsIgnoreWarnings.AsBoolean:= MovementsIgnoreWarnings.AsBoolean;
               tmpCTSMovementsMType.AsString := MovementsMType.AsString;
               tmpCTSMovementsMDate.AsDateTime := MovementsMDate.AsDateTime;
               tmpCTSMovementsRefNum.AsString := MovementsRefNum.AsString;
               tmpCTSMovementsSelected.AsBoolean := True;
               tmpCTSMovementsRegistered.AsBoolean := False;
               tmpCTSMovements.Post;
               Movements.Next;
            end;
            Movements.Close;
      end;
end;

procedure TfmCTSWSMovementReg.UpdateHerdDatabase;
begin
   try
      with GenQuery do
         begin
            SQL.Clear;
            SQL.Add('Select AnimalID, EventID, MType From tmpCTSMovements');
            SQL.Add('Where (Selected=True)');
            SQL.Add('And (Registered=True)');
            Open;
            try
               First;

               while not eof do
                  begin
                     RegisterMovementRecord(GenQuery.FieldByName('EventID').AsInteger,GenQuery.FieldByName('MType').AsString);
                     Next;
                  end;
            finally
               Close;
            end;
            {
            with GenQuery do
               begin
                  SQL.Clear;
                  SQL.Add('Delete From tmpCTSMovements Where AnimalID IN ( Select AnimalID From tmpCTSMovements');
                  SQL.Add('Where (Selected=True)');
                  SQL.Add('And (Registered=True))');
                  ExecSQL;
               end;
            }
         end;
         DisplayResults;
   finally
   end;
end;

procedure TfmCTSWSMovementReg.hleCTSStatusClick(Sender: TObject);
begin
   CheckCTSWSStatus;
end;

procedure TfmCTSWSMovementReg.actCheckCTSWSStatusExecute(Sender: TObject);
begin
   CheckCTSWSStatus
end;

procedure TfmCTSWSMovementReg.actHelpExecute(Sender: TObject);
begin
   WinData.HTMLHelp('ctsmovements.htm');
end;

procedure TfmCTSWSMovementReg.RegMovementsGridDBTableViewStatusPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
   if bSuccess then
      begin
         if tmpCTSMovements.FieldByName('Registered').AsBoolean then
            MessageDlg('This movement has been registered with CTS Online.',mtInformation,[mbOK],0)
         else
            TfmCTSRegResults.DisplayRejectionResults(rtMovement, tmpCTSMovements.FieldByName('NatIDNum').AsString, tmpCTSMovements.FieldByName('AnimalID').AsInteger, CTSBatchID)
      end
   else
      begin
         MessageDlg('This movement is not has not been registered with CTS Online.',mtWarning,[mbOK],0);
      end;
end;

procedure TfmCTSWSMovementReg.FormKeyPress(Sender: TObject; var Key: Char);
begin
{   if key = 'a' then
      blbTestData.Click;
}
end;

function TfmCTSWSMovementReg.CountOfSelected: Integer;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;

         SQL.Text := 'SELECT COUNT(ID) CID FROM tmpCTSMovements WHERE Selected=True';
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

procedure TfmCTSWSMovementReg.tmpCTSMovementsAfterPost(DataSet: TDataSet);
begin
   StatusBar.Panels[0].Text := Format('No. of selected movement records: %d',[CountOfSelected]);
end;

procedure TfmCTSWSMovementReg.actViewCTSExceptionsExecute(Sender: TObject);
begin
   TfmCTSExceptions.ViewCTSExceptions;
end;

procedure TfmCTSWSMovementReg.ViewPreviousResults(
  ARegisteredView: TRegisteredView);
begin
   Update;
   Screen.Cursor := crHourGlass;
   try
      QueryCTSRequests.SQL.Clear;
      QueryCTSRequests.SQL.Add('SELECT Ctsrequest.ID, Ctsrequest.Requestdate, Ctsrequest.CTSBatchID, Ctsrequest.Registered, Ctsrequest.AnimalID, Ctsrequest.Warnings, Ctsrequest.TxnId, Animals.NatIDNum, Animals.Sex, ');
      QueryCTSRequests.SQL.Add('Animals.DateOfBirth, Breeds.Code BreedCode');
      QueryCTSRequests.SQL.Add('FROM "CTSRequest.DB" Ctsrequest');
      QueryCTSRequests.SQL.Add('INNER JOIN "animals.DB" Animals ON  (Animals.ID = Ctsrequest.AnimalID)');
      QueryCTSRequests.SQL.Add('LEFT OUTER JOIN "Breeds.DB" Breeds ON  (Breeds.ID = Animals.PrimaryBreed)');
      if ( ARegisteredView = rvRejected ) then
         begin
            QueryCTSRequests.SQL.Add('WHERE   (Ctsrequest.Registered = False) AND  (Ctsrequest.RequestType = 2) ');// AND  Ctsrequest.AnimalID NOT IN');
         end
      else if ( ARegisteredView = rvAccepted ) then
         begin
            QueryCTSRequests.SQL.Add('WHERE (Ctsrequest.Registered = TRUE) AND  (Ctsrequest.RequestType = 2)');
         end
      else
         begin
            QueryCTSRequests.SQL.Add('WHERE (Ctsrequest.RequestType = 2)');
         end;
      QueryCTSRequests.Open;
      lNoOfMovements.Caption := Format('%d',[QueryCTSRequests.RecordCount]);
   finally
      Screen.Cursor := crDefault;
   end;

end;

procedure TfmCTSWSMovementReg.tsPreviousResultsShow(Sender: TObject);
begin
   cmboView.ItemIndex := -1;
   cmboView.ItemIndex := 1;
end;

procedure TfmCTSWSMovementReg.tsRegistrationResultsShow(Sender: TObject);
begin
   cmboView.ItemIndex := -1;
   cmboView.ItemIndex := 0;
end;

procedure TfmCTSWSMovementReg.PreviousResultsGridTableViewStylesGetContentStyle(
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

procedure TfmCTSWSMovementReg.PreviousResultsGridTableViewStatusPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
   if not QueryCTSRequests.FieldByName('Registered').AsBoolean then
      TfmCTSRegResults.DisplayRejectionResults(rtMovement, QueryCTSRequests.FieldByName('NatIDNum').AsString, QueryCTSRequests.FieldByName('AnimalID').AsInteger, QueryCTSRequests.FieldByName('CTSBatchID').AsInteger)
   else
      MessageDlg('This movement record has been accepted.',mtInformation,[mbOk],0);
end;

procedure TfmCTSWSMovementReg.RegMovementsGridDBTableViewSortNatIDNumGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   if ARecord <> nil then
      AText := ARecord.DisplayTexts[RegMovementsGridDBTableViewNatIDNum.Index]
   else
      AText := '';

end;

procedure TfmCTSWSMovementReg.UpdateAnimals_NatIDNum(ANatIDFieldName,
  AIDFieldName: string);
var
   NatIDNum : string;
begin
   NatIDNum := tmpCTSMovements.FieldByName(ANatIDFieldName).AsString;
   if ( Trim(NatIDNum) <> '' ) and ( InputQuery('Change Nat. Id. No.', 'New Nat. Id. No.', NatIDNum) ) then
      begin
         if MessageDlg(Format(cNatIdChangeConfirmMsg,[NatIDNum]),mtConfirmation,[mbyes,mbNo],0) = idYes then
            begin
               tmpCTSMovements.Edit;
               tmpCTSMovements.FieldByName(ANatIDFieldName).AsString := NatIDNum;
               tmpCTSMovements.Post;

               // Now update Animals Table.
               with TQuery.Create(nil) do
                  try
                     DatabaseName := AliasName;
                     SQL.Text := 'UPDATE Animals SET NatIDNum = :NatIDNum WHERE ID =:ID';
                     Params[0].AsString := NatIDNum;
                     Params[1].AsInteger := tmpCTSMovements.FieldByName(AIDFieldName).AsInteger;
                     ExecSQL;
                     if not Menuform.ReloadSetupQuery then
                        Menuform.ReloadSetupQuery := True;
                  finally
                     Free;
                  end;
            end;
      end;
end;

procedure TfmCTSWSMovementReg.actChangeNatIDNumExecute(Sender: TObject);
begin
   UpdateAnimals_NatIDNum('NatIDNum','AnimalID');
end;

procedure TfmCTSWSMovementReg.GridPopupMenuPopup(Sender: TObject);
var
  AColumn : TcxGridDBColumn;
begin

   if PageControl.ActivePage <> tsToBeRegistered then Abort;
 //  AColumn := RegMovementsGridDBTableView.Controller.FocusedColumn as TcxGridDBColumn;
//   if AColumn.DataBinding.FieldName <> 'SortNatIDNum' then
  //    Abort; // do not popup

end;

procedure TfmCTSWSMovementReg.RegMovementsGridDBTableViewCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  AColumn : TcxGridDBColumn;
begin
   if PageControl.ActivePage <> tsToBeRegistered then Exit;
   AColumn := RegMovementsGridDBTableView.Controller.FocusedColumn as TcxGridDBColumn;
   if AColumn.DataBinding.FieldName <> 'SortNatIDNum' then
      Abort; // do not popup
end;

function TfmCTSWSMovementReg.RegisterMovementRecord(AEventID : Integer;
   AMType : string) : Boolean;
begin
   Result := False;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         if (Lowercase(AMType) = 'on') then
            SQL.Add('Update Purchases Set CTSReg=True where (EventID=:EventID)')
         else
            SQL.Add('Update SalesDeaths Set CTSReg=True where (EventID=:EventID) ');
         Params[0].AsInteger := AEventID;
         ExecSQL;
         Result := True;
      finally
         Free;
      end;
end;

procedure TfmCTSWSMovementReg.actRemovePermanentlyExecute(Sender: TObject);
begin
   if MessageDlg('Are you sure you want to permanently remove this movement record?',mtConfirmation,[mbYes,mbNo],0) = idYes then
      begin
         if RegisterMovementRecord(tmpCTSMovementsEventID.AsInteger, tmpCTSMovementsMType.AsString) then
            begin
               tmpCTSMovements.Delete;
               MessageDlg('Movement record permanently removed.',mtInformation,[mbOK],0);
            end
         else
            begin
               MessageDlg('Failed to remove movement record.',mtError,[mbOK],0);
            end;
      end;
end;

procedure TfmCTSWSMovementReg.bbRemoveNatIdFormattingClick(Sender: TObject);
begin
   LoadMovementsToBeRegistered;
end;

procedure TfmCTSWSMovementReg.actRemoveAllPermanentlyExecute(
  Sender: TObject);
begin
   if MessageDlg('Are you sure you want to permanently remove ALL movement records?',mtConfirmation,[mbYes,mbNo],0) = idYes then
      begin
         Update;
         Screen.Cursor := crHourGlass;
         tmpCTSMovements.DisableControls;
         try
            tmpCTSMovements.First;
            while tmpCTSMovements.recordCount > 0 do
               begin
                 if RegisterMovementRecord(tmpCTSMovementsEventID.AsInteger, tmpCTSMovementsMType.AsString) then
                    begin
                       tmpCTSMovements.Delete;
                       //MessageDlg('Movement record permanently removed.',mtInformation,[mbOK],0);
                    end
                 else
                    begin
                       MessageDlg('Failed to remove movement record.',mtError,[mbOK],0);
                    end;
               end;
         finally
            tmpCTSMovements.EnableControls;
            Screen.Cursor := crDefault;
         end;
      end;
end;

procedure TfmCTSWSMovementReg.actPrintExecute(Sender: TObject);
begin
   if Length(dxComponentPrinter.PrintTitle) = 0 then
      dxComponentPrinter.PrintTitle := 'Kingswood Grid Print';
   if PageControl.ActivePageIndex = 0 then
      RegMovmentsComponentPrinterLink.Preview
   else if PageControl.ActivePageIndex = 2 then
      PreRegMovementsComponentPrinterLink.Preview;
end;

end.