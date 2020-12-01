{
   10/09/18 [V5.8 R2.7] /MK Change - pcHerdReconciliationPageChanging - If there are animals not found on CTS data then show count in Status Bar

   14/09/18 [V5.8 R2.8] /MK Change - Added egg timer to Download Holding Data and Reconcile Herd.
                                   - actReconcileHerdExecute - Don't show animals that have a blank National ID in the not on CTS list.
                                                             - If there are no problems found i.e. all animals on CTS are on Kingswood, but there are animals on Kingswood
                                                               but not on CTS then show this page and give explanatory warning.
                                   - UpdateDisplay - Show gbMatch if there are animals not found on Kingswood or vice versa.
                                                   - Only show matching objects if there are animals not on Kingswood that are on CTS.
                                   - pcHerdReconciliationPageChanging - Refactored this code so booleans are assigned by properties.

   08/04/19 [V5.8 R8.6] /MK Bug Fix - Change Status label depending on whether user is in "Not Found on Kingswood" or "Not Found on BCMS" list - GL.

   13/01/20 [V5.9 R1.7] /MK Additional Feature - Add an Add All To Herd/Remove All From Herd actions to add all animals or sell all animals depending on the pcHerdReconciliation page selected.
                                               - Added a button that on the pcHerdReconciliation page that switches between the new actions depending on the page selected.
                                               - Added a sale date on the pcHerdReconciliation page that only shows if tsDataAnimalsOnHolding tab is selected.
                                               - These controls are only available to Kingswood Delphi Developers.
}

unit uCTSCattleOnHolding;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, cxClasses, cxGridLevel, cxGrid, cxPC, cxControls,
  dxBar, dxBarExtItems, ActnList, Db, DBTables, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxContainer,
  cxEdit, cxLabel, dxStatusBar, cxTextEdit, cxHyperLinkEdit, cxGroupBox,
  GenTypesConst, dxPSCore, dxPScxCommon, dxPScxGridLnk, uHerd, uAnimal,
  KRoutines, FileCtrl, uGeneralMemo, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, uCustomerRepository;

type
  TDisplayType = (dtCattleOnHolding, dtCattleNotFoundInHerd, dtCattleNotFoundOnCTS);
  TfmCTSCattleOnHolding = class(TForm)
    ActionList1: TActionList;
    actExit: TAction;
    actLogin: TAction;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    PageControl: TcxPageControl;
    tsAnimalsOnHolding: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    tsQueriedAnimals: TcxTabSheet;
    tsQueriedMovements: TcxTabSheet;
    dsQueryOnHolding: TDataSource;
    QueryOnHolding: TQuery;
    lGetHoldingInfo: TcxLabel;
    QueryOnHoldingID: TIntegerField;
    QueryOnHoldingOnHoldingType: TIntegerField;
    QueryOnHoldingEtg: TStringField;
    QueryOnHoldingDOB: TDateTimeField;
    QueryOnHoldingBrd: TStringField;
    QueryOnHoldingSex: TStringField;
    QueryOnHoldingGdEtg: TStringField;
    QueryOnHoldingSuEtg: TStringField;
    QueryOnHoldingSiEtg: TStringField;
    QueryOnHoldingOnDate: TDateTimeField;
    QueryOnHoldingMoveDate: TDateTimeField;
    QueryOnHoldingMoveType: TIntegerField;
    QueryOnHoldingReceivedDate: TDateTimeField;
    GridQueriedMovements: TcxGrid;
    GridQueriedMovementsTableView: TcxGridDBTableView;
    GridQueriedMovementsLevel: TcxGridLevel;
    GridQueriedMovementsTableViewEtg: TcxGridDBColumn;
    GridQueriedMovementsTableViewMoveDate: TcxGridDBColumn;
    GridQueriedMovementsTableViewMoveType: TcxGridDBColumn;
    GridQueriedMovementsTableViewReceivedDate: TcxGridDBColumn;
    blbGetHoldingData: TdxBarLargeButton;
    actGetHoldingData: TAction;
    StatusBar: TdxStatusBar;
    blbHelp: TdxBarLargeButton;
    actHelp: TAction;
    dxBarStatic1: TdxBarStatic;
    dxBarListItem1: TdxBarListItem;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarButton1: TdxBarButton;
    dxBarButton3: TdxBarButton;
    actCheckCTSWSStatus: TAction;
    cxLabel1: TcxLabel;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton2: TdxBarButton;
    actViewCTSExceptions: TAction;
    blbReconcileHerd: TdxBarLargeButton;
    actReconcileHerd: TAction;
    QueryOnHoldingOnHerd: TBooleanField;
    actGetClosestMatch: TAction;
    gbMatch: TcxGroupBox;
    btnGetClosetMatch: TcxButton;
    lMatchAnimalsInfo: TcxLabel;
    btnAddToHerd: TcxButton;
    actAddToHerd: TAction;
    bbReconcileWithNatIdNoFormatting: TdxBarButton;
    pcHerdReconciliation: TcxPageControl;
    tsBCMSAnimals: TcxTabSheet;
    tsDataAnimalsOnHolding: TcxTabSheet;
    GetHoldingAnimals: TcxGrid;
    GetHoldingAnimalsDBTableView: TcxGridDBTableView;
    GetHoldingAnimalsDBTableViewEtg: TcxGridDBColumn;
    GetHoldingAnimalsDBTableViewDOB: TcxGridDBColumn;
    GetHoldingAnimalsDBTableViewSex: TcxGridDBColumn;
    GetHoldingAnimalsDBTableViewBrd: TcxGridDBColumn;
    GetHoldingAnimalsDBTableViewGdEtg: TcxGridDBColumn;
    GetHoldingAnimalsDBTableViewSuEtg: TcxGridDBColumn;
    GetHoldingAnimalsDBTableViewSiEtg: TcxGridDBColumn;
    GetHoldingAnimalsDBTableViewOnDate: TcxGridDBColumn;
    GetHoldingAnimalsLevel: TcxGridLevel;
    HoldingGrid: TcxGrid;
    HoldingGridDBTableView: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    HoldingGridLevel: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    btnPrintAnimalsOnHolding: TcxButton;
    actPrintAnimalsOnHolding: TAction;
    dxComponentPrinter1: TdxComponentPrinter;
    cplCattleOnHolding: TdxGridReportLink;
    dxBarButton4: TdxBarButton;
    actReconcileOptions: TAction;
    HoldingGridDBTableViewHerdNo: TcxGridDBColumn;
    btnAddRemoveAll: TcxButton;
    actAddAllToHerd: TAction;
    actRemoveAllFromHerd: TAction;
    pSaleDate: TPanel;
    lSaleDate: TcxLabel;
    deSaleDate: TcxDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure PageControlPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure actGetHoldingDataExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actLoginExecute(Sender: TObject);
    procedure actHelpExecute(Sender: TObject);
    procedure actCheckCTSWSStatusExecute(Sender: TObject);
    procedure actViewCTSExceptionsExecute(Sender: TObject);
    procedure actReconcileHerdExecute(Sender: TObject);
    procedure actGetClosestMatchExecute(Sender: TObject);
    procedure actReconcileHerdUpdate(Sender: TObject);
    procedure actAddToHerdExecute(Sender: TObject);
    procedure pcHerdReconciliationPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure actPrintAnimalsOnHoldingExecute(Sender: TObject);
    procedure actReconcileOptionsExecute(Sender: TObject);
    procedure actRemoveAllFromHerdExecute(Sender: TObject);
    procedure actAddAllToHerdExecute(Sender: TObject);
  private
    { Private declarations }
    bSuccess : Boolean;
    ThisHerdID : Integer;
    tmpCTSOnHolding, tmpHoldingData : TTable;
    dsHoldingData: TDataSource;
    AnimalDatabaseUpdated : Boolean;
    FReconcileHerdList : THerds;
    FAddRemoveAnimalCount : Integer;
    FAddRemoveAnimalList : TStringList;
    FDatabasePath : String;
    function Get_Cattle_On_Holding_Request : Boolean;
    procedure FilterCattle(AOnHoldingType : Integer);
    procedure UpdateStatusLabel(AText : String; AColour : TColor);
    procedure UpdateDisplay( ADisplayType : TDisplayType);
    procedure AddAnimal(AIsSingleAnimal: Boolean);
    procedure SellAnimal;
  public
    { Public declarations }
    class procedure Execute;
  end;

