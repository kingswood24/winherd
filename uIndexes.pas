unit uIndexes;
{
 Rebuilds all Indexes on the TTable - TblName

 08/09/11 [V5.0 R0.6] /MK Additional Feature - Added Index For MilkTemperament Table.

 21/12/11 [V5.0 R2.9] /MK Additional Feature - Added Index For JohnesResult Table.

 28/03/12 [V5.0 R4.8] /MK Additional Feature - New Index Create For Reports Table;

 20/09/13 [V5.2 R1.5] /MK Additional Feature - Add Index for new ICBF Calf Survey Event.

 07/03/19 [V5.8 R8.0] /MK Change - ReindexAll - Looping through DairyData TempTable objects - Code refactored with SP.

 20/03/19 [V5.8 R8.2] /MK Bug Fix - No need for ShowMessage in ReIndexAll.

 11/09/19 [V5.9 R0.3] /MK Change - ReIndex - Added try except around the creating of the index which adds error the
                                             applog.txt with TableName that can't index - this was added in cases where
                                             the new BDE version is causing Access Violation on reindex - UCD / Richard Bourns.  

 17/09/19 [V5.9 R0.4] /MK Change - ReIndexAll - Issue with UCD data where the position of the Owners and BatchRegistrations reindex caused program to crash.
                                                Shane (Kingswood) suggested that we move these to the top to see if this helps and it did.
}


interface
uses
    DB,
    DBTables,
    uApplicationLog;
    
type
   IndexRecord = record
     FieldName, IndexName : string;
     IndexOptions: TIndexOptions;
   end;

   TIndexRecords = array of IndexRecord;

procedure ReIndexAll(ShowGauge : Boolean);
procedure DropIndex(IsPrimary : Boolean;ATable, AIndex : string);
procedure ReIndex(TblName,MyIndex,MyField: String; MyOptions: TIndexOptions; const ADropIndex : Boolean = False);
procedure CreateIndexes(ATableName : string; AIndexRecords : TIndexRecords);
procedure RemoveIndexes(const ADatabasePath, ATableName : String);

implementation
uses
    Classes,
    GenTypesConst,
    Dialogs,
    SysUtils,
    DairyData,
    Forms,
    Def,
    Controls,
    ComCtrls,
    FileCtrl,
    uProgressIndicator,
    BDE;

var
   MyGauge : TProgressBar;
   ShowProgress : Boolean;

const
   IndexCount = 168;


procedure ReIndex(TblName,MyIndex,MyField: String; MyOptions: TIndexOptions; const ADropIndex : Boolean = False);
var
   MyTable : TTable;
begin
   Application.ProcessMessages;
   MyTable := TTable.Create(nil);
   try
      try
         MyTable.DatabaseName := AliasName;
         MyTable.TableName := TblName;
         MyTable.TableType := ttParadox;
         if MyTable.Exists then
            MyTable.AddIndex(MyIndex,MyField, MyOptions);

         if ShowProgress then
            MyGauge.StepIt;

      except
         on e : Exception do
            begin
               if MyTable.Active then
                  ApplicationLog.LogError(Format('Error creating index for table %s. Table is active.',[TblName]))
               else
                  ApplicationLog.LogError(Format('Error creating index for table %s.',[TblName]));
            end;
      end;
   finally
      FreeAndNil(MyTable);
   end;
end;

procedure CreateIndexes(ATableName : string; AIndexRecords : TIndexRecords);
var
  i : Integer;
begin
    with TTable.Create(nil) do
       try
          DatabaseName := AliasName;
          TableName := ATableName;

          if IndexDefs <> nil then
             try
                if IndexDefs.Count > 0 then
                   begin
                      IndexDefs.Update;
                      if (IndexDefs.IndexOf(IndexDefs.Items[0].Name) > -1) then
                         DeleteIndex(IndexDefs.Items[0].Name);
                      IndexDefs.Update;
                   end;
             except
             // Do Nothing
             end;
       finally
          Free;
       end;
  //for (int i := 0; < 10; i++) do
   for i := 0 to Length(AIndexRecords)-1 do
      ReIndex( ATableName, AIndexRecords[i].IndexName, AIndexRecords[i].FieldName, AIndexRecords[i].IndexOptions);
end;

procedure DropIndex(IsPrimary : Boolean;ATable, AIndex : string);
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         if IsPrimary then
            SQL.Add(Format('DROP INDEX "%s".Primary',[ATable]))
         else
            SQL.Add(Format('DROP INDEX "%s".%s',[ATable,AIndex]));
         ExecSQL;
      finally
         Free;
      end;
