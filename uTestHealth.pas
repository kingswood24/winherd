unit uTestHealth;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, dxBar, dxBarExtItems, ActnList, cxControls, dxStatusBar,
  cxCurrencyEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxContainer, cxEdit, cxLabel,
  db, dbTables, EventRecording;

type
  TfmTestHealth = class(TfmBaseForm)
    lbSave: TdxBarLargeButton;
    actSave: TAction;
    lDrugUsed: TcxLabel;
    lApplicRate: TcxLabel;
    cmboDrugUsed: TcxLookupComboBox;
    ceApplicRate: TcxCurrencyEdit;
    lBatchNo: TcxLabel;
    cmboBatchNo: TcxLookupComboBox;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure cmboDrugUsedPropertiesChange(Sender: TObject);
    procedure ceApplicRatePropertiesChange(Sender: TObject);
    procedure cmboBatchNoPropertiesChange(Sender: TObject);
  private
    FQBatchNo,
    FQDrugs : TQuery;
    FDSBatchNo,
    FDSDrugs : TDataSource;
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowTheForm;
  end;

var
  fmTestHealth: TfmTestHealth;

implementation

{$R *.DFM}

{ TfmTestHealth }

class procedure TfmTestHealth.ShowTheForm;
begin
   with TfmTestHealth.Create(nil) do
      try
         if ( FQDrugs.RecordCount > 0 ) then
            ShowModal;
      finally
         Free;
      end;
end;

procedure TfmTestHealth.FormCreate(Sender: TObject);
begin
   inherited;
   FQDrugs := TQuery.Create(nil);
   with FQDrugs do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID, DrugCode, Name');
         SQL.Add('FROM Medicine');
         SQL.Add('WHERE InUse = TRUE');
         SQL.Add('ORDER BY Name');
         try
            Open;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      finally
      end;

   FDSDrugs := TDataSource.Create(nil);
   FDSDrugs.DataSet := FQDrugs;
   with cmboDrugUsed do
      begin
         with TcxLookupComboBoxProperties(Properties) do
            begin
               Alignment.Horz := taLeftJustify;
               Alignment.Vert := taVCenter;
               ListSource := FDSDrugs;
               KeyFieldNames := 'ID';
               ListFieldNames := 'DrugCode;Name';
               ListColumns[0].Caption := 'Code';
               ListColumns[0].Width := 50;
               ListColumns[1].Caption := 'Name';
               ListColumns[1].Width := 110;
            end;
      end;

   FQBatchNo := TQuery.Create(nil);
   with FQBatchNo do
      begin
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ID, BatchNo');
         SQL.Add('FROM MediPur');
         SQL.Add('WHERE (DrugID = :DrugID)');
         SQL.Add('AND   (InUse = True)');
         SQL.Add('AND   (BatchNo <> "")');
      end;

   FDSBatchNo := TDataSource.Create(nil);

   actSave.Enabled := False;
end;

procedure TfmTestHealth.cmboDrugUsedPropertiesChange(Sender: TObject);
begin
   inherited;
   cmboDrugUsed.PostEditValue;
   if ( cmboDrugUsed.EditValue > 0 ) then
      begin
         if ( FQBatchNo.Active ) then
            FQBatchNo.Close;
         FDSBatchNo.DataSet := nil;
         FQBatchNo.Params[0].AsInteger := cmboDrugUsed.EditValue;
         try
            FQBatchNo.Open;
            if ( FQBatchNo.RecordCount > 0 ) then
               begin
                  with cmboBatchNo do
                     begin
                        with TcxLookupComboBoxProperties(Properties) do
                           begin
                              Alignment.Horz := taLeftJustify;
                              Alignment.Vert := taVCenter;
                              ListSource := FDSBatchNo;
                              KeyFieldNames := 'ID';
                              ListFieldNames := 'BatchNo';
                           end;
                     end;
                  FDSBatchNo.DataSet := FQBatchNo;
               end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
      end;

   actSave.Enabled := ( cmboDrugUsed.EditValue > 0 ) and ( ceApplicRate.EditValue > 0 );
end;

procedure TfmTestHealth.ceApplicRatePropertiesChange(Sender: TObject);
begin
  inherited;
   ceApplicRate.PostEditValue;
   actSave.Enabled := ( cmboDrugUsed.EditValue > 0 ) and ( ceApplicRate.EditValue > 0 );
end;

procedure TfmTestHealth.cmboBatchNoPropertiesChange(Sender: TObject);
begin
   inherited;
   cmboBatchNo.PostEditValue;
end;

procedure TfmTestHealth.actSaveExecute(Sender: TObject);
var
   HealthEvent : THealthEvent;
begin
   inherited;
   HealthEvent := THealthEvent.Create('tHealth');
   try
      HealthEvent.Append;
      try
         HealthEvent.AnimalID := 3037;
         HealthEvent.AnimalLactNo := 0;
         HealthEvent.AnimalHerdID := 8;
         HealthEvent.EventDate := Date;
         HealthEvent.EventComment := 'TestHealthEvent';
         HealthEvent.EventSource := 0;
         HealthEvent.IsSynchronized := True;
         HealthEvent.DrugUsed := cmboDrugUsed.EditValue;
         HealthEvent.RateApplic := ceApplicRate.EditValue;
         HealthEvent.DrugPurchID := cmboBatchNo.EditValue;
         HealthEvent.NoTimes := 1;
         HealthEvent.NoDays := 1;
         HealthEvent.Post;
      except
         HealthEvent.Cancel;
      end;
   finally
      FreeAndNil(HealthEvent);
   end;
end;

procedure TfmTestHealth.FormDestroy(Sender: TObject);
begin
   inherited;
   if ( FQDrugs <> nil ) then
      begin
         FQDrugs.Close;
         FreeAndNil(FQDrugs);
      end;
   if ( FDSDrugs <> nil ) then
      FreeAndNil(FDSDrugs);

   if ( FQBatchNo <> nil ) then
      begin
         FQBatchNo.Close;
         FreeAndNil(FQBatchNo);
      end;
   if ( FDSBatchNo <> nil ) then
      FreeAndNil(FDSBatchNo);
end;

end.
