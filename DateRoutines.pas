Unit DateRoutines;

InterFace

Type
   t_date = Record
           Year, Month, Day : SmallInt;
   end;
   t_number = Integer;

   function ConvertToDate ( Var CopyStr : String ) : Boolean;
   procedure t_date_str (date:t_date; var st:String);
   function t_str_num (st:String; var num:t_number;
		       digits,decimals:SmallInt; minus:boolean) : boolean;
   procedure t_num_str ( num:t_number; var st:ShortString; digits,decimals:Smallint );
   procedure t_strip ( var st:String );
   procedure t_strip_zero ( var st:string );
   procedure t_incdate(dt:t_date;inc_factor:SmallInt;var new_date : t_date);
   procedure t_decdate(dt:t_date;dec_factor:SmallInt;var new_date : t_date);
   Function StripAllSpaces( StrToStrip : String) : String;
   procedure StripLeadingAndTrailingAlphas ( var st:string );
   function KStrToDate( StrToTest : String) : TDateTime;
   function StrToDateF(FValue, FFormat : String) : TDateTime;

Implementation
uses
  Dialogs,
  SysUtils;
  
function ConvertToDate ( Var CopyStr : String ) : Boolean;
Var
   DateInt : Integer;
   DOB     : t_Date;
begin
     Result := False;
     t_Strip(CopyStr);
     t_Strip_Zero(CopyStr);
     if Length(CopyStr) > 0 Then
        begin
           if NOT t_str_num ( CopyStr, DateInt, 6, 0, False ) then
              DateInt := 0;
           if DateInt > 0 Then
              begin
                 DOB.Day := 1;
                 DOB.Month := 1;
                 DOB.Year := 1;
                 if DateInt > 15000 then
                    begin
                       t_incDate ( DOB, 15000, DOB );
                       DateInt := DateInt - 15000;
                    end;
                 if DateInt < 32000 then
                    t_incDate ( DOB, trunc(DateInt),DOB );
                 if DOB.Year > 100 then
                    DOB.Year := DOB.Year - 100;
                 t_decDate ( DOB, 366, DOB );
                 t_date_Str ( DOB, CopyStr );
                 Result := True;
              end;
        end;
     t_strip ( CopyStr );
end;

procedure t_date_str (date:t_date; var st:String);
{ convert date to string }
var
  d,m,y : ShortString;

  procedure convert(n:SmallInt; var st:ShortString);
  { convert integer to 2 digit string }
  begin
    st := '00';
    st[2] := chr(ord('0') + n mod 10);
    st[1] := chr(ord('0') + (n div 10) mod 10);
  end;

begin
  { Year 2000 Problem
    if (date.day <= 0) or (date.month <= 0) or (date.year <= 0) then
  }
  if (date.day <= 0) or (date.month <= 0) then
    st := '        '
  else
    begin
      convert(date.day, d);
      convert(date.month, m);
      convert(date.year, y);
      st := concat(d,'/',m,'/',y);
    end;
end;

function t_isdigit (c : char) : boolean;
{ true if c is a digit }
begin
  ReSult := (c in ['0'..'9']);
end;

function t_digit_value (digit:char) : SmallInt;
{ Return integer value of digit character, '0'..'9' }
begin
  ReSult := ord(digit)-ord('0');
end;

function t_str_num; { (st:string; var num:t_number
		       digits,decimals:integer; minus:boolean) : boolean }
{
  Convert string to number, return true if valid, false otherwise.
  Blank string is considered valid, converted to 0.
  num is not altered if st is not a valid number.
  numbers with 1 decimal place are stored with 2 assumed places for databases.
}

var
  i : SmallInt;
  work : t_number;
  neg_val,
  onedp : boolean;

  procedure add_digits(var i,n:SmallInt);
  {
    Add up to n digits from i in string to end of work;
    move i to first non digit or length(st)+1
    decrease n for each digit added
  }
  begin
    if i<length(st) then
      while (i<length(st)) and (n>0) and (t_isdigit(st[i])) do
	begin
	  work := work*10 + t_digit_value(st[i]);
	  i := i+1;
	  n := n-1;
	end;
    if i=length(st) then
      if (n>0) and (t_isdigit(st[i])) then
	begin
	  work := work*10 + t_digit_value(st[i]);
	  i := i+1;
	  n := n-1;
	end;
  end;