end;

procedure ReIndexAll(ShowGauge : Boolean);
var
   MyTable : TTable;
   i         : Integer;
   Errors : TStringList;
begin
   Errors := TStringList.Create;
   try
      if not DirectoryExists( WinData.KingData.Directory + '\log') then
         CreateDir( WinData.KingData.Directory + '\log' );

     ShowProgress := ShowGauge;

     if ShowProgress then
        begin
           MyGauge := TProgressBar.Create(nil);
           MyGauge.Parent := Screen.ActiveForm;
           MyGauge.Align := alBottom;
           MyGauge.Max := IndexCount;
           MyGauge.Step := 1;
           MyGauge.Height := 15;
           MyGauge.Enabled := TRUE;
           MyGauge.Show;
           MyGauge.ReFresh;
        end;

     MyTable := TTable.Create(nil);
     MyTable.DatabaseName := WinData.KingData.DatabaseName;
     WinData.KingData.Close;
     for i := 0 to WinData.ComponentCount-1 do
        begin
           Application.ProcessMessages;
           //   07/03/19 [V5.8 R8.0] /MK Change - Code refactored with SP.
           if not( WinData.Components[i] is TTable ) then continue;
           MyTable := WinData.Components[i] as TTable;
           if not MyTable.Exists then continue;
           // Make sure there is an attached Table
           try
              MyTable.Close;
              MyTable.IndexDefs.Update;
              if MyTable.IndexDefs.Count > 0 then
                 if ( MyTable.IndexDefs.IndexOf(MyTable.IndexDefs.Items[0].Name) > -1 ) then
                    MyTable.DeleteIndex(MyTable.IndexDefs.Items[0].Name);
           except
              on E : Exception do
                 begin
                    Errors.Add(E.Message);
                    //ShowMessage(E.Message);
                 end;
           end;
        end;

     //   17/09/19 [V5.9 R0.4] /MK Change - Issue with UCD data where the position of the Owners and BatchRegistrations reindex caused program to crash.
     //                                     Shane (Kingswood) suggested that we move these to the top to see if this helps and it did.
     ReIndex ( 'Owners','','ID',[ixUnique,ixPrimary] );
     ReIndex ('BatchRegistrations', 'iID', 'ID', [ixPrimary, ixUnique ]);

     ReIndex ( 'Animals','','ID',[ixUnique,ixPrimary] );
     ReIndex ( 'Animals','iAnimalLactNo','AnimalNo;LactNo',[ixCaseInsensitive] );
     ReIndex ( 'Animals','iAnimalNo','AnimalNo',[ixCaseInsensitive] );
     ReIndex ( 'Animals','iDOB','DateOfBirth',[ixCaseInsensitive] );
     ReIndex ( 'Animals','iHerdBookNo','HerdBookNo',[ixCaseInsensitive] );
     ReIndex ( 'Animals','iHerdID','HerdID',[ixCaseInsensitive] );
     ReIndex ( 'Animals','iLactNo','LactNo',[ixCaseInsensitive] );
     ReIndex ( 'Animals','iMilkCowNo','MilkCowNo',[ixCaseInsensitive] );
     ReIndex ( 'Animals','iNatId','NatIDNum',[ixCaseInsensitive] );
     ReIndex ( 'Animals','iSex','Sex',[ixCaseInsensitive] );
     ReIndex ( 'Animals','iSortedNo','SortAnimalNo',[ixCaseInsensitive] );
     ReIndex ( 'Animals','iSortedNatId','SortNatID',[ixCaseInsensitive] );
     ReIndex ( 'Animals','iDamID','DamID',[ixCaseInsensitive] );
     ReIndex ( 'Animals','iSireID','SireID',[ixCaseInsensitive] );
     ReIndex ( 'Animals','iInHerd','InHerd',[ixCaseInsensitive] );

     ReIndex ( 'AFilters','iAID','AID',[ixPrimary] );

     ReIndex ( 'BeefSub','','EventID;AnimalID;PremiumType',[ixUnique,ixPrimary] );

     ReIndex ( 'Breeds','','ID',[ixUnique,ixPrimary] );
     ReIndex ( 'Breeds','iBreedName','Name',[ixCaseInsensitive] );
     ReIndex ( 'Breeds','iBreedCode','Code',[ixCaseInsensitive] );

     ReIndex ( 'BullExt','','AnimalID',[ixUnique,ixPrimary] );
     ReIndex ( 'Bullings','','EventID',[ixUnique,ixPrimary] );
     ReIndex ( 'BullSemenStk','','AnimalID',[ixUnique,ixPrimary] );
     ReIndex ( 'Calvings','','EventID',[ixUnique,ixPrimary] );

     ReIndex ( 'Countries','','ID',[ixUnique,ixPrimary] );

     ReIndex ( 'CowExt','','AnimalID',[ixUnique,ixPrimary] );

     ReIndex ( 'Customers','','ID',[ixUnique,ixPrimary] );
     ReIndex ( 'Customers','iName','Name',[ixCaseInsensitive] );

     ReIndex ( 'Defaults','','ID',[ixUnique,ixPrimary] );

     ReIndex ( 'Events','','ID',[ixUnique,ixPrimary] );
     ReIndex ( 'Events','iAnimalID','AnimalID',[ixCaseInsensitive] );
     ReIndex ( 'Events','iEventDate','EventDate',[ixCaseInsensitive] );
     ReIndex ( 'Events','iEventType','EventType',[ixCaseInsensitive] );
     ReIndex ( 'Events','iIDLactDate','AnimalId;AnimalLactNo;EventDate;EventType',[ixCaseInsensitive] );

     ReIndex ( 'GenLook','','ID',[ixUnique,ixPrimary] );
     ReIndex ( 'GenLook','iListType','ListType',[ixCaseInsensitive] );
     ReIndex ( 'GenLook','iTypeDesc','ListType;Description',[ixUnique,ixCaseInsensitive] );

     //ReIndex ( 'Grps','','ID;GroupType',[ixUnique,ixPrimary] );
     //   18/11/14 [V5.3 R8.9] /MK Bug Fix - Index was on ID and GroupType which was causing SQL updates to change ID in table
     //                                      if fields were edited within in the SQL.
     ReIndex ( 'Grps','','ID',[ixUnique,ixPrimary] );

     ReIndex ( 'GrpLinks','','GroupID;AnimalID',[ixUnique,ixPrimary] );
     //ReIndex ( 'GrpLinks', 'iID', 'AnimalID', [ixCaseInsensitive] );

     ReIndex ( 'Health','','EventID',[ixUnique,ixPrimary] );
     ReIndex ( 'MedAdmin','','ID',[ixUnique,ixPrimary] );
     ReIndex ( 'Medicine','','ID',[ixUnique,ixPrimary] );
     ReIndex ( 'Medicine','iDrugCode','DrugCode',[ixUnique,ixCaseInsensitive] );
     ReIndex ( 'Medipur','','ID',[ixUnique,ixPrimary] );

     ReIndex ( 'MDT','','ID',[ixUnique,ixPrimary] );

     ReIndex ( 'MilkDisk','','MilkDiskID',[ixUnique,ixPrimary] );
     ReIndex ( 'MilkDisk','iID','AnimalID',[ixCaseInsensitive] );
     ReIndex ( 'MilkDisk','iIDLactNo','AnimalID;LactNo',[ixCaseInsensitive] );