var
  fmCTSCattleOnHolding: TfmCTSCattleOnHolding;

const
   cOnHoldingType_Animal = 1;
   cOnHoldingType_QueriedAnimal = 2;
   cOnHoldingType_QueriedMovement = 3;

   cNoHoldingData = 'No holding data to display';
   cReconcileNotFoundCTS = 'The listing below displays animals on CTS not found in your herd database.';
   cReconcileNotFoundKW = 'The listing below displays animals on Kingswood not found in CTS.';
   cNoOfAnimalsNotFound = 'Number of animals on CTS and not found in your herd database: %d';
   cAllAnimalsFound = 'All animals on CTS have been found in Kingswood.';
   cReviewList = 'Please review the list of animals that have not'+cCRLF+'been found on your herd database';
   cCattleDownloadNotCompleted = 'No Cattle on Holding data has been downloaded.';
   cCattleDownloadSuccess = 'Cattle on Holding data successfully downloaded';

implementation
uses
  uCTSLoginInfo, uImageStore, uHerdLookup,
  uHerdSetUp, DairyData, uCTSHelper, uCTSExceptions,
  uCTSCattleOnHoldingNatIDReconcile, EventRecording, MenuUnit,
  uPreferences, KDBRoutines, uCTSHerdReconcileOptions;

{$R *.DFM}

class procedure TfmCTSCattleOnHolding.Execute;
begin
   with TfmCTSCattleOnHolding.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmCTSCattleOnHolding.FormCreate(Sender: TObject);
begin
   AnimalDatabaseUpdated := False; // if true on closing form, Menuform.SetupQuery will be called.
   UpdateStatusLabel(cNoHoldingData, clGreen);
   UpdateDisplay(dtCattleOnHolding);
   ImageStore := TImageStore.Create(nil);
   ThisHerdID := WinData.UserDefaultHerdID;
   HerdLookup.HerdOwnerData.HerdID := ThisHerdID;
   bbReconcileWithNatIdNoFormatting.Down := Preferences.ValueAsBoolean[cGSCTSReconcileUsingNatIdNoFormatting];
   tsDataAnimalsOnHolding.TabVisible := False;
   tsBCMSAnimals.Caption := 'Animals On CTS Cattle On Holding';
   FReconcileHerdList := TfmCTSHerdReconcileOptions.GetHerdsToReconcile();
   FAddRemoveAnimalList := TStringList.Create();
   FDatabasePath := IncludeTrailingBackSlash(DefaultDirectory) + DataDir;
