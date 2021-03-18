{
   17/05/17 [V5.6 R8.1] /MK Bug Fix - ProcessAnimals - AddCalfRecord - Check to see if the calf exists already and exit out if in the databse and deleted or not in the herd.

   29/05/17 [V5.6 R8.5] /MK Bug Fix - ProcessAnimals - ProcessSaleEvent - Error when animal was already in the herd and posting record to log file - Mt. Melleray Abbey/Monika reported.

   21/07/17 [V5.6 R9.3] /MK Bug Fix - ProcessAnimals - ProcessSaleEvent - Sold was being assigned IsDeath when it should be the reverse.

   24/07/17 [V5.6 R9.4] /MK Change - Made a new event source for AIMHerdRecImport and added it to Purchases, Sales and Calving events.

   01/08/18 [V5.8 R2.2] /MK Additional Feature - ProcessPurchaseEvent/ProcessSaleEvent - Use new uDeptMarts function to get mart name from Dept. mart number.

   02/08/18 [V5.8 R2.2] /MK Additional Feature - ProcessSaleEvent - Use new uDeptFactories function to get factory name from Dept. factory number.

   08/04/19 [V5.8 R8.6] /MK Change - ProcessSaleEvent - PreSale needs to be set here for GetSaleEventInfo to pick up animal.

   17/05/19 [V5.8 R9.2] /MK Additional Feature - ProcessHeiferCalves - New procedure used to process temp movements or sales for heifer calves.
                                               - StartTimerTimer - Process heifer calves before other animals.
                                               - ProcessPurchaseEvent - If the animal is in the herd and has an active temp movement then set moved back date to MovedOn date.
                                               - ProcessSaleEvent - Check if the animal already has an active temp movement event i.e. animal is classed as still off farm.
                                               - ProcessAnimals - Create class that contains all temp movement info.

   06/06/19 [V5.8 R9.3] /MK Change - ProcessHeiferCalves - Changed the classification of a heifer to date of birth within two years of movement date,
                                                           lactation number is zero and the AIM Movement Type is "Farm to Farm" - GL/Danny O'Connell request.

   21/06/19 [V5.8 R9.5] /MK Change - ProcessHeiferCalves - Changed the classification of a heifer to date of birth within 30 months - Donal Kiely/GL.

   06/08/19 [V5.8 R9.8] /MK Additional Feature - For Contract Herds if the user selects the heifer as a contract herd and not store on farm then add the animal to
                                                 an XML file in Kingswood Movements, similar to the user creating a movements out file manually - Captal Farms.

   08/11/19 [V5.9 R1.2] /MK Change - Renumber the animal after the sale.

   27/11/19 [V5.9 R1.3] /MK Change - ProcessAnimals, ProcessPurchaseEvent - Default the Breeding status of the animal depending on HerdType, False if Beef else True - GL/TOK request.

   19/12/19 [V5.9 R1.5] /MK Additional Feature - ProcessPurchaseEvent - Add TBTestDate and BruTest Date to the animal record - John Joe Murphy.

   20/01/20 [V5.9 R1.9] /MK Change - GetAnimal - Exclude animals that were deleted from GetAnimal as HerdRec ignores them to begin with.

   24/01/20 [V5.9 R2.0] /MK Change - ProcessPurchaseEvent - If the HerdType is Beef then default the lactno to zero, else calculate lactNo - Una Carter.

   03/03/21 [V5.9 R9.2] /MK Additional Feature - ProcessAnimals - If a bull is bought into the herd set its animal number to last 5 digits and set it as breeding.
}

unit uAIMHerdRecImport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxControls, cxContainer, cxEdit, cxLabel, cxProgressBar,
  MSXML2_TLB, uXMLDOMHelper, db, dbTables, uAnimal, GenTypesConst,
  KRoutines, uEventDataHelper, uCustomerRepository, uSupplierRepository,
  uApplicationLog, EventRecording, ExtCtrls, uHerdLookup,
  uDeptMarts, uDeptFactories, DateUtil, uAIMHeifTempTransfers,
  uCreateAnimalXMLIHMFileProgress, uPreferences;

type
  TfmAIMHerdRecImport = class(TForm)
    lProgress: TcxLabel;
    pbImportProgress: TcxProgressBar;
    StartTimer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure StartTimerTimer(Sender: TObject);
  private
    { Private declarations }
    FFileName : String;
    FDocument : IXMLDOMDocument;
    FAnimalsNodeList : IXMLDOMNodeList;
    FRootNode,
    FChildNode,
    FDam,
    FSire,
    FAnimalsRootNode,
    FMovementsRootNode,
    FAnimal,
    FMovement : IXMLDOMNode;
    FHerdID : Integer;
    FEventDataHelper : TEventDataHelper;
    FTempAnimals : TTable;
    FAnimalsCreated : Boolean;
    FCustomerRepository : TCustomerRepository;
    FSupplierRepository : TSupplierRepository;
    FDatabasePath : string;
    FTempQuery : TQuery;
    FHerdType : THerdType;
    FRenumberAfterSale : Boolean;
    FRenumberFormat : String;
    FPreferences : TPreferences;
    procedure ProcessXMLFile;
    procedure ProcessAnimals;
    function GetHerdId(const ABTEHerdNo : string) : Integer;
    function GetAnimal(ANatIdNo: string; AInHerd: Boolean; const APurchDate: TDateTime = 0): TAnimal;
    function ValidateAnimalDetails: Boolean;
    procedure CreateTempTable;
    function GetBreedIdFromCode(ABreedCode: string): Integer;
    procedure ProcessHeiferCalves;
  public
    { Public declarations }
    class procedure ShowTheForm (AHerdRecFile : String);
  end;

var
  fmAIMHerdRecImport: TfmAIMHerdRecImport;

const
  cSaleMovementType = 1;
  cPurchMovementType = 2;

implementation

{$R *.DFM}

{ TfmAIMHerdRecImport }

class procedure TfmAIMHerdRecImport.ShowTheForm(AHerdRecFile: String);
begin
   with TfmAIMHerdRecImport.Create(nil) do
      try
         FFileName := AHerdRecFile;
         FAnimalsCreated := False;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmAIMHerdRecImport.FormCreate(Sender: TObject);
begin
   FEventDataHelper := TEventDataHelper.Create();
   FDatabasePath := IncludeTrailingBackSlash(DefaultDirectory) + DataDir;
   FCustomerRepository := TCustomerRepository.create(FDatabasePath);
   FSupplierRepository := TSupplierRepository.create(FDatabasePath);
   FTempQuery := TQuery.Create(nil);
   FTempQuery.DatabaseName := AliasName;

   FRenumberAfterSale := False;
   FRenumberFormat := '';
   FPreferences := TPreferences.Create(cGSRegPathHerd,UPPERCASE(ExtractDirFromPath(kRoutines.DataPath)),'');
   try
      FRenumberAfterSale := FPreferences.ValueAsBoolean[cGSRenumberAnimalNo];
      FRenumberFormat := FPreferences.ValueAsString[cGSReNumFormat];
   finally
      if ( FPreferences <> nil ) then
         FreeAndNil(FPreferences);
   end;

   CreateTempTable;
