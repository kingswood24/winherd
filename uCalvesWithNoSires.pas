{
   10/09/14 [V5.3 R6.1] /MK Additional Feature - Change breed of calf to Sire Breed or Cross Breed.

   04/11/14 [V5.3 R8.8] /MK Bug Fix - CreateDummyBullRecord - Set Record to zero before setting Result. Result BullID was large int from Delphi defaults.

   22/04/15 [V5.4 R3.9] /MK Change - Added descriptive text to the screen to explain to the user what to do.
}

unit uCalvesWithNoSires;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxContainer, cxEdit, cxLabel, ExtCtrls, dxBar, dxBarExtItems, ActnList,
  dxStatusBar, db, dbTables, GenTypesConst, KDBRoutines, uHerdLookup,
  cxDBEdit, cxDBLookupComboBox, EventRecording, DairyData;

type
  TfmCalvesNoSires = class(TfmBaseForm)
    pInfo: TPanel;
    lInfo: TcxLabel;
    AnimalGridDBTableView: TcxGridDBTableView;
    AnimalGridLevel: TcxGridLevel;
    AnimalGrid: TcxGrid;
    AnimalGridDBTableViewCalfNumber: TcxGridDBColumn;
    AnimalGridDBTableViewCalfNatID: TcxGridDBColumn;
    AnimalGridDBTableViewCalfSireCode: TcxGridDBColumn;
    AnimalGridDBTableViewDateOfBirth: TcxGridDBColumn;
    AnimalGridDBTableViewCalfBreed: TcxGridDBColumn;
    dxBarLargeButton1: TdxBarLargeButton;
    actSave: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure actSaveExecute(Sender: TObject);
  private
    FTempCalves : TTable;
    FDSTempCalves : TDataSource;
    FTempBulls : TTable;
    FDSTempBulls : TDataSource;
    { Private declarations }
  public
    class function GetCalvesWithNoSires : Integer;
    { Public declarations }
  end;

var
  fmCalvesNoSires: TfmCalvesNoSires;

implementation

{$R *.DFM}

{ TfmCalvesNoSires }

class function TfmCalvesNoSires.GetCalvesWithNoSires : Integer;
var
   i : Integer;
