{
   15/02/12 [V5.0 R3.8] /MK Change - Changed TransferEvents To A Global Class Procedure For Other Forms To Use.
}

unit uAnimalEventTransfer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  db, dbtables, uBaseForm, dxmdaset, StdCtrls, cxButtons, cxLabel,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxContainer, cxEdit, cxGroupBox, dxBar,
  dxBarExtItems, ActnList, cxControls, dxStatusBar, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid;

type
  TfmAnimalEventTransfer = class(TfmBaseForm)
    gbTransferEvents: TcxGroupBox;
    cxButton1: TcxButton;
    cxGroupBox2: TcxGroupBox;
    cmboSoldAnimals: TcxLookupComboBox;
    cxLabel1: TcxLabel;
    mdSoldAnimals: TdxMemData;
    mdSoldAnimalsID: TIntegerField;
    mdSoldAnimalsAnimalNo: TStringField;
    mdSoldAnimalsNatIDNum: TStringField;
    mdSoldAnimalsSortNatIDNum: TStringField;
    mdSoldAnimalsSaleDate: TDateTimeField;
    mdSoldAnimalsPurchDate: TDateTimeField;
    mdSoldAnimalsLactNo: TIntegerField;
    dsSoldAnimals: TDataSource;
    mdSoldAnimalsSex: TStringField;
    mdSoldAnimalsDateOfBirth: TDateTimeField;
    mdSoldAnimalsSortAnimalNo: TStringField;
    mdInherdAnimals: TdxMemData;
    mdInherdAnimalsID: TIntegerField;
    mdInherdAnimalsNatIDNum: TStringField;
    mdInherdAnimalsSortNatID: TStringField;
    mdInherdAnimalsAnimalNo: TStringField;
    mdInherdAnimalsSortAnimalNo: TStringField;
    mdInherdAnimalsSex: TStringField;
    mdInherdAnimalsDateOfBirth: TDateTimeField;
    mdInherdAnimalsPurchDate: TDateTimeField;
    mdInherdAnimalsLactNo: TIntegerField;
    cxGroupBox3: TcxGroupBox;
    cmboInHerdAnimals: TcxLookupComboBox;
    cxLabel2: TcxLabel;
    btnViewEvents: TcxButton;
    btnViewEvents2: TcxButton;
    cxGroupBox4: TcxGroupBox;
    GridEventsDBTableView: TcxGridDBTableView;
    GridEventsLevel: TcxGridLevel;
    GridEvents: TcxGrid;
    cxButton4: TcxButton;
    GridEventsDBTableViewEventDate: TcxGridDBColumn;
    GridEventsDBTableViewEventType: TcxGridDBColumn;
    dsInHerdAnimals: TDataSource;
    GridEventsDBTableViewEventDesc: TcxGridDBColumn;
    GridEventsDBTableViewAnimalLactNo: TcxGridDBColumn;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmboSoldAnimalsPropertiesEditValueChanged(Sender: TObject);
    procedure btnViewEventsClick(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure btnViewEvents2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FSaleDate, FPurchDate : TDateTime;
    EventsQuery : TQuery;
    EventsDataSource : TDataSource;
    FAID1, FAID2 : Integer;
    procedure LoadAnimalsSoldOff;
    procedure LoadAnimalsOnHerd;
    procedure RemoveNonDuplicates;
    procedure ViewEvents(AID : Integer);
    //procedure TransferEvents(AID1, AID2 : Integer);
  public
    { Public declarations }
    class procedure InvokeAnimalEventTransfer( AID1, AID2 : Integer);
    //   15/02/12 [V5.0 R3.8] /MK Change - Changed TransferEvents To A Global Class Procedure For Other Forms To Use.
    class procedure TransferEvents(AID1, AID2 : Integer);
  end;

var
  fmAnimalEventTransfer: TfmAnimalEventTransfer;

implementation
uses
   DairyData, GenTypesConst, uHerdLookup, SQLHelper;

{$R *.DFM}

{ TfmBaseForm1 }

procedure TfmAnimalEventTransfer.LoadAnimalsSoldOff;
begin

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select A.ID, A.NatIdNum, A.SortNatID, A.AnimalNo, A.SortAnimalNo, A.LactNo, A.Sex, A.DateOfBirth, E.EventDate');
         SQL.Add('From Animals A');
         SQL.Add('Left Join Events E on (E.AnimalID=A.ID)');
         SQL.Add('Left Join SalesDeaths S on (S.EventID=E.ID)');
         SQL.Add('Where (E.EventType = 11)');
         SQL.Add('And (S.Sold = True)');
         SQL.Add('And (A.InHerd=False)');
         SQL.Add('And (A.AnimalDeleted=False)');
         SQL.Add('And (A.HerdID=:AHerdID)');
         SQL.Add('And (E.EventDate>=:ASaleDate)');
         Params[0].AsInteger := WinData.UserDefaultHerdID;
         Params[1].AsDateTime := FSaleDate;
         Open;
         try
            First;
            mdSoldAnimals.Active := False;
            mdSoldAnimals.Active := True;

            mdSoldAnimals.DisableControls;
            while not eof do
               begin
                  mdSoldAnimals.Append;
                  try
                     mdSoldAnimals.FieldByName('ID').AsInteger := FieldByName('ID').AsInteger;
                     mdSoldAnimals.FieldByName('NatIdNum').AsString := FieldByName('NatIdNum').AsString;
                     mdSoldAnimals.FieldByName('SortNatIdNum').AsString := FieldByName('SortNatId').AsString;
                     mdSoldAnimals.FieldByName('AnimalNo').AsString := FieldByName('AnimalNo').AsString;
                     mdSoldAnimals.FieldByName('SortAnimalNo').AsString := FieldByName('SortAnimalNo').AsString;
                     mdSoldAnimals.FieldByName('LactNo').AsInteger := FieldByName('LactNo').AsInteger;
                     mdSoldAnimals.FieldByName('SaleDate').AsDateTime := FieldByName('EventDate').AsDateTime;
                     mdSoldAnimals.FieldByName('PurchDate').AsDateTime := WinData.EventDataHelper.GetLastEventDate(FieldByName('ID').AsInteger, CPurchaseEvent);
                     if mdSoldAnimals.FieldByName('PurchDate').AsDateTime <= 0 then
                        mdSoldAnimals.FieldByName('PurchDate').Clear;

                     mdSoldAnimals.FieldByName('Sex').AsString := FieldByName('Sex').AsString;
                     mdSoldAnimals.FieldByName('DateOfBirth').AsDateTime := FieldByName('DateOfBirth').AsDateTime;
                     mdSoldAnimals.Post;

                     //if mdSoldAnimals.FieldByName('NatIdNum').AsString = 'IE 33 33333 3 3333' then
                     //   ShowMessage('IE 33 33333 3 3333 found in Sold animals');
                  except
                     mdSoldAnimals.Cancel;
                  end;
                  Next;
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfmAnimalEventTransfer.FormDestroy(Sender: TObject);
begin
  if EventsDataSource <> nil then
     begin
        FreeAndNil(EventsDataSource);
     end;

  if EventsQuery <> nil then
     begin
        EventsQuery.Close;
        FreeAndNil(EventsQuery);
     end;

  mdSoldAnimals.Active := False;
  inherited;

end;

procedure TfmAnimalEventTransfer.FormCreate(Sender: TObject);
begin
  inherited;
  gbTransferEvents.BringToFront;
  
  FSaleDate := IncMonth(Date, -24);
  FPurchDate := IncMonth(Date, -24);
  EventsQuery := TQuery.Create(nil);
  EventsQuery.DatabaseName := AliasName;

  EventsDataSource := TDataSource.Create(nil);
  EventsDataSource.DataSet := EventsQuery;

  with EventsQuery do
     begin
        SQL.Clear;
        SQL.Add(InsertSELECT(['ID', 'EventDate', 'EventType', 'EventDesc', 'AnimalLactNo']));
        SQL.Add(InsertFROM(['Events']));
        SQL.Add(InsertWHERE(['AnimalID'],[':AID']));
        SQL.Add(InsertORDER(['EventDate DESC']));

        GridEventsDBTableView.DataController.DataSource := EventsDataSource;
        GridEventsDBTableView.DataController.KeyFieldNames := 'ID';

     end;

  LoadAnimalsSoldOff;
  LoadAnimalsOnHerd;
  RemoveNonDuplicates;



end;

procedure TfmAnimalEventTransfer.cmboSoldAnimalsPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  btnViewEvents.Enabled := not VarIsNull(cmboSoldAnimals.EditValue);
  btnViewEvents2.Enabled := not VarIsNull(cmboInHerdAnimals.EditValue);
end;

procedure TfmAnimalEventTransfer.LoadAnimalsOnHerd;
begin

   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('Select A.ID, A.NatIdNum, A.SortNatID, A.AnimalNo, A.SortAnimalNo, A.LactNo, A.Sex, A.DateOfBirth ');//, E.EventDate');
         SQL.Add('From Animals A');
         SQL.Add('Where (A.InHerd=True)');
         SQL.Add('And (A.AnimalDeleted=False)');
         SQL.Add('And (A.HerdID=:AHerdID)');
         Params[0].AsInteger := WinData.UserDefaultHerdID;
         Open;
         try
            First;
            mdInherdAnimals.Active := False;
            mdInherdAnimals.Active := True;
            mdInherdAnimals.DisableControls;

            while not eof do
               begin
                  mdInherdAnimals.Append;
                  try
                     mdInherdAnimals.FieldByName('ID').AsInteger := FieldByName('ID').AsInteger;
                     mdInherdAnimals.FieldByName('NatIdNum').AsString := FieldByName('NatIdNum').AsString;
                     mdInherdAnimals.FieldByName('SortNatId').AsString := FieldByName('SortNatId').AsString;
                     mdInherdAnimals.FieldByName('AnimalNo').AsString := FieldByName('AnimalNo').AsString;
                     mdInherdAnimals.FieldByName('SortAnimalNo').AsString := FieldByName('SortAnimalNo').AsString;
                     mdInherdAnimals.FieldByName('LactNo').AsInteger := FieldByName('LactNo').AsInteger;
                     mdInherdAnimals.FieldByName('PurchDate').AsDateTime:= WinData.EventDataHelper.GetLastEventDate(FieldByName('ID').AsInteger, CPurchaseEvent);
                     if mdInherdAnimals.FieldByName('PurchDate').AsDateTime <= 0 then
                        mdInherdAnimals.FieldByName('PurchDate').Clear;
                     mdInherdAnimals.FieldByName('Sex').AsString := FieldByName('Sex').AsString;
                     mdInherdAnimals.FieldByName('DateOfBirth').AsDateTime := FieldByName('DateOfBirth').AsDateTime;
                     mdInherdAnimals.Post;

                     //if mdInherdAnimals.FieldByName('NatIdNum').AsString = 'IE 33 33333 3 3333' then
                     //   ShowMessage('IE 33 33333 3 3333 found in InHerd animals');
                  except
                     mdInherdAnimals.Cancel;
                  end;
                  Next;
               end;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TfmAnimalEventTransfer.RemoveNonDuplicates;
begin
   with mdSoldAnimals do
      begin
         First;
         while not eof do
            begin
               if not mdInherdAnimals.Locate('NatIDNum', mdSoldAnimals.FieldByName('NatIDNum').AsString,[]) then
                  Delete
               else
                  Next;
            end;
      end;

   with mdInherdAnimals do
      begin
         First;
         while not eof do
            begin
               if not mdSoldAnimals.Locate('NatIDNum', mdInherdAnimals.FieldByName('NatIDNum').AsString,[]) then
                  Delete
               else
                  Next;
            end;
      end;
   mdSoldAnimals.EnableControls;
   mdInherdAnimals.EnableControls;

end;

procedure TfmAnimalEventTransfer.btnViewEventsClick(Sender: TObject);
begin
  inherited;
  if not (Trim(cmboSoldAnimals.Text)='') and (not VarIsNull(cmboSoldAnimals.EditValue)) then
      ViewEvents(cmboSoldAnimals.EditValue);
end;

procedure TfmAnimalEventTransfer.ViewEvents(AID: Integer);
begin
   EventsQuery.Active := False;
   EventsQuery.Params[0].AsInteger := AID;
   EventsQuery.Active := True;
   gbTransferEvents.SendToBack;
end;

procedure TfmAnimalEventTransfer.cxButton4Click(Sender: TObject);
begin
  inherited;
  gbTransferEvents.BringToFront;
  EventsQuery.Close;
end;

procedure TfmAnimalEventTransfer.btnViewEvents2Click(Sender: TObject);
begin
  inherited;
  if not (Trim(cmboInHerdAnimals.Text)='') and (not VarIsNull(cmboInHerdAnimals.EditValue)) then
      ViewEvents(cmboInHerdAnimals.EditValue);
end;

procedure TfmAnimalEventTransfer.cxButton1Click(Sender: TObject);
begin
  inherited;

  if ( cmboSoldAnimals.Text = cmboSoldAnimals.Text ) and (Trim(cmboSoldAnimals.Text) <>'') then
     begin
        if MessageDlg('Are you sure you want to transfer all events?',mtConfirmation,[mbYes,mbNo],0) = idYes then
           begin
              TransferEvents(cmboSoldAnimals.EditValue,cmboInHerdAnimals.EditValue);
           end;
     end;

end;

//   15/02/12 [V5.0 R3.8] /MK Change - Changed TransferEvents To A Global Class Procedure For Other Forms To Use.
class procedure TfmAnimalEventTransfer.TransferEvents(AID1, AID2: Integer);
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Add(InsertUPDATE('Events', ['AnimalID'], [IntToStr(AID2)]));
         SQL.Add(InsertWHERE(['AnimalID'],[IntToStr(AID1)]));
         SQL.Add('AND NOT (EventType IN (11,12,16))'); // sale, purchase, newid alloc leave these events with original animal.

         try
            ExecSQL;

            SQL.Clear;
            SQL.Add(InsertUPDATE('Animals', ['DamID'], [IntToStr(AID2)]));
            SQL.Add(InsertWHERE(['DamID'],[IntToStr(AID1)]));

            ExecSQL;

            SQL.Clear;
            SQL.Add(InsertUPDATE('Animals', ['SireID'], [IntToStr(AID2)]));
            SQL.Add(InsertWHERE(['SireID'],[IntToStr(AID1)]));

            ExecSQL;

            SQL.Clear;
            SQL.Add(InsertUPDATE('Animals', ['LactNo'], ['( Select Max(AnimalLactNo) From Events Where AnimalID='+IntToStr(AID1)+')']));
            SQL.Add(InsertWHERE(['ID'],[IntToStr(AID2)]));
            ExecSQL;

            if ( not(WinData.FKImportIgnoreEventMessages) ) then
              MessageDlg('Transfer completed.',mtInformation,[mbOK],0);
         except
            on e : exception do
               MessageDlg('Transfer has failed!'+cCRLFx2+e.Message,mtError,[mbOK],0);
         end;
      finally
         Free;
      end;
   //Close;
end;

class procedure TfmAnimalEventTransfer.InvokeAnimalEventTransfer(AID1,
  AID2: Integer);
begin
   with TfmAnimalEventTransfer.Create(nil) do
      try
         FAID1 := AID1;
         FAID2 := AID2;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmAnimalEventTransfer.FormShow(Sender: TObject);
begin
  inherited;
  if (FAID1 > 0) and ( FAID2 > 0) then
     begin
        cmboSoldAnimals.EditValue := FAID1;
        cmboInHerdAnimals.EditValue := FAID2;
     end;
end;

end.