begin
  neg_val := false;	{ assume negative value }
  work := 0;	      { assume 0 to start }
  onedp := decimals=1;	{ one decimal place is a special case }
  t_strip(st);		{ ignore surrounding spaces }
  t_strip_zero(st);	{ ignore leading zeros }
  i := 1;

  { AH: Check for minus at the start of the string }
  if i <= length (st) then
    if (st[i] = '-') and (minus) then
      begin
	i := i + 1;
	neg_val := true;
      end;

  { Get digits before decimal place }
  digits := digits-decimals;
  if i<=length(st) then
      add_digits(i,digits);

  { Get digits after decimal place }
  if i<=length(st) then
    if st[i] = '.' then
      begin
	i := i+1;
	add_digits(i,decimals);
      end;

  { Check for sign if minus allowed }
  if i<=length(st) then
    if (st[i] = '-') and (minus) then
      begin
	i := i+1;
	{ AH: if not already negative }
	if not neg_val then
	  work := -work;
      end;

  { AH: if a negative value then change work to be negative }
  if neg_val then
    work := -work;

  if i>length(st) then		{ if all characters processed }
    begin
      while decimals>0 do	{ Adjust for unentered decimal places }
	begin
	  work := work*10;
	  decimals := decimals-1;
	end;
      if onedp then
	  work := work*10;	{ Adjust for single decimal place }
      num := work;		{ return number }
      t_str_num := true;	{ number is valid }
    end
  else
      t_str_num := false;	{ otherwise number is invalid }

end;

procedure t_num_str; { num:t_number; var st:string; digits,decimals:integer }
{
  Convert number to string showing given number of digits and decimals
  Numbers with one decimal are stored with 2.
}

begin
  if decimals = 1 then
      num := num div 10;                { Adjust for one decimal numbers }
  if num<0 then                         { digits to string }
      str(-num,st)
  else
      str(num,st);
  while length(st)<decimals+1 do        { ensure 0 before dp }
      st := concat('0',st);
  if length(st) > digits then           { remove extra digits }
      st := copy(st, length(st)-digits+1, digits);
  if decimals > 0 then                  { Add decimal point }
      insert('.', st, length(st)-decimals+1);
  if num < 0 then                       { Add minus sign }
      st := concat('-', st);     { AH Moved side that the minus was on }
end;


procedure t_strip ( var st:string );
{ strip leading and trailing blanks from string }

var i,j:SmallInt;
begin
  if length(st)>0 then
    begin
      i := 1;
      while (i<length(st)) and (st[i]=' ') do
	  i := i+1;			{ find first non-blank character }

      if st[i]=' ' then	       { string is all blank }
	  st := ''
      else			{ string is not all blank }
	begin
	  j := length(st);
	  while (j>1) and (st[j]=' ') do
	      j := j-1;		{ find end of non-blank section }
	  st := copy(st,i,j+1-i);
	end;
    end;
end;

procedure t_strip_zero ( var st:string );
{ strip leading zeros }

var i:SmallInt;

begin
  t_strip(St);
  if length(st)>0 then
    begin
      i := 1;
      while (i<length(st)) and (st[i]='0') do
	  i := i+1;		{ find first non-zero character }

      if st[i]='0' then		{ string is all zeros }
	  st := '0'
      else			{ string is not all blank }
	  st := copy(st,i,length(st)+1-i);
    end;
end;

Function StripAllSpaces( StrToStrip : String) : String;
var j:integer;
    st : string;
begin
  St := StrToStrip;
  t_strip(St);
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

procedure StripLeadingAndTrailingAlphas ( var st:string );
{ strip all leading and trailing alpha chars leaving number }
var i    : SmallInt;
    Start,
    Stop  : Integer;
    TempStr : String;
begin
  TempStr := St;
  St := StripAllSpaces(TempStr);
  St := UpperCase(St);
  if Length(St)>0 then
    begin
      i := 1;
      Start := 0;
      Stop  := -1;
      while (i<Length(St)) And NOT ( St[1] In ['0'..'9'] ) do
	       begin
            Delete ( St, 1, 1 ); //i := i+1;		{ find first Number }
            Inc ( i );
         end;
      // Start := i;

      i := Length(St);
      while (i>0) And NOT ( St[i] In ['0'..'9'] ) do
         begin
            Delete ( St, i, 1 ); // i := i-1;		{ Find Last Number }
            Dec ( i );
         end;
      // Stop := i+1;

      // if ( Start < Stop ) then   // Cut the String between the 2
      //  St := Copy (St,Start,Stop-Start);

    end;
  t_strip_zero(St);  // Strip all leading zeros
end;

