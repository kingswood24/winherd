unit uTransferAnimalInfo;

interface

uses
   Classes, windows, db, dbTables, sysutils, dialogs, GenTypesConst,
   KRoutines, KDBRoutines, DateUtil, uAnimal, uApplicationLog;

type
   TTransferAnimalInfo = class

   private
      FDatabase : TDatabase;
      FTransferAnimalTable : TTable;
      FGetQuery,
      FUpdateQuery : TQuery;
   public
      constructor Create;
      destructor Destroy;
      function AnimalInfoTransferred (AOldAnimalID, ANewAnimalID : Integer) : Boolean;
   end;

implementation

{ TTransferAnimalInfo }

constructor TTransferAnimalInfo.Create;
begin
   FDatabase := TDatabase.Create(nil);
   FDatabase.DatabaseName := 'KWTAI';
   FDatabase.AliasName := AliasName;
   FDataBase.TransIsolation := tiDirtyRead;
   FDataBase.Connected := True;
   FDataBase.Open;

   FTransferAnimalTable := TTable.Create(nil);
   FTransferAnimalTable.DatabaseName := FDatabase.DatabaseName;
   FTransferAnimalTable.TableName := 'TransferredAnimals';
   FTransferAnimalTable.Open;

   FGetQuery := TQuery.Create(nil);
   FGetQuery.DatabaseName := FDatabase.DatabaseName;

   FUpdateQuery := TQuery.Create(nil);
   FUpdateQuery.DatabaseName := FDatabase.DatabaseName;
end;

function TTransferAnimalInfo.AnimalInfoTransferred(AOldAnimalID, ANewAnimalID: Integer): Boolean;
const
   cErrorTxt = 'TRANFERANIMAL:';
var
   OldAnimal : TAnimal;

   procedure AddToTransferAnimalTable ( ASourceTable, AKeyIDName, AKeyID : String);
   begin
      try
         FTransferAnimalTable.Append;
         FTransferAnimalTable.FieldByName('SourceTable').AsString := ASourceTable;
         FTransferAnimalTable.FieldByName('KeyIDName').AsString := AKeyIDName;
         FTransferAnimalTable.FieldByName('KeyID').AsString := AKeyID;
         FTransferAnimalTable.FieldByName('NewAnimalID').AsInteger := ANewAnimalID;
         FTransferAnimalTable.FieldByName('OldAnimalID').AsInteger := AOldAnimalID;
         FTransferAnimalTable.FieldByName('CreatedOn').AsDateTime := Date;
         FTransferAnimalTable.Post;
      except
         FTransferAnimalTable.Cancel;
         raise;
      end;
   end;

