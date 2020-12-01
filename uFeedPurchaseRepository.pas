{
   Released 22/03/16 [V5.5 R4.5] SP

   25/06/19 [V5.8 R9.6] /MK Change - CreateMedicinePurchase - Added EventSource as a variable to be passed in.
                                                            - Default IsSynchronized to False.
}

unit uFeedPurchaseRepository;

interface
uses
   Classes, db, dbTables, uKingswoodRepository, SysUtils, Dialogs;

type
   TFeedPurchaseRepository = class(TKingswoodRepository)
   public
      function CreatePurchase(AFeedTypeId, ASupplierId : Integer;
         APurchaseDate, AExpiryDate : TDateTime; ABatchNumber : string;
         AQuantity, AUnitCost : Double; AComment :string; AEventSource : Integer = 0) : Integer;
      function GetMostRecentPurchaseId(AFeedTypeId : Integer; ABatchNumber : string) : Integer;
   end;

implementation

{ TFeedPurchaseRepository }

function TFeedPurchaseRepository.CreatePurchase(AFeedTypeId, ASupplierId: Integer;
  APurchaseDate, AExpiryDate: TDateTime; ABatchNumber: string; AQuantity,
  AUnitCost: Double; AComment: string; AEventSource : Integer = 0): Integer;
var
   CurrentStock : Double;
begin
   Result := 0;

   // Check if feed already added to FdStkEvents table.
   try
      FQuery.SQL.Clear;
      FQuery.SQL.Add('SELECT FP.ID, FP.FeedType, FP.EventDate');
      FQuery.SQL.Add('FROM FdStkEvents FP');
      FQuery.SQL.Add('WHERE FP.FeedType = :AFeedTypeID');
      FQuery.SQL.Add('AND   FP.EventDate = :APurchDate');
      FQuery.SQL.Add('AND   FP.BatchNumber = :ABatchNumber');
      FQuery.SQL.Add('AND   FP.ExpiryDate = :AExpiryDate');
      FQuery.Params[0].AsInteger := AFeedTypeId;
      FQuery.Params[1].AsDateTime := APurchaseDate;
      FQuery.Params[2].AsString := ABatchNumber;
      FQuery.Params[3].AsDateTime := AExpiryDate;
      FQuery.Open;

      // If purchase isn't found add it.
      if (FQuery.RecordCount = 0) then
         begin
            FQuery.SQL.Clear;
            FQuery.SQL.Add('INSERT INTO FdStkEvents (FeedType, EventDate, Supplier, Quantity, BatchNumber, ExpiryDate, UnitCost, Comment, EventSource, IsSynchronized ) ');
            FQuery.SQL.Add('VALUES (:FeedTypeId, :PurchaseDate, :SupplierId, :Quantity, :BatchNumber, :ExpiryDate, :UnitCost, :Comment, :EventSource, :IsSynchronized ) ');
            FQuery.Params[0].AsInteger := AFeedTypeId;
            FQuery.Params[1].AsDateTime := APurchaseDate;
            FQuery.Params[2].AsInteger := ASupplierId;
            FQuery.Params[3].AsFloat := AQuantity;
            FQuery.Params[4].AsString := ABatchNumber;
            FQuery.Params[5].AsDateTime := AExpiryDate;
            FQuery.Params[6].AsFloat := AUnitCost;
            FQuery.Params[7].AsString := Copy(AComment,1,150);
            FQuery.Params[8].AsInteger := AEventSource;
            FQuery.Params[9].AsBoolean := False;
            try
               FQuery.ExecSQL;

               // Get the current stock amount for the Feed Type, this can be null so
               // querying it seperately from the update is necessary
               FQuery.SQL.Clear;
               FQuery.SQL.Add('SELECT Stock FROM FeedTypes');
               FQuery.SQL.Add('WHERE (Id = :AFeedType)');
               FQuery.Params[0].AsInteger := AFeedTypeId;
               FQuery.Open;
               try
                  CurrentStock := FQuery.Fields[0].AsFloat;
               finally
                  FQuery.Close;
               end;

               // Update the FeedType table to adjust the stock amount
               FQuery.SQL.Clear;
               FQuery.SQL.Add('UPDATE FeedTypes SET Stock = :AAmount');
               FQuery.SQL.Add('WHERE (Id = :AFeedType)');
               FQuery.Params[0].AsFloat := CurrentStock + AQuantity;
               FQuery.Params[1].AsInteger := AFeedTypeId;
               FQuery.ExecSQL;
                                 
               Result := GetMostRecentPurchaseId(AFeedTypeId, ABatchNumber);
            except
            end;
         end
      else
         Result := FQuery.Fields[0].AsInteger;

   finally
      FQuery.Close;
   end;

end;

function TFeedPurchaseRepository.GetMostRecentPurchaseId(
  AFeedTypeId: Integer; ABatchNumber: string): Integer;
begin
   FQuery.SQL.Clear;
   FQuery.SQL.Add('SELECT FP.FeedType, FP.EventDate FROM FdStkEvents FP');
   FQuery.SQL.Add('WHERE (FP.FeedType = :FeedType) ');
   FQuery.SQL.Add('AND (UPPER(FP.BatchNumber) = :ABatchNumber)');
   FQuery.SQL.Add('ORDER BY FP.EventDate DESC');
   FQuery.Params[0].AsInteger := AFeedTypeId;
   FQuery.Params[1].AsString := UPPERCASE(ABatchNumber);
   FQuery.Open;
   try
      FQuery.First;
      Result := FQuery.Fields[0].AsInteger;
   finally
      FQuery.Close;
   end;
end;

end.
