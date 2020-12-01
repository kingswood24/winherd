unit uBlockEventEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, dxBar,
  dxBarExtItems, ActnList, dxStatusBar, cxContainer, cxEdit, cxLabel,
  ExtCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit, StdCtrls, cxButtons,
  cxCalendar, cxGroupBox, GenTypesConst, db, dbTables;

type
  TfmBlockEventEdit = class(TfmBaseForm)
    BlockEventEditGrid: TcxGrid;
    BlockEventEditGridDBTableView: TcxGridDBTableView;
    BlockEventEditGridLevel: TcxGridLevel;
    gbFilterEvents: TcxGroupBox;
    lEventType: TcxLabel;
    cmboEventType: TcxComboBox;
    lFromDate: TcxLabel;
    deDateFrom: TcxDateEdit;
    lToDate: TcxLabel;
    deDateTo: TcxDateEdit;
    btnApplyFilter: TcxButton;
    actApplyFilter: TAction;
    BlockEventEditGridDBTableViewNumAnimals: TcxGridDBColumn;
    BlockEventEditGridDBTableViewEventType: TcxGridDBColumn;
    BlockEventEditGridDBTableViewEventDate: TcxGridDBColumn;
    BlockEventEditGridDBTableViewEventDesc: TcxGridDBColumn;
    BlockEventEditGridDBTableViewSelected: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actApplyFilterExecute(Sender: TObject);
  private
    { Private declarations }
    FEventTable : TTable;
    FEventQuery : TQuery;
    FEventDataSource : TDataSource;
  public
    { Public declarations }
    class procedure ShowTheForm;
  end;

var
  fmBlockEventEdit: TfmBlockEventEdit;

const
   cBasicEventSQLHeader = 'SELECT Count(E.AnimalID) AnimalCount, EventDate, EventDesc '+cCRLF+
                          'FROM Events E ' +cCRLF+
                          'WHERE E.EventType = :EventType ';

   cBasicEventSQLFooter = 'GROUP BY EventType, EventDate, EventDesc';

   cGroupHealthEvents = 'SELECT COUNT(HealthEventID) EventCount ,EventDate, DrugID, DrugName, RateApplic, '+cCRLF+
                        '       ApplicMethod, AdminByID, AdminBy, DoseUnit, '+cCRLF+
                        '       MilkDays, MeatDays, OrganicMeatDays, OrganicMilkDays, OrganicOtherDays, '+cCRLF+
                        '       WithdrawalDate, MilkWD, OrganicMeatWD, OrganicMilkWD, OrganicOtherWD, '+cCRLF+
                        '       BatchNo, NoTimes, NoDays, ExpiryDate, G.Description, FarmCodeDesc, PrescribedByID, PrescribedBy, '+cCRLF+
                        '       EventDesc, TotDrugCost, MilkN_A_Drug, MeatN_A_Drug'+cCRLF+
                        'FROM TempHealth '+cCRLF+
                        'LEFT JOIN GenLook G ON (G.ID=ReportID) '+cCRLF+
                        'GROUP BY EventDate, DrugID, DrugName, RateApplic, '+cCRLF+
                        '         ApplicMethod, AdminByID, AdminBy, DoseUnit, '+cCRLF+
                        '         MilkDays, MeatDays, OrganicMeatDays, OrganicMilkDays, OrganicOtherDays, '+cCRLF+
                        '         WithdrawalDate, MilkWD, OrganicMeatWD, OrganicMilkWD, OrganicOtherWD, '+cCRLF+
                        '         BatchNo, NoTimes, NoDays, ExpiryDate, G.Description, '+cCRLF+
                        '         FarmCodeDesc, PrescribedByID, PrescribedBy, '+cCRLF+
                        '         EventDesc, TotDrugCost, MilkN_A_Drug, MeatN_A_Drug';

implementation

{$R *.DFM}

{ TfmBlockEventEdit }

