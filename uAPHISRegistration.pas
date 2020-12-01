{
   19/09/11 [V4.1 R4.9] /MK Additional Feature - TGM Said To Remove This CheckOldNITagFormat As New Rules Don't Need Formatting.

   06/01/12 [V5.0 R3.2] /SP Change - Changed Path Location Of APHIS Files To Match KInstaller Download Location.

   22/11/12 [V5.1 R1.2] /MK Bug Fix - sbRegister Caption was not changing as code for changing caption was RegistrationPages.OnChanging and not OnChange.

   18/01/13 [V5.1 R3.8] /MK Change - Create APHIS File is now non existent - TGM.

   09/02/13 [V5.1 R4.1] /MK Additional Feature - LoadAnimals - Check to see if RelinkCalvesToDams needs to run.

   18/11/14 [V5.3 R8.9] /MK Change - LoadAnimals/BirthTable/DamNatID - If dam tag is not UK9 and its not IE then tag should be stripped of spaces
                                     and then a space should be inserted before the last 6 digits - GM/TGM request.

   07/10/16 [V5.6 R2.0] /MK Additional Feature - Added the export of the SireNatIDNo to the XML file - GM/TGM request.

   02/12/16 [V5.6 R3.7] /MK Bug Fix - AddSireOrDamTagNo - Field ID not found error appearing because previous code was using FieldByName('ID').Value.
}

unit uAPHISRegistration;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGridEh, ComCtrls, RXCtrls, ToolWin, db, dbTables, ExtCtrls,
  Menus, DBCtrls, StdCtrls, DBGrids, RXDBCtrl, uCalfRegFlt, cxButtons,
  DateUtil, AdomCore, ComObj, MSXML2_TLB, KRoutines;

