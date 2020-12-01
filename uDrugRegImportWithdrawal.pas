{
   10/10/13 [V5.2 R3.3] /MK Additional Feature - Added N/A option.

   08/05/14 [V5.3 R0.0] /MK Additional Feature - Added Medicine Group to screen.

   14/11/14 [V5.3 R8.9] /MK Change - Changed Cancel to Resume Later - GL/SP Request.

   20/11/14 [V5.3 R8.9] /MK Change - Changed Skip to Ignore to imply to the user that the program is going to ignore this record
                                     instead of skipping over the record to come back to it later - GL/SP Request.

   17/12/14 [V5.4 R0.4] /MK Change - Changed FormCaption, form size and parent font size.
                                   - Added descriptive text to screen.

   21/01/15 [V5.4 R1.5] /MK Additional Feature - Allow an Existing Drug for a VPA Number that doesn't exist in the Medicine database
                                                 but the name of the drug exists in the Medicine database.
                            Change - Changed lInfo1 caption for better understanding of the new update features in this unit.

   24/09/15 [V5.4 R8.7] /MK Change - Moved the selecting of the existing drug before the adding of the new drug as it makes more sense - SP request.
                                   - ShowTheForm - Now that the update drug group box has been moved above New Drug form caption now shows drug name.
                                                 - Set the font colour to white for the component using the teal colour.

   26/04/16 [V5.5 R5.7] /MK Change - Moved the drug name to the top of the farm and increased the font size and colour - SP request.
                                   - Changed the caption of the form to include the number of new records to be imported.

   12/07/17 [V5.6 R9.2] /MK Bug Fix - cmboExistingDrugs had lost its list source so I have hard coded the list source as well as the key field and list field names - Noel Keane.                                                                                     
}

unit uDrugRegImportWithdrawal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxCurrencyEdit, StdCtrls, cxButtons, GenTypesConst,
  cxCheckBox, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, uHerdLookup, cxGroupBox, db, dbTables;

type            
  TfmDrugRegImportWithdrawal = class(TForm)
    pMainPanel: TPanel;
    gbInfo1: TcxGroupBox;
    lInfo1: TcxLabel;
    gbInfo2: TcxGroupBox;
    ceMilkWithdrawal: TcxCurrencyEdit;
    ceMeatWithdrawal: TcxCurrencyEdit;
    lMilk: TcxLabel;
    lMeat: TcxLabel;
    lWithdrawalDesc: TcxLabel;
    cbNotApplicable: TcxCheckBox;
    lInfo: TcxLabel;
    cmboMediGroup: TcxLookupComboBox;
    lGroup: TcxLabel;
    gbInfo3: TcxGroupBox;
    lInfo2: TcxLabel;
    gbExistingDrug: TcxGroupBox;
    cmboExistingDrugs: TcxLookupComboBox;
    gbConfirm: TcxGroupBox;
    btnProceed: TcxButton;
    btnSkip: TcxButton;
    btnAbort: TcxButton;
    btnClearSelect: TcxButton;
    lMedicineName: TcxLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ceMilkWithdrawalPropertiesChange(Sender: TObject);
    procedure ceMeatWithdrawalPropertiesChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ceMilkWithdrawalExit(Sender: TObject);
    procedure ceMeatWithdrawalExit(Sender: TObject);
    procedure cbNotApplicablePropertiesChange(Sender: TObject);
    procedure cmboMediGroupPropertiesEditValueChanged(Sender: TObject);
    procedure cmboExistingDrugsPropertiesChange(Sender: TObject);
    procedure btnClearSelectClick(Sender: TObject);
  private
    FHerdType : THerdType;
    function HasDecimal ( AValue : String ) : Boolean;
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowTheForm (AMedicineName, AWithdrawalStr : String; AHerdID : Integer;
                                 const AMedCount, ATotMedCount : Integer; var AMedicineID : Integer);
  end;

var
  fmDrugRegImportWithdrawal: TfmDrugRegImportWithdrawal;

implementation

{$R *.DFM}

{ TfmDrugRegImportWithdrawal }

class procedure TfmDrugRegImportWithdrawal.ShowTheForm(AMedicineName,
  AWithdrawalStr: String; AHerdID: Integer;
  const AMedCount, ATotMedCount : Integer;
  var AMedicineID : Integer);
