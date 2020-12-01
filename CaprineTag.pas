unit CaprineTag;

interface

uses
   Classes, Windows, Dialogs, SysUtils, KRoutines;

type

   TCaprineTag = class
   private
      function StripAllSpaces(Str : String) : String;  
   public
      function ValidateTag(const TagNo : String) : Boolean;
   end;

implementation

{ TCaprineTag }

function TCaprineTag.StripAllSpaces(Str: String): String;
begin
   while Pos(' ', Str)> 0 do
      delete(Str, Pos(' ', Str), 1);
   Result := Str;
end;

function TCaprineTag.ValidateTag(const TagNo: String): Boolean;
var
   tTagNo : String;
   CheckDigit : Char;
   TagArray : Array [1..12] of Char;
   CumVal, i : Integer;
   Multiplier : Byte;
   CumValStr : String;
begin
   Result := False;

   tTagNo := UPPERCASE(StripAllSpaces(TagNo));

   StripIrishCountryPrefixFromNatID(tTagNo);

   CheckDigit := tTagNo[8];
   if not (CheckDigit in ['0'..'9']) then
      begin
         // raise Error
      end;

   Delete(tTagNo, 8, 1);

   if Length(tTagNo) <> 12 then
      begin
         // raise Error
      end;

   for i := 1 to Length(tTagNo) do
      begin
         if not (tTagNo[i] in ['0'..'9']) then
            begin
               // raise Error
            end
         else
            TagArray[i] := tTagNo[i];
      end;

   CumVal := 0;
   for i := 1 to Length(TagArray) do
      begin
         if i in [1,3,5,7,9,11] then
            Multiplier := 1
         else
            Multiplier := 2;
         CumVal := CumVal + StrToInt(TagArray[i]) * Multiplier;
      end;

   try
      CumValStr := IntToStr(CumVal);
   except
   end;
   CumVal := 0;

   while Length(CumValStr) > 1 do
      begin
         CumVal := 0;
         for i := 1 to Length(CumValStr) do
            CumVal := CumVal + StrToInt(CumValStr[i]);
         CumValStr := IntToStr(CumVal);
      end;

   if StrToInt(CheckDigit) <> CumVal then
      begin
         Result := False;
      end
   else
      begin
         Result := True;
      end;
end;


   {if not CaprineTag.ValidateTag(MaskEdit1.Text) then
      begin
         ShowMessage('Error: Invalid Tag');
      end
   else
      begin
         ShowMessage('Valid Tag');
      end;
      }
end.
