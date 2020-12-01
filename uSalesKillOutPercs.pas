{
   24/05/11 [V4.1 R1.5] /MK Change - Allow User To Enter in a Two Decimal Place KillOut Percentage.

   30/05/11 [V4.1 R1.8] /MK Additional Feature - Made Small Changes To Screen Position, WinData.KillOutPercs On Post and Close.

   31/05/11 [V4.1 R1.8] /MK Additional Feature - If Tab Key Pressed Then Do Down Arrow Key.

   21/06/11 [V4.1 R2.0] /MK Bug Fix - Check Database State Before Post.
}

unit uSalesKillOutPercs;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  dxBarExtItems, ActnList, dxBar, DB, DBTables, cxDBEdit,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxStyles;

type
  TfmSalesKillOutPercs = class(TForm)
    dxBarManager: TdxBarManager;
    ActionList1: TActionList;
    actExit: TAction;
    actSave: TAction;
    actCancel: TAction;
    dxblbExit: TdxBarLargeButton;
    KillOutPersGridLevel1: TcxGridLevel;
    KillOutPersGrid: TcxGrid;
    KillOutPercsGridTableView: TcxGridDBTableView;
    KillOutPercsGridTableViewID: TcxGridDBColumn;
    KillOutPercsGridTableViewCategory: TcxGridDBColumn;
    KillOutPercsGridTableViewPercentage: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    dxBarLargeButton1: TdxBarLargeButton;
    procedure actExitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure KillOutPercsGridTableViewEditKeyDown(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
  private
    qKillOutPercs : TQuery;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSalesKillOutPercs: TfmSalesKillOutPercs;

implementation

uses
   DairyData, GenTypesConst, KRoutines;

{$R *.DFM}

procedure TfmSalesKillOutPercs.actExitExecute(Sender: TObject);
begin
   if WinData.KillOutPercs.State in [dsEdit, dsInsert] then
      WinData.KillOutPercs.Post;
   WinData.KillOutPercs.Close;
   Close;
end;

procedure TfmSalesKillOutPercs.FormCreate(Sender: TObject);
begin
   WinData.KillOutPercs.Close;
   WinData.KillOutPercs.Open;
end;

procedure TfmSalesKillOutPercs.actSaveExecute(Sender: TObject);
begin
   //   21/06/11 [V4.1 R2.0] /MK Bug Fix - Check Database State Before Post. 
   if WinData.KillOutPercs.State In [dsEdit, dsInsert] then
      WinData.KillOutPercs.Post;
end;

procedure TfmSalesKillOutPercs.KillOutPercsGridTableViewEditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
   if Key = VK_TAB then
      Key := VK_DOWN;
end;

end.

