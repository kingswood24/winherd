{
   28/01/15 [V5.4 R2.6] /MK Bug Fix - GetPreSaleStatusInfo - Exclude N_A withdrawals for max withdrawal days - Anne Ryan reported.
}

unit KDBRoutines;

interface

uses
   db, classes, dbtables, GenTypesConst, Sysutils, BDE, BDEUtils,
   Dialogs, Windows, uHerdOwner, uEventDataHelper, uHerd, dxmdaset;


type
//   THerdType = (htDairy, htSuckler, htBeef, htNone);
// Structure used to specify new field properties
    TChangeRec = Packed Record
    szName: DBINAME;
    iType: word;
    iSubType: word;
    iLength: word;
    iPrecision: byte;
end;

   { SQL Delete Table contents from [Arg "TblName"] }
   procedure SQLEmptyTable(TblName : String);
   { Gets associated Herd Type of [Arg "AHerd"] }
//   function WhatHerdType(AHerdID : Integer) : THerdType;
   { Locates the animal purchdate, returns 0 if none found }
   function GetAnimalPurchDate(const AID : Integer) : TDateTime;
   { Returns TRUE if breed is Dairy, returns False if breed is Beef }
   function IsDairyAnimal(BreedID : Integer) : Boolean;
   { Update Animals Lactation Number \ Events Lactation Number }
   function UpdateLactNo(const AnimalID : Integer) : Boolean;
   function DoLactNoUpdate(const AnimalID, NewLactNo : Integer;
      const UpdateEvents : Boolean = True)  : Boolean;
   function GetConditionScore(const AID, ALactNo : Integer) : Double;
   function HerdIDByAnimalID(AAnimalID : Integer) : Integer;


   function GetAnimalInfo(AAnimalID : Integer; AField : String) : Variant;

    procedure GetPreSaleStatusInfo(const AID : Integer; const ASalesDate : TDateTime;
         var AStatusInfo : TStatusInfo; ACustomerID : Integer);

   function System_Registered_Country : TCountry;

   {}
   procedure ChangeField(Table : TTable; FieldName : String; Rec : TChangeRec);
   procedure ResizeField(TablePathName, FieldName : String; FieldSize : Integer);
   procedure DBIForceWrite(tbl : TTable);
   procedure RenameField(TablePathName, FieldName : String; NewName : DBINAME);
   procedure ChangeFieldType(TablePathName, FieldName : String; FieldType : word; const Length : Integer=0);
   function ChangeLevel (hTmpDb:hDBIDB; TableName: string; sLevel: string):DBIResult;
   function GetTableLevel(ATable: TTable): integer;


   procedure ForceIndicesRemoval(ADirectory : String);
   procedure CloneRecord(Dataset: TDataSet; var VarArray : Variant);
   procedure PostClonedRecord(var Dataset: TDataSet; var VarArray : Variant);

   function GetHerdsFromDatabases(ADatabaseList : TStrings) : THerds;

   function GetQuery ( const ADatabaseName : String = '' ) : TQuery;

   function GetBreedIDFromAnimalID(AAnimalID: Integer): Integer;

   function GetCrossBreedByQuery(ABreedID : Integer): Integer;
   
implementation
uses
   DairyData, kRoutines;

{ SQL Delete Table contents from [Arg "TblName"] }
procedure SQLEmptyTable(TblName : String);
var
   tQry : TQuery;
begin
   tQry := TQuery.Create(nil);
   tQry.DatabaseName := AliasName;
   try
      try
         tQry.SQL.Add('Delete From '+TblName);
         tQry.ExecSQL;
      except
         raise Exception.Create('SQL Delete Operation Failed!');
      end;
   finally
      tQry.Close;
      tQry.Free;
   end;
end;

{ Locates associated Herd Type of [Arg "AHerd"] }
{function WhatHerdType(AHerdID : Integer) : THerdType;
const
   ResultField = 'Description';
begin
   Result := htNone;

   if WinData.OwnerFile.Locate(cIDField, AHerdID,[]) then
      if WinData.GenLookUp.Locate(cIDField, WinData.OwnerFile.FieldByName('TypeOfHerd').AsInteger,[]) then
         begin
            if UPPERCASE(WinData.GenLookUp.FieldByName(ResultField).Value) = cDairyHerd then
               Result := htDairy
            else if UPPERCASE(WinData.GenLookUp.FieldByName(ResultField).Value) = cSucklerHerd then
               Result := htSuckler
            else if UPPERCASE(WinData.GenLookUp.FieldByName(ResultField).Value) = cBeefHerd then
               Result := htBeef
         end;
end;
}
{ Locates the animal purchdate, returns 0 if none found }
function GetAnimalPurchDate(const AID: Integer): TDateTime;
var
   bAlreadyOpen : Boolean;
   v : variant;
begin
   Result := 0;
   if AID <= 0 then Exit; // Exit if not valid animal ID.
   with WinData.CheckEvents do
      begin
        // bAlreadyOpen := Active;
         try
          //  if not bAlreadyOpen then
          //     Active := True;

            //Filter := '(AnimalID = ' + IntToStr(AID) + ') And (EventType = ' + IntToStr(cPurchaseEvent) + ')';
            //Filtered := True;

            //if FindLast then
            v := Lookup('AnimalID;EventType', VarArrayOf([AID,cPurchaseEvent]), 'EventDate');
            if v <> null then
               Result := v;
         finally
          //  Filter := '';
           // Filtered := False;
          //  Active := bAlreadyOpen;
         end;
      end;
