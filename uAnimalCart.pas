unit uAnimalCart;

interface
uses
   SysUtils, Classes, db, dbTables, GenTypesConst;

type
   TAnimalCartData = array of Integer;
   TAnimalCart = class
   private
//     FAnimalCartData : TAnimalCartData;
     FAnimalCartData : TList;
     function GetAnimalCartDataAsWideString: WideString;
     function GetIsEmpty: Boolean;
     function GetCount: Integer;
     function GetAnimalCartData: TAnimalCartData;
     function CartAnimalInFilter (AAnimalID : Integer) : Boolean;
     function GetFilterActive: Boolean;
   public
     constructor Create;
     destructor Destroy;override;
     procedure AddToCart(AID : Integer); overload;
     procedure AddToCart(AAnimalIds : array of Integer); overload;
     procedure RemoveFromCart(AID : Integer);
     function InCart(AID : Integer) : Boolean;
     procedure ClearCart;
     //property AnimalCartData : TAnimalCartData read FAnimalCartData;
     property AnimalCartDataAsWideString : WideString read GetAnimalCartDataAsWideString;
     property AnimalCartData : TAnimalCartData read GetAnimalCartData;
     property IsEmpty : Boolean read GetIsEmpty;
     property Count : Integer read GetCount;
     property FilterActive : Boolean read GetFilterActive;
   end;

   function AnimalCart : TAnimalCart;

const
    cMsg_NoAnimalsInCart = 'There are currently no animals in the Cart';
var
   AQ : TAnimalCart;

implementation

   function AnimalCart : TAnimalCart;
   begin
      if AQ = nil then AQ := TAnimalCart.Create;
      Result := AQ;
   end;

{ TAnimalCart }

procedure TAnimalCart.AddToCart(AID: Integer);
begin
   //SetLength(FAnimalCartData, Length(FAnimalCartData)+1);
   //FAnimalCartData[Length(FAnimalCartData)-1] := AID;
   if FAnimalCartData.IndexOf(pointer(AID)) = -1 then
      FAnimalCartData.Add(pointer(AID));
end;

procedure TAnimalCart.ClearCart;
begin
   //SetLength(FAnimalCartData, 0);
   FAnimalCartData.Clear;
end;

constructor TAnimalCart.Create;
begin
   FAnimalCartData := TList.Create;
   ClearCart;
end;

destructor TAnimalCart.Destroy;
begin
   ClearCart;
   FreeAndNil(FAnimalCartData);
   inherited;
end;

function TAnimalCart.GetCount: Integer;
//var
//  tCount : Integer;
begin
   Result := FAnimalCartData.Count;
//   tCount := Length( FAnimalCartData );
//   if tCount > 0 then
//      Result := tCount;
end;

function TAnimalCart.GetIsEmpty: Boolean;
begin
   Result := Count = 0;
end;

function TAnimalCart.GetAnimalCartDataAsWideString: WideString;
var
   I : Integer;
begin
   Result := '';
   if ( FAnimalCartData.Count ) = 1 then
      begin
         if ( CartAnimalInFilter(Integer(FAnimalCartData.Items[0])) ) then
            Result := '(' + IntToStr( Integer(FAnimalCartData.Items[0]) ) +')';
      end
   else
      begin
         for I := 0 to FAnimalCartData.Count - 1 do      // Iterate
            begin
               if ( CartAnimalInFilter(Integer(FAnimalCartData.Items[i])) ) then
                  begin
                     if Length( Result ) = 0 then
                        Result := '(' + IntToStr(Integer(FAnimalCartData.Items[i]))
                     else
                        Result := Result +', '+  IntToStr(Integer(FAnimalCartData.Items[i]) );
                  end;
            end;  // for
         if Result <> '' then
            Result := Result + ')'
         else
            Result := Result + '()'
       end;
end;

function TAnimalCart.InCart(AID: Integer): Boolean;
//var
  // i : Integer;
begin
{   Result := False;
   for i := 0 to Length(FAnimalCartData)-1 do
      if FAnimalCartData[ i ] = AID then
         begin
            Result := True;
            Break;
         end;
}
   Result := (FAnimalCartData.IndexOf(pointer(AID)) > -1);
end;

procedure TAnimalCart.RemoveFromCart(AID: Integer);
var
//   i : Integer;
   Index : Integer;
  // Count : Integer;
begin
{   Index := -1;
   Count := Length(FAnimalCartData);
   for i := 0 to Count-1 do
      if FAnimalCartData[ i ] = AID then
         begin
            Index := i;
            Break;
         end;

   if (Index < 0) or (Index >= Count) then exit;

   if Index < Count - 1 then begin
     move( FAnimalCartData[Index+1], FAnimalCartData[Index], sizeof(FAnimalCartData[0]) * (Count - Index - 1) );
   end;

   SetLength( FAnimalCartData, Count - 1 );}

   Index := FAnimalCartData.IndexOf(pointer(AID));
   if Index > -1 then
      FAnimalCartData.Delete(Index);

end;

function TAnimalCart.GetAnimalCartData: TAnimalCartData;
var
   i : Integer;
begin
   SetLength(Result, FAnimalCartData.Count);
   if ( FAnimalCartData.Count > 0 ) then
      for i := 0 to FAnimalCartData.Count-1 do
         begin
            Result[i] := Integer(FAnimalCartData.Items[i]);
         end;
end;

procedure TAnimalCart.AddToCart(AAnimalIds: array of Integer);
var
   i : Integer;
begin
   for i := 0 to Length(AAnimalIds)-1 do
      AddToCart(AAnimalIds[i]);
end;

function TAnimalCart.CartAnimalInFilter (AAnimalID : Integer) : Boolean;
begin
   Result := False;
   if ( AAnimalID = 0 ) then Exit;
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT *');
         SQL.Add('FROM AFilters');
         SQL.Add('WHERE AID = :AAnimalID');
         Params[0].AsInteger := AAnimalID;
         try
            Open;
            Result := ( RecordCount > 0 );
         except
         end;
      finally
         Free;
      end;
end;

function TAnimalCart.GetFilterActive: Boolean;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := AliasName;
         SQL.Clear;
         SQL.Add('SELECT ActiveFilter');
         SQL.Add('FROM Defaults');
         try
            Open;
            Result := Fields[0].AsBoolean;
         except
         end;
      finally
         Free;
      end;
end;

end.
