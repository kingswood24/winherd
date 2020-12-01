{

  08/01/2009 V3.9 R5.6 /SP Additional Feature : Proc actSaveExecute - Default Animal To Pedigree if pedigree module present

  02/07/2010 [V4.0 R3.9] /MK Additional Feature - Import ElectronicID From PDAEvents to TransponderNo Field.  
}
unit uPDAAnimalPurch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uDBBaseForm, cxGridChartView, cxGridDBChartView, cxGridCardView,
  cxGridDBCardView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGrid, cxStyles,
  cxContainer, cxEdit, cxLookAndFeels, ActnList, dxBar, dxBarExtItems,
  dxStatusBar, cxLabel, cxTextEdit, cxDBEdit, cxGroupBox, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Db,
  dxmdaset, cxCalendar, cxPC, cxCurrencyEdit, uImageStore;

type
  TfmPDAAnimalPurch = class(TfmDBBaseForm)
    PageControl: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    dbeAnimalNumber: TcxDBTextEdit;
    dbeNationalIdentityNo: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    lcmbBreeds: TcxDBLookupComboBox;
    cmbSex: TcxDBComboBox;
    cxLabel3: TcxLabel;
    lcmbColours: TcxDBLookupComboBox;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    dbdeDOB: TcxDBDateEdit;
    cxLabel6: TcxLabel;
    lcmbHerdIdentity: TcxDBLookupComboBox;
    cxLabel7: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    cxLabel8: TcxLabel;
    lcmbSuppliers: TcxDBLookupComboBox;
    cxLabel9: TcxLabel;
    lcmbBuyers: TcxDBLookupComboBox;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    dbcePrice: TcxDBCurrencyEdit;
    dbteWeight: TcxDBTextEdit;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    dePurchDate: TcxDBDateEdit;
    procedure actExitExecute(Sender: TObject);
    procedure actHelpExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
    procedure actCancelUpdate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  protected
    FRecordPurch,
    FRemove : Boolean;
    FAnimalSaved : Boolean;
    procedure SetupControls;override;
  public
    { Public declarations }
    class function ShowForm(ADataSource : TDataSource;
         const ARecordPurch : Boolean = True) : Boolean;
  end;

const
   cSuccessfulSave = 'Animal details successfully saved.';
   cUnSuccessfulSave = 'Animal details not saved!';
var
  fmPDAAnimalPurch: TfmPDAAnimalPurch;

implementation

uses DairyData,
     EventRecording,
     GenTypesConst, Def;

{$R *.DFM}

{ TfmEditAnimal }

procedure TfmPDAAnimalPurch.SetupControls;
begin
   inherited SetupControls;
   dbeAnimalNumber.DataBinding.DataSource       := FormDataSource;
   dbeNationalIdentityNo.DataBinding.DataSource := FormDataSource;
   lcmbBreeds.Properties.ListSource             := WinData.BreedsSource;
   lcmbBreeds.DataBinding.DataSource            := FormDataSource;
   cmbSex.DataBinding.DataSource                := FormDataSource;
   lcmbColours.Properties.ListSource            := WinData.dsAnimalColours;
   lcmbColours.DataBinding.DataSource           := FormDataSource;
   dbdeDOB.DataBinding.DataSource               := FormDataSource;
   lcmbHerdIdentity.Properties.ListSource       := WinData.dsHerdDefaults;
   lcmbHerdIdentity.DataBinding.DataSource      := FormDataSource;
   lcmbSuppliers.Properties.ListSource          := WinData.dsSuppliers;
   lcmbSuppliers.DataBinding.DataSource         := FormDataSource;
   lcmbBuyers.Properties.ListSource             := WinData.dsBuyers;
   lcmbBuyers.DataBinding.DataSource            := FormDataSource;
   dbcePrice.DataBinding.DataSource             := FormDataSource;
   dbteWeight.DataBinding.DataSource            := FormDataSource;
   dePurchDate.DataBinding.DataSource           := FormDataSource;
end;

class function TfmPDAAnimalPurch.ShowForm(ADataSource : TDataSource;
  const ARecordPurch : Boolean) : Boolean;
begin
   with TfmPDAAnimalPurch.Create(nil) do
      try
         PageControl.ActivePageIndex := 0;
         FRemove := False;
         FRecordPurch := ARecordPurch;
         FAnimalSaved := False;
         FUpdateDBNavButtonStatus := False;

         FormDataSource := ADataSource;
         SetupControls;
         FormDataSource.Dataset.Edit;

         ShowModal;
         Result := FRemove;
         if not FRemove then
            FormDataSource.Dataset.Cancel;

      finally
         Free;
      end;
