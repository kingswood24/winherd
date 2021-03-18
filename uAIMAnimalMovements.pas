{
   15/11/13 [V5.2 R5.5] /MK Bug Fix - RecordMovementsOn - Allow duplicate NatID's for MovementsIn file.

   23/01/15 [V5.4 R1.1] /MK Bug Fix - RecordMovementsOn - DOB can be blank if Dept don't know it - John Kearns(7611).

   23/01/15 [V5.4 R2.6] /MK Change - If animal has an active temporary movement then don't import sale.

   20/03/15 [V5.4 R3.4] /MK Change - RecordMovementsOff/GetAnimal - Check if animal is in the database, is not in the herd
                                                                    and has same purchase date as new purchase date coming from AIM - GL/Joe Leyden.

   02/02/16 [V5.5 R3.4] /MK Change - RecordMovementsOn - Autocalc lactation number for female animals.

   04/04/16 [V5.5 R5.7] /MK Change - RecordMovementsOff - Sometimes the Dept. does not specify the moved to so the user should be informed
                                                          because the animal is then not sold - John Doyle (6487)

   25/01/17 [V5.6 R4.2] /MK Bug Fix - GetAnimal - Added check to see if the animal is sold in the program after purchase date.
                                    - RecordMovementsOff - Added check to see if the animal is currently in the herd purchased after new sale date - report by Tom O'Keeffe.

   26/01/17 [V5.6 R4.2] /MK Bug Fix - RecordMovementsOn - Added check to see if the animal was sold after the purchase date - report by Tom O'Keeffe.

   07/03/18 [V5.7 R8.2] /MK Change - RecordMovementsOn - The original status of a male animal is a bull so we should newly purchase male animals to bulls - GL request.

   01/08/18 [V5.8 R2.2] /MK Additional Feature - RecordMovementsOn/RecordMovementsOff - Use new uDeptMarts function to get mart name from Dept. mart number.

   02/08/18 [V5.8 R2.2] /MK Additional Feature - RecordMovementsOff - Use new uDeptFactories function to get factory name from Dept. factory number.

   25/03/19 [V5.8 R8.3] /MK Additional Feature - RecordMovementsOn - Add the SupplierCosts, Commission and Haulage from SupplierBreeders table - Una Carter.

   08/04/19 [V5.8 R8.6] /MK Change - RecordMovementsOff - PreSale needs to be set here for GetSaleEventInfo to pick up animal.

   29/04/19 [V5.8 R9.0] /MK Change - Added Class Procedure, ProcessAIMCompCertNewCustXML, to TAimAnimalMovement to allow import of newly created customer
                                     from the AIM Compliance Cert screen - SP request.

   17/05/19 [V5.8 R9.2] /MK Additional Feature - ProcessMovements - Create class that contains all temp movement info.
                                                                  - Create class to all heifers brought back from another herd.
                                                                  - After sales/deaths are recorded check if there are any heifers that may be recorded as TempMovements.
                                               - RecordMovementsOff - Check if the animal already has an active temp movement event i.e. animal is classed as still off farm.
                                                                    - If MovedTo is a valid Irish herd number, the moveType is not death and the animal
                                                                      is a heifer calve i.e. female calve born in the last year, then add animal to
                                                                      to new screen that allows the farmer to record temp movement event for the animal.
                                               - RecordMovementsOn - If the animal is in the herd and has an active temp movement then set moved back date to MovedOn date.

   06/06/19 [V5.8 R9.3] /MK Change - RecordMovementsOff - IsHeifer - Changed this classification to date of birth within two years of movement date,
                                                                     lactation number is zero and the AIM Movement Type is "Farm to Farm" - GL/Danny O'Connell request.

   21/06/19 [V5.8 R9.5] /MK Change - RecordMovementsOff - IsHeifer - Changed the classification of a heifer to date of birth within 30 months - Donal Kiely/GL.

   06/08/19 [V5.8 R9.8] /MK Additional Feature - For Contract Herds if the user selects the heifer as a contract herd and not store on farm then add the animal to
                                                 an XML file in Kingswood Movements, similar to the user creating a movements out file manually - Captal Farms.

   08/11/19 [V5.9 R1.2] /MK Change - Renumber the animal after the sale.

   27/11/19 [V5.9 R1.3] /MK Change - RecordMovementsOn - Default the Breeding status of the animal depending on HerdType, False if Beef else True - GL/TOK request.

   24/01/20 [V5.9 R2.0] /MK Change - RecordMovementsOn - If the HerdType is Beef then default the lactno to zero, else calculate lactNo - Una Carter.

   03/03/21 [V5.9 R9.2] /MK Additional Feature - RecordMovementsOn - If a bull is bought into the herd set its animal number to last 5 digits and set it as breeding.
}

unit uAIMAnimalMovements;

interface
uses
   Classes, SysUtils, Forms, Windows, Controls, Dialogs, db, dbTables,
   MSXML2_TLB, ComObj, uAnimal, uCustomerRepository, uSupplierRepository,
   ChkDebug, GenTypesConst, uEventDataHelper, uDeptMarts, uDeptFactories,
   uAIMHeifTempTransfers, DateUtil, uHerdLookup, uCreateAnimalXMLIHMFileProgress,
   uPreferences;

