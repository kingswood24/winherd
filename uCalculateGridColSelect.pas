{
   10/03/21 [V5.9 R9.5] /MK Additional Feature - Added a Select/DeSelect All button.

   31/03/21 [V5.9 R9.7] /MK Change - Changed Caption to "Change Grid Columns" - GL request.   
}

unit uCalculateGridColSelect;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, uImageStore, StdCtrls, cxButtons, ActnList, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridLevel, cxGrid, GenTypesConst, KRoutines, cxGridDBTableView;

type
  TfmCalculateGridColSelect = class(TForm)
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
    actDeSelectAll: TAction;
    actSelectAll: TAction;
    procedure actOKExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actDeSelectAllExecute(Sender: TObject);
    procedure actSelectAllExecute(Sender: TObject);
  private
    { Private declarations }
    FGridView : TcxGridTableView;
  public
    { Public declarations }
    class procedure ShowTheForm ( var AGridColNames : PStringArray );
  end;

var
  fmCalculateGridColSelect: TfmCalculateGridColSelect;

implementation

{$R *.DFM}

class procedure TfmCalculateGridColSelect.ShowTheForm ( var AGridColNames : PStringArray );
var
   i, Index : Integer;
begin
   with TfmCalculateGridColSelect.Create(nil) do
      try
         GridColsGridTableView.DataController.RecordCount := 0;
         Index := 0;
         for i := 0 to Length(AGridColNames)-1 do
            begin
               GridColsGridTableView.DataController.RecordCount := GridColsGridTableView.DataController.RecordCount + 1;
               GridColsGridTableView.DataController.Values[Index, 0] := True;
               GridColsGridTableView.DataController.Values[Index, 1] := AGridColNames[i];
               Inc(Index);
            end;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmCalculateGridColSelect.actOKExecute(Sender: TObject);
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

procedure TfmCalculateGridColSelect.actCancelExecute(Sender: TObject);
begin
   ModalResult := mrCancel;
   Close;
end;

procedure TfmCalculateGridColSelect.actDeSelectAllExecute(Sender: TObject);
var
   i, Index : Integer;
begin
   Index := 0;
   for i := 0 to GridColsGridTableView.DataController.RecordCount-1 do
      begin
         GridColsGridTableView.DataController.Values[Index, 0] := False;
         Inc(Index);
      end;
end;

procedure TfmCalculateGridColSelect.actSelectAllExecute(Sender: TObject);
var
   i, Index : Integer;
begin
   Index := 0;
   for i := 0 to GridColsGridTableView.DataController.RecordCount-1 do
      begin
         GridColsGridTableView.DataController.Values[Index, 0] := True;
         Inc(Index);
      end;
end;

end.