//     ReIndex ( 'MilkDisk','dIDLactNo','AnimalID;LactNo',[ixDescending] );

     ReIndex ( 'MilkDiskLayout','','ID',[ixUnique,ixPrimary] );

     ReIndex ( 'MilkDiskTrans','','ID',[ixUnique,ixPrimary] );
     ReIndex ( 'MilkDiskTrans','iMDTID','MDTID',[ixCaseInsensitive] );
     ReIndex ( 'MilkDiskTrans','iAIDLactNo', 'AnimalID;LactNo', [ixCaseInsensitive] );

     ReIndex ( 'PregnancyDiag','','EventID',[ixUnique,ixPrimary] );
     ReIndex ( 'PremiumTypes','','Type',[ixUnique,ixPrimary] );
     ReIndex ( 'Applications','','ApplicationID',[ixUnique,ixPrimary] );

     ReIndex ( 'Purchases','','EventID',[ixUnique,ixPrimary] );
     ReIndex ( 'SalesDeaths','','EventID',[ixUnique,ixPrimary] );
     ReIndex ( 'Services','','EventID',[ixUnique,ixPrimary] );
     ReIndex ( 'Sires','','AICode',[ixUnique,ixPrimary] );

     ReIndex ( 'SireSource','','ID;Name',[ixUnique,ixPrimary] );

     ReIndex ( 'SuppliersBreeders','','ID',[ixUnique,ixPrimary] );
     ReIndex ( 'SuppliersBreeders','iName','Name',[ixCaseInsensitive] );

     ReIndex ( 'Units','','ID',[ixUnique,ixPrimary] );
     ReIndex ( 'Weights','','EventID',[ixUnique,ixPrimary] );

     ReIndex ( 'Buyers','','ID',[ixUnique,ixPrimary] );
     ReIndex ( 'Buyers','iName','Name',[ixCaseInsensitive] );

     ReIndex ( 'afdoa','','ID',[ixUnique,ixPrimary] );
     ReIndex ( 'afdoa','iIDDate','AID;DateChanged',[ixCaseInsensitive] );

     ReIndex ( 'SysUsers','','ID',[ixUnique,ixPrimary] );

     ReIndex ( 'IHM','','ID;AnimalID',[ixUnique,ixPrimary] );

     ReIndex ( 'Movements','','EventID',[ixUnique,ixPrimary] );

     ReIndex ( 'MovedTo','','ID',[ixUnique,ixPrimary] );

     ReIndex ( 'SApplic','','ID',[ixUnique,ixPrimary] );
     ReIndex ( 'SAppliedFor','','ID;ApplicationID;AnimalID',[ixUnique,ixPrimary] );

     // SP 23/03/01
     ReIndex('PedDetails','','ID',[ixPrimary,ixUnique]);
     ReIndex('PedDetails','iAnimalID','AnimalID',[ixCaseInsensitive]);

     ReIndex('BlupEval','iAnimalID','AnimalID',[ixUnique,ixPrimary]);