type
   TMovementType = (mtOn, mtOff);

   TMovementSummary = class
   private
     FNoOfMovementsToProcess: Integer;
     FNoOfMovementsSucceeded: Integer;
     FMovementsInError : TStringList;
     FMovementsCreated : TStringList;
     FAnimals : TIntArray;
   public
     MovementType : TMovementType;
     constructor create(AMovementType : TMovementType);
     destructor destroy;override;
     procedure AddMovementError(AError : string);
     procedure AddMovementSuccess(ANatIdNo : string);
     procedure AddAnimal(AId : Integer);
     procedure Initialize();
     property NoOfMovementsToProcess : Integer read FNoOfMovementsToProcess write FNoOfMovementsToProcess;
     property NoOfMovementsSucceeded : Integer read FNoOfMovementsSucceeded write FNoOfMovementsSucceeded;
     property MovementsInError : TStringList read FMovementsInError;
     property MovementsCreated : TStringList read FMovementsCreated;
     property Animals : TIntArray read FAnimals write FAnimals;
   end;

   TAimAnimalMovement = class
   private
     FHerdId : Integer;
     FDocument : IXMLDOMDocument;
     FRootNode : IXMLDOMNode;
     FAnimalMovements : IXMLDOMNodeList;
     FAnimalMovement : IXMLDOMNode;
     FCustomers : IXMLDOMNodeList;
     FCustomer : IXMLDOMNode;
     FChildNode : IXMLDOMNode;
     FTempQuery : TQuery;
     FCustomerRepository : TCustomerRepository;
     FSupplierRepository : TSupplierRepository;
     FBreedQuery : TQuery;
     FDatabasePath : string;
     FMovementSummary : TMovementSummary;
     FMovementType : TMovementType;
     FEventDataHelper : TEventDataHelper;
     FTempTransferInfo : TTempMovementInfo;
     FAIMHeifers : TAIMHeiferInfo;
     FHerdType : THerdType;
     FPreferences : TPreferences;
     FRenumberAfterSale : Boolean;
     FRenumberFormat : String;
     procedure RecordMovementsOn();
     procedure RecordMovementsOff();
     procedure RecordHeifMoveOff();
     procedure CreateLogEntry(AError : String);
     function GetAnimal(ANatIdNo: string; AInHerd : Boolean; const APurchDate: TDateTime = 0) : TAnimal;
     function GetHerdId(const ABTEHerdNo : string) : Integer;
     function GetBreedIdFromCode(ABreedCode : string) : Integer;
   public
     constructor create;
     destructor destroy;override;
     class function ProcessMovements(const AMovementFileName : string;
         const AMovementType : TMovementType) : TMovementSummary;
     class procedure ProcessAIMCompCertNewCustXML(AXMLFile : String);
   end;

implementation
uses
   uXMLDOMHelper, kRoutines, EventRecording,
   uApplicationLog, uNationalID, uAimAnimalMovementSummary;

{ TAimAnimalMovement }

constructor TAimAnimalMovement.create;
begin
   FDatabasePath := IncludeTrailingBackSlash(DefaultDirectory) + DataDir;

   FTempQuery := TQuery.Create(nil);
   FTempQuery.DatabaseName := AliasName;

   FBreedQuery := TQuery.Create(nil);
   FBreedQuery.DatabaseName := AliasName;
   FBreedQuery.SQL.Clear;
   FBreedQuery.SQL.Add('SELECT Id, Code');
   FBreedQuery.SQL.Add('FROM Breeds');
   FBreedQuery.Open;

   FMovementSummary := TMovementSummary.Create(FMovementType);

   FCustomerRepository := TCustomerRepository.create(FDatabasePath);
   FSupplierRepository := TSupplierRepository.create(FDatabasePath);

   FEventDataHelper := TEventDataHelper.Create();

   FHerdType := HerdLookup.GetHerdType(HerdLookup.DefaultHerdID);

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
end;

destructor TAimAnimalMovement.destroy;
begin
   if (FTempQuery <> nil) then
      begin
         FTempQuery.Active := False;
         FreeAndNil(FTempQuery);
      end;

   if (FCustomerRepository <> nil) then
      FreeAndNil(FCustomerRepository);

   if (FBreedQuery <> nil) then
      begin
         FBreedQuery.Close;
         FreeAndNil(FBreedQuery);
      end;

   if (FMovementSummary <> nil) then
      FreeAndNil(FMovementSummary);

  inherited;
end;

function TAimAnimalMovement.GetAnimal(ANatIdNo: string; AInHerd : Boolean; const APurchDate: TDateTime = 0) : TAnimal;
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

function TAimAnimalMovement.GetBreedIdFromCode(ABreedCode: string): Integer;
begin
   Result := 0;
   if (Trim(ABreedCode) = '') then
      Exit;
   if FBreedQuery.Locate('Code', ABreedCode,[]) then
      begin
         Result := FBreedQuery.FieldByName('ID').AsInteger;
      end;
end;

function TAimAnimalMovement.GetHerdId(const ABTEHerdNo: string): Integer;
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

class function TAimAnimalMovement.ProcessMovements(const AMovementFileName : string;
   const AMovementType : TMovementType) : TMovementSummary;
var
   AimAnimalMovement : TAimAnimalMovement;
   i : Integer;