begin
   with TfmDrugRegImportWithdrawal.Create(nil) do
      try
         FHerdType := HerdLookup.GetHerdType(AHerdID);
         HerdLookup.FWithdrawalRec.MilkWithdrawal := 0;
         HerdLookup.FWithdrawalRec.MeatWithdrawal := 0;
         ceMilkWithdrawal.Properties.ReadOnly := False;
         ceMeatWithdrawal.Properties.ReadOnly := False;

         //   24/09/15 [V5.4 R8.7] /MK Change - Set the font colour to white for the component using the teal colour.
         if ( FHerdType = htDairy ) then
            begin
               ceMilkWithdrawal.Style.Color := clTeal;
               ceMilkWithdrawal.Style.Font.Color := clWhite;
               ceMeatWithdrawal.Style.Color := clWhite;
               ceMeatWithdrawal.Style.Font.Color := clBlack;
            end
         else if ( FHerdType in [htSuckler, htBeef] ) then
            begin
               ceMeatWithdrawal.Style.Color := clTeal;
               ceMeatWithdrawal.Style.Font.Color := clWhite;
               ceMilkWithdrawal.Style.Color := clWhite;
               ceMilkWithdrawal.Style.Font.Color := clBlack;
            end;

         //   24/09/15 [V5.4 R8.7] /MK Change - Now that the update drug group box has been moved aboved New Drug form caption now shows drug name.
         lMedicineName.Caption := AMedicineName;
         Caption := Caption + ' - ('+IntToStr(AMedCount)+' of '+IntToStr(ATotMedCount)+')';
         lWithdrawalDesc.Caption := AWithdrawalStr;
         btnClearSelect.Visible := False;
         ShowModal;
      finally
         if ( cmboExistingDrugs.EditValue <> Null ) and ( not(cmboExistingDrugs.EditValue = 0) ) then
            AMedicineID := cmboExistingDrugs.EditValue;
         Free;
      end;
end;

procedure TfmDrugRegImportWithdrawal.FormActivate(Sender: TObject);
begin
   if ( FHerdType = htDairy ) then
      ceMilkWithdrawal.SetFocus
   else if ( FHerdType in [htSuckler, htBeef] ) then
      ceMeatWithdrawal.SetFocus;
   if ( not(HerdLookup.qDrugList.Active) ) then
      HerdLookup.qDrugList.Open;
   cmboExistingDrugs.Properties.ListSource := HerdLookup.dsDrugList;
   cmboExistingDrugs.Properties.KeyFieldNames := 'ID';
   cmboExistingDrugs.Properties.ListFieldNames := 'Name';
end;

procedure TfmDrugRegImportWithdrawal.ceMilkWithdrawalPropertiesChange(
  Sender: TObject);
begin
   ceMilkWithdrawal.PostEditValue;
   if ( ceMilkWithdrawal.EditValue >= 0 ) then
      HerdLookup.FWithdrawalRec.MilkWithdrawal := ceMilkWithdrawal.EditValue;
end;

procedure TfmDrugRegImportWithdrawal.ceMeatWithdrawalPropertiesChange(
  Sender: TObject);
begin
   ceMeatWithdrawal.PostEditValue;
   if ( ceMeatWithdrawal.EditValue >= 0 ) then
      HerdLookup.FWithdrawalRec.MeatWithdrawal := ceMeatWithdrawal.EditValue;
end;

function TfmDrugRegImportWithdrawal.HasDecimal(AValue: String): Boolean;
var
   i : Integer;
begin
   if ( AValue = Null ) then Exit;
   Result := False;
   for i := 0 to Length(AValue) do
      begin
         if AValue[i] = '.' then
            begin
               Result := True;
               Break;
            end;
      end;
end;

procedure TfmDrugRegImportWithdrawal.ceMilkWithdrawalExit(Sender: TObject);
var
   NewValue : String;
   NewWithdrawal : Integer;
begin
   if ( not(ceMilkWithdrawal.EditValue = Null) ) then
      if ( HasDecimal(FloatToStr(ceMilkWithdrawal.EditValue)) ) then
         begin
            MessageDlg('Decimal values will be rounded up to next withdrawal period.',mtWarning,[mbOK],0);
            NewValue := Copy(FloatToStr(ceMilkWithdrawal.EditValue),0,Length(FloatToStr(ceMilkWithdrawal.EditValue))-2);
            NewWithdrawal := StrToInt(NewValue);
            Inc(NewWithdrawal);
            HerdLookup.FWithdrawalRec.MilkWithdrawal := NewWithdrawal;
         end;