function t_leapyear ( Year : SmallInt ) : Boolean;
begin
    ReSult := (( Year Mod 4 = 0 ) And (( Year Mod 100 <> 0 ) Or ( Year Mod 400 = 0 )));
end;

function t_mthdays(month, year:SmallInt) : SmallInt;
{ Return days in month for given year (to allow for leapyears) }
begin
  if month in [9, 4, 6, 11] then t_mthdays := 30
  else if month <> 2 then t_mthdays := 31
  else if t_leapyear(year) then t_mthdays := 29
  else t_mthdays := 28;
end;

procedure t_incdate; {(dt:t_date;inc_factor:SmallInt;var new_date : t_date); }
{ increase the date dt1 by the increasement factor of inc_factor.  The answer
  will be returned as the new_date. }

var
  dy, mt, yr : SmallInt;		 { temp. day, month and year }

  begin
    { validate date }
    { Year 2000 Problem }
    if (dt.month = 0) or (dt.day = 0) then
      begin
	new_date.year := 0;
	new_date.month := 0;
	new_date.day := 0;
      end
    else
      begin
	{ setup temp. year + inc_factor }
	dy := dt.day + inc_factor;
	mt := dt.month;
	{ Year 2000 Problem }
	if dt.year < 64 then
	  yr := dt.year + 100
	else if dt.year >= 64 then
	  yr := dt.year;

	{ validate date + inc_factor }
	while dy > t_mthdays(mt, yr) do
	  begin
	    dy := dy - t_mthdays(mt, yr);
	    mt := mt + 1;
	    if mt > 12 then
	      begin
		mt := mt - 12;
		yr := yr + 1;
	      end;
	  end;

	{ set new date }
	new_date.year := yr;
	new_date.month := mt;
	new_date.day := dy;

      end;

  end;

procedure t_decdate; {(dt:t_date;dec_factor:SmallInt;var new_date : t_date); }
{ decrease the date dt1 by the decrement factor of dec_factor.	The answer
  will be returned as the new_date. }

var
  dy, mt, yr : SmallInt;		 { temp. day, month and year }

  begin
    { validate date }
    { Year 2000 Problem }
    if (dt.month = 0) or (dt.day = 0) then
      begin
	new_date.year := 0;
	new_date.month := 0;
	new_date.day := 0;
      end
    else
      begin
	{ setup temp. year - dec_factor }
	dy := dt.day - dec_factor;
	mt := dt.month;
	{ Year 2000 Problem }
	if dt.year < 64 then
	  yr := dt.year + 100
	else if dt.year >= 64 then
	  yr := dt.year;

	{ validate date + inc_factor }
	while dy < 1 do
	  begin
	    mt := mt - 1;
	    if mt < 1 then
	      begin
		mt := mt + 12;
		yr := yr - 1;
	      end;
	    dy := dy + t_mthdays (mt, yr);
	  end;

	{ set new date }
	new_date.year := yr;
	new_date.month := mt;
	new_date.day := dy;

      end;
  end;

(*
PROCEDURE t_int_date; { (date_int : SmallInt; var dy, mn, yr : SmallInt) }
VAR
  X    : SmallInt;
  Y    : SmallInt;
  XVAL,
  YVAL : t_number;
  ST   : STRING[2];
BEGIN
  dy   := 0;
  mn   := 0;
  yr   := 0;

  XVAL := date_int;
  XVAL := XVAL + 32000;
  YVAL := XVAL DIV 500;
  YR   := TRUNC (YVAL);
  XVAL := XVAL - (YVAL * 500);
  YVAL := XVAL DIV 35;
  MN   := TRUNC (YVAL);
  XVAL := XVAL - (YVAL * 35);
  DY   := TRUNC (XVAL);
END;
*)

function KStrToDate( StrToTest : String) : TDateTime;
var TempDate : String;
    Day,
    Month,
    Year     : Integer;
begin
    TempDate := StripAllSpaces(StrToTest);
    // Set the Day, Month and Year
    Day   := StrToInt(Copy(TempDate,1,2));
    Month := StrToInt(Copy(TempDate,4,2));
    Year  := StrToInt(Copy(TempDate,7,2));
    if Year > 60 then
       Year := Year + 1900
    else
       Year := Year + 2000;
    TempDate := IntToStr(Day) + '/' + IntToStr(Month) + '/' + IntToStr(Year);
    RESULT := StrToDate(TempDate);
end;

function StrToDateF(FValue, FFormat : String) : TDateTime;
begin
   if FFormat = 'ddmmyyyy' then
      begin



      end
   else if FFormat = 'yyyymmdd' then
      begin




      end;

end;

End.