end;

{ Returns TRUE if breed is Dairy, returns False if breed is Beef }
function IsDairyAnimal(BreedID : Integer) : Boolean;
var
   bAlreadyOpen : Boolean;
begin
   Result := FALSE;
   if BreedID <= 0 then Exit; // Exit if not valid animal ID.

   with WinData.Breeds do
      begin
         bAlreadyOpen := Active;
         try
            if not bAlreadyOpen then
               Open;

            if WinData.Breeds.Locate('ID', BreedID, []) then
               Result := not(WinData.Breeds.FieldByName('EligibleforPremium').AsBoolean);
         finally
            Active := bAlreadyOpen;
         end;
      end;
end;

procedure RenameField(TablePathName, FieldName : String; NewName : DBINAME);
var
  FldChanges : TChangeRec;
  MyTable : TTable;
begin
  MyTable := TTable.Create(nil);
  try
     try
        MyTable.DatabaseName := AliasName;
        MyTable.TableName := TablePathName;
        MyTable.Open;
        // Set the new field size into the field structure
        FillChar(FldChanges, SizeOf(FldChanges), 0);
        FldChanges.szName := NewName;
        // Call ChangeField to do the actual dbiDoRestructure call
        ChangeField(MyTable, FieldName, FldChanges);
     except
        raise;
     end;
  finally
     MyTable.Close;
     FreeAndNil(MyTable);
  end
end;

// Procedure to resize a Paradox table field
procedure ResizeField(TablePathName, FieldName : String; FieldSize : Integer);
var
  FldChanges : TChangeRec;
  MyTable : TTable;
begin
  MyTable := TTable.Create(nil);
  try
     try
        MyTable.DatabaseName := AliasName;
        MyTable.TableName := TablePathName;
        MyTable.Open;

        if MyTable.FieldByName(FieldName).Size <> FieldSize then
           begin
              // Set the new field size into the field structure
              FillChar(FldChanges, SizeOf(FldChanges), 0);
              FldChanges.iLength := FieldSize;
              // Call ChangeField to do the actual dbiDoRestructure call
              ChangeField(MyTable, FieldName, FldChanges);
           end;
     except
        on e : Exception do
           raise Exception.Create(E.Message);
     end;
  finally
     MyTable.Close;
     FreeAndNil(MyTable);
  end
end;

procedure ChangeFieldType(TablePathName, FieldName : String; FieldType : word; const Length : Integer);
var
  FldChanges : TChangeRec;
  MyTable : TTable;
begin
  MyTable := TTable.Create(nil);
  try
     try
        MyTable.DatabaseName := AliasName;
        MyTable.TableName := TablePathName;
        MyTable.Open;
        // Set the new field size into the field structure
        FillChar(FldChanges, SizeOf(FldChanges), 0);
        FldChanges.iType := FieldType;
        if Length > 0 then
           FldChanges.iLength := Length;
        // Call ChangeField to do the actual dbiDoRestructure call
        ChangeField(MyTable, FieldName, FldChanges);
     except
        raise;
     end;
  finally
     MyTable.Close;
     FreeAndNil(MyTable);
  end
end;

// Procedure to modify Paradox table field properties
// (based on example from the Borland BDE Reference help)
procedure ChangeField(Table : TTable; FieldName : String; Rec : TChangeRec);
var
  Props: CURProps;
  hDb: hDBIDb;
  Res : DBIResult;
  TableDesc: CRTblDesc;
  pFields: pFLDDesc;
  pOp: pCROpType;
  B: byte;
  Field : TField;