end;

procedure TfmCTSCattleOnHolding.PageControlPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
   btnAddRemoveAll.Visible := DirectoryExists('C:\Kingswood\Delphi Development\Delphi 5\Herd'); // debug
   pSaleDate.Visible := btnAddRemoveAll.Visible;
   if not bSuccess then
      begin
         AllowChange := False;
         MessageDlg(cCattleDownloadNotCompleted,mtInformation,[mbOK],0);
      end
   else if (NewPage = tsAnimalsOnHolding) then
      begin
         GetHoldingAnimals.Parent := tsBCMSAnimals;
         FilterCattle(cOnHoldingType_Animal);
         UpdateDisplay(dtCattleOnHolding);
         if tsDataAnimalsOnHolding.TabVisible then
            tsDataAnimalsOnHolding.TabVisible := False;
      end
   else if (NewPage = tsQueriedAnimals) then
      begin
         GetHoldingAnimals.Parent := NewPage;
         FilterCattle(cOnHoldingType_QueriedAnimal);
         UpdateDisplay(dtCattleOnHolding);
      end
   else if (NewPage = tsQueriedMovements) then
      begin
         FilterCattle(cOnHoldingType_QueriedMovement);
      end;
end;

procedure TfmCTSCattleOnHolding.FormDestroy(Sender: TObject);
begin
   Preferences.ValueAsBoolean[cGSCTSReconcileUsingNatIdNoFormatting] := bbReconcileWithNatIdNoFormatting.Down;
   QueryOnHolding.Active := False;
   FreeAndNil(ImageStore);
   if Assigned(tmpCTSOnHolding) then
      begin
         tmpCTSOnHolding.Close;
         tmpCTSOnHolding.DeleteTable;
         FreeAndNil(tmpCTSOnHolding);
      end;
   if Assigned(tmpHoldingData) then
      begin
         tmpHoldingData.Close;
         tmpHoldingData.DeleteTable;
         FreeAndNil(tmpHoldingData);
      end;

   SafeFreeAndNil(FReconcileHerdList);

   if AnimalDatabaseUpdated then
      begin
         AnimalDatabaseUpdated := False;
         Menuform.SetUpQuery(False);
      end;

   if ( FAddRemoveAnimalList <> nil ) then
      FreeAndNil(FAddRemoveAnimalList);
end;

procedure TfmCTSCattleOnHolding.actGetHoldingDataExecute(Sender: TObject);
var
   AnimalQuery : TQuery;
   Herd : THerd;
   Animal : TAnimal;
   i : Integer;
