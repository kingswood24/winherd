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
  cxGridLevel, cxGrid, GenTypesConst, KRoutines, cxGridDBTableView,
  uHerdLookup;

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
    procedure actOKExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
  private
    { Private declarations }
    FGridView : TcxGridTableView;
    FColsToCalc : PStringArray;
    FDefaultColsToCalc : PStringArray;
  public
    { Public declarations }
    class procedure ShowTheForm ( var AGridColNames : PStringArray; AHerdType : THerdType );
  end;

var
  fmCalculateGridColSelect: TfmCalculateGridColSelect;

implementation

{$R *.DFM}

class procedure TfmCalculateGridColSelect.ShowTheForm ( var AGridColNames : PStringArray; AHerdType : THerdType );
var
   i, j, Index : Integer;
begin
   with TfmCalculateGridColSelect.Create(nil) do
      try
         if ( AHerdType = htBeef ) then
            begin
               SetLength(FDefaultColsToCalc,2);
               if ( InArray('Lifetime Gain/Day',cDefaultMainGridCalcColumns) ) then
                  FDefaultColsToCalc[0] := 'Lifetime Gain/Day';
               if ( InArray('Gross Margin',cDefaultMainGridCalcColumns) ) then
                  FDefaultColsToCalc[1] := 'Gross Margin';
            end
         else if ( AHerdType = htSuckler ) then
            begin
               SetLength(FDefaultColsToCalc,1);
               if ( InArray('Lifetime Gain/Day',cDefaultMainGridCalcColumns) ) then
                  FDefaultColsToCalc[0] := 'Lifetime Gain/Day';
            end;

         SetLength(FColsToCalc,0);
         GridColsGridTableView.DataController.RecordCount := 0;
         Index := 0;
         for i := 0 to Length(FDefaultColsToCalc)-1 do
            begin
               GridColsGridTableView.DataController.RecordCount := GridColsGridTableView.DataController.RecordCount + 1;
               GridColsGridTableView.DataController.Values[Index, 0] := ( Length(AGridColNames) > 0 ) and ( InArray(FDefaultColsToCalc[i],AGridColNames) );
               GridColsGridTableView.DataController.Values[Index, 1] := FDefaultColsToCalc[i];
               Inc(Index);
               SetLength(FColsToCalc,Length(FColsToCalc)+1);
               FColsToCalc[Length(FColsToCalc)-1] := FDefaultColsToCalc[i];
            end;
         ShowModal;
         AGridColNames := FColsToCalc;
      finally
         Free;
      end;
end;

procedure TfmCalculateGridColSelect.actOKExecute(Sender: TObject);
var
   i, j : Integer;
begin
   SetLength(FColsToCalc,0);
   for i := 0 to GridColsGridTableView.DataController.RecordCount-1 do
      if ( GridColsGridTableView.DataController.Values[i, 0] ) then
         begin
            SetLength(FColsToCalc,Length(FColsToCalc)+1);
            FColsToCalc[Length(FColsToCalc)-1] := GridColsGridTableView.DataController.Values[i, 1];
         end;
   ModalResult := mrOK;
   Close;
end;

procedure TfmCalculateGridColSelect.actCancelExecute(Sender: TObject);
begin
   ModalResult := mrCancel;
   Close;
end;

end.
