unit uNatID;

interface

type
  TNatIdStyle = ( Style1999, Style1996, StylePre1996, StyleUnKnown );

  function CheckNatID( NatIDStr : String; var NewId : String ) : Boolean;
  function WhatStyleNatID( NatIDStr : String ) : TNatIDStyle;

  function StripAllSpaces( StrToStrip : String) : String;
  function StripSpaces( StrToStrip : String) : String;

implementation
uses
    Dialogs,
    SysUtils;

Function StripSpaces( StrToStrip : String) : String;
var i,j:integer;
begin
  if length(StrToStrip)>0 then
    begin
      i := 1;
      while (i<length(StrToStrip)) and (StrToStrip[i]=' ') do
          i := i+1;                     { find first non-blank character }

      if StrToStrip[i]=' ' then        { string is all blank }
          StrToStrip := ''
      else                      { string is not all blank }
        begin
          j := length(StrToStrip);
          while (j>1) and (StrToStrip[j]=' ') do
              j := j-1;         { find end of non-blank section }
          StrToStrip := copy(StrToStrip,i,j+1-i);
        end;
    end;
  Result := StrToStrip;
end;

Function StripAllSpaces( StrToStrip : String) : String;
var j:integer;
    st : string;
begin
  st := StripSpaces(StrToStrip);
  if length(St)>0 then
    begin
      j := length(St);
      while (j>1) do
         begin
           if St[j] = ' ' then
             Delete(St,j,1);
           Dec(j);
         end;
    end;
  Result := St;
end;

{ Check Digit Calculator }
function CheckNatID( NatIDStr : String; var NewId : String ) : Boolean;
var
   IncIE,
   CorrectEntry,
   LastIsChar,
   CalcPre1996Digit,
   Calc1999Digit,
   Calc1996Digit    : Boolean;
   Factor,
   CumVal,
   TotalCum,
   RM,                     // Remainder
   RS,                     // Remainder - 23
   i,
   StrLen,
   NoNums,
   NoAlphas : Integer;
   OldDigit,
   TestStr,
   CalcCheckDigit,
   CheckDigit : String;

   { Check the 1999 Digit IE 12 12345 ? 1234 }
   Function Check1999Digit : Boolean;
   var
      i : Integer;
      CumStr : String;
   begin
      // Copy the Old Digit from the String
      OldDigit := Copy ( TestStr,8 ,1 );
      Factor := 0;
      CumVal := 0;
      RM := 0;
      RS := 0;
      for i := 1 to 12 do
         begin
            { set multiplication factor }
            case i of
               1 : Factor := 1;
               2 : Factor := 2;
               3 : Factor := 1;
               4 : Factor := 2;
               5 : Factor := 1;
               6 : Factor := 2;
               7 : Factor := 1;
               8 : Factor := 0;  // Check digit
               9 : factor := 2;
               10 : Factor := 1;
               11 : Factor := 2;
               12 : Factor := 1;
            end;

            { calculate cumulative total }
            if i <> 8 then
               CumVal := CumVal + ((ord (TestStr[i]) - 48) * Factor);
         end;

      { Convert to String }
      CumStr := IntToStr(CumVal);
      // add the Numbers together
      if Length(CumStr) = 1 then
         TotalCum := StrToInt(CumStr[1])
      else if Length(CumStr) = 2 then
         TotalCum := StrToInt(CumStr[1]) + StrToInt(CumStr[2])
      else if Length(CumStr) = 3 then
         TotalCum := StrToInt(CumStr[1]) + StrToInt(CumStr[2])+ StrToInt(CumStr[3])
      else // if string is longer then 3 the Code is
         TotalCum := 0;

      if ( TotalCum > 9 ) AND ( TotalCum < 100 ) then
         while TotalCum > 9 do
            begin
               CumStr := IntToStr(TotalCum);
               TotalCum := StrToInt(CumStr[1]) + StrToInt(CumStr[2]);
            end
      else if ( TotalCum > 9 ) AND ( TotalCum > 100 ) then
         while TotalCum > 9 do
            begin
               CumStr := IntToStr(TotalCum);
               if Length(CumStr) = 2 then
                  TotalCum := StrToInt(CumStr[1]) + StrToInt(CumStr[2])
               else if Length(CumStr) = 3 then
                  TotalCum := StrToInt(CumStr[1]) + StrToInt(CumStr[2]) + StrToInt(CumStr[3])
               else
                  TotalCum := 0;
            end;

      CalcCheckDigit := IntToStr(TotalCum);
      CorrectEntry := ( OldDigit = CalcCheckdigit );

      if CorrectEntry then
         begin
            // Insert Spaces to set the String in correct format
            Insert(' ',TestStr,3);
            Insert(' ',TestStr,9);
            Insert(' ',TestStr,11);
            // ReInsert IE if its entered
            if IncIE then
               Insert( 'IE ',TestStr,1 );
         end;
