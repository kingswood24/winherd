{
   18/02/13 [V5.1 R4.3] /MK Change - Added code back in for Purchase Group or AnimalGroup
                                     Store PurchaseGroup on new PurchaseGroup node

   20/10/16 [V5.6 R2.5] /MK Bug Fix - LotNumber and Grade left out of Import and Export Purchase XML files.

   27/03/18 [V5.7 R8.5] /MK Change - ProcessSaleXMLFile/ProcessPurchaseXMLFile - Show ProgressIndicator when importing the XML files.

   17/04/18 [V5.7 R8.8] /MK Change - Added CondemenedWeight variable to TSaleAnimal.

   25/05/18 [V5.8 R0.2] /MK Bug Fix - TCrushXMLImport - Moved ProcessXMLFiles into a public procedure.
                                                      - Destroy added override to declaration as Destory was not being called.
                                                      - When updating the sale event, only the sale details were updated not the event date of the sale
                                                        so if the date on the Crush database was a pre-sale event and there was a factory file read into
                                                        the office and added to the XML file, the date of the sale event after the XML import stayed as
                                                        the pre sale event date.
                            Change - TCrushXMLImport - Created a TempTable, FXMLSalesTable, that has the results of the sale events from the XML file.
                                                     - Loop through new table and process Sale Event.
                                                     - Create one instance of TSaleEvent and use Database.StartTransaction and Database.Commit.

   28/05/18 [V5.8 R0.2] /MK Change - TCrushXMLImport - Created a TempTable, FXMLPurchTable, that has the results of the purchase events on the XML file.
                                                     - Loop through new table and process Purchase Event.
                                                     - Create one instance of TSaleEvent and use Database.StartTransaction and Database.Commit.

   07/06/18 [V5.8 R0.6] /MK Change - Incorporated the animals NatIDNum into the Import and Export file.
                                   - ProcessSaleEvent, ProcessPurchaseEvent - If AnimalID does not exist then use NationalID number to locate animal.
                                                                            - If AnimalID does not exist and NationalID does exist then add to log file and process event.

   26/07/18 [V5.8 R1.4] /MK Bug Fix - ProcessPurchaseEvent - This bit of code was only checked if AnimalID was not found and NatID was used to search for animal.
                                                             This would in-turn create a duplicate purchase record for the animal.
}

unit uCrushXML;

interface

uses
  Controls, Dialogs, FileCtrl, Classes, SysUtils, ComObj, XML_Generator,
  MSXML2_TLB, GenTypesConst, db, dbTables, EventRecording, DateUtil,
  uProgressIndicator, uApplicationLog, uAnimal, KRoutines, uKillOutCalculator,
  uEventDataHelper;

type
   TXMLType = ( xmlSales, xmlPurchases );

   TDefaultHerdInfo = class
   private
      function GetDefaultHerdID: Integer;
   published
      property DefaultHerdID : Integer read GetDefaultHerdID;
    end;

   TPurchaseAnimal = record
      AnimalID, AnimalLactNo, SupplierID, PurBuyer : Integer;
      EventDate, TBTestDate, BruTestDate : TDateTime;
      AnimalWeight, AnimalPrice, SupplierCosts, BuyerCosts : Double;
      Grade, LotNo, NatIDNum : String;
   end;

   TSaleAnimal = record
      AnimalID, AnimalLactNo, EventID, CustomerID, SalesGroupID : Integer;
      EventDate, FeedEndDate, WeighingDate, TBTestDate, BruTestDate : TDateTime;
      AnimalWeight, AnimalPrice, CustomerCosts, KillOut, ColdDeadWt,
      CondemenedWeight, LeftWt, RightWt, PricePerKg : Double;
      KillNumber, Grade, CarcassSex, NatIDNum : String;
      PreSale, SoldStatus : Boolean;
   end;

   TCustomer = record
      Name, Address1, Address2, Address3, Address4, Address5,
      Phone, Fax, Email, BTEHerdNo : String;
      Deductions, Transport : Double;
   end;

   TBuyer = record
      Name, Address1, Address2, Address3, Address4, Address5,
      Phone, Fax, Email : String;
      Commission : Double;
      DefaultBuyer : Boolean;
   end;

   TSupplier = record
      Name, Address1, Address2, Address3, Address4, Address5,
      Phone, Fax, Email : String;
      Commission, Transport : Double;
   end;

   TSalesGroup = record
      GroupID, FileVersion, FileCreatedBy,
      CustomerID, RemittanceCount, RemittanceNumber, LotReference,
      ProducerReference, CarcaseCount : Integer;
      FileDate, RemittanceDate, SlaughterDate : TDateTime;
      FileType, PaymentNum : String;
      TotalValue, TotalDeductions, PaymentAmt : Double;
   end;

   TCrushGroup = record
      Code, Description, GroupType : String;
      CrushLoadComplete : Boolean;
      GroupDate : TDateTime;
      GroupID, DestSource : Integer;
   end;

   TAnimalGroup = record
      GroupID, AnimalID : Integer;
      DateJoined : TDateTime;
   end;

   TCrushXMLExport = class
   private
      FPurchaseRootNode, FPurchasedAnimal, FPurchaseChildNode : IXMLDOMNode;
      FSaleRootNode, FSoldAnimal, FSaleChildNode : IXMLDOMNode;
      FProcInstr : IXMLDOMProcessingInstruction;
      function AnimalExistsInXML(AAnimalID: Integer; AExportType : TCrushXMLFileType): Boolean;
      function XMLFileExists (AExportType : TCrushXMLFileType) : Boolean;
   public
      FPurchaseDocument : IXMLDOMDocument;
      FSaleDocument : IXMLDOMDocument;
      FPurchaseAnimal : TPurchaseAnimal;
      FSaleAnimal : TSaleAnimal;
      FCustomer : TCustomer;
      FBuyer : TBuyer;
      FSupplier : TSupplier;
      FSalesGroup : TSalesGroup;
      FCrushGroup : TCrushGroup;
      FAnimalGroup : TAnimalGroup;
      procedure CreateorOpenXMLFile(AExportType : TCrushXMLFileType);
      procedure AddAnimalToXMLFile(AExportType : TCrushXMLFileType);
      procedure AddLookupItemToXML;
      function IsValidEvent (AExportType : TCrushXMLFileType) : Boolean;
      constructor Create;
      destructor Destroy;override;
   end;

   TCrushXMLImport = class
   private
      FResultTable : TTable;
      FTotalPurchase,
      FTotalSales,
      FTotalSalesUpdated,
      FTotalCustomers,
      FTotalBuyers,
      FTotalSuppliers,
      FTotalSalesGroups,
      FTotalPurchGroups,
      FTotalAnimalGroups : Integer;
      FXMLType : TXMLType;
      FSoldAnimal : TSaleAnimal;
      FPurchaseAnimal : TPurchaseAnimal;
      FCustomer : TCustomer;
      FBuyer : TBuyer;
      FSupplier : TSupplier;
      FSalesGroup : TSalesGroup;
      FCrushGroup : TCrushGroup;
      FAnimalGroup : TAnimalGroup;

      FPurchaseGroupID : Integer;

      FPurchErrorList : TStringList;
      FSaleErrorList : TStringList;

      FXMLPurchTable,
      FXMLSalesTable : TTable;

      FSaleEvent : TSaleDeathEvent;

      FPurchaseEvent : TPurchaseEvent;

      FKillOutCalculator : TKillOutCalculator;

      FEventDataHelper : TEventDataHelper;

      FHerdInfo : TDefaultHerdInfo;

      procedure ProcessSaleXMLFile;
      procedure ProcessSaleEvent;
      procedure ProcessPurchaseXMLFile;
      procedure ProcessPurchaseEvent;
      procedure RenameReadFile(AXMLType : TXMLType);
      procedure MarkAnimalAsNotInHerd(AAnimalID : Integer);
      procedure ChangePreSaleEventDesc(AEventID: Integer);
      procedure UpdateTBAndBruTestDate(AAnimalID : Integer; ATBTestDate, ABruTestDate : TDateTime);
      procedure ProcessCustomer;
      procedure ProcessBuyer;
      procedure ProcessSupplier;
      procedure ProcessSalesGroup;
      procedure ProcessPurchGroup;
      procedure ProcessAnimalGroup;
   public
      procedure ProcessXMLFiles;
      constructor Create;
      destructor Destroy;override;
   end;

implementation

{ TCrushXMLExport }

constructor TCrushXMLExport.Create;
begin
   FPurchaseRootNode := nil;
   FPurchasedAnimal := nil;
   FPurchaseChildNode := nil;

   FSaleRootNode := nil;
   FSoldAnimal := nil;
   FSaleChildNode := nil;

   FProcInstr := nil;

   with FPurchaseAnimal do
      begin
         AnimalID := 0;
         NatIDNum := '';
         SupplierID := 0;
         PurBuyer := 0;
         EventDate := 0;
         AnimalWeight := 0;
         AnimalPrice := 0;
         SupplierCosts := 0;
         BuyerCosts := 0;
      end;

   with FSaleAnimal do
      begin
         AnimalID := 0;
         NatIDNum := '';
         EventID := 0;
         CustomerID := 0;
         EventDate := 0;
         FeedEndDate := 0;
         WeighingDate := 0;
         TBTestDate := 0;
         BruTestDate := 0;
         AnimalWeight := 0;
         AnimalPrice := 0;
         CustomerCosts := 0;
         KillOut := 0;
         ColdDeadWt := 0;
         KillNumber := '';
         Grade := '';
      end;

   with FCustomer do
      begin
         Name := '';
         Address1 := '';
         Address2 := '';
         Address3 := '';
         Address4 := '';
         Address5 := '';
         Phone := '';
         Fax := '';
         Email := '';
         BTEHerdNo := '';
         Deductions := 0;
         Transport := 0;
      end;

   with FBuyer do
      begin
         Name := '';
         Address1 := '';
         Address2 := '';
         Address3 := '';
         Address4 := '';
         Address5 := '';
         Phone := '';
         Fax := '';
         Email := '';
         Commission := 0;
      end;

   with FSupplier do
      begin
         Name := '';
         Address1 := '';
         Address2 := '';
         Address3 := '';
         Address4 := '';
         Address5 := '';
         Phone := '';
         Fax := '';
         Email := '';
         Commission := 0;
         Transport := 0;
      end;

    with FSalesGroup do
       begin
          GroupID := 0;
          FileVersion := 0;
          FileCreatedBy := 0;
          FileCreatedBy := 0;
          RemittanceCount := 0;
          RemittanceNumber := 0;
          LotReference := 0;
          ProducerReference := 0;
          CarcaseCount := 0;
          FileDate := 0;
          RemittanceDate := 0;
          SlaughterDate := 0;
          FileType := '';
          PaymentNum := '';
          TotalValue := 0;
          TotalDeductions := 0;
          PaymentAmt := 0;
       end;

   with FCrushGroup do
     begin
        Code := '';
        Description := '';
        GroupType := '';
        GroupDate := 0;
        DestSource := 0;
        GroupID := 0;
     end;

   with FAnimalGroup do
      begin
         GroupID := 0;
         AnimalID := 0;
         DateJoined := 0;
      end;

   if ( not(DirectoryExists(cCrushXMLFileLocation)) ) then
      ForceDirectories(cCrushXMLFileLocation);
end;

function TCrushXMLExport.XMLFileExists (AExportType : TCrushXMLFileType) : Boolean;
begin
   if (AExportType = etPurchase ) then
      Result := FileExists(cCrushXMLFileLocation+cCrushPurchaseXMLFileName)
   else if (AExportType = etSale ) then
      Result := FileExists(cCrushXMLFileLocation+cCrushSaleXMLFileName)
end;

function TCrushXMLExport.IsValidEvent(AExportType: TCrushXMLFileType): Boolean;
begin
   if ( AExportType = etPurchase ) then
      // Only add animal to file if it has Supplier and a price.
      Result := ( FPurchaseAnimal.AnimalID > 0 ) and ( FPurchaseAnimal.EventDate > 0 ) and
                ( FPurchaseAnimal.SupplierID > 0 ) and ( FPurchaseAnimal.AnimalPrice > 0 )
   else if ( AExportType = etSale ) then
      // Only add animal to file if its a sold animal and it has with a customer and a price
      // or if its a dead animal and it has a customer and no price.
      Result := ( FSaleAnimal.AnimalID > 0 ) and ( FSaleAnimal.EventDate > 0 ) and
                ( FSaleAnimal.CustomerID > 0 ) and
                ( ((FSaleAnimal.SoldStatus = False) and (FSaleAnimal.AnimalPrice = 0)) or (FSaleAnimal.AnimalPrice > 0) ) and
                ( FSaleAnimal.PreSale = False );
end;

