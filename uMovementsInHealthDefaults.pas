{
   24/07/14 [V5.3 R4.0] /MK Change - New label, combobox for BatchNo.
                                   - New procedure, LookupBatchNo, called after drug is selected.
                                   - Save DrugPurchID and BatchNo string to DefaultHealth events table.

   28/08/14 [V5.3 R5.7] /MK Additional Feature - ShowHealthDefaultEditor - New dbCheckBox added for CrushTreatment.
                            Change - ShowHealthDefaultEditor - Only show PerKg fields if not a Crush user.

   12/01/16 [V5.5 R3.1] /MK Change - Changed Caption to Treatment Template - requested by GL.
}

unit uMovementsInHealthDefaults;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBaseForm, cxDBEdit, cxDropDownEdit, cxCalendar, cxLabel, cxTextEdit,
  cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxContainer, cxEdit, cxGroupBox, ActnList, dxBar, dxBarExtItems,
  cxControls, dxStatusBar, cxCheckBox, db, dbTables, GenTypesConst, Def;

type
  TfmMovementsInHealthDefaults = class(TfmBaseForm)
    cxGroupBox1: TcxGroupBox;
    cmboDrug: TcxDBLookupComboBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    teApplicRate: TcxDBTextEdit;
    lDoseUnit: TcxLabel;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    actCancel: TAction;
    actSave: TAction;
    actDelete: TAction;
    dxBarLargeButton3: TdxBarLargeButton;
    tePerKgs: TcxDBTextEdit;
    cxLabel3: TcxLabel;
    cxLabel5: TcxLabel;
    dxBarLargeButton4: TdxBarLargeButton;
    actAdd: TAction;
    cxGroupBox2: TcxGroupBox;
    cbDefaultCommentToDrugDesc: TcxDBCheckBox;
    dbcbCrushTreatment: TcxDBCheckBox;
    procedure actSaveExecute(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actCancelUpdate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actAddUpdate(Sender: TObject);
    procedure cmboDrugPropertiesInitPopup(Sender: TObject);
    procedure cmboDrugPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FDataSource : TDataSource;
    FDrugPurchID : Integer;
    procedure SetDoseUnitLabel;
  public
    { Public declarations }
    class procedure ShowHealthDefaultEditor(ADataSource : TDataSource);
  end;

var
  fmMovementsInHealthDefaults: TfmMovementsInHealthDefaults;

implementation

uses uImageStore, uHerdLookup, cxLookupDBGrid, DairyData;

{$R *.DFM}

{ TfmMovementsInHealthDefaults }

class procedure TfmMovementsInHealthDefaults.ShowHealthDefaultEditor(
  ADataSource: TDataSource);
begin
   with TfmMovementsInHealthDefaults.Create(nil) do
      try
         FDataSource := ADataSource;
         cmboDrug.DataBinding.DataSource := FDataSource;
         teApplicRate.DataBinding.DataSource := FDataSource;
         tePerKgs.DataBinding.DataSource := FDataSource;
         cbDefaultCommentToDrugDesc.DataBinding.DataSource := FDataSource;

         //   28/08/14 [V5.3 R5.7] /MK Additional Feature - New dbCheckBox added for CrushTreatment.
         dbcbCrushTreatment.DataBinding.DataSource := FDataSource;
         dbcbCrushTreatment.Visible := Def.Definition.dUseCrush;
         //   28/08/14 [V5.3 R5.7] /MK Change - Only show PerKg fields if not a Crush user.
         cxLabel5.Visible := ( not(dbcbCrushTreatment.Visible) );
         tePerKgs.Visible := ( not(dbcbCrushTreatment.Visible) );
         cxLabel3.Visible := ( not(dbcbCrushTreatment.Visible) );

         if ( not(Def.Definition.dUseCrush) ) then
            cbDefaultCommentToDrugDesc.Left := 24
         else
            cbDefaultCommentToDrugDesc.Left := 200;

         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmMovementsInHealthDefaults.actSaveExecute(Sender: TObject);
begin
  inherited;
  FDataSource.DataSet.Post;
end;

procedure TfmMovementsInHealthDefaults.actSaveUpdate(Sender: TObject);
begin
  inherited;
  actSave.Enabled := (FDataSource.DataSet.State in dsEditModes);
end;

procedure TfmMovementsInHealthDefaults.actCancelExecute(Sender: TObject);
begin
  inherited;
  FDataSource.DataSet.Cancel;
end;

procedure TfmMovementsInHealthDefaults.actCancelUpdate(Sender: TObject);
begin
  inherited;
  actCancel.Enabled := (FDataSource.DataSet.State in dsEditModes);
end;

procedure TfmMovementsInHealthDefaults.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if MessageDlg('Delete record?', mtConfirmation, [mbYes,mbNo],0) = idYes then
     FDataSource.DataSet.Delete;
end;

procedure TfmMovementsInHealthDefaults.actAddExecute(Sender: TObject);
begin
  inherited;
  FDataSource.DataSet.Append;
end;

procedure TfmMovementsInHealthDefaults.actAddUpdate(Sender: TObject);
begin
  inherited;
  actAdd.Enabled := not(FDataSource.DataSet.State in dsEditModes);
end;

procedure TfmMovementsInHealthDefaults.cmboDrugPropertiesInitPopup(
  Sender: TObject);
var
   colInUse : TcxLookupDBGridColumn;
begin
   with cmboDrug.Properties.Grid do
      begin
         colInUse := Columns.ColumnByFieldName('INUSE');
         if ( colInUse <> nil ) then
            begin
               colInUse.MinWidth := 0;
               colInUse.Width := 0;
            end;
      end;
end;

procedure TfmMovementsInHealthDefaults.cmboDrugPropertiesChange(
  Sender: TObject);
begin
   inherited;
   SetDoseUnitLabel;
end;

procedure TfmMovementsInHealthDefaults.SetDoseUnitLabel;
begin
  if not VarIsNull(cmboDrug.EditValue) then
     lDoseUnit.Caption := HerdLookup.LookupDrugDosePurchUnitCode(cmboDrug.EditValue,utDose);
end;

procedure TfmMovementsInHealthDefaults.FormCreate(Sender: TObject);
begin
  inherited;
  SetDoseUnitLabel;
end;

end.
