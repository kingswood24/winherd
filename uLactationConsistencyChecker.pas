{
   03/06/11 [V4.1 R1.8] /MK Additional Feature - Fixed Problem Where Grid Did Not Refresh After Create Calving.

   01/04/15 [V5.4 R2.3] /MK Bug Fix - actCreateCalving - AnimalID and LactNo were not being set properly.
}

unit uLactationConsistencyChecker;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, cxButtons, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ActnList;

type
  TfmLactationConsistencyChecker = class(TForm)
    AnimalGridDBTableView: TcxGridDBTableView;
    AnimalGridLevel: TcxGridLevel;
    AnimalGrid: TcxGrid;
    DataSource1: TDataSource;
    btnCreateCalving: TcxButton;
    btnCancel: TcxButton;
    QueryCowsIncompLacts: TQuery;
    AnimalGridDBTableViewNatIDNum: TcxGridDBColumn;
    AnimalGridDBTableViewDateOfBirth: TcxGridDBColumn;
    AnimalGridDBTableViewSex: TcxGridDBColumn;
    AnimalGridDBTableViewLactNo: TcxGridDBColumn;
    AnimalGridDBTableViewNoOfCalvings: TcxGridDBColumn;
    ActionList1: TActionList;
    actCreateCalving: TAction;
    AnimalGridDBTableViewAnimalNo: TcxGridDBColumn;
    lAnimalCount: TLabel;
    AnimalGridDBTableViewAnimalID: TcxGridDBColumn;
    procedure actCreateCalvingExecute(Sender: TObject);
    procedure actCreateCalvingUpdate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FCowsWithIncompleteLactations : TTable;
    FQueryCowsInHerd : TQuery;
    FHerdId : Integer;
    FMaxLactation : Integer;
    procedure LoadData;
    function QueryLactationCount ( AAnimalId : Integer) : Integer;
  public
    { Public declarations }
    class procedure ShowForm(const AHerdID : Integer; const AMaxLactation : Integer);
  end;

var
  fmLactationConsistencyChecker: TfmLactationConsistencyChecker;

implementation

uses
   uCalvingHistoryEntry, DairyData, KRoutines, GenTypesConst;

{$R *.DFM}

procedure TfmLactationConsistencyChecker.actCreateCalvingExecute(
  Sender: TObject);
var
   vAnimalID,
   vAnimalLactNo : Variant;
begin
   try
      Update;
      //   01/04/15 [V5.4 R2.3] /MK Bug Fix - AnimalID and LactNo were not being set properly. 
      with AnimalGridDBTableView.DataController do
         begin
            vAnimalID := Values[FocusedRecordIndex, GetItemByFieldName('ID').Index];
            vAnimalLactNo := Values[FocusedRecordIndex, GetItemByFieldName('LactNo').Index];
         end;
      if ( vAnimalID = Null ) then Exit;
      if ( vAnimalLactNo = Null ) then Exit;
      TfmCalvingHistoryEntry.CreateCalving(vAnimalID,vAnimalLactNo);
      begin
         AnimalGridDBTableView.DataController.BeginFullUpdate;
         QueryCowsIncompLacts.DisableControls;
         try
            LoadData;
         finally
            QueryCowsIncompLacts.EnableControls;
            AnimalGridDBTableView.DataController.EndFullUpdate;
         end;
      end;
   finally;
   end;
end;

procedure TfmLactationConsistencyChecker.actCreateCalvingUpdate(
  Sender: TObject);
begin
   actCreateCalving.Enabled := (QueryCowsIncompLacts.Active) and (QueryCowsIncompLacts.FieldByName('ID').AsInteger>0);
end;

class procedure TfmLactationConsistencyChecker.ShowForm(const AHerdID : Integer; const AMaxLactation : Integer);
begin
   with TfmLactationConsistencyChecker.Create(nil) do
      try
         FHerdId := AHerdID;
         FMaxLactation := AMaxLactation;
         LoadData;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmLactationConsistencyChecker.FormCreate(Sender: TObject);