procedure TCrushXMLExport.CreateorOpenXMLFile(AExportType : TCrushXMLFileType);
begin
   if not(XMLFileExists(AExportType)) then
      begin
         if ( AExportType = etPurchase ) then
            begin
               try
                  FPurchaseDocument := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
                  FProcInstr := FPurchaseDocument.createProcessingInstruction('xml', 'version="1.0" encoding="UTF-8"');
                  FPurchaseDocument.appendChild(FProcInstr);
                  FPurchaseRootNode := FPurchaseDocument.createElement('PurchasedAnimals');
                  FPurchaseDocument.appendChild(FPurchaseRootNode);
               except
                  raise Exception.Create('Error creating MSXML2.DOMDocument. Please contact Kingswood.');
               end;
            end
         else if ( AExportType = etSale ) then
            begin
               try
                  FSaleDocument := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
                  FProcInstr := FSaleDocument.createProcessingInstruction('xml', 'version="1.0" encoding="UTF-8"');
                  FSaleDocument.appendChild(FProcInstr);
                  FSaleRootNode := FSaleDocument.createElement('SoldAnimals');
                  FSaleDocument.appendChild(FSaleRootNode);
               except
                  raise Exception.Create('Error creating MSXML2.DOMDocument. Please contact Kingswood.');
               end;
            end;
      end
   else
      begin
         if ( AExportType = etPurchase ) then
            begin
               try
                  FPurchaseDocument := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
                  FPurchaseDocument.load(cCrushXMLFileLocation+cCrushPurchaseXMLFileName);
                  FPurchaseRootNode := FPurchaseDocument.Get_documentElement
               except
                  raise Exception.Create('Error creating MSXML2.DOMDocument. Please contact Kingswood.');
               end;
            end
         else if ( AExportType = etSale ) then
            begin
               try
                  FSaleDocument := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
                  FSaleDocument.load(cCrushXMLFileLocation+cCrushSaleXMLFileName);
                  FSaleRootNode := FSaleDocument.Get_documentElement
               except
                  raise Exception.Create('Error creating MSXML2.DOMDocument. Please contact Kingswood.');
               end;
            end;
      end;
end;

procedure TCrushXMLExport.AddAnimalToXMLFile(AExportType : TCrushXMLFileType);
var
   AnimalExists : Boolean;
begin
   if ( AExportType = etPurchase ) then
      AnimalExists := AnimalExistsInXML(FPurchaseAnimal.AnimalID, AExportType)
   else if ( AExportType = etSale ) then
      AnimalExists := AnimalExistsInXML(FSaleAnimal.AnimalID, AExportType);

   if ( not(AnimalExists) ) then
      begin
         if ( AExportType = etPurchase ) then
            begin
               if ( FPurchaseAnimal.AnimalID = 0 ) then Exit;

               FPurchasedAnimal := FPurchaseDocument.createElement('PurchasedAnimal');
               FPurchaseRootNode.appendChild(FPurchasedAnimal);

               FPurchaseChildNode := FPurchaseDocument.createElement('AnimalID');
               FPurchaseChildNode.Set_Text(IntToStr(FPurchaseAnimal.AnimalID));
               FPurchasedAnimal.appendChild(FPurchaseChildNode);

               FPurchaseChildNode := FPurchaseDocument.createElement('NatIDNum');
               FPurchaseChildNode.Set_Text(FPurchaseAnimal.NatIDNum);
               FPurchasedAnimal.appendChild(FPurchaseChildNode);

               FPurchaseChildNode := FPurchaseDocument.createElement('AnimalLactNo');
               FPurchaseChildNode.Set_Text(IntToStr(FPurchaseAnimal.AnimalLactNo));
               FPurchasedAnimal.appendChild(FPurchaseChildNode);

               FPurchaseChildNode := FPurchaseDocument.createElement('EventDate');
               FPurchaseChildNode.Set_Text(DateToStr(FPurchaseAnimal.EventDate));
               FPurchasedAnimal.appendChild(FPurchaseChildNode);

               FPurchaseChildNode := FPurchaseDocument.createElement('SupplierID');
               FPurchaseChildNode.Set_Text(IntToStr(FPurchaseAnimal.SupplierID));
               FPurchasedAnimal.appendChild(FPurchaseChildNode);

               FPurchaseChildNode := FPurchaseDocument.createElement('Price');
               FPurchaseChildNode.Set_Text(FloatToStr(FPurchaseAnimal.AnimalPrice));
               FPurchasedAnimal.appendChild(FPurchaseChildNode);

               FPurchaseChildNode := FPurchaseDocument.createElement('Weight');
               FPurchaseChildNode.Set_Text(FloatToStr(FPurchaseAnimal.AnimalWeight));
               FPurchasedAnimal.appendChild(FPurchaseChildNode);

               FPurchaseChildNode := FPurchaseDocument.createElement('PurBuyer');
               FPurchaseChildNode.Set_Text(IntToStr(FPurchaseAnimal.PurBuyer));
               FPurchasedAnimal.appendChild(FPurchaseChildNode);

               FPurchaseChildNode := FPurchaseDocument.createElement('Grade');
               FPurchaseChildNode.Set_Text(FPurchaseAnimal.Grade);
               FPurchasedAnimal.appendChild(FPurchaseChildNode);

               FPurchaseChildNode := FPurchaseDocument.createElement('LotNumber');
               FPurchaseChildNode.Set_Text(FPurchaseAnimal.LotNo);
               FPurchasedAnimal.appendChild(FPurchaseChildNode);

               FPurchaseChildNode := FPurchaseDocument.createElement('SupplierCosts');
               FPurchaseChildNode.Set_Text(FloatToStr(FPurchaseAnimal.SupplierCosts));
               FPurchasedAnimal.appendChild(FPurchaseChildNode);

               FPurchaseChildNode := FPurchaseDocument.createElement('BuyerCosts');
               FPurchaseChildNode.Set_Text(FloatToStr(FPurchaseAnimal.BuyerCosts));
               FPurchasedAnimal.appendChild(FPurchaseChildNode);

               FPurchaseChildNode := FPurchaseDocument.createElement('TBTestDate');
               if FPurchaseAnimal.TBTestDate > 0 then
                  FPurchaseChildNode.Set_Text(DateToStr(FPurchaseAnimal.TBTestDate))
               else
                  FPurchaseChildNode.Set_Text('');
               FPurchasedAnimal.appendChild(FPurchaseChildNode);

               FPurchaseChildNode := FPurchaseDocument.createElement('BruTestDate');
               if FPurchaseAnimal.TBTestDate > 0 then
                  FPurchaseChildNode.Set_Text(DateToStr(FPurchaseAnimal.BruTestDate))
               else
                  FPurchaseChildNode.Set_Text('');
               FPurchasedAnimal.appendChild(FPurchaseChildNode);

               FPurchaseDocument.documentElement.appendChild(FPurchasedAnimal);

               FPurchaseDocument.save(cCrushXMLFileLocation+cCrushPurchaseXMLFileName);
            end
         else if ( AExportType = etSale ) then
            begin
               if ( FSaleAnimal.AnimalID = 0 ) and ( FSaleAnimal.EventID = 0 ) then Exit;

               FSoldAnimal := FSaleDocument.createElement('SoldAnimal');
               FSaleRootNode.appendChild(FSoldAnimal);

               FSaleChildNode := FSaleDocument.createElement('AnimalID');
               FSaleChildNode.Set_Text(IntToStr(FSaleAnimal.AnimalID));
               FSoldAnimal.appendChild(FSaleChildNode);

               FSaleChildNode := FSaleDocument.createElement('NatIDNum');
               FSaleChildNode.Set_Text(FSaleAnimal.NatIDNum);
               FSoldAnimal.appendChild(FSaleChildNode);

               FSaleChildNode := FSaleDocument.createElement('AnimalLactNo');
               FSaleChildNode.Set_Text(IntToStr(FSaleAnimal.AnimalLactNo));
               FSoldAnimal.appendChild(FSaleChildNode);

               FSaleChildNode := FSaleDocument.createElement('EventID');
               FSaleChildNode.Set_Text(IntToStr(FSaleAnimal.EventID));
               FSoldAnimal.appendChild(FSaleChildNode);

               FSaleChildNode := FSaleDocument.createElement('EventDate');
               FSaleChildNode.Set_Text(DateToStr(FSaleAnimal.EventDate));
               FSoldAnimal.appendChild(FSaleChildNode);

               FSaleChildNode := FSaleDocument.createElement('SoldStatus');
               if FSaleAnimal.SoldStatus then
                  FSaleChildNode.Set_Text('True')
               else if not(FSaleAnimal.SoldStatus) then
                  FSaleChildNode.Set_Text('False');
               FSoldAnimal.appendChild(FSaleChildNode);

               FSaleChildNode := FSaleDocument.createElement('PreSale');
               if FSaleAnimal.PreSale then
                  FSaleChildNode.Set_Text('True')
               else if not(FSaleAnimal.PreSale) then
                  FSaleChildNode.Set_Text('False');
               FSoldAnimal.appendChild(FSaleChildNode);

               FSaleChildNode := FSaleDocument.createElement('CustomerID');
               FSaleChildNode.Set_Text(IntToStr(FSaleAnimal.CustomerID));
               FSoldAnimal.appendChild(FSaleChildNode);

               FSaleChildNode := FSaleDocument.createElement('Price');
               FSaleChildNode.Set_Text(FloatToStr(FSaleAnimal.AnimalPrice));
               FSoldAnimal.appendChild(FSaleChildNode);

               FSaleChildNode := FSaleDocument.createElement('Weight');
               FSaleChildNode.Set_Text(FloatToStr(FSaleAnimal.AnimalWeight));
               FSoldAnimal.appendChild(FSaleChildNode);

               FSaleChildNode := FSaleDocument.createElement('CustomerCosts');
               FSaleChildNode.Set_Text(FloatToStr(FSaleAnimal.CustomerCosts));
               FSoldAnimal.appendChild(FSaleChildNode);

               FSaleChildNode := FSaleDocument.createElement('KillOut');
               FSaleChildNode.Set_Text(FloatToStr(FSaleAnimal.KillOut));
               FSoldAnimal.appendChild(FSaleChildNode);

               FSaleChildNode := FSaleDocument.createElement('ColdDeadWt');
               FSaleChildNode.Set_Text(FloatToStr(FSaleAnimal.ColdDeadWt));
               FSoldAnimal.appendChild(FSaleChildNode);

               FSaleChildNode := FSaleDocument.createElement('LeftWt');
               FSaleChildNode.Set_Text(FloatToStr(FSaleAnimal.LeftWt));
               FSoldAnimal.appendChild(FSaleChildNode);

               FSaleChildNode := FSaleDocument.createElement('RightWt');
               FSaleChildNode.Set_Text(FloatToStr(FSaleAnimal.RightWt));
               FSoldAnimal.appendChild(FSaleChildNode);

               FSaleChildNode := FSaleDocument.createElement('PricePerKg');
               FSaleChildNode.Set_Text(FloatToStr(FSaleAnimal.PricePerKg));
               FSoldAnimal.appendChild(FSaleChildNode);

               FSaleChildNode := FSaleDocument.createElement('KillNumber');
               FSaleChildNode.Set_Text(FSaleAnimal.KillNumber);
               FSoldAnimal.appendChild(FSaleChildNode);

               FSaleChildNode := FSaleDocument.createElement('Grade');
               FSaleChildNode.Set_Text(FSaleAnimal.Grade);
               FSoldAnimal.appendChild(FSaleChildNode);

               FSaleChildNode := FSaleDocument.createElement('CarcassSex');
               FSaleChildNode.Set_Text(FSaleAnimal.CarcassSex);
               FSoldAnimal.appendChild(FSaleChildNode);

               FSaleChildNode := FSaleDocument.createElement('SalesGroupID');
               FSaleChildNode.Set_Text(IntToStr(FSaleAnimal.SalesGroupID));
               FSoldAnimal.appendChild(FSaleChildNode);

               FSaleChildNode := FSaleDocument.createElement('FeedEndDate');
               if ( FSaleAnimal.FeedEndDate > 0 ) then
                  FSaleChildNode.Set_Text(DateToStr(FSaleAnimal.FeedEndDate))
               else
                  FSaleChildNode.Set_Text('');
               FSoldAnimal.appendChild(FSaleChildNode);

               FSaleChildNode := FSaleDocument.createElement('WeighingDate');
               if ( FSaleAnimal.WeighingDate > 0 ) then
                  FSaleChildNode.Set_Text(DateToStr(FSaleAnimal.WeighingDate))
               else
                  FSaleChildNode.Set_Text('');
               FSoldAnimal.appendChild(FSaleChildNode);

               FSaleChildNode := FSaleDocument.createElement('TBTestDate');
               if ( FSaleAnimal.TBTestDate > 0 ) then
                  FSaleChildNode.Set_Text(DateToStr(FSaleAnimal.TBTestDate))
               else
                  FSaleChildNode.Set_Text('');
               FSoldAnimal.appendChild(FSaleChildNode);

               FSaleChildNode := FSaleDocument.createElement('BruTestDate');
               if ( FSaleAnimal.BruTestDate > 0 ) then
                  FSaleChildNode.Set_Text(DateToStr(FSaleAnimal.BruTestDate))
               else
                  FSaleChildNode.Set_Text('');
               FSoldAnimal.appendChild(FSaleChildNode);

               FSaleDocument.documentElement.appendChild(FSoldAnimal);

               FSaleDocument.save(cCrushXMLFileLocation+cCrushSaleXMLFileName);
            end;
      end;