type
  TAPHISRegistrationKind = (APHISBirths, APHISDeaths, APHISStillBirths);
  TAPHISRegistration = class(TForm)
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbRegister: TRxSpeedButton;
    StatusBar: TStatusBar;
    RegistrationPages: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    sbRemove: TRxSpeedButton;
    ToolButton3: TToolButton;
    sbHelp: TRxSpeedButton;
    ToolButton4: TToolButton;
    LoadAnimalTimer: TTimer;
    mRemove: TPopupMenu;
    Remove1: TMenuItem;
    sbReload: TRxSpeedButton;
    ToolButton5: TToolButton;
    dsBatchRegAnimals: TDataSource;
    pControls: TPanel;
    AnimalGrid: TDBGridEh;
    pErrors: TPanel;
    DBNavigator1: TDBNavigator;
    N1: TMenuItem;
    RemovePermanently1: TMenuItem;
    Splitter: TSplitter;
    ErrorGrid: TDBGridEh;
    WarningImage: TImage;
    Label1: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    sbOptions: TRxSpeedButton;
    ToolButton6: TToolButton;
    mOptions: TPopupMenu;
    GotoAPHISOnline1: TMenuItem;
    N2: TMenuItem;
    ShowXMLFiles1: TMenuItem;
    ImageTimer: TTimer;
    Panel1: TPanel;
    RxSpeedButton1: TRxSpeedButton;
    ToolButton7: TToolButton;
    APHISLogindetails1: TMenuItem;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RegistrationPagesChange(Sender: TObject);
    procedure LoadAnimalTimerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AnimalGridGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure sbReloadClick(Sender: TObject);
    procedure RemovePermanently1Click(Sender: TObject);
    procedure sbRegisterClick(Sender: TObject);
    procedure AnimalGridTitleClick(Column: TColumnEh);
    procedure GotoAPHISOnline1Click(Sender: TObject);
    procedure ShowXMLFiles1Click(Sender: TObject);
    procedure sbRemoveClick(Sender: TObject);
    procedure Remove1Click(Sender: TObject);
    procedure ImageTimerTimer(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure APHISLogindetails1Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AnimalGridEnter(Sender: TObject);
    procedure RegistrationPagesChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton8Click(Sender: TObject);
  private
    { Private declarations }
    BirthTable,
    DeathTable,
    StillBirthTable,
    RegErrorTable,
    RegistrationTable,
    LookupCalvings,
    LookupSalesDeaths : TTable;
    GenQuery : TQuery;
    ProgressBar : TProgressBar;
    HerdIdentity : string;
    ThisHerdID,
    TotalAnimals : Integer;
    NextFileID : Integer;
    LastRegCreation : TDateTime;
    FAphisWSInvoked : Boolean;
    ThisTable : TTable;
    FRegistrationTimeStamp : TDateTime;
    FXmlDataFile : string;
    procedure Initialize;
    procedure Finalize;
    procedure LoadAll;
    procedure UpdateStatus;
    procedure UpdateRegInfo(RegType : Integer);
    procedure UpdateGridColumns;
    procedure LoadAnimals(RegType : Integer);
    function IsValidColourCode(ColourCode : string) : Boolean;
    procedure CreateFileAndReg(RegType : Integer);
    procedure GetRegDetails(RegType : Integer);
    procedure InsertErrorRecord(const AnimalID : Integer; const ErrorStr : string);
    procedure RegTableAfterScroll(DataSet: TDataSet);
    procedure RegTableAfterDelete(DataSet : TDataSet);
    function FileAnimalCount(TableName : String) : Integer;
    function RegisterBirths(const RegisterAll, StillBirth : Boolean) : Boolean;
    function RegisterDeaths(const RegisterAll : Boolean) : Boolean;
    function FormatUK9Tag(const TagNo : string) : string;
    function CheckOldNITagFormat(const TagNo : string) : string;
    function CheckIETagFormat(const TagNo : string) : string;
    procedure ThisFormOnIdle(Sender: TObject; var Done: Boolean);
    procedure RegisterUsingWebServices;
    procedure BringAphisWSToFront;
    procedure DefaultHandler(var Message); override;
    procedure ClearRegistered;
    procedure RegisterCalf(const AEventId : Integer; ACalfId : Integer; const AConfirmationId : string = '');
    procedure RegisterDeath;
    procedure CreateXmlDataFile;
    function UsingCompatiableAphisExeFile : Boolean;
  public
    { Public declarations }

  end;

  procedure ShowForm(APHISRegistrationKind : TAPHISRegistrationKind);

var
  APHISRegistration: TAPHISRegistration;
  ThisDataSource : TDataSource;
  WM_KINGSWOOD_APHISWS_CLOSED : Dword;

implementation
uses
   DairyData, FileCtrl, KDBRoutines, GenTypesConst, xml_generator,
   ShellAPI, uHerdLookup, uAPHISWSCredentials, uAPHISLoginData,
   ChkDebug;
   {$R *.DFM}

  procedure ShowForm(APHISRegistrationKind : TAPHISRegistrationKind);
  begin
     try
        Application.CreateForm(TAPHISRegistration, APHISRegistration);
        try
           APHISRegistration.RegistrationPages.ActivePageIndex := Ord(APHISRegistrationKind);
           APHISRegistration.ShowModal;
        except
           MessageDlg(cFormCreateError, mtError, [mbOK], 0);
        end;
     finally
        FreeAndNil(APHISRegistration);
     end;
  end;

{ TNIBirthsDeathsReg }

procedure TAPHISRegistration.FormCreate(Sender: TObject);
begin
   Initialize;

//   ToolButton8.Visible := IsWinherdDebugging;
end;

procedure TAPHISRegistration.FormDestroy(Sender: TObject);
begin
   Finalize;
end;

procedure TAPHISRegistration.RegistrationPagesChange(Sender: TObject);
begin
   LoadAll;
end;

procedure TAPHISRegistration.LoadAnimalTimerTimer(Sender: TObject);
begin
   LoadAnimalTimer.Enabled := False;
   LoadAll;
end;

procedure TAPHISRegistration.FormShow(Sender: TObject);
begin
   LoadAnimalTimer.Enabled := True;
end;

procedure TAPHISRegistration.Initialize;
var
   RegFileDir : string;
   Ico : TIcon;
   CanUseWebServices : Boolean;
begin
   WinData.LoadBtnImage(WinData.Images,sbExit.Glyph,cBtnImgExit);
   WinData.LoadBtnImage(WinData.Images,sbRemove.Glyph,cBtnImgCancel);
   WinData.LoadBtnImage(WinData.Images,sbRegister.Glyph,cBtnImgExecute);
   WinData.LoadBtnImage(WinData.Images,sbHelp.Glyph,cBtnImgHelp);
   WinData.LoadBtnImage(WinData.Images,sbReload.Glyph,cBtnImgLoad);
   WinData.LoadBtnImage(WinData.Images,sbOptions.Glyph,cBtnImgOptions);

   Ico := Ticon.Create;
   try
      Ico.Handle := LoadIcon(0,IDI_EXCLAMATION);
      WarningImage.Picture.Graphic := Ico;
   finally
      Ico.Free;
   end;

   FAphisWSInvoked := False;

   RegFileDir := ExtractFilePath(ParamStr(0)) + cRegFileDir;
   if not DirectoryExists(RegFileDir) then
      if not CreateDir(RegFileDir) then
         raise Exception.CreateFmt(sDirCreateError, [RegFileDir]);

   //   06/01/12 [V5.0 R3.2] /SP Change - Changed Path Location Of APHIS Files To Match KInstaller Download Location.
   CanUseWebServices :=  ( FileExists( ApplicationPath + 'APHIS Registration\aphisws.exe' ) );
   if not ( CanUseWebServices ) then
      begin
         CanUseWebServices := FileExists(ApplicationPath + 'aphisws.exe');

         if CanUseWebServices then
            begin
               // move files to APhis specific dir.
               CopyFile(pChar(ApplicationPath + 'aphisws.exe'),PChar(ApplicationPath + 'APHIS Registration\aphisws.exe'),True);
               CopyFile(pChar(ApplicationPath + 'aphisws.exe.config'),PChar(ApplicationPath + 'APHIS Registration\aphisws.exe.config'),True);
            end;
      end;

   if not CanUseWebServices then
      raise Exception.Create('Required web services file cannot be found.');

   // Tidy up application root dir
   if FileExists(ApplicationPath + 'aphisws.exe') then
      DeleteFile(ApplicationPath + 'aphisws.exe');

   if FileExists(ApplicationPath + 'aphisws.exe.config') then
      DeleteFile(ApplicationPath + 'aphisws.exe.config');

   sbRegister.Caption := 'Register';
   sbRegister.Enabled := True;

   ThisHerdID := WinData.UserDefaultHerdID;

   ProgressBar := TProgressBar.Create(Self);

   WinData.CreateTTable(BirthTable, nil, '','BirthReg');
   WinData.CreateTTable(DeathTable, nil, '','tNIDeathReg');
   WinData.CreateTTable(StillBirthTable, nil, '', 'tNIStillBirthReg');
   WinData.CreateTTable(RegistrationTable, nil, '', 'BatchRegistrations');
   WinData.CreateTTable(RegErrorTable, nil, '', 'tBatchRegAnimals');
   WinData.CreateTTable(LookupCalvings, nil, '', 'Calvings');
   WinData.CreateTTable(LookupSalesDeaths, nil, '', 'SalesDeaths');
   WinData.CreateTQuery(GenQuery, nil, 'Kingswd');

   LookupCalvings.CachedUpdates := True;
   LookupCalvings.Active := True;

   LookupSalesDeaths.CachedUpdates := True;
   LookupSalesDeaths.Active := True;

   RegistrationTable.Active := True;
   ThisDataSource := TDataSource.Create(nil);
   AnimalGrid.DataSource := ThisDataSource;

   with BirthTable do
      begin
         if Exists then
            DeleteTable;

         with FieldDefs do
            begin
               Clear;
               Add('ID', ftAutoInc);
               Add('EventID', ftInteger);
               Add('AnimalID', ftInteger);
               Add('NatIDNum', ftString, 20);
               Add('SortNatIDNum', ftString, 20);
               Add('Sex', ftString, 6);
               Add('DateOfBirth', ftDate);
               Add('Colour', ftString, 6);
               Add('Breed', ftString, 6);
               Add('DamNatIDNum', ftString, 20);
               Add('DamSortNatIDNum', ftString, 20);
               Add('SireNatIDNo', ftString, 20);
               Add('SireSortNatIDNo', ftString, 20);
               Add('RegisterOnFile', ftBoolean);
               Add('ValidationErrors', ftBoolean);
               Add('WSRegistered', ftBoolean);
               Add('Status', ftString, 15);
               Add('ConfirmationId', ftString, 60);
            end;

         with IndexDefs do
            begin
               Clear;
               Add('iID', 'ID', [ixPrimary,ixUnique]);
               { Ascending }
               Add('iAnimalID', 'AnimalID',[ixCaseInsensitive]);
               Add('iEventID', 'EventID',[ixCaseInsensitive]);
               Add('iSortNatIDNum', 'NatIDNum',[ixCaseInsensitive]);
               Add('iSex', 'Sex', [ixCaseInsensitive]);
               Add('iDateOfBirth', 'DateOfBirth', [ixCaseInsensitive]);
               Add('iColour', 'Colour', [ixCaseInsensitive]);
               Add('iBreed', 'Breed', [ixCaseInsensitive]);
               Add('iDamSortNatIDNum', 'DamSortNatIDNum', [ixCaseInsensitive]);
               Add('iSireSortNatIDNo', 'SireSortNatIDNo', [ixCaseInsensitive]);

               { Descending }
               Add('dSortNatIDNum', 'NatIDNum',[ixCaseInsensitive, ixDescending]);
               Add('dSex', 'Sex', [ixCaseInsensitive, ixDescending]);
               Add('dDateOfBirth', 'DateOfBirth',[ixCaseInsensitive, ixDescending]);
               Add('dColour', 'Colour', [ixCaseInsensitive, ixDescending]);
               Add('dBreed', 'Breed', [ixCaseInsensitive, ixDescending]);
               Add('dDamSortNatIDNum', 'DamSortNatIDNum', [ixCaseInsensitive, ixDescending]);
               Add('dSireSortNatIDNum', 'SireSortNatIDNo', [ixCaseInsensitive, ixDescending]);
            end;

         AfterDelete := RegTableAfterDelete;
         AfterScroll := RegTableAfterScroll;
         CreateTable;
         IndexName := 'iSortNatIDNum';
         Open;
      end;

   with DeathTable do
      begin
         if Exists then
            DeleteTable;

         with FieldDefs do
            begin
               Clear;
               Add('ID', ftAutoInc);
               Add('EventID', ftInteger);
               Add('AnimalID', ftInteger);
               Add('NatIDNum', ftString, 20);
               Add('SortNatIDNum', ftString, 20);
               Add('DateOfDeath', ftDate);
               Add('MannerOfDisposal', ftString, 30);
               Add('PlaceOfDisposal', ftString, 30);
               Add('RegisterOnFile', ftBoolean);
               Add('ValidationErrors', ftBoolean);
               //Add('WSRegistered', ftBoolean);
               Add('MRRegistered', ftBoolean);
               Add('MCRegistered', ftBoolean);
               Add('Status', ftString, 15);
               Add('MRConfirmationId', ftString, 60); // Movement Registration Confirmation Id
               Add('MCConfirmationId', ftString, 60); // Movement Confirm Confirmation Id
            end;

         with IndexDefs do
            begin
               Clear;
               Add('iID', 'ID', [ixPrimary,ixUnique]);
               { Ascending }
               Add('iAnimalID', 'AnimalID',[ixCaseInsensitive]);
               Add('iEventID', 'EventID',[ixCaseInsensitive]);
               Add('iSortNatIDNum', 'NatIDNum',[ixCaseInsensitive]);
               Add('iDateOfDeath', 'DateOfDeath',[ixCaseInsensitive]);
               Add('iMannerOfDisposal', 'MannerOfDisposal',[ixCaseInsensitive]);
               Add('iPlaceOfDisposal', 'PlaceOfDisposal',[ixCaseInsensitive]);
               { Descending }
               Add('dSortNatIDNum', 'NatIDNum',[ixCaseInsensitive, ixDescending]);
               Add('dDateOfDeath', 'DateOfDeath',[ixCaseInsensitive, ixDescending]);
               Add('dMannerOfDisposal', 'MannerOfDisposal',[ixCaseInsensitive, ixDescending]);
               Add('dPlaceOfDisposal', 'PlaceOfDisposal',[ixCaseInsensitive, ixDescending]);
            end;
         AfterDelete := RegTableAfterDelete;
         AfterScroll := RegTableAfterScroll;
         CreateTable;
         IndexName := 'iSortNatIDNum';
         Open;
      end;

   with StillBirthTable do
      begin
         if Exists then
            DeleteTable;

         with FieldDefs do
            begin
               Clear;
               Add('ID', ftAutoInc);
               Add('EventID', ftInteger);
               Add('AnimalID', ftInteger);
               Add('NatIDNum', ftString, 20);
               Add('SortNatIDNum', ftString, 20);
               Add('CalvingDate', ftDate);
               Add('Comment', ftString, 60);
               Add('CalfID',ftInteger);
               Add('CalfDead',ftBoolean);
               Add('CalfMortality',ftInteger);
               Add('RegisterOnFile', ftBoolean);
               Add('ValidationErrors', ftBoolean);
               Add('WSRegistered', ftBoolean);
               Add('ConfirmationId', ftString, 60);
            end;

         with IndexDefs do
            begin
               Clear;
               Add('iID', 'ID', [ixPrimary,ixUnique]);
               { Ascending }
               Add('iAnimalID', 'AnimalID',[ixCaseInsensitive]);
               Add('iEventID', 'EventID',[ixCaseInsensitive]);
               Add('iSortNatIDNum', 'NatIDNum',[ixCaseInsensitive]);
               Add('iCalvingDate', 'CalvingDate',[ixCaseInsensitive]);
               Add('iComment', 'Comment',[ixCaseInsensitive]);
               { Descending }
               Add('dSortNatIDNum', 'NatIDNum',[ixCaseInsensitive, ixDescending]);
               Add('dCalvingDateh', 'CalvingDate',[ixCaseInsensitive, ixDescending]);
               Add('dComment', 'Comment',[ixCaseInsensitive, ixDescending]);
            end;
         AfterDelete := RegTableAfterDelete;
         AfterScroll := RegTableAfterScroll;
         CreateTable;
         IndexName := 'iSortNatIDNum';
         Open;
      end;

   with RegErrorTable do
      begin
         if Exists then
            DeleteTable;

         with FieldDefs do
            begin
               Clear;
               Add('ID', ftAutoInc);
               Add('AnimalID', ftInteger);
               Add('ErrorDesc', ftString, 50);
            end;

         with IndexDefs do
            begin
               Clear;
               Add('iID', 'ID', [ixPrimary,ixUnique]);
               { Ascending }
               Add('iAnimalID', 'AnimalID',[ixCaseInsensitive]);
            end;

         CreateTable;
         IndexName := 'iAnimalID';
         MasterFields := 'AnimalID';
         MasterSource := ThisDataSource;
         Open;
      end;
   dsBatchRegAnimals.Dataset := RegErrorTable;
   if WinData.OwnerFile.Locate('ID', ThisHerdID, []) then
      begin
         HerdIdentity := UPPERCASE( WinData.OwnerFile.FieldByName('HerdIdentity').AsString );
      end
   else
      raise Exception.Create('Herd Identity could not be found - contact Kingswood');
   Application.OnIdle := ThisFormOnIdle;
end;

procedure TAPHISRegistration.Finalize;
begin
   Application.OnIdle := nil;  // do not move this without checking ThisFormOnIdle proc.

   if ( BirthTable <> nil ) then
      begin
         BirthTable.Close;
         BirthTable.DeleteTable;
         FreeAndNil(BirthTable);
      end;

   if ( DeathTable <> nil ) then
      begin
         DeathTable.Close;
         DeathTable.DeleteTable;
         FreeAndNil(DeathTable);
      end;

   if ( StillBirthTable <> nil ) then
      begin
         StillBirthTable.Close;
         StillBirthTable.DeleteTable;
         FreeAndNil(StillBirthTable);
      end;

   if ( RegErrorTable <> nil ) then
      begin
         RegErrorTable.Close;
         RegErrorTable.DeleteTable;
         FreeAndNil(RegErrorTable);
      end;

   if ( RegistrationTable <> nil ) then
      begin
         RegistrationTable.Close;
         FreeAndNil(RegistrationTable);
      end;

   if ( LookupCalvings <> nil ) then
      begin
         LookupCalvings.Close;
         FreeAndNil(LookupCalvings);
      end;

   if ( LookupSalesDeaths <> nil ) then
      begin
         LookupSalesDeaths.Close;
         FreeAndNil(LookupSalesDeaths);
      end;

   if ( GenQuery <> nil ) then
      begin
         GenQuery.Close;
         GenQuery.Free;
      end;

   if ( ThisDataSource <> nil ) then
      FreeAndNil(ThisDataSource);

   if ( ProgressBar <> nil ) then
      begin
         FreeAndNil(ProgressBar);
      end;
end;

procedure TAPHISRegistration.LoadAll;
begin
   pErrors.Visible := False;
   Splitter.Visible := False;
   UpdateGridColumns;
   pControls.Parent := RegistrationPages.ActivePage;
   case RegistrationPages.ActivePageIndex of
      cRegTypeBirths : ThisDataSource.DataSet := BirthTable;
      cRegTypeDeaths : ThisDataSource.DataSet := DeathTable;
      cRegTypeStillBorn : ThisDataSource.DataSet := StillBirthTable;
   end;
   Update;
   LoadAnimals(RegistrationPages.ActivePageIndex);
   UpdateStatus;
end;

procedure TAPHISRegistration.UpdateStatus;
begin
   GetRegDetails(RegistrationPages.ActivePageIndex);
   with StatusBar do
      begin
         Panels[0].Text := Format('Animal Count: %d', [TotalAnimals]);
         Panels[1].Text := Format('File ID: %d', [NextFileID]);
         if ( LastRegCreation > 0 ) then
            Panels[2].Text := Format('Last Registration: %s', [FormatDateTime(cIrishDateStyle,LastRegCreation)])
         else
            Panels[2].Text := Format('Last Registration: %s', ['']);
      end;
end;

procedure TAPHISRegistration.GetRegDetails(RegType: Integer);
begin
   case RegType of
      cRegTypeBirths : begin
                          TotalAnimals := BirthTable.RecordCount;
                          NextFileID := RegistrationTable.FieldByName('BirthRegCount').AsInteger + 1;
                          LastRegCreation := RegistrationTable.FieldByName('LastBirthRegDate').AsDateTime;
                       end;
      cRegTypeDeaths : begin
                          TotalAnimals := DeathTable.RecordCount;
                          NextFileID := RegistrationTable.FieldByName('DeathRegCount').AsInteger + 1;
                          LastRegCreation := RegistrationTable.FieldByName('LastDeathRegDate').AsDateTime;
                       end;
      cRegTypeStillBorn : begin
                              TotalAnimals := StillBirthTable.RecordCount;
                              NextFileID := RegistrationTable.FieldByName('StillBirthRegCount').AsInteger + 1;
                              LastRegCreation := RegistrationTable.FieldByName('LastStillBirthRegDate').AsDateTime;
                           end;
   end;
end;


procedure TAPHISRegistration.UpdateGridColumns;
var
   ThisCol : TColumnEh;
begin
   AnimalGrid.Columns.Clear;
   with AnimalGrid.Columns do
   begin
      BeginUpdate;
      Clear;
      if ( RegistrationPages.ActivePageIndex = cRegTypeBirths ) then
         begin
            ThisCol := Add;
            ThisCol.FieldName := 'NatIDNum';
            ThisCol.Width := 180;
            ThisCol.Title.Caption := 'National Id Number.';
            ThisCol.Title.SortMarker := smDowneh;
            ThisCol.Tag := 1;

            ThisCol := Add;
            ThisCol.FieldName := 'Sex';
            ThisCol.Width := 80;
            ThisCol.Title.Caption := 'Sex';

            ThisCol := Add;
            ThisCol.FieldName := 'DateOfBirth';
            ThisCol.Width := 95;
            ThisCol.Title.Caption := 'Date Of Birth';

            ThisCol := Add;
            ThisCol.FieldName := 'Colour';
            ThisCol.Width := 60;
            ThisCol.Title.Caption := 'Colour';

            ThisCol := Add;
            ThisCol.FieldName := 'Breed';
            ThisCol.Width := 60;
            ThisCol.Title.Caption := 'Breed';

            ThisCol := Add;
            ThisCol.FieldName := 'DamNatIDNum';
            ThisCol.Width := 180;
            ThisCol.Title.Caption := 'Dam National ID.';
            ThisCol.Tag := 2;

            ThisCol := Add;
            ThisCol.FieldName := 'SireNatIDNo';
            ThisCol.Width := 180;
            ThisCol.Title.Caption := 'Sire National ID.';
            ThisCol.Tag := 2;
         end
      else if ( RegistrationPages.ActivePageIndex = cRegTypeDeaths ) then
         begin
            ThisCol := Add;
            ThisCol.FieldName := 'NatIDNum';
            ThisCol.Width := 180;
            ThisCol.Title.Caption := 'National Id Number.';
            ThisCol.Title.SortMarker := smDowneh;
            ThisCol.Tag := 1;

            ThisCol := Add;
            ThisCol.FieldName := 'DateOfDeath';
            ThisCol.Width := 100;
            ThisCol.Title.Caption := 'Date Of Death';

            ThisCol := Add;
            ThisCol.FieldName := 'MannerOfDisposal';
            ThisCol.Width := 200;
            ThisCol.Title.Caption := 'Manner Of Disposal';

            ThisCol := Add;
            ThisCol.FieldName := 'PlaceOfDisposal';
            ThisCol.Width := 200;
            ThisCol.Title.Caption := 'Place Of Disposal';
         end
      else if ( RegistrationPages.ActivePageIndex = cRegTypeStillBorn ) then
         begin
            ThisCol := Add;
            ThisCol.FieldName := 'NatIDNum';
            ThisCol.Width := 180;
            ThisCol.Title.Caption := 'Dam National Id.';
            ThisCol.Title.SortMarker := smDowneh;
            ThisCol.Tag := 1;

            ThisCol := Add;
            ThisCol.FieldName := 'CalvingDate';
            ThisCol.Width := 95;
            ThisCol.Title.Caption := 'Date Of Birth';

            ThisCol := Add;
            ThisCol.FieldName := 'Comment';
            ThisCol.Width := 400;
            ThisCol.Title.Caption := 'Comment';
         end;
      EndUpdate;
   end;
end;

procedure TAPHISRegistration.LoadAnimals(RegType: Integer);
type
   TSireOrDamType = (sdSire, sdDam);
var
   FormattedNatID,
   DamTagNo : String;

   procedure LoadBirths;
   var
      i : byte;

      procedure AddSireOrDamTagNo(ADamOrSireID : Integer; SireOrDam : TSireOrDamType);
      var
         sFieldName : String;
         qDamOrSire : TQuery;
      begin
         if ( ADamOrSireID = 0 ) then Exit;
         qDamOrSire := TQuery.Create(nil);
         with qDamOrSire do
            try
               DatabaseName := AliasName;
               SQL.Clear;
               SQL.Add('SELECT NatIDNum');
               SQL.Add('FROM Animals');
               SQL.Add('WHERE ID = '+IntToStr(ADamOrSireID)+'');
               try
                  Open;
                  BirthTable.FieldByName('RegisterOnFile').AsBoolean := ( (RecordCount > 0) and (Length(Fields[0].AsString) > 0) );
                  //   02/12/16 [V5.6 R3.7] /MK Bug Fix - Field ID not found error appearing because previous code was using FieldByName('ID').Value.
                  if ( RecordCount = 0 ) then
                     InsertErrorRecord(ADamOrSireID, 'Missing Dam Record');
                  if ( Length(Fields[0].AsString) = 0 ) then
                     InsertErrorRecord(ADamOrSireID, 'Dam National Identity Number Missing');
                  if ( not(BirthTable.FieldByName('RegisterOnFile').AsBoolean) ) then Exit;

                  sFieldName := '';
                  if ( SireOrDam = sdSire ) then
                     sFieldName := 'SireNatIDNo'
                  else
                     sFieldName := 'DamNatIDNum';

                  if ( IsNINatID(Fields[0].AsString) ) then
                     begin
                        FormattedNatID := Fields[0].AsString;
                        if ( WinData.CheckNINatID(FormattedNatID,FormattedNatID,False) ) then
                           begin
                              FormattedNatID := FormatUK9Tag(FormattedNatID);
                              BirthTable.FieldByName(sFieldName).AsString := FormattedNatID;
                           end
                        else
                           BirthTable.FieldByName(sFieldName).AsString := FormatUK9Tag(Fields[0].AsString);
                     end
                  else if ( IsNewIrishNatID(Fields[0].AsString) ) then
                     BirthTable.FieldByName(sFieldName).AsString := CheckIETagFormat(WinData.StripAllNomNumAlpha(Fields[0].AsString))
                  else if ( UPPERCASE(Fields[0].AsString)[Length(Fields[0].AsString)] in (['A'..'Z'])) then
                     BirthTable.FieldByName(sFieldName).AsString := Fields[0].AsString
                  else
                     begin
                        FormattedNatID := WinData.StripAllNomNumAlpha(Fields[0].AsString);
                        FormattedNatID := Copy(FormattedNatID,0,Length(FormattedNatID)-6);
                        FormattedNatID := FormattedNatID + ' ' + Copy(WinData.StripAllNomNumAlpha(Fields[0].AsString),
                                                                      Length(WinData.StripAllNomNumAlpha(Fields[0].AsString))-5,
                                                                      Length(WinData.StripAllNomNumAlpha(Fields[0].AsString)));
                        BirthTable.FieldByName(sFieldName).AsString := FormattedNatID;
                     end;
               except
                  on e : Exception do
                     ShowMessage(e.Message);
               end;
            finally
               Free;
            end;
      end;

   begin
      BirthTable.AfterScroll := nil; // stop unwanted flickering of nav bar buttons.
      SQLEmptyTable(BirthTable.TableName);
      BirthTable.DisableControls;

      with GenQuery do
         begin

            for i := 1 to 4 do
               begin
                  SQL.Clear;
                  SQL.Add('INSERT INTO BirthReg ( EventID, AnimalID )');
                  case i of
                     1 : SQL.Add('SELECT EventID, ID1');
                     2 : SQL.Add('SELECT EventID, ID2');
                     3 : SQL.Add('SELECT EventID, ID3');
                     4 : SQL.Add('SELECT EventID, ID4');
                  end;
                  SQL.Add('FROM "Calvings.DB"');
                  case i of
                     1 : begin
                            SQL.Add('WHERE(ID1Notified=FALSE)');
                            SQL.Add('AND(ID1>0)');
                            SQL.Add('AND (CalfDead1=FALSE)');
                         end;
                     2 : begin
                            SQL.Add('WHERE(ID2Notified=FALSE)');
                            SQL.Add('AND(ID2>0)');
                            SQL.Add('AND (CalfDead2=FALSE)');
                         end;
                     3 : begin
                            SQL.Add('WHERE(ID3Notified=FALSE)');
                            SQL.Add('AND(ID3>0)');
                            SQL.Add('AND (CalfDead3=FALSE)');
                         end;
                     4 : begin
                            SQL.Add('WHERE(ID4Notified=FALSE)');
                            SQL.Add('AND(ID4>0)');
                            SQL.Add('AND (CalfDead4=FALSE)');
                         end;
                  end;
                  ExecSQL;

               end;

            SQL.Clear;
            SQL.Add('DELETE FROM BirthReg');
            SQL.Add('WHERE AnimalID NOT IN (SELECT ID FROM Animals WHERE (HerdID = :AHerdID))');
            Params[0].AsInteger := ThisHerdID;
            ExecSQL;

            BirthTable.Refresh;
            SQL.Clear;
            SQL.Add('SELECT ID, AnimalNo, NatIDNum, SortNatId, Colour, PrimaryBreed, Sex, DateOfBirth, DamID, SireID, HerdID ');
            SQL.Add('FROM Animals A, BirthReg T');
            SQL.Add('WHERE (T.AnimalID=A.ID)');
            SQL.Add('ORDER BY ID ');
            Open;

            try
               First;
               while not eof do
                  begin
                     if BirthTable.Locate('AnimalID', FieldByName('ID').Value,[] ) then
                        begin
                           BirthTable.Edit;
                           try
                              BirthTable.FieldByName('RegisterOnFile').AsBoolean := TRUE;
                              BirthTable.FieldByName('ValidationErrors').AsBoolean := FALSE;
                              BirthTable.FieldByName('WSRegistered').AsBoolean := FALSE;
                              BirthTable.FieldByName('Status').AsString := 'awaiting';


                              BirthTable.FieldByName('NatIDNum').AsString := FieldByName('NatIDNum').AsString;

                              if not ( BirthTable.FieldByName('NatIDNum').IsNull ) then
                                 begin
                                    if not WinData.ValidNITagNo(BirthTable.FieldByName('NatIdNum').AsString) then
                                       begin
                                          InsertErrorRecord(FieldByName('ID').Value, 'Invalid National Identity Number');
                                          BirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                       end;
                                 end
                              else
                                 begin
                                    InsertErrorRecord(FieldByName('ID').Value, 'Blank National Identity Number');
                                    BirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                 end;


                              FormattedNatID := BirthTable.FieldByName('NatIDNum').AsString;
                              if WinData.CheckNINatID(FormattedNatID,FormattedNatID,False) then
                                 begin
                                    FormattedNatID := FormatUK9Tag(FormattedNatID);
                                    BirthTable.FieldByName('NatIDNum').AsString := FormattedNatID;
                                 end
                              else
                                 BirthTable.FieldByName('NatIDNum').AsString := FormatUK9Tag(FieldByName('NatIDNum').AsString);

                              BirthTable.FieldByName('SortNatIDNum').AsString := FieldByName('SortNatID').AsString;
                              BirthTable.FieldByName('Sex').AsString := FieldByName('Sex').AsString;
                              BirthTable.FieldByName('DateOfBirth').AsDateTime := FieldByName('DateOfBirth').AsDateTime;
                              if ( BirthTable.FieldByName('DateOfBirth').AsDateTime > 0 ) then
                                 begin
                                    if ( BirthTable.FieldByName('DateOfBirth').AsDateTime <= Date ) then
                                       begin
                                          if ( BirthTable.FieldByName('DateOfBirth').AsDateTime < ( Date() - 27 ) ) then
                                             begin
                                                InsertErrorRecord(FieldByName('ID').Value, '27 Day Limit Exceeded');
                                                BirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                             end;
                                       end
                                    else
                                       begin
                                          InsertErrorRecord(FieldByName('ID').Value, 'Invalid Date of Birth');
                                          BirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                       end;
                                 end
                              else
                                 begin
                                    InsertErrorRecord(FieldByName('ID').Value, 'Date of Birth Not Found');
                                    BirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                 end;

                              // Now try locate the calf's colour and colour code
                              if WinData.GenLookUp.Locate('ID',FieldByName('Colour').Value,[] ) then
                                 begin
                                    BirthTable.FieldByName('Colour').AsString := UPPERCASE(WinData.GenLookUp.FieldByName('LookUpCode').AsString);
                                    if not IsValidColourCode( BirthTable.FieldByName('Colour').AsString ) then
                                       begin
                                          InsertErrorRecord(FieldByName('ID').Value, 'Invalid Colour Code');
                                          BirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                       end;
                                 end
                              else
                                 begin
                                    InsertErrorRecord(FieldByName('ID').Value, 'Colour Code Not Found');
                                    BirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                 end;

                              // Now try locate the calf's breed and breed code
                              if WinData.Breeds.Locate('ID',FieldByName('PrimaryBreed').Value,[] ) then
                                 BirthTable.FieldByName('Breed').AsString := UPPERCASE(WinData.Breeds.FieldByName('Code').AsString)
                              else
                                 begin
                                    InsertErrorRecord(FieldByName('ID').Value, 'Breed Code Not Found');
                                    BirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                 end;

                              // Get the Dam Nat ID.
                              AddSireOrDamTagNo(FieldByName('SireID').AsInteger,sdSire);
                              AddSireOrDamTagNo(FieldByName('DamID').AsInteger,sdDam);

                              BirthTable.Post;
                           except
                              on E : EDatabaseError do
                                  begin
                                     BirthTable.Cancel;
                                     MessageDlg(Format('Failed to create animal birth record. ID: %s',[FieldByName('NatIDNum').AsString]),mtError,[mbOK],0);
                                  end;
                           end;
                        end;
                     Next;
                  end;
            finally
               Close;
               BirthTable.Refresh;
               BirthTable.First;
               BirthTable.EnableControls;
               BirthTable.AfterScroll := RegTableAfterScroll;
               RegTableAfterScroll(BirthTable);
            end;
         end;
   end;

   procedure LoadDeaths;
   begin
      DeathTable.AfterScroll := nil; // stop unwanted flickering of nav bar buttons.
      SQLEmptyTable(DeathTable.TableName);
      Update;
      with GenQuery do
         begin
            SQL.Clear;
            SQL.Add('SELECT DISTINCT (A.ID), A.NatIDNum, A.SortNatID, E.ID EID, E.EventDate,');
            SQL.Add('                 S.Disposal, S.Customer ');
            SQL.Add('FROM Animals A');
            SQL.Add('LEFT JOIN Events E ON (E.AnimalID = A.ID)');
            SQL.Add('LEFT JOIN SalesDeaths S ON (S.EventID = E.ID)');
            SQL.Add('WHERE (E.EventType = :AEventType )');
            SQL.Add('AND (A.HerdID = :AHerdID )');
            SQL.Add('AND (E.HerdID = A.HerdID )');
            SQL.Add('AND (A.InHerd=FALSE)');
            SQL.Add('AND (S.Sold=FALSE)');

            // Ignore any death registrations that were previously dismissed by the user
            SQL.Add('AND ((S.NIWSDismissedByUser IS NULL) OR (S.NIWSDismissedByUser = False))');
            {
                NIWSNotified stores true if animal death registration was completed.
                NIWSNotified2 stores true if animal death confirmation was completed.
             }
            SQL.Add('AND (((S.NIWSNotified=FALSE) OR (S.NIWSNotified IS NULL))');
            SQL.Add('   AND ((S.NIWSNotified2=FALSE) OR (S.NIWSNotified2 IS NULL)))');


            // 16/05/2013

            // NIWSNotified will be filled with True if farmer has NOTIFIED movement using APHIS web services
            // NIWSNotified2 will be filled with True if farmer CONFIRMS movement using APHIS web services

            // We must take the movement details of any animal if the movement
            // details where not notified or confirmed by the farmer.

            // If the animal movement has been notified by the farmer, the movement confirmation
            // is not required. If the animal movement has been notified by anyone other than
            // the farmer (ie Knackery) then farmer must confirm the movement.

            SQL.Add('ORDER BY A.ID');
            Params[0].AsInteger := CSaleDeathEvent;
            Params[1].AsInteger := ThisHerdID;
            Prepare;
            Open;

            DeathTable.DisableControls;
            try
               First;
               while not eof do
                  begin
                     DeathTable.Append;
                     try
                        DeathTable.FieldByName('RegisterOnFile').AsBoolean := TRUE;
                        DeathTable.FieldByName('ValidationErrors').AsBoolean := FALSE;
                        DeathTable.FieldByName('MRRegistered').AsBoolean := FALSE;
                        DeathTable.FieldByName('MCRegistered').AsBoolean := FALSE;
                        DeathTable.FieldByName('Status').AsString := 'awaiting';
                        DeathTable.FieldByName('AnimalID').AsInteger := FieldByName('ID').AsInteger;
                        DeathTable.FieldByName('EventID').AsInteger := FieldByName('EID').AsInteger;

                        if ( FieldByName('NatIDNum').IsNull ) then
                           begin
                              InsertErrorRecord(FieldByName('ID').Value, 'Blank National Identity Number');
                              DeathTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                           end
                        else
                           begin

                              if IsNINatID(FieldByName('NatIDNum').AsString) then
                                 begin
//                                    DeathTable.FieldByName('NatIDNum').AsString := FormatUK9Tag(FieldByName('NatIDNum').AsString);
                                    FormattedNatID := FieldByName('NatIDNum').AsString;
                                    if WinData.CheckNINatID(FormattedNatID,FormattedNatID,False) then
                                       begin
                                          FormattedNatID := FormatUK9Tag(FormattedNatID);
                                          DeathTable.FieldByName('NatIDNum').AsString := FormattedNatID
                                       end
                                    else
                                       DeathTable.FieldByName('NatIDNum').AsString := FormatUK9Tag(FieldByName('NatIDNum').AsString);
                                 end
                              else if ( UPPERCASE(FieldByName('NatIDNum').AsString)[Length(FieldByName('NatIDNum').AsString)] in (['A'..'Z'])) then
                                 begin
                                    // Check what type of tag format to outpur
                                    // Older tag format, Check Digit is Alpha Char
                                    // 19/09/11 [V4.1 R4.9] /MK Additional Feature - TGM Said To Remove This CheckOldNITagFormat As New Rules Don't Need Formatting.
                                    // DeathTable.FieldByName('NatIDNum').AsString := CheckOldNITagFormat(FieldByName('NatIDNum').AsString)
                                    DeathTable.FieldByName('NatIDNum').AsString := FieldByName('NatIDNum').AsString
                                 end
                              else
                                 begin
                                    DeathTable.FieldByName('NatIDNum').AsString := CheckIETagFormat(WinData.StripAllNomNumAlpha(FieldByName('NatIDNum').AsString));
                                 end;
                           end;

                        DeathTable.FieldByName('SortNatIDNum').AsString := FieldByName('SortNatID').AsString;
                        DeathTable.FieldByName('DateOfDeath').AsDateTime := FieldByName('EventDate').AsDateTime;

                        if ( DeathTable.FieldByName('DateOfDeath').AsDateTime > 0 ) then
                           begin
                              if ( DeathTable.FieldByName('DateOfDeath').AsDateTime <= Date ) then
                                 begin
                                    if ( DeathTable.FieldByName('DateOfDeath').AsDateTime < ( Date() - 27 ) ) then
                                       begin
                                          InsertErrorRecord(FieldByName('ID').Value, '27 Day Limit Exceeded');
                                          DeathTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                       end;
                                 end
                              else
                                 begin
                                    InsertErrorRecord(FieldByName('ID').Value, 'Date Of Death After Today');
                                    DeathTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                 end;
                           end
                        else
                           begin
                              InsertErrorRecord(FieldByName('ID').Value, 'Date Of Death Missing');
                              DeathTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                           end;

                        if not ( FieldByName('Disposal').IsNull ) then
                           begin
                              if WinData.GenLookUp.Locate('ID', FieldByName('Disposal').AsInteger, []) then
                                 begin
                                    DeathTable.FieldByName('MannerOfDisposal').AsString := WinData.GenLookUp.FieldByName('Description').AsString;
                                 end
                              else
                                 begin
                                    InsertErrorRecord(FieldByName('ID').Value, 'Unknown Disposal Type');
                                    DeathTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                 end;
                           end
                        else
                           begin
                              InsertErrorRecord(FieldByName('ID').Value, 'Unknown Disposal Type');
                              DeathTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                           end;

                        if not ( FieldByName('Customer').IsNull ) then
                           begin
                              if WinData.Customers.Locate('ID', FieldByName('Customer').AsInteger, []) then
                                 begin
                                    DeathTable.FieldByName('PlaceOfDisposal').AsString := WinData.Customers.FieldByName('Name').AsString;
                                 end
                              else
                                 begin
                                    InsertErrorRecord(FieldByName('ID').Value, 'Unknown Disposal Place');
                                    DeathTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                 end;
                           end
                        else
                           begin
                              InsertErrorRecord(FieldByName('ID').Value, 'Disposal Place Missing');
                              DeathTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                           end;
                        DeathTable.Post;
                     except
                        on E : EDatabaseError do
                           begin
                              DeathTable.Cancel;
                              MessageDlg(Format('Failed to create animal death record. ID: %s',[ FieldByName('NatIDNum').AsString]),mtError,[mbOK],0);
                           end;
                     end;
                     Next; // GenQuery
                  end;
            finally
               Close;  // GenQuery
               DeathTable.Refresh;
               DeathTable.First;
               DeathTable.EnableControls;
               DeathTable.AfterScroll := RegTableAfterScroll;
               RegTableAfterScroll(DeathTable);
            end;
         end;
   end;

   procedure LoadStillBirths;
   var
      iterator : integer;
   begin
      StillBirthTable.AfterScroll := nil; // stop unwanted flickering of nav bar buttons.
      SQLEmptyTable(StillBirthTable.TableName);
      StillBirthTable.DisableControls;

      with GenQuery do
         begin
            for iterator := 1 to cMaxCalves do
                begin
                   SQL.Clear;
                   SQL.Add('INSERT INTO tNIStillBirthReg');
                   SQL.Add('( EventID, CalfID, CalfDead, CalfMortality ) ');
                   SQL.Add(Format('SELECT EventID,  ID%d, CalfDead%d, CalfMortality%d',[Iterator,Iterator,Iterator]));
                   SQL.Add('FROM Calvings             ');
                   SQL.Add(Format('WHERE ((ID%dNotified=FALSE) AND (CalfDead%d=TRUE))',[Iterator,Iterator]));
                   ExecSQL;
                end;

            SQL.Clear;
            SQL.Add('SELECT A.ID, A.NatIDNum, A.SortNatId, E.ID EID, E.EventDate, E.EventDesc, T.*');
            SQL.Add('FROM Animals A, Events E, tNIStillBirthReg T');
            SQL.Add('Where  ((E.ID=T.EventID) AND (E.AnimalID=A.ID))');
            SQL.Add('ORDER BY A.ID');
            Open;

            try
               First;
               while not eof do
                  begin
                     if StillBirthTable.Locate('EventID', GenQuery.FieldByName('EID').Value,[] ) then
                        begin
                           StillBirthTable.Edit;
                           try
                              StillBirthTable.FieldByName('RegisterOnFile').AsBoolean := TRUE;
                              StillBirthTable.FieldByName('ValidationErrors').AsBoolean := FALSE;
                              StillBirthTable.FieldByName('WSRegistered').AsBoolean := FALSE;
                              StillBirthTable.FieldByName('AnimalID').AsInteger := GenQuery.FieldByName('ID').AsInteger;
                              StillBirthTable.FieldByName('NatIDNum').AsString := FormatUK9Tag(FieldByName('NatIDNum').AsString);
                              if ( StillBirthTable.FieldByName('NatIDNum').IsNull ) then
                                 begin
                                    InsertErrorRecord(FieldByName('ID').Value, 'Blank National Identity Number');
                                    StillBirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                 end
                              else
                                 begin
                                    if IsNINatID(FieldByName('NatIDNum').AsString) then
                                       begin
                                          //StillBirthTable.FieldByName('NatIDNum').AsString := FormatUK9Tag(FieldByName('NatIDNum').AsString);
                                          FormattedNatID := FieldByName('NatIDNum').AsString;
                                          if WinData.CheckNINatID(FormattedNatID,FormattedNatID,False) then
                                             begin
                                                FormattedNatID := FormatUK9Tag(FormattedNatID);
                                                StillBirthTable.FieldByName('NatIDNum').AsString := FormattedNatID
                                             end
                                          else
                                             StillBirthTable.FieldByName('NatIDNum').AsString := FormatUK9Tag(FieldByName('NatIDNum').AsString);
                                       end
                                    else if ( UPPERCASE(FieldByName('NatIDNum').AsString)[Length(FieldByName('NatIDNum').AsString)] in (['A'..'Z'])) then
                                       begin
                                          // Check what type of tag format to outpur
                                          // Older tag format, Check Digit is Alpha Char
                                          // 19/09/11 [V4.1 R4.9] /MK Additional Feature - TGM Said To Remove This CheckOldNITagFormat As New Rules Don't Need Formatting.
                                          // StillBirthTable.FieldByName('NatIDNum').AsString := CheckOldNITagFormat(FieldByName('NatIDNum').AsString)
                                          StillBirthTable.FieldByName('NatIDNum').AsString := FieldByName('NatIDNum').AsString
                                       end
                                    else
                                       begin
                                          StillBirthTable.FieldByName('NatIDNum').AsString := CheckIETagFormat(WinData.StripAllNomNumAlpha(FieldByName('NatIDNum').AsString));
                                       end;

{                                    if not WinData.IsNINatID(StillBirthTable.FieldByName('NatIDNum').AsString) then
                                       begin
                                          StillBirthTable.FieldByName('NatIDNum').AsString := WinData.StripAllNomNumAlpha(FieldByName('NatIDNum').AsString);
                                       end;
}
                                 end;

                              StillBirthTable.FieldByName('SortNatIDNum').AsString := FieldByName('SortNatID').AsString;
                              StillBirthTable.FieldByName('CalvingDate').AsDateTime := FieldByName('EventDate').AsDateTime;
                              if ( StillBirthTable.FieldByName('CalvingDate').AsDateTime > 0 ) then
                                 begin
                                    if ( StillBirthTable.FieldByName('CalvingDate').AsDateTime <= Date ) then
                                       begin
                                          if ( StillBirthTable.FieldByName('CalvingDate').AsDateTime < ( Date() - 27 ) ) then
                                             begin
                                                InsertErrorRecord(FieldByName('ID').Value, '27 Day Limit Exceeded');
                                                StillBirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                             end;
                                       end
                                    else
                                       begin
                                          InsertErrorRecord(FieldByName('ID').Value, 'Calving Date After Today');
                                          StillBirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                       end;
                                 end
                              else
                                 begin
                                    InsertErrorRecord(FieldByName('ID').Value, 'Invalid Calving Date');
                                    StillBirthTable.FieldByName('RegisterOnFile').AsBoolean := FALSE;
                                 end;


                              for iterator := 1 to cMaxCalves do
                                 begin
                                    if (FieldByName('CalfID').AsInteger > 0 ) then
                                    if ((FieldByName('CalfDead').AsBoolean) and (FieldByName('CalfMortality').AsInteger > 0)) then
                                       begin
                                          if ( HerdLookup.NIStillBornReasons.Locate('ID',FieldByName('CalfMortality').AsInteger,[]) ) then
                                             StillBirthTable.FieldByName('Comment').AsString := HerdLookup.NIStillBornReasonsDescription.AsString;
                                          Break;
                                       end;
                                 end;

                              StillBirthTable.Post;
                           except
                              on E : EDatabaseError do
                                 begin
                                    StillBirthTable.Cancel;
                                    MessageDlg(Format(E.Message + ' Failed to create animal birth record. ID: %s',[ FieldByName('NatIDNum').AsString]),mtError,[mbOK],0);
                                 end;
                           end;
                        end;
                     Next;
                  end;
            finally
               Close;
               StillBirthTable.Refresh;
               StillBirthTable.First;
               StillBirthTable.EnableControls;
               StillBirthTable.AfterScroll := RegTableAfterScroll;
               RegTableAfterScroll(StillBirthTable);
            end;
         end;
   end;
begin
   Screen.Cursor := crHourGlass;
   SQLEmptyTable(RegErrorTable.TableName);
   try
      //   09/02/13 [V5.1 R4.1] /MK Additional Feature - Check to see if RelinkCalvesToDams needs to run.
      WinData.CheckForRelinkCalvesToDams(cCheckCalvesForOneMonth);

      case RegType of
         cRegTypeBirths : LoadBirths;
         cRegTypeDeaths : LoadDeaths;
         cRegTypeStillBorn : LoadStillBirths;
      end;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TAPHISRegistration.CreateFileAndReg(RegType: Integer);
var
   XMLWriter : TXMLGenerator;
   FileRecCount, NoInvalid : Integer;
   sFileName : string;
   sRegType : Char;
   RegSuccess : Boolean;
   RegDesc : string;
   strList : TStringList;
begin
   FileRecCount := 0;
   sRegType := #0;
   RegSuccess := False;
   RegDesc := '';
   if ( RegType = cRegTypeBirths ) then
      begin
         FileRecCount := FileAnimalCount(BirthTable.TableName);
         sFileName := 'APHISRegBirth';
         sRegType := cRegType_Births;
         NoInvalid := BirthTable.RecordCount - FileRecCount;
         RegDesc := 'Birth';
      end
   else if ( RegType = cRegTypeDeaths ) then
      begin
         FileRecCount := FileAnimalCount(DeathTable.TableName);
         sFileName := 'APHISRegDeath';
         sRegType := cRegType_Deaths;
         NoInvalid := DeathTable.RecordCount - FileRecCount;
         RegDesc := 'Death';
      end
   else if ( RegType = cRegTypeStillBorn ) then
      begin
         FileRecCount := FileAnimalCount(StillBirthTable.TableName);
         sFileName := 'APHISRegStillB';
         sRegType := cRegType_StillBirths;
         NoInvalid := StillBirthTable.RecordCount - FileRecCount;
         RegDesc := 'Still Birth';
      end;

  if ( sRegType = #0 ) then
     begin
        MessageDlg('Unrecognized FileType Code',mtError,[mbOK],0);
        Abort;
     end;

  if ( FileRecCount <= 0 ) then
     begin
        if ( NoInvalid > 0 ) then
           MessageDlg(Format('There are no valid %s records to be registered at this time.'+cCRLF+cCRLF+
                             '%d invalid %s record(s) are awaiting registration',[RegDesc,NoInvalid,RegDesc]),mtInformation,[mbOK],0)
        else
           MessageDlg(Format('There are no %s records to be registered at this time.',[RegDesc]),mtInformation,[mbOK],0);
        Abort;
     end;

  Screen.Cursor := crHourGlass;

  sFileName := ExtractFilePath(ParamStr(0)) + IncludeTrailingBackslash(cRegFileDir) +
               Format(sFileName+'%s_k%d.xml', [FormatDateTime('ddmmyy', Date), NextFileID]);

  XMLWriter := TXMLGenerator.CreateFragment(1024);
  XMLWriter.UseIndentation := False;

  try
     XMLWriter.StartTag(cxml_FileNameTag);
     XMLWriter.AddData(ExtractFileName(sFileName));
     XMLWriter.StopTag;

     XMLWriter.StartTag(cxml_RegTypeTag);
     XMLWriter.AddData(sRegType);
     XMLWriter.StopTag;

     XMLWriter.StartTag(cxml_FileIdTag);
     XMLWriter.AddData(IntToStr(NextFileID));
     XMLWriter.StopTag;

     XMLWriter.StartTag(cxml_NoOfAnimalsTag);
     XMLWriter.AddData(IntToStr(FileRecCount));
     XMLWriter.StopTag;

     if ( RegType = cRegTypeBirths ) then
        begin
           with BirthTable do
              begin
                 First;

                 while not eof do
                    begin

                       if FieldByName('RegisterOnFile').AsBoolean then
                          begin

                             XMLWriter.StartTag(cxml_NewAnimalRegInfoTag);

                                 XMLWriter.StartTag(cxml_HerdNoTag);
                                 XMLWriter.AddData(HerdIdentity);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_AnimalNoTag);
                                 XMLWriter.AddData(FieldByName('NatIDNum').AsString);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_ColourTag);
                                 XMLWriter.AddData(FieldByName('Colour').AsString);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_SexTag);
                                 if UPPERCASE(FieldByName('Sex').AsString) = 'FEMALE' then
                                    XMLWriter.AddData('F')
                                 else if UPPERCASE(FieldByName('Sex').AsString) = 'STEER' then
                                    XMLWriter.AddData('M')
                                 else if UPPERCASE(FieldByName('Sex').AsString) = 'BULL' then
                                    XMLWriter.AddData('B');
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_BreedTag);
                                 XMLWriter.AddData(FieldByName('Breed').AsString);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_DOBTag);
                                 XMLWriter.AddData(FormatDateTime(cIrishDateStyle, FieldByName('DateOfBirth').AsDateTime));
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_DamTag);
                                 XMLWriter.AddData(FieldByName('DamNatIDNum').AsString);
                                 XMLWriter.StopTag;

                             XMLWriter.StopTag;
                          end;
                       Next;
                    end;
              end;
        end
     else if ( RegType = cRegTypeDeaths ) then
        begin
           with DeathTable do
              begin
                 First;
                 while not eof do
                    begin
                       if FieldByName('RegisterOnFile').AsBoolean then
                          begin
                             XMLWriter.StartTag(cxml_DeadAnimalInfoTag);

                                 XMLWriter.StartTag(cxml_HerdNoTag);
                                 XMLWriter.AddData(HerdIdentity);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_AnimalNoTag);
                                 XMLWriter.AddData(FieldByName('NatIDNum').AsString);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_DateOfDeathTag);
                                 XMLWriter.AddData(FormatDateTime(cIrishDateStyle, FieldByName('DateOfDeath').AsDateTime));
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_MannerDisposalTag);
                                 XMLWriter.AddData(UPPERCASE(FieldByName('MannerOfDisposal').AsString));
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_PlaceDisposalTag);
                                 XMLWriter.AddData(UPPERCASE(FieldByName('PlaceOfDisposal').AsString));
                                 XMLWriter.StopTag;

                             XMLWriter.StopTag;
                          end;
                       Next;
                    end;
              end;
        end
     else if ( RegType = cRegTypeStillBorn ) then
        begin
           with StillBirthTable do
              begin
                 First;
                 while not eof do
                    begin
                       if FieldByName('RegisterOnFile').AsBoolean then
                          begin

                             XMLWriter.StartTag(cxml_StillBornInfoTag);

                                 XMLWriter.StartTag(cxml_HerdNoTag);
                                 XMLWriter.AddData(HerdIdentity);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_DamTag);
                                 XMLWriter.AddData(FieldByName('NatIDNum').AsString);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_DOBTag);
                                 XMLWriter.AddData(FormatDateTime(cIrishDateStyle, FieldByName('CalvingDate').AsDateTime));
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_CommentTag);
                                 XMLWriter.AddData(FieldByName('Comment').AsString);
                                 XMLWriter.StopTag;

                             XMLWriter.StopTag;
                          end;
                       Next;
                    end;
              end;
        end;

      if XMLWriter.AsString <> '' then
         begin
            XMLWriter.SaveToFile(sFileName);
            if ( RegType = cRegTypeBirths ) then
               RegSuccess := RegisterBirths(True, False)
            else if ( RegistrationPages.ActivePageIndex = cRegTypeDeaths ) then
               RegSuccess := RegisterDeaths(True)
            else if ( RegistrationPages.ActivePageIndex = cRegTypeStillBorn ) then
               RegSuccess := RegisterBirths(True, True);
            if ( RegSuccess ) then
               begin
                  UpdateRegInfo(RegType);
                  UpdateStatus;
                  MessageDlg(Format('File created successfully.'+ cCRLF + cCRLF +'%s', [sFileName]),mtInformation,[mbOK],0);
                  MessageDlg('Please check your APHIS Movements file to ensure the animals are registered OK.',mtInformation,[mbOK],0);
               end
            else
               MessageDlg('Registration failed - contact Kingswood',mtError,[mbOK],0);
         end;

  finally
     FreeAndNil(XMLWriter);
     strList := TStringList.Create;
     try
     // spurious line with blocks being written to end of stream strip this line .
     strList := TStringList.Create;
     strList.LoadFromFile(sFileName);
     strList.SaveToFile(sFileName);
     finally
     strList.Free;
     end;
     Screen.Cursor := crDefault;
  end;
