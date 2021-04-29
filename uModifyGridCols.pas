{
   10/03/21 [V5.9 R9.5] /MK Additional Feature - Added a Select/DeSelect All button.

   31/03/21 [V5.9 R9.7] /MK Change - Changed Caption to "Change Grid Columns" - GL request.   
}

unit uModifyGridCols;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, uImageStore, StdCtrls, cxButtons, ActnList, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridLevel, cxGrid, GenTypesConst, KRoutines;

type
  TfmModifyGridCols = class(TForm)
    pBottomBar: TPanel;
    btnCancel: TcxButton;
    btnOK: TcxButton;
    ActionList: TActionList;
    actOK: TAction;
    actCancel: TAction;
    GridColsGridLevel: TcxGridLevel;
    GridColsGrid: TcxGrid;
    GridColsGridTableView: TcxGridTableView;
    GridColsGridTableViewInclude: TcxGridColumn;
    GridColsGridTableViewColumnCaption: TcxGridColumn;
    GridColsGridTableViewColumName: TcxGridColumn;
    btnSelectDeSelectAll: TcxButton;
    actDeSelectAll: TAction;
    actSelectAll: TAction;
    procedure actOKExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeSelectAllExecute(Sender: TObject);
    procedure actSelectAllExecute(Sender: TObject);
  private
    { Private declarations }
    FGridView : TcxGridTableView;
    FVisibleColCount : Integer;
  public
    { Public declarations }
    class procedure ShowTheForm ( var AGridView : TcxGridTableView );
  end;

var
  fmModifyGridCols: TfmModifyGridCols;

implementation

{$R *.DFM}

class procedure TfmModifyGridCols.ShowTheForm ( var AGridView : TcxGridTableView);
var
   i, Index : Integer;
begin
   with TfmModifyGridCols.Create(nil) do
      try
         FVisibleColCount := 0;
         GridColsGridTableView.DataController.RecordCount := 0;
         Index := 0;
         for i := 0 to AGridView.ColumnCount-1 do
            if ( not(AGridView.Columns[i].Hidden) ) then
               begin
                  GridColsGridTableView.DataController.RecordCount := GridColsGridTableView.DataController.RecordCount + 1;
                  GridColsGridTableView.DataController.Values[Index, 0] := AGridView.Columns[i].Visible;
                  if ( AGridView.Columns[i].Visible ) then
                     Inc(FVisibleColCount);
                  GridColsGridTableView.DataController.Values[Index, 1] := AGridView.Columns[i].Caption;
                  GridColsGridTableView.DataController.Values[Index, 2] := AGridView.Columns[i].Name;
                  Inc(Index);
               end;
         FGridView := AGridView;
         btnSelectDeSelectAll.Glyph := nil;
         btnSelectDeSelectAll.Action := actDeSelectAll;
         if ( FVisibleColCount = 0 ) then
            begin
               btnSelectDeSelectAll.Glyph := nil;
               btnSelectDeSelectAll.Action := actSelectAll;
            end;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmModifyGridCols.actOKExecute(Sender: TObject);
var
   i, j : Integer;
begin
   for i := 0 to GridColsGridTableView.DataController.RecordCount-1 do
      for j := 0 to FGridView.ColumnCount-1 do
         if ( FGridView.Columns[j].Name = GridColsGridTableView.DataController.Values[i, 2] ) then
            FGridView.Columns[j].Visible := GridColsGridTableView.DataController.Values[i, 0];
   ModalResult := mrOK;
   Close;
end;

procedure TfmModifyGridCols.actCancelExecute(Sender: TObject);
begin
   ModalResult := mrCancel;
   Close;
end;

procedure TfmModifyGridCols.actDeSelectAllExecute(Sender: TObject);
var
   i, Index : Integer;
begin
   Index := 0;
   for i := 0 to GridColsGridTableView.DataController.RecordCount-1 do
      begin
         GridColsGridTableView.DataController.Values[Index, 0] := False;
         Inc(Index);
      end;
   btnSelectDeSelectAll.Glyph := nil;
   btnSelectDeSelectAll.Action := actSelectAll;
end;

procedure TfmModifyGridCols.actSelectAllExecute(Sender: TObject);
var
   i, Index : Integer;
begin
   Index := 0;
   for i := 0 to GridColsGridTableView.DataController.RecordCount-1 do
      begin
         GridColsGridTableView.DataController.Values[Index, 0] := True;
         Inc(Index);
      end;
   btnSelectDeSelectAll.Glyph := nil;
   btnSelectDeSelectAll.Action := actDeSelectAll;
end;

end.
