{
   28/09/12 [V5.1 R0.0] /MK Additional Feature - Allow animals to be deselected and not saved.

   05/10/12 [V5.1 R0.2] /MK Change - Change to new WinData.UpdateTempMovementEvents.

   15/11/12 [V5.1 R1.1] /MK Change - New way to find Movements by Object of GroupID. 

   09/07/18 [V5.8 R0.7] /MK Bug Fix - LoadMovements - Set FMovedOutDate to date selected as check on date is based on FMovedOutDate.
}

unit uTempMovementsIn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, dxBar, dxBarExtItems, ActnList, cxControls, dxStatusBar,
  DairyData, GenTypesConst, db, dbTables, cxContainer, cxEdit, cxLabel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, ExtCtrls, cxGroupBox, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, cxButtons,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, KRoutines;

type
   TMovementInfo = class
      MovementDate : TDateTime;
      MovedToId : Integer;
   end;

  TfmTempMovementsIn = class(TfmBaseForm)
    gbMovedOutDate: TcxGroupBox;
    gbMovedInDate: TcxGroupBox;
    lMovementDate: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    TempMoveGrid: TcxGrid;
    TempMoveGridDBTableView: TcxGridDBTableView;
    TempMoveGridDBTableViewAnimalNo: TcxGridDBColumn;
    TempMoveGridDBTableViewNatIDNum: TcxGridDBColumn;
    TempMoveGridDBTableViewMovementDate: TcxGridDBColumn;
    empMoveGridDBTableViewMovedTo: TcxGridDBColumn;
    TempMoveGridLevel: TcxGridLevel;
    lMovedIn: TcxLabel;
    deMovedInDate: TcxDateEdit;
    btnSave: TcxButton;
    actSaveEvents: TAction;
    cmboMovedOff: TcxComboBox;
    TempMoveGridDBTableViewSelected: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actSaveEventsExecute(Sender: TObject);
    procedure deMovedInDatePropertiesChange(Sender: TObject);
    procedure cmboMovedOffPropertiesChange(Sender: TObject);
    procedure TempMoveGridDBTableViewEditing(
      Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
      var AAllow: Boolean);
  private
    FEventsTable : TTable;
    FEventSource : TDataSource;
    FMovedToID : Integer;
    FMovedOutDate : TDateTime;
    procedure GetEventDates;
    procedure LoadMovements();
    procedure RefreshScreen;
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowForm;
  end;

var
  fmTempMovementsIn: TfmTempMovementsIn;

implementation

{$R *.DFM}

{ TfmTempMovementsIn }

class procedure TfmTempMovementsIn.ShowForm;
begin
   with TfmTempMovementsIn.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmTempMovementsIn.FormCreate(Sender: TObject);
begin
   inherited;
   FEventsTable := TTable.Create(nil);
   with FEventsTable do
      begin
         DatabaseName := AliasName;
         TableName := 'tmpMovedAnimals';
         FieldDefs.Add('ID',ftAutoInc);
         FieldDefs.Add('Selected',ftBoolean);
         FieldDefs.Add('AnimalNo',ftString,10);
         FieldDefs.Add('SortAnimalNo',ftString,20);
         FieldDefs.Add('NatIDNum',ftString,20);
         FieldDefs.Add('SortNatID',ftString,20);
         FieldDefs.Add('EventID',ftInteger);
         FieldDefs.Add('EventDate',ftDate);
         FieldDefs.Add('MovedTo',ftString,40);
         CreateTable;
      end;

   FEventSource := TDataSource.Create(nil);
   FEventSource.DataSet := FEventsTable;

   RefreshScreen;
end;

procedure TfmTempMovementsIn.RefreshScreen;
begin
   lMovedIn.Enabled := False;
   deMovedInDate.Enabled := False;
   deMovedInDate.Clear;
   btnSave.Enabled := False;

   GetEventDates;

   cmboMovedOff.ItemIndex := 0;

   TempMoveGridDBTableView.DataController.DataSource := nil;
end;

procedure TfmTempMovementsIn.GetEventDates;
var
   MovementInfo : TMovementInfo;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT DISTINCT(M.MovedTo),');
         SQL.Add('       E.EventDate,');
         SQL.Add('       MT.Name, MT.Id MovedToId');
         SQL.Add('FROM Movements M');
         SQL.Add('LEFT JOIN Events E On (E.ID = M.EventID)');
         SQL.Add('LEFT JOIN MovedTo MT On (MT.ID = M.MovedTo)');
         SQL.Add('WHERE (StillOffFarm = True)');
         SQL.Add('ORDER BY E.EventDate ASC');
         Open;

         First;
         cmboMovedOff.Properties.Items.Clear;
         cmboMovedOff.Properties.Items.Add('<Select Date>');
         while not(Eof) do
            begin
               MovementInfo := TMovementInfo.Create();
               MovementInfo.MovementDate := FieldByName('EventDate').AsDateTime;
               FMovedOutDate := MovementInfo.MovementDate;
               MovementInfo.MovedToId := FieldByName('MovedToId').AsInteger;

               cmboMovedOff.Properties.Items.AddObject(
                       DateToStr(FieldByName('EventDate').AsDateTime)+' '+
                          '('+FieldByName('Name').AsString+')',
                          pointer(MovementInfo));
               Next;
            end;
      finally
         Free;
      end;
end;