end;

procedure TAPHISRegistration.UpdateRegInfo(RegType : Integer);
begin
   RegistrationTable.First;
   RegistrationTable.Edit;
   try
      if ( RegType = cRegTypeBirths ) then
         begin
            RegistrationTable.FieldByName('BirthRegCount').AsInteger := NextFileID;
            RegistrationTable.FieldByName('LastBirthRegDate').AsDateTime := Date;
         end
      else if ( RegType = cRegTypeDeaths ) then
         begin
            RegistrationTable.FieldByName('DeathRegCount').AsInteger := NextFileID;
            RegistrationTable.FieldByName('LastDeathRegDate').AsDateTime := Date;
         end
      else if ( RegType = cRegTypeStillBorn ) then
         begin
            RegistrationTable.FieldByName('StillBirthRegCount').AsInteger := NextFileID;
            RegistrationTable.FieldByName('LastStillBirthRegDate').AsDateTime := Date;
         end;
      RegistrationTable.Post;
   except
      RegistrationTable.Cancel;
      MessageDlg('Failed to update batch registration details - contact Kingswood',mtError,[mbOK],0);
   end;
end;

procedure TAPHISRegistration.InsertErrorRecord(const AnimalID: Integer;
  const ErrorStr: string);
begin
   with RegErrorTable do
      begin
         Append;
         try
            FieldByName('AnimalID').AsInteger := AnimalID;
            FieldByName('ErrorDesc').AsString := ErrorStr;
            Post;
         except
            Cancel;
         end;
      end;
