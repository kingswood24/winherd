unit uEditAnimalDBByGrid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, dxBar, dxBarExtItems, ActnList, cxControls, dxStatusBar,
  db, dbTables, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  GenTypesConst, cxCustomData, KRoutines, uHerdLookup;

type
  TEditFieldType = (eftAnimalNo, eftTransponder);
  TfmEditAnimalsByGrid = class(TfmBaseForm)
    dxBarLargeButton1: TdxBarLargeButton;
    actSave: TAction;
    AnimalGridDBTableView: TcxGridDBTableView;
    AnimalGridLevel: TcxGridLevel;
    AnimalGrid: TcxGrid;
    AnimalGridDBTableViewNatID: TcxGridDBColumn;
    AnimalGridDBTableViewAnimalNo: TcxGridDBColumn;
    AnimalGridDBTableViewTransponderNo: TcxGridDBColumn;
    AnimalGridDBTableViewDateOfBirth: TcxGridDBColumn;
    AnimalGridDBTableViewSex: TcxGridDBColumn;
    AnimalGridDBTableViewBreed: TcxGridDBColumn;
    AnimalGridDBTableViewSortNatID: TcxGridDBColumn;
    AnimalGridDBTableViewSortAnimalNo: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AnimalGridDBTableViewSortNatIDGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure AnimalGridDBTableViewSortAnimalNoGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure FormActivate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
  private
    { Private declarations }
    FAnimalsTable : TTable;
    FAnimalsDS : TDataSource;
    FEditFieldType : TEditFieldType;
    FParlourInfo : TParlourDetails;
    procedure ApplyFilterByField;
  public
    { Public declarations }
    class procedure ShowTheForm(AEditFieldType : TEditFieldType);
  end;

var
  fmEditAnimalsByGrid: TfmEditAnimalsByGrid;

implementation

{$R *.DFM}

procedure TfmEditAnimalsByGrid.FormCreate(Sender: TObject);
var
   qAnimals : TQuery;
begin
   inherited;
   FAnimalsTable := TTable.Create(nil);
   FAnimalsTable.DatabaseName := AliasName;
   FAnimalsTable.TableName := 'tmpAnimals';
   FAnimalsTable.FieldDefs.Clear;
   FAnimalsTable.FieldDefs.Add('ID',ftAutoInc);
   FAnimalsTable.FieldDefs.Add('AnimalID',ftInteger);
   FAnimalsTable.FieldDefs.Add('AnimalNo',ftString,10);
   FAnimalsTable.FieldDefs.Add('SortAnimalNo',ftString,10);
   FAnimalsTable.FieldDefs.Add('NatIDNum',ftString,20);
   FAnimalsTable.FieldDefs.Add('SortNatID',ftString,20);
   FAnimalsTable.FieldDefs.Add('TransponderNo',ftString,20);
   FAnimalsTable.FieldDefs.Add('DateOfBirth',ftDate);
   FAnimalsTable.FieldDefs.Add('Sex',ftString,10);
   FAnimalsTable.FieldDefs.Add('Breed',ftString,6);
   FAnimalsTable.IndexDefs.Clear;
   FAnimalsTable.IndexDefs.Add('iId','Id',[ixPrimary, ixUnique]);
   FAnimalsTable.IndexDefs.Add('iAnimalID','AnimalID',[ixUnique, ixCaseInsensitive]);
   FAnimalsTable.CreateTable;
   FAnimalsTable.Open;

   FAnimalsDS := TDataSource.Create(nil);
   FAnimalsDS.DataSet := FAnimalsTable;

   qAnimals := TQuery.Create(nil);
   try
      qAnimals.DatabaseName := AliasName;
      qAnimals.SQL.Clear;
      qAnimals.SQL.Add('INSERT INTO '+FAnimalsTable.TableName+' (AnimalID, AnimalNo, SortAnimalNo, NatIDNum, SortNatID,');
      qAnimals.SQL.Add('                                         TransponderNo, DateOfBirth, Sex, Breed)');
      qAnimals.SQL.Add('SELECT A.ID, A.AnimalNo, A.SortAnimalNo, A.NatIDNum, A.SortNatID,');
      qAnimals.SQL.Add('       A.TransponderNo, A.DateOfBirth, A.Sex, B.Code BreedCode');
      qAnimals.SQL.Add('FROM Animals A');
      qAnimals.SQL.Add('LEFT JOIN Breeds B ON (B.ID = A.PrimaryBreed)');
      qAnimals.SQL.Add('RIGHT JOIN AFilters AF ON (AF.AID = A.ID)');
      try
         qAnimals.ExecSQL;
      except
      end;

      FAnimalsTable.Close;
      FAnimalsTable.Open;
      AnimalGridDBTableView.DataController.DataSource := FAnimalsDS;
   finally
      qAnimals.Free;
   end;
end;

class procedure TfmEditAnimalsByGrid.ShowTheForm(AEditFieldType : TEditFieldType);
begin
   with TfmEditAnimalsByGrid.Create(nil) do
      try
         FEditFieldType := AEditFieldType;
         AnimalGridDBTableViewAnimalNo.Visible := ( AEditFieldType = eftAnimalNo );
         AnimalGridDBTableViewSortAnimalNo.Visible := ( not(AnimalGridDBTableViewAnimalNo.Visible) );
         FAnimalsTable.Edit;
         FParlourInfo := TParlourDetails.Create();
         AnimalGridDBTableViewAnimalNo.Editing := ( AEditFieldType = eftAnimalNo );
         AnimalGridDBTableViewTransponderNo.Visible := ( AEditFieldType = eftTransponder ) and ( Length(FParlourInfo.ParlourType) > 0 );
         AnimalGridDBTableViewTransponderNo.Options.Editing := AnimalGridDBTableViewTransponderNo.Visible;
         Width := 634;
         if ( not(AnimalGridDBTableViewTransponderNo.Visible) ) then
            Width := 520;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmEditAnimalsByGrid.FormActivate(Sender: TObject);