begin
   FCowsWithIncompleteLactations := TTable.Create(nil);
   with FCowsWithIncompleteLactations do
      begin
         DatabaseName := WinData.KingData.DatabaseName;
         TableName := 'CowsIncompLacts';
         FieldDefs.Clear;
         FieldDefs.Add('ID',ftInteger,0,False);
         FieldDefs.Add('AnimalNo',ftString,10,False);
         FieldDefs.Add('SortAnimalNo',ftString,10,False);
         FieldDefs.Add('NatIDNum',ftString,20,False);
         FieldDefs.Add('SortNatID',ftString,20,False);
         FieldDefs.Add('DateOfBirth',ftDate,0,False);
         FieldDefs.Add('Sex',ftString,10,False);
         FieldDefs.Add('LactNo',ftInteger,0,False);
         FieldDefs.Add('NoOfCalvings',ftInteger,0,False);
         CreateTable;
      end;
end;

procedure TfmLactationConsistencyChecker.FormDestroy(Sender: TObject);
begin
   QueryCowsIncompLacts.Active := False;
   SafeFreeAndNil(FCowsWithIncompleteLactations);
   SafeFreeAndNil(FQueryCowsInHerd);
end;

procedure TfmLactationConsistencyChecker.LoadData;
var
   LactCount : Integer;
begin
   FQueryCowsInHerd := TQuery.Create(nil);

   FCowsWithIncompleteLactations.Close;
   FCowsWithIncompleteLactations.EmptyTable;
   FCowsWithIncompleteLactations.Open;

   FQueryCowsInHerd := TQuery.Create(nil);
   with FQueryCowsInHerd do
      begin
         DatabaseName := AliasName;
         SQL.Add('SELECT Id, NatIdNum, SortNatId, AnimalNo, SortAnimalNo, DateOfBirth, LactNo, Sex');
         SQL.Add('FROM Animals');
         SQL.Add('WHERE (Sex="Female")');
         SQL.Add('AND ((LactNo>0) AND (LactNo<=:LactNo))');
         SQL.Add('AND (InHerd=True)');
         SQL.Add('AND (AnimalDeleted=False)');
         SQL.Add('AND (HerdId=:HerdID)');
         Params[0].AsInteger := FMaxLactation;
         Params[1].AsInteger := FHerdId;
         Open;
         First;
         while ( not(Eof) ) do
            begin
               LactCount := QueryLactationCount(FieldByName('ID').AsInteger);

               if (LactCount <> FQueryCowsInHerd.FieldByName('LactNo').AsInteger) then
                  begin
                     FCowsWithIncompleteLactations.Append;
                     FCowsWithIncompleteLactations.FieldByName('ID').AsInteger := FQueryCowsInHerd.FieldByName('ID').AsInteger;
                     FCowsWithIncompleteLactations.FieldByName('AnimalNo').AsString := FQueryCowsInHerd.FieldByName('AnimalNo').AsString;
                     FCowsWithIncompleteLactations.FieldByName('SortAnimalNo').AsString := FQueryCowsInHerd.FieldByName('SortAnimalNo').AsString;
                     FCowsWithIncompleteLactations.FieldByName('NatIDNum').AsString := FQueryCowsInHerd.FieldByName('NatIDNum').AsString;
                     FCowsWithIncompleteLactations.FieldByName('SortNatId').AsString := FQueryCowsInHerd.FieldByName('SortNatId').AsString;
                     FCowsWithIncompleteLactations.FieldByName('DateOfBirth').AsDateTime := FQueryCowsInHerd.FieldByName('DateOfBirth').AsDateTime;
                     FCowsWithIncompleteLactations.FieldByName('Sex').AsString := FQueryCowsInHerd.FieldByName('Sex').AsString;
                     FCowsWithIncompleteLactations.FieldByName('LactNo').AsInteger := FQueryCowsInHerd.FieldByName('LactNo').AsInteger;
                     FCowsWithIncompleteLactations.FieldByName('NoOfCalvings').AsInteger := LactCount;
                     FCowsWithIncompleteLactations.Post;
                  end;
               Next;
            end;
      end;

   FCowsWithIncompleteLactations.Close;
   FCowsWithIncompleteLactations.Open;

   try
      QueryCowsIncompLacts.Active := False;
      QueryCowsIncompLacts.Active := True;
      lAnimalCount.Caption := Format('Records found: %d', [QueryCowsIncompLacts.RecordCount]);
   except
      MessageDlg('Data table not found.', mtError, [mbOK], 0);
   end;
end;

function TfmLactationConsistencyChecker.QueryLactationCount(
  AAnimalId: Integer): Integer;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT COUNT(ID) FROM EVENTS WHERE (AnimalId=:AnimalId) AND (EventType=:EventType)');
         Params[0].AsInteger := AAnimalId;
         Params[1].AsInteger := cCalvingEvent;
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

end.
