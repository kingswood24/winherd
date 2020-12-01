{
 -----------------------------------------------------
  [daz] Beef Remittance Helper Classes
        07-March-2000

        TBeefRemitFiles
        .scans a target directory for remit files

        TBeefRemitFile
        .processes remit file sections

        TBeefRemitSectionParser
        .allows processing a remit file section

  07/07/11 [V4.1 R2.2] /MK Change - Now Bringing In CSV File Automatically - No Need For CSVImport Button.
 -----------------------------------------------------
}

unit BeefRemit;

interface
uses
    Classes, Sysutils;

type
{
 -----------------------------------------------------
  [daz] TBeefRemitFiles
        Wrapper Class for listing Remit Files
 -----------------------------------------------------
}
    TBeefRemitFiles = class
     private
      slRmFiles : tStringList;
      fsFileLocation : string;
      fsRemitExt     : string;
      function    GetRmFiles : tStrings;
      procedure   SetFileLocation(Value : String);
      procedure   SetRemitExt(Value : String);
      function    IsValidExt(AFilename : string) : Boolean;
     public
      constructor Create;
      destructor  Destroy;override;
      function    GetFiles : boolean;
     published
      property    FileLocation : string read fsFileLocation write SetFileLocation;
      property    Files        : tStrings read GetRmFiles;
      property    RemitExt     : string read fsRemitExt write SetRemitExt;
    end;

{
  -----------------------------------------------------
   [daz] TBeefRemitFile

         Class for Processing Remittance File Sections
         Remittance File Sections are as follows:
         [FILE START]

          // nested
          [REMITTANCE xxxxx START]
          [REMITTANCE xxxxx END]

          [REMITTANCE xxxxx+1 START]
          [REMITTANCE xxxxx+1 END]

         [FILE END]

         Note: File Sections will exclude nested
               sections.
  -----------------------------------------------------
}
    TBeefRemitFile = class
     private
      slFile      : tStringList;
      slSection   : tStringList;
     private
      function    isSection(Name : String) : boolean;
      function    isSectionStart(Name : String) : boolean;
      function    isSectionEnd(Name : String) : boolean;
      function    isThisSectionEnd(Name : String;ThisToken : String) : boolean;
      function    LocateSection(Name : String) : Integer;
     protected
      sStartToken : string;
      sEndToken   : string;
     public
      constructor Create;
      destructor  Destroy;override;

      function    Load(Filename : String) : boolean;
      function    GetSectionNames(sl : tStrings) : boolean;
      function    LoadSection(Name : String) : boolean;

     published
      property    FileContents    : tStringList read slFile;
      property    SectionContents : tStringList read slSection;
    end;

 {
  -----------------------------------------------------
   [daz] TBeefRemitSectionParser

         Class for processing Beef Remit Section Items.
  -----------------------------------------------------
 }
    TBeefRemitSectionParser = class
     private
      slSection : tStringList;
     public
      constructor Create;
      destructor  Destroy;override;

      procedure   Assign(sl : tStrings;IdWidth : Integer);

      function    IdentifierByName(Name : String;var Value : String) : Boolean;
      function    IdentifierByPos (Index : Integer;var Name,Value : String) : Boolean;
     published
      property    SectionContents : tStringList read slSection;
    end;

implementation


{
 -----------------------------------------------------
  [daz] TBeefRemitFiles
 -----------------------------------------------------
}

Constructor TBeefRemitFiles.Create;
begin
 inherited;
 slRmFiles:=tStringList.Create;
 fsRemitExt:='rmt';
end;

Destructor  TBeefRemitFiles.Destroy;
begin
 slRmFiles.Free;
 inherited;
end;

procedure   TBeefRemitFiles.SetFileLocation(Value : String);
begin
 if copy(Value,length(Value),1) <> '\' then
  Value:=Value+'\';
 fsFileLocation:=Value;
end;