var
   sFieldDesc : String;
begin
   inherited;
   ApplyFilterByField;
   if ( FAnimalsTable.RecordCount = 0 ) then
      begin
         if ( FEditFieldType = eftAnimalNo ) then
            sFieldDesc := 'animal numbers'
         else
            sFieldDesc := 'transponder numbers';
         MessageDlg('There are no animals to display.'+cCRLF+
                    'This could mean that all animals on the main grid have '+sFieldDesc+cCRLF+
                    'or there are no animals on the main grid.',mtInformation,[mbOK],0)
      end;
end;

procedure TfmEditAnimalsByGrid.actSaveExecute(Sender: TObject);
var
   tAnimals : TTable;
begin
   inherited;
   if ( FAnimalsTable.State in dsEditModes ) then
      FAnimalsTable.Post;

   tAnimals := TTable.Create(nil);
   try
      tAnimals.DatabaseName := AliasName;
      tAnimals.TableName := 'Animals';
      tAnimals.Open;

      FAnimalsTable.First;
      while ( not(FAnimalsTable.Eof) ) do
         begin
            if ( tAnimals.Locate('ID',FAnimalsTable.FieldByName('AnimalID').AsInteger,[]) ) then
               begin
                  if ( FEditFieldType = eftAnimalNo ) and ( Length(Trim(tAnimals.FieldByName('AnimalNo').AsString)) = 0 ) and
                     ( Length(Trim(FAnimalsTable.FieldByName('AnimalNo').AsString)) > 0 ) and
                     ( Trim(tAnimals.FieldByName('AnimalNo').AsString) <> FAnimalsTable.FieldByName('AnimalNo').AsString ) then
                     begin
                        if ( HerdLookup.AnimalNoAlreadyExists(Trim(FAnimalsTable.FieldByName('AnimalNo').AsString)) ) then
                           begin
                              MessageDlg('This animal number already exists.',mtError,[mbOK],0);
                              SysUtils.Abort;
                           end;
                        tAnimals.Edit;
                        tAnimals.FieldByName('AnimalNo').AsString := Trim(FAnimalsTable.FieldByName('AnimalNo').AsString);
                        tAnimals.FieldByName('SortAnimalNo').AsString := SortAnimalNoString(Trim(FAnimalsTable.FieldByName('AnimalNo').AsString));
                        tAnimals.Post;
                     end
                  else if ( Length(Trim(tAnimals.FieldByName('TransponderNo').AsString)) = 0 ) and
                          ( Length(Trim(FAnimalsTable.FieldByName('TransponderNo').AsString)) > 0 ) and
                          ( Trim(tAnimals.FieldByName('TransponderNo').AsString) <> FAnimalsTable.FieldByName('TransponderNo').AsString ) then
                     begin
                        if ( HerdLookup.TransponderNoAlreadyExists(Trim(FAnimalsTable.FieldByName('TransponderNo').AsString)) ) then
                           begin
                              MessageDlg('This transponder number already exists.',mtError,[mbOK],0);
                              SysUtils.Abort;
                           end;
                        tAnimals.Edit;
                        tAnimals.FieldByName('TransponderNo').AsString := Trim(FAnimalsTable.FieldByName('TransponderNo').AsString);
                        tAnimals.Post;
                     end;
               end;
            FAnimalsTable.Next;
         end;
      ApplyFilterByField;
   finally
      if ( tAnimals <> nil ) then
         begin
            tAnimals.Close;
            tAnimals.Free;
         end;
   end;
end;

procedure TfmEditAnimalsByGrid.AnimalGridDBTableViewSortNatIDGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   inherited;
   if ARecord <> nil then
      AText := ARecord.DisplayTexts[AnimalGridDBTableViewNatID.Index]
   else
      AText := '';
end;

procedure TfmEditAnimalsByGrid.AnimalGridDBTableViewSortAnimalNoGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
   inherited;
   if ARecord <> nil then
      AText := ARecord.DisplayTexts[AnimalGridDBTableViewAnimalNo.Index]
   else
      AText := '';
end;

procedure TfmEditAnimalsByGrid.ApplyFilterByField;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('DELETE FROM '+FAnimalsTable.TableName);
         if ( FEditFieldType = eftAnimalNo ) then
            SQL.Add('WHERE AnimalNo IS NOT NULL')
         else
            SQL.Add('WHERE TransponderNo IS NOT NULL');
         try
            ExecSQL;
            FAnimalsTable.Close;
            FAnimalsTable.Open;
            StatusBar.Panels[0].Text := '';
            if ( FAnimalsTable.RecordCount > 0 ) then
               StatusBar.Panels[0].Text := Format('Total animals : %d',[FAnimalsTable.RecordCount]);
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
end;

procedure TfmEditAnimalsByGrid.FormDestroy(Sender: TObject);
begin
   inherited;
   if ( FAnimalsTable <> nil ) then
      begin
         FAnimalsTable.Close;
         FAnimalsTable.DeleteTable;
         FAnimalsTable.Free;
      end;
   if ( FAnimalsDS <> nil ) then
      FAnimalsDS.Free;
   if ( FParlourInfo <> nil ) then
      FParlourInfo.Free;
end;

end.
