unit uUpdateHealthUnits;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxButtons, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, DateUtil,
  db, dbTables, GenTypesConst, cxProgressBar;

type
  TfmUpdateHealthUnits = class(TForm)
    btnUpdate: TcxButton;
    btnCancel: TcxButton;
    deDateFrom: TcxDateEdit;
    deDateTo: TcxDateEdit;
    lDateFrom: TcxLabel;
    lDateTo: TcxLabel;
    lInfo: TcxLabel;
    ProgressBar: TcxProgressBar;
    procedure btnCancelClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
  private
    procedure UpdateHealthUnitsByMedicineUnits(ADateFrom, ADateTo: TDateTime);
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowForm;
  end;

var
  fmUpdateHealthUnits: TfmUpdateHealthUnits;

const
   cInfo = 'This utility will update the dose unit, purchase unit and costs'+#13#10+
           'of veterinary treatments to their current values stored in the medicine database.'+#13#10+
           'Specify the date range below and click Update to continue.';

implementation

{$R *.DFM}

class procedure TfmUpdateHealthUnits.ShowForm;
begin
   with TfmUpdateHealthUnits.Create(nil) do
      try
         lInfo.Caption := cInfo;
         deDateFrom.Date := IncYear(Now,-1);
         deDateTo.Date := Now;
         ProgressBar.Visible := False;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmUpdateHealthUnits.UpdateHealthUnitsByMedicineUnits
   ( ADateFrom, ADateTo : TDateTime );
var
   qMediTreatments : TQuery;

   procedure UpdateHealthTable ( ADrugID : Integer;
      ADoseRate, APurchRate, ACosts : Double);
   var
      qUpdateHealthTable : TQuery;
   begin
      if ( ADrugID = 0 ) and ( (ADoseRate = 0) or (APurchRate = 0) ) then Exit;
      qUpdateHealthTable := TQuery.Create(nil);
      with qUpdateHealthTable do
         try
            DatabaseName := AliasName;
            SQL.Clear;
            SQL.Add('UPDATE Health H');
            SQL.Add('SET H.DoseUnitUsed  = :ADoseRate,');
            SQL.Add('    H.PurchUnitUsed = :APurchRate,');
            SQL.Add('    H.PurchUnitCost = :ACosts');
            SQL.Add('WHERE H.DrugUsed = :ADrugID');
            Params[0].AsFloat := ADoseRate;
            Params[1].AsFloat := APurchRate;
            Params[2].AsFloat := ACosts;
            Params[3].AsInteger := ADrugID;
            try
               try
                  ExecSQL;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
            finally
               Close;
            end;
         finally
            Free;
         end;
   end;

   procedure StepUpProgress;
   begin
      ProgressBar.Position := ProgressBar.Position+1;
      Update;
   end;

begin
   // dDefaultDate is 01/01/CurrentYear-1 - GL.
   qMediTreatments := TQuery.Create(nil);
   with qMediTreatments do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT H.DrugUsed,');
         SQL.Add('       DU.Multiplier DoseMultiplier, PU.Multiplier PurchMultiplier,');
         SQL.Add('       M.CostPurchUnit');
         SQL.Add('FROM Health H');
         SQL.Add('LEFT JOIN Medicine M ON (M.ID = H.DrugUsed)');
         SQL.Add('LEFT JOIN Units DU ON (DU.ID = M.DoseUnit)');
         SQL.Add('LEFT JOIN Units PU ON (PU.ID = M.PurchUnit)');
         SQL.Add('LEFT JOIN Events E ON (E.ID = H.EventID)');
         SQL.Add('WHERE E.EventType In (:HealthEvent, :DryOffEvent, :HerdVaccinationEvent)');
         SQL.Add('AND E.EventDate BETWEEN :ADateFrom AND :ADateTo');
         SQL.Add('GROUP BY H.DrugUsed, DU.Multiplier, PU.Multiplier, M.CostPurchUnit');
         Params[0].AsInteger := CHealthEvent;
         Params[1].AsInteger := CDryOffEvent;
         Params[2].AsInteger := CHerdVaccination;
         Params[3].AsDateTime := ADateFrom;
         Params[4].AsDateTime := ADateTo;
         try
            qMediTreatments.Open;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;
         if ( qMediTreatments.RecordCount > 0 ) then
            try
               ProgressBar.Visible := True;
               ProgressBar.Position := 0;
               ProgressBar.Properties.Min := 0;
               ProgressBar.Properties.Max := qMediTreatments.RecordCount;
               qMediTreatments.First;
               while ( not(qMediTreatments.Eof) ) do
                  begin
                     if ( qMediTreatments.FieldByName('DrugUsed').AsInteger > 0 ) then
                        UpdateHealthTable(qMediTreatments.FieldByName('DrugUsed').AsInteger,
                                          qMediTreatments.FieldByName('DoseMultiplier').AsFloat,
                                          qMediTreatments.FieldByName('PurchMultiplier').AsFloat,
                                          qMediTreatments.FieldByName('CostPurchUnit').AsFloat);
                     qMediTreatments.Next;
                     StepUpProgress;
                  end;
            finally
               if ProgressBar.Position < ProgressBar.Properties.Max then
                  ProgressBar.Position := ProgressBar.Properties.Max;
               MessageDlg('Update complete.',mtInformation,[mbOK],0);
            end;
      except
         on e : Exception do
            ShowMessage(e.Message);
      end;
   qMediTreatments.Close;
   FreeAndNil(qMediTreatments);
end;

procedure TfmUpdateHealthUnits.btnUpdateClick(Sender: TObject);
begin
   if ( deDateFrom.Date <=0 ) and ( deDateTo.Date <=0 ) then
      MessageDlg('A date from and/or date to must be specified.',mtError,[mbOK],0)
   else
      begin
         if ( deDateFrom.Date < 0 ) then
            deDateFrom.Date := IncYear(Now,-5);
         if ( deDateTo.Date < 0 ) then
            deDateTo.Date := Now;
         UpdateHealthUnitsByMedicineUnits(deDateFrom.Date,deDateTo.Date);
      end;
end;

procedure TfmUpdateHealthUnits.btnCancelClick(Sender: TObject);
begin
   Close;
end;

end.
