{
  06/10/17 [V5.7 R3.7] /MK Bug Fix - UpdateAnimals - Changed price and weight to variables.
                                                   - If both price and weight are null then don't do anything.
}

unit uAIMAnimalMovementEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, StdCtrls, cxButtons, Menus, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxContainer, cxEdit, cxLabel, dxBar,
  dxBarExtItems, ActnList, dxStatusBar, db, dbTables, DairyData,
  GenTypesConst;

type
  TMovementType = (mtPurchase, mtSale);

  TfmAIMAnimalMovementEdit = class(TfmBaseForm)
    lInfo: TcxLabel;
    AnimalGrid: TcxGrid;
    AnimalGridTableView: TcxGridTableView;
    AnimalGridTableViewAId: TcxGridColumn;
    AnimalGridTableViewNatIdNo: TcxGridColumn;
    AnimalGridTableViewDateOfBirth: TcxGridColumn;
    AnimalGridLevel1: TcxGridLevel;
    btnUpdate: TcxButton;
    AnimalGridTableViewLactNo: TcxGridColumn;
    AnimalGridTableViewEId: TcxGridColumn;
    btnCancel: TcxButton;
    AnimalGridTableViewSortNatIdNo: TcxGridColumn;
    AnimalGridTableViewBreed: TcxGridColumn;
    AnimalGridTableViewSupplier: TcxGridColumn;
    AnimalGridTableViewWeight: TcxGridColumn;
    AnimalGridTableViewPrice: TcxGridColumn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FMovementType : TMovementType;
    procedure LoadGrid(AAnimals : TIntArray);
    function UpdateAnimals() : Boolean;
    { Private declarations }
  public
    { Public declarations }
    class procedure Load(FAnimals: TIntArray; AMovementType : TMovementType);
  end;

var
  fmAIMAnimalMovementEdit: TfmAIMAnimalMovementEdit;

implementation

uses uAnimal, kRoutines;

{$R *.DFM}

{ TfmLactationNoCorrection }

class procedure TfmAIMAnimalMovementEdit.Load(FAnimals: GenTypesConst.TIntArray; AMovementType : TMovementType);
begin
   with TfmAIMAnimalMovementEdit.Create(nil) do
      try
         FMovementType := AMovementType;
         LoadGrid(FAnimals);
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmAIMAnimalMovementEdit.LoadGrid(AAnimals: TIntArray);
var
   i : Integer;
begin
   With TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Add('SELECT A.Id, A.NatIdNum, A.SortNatId, A.DateOfBirth, A.LactNo, B.Code AS BreedCode, S.Name As SupplierName');
         SQL.Add('FROM Animals A');
         SQL.Add('LEFT JOIN Breeds B ON (A.PrimaryBreed=B.Id)');
         SQL.Add('LEFT JOIN Events E ON (E.AnimalID = A.ID)');
         SQL.Add('LEFT JOIN Purchases P ON (P.EventID = E.ID)');
         SQL.Add('LEFT JOIN SuppliersBreeders S ON (S.ID = P.Supplier)');
         SQL.Add('WHERE (Id IN '+ IntArrayToSQLInString(AAnimals)+')');
         Open;

         First;
         AnimalGridTableView.DataController.RecordCount := RecordCount;

         i := 0;
         while ( not(Eof) ) do
            begin
               AnimalGridTableView.DataController.Values[i,
                         AnimalGridTableViewAId.Index] := FieldByName('Id').AsInteger;
               AnimalGridTableView.DataController.Values[i,
                         AnimalGridTableViewNatIdNo.Index] := FieldByName('NatIdNum').AsString;
               AnimalGridTableView.DataController.Values[i,
                         AnimalGridTableViewSortNatIdNo.Index] := FieldByName('SortNatId').AsString;
               AnimalGridTableView.DataController.Values[i,
                         AnimalGridTableViewDateOfBirth.Index] := FieldByName('DateOfBirth').AsDateTime;
               AnimalGridTableView.DataController.Values[i,
                         AnimalGridTableViewBreed.Index] := FieldByName('BreedCode').AsString;
               AnimalGridTableView.DataController.Values[i,
                         AnimalGridTableViewLactNo.Index] := FieldByName('LactNo').AsInteger;
               AnimalGridTableView.DataController.Values[i,
                         AnimalGridTableViewSupplier.Index] := FieldByName('SupplierName').AsString;
               Inc(i);
               Next;
            end;;
      finally
         Close;
         Free;
      end;
end;

function TfmAIMAnimalMovementEdit.UpdateAnimals() : Boolean;
var
   i, j , Id, LactNo, PurchEventID : Integer;
   Query : TQuery;
   vPrice, vWeight : Variant;

begin
   Result := False;

   if MessageDlg('Are all details correct?',mtConfirmation,[mbYes,mbNo],0) = idNo then
      Exit;

   WinData.CreateTQuery(Query);
   try
      for i := 0 to AnimalGridTableView.DataController.RecordCount-1 do
         try
            if ( Query.Active ) then
               Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('UPDATE Animals SET LactNo =:LactNo WHERE ID =:ID');

            Id := AnimalGridTableView.DataController.Values[i,AnimalGridTableViewAId.Index];
            LactNo := AnimalGridTableView.DataController.Values[i,AnimalGridTableViewLactNo.Index];

            if (LactNo<0) then
               LactNo := 0
            else if (LactNo>12) then
               LactNo := 12; // try to be realistic

            Query.Params[0].AsSmallInt := LactNo;
            Query.Params[1].AsInteger := Id;
            Query.ExecSQL;

            //   06/10/17 [V5.7 R3.7] /MK Bug Fix - Changed price and weight to variables.
            vPrice := AnimalGridTableView.DataController.Values[i,AnimalGridTableViewPrice.Index];
            vWeight := AnimalGridTableView.DataController.Values[i,AnimalGridTableViewWeight.Index];
            //   06/10/17 [V5.7 R3.7] /MK Bug Fix - If both price and weight are null then don't do anything.
            if ( vPrice = Null ) and ( vWeight = Null ) then Continue;

            if ( Query.Active ) then
               Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add('SELECT ID');
            Query.SQL.Add('FROM Events');
            Query.SQL.Add('WHERE AnimalID = '+IntToStr(Id)+'');
            Query.Open;
            if ( Query.RecordCount > 0 ) then
               PurchEventID := Query.Fields[0].AsInteger;
            if ( PurchEventID > 0 ) then
               begin
                  if ( Query.Active ) then
                     Query.Close;
                  if ( vPrice <> Null ) then
                     begin
                        Query.SQL.Clear;
                        Query.SQL.Add('UPDATE Purchases');
                        Query.SQL.Add('SET Price = '+VarToStr(vPrice)+'');
                        Query.SQL.Add('WHERE EventID = '+IntToStr(PurchEventID)+'');
                        Query.ExecSQL;
                     end;
                  if ( vWeight <> Null ) then
                     begin
                        Query.SQL.Clear;
                        Query.SQL.Add('UPDATE Purchases');
                        Query.SQL.Add('SET Weight = '+VarToStr(vWeight)+'');
                        Query.SQL.Add('WHERE EventID = '+IntToStr(PurchEventID)+'');
                        Query.ExecSQL;
                     end;
               end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;

      Result := True;
   finally
      FreeAndNil(Query);
   end;
end;

procedure TfmAIMAnimalMovementEdit.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if ( ModalResult = mrOK ) then
     CanClose := UpdateAnimals()
  else
     CanClose := MessageDlg('Are you sure you want to exit without making any changes?',mtWarning,[mbYes,mbNo],0) = mrYes;
end;

end.
