unit uHerdResources;

interface
uses
   Classes, SysUtils, Windows, KRoutines, Dialogs;

  procedure ExtractResourceFiles;

implementation

procedure ExtractResourceFiles;
var
  ResourceStream : TResourceStream;
  FileStream: TFileStream;
  Filename: string;
begin
   Filename := 'C:\Windows\System32\qrpdflib.dll';
   if not FileExists(FileName) then
      begin
         ResourceStream := TResourceStream.Create(hInstance, 'qrpdflib', RT_RCDATA) ;
         try
            FileStream := TFileStream.Create(Filename, fmCreate) ;
            try
               FileStream.CopyFrom(ResourceStream, 0) ;
            finally
               FileStream.Free;
            end;
        finally
           ResourceStream.Free;
        end;
     end;

end;

end.