{     // Paddock files to reindex.
     ReIndex ( 'Swards','','ID',[ixUnique,ixPrimary] );
     ReIndex ( 'LandForm','','ID',[ixUnique,ixPrimary] );
     ReIndex ( 'SoilTypes','','ID',[ixUnique,ixPrimary] );
     ReIndex ( 'PaddCond','','ID',[ixUnique,ixPrimary] );
     ReIndex ( 'FertTypes','','ID;Name',[ixUnique,ixPrimary] );
     ReIndex ( 'SeedTypes','','ID;Name',[ixUnique,ixPrimary] );
     ReIndex ( 'SprayTypes','','ID;Name',[ixUnique,ixPrimary] );

     ReIndex ( cFarms,'','ID',[ixUnique,ixPrimary] );
     ReIndex ( cPaddocks,'','FarmID;ID',[ixUnique,ixPrimary] );
     ReIndex ( cPlots,'','FarmID;ID',[ixUnique,ixPrimary] );
     ReIndex ( cFields,'','FarmID;ID',[ixUnique,ixPrimary] );
     ReIndex ( cAreaAids,'','FarmID;ID',[ixUnique,ixPrimary] );

     ReIndex ( 'DiaryIDS','','ID',[ixUnique,ixPrimary] );
     ReIndex ( 'DiaryEvents','','ID;PaddockID',[ixUnique,ixPrimary] );
     ReIndex ( 'DiaryEvents','iPaddIDDate','PaddockID;EventDate',[ixCaseInsensitive] );

     ReIndex ( 'SoilTests','','EventID',[ixUnique,ixPrimary] );
     ReIndex ( 'FertApplic','','EventID',[ixUnique,ixPrimary] );
     ReIndex ( 'SilHarvest','','EventID',[ixUnique,ixPrimary] );
     ReIndex ( 'Topping','','EventID',[ixUnique,ixPrimary] );
     ReIndex ( 'Spraying','','EventID',[ixUnique,ixPrimary] );
     ReIndex ( 'ReSeeding','','EventID',[ixUnique,ixPrimary] );
     ReIndex ( 'SlurryApplic','','EventID',[ixUnique,ixPrimary] );}

     // Indexes for the Mass Purchase
     ReIndex ( 'PurchGrpHeader','','ID',[ixUnique,ixPrimary] );
     ReIndex ( 'PurchGrpData','','ID',[ixUnique,ixPrimary] );
     ReIndex ( 'PurchGrpData','iPurchGrpHeaderID','PurchGrpHeaderID',[ixCaseInsensitive] );

     ReIndex ( 'FeedEvents','','ID',[ixUnique,ixPrimary]);
     ReIndex ( 'FeedEvents','iAllocDate','AllocDate',[ixCaseInsensitive]);
     ReIndex ( 'FeedEvents','iFeedType','FeedType',[ixCaseInsensitive]);
     ReIndex ( 'FeedEvents','iLactAnimal','AnimalID;Lact;FeedType;AllocDate',[ixCaseInsensitive]);

     ReIndex ( 'PaddRotationExt','','EventID',[ixUnique,ixPrimary]);

     ReIndex ( 'TempPaddGrid','','PaddockID',[ixUnique,ixPrimary]);

     ReIndex ( 'SuckApplicReplace', '','ID',[ixUnique,ixPrimary]);

     ReIndex ( 'PremDefaults','iID','ID',[ixUnique,ixPrimary]);
     ReIndex ( 'PremDefaults','iYear','Year',[ixCaseInsensitive]);

     ReIndex ( 'PremiaPayments','','ID'    ,[ixUnique,ixPrimary]);
     ReIndex ( 'PremiaPayments','iApplicID','ApplicID',[ixCaseInsensitive]);

     ReIndex ( 'ConditionScore'  , 'iEventID' , 'EventID' , [ixUnique,ixPrimary]);
     ReIndex ( 'DiagnoseProblem' , 'iEventID' , 'EventID' , [ixUnique,ixPrimary]);
     ReIndex ( 'EmbryoTransfer'  , 'iEventID' , 'EventID' , [ixUnique,ixPrimary]);
     ReIndex ( 'IntExam'         , 'iEventID' , 'EventID' , [ixUnique,ixPrimary]);
     ReIndex ( 'BullInOut'       , 'iEventID' , 'EventID' , [ixUnique,ixPrimary]);

     ReIndex ( 'MPDelete' , '' , 'EventID' , [ixUnique,ixPrimary]);
     ReIndex ( 'MPDelete' , 'iEventIDDate' , 'EventID;EventDate' ,[ixCaseInsensitive]);

     ReIndex ( 'LiveStockValues' , 'iHerdID' , 'HerdID' , [ixUnique,ixPrimary]);

     ReIndex ( 'MilkCheque', 'iID', 'ID',[ixUnique, ixPrimary]);
     ReIndex ( 'MilkTank', 'iID', 'ID',[ixUnique, ixPrimary]);

     ReIndex ('CrushDiskTrans', 'iID', 'ID', [ixUnique, ixPrimary]);
     ReIndex ('CrushDiskTrans', 'iDiskID', 'DiskID',  [ixCaseInsensitive]);

     ReIndex ('CrushDisk', 'iID', 'ID', [ixUnique, ixPrimary]);
     ReIndex ('CrushDisk', 'iGroupID', 'GroupID', [ixCaseInsensitive]);
     ReIndex ('CrushDisk', 'iReadDate', 'ReadDate', [ixCaseInsensitive]);

     ReIndex ('CMMSPermits', 'iID', 'ID', [ixPrimary, ixUnique ]);

     ReIndex ( 'DeletedCalvings', 'iEventDamID', 'EventID;DamID',[ixUnique,ixPrimary] );
     ReIndex ( 'DeletedCalvings','iDamLactNo','DamLactNo',[ixCaseInsensitive] );
     ReIndex ( 'DeletedCalvings','iCalfID1','CalfID1',[ixCaseInsensitive] );
     ReIndex ( 'DeletedCalvings','iCalfID2','CalfID2',[ixCaseInsensitive] );
     ReIndex ( 'DeletedCalvings','iCalfID3','CalfID3',[ixCaseInsensitive] );
     ReIndex ( 'DeletedCalvings','iCalfID4','CalfID4',[ixCaseInsensitive] );
     ReIndex ( 'DeletedCalvings','iDeleteDate','DeleteDate',[ixCaseInsensitive] );

     ReIndex ( 'HUKICalfReg','iID','ID',[ixUnique, ixPrimary]);
     ReIndex ( 'HUKICalfReg','iCalfID','CalfID',[ixCaseInsensitive] );
     ReIndex ( 'HUKICalfReg','iAcceptCode','AcceptCode',[ixCaseInsensitive] );
     ReIndex ( 'HUKICalfReg','iBreedCode','BreedCode',[ixCaseInsensitive] );
     ReIndex ( 'HUKICalfReg','iHBN','HBN',[ixCaseInsensitive] );
     ReIndex ( 'HUKICalfReg','iRegDate','RegDate',[ixCaseInsensitive] );

     ReIndex ( 'Disbudding','','EventID',[ixUnique, ixPrimary] );
     ReIndex ( 'MealFeeding','','EventID',[ixUnique, ixPrimary] );
     ReIndex ( 'Weaning','','EventID',[ixUnique, ixPrimary] );

     ReIndex ( 'FertPrograms','','ID',[ixUnique, ixPrimary] );
     ReIndex ( 'FertTreatments','','ID',[ixUnique, ixPrimary] );
     ReIndex ( 'FertTreatments','iParentProgram','ParentProgram',[ixCaseInsensitive] );

     ReIndex ( 'FertProgAdmin','','ID',[ixUnique, ixPrimary]);
     ReIndex ( 'FertProgAdmin','iAnimalID','AnimalID',[ixCaseInsensitive] );
     ReIndex ( 'FertProgAdmin','iLactNo','LactNo',[ixCaseInsensitive] );
     ReIndex ( 'FertProgAdmin','iProgramID','ProgramID',[ixCaseInsensitive]);
     ReIndex ( 'FertProgAdmin','iParentEvent','ParentEvent',[ixCaseInsensitive]);

     ReIndex ( 'CowFertility','','ID',[ixUnique, ixPrimary]);
     ReIndex ( 'CowFertility','iAnimalID','AnimalID',[ixCaseInsensitive] );
     ReIndex ( 'CowFertility','iCulled','Culled',[ixCaseInsensitive] );

     ReIndex ( 'TagReplacements','','ID',[ixUnique, ixPrimary]);
     ReIndex ( 'TagReplacements','iTagNo','TagNo',[ixCaseInsensitive] );


     ReIndex ( 'CTSRequest','iID','ID',[ixUnique, ixPrimary]);
     ReIndex ( 'CTSRequest','iRequestType','RequestType',[ixCaseInsensitive] );
     ReIndex ( 'CTSRequest','iRequestDate','RequestDate',[ixCaseInsensitive] );
     ReIndex ( 'CTSRequest','iCTSBatchID','CTSBatchID',[ixCaseInsensitive] );
     ReIndex ( 'CTSRequest','iAnimalID','AnimalID',[ixCaseInsensitive] );
     ReIndex ( 'CTSRequest','iRegistered','Registered',[ixCaseInsensitive] );
     ReIndex ( 'CTSRequest','iTxnId','TxnId',[ixCaseInsensitive] );
     ReIndex ( 'CTSRequest','iReceiptNum','ReceiptNum',[ixCaseInsensitive] );

     ReIndex ( 'CTSRejected','iID','ID',[ixUnique, ixPrimary]);
     ReIndex ( 'CTSRejected','iCTSBatchID','CTSBatchID',[ixCaseInsensitive]);
     ReIndex ( 'CTSRejected','iAnimalID','AnimalID',[ixCaseInsensitive]);
     ReIndex ( 'CTSRejected','iTxnId','TxnId',[ixCaseInsensitive]);
     ReIndex ( 'CTSRejected','iRejectType','RejectType',[ixCaseInsensitive]);
     ReIndex ( 'CTSRejected','iRejectDate','RejectDate',[ixCaseInsensitive]);

     ReIndex ( 'CTSExceptions','iID','ID',[ixUnique, ixPrimary]);
     ReIndex ( 'CTSExceptions','iTxnId','TxnId',[ixCaseInsensitive]);

     ReIndex ( 'DefaultHealthEvents','iID','ID',[ixUnique, ixPrimary]);

     ReIndex ( 'KingswoodMailBox','iID','ID',[ixUnique, ixPrimary]);

     ReIndex ( 'AnimalsExt','iAnimalID','AnimalID',[ixUnique, ixPrimary]);
     ReIndex ( 'MediGrps','iID','ID',[ixUnique, ixPrimary]);

     ReIndex ( 'TagStore','iID','ID',[ixUnique, ixPrimary]);
     ReIndex ( 'TagStore', 'iTagNumber','TagNumber', [ixCaseinsensitive]);
     ReIndex ( 'TagStore', 'iSortTagNumber','SortTagNumber', [ixCaseinsensitive]);
     ReIndex ( 'TagStore', 'iHerdID', 'HerdID', [ixCaseinsensitive]);

     ReIndex ( 'FertilityCheck', 'iEventID', 'EventID',[ixUnique, ixPrimary]);
     ReIndex ( 'FertilityCheck', 'iStatus', 'Status', [ixCaseinsensitive]);
     ReIndex ( 'FertilityCheck', 'iAction', 'Action', [ixCaseinsensitive]);
     ReIndex ( 'FertProgram', 'iFertProgram', 'FertProgram', [ixCaseinsensitive]);

     ReIndex ( 'MilkTemperament','','EventID',[ixUnique, ixPrimary] );

     ReIndex ( 'JohnesResult','','EventID',[ixUnique, ixPrimary] );

     ReIndex ( 'ICBFDamEvent','','EventID',[ixUnique, ixPrimary] );
     ReIndex ( 'ICBFStockBullEvent','','EventID',[ixUnique, ixPrimary] );
     ReIndex ( 'ICBFCalfSurveyEvent','','EventID',[ixUnique, ixPrimary] );

     //   28/03/12 [V5.0 R4.8] /MK Change - ProfitMonitor Table Not In Use.
     //   ReIndex ( 'ProfitMonitor','iID','ID',[ixUnique, ixPrimary] );

     //   28/03/12 [V5.0 R4.8] /MK Additional Feature - New Index Create For Reports Table;
     ReIndex ( 'Reports','iID','ID',[ixUnique, ixPrimary] );

     ReIndex ( 'AimAnimalReg','iId','Id',[ixUnique, ixPrimary]);
     ReIndex ( 'AimAnimalReg','iAnimalId','AnimalId',[ixCaseInsensitive]);
     ReIndex ( 'AimAnimalReg','iStatus','Status',[ixCaseInsensitive]);
     ReIndex ( 'AimAnimalReg','iTransactionDate','TransactionDate',[ixCaseInsensitive]);

     ReIndex ( 'FdStkEvents','iId','Id',[ixUnique, ixPrimary]);

     ReIndex ( 'DrugsRegImportHeader', 'iID', 'ID', [ixUnique, ixPrimary]);

     ReIndex ( 'DrugsRegImportDetail', 'iID', 'ID', [ixUnique, ixPrimary]);
     ReIndex ( 'DrugsRegImportDetail', 'iTagDesc', 'TagDesc', [ixCaseInsensitive]);
     ReIndex ( 'DrugsRegImportDetail', 'iHeaderID', 'HeaderID', [ixCaseInsensitive]);

   finally

     if ShowProgress then
        begin
           MyGauge.Free;
        end;

     if MyTable <> nil then
        begin
           FreeAndNil(MyTable);
        end;

     FreeAndNil(Errors);
   end;
