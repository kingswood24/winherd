{
   14/11/14 [V5.3 R8.9] /MK Change - FormCreate - Only show drugs that were added and purchased.

   02/11/15 [V5.4 R9.9] /MK Additional Feature - Added a delete option - requested by John Merrick.

   11/01/18 [V5.7 R7.4] /MK Additional Feature - Added a print button on the screen to reprint drugs not treated in VetLink - Pat Fitzgerald.
}

unit uVetLinkDrugSelect;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, dxBar,
  dxBarExtItems, ActnList, dxStatusBar, cxContainer, cxEdit, cxLabel,
  ExtCtrls, db, dbTables, uAnimalRemedyData, GenTypesConst, KDBRoutines, KRoutines,
  dxPSCore, dxPScxCommon, dxPScxGridLnk;

type
  TfmVetLinkSelect = class(TfmBaseForm)
    pInfo: TPanel;
    lInfo: TcxLabel;
    VetLinkGrid: TcxGrid;
    VetLinkDBTableView: TcxGridDBTableView;
    VetLinkDBTableViewSelected: TcxGridDBColumn;
    VetLinkDBTableViewDrugName: TcxGridDBColumn;
    VetLinkDBTableViewDrugQuantity: TcxGridDBColumn;
    VetLinkDBTableViewWithdrawal: TcxGridDBColumn;
    VetLinkDBTableViewTagDesc: TcxGridDBColumn;
    VetLinkDBTableViewPurchDoseRate: TcxGridDBColumn;
    VetLinkDBTableViewNoDays: TcxGridDBColumn;
    VetLinkDBTableViewNoTimes: TcxGridDBColumn;
    VetLinkDBTableViewBatchNo: TcxGridDBColumn;
    VetLinkDBTableViewExpiryDate: TcxGridDBColumn;
    VetLinkLevel: TcxGridLevel;
    VetLinkDBTableViewDate: TcxGridDBColumn;
    blbDelete: TdxBarLargeButton;
    actDelete: TAction;
    blbPrintGrid: TdxBarLargeButton;
    actPrintGrid: TAction;
    cpPrintGrid: TdxComponentPrinter;
    PrintGridLink: TdxGridReportLink;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actPrintGridExecute(Sender: TObject);
  private
    FVetLinkTable : TTable;
    FVetLinkDS : TDataSource;
    { Private declarations }
  public
    class procedure ShowTheForm;
    { Public declarations }
  end;

var
  fmVetLinkSelect: TfmVetLinkSelect;

implementation

{$R *.DFM}

{ TfmVetLinkSelect }

class procedure TfmVetLinkSelect.ShowTheForm;
begin
   if ( VetLinkDataExists ) then
      with TfmVetLinkSelect.Create(nil) do
         try
            ShowModal;
         finally
            Free;
         end;
end;

procedure TfmVetLinkSelect.FormCreate(Sender: TObject);
begin
   inherited;
   FVetLinkTable := TTable.Create(nil);
   with FVetLinkTable do
      begin
         DatabaseName := AliasName;
         TableName := 'DrugsRegImportDetail';
         Filter := '';
         Filtered := False;
         //   14/11/14 [V5.3 R8.9] /MK Change - Only show drugs that were added and purchased.
         Filter := 'DrugID > 0 AND DrugPurchID > 0';
         Filtered := True;
         Open;
      end;

   FVetLinkDS := TDataSource.Create(nil);
   FVetLinkDS.DataSet := FVetLinkTable;

   with GetQuery do
      try
         SQL.Add('UPDATE '+FVetLinkTable.TableName+'');
         SQL.Add('SET Selected = FALSE');
         try
            ExecSQL;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
         Free;
      end;

   VetLinkDBTableView.DataController.DataSource := nil;
   VetLinkDBTableView.DataController.DataSource := FVetLinkDS;
end;

procedure TfmVetLinkSelect.FormActivate(Sender: TObject);
begin
   inherited;
   if VetLinkDBTableView.DataController.RecordCount > 0 then
      VetLinkDBTableView.DataController.FocusedRowIndex := 0;
end;

procedure TfmVetLinkSelect.actDeleteExecute(Sender: TObject);
var
   iIDsToDelete : TIntegerArray;
begin
   inherited;
   if ( MessageDlg('Are you sure you want to delete the selected items?',mtConfirmation,[mbYes,mbNo],0) = mrNo ) then Exit;

   FVetLinkTable.Filter := '';
   FVetLinkTable.Filtered := False;
   SetLength(iIDsToDelete,0);
   FVetLinkTable.First;
   while ( not(FVetLinkTable.Eof) ) do
      begin
         if FVetLinkTable.FieldByName('Selected').AsBoolean then
            begin
               SetLength(iIDsToDelete,Length(iIDsToDelete)+1);
               iIDsToDelete[Length(iIDsToDelete)-1] := FVetLinkTable.FieldByName('ID').AsInteger;
               FVetLinkTable.Delete;
            end
         else
            FVetLinkTable.Next;
      end;

    with TQuery.Create(nil) do
       try
          DatabaseName := AliasName;
          SQL.Clear;
          SQL.Add('DELETE FROM '+FVetLinkTable.TableName+'');
          SQL.Add('WHERE ID IN '+IntArrayToSQLInString(iIDsToDelete)+'');
          try
             ExecSQL;
          except
             on e : Exception do
                ShowMessage(e.Message);
          end;
       finally
          Free;
       end;

   FVetLinkTable.Close;
   FVetLinkTable.Filter := 'DrugID > 0 AND DrugPurchID > 0';
   FVetLinkTable.Filtered := True;
   FVetLinkTable.Open;
   FVetLinkTable.First;
end;

procedure TfmVetLinkSelect.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   inherited;
   if ( FVetLinkTable <> nil ) then
      begin
         if ( FVetLinkTable.Active ) then
            begin
               if ( FVetLinkTable.State = dsEdit ) then
                  FVetLinkTable.Post;
               FVetLinkTable.Active := False;
            end;
         FreeAndNil(FVetLinkTable);
      end;
   if ( FVetLinkDS <> nil ) then
      FreeAndNil(FVetLinkDS);
end;

procedure TfmVetLinkSelect.actPrintGridExecute(Sender: TObject);
begin
   inherited;
   PrintGridLink.Preview;
end;

end.