begin
   try
      Screen.Cursor := crHourGlass;

      tsBCMSAnimals.Caption := 'Animals On CTS Cattle On Holding';
      tsDataAnimalsOnHolding.TabVisible := False;

      if QueryOnHolding.Active then
         QueryOnHolding.Active := False;

      UpdateStatusLabel(cNoHoldingData, clGreen);
      UpdateDisplay(dtCattleOnHolding);

      tmpCTSOnHolding := TTable.Create(nil);
      try
         tmpCTSOnHolding.DatabaseName := AliasName;
         tmpCTSOnHolding.TableName := 'tmpCTSOnHolding';
         with tmpCTSOnHolding do
            try
               if Exists then
                  DeleteTable;
               with FieldDefs do
                  begin
                     Clear;
                     FieldDefs.Add('ID',ftAutoInc);
                     FieldDefs.Add('OnHoldingType',ftInteger);
                     FieldDefs.Add('Etg',ftString,14);
                     FieldDefs.Add('DOB',ftDateTime);
                     FieldDefs.Add('Brd',ftString,6);
                     FieldDefs.Add('Sex',ftString,8);
                     FieldDefs.Add('GdEtg',ftString,20);
                     FieldDefs.Add('SuEtg',ftString,20);
                     FieldDefs.Add('SiEtg',ftString,20);
                     FieldDefs.Add('OnDate',ftDateTime);
                     FieldDefs.Add('MoveDate',ftDateTime);
                     FieldDefs.Add('MoveType',ftInteger);
                     FieldDefs.Add('ReceivedDate',ftDateTime);
                     FieldDefs.Add('OnHerd',ftBoolean);
                     FieldDefs.Add('LocateNatId',ftString,14);
                  end;

               with IndexDefs do
                  begin
                     Clear;
                     Add('iID','ID',[ixUnique, ixPrimary]);
                  end;
               CreateTable;
            except
               on E : Exception do
                  raise Exception.Create('Database Error: '+ E.Message);
            end;
      finally
         FreeAndNil(tmpCTSOnHolding);
      end;

      if not Assigned(tmpHoldingData) then
         begin
            tmpHoldingData := TTable.Create(nil);
            tmpHoldingData.DatabaseName := AliasName;
            tmpHoldingData.TableName := 'tmpHoldingData';

            dsHoldingData:= TDataSource.Create(nil);
            dsHoldingData.Dataset := tmpHoldingData;

            HoldingGridDBTableView.DataController.DataSource := dsHoldingData;
         end;

      with tmpHoldingData do
         try
            if Active then
               Active := False;

            if Exists then
               DeleteTable;
            with FieldDefs do
               begin
                  Clear;
                  FieldDefs.Add('ID',ftAutoInc);
                  FieldDefs.Add('AnimalID',ftInteger);
                  FieldDefs.Add('Etg',ftString,30);
                  FieldDefs.Add('DOB',ftDate);
                  FieldDefs.Add('Brd',ftString,6);
                  FieldDefs.Add('Sex',ftString,10);
                  FieldDefs.Add('HerdId',ftInteger);
                  FieldDefs.Add('HerdNo',ftString,20);
               end;

            with IndexDefs do
               begin
                  Clear;
                  Add('iID','ID',[ixUnique, ixPrimary]);
               end;
            CreateTable;

            if ( FReconcileHerdList <> nil ) and ( FReconcileHerdList.Count > 0 ) then
               begin
                  Active := True; // opens the tmpHoldingData table to insert animals found from each herd.

                  AnimalQuery := TQuery.Create(nil);
                  try
                     with AnimalQuery do
                        begin
                           SQL.Clear;
                           SQL.Add('SELECT A.ID, A.NatIdNum, A.SortNatId, A.AnimalNo, A.LocateNatId, A.DateOfBirth, A.Sex, B.Code BreedCode');
                           SQL.Add('FROM Animals A    ');
                           SQL.Add('LEFT JOIN Breeds B ON (B.ID=A.PrimaryBreed)');
                           SQL.Add('WHERE (A.HerdID=:HerdID) ');
                           SQL.Add('AND   (A.Inherd=True) ');
                           SQL.Add('AND   (A.AnimalDeleted=False) ');
                           for i := 0 to FReconcileHerdList.Count-1 do
                              begin
                                 AnimalQuery.DatabaseName := THerd(FReconcileHerdList[i]).DatabasePath;
                                 AnimalQuery.Params[0].AsInteger := THerd(FReconcileHerdList[i]).ID;
                                 THerd(FReconcileHerdList[i]).Animals.LoadBySQL(AnimalQuery);
                              end;
                        end;

                     for i := 0 to FReconcileHerdList.Count-1 do
                        begin
                           Herd := THerd(FReconcileHerdList[i]);

                           if Herd = nil then Continue;

                           Herd.Animals.MoveFirst;

                           while not Herd.Animals.Eof do
                              begin
                                 Animal := Herd.Animals.CurrentAnimal;
                                 if ( Animal <> nil ) then
                                    begin
                                       Append;
                                       try
                                          FieldByName('AnimalID').AsInteger := Animal.Id;
                                          FieldByName('Etg').AsString := Animal.LocateNatIdNum;
                                          FieldByName('DOB').AsDateTime := Animal.DateOfBirth;
                                          FieldByName('Brd').AsString := Animal.BreedCode;
                                          FieldByName('Sex').AsString := Animal.Sex;
                                          FieldByName('HerdId').AsInteger := Herd.ID;
                                          FieldByName('HerdNo').AsString := Herd.HerdIdentity;
                                          Post;
                                       except
                                          Cancel;
                                       end;
                                   end;
                                 Herd.Animals.MoveNext;
                              end;
                           Herd.Animals.MoveFirst;
                        end;
                  finally
                     SafeFreeAndNil(AnimalQuery);
                  end;
               end
            else
               begin
                  with TQuery.Create(nil) do
                     try
                        DatabaseName := AliasName;
                        SQL.Add('INSERT INTO '+ tmpHoldingData.TableName +' (AnimalID,Etg, DOB, Brd, Sex)');
                        SQL.Add('SELECT A.ID, A.LocateNatId, A.DateOfBirth, B.Code, A.Sex');
                        SQL.Add('FROM Animals A    ');
                        SQL.Add('LEFT JOIN Breeds B ON (B.ID=A.PrimaryBreed)');
                        SQL.Add('WHERE (A.HerdID=:HerdID) ');
                        SQL.Add('AND (A.Inherd=True) ');
                        SQL.Add('AND (A.AnimalDeleted=False) ');
                        Params[0].AsInteger := ThisHerdID;
                        ExecSQL;
                     finally
                        Free;
                     end;
                  Active := True;
               end;

         except
            on E : Exception do
               raise Exception.Create('Database Error: '+ E.Message);
         end;

      bSuccess := Get_Cattle_On_Holding_Request;
      if bSuccess then
         begin
            UpdateStatusLabel(cCattleDownloadSuccess, clGreen);
            QueryOnHolding.Active := True;
            FilterCattle(cOnHoldingType_Animal);
         end;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TfmCTSCattleOnHolding.actExitExecute(Sender: TObject);
begin
   Close;
end;

procedure TfmCTSCattleOnHolding.actLoginExecute(Sender: TObject);
begin
   TfmCTSLoginInfo.Execute;
end;

function TfmCTSCattleOnHolding.Get_Cattle_On_Holding_Request : Boolean;
var
  Get_Cattle_On_Holding_Request :TGet_Cattle_On_Holding_Request;
  SetURLType : TSetURLType;
  pHoldingLoc, pHoldingSLoc : pChar;
  Loc, SLoc : string;
  MHSId : string;