end;

procedure TfmAIMHerdRecImport.FormActivate(Sender: TObject);
begin
   Update;
   Application.ProcessMessages;
   StartTimer.Enabled := True;
end;

procedure TfmAIMHerdRecImport.StartTimerTimer(Sender: TObject);
begin
   StartTimer.Enabled := False;
   ProcessXMLFile;
   //   17/05/19 [V5.8 R9.2] /MK Additional Feature - Process heifer calves before other animals.
   ProcessHeiferCalves;
   ProcessAnimals;
   Close;
end;

procedure TfmAIMHerdRecImport.CreateTempTable;
begin
   FTempAnimals := TTable.Create(nil);
   FTempAnimals.DatabaseName := AliasName;
   FTempAnimals.TableName := 'tmpHerdRec';
   FTempAnimals.FieldDefs.Add('ID',ftAutoInc);
   FTempAnimals.FieldDefs.Add('NatIDNum',ftString,20);
   FTempAnimals.FieldDefs.Add('DateOfBirth',ftDate);
   FTempAnimals.FieldDefs.Add('Sex',ftString,10);
   FTempAnimals.FieldDefs.Add('BreedCode',ftString,3);
   FTempAnimals.FieldDefs.Add('BreedID',ftInteger);
   FTempAnimals.FieldDefs.Add('TBTestDate',ftDate);
   FTempAnimals.FieldDefs.Add('BruTestDate',ftDate);
   FTempAnimals.FieldDefs.Add('DamNatID',ftString,20);
   FTempAnimals.FieldDefs.Add('SireCode',ftString,10);
   FTempAnimals.FieldDefs.Add('AIMMoveType',ftString,30);
   FTempAnimals.FieldDefs.Add('MovementType',ftInteger);
   FTempAnimals.FieldDefs.Add('MovementDate',ftDate);
   FTempAnimals.FieldDefs.Add('MovedFrom',ftString,30);
   FTempAnimals.FieldDefs.Add('MovedTo',ftString,30);
   FTempAnimals.FieldDefs.Add('IsDeath',ftBoolean);
   FTempAnimals.CreateTable;
   FTempAnimals.Open;
end;

procedure TfmAIMHerdRecImport.ProcessXMLFile;
var
   i, j, k, l : Integer;
   sHerdNo : String;
   Animal : TAnimal;
   bValidAnimal : Boolean;
begin
   FDocument := TXMLDOMHelper.LoadDocument(FFileName);
   if ( FDocument = nil ) then
      begin
         MessageDlg(Format('Failed to load file %s',[FFileName]),mtError,[mbOK],0);
         Exit;
      end;

   FRootNode := FDocument.documentElement;
   if ( FRootNode = nil ) then
      begin
         MessageDlg('Document root was not found.',mtError,[mbOK],0);
         Exit;
      end;

   FChildNode := FRootNode.selectSingleNode('herdNumber');
   if ( FChildNode = nil ) then
      begin
         MessageDlg('Herd Number element was not found.',mtError,[mbOK],0);
         Exit;
      end;

   sHerdNo := FChildNode.text;
   FHerdId := GetHerdId(sHerdNo);
   if ( FHerdId <= 0 ) then
      begin
         MessageDlg(Format('Could not locate Herd Number on file - "%s".',[FChildNode.text]),mtError,[mbOK],0);
         Exit;
      end;
   FHerdType := HerdLookup.GetHerdType(FHerdID);

   FAnimalsRootNode := FRootNode.selectSingleNode('animals');
   FAnimalsNodeList := FAnimalsRootNode.selectNodes('animal');
   try
      if ( FAnimalsNodeList.length = 0 ) then Exit;

      pbImportProgress.Properties.Min := 1;
      pbImportProgress.Properties.Max := FAnimalsNodeList.length;
      pbImportProgress.Position := 1;
      Update;
      Application.ProcessMessages;
      lProgress.Caption := 'Importing Herd Reconcile...';

      for i := 0 to FAnimalsNodeList.length-1 do
         begin
            Update;
            Application.ProcessMessages;

            FAnimal := FAnimalsNodeList.item[i];
            if (FAnimal = nil) then continue;

            FTempAnimals.Append;
            try
               bValidAnimal := True;
               for j := 0 to FAnimal.childNodes.Get_length-1 do
                  begin
                     FChildNode := FAnimal.childNodes[j];
                     if ( FChildNode  = nil ) or ( Length(FChildNode.text) = 0) then continue;

                     if ( FChildNode.nodeName = 'tagNum' ) then
                        FTempAnimals.FieldByName('NatIDNum').AsString := FChildNode.text
                     else if ( FChildNode.nodeName = 'sex' ) then
                        begin
                           bValidAnimal := ( Length(FChildNode.text) > 0 );
                           if ( bValidAnimal ) then
                              begin
                                 if ( UpperCase(Trim(FChildNode.text)) = 'M') then
                                    FTempAnimals.FieldByName('Sex').AsString := 'Bull'
                                 else
                                    FTempAnimals.FieldByName('Sex').AsString := 'Female';
                              end;
                        end
                     else if ( FChildNode.nodeName = 'breed' ) then
                        begin
                           bValidAnimal := ( Length(FChildNode.text) > 0 );
                           if ( bValidAnimal ) then
                              begin
                                 FTempAnimals.FieldByName('BreedCode').AsString := FChildNode.text;
                                 FTempAnimals.FieldByName('BreedID').AsInteger := GetBreedIdFromCode(FChildNode.Text);
                              end;
                        end
                     else if ( FChildNode.nodeName = 'dob' ) then
                        begin
                           bValidAnimal := ( Length(FChildNode.text) > 0 );
                           if ( bValidAnimal ) then
                              FTempAnimals.FieldByName('DateOfBirth').AsDateTime := StrToDate(FChildNode.text)
                        end
                     else if ( FChildNode.nodeName = 'tbTestDate' ) then
                        FTempAnimals.FieldByName('TBTestDate').AsDateTime := StrToDate(FChildNode.text)
                     else if ( FChildNode.nodeName = 'brTestDate' ) then
                        FTempAnimals.FieldByName('BruTestDate').AsDateTime := StrToDate(FChildNode.text);

                     if ( not(ValidateAnimalDetails) ) then
                        Continue;

                     if ( not(bValidAnimal) ) then
                        ApplicationLog.LogInfo(Format('Animal %s does not have a complete AIM record.',[FTempAnimals.FieldByName('NatIDNum').AsString]));

                     if ( Length(FTempAnimals.FieldByName('DamNatID').AsString) = 0 ) then
                        begin
                           FDam := FAnimal.selectSingleNode('dam');
                           if ( FDam <> nil ) then
                              begin
                                 FChildNode := FDam.childNodes[0];
                                 if ( FChildNode.nodeName = 'natIdNo' ) and ( Length(FChildNode.text) > 0 ) then
                                    FTempAnimals.FieldByName('DamNatID').AsString := FChildNode.text;
                              end;
                        end;
                     if ( Length(FTempAnimals.FieldByName('SireCode').AsString) = 0 ) then
                        begin
                           FSire := FAnimal.selectSingleNode('sire');
                           if ( FSire <> nil ) then
                              begin
                                 FChildNode := FSire.childNodes[0];
                                 if ( FChildNode.nodeName = 'aiCode' ) and ( Length(FChildNode.text) > 0 ) then
                                    FTempAnimals.FieldByName('SireCode').AsString := FChildNode.text;
                              end;
                        end;
                     if ( Length(FTempAnimals.FieldByName('MovedFrom').AsString) = 0 ) or
                        ( Length(FTempAnimals.FieldByName('MovedTo').AsString) = 0 ) then
                        begin
                           FMovementsRootNode := FAnimal.selectSingleNode('movements');
                           if ( FMovementsRootNode <> nil ) then
                              begin
                                 FMovement := FMovementsRootNode.selectSingleNode('movement');
                                 if ( FMovement <> nil ) then
                                    for k := 0 to FMovement.childNodes.Get_length-1 do
                                       begin
                                          FChildNode := FMovement.childNodes[k];
                                          if ( FChildNode <> nil ) then
                                             begin
                                                if ( FChildNode.nodeName = 'moveDate' ) and ( Length(FChildNode.text) > 0 ) then
                                                   FTempAnimals.FieldByName('MovementDate').AsDateTime := StrToDate(FChildNode.text);

                                                if ( FChildNode.nodeName = 'movedFrom' ) and ( Length(FChildNode.text) > 0 ) then
                                                   FTempAnimals.FieldByName('MovedFrom').AsString := FChildNode.text;
                                                if ( FChildNode.nodeName = 'movedTo' ) and ( Length(FChildNode.text) > 0 ) then
                                                   FTempAnimals.FieldByName('MovedTo').AsString := FChildNode.text;
                                                if ( FTempAnimals.FieldByName('MovedFrom').AsString = sHerdNo ) then
                                                   FTempAnimals.FieldByName('MovementType').AsInteger := cSaleMovementType
                                                else if ( FTempAnimals.FieldByName('MovedTo').AsString = sHerdNo ) then
                                                   FTempAnimals.FieldByName('MovementType').AsInteger := cPurchMovementType;

                                                if ( FChildNode.nodeName = 'moveType' ) and ( Length(FChildNode.text) > 0 ) then
                                                   FTempAnimals.FieldByName('AIMMoveType').AsString := FChildNode.text;

                                                if ( FChildNode.nodeName = 'isDeath' ) and ( Length(FChildNode.text) > 0 ) then
                                                   FTempAnimals.FieldByName('IsDeath').AsBoolean := ( UpperCase(FChildNode.text) = 'TRUE' )
                                                else
                                                   FTempAnimals.FieldByName('IsDeath').AsBoolean := False;
                                             end;
                                       end;
                              end;
                        end;
                  end;

               if ( FTempAnimals.State in dsEditModes ) then
                  FTempAnimals.Post;

               pbImportProgress.Position := pbImportProgress.Position+1;
            except
               on e : Exception do
                  begin
                     FTempAnimals.Cancel;
                     ApplicationLog.LogException(e);
                  end;
            end;

         end;

   finally
      FTempAnimals.Close;
      FTempAnimals.Open;
      FAnimalsCreated := ( FTempAnimals.RecordCount = FAnimalsNodeList.length );

      FDocument := nil;
      FAnimalsNodeList := nil;
      FRootNode := nil;
      FChildNode := nil;
      FDam := nil;
      FSire := nil;
      FAnimalsRootNode := nil;
      FMovementsRootNode := nil;
      FAnimal := nil;
      FMovement := nil;
   end;