end;

procedure TAPHISRegistration.AnimalGridGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
   if ( AnimalGrid.DataSource.Dataset.FindField('RegisterOnFile') <> nil ) then
      begin
         if not ( AnimalGrid.DataSource.Dataset.FieldByName('RegisterOnFile').AsBoolean ) then
            AFont.Color := clRed;
      end;

   if ( AnimalGrid.DataSource.DataSet.RecordCount > 5 ) then
      if ( AnimalGrid.DataSource.DataSet.RecNo mod 2 = 1 ) then
         Background := $00FFDDDD
      else
         Background := clwindow;
end;

procedure TAPHISRegistration.RegTableAfterScroll(DataSet: TDataSet);
begin
   if Dataset.RecordCount > 0 then
      begin
         if ( Dataset.FindField('RegisterOnFile') <> nil ) then
            begin
               pErrors.Visible := not(Dataset.FindField('RegisterOnFile').AsBoolean);
               Splitter.Visible := pErrors.Visible;
               ImageTimer.Enabled := pErrors.Visible;
               ErrorGrid.DataSource.DataSet.First;
            end
         else
            begin
               pErrors.Visible := False;
               Splitter.Visible := False;
            end;
         Update;
      end;
end;

procedure TAPHISRegistration.sbReloadClick(Sender: TObject);
begin
   if MessageDlg('Load all animals, are you sure?', mtConfirmation, [mbYes,mbNo],0) = idYes then
      LoadAll;