begin
   Result := false;
   SetCurrentDir(ApplicationPath);

   Loc   := HerdLookup.HerdOwnerData.HoldingLoc;
   SLoc  := HerdLookup.HerdOwnerData.HoldingSLoc;
   MHSId := HerdLookup.HerdOwnerData.MHSId;

   if ((Loc = '') and ( MHSId = '')) then
      begin
         MessageDlg(Format('No holding CPH/MHS information has been entered for Herd "%s"'+#13#10+
                           'You must enter CPH/MHS information before connecting to CTS Online.',[HerdLookup.HerdOwnerData.HerdIdentity]), mtInformation,[mbOK],0);
         uHerdSetup.ShowTheForm(False, 'Loc');
         Exit;
      end;

   if FileExists( IncludeTrailingBackslash(ApplicationPath)+ CTSWSDLL) then
      begin
         DLLHandle := LoadLibrary(CTSWSDLL);
         if DLLHandle <> 0 then
            begin
               try
                 @SetURLType := GetProcAddress(DLLHandle, 'SetURLType');
                 if @SetURLType <> nil then
                    SetURLType(1);
                 @Get_Cattle_On_Holding_Request := GetProcAddress(DLLHandle, 'Get_Cattle_On_Holding_Request');
                 if (@Get_Cattle_On_Holding_Request <> nil) then
                    begin
                       if (Loc='') then
                          Result := Get_Cattle_On_Holding_Request(PChar(MHSId),PChar(SLoc))
                       else
                          Result := Get_Cattle_On_Holding_Request(PChar(Loc),PChar(SLoc))
                    end
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

procedure TfmCTSCattleOnHolding.FilterCattle(AOnHoldingType: Integer);
begin

   QueryOnHolding.DisableControls;
   try
      QueryOnHolding.Filter := 'OnHoldingType = '+IntToStr(AOnHoldingType);
      QueryOnHolding.Filtered := True;
   finally
      QueryOnHolding.EnableControls;
   end;

   case AOnHoldingType of
      1 : StatusBar.Panels[0].Text := Format('Number of animals on holding: %d', [QueryOnHolding.RecordCount]);
      2 : StatusBar.Panels[0].Text := Format('Number of queried animals: %d', [QueryOnHolding.RecordCount]);
      3 : StatusBar.Panels[0].Text := Format('Number of queried movements: %d', [QueryOnHolding.RecordCount]);
   end;

end;

procedure TfmCTSCattleOnHolding.actHelpExecute(Sender: TObject);
begin
   WinData.HTMLHelp('');
end;

procedure TfmCTSCattleOnHolding.actCheckCTSWSStatusExecute(
  Sender: TObject);
begin
   CheckCTSWSStatus;
end;

procedure TfmCTSCattleOnHolding.actViewCTSExceptionsExecute(
  Sender: TObject);
begin
   TfmCTSExceptions.ViewCTSExceptions;
end;

procedure TfmCTSCattleOnHolding.actReconcileHerdExecute(Sender: TObject);
var
   QueryNatIDNum : TQuery;
begin
   QueryNatIDNum := TQuery.Create(nil);
   QueryNatIDNum.DatabaseName := AliasName;
   if bbReconcileWithNatIdNoFormatting.Down then
      QueryNatIDNum.SQL.Add('Select ID From Animals Where NatIDNum =:NatIDNum')
   else
      QueryNatIDNum.SQL.Add('Select ID From Animals Where LocateNatID =:LocateNatID');

   GetHoldingAnimalsDBTableView.DataController.BeginFullUpdate;

   tmpCTSOnHolding := TTable.Create(nil);
   try
      Screen.Cursor := crHourGlass;

      tmpCTSOnHolding.DatabaseName := AliasName;
      tmpCTSOnHolding.TableName := 'tmpCTSOnHolding';
      tmpCTSOnHolding.Active := True;
      with tmpCTSOnHolding do
         begin
            First;
            while not eof do
               begin
                  Edit;
                  FieldByName('LocateNatId').AsString := StripAllSpaces(tmpCTSOnHolding.FieldByName('Etg').AsString);
                  Post;

                  if (FReconcileHerdList <> nil) then
                     begin
                        tmpCTSOnHolding.Edit;

                        if bbReconcileWithNatIdNoFormatting.Down then
                           tmpCTSOnHolding.FieldByName('OnHerd').AsBoolean := FReconcileHerdList.FindAnimal(tmpCTSOnHolding.FieldByName('Etg').AsString)
                        else
                           tmpCTSOnHolding.FieldByName('OnHerd').AsBoolean := FReconcileHerdList.FindAnimal(tmpCTSOnHolding.FieldByName('LocateNatId').AsString);

                        tmpCTSOnHolding.Post;
                        tmpCTSOnHolding.Next;
                     end
                  else
                     begin
                        QueryNatIDNum.Close;
                        if bbReconcileWithNatIdNoFormatting.Down then
                           QueryNatIDNum.Params[0].AsString := tmpCTSOnHolding.FieldByName('Etg').AsString
                        else
                           QueryNatIDNum.Params[0].AsString := tmpCTSOnHolding.FieldByName('LocateNatId').AsString;

                        QueryNatIDNum.Open;
                        QueryNatIDNum.First;

                        tmpCTSOnHolding.Edit;
                        tmpCTSOnHolding.FieldByName('OnHerd').AsBoolean := (QueryNatIDNum.FieldByName('ID').AsInteger >0);
                        tmpCTSOnHolding.Post;
                        tmpCTSOnHolding.Next;
                        QueryNatIDNum.Close;
                     end;
               end;
         end;

      //   14/09/18 [V5.8 R2.8] /MK Change - Don't show animals that have a blank National ID in the not on CTS list.
      QueryNatIDNum.SQL.Clear;
      QueryNatIDNum.SQL.Add('DELETE FROM '+ tmpHoldingData.TableName +' Where (Etg IS NULL)');
      QueryNatIDNum.ExecSQL;

      QueryNatIDNum.SQL.Clear;
      QueryNatIDNum.SQL.Add('DELETE FROM '+ tmpHoldingData.TableName +' Where (Etg=:Etg)');
      with tmpCTSOnHolding do
         begin
            First;
            while not eof do
               begin
                  if bbReconcileWithNatIdNoFormatting.Down then
                     QueryNatIDNum.Params[0].AsString := tmpCTSOnHolding.FieldByName('Etg').AsString
                  else
                     QueryNatIDNum.Params[0].AsString := tmpCTSOnHolding.FieldByName('LocateNatId').AsString;

                  QueryNatIDNum.ExecSQL;
                  Next;
               end;
         end;

      tmpHoldingData.Refresh;

      QueryOnHolding.Active := False;
      QueryOnHolding.Active := True;
      QueryOnHolding.Filter := 'OnHoldingType = 1 and OnHerd = False';
      QueryOnHolding.Filtered := True;
   finally
      Screen.Cursor := crDefault;

      FreeAndNil(tmpCTSOnHolding);
      GetHoldingAnimalsDBTableView.DataController.EndFullUpdate;

      tsBCMSAnimals.Caption := 'CTS animals not found on your holding';
      tsDataAnimalsOnHolding.Caption := 'Animals not found on CTS data';
      tsDataAnimalsOnHolding.TabVisible := True;

      if ( QueryOnHolding.RecordCount > 0 ) then
         begin
            UpdateStatusLabel(cReconcileNotFoundCTS, clRed);
            StatusBar.Panels[0].Text := Format(cNoOfAnimalsNotFound, [QueryOnHolding.RecordCount]);
            UpdateDisplay(dtCattleNotFoundInHerd);
            MessageDlg(cReviewList,mtWarning,[mbOK],0);
         end
      //   14/09/18 [V5.8 R2.8] /MK Change - If there are no problems found i.e. all animals on CTS are on Kingswood, but there are animals on Kingswood
      //                                     but not on CTS then show this page and give explanatory warning.
      else if ( tmpHoldingData.RecordCount > 0 ) then
         begin
            UpdateDisplay(dtCattleNotFoundOnCTS);
            pcHerdReconciliation.ActivePageIndex := tsDataAnimalsOnHolding.PageIndex;
            MessageDlg(cAllAnimalsFound+cCRLF+
                       'There are some animals that are in Kingswood that cannot be found on CTS.',mtWarning,[mbOK],0);
         end
      else
         begin
            StatusBar.Panels[0].Text := cAllAnimalsFound;
            MessageDlg(cAllAnimalsFound,mtInformation,[mbOK],0);
            UpdateDisplay(dtCattleOnHolding);
            UpdateStatusLabel(cCattleDownloadSuccess, clGreen);
         end;
   end;