end;

function TfmAIMHerdRecImport.GetHerdId(const ABTEHerdNo: string): Integer;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT Id');
         SQL.Add('FROM Owners');
         SQL.Add('WHERE UPPER(TRIM(HerdIdentity)) =:ABTEHerdNo');
         Params[0].AsString := UpperCase(Trim(ABTEHerdNo));
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

function TfmAIMHerdRecImport.GetAnimal(ANatIdNo: string; AInHerd : Boolean; const APurchDate: TDateTime = 0) : TAnimal;
begin
   Result := nil;
   ANatIDNo := StripIrishCountryPrefixFromNatID(StripAllSpaces(UpperCase(ANatIdNo)));
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE (SearchNatID LIKE "%'+ANatIdNo+'%")');
         SQL.Add('AND   (HerdId =:AHerdId)');

         //   20/01/20 [V5.9 R1.9] /MK Change - Exclude animals that were deleted from GetAnimal as HerdRec ignores them to begin with.
         SQL.Add('AND   (AnimalDeleted = False)');

         if AInHerd then
            SQL.Add('AND   (InHerd = True)')
         else
            SQL.Add('AND   (InHerd = False)');
         Params[0].AsInteger := FHerdId;
         Open;
         try
            First;
            // Check if animal is in the herd already.
            if ( (FieldByName('Id').AsInteger > 0) and (AInHerd) ) or
               // Or check if the animal is not in the herd but has the same purchase date as the purchase date coming in from AIM.
               ( (FieldByName('Id').AsInteger > 0) and (not(AInHerd)) and
                 ((FEventDataHelper.GetLastEventDate(FieldByName('Id').AsInteger,CPurchaseEvent) = APurchDate) or
                  (FEventDataHelper.GetLastEventDate(FieldByName('Id').AsInteger,CSaleDeathEvent) >= APurchDate)) ) then
               begin
                  Result := TAnimal.Create;
                  if FindField('Id') <> nil then
                     Result.Id := FieldByName('Id').AsInteger;

                  if FindField('HerdId') <> nil then
                     Result.HerdId := FieldByName('HerdId').AsInteger;

                  if FindField('NatIdNum') <> nil then
                     Result.NatIdNum := FieldByName('NatIdNum').AsString;

                  if FindField('SortNatId') <> nil then
                     Result.SortNatIdNum := FieldByName('SortNatId').AsString;

                  if FindField('AnimalNo') <> nil then
                     Result.AnimalNo := FieldByName('AnimalNo').AsString;

                  if FindField('Sex') <> nil then
                     Result.Sex := FieldByName('Sex').AsString;

                  if FindField('DateOfBirth') <> nil then
                     Result.DateOfBirth := FieldByName('DateOfBirth').AsDateTime;

                  if FindField('LactNo') <> nil then
                     Result.LactNo := FieldByName('LactNo').AsInteger;

                  if FindField('BreedCode') <> nil then
                     Result.BreedCode := FieldByName('BreedCode').AsString;
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfmAIMHerdRecImport.ProcessAnimals;
var
   i : Integer;
   qCalving : TQuery;
   TempTransferInfo : TTempMovementInfo;

   procedure ProcessPurchaseEvent;
   var
      Animal : TAnimal;
      AnimalRecord : TAnimalRecord;
      PurchaseEvent : TPurchaseEvent;
      NoOfYears,
      iMovedFromID : Integer;
      sNatID,
      sMovedFrom,
      sMovedFromHerdID,
      Error : String;
   begin
      sNatID := FTempAnimals.FieldByName('NatIDNum').AsString;
      Animal := GetAnimal(sNatID,True);
      if (Animal <> nil) then
         begin
            //   17/05/19 [V5.8 R9.2] /MK Additional Feature - If the animal is in the herd and has an active temp movement then set moved back date to MovedOn date.
            if ( TempTransferInfo.BringBackAnimal(Animal.Id,FTempAnimals.FieldByName('MovementDate').AsDateTime) ) then
               begin
                  ApplicationLog.LogInfo(Format('Animal %s temp movement back in date updated to %s.',[Animal.NatIdNum,DateToStr(FTempAnimals.FieldByName('MovementDate').AsDateTime)]));
                  FreeAndNil(Animal);
                  Exit;
               end;
            Error := Format('Could not create Purchase event for animal (%s). Animal is already in the herd.',[sNatID]);
            ApplicationLog.LogInfo(Error);
            FreeAndNil(Animal);
            Exit;
         end;

      Animal := GetAnimal(sNatID,False,FTempAnimals.FieldByName('MovementDate').AsDateTime);
      if (Animal <> nil) then
         begin
            if ( FEventDataHelper.GetLastEventDate(Animal.Id,CSaleDeathEvent) >= FTempAnimals.FieldByName('MovementDate').AsDateTime ) then
               Error := Format('Could not create Purchase event for animal (%s). Animal sold on or after this purchase date.',[sNatID])
            else
               Error := Format('Could not create Purchase event for animal (%s). Animal already purchased on this purchase date.',[sNatID]);
            ApplicationLog.LogInfo(Error);
            FreeAndNil(Animal);
            Exit;
         end;

      sMovedFrom := FTempAnimals.FieldByName('MovedFrom').AsString;
      iMovedFromID := FSupplierRepository.GetSupplier(sMovedFrom);
      if ( iMovedFromID = 0 ) then
         begin
            sMovedFromHerdID := sMovedFrom;
             // Get the name of the Mart if the sMovedTo exists in Dept list of Mart numbers.
            sMovedFrom := GetMartNameInArrayFromNumber(sMovedFromHerdID);
            iMovedFromID := FSupplierRepository.CreateSupplier(sMovedFrom,sMovedFromHerdID,'','','','','','','','AIM Download',true);
         end
      else if ( iMovedFromID > 0 ) then
         begin
            sMovedFromHerdID := sMovedFrom;
            sMovedFrom := '';
            sMovedFrom := GetMartNameInArrayFromNumber(sMovedFromHerdID);
            if ( sMovedFrom <> sMovedFromHerdID ) and ( Length(sMovedFrom) > 0 ) then
               begin
                  FTempQuery.Close;
                  FTempQuery.SQL.Clear;
                  FTempQuery.SQL.Add('UPDATE SuppliersBreeders');
                  FTempQuery.SQL.Add('SET Name = :NewName');
                  FTempQuery.SQL.Add('WHERE ID = :SupID');
                  FTempQuery.Params[0].AsString := sMovedFrom;
                  FTempQuery.Params[1].AsInteger := iMovedFromID;
                  FTempQuery.ExecSQL;
               end;
         end;

      try
         AnimalRecord := TAnimalRecord.Create('');
         AnimalRecord.ValidateIDTags := False;
         AnimalRecord.ValidateBreed := False;
         AnimalRecord.ValidateColour := False;
         AnimalRecord.ValidateDOB := False;
         AnimalRecord.AllowDuplicateTags := True;
         try
            AnimalRecord.Add;
            AnimalRecord.HerdID := FHerdID;
            AnimalRecord.NatIDNum := sNatID;
            AnimalRecord.DateOfBirth := FTempAnimals.FieldByName('DateOfBirth').AsDateTime;
            AnimalRecord.Sex := FTempAnimals.FieldByName('Sex').AsString;
            AnimalRecord.Breeding := False;

            //   03/03/21 [V5.9 R9.2] /MK Additional Feature - If a bull is bought into the herd set its animal number to last 5 digits and set it as breeding.
            if ( UpperCase(AnimalRecord.Sex) = 'BULL' ) and ( FHerdType = htDairy ) then
               begin
                  AnimalRecord.Breeding := True;
                  AnimalRecord.AnimalNo := Copy(StripAllSpaces(AnimalRecord.NatIDNum),Length(StripAllSpaces(AnimalRecord.NatIDNum))-4,5)
               end;

            //   24/01/20 [V5.9 R2.0] /MK Change - If the HerdType is Beef then default the lactno to zero, else calculate lactNo - Una Carter.
            if ( FHerdType = htBeef ) then
               AnimalRecord.LactNo := 0
            else
               begin
                  if ( UpperCase(FTempAnimals.FieldByName('Sex').AsString) = 'FEMALE' ) and
                     ( FTempAnimals.FieldByName('DateOfBirth').AsDateTime > 0 ) then
                     begin
                        NoOfYears := Trunc(((Date - FTempAnimals.FieldByName('DateOfBirth').AsDateTime) / 365 ));
                        NoOfYears := NoOfYears - 2;
                        if ( NoOfYears > 0 ) then
                           AnimalRecord.LactNo := NoOfYears;
                     end;
                  AnimalRecord.Breeding := True;
               end;

            //   27/11/19 [V5.9 R1.3] /MK Change - Default the Breeding status of the animal depending on HerdType, False if Beef else True - GL/TOK request.
            //AnimalRecord.Breeding := ( FHerdType <> htBeef );

            //   19/12/19 [V5.9 R1.5] /MK Additional Feature - Add TBTestDate and BruTest Date to the animal record - John Joe Murphy.
            if ( FTempAnimals.FieldByName('TBTestDate').AsDateTime > 0 ) then
               AnimalRecord.TBTestDate := FTempAnimals.FieldByName('TBTestDate').AsDateTime;
            if ( FTempAnimals.FieldByName('BruTestDate').AsDateTime > 0 ) then
               AnimalRecord.Brucellosis := FTempAnimals.FieldByName('BruTestDate').AsDateTime;

            AnimalRecord.InHerd := True;
            AnimalRecord.PrimaryBreed := FTempAnimals.FieldByName('BreedID').AsInteger;
            AnimalRecord.IsSynchronized := False;
            AnimalRecord.Save;
         except
            on e : exception do
               begin
                  Error := Format('%s: Failed to create animal record.',[sNatID]);
                  AnimalRecord.Cancel;
                  ApplicationLog.LogException(e);
               end;
         end;

         if ( AnimalRecord.AnimalSaved ) then
            begin
               PurchaseEvent := TPurchaseEvent.Create('AIMPURCH');
               try
                  PurchaseEvent.Append;
                  try
                     PurchaseEvent.EventType := TPurchase;
                     PurchaseEvent.AnimalID := AnimalRecord.ID;
                     PurchaseEvent.AnimalLactNo := AnimalRecord.LactNo;
                     PurchaseEvent.AnimalHerdID := AnimalRecord.HerdID;
                     PurchaseEvent.EventSource  := sAIMHERDRECIMPORT;
                     PurchaseEvent.EventDate := FTempAnimals.FieldByName('MovementDate').AsDateTime;
                     PurchaseEvent.Supplier := iMovedFromID;
                     PurchaseEvent.IsSynchronized := False;
                     PurchaseEvent.Post;
                  except
                     on e : Exception do
                        begin
                           Error := Format('%s: Failed to create Purchase Event.',[sNatId]);
                           ApplicationLog.LogError(Error);
                           PurchaseEvent.Cancel;
                        end
                  end;
               finally
                  FreeAndNil(PurchaseEvent);
               end;
            end;
      finally
         FreeAndNil(AnimalRecord);
         if ( Animal <> nil ) then
            FreeAndNil(Animal);
      end;
   end;

   procedure ProcessSaleEvent;
   var
      Animal : TAnimal;
      iMovedToID : Integer;
      sMovedTo,
      sMovedToHerdID : String;
      SaleDeathEvent : TSaleDeathEvent;
      sSaleError : String;
   begin
      Animal := GetAnimal(FTempAnimals.FieldByName('NatIDNum').AsString,True);
      if ( Animal = nil ) then
         begin
            ApplicationLog.LogInfo(Format('Animal %s is not in the herd.',[FTempAnimals.FieldByName('NatIDNum').AsString]));
            Exit;
         end;

      //   17/05/19 [V5.8 R9.2] /MK Additional Feature - Check if the animal already has an active temp movement event i.e. animal is classed as still off farm.
      if ( TempTransferInfo.GetIsStillOffFarm(Animal.Id) ) then
         begin
            ApplicationLog.LogInfo(Format('Animal %s has an active temp movement.',[FTempAnimals.FieldByName('NatIDNum').AsString]));
            Exit;
         end;

      sMovedTo := FTempAnimals.FieldByName('MovedTo').AsString;
      iMovedToID := FCustomerRepository.GetCustomer(sMovedTo);
      if ( iMovedToID = 0 ) then
         begin
            sMovedToHerdID := sMovedTo;
            // Get the name of the Mart if the sMovedTo exists in Dept list of Mart numbers.
            sMovedTo := GetMartNameInArrayFromNumber(sMovedToHerdID);
            // Get the name of the Factory if the sMovedTo exists in Dept list of Factory numbers.
            sMovedTo := GetFactoryNameFromDeptNumber(sMovedToHerdID);
            iMovedToID := FCustomerRepository.CreateCustomer(sMovedTo,sMovedToHerdID,'','','','','','','','AIM Download',true);
         end
      else if ( iMovedToID > 0 ) then
         begin
            sMovedToHerdID := sMovedTo;
            sMovedTo := '';
            sMovedTo := GetMartNameInArrayFromNumber(sMovedToHerdID);
            if ( Length(sMovedTo) = 0 ) then
               sMovedTo := GetFactoryNameFromDeptNumber(sMovedToHerdID);
            if ( Length(sMovedTo) > 0 ) and ( sMovedTo <> sMovedToHerdID ) then
               begin
                  FTempQuery.Close;
                  FTempQuery.SQL.Clear;
                  FTempQuery.SQL.Add('UPDATE Customers');
                  FTempQuery.SQL.Add('SET Name = :NewName');
                  FTempQuery.SQL.Add('WHERE ID = :CustID');
                  FTempQuery.Params[0].AsString := sMovedTo;
                  FTempQuery.Params[1].AsInteger := iMovedToID;
                  FTempQuery.ExecSQL;
               end;
         end;

      SaleDeathEvent := TSaleDeathEvent.Create('AIMSALE');
      try
         SaleDeathEvent.Append;
         try
            SaleDeathEvent.CanCheckWeaning := False;
            SaleDeathEvent.EventType := TSaleDeath;
            SaleDeathEvent.AnimalID := Animal.Id;
            SaleDeathEvent.AnimalLactNo := Animal.LactNo;
            SaleDeathEvent.AnimalHerdID := Animal.HerdId;
            SaleDeathEvent.EventSource  := sAIMHERDRECIMPORT;
            SaleDeathEvent.EventDate := FTempAnimals.FieldByName('MovementDate').AsDateTime;
            //   21/07/17 [V5.6 R9.3] /MK Bug Fix - Sold was being assigned IsDeath when it should be the reverse.
            SaleDeathEvent.Sold := ( not(FTempAnimals.FieldByName('IsDeath').AsBoolean) );
            //   08/04/19 [V5.8 R8.6] /MK Change - PreSale needs to be set here for GetSaleEventInfo to pick up animal.
            SaleDeathEvent.PreSale := False;
            SaleDeathEvent.Customer := iMovedToID;
            if ( FTempAnimals.FieldByName('IsDeath').AsBoolean ) then
               SaleDeathEvent.EventComment := 'Death'
            else
               SaleDeathEvent.EventComment := 'Sale';
            SaleDeathEvent.IsSynchronized := False;
            SaleDeathEvent.RenumberAfterPost := FRenumberAfterSale;
            SaleDeathEvent.RenumberFormat := FRenumberFormat;
            SaleDeathEvent.Post;
         except
            on e : Exception do
               begin
                  sSaleError := Format('%s: Failed to create Sale/Death Event.', [FTempAnimals.FieldByName('NatIDNum').AsString]);
                  ApplicationLog.LogError(sSaleError);
                  ApplicationLog.LogException(e);
                  SaleDeathEvent.Cancel;
               end
         end;
      finally
         FreeAndNil(SaleDeathEvent);
         FreeAndNil(Animal);
      end;
   end;

   function GetSireID (ASireNo : String) : Integer;
   begin
      Result := 0;
      if ( Length(ASireNo) = 0 ) then Exit;
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT ID');
            SQL.Add('FROM Animals');
            SQL.Add('WHERE Upper(Sex) = "BULL"');
            SQL.Add('AND   ( (Upper(AnimalNo) = "'+UpperCase(ASireNo)+'") OR');
            SQL.Add('        (SortNatID = "'+CreateSortNatIDString(ASireNo,FHerdId)+'") )');
            try
               Open;
               if ( RecordCount = 0 ) then Exit;
               if ( Fields[0].AsInteger = 0 ) then Exit;
               Result := Fields[0].AsInteger;
            except
            end;
         finally
            Free;
         end;
   end;

   procedure ProcessCalvingEvent;
   var
      CalvingEvent : TCalvingEvent;
      CalfInfo,
      DamInfo : TAnimal;
      iCalfIndex,
      iExistCalvingID,
      iNewCalfID : Integer;
      dLastCalvingDate : TDateTime;

      procedure StoreCalfIdInCalvingsTable();
      var
         j, iCalfID : Integer;
         sFieldName,
         sComment : string;
         qLookupCalving,
         qUpdateCalving : TQuery;
      begin
         qLookupCalving := TQuery.Create(nil);
         with qLookupCalving do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('SELECT ID1, ID2, ID3, ID4');
               SQL.Add('FROM Calvings');
               SQL.Add('WHERE EventID = '+IntToStr(iExistCalvingID)+'');
               SQL.Add('AND ( ( (ID1 = 0) OR (ID1 IS NULL) )  ');
               SQL.Add('OR    ( (ID2 = 0) OR (ID2 IS NULL) )  ');
               SQL.Add('OR    ( (ID3 = 0) OR (ID3 IS NULL) )  ');
               SQL.Add('OR    ( (ID4 = 0) OR (ID4 IS NULL) ) )');
               Open;
               try
                  if ( iNewCalfID <> qLookupCalving.FieldByName('ID1').AsInteger ) and
                     ( iNewCalfID <> qLookupCalving.FieldByName('ID2').AsInteger ) and
                     ( iNewCalfID <> qLookupCalving.FieldByName('ID3').AsInteger ) and
                     ( iNewCalfID <> qLookupCalving.FieldByName('ID4').AsInteger ) then
                     begin
                        for j := 0 to qLookupCalving.FieldCount-1 do
                          begin
                             sFieldName := UpperCase(qLookupCalving.Fields[j].FieldName);
                             if ((sFieldName = 'ID1') or (sFieldName = 'ID2') or
                                 (sFieldName = 'ID3') or (sFieldName = 'ID4')) and
                                 ( qLookupCalving.Fields[j].AsInteger = 0 ) then
                              begin
                                 qUpdateCalving := TQuery.Create(nil);
                                 with qUpdateCalving do
                                    try
                                       DatabaseName := AliasName;
                                       SQL.Clear;
                                       SQL.Add('UPDATE Calvings');
                                       SQL.Add('SET '+sFieldName+' =:CalfID,');
                                       SQL.Add('    CalfDead'+Copy(sFieldName,3,1)+' =:CalfDead');
                                       SQL.Add('WHERE EventID =:EventId');
                                       Params[0].AsInteger := iNewCalfID;
                                       Params[1].AsBoolean := False;
                                       Params[2].AsInteger := iExistCalvingID;
                                       ExecSQL;
                                    finally
                                       Free;
                                    end;
                                 Break;
                              end;
                          end;
                     end;
                  if ( Active ) then
                     Close;
                  SQL.Clear;
                  case StrToInt(Copy(sFieldName,3,1)) of
                      1 : sComment := 'Calving';
                      2 : sComment := 'Calving/Twin';
                      3 : sComment := 'Calving/Triplet';
                      4 : sComment := 'Calving/Quad';
                  end;
                  SQL.Add('UPDATE Events SET EventDesc = "'+sComment+'" WHERE ID = '+IntToStr(iExistCalvingID)+'');
                  ExecSQL;
               finally
                  if ( Active ) then
                     Close;
               end;
            finally
               FreeAndNil(qLookupCalving);
            end;
      end;

      procedure AddCalfRecord;
      var
         CalfRecord : TAnimalRecord;
      begin
         CalfRecord := TAnimalRecord.Create('');
         try
            CalfRecord.Add;
            CalfRecord.HerdID := FHerdID;
            CalfRecord.NatIDNum := FTempAnimals.FieldByName('NatIDNum').AsString;
            CalfRecord.DateOfBirth := FTempAnimals.FieldByName('DateOfBirth').AsDateTime;
            CalfRecord.Sex := FTempAnimals.FieldByName('Sex').AsString;
            CalfRecord.PrimaryBreed := FTempAnimals.FieldByName('BreedID').AsInteger;
            if ( DamInfo <> nil ) then
               CalfRecord.DamID := DamInfo.Id;
            CalfRecord.SireID := GetSireID(FTempAnimals.FieldByName('SireCode').AsString);
            CalfRecord.Breeding := UpperCase(CalfRecord.Sex) = 'FEMALE';;
            CalfRecord.IsSynchronized := False;
            try
               if ( CalfRecord.Save ) then
                  iNewCalfID := CalfRecord.ID;
            except
               on e : Exception do
                  ApplicationLog.LogException(e);
            end
         finally
            FreeAndNil(CalfRecord);
         end;
      end;

   begin
      try
         //   17/05/17 [V5.6 R8.1] /MK Bug Fix - Check to see if the calf exists already and exit out if in the databse and deleted or not in the herd.
         try
            CalfInfo := GetAnimal(FTempAnimals.FieldByName('NatIDNum').AsString,True);
            if ( CalfInfo = nil ) then
               CalfInfo := GetAnimal(FTempAnimals.FieldByName('NatIDNum').AsString,False);
            if ( CalfInfo <> nil ) then
               begin
                  // If the animal is in the database and is deleted then put a message in the log file and exit out.
                  if ( CalfInfo.AnimalDeleted ) then
                     begin
                        ApplicationLog.LogInfo(Format('Calf NatID %s is already in the database but is deleted.',[FTempAnimals.FieldByName('NatIDNum').AsString]));
                        Exit;
                     end;
                  // If the animal is in the database and is not in herd then put a message in the log file and exit out.
                  if ( not(CalfInfo.InHerd) ) then
                     begin
                        ApplicationLog.LogInfo(Format('Calf NatID %s is already in the database but is not in herd.',[FTempAnimals.FieldByName('NatIDNum').AsString]));
                        Exit;
                     end;
               end;
         finally
            if ( CalfInfo <> nil ) then
               FreeAndNil(CalfInfo);
         end;

         // If the cow is not on the file and there is no movement type then just record the calf record.
         if ( Length(FTempAnimals.FieldByName('DamNatID').AsString) = 0 )  or ( FHerdType = htBeef ) then
            begin
               AddCalfRecord;
               Exit;
            end;

         DamInfo := GetAnimal(FTempAnimals.FieldByName('DamNatID').AsString,True);
         if ( DamInfo = nil ) then
            begin
               AddCalfRecord;
               Exit;
            end;

         iExistCalvingID := FEventDataHelper.GetEventID(DamInfo.Id,DamInfo.LactNo,CCalvingEvent,
                                                        FTempAnimals.FieldByName('DateOfBirth').AsDateTime);
         dLastCalvingDate := FEventDataHelper.GetLastEventDate(DamInfo.Id,CCalvingEvent,
                                                               FTempAnimals.FieldByName('DateOfBirth').AsDateTime);

         // If the cow has had a calving event in the last 3 months then just add the calf don't link it to the dam.
         if ( dLastCalvingDate > IncMonth(Date, -3) ) then
            begin
               AddCalfRecord;
               Exit;
            end;

         if ( iExistCalvingID = 0 ) then
            begin
               iCalfIndex := 1;
               CalvingEvent := TCalvingEvent.Create('AIMCALV');
               CalvingEvent.Database.StartTransaction;
               try
                  try
                     CalvingEvent.CalfRecord.Add;
                     CalvingEvent.CalfRecord.NatIDNum := FTempAnimals.FieldByName('NatIDNum').AsString;
                     CalvingEvent.CalfRecord.Sex := FTempAnimals.FieldByName('Sex').AsString;
                     CalvingEvent.CalfRecord.DateOfBirth := FTempAnimals.FieldByName('DateOfBirth').AsDateTime;
                     CalvingEvent.CalfRecord.PrimaryBreed := FTempAnimals.FieldByName('BreedID').AsInteger;
                     CalvingEvent.CalfRecord.DamID := DamInfo.Id;
                     CalvingEvent.CalfRecord.SireId := GetSireID(FTempAnimals.FieldByName('SireCode').AsString);
                     CalvingEvent.CalfRecord.HerdID := FHerdID;
                     CalvingEvent.CalfRecord.Breeding := UpperCase(CalvingEvent.CalfRecord.Sex) = 'FEMALE';
                     CalvingEvent.CalfRecord.IsSynchronized := False;
                     CalvingEvent.CalfRecord.Save;
                     CalvingEvent.CalfReg[iCalfIndex] := True;
                     CalvingEvent.CalfID[iCalfIndex] := CalvingEvent.CalfRecord.ID;
                     Inc(iCalfIndex);

                     CalvingEvent.Append;
                     CalvingEvent.AnimalID := DamInfo.Id;
                     CalvingEvent.EventDate := FTempAnimals.FieldByName('DateOfBirth').AsDateTime;
                     CalvingEvent.AnimalLactNo := DamInfo.LactNo+1;
                     CalvingEvent.AnimalHerdID := FHerdID;
                     CalvingEvent.EventComment := 'Calving';

                     CalvingEvent.EventSource := sAIMHERDRECIMPORT;

                     CalvingEvent.BirthType := 0;
                     CalvingEvent.IsSynchronized := False;
                     CalvingEvent.Post;
                     if ( CalvingEvent.Database.InTransaction ) then
                        CalvingEvent.Database.Commit
                     else
                        begin
                          CalvingEvent.Database.Rollback;
                          MessageDlg('Error commiting transaction.'+cCRLF+
                                     'Contact Kingswood.',mtError,[mbOK],0);
                        end;
                  except
                     ApplicationLog.LogError(Format('AnimalId: %d - Failed to create calving event.',[DamInfo.Id]));
                     CalvingEvent.Database.Rollback;
                     raise;
                  end;
               finally
                  if ( CalvingEvent <> nil ) then
                     FreeAndNil(CalvingEvent);
                  if ( DamInfo <> nil ) then
                     FreeAndNil(DamInfo);
               end;
            end
         else
            begin
                AddCalfRecord;
                StoreCalfIdInCalvingsTable();
            end;
      except
         on e : Exception do
            ShowMessage(e.Message);
      end;
   end;