end;

procedure TAPHISRegistration.RemovePermanently1Click(Sender: TObject);
begin
   if MessageDlg('Are you sure?', mtConfirmation,[mbYes,mbNo],0) = idYes then
      begin
         if ( RegistrationPages.ActivePageIndex = cRegTypeBirths ) then
             RegisterBirths(False, False)
         else if ( RegistrationPages.ActivePageIndex = cRegTypeDeaths ) then
             RegisterDeaths(False)
         else if ( RegistrationPages.ActivePageIndex = cRegTypeStillBorn ) then
             RegisterBirths(False, True);
      end;
end;

function TAPHISRegistration.FileAnimalCount(TableName: String): Integer;
begin
   with TQuery.Create(nil) do
      try
         DatabaseName := 'kingswd';
         SQL.Clear;
         SQL.Add(Format('SELECT COUNT(ID) RecCount FROM %s WHERE RegisterOnFile = TRUE', [TableName]));
         Open;
         try
            First;
            Result := FieldByName('RecCount').AsInteger;
         finally
            Close;
         end;
      finally
         Free;
      end;
end;

procedure TAPHISRegistration.sbRegisterClick(Sender: TObject);
begin
   if WinData.AdvisoryRoleActive then
      begin
         MessageDlg(cAdvisoryAccessMsg,mtWarning,[mbOK],0);
         exit;
      end;

   // As of V5.1 R5.5 Still births can be registered using V1.0 3.0 of Aphisws.exe
   RegisterUsingWebServices;
