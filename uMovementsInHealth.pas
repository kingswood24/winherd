unit uMovementsInHealth;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, cxDBEdit, cxDropDownEdit, cxCalendar, cxLabel, cxTextEdit,
  cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxContainer, cxEdit, cxGroupBox, ActnList, dxBar, dxBarExtItems,
  cxControls, dxStatusBar, db;

type
  TfmMovementsInHealth = class(TfmBaseForm)
    cxGroupBox1: TcxGroupBox;
    cmboDrug: TcxDBLookupComboBox;
    ldate: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    teApplicRate: TcxDBTextEdit;
    lDoseUnit: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    teTagNo: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxLabel4: TcxLabel;
    teWeight: TcxTextEdit;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    actCancel: TAction;
    actSave: TAction;
    actDelete: TAction;
    dxBarLargeButton3: TdxBarLargeButton;
    cxLabel3: TcxLabel;
    tePerKgs: TcxDBTextEdit;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel8: TcxLabel;
    teComment: TcxDBTextEdit;
    deEventDate: TcxDBDateEdit;
    procedure actCancelExecute(Sender: TObject);
    procedure actCancelUpdate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
    procedure cmboDrugIDPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FDataSource : TDataSource;
    procedure SetDoseUnitLabel;
  public
    { Public declarations }
    class procedure ShowHealthEditor(ADataSource : TDataSource; ATagNo : string; AWeight : Double);
  end;

var
  fmMovementsInHealth: TfmMovementsInHealth;

implementation

uses uImageStore, uHerdLookup;

{$R *.DFM}

procedure TfmMovementsInHealth.actCancelExecute(Sender: TObject);
begin
  inherited;
  FDataSource.DataSet.Cancel;
end;

procedure TfmMovementsInHealth.actCancelUpdate(Sender: TObject);
begin
  inherited;
  actCancel.Enabled := (FDataSource.DataSet.State in dsEditModes);

end;

procedure TfmMovementsInHealth.actSaveExecute(Sender: TObject);
begin
  inherited;
  FDataSource.DataSet.Post;
end;

procedure TfmMovementsInHealth.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg('Delete record?', mtConfirmation, [mbYes,mbNo],0) = idYes then
     begin
        FDataSource.DataSet.Delete;
        Close;
     end;
end;

procedure TfmMovementsInHealth.actSaveUpdate(Sender: TObject);
begin
  inherited;
  actSave.Enabled := (FDataSource.DataSet.State in dsEditModes);
end;

procedure TfmMovementsInHealth.actDeleteUpdate(Sender: TObject);
begin
  inherited;
   //
end;

class procedure TfmMovementsInHealth.ShowHealthEditor(ADataSource : TDataSource;
   ATagNo : string; AWeight : Double);
begin
   with TfmMovementsInHealth.Create(nil) do
      try
         FDataSource := ADataSource;

         teTagNo.Text :=  ATagNo;
         teWeight.Text :=  FloatToStrF(AWeight,ffFixed,8,2);

         cmboDrug.DataBinding.DataSource := FDataSource;
         teApplicRate.DataBinding.DataSource := FDataSource;
         tePerKgs.DataBinding.DataSource := FDataSource;
         teComment.DataBinding.DataSource := FDataSource;
         deEventDate.DataBinding.DataSource := FDataSource;
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmMovementsInHealth.cmboDrugIDPropertiesChange(Sender: TObject);
begin
  inherited;
  SetDoseUnitLabel;
  if not VarIsNull(cmboDrug.EditValue) then
     teComment.EditValue := HerdLookup.DrugDetailByDrugID(cmboDrug.EditValue, Medicine_Name);
end;

procedure TfmMovementsInHealth.SetDoseUnitLabel;
begin
  if not VarIsNull(cmboDrug.EditValue) then
     lDoseUnit.Caption := HerdLookup.LookupDrugDosePurchUnitCode(cmboDrug.EditValue,utDose);
end;

procedure TfmMovementsInHealth.FormCreate(Sender: TObject);
begin
  inherited;
  SetDoseUnitLabel;
end;

end.