begin
{
  Code taken from http://www.bdesupport.com
}
  // Make sure table is opened exclusively
  if (Table.Active and not Table.Exclusive) then
     Table.Close;
  if (Not Table.Exclusive) then
     Table.Exclusive := True;
  if (Not Table.Active) then
     Table.Open;

  Field := Table.FieldByName(FieldName);

  // Get table properties (needed to get table type)
  Check(DbiSetProp(hDBIObj(Table.Handle), curxltMODE, integer(xltNONE)));
  Check(DbiGetCursorProps(Table.Handle, Props));

  // Allocate memory for pointers
  pFields := AllocMem(Table.FieldCount * sizeof(FLDDesc));
  pOp := AllocMem(Table.FieldCount * sizeof(CROpType));

  try
    // Set the pointer to the index in the operation descriptor
    // to crMODIFY (to modify field properties)
    Inc(pOp, Field.Index);
    pOp^ := crMODIFY;
    Dec(pOp, Field.Index);

    // Get existing field properties
    Check(DbiGetFieldDescs(Table.Handle, pFields));
    Inc(pFields, Field.Index);

    // Check for field changes specified by caller
    if StrLen(Rec.szName) > 0 then pFields^.szName := Rec.szName;
    if Rec.iType > 0 then pFields^.iFldType := Rec.iType;
    if Rec.iSubType > 0 then pFields^.iSubType := Rec.iSubType;
    if Rec.iLength > 0 then pFields^.iUnits1 := Rec.iLength;
    if Rec.iPrecision > 0 then pFields^.iUnits2 := Rec.iPrecision;

    Dec(pFields, Field.Index);

    for B := 1 to Table.FieldCount do begin
      pFields^.iFldNum := B;
      Inc(pFields, 1);
    end;
    Dec(pFields, Table.FieldCount);

    // Clear the structure
    FillChar(TableDesc, sizeof(TableDesc), 0);
	
    // Get database handle from the table cursor's handle
    Check(DbiGetObjFromObj(hDBIObj(Table.Handle), objDATABASE, hDBIObj(hDb)));
	
    // Set table name and type into the descriptor
    StrPCopy(TableDesc.szTblName, Table.TableName);
    StrPCopy(TableDesc.szTblType, Props.szTableType);

    // Set field count for this table
    TableDesc.iFldCount := Table.FieldCount;
	
    // Link the operation descriptor to the table descriptor
    TableDesc.pecrFldOp := pOp;

    // Link the field descriptor to the table descriptor
    TableDesc.pFldDesc := pFields;

    Table.Close;

    // Do the actual table restructuring
    Res := DbiDoRestructure(hDb, 1, @TableDesc, nil, nil, nil, FALSE);
    Check(Res);
  finally
    if pFields <> nil then FreeMem(pFields);
    if pOp <> nil then FreeMem(pOp);

//    PackTable(Table);
    Table.Exclusive := False;
    Table.Open;
  end;