class procedure TfmBlockEventEdit.ShowTheForm;
begin
   with TfmBlockEventEdit.Create(nil) do
      try
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmBlockEventEdit.FormCreate(Sender: TObject);
begin
   inherited;
   cmboEventType.Properties.Items.Clear;
   cmboEventType.Properties.Items.AddObject('Health',TObject(CHealthEvent));
   cmboEventType.Properties.Items.AddObject('Vaccination',TObject(CHerdVaccination));

   FEventTable := TTable.Create(nil);
   FEventTable.DatabaseName := AliasName;
   FEventTable.TableName := 'tmpBlockEvents';
   FEventTable.FieldDefs.Add('ID',ftAutoInc);
   FEventTable.FieldDefs.Add('Selected',ftBoolean);
   FEventTable.FieldDefs.Add('NoAnimals',ftInteger);
   FEventTable.FieldDefs.Add('EventType',ftString,20);
   FEventTable.FieldDefs.Add('EventDate',ftDateTime);
   FEventTable.FieldDefs.Add('EventDesc',ftString,30);
   FEventTable.IndexDefs.Add('','ID',[ixPrimary,ixUnique]);
   FEventTable.CachedUpdates := True;
   FEventTable.CreateTable;
   FEventTable.Open;

   FEventQuery := TQuery.Create(nil);
   FEventQuery.DatabaseName := AliasName;

   FEventDataSource := TDataSource.Create(nil);
   FEventDataSource.DataSet := FEventTable;
end;

procedure TfmBlockEventEdit.actApplyFilterExecute(Sender: TObject);
begin
   inherited;
   FEventQuery.Close;
   FEventQuery.SQL.Clear;
   FEventQuery.SQL.Add('DELETE FROM '+FEventTable.TableName);
   FEventQuery.ExecSQL;

   FEventQuery.Close;
   FEventQuery.SQL.Clear;
   FEventQuery.SQL.Text := cBasicEventSQLHeader;
   if ( deDateFrom.Date > 0 ) and ( deDateTo.Date > 0 ) then
      FEventQuery.SQL.Add('AND E.EventDate BETWEEN "'+FormatDateTime(cUSDateStyle,deDateFrom.Date)+'" AND "'+FormatDateTime(cUSDateStyle,deDateTo.Date)+'"')
   else if ( deDateFrom.Date > 0 ) and ( deDateTo.Date < 0 ) then
      FEventQuery.SQL.Add('AND E.EventDate >= "'+FormatDateTime(cUSDateStyle,deDateFrom.Date)+'"')
   else if ( deDateFrom.Date < 0 ) and ( deDateTo.Date > 0 ) then
      FEventQuery.SQL.Add('AND E.EventDate <= "'+FormatDateTime(cUSDateStyle,deDateTo.Date)+'"');
   FEventQuery.SQL.Add(cBasicEventSQLFooter);
   FEventQuery.Params[0].AsInteger := Integer(cmboEventType.Properties.Items.Objects[cmboEventType.ItemIndex]);
   FEventQuery.Open;
   if ( FEventQuery.RecordCount = 0 ) then
      begin
         MessageDlg('No events found for this event type and date period.',mtError,[mbOK],0);
         SysUtils.Abort;
      end;

   BlockEventEditGridDBTableView.DataController.DataSource := nil;

   FEventTable.Close;
   FEventTable.Open;
   FEventQuery.First;
   while ( not(FEventQuery.Eof) ) do
      begin
         try
            FEventTable.Append;
            FEventTable.FieldByName('Selected').AsBoolean := True;
            FEventTable.FieldByName('NoAnimals').AsInteger := FEventQuery.FieldByName('AnimalCount').AsInteger;
            FEventTable.FieldByName('EventType').AsString := cmboEventType.Properties.Items[cmboEventType.ItemIndex];
            FEventTable.FieldByName('EventDate').AsDateTime := FEventQuery.FieldByName('EventDate').AsDateTime;
            FEventTable.FieldByName('EventDesc').AsString := FEventQuery.FieldByName('EventDesc').AsString;
            FEventTable.Post;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;

         FEventQuery.Next;
      end;

   BlockEventEditGridDBTableView.DataController.DataSource := FEventDataSource;
end;

procedure TfmBlockEventEdit.FormDestroy(Sender: TObject);
begin
   inherited;
   if ( FEventTable <> nil ) then
      begin
         FEventTable.Close;
         FEventTable.DeleteTable;
         FreeAndNil(FEventTable);
      end;

   if ( FEventQuery <> nil ) then
      begin
         FEventQuery.Close;
         FreeAndNil(FEventQuery);
      end;

   if ( FEventDataSource <> nil ) then
      FreeAndNil(FEventDataSource);
end;

end.
