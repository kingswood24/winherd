unit uMediDisposal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxControls, cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons,
  cxTextEdit, cxCurrencyEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, uHerdLookup, uMedicineRepository,
  uMedicineDisposalRepository, db, dbTables, GenTypesConst,
  uMedicinePurchaseRepository;

type
  TfmMediDiposal = class(TForm)
    btnSave: TcxButton;
    btnCancel: TcxButton;
    lDrugInfo: TcxLabel;
    lDisposalAmt: TcxLabel;
    ceDisposalAmt: TcxCurrencyEdit;
    lBatchNo: TcxLabel;
    lcmboBatchNo: TcxLookupComboBox;
    lReason: TcxLabel;
    lcmboReasonForWaste: TcxLookupComboBox;
    lComment: TcxLabel;
    teComment: TcxTextEdit;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lcmboBatchNoPropertiesChange(Sender: TObject);
    procedure lcmboReasonForWastePropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FDrugID,
    FDrugPurchID,
    FDisposeReason : Integer;
    FQtyBeforeDeduct : Double;
    FMedicineInfo : TMedicineRecord;
    FMedicineRepos : TMedicineRepository;
    FMedicinePurchRepos : TMedicinePurchaseRepository;
    FMedicineDisposal : TMedicineDisposalRepository;
  public
    { Public declarations }
    class procedure ShowTheForm ( ADrugID : Integer; const ADrugPurchID : Integer = 0; ADiposalAmt : Double = 0 );
  end;

var
  fmMediDiposal: TfmMediDiposal;

implementation

{$R *.DFM}

{ TfmMediDiposal }

procedure TfmMediDiposal.FormCreate(Sender: TObject);
var
   i : Integer;
begin
   lcmboBatchNo.Properties.ListSource := HerdLookup.dsBatchNosWithQtyRem;
   lcmboBatchNo.Properties.ListFieldNames := 'BatchNo;QtyRemaining';
   lcmboBatchNo.Properties.KeyFieldNames := 'ID';
   for i := 0 to lcmboBatchNo.Properties.ListColumns.Count-1 do
      if ( UpperCase(lcmboBatchNo.Properties.ListColumns[i].FieldName) = 'QTYREMAINING' ) then
         begin
            lcmboBatchNo.Properties.ListColumns[i].Caption := 'Qty';
            Break;
         end;
end;

class procedure TfmMediDiposal.ShowTheForm(ADrugID: Integer; const ADrugPurchID: Integer = 0; ADiposalAmt : Double = 0);
var
   sName, sVPANo : String;
begin
   with TfmMediDiposal.Create(nil) do
      try
         FDrugID := ADrugID;
         FDrugPurchID := ADrugPurchID;
         FQtyBeforeDeduct := ADiposalAmt;
         FDisposeReason := 0;
         FMedicineRepos := TMedicineRepository.Create();
         FMedicineInfo := FMedicineRepos.GetMedicineInfo(ADrugID);
         lDrugInfo.Caption := FMedicineInfo.Name + ' ('+FMedicineInfo.VPANo+')';
         ShowModal;
      finally
         Free;
      end;
end;

procedure TfmMediDiposal.FormShow(Sender: TObject);
begin
   HerdLookup.qBatchNosWithQtyRem.Close;
   HerdLookup.qBatchNosWithQtyRem.Params[0].AsInteger := FDrugID;
   HerdLookup.qBatchNosWithQtyRem.Open;

   lBatchNo.Visible := ( HerdLookup.qBatchNosWithQtyRem.RecordCount > 0 );
   lcmboBatchNo.Visible := lBatchNo.Visible;
   if ( HerdLookup.qBatchNosWithQtyRem.RecordCount = 0 ) then
      Height := 300
   else
      Height := 342;

   if ( FDrugPurchID > 0 ) then
      lcmboBatchNo.EditValue := FDrugPurchID;

   HerdLookup.qMediDisposalReason.Close;
   HerdLookup.qMediDisposalReason.Open;

   ceDisposalAmt.Value := FQtyBeforeDeduct;
