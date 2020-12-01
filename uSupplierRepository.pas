unit uSupplierRepository;

interface
uses
   Classes, db, dbTables, uKingswoodRepository, SysUtils, Dialogs;

type
   TSupplierRepository = class(TKingswoodRepository)
   private
   public
     function GetSupplier(const ABTEHerdNo : string) : Integer;
     function CreateSupplier(const AName, ABTEHerdNo, AAddress1, AAddress2, AAddress3,
         AAddress4, AAddress5, APhone, AFax, AEmail : string;
         ALicensed : Boolean) : Integer;
   end;

implementation

{ TSupplierRepository }

function TSupplierRepository.CreateSupplier(const AName, ABTEHerdNo,
  AAddress1, AAddress2, AAddress3, AAddress4, AAddress5, APhone, AFax,
  AEmail: string; ALicensed: Boolean): Integer;
begin
   Result := 0;

   if (Length(Trim(ABTEHerdNo))=0) then
      raise Exception.Create('BTE Herd Number must be filled');

   Result := GetSupplier(ABTEHerdNo);
   if (Result>0) then Exit;

   FQuery.SQL.Clear;
   FQuery.SQL.Add('INSERT INTO SuppliersBreeders (Name, BTEHerdNo, ');
   FQuery.SQL.Add('  SuppliersBreeders."Address 1", SuppliersBreeders."Address 2", ');
   FQuery.SQL.Add('  SuppliersBreeders."Address 3", SuppliersBreeders."Address 4",  ');
   FQuery.SQL.Add('  SuppliersBreeders."Address 5", Phone, Fax, SuppliersBreeders."E-Mail", AnimalSupplier,');
   FQuery.SQL.Add('  IsSynchronized, InUse) ');
   FQuery.SQL.Add('VALUES (:Name, :BTEHerdNo, :Address1, :Address2, ');
   FQuery.SQL.Add('  :Address3, :Address4, :Address5, :Phone, :Fax, :EMail, :AnimalSupplier,');
   FQuery.SQL.Add('  :IsSynchronized, :InUse) ');
   FQuery.Params[0].AsString := AName;
   FQuery.Params[1].AsString := ABTEHerdNo;
   FQuery.Params[2].AsString := AAddress1;
   FQuery.Params[3].AsString := AAddress2;
   FQuery.Params[4].AsString := AAddress3;
   FQuery.Params[5].AsString := AAddress4;
   FQuery.Params[6].AsString := AAddress5;
   FQuery.Params[7].AsString := APhone;
   FQuery.Params[8].AsString := AFax;
   FQuery.Params[9].AsString := AEmail;
   FQuery.Params[10].AsBoolean := ALicensed;
   FQuery.Params[11].AsBoolean := False;
   FQuery.Params[12].AsBoolean := True;
   FQuery.ExecSQL;

   Result := GetSupplier(ABTEHerdNo);
end;

function TSupplierRepository.GetSupplier(
  const ABTEHerdNo: string): Integer;
begin
   Result := 0;
   if (Length(Trim(ABTEHerdNo))=0) then Exit;

   FQuery.SQL.Clear;
   FQuery.SQL.Add('SELECT Id FROM SuppliersBreeders');
   FQuery.SQL.Add('WHERE (UPPER(TRIM(BTEHerdNo)) = :ABTEHerdNo)');
   FQuery.Params[0].AsString := UpperCase(Trim(ABTEHerdNo));
   FQuery.Open;
   try
      FQuery.First;
      Result := FQuery.Fields[0].AsInteger;
   finally
      FQuery.Close;
   end;
end;

end.
 