end;

function TCrushXMLExport.AnimalExistsInXML(AAnimalID : Integer;
   AExportType : TCrushXMLFileType) : Boolean;
var
   AnimalsNodeList,
   AnimalNodeList : IXMLDOMNodeList;
   AnimalsRootNode,
   AnimalsNode,
   AnimalNode,
   ChildNode : IXMLDOMNode;
   FieldValue : String;
   i, j : Integer;
begin
   Result := False;

   if ( AExportType = etPurchase ) then
      AnimalsNodeList := FPurchaseDocument.getElementsByTagName('PurchasedAnimals')
   else if ( AExportType = etSale ) then
      AnimalsNodeList := FSaleDocument.getElementsByTagName('SoldAnimals');

   for i := 0 to AnimalsNodeList.Get_length-1 do
      begin
         AnimalsNode := AnimalsNodeList.item[i];
         if ( AnimalsNode = nil ) then Continue;

         if ( AExportType = etPurchase ) then
            AnimalsRootNode := AnimalsNode.selectSingleNode('PurchasedAnimal')
         else if ( AExportType = etSale ) then
            AnimalsRootNode := AnimalsNode.selectSingleNode('SoldAnimal');
         if ( AnimalsRootNode = nil ) then Continue;

         AnimalNodeList := AnimalsRootNode.selectNodes('AnimalID');
         if ( AnimalNodeList = nil ) then Continue;

         for j := 0 to AnimalNodeList.Get_length-1 do
           begin
              ChildNode := AnimalNodeList.item[j];
              if ChildNode.nodeName = 'AnimalID' then
                 begin
                    FieldValue := ChildNode.text;

                    Result := AAnimalID = StrToInt(FieldValue);
                    if Result then Exit;
                 end;
           end;
      end;
end;

procedure TCrushXMLExport.AddLookupItemToXML;
var
  RootNode, ChildNode : IXMLDOMNode;
begin
   if ( FCustomer.Name <> '' ) then
     begin
        RootNode := FSaleDocument.createElement('Customer');
        FSaleRootNode.appendChild(RootNode);

        ChildNode := FSaleDocument.createElement('Name');
        ChildNode.Set_Text(FCustomer.Name);
        RootNode.appendChild(ChildNode);

        ChildNode := FSaleDocument.createElement('Address1');
        ChildNode.Set_Text(FCustomer.Address1);
        RootNode.appendChild(ChildNode);

        ChildNode := FSaleDocument.createElement('Address2');
        ChildNode.Set_Text(FCustomer.Address2);
        RootNode.appendChild(ChildNode);

        ChildNode := FSaleDocument.createElement('Address3');
        ChildNode.Set_Text(FCustomer.Address3);
        RootNode.appendChild(ChildNode);

        ChildNode := FSaleDocument.createElement('Address4');
        ChildNode.Set_Text(FCustomer.Address4);
        RootNode.appendChild(ChildNode);

        ChildNode := FSaleDocument.createElement('Address5');
        ChildNode.Set_Text(FCustomer.Address5);
        RootNode.appendChild(ChildNode);

        ChildNode := FSaleDocument.createElement('Phone');
        ChildNode.Set_Text(FCustomer.Phone);
        RootNode.appendChild(ChildNode);

        ChildNode := FSaleDocument.createElement('Fax');
        ChildNode.Set_Text(FCustomer.Fax);
        RootNode.appendChild(ChildNode);

        ChildNode := FSaleDocument.createElement('Email');
        ChildNode.Set_Text(FCustomer.Email);
        RootNode.appendChild(ChildNode);

        ChildNode := FSaleDocument.createElement('BTEHerdNo');
        ChildNode.Set_Text(FCustomer.BTEHerdNo);
        RootNode.appendChild(ChildNode);

        ChildNode := FSaleDocument.createElement('Deductions');
        ChildNode.Set_Text(FloatToStr(FCustomer.Deductions));
        RootNode.appendChild(ChildNode);

        ChildNode := FSaleDocument.createElement('Transport');
        ChildNode.Set_Text(FloatToStr(FCustomer.Transport));
        RootNode.appendChild(ChildNode);

        FSaleDocument.documentElement.appendChild(RootNode);

        FSaleDocument.save(cCrushXMLFileLocation+cCrushSaleXMLFileName);
     end;

   if ( FSalesGroup.GroupID > 0 ) then
      begin
         RootNode := FSaleDocument.createElement('SalesGroup');
         FSaleRootNode.appendChild(RootNode);

         ChildNode := FSaleDocument.createElement('GroupID');
         ChildNode.Set_Text(IntToStr(FSalesGroup.GroupID));
         RootNode.appendChild(ChildNode);

         ChildNode := FSaleDocument.createElement('FileVersion');
         ChildNode.Set_Text(IntToStr(FSalesGroup.FileVersion));
         RootNode.appendChild(ChildNode);

         ChildNode := FSaleDocument.createElement('FileCreatedBy');
         ChildNode.Set_Text(IntToStr(FSalesGroup.FileCreatedBy));
         RootNode.appendChild(ChildNode);

         ChildNode := FSaleDocument.createElement('CustomerID');
         ChildNode.Set_Text(IntToStr(FSalesGroup.CustomerID));
         RootNode.appendChild(ChildNode);

         ChildNode := FSaleDocument.createElement('RemittanceCount');
         ChildNode.Set_Text(IntToStr(FSalesGroup.RemittanceCount));
         RootNode.appendChild(ChildNode);

         ChildNode := FSaleDocument.createElement('RemittanceNumber');
         ChildNode.Set_Text(IntToStr(FSalesGroup.RemittanceNumber));
         RootNode.appendChild(ChildNode);

         ChildNode := FSaleDocument.createElement('LotReference');
         ChildNode.Set_Text(IntToStr(FSalesGroup.LotReference));
         RootNode.appendChild(ChildNode);

         ChildNode := FSaleDocument.createElement('ProducerReference');
         ChildNode.Set_Text(IntToStr(FSalesGroup.ProducerReference));
         RootNode.appendChild(ChildNode);

         ChildNode := FSaleDocument.createElement('CarcaseCount');
         ChildNode.Set_Text(IntToStr(FSalesGroup.CarcaseCount));
         RootNode.appendChild(ChildNode);

         ChildNode := FSaleDocument.createElement('CarcaseCount');
         ChildNode.Set_Text(IntToStr(FSalesGroup.CarcaseCount));
         RootNode.appendChild(ChildNode);

         ChildNode := FSaleDocument.createElement('FileDate');
         ChildNode.Set_Text(DateToStr(FSalesGroup.FileDate));
         RootNode.appendChild(ChildNode);

         ChildNode := FSaleDocument.createElement('RemittanceDate');
         ChildNode.Set_Text(DateToStr(FSalesGroup.RemittanceDate));
         RootNode.appendChild(ChildNode);

         ChildNode := FSaleDocument.createElement('SlaughterDate');
         ChildNode.Set_Text(DateToStr(FSalesGroup.SlaughterDate));
         RootNode.appendChild(ChildNode);

         ChildNode := FSaleDocument.createElement('FileType');
         ChildNode.Set_Text(FSalesGroup.FileType);
         RootNode.appendChild(ChildNode);

         ChildNode := FSaleDocument.createElement('PaymentNum');
         ChildNode.Set_Text(FSalesGroup.PaymentNum);
         RootNode.appendChild(ChildNode);

         ChildNode := FSaleDocument.createElement('TotalValue');
         ChildNode.Set_Text(FloatToStr(FSalesGroup.TotalValue));
         RootNode.appendChild(ChildNode);

         ChildNode := FSaleDocument.createElement('TotalDeductions');
         ChildNode.Set_Text(FloatToStr(FSalesGroup.TotalDeductions));
         RootNode.appendChild(ChildNode);

         ChildNode := FSaleDocument.createElement('PaymentAmt');
         ChildNode.Set_Text(FloatToStr(FSalesGroup.PaymentAmt));
         RootNode.appendChild(ChildNode);

         FSaleDocument.documentElement.appendChild(RootNode);

         FSaleDocument.save(cCrushXMLFileLocation+cCrushSaleXMLFileName);
      end;

   if ( FBuyer.Name <> '' ) then
     begin
        RootNode := FPurchaseDocument.createElement('Buyer');
        FPurchaseRootNode.appendChild(RootNode);

        ChildNode := FPurchaseDocument.createElement('Name');
        ChildNode.Set_Text(FBuyer.Name);
        RootNode.appendChild(ChildNode);

        ChildNode := FPurchaseDocument.createElement('Address1');
        ChildNode.Set_Text(FBuyer.Address1);
        RootNode.appendChild(ChildNode);

        ChildNode := FPurchaseDocument.createElement('Address2');
        ChildNode.Set_Text(FBuyer.Address2);
        RootNode.appendChild(ChildNode);

        ChildNode := FPurchaseDocument.createElement('Address3');
        ChildNode.Set_Text(FBuyer.Address3);
        RootNode.appendChild(ChildNode);

        ChildNode := FPurchaseDocument.createElement('Address4');
        ChildNode.Set_Text(FBuyer.Address4);
        RootNode.appendChild(ChildNode);

        ChildNode := FPurchaseDocument.createElement('Address5');
        ChildNode.Set_Text(FBuyer.Address5);
        RootNode.appendChild(ChildNode);

        ChildNode := FPurchaseDocument.createElement('Phone');
        ChildNode.Set_Text(FBuyer.Phone);
        RootNode.appendChild(ChildNode);

        ChildNode := FPurchaseDocument.createElement('Fax');
        ChildNode.Set_Text(FBuyer.Fax);
        RootNode.appendChild(ChildNode);

        ChildNode := FPurchaseDocument.createElement('Email');
        ChildNode.Set_Text(FBuyer.Email);
        RootNode.appendChild(ChildNode);

        ChildNode := FPurchaseDocument.createElement('Commission');
        ChildNode.Set_Text(FloatToStr(FBuyer.Commission));
        RootNode.appendChild(ChildNode);

        ChildNode := FPurchaseDocument.createElement('DefaultBuyer');
        if FBuyer.DefaultBuyer then
           ChildNode.Set_Text('True')
        else if ( not(FBuyer.DefaultBuyer) ) then
           ChildNode.Set_Text('False');
        RootNode.appendChild(ChildNode);

        FPurchaseDocument.documentElement.appendChild(RootNode);

        FPurchaseDocument.save(cCrushXMLFileLocation+cCrushPurchaseXMLFileName);
     end;

   if ( FSupplier.Name <> '' ) then
     begin
        RootNode := FPurchaseDocument.createElement('Supplier');
        FPurchaseRootNode.appendChild(RootNode);

        ChildNode := FPurchaseDocument.createElement('Name');
        ChildNode.Set_Text(FSupplier.Name);
        RootNode.appendChild(ChildNode);

        ChildNode := FPurchaseDocument.createElement('Address1');
        ChildNode.Set_Text(FSupplier.Address1);
        RootNode.appendChild(ChildNode);

        ChildNode := FPurchaseDocument.createElement('Address2');
        ChildNode.Set_Text(FSupplier.Address2);
        RootNode.appendChild(ChildNode);

        ChildNode := FPurchaseDocument.createElement('Address3');
        ChildNode.Set_Text(FSupplier.Address3);
        RootNode.appendChild(ChildNode);

        ChildNode := FPurchaseDocument.createElement('Address4');
        ChildNode.Set_Text(FSupplier.Address4);
        RootNode.appendChild(ChildNode);

        ChildNode := FPurchaseDocument.createElement('Address5');
        ChildNode.Set_Text(FSupplier.Address5);
        RootNode.appendChild(ChildNode);

        ChildNode := FPurchaseDocument.createElement('Phone');
        ChildNode.Set_Text(FSupplier.Phone);
        RootNode.appendChild(ChildNode);

        ChildNode := FPurchaseDocument.createElement('Fax');
        ChildNode.Set_Text(FSupplier.Fax);
        RootNode.appendChild(ChildNode);

        ChildNode := FPurchaseDocument.createElement('Email');
        ChildNode.Set_Text(FSupplier.Email);
        RootNode.appendChild(ChildNode);

        ChildNode := FPurchaseDocument.createElement('Commission');
        ChildNode.Set_Text(FloatToStr(FSupplier.Commission));
        RootNode.appendChild(ChildNode);

        ChildNode := FPurchaseDocument.createElement('Transport');
        ChildNode.Set_Text(FloatToStr(FSupplier.Transport));
        RootNode.appendChild(ChildNode);

        FPurchaseDocument.documentElement.appendChild(RootNode);

        FPurchaseDocument.save(cCrushXMLFileLocation+cCrushPurchaseXMLFileName);
     end;

   if ( FCrushGroup.Code <> '' ) then
      begin
         RootNode := FPurchaseDocument.createElement('PurchGroup');
         FPurchaseRootNode.appendChild(RootNode);

         ChildNode := FPurchaseDocument.createElement('GroupID');
         ChildNode.Set_Text(IntToStr(FCrushGroup.GroupID));
         RootNode.appendChild(ChildNode);

         ChildNode := FPurchaseDocument.createElement('Code');
         ChildNode.Set_Text(FCrushGroup.Code);
         RootNode.appendChild(ChildNode);

         ChildNode := FPurchaseDocument.createElement('Description');
         ChildNode.Set_Text(FCrushGroup.Description);
         RootNode.appendChild(ChildNode);

         ChildNode := FPurchaseDocument.createElement('GroupType');
         ChildNode.Set_Text(FCrushGroup.GroupType);
         RootNode.appendChild(ChildNode);

         ChildNode := FPurchaseDocument.createElement('DestSource');
         ChildNode.Set_Text(IntToStr(FCrushGroup.DestSource));
         RootNode.appendChild(ChildNode);

         ChildNode := FPurchaseDocument.createElement('GroupDate');
         ChildNode.Set_Text(DateToStr(FCrushGroup.GroupDate));
         RootNode.appendChild(ChildNode);

         ChildNode := FPurchaseDocument.createElement('CrushLoadComplete');
         if ( FCrushGroup.CrushLoadComplete = True ) then
            ChildNode.Set_Text('True')
         else if ( FCrushGroup.CrushLoadComplete = False ) then
            ChildNode.Set_Text('False');
         RootNode.appendChild(ChildNode);

        FPurchaseDocument.documentElement.appendChild(RootNode);

        FPurchaseDocument.save(cCrushXMLFileLocation+cCrushPurchaseXMLFileName);
      end;

   if ( FAnimalGroup.GroupID > 0 ) then
      begin
         RootNode := FPurchaseDocument.createElement('AnimalGroup');
         FPurchaseRootNode.appendChild(RootNode);

         ChildNode := FPurchaseDocument.createElement('GroupID');
         ChildNode.Set_Text(IntToStr(FAnimalGroup.GroupID));
         RootNode.appendChild(ChildNode);

         ChildNode := FPurchaseDocument.createElement('AnimalID');
         ChildNode.Set_Text(IntToStr(FAnimalGroup.AnimalID));
         RootNode.appendChild(ChildNode);

         ChildNode := FPurchaseDocument.createElement('DateJoined');
         ChildNode.Set_Text(DateToStr(FAnimalGroup.DateJoined));
         RootNode.appendChild(ChildNode);

         FPurchaseDocument.documentElement.appendChild(RootNode);

         FPurchaseDocument.save(cCrushXMLFileLocation+cCrushPurchaseXMLFileName);
      end;
