unit PDALink;

interface

uses
   Classes, Windows, SysUtils, Registry, QuickRpt, QRExport, Dialogs;

type

  TPDAExportReportIndexTable = 0..15;

  PPDALinkReportInfo = ^TPDALinkReportInfo;
  TPDALinkReportInfo = record
     ReportIndex : Integer;
     FileName : string;
     FileType : Byte;
     ReportActive : Boolean;
  end;

  TPDALink = class
  private
    FActiveReportList : TStringList;
    FPDALinkReportInfo : TPDALinkReportInfo;
    FActive: Boolean;
    function GetOutputDirectory: string;
    procedure SetOutputDirectory(const Value: string);
    procedure SetActive(const Value: Boolean);
  protected
    Reg : TRegistry;
    sPDALink : string;
    function DefaultReportName(Index: Integer) : string;
    function GetReportIndexFromName(const Name : String) : Integer;
  public
    constructor Create(ADataDir : string);
    destructor Destroy;override;
    procedure ClearActiveReports;
    function EnumerateActiveReports : Integer;
    procedure ExploreOutput;
    function ExportReport(QR : TQuickRep) : Boolean;
    procedure ReadReportInfo(AReportName : string);
    function SaveReportInfo(const AReportName : string;
       const APDALinkReportInfo: TPDALinkReportInfo) : Boolean;
    property Active : Boolean read FActive write SetActive;
    property ActiveReportList : TStringList read FActiveReportList;
    property PDALinkReportInfo : TPDALinkReportInfo read FPDALinkReportInfo;
    property OutputDirectory : string read GetOutputDirectory write SetOutputDirectory;
  end;

const
   { PDALink Consts }
   cPDALink = 'SOFTWARE\Kingswood\Herd\PDALink\%s\';
   cPDALink_OutputDirectory = 'Directory';
   cPDALink_OutputFileName = 'FileName';
   cPDALink_OutputFileType = 'FileType';
   cPDALink_ReportActive = 'Active';

   iPDAExportReports : array [0..15] of string =
   ('Stock On Hand',
    'Purchase/Sales Analysis',
    'Sales Planner',
    'Restricted Animals Report',
    'Veterinary Treatments Report',
    'Somatic Cell Count Analysis',
    'Heats/Services/PD''s',
    'Due Service',
    'Due Pregnancy Diagnosis',
    'Due For Drying Off',
    'Due To Calve',
    'Weighing Report',
    'Cattle Margins',
    'Individual Cow Fertility',
    'Best Cows In Herd',
    'Herd Brochure');

    PDARepStockOnHand = 0;
    PDARepPurchSalesAnalysis = 1;
    PDARepSalesPlanner = 2;
    PDARepRestrictedAnimals = 3;
    PDARepVetTreatmentsReport = 4;
    PDARepSCCAnalysis = 5;
    PDARepHeatsServicesPDs = 6;
    PDARepDueService = 7;
    PDARepDuePregnancyDiag = 8;
    PDARepDueForDryingOff = 9;
    PDARepDueToCalve = 10;
    PDARepWeighingReport = 11;
    PDARepCattleMargins = 12;
    PDARepIndividualCowFertility = 13;
    PDARepBestCowsInHerd = 14;
    PDARepHerdBrochure = 15;

implementation
uses
   KRoutines, ShellAPI;

{ TPDALink }

constructor TPDALink.Create(ADataDir : string);
begin
   Reg := TRegistry.Create;
   Reg.RootKey := HKEY_LOCAL_MACHINE;
   sPDALink := Format( cPDALink, [ADataDir]);
   Reg.OpenKey( sPDALink, TRUE);

   if Reg.ValueExists('Active') then
      begin
         FActive := Reg.ReadBool('Active');
      end
   else
      Active := False;
end;

destructor TPDALink.Destroy;
begin
  ClearActiveReports;
  if Reg <> nil then
     Reg.Free;
  inherited;
end;

procedure TPDALink.ClearActiveReports;
begin
   if FActiveReportList <> nil then
      FreeAndNil(FActiveReportList);
end;

function TPDALink.EnumerateActiveReports: Integer;
var
   ReportIndex : integer;
begin
   if FActiveReportList = nil then
      FActiveReportList := TStringList.Create
   else
      FActiveReportList.Clear;

   for ReportIndex := Low(iPDAExportReports) to High(iPDAExportReports) do
      begin
         ReadReportInfo( iPDAExportReports[ ReportIndex ] );
         if FPDALinkReportInfo.ReportActive then
            FActiveReportList.Add( iPDAExportReports[ ReportIndex ] );
      end;
   Result := FActiveReportList.Count;