procedure   TBeefRemitFiles.SetRemitExt(Value : String);
begin
 if pos('.',Value)>0 then
  Value:=ExtractFileExt(Value)
 else
 if pos('\',Value)>0 then
  Value:='';
 fsRemitExt:=Value;
end;

function    TBeefRemitFiles.GetRmFiles : tStrings;
begin
 Result:=slRmFiles;
end;

function    TBeefRemitFiles.GetFiles : boolean;
var
   dirInfo : tSearchRec;
   nResult : integer;
   s       : string;
begin
 slRmFiles.Clear;
// s:=fsFileLocation+'*.'+fsRemitExt;
 s:=fsFileLocation+'*.*'; // MK 07/07/2011 now scanning for csv files as well as rmt.

 nResult:=FindFirst(s,faAnyFile,DirInfo);
 while nResult = 0 do
  begin
   if (DirInfo.Attr and faDirectory) = 0 then
    begin
     s:=fsFileLocation+dirInfo.Name; //avoid delphi string bug
     if IsValidExt(s) then
        slRmFiles.Add(s);
    end;
   nResult:=FindNext(DirInfo);
  end;
 FindClose(DirInfo);
 Result:=LongBool(slRmFiles.Count);
end;


{
 -----------------------------------------------------
  [daz] TBeefRemitFile
 -----------------------------------------------------
}

constructor TBeefRemitFile.Create;
begin
 inherited;
 slFile:=tStringList.Create;
 slSection:=tStringList.Create;
 sStartToken := 'START]';
 sEndToken   := 'END]';
end;

destructor  TBeefRemitFile.Destroy;
begin
 slFile.Free;
 slSection.Free;
 inherited;
end;

function    TBeefRemitFile.isSection(Name : String) : boolean;
begin
 Result:=isSectionStart(Name) or isSectionEnd(Name);
end;

function    TBeefRemitFile.isSectionStart(Name : String) : boolean;
begin
 Result:=Uppercase(copy(Name,Length(Name)-Length(sStartToken)+1,Length(sStartToken)))=sStartToken;
end;

function    TBeefRemitFile.isSectionEnd(Name : String) : boolean;
begin
 Result:=Uppercase(copy(Name,Length(Name)-Length(sEndToken)+1,Length(sEndToken)))=sEndToken;
end;

function    TBeefRemitFile.isThisSectionEnd(Name : String;ThisToken : string) : boolean;
begin
 Result:=False;
 if isSectionStart(Name) then
  begin
   Delete(Name,length(Name)-length(sStartToken)+1,length(sStartToken));
   Insert(sEndToken,Name,length(Name)+1);
   Result:=Uppercase(Name) = Uppercase(ThisToken);
  end;
end;

function    TBeefRemitFile.LocateSection(Name : String) : Integer;
var
   nLoop : integer;
begin
 Result:=-1;
 for nLoop:=0 to slFile.Count-1 do
  if Uppercase(Trim(Name)) = Uppercase(Trim(slFile[nLoop])) then
   begin
    Result:=nLoop;
    break;
   end;
end;

function    TBeefRemitFile.Load(Filename : String) : boolean;
var
  sl : TStringList;
begin
 Result:=False;
 try
  slFile.LoadFromFile(FileName);

  sl := TStringList.Create;
  try
  GetSectionNames(sl);
  if sl.IndexOf('[FILE START]') = -1 then
     begin
        slFile.Clear;
        slFile.LoadFromFile(FileName);
        slFile.Insert(0,'Remittance Count    00001');
        slFile.Insert(0,'Created By          Kingswood Internal');
        slFile.Insert(0,'File Version        00001');
        slFile.Insert(0,'File Type           Beef Remittance');
        slFile.Insert(0,Format('File Date           %s  ',[FormatDateTime('dd-mm-yyyy hh:mm:ss',now)]));
        slFile.Insert(0,'[FILE START]');
     end;
  finally
     sl.Free;
  end;
  Result:=True;
 except
 end;
end;

function    TBeefRemitFile.GetSectionNames(sl : tStrings) : boolean;
var
   nLoop : integer;
   s     : string;
begin
 sl.clear;
 for nLoop:=0 to slFile.Count-1 do
  begin
   s:=uppercase(trim(slFile[nLoop]));
   if s<>'' then
    // section delimiter, use copy instead of s[n] to avoid blank lines
    if copy(s,1,1) = '[' then
     // section start delimiter
     if copy(s,length(s)-length(sStartToken)+1,length(sStartToken)) = sStartToken then
      sl.Add(s);
  end;
 Result:=Longbool(sl.Count);
end;

function    TBeefRemitFile.LoadSection(Name : String) : boolean;
var
   nLoop : integer;
   nNesting : integer;
   s        : string;
begin
 slSection.Clear;
 nNesting:=0;
 nLoop:=LocateSection(Name); // find the section start;
 if nLoop<>-1 then
  begin
   inc(nLoop);

   while nLoop < slFile.Count do
    begin
     s:=slFile[nLoop];
     if isSection(s) then
      begin
       if isThisSectionEnd(Name,s) then
        break
       else
       if isSectionStart(s) then
        inc(nNesting)
       else
       if isSectionEnd(s) then
        dec(nNesting);
      end
     else
      if nNesting = 0 then
       if length(s)>0 then
        slSection.Add(s);

    inc(nLoop);
   end;
  end;
 Result:=nLoop<>-1;
end;

{
 -----------------------------------------------------
  [daz] TBeefRemitSectionParser
 -----------------------------------------------------
}

constructor TBeefRemitSectionParser.Create;
begin
 inherited;
 slSection:=tStringList.Create;
end;

destructor  TBeefRemitSectionParser.Destroy;
begin
 inherited;
 slSection.Free;
end;

procedure   TBeefRemitSectionParser.Assign(sl : tStrings;IdWidth : Integer);
var
   nLoop : integer;
   s     : string;
   Identifier, Data : string;
begin
 slSection.Assign(sl);
 for nLoop:=slSection.Count-1 downto 0 do
  begin
   s:=slSection[nLoop];
   if trim(s) = '' then
    begin
     slSection.Delete(nLoop);
     continue;
    end;

   Identifier:=copy(s,1,IdWidth);
   Identifier:=uppercase(Trim(Identifier));
   Data:=copy(s,IdWidth+1,length(s));
//   Data:=Trim(Data);
   slSection[nLoop]:=Identifier+'='+Data;
  end;
end;

function    TBeefRemitSectionParser.IdentifierByName(Name : String;var Value : String) : Boolean;
var
   sName : String;
begin
 sName:=Uppercase(Trim(Name));
 Result:=slSection.IndexOfName(sName)<>-1;
 if Result then
  Value:=slSection.Values[sName];
end;

function    TBeefRemitSectionParser.IdentifierByPos(Index : Integer;var Name,Value : String) : Boolean;
begin
 Result:=Index<slSection.Count;
 if Result then
  begin
   Name:=slSection[Index];
   Value:=Copy(Name,pos('=',Name)+1,Length(Name));
   Delete(Name,pos('=',Name),Length(Name));
  end;
end;


function TBeefRemitFiles.IsValidExt(AFilename: string): Boolean;
var
   ext : string;
begin
   ext := UPPERCASE(ExtractFileExt(AFilename));
   Result := (ext = '.RMT') OR (ext = '.CSV');
end;

end.