//      else
//         MessageDLG('Invalid National ID entered',mtWarning,[mbOK],0);
      ReSult := CorrectEntry;
   end;

   { Check the 1996 on Digit IE ABCD 2345 ? }
   Function Check1996Digit : Boolean;
   var
      i : Integer;
   begin
      // Copy the Old Digit from the String
      OldDigit := Copy ( TestStr,9 ,1 );

      Factor := 0;
      CumVal := 0;
      RM := 0;
      RS := 0;
      for i := 1 to 8 do
         begin
            { set multiplication factor }
            case i of
               1 : Factor := 9;
               2 : Factor := 8;
               3 : Factor := 7;
               4 : Factor := 6;
               5 : Factor := 5;
               6 : Factor := 4;
               7 : Factor := 3;
               8 : Factor := 2;
            end;

            { calculate cumulative total }
            if TestStr[i] in ['A'..'Z'] then
               CumVal := CumVal + ((ord (TestStr[i]) - 64) * Factor)
            else if TestStr[i] in ['0'..'9'] then
               CumVal := CumVal + ((ord (TestStr[i]) - 48) * Factor);
         end;

      { get remainder after divided by 23 }
      RM := CumVal mod 23;

      { get result of 23 minus remainder }
      RS := 23 - RM;

      { return result character }
      case RS of
         1 : CalcCheckDigit := 'A';
         2 : CalcCheckDigit := 'B';
         3 : CalcCheckDigit := 'C';
         4 : CalcCheckDigit := 'D';
         5 : CalcCheckDigit := 'E';
         6 : CalcCheckDigit := 'F';
         7 : CalcCheckDigit := 'G';
         8 : CalcCheckDigit := 'H';
         9 : CalcCheckDigit := 'J';
         10 : CalcCheckDigit := 'K';
         11 : CalcCheckDigit := 'L';
         12 : CalcCheckDigit := 'M';
         13 : CalcCheckDigit := 'N';
         14 : CalcCheckDigit := 'P';
         15 : CalcCheckDigit := 'Q';
         16 : CalcCheckDigit := 'R';
         17 : CalcCheckDigit := 'S';
         18 : CalcCheckDigit := 'T';
         19 : CalcCheckDigit := 'U';
         20 : CalcCheckDigit := 'V';
         21 : CalcCheckDigit := 'W';
         22 : CalcCheckDigit := 'X';
         23 : CalcCheckDigit := 'Y';
      end;

      CorrectEntry := ( OldDigit = CalcCheckdigit );
      if CorrectEntry then
         begin
            // Insert a Space between 1234 and Check Digit
            Insert(' ',TestStr,9);
            // Insert a Space between ABCD and 1234
            Insert(' ',TestStr,5);
            // ReInsert the IE if it was entered
            if IncIE then
               Insert( 'IE ',TestStr,1 );
            // Return the formatted National ID
            NewID := TestStr;
         end;
//      else
//         MessageDLG('Invalid National ID entered',mtWarning,[mbOK],0);
      ReSult := CorrectEntry;
   end;

   { Check the PRE 1996 Digit YCA 12345? }
   Function CheckPre1996Digit : Boolean;
   var
      CumStr,
      NumStr  : String;
      LastMult,
      ArrPos,
      TestVal,
      NumVal,
      Counter,
      i       : Integer;
      TestArr : packed array [1..14] of Integer;
   begin
      // Copy the Old Digit from the String
      OldDigit := Copy ( TestStr, 9 ,1 );

      CumVal := 0;
      ArrPos := 1;
      FillChar(TestArr,SizeOf(TestArr),0);

      // Accumulate the Letters
      for i := 1 to 3 do
         begin
            NumVal := ( Ord(TestStr[i]) + 36 );
            NumStr := IntToStr(NumVal);
            TestArr[ArrPos] := StrToInt(Copy(Numstr,1,1));
            Inc(ArrPos);
            TestArr[ArrPos] := StrToInt(Copy(Numstr,2,1));
            Inc(ArrPos);
            TestArr[ArrPos] := StrToInt(Copy(Numstr,3,1));
            Inc(ArrPos);
         end;

      // Accumulate the Numbers
      for i := 4 to 8 do
         begin
            TestArr[ArrPos] := StrToInt(Copy(TestStr,i,1));
            Inc(ArrPos);
         end;

      // Get the Total
      LastMult := 2;
      for i := 1 to 14 do
         begin
            CumVal := CumVal + (TestArr[i]*LastMult);
            if LastMult = 1 then
               LastMult := 2
            else
               LastMult := 1;
         end;

      // Store it as a string
      CumStr := IntToStr(CumVal);

      // Reinitialise the array
      FillChar(TestArr,SizeOf(TestArr),0);

      // Check the size if CumVal
      if CumVal In [10..99] then
         while ( CumVal >= 10 ) do
            begin
               // Break the Cumulative in 2
               TestArr[1] := StrToInt(CumStr[1]);
               TestArr[2] := StrToInt(CumStr[2]);
               CumVal := TestArr[1] + TestArr[2];
               CumStr := IntToStr(CumVal);
            end
      else if ( CumVal >= 100 ) And ( CumVal <= 999 ) then
         while ( CumVal >= 10 ) do
            begin
               // Break the Cumulative in 2
               TestArr[1] := StrToInt(CumStr[1]);
               TestArr[2] := StrToInt(CumStr[2]);
               TestArr[3] := StrToInt(CumStr[3]);
               CumVal := TestArr[1] + TestArr[2] + TestArr[3];
               CumStr := IntToStr(CumVal);
            end;
      CalcCheckDigit := IntToStr(CumVal);

      // Check this against the user input
      CorrectEntry := ( OldDigit = CalcCheckdigit );
      if CorrectEntry then
         begin
            // Insert a Space between ABC and 123343
            Insert(' ',TestStr,4);
            // Return the formatted National ID
            NewID := TestStr;
         end;