end;

function TAPHISRegistration.RegisterBirths(const RegisterAll, StillBirth : Boolean) : Boolean;
var
  i : integer;
  IsBirthRegistration : Boolean;

  procedure DoRegisterCalf() ;
  begin
     if IsBirthRegistration then
        RegisterCalf(BirthTable.FieldByName('EventId').AsInteger,
                     BirthTable.FieldByName('AnimalId').AsInteger,
                     '')
     else
        RegisterCalf(StillBirthTable.FieldByName('EventId').AsInteger,
                     StillBirthTable.FieldByName('CalfId').AsInteger,
                     '');
  end;

begin
   Result := False;
   Screen.Cursor := crHourGlass;

   IsBirthRegistration := RegistrationPages.ActivePageIndex = 0;

   LookupCalvings.Database.StartTransaction;

   if StillBirth then
      ThisTable := StillBirthTable
   else
      ThisTable := BirthTable;

   ThisTable.DisableControls;
   try
      try
          if not ( RegisterAll ) then
             begin
                if AnimalGrid.SelectedRows.Count > 0 then    // register all selected records.
                   begin
                      for i := 0 to AnimalGrid.SelectedRows.Count -1 do
                         begin
                           if AnimalGrid.SelectedRows[I] <> '' then
                              begin
                                 if AnimalGrid.DataSource.DataSet.BookmarkValid(pointer(AnimalGrid.SelectedRows[I])) then
                                    begin
                                       AnimalGrid.DataSource.DataSet.GotoBookmark(pointer(AnimalGrid.SelectedRows[I]));
                                       DoRegisterCalf;
                                    end;
                              end;
                         end;
                   end
                else
                   begin
                      DoRegisterCalf;
                   end;
             end
          else
             begin
                ThisTable.First;
                while not ThisTable.eof do
                   begin
                      if ( ThisTable.FieldByName('RegisterOnFile').AsBoolean ) then
                         DoRegisterCalf
                      else
                         ThisTable.Next;
                   end;
             end;

         if LookupCalvings.UpdatesPending then
            begin
               LookupCalvings.ApplyUpdates;
               LookupCalvings.Database.Commit;
               LookupCalvings.CommitUpdates;
               Result := True;
            end
         else
            begin
               LookupCalvings.Database.RollBack;
               MessageDlg('No records have been updated',mtInformation,[mbOk],0);
            end;
      except
         on E : Exception do
            begin
               LookupCalvings.Database.RollBack;
               raise Exception.Create(E.Message);
            end;
      end;
   finally
      ThisTable.Refresh;
      ThisTable.EnableControls;
      Screen.Cursor := crDefault;
   end;
end;

function TAPHISRegistration.RegisterDeaths(const RegisterAll: Boolean) : Boolean;
  procedure RegisterDeath;
  begin
     with LookupSalesDeaths do
        begin
           if Locate('EventID', DeathTable.FieldByName('EventID').AsInteger, []) then
              begin
                 Edit;
                 try
                    FieldByName('NIDeathNotify').AsBoolean := TRUE;


                    // Introduced by SP 05/2013 to allow the user to dismiss
                    // death registration if the animal death was registered
                    // or notified by some other means.
                    FieldByName('NIWSDismissedByUser').AsBoolean := TRUE;
                    Post;
                 except
                    Cancel;
                 end;
                 DeathTable.Delete;
              end;
        end;
  end;

var
   i : Integer;
begin
   Result := False;
   Screen.Cursor := crHourGlass;
   DeathTable.DisableControls;
   try
      WinData.KingData.StartTransaction;
      try
          if not ( RegisterAll ) then
             begin
                if AnimalGrid.SelectedRows.Count > 0 then    // register all selected records.
                   begin
                      for i := 0 to AnimalGrid.SelectedRows.Count -1 do
                         begin
                           if AnimalGrid.SelectedRows[I] <> '' then
                              begin
                                 if AnimalGrid.DataSource.DataSet.BookmarkValid(pointer(AnimalGrid.SelectedRows[I])) then
                                    begin
                                       AnimalGrid.DataSource.DataSet.GotoBookmark(pointer(AnimalGrid.SelectedRows[I]));
                                       RegisterDeath;
                                    end;
                              end;
                         end;
                   end
                else
                   RegisterDeath; // register current record.
             end
          else
             begin
                DeathTable.First;
                while not DeathTable.eof do
                   begin
                      if ( DeathTable.FieldByName('RegisterOnFile').AsBoolean ) then
                         RegisterDeath // will delete current record, positioning db cursor to next record if any
                      else
                         DeathTable.Next;
                   end;
             end;

         if LookupSalesDeaths.UpdatesPending then
            begin
               LookupSalesDeaths.ApplyUpdates;
               LookupSalesDeaths.Database.Commit;
               LookupSalesDeaths.CommitUpdates;
               Result := True;
            end
         else
            begin
               LookupSalesDeaths.Database.RollBack;
               MessageDlg('No records have been updated',mtInformation,[mbOk],0);
               Abort;
            end;

      except
         on E : Exception do
            begin
               LookupSalesDeaths.Database.RollBack;
               raise Exception.Create(E.Message);
            end;
      end;
   finally
      DeathTable.Refresh;
      DeathTable.EnableControls;
      Screen.Cursor := crDefault;
   end;
end;

procedure TAPHISRegistration.AnimalGridTitleClick(Column: TColumnEh);
var
   SortDirection : Char;
begin
   if Column.Title.SortMarker = smDownEh then
      SortDirection := 'd'
   else
      SortDirection := 'i';

   if ( Column.Tag = 1 ) then
      begin
         if TTable(AnimalGrid.DataSource.DataSet).IndexDefs.IndexOf(SortDirection + 'SortNatIdNum') > -1 then
            TTable(AnimalGrid.DataSource.DataSet).IndexName := SortDirection + 'SortNatIdNum'
      end
   else if ( Column.Tag = 2 ) then
      begin
         if TTable(AnimalGrid.DataSource.DataSet).IndexDefs.IndexOf(SortDirection + 'DamSortNatIDNum') > -1 then
            TTable(AnimalGrid.DataSource.DataSet).IndexName := SortDirection + 'DamSortNatIDNum'
      end
   else if ( TTable(AnimalGrid.DataSource.DataSet).IndexDefs.IndexOf(SortDirection + Column.Field.FieldName) > -1 ) then
      TTable(AnimalGrid.DataSource.DataSet).IndexName := SortDirection + Column.Field.FieldName;

   if Column.Title.SortMarker = smDownEh then
      Column.Title.SortMarker := smUpEh
   else
      Column.Title.SortMarker := smDownEh;
end;

procedure TAPHISRegistration.GotoAPHISOnline1Click(Sender: TObject);
begin
// ShellExecute(Handle, 'open', 'https://eservices.ruralni.gov.uk/profile/login.asp', nil, nil, SW_SHOWNORMAL);
// 23/02/12 [V5.0 R4.0] /MK Change - Link Request Change By TGM.
   ShellExecute(Handle, 'open', 'https://www2.dardni.gov.uk/gatewayweb/internet/', nil, nil, SW_SHOWNORMAL);
end;

procedure TAPHISRegistration.ShowXMLFiles1Click(Sender: TObject);
begin
   ShellExecute(Handle, 'open', nil, nil, PChar(ExtractFilePath(ParamStr(0)) + cRegFileDir), SW_SHOWNORMAL);
end;

procedure TAPHISRegistration.sbRemoveClick(Sender: TObject);
var
  i : integer;
begin
   if AnimalGrid.DataSource.DataSet.RecordCount > 0 then
      begin
         if AnimalGrid.SelectedRows.Count <= 0 then
            AnimalGrid.DataSource.DataSet.Delete // delete current record
         else
            for i := 0 to AnimalGrid.SelectedRows.Count -1 do
               begin
                 if AnimalGrid.SelectedRows[I] <> '' then
                    begin
                       if AnimalGrid.DataSource.DataSet.BookmarkValid(pointer(AnimalGrid.SelectedRows[I])) then
                          begin
                             AnimalGrid.DataSource.DataSet.GotoBookmark(pointer(AnimalGrid.SelectedRows[I]));
                             AnimalGrid.DataSource.DataSet.Delete;
                          end;
                    end;
               end;
      end
end;

procedure TAPHISRegistration.Remove1Click(Sender: TObject);
begin
   sbRemoveClick(nil);
end;

procedure TAPHISRegistration.ImageTimerTimer(Sender: TObject);
begin
   WarningImage.Visible := not WarningImage.Visible;
end;

procedure TAPHISRegistration.RegTableAfterDelete(DataSet: TDataSet);
begin
   UpdateStatus;
end;

procedure TAPHISRegistration.ThisFormOnIdle(Sender: TObject;
  var Done: Boolean);
begin
   if Assigned(AnimalGrid.DataSource) then
      begin
         if Assigned(AnimalGrid.DataSource.Dataset) then
            begin
               Remove1.Enabled := ( AnimalGrid.DataSource.Dataset.RecordCount > 0 );
               RemovePermanently1.Enabled := Remove1.Enabled;

               if ( AnimalGrid.DataSource.Dataset.Active ) then
                  if ( AnimalGrid.DataSource.Dataset.RecordCount <= 0 ) then
                     begin
                        pErrors.Hide;
                        splitter.Hide;
                     end
            end;
      end;
   Done := True;
end;

function TAPHISRegistration.IsValidColourCode(ColourCode: string): Boolean;
var
   i : Integer;
begin
   Result := False;
   ColourCode  := UpperCase(ColourCode);
   for i := Low(iNIValidColourCodes) to High(iNIValidColourCodes) do
      begin
         if ( ColourCode = iNIValidColourCodes[i] ) then
            begin
               Result := True;
               Break;
            end;
      end;
end;

procedure TAPHISRegistration.RxSpeedButton1Click(Sender: TObject);
begin
   uCalfRegFlt.ShowForm
end;

function TAPHISRegistration.FormatUK9Tag(const TagNo: string): string;
var       //                          UK9123455124
   tResult : string;
begin
   tResult := StringReplaceNonAlphaChars(TagNo, ' ');
   if ( Copy(tResult, 1, 3) = 'UK9' ) then
      Insert( ' ', tResult, 3);
   Result := tResult;
end;

function TAPHISRegistration.CheckOldNITagFormat(
  const TagNo: string): string;
var
   tTagNo : string;
   CharIndex : Integer;
begin
   Result := TagNo;
   if Length(TagNo) > 0 then
      begin
         tTagNo := UPPERCASE(TagNo);

         while ( length(tTagNo) > 3 ) and ( not ( tTagNo[3] in AlphaNumSet )) do
            Delete(tTagNo, 3, 1);

         if ( tTagNo[Length(tTagNo)] in (['A'..'Z'])) then
            begin
               // remove country/area identifier.
               if ( Pos('UK9', tTagNo) > 0 ) then
                  Delete(tTagNo, 1, 3)
               else if ( Pos('UK 9', tTagNo) > 0 ) then
                  Delete(tTagNo, 1, 4)
               else if ( Pos('UK', tTagNo) > 0 ) then
                  Delete(tTagNo, 1, 2);

               if not ( tTagNo[1] in (['0'..'9'])) then // 1st char must be numeric
                  Delete(tTagNo, 1, 1);

               // replace spaces with hyphen
               tTagNo := StringReplaceNonAlphaChars(tTagNo, '-');

               // assign result
               Result := tTagNo;
            end
         else
            begin
               // replace spaces with hyphen
               tTagNo := Trim(StringReplaceNonAlphaChars(tTagNo, ' '));
               CharIndex := Pos('  ', tTagNo);
               while CharIndex > 0 do
                  begin
                     Delete(tTagNo, CharIndex, 1);
                     CharIndex := Pos('  ', tTagNo);
                  end;

               if not (tTagNo[3] = ' ' ) then
                  Insert(' ',tTagNo,3);

               Result := tTagNo;
            end;
      end;

end;

function TAPHISRegistration.CheckIETagFormat(const TagNo: string): string;
var
   tTagNo : string;
   CharIndex : Integer;
   NatIDStyle : TNatIDStyle;