begin
   if ( not(FAnimalsCreated) ) then Exit;

   FTempQuery.Close;
   FTempQuery.SQL.Clear;
   FTempQuery.SQL.Add('UPDATE Animals');
   FTempQuery.SQL.Add('SET InHerd = True');
   FTempQuery.SQL.Add('WHERE InHerd = False');
   FTempQuery.SQL.Add('AND   AnimalDeleted = False');
   FTempQuery.SQL.Add('AND   HerdID IN (SELECT DefaultHerdID FROM Defaults)');
   FTempQuery.SQL.Add('AND   ID NOT IN (SELECT AnimalID FROM Events WHERE EventType = :SaleDeathEvent)');
   FTempQuery.Params[0].AsInteger := CSaleDeathEvent;
   FTempQuery.ExecSQL;

   FTempAnimals.First;
   pbImportProgress.Properties.Min := 1;
   pbImportProgress.Properties.Max := FTempAnimals.RecordCount;
   pbImportProgress.Position := 1;
   Application.ProcessMessages;
   Update;

   //   17/05/19 [V5.8 R9.2] /MK Additional Feature - Create class that contains all temp movement info.
   TempTransferInfo := TTempMovementInfo.Create();
   try
      FTempAnimals.First;
      while ( not(FTempAnimals.Eof) ) do
         begin
            Application.ProcessMessages;
            Update;
            if ( ValidateAnimalDetails ) then
               begin
                  if ( FTempAnimals.FieldByName('MovementType').AsVariant = Null) then
                     ProcessCalvingEvent
                  else if ( FTempAnimals.FieldByName('MovementType').AsVariant = cPurchMovementType ) then
                     ProcessPurchaseEvent
                  else if ( FTempAnimals.FieldByName('MovementType').AsVariant = cSaleMovementType ) then
                     ProcessSaleEvent;
               end;
            pbImportProgress.Position := pbImportProgress.Position+1;
            FTempAnimals.Next;
         end;
   finally
      FreeAndNil(TempTransferInfo);
   end;