begin
   with TfmCalvesNoSires.Create(nil) do
      try
         WinData.FCalfSiresUpdate := False;
         Result := 0;
         with GetQuery do
            try
               for i := 1 to 4 do
                  begin
                     SQL.Clear;
                     SQL.Add('INSERT INTO '+FTempCalves.TableName+' ( AnimalID, AnimalNo, SortAnimalNo, NatIDNum,');
                     SQL.Add('                                        SortNatID, DateOfBirth, BreedCode, BreedName )');
                     SQL.Add('SELECT A.ID, A.AnimalNo, A.SortAnimalNo, A.NatIDNum,');
                     SQl.Add('       A.SortNatID, A.DateOfBirth, B.Code, B.Name');
                     SQL.Add('FROM Animals A');
                     SQL.Add('LEFT JOIN Breeds B On (B.ID = A.PrimaryBreed)');
                     SQL.Add('WHERE ( A.SireID IS NULL OR A.SireID = 0 )');
                     SQL.Add('AND A.DateOfBirth >= "'+FormatDateTime(cUSDateStyle,IncMonth(Date,-cCheckCalvesForThreeMonth))+'"');
                     SQL.Add('AND A.NatIDNum IS NOT NULL');
                     SQL.Add('AND A.ID IN (SELECT C.ID'+IntToStr(i)+'');
                     SQL.Add('             FROM Calvings C');
                     SQL.Add('             WHERE C. ID'+IntToStr(i)+'Notified = False)');
                     try
                        ExecSQL;
                     except
                        on e : Exception do
                           ShowMessage(e.Message);
                     end;
                  end;
            finally
               Free;
            end;

         FTempCalves.Close;
         FTempCalves.Open;
         if ( FTempCalves.RecordCount > 0 ) then
            begin
               if ( not(FTempBulls.Active) ) then
                  FTempBulls.Active := True;
               try
                  FTempBulls.Insert;
                  FTempBulls.FieldByName('AnimalID').AsInteger := 0;
                  FTempBulls.FieldByName('BullCode').AsString := 'UNKNWN';
                  FTempBulls.Post;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;

               with GetQuery do
                  try
                     SQL.Add('INSERT INTO '+FTempBulls.TableName+' ( AnimalID, BullCode )');
                     SQL.Add('SELECT A.ID, A.AnimalNo');
                     SQL.Add('FROM Animals A');
                     SQL.Add('INNER JOIN BullSemenStk BS ON (BS.AnimalID = A.ID)');
                     SQL.Add('AND (BS.InUse = True)');
                     SQL.Add('AND (UPPER(A.Sex)="BULL")');
                     SQL.Add('AND (A.Breeding = True)');
                     SQL.Add('AND (A.AnimalDeleted=False)');
                     SQL.Add('AND (A.AnimalNo Is Not Null)');
                     try
                        ExecSQL;
                     except
                        on e : Exception do
                           ShowMessage(e.Message);
                     end;
                  finally
                     Free;
                  end;

               FTempBulls.Close;
               FTempBulls.Open;
               FDSTempBulls := TDataSource.Create(nil);
               FDSTempBulls.DataSet := FTempBulls;
               
               with AnimalGridDBTableView do
                  begin
                     with GetColumnByFieldName('SireID') do
                        begin
                           Caption := 'Sire';
                           Width := 100;
                           HeaderAlignmentHorz := taLeftJustify;
                           HeaderAlignmentVert := vaCenter;
                           PropertiesClass := TcxLookupComboBoxProperties;
                           with TcxLookupComboBoxProperties(Properties) do
                              begin
                                 Alignment.Horz := taCenter;
                                 Alignment.Vert := taVCenter;
                                 ListSource := FDSTempBulls;
                                 ListFieldNames := 'BullCode';
                                 KeyFieldNames := 'AnimalID';
                              end;
                        end;
                     DataController.DataSource := FDSTempCalves;
                  end;
               ShowModal;
            end;
      finally
         Result := FTempCalves.RecordCount;
         Free;
      end;
end;

procedure TfmCalvesNoSires.FormCreate(Sender: TObject);
begin
   inherited;
   FTempCalves := TTable.Create(nil);
   with FTempCalves do
      begin
         DatabaseName := AliasName;
         TableName := 'tmpCalvesNoSires';
         FieldDefs.Add('ID',ftAutoInc);
         FieldDefs.Add('AnimalID',ftInteger);
         FieldDefs.Add('AnimalNo',ftString,10);
         FieldDefs.Add('SortAnimalNo',ftString,10);
         FieldDefs.Add('NatIDNum',ftString,20);
         FieldDefs.Add('SortNatID',ftString,20);
         FieldDefs.Add('DateOfBirth',ftDate);
         FieldDefs.Add('BreedCode',ftString,6);
         FieldDefs.Add('BreedName',ftString,30);
         FieldDefs.Add('SireID',ftInteger);
         FieldDefs.Add('SireBreedID',ftInteger);
         CreateTable;
      end;

   FDSTempCalves := TDataSource.Create(nil);
   FDSTempCalves.DataSet := FTempCalves;

   FTempBulls := TTable.Create(nil);
   with FTempBulls do
      begin
         DatabaseName := AliasName;
         TableName := 'tmpCalfSires';
         FieldDefs.Add('ID',ftAutoInc);
         FieldDefs.Add('AnimalID',ftInteger);
         FieldDefs.Add('BullCode',ftString,10);
         FieldDefs.Add('BullBreedID',ftInteger);
         CreateTable;
      end;
end;