begin
   Result := TagNo;
   if ( Length(TagNo) > 0 ) then
      begin
         tTagNo := UPPERCASE(TagNo);
         NatIDStyle := WhatStyleNatID(TagNo, False);
         if ( NatIDStyle = StyleEID ) then
            begin
               if Copy(tTagNo,1,1) <> '3' then
                  Insert('3',tTagNo,1);
               if Copy(tTagNo,2,1) <> '7' then
                  Insert('7',tTagNo,2);
               if Copy(tTagNo,3,1) <> '2' then
                  Insert('2',tTagNo,3);
               if Copy(tTagNo,4,1) <> ' ' then
                  Insert(' ',tTagNo,4);
               if Copy(tTagNo,7,1) <> '-' then
                  Insert('-',tTagNo,7);
               if Copy(tTagNo,13,1) <> '-' then
                  Insert('-',tTagNo,13);
               if Copy(tTagNo,15,1) <> '-' then
                  Insert('-',tTagNo,15);
            end
         else if ( NatIDStyle = Style1999 ) then
            begin
               if Copy(tTagNo,1,1) <> 'I' then
                  Insert('I',tTagNo,1);
               if Copy(tTagNo,2,1) <> 'E' then
                  Insert('E',tTagNo,2);
               if Copy(tTagNo,3,1) <> ' ' then
                  Insert(' ',tTagNo,3);
               if Copy(tTagNo,6,1) <> '-' then
                  Insert('-',tTagNo,6);
               if Copy(tTagNo,12,1) <> '-' then
                  Insert('-',tTagNo,12);
               if Copy(tTagNo,14,1) <> '-' then
                  Insert('-',tTagNo,14);
            end
         else if NatIDStyle = Style1996 then
            begin
               if Copy(tTagNo,1,1) <> 'I' then
                  Insert('I',tTagNo,1);
               if Copy(tTagNo,2,1) <> 'E' then
                  Insert('E',tTagNo,2);
               if Copy(tTagNo,3,1) <> ' ' then
                  Insert(' ',tTagNo,3);
               if Copy(tTagNo,8,1) <> '-' then
                  Insert('-',tTagNo,8);
               if Copy(tTagNo,14,1) <> '-' then
                  Insert('-',tTagNo,14);
            end;
         // assign result
         Result := tTagNo;
      end;
end;


procedure TAPHISRegistration.sbHelpClick(Sender: TObject);
begin
    WinData.HTMLHelp('aphisreg.htm');
end;

procedure TAPHISRegistration.APHISLogindetails1Click(Sender: TObject);
begin
   TfmAPHISWSCredentials.ShowAPHISWSCredentials;
end;

procedure TAPHISRegistration.RegisterUsingWebServices;
var
   GatewayId, BusinessId, Password : string;
   APHISLoginData : TAPHISLoginData;
   ParamStr : string;
   RegType : string;
   AppPath : string;
   LoginDetailsComplete : Boolean;
begin
   CreateXmlDataFile();

   APHISLoginData := TAPHISLoginData.create;
   try
      GatewayId := APHISLoginData.GatewayId;
      BusinessId := APHISLoginData.BusinessId;
      Password := APHISLoginData.Password;
      LoginDetailsComplete := APHISLoginData.LoginDetailsComplete;
   finally
      FreeAndNil(APHISLoginData);
   end;

   if not LoginDetailsComplete then
      begin
         MessageDlg('The APHIS login information has not been entered.'+ #13#10 + #13#10 +
                    'Click "Options" - "APHIS Login Details" to enter the login details.',mtError,[mbOk],0);
      end
   else
      begin
         if RegistrationPages.ActivePageIndex = 0 then
            RegType := 'birth'
         else if RegistrationPages.ActivePageIndex = 1 then
            RegType := 'death'
         else if RegistrationPages.ActivePageIndex = 2 then
            RegType := 'still'
         else
            begin
               MessageDlg('Unsupported registration type. Please select one of the following ''Births'', ''Deaths'' or ''Still Births.''',mtError,[mbok],0);
               Exit;
            end;

         ParamStr := RegType + ' ' + HerdIdentity+ ' ' + DataDir + ' ' + GatewayId  + ' ' + BusinessId  + ' ' + Password;
         AppPath := ApplicationPath + 'APHIS Registration\aphisws.exe';
         ShellExecute(handle, 'open', pChar(AppPath), PChar(ParamStr) , nil, SW_SHOWNORMAL);
         sbRegister.Enabled := False;
         FAphisWSInvoked := True;
      end;
end;

procedure TAPHISRegistration.cxButton1Click(Sender: TObject);
begin
   RegisterUsingWebServices;
end;

procedure TAPHISRegistration.FormActivate(Sender: TObject);
begin
   BringAphisWSToFront;
end;

procedure TAPHISRegistration.AnimalGridEnter(Sender: TObject);
begin
   BringAphisWSToFront;
end;

procedure TAPHISRegistration.BringAphisWSToFront;
var
   wHandle : Hwnd;
begin
   if (FAphisWSInvoked) then
      begin
         if ProcessActive('aphisws.exe') then
            begin
               wHandle := FindWindow(nil, 'APHIS Event Registration');
               SetForegroundWindow(wHandle);
               ActiveControl := nil;
            end;
      end;
end;

procedure TAPHISRegistration.RegistrationPagesChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if FAphisWSInvoked then
      AllowChange := not ProcessActive('aphisws.exe');
   if not AllowChange then
      BringAphisWSToFront;
end;

procedure TAPHISRegistration.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

   if ( FAphisWSInvoked ) and ( ProcessActive('aphisws.exe') ) then
      KillTask('aphisws.exe');
end;

procedure TAPHISRegistration.DefaultHandler(var Message);
begin
  with TMessage(Message) do
  begin
    if (Msg = WM_KINGSWOOD_APHISWS_CLOSED) then
       begin
          //Update;
          //ShowMessage('APHIS WS CLOSED');
          FRegistrationTimeStamp := Now;
          ClearRegistered;
          sbRegister.Enabled := True;
       end
    else
       inherited DefaultHandler(Message);
  end;
end;

procedure TAPHISRegistration.ClearRegistered;
var
   i : Integer;
   FDOMDocument : IXMLDOMDocument;
   XMLDOMNode : IXMLDOMNode;

   TagNo,
   NodeName : string;

   wsRegistered : Boolean;
   confirmationId : string;
   validationErrors : Boolean;

   CountOfRegistered : Integer;
   IsBirthRegistration : Boolean;

   MCXMLDOMNode, MRXMLDOMNode : IXMLDOMNode;

begin
   CountOfRegistered := 0;

   FDOMDocument := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
   FDOMDocument.async := False;
   FDOMDocument.load(FXmlDataFile);

   if ( RegistrationPages.ActivePageIndex = cRegTypeBirths ) then
      BirthTable.DisableControls
   else
      DeathTable.DisableControls;

   if ( FDOMDocument.documentElement.childNodes.Get_length > 0 ) then
      begin
         for i := 0 to FDOMDocument.documentElement.childNodes.Get_length-1 do
            begin
               NodeName := FDOMDocument.documentElement.childNodes[i].Get_nodeName;

               if ((NodeName = cxml_NewAnimalRegInfoTag) or
                   (NodeName = cxml_DeadAnimalInfoTag) or
                   (NodeName = cxml_StillBornInfoTag)) then
                  begin
                     XMLDOMNode := FDOMDocument.documentElement.childNodes[i].selectSingleNode(cxml_AnimalNoTag);
                     if (XMLDOMNode = nil) or (Trim(XMLDOMNode.text) = '') then Continue;

                     TagNo := XMLDOMNode.text;

                     if ((NodeName = cxml_NewAnimalRegInfoTag) or (NodeName = cxml_StillBornInfoTag)) then
                        begin
                           XMLDOMNode := FDOMDocument.documentElement.childNodes[i].selectSingleNode('wsRegistered');
                           if (XMLDOMNode = nil) or (Trim(XMLDOMNode.text) = '') then Continue;

                           wsRegistered := XMLDOMNode.text='Y';

                           if not wsRegistered then continue;
                        end
                     else if (NodeName = cxml_DeadAnimalInfoTag) then
                        begin
                           MRXMLDOMNode := FDOMDocument.documentElement.childNodes[i].selectSingleNode('mrRegistered');
                           MCXMLDOMNode := FDOMDocument.documentElement.childNodes[i].selectSingleNode('mcRegistered');
                           if (MRXMLDOMNode = nil) or (MCXMLDOMNode = nil) then Continue;
                        end;

                     if ( RegistrationPages.ActivePageIndex = cRegTypeBirths ) then
                        begin
                           XMLDOMNode := FDOMDocument.documentElement.childNodes[i].selectSingleNode('confirmationId');
                           if (XMLDOMNode = nil) then Continue;

                           confirmationId := Trim(XMLDOMNode.text);

                           if ((Length(confirmationId) > 0) and (BirthTable.Locate('NatIdNum', TagNo, [loCaseInsensitive]))) then
                              begin
                                 BirthTable.Edit;
                                 BirthTable.FieldByName('ConfirmationId').AsString := confirmationId;
                                 BirthTable.FieldByName('WSRegistered').AsBoolean := True;
                                 BirthTable.Post;
                              end;
                        end
                     else if ( RegistrationPages.ActivePageIndex = cRegTypeDeaths ) then
                        begin
                           // First check for Movement Registration
                           wsRegistered := MRXMLDOMNode.text='Y';
                           if (wsRegistered) then
                              begin
                                 XMLDOMNode := FDOMDocument.documentElement.childNodes[i].selectSingleNode('mrConfirmationId');
                                 if (XMLDOMNode <> nil) then
                                    begin
                                       confirmationId := Trim(XMLDOMNode.text);
                                       if ((Length(confirmationId) >0 ) and (DeathTable.Locate('NatIdNum', TagNo, [loCaseInsensitive]))) then
                                          begin
                                             DeathTable.Edit;
                                             DeathTable.FieldByName('MRConfirmationId').AsString := confirmationId;
                                             DeathTable.FieldByName('MRRegistered').AsBoolean := True;
                                             DeathTable.Post;
                                          end;
                                    end;
                              end;

                           // Now check for Movement Confirmation
                           wsRegistered := MCXMLDOMNode.text='Y';
                           if (wsRegistered) then
                              begin
                                 XMLDOMNode := FDOMDocument.documentElement.childNodes[i].selectSingleNode('mcConfirmationId');
                                 if (XMLDOMNode <> nil) then
                                    begin
                                       confirmationId := Trim(XMLDOMNode.text);
                                       if ((Length(confirmationId) >0 ) and (DeathTable.Locate('NatIdNum', TagNo, [loCaseInsensitive]))) then
                                          begin
                                             DeathTable.Edit;
                                             DeathTable.FieldByName('MCConfirmationId').AsString := confirmationId;
                                             DeathTable.FieldByName('MCRegistered').AsBoolean := True;
                                             DeathTable.Post;
                                          end;
                                    end;
                              end;
                        end
                     else if ( RegistrationPages.ActivePageIndex = cRegTypeStillBorn ) then
                        begin
                           XMLDOMNode := FDOMDocument.documentElement.childNodes[i].selectSingleNode('confirmationId');
                           if (XMLDOMNode = nil) then Continue;

                           confirmationId := Trim(XMLDOMNode.text);

                           if ((Length(confirmationId)>0 ) and (StillBirthTable.Locate('NatIdNum', TagNo, [loCaseInsensitive]))) then
                              begin
                                 StillBirthTable.Edit;
                                 StillBirthTable.FieldByName('ConfirmationId').AsString := confirmationId;
                                 StillBirthTable.FieldByName('WSRegistered').AsBoolean := True;
                                 StillBirthTable.Post;
                              end;
                        end;
                     Inc(CountOfRegistered);
                  end;
            end;
      end;

    if CountOfRegistered = 0 then
       Exit;

    if (( RegistrationPages.ActivePageIndex = cRegTypeBirths ) or
        ( RegistrationPages.ActivePageIndex = cRegTypeStillBorn )) then
       begin
          IsBirthRegistration := RegistrationPages.ActivePageIndex = cRegTypeBirths;
          try
             LookupCalvings.Database.StartTransaction;
             try
                if (RegistrationPages.ActivePageIndex = cRegTypeBirths) then
                   ThisTable := BirthTable
                else
                   ThisTable := StillBirthTable;

                ThisTable.First;
                while not ThisTable.eof do
                   begin
                      if (( ThisTable.FieldByName('RegisterOnFile').AsBoolean ) and
                          ( ThisTable.FieldByName('WSRegistered').AsBoolean )) then
                         begin
                            // will delete current record, positioning db cursor to next record if available
                            if IsBirthRegistration then
                               RegisterCalf(BirthTable.FieldByName('EventId').AsInteger,
                                            BirthTable.FieldByName('AnimalId').AsInteger,
                                            BirthTable.FieldByName('ConfirmationId').AsString)
                            else
                               RegisterCalf(StillBirthTable.FieldByName('EventId').AsInteger,
                                            StillBirthTable.FieldByName('CalfId').AsInteger,
                                            StillBirthTable.FieldByName('ConfirmationId').AsString) ;
                         end

                      else
                         begin
                            ThisTable.Edit;
                            ThisTable.FieldByName('ValidationErrors').AsBoolean := False;
                            ThisTable.Post;
                            ThisTable.Next;
                         end;
                   end;

                if LookupCalvings.UpdatesPending then
                   begin
                      LookupCalvings.ApplyUpdates;
                      LookupCalvings.Database.Commit;
                      LookupCalvings.CommitUpdates;
                   end
                else
                   LookupCalvings.Database.RollBack;

             except
                on E : Exception do
                   begin
                      LookupCalvings.Database.RollBack;
                      raise Exception.Create(E.Message);
                   end;
             end;
          finally
             BirthTable.Refresh;
             BirthTable.EnableControls;
             Screen.Cursor := crDefault;
          end;
       end
    else if ( RegistrationPages.ActivePageIndex = cRegTypeDeaths ) then
       begin
          try
             Screen.Cursor := crHourGlass;
             DeathTable.DisableControls;
             try
                LookupSalesDeaths.Database.StartTransaction;

                DeathTable.First;
                while not DeathTable.eof do
                   begin
                      if (( DeathTable.FieldByName('RegisterOnFile').AsBoolean ) and
                          ( DeathTable.FieldByName('MRRegistered').AsBoolean ) or
                          ( DeathTable.FieldByName('MCRegistered').AsBoolean ) ) then
                         RegisterDeath() // will delete current record, positioning db cursor to next record if available
                      else
                         begin
                            DeathTable.Edit;
                            DeathTable.FieldByName('ValidationErrors').AsBoolean := False;
                            DeathTable.Post;
                            DeathTable.Next;
                         end;
                   end;

                if LookupSalesDeaths.UpdatesPending then
                   begin
                      LookupSalesDeaths.ApplyUpdates;
                      LookupSalesDeaths.Database.Commit;
                      LookupSalesDeaths.CommitUpdates;
                   end
                else
                   begin
                      LookupSalesDeaths.Database.RollBack;
                   end;

            except
               on E : Exception do
                  begin
                     LookupSalesDeaths.Database.RollBack;
                     raise Exception.Create(E.Message);
                  end;
            end;
         finally
            DeathTable.EnableControls;
            DeathTable.Refresh;
            Screen.Cursor := crDefault;
         end;
       end;

   if FDOMDocument <> nil then
      FDOMDocument := nil;
