{
   20/03/15 [V5.4 R3.4] /MK Additional Feature - New procedure UpdateMedicineStock created to update quantity
                                                 and new price of medicine.

   31/03/15 [V5.4 R2.2] /MK Change - UpdateMedicineStock - If no purch unit for medicine then set multiplier to 1.

   30/05/19 [V5.8 R9.3] /MK Change - New function and record created to GetMedicineInfo.

   31/05/19 [V5.8 R9.3] /MK Change - UpdateMedicineStock - New parameter added for AAllowMinus which is defaulted to True.
                                                         - If this parameter is false then set Medicine StockLevel to zero if StockLevel +- AQuantity = Zero.
}

unit uMedicineRepository;

interface
uses
   Classes, db, dbTables, uKingswoodRepository, SysUtils, Dialogs;

type
   TMedicineRecord = record
      Name,
      VPANo : String;
   end;

   TMedicineRepository = class(TKingswoodRepository)
   private
      function GetUniqueCode : string;
   public
      function CreateMedicine(AName : string; AVPANumber : string) : Integer;
      function GetMedicineId(AVPANumber : string) : Integer;
      procedure SetMedicineInUseStatus(const AMedicineId : Integer; const AInUse : Boolean);
      procedure UpdateMedicineStock(const ANewCost : Double; AMedicineID: Integer; AQuantity: Double; const AAllowMinus : Boolean = True);
      function GetMedicineInfo(ADrugID : Integer) : TMedicineRecord;
   end;

implementation
uses
   KRoutines;
{ TMedicinePurchaseRepository }

function TMedicineRepository.CreateMedicine(AName,
  AVPANumber: string): Integer;
var
   UniqueCode : string;
begin
   Result := 0;

   UniqueCode := GetUniqueCode;

   FQuery.SQL.Clear;
   FQuery.SQL.Add('INSERT INTO Medicine (Name, DrugCode, VPANo, InUse) ');
   FQuery.SQL.Add('VALUES (:Name, :DrugCode, :VPANumber, :InUse) ');
   FQuery.Params[0].AsString := AName;
   FQuery.Params[1].AsString := UniqueCode;
   FQuery.Params[2].AsString := AVPANumber;
   FQuery.Params[3].AsBoolean := True;
   try
      FQuery.ExecSQL;

      Result := GetMedicineId(AVPANumber);
   except
   end;
end;

function TMedicineRepository.GetMedicineId(
  AVPANumber: string): Integer;
begin
   FQuery.SQL.Clear;
   FQuery.SQL.Add('SELECT Id FROM Medicine');
   FQuery.SQL.Add('WHERE (UPPER(VPANo) = :AVPANumber) ');
   FQuery.Params[0].AsString := UPPERCASE(AVPANumber);
   FQuery.Open;
   try
      FQuery.First;
      Result := FQuery.Fields[0].AsInteger;
   finally
      FQuery.Close;
   end;
end;

function TMedicineRepository.GetMedicineInfo(ADrugID: Integer): TMedicineRecord;
begin
   Result.Name := '';
   Result.VPANo := '';

   FQuery.Close;
   FQuery.SQL.Clear;
   FQuery.SQL.Add('SELECT M.Name, M.VPANo');
   FQuery.SQL.Add('FROM Medicine M');
   FQuery.SQL.Add('WHERE M.ID = :AMedID');
   FQuery.Params[0].AsInteger := ADrugID;
   FQuery.Open;
   if ( FQuery.RecordCount > 0 ) then
      begin
         FQuery.First;
         Result.Name := FQuery.FieldByName('Name').AsString;
         Result.VPANo := FQuery.FieldByName('VPANo').AsString;
      end;
end;

function TMedicineRepository.GetUniqueCode: string;
begin
   FQuery.SQL.Clear;
   FQuery.SQL.Add('SELECT Max(Id)+1000 FROM Medicine');
   FQuery.Open;
   try
      FQuery.First;
      Result := IntToStr(FQuery.Fields[0].AsInteger);
   finally
      FQuery.Close;
   end;