end;

procedure TfmCTSCattleOnHolding.UpdateStatusLabel(AText: String;
  AColour: TColor);
begin
   lGetHoldingInfo.Caption := AText;
   lGetHoldingInfo.Style.TextColor := AColour;
end;

procedure TfmCTSCattleOnHolding.actGetClosestMatchExecute(Sender: TObject);
begin
   if TfmCTSCattleOnHoldingNatIDReconcile.GetNatIDMatch(QueryOnHoldingEtg.AsString, WinData.UserDefaultHerdID) then
      begin
         with TQuery.Create(nil) do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('UPDATE tmpCTSOnHolding SET OnHerd=True WHERE Etg=:Etg');
               Params[0].AsString := QueryOnHoldingEtg.AsString;
               ExecSQL;
            finally
               Free;
            end;

         GetHoldingAnimalsDBTableView.DataController.BeginFullUpdate;
         try
            QueryOnHolding.Active := False;
            QueryOnHolding.Active := True;
            QueryOnHolding.Filter := 'OnHoldingType = 1 and OnHerd = False';
            QueryOnHolding.Filtered := True;
         finally
            GetHoldingAnimalsDBTableView.DataController.EndFullUpdate;
         end;

         if QueryOnHolding.RecordCount>0 then
            begin
               StatusBar.Panels[0].Text := Format(cNoOfAnimalsNotFound, [QueryOnHolding.RecordCount]);
            end
         else
            begin
               StatusBar.Panels[0].Text := cAllAnimalsFound;
               MessageDlg(StatusBar.Panels[0].Text,mtInformation,[mbOK],0);
            end;
      end;
end;

procedure TfmCTSCattleOnHolding.UpdateDisplay(ADisplayType: TDisplayType);
begin
   //   14/09/18 [V5.8 R2.8] /MK Change - Show gbMatch if there are animals not found on Kingswood or vice versa.
   gbMatch.Visible := ( ADisplayType in [dtCattleNotFoundInHerd, dtCattleNotFoundOnCTS] );
   //   14/09/18 [V5.8 R2.8] /MK Change - Only show matching objects if there are animals not on Kingswood that are on CTS.
   lMatchAnimalsInfo.Visible := ( ADisplayType = dtCattleNotFoundInHerd );
   btnGetClosetMatch.Visible := lMatchAnimalsInfo.Visible;
   btnAddToHerd.Visible := lMatchAnimalsInfo.Visible;
   if ( ADisplayType in [dtCattleNotFoundInHerd, dtCattleNotFoundOnCTS] ) then
      begin
         pcHerdReconciliation.Height := 293;
         UpdateStatusLabel(cReconcileNotFoundCTS, clRed);
      end
   else
      begin
         pcHerdReconciliation.Height := 387;
         if bSuccess then
            UpdateStatusLabel(cCattleDownloadSuccess, clGreen)
         else
            UpdateStatusLabel(cNoHoldingData, clGreen)
      end;