procedure TfmTempMovementsIn.cmboMovedOffPropertiesChange(Sender: TObject);
begin
   inherited;
   if cmboMovedOff.ItemIndex > 0 then
      begin
         TempMoveGridDBTableView.DataController.DataSource := nil;
         LoadMovements();
         FEventsTable.Close;
         FEventsTable.Open;
         TempMoveGridDBTableView.DataController.DataSource := FEventSource;
         lMovedIn.Enabled := True;
         deMovedInDate.Enabled := True;
         btnSave.Enabled := True;
      end;
end;

procedure TfmTempMovementsIn.deMovedInDatePropertiesChange(
  Sender: TObject);
begin
   inherited;
   if ( deMovedInDate.Date > Date ) then
      begin
         MessageDlg('Date Moved In must be on or before todays date.',mtError,[mbOK],0);
         deMovedInDate.Clear;
      end
   else if ( (deMovedInDate.Date > 0) and (deMovedInDate.Date < FMovedOutDate) ) then
      begin
         MessageDlg('Date Moved In must be after Date Moved Out.',mtError,[mbOK],0);
         deMovedInDate.Clear;
      end
   else if ( deMovedInDate.Date > 0 ) then
      btnSave.Enabled := True;
end;

procedure TfmTempMovementsIn.actSaveEventsExecute(Sender: TObject);
var
  iSavedCount : Integer;
begin
   inherited;
   iSavedCount := 0;
   if ( deMovedInDate.Date > 0 ) and ( deMovedInDate.Date > FMovedOutDate ) then
      begin
         FEventsTable.First;
         while ( not(FEventsTable.Eof) ) do
            begin
               if ( FEventsTable.FieldByName('Selected').AsBoolean ) then
                  begin
                     //   05/10/12 [V5.1 R0.2] /MK Change - Change to new WinData.UpdateTempMovementEvents.
                     WinData.UpdateTempMovementEvents(FEventsTable.FieldByName('EventID').AsInteger,
                                                      deMovedInDate.Date);
                     Inc(iSavedCount);
                  end;
               FEventsTable.Next;
            end;
         if ( iSavedCount > 0 ) then
            MessageDlg(Format('%d Temp Movement Events updated sucessfully.',[iSavedCount]),mtInformation,[mbOK],0);
         RefreshScreen;
      end
   else if ( (deMovedInDate.Date > 0) and ( deMovedInDate.Date < FMovedOutDate) ) then
      begin
         MessageDlg('Moved In Date must be after Date Moved Out.',mtError,[mbOK],0);
         deMovedInDate.Date := 0;
      end
   else if ( deMovedInDate.Date <= 0 ) then
      MessageDlg('Please select a Moved In Date.',mtInformation,[mbOk],0);
end;

procedure TfmTempMovementsIn.TempMoveGridDBTableViewEditing(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  var AAllow: Boolean);
begin
   inherited;
   if AItem.Index = TempMoveGridDBTableViewSelected.Index then
      AAllow := True
   else
      AAllow := False;
end;

procedure TfmTempMovementsIn.FormDestroy(Sender: TObject);
var i : Integer;
begin
   inherited;

   for i := 1 to cmboMovedOff.Properties.Items.Count -1 do
      begin
         TMovementInfo(cmboMovedOff.Properties.Items.Objects[i]).Free;
      end;

   FEventsTable.Close;
   FEventsTable.DeleteTable;
   FreeAndNil(FEventsTable);
end;

procedure TfmTempMovementsIn.LoadMovements();
var
   MovementInfo : TMovementInfo;
begin
   if (cmboMovedOff.ItemIndex <= -1) then
       Exit;

   try
      MovementInfo := TMovementInfo(cmboMovedOff.Properties.Items.Objects[cmboMovedOff.ItemIndex]);
      if MovementInfo = nil then
         Exit;
   except
      Exit;
   end;

   FEventsTable.Close;
   FEventsTable.EmptyTable;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('INSERT INTO '+FEventsTable.TableName+' (AnimalNo, SortAnimalNo, NatIDNum, SortNatID,');
         SQL.Add('                                        EventID, EventDate, MovedTo)');
         SQL.Add('SELECT A.AnimalNo, A.SortAnimalNo, A.NatIDNum, A.SortNatID,');
         SQL.Add('       E.ID, E.EventDate,');
         SQL.Add('       MT.Name');
         SQL.Add('FROM Animals A');
         SQL.Add('LEFT JOIN Movements M ON (M.AID = A.ID)');
         SQL.Add('LEFT JOIN Events E ON (E.ID = M.EventID)');
         SQL.Add('LEFT JOIN MovedTo MT ON (MT.ID = M.MovedTo)');
         SQL.Add('WHERE (M.DateMovedBack IS NULL)');
         SQL.Add('AND   (E.EventDate = :EventDate)');
         SQL.Add('AND   (M.MovedTo = :ACustID)');
         Params[0].AsDateTime := MovementInfo.MovementDate;
         Params[1].AsInteger := MovementInfo.MovedToId;
         ExecSQL;

         SQL.Clear;
         SQL.Add('UPDATE '+FEventsTable.TableName+' ');
         SQL.Add('SET Selected = True');
         ExecSQL;

         //   09/07/18 [V5.8 R0.7] /MK Bug Fix - Set FMovedOutDate to date selected as check on date is based on FMovedOutDate.
         FMovedOutDate := MovementInfo.MovementDate;
      finally
         Free;
      end;

end;

end.