end;

procedure TfmDrugRegImportWithdrawal.ceMeatWithdrawalExit(Sender: TObject);
var
   NewValue : String;
   NewWithdrawal : Integer;
begin
   if ( not(ceMeatWithdrawal.EditValue = Null) ) then
      if ( HasDecimal(FloatToStr(ceMeatWithdrawal.EditValue)) ) then
         begin
            MessageDlg('Decimal values will be rounded up to next withdrawal period.',mtWarning,[mbOK],0);
            NewValue := Copy(FloatToStr(ceMeatWithdrawal.EditValue),0,Length(FloatToStr(ceMeatWithdrawal.EditValue))-2);
            NewWithdrawal := StrToInt(NewValue);
            Inc(NewWithdrawal);
            HerdLookup.FWithdrawalRec.MeatWithdrawal := NewWithdrawal;
         end;
end;

procedure TfmDrugRegImportWithdrawal.cbNotApplicablePropertiesChange(Sender: TObject);
begin
   ceMilkWithdrawal.Properties.ReadOnly := cbNotApplicable.Checked;
   ceMeatWithdrawal.Properties.ReadOnly := cbNotApplicable.Checked;
   HerdLookup.FWithdrawalRec.N_A_Drug := cbNotApplicable.Checked;
   if ( cbNotApplicable.Checked ) then
      begin
         if ( FHerdType in [htDairy, htSuckler] ) then
            HerdLookup.FWithdrawalRec.MilkWithdrawal := 9999
         else
            HerdLookup.FWithdrawalRec.MeatWithdrawal := 9999;
      end;
end;

procedure TfmDrugRegImportWithdrawal.cmboMediGroupPropertiesEditValueChanged(
  Sender: TObject);
begin
   if ( cmboMediGroup.EditValue >= 0 ) then
      HerdLookup.FWithdrawalRec.MediGroup := cmboMediGroup.EditValue;
end;

procedure TfmDrugRegImportWithdrawal.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if ( HerdLookup.qDrugList.Active ) then
      HerdLookup.qDrugList.Close;

   {
   HerdLookup.FWithdrawalRec.CancelImport := ( ModalResult = mrCancel );
   HerdLookup.FWithdrawalRec.AbortImport := ( ModalResult = mrAbort );
   }

   if ( ModalResult = mrOK ) then
      begin
         CanClose := ( cmboExistingDrugs.EditValue > 0 );
         if ( not(CanClose) ) then
            begin
               if ( not(cbNotApplicable.Checked) ) then
                  begin
                     if ( FHerdType = htDairy ) then
                        begin
                           CanClose := ( ceMilkWithdrawal.EditValue >= 0 );
                           if ( not(CanClose) ) then
                              begin
                                 MessageDlg('Milk Withdrawal Period must be specified'+cCRLF+
                                            'or "N/A" box must be ticked.',mtError,[mbOK],0);
                                 SysUtils.Abort;
                              end;
                        end
                     else if ( FHerdType in [htSuckler, htBeef] ) then
                        begin
                           CanClose := ( ceMeatWithdrawal.EditValue >= 0 );
                           if ( not(CanClose) ) then
                              begin
                                 MessageDlg('Meat Withdrawal Period must be specified'+cCRLF+
                                            'or "N/A" box must be ticked.',mtError,[mbOK],0);
                                 SysUtils.Abort;
                              end;
                        end;
                  end;
               CanClose := ( cmboMediGroup.EditValue > 0 );
               if ( not(CanClose) ) then
                  begin
                     MessageDlg('Group must be specified.',mtError,[mbOK],0);
                     SysUtils.Abort;
                  end;
            end;
      end;
end;

procedure TfmDrugRegImportWithdrawal.cmboExistingDrugsPropertiesChange(
  Sender: TObject);
begin
   cmboExistingDrugs.PostEditValue;
   btnClearSelect.Visible := ( not(cmboExistingDrugs.EditValue = Null) ) and ( not(cmboExistingDrugs.EditValue = 0) );
end;

procedure TfmDrugRegImportWithdrawal.btnClearSelectClick(Sender: TObject);
begin
   cmboExistingDrugs.EditValue := Null;
   btnClearSelect.Visible := False;
end;

end.
