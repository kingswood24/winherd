{
  SP 03/10/2002:-

  Herd Select incorporated into splash screen.

  SP 03/10/2002.

  12/05/15 [V5.4 R5.7] /MK Additional Feature - Give error if no database found.

  02/10/15 [V5.4 R9.4] /MK Additional Feature - FormCreate - Allow program to be ran from Kingswood Herd Management or Kingswd only.
}

unit Splash;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls, Gauges, TJpgImg, Mask,
  DBCtrlsEh, RXCtrls, Dbtables, FileCtrl, ShellAPI, cxButtons, jpeg;

type
  TSplashForm = class(TForm)
    pOuter: TPanel;
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    pHerd: TPanel;
    Label1: TLabel;
    btnSelect: TcxButton;
    HerdCombo: TDBComboBoxEh;
    ProgressBar1: TProgressBar;
    lStartmessage: TLabel;
    procedure FormDeactivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ZipMajorCallback(szItem: PChar; Percent: Integer;
      var DoCancel: Boolean);
  private
    DataFolder : string;
    DataFolders : TStringList;
    AliasParams : TStringList;
    FSearchPath : String;
    function ExtractTopMostFolder(Path : string) : string;
    procedure CheckAdvisor(ADatabaseName : string);
  public
    NewPath : String;
    HerdSelected : boolean;
  end;

var
  SplashForm: TSplashForm;
  Splashmessage : boolean;
  UniqueMapping : THandle;
  MainWindow : THandle;
  FreeObjectsOnHalt : Boolean = False;

const
  KingswdPath = 'C:\KINGSWD\';
  DefaultPath = 'C:\KINGSWOOD HERD MANAGEMENT\';
  ApplicationTitle = 'Kingswood Herd Management';

  {$R *.DFM}
implementation
uses
   KRoutines, uCallToExternalProgram, DairyData, uHerdLookup, SetUpAnimals,
   uSrchdlg, uRemarks, uFilters, MenuUnit, db_bde, uKingswoodController,
   DynaZipUtils;

procedure TSplashForm.FormDeactivate(Sender: TObject);
begin
   splashmessage := false;
   FreeAndNil(AliasParams);
   FreeAndNil(DataFolders);
   Free;
end;

procedure TSplashForm.FormCreate(Sender: TObject);
var
  i : Integer;
  SearchRec : TSearchRec;
  SearchResult : Integer;
  DataFolder : string;
begin
   ProgressBar1.Visible := False;
   Application.Title := 'Kingswood Herd Management';

   DataFolders := TStringList.Create;

   //   02/10/15 [V5.4 R9.4] /MK Additional Feature - Allow program to be ran from Kingswood Herd Management or Kingswd only.
   FSearchPath := '';
   if ( UpperCase(ExtractFilePath(Application.ExeName)) = KingswdPath ) then
      FSearchPath := KingswdPath
   else
      FSearchPath := DefaultPath;
   SearchResult := FindFirst(FSearchPath+'*.*', faDirectory, SearchRec);
   if SearchResult = 0 then
      begin
         repeat
            if (SearchRec.Attr and faDirectory) <> 0 then
               begin
                  if not ( SearchRec.Name[1] = '.') and ( UPPERCASE(SearchRec.Name) <> 'HTEST' ) then
                     DataFolders.Add(SearchRec.Name);
               end;
            SearchResult := FindNext(SearchRec);
         until
            SearchResult <> 0;
         SysUtils.FindClose(SearchRec);
      end;

   DataFolders.Sort;
   for i := 0 to DataFolders.Count-1 do
      begin // search for animals.db will indicate what if a data folder exists!
         if FindFirst(FSearchPath + DataFolders.Strings[i] + '\Animals.db', faAnyFile, SearchRec) = 0 then
            begin
               HerdCombo.Items.Add(DataFolders.Strings[i]);
               HerdCombo.KeyItems.Add(DataFolders.Strings[i]);
               SysUtils.FindClose(SearchRec);
            end;
      end;

   Image2.Top := (Image1.Top + Image1.Height ) - ( Image2.Height + 33);
   AliasParams := TStringList.Create;
   if HerdCombo.Items.Count > 1 then // Multiple data folders
      begin
         HerdCombo.DropDownBox.Rows := HerdCombo.Items.Count; // Set rows equal to no. of Herds.
         Session.GetAliasParams('Kingswd', AliasParams );
         DataFolder := ExtractTopMostFolder(AliasParams.Values['PATH']);
         HerdCombo.ItemIndex := HerdCombo.Items.IndexOf(DataFolder);
         pHerd.Visible := True;
      end
   //   01/10/14 [V5.3 R6.6] /MK Change - If one directory exists the force BDE alias to be the name of the directory found.
   else if HerdCombo.Items.Count = 1 then
      begin
         Height := 250;
         Session.GetAliasParams('Kingswd', AliasParams );
         DataFolder := ExtractTopMostFolder(AliasParams.Values['PATH']);
         if ( UpperCase(HerdCombo.Items[0]) <> UpperCase(DataFolder) ) then
            AddAlias(HerdCombo.Items[0]);
         CheckAdvisor(DataFolder);
         HerdSelected := True;
      end
   else
      begin
         //   12/05/15 [V5.4 R5.7] /MK Additional Feature - Give error if no database found.
         MessageDlg('No database found. Contact Kingswood.',mtError,[mbOK],0);
         Halt(0);
      end;