end;

procedure TfmCTSCattleOnHolding.actReconcileHerdUpdate(Sender: TObject);
begin
   actReconcileHerd.Enabled := bSuccess;
end;

procedure TfmCTSCattleOnHolding.actAddToHerdExecute(Sender: TObject);
var
   NatIdNo : string;
   HerdIdentity : string;
   NewAnimal : TAnimalRecord;
begin
   NatIdNo := QueryOnHoldingEtg.AsString;
   HerdIdentity := HerdLookup.HerdOwnerData.HerdIdentity;
   if MessageDlg(Format('Add selected animal "%s" into herd "%s"',[NatIdNo, HerdIdentity]),mtConfirmation,[mbYes,mbNo],0) = idYes then
       AddAnimal(True);
end;

procedure TfmCTSCattleOnHolding.pcHerdReconciliationPageChanging(
  Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
   lMatchAnimalsInfo.Visible := ( Newpage <> tsDataAnimalsOnHolding );
   btnGetClosetMatch.Visible := lMatchAnimalsInfo.Visible;
   btnAddToHerd.Visible := lMatchAnimalsInfo.Visible;
   pSaleDate.Visible := ( btnAddRemoveAll.Visible ) and ( Newpage = tsDataAnimalsOnHolding );
   pSaleDate.Left := 154;
   deSaleDate.Date := Date;
   if Newpage = tsDataAnimalsOnHolding then
      begin
         btnAddRemoveAll.Glyph := nil;
         btnAddRemoveAll.Action := actRemoveAllFromHerd;
         btnAddRemoveAll.Left := 10;
         StatusBar.Panels[0].Text := Format('Animals not found on CTS data : %d',[HoldingGridDBTableView.DataController.RecordCount]);
         UpdateStatusLabel(cReconcileNotFoundKW, clRed);
      end
   else
      begin
         btnAddRemoveAll.Glyph := nil;
         btnAddRemoveAll.Action := actAddAllToHerd;
         btnAddRemoveAll.Left := 296;
         if ( QueryOnHolding.Active ) and ( QueryOnHolding.RecordCount > 0 ) then
            begin
               StatusBar.Panels[0].Text := Format(cNoOfAnimalsNotFound, [QueryOnHolding.RecordCount]);
               UpdateStatusLabel(cReconcileNotFoundCTS, clRed);
            end
         else
            begin
               UpdateStatusLabel('',clBlack);
               StatusBar.Panels[0].Text := cAllAnimalsFound;
            end;
      end;
end;

procedure TfmCTSCattleOnHolding.actPrintAnimalsOnHoldingExecute(
  Sender: TObject);
begin
   if Length(dxComponentPrinter1.PrintTitle) = 0 then
      dxComponentPrinter1.PrintTitle := 'Kingswood Grid Print';

   cplCattleOnHolding.PrinterPage.PageFooter.LeftTitle.Clear;

   if pcHerdReconciliation.ActivePage = tsBCMSAnimals then
      begin
         cplCattleOnHolding.Component := GetHoldingAnimals;
         cplCattleOnHolding.ReportTitle.Text := tsBCMSAnimals.Caption;
         cplCattleOnHolding.PrinterPage.PageFooter.LeftTitle.Add(Format(' Total Animals: %d', [GetHoldingAnimalsDBTableView.DataController.RecordCount]));
      end
   else if pcHerdReconciliation.ActivePage = tsDataAnimalsOnHolding then
      begin
         cplCattleOnHolding.Component := HoldingGrid;
         cplCattleOnHolding.ReportTitle.Text := tsDataAnimalsOnHolding.Caption;
         cplCattleOnHolding.PrinterPage.PageFooter.LeftTitle.Add(Format(' Total Animals: %d', [HoldingGridDBTableView.DataController.RecordCount]));
      end;

   if not cplCattleOnHolding.PreviewExists then
      cplCattleOnHolding.Preview;
end;

procedure TfmCTSCattleOnHolding.actReconcileOptionsExecute(
  Sender: TObject);
var
   i : Integer;
begin
   FReconcileHerdList := TfmCTSHerdReconcileOptions.GetHerdsToReconcile(True);
end;

procedure TfmCTSCattleOnHolding.actRemoveAllFromHerdExecute(Sender: TObject);
var
   slMemList : TStringList;
   i : Integer;
begin
   slMemList := TStringList.Create();
   try
      FAddRemoveAnimalCount := 0;
      HoldingGridDBTableView.DataController.BeginFullUpdate;
      tmpHoldingData.First;
      while ( not(tmpHoldingData.Eof) ) do
         begin
            SellAnimal;
            tmpHoldingData.Next;
         end;
      HoldingGridDBTableView.DataController.EndFullUpdate;
   finally
      slMemList.Add(Format('%d animals sold.',[FAddRemoveAnimalCount]));
      TfmGeneralMemo.ShowTheForm(slMemList,mtBCMSRec);
      if ( slMemList <> nil ) then
         FreeAndNil(slMemList);
      actReconcileHerd.Execute;
   end;
end;

procedure TfmCTSCattleOnHolding.actAddAllToHerdExecute(Sender: TObject);
var
   slMemList : TStringList;
   i : Integer;
begin
   slMemList := TStringList.Create();
   try
      FAddRemoveAnimalCount := 0;
      GetHoldingAnimalsDBTableView.DataController.BeginFullUpdate;
      QueryOnHolding.First;
      while ( not(QueryOnHolding.Eof) ) do
         begin
            AddAnimal(False);
            QueryOnHolding.Next;
         end;
      GetHoldingAnimalsDBTableView.DataController.EndFullUpdate;
   finally
      slMemList.Add(Format('%d animals added.',[FAddRemoveAnimalCount]));
      for i := 0 to FAddRemoveAnimalList.Count-1 do
         slMemList.Add(FAddRemoveAnimalList.Strings[i]);
      TfmGeneralMemo.ShowTheForm(slMemList,mtBCMSRec);
      if ( slMemList <> nil ) then
         FreeAndNil(slMemList);
      actReconcileHerd.Execute;
   end;
end;

procedure TfmCTSCattleOnHolding.AddAnimal (AIsSingleAnimal : Boolean);
var
   NatIdNo : string;
   HerdIdentity : string;
   NewAnimal : TAnimalRecord;
   Animal : TAnimal;
begin
   NatIdNo := QueryOnHoldingEtg.AsString;

   Animal := GetAnimal(StripAllSpaces(NatIDNo),True,HerdLookup.HerdOwnerData.HerdID);
   if ( Animal <> nil ) then Exit;

   HerdIdentity := HerdLookup.HerdOwnerData.HerdIdentity;

   NewAnimal := TAnimalRecord.Create;
   NewAnimal.ValidateBreed := False;
   NewAnimal.ValidateColour := False;
   NewAnimal.ValidateDOB := False;
   NewAnimal.RaiseExceptions := AIsSingleAnimal;
   NewAnimal.AllowDuplicateTags := WinData.GlobalSettings.AllowDuplicateTags;
   try
      NewAnimal.Add;
      NewAnimal.HerdID := HerdLookup.HerdOwnerData.HerdID;
      NewAnimal.NatIDNum := NatIdNo;
      NewAnimal.DateOfBirth := QueryOnHoldingDOB.AsDateTime;
      if QueryOnHoldingSex.AsString = cSex_Male then
         begin
            if WinData.GlobalSettings.DefaultMaleSex <> '' then
               NewAnimal.Sex := WinData.GlobalSettings.DefaultMaleSex
            else
               NewAnimal.Sex := cSex_Steer; // default to Steer if default male sex value is empty
         end
      else
         NewAnimal.Sex := cSex_Female;
      NewAnimal.InHerd := True;
      NewAnimal.Breeding := False;
      NewAnimal.DamID  := 0;
      NewAnimal.SireID := 0;
      NewAnimal.AnimalDeleted := False;
      NewAnimal.StrPrimBreed := QueryOnHoldingBrd.AsString;
      if ( AIsSingleAnimal ) then
         begin
            if not NewAnimal.Save then
               begin
                  NewAnimal.Cancel;
                  MessageDlg(Format('Animal could not be saved into herd "%s"',[HerdIdentity]),mtError,[mbOK],0);
               end
            else
               begin
                  AnimalDatabaseUpdated := True; // if used to activate Menuform.SetupQuery
                  MessageDlg(Format('Animal successfully saved into herd "%s"',[HerdIdentity]),mtInformation,[mbOK],0);
               end;
         end
      else
         begin
            if ( not(NewAnimal.Save) ) then
               begin
                  NewAnimal.Cancel;
                  FAddRemoveAnimalList.Add(Format('Animal could not be saved into herd "%s"',[HerdIdentity]));
               end
            else
               Inc(FAddRemoveAnimalCount);
         end;
   finally
      FreeAndNil(NewAnimal);
   end;
end;

procedure TfmCTSCattleOnHolding.SellAnimal;
var
   NatIdNo : string;
   HerdIdentity : string;
   SaleDeathEvent : TSaleDeathEvent;
   Animal : TAnimal;
   CustomerRepository : TCustomerRepository;
begin
   NatIdNo := tmpHoldingData.FieldByName('Etg').AsString;
   Animal := GetAnimal(NatIdNo,True,HerdLookup.HerdOwnerData.HerdID);
   if ( Animal = nil ) then Exit;
   CustomerRepository := TCustomerRepository.create(FDatabasePath);
   SaleDeathEvent := TSaleDeathEvent.Create('CTSSale');
   try
      SaleDeathEvent.AllowCancel := False;

      SaleDeathEvent.Append;
      try
         SaleDeathEvent.EventType := TSaleDeath;
         SaleDeathEvent.AnimalID := Animal.Id;
         SaleDeathEvent.EventDate := deSaleDate.Date;
         SaleDeathEvent.AnimalLactNo := Animal.LactNo;
         SaleDeathEvent.AnimalHerdID := HerdLookup.HerdOwnerData.HerdID;
         SaleDeathEvent.EventSource := sCTSRecBlockSale;
         SaleDeathEvent.Customer := CustomerRepository.CreateCustomer('BCMS Reconcile Cust','BCMS','','''','','','','','','',False);
         if WinData.GlobalSettings.RenumAnimalNo then
            begin
               SaleDeathEvent.RenumberAfterPost := True;
               SaleDeathEvent.RenumberFormat := WinData.GlobalSettings.ReNumFormat;
            end;
         SaleDeathEvent.Post;
         Inc(FAddRemoveAnimalCount);
      except
         SaleDeathEvent.Cancel;
      end;
   finally
      FreeAndNil(SaleDeathEvent);
      FreeAndNil(CustomerRepository);
   end;
end;

end.