end;

procedure TPDALink.ExploreOutput;
begin
   ShellExecute(0, 'open', nil, nil, PChar(OutputDirectory), SW_SHOWNORMAL);
end;

function TPDALink.ExportReport(QR: TQuickRep) : Boolean;
var
   FileName : string;
begin
   Qr.ShowProgress := False;
   Qr.Prepare;
   FileName := OutputDirectory + '\' + PDALinkReportInfo.FileName;
   case PDALinkReportInfo.FileType of
      0 : begin
             FileName := FileName + '.csv';
             QR.ExportToFilter ( TQRCommaSeparatedFilter.Create(FileName ));
          end;
      1 : begin
             FileName := FileName + '.rtf';
             QR.ExportToFilter ( TQRRTFExportFilter.Create(FileName ));
          end;
   end;
   Result := FileExists( FileName );
end;

procedure TPDALink.ReadReportInfo(AReportName : string);
begin
   FillChar(FPDALinkReportInfo, SizeOf( TPDALinkReportInfo ) , 0);
   Reg.CloseKey;
   if Reg.OpenKey(sPDALink+AReportName , FALSE) then
      try
         FPDALinkReportInfo.ReportIndex := GetReportIndexFromName( AReportName );
         FPDALinkReportInfo.FileName := Reg.ReadString( cPDALink_OutputFileName );
         if ( Trim(FPDALinkReportInfo.FileName) = '' ) then
            FPDALinkReportInfo.FileName := DefaultReportName( FPDALinkReportInfo.ReportIndex );
         FPDALinkReportInfo.FileType := Reg.ReadInteger( cPDALink_OutputFileType );
         FPDALinkReportInfo.ReportActive := Reg.ReadBool( cPDALink_ReportActive );
      finally
         Reg.CloseKey;
      end
   else
      SaveReportInfo(AReportName, FPDALinkReportInfo);
end;

function TPDALink.SaveReportInfo(const AReportName : string;
  const APDALinkReportInfo: TPDALinkReportInfo) : Boolean;
begin
   Result := False;
   Reg.CloseKey;
   if ( AReportName <> ''  ) then
   if Reg.OpenKey( sPDALink + AReportName , TRUE ) then
         try
            Reg.WriteString(cPDALink_OutputFileName, APDALinkReportInfo.FileName);
            Reg.WriteInteger(cPDALink_OutputFileType, APDALinkReportInfo.FileType);
            Reg.WriteBool(cPDALink_ReportActive, APDALinkReportInfo.ReportActive);
            Result := True;
         finally
            Reg.CloseKey;
         end;
end;

procedure TPDALink.SetActive(const Value: Boolean);
begin
   FActive := Value;
   Reg.WriteBool('Active', FActive);
end;

function TPDALink.GetOutputDirectory: string;
var
   tReg : TRegistry;
begin
   tReg := TRegistry.Create;
   try
      tReg.RootKey := HKEY_LOCAL_MACHINE;
      if tReg.OpenKey(sPDALink, True) then
         if tReg.ValueExists( cPDALink_OutputDirectory ) then
            Result := tReg.ReadString(cPDALink_OutputDirectory)
         else
            begin
               Result := ApplicationPath + 'PDALink';
               CreateDir( Result );
               OutputDirectory := Result;
            end;
   finally
     tReg.Free;
   end;
end;

procedure TPDALink.SetOutputDirectory(const Value: string);
var
   tReg : TRegistry;
begin
   tReg := TRegistry.Create;
   try
      tReg.RootKey := HKEY_LOCAL_MACHINE;
      if not DirExists(Value) then
         raise Exception.Create('Invalid directory');

      if tReg.OpenKey( sPDALink, TRUE ) then
         begin
            tReg.WriteString(cPDALink_OutputDirectory, Value);
            tReg.CloseKey;
         end;
   finally
     tReg.Free;
   end;
end;

function TPDALink.DefaultReportName(Index: Integer): string;
begin
   Result := LOWERCASE(kRoutines.StripAllNomNumAlpha(UPPERCASE(iPDAExportReports[Index])));
end;

function TPDALink.GetReportIndexFromName(const Name : String) : Integer;
var
   i : Integer;
begin
   Result := -1;
   for i := Low(iPDAExportReports) to High(iPDAExportReports) do
      if ( iPDAExportReports[i] = Name ) then
         begin
            Result := i;
            Break;
         end;
end;

end.