begin
   Result := nil;

   AimAnimalMovement := TAimAnimalMovement.create;
   with AimAnimalMovement do
      try
         FMovementType := AMovementType;
         if (FTempQuery.Active) then
            FTempQuery.Active := False;
         FDocument := TXMLDOMHelper.LoadDocument(AMovementFileName);

         if (FDocument = nil) then
            begin
               MessageDlg(Format('Failed to load file %s',[AMovementFileName]),mtError,[mbOK],0);
               Exit;
            end;

         FRootNode := FDocument.documentElement;
         if (FRootNode = nil) then
            begin
               MessageDlg('Document root was not found.',mtError,[mbOK],0);
               Exit;
            end;

         FChildNode := FRootNode.selectSingleNode('herdNumber');
         if (FChildNode = nil) then
            begin
               MessageDlg('Herd Number element was not found.',mtError,[mbOK],0);
               Exit;
            end;

         FHerdId := GetHerdId(FChildNode.text);
         if (FHerdId <= 0) then
            begin
               MessageDlg(Format('Could not locate Herd Number on file - "%s".',[FChildNode.text]),mtError,[mbOK],0);
               Exit;
            end;
         try
            //   17/05/19 [V5.8 R9.2] /MK Additional Feature - Create class that contains all temp movement info.
            FTempTransferInfo := TTempMovementInfo.Create();
            //   17/05/19 [V5.8 R9.2] /MK Additional Feature - Create class to all heifers brought back from another herd.
            FAIMHeifers := TAIMHeiferInfo.Create();
            try
               if (AMovementType = mtOn) then
                  RecordMovementsOn
               else
                  begin
                     RecordMovementsOff;
                     //   17/05/19 [V5.8 R9.2] /MK Additional Feature - After sales/deaths are recorded check if there are any heifers that may be recorded as TempMovements.
                     RecordHeifMoveOff;
                  end;
            finally
               FreeAndNil(FTempTransferInfo);
               FreeAndNil(FAIMHeifers);
            end;

            Result := TMovementSummary.Create(AMovementType);
            Result.NoOfMovementsToProcess := FMovementSummary.NoOfMovementsToProcess;
            Result.NoOfMovementsSucceeded := FMovementSummary.NoOfMovementsSucceeded;
            Result.FMovementsInError.AddStrings(FMovementSummary.FMovementsInError);
            Result.FMovementsCreated.AddStrings(FMovementSummary.FMovementsCreated);
            Result.Animals := FMovementSummary.Animals;

            DeleteFile(AMovementFileName);

         finally
            FDocument := nil;
         end;
      finally
         FreeAndNil(AimAnimalMovement);
      end;
end;

procedure TAimAnimalMovement.RecordMovementsOff;
var
  i,j : Integer;
  NatIdNo : string;
  EventDate : TDateTime;
  MovedTo,
  MovedToHerdID : string;
  MoveToId : Integer;
  IsDeath : Boolean;
  MoveType : string;
  SaleDeathEvent : TSaleDeathEvent;
  Animal : TAnimal;
  Error : string;
  IsHeifer : Boolean;