end;

procedure TMedicineRepository.SetMedicineInUseStatus(
  const AMedicineId: Integer; const AInUse: Boolean);
begin
   FQuery.SQL.Clear;
   FQuery.SQL.Add('UPDATE Medicine');
   FQuery.SQL.Add('SET InUse=:AInUse');
   FQuery.SQL.Add('WHERE (Id =:AMedicineId)');
   FQuery.Params[0].AsBoolean := AInUse;
   FQuery.Params[1].AsInteger := AMedicineId;
   try
      FQuery.ExecSQL;
   except
      //
   end;
end;

procedure TMedicineRepository.UpdateMedicineStock( const ANewCost : Double;
   AMedicineID : Integer; AQuantity : Double; const AAllowMinus : Boolean = True);
var
   iPurchUnitID : Integer;
   flPurchUnit,
   flQuantityInStock,
   flStockLevel,
   flRateOfApplic,
   flOldCost : Double;
begin
   if ( AMedicineID = 0 ) then Exit;
   if ( AQuantity = 0 ) then
      AQuantity := 1;

   with FQuery do
      try
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM Medicine');
         SQL.Add('WHERE ID = '+IntToStr(AMedicineID)+'');
         try
            Open;
            if ( RecordCount = 0 ) then Exit;
            iPurchUnitID := FieldByName('PurchUnit').AsInteger;
            //   31/03/15 [V5.4 R2.2] /MK Change - If no purch unit for medicine then set multiplier to 1.
            if ( iPurchUnitID = 0 ) then
               flPurchUnit := 1;
            if ( FieldByName('StockLevel').Value ) = Null or ( FieldByName('StockLevel').AsFloat = 0 ) then
               flStockLevel := 0
            else
               flStockLevel := FieldByName('StockLevel').AsFloat;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;

         if ( iPurchUnitID > 0 ) then
            begin
               SQL.Clear;
               SQL.Add('SELECT Multiplier');
               SQL.Add('FROM Units');
               SQL.Add('WHERE ID = '+IntToStr(iPurchUnitID)+'');
               try
                  Open;
                  if ( RecordCount = 0 )then Exit;
                  flPurchUnit := Fields[0].AsFloat;
                  if ( flPurchUnit = 0 ) then Exit;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
            end;

         flStockLevel := flStockLevel + AQuantity;
         //   31/05/19 [V5.8 R9.3] /MK Change - New parameter added for AAllowMinus which is defaulted to True.
         //                                   - If this parameter is false then set Medicine StockLevel to zero if StockLevel +- AQuantity = Zero.
         if ( (not(AAllowMinus)) and (flStockLevel <= 0) ) then
            flStockLevel := 0;
         flQuantityInStock := flStockLevel / flPurchUnit;
         SQL.Clear;
         SQL.Add('UPDATE Medicine');
         SQL.Add('SET StockLevel = '+FloatToStr(flStockLevel)+', QuantityInStock = '+FloatToStr(flQuantityInStock)+'');
         SQL.Add('WHERE ID = '+IntToStr(AMedicineID)+'');
         try
            ExecSQL;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;

         SQL.Clear;
         SQL.Add('SELECT CostPurchUnit');
         SQL.Add('FROM Medicine');
         SQL.Add('WHERE ID = '+IntToStr(AMedicineID)+'');
         try
            Open;
            if ( Fields[0].Value <> Null ) then
               flOldCost := Fields[0].AsFloat;
            Close;
            if ( ANewCost <> 0 ) And ( flOldCost <> ANewCost ) then
               begin
                  SQL.Clear;
                  SQL.Add('UPDATE Medicine');
                  SQL.Add('SET CostPurchUnit = '+FloatToStr(ANewCost)+'');
                  SQL.Add('WHERE ID = '+IntToStr(AMedicineID)+'');
                  try
                     ExecSQL;
                  except
                     on e : Exception do
                        ShowMessage(e.Message);
                  end;
               end;
         except
            on e : Exception do
               ShowMessage(e.Message);
         end;

      finally
      end;
end;

end.