end;

function TfmAIMHerdRecImport.ValidateAnimalDetails : Boolean;
begin
   Result := ( Length(FTempAnimals.FieldByName('NatIDNum').AsString) > 0 ) and
             ( Length(FTempAnimals.FieldByName('Sex').AsString) > 0 ) and
             ( Length(FTempAnimals.FieldByName('BreedCode').AsString) > 0 ) and
             ( FTempAnimals.FieldByName('DateOfBirth').AsDateTime > 0 );
end;

function TfmAIMHerdRecImport.GetBreedIdFromCode(ABreedCode: string): Integer;
var
   qBreed : TQuery;
begin
   Result := 0;
   qBreed := TQuery.Create(nil);
   with qBreed do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID');
         SQL.Add('FROM Breeds');
         SQL.Add('WHERE Code = "'+ABreedCode+'"');
         try
            Open;
            if ( RecordCount > 0 ) then
               Result := Fields[0].AsInteger;
            Close;
         except
         end;
      finally
         FreeAndNil(qBreed);
      end;
end;

procedure TfmAIMHerdRecImport.ProcessHeiferCalves;
var
   bStep : Boolean;
   AIMHeifers : TAIMHeiferInfo;
   Animal : TAnimal;
   TempMovement : TTemporaryMovement;
   qSelectedHeifers : TQuery;