begin
   FAnimalMovements := FRootNode.selectNodes('//movements/movementOff');
   try
      if (FAnimalMovements.length = 0) then
         begin
            // No records to process exit...
            Exit;
         end;
      FMovementSummary.NoOfMovementsToProcess := FAnimalMovements.length;

      if ( not(HerdLookup.qAnimalsInHerdTempOff.Active) ) then
         HerdLookup.qAnimalsInHerdTempOff.Open;

      for i := 0 to FAnimalMovements.Length-1 do
         try
            FAnimalMovement := FAnimalMovements[i];
            if (FAnimalMovement = nil) then continue;

            for j := 0 to FAnimalMovement.childNodes.Get_length-1 do
               begin
                  FChildNode := FAnimalMovement.childNodes[j];
                  if ( FChildNode <> nil ) then
                     begin
                        if ( FChildNode.nodeName = 'tagNum' ) then
                           NatIdNo := FChildNode.text
                        else if ( FChildNode.nodeName = 'moveDate' ) then
                           EventDate := StrToDate(FChildNode.text)
                        else if ( FChildNode.nodeName = 'movedTo' ) then
                           MovedTo := FChildNode.text
                        else if ( FChildNode.nodeName = 'moveType' ) then
                           MoveType := UPPERCASE(FChildNode.text);
                     end;
               end;

            if (Length(Trim(NatIdNo)) > 0) then
               begin
                  Animal := GetAnimal(NatIdNo,True);
                  if (Animal = nil) then
                     begin
                        Error := Format('Cannot create sale event. %s not found in herd.',[NatIdNo]);
                        CreateLogEntry(Error);
                        Continue;
                     end
                  //   25/01/17 [V5.6 R4.2] /MK Change - If animal is already in the herd but has a purchase date after new sale date then don't save sale.
                  else if ( FEventDataHelper.GetLastEventDate(Animal.Id,CPurchaseEvent) > EventDate ) then
                     begin
                        Error := Format('Cannot create sale event. %s already purchased after sale date.',[NatIDNo]);
                        CreateLogEntry(Error);
                        Continue;
                     end;

                  //   17/05/19 [V5.8 R9.2] /MK Additional Feature - Check if the animal already has an active temp movement event i.e. animal is classed as still off farm.
                  if ( HerdLookup.qAnimalsInHerdTempOff.Locate('AID',Animal.Id,[]) ) then
                     begin
                        Error := Format('Animal %s has an active temp movement.',[NatIDNo]);
                        ApplicationLog.LogInfo(Error);
                        CreateLogEntry(Error);
                        Continue;
                     end;

                  IsDeath := (MoveType = 'ON FARM BURIAL') or
                             (MoveType = 'RENDERING PLANT') or
                             (MoveType = 'KNACKERY/LABORATORY');

                  //   17/05/19 [V5.8 R9.2] /MK Additional Feature - If MovedTo is a valid Irish herd number, the moveType is not death and the animal
                  //                                                 is a heifer calve i.e. female calve born in the last year, then add animal to
                  //                                                 to new screen that allows the farmer to record temp movement event for the animal.
                  if ( IsValidIrishHerdID(MovedTo) ) and ( not(IsDeath) ) then
                     begin
                        IsHeifer := ( FHerdType = htDairy ) and ( UpperCase(Animal.Sex) = 'FEMALE' ) and ( Animal.LactNo = 0 ) and
                                    ( Animal.DateOfBirth >= IncMonth(EventDate,-30) ) and ( MoveType = 'FARM TO FARM' );
                        if IsHeifer then
                           begin
                              try
                                 FAIMHeifers.FAIMHeiferTable.Append;
                                 FAIMHeifers.FAIMHeiferTable.FieldByName('Selected').AsBoolean := False;
                                 FAIMHeifers.FAIMHeiferTable.FieldByName('AnimalID').AsInteger := Animal.Id;
                                 FAIMHeifers.FAIMHeiferTable.FieldByName('LactNo').AsInteger := Animal.LactNo;
                                 FAIMHeifers.FAIMHeiferTable.FieldByName('HerdID').AsInteger := Animal.HerdId;
                                 FAIMHeifers.FAIMHeiferTable.FieldByName('NatIDNo').AsString := Animal.NatIdNum;
                                 FAIMHeifers.FAIMHeiferTable.FieldByName('SortNatID').AsString := Animal.SortNatIdNum;
                                 FAIMHeifers.FAIMHeiferTable.FieldByName('DateOfBirth').AsDateTime := Animal.DateOfBirth;
                                 FAIMHeifers.FAIMHeiferTable.FieldByName('NewHerdID').AsString := MovedTo;
                                 FAIMHeifers.FAIMHeiferTable.FieldByName('MoveDate').AsDateTime := EventDate;
                                 FAIMHeifers.FAIMHeiferTable.FieldByName('AddToXMLFile').AsBoolean := False;
                                 FAIMHeifers.FAIMHeiferTable.Post;
                              except
                                 FAIMHeifers.FAIMHeiferTable.Cancel;
                              end;
                              Continue;
                           end;
                     end;

                  //   04/04/16 [V5.5 R5.7] /MK Change - Sometimes the Dept. does not specify the moved to so the user should be informed
                  //                                     because the animal is then not sold - John Doyle (6487)
                  if ( Length(Trim(MovedTo)) = 0 ) then
                     begin
                        Error := Format('Cannot create sale event. Moved to is not specified for %s.',[NatIdNo]);
                        CreateLogEntry(Error);
                        Continue;
                     end;
                  MoveToId := FCustomerRepository.GetCustomer(MovedTo);
                  if ( MoveToId = 0 ) then
                      begin
                         MovedToHerdID := MovedTo;
                         // Get the name of the Mart if the MovedTo exists in Dept list of Mart numbers.
                         MovedTo := GetMartNameInArrayFromNumber(MovedToHerdID);
                         // Get the name of the Factory if the MovedTo exists in Dept list of Factory numbers.
                         MovedTo := GetFactoryNameFromDeptNumber(MovedToHerdID);
                         MoveToId := FCustomerRepository.CreateCustomer(MovedTo,MovedToHerdID,'','','','','','','','AIM Download',true);
                      end;

                  SaleDeathEvent := TSaleDeathEvent.Create('SDDB');
                  try
                     SaleDeathEvent.Append;
                     try
                        SaleDeathEvent.CanCheckWeaning := False;
                        SaleDeathEvent.EventType := TSaleDeath;
                        SaleDeathEvent.AnimalID := Animal.Id;
                        SaleDeathEvent.AnimalLactNo := Animal.LactNo;
                        SaleDeathEvent.AnimalHerdID := Animal.HerdId;
                        SaleDeathEvent.EventSource  := sAIM;
                        SaleDeathEvent.EventDate := EventDate;
                        SaleDeathEvent.Sold := not IsDeath;
                        //   08/04/19 [V5.8 R8.6] /MK Change - PreSale needs to be set here for GetSaleEventInfo to pick up animal.
                        SaleDeathEvent.PreSale := False;
                        SaleDeathEvent.Customer := MoveToId;
                        SaleDeathEvent.RenumberAfterPost := FRenumberAfterSale;
                        SaleDeathEvent.RenumberFormat := FRenumberFormat;
                        SaleDeathEvent.Post;

                        FMovementSummary.NoOfMovementsSucceeded := FMovementSummary.NoOfMovementsSucceeded+1;
                        FMovementSummary.AddMovementSuccess(NatIdNo);
                     except
                        on e : Exception do
                           begin
                              if (IsWinherdDebugging) then
                                 Error := Format('%s: Failed to create Sale/Death Event. [' + e.Message + ']',[NatIdNo])
                              else
                                 Error := Format('%s: Failed to create Sale/Death Event.', [NatIdNo]);
                              FMovementSummary.AddMovementError(Error);
                              ApplicationLog.LogError(Error);
                              ApplicationLog.LogException(e);
                              SaleDeathEvent.Cancel;
                           end
                     end;
                  finally
                     FreeAndNil(SaleDeathEvent);
                  end;
               end;

         except
            on e : exception do
               begin
                  Error := Format('Could not create movedOff event for animal: %s',[NatIdNo]);
                  ApplicationLog.LogError(Error);
                  ApplicationLog.LogException(e);
               end;
         end;

      if ( HerdLookup.qAnimalsInHerdTempOff.Active ) then
         HerdLookup.qAnimalsInHerdTempOff.Close;

   finally
      FRootNode := nil;
      FAnimalMovements := nil;
      FAnimalMovement := nil;
      FChildNode := nil;
   end;