end;

destructor TCrushXMLExport.Destroy;
begin
end;

{ TCrushXMLImport }

constructor TCrushXMLImport.Create;
begin
   FPurchErrorList := TStringList.Create;
   FSaleErrorList := TStringList.Create;

   FXMLSalesTable := TTable.Create(nil);
   FXMLSalesTable.DatabaseName := AliasName;
   FXMLSalesTable.TableName := 'tmpXMLSales';
   FXMLSalesTable.FieldDefs.Clear;
   FXMLSalesTable.FieldDefs.Add('ID',ftAutoInc);
   FXMLSalesTable.FieldDefs.Add('AnimalID',ftInteger);
   FXMLSalesTable.FieldDefs.Add('NatIDNum',ftString,20);
   FXMLSalesTable.FieldDefs.Add('AnimalLactNo',ftInteger);
   FXMLSalesTable.FieldDefs.Add('EventDate',ftDateTime);
   FXMLSalesTable.FieldDefs.Add('SoldStatus',ftBoolean);
   FXMLSalesTable.FieldDefs.Add('PreSale',ftBoolean);
   FXMLSalesTable.FieldDefs.Add('CustomerID',ftInteger);
   FXMLSalesTable.FieldDefs.Add('Price',ftFloat);
   FXMLSalesTable.FieldDefs.Add('PricePerKg',ftFloat);
   FXMLSalesTable.FieldDefs.Add('Weight',ftFloat);
   FXMLSalesTable.FieldDefs.Add('LWeight',ftFloat);
   FXMLSalesTable.FieldDefs.Add('RWeight',ftFloat);
   FXMLSalesTable.FieldDefs.Add('CustomerCosts',ftFloat);
   FXMLSalesTable.FieldDefs.Add('ColdDeadWt',ftFloat);
   FXMLSalesTable.FieldDefs.Add('KillNumber',ftString,15);
   FXMLSalesTable.FieldDefs.Add('Grade',ftString,15);
   FXMLSalesTable.FieldDefs.Add('CarcassSex',ftString,1);
   FXMLSalesTable.FieldDefs.Add('SalesGroupID',ftInteger);
   FXMLSalesTable.IndexDefs.Clear;
   FXMLSalesTable.IndexDefs.Add('iID','ID',[ixUnique,ixPrimary]);
   FXMLSalesTable.IndexDefs.Add('iAnimalID','AnimalID',[ixUnique]);
   FXMLSalesTable.CreateTable;
   FXMLSalesTable.Open;

   FXMLPurchTable := TTable.Create(nil);
   FXMLPurchTable.DatabaseName := AliasName;
   FXMLPurchTable.TableName := 'tmpXMLPurch';
   FXMLPurchTable.FieldDefs.Clear;
   FXMLPurchTable.FieldDefs.Add('ID',ftAutoInc);
   FXMLPurchTable.FieldDefs.Add('AnimalID',ftInteger);
   FXMLPurchTable.FieldDefs.Add('NatIDNum',ftString,20);
   FXMLPurchTable.FieldDefs.Add('AnimalLactNo',ftInteger);
   FXMLPurchTable.FieldDefs.Add('EventDate',ftDateTime);
   FXMLPurchTable.FieldDefs.Add('SupplierID',ftInteger);
   FXMLPurchTable.FieldDefs.Add('AnimalPrice',ftFloat);
   FXMLPurchTable.FieldDefs.Add('AnimalWeight',ftFloat);
   FXMLPurchTable.FieldDefs.Add('Grade',ftString,15);
   FXMLPurchTable.FieldDefs.Add('LotNo',ftString,10);
   FXMLPurchTable.FieldDefs.Add('PurBuyer',ftInteger);
   FXMLPurchTable.FieldDefs.Add('SupplierCosts',ftFloat);
   FXMLPurchTable.FieldDefs.Add('BuyerCosts',ftFloat);
   FXMLPurchTable.IndexDefs.Clear;
   FXMLPurchTable.IndexDefs.Add('iID','ID',[ixUnique,ixPrimary]);
   FXMLPurchTable.IndexDefs.Add('iAnimalID','AnimalID',[ixUnique]);
   FXMLPurchTable.CreateTable;
   FXMLPurchTable.Open;

   FKillOutCalculator := TKillOutCalculator.Create;

   FEventDataHelper := TEventDataHelper.Create;
end;