begin
   FTempAnimals.Close;
   FTempAnimals.Open;
   FTempAnimals.Filter := '';
   FTempAnimals.Filtered := False;
   FTempAnimals.Filter := 'Sex = ''Female'' AND MovementType = '+IntToStr(cSaleMovementType)+' AND IsDeath = False';
   FTempAnimals.Filtered := True;

   if ( not(HerdLookup.qAnimalsInHerdTempOff.Active) ) then
      HerdLookup.qAnimalsInHerdTempOff.Open;

   bStep := FTempAnimals.FindFirst;
   if bStep then
      begin
         AIMHeifers := TAIMHeiferInfo.Create();
         try
            while ( bStep ) do
                begin
                   Animal := GetAnimal(FTempAnimals.FieldByName('NatIDNum').AsString,True);
                   if ( Animal <> nil ) and
                      ( not(HerdLookup.qAnimalsInHerdTempOff.Locate('AID',Animal.Id,[])) ) then
                      try
                         if ( FHerdType = htDairy ) and ( Animal.LactNo = 0 ) and
                            ( UpperCase(FTempAnimals.FieldByName('AIMMoveType').AsString) = 'FARM TO FARM' ) and
                            ( Animal.DateOfBirth >= IncMonth(FTempAnimals.FieldByName('MovementDate').AsDateTime,-30) ) and
                            ( IsValidIrishHerdID(FTempAnimals.FieldByName('MovedTo').AsString) ) then
                            try
                               AIMHeifers.FAIMHeiferTable.Append;
                               AIMHeifers.FAIMHeiferTable.FieldByName('Selected').AsBoolean := False;
                               AIMHeifers.FAIMHeiferTable.FieldByName('AnimalID').AsInteger := Animal.Id;
                               AIMHeifers.FAIMHeiferTable.FieldByName('LactNo').AsInteger := Animal.LactNo;
                               AIMHeifers.FAIMHeiferTable.FieldByName('HerdID').AsInteger := Animal.HerdId;
                               AIMHeifers.FAIMHeiferTable.FieldByName('NatIDNo').AsString := Animal.NatIdNum;
                               AIMHeifers.FAIMHeiferTable.FieldByName('SortNatID').AsString := Animal.SortNatIdNum;
                               AIMHeifers.FAIMHeiferTable.FieldByName('DateOfBirth').AsDateTime := Animal.DateOfBirth;
                               AIMHeifers.FAIMHeiferTable.FieldByName('NewHerdID').AsString := FTempAnimals.FieldByName('MovedTo').AsString;
                               AIMHeifers.FAIMHeiferTable.FieldByName('MoveDate').AsDateTime := FTempAnimals.FieldByName('MovementDate').AsDateTime;
                               AIMHeifers.FAIMHeiferTable.FieldByName('AddToXMLFile').AsBoolean := False;
                               AIMHeifers.FAIMHeiferTable.Post;
                            except
                               AIMHeifers.FAIMHeiferTable.Cancel;
                            end;
                      finally
                         FreeAndNil(Animal);
                      end;
                   bStep := FTempAnimals.FindNext;
                end;

            AIMHeifers.FAIMHeiferTable.Close;
            AIMHeifers.FAIMHeiferTable.Open;
            if ( AIMHeifers.FAIMHeiferTable.RecordCount > 0 ) then
               begin
                  TfmAIMHeifTempTransfers.SaveTempTransfers;

                  AIMHeifers.FAIMHeiferTable.Filter := '';
                  AIMHeifers.FAIMHeiferTable.Filtered := False;
                  AIMHeifers.FAIMHeiferTable.Filter := 'Selected = True AND AddToXMLFile = False';
                  AIMHeifers.FAIMHeiferTable.Filtered := True;
                  bStep := AIMHeifers.FAIMHeiferTable.FindFirst;
                  while bStep do
                     begin
                        TempMovement := TTemporaryMovement.Create('TempMoves');
                        try
                           with TempMovement do
                              try
                                 Append;
                                 AnimalID := AIMHeifers.FAIMHeiferTable.FieldByName('AnimalID').AsInteger;
                                 AnimalLactNo := AIMHeifers.FAIMHeiferTable.FieldByName('LactNo').AsInteger;
                                 AnimalHerdID := AIMHeifers.FAIMHeiferTable.FieldByName('HerdID').AsInteger;
                                 EventType := TMovement;
                                 EventComment := 'AIM Temp Transfer';
                                 EventSource := sAIMTempTransfer;
                                 EventDate := AIMHeifers.FAIMHeiferTable.FieldByName('MoveDate').AsDateTime;
                                 AID := AIMHeifers.FAIMHeiferTable.FieldByName('AnimalID').AsInteger;
                                 MovedTo := HerdLookup.GetTempMoveMovedToIDByHerdID(AIMHeifers.FAIMHeiferTable.FieldByName('NewHerdID').AsString);
                                 StillOffFarm := True;
                                 Remark := EventComment;
                                 Post;
                              except
                                 Cancel;
                              end;
                        finally
                           FreeAndNil(TempMovement);
                        end;
                        bStep := AIMHeifers.FAIMHeiferTable.FindNext;
                     end;
               end;

            qSelectedHeifers := TQuery.Create(nil);
            try
               qSelectedHeifers.DatabaseName := AliasName;
               qSelectedHeifers.SQL.Clear;
               qSelectedHeifers.SQL.Add('SELECT AnimalID');
               qSelectedHeifers.SQL.Add('FROM '+AIMHeifers.FAIMHeiferTable.TableName);
               qSelectedHeifers.SQL.Add('WHERE Selected = True');
               qSelectedHeifers.SQL.Add('AND   AddToXMLFile = True');
               qSelectedHeifers.Open;
               if ( qSelectedHeifers.RecordCount > 0 ) then
                  TfmCreateAnimalXMLIHMFileProgress.ShowTheForm(qSelectedHeifers);
            finally
               qSelectedHeifers.Free;
            end;

         finally
            FreeAndNil(AIMHeifers);
         end;
      end;
   FTempAnimals.Filter := '';
   FTempAnimals.Filtered := False;

   if ( HerdLookup.qAnimalsInHerdTempOff.Active ) then
      HerdLookup.qAnimalsInHerdTempOff.Close;
end;

procedure TfmAIMHerdRecImport.FormDestroy(Sender: TObject);
begin
   if ( FTempQuery <> nil ) then
      begin
         FTempQuery.Close;
         FreeAndNil(FTempQuery);
      end;

   if ( FTempAnimals <> nil ) then
      begin
         FTempAnimals.Close;
         FTempAnimals.DeleteTable;
         FreeAndNil(FTempAnimals);
      end;

   if ( FEventDataHelper <> nil ) then
      FreeAndNil(FEventDataHelper);

   if (FCustomerRepository <> nil) then
      FreeAndNil(FCustomerRepository);

   if (FSupplierRepository <> nil) then
      FreeAndNil(FSupplierRepository);
end;

end.