procedure TfmCalvesNoSires.actSaveExecute(Sender: TObject);
type
   RBullRecord = record
      BullID, BullBreedID : Integer;
   end;

   function CreateDummyBullRecord ( ABreedCode : String ) : RBullRecord;
   var
      AnimalRecord : TAnimalRecord;
      BullCode : String;
      NewBullRecord : RBullRecord;
   begin
      //   04/11/14 [V5.3 R8.8] /MK Bug Fix - Set Record to zero before setting Result. Result BullID was large int from Delphi defaults.
      NewBullRecord.BullID := 0;
      NewBullRecord.BullBreedID := 0;

      Result := NewBullRecord;

      if ( Length(ABreedCode) = 3 ) then
         if ( UpperCase(Copy(ABreedCode,3,1)) = 'X' ) then
            ABreedCode := UpperCase(Copy(ABreedCode,0,2));

      BullCode := 'UNKWN/'+ABreedCode;

      with GetQuery do
         try
            SQL.Add('SELECT A.ID, A.PrimaryBreed');
            SQL.Add('FROM Animals A');
            SQL.Add('WHERE A.AnimalNo = "'+BullCode+'"');
            try
               Open;
               if ( RecordCount > 0 ) then
                  begin
                     NewBullRecord.BullID := Fields[0].AsInteger;
                     NewBullRecord.BullBreedID := Fields[1].AsInteger;
                     Result := NewBullRecord;
                  end;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;

      if ( Result.BullID = 0 ) then
         begin
            AnimalRecord := TAnimalRecord.Create;
            AnimalRecord.CreateBullSemenStkRecord := True;
            try
               AnimalRecord.RaiseExceptions := False;
               AnimalRecord.AddToNoneHerd;
               AnimalRecord.AnimalNo := BullCode;
               AnimalRecord.Sex := cSex_Bull;
               AnimalRecord.LactNo := 0;
               AnimalRecord.InHerd := True;
               AnimalRecord.Breeding := True;
               AnimalRecord.DamID  := 0;
               AnimalRecord.SireID := 0;
               AnimalRecord.AnimalDeleted := False;
               AnimalRecord.Pedigree := True;
               AnimalRecord.PrimaryBreedCode := ABreedCode;
               if ( not(AnimalRecord.Save) ) then
                  AnimalRecord.Cancel
               else
                  begin
                     with TQuery.Create(nil) do
                        try
                           DatabaseName := AliasName;
                           SQL.Clear;
                           SQL.Add('INSERT INTO BullExt (AnimalID)');
                           SQL.Add('VALUES (:AnimalID)');
                           Params[0].AsInteger := AnimalRecord.ID;
                           ExecSQL;
                        finally
                           Free;
                        end;
                     NewBullRecord.BullID := AnimalRecord.ID;
                     NewBullRecord.BullBreedID := AnimalRecord.PrimaryBreed;
                     Result := NewBullRecord;
                  end;
            finally
               FreeAndNil(AnimalRecord);
            end;
         end;
   end;

   function GetNewCalfBreed ( ACalfID, ABullBreed : Integer ) : Integer;
   var
      iDamID, iDamBreedID : Integer;
      qCalfBreed : TQuery;
   begin
      Result := 0;
      if ACalfID = 0 then Exit;

      iDamID := 0;
      qCalfBreed := TQuery.Create(nil);
      with qCalfBreed do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('SELECT DamID');
            SQL.Add('FROM Animals');
            SQL.Add('WHERE ID = '+IntToStr(ACalfID)+'');
            try
               Open;
               iDamID := Fields[0].AsInteger;
               if ( iDamID > 0 ) then
                  begin
                     iDamBreedID := GetBreedIDFromAnimalID(iDamID);
                     if ( iDamBreedID > 0 ) then
                        begin
                           if ( iDamBreedID = ABullBreed ) then
                              Result := ABullBreed
                           else
                              Result := GetCrossBreedByQuery(ABullBreed);
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

var
   BullRecord : RBullRecord;