begin
   Result := False;
   if ( AOldAnimalID <= 0 ) or ( ANewAnimalID <= 0 ) then Exit;
   try
     if ( FDatabase.InTransaction ) then
        FDatabase.Rollback;
     FDatabase.StartTransaction;
     try
         // Animals table
         OldAnimal := GetAnimal(AOldAnimalID);
         if ( OldAnimal = nil ) then Exit;

          FUpdateQuery.SQL.Clear;
          FUpdateQuery.SQL.Add('UPDATE Animals');
          FUpdateQuery.SQL.Add('SET LactNo = :ALactNo,');
          FUpdateQuery.SQL.Add('    DamID = :ADamID,');
          FUpdateQuery.SQL.Add('    SireID = :ASireID,');
          FUpdateQuery.SQL.Add('    Name = :AName,');
          FUpdateQuery.SQL.Add('    HerdBookNo = :AHerdBookNo');
          FUpdateQuery.SQL.Add('WHERE ID = :NewAnimalID');
          FUpdateQuery.Params[0].AsInteger := OldAnimal.LactNo;
          FUpdateQuery.Params[1].AsInteger := OldAnimal.DamId;
          FUpdateQuery.Params[2].AsInteger := OldAnimal.SireId;
          FUpdateQuery.Params[3].AsString := OldAnimal.Name;
          FUpdateQuery.Params[4].AsString := OldAnimal.HerdBookNo;
          FUpdateQuery.ExecSQL;

          AddToTransferAnimalTable('Animals','LactNo',IntToStr(OldAnimal.LactNo));
          AddToTransferAnimalTable('Animals','DamID',IntToStr(OldAnimal.DamId));
          AddToTransferAnimalTable('Animals','SireID',IntToStr(OldAnimal.SireId));
          AddToTransferAnimalTable('Animals','Name',OldAnimal.Name);
          AddToTransferAnimalTable('Animals','HerdBookNo',OldAnimal.HerdBookNo);

         // Events table
         FGetQuery.Close;
         FGetQuery.SQL.Clear;
         FGetQuery.SQL.Add('SELECT ID, EventType');
         FGetQuery.SQL.Add('FROM Events');
         FGetQuery.SQL.Add('WHERE AnimalID = :OldAnimalID');
         FGetQuery.SQL.Add('AND   EventType NOT IN (:SaleEvent, :PurchaseEvent)');
         FGetQuery.Params[0].AsInteger := AOldAnimalID;
         FGetQuery.Params[1].AsInteger := CSaleDeathEvent;
         FGetQuery.Params[2].AsInteger := CPurchaseEvent;
         FGetQuery.Open;
         if ( FGetQuery.RecordCount > 0 ) then
            begin
               FUpdateQuery.Close;
               FUpdateQuery.SQL.Clear;
               FUpdateQuery.SQL.Add('UPDATE Events');
               FUpdateQuery.SQL.Add('SET AnimalID = :ANewAnimalID');
               FUpdateQuery.SQL.Add('WHERE AnimalID = :AOldAnimalID');
               FUpdateQuery.SQL.Add('AND   EventType NOT IN (:SaleEvent, :PurchaseEvent)');
               FUpdateQuery.Params[0].AsInteger := ANewAnimalID;
               FUpdateQuery.Params[1].AsInteger := AOldAnimalID;
               FUpdateQuery.Params[2].AsInteger := CSaleDeathEvent;
               FUpdateQuery.Params[3].AsInteger := CPurchaseEvent;
               FUpdateQuery.ExecSQL;

               FGetQuery.First;
               while ( not(FGetQuery.Eof) ) do
                  begin
                     AddToTransferAnimalTable('Events','ID',IntToStr(FGetQuery.FieldByName('ID').AsInteger));
                     FGetQuery.Next;
                  end;
            end;

         // Milk Disk table
         FGetQuery.Close;
         FGetQuery.SQL.Clear;
         FGetQuery.SQL.Add('SELECT MilkDiskID');
         FGetQuery.SQL.Add('FROM MilkDisk');
         FGetQuery.SQL.Add('WHERE AnimalID = :AOldAnimalID');
         FGetQuery.Params[0].AsInteger := AOldAnimalID;
         FGetQuery.Open;
         if ( FGetQuery.RecordCount > 0 ) then
            begin
               FUpdateQuery.Close;
               FUpdateQuery.SQL.Clear;
               FUpdateQuery.SQL.Add('UPDATE MilkDisk');
               FUpdateQuery.SQL.Add('SET AnimalID = :ANewAnimalID');
               FUpdateQuery.SQL.Add('WHERE AnimalID = :AOldAnimalID');
               FUpdateQuery.Params[0].AsInteger := ANewAnimalID;
               FUpdateQuery.Params[1].AsInteger := AOldAnimalID;
               FUpdateQuery.ExecSQL;

               FGetQuery.First;
               while ( not(FGetQuery.Eof) ) do
                  begin
                     AddToTransferAnimalTable('MilkDisk','MilkDiskID',IntToStr(FGetQuery.FieldByName('MilkDiskID').AsInteger));
                     FGetQuery.Next;
                  end;
            end;

         FDatabase.Commit;

         // Need to reindex all tables that are updated.

         Result := True;
      except
         on e : Exception do
            begin
               FDatabase.Rollback;
               ShowDebugMessage(e.Message);
               ApplicationLog.LogException(e);
            end;
      end;
   finally
   end;
end;

destructor TTransferAnimalInfo.Destroy;
begin
   if FDataBase <> nil then
      try
         if FDataBase.Connected then
            FDataBase.Connected := False;
         FDataBase.Close;
         FDataBase.Free;
      except
      end;

   if ( FTransferAnimalTable <> nil ) then
      begin
         FTransferAnimalTable.Close;
         FreeAndNil(FTransferAnimalTable);
      end;

   if ( FGetQuery <> nil ) then
      FreeAndNil(FGetQuery);

   if ( FUpdateQuery <> nil ) then
      FreeAndNil(FUpdateQuery);
end;

end.