//      else
//         MessageDLG('Invalid National ID entered',mtWarning,[mbOK],0);
      ReSult := CorrectEntry;

   end;

begin
   Result := TRUE;
   // Store Passed value in a temporary string
   TestStr := NatIDStr;

   // Strip all spaces
   TestStr := StripAllSpaces(TestStr);

   // Remove the IE if entered
   if (Pos ('IE', TestStr) > 0) then
      begin
         Delete (TestStr, Pos ('IE', TestStr), 2);
         IncIE := TRUE;
      end
   else
      IncIE := FALSE;

   CheckDigit := '';
   CalcPre1996Digit := FALSE;
   Calc1999Digit    := FALSE;
   Calc1996Digit    := FALSE;
   LastIsChar       := FALSE;
   CorrectEntry     := FALSE;

   NoNums   := 0;
   NoAlphas := 0;
   StrLen   := Length(TestStr);

   if ( StrLen > 0 ) then
      begin
         LastIsChar := ( TestStr[StrLen] In ['A'..'Z'] );
         // Count the No of Alpha Char - exclude the last character
         // Max allowed for 1996 is 4 and pre 3 ( so StrLen-5 )
         for i := 1 to StrLen-5 do
            if (TestStr[i] In ['A'..'Z']) then
               Inc(NoAlphas);
         {
         if LastIsChar then
            Dec(NoAlphas);
         }

         // Count the No of Numbers
         for i := 1 to StrLen do
            if (TestStr[i] In ['0'..'9']) then
               Inc(NoNums);
      end;

   // See if the New 1999 Plastic Tag
   if ( NoNums = StrLen ) And ( StrLen = 12 ) then
      Result := Check1999Digit    // Calc1999Digit := TRUE
   // This is the pre 1996 Brass Tags
   else if ( NoAlphas = 3 ) And ( NoNums = 6 ) And ( StrLen = 9 ) then
      Result := CheckPre1996Digit  //CalcPre1996Digit := TRUE
   else if ( NoAlphas = 4 ) And ((( LastIsChar ) And ( NoNums = 4 )) Or
           ( NoNums = 5 )) then
      Result := Check1996Digit;  // Calc1996Digit := TRUE;

   // Return the formatted National ID
   if CorrectEntry then
      NewID := TestStr
   else
      NewId := NatIDStr;
end;

function WhatStyleNatID( NatIDStr : String ) : TNatIDStyle;
var
   TestStr : String;
   i,
   StrLen,
   NoNums,
   NoAlphas : Integer;
   LastIsChar : Boolean;
begin

   // Store Passed value in a temporary string
   TestStr := NatIDStr;

   // Strip all spaces
   TestStr := StripAllSpaces(TestStr);

   // Remove the IE if entered
   if (Pos ('IE', TestStr) > 0) then
      Delete (TestStr, Pos ('IE', TestStr), 2);

   NoNums   := 0;
   NoAlphas := 0;
   StrLen   := Length(TestStr);

   if ( StrLen > 0 ) then
      begin
         LastIsChar := ( TestStr[StrLen] In ['A'..'Z'] );
         // Count the No of Alpha Char - exclude the last character
         for i := 1 to StrLen-5 do
            if (TestStr[i] In ['A'..'Z']) then
               Inc(NoAlphas);

         {
         if LastIsChar then
            Dec(NoAlphas);
         }

         // Count the No of Numbers
         for i := 1 to StrLen do
            if (TestStr[i] In ['0'..'9']) then
               Inc(NoNums);
      end;

   // See if the New 1999 Plastic Tag
   if ( NoNums = StrLen ) And ( StrLen = 12 ) then
      Result := Style1999
   // This is the pre 1996 Brass Tags
   else if ( NoAlphas = 3 ) And ( NoNums = 6 ) And ( StrLen = 9 ) then
      Result := StylePre1996
   else if ( NoAlphas = 4 ) And ((( LastIsChar ) And ( NoNums = 4 )) Or
           ( NoNums = 5 )) then
      Result := Style1996
   else
      Result := StyleUnKnown;

end;

end.
 