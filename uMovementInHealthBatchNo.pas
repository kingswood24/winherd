unit uMovementInHealthBatchNo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, dxBar, dxBarExtItems, ActnList, cxControls, dxStatusBar,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxContainer, cxEdit, cxLabel,
  db, dbTables, GenTypesConst;

type
  TfmMovementInHealthBatchNo = class(TfmBaseForm)
    dxBarLargeButton1: TdxBarLargeButton;
    actSave: TAction;
    lDrugName: TcxLabel;
    lBatchNo: TcxLabel;
    cmboBatchNo: TcxComboBox;
    procedure actSaveExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FDrugID : Integer;
    procedure GetBatchNo;
  public
    { Public declarations }
    class procedure SaveBatchNo ( ADrugID : Integer );
  end;

var
  fmMovementInHealthBatchNo: TfmMovementInHealthBatchNo;

implementation

{$R *.DFM}

{ TfmMovementInHealthBatchNo }

class procedure TfmMovementInHealthBatchNo.SaveBatchNo (ADrugID : Integer);
begin
   with TfmMovementInHealthBatchNo.Create(nil) do
      try
         FDrugID := ADrugID;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmMovementInHealthBatchNo.FormActivate(Sender: TObject);
var
   qDrugQuery : TQuery;
begin
   inherited;
   if ( FDrugID = 0 ) then Exit;

   lDrugName.Caption := '';
   qDrugQuery := TQuery.Create(nil);
   with qDrugQuery do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT Name');
         SQL.Add('FROM Medicine');
         SQL.Add('WHERE ID = :ADrugID');
         Params[0].AsInteger := FDrugID;
         try
            Open;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;

         if ( Fields[0].AsString <> '' ) then
            begin
               lDrugName.Caption := Fields[0].AsString;
               GetBatchNo;
            end;

      finally
         Free;
      end;
end;

procedure TfmMovementInHealthBatchNo.GetBatchNo;
var
   qDrugBatchNo,
   qManualBatchNo : TQuery;
begin
   with cmboBatchNo.Properties do
      begin
         Items.Clear;
         // Now go through BatchNo's in Medicine Purchases that are active and add them to the list.
         qDrugBatchNo := TQuery.Create(nil);
         qDrugBatchNo.DatabaseName := AliasName;
         qDrugBatchNo.SQL.Clear;
         qDrugBatchNo.SQL.Add('SELECT MP.ID, MP.DrugID, MP.BatchNo, MP.ExpiryDate, M.Name');
         qDrugBatchNo.SQL.Add('FROM MediPur MP');
         qDrugBatchNo.SQL.Add('LEFT JOIN Medicine M ON (M.ID=MP.DrugID)');
         qDrugBatchNo.SQL.Add('WHERE MP.InUse=TRUE');
         qDrugBatchNo.SQL.Add('AND TRIM(MP.BatchNo) <> ""');
         qDrugBatchNo.SQL.Add('AND MP.DrugID = '+IntToStr(FDrugID)+'');
         qDrugBatchNo.SQL.Add('ORDER BY MP.ID DESC');

         try
            qDrugBatchNo.Open;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;

         while not qDrugBatchNo.Eof do
            begin
               Items.AddObject(qDrugBatchNo.FieldByName('BatchNo').AsString,
                               Pointer(qDrugBatchNo.FieldByName('ID').AsInteger));
               qDrugBatchNo.Next;
            end;

         qDrugBatchNo.Close;
         FreeAndNil(qDrugBatchNo);

         // Now query the Health database for BatchNo's that were entered manually and add them to the list.
         qManualBatchNo := TQuery.Create(nil);
         qManualBatchNo.DatabaseName := AliasName;
         with qManualBatchNo do
            begin
               SQL.Clear;
               SQL.Add('SELECT Distinct(H.DrugBatchNo)');
               SQL.Add('FROM Health H');
               SQL.Add('WHERE H.DrugBatchNo NOT IN (SELECT MP.BatchNo FROM MediPur MP)');
               SQL.Add('AND H.DrugBatchNo IS NOT Null');
               SQL.Add('AND H.DrugUsed = :DrugID');
               Params[0].AsInteger := FDrugID;
               Open;
               try
                  First;
                  while not Eof do
                     begin
                        Items.Add(Fields[0].AsString);
                        Next;
                     end;
               finally
                  Close;
               end;
            end;

         qManualBatchNo.Close;
         FreeAndNil(qManualBatchNo);

         // Add blank line to the list for manual entry.
         Items.Add('');

      end;
end;

procedure TfmMovementInHealthBatchNo.actSaveExecute(Sender: TObject);
var
   qUpdateHealthTable : TQuery;
begin
   inherited;
   qUpdateHealthTable := TQuery.Create(nil);
   with qUpdateHealthTable do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('UPDATE tMartHealth');
         SQL.Add('SET DrugPurchID = :ADrugPurchID, ');
         SQL.Add('DrugBatchNo = :ADrugBatchNo');
         SQL.Add('WHERE DrugID = :ADrugID');
         Params[0].AsInteger := Integer(cmboBatchNo.ItemObject);
         Params[1].AsString := cmboBatchNo.Text;
         Params[2].AsInteger := FDrugID;
         try
            ExecSQL;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;
   Close;
end;

end.