end;

procedure RemoveIndexes(const ADatabasePath, ATableName : String);
var
   i : Integer;
   SearchRec : TSearchRec;
   ScanDir : String;
   FileList : TStringList;
   TableName : string;


   function IsRemovableIndex(AIndexName : string) : Boolean;
   var
      FileExt : string;
   begin
      Result := False;
      FileExt := UPPERCASE(ExtractFileExt(AIndexName));
      if (Copy(FileExt, 1, 3 ) = '.DB') OR (Copy(FileExt, 1, 3 ) = '.MB') then
         Exit;
      Result := (Copy(FileExt, 1, 3 ) = '.PX') OR (Copy(FileExt, 1, 3 ) = '.XG') OR (Copy(FileExt, 1, 3 ) = '.YG') OR (Copy(FileExt, 1, 4 ) = '.VAL')
   end;

begin

   FileList := TStringList.Create;
   try

      FileList.Clear;
      ScanDir := IncludeTrailingBackslash( ADatabasePath );
      TableName := Copy(ATableName, 1, Pos('.', ATableName)-1) + '.*.*';
      i := FindFirst( ADatabasePath + TableName, faAnyFile , SearchRec ) ;
      if i = 0 then
        begin
           if ( SearchRec.Name <> '.' ) and ( SearchRec.Name <> '..' ) then
              begin
                 if IsRemovableIndex(SearchRec.Name) then
                    DeleteFile( ScanDir + SearchRec.Name );
              end;

           while FindNext( SearchRec ) = 0 do
              if ( SearchRec.Name <> '.' ) and ( SearchRec.Name <> '..' ) then
                 begin
                    if IsRemovableIndex(SearchRec.Name) then
                       DeleteFile( ScanDir + SearchRec.Name );
                 end;
           SysUtils.FindClose( SearchRec ) ;
        end;
   finally
      FileList.Free;
   end;
end;


end.