end;

procedure TfmMediDiposal.btnSaveClick(Sender: TObject);
var
   iDisposalID : Integer;
   sMessage : String;
begin
   ceDisposalAmt.PostEditValue;
   if ( ceDisposalAmt.Value <= 0 ) then
      begin
         MessageDlg('You must enter an amount wasted.',mtError,[mbOK],0);
         SysUtils.Abort;
      end
   else if ( ceDisposalAmt.Value > FQtyBeforeDeduct ) then
      begin
         if ( FDrugPurchID > 0 ) then
            sMessage := 'Amount wasted, %s, cannot exceed drug purchase quantity, %s.'+cCRLF+
                        'Resetting amount wasted to drug purchase quantity.'
         else
            sMessage := 'Amount wasted, %s, cannot exceed drug quantity, %s.'+cCRLF+
                        'Resetting amount wasted to drug quantity.';

         MessageDlg(Format(sMessage,[FormatFloat('0.##',ceDisposalAmt.Value),FormatFloat('0.##',FQtyBeforeDeduct)]),mtError,[mbOK],0);
         ceDisposalAmt.Value := FQtyBeforeDeduct;
         SysUtils.Abort;
      end;

   lcmboBatchNo.PostEditValue;
   if ( lcmboBatchNo.EditValue = Null ) and ( HerdLookup.qBatchNosWithQtyRem.RecordCount > 0 ) then
      if ( MessageDlg('No batch number selected for this medicine.'+cCRLF+
                      'If you do not select a batch number then there will be a difference'+cCRLF+
                      'between the medicine quantity in stock and the purchase stock remaining.'+cCRLF+
                      'Do you wish to proceed without selecting a batch number?',mtConfirmation,[mbYes,mbNo],0) = mrNo ) then
         SysUtils.Abort;

   lcmboReasonForWaste.PostEditValue;

   teComment.PostEditValue;

   FMedicineDisposal := TMedicineDisposalRepository.Create();
   try
      iDisposalID := FMedicineDisposal.CreateMedicineDisposal(FDrugID,FDrugPurchID,FDisposeReason,
                                                              ceDisposalAmt.Value,
                                                              FQtyBeforeDeduct,Date,teComment.Text,
                                                              lcmboBatchNo.Text);
   except
   end;
   if ( iDisposalID > 0 ) then
      try
         FMedicinePurchRepos := TMedicinePurchaseRepository.Create();
         try
            FMedicinePurchRepos.UpdateMedPurchQtyRemaining(FDrugID,FDrugPurchID,ceDisposalAmt.Value,iDisposalID);
         finally
            FreeAndNil(FMedicinePurchRepos);
         end;

         FMedicineRepos.UpdateMedicineStock(0,FDrugID,-ceDisposalAmt.Value,False);
      except
      end;

   Close;
end;

procedure TfmMediDiposal.btnCancelClick(Sender: TObject);
begin
   Close;
end;

procedure TfmMediDiposal.lcmboBatchNoPropertiesChange(Sender: TObject);
begin
   FDrugPurchID := 0;
   if ( lcmboBatchNo.EditValue <> Null ) then
      FDrugPurchID := lcmboBatchNo.EditValue;
end;

procedure TfmMediDiposal.lcmboReasonForWastePropertiesChange(Sender: TObject);
begin
   FDisposeReason := 0;
   if ( lcmboReasonForWaste.EditValue <> Null ) then
      FDisposeReason := lcmboReasonForWaste.EditValue;
end;

procedure TfmMediDiposal.FormDestroy(Sender: TObject);
begin
   if ( FMedicineRepos <> nil ) then
      FreeAndNil(FMedicineRepos);
   if ( FMedicinePurchRepos <> nil ) then
      FreeAndNil(FMedicinePurchRepos);
   if ( FMedicineDisposal <> nil ) then
      FreeAndNil(FMedicineDisposal);
end;

end.