end;

procedure TAPHISRegistration.RegisterCalf(const AEventId : Integer; ACalfId : Integer; const AConfirmationId : string = '');
var
   FieldToModify1, FieldToModify2, FieldToModify3, FieldToModify4 : string;
begin
   FieldToModify1 := '';
   FieldToModify2 := '';
   FieldToModify3 := '';
   FieldToModify4 := '';

   with LookupCalvings do
      begin
         if Locate('EventID', AEventId, []) then
            begin
               if ( FieldByName('ID1').AsInteger = ACalfId ) then
                  begin
                     FieldToModify1 := 'ID1Notified';
                     FieldToModify2 := 'ID1NINotifyDateTime';
                     FieldToModify3 := 'ID1NIWSNotified';
                     FieldToModify4 := 'ID1NIWSConfirmId';
                  end
               else if ( FieldByName('ID2').AsInteger = ACalfId ) then
                  begin
                     FieldToModify1 := 'ID2Notified';
                     FieldToModify2 := 'ID2NINotifyDateTime';
                     FieldToModify3 := 'ID2NIWSNotified';
                     FieldToModify4 := 'ID2NIWSConfirmId';
                  end
               else if ( FieldByName('ID3').AsInteger = ACalfId ) then
                  begin
                     FieldToModify1 := 'ID3Notified';
                     FieldToModify2 := 'ID3NINotifyDateTime';
                     FieldToModify3 := 'ID3NIWSNotified';
                     FieldToModify4 := 'ID3NIWSConfirmId';
                  end
               else if ( FieldByName('ID4').AsInteger = ACalfId ) then
                  begin
                     FieldToModify1 := 'ID4Notified';
                     FieldToModify2 := 'ID4NINotifyDateTime';
                     FieldToModify3 := 'ID4NIWSNotified';
                     FieldToModify4 := 'ID4NIWSConfirmId';
                  end;

               if ( FieldToModify1 <> '' ) then
                  begin
                     Edit;
                     try
                        FieldByName(FieldToModify1).AsBoolean := TRUE;
                        FieldByName(FieldToModify2).AsDateTime := FRegistrationTimeStamp;
                        FieldByName(FieldToModify3).AsBoolean := True;
                        FieldByName(FieldToModify4).AsString := AConfirmationId;
                        Post;
                     except
                        Cancel;
                     end;
                  end;
            end;
         ThisTable.Delete;
      end;
end;

procedure TAPHISRegistration.RegisterDeath;
begin
   with LookupSalesDeaths do
      begin
         if Locate('EventID', DeathTable.FieldByName('EventID').AsInteger, []) then
            begin
               Edit;
               try
                  FieldByName('NIDeathNotify').AsBoolean := TRUE;

                  if ((DeathTable.FieldByName('MRRegistered').AsBoolean) and (not FieldByName('NIWSNotified').AsBoolean)) then
                     begin
                        FieldByName('NIWSNotified').AsBoolean := True;
                        FieldByName('NIWSNotifiedDateTime').Value := FRegistrationTimeStamp;
                        FieldByName('NIWSConfirmationId').AsString := DeathTable.FieldByName('MRConfirmationId').AsString;
                     end;

                  if ((DeathTable.FieldByName('MCRegistered').AsBoolean) and (not FieldByName('NIWSNotified2').AsBoolean)) then
                     begin
                        FieldByName('NIWSNotified2').AsBoolean := True;
                        FieldByName('NIWSNotifiedDateTime2').Value := FRegistrationTimeStamp;
                        FieldByName('NIWSConfirmationId2').AsString := DeathTable.FieldByName('MCConfirmationId').AsString;
                     end;
                  Post;
               except
                  Cancel;
               end;
               DeathTable.Delete;
            end;
      end;
end;

procedure TAPHISRegistration.CreateXmlDataFile;
const
   cxmlValidationErrors = 'validationErrors';

var
   XMLWriter : TXMLGenerator;
   FileName : string;
   RegType : integer;
   strList : TStringList;
begin
   FileName := 'APHISRegData.xml';

   RegType := RegistrationPages.ActivePageIndex;


  Screen.Cursor := crHourGlass;

  FXmlDataFile := ExtractFilePath(ParamStr(0)) + IncludeTrailingBackslash(DataDir) + FileName;

  XMLWriter := TXMLGenerator.CreateFragment(1024);
  XMLWriter.UseIndentation := False;

  try
     XMLWriter.StartTag('RegInfo');

     if ( RegType = cRegTypeBirths ) then
        begin
           with BirthTable do
              begin
                 First;

                 while not eof do
                    begin

                       if FieldByName('RegisterOnFile').AsBoolean then
                          begin

                             XMLWriter.StartTag(cxml_NewAnimalRegInfoTag);

                                 XMLWriter.StartTag(cxml_HerdNoTag);
                                 XMLWriter.AddData(HerdIdentity);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_AnimalNoTag);
                                 XMLWriter.AddData(FieldByName('NatIDNum').AsString);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_ColourTag);
                                 XMLWriter.AddData(FieldByName('Colour').AsString);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_SexTag);
                                 if UPPERCASE(FieldByName('Sex').AsString) = 'FEMALE' then
                                    XMLWriter.AddData('F')
                                 else if UPPERCASE(FieldByName('Sex').AsString) = 'STEER' then
                                    XMLWriter.AddData('M')
                                 else if UPPERCASE(FieldByName('Sex').AsString) = 'BULL' then
                                    XMLWriter.AddData('B');
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_BreedTag);
                                 XMLWriter.AddData(FieldByName('Breed').AsString);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_DOBTag);
                                 XMLWriter.AddData(FormatDateTime(cIrishDateStyle, FieldByName('DateOfBirth').AsDateTime));
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_DamTag);
                                 XMLWriter.AddData(FieldByName('DamNatIDNum').AsString);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_SireTag);
                                 XMLWriter.AddData(FieldByName('SireNatIDNo').AsString);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag('wsRegistered');
                                 XMLWriter.AddData('N');
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag('confirmationId');
                                 XMLWriter.AddData('');
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxmlValidationErrors);
                                 XMLWriter.AddData('N');
                                 XMLWriter.StopTag;

                                  XMLWriter.StopTag;
                          end;
                       Next;
                    end;
              end;
        end
     else if ( RegType = cRegTypeDeaths ) then
        begin
           with DeathTable do
              begin
                 First;

                 while not eof do
                    begin

                       if FieldByName('RegisterOnFile').AsBoolean then
                          begin

                             XMLWriter.StartTag(cxml_DeadAnimalInfoTag);

                                 XMLWriter.StartTag(cxml_HerdNoTag);
                                 XMLWriter.AddData(HerdIdentity);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_AnimalNoTag);
                                 XMLWriter.AddData(FieldByName('NatIDNum').AsString);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_DateOfDeathTag);
                                 XMLWriter.AddData(FormatDateTime(cIrishDateStyle, FieldByName('DateOfDeath').AsDateTime));
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_MannerDisposalTag);
                                 XMLWriter.AddData(UPPERCASE(FieldByName('MannerOfDisposal').AsString));
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_PlaceDisposalTag);
                                 XMLWriter.AddData(UPPERCASE(FieldByName('PlaceOfDisposal').AsString));
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag('mrRegistered');
                                 XMLWriter.AddData('N');
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag('mrConfirmationId');
                                 XMLWriter.AddData('');
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag('mcRegistered');
                                 XMLWriter.AddData('N');
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag('mcConfirmationId');
                                 XMLWriter.AddData('');
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxmlValidationErrors);
                                 XMLWriter.AddData('N');
                                 XMLWriter.StopTag;


                             XMLWriter.StopTag;
                          end;

                       Next;
                    end;
              end;
        end
     else if ( RegType = cRegTypeStillBorn ) then
        begin
           with StillBirthTable do
              begin
                 First;
                 while not eof do
                    begin
                       if FieldByName('RegisterOnFile').AsBoolean then
                          begin
                             XMLWriter.StartTag(cxml_StillBornInfoTag);

                                 XMLWriter.StartTag(cxml_HerdNoTag);
                                 XMLWriter.AddData(HerdIdentity);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_AnimalNoTag);
                                 XMLWriter.AddData(FieldByName('NatIDNum').AsString);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_DateOfDeathTag);
                                 XMLWriter.AddData(FormatDateTime(cIrishDateStyle, FieldByName('CalvingDate').AsDateTime));
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxml_CommentTag);
                                 XMLWriter.AddData(FieldByName('Comment').AsString);
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag('wsRegistered');
                                 XMLWriter.AddData('N');
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag('confirmationId');
                                 XMLWriter.AddData('');
                                 XMLWriter.StopTag;

                                 XMLWriter.StartTag(cxmlValidationErrors);
                                 XMLWriter.AddData('N');
                                 XMLWriter.StopTag;

                             XMLWriter.StopTag;
                          end;
                       Next;
                    end;
              end;
        end;

      XMLWriter.StopTag;

      if XMLWriter.AsString <> '' then
         begin
            XMLWriter.SaveToFile(FXmlDataFile);
         end;

  finally
     FreeAndNil(XMLWriter);
     strList := TStringList.Create;
     try
     // spurious line with blocks being written to end of stream strip this line .
     strList := TStringList.Create;
     strList.LoadFromFile(FXmlDataFile);
     strList.Insert(0, '<?xml version="1.0" encoding="UTF-8"?>');
     strList.SaveToFile(FXmlDataFile);
     finally
     strList.Free;
     end;
     Screen.Cursor := crDefault;
  end;

end;


function TAPHISRegistration.UsingCompatiableAphisExeFile: Boolean;
var
   V1,V2,V3,V4 : Word;
begin
   GetBuildInfo(ApplicationPath + 'APHIS Registration\aphisws.exe',V1,V2,V3,V4);
   // as of 04/04/2013
   if (V3 < 3) then
      Result := False
   else
      Result := True;
end;

procedure TAPHISRegistration.ToolButton8Click(Sender: TObject);
begin
  // FRegistrationTimeStamp := Now();
  // FXmlDataFile := ExtractFilePath(ParamStr(0)) + IncludeTrailingBackslash(DataDir) + 'APHISRegData.xml';
  // ClearRegistered;
end;

initialization
  WM_KINGSWOOD_APHISWS_CLOSED := RegisterWindowMessage('WM_KINGSWOOD_APHISWS_CLOSED');

end.