end;

procedure TAimAnimalMovement.RecordMovementsOn;
var
   i, j : Integer;
   NatIdNo : string;
   Sex : string;
   BreedCode : string;
   DateOfBirth : TDateTime;
   EventDate : TDateTime;
   MovedFrom : string;
   MovedFromHerdID : string;
   MoveFromId : Integer;
   MoveType : string;
   PurchaseEvent : TPurchaseEvent;
   Animal : TAnimal;
   AnimalRecord : TAnimalRecord;
   Error : string;
   NoOfYears : Integer;
   SupplierRecord : TSupplierRecord;

   function GetSupplierIDRecord (ASupplierID : Integer) : TSupplierRecord;
   begin
      Result.ID := 0;
      Result.Name := '';
      Result.Address1 := '';
      Result.Address2 := '';
      Result.Address3 := '';
      Result.Address4 := '';
      Result.Address5 := '';
      Result.Phone := '';
      Result.Commission := 0;
      Result.Transport := 0;
      if ( ASupplierID = 0 ) then Exit;
      with TQuery.Create(nil) do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT *');
            SQL.Add('FROM SuppliersBreeders');
            SQL.Add('WHERE ID = :ASupplierID');
            Params[0].AsInteger := ASupplierID;
            try
               Open;
               if ( RecordCount = 0 ) then Exit;
               Result.ID := ASupplierID;
               Result.Name := FieldByName('Name').AsString;
               Result.Address1 := FieldByName('Address 1').AsString;
               Result.Address2 := FieldByName('Address 2').AsString;
               Result.Address3 := FieldByName('Address 3').AsString;
               Result.Address4 := FieldByName('Address 4').AsString;
               Result.Address5 := FieldByName('Address 5').AsString;
               Result.Phone := FieldByName('Phone').AsString;
               Result.Commission := FieldByName('Commission').AsFloat;
               Result.Transport := FieldByName('Transport').AsFloat;
            except
               on e : Exception do
                  ShowDebugMessage(e.Message);
            end;
         finally
            Free;
         end;
   end;

