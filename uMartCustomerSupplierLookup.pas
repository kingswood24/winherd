unit uMartCustomerSupplierLookup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cxControls, cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Db, DBTables, cxDBEditRepository, uMartImportTypes,
  cxGroupBox,cxLookupDBGrid, cxCustomData;

type
  TIntArray = array of Integer;
  TfmMartCustomerSupplierLookup = class(TForm)
    lAnimalTag: TcxLabel;
    lEventDateType: TcxLabel;
    cxLabel2: TcxLabel;
    lEventDate: TcxLabel;
    lRefCodeType: TcxLabel;
    lRefCode: TcxLabel;
    cxLabel3: TcxLabel;
    LookupList: TcxLookupComboBox;
    btnCancel: TcxButton;
    btnSelect: TcxButton;
    cxLabel1: TcxLabel;
    lMainCaption: TcxLabel;
    btnAddSupplierOrCustomer: TcxButton;
    gbAPHISList: TcxGroupBox;
    lName: TcxLabel;
    lCode: TcxLabel;
    btnAddFromAPHIS: TcxButton;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    procedure cxLookupComboBox1PropertiesEditValueChanged(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure btnAddSupplierOrCustomerClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddFromAPHISClick(Sender: TObject);
  private
    { Private declarations }
    FRefCode : string;
    FResult : Integer;
    FLookupType : TLookupType;
    QuerySupplierCustomer : TQuery;
    dsQuerySupplierCustomer : TDataSource;
    APHISQuerySupplierCustomer : TQuery;
    procedure OpenSupplierCustomersSource;
  public
    { Public declarations }
    class function GetID(LookupType : TLookupType;
       ARefCode, AnimalTag: String; EventDate : TDateTime; const AADP : Boolean = False): Integer;
  end;

var
  fmMartCustomerSupplierLookup: TfmMartCustomerSupplierLookup;
  RefCodeTable : TTable;
  FADP : Boolean;
  LookupAPHISDefinedList : Boolean;

const
   LCaption1 = 'Select the %s from the list below which corresponds to the code above.';
   LCaption2 = 'NOTE: If you do not wish to select a %s at this time you must edit this event and enter the appropriate details.';


implementation

uses uSuppliers, uCustomers, DairyData, uHerdLookup, GenTypesConst, kRoutines;

{$R *.DFM}

{ TfmMartCustomerSupplierLookup }

class function TfmMartCustomerSupplierLookup.GetID(LookupType: TLookupType;
  ARefCode, AnimalTag: String; EventDate: TDateTime; const AADP : Boolean = False): Integer;
var
   SupplierCustomers : array of Integer;
   cxLookupDBGridColumn : TcxLookupDBGridColumn;
begin
   FADP := AADP;
   LookupAPHISDefinedList := False;

   RefCodeTable := TTable.Create(nil);
   try
      RefCodeTable.DatabaseName := AliasName;
      with RefCodeTable do
         begin
            TableName := 'NIRefCodes';
            if not exists then
               begin
                  with FieldDefs do
                     begin
                        Add('RefCode',ftString,20);
                        Add('SupplierID',ftInteger);
                        Add('CustomerID',ftInteger);
                     end;
                  CreateTable;
               end;
            Open;
         end;

   LookupAPHISDefinedList := FileExists(IncludeTrailingBackslash(DataPath)+'supplierslookup.DB');
   if not FADP then
      begin
         if not RefCodeTable.Locate('RefCode', ARefCode, [loCaseInsensitive]) then
            begin
               RefCodeTable.Append;
               RefCodeTable.FieldByName('RefCode').AsString := ARefCode;
               RefCodeTable.Post;
            end
         else
            begin

               if LookupType = lkCustomer then
                  begin
                     if RefCodeTable.FieldByName('CustomerID').AsInteger > 0 then
                        begin
                           Result := RefCodeTable.FieldByName('CustomerID').AsInteger;
                           Exit;
                        end;
                  end
               else
                  begin
                     if RefCodeTable.FieldByName('SupplierID').AsInteger > 0 then
                        begin
                           Result := RefCodeTable.FieldByName('SupplierID').AsInteger;
                           Exit;
                        end;
                  end;
            end;
      end
   else
      begin
         try
            WinData.Customers.Filter := 'AuthorisedDisposalPlace';
            WinData.Customers.Filtered := True;
         except
            on e:exception do
               raise Exception.Create(E.Message);
         end;
      end;

   Application.CreateForm(TfmMartCustomerSupplierLookup, fmMartCustomerSupplierLookup);
   with fmMartCustomerSupplierLookup do
      begin
         gbAPHISList.Visible := LookupAPHISDefinedList;
         FRefCode := ARefCode;
         FLookupType := LookupType;
         lRefCode.Caption := ARefCode;
         lAnimalTag.Caption := AnimalTag;
         lEventDate.Caption := FormatDateTime('dd/mm/yyyy', EventDate);
         OpenSupplierCustomersSource;

         if LookupType = lkCustomer then
            begin
               lMainCaption.Caption := 'CUSTOMER NOT DETECTED IN DATABASE';
               lEventDateType.Caption := 'Sale Date:';
               lRefCodeType.Caption := 'Customer Code';
               gbAPHISList.Caption := 'APHIS Customer Listing';
               HerdLookup.erCustomerLookup.Properties.ListSource := dsQuerySupplierCustomer;
               HerdLookup.erCustomerLookup.Properties.KeyFieldNames := 'ID';
               HerdLookup.erCustomerLookup.Properties.ListFieldNames := 'Name';
               cxLookupDBGridColumn := HerdLookup.erCustomerLookup.Properties.ListColumns.ColumnByFieldName('Name');
               if cxLookupDBGridColumn <> nil then
                  begin
                     cxLookupDBGridColumn.Sorting := True;
                     cxLookupDBGridColumn.SortOrder := soAscending;
                  end;

               LookupList.RepositoryItem :=  HerdLookup.erCustomerLookup;
               cxLabel3.Caption := Format(LCaption1,['customer']);
               cxLabel1.Caption := Format(LCaption2,['customer']);
            end
         else if LookupType = lkSupplier then
            begin
               lMainCaption.Caption := 'SUPPLIER NOT DETECTED IN DATABASE';
               lEventDateType.Caption := 'Purchase Date:';
               lRefCodeType.Caption := 'Supplier Code';
               gbAPHISList.Caption := 'APHIS Supplier Listing';
               HerdLookup.erSupplierLookup.Properties.ListSource := dsQuerySupplierCustomer;
               HerdLookup.erSupplierLookup.Properties.KeyFieldNames := 'ID';
               HerdLookup.erSupplierLookup.Properties.ListFieldNames := 'Name';
               cxLookupDBGridColumn := HerdLookup.erSupplierLookup.Properties.ListColumns.ColumnByFieldName('Name');
               if cxLookupDBGridColumn <> nil then
                  begin
                     cxLookupDBGridColumn.Sorting := True;
                     cxLookupDBGridColumn.SortOrder := soAscending;
                  end;
               LookupList.RepositoryItem :=  HerdLookup.erSupplierLookup;
               cxLabel3.Caption := Format(LCaption1,['supplier']);
               cxLabel1.Caption := Format(LCaption2,['supplier']);
            end
         else
            begin
               lMainCaption.Caption := '';
               lEventDateType.Caption :='';
               lRefCode.Caption := '';
               raise Exception.Create('An unexpected error has occurred.');
            end;


         ShowModal;
         Result := FResult;
      end;
   finally
      RefCodeTable.Close;
      FreeAndNil(RefCodeTable);
      FreeAndNil(fmMartCustomerSupplierLookup);
   end;
end;

procedure TfmMartCustomerSupplierLookup.cxLookupComboBox1PropertiesEditValueChanged(
  Sender: TObject);
begin
   btnSelect.Default := LookupList.EditValue <> null;
   btnCancel.Default := LookupList.EditValue = null;
end;

procedure TfmMartCustomerSupplierLookup.btnSelectClick(Sender: TObject);
begin
   if LookupList.EditValue <> null then
      begin
         if not FADP then
            begin
               if FLookupType = lkCustomer then
                  begin
                     if RefCodeTable.FieldByName('CustomerID').AsInteger <= 0 then
                        begin
                           RefCodeTable.Edit;
                           RefCodeTable.FieldByName('CustomerID').AsInteger := LookupList.EditValue;
                           RefCodeTable.Post;
                           FResult := RefCodeTable.FieldByName('CustomerID').AsInteger;
                        end
                     else
                        FResult := RefCodeTable.FieldByName('CustomerID').AsInteger;
                  end
               else
                  begin
                     if RefCodeTable.FieldByName('SupplierID').AsInteger <= 0 then
                        begin
                           RefCodeTable.Edit;
                           RefCodeTable.FieldByName('SupplierID').AsInteger := LookupList.EditValue;
                           RefCodeTable.Post;
                           FResult := RefCodeTable.FieldByName('SupplierID').AsInteger;
                        end
                     else
                        FResult := RefCodeTable.FieldByName('SupplierID').AsInteger;
                end;
            end
         else
            FResult := LookupList.EditValue;
      end;
end;

procedure TfmMartCustomerSupplierLookup.btnAddSupplierOrCustomerClick(
  Sender: TObject);
var
   ID : Integer;
begin
   if FLookupType = lkCustomer then
      begin
         uCustomers.ShowTheForm(True,ID);
      end
   else
      begin
         uSuppliers.ShowTheForm(True,ID);
      end;
   OpenSupplierCustomersSource;
   if ID > 0 then
      LookupList.EditValue := ID;
end;

procedure TfmMartCustomerSupplierLookup.FormDestroy(Sender: TObject);
begin
   if QuerySupplierCustomer <> nil then
      begin
         Close;
         FreeAndNil(QuerySupplierCustomer);
      end;

   if APHISQuerySupplierCustomer <> nil then
      begin
         Close;
         FreeAndNil(APHISQuerySupplierCustomer);
      end;

   if dsQuerySupplierCustomer <> nil then
      begin
         FreeAndNil(dsQuerySupplierCustomer);
      end;

   if WinData.Customers.Filtered then
      begin
         WinData.Customers.Filter := '';
         WinData.Customers.Filtered := False;
      end;
   HerdLookup.erCustomerLookup.Properties.ListSource := WinData.dsCustomers;
   HerdLookup.erSupplierLookup.Properties.ListSource := WinData.dsSuppliers;
end;

procedure TfmMartCustomerSupplierLookup.OpenSupplierCustomersSource;
var
   nPos : Integer;
   Result : TIntArray;
   SQLFilter : string;
begin
   // The purpose of this routine is to exclude any previously supplier/customers
   // that have already been matched by the user. This will eliminate
   // most of the supplier/customers that do not need to be displayed on the dropdown list.
   QuerySupplierCustomer.Active := False;
   SetLength(Result, 0);
   nPos := 0;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;

         if (FLookupType = lkSupplier) then
            begin

               SQL.Add('Select ID From SuppliersBreeders Where Not ID in (Select SupplierID From NIRefCodes)');
               Open;
               try
                  First;
                  SetLength(Result, RecordCount);
                  while not eof do
                     begin
                        Result[nPos] := FieldByName('ID').AsInteger;
                        Inc(nPos);
                        Next;
                     end;
               finally
                  Close;
               end;
               SQLFilter := IntArrayToSQLInString(Result);
               QuerySupplierCustomer.SQL.Text := 'Select ID, Name From SuppliersBreeders Where ID in '+ SQLFilter;
            end
         else
            begin

               SQL.Add('Select ID From Customers Where Not ID in (Select CustomerID From NIRefCodes)');
               Open;
               try
                  First;
                  SetLength(Result, RecordCount);
                  while not eof do
                     begin
                        Result[nPos] := FieldByName('ID').AsInteger;
                        Inc(nPos);
                        Next;
                     end;
               finally
                  Close;
               end;

               SQLFilter := IntArrayToSQLInString(Result);
               QuerySupplierCustomer.SQL.Text := 'Select ID, Name From Customers Where ID in '+ SQLFilter;
            end;
      finally
         Free;
         QuerySupplierCustomer.Active := True;
      end;

   if LookupAPHISDefinedList then
      begin
         APHISQuerySupplierCustomer.SQL.Text := Format('Select * From supplierslookup WHERE Code = "%s"', [FRefCode] );
         APHISQuerySupplierCustomer.Active := True;
         if (APHISQuerySupplierCustomer.RecordCount > 0) then
            begin
               APHISQuerySupplierCustomer.First;
               btnAddFromAPHIS.Enabled := True;
               lCode.Caption := APHISQuerySupplierCustomer.FieldByName('Code').AsString;
               lName.Caption := APHISQuerySupplierCustomer.FieldByName('Name').AsString;
            end;
      end;

end;

procedure TfmMartCustomerSupplierLookup.FormCreate(Sender: TObject);
begin
   btnAddFromAPHIS.Enabled := False;
   lCode.Caption := '';
   lName.Caption := '';
   
   QuerySupplierCustomer := TQuery.Create(nil);
   QuerySupplierCustomer.DatabaseName := AliasName;

   if LookupAPHISDefinedList then
      begin
         APHISQuerySupplierCustomer := TQuery.Create(nil);
         APHISQuerySupplierCustomer.DatabaseName := AliasName;
      end;

   dsQuerySupplierCustomer := TDataSource.Create(nil);
   dsQuerySupplierCustomer.DataSet := QuerySupplierCustomer;

end;

procedure TfmMartCustomerSupplierLookup.btnAddFromAPHISClick(
  Sender: TObject);
begin

   if (FLookupType = lkSupplier) then
      begin
         Windata.Suppliers.Append;
         Windata.Suppliers.FieldByName('Name').AsString := APHISQuerySupplierCustomer.FieldByName('Name').AsString;
         Windata.Suppliers.FieldByName('Address 1').asString := APHISQuerySupplierCustomer.FieldByName('Address1').AsString;
         Windata.Suppliers.FieldByName('Address 2').asString := APHISQuerySupplierCustomer.FieldByName('Address2').AsString;
         Windata.Suppliers.FieldByName('Address 3').asString := APHISQuerySupplierCustomer.FieldByName('Address3').AsString;
         Windata.Suppliers.FieldByName('Address 4').asString := APHISQuerySupplierCustomer.FieldByName('Address4').AsString;
         Windata.Suppliers.Post;

         if RefCodeTable.FieldByName('SupplierID').AsInteger <= 0 then
            begin
               RefCodeTable.Edit;
               RefCodeTable.FieldByName('SupplierID').AsInteger := Windata.Suppliers.FieldByName('ID').AsInteger;
               RefCodeTable.Post;
               FResult := RefCodeTable.FieldByName('SupplierID').AsInteger;
            end
         else
            FResult := RefCodeTable.FieldByName('SupplierID').AsInteger;

      end
   else
      begin
         Windata.Customers.Append;
         Windata.Customers.FieldByName('Name').asString := APHISQuerySupplierCustomer.FieldByName('Name').AsString;
         Windata.Customers.FieldByName('Address 1').asString := APHISQuerySupplierCustomer.FieldByName('Address1').AsString;
         Windata.Customers.FieldByName('Address 2').asString := APHISQuerySupplierCustomer.FieldByName('Address2').AsString;
         Windata.Customers.FieldByName('Address 3').asString := APHISQuerySupplierCustomer.FieldByName('Address3').AsString;
         Windata.Customers.FieldByName('Address 4').asString := APHISQuerySupplierCustomer.FieldByName('Address4').AsString;
         Windata.Customers.Post;

         if RefCodeTable.FieldByName('CustomerID').AsInteger <= 0 then
            begin
               RefCodeTable.Edit;
               RefCodeTable.FieldByName('CustomerID').AsInteger := Windata.Customers.FieldByName('ID').AsInteger;
               RefCodeTable.Post;
               FResult := RefCodeTable.FieldByName('CustomerID').AsInteger;
            end
         else
            FResult := RefCodeTable.FieldByName('CustomerID').AsInteger;
      end;
   Close;
end;

end.