end;

    {
procedure AddPasswordToParadoxTable(TableName, Password: String);
var
   TableDesc : CRTblDesc;
   TempDB : TDatabase;
begin
   Check(DbiInit(nil));
   Randomize;

   TempDB := TDatabase.Create(nil);
   TempDB.Params.Add('path=' + ExtractFilePath(TableName));
   TempDB.DatabaseName := 'encpdxdb'+IntToStr(Random(50));
   TempDB.DriverName := 'Standard';
   TempDB.Connected := TRUE;

   FillChar(TableDesc, Sizeof(CRTblDesc), #0);
   StrPCopy(TableDesc.szTblName, ExtractFileName(TableName));
   TableDesc.bProtected := True;
   StrPCopy(TableDesc.szPassword, Password);
   try
     Check(DbiDoRestructure(TempDB.Handle, 1, @TableDesc, nil, nil, nil, False));
   finally
      TempDB.Free;
   end;
end;
      }

procedure DBIForceWrite(tbl : TTable);
begin
   Check(DBISaveChanges(tbl.Handle));
end;

function ChangeLevel (hTmpDb:hDBIDB; TableName: string; sLevel: string):DBIResult;
type
   pByte = ^Byte;
var 
   pOptDesc,pOrigDesc: pFLDDesc;
   pOptData,pOrigData: pBYTE;
   TblDesc: CRTBLDesc;
begin
      FillChar(TblDesc, SizeOf(CRTBLDesc), 0);
      pOptDesc:=AllocMem(1*sizeOf(FLDDesc));
      pOrigDesc:=pOptDesc; 
      pOptData:=AllocMem(10);
      pOrigData:=pOptData; 

      pOptDesc.iOffset:=0; 
      pOptDesc.iLen:=Length(sLevel)+1;
      StrPCopy(pOptDesc.szName,'LEVEL');
      StrPCopy(pChar(pOptData),sLevel);


      StrPCopy(TblDesc.szTblName, TableName); 
      StrCopy(TblDesc.szTblType,szPARADOX);
      TblDesc.pfldOptParams:=pOrigDesc;
      TblDesc.iOptParams:=1;
      TblDesc.pOptData:=pOrigData;


      Result:=DBIDoRestructure(hTMPDb, 1, @TblDesc, nil, nil, nil, True);


      FreeMem(pOrigDesc, 1*SizeOf(FLDDesc));
      FreeMem(pOrigData,10);

end;

function GetTableLevel(ATable: TTable): integer;
var CurPrp: CurProps;
begin
  Check(DBIGetCursorProps(ATable.Handle, CurPrp));
  Result := CurPrp.iTblLevel;
end;

function DoLactNoUpdate(const AnimalID, NewLactNo : Integer;
   const UpdateEvents : Boolean = True): Boolean;
var
   OldLactNo, LactNoDiff : Integer;
   sCurrentLactation : string;
   tAnimals, tEvents : TTable;
   AnimalFound : Boolean;
   l1, l2 : Integer;
   res : Boolean;
begin
   Result := False;

   tAnimals := TTable.Create(nil);
   tAnimals.DatabaseName := AliasName;
   tAnimals.TableName := 'Animals';
   tAnimals.Active := True;
   tAnimals.Filter := 'Sex = ''Female''';
   tAnimals.Filtered := True;

   tEvents := TTable.Create(nil);
   tEvents.DatabaseName := AliasName;
   tEvents.TableName := 'Events';
   tEvents.Active := True;

   try

      AnimalFound := tAnimals.Locate('ID', AnimalID, []);
      if AnimalFound then
         begin
            if ( tAnimals.FieldByName('LactNo').AsInteger >= NewLactNo ) then
               begin
                  MessageDlg('You must enter a new lactation number with a higher value'+cCRLF+
                             'than the existing Lactation Number.',mtError,[mbOK],0);
                  SysUtils.Abort;
               end
            else
               begin
                  if MessageDlg(Format('Update animal "%s" with lactation number "%d", are you sure?',[tAnimals.FieldByName('NatIDNum').AsString,
                                NewLactNo]),mtConfirmation,[mbYes,mbNo],0) <> idYes then
                     begin
                        SysUtils.Abort;
                     end;
                  OldLactNo := tAnimals.FieldByName('LactNo').AsInteger;
               end;

             with TQuery.create(nil) do
               try
                  DatabaseName := AliasName;
                  SQL.Clear;
                  SQL.Add('Select * from Events where ( AnimalID = '+IntToStr(AnimalID) + ')');
                  SQL.Add('And ( AnimalLactNo = 0 )');
                  SQL.Add('And ( EventType <> '+IntToStr(CNewIDEvent)+' )');
                  Open;

                  //   27/08/15 [V5.4 R7.4] /MK Change - Changed warning to delete zero lact events or contact Kingswood for help
                  //                                     and remove tech jargen about events table - GL request.
                  if RecordCount > 0 then
                     begin
                        MessageDlg('Cannot continue update. Events have been found in lactation zero.'+cCRLF+
                                   'Delete these events or contact Kingswood at +353-1-4599491.',mtError,[mbOK],0);
                        SysUtils.Abort;
                     end;
               finally
                  Close;
                  Free;
               end;

            tAnimals.edit;
            try
               tAnimals.FieldByName('LactNo').AsInteger := NewLactNo;
               tAnimals.Post;
               DBIForceWrite(tAnimals);

               if not UpdateEvents then
                  begin
                     Result := True;
                     SysUtils.Abort;
                  end;

            except
               on E : Exception do
                  begin
                     tAnimals.Cancel;
                     Raise Exception.Create(E.Message);
                  end;
            end;

            with tQuery.Create(nil) do
               try
                  LactNoDiff := ( NewLactNo - OldLactNo );

                  if ( LactNoDiff <= 0 ) then
                     begin
                        // Shouldnt ocurr!
                        MessageDlg('Error completing update, cannot continue',mtError,[mbOK],0);
                        SysUtils.Abort;
                     end;

                  DatabaseName := AliasName;
                  SQL.Add('Update Events Set AnimalLactNo = '+IntToStr(NewLactNo));
                  SQL.Add('Where (( AnimalID = '+IntToStr(AnimalID)+' ) ');
                  SQL.Add('And ( AnimalLactNo = '+IntToStr(OldLactNo)+')) ');
                  ExecSQL;

                  with tEvents do
                     begin
                        Filter   := 'AnimalID = '+ IntToStr(AnimalID);
                        Filtered := True;
                        res := FindFirst;
                        while res do
                           begin
                              if ( tEvents.FieldByName('AnimalLactNo').AsInteger <> 0 ) then
                              if ( tEvents.FieldByName('AnimalLactNo').AsInteger <> NewLactNo ) then
                                 begin
                                    Edit;
                                    try
                                       l1 := tEvents.FieldByName('AnimalLactNo').AsInteger;
                                       tEvents.FieldByName('AnimalLactNo').AsInteger := l1 + LactNoDiff;
                                       Post;
                                    except
                                       on E : Exception do
                                          begin
                                             tEvents.Cancel;
                                             Raise Exception.Create(E.Message);
                                          end;
                                    end;
                                 end;
                              res := tEvents.FindNext;
                           end;
                        Filter   := '';
                        Filtered := False;
                        DBIForceWrite(tEvents);
                     end;
               finally
                  Free;
               end;
            Result := True;
            MessageDlg('Lactation update completed successfully',mtInformation,[mbOK],0);
         end
      else
         MessageDlg('Error locating animal record',mtError,[mbOK],0);
   finally
      tAnimals.Active := False;
      FreeAndNil(tAnimals);
      tEvents.Active := False;
      FreeAndNil(tEvents);
   end;
end;

function UpdateLactNo(const AnimalID : Integer) : Boolean;
var
   sCurrentLactation : string;
begin
   Result := False;
   if InputQuery('Enter the new lactation number', 'Lactation Number', sCurrentLactation) then
      begin
         try
            StrToInt(sCurrentLactation);
         except
            MessageDlg('Invalid input - please enter a valid number',mtError,[mbOK],0);
            SysUtils.Abort;
         end;
         Result := DoLactNoUpdate( AnimalID, StrToInt(sCurrentLactation));
      end;
end;

//   21/12/11 [V5.0 R2.9] /MK Bug Fix - Need To Filter SQL For ConditionScore EventType.
function GetConditionScore(const AID, ALactNo : Integer) : Double;
var
   tQry : TQuery;
begin
   Result := 0;
   tQry := TQuery.Create(nil);
   with tQry do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT C.Score, E.EventDate From ConditionScore C');
         SQL.Add('RIGHT JOIN Events E ON (C.EventID=E.ID)');
         SQL.Add('WHERE ((E.AnimalID = :AID) AND (E.AnimalLactNo = :ALactNo ))');
         SQL.Add('AND E.EventType = :ConditionScore');
         SQL.Add('ORDER BY E.EventDate ');
         Params[0].AsInteger := AID;
         Params[1].AsInteger := ALactNo;
         Params[2].AsInteger := CCondScoreEvent;
         Open;
         if not IsEmpty then
            begin
               Last;
               if FieldbyName('Score').AsFloat > 0 then
                  Result := FieldbyName('Score').AsFloat;
            end;
      finally
         Close;
         Free;
      end;
end;

function System_Registered_Country : TCountry;
 { Ireland, NIreland, Scotland, England, Poland, Other }
var
   tOwners : TTable;
begin
   Result := Other;
   tOwners := TTable.Create(nil);
   with tOwners do
      try
         DatabaseName := 'kingswd';
         TableName := 'owners';
         Active := True;
         First;
         while not eof do
            begin
               if (UpperCase(FieldByName('HerdIdentity').AsString) <> 'NONE') and (FieldByName('Country').AsInteger = 1) then
                  begin
                     Result := Ireland;
                     Break;
                  end;
               tOwners.Next;
            end;

         if not (Result = Other )then
            begin
               First;
               while not eof do
                  begin
                     if (UpperCase(FieldByName('HerdIdentity').AsString) <> 'NONE') and (FieldByName('Country').AsInteger = 1) then
                        begin
                           Result := Ireland;
                           Break;
                        end
                     else if (UpperCase(FieldByName('HerdIdentity').AsString) <> 'NONE') and (FieldByName('Country').AsInteger = 12) then
                        begin
                           Result := NIreland;
                           Break;
                        end
                     else if (UpperCase(FieldByName('HerdIdentity').AsString) <> 'NONE') and (FieldByName('Country').AsInteger = 7) then
                        begin
                           Result := England;
                           Break;
                        end
                     else
                        Result := Other;

                     tOwners.Next;
                  end;
            end;
      finally
         Close;
         Free;
      end;
end;


procedure ForceIndicesRemoval(ADirectory : String);
var
   FileList : TStringList;
   i : Integer;
begin
   FileList := TStringList.Create;

   GetDirectoryFiles(ADirectory, FileList, '*.px');
   for i := 0 to FileList.Count-1 do
      begin
         if FileExists(FileList.Strings[i]) then
            DeleteFile( FileList.Strings[i]);
      end;

   GetDirectoryFiles(ADirectory, FileList, '*.xg?');
   for i := 0 to FileList.Count-1 do
      begin
         if FileExists(FileList.Strings[i]) then
            DeleteFile( FileList.Strings[i]);
      end;

   GetDirectoryFiles(ADirectory, FileList, '*.yg?');
   for i := 0 to FileList.Count-1 do
      begin
         if FileExists(FileList.Strings[i]) then
            DeleteFile( FileList.Strings[i]);
      end;

   GetDirectoryFiles(ADirectory, FileList, '*.val');
   for i := 0 to FileList.Count-1 do
      begin
         if FileExists(FileList.Strings[i]) then
            DeleteFile( FileList.Strings[i]);
      end;

end;

procedure CloneRecord(Dataset: TDataSet; var VarArray : Variant);
var
   i : Integer;
begin
   VarArray := VarArrayCreate([0,DataSet.Fieldcount-1],VarVariant);
   for i := 0 to (DataSet.FieldCount-1) do
      VarArray[i] := DataSet.Fields[i].Value;
end;

procedure PostClonedRecord(var Dataset: TDataSet; var VarArray : Variant);
var
   i : Integer;
begin
   DataSet.Append;
   for i := 0 to (DataSet.FieldCount-1) do
      DataSet.fields[i].Value := VarArray[i] ;
   DataSet.Post;
end;

function HerdIDByAnimalID(AAnimalID: Integer): Integer;
begin
   Result := GetAnimalInfo(AAnimalID, 'HerdID');
end;

function GetAnimalInfo(AAnimalID: Integer;
  AField: String): Variant;
begin

   with TQuery.Create(nil) do
      try
         Databasename := AliasName;
         SQL.Add(Format('Select %s From Animals Where ID=:ID',[AField]));
         Params[0].AsInteger := AAnimalID;
         Open;
         try
            First;
            Result := FieldByName(AField).Value;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;
{
function GetLastEventDate(const AID, LactNo, EventType : Integer) : TDateTime;
begin

   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Add('Select Max(EventDate) EDate From Events Where AnimalID = :AID And EventType =:EID');
         if ( LactNo > -1 ) then
            SQL.Add('And AnimalLactNo=:AnimalLactNo');
         Params[0].AsInteger := AID;
         Params[1].AsInteger := EventType;
         if ( LactNo > -1 ) then
            Params[2].AsInteger := LactNo;
         Open;
         try
            First;
            Result := FieldByName('EDate').AsDateTime;
         finally
            Close;
         end;

      finally
         Free;
      end;
end;

function GetLastEventDate(const AID,
  EventType: Integer): TDateTime;
begin
   Result := GetLastEventDate(AID, -1, EventType)
end;
 }
{function GetFirstEventDate(const AID, LactNo,
  EventType: Integer): TDateTime;
begin
   Result := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Add('Select Min(EventDate) EDate From Events Where AnimalID = :AID And EventType =:EID');
         if LactNo > -1 then
            SQL.Add('And AnimalLactNo=:AnimalLactNo');
         Params[0].AsInteger := AID;
         Params[1].AsInteger := EventType;
         if LactNo > -1 then
            Params[2].AsInteger := LactNo;
         Open;
         try
            First;
            Result := FieldByName('EDate').AsDateTime;
         finally
            Close;
         end;

      finally
         Free;
      end;
end;

function GetFirstEventDate(const AID,
  EventType: Integer): TDateTime;
begin
   Result := GetFirstEventDate(AID, -1, EventType);
end;}

procedure GetPreSaleStatusInfo(const AID : Integer; const ASalesDate : TDateTime;
  var AStatusInfo : TStatusInfo; ACustomerID : Integer);
var
   BirthDate, TBTestDate, BruceDate,
   PurchDate, CutOffDate, WithdrawalDate : TDateTime;
   AnimalSex : String;
   AdminDays : Integer;
   WithDrawalDays : Double;
   GenQuery : TQuery;
   HerdOwnerData : THerdOwnerData;
   HerdID : Integer;
   EventDataHelper : TEventDataHelper;

   function CustomerIsMeatFactory : Boolean;
   var
     tResult : Variant;
   begin
      Result := False;
      tResult := WinData.Customers.Lookup('ID', ACustomerID, 'MeatFactory');
      if not VarIsNull(tResult) then
         Result := tResult;
   end;
   
begin
   GenQuery := TQuery.Create(nil);
   GenQuery.DatabaseName := AliasName;

   HerdID := HerdIDByAnimalID(AID);
   HerdOwnerData := THerdOwnerData.create(nil,HerdID);

   EventDataHelper := TEventDataHelper.Create;

   try
      FillChar(AStatusInfo, SizeOf(TStatusInfo), 0);
      with GenQuery do
         begin
            SQL.Clear;
            SQL.Add('Select Sex, DateOfBirth, TBTestDate, Brucellosis From Animals Where ID = :AID');
            Params[0].AsInteger := AID;
            Open;
            try
              First;
              TBTestDate := FieldByName('TBTestDate').AsDateTime;
              BruceDate := FieldByName('Brucellosis').AsDateTime;
              BirthDate := FieldByName('DateOfBirth').AsDateTime;
              AnimalSex := FieldByName('Sex').AsString;
            finally
              Close;
            end;
         end;

      AStatusInfo.CheckBrucellosis := ( ( AnimalSex <> cSex_Steer ) and ( BirthDate <= IncMonth(Date, -12) ) and NOT(CustomerIsMeatFactory)) and (WinData.GlobalSettings.DisplayBruceTestDateWarningBeforeSale);
      AStatusInfo.CheckTBTest      := ( BirthDate < (Date-(7 * 6))) and (WinData.GlobalSettings.DisplayTBTestDateWarningBeforeSale);
      AStatusInfo.CheckMinimumDaysOnFarm  := WinData.GlobalSettings.DisplayMinimumDaysOnFarmWarningBeforeSale;
      PurchDate := EventDataHelper.GetLastEventDate(AID,-1, cPurchaseEvent);
      if ( PurchDate > 0 ) then
         AStatusInfo.NoDaysOnFarm := Trunc( ASalesDate - PurchDate)
      else
         AStatusInfo.NoDaysOnFarm := Trunc( ASalesDate - BirthDate);
      AStatusInfo.TBTestDate := TBTestDate;
      AStatusInfo.BruceDate := BruceDate;

      AStatusInfo.WithinDrugWithdrawalPeriod := False;

      with GenQuery do
         begin
            // Find the maxium withdrawal days in medicine.db
            // Exclude any health events before WithDrawalDays + DateToUse

            //   28/01/15 [V5.4 R2.6] /MK Bug Fix - Exclude N_A withdrawals for max withdrawal days.
            SQL.Clear;
            SQL.Add('SELECT MAX(WithDrawal) MeatWDDays, ');
            SQL.Add('       MAX(MilkWithDrawal) MilkWDDays, ');
            SQL.Add('       MAX(OtherWithDrawal) OtherWDDays,  ');
            SQL.Add('       MAX(OrganicMeatWithDrawal) OrganicMeatWDDays,  ');
            SQL.Add('       MAX(OrganicMilkWithDrawal) OrganicMilkWDDays,  ');
            SQL.Add('       MAX(OrganicOtherWithDrawal) OrganicOtherWDDays ');
            SQL.Add('FROM Medicine');
            SQL.Add('WHERE ( (MilkN_A_Drug = False) OR (MilkN_A_Drug IS NULL) )');
            SQL.Add('AND   ( (MeatN_A_Drug = False) OR (MeatN_A_Drug IS NULL) )');
            try
               Open;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;

            First;
            WithDrawalDays := GenQuery.FieldByName('MeatWDDays').AsInteger;
            if GenQuery.FieldByName('MilkWDDays').AsInteger > WithDrawalDays then
               WithDrawalDays := GenQuery.FieldByName('MilkWDDays').AsInteger
            else if GenQuery.FieldByName('OtherWDDays').AsInteger > WithDrawalDays then
               WithDrawalDays := GenQuery.FieldByName('OtherWDDays').AsInteger;

            if HerdOwnerData.OrganicHerd then
               begin
                  if GenQuery.FieldByName('OrganicMeatWDDays').AsInteger > WithDrawalDays then
                     WithDrawalDays := GenQuery.FieldByName('OrganicMeatWDDays').AsInteger
                  else if GenQuery.FieldByName('OrganicMilkWDDays').AsInteger > WithDrawalDays then
                     WithDrawalDays := GenQuery.FieldByName('OrganicMilkWDDays').AsInteger
                  else if GenQuery.FieldByName('OrganicOtherWDDays').AsInteger > WithDrawalDays then
                     WithDrawalDays := GenQuery.FieldByName('OrganicOtherWDDays').AsInteger;
               end;

            Close;
         end;

      CutOffDate := Date - WithDrawalDays;
      with GenQuery do
         begin
            SQL.Clear;
            SQL.Add('SELECT DISTINCT E.AnimalID, E.ID, E.EventDate, H.NoDays,');
            SQL.Add('M.Withdrawal, M.MilKWithDrawal, M.OtherWithdrawal,  ');
            SQL.Add('M.OrganicMeatWithDrawal, M.OrganicMilkWithDrawal, M.OrganicOtherWithDrawal,  ');
            SQL.Add('M.MilkN_A_Drug, M.MeatN_A_Drug');
            SQL.Add('FROM Events E');
            SQL.Add('LEFT JOIN Health H ON (H.EventID = E.ID)');
            SQL.Add('LEFT JOIN Medicine M ON (M.ID = H.DrugUsed)');
            SQL.Add('WHERE (E.AnimalID = :AID)');
            SQL.Add('AND E.EventType IN ('+IntToStr(CHealthEvent)+','+IntToStr(CDryOffEvent)+')');
            // Select all health/dry events after DateToUse ( CutOffDate - WithDrawalDays )
            // This will ensure only animals still in withdrawal period will be considered for report.
            SQL.Add('AND (E.EventDate >= "'+FormatDateTime('mm/dd/yyyy',CutOffDate)+'")');
            Params[0].AsInteger := AID;
            Open;
            if NOT (IsEmpty) then
               try
                  GenQuery.First;
                  while NOT GenQuery.Eof do
                     begin

                        AdminDays := GenQuery.FieldByName('NoDays').AsInteger;

                        // Standard withdrawal dates.
                        //    27/03/14 [V5.2 R9.2] /MK Bug Fix - Check for Not Applicable Boolean.
                        if ( not(GenQuery.FieldByName('MeatN_A_Drug').AsBoolean) ) then
                           begin
                              WithDrawalDays := GenQuery.FieldByName('WithDrawal').AsFloat;
                              if Frac( WithDrawalDays ) <> 0 then
                                 WithDrawalDays :=WithDrawalDays +1; // safe option
                              WithdrawalDate := GenQuery.FieldByName('EventDate').AsDateTime + ( AdminDays -1 ) + WithDrawalDays;
                              if WithDrawalDate >= ASalesDate then
                                 begin
                                    AStatusInfo.WithinDrugWithdrawalPeriod := True;
                                    Break;
                                 end;
                           end;

                        //    27/03/14 [V5.2 R9.2] /MK Bug Fix - Check for Not Applicable Boolean.
                        if ( not(GenQuery.FieldByName('MilkN_A_Drug').AsBoolean) ) then
                           begin
                              WithDrawalDays := GenQuery.FieldByName('MilkWithDrawal').AsFloat;
                              if Frac( WithDrawalDays ) <> 0 then
                                 WithDrawalDays :=WithDrawalDays +1; // safe option
                              WithdrawalDate := GenQuery.FieldByName('EventDate').AsDateTime + ( AdminDays -1 ) + WithDrawalDays;
                              if WithDrawalDate >= ASalesDate then
                                 begin
                                    AStatusInfo.WithinDrugWithdrawalPeriod := True;
                                    Break;
                                 end;
                           end;

                        //    27/03/14 [V5.2 R9.2] /MK Bug Fix - Check for Not Applicable Boolean.
                        if ( not(GenQuery.FieldByName('MeatN_A_Drug').AsBoolean) ) and ( not(GenQuery.FieldByName('MilkN_A_Drug').AsBoolean) ) then
                           begin
                              WithDrawalDays := GenQuery.FieldByName('OtherWithDrawal').AsFloat;
                              if Frac( WithDrawalDays ) <> 0 then
                                 WithDrawalDays :=WithDrawalDays +1; // safe option
                              WithdrawalDate := GenQuery.FieldByName('EventDate').AsDateTime + ( AdminDays -1 ) + WithDrawalDays;
                              if WithDrawalDate >= ASalesDate then
                                 begin
                                    AStatusInfo.WithinDrugWithdrawalPeriod := True;
                                    Break;
                                 end;

                              if HerdOwnerData.OrganicHerd then
                                 begin
                                    // Standard withdrawal dates.
                                    WithDrawalDays := GenQuery.FieldByName('OrganicMeatWithdrawal').AsFloat;
                                    if Frac( WithDrawalDays ) <> 0 then
                                       WithDrawalDays :=WithDrawalDays +1; // safe option
                                    WithdrawalDate := GenQuery.FieldByName('EventDate').AsDateTime + ( AdminDays -1 ) + WithDrawalDays;
                                    if WithDrawalDate >= ASalesDate then
                                       begin
                                          AStatusInfo.WithinDrugWithdrawalPeriod := True;
                                          Break;
                                       end;
                                    WithDrawalDays := GenQuery.FieldByName('OrganicMilkWithdrawal').AsFloat;
                                    if Frac( WithDrawalDays ) <> 0 then
                                       WithDrawalDays :=WithDrawalDays +1; // safe option
                                    WithdrawalDate := GenQuery.FieldByName('EventDate').AsDateTime + ( AdminDays -1 ) + WithDrawalDays;
                                    if WithDrawalDate >= ASalesDate then
                                       begin
                                          AStatusInfo.WithinDrugWithdrawalPeriod := True;
                                          Break;
                                       end;
                                    WithDrawalDays := GenQuery.FieldByName('OrganicOtherWithdrawal').AsFloat;
                                    if Frac( WithDrawalDays ) <> 0 then
                                       WithDrawalDays :=WithDrawalDays +1; // safe option
                                    WithdrawalDate := GenQuery.FieldByName('EventDate').AsDateTime + ( AdminDays -1 ) + WithDrawalDays;
                                    if WithDrawalDate >= ASalesDate then
                                       begin
                                          AStatusInfo.WithinDrugWithdrawalPeriod := True;
                                          Break;
                                       end;

                                 end;
                           end;
                        GenQuery.Next;
                     end;
               finally
                  GenQuery.Close;
               end;
         end;
   finally
      FreeAndNil(GenQuery);
      FreeAndNil(EventDataHelper);
   end;

end;

function GetHerdsFromDatabases(ADatabaseList : TStrings) : THerds;
var
   HerdQuery : TQuery;
   Herd : THerd;
   i : Integer;
   BaseDir : string;
begin
   Result := THerds.Create(True);

   //BaseDir := IncludeTrailingBackslash( ApplicationPath );
   BaseDir := 'C:\Kingswood Herd Management\';

   HerdQuery := TQuery.Create(nil);
   HerdQuery.SQL.Add('SELECT ID, HerdIdentity ');
   HerdQuery.SQL.Add('FROM Owners');
   HerdQuery.SQL.Add('WHERE (UPPER(HerdIdentity) <> "NONE")');

   try

      for i := 0 to ADatabaseList.Count-1 do
         begin
            HerdQuery.DatabaseName := BaseDir + ADatabaseList.Strings[i];
            HerdQuery.Open;
            try
                if HerdQuery.RecordCount > 0 then
                   begin

                      HerdQuery.First;

                      while not HerdQuery.eof do
                         begin
                            Herd := THerd.Create;
                            Herd.Id := HerdQuery.FieldByName('Id').AsInteger;
                            Herd.HerdIdentity := HerdQuery.FieldByName('HerdIdentity').AsString;
                            Herd.DatabasePath := BaseDir + ADatabaseList.Strings[i];

                            Result.Add(Herd);

                            HerdQuery.Next;
                         end;
                   end;
            finally
               HerdQuery.Close;
            end;
         end;
   finally
      SafeFreeAndNil(HerdQuery);
   end;
end;

function GetQuery ( const ADatabaseName : String = '' ) : TQuery;
begin
   Result := TQuery.Create(nil);
   if Length(Trim(ADatabaseName)) > 0 then
      Result.DatabaseName := ADatabaseName
   else
      Result.DatabaseName := AliasName;

   Result.SQL.Clear;
end;

function GetBreedIDFromAnimalID(AAnimalID: Integer): Integer;
begin
   Result := 0;
   if ( AAnimalID = 0 ) then Exit;

   with GetQuery do
      try
         SQL.Clear;
         SQL.Add('SELECT PrimaryBreed');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE ID = '+IntToStr(AAnimalID)+'');
         try
            Open;
            Result := Fields[0].AsInteger;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

function GetCrossBreedByQuery(ABreedID : Integer): Integer;
var
   BreedCode : String[6];
   BreedLen : Word;
   qBreeds : TQuery;
begin
   Result := 0;
   qBreeds := TQuery.Create(nil);
   with qBreeds do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM Breeds');
         SQL.Add('WHERE ID = '+IntToStr(ABreedID)+'');
         try
            Open;
            BreedCode := FieldByName('Code').AsString;
            BreedLen := Length(BreedCode);
            if ( BreedLen > 0 ) then
               begin
                  if ((BreedCode[BreedLen]) = 'X') then
                     Result := FieldByName('ID').AsInteger
                  else
                     begin
                        BreedCode := BreedCode + 'X';
                        Close;
                        SQL.Clear;
                        SQL.Add('SELECT ID');
                        SQL.Add('FROM Breeds');
                        SQL.Add('WHERE Code = "'+BreedCode+'"');
                        try
                           Open;
                           if ( Fields[0].AsInteger > 0 ) then
                              Result := Fields[0].AsInteger;
                        except
                           on e : Exception do
                              ShowMessage(e.Message);
                        end;
                     end;
               end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

end.