begin
   FAnimalMovements := FRootNode.selectNodes('//movements/movementOn');
   try
      if (FAnimalMovements.length = 0) then
         begin
            // No records to process exit...
            Exit;
         end;

      FMovementSummary.NoOfMovementsToProcess := FAnimalMovements.length;

      for i := 0 to FAnimalMovements.Length-1 do
         begin
            NatIdNo := '';
            EventDate := 0;
            MovedFrom := '';
            MoveFromId := 0;

            FAnimalMovement := FAnimalMovements.item[i];
            if (FAnimalMovement = nil) then continue;

            for j := 0 to FAnimalMovement.childNodes.Get_length-1 do
               begin
                  FChildNode := FAnimalMovement.childNodes[j];
                  if ( FChildNode <> nil ) then
                     begin
                        if ( FChildNode.nodeName = 'tagNum' ) then
                           NatIdNo := (FChildNode.text)
                        else if ( FChildNode.nodeName = 'sex' ) then
                           begin
                              Sex := UpperCase(Trim(FChildNode.text));
                              if (Sex = 'M') then
                                 //   07/03/18 [V5.7 R8.2] /MK Change - The original status of a male animal is a bull so we should newly purchase male animals to bulls - GL request.
                                 Sex := 'Bull'
                              else
                                 Sex := 'Female';
                           end
                        else if ( FChildNode.nodeName = 'breed' ) then
                           BreedCode := FChildNode.text
                        else if ( FChildNode.nodeName = 'dob' ) then
                           begin
                              if ( FChildNode.text <> '' ) then
                                 DateOfBirth := StrToDate(FChildNode.text);
                           end
                        else if ( FChildNode.nodeName = 'moveDate' ) then
                           EventDate := StrToDate(FChildNode.text)
                        else if ( FChildNode.nodeName = 'movedFrom' ) then
                           MovedFrom := FChildNode.text
                        else if ( FChildNode.nodeName = 'moveType' ) then
                           MoveType := FChildNode.text;
                     end;
               end;

            Animal := GetAnimal(NatIdNo,True);
            if (Animal <> nil) then
               begin
                  //   17/05/19 [V5.8 R9.2] /MK Additional Feature - If the animal is in the herd and has an active temp movement then set moved back date to MovedOn date.
                  if ( FTempTransferInfo.BringBackAnimal(Animal.Id,EventDate) ) then
                     begin
                        Error := Format('Animal %s temp movement back in date updated to %s.',[Animal.NatIdNum,DateToStr(EventDate)]);
                        ApplicationLog.LogInfo(Error);
                        CreateLogEntry(Error);
                        FreeAndNil(Animal);
                        Continue;
                     end;
                  Error := Format('Could not create Purchase event for animal (%s). Animal is already in the herd.',[NatIdNo]);
                  CreateLogEntry(Error);
                  FreeAndNil(Animal);
                  Continue;
               end;

            Animal := GetAnimal(NatIdNo,False,EventDate);
            if (Animal <> nil) then
               begin
                  //   26/01/17 [V5.6 R4.2] /MK Change - If the Animal was sold on or after the new purchase date.
                  if ( FEventDataHelper.GetLastEventDate(Animal.Id,CSaleDeathEvent) >= EventDate ) then
                     Error := Format('Could not create Purchase event for animal (%s). Animal sold on or after this purchase date.',[NatIdNo])
                  //   20/03/15 [V5.4 R3.4] /MK Change - Check if animal has already been imported into the herd with this purchase date.
                  else
                     Error := Format('Could not create Purchase event for animal (%s). Animal already purchased on this purchase date.',[NatIdNo]);
                  CreateLogEntry(Error);
                  FreeAndNil(Animal);
                  Continue;
               end;

            MoveFromId := FSupplierRepository.GetSupplier(MovedFrom);
            if ( MoveFromId = 0 ) then
                begin
                   MovedFromHerdID := MovedFrom;
                   // Get the name of the Mart if the MovedFrom exists in Dept list of Mart numbers.
                   MovedFrom := GetMartNameInArrayFromNumber(MovedFromHerdID);
                   MoveFromId := FSupplierRepository.CreateSupplier(MovedFrom,MovedFromHerdID,'','','','','','','','AIM Download',true);
                end;

            try
               AnimalRecord := TAnimalRecord.Create('');
               AnimalRecord.ValidateIDTags := False;
               AnimalRecord.ValidateBreed := False;
               AnimalRecord.ValidateColour := False;
               AnimalRecord.ValidateDOB := False;
               //   15/11/13 [V5.2 R5.5] /MK Bug Fix - Allow duplicate NatID's for MovementsIn file.
               AnimalRecord.AllowDuplicateTags := True;
               try
                  AnimalRecord.Add;
                  AnimalRecord.HerdID := FHerdID;
                  AnimalRecord.NatIDNum := NatIdNo;
                  AnimalRecord.DateOfBirth := DateOfBirth;
                  AnimalRecord.Sex := Sex;
                  AnimalRecord.Breeding := False;

                  //   02/02/16 [V5.5 R3.4] /MK Change - Autocalc lactation number for female animals.
                  //   24/01/20 [V5.9 R2.0] /MK Change - If the HerdType is Beef then default the lactno to zero, else calculate lactNo - Una Carter.
                  if ( FHerdType = htBeef ) then
                     AnimalRecord.LactNo := 0
                  else
                     begin
                        if ( UpperCase(Sex) = 'FEMALE' ) and ( DateOfBirth > 0 ) and ( FHerdType <> htBeef ) then
                           begin
                              NoOfYears := Trunc(((Date - DateOfBirth) / 365 ));
                              NoOfYears := NoOfYears - 2;
                              if ( NoOfYears > 0 ) then
                                 AnimalRecord.LactNo := NoOfYears;
                              AnimalRecord.Breeding := True;
                           end
                     end;

                  //   03/03/21 [V5.9 R9.2] /MK Additional Feature - If a bull is bought into the herd set its animal number to last 5 digits and set it as breeding.
                  if ( UpperCase(AnimalRecord.Sex) = 'BULL' ) and ( FHerdType = htDairy ) then
                     begin
                        AnimalRecord.Breeding := True;
                        AnimalRecord.AnimalNo := Copy(StripAllSpaces(AnimalRecord.NatIDNum),Length(StripAllSpaces(AnimalRecord.NatIDNum))-4,5)
                     end;

                  AnimalRecord.InHerd := True;
                  AnimalRecord.PrimaryBreed := GetBreedIdFromCode(BreedCode);

                  //   27/11/19 [V5.9 R1.3] /MK Change - Default the Breeding status of the animal depending on HerdType, False if Beef else True - GL/TOK request.
                  //AnimalRecord.Breeding := ( FHerdType <> htBeef );

                  AnimalRecord.IsSynchronized := False;
                  AnimalRecord.Save;
               except
                  on e : exception do
                     begin
                        if (IsWinherdDebugging) then
                           Error := Format('%s: Failed to create animal record. [' + e.Message + ']',[NatIdNo])
                        else
                           Error := Format('%s: Failed to create animal record.',[NatIdNo]);

                        FMovementSummary.AddMovementError(Error);
                        AnimalRecord.Cancel;
                        ApplicationLog.LogException(e);
                     end;
               end;

               if ( AnimalRecord.AnimalSaved ) then
                  begin
                     PurchaseEvent := TPurchaseEvent.Create('PDB');
                     try
                        PurchaseEvent.Append;
                        try
                           PurchaseEvent.EventType := TPurchase;
                           PurchaseEvent.AnimalID := AnimalRecord.ID;
                           PurchaseEvent.AnimalLactNo := AnimalRecord.LactNo;
                           PurchaseEvent.AnimalHerdID := AnimalRecord.HerdID;
                           PurchaseEvent.EventSource  := sAIM;
                           PurchaseEvent.EventDate := EventDate;
                           PurchaseEvent.Supplier := MoveFromId;
                           //   25/03/19 [V5.8 R8.3] /MK Additional Feature - Add the SupplierCosts, Commission and Haulage from SupplierBreeders table.
                           SupplierRecord := GetSupplierIDRecord(MoveFromId);
                           if ( SupplierRecord.Commission > 0 ) or
                              ( SupplierRecord.Transport > 0 ) then
                              begin
                                 PurchaseEvent.SupplierCosts := ( SupplierRecord.Commission + SupplierRecord.Transport );
                                 if ( SupplierRecord.Commission > 0 ) then
                                    PurchaseEvent.Commission := SupplierRecord.Commission;
                                 if ( SupplierRecord.Transport > 0 ) then
                                    PurchaseEvent.Haulage := SupplierRecord.Transport;
                              end;
                           PurchaseEvent.Post;

                           FMovementSummary.NoOfMovementsSucceeded := FMovementSummary.NoOfMovementsSucceeded+1;
                           FMovementSummary.AddMovementSuccess(NatIdNo);
                        except
                           on e : Exception do
                              begin
                                 if (IsWinherdDebugging) then
                                    Error := Format('%s: Failed to create Purchase Event. [' + e.Message + ']',[NatIdNo])
                                 else
                                    Error := Format('%s: Failed to create Purchase Event.',[NatIdNo]);

                                 FMovementSummary.AddMovementError(Error);
                                 ApplicationLog.LogError(Error);
                                 PurchaseEvent.Cancel;
                              end
                        end;
                     finally
                        FreeAndNil(PurchaseEvent);
                     end;

                     FMovementSummary.AddAnimal(AnimalRecord.Id);
                  end;
            finally
               FreeAndNil(AnimalRecord);
            end;
         end;
   finally
      FRootNode := nil;
      FAnimalMovements := nil;
      FAnimalMovement := nil;
      FChildNode := nil;
   end;
