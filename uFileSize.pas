//******************************************************************************
//
// Unit Name: DPFileSize
// Purpose  : Functions for reporting file size with a descriptive string
// Author   : (c) 2001 Dmitri Papichev {Dmitri.Papichev@iname.com}
// Comments : Specially for www.delphi3000.com
//
//******************************************************************************

unit uFileSize;

{==============================================================================}
interface

const
   KB = 1024;
   MB = KB*KB;
   GB = MB*KB;

{main function}
function GetFileSizeString (const AFileName: string): string;

{helper functions, surfaced here as they might be used on their own}
function DPGetFileSize (const AFileName: string): integer;
function GetSignificantDigits (const ARealNumber: double;
                               const ADigits: integer): string;
function FormatFileSizeValue (const AValue: integer): string;

{==============================================================================}
implementation
uses
   SysUtils,
   Classes;

{------------------------------------------------------------------------------}
{returns the string representing the file size for a given filename, in a way
similar to what Windows Explorer does}
function GetFileSizeString (const AFileName: string): string;
begin
   try
      Result := FormatFileSizeValue (DPGetFileSize (AFileName));
   except
      on E:Exception do begin
         Result := E.Message;
      end; {on}
   end; {if}
end; {--GetFileSizeString--}

{------------------------------------------------------------------------------}
{returns file size in bytes for a given filename}
function DPGetFileSize (const AFileName: string): integer;
var
   AFileStream: TFileStream;
begin
   AFileStream := TFileStream.Create (AFileName,
                                      fmShareCompat or fmShareDenyNone);
   try
     Result := AFileStream.Size;
   finally
     AFileStream.Free;
   end; {try}
end; {--GetFileSizeDP--}

{------------------------------------------------------------------------------}
{returns first ADigits significant digits of ARealNumber,
with a decimal point if any}
function GetSignificantDigits (const ARealNumber: double;
                               const ADigits: integer): string;
begin
   if ADigits IN [1..16] then begin {that's the range of sig. digits supported}
      Result := Format ('%' +
                        IntToStr (ADigits) + '.' +
                        IntToStr (ADigits)+ 'f', [ARealNumber]);

      Result := Copy (Result, 1, ADigits + 1);
      if (Pos ('.', Result) IN [0, ADigits + 1]) then begin
         Result := Copy (Result, 1, ADigits);
      end; {if}
   end else begin
      raise Exception.Create ('GetSignificantDigits: '+
                              'A number of significant digits out of range');
   end; {if}
end; {--GetSignificantDigits--}

{------------------------------------------------------------------------}
{converts given AValue to the string representing file size, in a way similar
to what Windows Explorer does}
function FormatFileSizeValue (const AValue: integer): string;
begin
   try
   case AValue of
      0..999:
         begin
            Result := IntToStr (AValue) + ' bytes';
         end;
      1000..(MB - 1):
         begin
            Result := GetSignificantDigits (AValue/KB, 3) + 'KB';
         end;
      MB..(GB - 1):
         begin
            Result := GetSignificantDigits (AValue/MB, 3) + 'MB';
         end;
   else begin
           Result := GetSignificantDigits (AValue/GB, 3) + 'GB';
        end;
   end; {case}
   except
   end;
end; {--FormatFileSizeValue--}

end.