begin
   inherited;
   try
      FTempCalves.First;
      while ( not(FTempCalves.Eof) ) do
         begin
            if ( FTempCalves.FieldByName('SireID').AsInteger = 0 ) then
               try
                  BullRecord := CreateDummyBullRecord(FTempCalves.FieldByName('BreedCode').AsString);
                  FTempCalves.Edit;
                  FTempCalves.FieldByName('SireID').AsInteger := BullRecord.BullID;
                  FTempCalves.FieldByName('SireBreedID').AsInteger := BullRecord.BullBreedID;
                  FTempCalves.Post;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end
            else
               begin
                  BullRecord.BullID := 0;
                  BullRecord.BullBreedID := 0;

                  BullRecord.BullID := FTempCalves.FieldByName('SireID').AsInteger;
                  BullRecord.BullBreedID := GetBreedIDFromAnimalID(FTempCalves.FieldByName('SireID').AsInteger);
                  try
                     FTempCalves.Edit;
                     FTempCalves.FieldByName('SireBreedID').AsInteger := BullRecord.BullBreedID;
                     FTempCalves.Post;
                  except
                     on e : Exception do
                        ShowMessage(e.Message);
                  end;
               end;
            FTempCalves.Next;
         end;

      FTempCalves.First;
      while ( not(FTempCalves.Eof) ) do
         begin
            if ( FTempCalves.FieldByName('SireID').AsInteger > 0 ) then
               with GetQuery do
                  try
                     SQL.Add('UPDATE Animals');
                     if ( BullRecord.BullID > 0 ) then
                        begin
                           SQL.Add('SET SireID = :SireID, ');
                           SQL.Add('PrimaryBreed = '+IntToStr(GetNewCalfBreed(FTempCalves.FieldByName('AnimalID').AsInteger,
                                                                              FTempCalves.FieldByName('SireBreedID').AsInteger))+'');
                        end
                     else
                         SQL.Add('SET SireID = :SireID');
                     SQL.Add('WHERE ID = :AnimalID');
                     Params[0].AsInteger := FTempCalves.FieldByName('SireID').AsInteger;
                     Params[1].AsInteger := FTempCalves.FieldByName('AnimalID').AsInteger;
                     try
                        ExecSQL;
                     except
                        on e : Exception do
                           ShowMessage(e.Message);
                     end;
                  finally
                     Free;
                  end;
            FTempCalves.Next;
         end;

      with GetQuery do
         try
            SQL.Add('DELETE FROM '+FTempCalves.TableName+'');
            SQL.Add('WHERE SireID > 0');
            try
               ExecSQL;
            except
               on e : Exception do
                  ShowMessage(e.Message);
            end;
         finally
            Free;
         end;

      FTempCalves.Close;
      FTempCalves.Open;

      if ( FTempCalves.RecordCount = 0 ) then
         Close;
   finally
      WinData.FCalfSiresUpdate := True;
   end;
end;

procedure TfmCalvesNoSires.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   inherited;
   CanClose := ( FTempCalves.RecordCount = 0 );
   if ( not(CanClose) ) then
      CanClose := ( (MessageDlg('There are still calves with no sires selected.'+cCRLF+
                                'All calves must have a sire selected before registration.'+cCRLF+
                                'Are you sure you want to exit?',mtConfirmation,[mbYes,mbNo],0)) = mrYes );
end;

procedure TfmCalvesNoSires.FormDestroy(Sender: TObject);
begin
   inherited;
   if ( FTempCalves.RecordCount > 0 ) then
      begin
         HerdLookup.qServiceBullUsed.Close;
         HerdLookup.dsServiceBullUsed.DataSet := nil;
         AnimalGridDBTableView.DataController.DataSource := nil;
      end;

   if ( FTempCalves <> nil ) then
      begin
         if FTempCalves.Active then
            FTempCalves.Active := False;
         FTempCalves.DeleteTable;
         FreeAndNil(FTempCalves);
      end;

   if ( FDSTempCalves <> nil ) then
      FreeAndNil(FDSTempCalves);

   if ( FTempBulls <> nil ) then
      begin
         if FTempBulls.Active then
            FTempBulls.Active := False;
         FTempBulls.DeleteTable;
         FreeAndNil(FTempBulls);
      end;

   if ( FDSTempBulls <> nil ) then
      FreeAndNil(FDSTempBulls);
end;

end.