end;

procedure TfmPDAAnimalPurch.actExitExecute(Sender: TObject);
begin
  //
  inherited;
end;

procedure TfmPDAAnimalPurch.actHelpExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfmPDAAnimalPurch.actSaveExecute(Sender: TObject);
var
   NewAnimal : TAnimalRecord;
   EPurchase : TPurchaseEvent;
begin
   if FDataSource.DataSet.State in dsEditModes then inherited;

   NewAnimal := TAnimalRecord.Create;
   try
         NewAnimal.Add;
         NewAnimal.HerdID := FormDataSource.Dataset.FieldByName('HerdID').AsInteger;
         NewAnimal.NatIDNum := FormDataSource.Dataset.FieldByName('NationalID').AsString;
         NewAnimal.AnimalNo := FormDataSource.Dataset.FieldByName('AnimalNumber').AsString;
         NewAnimal.DateOfBirth := FormDataSource.Dataset.FieldByName('DateOfBirth').AsDateTime;
         NewAnimal.Sex := FormDataSource.Dataset.FieldByName('Sex').AsString;
         NewAnimal.LactNo := 0;
         NewAnimal.InHerd := True;
         NewAnimal.Breeding := False;
         NewAnimal.DamID  := 0;
         NewAnimal.SireID := 0;
         NewAnimal.AnimalDeleted := False;
         // 08/01/2009 V3.9 R5.6 /SP Default Animal To Pedigree if pedigree module present
         NewAnimal.Pedigree := Def.Definition.dUsePedigree;
         NewAnimal.TransponderNo := FormDataSource.Dataset.FieldByName('ElectronicID').AsString;

         if not VarIsNull(lcmbBreeds.EditValue) then
            NewAnimal.PrimaryBreed := lcmbBreeds.EditValue;
         if not VarIsNull(lcmbColours.EditValue) then
            NewAnimal.Colour := lcmbColours.EditValue;
         if not NewAnimal.Save then
            NewAnimal.Cancel
         else
            FRemove := True;

      if ( FRecordPurch ) and ( NewAnimal.AnimalSaved ) then
         begin
            EPurchase := TPurchaseEvent.Create('PDB');
            try
               EPurchase.Append;
               try
                  EPurchase.EventType := TPurchase;
                  EPurchase.AnimalID := NewAnimal.ID;
                  EPurchase.AnimalLactNo := NewAnimal.LactNo;
                  EPurchase.AnimalHerdID := NewAnimal.HerdID;
                  EPurchase.EventComment := FormDataSource.Dataset.FieldByName('Comment').AsString;
                  EPurchase.EventSource  := sPDA;
                  EPurchase.EventDate := FormDataSource.Dataset.FieldByName('Date').AsDateTime;
                  EPurchase.Weight := FormDataSource.Dataset.FieldByName('Weight').AsFloat;
                  EPurchase.Supplier := FormDataSource.Dataset.FieldByName('SupplierID').AsInteger;
                  EPurchase.Buyer := FormDataSource.Dataset.FieldByName('BuyerID').AsInteger;
                  EPurchase.Price := FormDataSource.Dataset.FieldByName('PurchasePrice').AsFloat;
                  EPurchase.LotNumber := FormDataSource.Dataset.FieldByName('Lot').AsString;
                  EPurchase.Post;
                  // update EventLookupData;
                  WinData.AddToEventLookupData( NewAnimal.ID, cPurchaseEvent);

                  MessageDlg(cSuccessfulSave,mtInformation,[mbOK],0);
                  FAnimalSaved := True;

                  Close; //
               except
                  EPurchase.Cancel;
               end;
            finally
               FreeAndNil(EPurchase);
            end;
         end
      else if ( NewAnimal.AnimalSaved ) then
         begin
            FAnimalSaved := True;
            MessageDlg(cSuccessfulSave,mtInformation,[mbOK],0);
         end;

   finally
      FreeAndNil(NewAnimal);
   end;
end;

procedure TfmPDAAnimalPurch.actCancelExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfmPDAAnimalPurch.actSaveUpdate(Sender: TObject);
begin
  inherited;
//
end;

procedure TfmPDAAnimalPurch.actCancelUpdate(Sender: TObject);
begin
  inherited;
//
end;

procedure TfmPDAAnimalPurch.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if not FAnimalSaved then
     CanClose := MessageDlg('Cancel without saving animal details, are you sure?',mtConfirmation,[mbYes,mbNO],0) = idYes;
end;

end.