procedure TCrushXMLImport.ProcessXMLFiles;
begin
   if FileExists(cCrushXMLFileLocation+cCrushPurchaseXMLFileName) then
      begin
         if ( MessageDlg('Purchase file found. Do you want to import this file?',mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
            begin
               ProcessPurchaseXMLFile;
               if ( FTotalPurchase > 0 ) then
                  begin
                     MessageDlg(Format('%d Purchase Events saved.',[FTotalPurchase]),mtInformation,[mbOK],0);
                     RenameReadFile(xmlPurchases);
                  end
               else if ( FTotalSuppliers > 0 ) or ( FTotalBuyers > 0 ) or
                       ( FTotalPurchGroups > 0 ) or ( FTotalAnimalGroups > 0 ) then
                  RenameReadFile(xmlPurchases);
            end;
      end;

   if FileExists(cCrushXMLFileLocation+cCrushSaleXMLFileName) then
      begin
         if ( MessageDlg('Sale file found. Do you want to import this file?',mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
            begin
               ProcessSaleXMLFile;
               if ( FTotalSales > 0 ) then
                  begin
                     if ( FTotalSalesUpdated > 0 ) then
                        MessageDlg(Format('%d (%d Updated, %d New) Sale Events saved.',
                                          [(FTotalSales + FTotalSalesUpdated),FTotalSalesUpdated,FTotalSales]),
                                          mtInformation,[mbOK],0)
                     else
                        MessageDlg(Format('%d Sale Events saved.',[FTotalSales]),mtInformation,[mbOK],0);
                     RenameReadFile(xmlSales);
                  end
               else if ( FTotalCustomers > 0 ) or ( FTotalSalesGroups > 0 ) then
                  RenameReadFile(xmlSales);
            end
         else
            Exit;
      end;
end;

procedure TCrushXMLImport.UpdateTBAndBruTestDate(AAnimalID : Integer;
   ATBTestDate, ABruTestDate : TDateTime);
var
   UpdateQuery : TQuery;
begin
   UpdateQuery := TQuery.Create(nil);
   with UpdateQuery do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('UPDATE Animals');

         if ( ATBTestDate > 0 ) and ( ABruTestDate > 0 )  then
            begin
               SQL.Add('SET TBTestDate = "'+FormatDateTime(cUSDateStyle,ATBTestDate)+'", ');
               SQL.Add('    Brucellosis = "'+FormatDateTime(cUSDateStyle,ABruTestDate)+'" ');
            end
         else if ( ATBTestDate > 0 ) and ( ABruTestDate = 0 ) then
            SQL.Add('SET TBTestDate = "'+FormatDateTime(cUSDateStyle,ATBTestDate)+'" ')
         else if ( ABruTestDate > 0 ) and ( ATBTestDate = 0 ) then
            SQL.Add('SET Brucellosis = "'+FormatDateTime(cUSDateStyle,ABruTestDate)+'" ');

         SQL.Add('WHERE ID = '+IntToStr(AAnimalID)+' ');

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

procedure TCrushXMLImport.ProcessPurchaseXMLFile;
var
   PurchDocument : IXMLDOMDocument;
   PurchAnimalNode,
   BuyerNode,
   SupplierNode,
   PurchGroupNode,
   AnimalGroupNode : IXMLDOMNode;
   NodeName : String;
   i : Integer;
begin
   FTotalPurchase := 0;
   FTotalSuppliers := 0;
   FTotalBuyers := 0;
   FTotalPurchGroups := 0;
   FTotalAnimalGroups := 0;

   PurchDocument := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
   PurchDocument.load(cCrushXMLFileLocation+cCrushPurchaseXMLFileName);

   if ( PurchDocument.documentElement.childNodes.Get_length > 0 ) then
      begin
         ShowProgressIndicator('Processing Purchase XML File',0,PurchDocument.documentElement.childNodes.Get_length,1,False,True);
         ProgressIndicator.Max := PurchDocument.documentElement.childNodes.Get_length;
         for i := 0 to PurchDocument.documentElement.childNodes.Get_length-1 do
            begin
               NodeName := PurchDocument.documentElement.childNodes[i].Get_nodeName;
               if ( NodeName = 'PurchasedAnimal' ) then
                  try
                     FXMLPurchTable.Append;

                     PurchAnimalNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('AnimalID');
                     if (PurchAnimalNode = nil) or (Trim(PurchAnimalNode.text) = '') then Continue;
                     FXMLPurchTable.FieldByName('AnimalID').AsInteger := StrToInt(PurchAnimalNode.Text);

                     PurchAnimalNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('AnimalLactNo');
                     if (PurchAnimalNode = nil) or (Trim(PurchAnimalNode.text) = '') then Continue;
                     FXMLPurchTable.FieldByName('AnimalLactNo').AsInteger := StrToInt(PurchAnimalNode.Text);

                     PurchAnimalNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('EventDate');
                     if (PurchAnimalNode = nil) or (Trim(PurchAnimalNode.text) = '') then Continue;
                     FXMLPurchTable.FieldByName('EventDate').AsDateTime := StrToDate(PurchAnimalNode.Text);

                     PurchAnimalNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('SupplierID');
                     if (PurchAnimalNode = nil) or (Trim(PurchAnimalNode.text) = '') then Continue;
                     FXMLPurchTable.FieldByName('SupplierID').AsInteger := StrToInt(PurchAnimalNode.Text);

                     PurchAnimalNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('NatIDNum');
                     if ( not(PurchAnimalNode = nil) ) or ( Length(Trim(PurchAnimalNode.text)) > 0 ) then
                        FXMLPurchTable.FieldByName('NatIDNum').AsString := PurchAnimalNode.Text;

                     PurchAnimalNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Price');
                     if ( not(PurchAnimalNode = nil) ) or ( Length(Trim(PurchAnimalNode.text)) > 0 ) then
                        FXMLPurchTable.FieldByName('AnimalPrice').AsFloat := StrToFloat(PurchAnimalNode.Text);

                     PurchAnimalNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Weight');
                     if ( not(PurchAnimalNode = nil) ) or ( Length(Trim(PurchAnimalNode.text)) > 0 ) then
                        FXMLPurchTable.FieldByName('AnimalWeight').AsFloat := StrToFloat(PurchAnimalNode.Text);

                     PurchAnimalNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Grade');
                     if ( not(PurchAnimalNode = nil) ) or ( Length(Trim(PurchAnimalNode.text)) > 0 ) then
                        FXMLPurchTable.FieldByName('Grade').AsString := PurchAnimalNode.Text;

                     PurchAnimalNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('LotNumber');
                     if ( not(PurchAnimalNode = nil) ) or ( Length(Trim(PurchAnimalNode.text)) > 0 ) then
                        FXMLPurchTable.FieldByName('LotNo').AsString := PurchAnimalNode.Text;

                     PurchAnimalNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('PurBuyer');
                     if ( not(PurchAnimalNode = nil) ) or ( Length(Trim(PurchAnimalNode.text)) > 0 ) then
                        FXMLPurchTable.FieldByName('PurBuyer').AsInteger := StrToInt(PurchAnimalNode.Text);

                     PurchAnimalNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('SupplierCosts');
                     if ( not(PurchAnimalNode = nil) ) or ( Length(Trim(PurchAnimalNode.text)) > 0 ) then
                        FXMLPurchTable.FieldByName('SupplierCosts').AsFloat := StrToFloat(PurchAnimalNode.Text);

                     PurchAnimalNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('BuyerCosts');
                     if ( not(PurchAnimalNode = nil) ) or ( Length(Trim(PurchAnimalNode.text)) > 0 ) then
                        FXMLPurchTable.FieldByName('BuyerCosts').AsFloat := StrToFloat(PurchAnimalNode.Text);

                     FXMLPurchTable.Post;
                  except
                     FXMLPurchTable.Cancel;
                  end
               else if ( NodeName = 'Supplier' ) then
                  begin
                     SupplierNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Name');
                     if (SupplierNode = nil) or (Trim(SupplierNode.text) = '') then Continue;
                     FSupplier.Name := SupplierNode.Text;

                     SupplierNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Address1');
                     if ( not(SupplierNode = nil) ) or ( Length(Trim(SupplierNode.text)) > 0 ) then
                        FSupplier.Address1 := SupplierNode.Text;

                     SupplierNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Address2');
                     if ( not(SupplierNode = nil) ) or ( Length(Trim(SupplierNode.text)) > 0 ) then
                        FSupplier.Address2 := SupplierNode.Text;

                     SupplierNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Address3');
                     if ( not(SupplierNode = nil) ) or ( Length(Trim(SupplierNode.text)) > 0 ) then
                        FSupplier.Address3 := SupplierNode.Text;

                     SupplierNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Address4');
                     if ( not(SupplierNode = nil) ) or ( Length(Trim(SupplierNode.text)) > 0 ) then
                        FSupplier.Address4 := SupplierNode.Text;

                     SupplierNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Address5');
                     if ( not(SupplierNode = nil) ) or ( Length(Trim(SupplierNode.text)) > 0 ) then
                        FSupplier.Address5 := SupplierNode.Text;

                     SupplierNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Phone');
                     if ( not(SupplierNode = nil) ) or ( Length(Trim(SupplierNode.text)) > 0 ) then
                        FSupplier.Phone := SupplierNode.Text;

                     SupplierNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Fax');
                     if ( not(SupplierNode = nil) ) or ( Length(Trim(SupplierNode.text)) > 0 ) then
                        FSupplier.Fax := SupplierNode.Text;

                     SupplierNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Email');
                     if ( not(SupplierNode = nil) ) or ( Length(Trim(SupplierNode.text)) > 0 ) then
                        FSupplier.Email := SupplierNode.Text;

                     SupplierNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Commission');
                     if ( not(SupplierNode = nil) ) or ( Length(Trim(SupplierNode.text)) > 0 ) then
                        FSupplier.Commission := StrToFloat(SupplierNode.Text);

                     SupplierNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Transport');
                     if ( not(SupplierNode = nil) ) or ( Length(Trim(SupplierNode.text)) > 0 ) then
                        FSupplier.Transport := StrToFloat(SupplierNode.Text);

                     ProcessSupplier;

                  end
               else if ( NodeName = 'Buyer' ) then
                  begin
                     BuyerNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Name');
                     if (BuyerNode = nil) or (Trim(BuyerNode.text) = '') then Continue;
                     FBuyer.Name := BuyerNode.Text;

                     BuyerNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Address1');
                     if ( not(BuyerNode = nil) ) or ( Length(Trim(BuyerNode.text)) > 0 ) then
                        FBuyer.Address1 := BuyerNode.Text;

                     BuyerNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Address2');
                     if ( not(BuyerNode = nil) ) or ( Length(Trim(BuyerNode.text)) > 0 ) then
                        FBuyer.Address2 := BuyerNode.Text;

                     BuyerNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Address3');
                     if ( not(BuyerNode = nil) ) or ( Length(Trim(BuyerNode.text)) > 0 ) then
                        FBuyer.Address3 := BuyerNode.Text;

                     BuyerNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Address4');
                     if ( not(BuyerNode = nil) ) or ( Length(Trim(BuyerNode.text)) > 0 ) then
                        FBuyer.Address4 := BuyerNode.Text;

                     BuyerNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Address5');
                     if ( not(BuyerNode = nil) ) or ( Length(Trim(BuyerNode.text)) > 0 ) then
                        FBuyer.Address5 := BuyerNode.Text;

                     BuyerNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Phone');
                     if ( not(BuyerNode = nil) ) or ( Length(Trim(BuyerNode.text)) > 0 ) then
                        FBuyer.Phone := BuyerNode.Text;

                     BuyerNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Fax');
                     if ( not(BuyerNode = nil) ) or ( Length(Trim(BuyerNode.text)) > 0 ) then
                        FBuyer.Fax := BuyerNode.Text;

                     BuyerNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Email');
                     if ( not(BuyerNode = nil) ) or ( Length(Trim(BuyerNode.text)) > 0 ) then
                        FBuyer.Email := BuyerNode.Text;

                     BuyerNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Commission');
                     if ( not(BuyerNode = nil) ) or ( Length(Trim(BuyerNode.text)) > 0 ) then
                        FBuyer.Commission := StrToFloat(BuyerNode.Text);

                     BuyerNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('DefaultBuyer');
                     if ( not(BuyerNode = nil) ) or ( Length(Trim(BuyerNode.text)) > 0 ) then
                        begin
                           if BuyerNode.Text = 'True' then
                              FBuyer.DefaultBuyer := True
                           else if BuyerNode.Text = 'False' then
                              FBuyer.DefaultBuyer := False;
                        end;

                     ProcessBuyer;

                  end
               //   18/02/13 [V5.1 R4.3] /MK Change - Added code back in for Purchase Group or AnimalGroup
               //                                     No need to leave it out as import only done on Crush PC not Office PC.
               else if ( NodeName = 'PurchGroup' ) then
                  begin
                     PurchGroupNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('GroupID');
                     if (PurchGroupNode = nil) or (Trim(PurchGroupNode.text) = '') then Continue;
                     FCrushGroup.GroupID := StrToInt(PurchGroupNode.Text);

                     PurchGroupNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Code');
                     if (PurchGroupNode = nil) or (Trim(PurchGroupNode.text) = '') then Continue;
                     FCrushGroup.Code := PurchGroupNode.Text;

                     PurchGroupNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('Description');
                     if ( not(PurchGroupNode = nil) ) or ( Length(Trim(PurchGroupNode.text)) > 0 ) then
                        FCrushGroup.Description := PurchGroupNode.Text;

                     PurchGroupNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('GroupType');
                     if ( not(PurchGroupNode = nil) ) or ( Length(Trim(PurchGroupNode.text)) > 0 ) then
                        FCrushGroup.GroupType := PurchGroupNode.Text;

                     PurchGroupNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('DestSource');
                     if ( not(PurchGroupNode = nil) ) or ( Length(Trim(PurchGroupNode.text)) > 0 ) then
                        FCrushGroup.DestSource := StrToInt(PurchGroupNode.Text);

                     PurchGroupNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('GroupDate');
                     if ( not(PurchGroupNode = nil) ) or ( Length(Trim(PurchGroupNode.text)) > 0 ) then
                        FCrushGroup.GroupDate := StrToDate(PurchGroupNode.Text);

                     PurchGroupNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('CrushLoadComplete');
                     if ( not(PurchGroupNode = nil) ) or ( Length(Trim(PurchGroupNode.text)) > 0 ) then
                        begin
                           if PurchGroupNode.Text = 'True' then
                              FCrushGroup.CrushLoadComplete := True
                           else if PurchGroupNode.Text = 'False' then
                              FCrushGroup.CrushLoadComplete := False;
                        end;

                     FPurchaseGroupID := 0;
                     ProcessPurchGroup;
                  end
               else if ( NodeName = 'AnimalGroup' ) then
                  begin
                     AnimalGroupNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('GroupID');
                     if (AnimalGroupNode = nil) or (Trim(AnimalGroupNode.text) = '') then Continue;
                     FAnimalGroup.GroupID := StrToInt(AnimalGroupNode.Text);

                     AnimalGroupNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('AnimalID');
                     if ( not(AnimalGroupNode = nil) ) or ( Length(Trim(AnimalGroupNode.text)) > 0 ) then
                        FAnimalGroup.AnimalID := StrToInt(AnimalGroupNode.Text);

                     AnimalGroupNode := PurchDocument.documentElement.childNodes[i].selectSingleNode('DateJoined');
                     if ( not(AnimalGroupNode = nil) ) or ( Length(Trim(AnimalGroupNode.text)) > 0 ) then
                        FAnimalGroup.DateJoined := StrToDate(AnimalGroupNode.Text);

                     if FPurchaseGroupID > 0 then
                        ProcessAnimalGroup;
                  end;

               ProgressIndicator.Position := ProgressIndicator.Position + 1;

            end;
         ProgressIndicator.Close;
      end;

   FXMLPurchTable.Close;
   FXMLPurchTable.Open;
   if ( FXMLPurchTable.RecordCount = 0 ) then
      begin
         ApplicationLog.LogError('No purchase records found on XML file');
         Exit;
      end;

   ShowProgressIndicator('Processing Purchase Events',0,FXMLPurchTable.RecordCount,1,False,True);
   ProgressIndicator.Max := FXMLPurchTable.RecordCount;

   FPurchaseEvent := TPurchaseEvent.Create('xmlpurch');
   try
      FPurchaseEvent.Database.StartTransaction;

      FXMLPurchTable.First;
      for i := 1 to FXMLPurchTable.RecordCount do
         try
            FXMLPurchTable.RecNo := i;
            ProcessPurchaseEvent;
            ProgressIndicator.Position := ProgressIndicator.Position + 1;
         except
         end;
   finally
      ProgressIndicator.Close;
      if ( FPurchaseEvent <> nil ) then
         begin
            if FPurchaseEvent.Database.InTransaction then
               FPurchaseEvent.Database.Commit;
            FPurchaseEvent.Free;
         end;
   end;
end;

procedure TCrushXMLImport.ProcessPurchaseEvent;
var
   iAnimalHerdID : Integer;
   Animal : TAnimal;

   function IsValidPurchaseRecord : Boolean;
   var
      iAnimalID : Integer;
   begin
      iAnimalID := FXMLPurchTable.FieldByName('AnimalID').AsInteger;
      Result := ( iAnimalID > 0 ) and
                ( FXMLPurchTable.FieldByName('EventDate').AsDateTime > 0 ) and
                ( FXMLPurchTable.FieldByName('SupplierID').AsInteger > 0 );
      if ( Result ) then
         begin
            Animal := GetAnimal(iAnimalID);
            Result := ( Animal <> nil );
            if ( not(Result) ) then
               begin
                  FPurchErrorList.Add('Error locating AnimalID '+IntToStr(iAnimalID));
                  if ( Length(FXMLPurchTable.FieldByName('NatIDNum').AsString) > 0 ) then
                     begin
                        FPurchErrorList.Add('Locating by NatID '+FXMLPurchTable.FieldByName('NatIDNum').AsString);
                        // Locate Animal In Herd
                        Animal := GetAnimal(FXMLPurchTable.FieldByName('NatIDNum').AsString,True,FHerdInfo.DefaultHerdID);
                        // Locate Animal Not In Herd
                        Result := ( Animal <> nil );
                        if ( not(Result) ) then
                           begin
                              Animal := GetAnimal(FXMLPurchTable.FieldByName('NatIDNum').AsString,False,FHerdInfo.DefaultHerdID);
                              Result := ( Animal = nil );
                              if ( not(Result) ) then
                                 begin
                                    FPurchErrorList.Add('Unable to locate by NatID '+FXMLSalesTable.FieldByName('NatIDNum').AsString);
                                    Exit;
                                 end;
                           end;
                     end;
               end;
            //   26/07/18 [V5.8 R2.0] /MK Bug Fix - This bit of code was only checked if AnimalID was not found and NatID was used to search for animal.
            //                                      This would in-turn create a duplicate purchase record for the animal.
            if ( Result ) then
               Result := ( FEventDataHelper.GetLastEventDate(Animal.Id,CPurchaseEvent) = 0 );
         end;
   end;

begin
   iAnimalHerdID := 0;

   if ( not(IsValidPurchaseRecord) ) then Exit;

   with FPurchaseEvent do
      try
         Append;
         AnimalID := Animal.Id;
         AnimalLactNo := Animal.LactNo;
         AnimalHerdID := Animal.HerdId;
         EventType := TPurchase;
         EventDate := FXMLPurchTable.FieldByName('EventDate').AsDateTime;
         EventSource := sCRUSHXMLIMPORT;
         Supplier := FXMLPurchTable.FieldByName('SupplierID').AsInteger;
         Price := FXMLPurchTable.FieldByName('AnimalPrice').AsFloat;
         Weight := FXMLPurchTable.FieldByName('AnimalWeight').AsFloat;
         Grade := FXMLPurchTable.FieldByName('Grade').AsString;
         LotNumber := FXMLPurchTable.FieldByName('LotNo').AsString;
         Buyer := FXMLPurchTable.FieldByName('PurBuyer').AsInteger;
         SupplierCosts := FXMLPurchTable.FieldByName('SupplierCosts').AsFloat;
         BuyerCosts := FXMLPurchTable.FieldByName('BuyerCosts').AsFloat;
         Post;

         Inc(FTotalPurchase);
      except
         Cancel;
      end;
end;

procedure TCrushXMLImport.ProcessSaleXMLFile;
var
   SaleDocument : IXMLDOMDocument;
   SaleAnimalNode, CustomerNode, SalesGroupNode : IXMLDOMNode;
   NodeName : String;
   i : Integer;
   iSaleAnimalID : Integer;
begin
   FTotalCustomers := 0;
   FTotalSalesGroups := 0;

   SaleDocument := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
   SaleDocument.load(cCrushXMLFileLocation+cCrushSaleXMLFileName);

   if ( SaleDocument.documentElement.childNodes.Get_length > 0 ) then
      begin
         ShowProgressIndicator('Processing Sale XML File',0,SaleDocument.documentElement.childNodes.Get_length,1,False,True);
         ProgressIndicator.Max := SaleDocument.documentElement.childNodes.Get_length;
         for i := 0 to SaleDocument.documentElement.childNodes.Get_length-1 do
            begin
               NodeName := SaleDocument.documentElement.childNodes[i].Get_nodeName;
               if ( NodeName = 'SoldAnimal' ) then
                  try
                     FXMLSalesTable.Append;

                     SaleAnimalNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('AnimalID');
                     if (SaleAnimalNode = nil) or (Trim(SaleAnimalNode.text) = '') then Continue;
                     FXMLSalesTable.FieldByName('AnimalID').AsInteger := StrToInt(SaleAnimalNode.text);
                     iSaleAnimalID := StrToInt(SaleAnimalNode.text);

                     SaleAnimalNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('NatIDNum');
                     if ( not(SaleAnimalNode = nil) ) or ( Length(Trim(SaleAnimalNode.text)) > 0 ) then
                        FXMLSalesTable.FieldByName('NatIDNum').AsString := SaleAnimalNode.text;

                     SaleAnimalNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('AnimalLactNo');
                     if ( not(SaleAnimalNode = nil) ) or ( Length(Trim(SaleAnimalNode.text)) > 0 ) then
                        FXMLSalesTable.FieldByName('AnimalLactNo').AsInteger := StrToInt(SaleAnimalNode.text);

                     SaleAnimalNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('EventDate');
                     if ( not(SaleAnimalNode = nil) ) or ( Length(Trim(SaleAnimalNode.text)) > 0 ) then
                        FXMLSalesTable.FieldByName('EventDate').AsDateTime := StrToDate(SaleAnimalNode.text);

                     SaleAnimalNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('CustomerID');
                     if ( not(SaleAnimalNode = nil) ) or ( Length(Trim(SaleAnimalNode.text)) > 0 ) then
                        FXMLSalesTable.FieldByName('CustomerID').AsInteger := StrToInt(SaleAnimalNode.text);

                     SaleAnimalNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('SoldStatus');
                     if ( not(SaleAnimalNode = nil) ) or ( Length(Trim(SaleAnimalNode.text)) > 0 ) then
                        FXMLSalesTable.FieldByName('SoldStatus').AsBoolean := ( SaleAnimalNode.text = 'True' );

                     SaleAnimalNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('PreSale');
                     if ( not(SaleAnimalNode = nil) ) or ( Length(Trim(SaleAnimalNode.text)) > 0 ) then
                        FXMLSalesTable.FieldByName('PreSale').AsBoolean := ( SaleAnimalNode.text = 'True' );

                     SaleAnimalNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('Price');
                     if ( not(SaleAnimalNode = nil) ) or ( Length(Trim(SaleAnimalNode.text)) > 0 ) then
                        FXMLSalesTable.FieldByName('Price').AsFloat := StrToFloat(SaleAnimalNode.text);

                     SaleAnimalNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('PricePerKg');
                     if ( not(SaleAnimalNode = nil) ) or ( Length(Trim(SaleAnimalNode.text)) > 0 ) then
                        FXMLSalesTable.FieldByName('PricePerKg').AsFloat := StrToFloat(SaleAnimalNode.text);

                     SaleAnimalNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('Weight');
                     if ( not(SaleAnimalNode = nil) ) or ( Length(Trim(SaleAnimalNode.text)) > 0 ) then
                        FXMLSalesTable.FieldByName('Weight').AsFloat := StrToFloat(SaleAnimalNode.text);

                     SaleAnimalNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('LeftWt');
                     if ( not(SaleAnimalNode = nil) ) or ( Length(Trim(SaleAnimalNode.text)) > 0 ) then
                        FXMLSalesTable.FieldByName('LWeight').AsFloat := StrToFloat(SaleAnimalNode.text);

                     SaleAnimalNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('RightWt');
                     if ( not(SaleAnimalNode = nil) ) or ( Length(Trim(SaleAnimalNode.text)) > 0 ) then
                        FXMLSalesTable.FieldByName('RWeight').AsFloat := StrToFloat(SaleAnimalNode.text);

                     SaleAnimalNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('CustomerCosts');
                     if ( not(SaleAnimalNode = nil) ) or ( Length(Trim(SaleAnimalNode.text)) > 0 ) then
                        FXMLSalesTable.FieldByName('CustomerCosts').AsFloat := StrToFloat(SaleAnimalNode.text);

                     SaleAnimalNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('ColdDeadWt');
                     if ( not(SaleAnimalNode = nil) ) or ( Length(Trim(SaleAnimalNode.text)) > 0 ) then
                        FXMLSalesTable.FieldByName('ColdDeadWt').AsFloat := StrToFloat(SaleAnimalNode.text);

                     SaleAnimalNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('KillNumber');
                     if ( not(SaleAnimalNode = nil) ) or ( Length(Trim(SaleAnimalNode.text)) > 0 ) then
                        FXMLSalesTable.FieldByName('KillNumber').AsString := SaleAnimalNode.text;

                     SaleAnimalNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('Grade');
                     if ( not(SaleAnimalNode = nil) ) or ( Length(Trim(SaleAnimalNode.text)) > 0 ) then
                        FXMLSalesTable.FieldByName('Grade').AsString := SaleAnimalNode.text;

                     SaleAnimalNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('CarcassSex');
                     if ( not(SaleAnimalNode = nil) ) or ( Length(Trim(SaleAnimalNode.text)) > 0 ) then
                        FXMLSalesTable.FieldByName('CarcassSex').AsString := SaleAnimalNode.text;

                     SaleAnimalNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('SalesGroupID');
                     if ( not(SaleAnimalNode = nil) ) or ( Length(Trim(SaleAnimalNode.text)) > 0 ) then
                        FXMLSalesTable.FieldByName('SalesGroupID').AsInteger := StrToInt(SaleAnimalNode.text);

                     FXMLSalesTable.Post;
                  except
                     FXMLSalesTable.Cancel;
                     ApplicationLog.LogError('Error posting XML Sale for AnimalID '+IntToStr(iSaleAnimalID));
                  end
               else if ( NodeName = 'Customer' ) then
                  begin
                     CustomerNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('Name');
                     if (CustomerNode = nil) or (Trim(CustomerNode.text) = '') then Continue;
                     FCustomer.Name := CustomerNode.Text;

                     CustomerNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('Address1');
                     if ( not(CustomerNode = nil) ) or ( Length(Trim(CustomerNode.text)) > 0 ) then
                        FCustomer.Address1 := CustomerNode.Text;

                     CustomerNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('Address2');
                     if ( not(CustomerNode = nil) ) or ( Length(Trim(CustomerNode.text)) > 0 ) then
                        FCustomer.Address2 := CustomerNode.Text;

                     CustomerNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('Address3');
                     if ( not(CustomerNode = nil) ) or ( Length(Trim(CustomerNode.text)) > 0 ) then
                        FCustomer.Address3 := CustomerNode.Text;

                     CustomerNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('Address4');
                     if ( not(CustomerNode = nil) ) or ( Length(Trim(CustomerNode.text)) > 0 ) then
                        FCustomer.Address4 := CustomerNode.Text;

                     CustomerNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('Address5');
                     if ( not(CustomerNode = nil) ) or ( Length(Trim(CustomerNode.text)) > 0 ) then
                        FCustomer.Address5 := CustomerNode.Text;

                     CustomerNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('Phone');
                     if ( not(CustomerNode = nil) ) or ( Length(Trim(CustomerNode.text)) > 0 ) then
                        FCustomer.Phone := CustomerNode.Text;

                     CustomerNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('Fax');
                     if ( not(CustomerNode = nil) ) or ( Length(Trim(CustomerNode.text)) > 0 ) then
                        FCustomer.Fax := CustomerNode.Text;

                     CustomerNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('Email');
                     if ( not(CustomerNode = nil) ) or ( Length(Trim(CustomerNode.text)) > 0 ) then
                        FCustomer.Email := CustomerNode.Text;

                     CustomerNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('BTEHerdNo');
                     if ( not(CustomerNode = nil) ) or ( Length(Trim(CustomerNode.text)) > 0 ) then
                        FCustomer.BTEHerdNo := CustomerNode.Text;

                     CustomerNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('Deductions');
                     if ( not(CustomerNode = nil) ) or ( Length(Trim(CustomerNode.text)) > 0 ) then
                        FCustomer.Deductions := StrToFloat(CustomerNode.Text);

                     CustomerNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('Transport');
                     if ( not(CustomerNode = nil) ) or ( Length(Trim(CustomerNode.text)) > 0 ) then
                        FCustomer.Transport := StrToFloat(CustomerNode.Text);

                     ProcessCustomer;
                  end
               else if ( NodeName = 'SalesGroup' ) then
                  begin
                     SalesGroupNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('GroupID');
                     if ( not(SalesGroupNode = nil) ) or ( Length(Trim(SalesGroupNode.text)) > 0 ) then
                        FSalesGroup.GroupID := StrToInt(SalesGroupNode.Text);

                     SalesGroupNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('FileVersion');
                     if ( not(SalesGroupNode = nil) ) or ( Length(Trim(SalesGroupNode.text)) > 0 ) then
                        FSalesGroup.FileVersion := StrToInt(SalesGroupNode.Text);

                     SalesGroupNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('FileCreatedBy');
                     if ( not(SalesGroupNode = nil) ) or ( Length(Trim(SalesGroupNode.text)) > 0 ) then
                        FSalesGroup.FileCreatedBy := StrToInt(SalesGroupNode.Text);

                     SalesGroupNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('CustomerID');
                     if ( not(SalesGroupNode = nil) ) or ( Length(Trim(SalesGroupNode.text)) > 0 ) then
                        FSalesGroup.CustomerID := StrToInt(SalesGroupNode.Text);

                     SalesGroupNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('RemittanceCount');
                     if ( not(SalesGroupNode = nil) ) or ( Length(Trim(SalesGroupNode.text)) > 0 ) then
                        FSalesGroup.RemittanceCount := StrToInt(SalesGroupNode.Text);

                     SalesGroupNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('RemittanceNumber');
                     if ( not(SalesGroupNode = nil) ) or ( Length(Trim(SalesGroupNode.text)) > 0 ) then
                        FSalesGroup.RemittanceNumber := StrToInt(SalesGroupNode.Text);

                     SalesGroupNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('LotReference');
                     if ( not(SalesGroupNode = nil) ) or ( Length(Trim(SalesGroupNode.text)) > 0 ) then
                        FSalesGroup.LotReference := StrToInt(SalesGroupNode.Text);

                     SalesGroupNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('ProducerReference');
                     if ( not(SalesGroupNode = nil) ) or ( Length(Trim(SalesGroupNode.text)) > 0 ) then
                        FSalesGroup.ProducerReference := StrToInt(SalesGroupNode.Text);

                     SalesGroupNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('CarcaseCount');
                     if ( not(SalesGroupNode = nil) ) or ( Length(Trim(SalesGroupNode.text)) > 0 ) then
                        FSalesGroup.CarcaseCount := StrToInt(SalesGroupNode.Text);

                     SalesGroupNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('FileDate');
                     if ( not(SalesGroupNode = nil) ) or ( Length(Trim(SalesGroupNode.text)) > 0 ) then
                        FSalesGroup.FileDate := StrToDate(SalesGroupNode.Text);

                     SalesGroupNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('RemittanceDate');
                     if ( not(SalesGroupNode = nil) ) or ( Length(Trim(SalesGroupNode.text)) > 0 ) then
                        FSalesGroup.RemittanceDate := StrToDate(SalesGroupNode.Text);

                     SalesGroupNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('SlaughterDate');
                     if ( not(SalesGroupNode = nil) ) or ( Length(Trim(SalesGroupNode.text)) > 0 ) then
                        FSalesGroup.SlaughterDate := StrToDate(SalesGroupNode.Text);

                     SalesGroupNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('FileType');
                     if ( not(SalesGroupNode = nil) ) or ( Length(Trim(SalesGroupNode.text)) > 0 ) then
                        FSalesGroup.FileType := SalesGroupNode.Text;

                     SalesGroupNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('PaymentNum');
                     if ( not(SalesGroupNode = nil) ) or ( Length(Trim(SalesGroupNode.text)) > 0 ) then
                        FSalesGroup.PaymentNum := SalesGroupNode.Text;

                     SalesGroupNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('TotalValue');
                     if ( not(SalesGroupNode = nil) ) or ( Length(Trim(SalesGroupNode.text)) > 0 ) then
                        FSalesGroup.TotalValue := StrToFloat(SalesGroupNode.Text);

                     SalesGroupNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('TotalDeductions');
                     if ( not(SalesGroupNode = nil) ) or ( Length(Trim(SalesGroupNode.text)) > 0 ) then
                        FSalesGroup.TotalDeductions := StrToFloat(SalesGroupNode.Text);

                     SalesGroupNode := SaleDocument.documentElement.childNodes[i].selectSingleNode('PaymentAmt');
                     if ( not(SalesGroupNode = nil) ) or ( Length(Trim(SalesGroupNode.text)) > 0 ) then
                        FSalesGroup.PaymentAmt := StrToFloat(SalesGroupNode.Text);

                     ProcessSalesGroup;
                  end;
               ProgressIndicator.Position := ProgressIndicator.Position + 1;
            end;
         ProgressIndicator.Close;
      end;

   FXMLSalesTable.Close;
   FXMLSalesTable.Open;
   if ( FXMLSalesTable.RecordCount = 0 ) then
      ApplicationLog.LogDebugMessage('No sold animals in SalesXML file');

   FSaleEvent := TSaleDeathEvent.Create('xmlsales');
   try
      FSaleEvent.Database.StartTransaction;

      ShowProgressIndicator('Processing Sale Events',0,FXMLSalesTable.RecordCount,1,False,True);
      ProgressIndicator.Max := FXMLSalesTable.RecordCount;
      for i := 1 to FXMLSalesTable.RecordCount do
         try
            FXMLSalesTable.RecNo := i;
            ProcessSaleEvent;
            ProgressIndicator.Position := ProgressIndicator.Position + 1;
         except
         end;
      ProgressIndicator.Close;
   finally
      if ( FSaleEvent <> nil ) then
         begin
            if FSaleEvent.Database.InTransaction then
               FSaleEvent.Database.Commit;
            FSaleEvent.Free;
         end;
   end;
end;

procedure TCrushXMLImport.ProcessSaleEvent;
var
   iAnimalID,
   iPreSaleEventID,
   iSaleEventID,
   iDeathEventID,
   iUpdateEventID : Integer;
   dLeftHerdDate : TDateTime;
   Animal : TAnimal;
   qUpdatePreSale : TQuery;

   function GetKillOutPerc (AWeight, AColdDeadWt : Double ): Double;
   begin
      Result := 0;
      if ( AWeight > 0 ) and ( AColdDeadWt > 0 ) then
         Result := ( (AColdDeadWt * 100 ) / AWeight )
      else
         Result := FKillOutCalculator.Calculate(iAnimalID);
   end;

   function GetPricePerKg (APrice, AColdDeadWt : Double) : Double;
   begin
      Result := FXMLSalesTable.FieldByName('PricePerKg').AsFloat;
      if ( APrice > 0 ) and ( AColdDeadWt > 0 ) then
          Result :=  ( APrice / AColdDeadWt );
   end;

begin
   iAnimalID := FXMLSalesTable.FieldByName('AnimalID').AsInteger;
   if ( iAnimalID = 0 ) then Exit;
   Animal := GetAnimal(iAnimalID);
   if ( Animal = nil ) then
      begin
         FSaleErrorList.Add('Error locating AnimalID '+IntToStr(iAnimalID));
         if ( Length(FXMLSalesTable.FieldByName('NatIDNum').AsString) > 0 ) then
            begin
               FSaleErrorList.Add('Locating by NatID '+FXMLSalesTable.FieldByName('NatIDNum').AsString);
               // Locate animal by NatIDNum In Herd.
               Animal := GetAnimal(FXMLSalesTable.FieldByName('NatIDNum').AsString,True,FHerdInfo.DefaultHerdID);
               // Locate animal by NatIDNum Not In Herd.
               if ( Animal = nil ) then
                  Animal := GetAnimal(FXMLSalesTable.FieldByName('NatIDNum').AsString,False,FHerdInfo.DefaultHerdID);
               if ( Animal = nil ) then
                  begin
                     FSaleErrorList.Add('Unable to locate by NatID '+FXMLSalesTable.FieldByName('NatIDNum').AsString);
                     Exit;
                  end;
            end;
      end;

   iSaleEventID := FEventDataHelper.GetAnimalSaleEventID(iAnimalID);
   if ( iSaleEventID > 0 ) then
      try
         dLeftHerdDate := FEventDataHelper.GetAnimalLeftHerdDate(iAnimalID);
         if ( FXMLSalesTable.FieldByName('EventDate').AsDateTime <> dLeftHerdDate ) then
            with TQuery.Create(nil) do
               try
                  DatabaseName := AliasName;
                  SQL.Clear;
                  SQL.Add('UPDATE Events');
                  SQL.Add('SET EventDate = :EventDate');
                  SQL.Add('WHERE ID = :SaleEventID');
                  Params[0].AsDateTime := FXMLSalesTable.FieldByName('EventDate').AsDateTime;
                  Params[1].AsInteger := iSaleEventID;
                  try
                     ExecSQL;
                  except
                     on e : Exception do
                        ApplicationLog.LogException(e);
                  end;
               finally
                  Free;
               end;
         Exit;
      except
         on e : Exception do
            ApplicationLog.LogException(e);
      end;

   iDeathEventID := FEventDataHelper.GetAnimalDeathEventID(iAnimalID);
   iPreSaleEventID := FEventDataHelper.GetAnimalPreSaleEventID(iAnimalID);
   if ( iPreSaleEventID > 0 ) and ( iDeathEventID = 0 ) then
      iUpdateEventID := iPreSaleEventID
   else if ( iPreSaleEventID = 0 ) and ( iDeathEventID > 0 ) then
      iUpdateEventID := iDeathEventID;

   if ( iUpdateEventID > 0 ) then
      begin
         qUpdatePreSale := TQuery.Create(nil);
         with qUpdatePreSale do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('UPDATE Animals');
               SQL.Add('SET InHerd = False');
               SQL.Add('WHERE ID = :AnimalID');
               Params[0].AsInteger := Animal.Id;
               try
                  ExecSQL;

                  Close;
                  SQL.Clear;
                  SQL.Add('UPDATE Events');
                  SQL.Add('SET EventDate = :SaleDate,');
                  SQL.Add('    EventDesc = "Sale"');
                  SQL.Add('WHERE ID = :PreSaleEvent');
                  Params[0].AsDateTime := FXMLSalesTable.FieldByName('EventDate').AsDateTime;
                  Params[1].AsInteger := iUpdateEventID;
                  ExecSQL;

                  Close;
                  SQL.Clear;
                  SQL.Add('UPDATE SalesDeaths');
                  SQL.Add('SET PreSale = False,');
                  SQL.Add('    Sold = True,');
                  SQL.Add('    Customer = :Customer,');
                  SQL.Add('    Price = :Value,');
                  SQL.Add('    Grade = :Grade,');
                  SQL.Add('    ColdDeadWt = :ColdDeadWt,');
                  SQL.Add('    KillOut = :KillOut,');
                  SQL.Add('    CustomerCosts = :CustomerCosts,');
                  SQL.Add('    FeedEndDate = :FeedEndDate,');
                  SQL.Add('    CarcassSex = :CarassSex,');
                  SQL.Add('    LeftWt = :LeftWt,');
                  SQL.Add('    RightWt = :RightWt,');
                  SQL.Add('    PricePerKg = :PricePerKg,');
                  SQL.Add('    SaleGrps_Id = :SalesGroupID,');
                  SQL.Add('    KillNumber = :KillNumber');
                  SQL.Add('WHERE EventID = :PreSaleEvent');
                  Params[0].AsInteger := FXMLSalesTable.FieldByName('CustomerID').AsInteger;
                  Params[1].AsFloat := FXMLSalesTable.FieldByName('Price').AsFloat;
                  Params[2].AsString := FXMLSalesTable.FieldByName('Grade').AsString;
                  Params[3].AsFloat := FXMLSalesTable.FieldByName('ColdDeadWt').AsFloat;
                  Params[4].AsFloat := GetKillOutPerc(FEventDataHelper.GetAnimalPreSaleWeight(iAnimalID),
                                                                                              FXMLSalesTable.FieldByName('ColdDeadWt').AsFloat);
                  Params[5].AsFloat := FXMLSalesTable.FieldByName('CustomerCosts').AsFloat;
                  Params[6].AsDateTime := FXMLSalesTable.FieldByName('EventDate').AsDateTime;
                  Params[7].AsString := FXMLSalesTable.FieldByName('CarcassSex').AsString;
                  Params[8].AsFloat := FXMLSalesTable.FieldByName('LWeight').AsFloat;
                  Params[9].AsFloat := FXMLSalesTable.FieldByName('RWeight').AsFloat;
                  Params[10].AsFloat := GetPricePerKg(FXMLSalesTable.FieldByName('Price').AsFloat,FXMLSalesTable.FieldByName('ColdDeadWt').AsFloat);
                  Params[11].AsInteger := FXMLSalesTable.FieldByName('SalesGroupID').AsInteger;
                  Params[12].AsString := FXMLSalesTable.FieldByName('KillNumber').AsString;
                  Params[13].AsInteger := iUpdateEventID;
                  ExecSQL;

                  Inc(FTotalSales);
               except
                  on e : Exception do
                     begin
                        ApplicationLog.LogException(e);
                        ApplicationLog.LogError('Error updating pre sale rec for animal '+IntToStr(iAnimalID));
                     end;
               end;
            finally
               Free;
            end;
      end
   else
      begin
          FSaleEvent.Append;
          try
             FSaleEvent.CanCheckWeaning := False;
             FSaleEvent.AllowCancel := False;
             FSaleEvent.EventType := TSaleDeath;

             FSaleEvent.AnimalID := Animal.Id;

             FSaleEvent.EventDate := FXMLSalesTable.FieldByName('EventDate').AsDateTime;

             FSaleEvent.AnimalLactNo := Animal.LactNo;
             FSaleEvent.AnimalHerdID := Animal.HerdId;
             FSaleEvent.EventComment := 'Sale';
             FSaleEvent.EventSource := sCRUSHXMLIMPORT;

             FSaleEvent.Customer := FXMLSalesTable.FieldByName('CustomerID').AsInteger;

             FSaleEvent.SaleGrps_Id := FXMLSalesTable.FieldByName('SalesGroupID').AsInteger;

             FSaleEvent.FeedEndDate := FXMLSalesTable.FieldByName('EventDate').AsDateTime;

             FSaleEvent.Weight := FXMLSalesTable.FieldByName('Weight').AsFloat;

             FSaleEvent.CustomerCosts := FXMLSalesTable.FieldByName('CustomerCosts').AsFloat;

             FSaleEvent.Price := FXMLSalesTable.FieldByName('Price').AsFloat;

             FSaleEvent.Grade := FXMLSalesTable.FieldByName('Grade').AsString;
             FSaleEvent.ColdDeadWt := FXMLSalesTable.FieldByName('ColdDeadWt').AsFloat;

             FSaleEvent.KillOut := GetKillOutPerc(FSaleEvent.Weight,FSaleEvent.ColdDeadWt);
             if ( FSaleEvent.Weight <= 0 ) then
                if ( FSaleEvent.KillOut > 0 ) and ( FSaleEvent.ColdDeadWt > 0 ) then
                   FSaleEvent.Weight := ( (FSaleEvent.ColdDeadWt * 100 ) / FSaleEvent.KillOut );

             FSaleEvent.PreSale := False;

             FSaleEvent.KillNumber := FXMLSalesTable.FieldByName('KillNumber').AsString;
             FSaleEvent.CarcassSex := FXMLSalesTable.FieldByName('CarcassSex').AsString;
             FSaleEvent.LeftWt := FXMLSalesTable.FieldByName('LWeight').AsFloat;
             FSaleEvent.RightWt := FXMLSalesTable.FieldByName('RWeight').AsFloat;

             FSaleEvent.PricePerKg := GetPricePerKg(FSaleEvent.Price,FSaleEvent.ColdDeadWt);

             FSaleEvent.Sold := True;
             FSaleEvent.Notified := False;
             FSaleEvent.Slaughter := False;

             FSaleEvent.Post;

             Inc(FTotalSales);

          except
             on e : Exception do
                begin
                   FSaleEvent.Cancel;
                   ApplicationLog.LogException(e);
                   ApplicationLog.LogError('Error creating XML Sale Event for animal '+IntToStr(iAnimalID));
                end;
          end;
      end;
end;

procedure TCrushXMLImport.ProcessCustomer;
begin
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'Customers';
         Open;
         try
            Append;
            FieldByName('Name').AsString := FCustomer.Name;
            FieldByName('Address 1').AsString := FCustomer.Address1;
            FieldByName('Address 2').AsString := FCustomer.Address2;
            FieldByName('Address 3').AsString := FCustomer.Address3;
            FieldByName('Address 4').AsString := FCustomer.Address4;
            FieldByName('Address 5').AsString := FCustomer.Address5;
            FieldByName('Phone').AsString := FCustomer.Phone;
            FieldByName('Fax').AsString := FCustomer.Fax;
            FieldByName('E-mail').AsString := FCustomer.Email;
            FieldByName('BTEHerdNo').AsString := FCustomer.BTEHerdNo;
            FieldByName('Deductions').AsFloat := FCustomer.Deductions;
            FieldByName('Transport').AsFloat := FCustomer.Transport;
            Inc(FTotalCustomers);
            Post;
         except
            Cancel;
         end;
      finally
         Close;
         Free;
      end;
end;

procedure TCrushXMLImport.ProcessSalesGroup;
begin
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'SaleGrps';
         Open;
         try
            Append;
            FieldByName('Group_Id').AsInteger := FSalesGroup.GroupID;
            FieldByName('FileDate').AsDateTime := FSalesGroup.FileDate;
            FieldByName('FileType').AsString := FSalesGroup.FileType;
            FieldByName('FileVersion').AsInteger := FSalesGroup.FileVersion;
            FieldByName('FileCreatedBy').AsInteger := FSalesGroup.FileCreatedBy;
            FieldByName('Customer_Id').AsInteger := FSalesGroup.CustomerID;
            FieldByName('RemittanceCount').AsInteger := FSalesGroup.RemittanceCount;
            FieldByName('RemittanceNumber').AsInteger := FSalesGroup.RemittanceNumber;
            FieldByName('RemittanceDate').AsDateTime := FSalesGroup.RemittanceDate;
            FieldByName('SlaughterDate').AsDateTime := FSalesGroup.SlaughterDate;
            FieldByName('LotReference').AsInteger := FSalesGroup.LotReference;
            FieldByName('ProducerReference').AsInteger := FSalesGroup.ProducerReference;
            FieldByName('CarcaseCount').AsInteger := FSalesGroup.CarcaseCount;
            FieldByName('TotalValue').AsFloat := FSalesGroup.TotalValue;
            FieldByName('TotalDeductions').AsFloat := FSalesGroup.TotalDeductions;
            FieldByName('PaymentAmt').AsFloat := FSalesGroup.PaymentAmt;
            FieldByName('PaymentNum').AsString := FSalesGroup.PaymentNum;
            Inc(FTotalSalesGroups);
            Post;
         except
            Cancel;
         end;
      finally
         Close;
         Free;
      end;
end;

procedure TCrushXMLImport.ProcessBuyer;
begin
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'Buyers';
         Open;
         try
            Append;
            FieldByName('Name').AsString := FBuyer.Name;
            FieldByName('Address 1').AsString := FBuyer.Address1;
            FieldByName('Address 2').AsString := FBuyer.Address2;
            FieldByName('Address 3').AsString := FBuyer.Address3;
            FieldByName('Address 4').AsString := FBuyer.Address4;
            FieldByName('Address 5').AsString := FBuyer.Address5;
            FieldByName('Phone').AsString := FBuyer.Phone;
            FieldByName('Fax').AsString := FBuyer.Fax;
            FieldByName('E-mail').AsString := FBuyer.Email;
            FieldByName('Commission').AsFloat := FBuyer.Commission;
            FieldByName('DefaultBuyer').AsBoolean := FBuyer.DefaultBuyer;
            Post;
            Inc(FTotalBuyers);
         except
            Cancel;
         end;
      finally
         Close;
         Free;
      end;
end;

procedure TCrushXMLImport.ProcessSupplier;
begin
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'SuppliersBreeders';
         Open;
         try
            Append;
            FieldByName('Name').AsString := FSupplier.Name;
            FieldByName('Address 1').AsString := FSupplier.Address1;
            FieldByName('Address 2').AsString := FSupplier.Address2;
            FieldByName('Address 3').AsString := FSupplier.Address3;
            FieldByName('Address 4').AsString := FSupplier.Address4;
            FieldByName('Address 5').AsString := FSupplier.Address5;
            FieldByName('Phone').AsString := FSupplier.Phone;
            FieldByName('Fax').AsString := FSupplier.Fax;
            FieldByName('E-mail').AsString := FSupplier.Email;
            FieldByName('Commission').AsFloat := FSupplier.Commission;
            FieldByName('Transport').AsFloat := FSupplier.Transport;
            Post;
            Inc(FTotalSuppliers);
         except
            Cancel;
         end;
      finally
         Close;
         Free;
      end;
end;

procedure TCrushXMLImport.ProcessPurchGroup;
begin
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'Grps';
         Open;
         try
            Append;
            try
               FieldByName('Code').AsString := FCrushGroup.Code;
               FieldByName('Description').AsString := FCrushGroup.Description;
               FieldByName('GroupType').AsString := FCrushGroup.GroupType;
               FieldByName('DestSource').AsInteger := FCrushGroup.DestSource;
               if FCrushGroup.GroupDate > 0 then
                  FieldByName('GroupDate').AsDateTime := FCrushGroup.GroupDate;
               FieldByName('CrushLoadComplete').AsBoolean := FCrushGroup.CrushLoadComplete;
               Post;
               Inc(FTotalPurchGroups);
            except
               Cancel;
            end;

            Close;
            Open;

            if Locate('Code',FCrushGroup.Code,[]) then
               FPurchaseGroupID := FieldByName('ID').AsInteger;
         except
            Cancel;
         end;
      finally
         Close;
         Free;
      end;
end;

procedure TCrushXMLImport.ProcessAnimalGroup;
begin
   with TTable.Create(nil) do
      try
         DatabaseName := AliasName;
         TableName := 'GrpLinks';
         Open;
         try
            Append;
            FieldByName('GroupID').AsInteger := FPurchaseGroupID;
            FieldByName('AnimalID').AsInteger := FAnimalGroup.AnimalID;
            FieldByName('DateJoined').AsDateTime := FAnimalGroup.DateJoined;
            Post;
            Inc(FTotalAnimalGroups);
         except
            Cancel;
         end;
      finally
         Close;
         Free;
      end;
end;

procedure TCrushXMLImport.MarkAnimalAsNotInHerd(AAnimalID : Integer);
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('UPDATE Animals');
         SQL.Add('SET InHerd = False');
         SQL.Add('WHERE ID = '+IntToStr(AAnimalID)+' ');
         try
            try
               ExecSQL
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TCrushXMLImport.ChangePreSaleEventDesc(AEventID : Integer);
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('UPDATE Events');
         SQL.Add('SET EventDesc = "Sale"');
         SQL.Add('WHERE ID = '+IntToStr(AEventID)+' ');
         try
            try
               ExecSQL
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TCrushXMLImport.RenameReadFile(AXMLType : TXMLType);
var
   FileName,
   StrDate : string;
begin
   StrDate := FormatDateTime('ddmmyy hhnn',Now);

   if ( AXMLType = xmlPurchases ) then
      begin
         FileName := cCrushXMLFileLocation+cCrushPurchaseXMLFileName;
         if FileExists(FileName) then
            begin
               if Pos(cCrushPurchaseXMLFileName,FileName) > 0 then
                  begin
                     if Pos('_read'+StrDate,cCrushPurchaseXMLFileName) = 0 then
                        begin
                           Insert('_read'+StrDate, FileName, Length(FileName)-3);
                           if ( FileExists(FileName) ) then
                              begin
                                 MessageDlg(cRenameFileError,mtError,[mbOK],0);
                                 FPurchErrorList.Add('Cannot rename Purchase XML Import File.');
                              end
                           else
                              RenameFile(cCrushXMLFileLocation+cCrushPurchaseXMLFileName,FileName);
                        end;
                  end;
            end;
      end
   else if ( AXMLType = xmlSales ) then
      begin
         FileName := cCrushXMLFileLocation+cCrushSaleXMLFileName;
         if FileExists(FileName) then
            begin
               if Pos(cCrushSaleXMLFileName,FileName) > 0 then
                  begin
                     if Pos('_read'+StrDate,cCrushSaleXMLFileName) = 0 then
                        begin
                           Insert('_read'+StrDate, FileName, Length(FileName)-3);
                           if ( FileExists(FileName) ) then
                              begin
                                 MessageDlg(cRenameFileError,mtError,[mbOK],0);
                                 FSaleErrorList.Add('Cannot rename Sale XML Import File.');
                              end
                           else
                              RenameFile(cCrushXMLFileLocation+cCrushSaleXMLFileName,FileName);
                        end;
                  end;
            end;
      end;
end;

destructor TCrushXMLImport.Destroy;
begin
   if ( FPurchErrorList <> nil ) then
      begin
         if ( FPurchErrorList.Count > 0 ) then
            if ( Length(FPurchErrorList.Strings[0]) > 0 ) then
               FPurchErrorList.SaveToFile(cCrushXMLFileLocation+'PurchImportErrors.txt');
         FreeAndNil(FPurchErrorList);
      end;

   if ( FSaleErrorList <> nil ) then
      begin
         if ( FSaleErrorList.Count > 0 ) then
           if ( Length(FSaleErrorList.Strings[0]) > 0 ) then
              FSaleErrorList.SaveToFile(cCrushXMLFileLocation+'SaleImportErrors.txt');
         FreeAndNil(FSaleErrorList);
      end;

   if ( FXMLSalesTable <> nil ) then
      begin
         FXMLSalesTable.Close;
         FXMLSalesTable.DeleteTable;
         FreeAndNil(FXMLSalesTable);
      end;

   if ( FXMLPurchTable <> nil ) then
      begin
         FXMLPurchTable.Close;
         FXMLPurchTable.DeleteTable;
         FreeAndNil(FXMLPurchTable);
      end;

   if ( FKillOutCalculator <> nil ) then
      FreeAndNil(FKillOutCalculator);

   if ( FEventDataHelper <> nil ) then
      FreeAndNil(FEventDataHelper);
end;

{ TDefaultHerdInfo }

function TDefaultHerdInfo.GetDefaultHerdID: Integer;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT DefaultHerdID');
         SQL.Add('FROM Defaults');
         try
            Open;
            if ( RecordCount > 0 ) then
               Result := Fields[0].AsInteger;
         except
         end;
      finally
         Free;
      end;
end;

end.