end;

procedure TAimAnimalMovement.CreateLogEntry(AError: String);
begin
   FMovementSummary.AddMovementError(AError);
   ApplicationLog.LogError(AError);
end;

class procedure TAimAnimalMovement.ProcessAIMCompCertNewCustXML(AXMLFile: String);
var
   AIMAnimalMovement : TAimAnimalMovement;
   i, j, iCustID : Integer;
   sHerdIdentity, sHerdName : String;
begin
   if ( Length(AXMLFile) = 0 ) then Exit;

   AIMAnimalMovement := TAimAnimalMovement.Create();
   with AIMAnimalMovement do
      try
         FDocument := TXMLDOMHelper.LoadDocument(AXMLFile);
         try
            if (FDocument = nil) then
               begin
                  MessageDlg(Format('Failed to load file %s',[AXMLFile]),mtError,[mbOK],0);
                  Exit;
               end;

            FRootNode := FDocument.documentElement;
            if (FRootNode = nil) then
               begin
                  MessageDlg('Document root was not found.',mtError,[mbOK],0);
                  Exit;
               end;

            FCustomers := FRootNode.selectNodes('//customers/customer');
            if ( FCustomers.Get_length = 0 ) then Exit;
            for i := 0 to FCustomers.Get_length-1 do
               begin
                  FCustomer := FCustomers[i];
                  if ( FCustomer = nil ) then Continue;
                  for j := 0 to FCustomer.childNodes.Get_length-1 do
                     begin
                        FChildNode := FCustomer.childNodes[j];
                        if ( FChildNode = nil ) then Continue;
                        if ( FChildNode.nodeName = 'herdNumber' ) then
                           sHerdIdentity := FChildNode.Text
                        else if ( FChildNode.nodeName = 'name' ) then
                           sHerdName := FChildNode.Text;
                     end;
                  if ( Length(sHerdName) = 0 ) and ( Length(sHerdIdentity) > 0 ) then
                     sHerdName := sHerdIdentity;
                  if ( Length(sHerdIdentity) > 0 ) then
                     begin
                        iCustID := FCustomerRepository.GetCustomer(sHerdIdentity);
                        if ( iCustID = 0 ) then
                            iCustID := FCustomerRepository.CreateCustomer(sHerdName,sHerdIdentity,'','','','','','','','AIM CompCert HerdIdentity',true);
                     end;
               end;
         finally
            FRootNode := nil;
            FDocument := nil;
         end;
      finally
         FreeAndNil(AIMAnimalMovement);
      end;
end;

procedure TAimAnimalMovement.RecordHeifMoveOff;
var
   TempMovement : TTemporaryMovement;
   SaleEvent : TSaleDeathEvent;
   Animal : TAnimal;
   sError : String;
   qSelectedHeifers : TQuery;
   iCustID : Integer;
   sMovedTo : String;