end;

procedure TSplashForm.btnSelectClick(Sender: TObject);
var
  AParams: TStringList;
  DataFolder : String;
begin
   DataFolder := UpperCase(Trim(HerdCombo.Text));
   if ( DataFolder = '' ) or (not(DirectoryExists(FSearchPath + DataFolder))) then
      begin
         MessageDlg('You must select a valid Herd',mtError,[mbOK],0);
         Exit;
      end;


   pHerd.Hide;
   Height := Height - pHerd.Height;
   Update;
   Application.ProcessMessages;
   AddAlias(DataFolder);
   CheckAdvisor(DataFolder);
   HerdSelected := True;
end;

function TSplashForm.ExtractTopMostFolder(Path: string): string;
begin
   Result := ExtractDirFromPath(Path);
end;

procedure TSplashForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if UPPERCASE(Key) = 'U' then
      begin
         if FileExists('C:\kingswood herd management\HerdUtils.exe') then
            begin
               ShellExecute(handle, 'open', 'C:\kingswood herd management\HerdUtils.exe', nil, nil, SW_SHOWNORMAL);
               FreeObjectsOnHalt := True;
               Halt(0);
            end;
      end
end;

procedure TSplashForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//   if Key = VK_RE
end;

procedure TSplashForm.CheckAdvisor(ADatabaseName: string);
var
   fName : string;
   DBName : string;

begin
  // 1. Check if Advisor
  // 2. Check database = ADVISORY
  // 3. Check if data extraction is required.
  if (KAC.Active ) then
     begin
        if ProcessActive('paddocks.exe') then
           begin
              MessageDlg('The data extraction process cannot proceed until all other Kingswood programs are shut down.',mtError,[mbOK],0);
              Exit;
           end;

        Session.GetAliasParams('Kingswd', AliasParams );
        DataFolder := UPPERCASE(ExtractTopMostFolder(AliasParams.Values['PATH']));
        DBName := UPPERCASE(KAC.AdvisorDBName);
        if (DBName = DataFolder) then
           begin
              fName := ApplicationPath + 'Temp\clientdata.zip';
              if FileExists( fName ) then
                 begin
                    ProgressBar1.Position := 0;
                    lStartmessage.Caption := 'Extracting client data, please wait...';
                    ProgressBar1.Top := lStartmessage.Top + lStartmessage.Height + 1;
                    ProgressBar1.Visible := True;
                    Update;

                    // Delete all files before extracting data.
                    DeleteData(AliasParams.Values['PATH']);
                    if not ZipFile(fName, AliasParams.Values['PATH'], 'copper', zoUnzip, ZipMajorCallback) then
                       raise Exception.Create('Zip file extraction failed')
                    else
                       DeleteFile(fName);
                    ProgressBar1.Position := 0;
                    ProgressBar1.Visible := False;
                    lStartmessage.Caption := 'Extraction complete.';
                 end;
           end;
        Update;
     end;
end;

procedure TSplashForm.ZipMajorCallback(szItem: PChar; Percent: Integer;
  var DoCancel: Boolean);
begin
   ProgressBar1.Position := Percent;
end;

initialization

begin
   { SP }
   UniqueMapping := CreateFileMapping($ffffffff, nil, PAGE_READONLY, 0, 32, ApplicationTitle);
   if UniqueMapping = 0 then
      begin
         ShowMessage( SysErrorMessage( GetLastError ));
         Halt;
      end
   else if (GetLastError = Error_Already_Exists ) and
      // do not halt if running sync commands
      not((ParamCount = 2) and ((ParamStr(1) = '-o') or (ParamStr(1) = '-i'))) then
      begin
         MainWindow := FindWindow('TMenuForm',nil); // 0, 0, nil, ApplicationTitle);
         if MainWindow <> 0 then
            SetForegroundWindow ( MainWindow );
         Halt;
      end;
end

finalization
begin
   if FreeObjectsOnHalt then
      begin
         if HerdLookup <> nil then
            FreeAndNil(HerdLookup);
         if fSetUpAnimals <> nil then
            FreeAndNil(fSetUpAnimals);
         if fSearchDlg <> nil then
            FreeAndNil(fSearchDlg);
         if fRemarks <> nil then
            FreeAndNil(fRemarks);
         if fFilters <> nil then
            FreeAndNil(fFilters);
         if MenuForm <> nil then
            FreeAndNil(MenuForm);
         if WinData <> nil then
            FreeAndNil(WinData);
      end;
end;

end.