begin
   if ( FAIMHeifers.FAIMHeiferTable.RecordCount = 0 ) then Exit;
   TfmAIMHeifTempTransfers.SaveTempTransfers;

   FAIMHeifers.FAIMHeiferTable.First;
   while ( not(FAIMHeifers.FAIMHeiferTable.Eof) ) do
      begin
         Animal := KRoutines.GetAnimal(FAIMHeifers.FAIMHeiferTable.FieldByName('AnimalID').AsInteger);
         if ( (FAIMHeifers.FAIMHeiferTable.FieldByName('Selected').AsBoolean) and
              (not(FAIMHeifers.FAIMHeiferTable.FieldByName('AddToXMLFile').AsBoolean)) ) then
            begin
               TempMovement := TTemporaryMovement.Create('TempMoves');
               try
                  with TempMovement do
                     try
                        Append;
                        AnimalID := Animal.Id;
                        AnimalLactNo := Animal.LactNo;
                        AnimalHerdID := Animal.HerdId;
                        EventType := TMovement;
                        EventComment := 'AIM Temp Transfer';
                        EventSource := sAIMTempTransfer;
                        EventDate := FAIMHeifers.FAIMHeiferTable.FieldByName('MoveDate').AsDateTime;
                        AID := FAIMHeifers.FAIMHeiferTable.FieldByName('AnimalID').AsInteger;
                        MovedTo := HerdLookup.GetTempMoveMovedToIDByHerdID(FAIMHeifers.FAIMHeiferTable.FieldByName('NewHerdID').AsString);
                        StillOffFarm := True;
                        Remark := EventComment;
                        Post;
                     except
                        Cancel;
                     end;
               finally
                  FreeAndNil(TempMovement);
               end;
            end
         else
            begin
               SaleEvent := TSaleDeathEvent.Create('SHEV');
               try
                  SaleEvent.Append;
                  try
                     SaleEvent.CanCheckWeaning := False;
                     SaleEvent.EventType := TSaleDeath;
                     SaleEvent.AnimalID := Animal.Id;
                     SaleEvent.AnimalLactNo := Animal.LactNo;
                     SaleEvent.AnimalHerdID := Animal.HerdId;
                     SaleEvent.EventSource  := sAIM;
                     SaleEvent.EventDate := FAIMHeifers.FAIMHeiferTable.FieldByName('MoveDate').AsDateTime;
                     SaleEvent.Sold := False;
                     SaleEvent.PreSale := False;
                     iCustID := FCustomerRepository.GetCustomer(FAIMHeifers.FAIMHeiferTable.FieldByName('NewHerdID').AsString);
                     if ( iCustID = 0 ) then
                        begin
                           sMovedTo := FAIMHeifers.FAIMHeiferTable.FieldByName('NewHerdID').AsString;
                           iCustID := FCustomerRepository.CreateCustomer(sMovedTo,sMovedTo,'','','','','','','','AIM Download',true);
                        end;
                     SaleEvent.Customer := iCustID;
                     SaleEvent.RenumberAfterPost := FRenumberAfterSale;
                     SaleEvent.RenumberFormat := FRenumberFormat;
                     SaleEvent.Post;
                  except
                     on e : Exception do
                        begin
                           if (IsWinherdDebugging) then
                              sError := Format('%s: Failed to create Sale/Death Event. [' + e.Message + ']',[Animal.NatIdNum])
                           else
                              sError := Format('%s: Failed to create Sale/Death Event.', [Animal.NatIdNum]);
                           FMovementSummary.AddMovementError(sError);
                           ApplicationLog.LogError(sError);
                           ApplicationLog.LogException(e);
                           SaleEvent.Cancel;
                        end
                  end;
               finally
                  FreeAndNil(SaleEvent);
               end;
            end;

         FMovementSummary.NoOfMovementsSucceeded := FMovementSummary.NoOfMovementsSucceeded+1;
         FMovementSummary.AddMovementSuccess(Animal.NatIdNum);

         FAIMHeifers.FAIMHeiferTable.Next;
      end;

   qSelectedHeifers := TQuery.Create(nil);
   try
      qSelectedHeifers.DatabaseName := AliasName;
      qSelectedHeifers.SQL.Clear;
      qSelectedHeifers.SQL.Add('SELECT AnimalID');
      qSelectedHeifers.SQL.Add('FROM '+FAIMHeifers.FAIMHeiferTable.TableName);
      qSelectedHeifers.SQL.Add('WHERE Selected = True');
      qSelectedHeifers.SQL.Add('AND   AddToXMLFile = True');
      qSelectedHeifers.Open;
      if ( qSelectedHeifers.RecordCount > 0 ) then
         TfmCreateAnimalXMLIHMFileProgress.ShowTheForm(qSelectedHeifers);
   finally
      qSelectedHeifers.Free;
   end;

end;

{ TMovementSummary }

procedure TMovementSummary.AddMovementError(AError: string);
begin
   FMovementsInError.Add(AError);
end;

procedure TMovementSummary.AddMovementSuccess(ANatIdNo: string);
begin
   FMovementsCreated.Add(ANatIdNo);
end;

procedure TMovementSummary.Initialize;
begin
   FMovementsInError.Clear;
   FMovementsCreated.Clear;
   FNoOfMovementsToProcess:= 0;
   FNoOfMovementsSucceeded:= 0;
   SetLength(FAnimals,0);
end;

constructor TMovementSummary.create(AMovementType : TMovementType);
begin
   MovementType := AMovementType;
   FMovementsInError := TStringList.Create;
   FMovementsCreated := TStringList.Create;
   Initialize();
end;

destructor TMovementSummary.destroy;
var
  i : Integer;
begin
  inherited;
  FreeAndNil(FMovementsInError);
  FreeAndNil(FMovementsCreated);
  SetLength(FAnimals,0);
end;

procedure TMovementSummary.AddAnimal(AId : Integer);
begin
   SetLength(FAnimals, Length(FAnimals)+1);
   FAnimals[Length(FAnimals)-1] := AId;
end;

end.
