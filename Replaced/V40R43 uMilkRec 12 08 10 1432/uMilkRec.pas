{  SP 9/11/2001

New ICBF MMR Faciltity.
  Fields 1) Record Line ID
         2) Animal_ID   internal IRIS database number
         3) Rec_Date    date of milk recording
         4) Lact_Num    Lactation Number of cow when recorded
         5) Mgmt_Grp    group name, not needed at this time
         6) Yield
         7) Fat
         8) Protein
         9) Lactose
         10) SCC
         11) DIM-Days in Milk
         12) Rec_Num    No. of protein tests recorded per lactation
         13) Unreliable Y/N 1 char

 29/01/2009 [V3.9 R5.8] /SP Additional Feature - New button for Creation of CIS file.

 29/01/2009 [V3.9 R5.8] /SP Additional Feature - New button for Link to Milk Company Website login page, allows user to download M/R files.

 19/07/10 [V4.0 R4.0] /MK Additional Feature - If Country is England then match by Tag Number.
                                             - Read Tag Number from C1 Line Where Animal Number of L1 Line is Animal Number in C1 Line.
                                             - Changed to iNoNotMatched to check for Tag Number where Country is England.
                                             - Changed ErrorReport to show Tag Number where Country is England.

}

unit uMilkRec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ToolEdit, ExtCtrls, Buttons, Grids, DBGrids, RXDBCtrl,DBTables,DB,
  ComCtrls, quickrpt, Qrctrls, RXCtrls, ToolWin, Menus, RXLookup, QRExport, Registry,
  KRxSpeedButton, GenTypesConst;

type

  TMilkRecState = (MFRead, MFSaved, MFNone);
  TtypeOfReport = (NotMatched, Exclusions);
  TfMilkRec = class(TForm)
    DiskContents: TRxDBGrid;
    StatusBar1: TStatusBar;
    ErrorReport: TQuickRep;
    QRBand1: TQRBand;
    qrlHeading: TQRLabel;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrSCC: TQRLabel;
    QRBand2: TQRBand;
    DB1: TQRDBText;
    DB2: TQRDBText;
    DB3: TQRDBText;
    DB4: TQRDBText;
    dbSCC: TQRDBText;
    qrlText: TQRMemo;
    TransQuery: TQuery;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbRecord: TRxSpeedButton;
    ToolButton2: TToolButton;
    sbHelp: TRxSpeedButton;
    sbReview: TRxSpeedButton;
    sbExecRecord: TRxSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    rgMilkRec: TRadioGroup;
    LastDate: TEdit;
    ThisDate: TEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    NoNotFound: TEdit;
    NoFound: TEdit;
    NoExcludeHasCalved: TEdit;
    ADrive: TFilenameEdit;
    EMailDrive: TFilenameEdit;
    ToolButton4: TToolButton;
    PopupMenu: TPopupMenu;
    FromDiskette1: TMenuItem;
    FromEmail1: TMenuItem;
    N1: TMenuItem;
    MilkDiskParameters1: TMenuItem;
    ToolButton6: TToolButton;
    sbDIYMilk: TRxSpeedButton;
    dsMDT: TDataSource;
    dsTempAnimals: TDataSource;
    pHerdID: TPanel;
    HerdNum: TRxDBLookupCombo;
    lHerdIdentity: TLabel;
    DirectoryEdit1: TDirectoryEdit;
    RxSpeedButton1: TRxSpeedButton;
    pmMMRType: TPopupMenu;
    ICBF1: TMenuItem;
    NMR1: TMenuItem;
    TempMilkDisk: TTable;
    ToolButton5: TToolButton;
    Bevel1: TBevel;
    qCurrLact: TQuery;
    qCurrLactID: TIntegerField;
    qCurrLactMDTID: TIntegerField;
    qCurrLactAnimalID: TIntegerField;
    qCurrLactAnimalCode: TStringField;
    qCurrLactLactNo: TSmallintField;
    qCurrLactHerdNumber: TStringField;
    qCurrLactDateofRecording: TDateField;
    qCurrLactDailyYield: TFloatField;
    qCurrLactDailyBfatPerc: TFloatField;
    qCurrLactDailyProtPerc: TFloatField;
    qCurrLactDailyLactPerc: TFloatField;
    qCurrLactSCC: TSmallintField;
    qCurrLactCumYield: TFloatField;
    qCurrLactCumBfatPerc: TFloatField;
    qCurrLactCumProtPerc: TFloatField;
    qCurrLactCumLactPerc: TFloatField;
    qCurrLactNoOfRecordings: TSmallintField;
    qCurrLactDaysInMilk: TSmallintField;
    qCurrLactEventType: TIntegerField;
    qCurrLactEventDate: TDateField;
    qCurrLactYield305: TFloatField;
    qCurrLactBfat305Perc: TFloatField;
    qCurrLactProt305Perc: TFloatField;
    qCurrLactLact305Perc: TFloatField;
    qCurrLactNMRRecording: TBooleanField;
    qCurrLactFound: TBooleanField;
    qCurrLactLastCalvingDate: TDateField;
    qCurrLactLeftHerd: TBooleanField;
    qCurrLactExcludeHasCalved: TBooleanField;
    qCurrLactCurrLact: TBooleanField;
    qCurrLactSortAnimalCode: TStringField;
    qGetAnimal: TQuery;
    qDupAnimals: TQuery;
    QRTextFilter1: TQRTextFilter;
    QRCSVFilter1: TQRCSVFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRWMFFilter1: TQRWMFFilter;
    N2: TMenuItem;
    ICBFMatching1: TMenuItem;
    AnimalNumber1: TMenuItem;
    NationalIdentityNumber1: TMenuItem;
    ToolButton7: TToolButton;
    miUseICBFFormat: TMenuItem;
    QueryLastRecording: TQuery;
    DsMemberOpenDialog: TOpenDialog;
    sbCISFileExport: TKRxSpeedButton;
    tbSepCISFileExport: TToolButton;
    cbDownloadFile: TKRxSpeedButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure rgMilkRecClick(Sender: TObject);
    procedure bRecordClick(Sender: TObject);
    procedure DiskContentsGetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure bExecRecordClick(Sender: TObject);
    procedure bReviewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FromDiskette1Click(Sender: TObject);
    procedure FromEmail1Click(Sender: TObject);
    procedure MilkDiskParameters1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure HerdNumChange(Sender: TObject);
    procedure sbDIYMilkClick(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure dblcMDTChange(Sender: TObject);
    procedure DeleteOldNMRFile;
    procedure DirectoryEdit1AfterDialog(Sender: TObject; var Name: String;
      var Action: Boolean);
    procedure ADriveAfterDialog(Sender: TObject; var Name: String;
      var Action: Boolean);
    procedure AnimalNumber1Click(Sender: TObject);
    procedure NationalIdentityNumber1Click(Sender: TObject);
    procedure miUseICBFFormatClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sbCISFileExportClick(Sender: TObject);
    procedure cbDownloadFileClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    CurrAnimalCode,
    CurrentID         : String;   // Milk Recording ID - First 7 chars on Disk
    RecordingDate,
    LastRecordingDate : TDateTime;
    CountryCode : Char;
    TidyUpDisk,          // Disk with no test dates indicates a Year End tidy up
    FirstRecording    : Boolean;
    MilkId            : Integer;    //New ID for Main Milk Transaction File
    // Item Positions within File
    TestDatePos,
    TestDateLen,
    CowNoPos,
    CowNoLen,
    CowNoChars,
    DailyYieldPos,
    DailyYieldLen,
    DailyBFatPercPos,
    DailyBFatPercLen,
    DailyProtPercPos,
    DailyProtPercLen,
    CumYieldPos,
    CumYieldLen,
    CumBFatPercPos,
    CumBFatPercLen,
    CumProtPercPos,
    CumProtPercLen,
    CumLactPos,
    CumLactLen,
    Yield305Pos,
    Yield305Len,
    BFat305PercPos,
    BFat305PercLen,
    Prot305PercPos,
    Prot305PercLen,
    SCCPos,
    SCCLen,
    NoOfTestsPos,
    NoOfTestsLen,
    DaysInMilkPos,
    DaysInMilkLen  :   Byte;
    iNoExcludeHasCalved,
    iNoFound,
    iNoNotFound    : Integer;
    DiskLine : String;
    MilkDisk : TTable;
    MySource : TDataSource;
    MyQuery  : TQuery;
    TAnimals : TTable;
    ErrorCount : Integer;

    // SP 9/11/2001 New ICBF MilkRecording Facility

    dsCurrLact : TDataSource;
    MilkFile : TextFile;
    MilkFileName : String;
    BTEHerdNo : String;
    FileLocation : String; // Dir to search for latest update file.
    FieldSep: char;
    FLine: string;
    NumFields: byte;
    Index, Ct: array[0..255] of integer;

    CutOffDate : TDateTime;
    MilkState : TMilkRecState;
    MyTable : TTable;

    MatchField : string;

    tICBFRec : TTable;

    tCowExt : TTable;

    NMRLactUpdate : TStringList;

    // *************************
    NMRAnimalList : TStringList;
    FCountry : TCountry;
    procedure ProcessMMRFile;
    procedure UpdateLactInfo;
    procedure GetMilkRecID;
    procedure CompleteMMRRecording;
    procedure CreateDryOffEvent(AID, LactNo : Integer; EDate : TDateTime);

    function Getstr(n: byte): string;
    procedure Parse(const Line: string);
    property Parsecount: byte read NumFields;
    property Parsefields[n: byte]: string read Getstr; // default;


    // SP 9/11/2001 New ICBF MilkRecording Facility

    procedure SetPositions;
    procedure CheckAnimals;
//    procedure EmptyTables;
    function  StripLeadingZeros(ItemToStrip: String): String;
    function  GetLastRecording(NoDate: boolean): boolean;
    procedure CheckRecordingOK;
    procedure RunErrorReport(RepType: TtypeOfReport);
    procedure DoMilkRecording;
//    function  CheckFileExists(NameToCheck: String): Boolean;
    function  ConvertDSMember: Boolean;
    procedure PadRight(Var St: String; Len: Integer);
    procedure PadLeft(Var St: String; Len: Integer);
    function  CallNMRStream : Boolean;
    procedure GetOwnerData;
    procedure CheckDuplicateAnimalNo;
    procedure Update305FromNMRFile;
    procedure UpdateStatusbar;
  public
     DuplicateIDArray : array of Integer;
     ThisAnimalArray : array of variant;
    { Public declarations }
    class procedure ImportICBFFile(AFileName : string);
  end;

  procedure CreateAndShow(MMRType : Integer); // Set a flag

implementation
uses
    ShellAPI,
    uHerdSetUp,
    uMilkDiskReview,
    uMilkRecDate,
    DairyData,
    uSetUpMilkDisk,
    FileCtrl,
    KRoutines,
    uMilkRecDupHandler,
    uCallToExternalProgram,
    uProgressIndicator,
    uMilkRecErrors,
    KDBRoutines, Def, uHerdLookup, EventRecording, uFileAttachmentImport,
    uDataBackup, uHUKIFarmEvents, kGetStringValue;

const

    NMRFileName = 'c:\dsmember.dat';
    NMRFileNameExe = 'dsmember.exe';

var
  FFileName : string;

{$R *.DFM}
procedure CreateAndShow(MMRType : Integer);
begin
   with TfMilkRec.Create(nil) Do
      try

         FCountry := WinData.DefCountry(WinData.UserDefaultHerdID);
         WinData.ICBFMilkRec := WinData.ICBFMMR;
         WinData.MilkRecDir := GetSpecialFolder(CSIDL_DESKTOP);

         FileLocation := WinData.MilkRecDir;
         if DirectoryExists(FileLocation) then
            PopupMenu.Items[1].Checked := True;

         UpdateStatusbar;
         qCurrLact.DatabaseName := WinData.KingData.DataBaseName;
         with dsCurrLact do
            begin
               dsCurrLact := TDataSource.Create(nil);
               dsCurrLact.DataSet := qCurrLact;
            end;

         tICBFRec := TTable.Create(nil);
         tICBFRec.DatabaseName := WinData.KingData.DatabaseName;
         tICBFRec.TableName := 'tICBFRec';
         tICBFRec.FieldDefs.Add('ID',ftAutoInc);
         tICBFRec.FieldDefs.Add('AnimalID',ftInteger);
         tICBFRec.FieldDefs.Add('AnimalNo',ftString,10);
         tICBFRec.FieldDefs.Add('NatIDNum',ftString,20);
         tICBFRec.FieldDefs.Add('SortNatID',ftString,20);
         tICBFRec.FieldDefs.Add('LactNo',ftInteger);
         tICBFRec.FieldDefs.Add('ICBFLactNo',ftInteger);
         tICBFRec.FieldDefs.Add('UpdateType',ftInteger);
         tICBFRec.CreateTable;
         tICBFRec.Open;


         if TempMilkDisk.Exists then TempMilkDisk.DeleteTable;
         TempMilkDisk.FieldDefs.Clear;
         TempMilkDisk.FieldDefs.Assign(WinData.MilkCumulative.FieldDefs);
         TempMilkDisk.FieldDefs.Add('AnimalCode',ftString,10,FALSE);
         TempMilkDisk.FieldDefs.Add('NatIDNum',ftString,20,FALSE);
         if TempMilkDisk.FieldDefs.IndexOf('DryOffDate') <= -1 then // this field might already exist due to problem dropping field in ICBF Import
            TempMilkDisk.FieldDefs.Add('DryOffDate',ftDate,0,FALSE);
         TempMilkDisk.CreateTable;
         TempMilkDisk.Open;



         tCowExt := TTable.Create(nil);
         tCowExt.DatabaseName := AliasName;
         tCowExt.tablename := 'cowext';
         tCowExt.CachedUpdates := True;

         ErrorReport.Hide;
         SetPositions;
         TidyUpDisk  := FALSE;
         MilkId      := 0;
         HerdNum.Value := IntToStr(WinData.UserDefaultHerdID);
         // Disable the Recording Button
         sbExecRecord.Enabled := False;
         // Open the Milk Transaction File
         WinData.MilkDiskTrans.Open;

         MilkDisk := TTable.Create(nil);
         MilkDisk.DatabaseName := WinData.KingData.DatabaseName;
         MilkDisk.TableName := 'MilkDisk.db';
         MilkDisk.Open;

         MyTable := TTable.Create(nil);
         MyTable.DatabaseName := WinData.KingData.DatabaseName;
         MyTable.TableName := 'TempMilk';
         MyTable.TableType := ttParadox;
         MyTable.FieldDefs.Assign(WinData.MilkDiskTrans.FieldDefs);
         MyTable.FieldDefs.Add('Found',ftBoolean,0,False);
         MyTable.FieldDefs.Add('LastCalvingDate',ftDate,0,False);
         MyTable.FieldDefs.Add('LeftHerd',ftBoolean,0,False);
         MyTable.FieldDefs.Add('ExcludeHasCalved',ftBoolean,0,False);
         MyTable.FieldDefs.Add('CurrLact',ftBoolean,0,False);
         MyTable.FieldDefs.Add('SortAnimalCode',ftString,10,False);
         MyTable.FieldDefs.Add('NatIDNum',ftString,20,False);
         MyTable.FieldDefs.Add('EBI',ftFloat);
         MyTable.IndexDefs.Add('','ID',[ixPrimary,ixUnique]);
         MyTable.IndexDefs.Add('iAnimalLactNo','AnimalCode;LactNo',[ixCaseInsensitive]);
         MyTable.IndexDefs.Add('iDateOfRecording','DateOfRecording',[ixCaseInsensitive]);
         MyTable.CreateTable;
         MyTable.Open;
         MySource := TDataSource.Create(nil);
         MySource.DataSet := MyTable;

         // assign grid datasource
         if NOT(Assigned(DiskContents.DataSource))then
            DiskContents.DataSource := MySource;

         TAnimals := TTable.Create(nil);
         TAnimals.DatabaseName := WinData.KingData.DatabaseName;
         TAnimals.TableName := 'TempCows';
         TAnimals.TableType := ttParadox;
//         TAnimals.FieldDefs := WinData.AnimalFileByID.FieldDefs;
         TAnimals.FieldDefs.Add('ID', ftInteger, 0, False);
         TAnimals.FieldDefs.Add('LactNo', ftInteger, 0, False);
         TAnimals.FieldDefs.Add('AnimalNo', ftString, 10, False);
         TAnimals.FieldDefs.Add('ActualAnimalNo', ftString, 10, False);
         TAnimals.FieldDefs.Add('NatIDNum',ftString,20,False);
         TAnimals.FieldDefs.Add('SortAnimalNo', ftString, 10, False);
         TAnimals.FieldDefs.Add('SaleDeathDate', ftDate, 0, False);
         TAnimals.IndexDefs.Add('','ID',[ixPrimary,ixUnique]);
         TAnimals.IndexDefs.Add('iAnimalNo','AnimalNo',[ixCaseInSensitive]);
         TAnimals.CreateTable;
         TAnimals.Open;


         MyQuery := TQuery.Create(nil);
         MyQuery.DatabaseName := WinData.KingData.DatabaseName;
         ADrive.Enabled := False;
         eMailDrive.Enabled := False;
         FirstRecording := FALSE;
         // check default milk disk settings and assign to variables

         { Get last MR Date Entered into system.}
         with TransQuery do
            begin
               SQL.Clear;
               SQL.Add('Select Max(RecordingDate) RecDate From MDT ');
               Open;
               if FieldByName('RecDate').AsDateTime > 0 then
                  LastDate.Text := FormatDateTime(cIrishDateStyle, FieldByName('RecDate').AsDateTime)
               else
                  LastDate.Text := 'Not Found';
               Close;
            end;

         ShowModal;
      finally
         if WinData.ICBFMilkRec then
            begin
               WinData.ICBFMilkRec := False;

               qCurrLact.Close;
               dsCurrLact.Free;

               TempMilkDisk.Close;
               TempMilkDisk.DeleteTable;
            end;
         WinData.MainMilkTrans.Close;
         WinData.MilkDiskTrans.Close;

         if MyTable <> nil then
            begin
               MyTable.Close;
               MyTable.DeleteTable;
               MyTable.Free;
            end;
         if MySource <> nil then
            begin
               MySource.Enabled := False;
               MySource.Free;
            end;
         if TAnimals <> nil then
            begin
               TAnimals.Close;
               TAnimals.DeleteTable;
               TAnimals.Free;
            end;

         if MilkDisk <> nil then
            begin
               MilkDisk.Close;
               MilkDisk.Free;
            end;

         if MyQuery <> nil then
            begin
               MyQuery.Close;
               MyQuery.Free;
            end;

         if ( tCowExt <> nil ) then
            begin
               // This will occurr where user has clicked the save button.
               // if User clicks save updates are applied to the database and cancelupdates will have no effect
               if tCowExt.UpdatesPending then
                  tCowExt.CancelUpdates;
               tCowExt.Close;
               tCowExt.Free;
            end;

         if ( tICBFRec <> nil ) then
            begin
               tICBFRec.Close;
               tICBFRec.DeleteTable;
               FreeAndNil(tICBFRec);
            end;

         Free;
      end;
   FFileName := '';
end;

procedure TfMilkRec.ExitButtonClick(Sender: TObject);
begin
   Close;
end;

procedure TfMilkRec.rgMilkRecClick(Sender: TObject);
begin
   if (rgMilkRec.ItemIndex = 0) then       // A drive
      begin
         ADrive.Enabled := True;
         eMailDrive.Enabled := False;
      end
   else if (rgMilkRec.ItemIndex = 1) then  // e-mail
      begin
         ADrive.Enabled := False;
         eMailDrive.Enabled := True;
      end;
end;

function TfMilkRec.GetLastRecording(NoDate: boolean): boolean;
begin
   try

      // Get the Last Milk Recording Date
      MyQuery.SQL.Clear;
      MyQuery.DatabaseName := WinData.KingData.DatabaseName;
      MyQuery.SQL.Add('SELECT ID, RecordingDate, MilkRecID FROM MDT');
      MyQuery.SQL.Add('ORDER BY RecordingDate ASC');
      MyQuery.Open;
      MyQuery.Last;

      if (MyQuery.RecordCount > 0) then
         begin
            LastDate.Text := FormatDateTime(cIrishDateStyle,MyQuery.FieldByName('RecordingDate').AsDateTime);
            LastRecordingDate := MyQuery.FieldByName('RecordingDate').AsDateTime;
            FirstRecording := False;
            RESULT := True;
            if MyQuery.FieldByName('RecordingDate').AsDateTime = LastRecordingDate then
               if MyQuery.FieldByName('MilkRecID').AsString <> CurrentID then
                  begin
                     FirstRecording := True;
                     LastRecordingDate := 0;
                     RESULT := True;               //SP To fix Multiherd Milk recording 08/02/01
                  end;
         end
      else
         begin
            FirstRecording := True;
            LastRecordingDate := 0;
            RESULT := True;
         end;

   finally
      //
   end;
end;

procedure TfMilkRec.SetPositions;
begin
   // get milk disk layout format to use
   try
      WinData.Defaults.Open;
      WinData.Defaults.First;
      CountryCode := 'I';
      if WinData.Defaults.RecordCount > 0 then
         begin
            WinData.MilkDiskLayout.Open;
            if NOT WinData.MilkDiskLayout.Locate('ID',WinData.Defaults.FieldByName('MilkLayout').AsInteger,[] ) then
               WinData.MilkDiskLayout.First
            else
               begin
                  CountryCode := UpperCase(WinData.MilkDiskLayout.FieldByName('Country').AsString)[1];
                  // Set the default Name
                  aDrive.Text := WinData.MilkDiskLayout.FieldByName('DefaultName').AsString;
                  eMailDrive.Text := WinData.MilkDiskLayout.FieldByName('DefaultName').AsString;
               end;
         end;

      if CountryCode = 'I' then
         begin
            Caption := 'Milk Recording - Irish Milk Recording Disk';
            miUseICBFFormat.Visible := True;
            ICBFMatching1.Visible := True;
         end
      else if CountryCode = 'N' then
         begin
            Caption := 'Milk Recording - Northern Irish Milk Recording Disk';
            miUseICBFFormat.Visible := False;
            ICBFMatching1.Visible := False;
         end
      else if CountryCode = 'E' then
         begin
            Caption := 'Milk Recording - English Milk Recording Disk';
            miUseICBFFormat.Visible := False;
            ICBFMatching1.Visible := False;
         end
      else if CountryCode = 'S' then
         begin
            Caption := 'Milk Recording - Scottish Milk Recording Disk';
            miUseICBFFormat.Visible := False;
            ICBFMatching1.Visible := False;
         end
      else
         begin
            Caption := 'Milk Recording - UnDefined Country of Recording';
            miUseICBFFormat.Visible := False;
            ICBFMatching1.Visible := False;
         end;

       with WinData.MilkDiskLayout do
         begin
            TestDatePos      := FieldByName('TestDatePos').AsInteger;
            TestDateLen      := FieldByName('TestDateLen').AsInteger;
            CowNoPos         := FieldByName('AnimalNoPos').AsInteger;
            CowNoLen         := FieldByName('AnimalNoLen').AsInteger;
            CowNoChars       := FieldByName('AnimalNoChars').AsInteger;
            DailyYieldPos    := FieldByName('DailyMilkYieldPos').AsInteger;
            DailyYieldLen    := FieldByName('DailyMilkYieldLen').AsInteger;
            DailyBFatPercPos := FieldByName('DailyBFatPos').AsInteger;
            DailyBFatPercLen := FieldByName('DailyBFatLen').AsInteger;
            DailyProtPercPos := FieldByName('DailyProtPos').AsInteger;
            DailyProtPercLen := FieldByName('DailyProtLen').AsInteger;
            CumYieldPos      := FieldByName('CumYieldPos').AsInteger;
            CumYieldLen      := FieldByName('CumYieldLen').AsInteger;
            CumBFatPercPos   := FieldByName('CumBFatPos').AsInteger;
            CumBFatPercLen   := FieldByName('CumBFatLen').AsInteger;
            CumProtPercPos   := FieldByName('CumProtPos').AsInteger;
            CumProtPercLen   := FieldByName('CumProtLen').AsInteger;
            CumLactPos       := FieldByName('CumLactPos').AsInteger;
            CumLactLen       := FieldByName('CumLactLen').AsInteger;
            Yield305Pos      := FieldByName('Yield305Pos').AsInteger;
            Yield305Len      := FieldByName('Yield305Len').AsInteger;
            BFat305PercPos   := FieldByName('BFat305PercPos').AsInteger;
            BFat305PercLen   := FieldByName('BFat305PercLen').AsInteger;
            Prot305PercPos   := FieldByName('Prot305PercPos').AsInteger;
            Prot305PercLen   := FieldByName('Prot305PercLen').AsInteger;
            NoOfTestsPos     := FieldByName('NoOfTestsPos').AsInteger;
            NoOfTestsLen     := FieldByName('NoOfTestsLen').AsInteger;
            DaysInMilkPos    := FieldByName('DaysInMilkPos').AsInteger;
            DaysInMilkLen    := FieldByName('DaysInMilkLen').AsInteger;
            SCCPos           := FieldByName('SCCPos').AsInteger;
            SCCLen           := FieldByName('SCCLen').AsInteger;
         end;
      WinData.MilkDiskLayout.Close;
      ErrorReport.Hide;
   except
      MessageDLG('Problem locating Disk Layout - contact Kingswood',mtInformation,[mbOK],0);
   end;
end;

procedure TfMilkRec.RunErrorReport(RepType : TtypeOfReport);
Var
   GenQuery : TQuery;
begin
   GenQuery := TQuery.Create(nil); // Sp
   try
      GenQuery.SQL.Clear;
      GenQuery.DatabaseName := WinData.KingData.DatabaseName;

      if FCountry = England then
         begin
            GenQuery.SQL.Add('SELECT NatIDNum, DailyYield, DailyBFatPerc, DailyProtPerc, SCC, LastCalvingDate FROM TempMilk');
            if RepType = NotMatched then
               GenQuery.SQL.Add('WHERE Found = FALSE')
            else
               GenQuery.SQL.Add('WHERE ExcludeHasCalved = TRUE');
            GenQuery.SQL.Add('ORDER BY NatIDNum');
            GenQuery.Open;
         end
      else
         begin
            GenQuery.SQL.Add('SELECT AnimalCode, DailyYield, DailyBFatPerc, DailyProtPerc, SCC, LastCalvingDate FROM TempMilk');

            if RepType = NotMatched then
               GenQuery.SQL.Add('WHERE Found = FALSE')
            else
               GenQuery.SQL.Add('WHERE ExcludeHasCalved = TRUE');
            GenQuery.SQL.Add('ORDER BY AnimalCode');
            GenQuery.Open;
         end;
      ErrorReport.DataSet := GenQuery;
      DB1.DataSet := GenQuery;
      DB2.DataSet := GenQuery;
      DB3.DataSet := GenQuery;
      DB4.DataSet := GenQuery;
      dbSCC.DataSet := GenQuery;
      if RepType = NotMatched then
         begin
            if FCountry = England then
               begin
                  QRLabel2.Caption := 'NationalID';
                  DB1.DataField := 'NatIDNum';
               end;
            dbSCC.DataField := 'SCC';
            qrSCC.Caption := 'S.C.C.';
            qrlHeading.Caption := 'Animals NOT Matched from Milk Disk';
            qrlText.Lines.Clear;
            qrlText.Lines.Add('The Cow(s) listed below are on the Milk Recording Diskette,');
            qrlText.Lines.Add('but they do not appear to be on the Herd Management System.');
            qrlText.Lines.Add('Check the cow no(s) and then search your Herd System for the animal(s).');
            qrlText.Lines.Add('You should NOT complete the recording until you are satisfied that this is a');
            qrlText.Lines.Add('Milk Recording Error.');
         end
      else if RepType = Exclusions then
         begin
            dbSCC.DataField := 'LastCalvingDate';
            qrSCC.Caption := 'Last Calving';
            qrlHeading.Caption := 'Animals Calved After Milk Recording Date';
            qrlText.Lines.Clear;
            qrlText.Lines.Add('The Cow(s) listed below are on the Herd Management System,');
            qrlText.Lines.Add('they are being excluded because they Calved after the Milk Recording Date');
         end;
      ErrorReport.Preview;
   finally
      GenQuery.Free;
   end;
end;

procedure TfMilkRec.CheckAnimals;

   procedure ProcessAnimal;
   begin
      MyTable.Edit;
      // Don't assign the current Lactation if ICBF recording, take it from ICBF disk.
      if NOT ( WinData.ICBFMilkRec ) then
         MyTable.FieldByName('LactNo').Value := TAnimals.FieldByName('LactNo').Value;
      MyTable.FieldByName('AnimalID').Value := TAnimals.FieldByName('ID').Value;
      MyTable.FieldByName('NatIDNum').Value := TAnimals.FieldByName('NatIDNum').Value;
      MyTable.FieldByName('Found').AsBoolean := True;
      // get the Last Calving Date
      if WinData.CheckEvents.Locate('AnimalId;AnimalLactNo;EventType',
                             VarArrayOf([MyTable.FieldByName('AnimalID').AsInteger,
                             MyTable.FieldByName('LactNo').AsInteger,CCalvingEvent]),[] ) then
         MyTable.FieldByName('LastCalvingDate').AsDateTime := WinData.CheckEvents.FieldByName('EventDate').AsDateTime
      else
         MyTable.FieldByName('LastCalvingDate').Clear;
      MyTable.FieldByName('ExcludeHasCalved').AsBoolean := FALSE;
      // Check the Animal calving date is before the Statement Date

      if ( NOT MyTable.FieldByName('LastCalvingDate').IsNull ) then
         // if ( MyTable.FieldByName('LastCalvingDate').AsDateTime > recordingDate {MyTable.FieldByName('DateOfRecording').AsDateTime ) then
         if ( MyTable.FieldByName('LastCalvingDate').AsDateTime > RecordingDate ) then
            begin
               MyTable.FieldByName('ExcludeHasCalved').AsBoolean := TRUE;
               Inc(iNoExcludeHasCalved);
            end;
      MyTable.Post;
      Inc ( iNoFound );
   end;

begin
   iNoExcludeHasCalved := 0;
   iNoFound := 0;
   iNoNotFound := 0;
   MyTable.First;
   while NOT MyTable.EOF do
      begin

//         Application.ProcessMessages;
         // See if you can find the AnimalCode in Animals as AnimalNo

         if FCountry = England then
             if (Length( Trim( MyTable.FieldByName('NatIdNum').AsString)) > 0 ) then
               begin
                  if TAnimals.Locate('NatIdNum',MyTable.FieldByName('NatIdNum').AsString,[] ) then
                     begin
                        ProcessAnimal;
                        Inc ( iNoFound );
                     end
                  else
                     Inc ( iNoNotFound );
               end
          else
            if TAnimals.Locate('AnimalNo',MyTable.FieldByName('AnimalCode').Value,[] )
               then
               ProcessAnimal
            else
               if (Length( Trim( MyTable.FieldByName('NatIdNum').AsString)) > 0 ) then
                  begin
                     if TAnimals.Locate('NatIdNum',MyTable.FieldByName('NatIdNum').AsString,[] ) then
                        begin
                           ProcessAnimal;
                           Inc ( iNoFound );
                        end
                     else
                       Inc ( iNoNotFound );
                  end;
            MyTable.Next;
      end;

   NoFound.Text := IntToStr(iNoFound-iNoExcludeHasCalved);
   NoNotFound.Text := IntToStr(iNoNotFound);
   NoExcludeHasCalved.Text := IntToStr(iNoExcludeHasCalved);
   MyTable.First;
   if (iNoNotFound > 0) then
      if MessageDLG('Some Cows could not be located - Click YES to Review',mtWarning,[mbYES,mbNO],0) = mrYES then
         RunErrorReport(NotMatched);
   if (iNoExcludeHasCalved > 0) then
      if MessageDLG('Some Cows have calved since Milk Recording - Click YES to Review',mtWarning,[mbYES,mbNO],0) = mrYES then
         RunErrorReport(Exclusions);
end;
{
function TfMilkRec.CheckFileExists(NameToCheck: String): Boolean;
var
   TestFile : TextFile;
begin
   // Test the File Exists
   RESULT := TRUE;
   try
      AssignFile(TestFile,NameToCheck);
      Reset(TestFile);
      CloseFile(TestFile);
   except
      RESULT := FALSE;
   end;
end;
}
procedure TfMilkRec.bRecordClick(Sender: TObject);
var
   ICBFFileRecord : TICBFFileRecord;
   StrFileDate : string;

begin
   if (HerdNum.Value = '0') then
      begin
         MessageDLG('You must select a Herd',mtinformation,[mbOK],0);
         HerdNum.DropDown;
         Exit;
      end;

   WinData.ICBFMilkRec := miUseICBFFormat.Checked;

   if not WinData.ICBFMilkRec then
      DeleteOldNMRFile;
   NoFound.Text := '0';
   NoNotFound.Text := '0';
   NoExcludeHasCalved.Text := '0';
   ThisDate.Text := '';
   Application.ProcessMessages;

   with MyQuery do
      begin
         SQL.Clear;
         SQL.Add('DELETE FROM TempCows');
         ExecSQL;

         if WinData.ICBFMilkRec then
            begin
               DiskContents.DataSource := nil;


               if ( FFileName = '' ) then
                  begin
                     ICBFFileRecord := GetICBFFile(WinData.MilkRecDir);
                     MilkFileName   := ICBFFileRecord.FileName;
                     CutOffDate     := IncMonth(ICBFFileRecord.FileDate, -12);
                  end
               else
                  begin
                     // load from attachment
                     MilkFileName := FFileName;
                     ICBFFileRecord.FileDate := 0;
                     // is the file a previously read file?
                     if Pos('_read', FFileName) > 0 then
                        StrFileDate := Copy(FFileName, Length(FFileName)-17, 8)
                     else
                        StrFileDate := Copy(FFileName, Length(FFileName)-12, 8);
                     try
                        StrFileDate  := Copy(StrFileDate, 1, 2) + '/' + Copy(StrFileDate, 3, 2) + '/' + Copy(StrFileDate, 5, 4);
                        ICBFFileRecord.FileDate := StrToDate(StrFileDate);
                        CutOffDate     := IncMonth(ICBFFileRecord.FileDate, -12);
                     except
                     end;
                  end;

               UpdateStatusbar;
               if MilkFileName = '' then
                  begin
                     MessageDlg('No ICBF Milk Files can be found in '+ FileLocation +'',mtInformation,[mbOK],0);
                     Exit;
                  end;

                SQL.Clear;
                SQL.Add('INSERT INTO TempCows (ID, AnimalNo, NatIDNum, LactNo, SortAnimalNo, SaleDeathDate) ');
                SQL.Add('SELECT A.ID, A.AnimalNo, A.NatIDNum, A.LactNo, A.SortAnimalNo, "'+FormatDateTime('mm/dd/yyyy', 0)+'" FROM Animals A  ');
                SQL.Add('WHERE (A.Sex = "Female")       ');
                SQL.Add('AND   (A.LactNo>0)                              ');
                SQL.Add('AND   (A.AnimalDeleted=FALSE)                   ');
                SQL.Add('AND   (A.AnimalNo IS NOT NULL)                  ');
                SQL.Add('AND   (A.HerdID <> '+IntToStr(WinData.NONEHerdID)+')');
                if HerdNum.Visible then
                   MyQuery.SQL.Add('AND (A.HerdID = ' + HerdNum.Value + ')');
                ExecSQL;

            end
         else
            begin
                SQL.Clear;
                SQL.Add('INSERT INTO TempCows (ID, AnimalNo, NatIDNum, LactNo, SortAnimalNo ) ');
                SQL.Add('SELECT A.ID, A.AnimalNo, A.NatIDNum, A.LactNo, A.SortAnimalNo FROM Animals A  ');
                SQL.Add('WHERE (Sex = "Female") ');
                SQL.Add('AND   (InHerd=TRUE)');
                SQL.Add('AND   (LactNo>0)');
                SQL.Add('AND   (AnimalDeleted=FALSE)');
                SQL.Add('AND   (AnimalNo IS NOT NULL)');
                SQL.Add('AND   (HerdID <> '+IntToStr(WinData.NONEHerdID)+')');
                if HerdNum.Visible then
                   MyQuery.SQL.Add('AND (HerdID = ' + HerdNum.Value + ')');
                ExecSQL;
            end;

      end;

      if WinData.ICBFMilkRec then
         begin
            FieldSep := ',';
            ProcessMMRFile;
         end
      else
         begin
            if (CountryCode in ['E', 'S', 'N']) then
               begin
                  if UPPERCASE(aDrive.Text) = 'DSMEMBER.DAT' then
                     begin
                        if not CallNMRStream then
                           begin
                              MessageDlg('Unable to extract DSMember.dat from DSMember.exe file',mtError,[mbOK],0);
                              Abort;
                           end;
                     end
                  else if rgMilkRec.ItemIndex = 0 then
                     begin
                        if not FileExists(aDrive.Text) then
                           aDrive.DoClick;
                     end
                  else
                     eMailDrive.DoClick;
                  Application.ProcessMessages;
                  DoMilkRecording;
               end
            else
               begin
                  if ( rgMilkRec.ItemIndex = 1 ) then
                     eMailDrive.DoClick
                  else
                     aDrive.DoClick;
                  DoMilkRecording;
               end;
         end;
   MilkState := MFRead;
end;

procedure TfMilkRec.DoMilkRecording;
var
   TempStr : String;
   sDay,
   sMonth,
   sYear,
   NewDate : String;
   MyFile : TextFile;
   MilkIDSet,
   DateSet,
   AnimalCodeOK,
   DailyYieldOK,
   DailyBFatOK,
   DailyProtOK,
   CumYieldOK,
   CumBFatOK,
   CumProtOK,
   Yield305OK,
   BFat305OK,
   Prot305OK,
   NoOfRecOK,
   DaysInMilkOK,
   SCCOK,
   NoErrors,
   IDFound,
   CumDisc      : Boolean;
   DryDate,
   AnimalTestDate : TDateTime;
   TempFloat : Double;
// ******************************************* start of checkdates
   function CheckDates : Boolean;
   var
      DateOK : Boolean;
   begin
      ReSet(MyFile);
      DateOK := FALSE;
      MilkIDSet := FALSE;
      CumDisc := False;
      while NOT EOF(MyFile) do
         begin
            ReadLn(MyFile,DiskLine);

            if (CountryCode = 'N') then
               begin
                  MilkIDSet := TRUE;
                  CurrentID := '';
               end
            else
               // Only check if Ireland
               begin
                  if (NOT MilkIDSet) then
                     begin
                        CurrentID := Copy(DiskLine,1,7);
                        CurrentID := WinData.StripAllSpaces(CurrentID);
                        if Length(CurrentID) > 0 then
                           MilkIDSet := TRUE;
                     end;
               end;

            // Get the Test Date
            TempStr := Copy(DiskLine,TestDatePos,TestDateLen);
            if (CountryCode = 'N') then
               begin // Northern Ireland
                  sDay := Copy(TempStr,1,2);
                  sMonth := Copy(TempStr,3,2);
                  sYear := Copy(TempStr,5,2);
                  if (sYear >= '00') And (sYear <= '60') then
                     sYear := '20' + sYear
                  else
                     sYear := '19' + sYear;
               end
            else if (CountryCode = 'S') then
               begin // scotland (rules!)
                  sYear := Copy(TempStr,1,2);
                  sMonth := Copy(TempStr,3,2);
                  sDay := Copy(TempStr,5,2);
               end
            else if TestDateLen = 6 then
               begin // ROI
                  sYear := Copy(TempStr,1,2);
                  sMonth := Copy(TempStr,3,2);
                  sDay := Copy(TempStr,5,2);
                  if (sYear >= '00') and (sYear <= '60') then
                     sYear := '20' + sYear
                  else
                     sYear := '19' + sYear;
               end
            else if TestDateLen = 8 then
               begin
                  // New 4 Digit Year
                  sYear := Copy(TempStr,1,4);
                  sMonth := Copy(TempStr,5,2);
                  sDay := Copy(TempStr,7,2);
               end;

            NewDate := sDay + '/' + sMonth + '/' + sYear;

            try
               if NOT DateOK then
                  RecordingDate := StrToDate(NewDate);
               DateOK := TRUE;
            except
               // Not a valid Date
            end;

         end;

      CloseFile(MyFile);
      Result := TRUE;
      // if no date assume disc is cumulative update
      if NOT DateOK then
         begin
            CumDisc := True;
            // read dry off date as last recording date if cumulative disk - 21/12/00 - kr
            try
               Reset(MyFile);
               DryDate := 0;
               RecordingDate := 0;
               while NOT EOF(MyFile) do
                  begin
                     ReadLn(MyFile,DiskLine);
                     if (Copy(Diskline,74,2) = 'DR') then
                        DryDate := StrToDate(Copy(DiskLine,83,2)+'/'+Copy(DiskLine,81,2)+'/'+Copy(DiskLine,77,4));
                     if (DryDate <> 0) then
                        begin
                           TidyUpDisk := True;
                           Result := True;
                           RecordingDate := DryDate;
                           break;
                        end;
                  end;
            finally
               CloseFile(MyFile);
            end;
         end;

      if Result then
         if (HerdNum.Visible) And (CountryCode <> 'N') then
            if MilkIDSet then
               begin
                  if Length(CurrentID) > 0 then
                     if WinData.qHerdDefaults.FieldByName('MilkRecordingID').AsString <> CurrentID then
                        begin
                           MilkIDSet := FALSE;
                           Result := FALSE;
                        end;
               end;
   end;
// ******************************************* end of checkdates

// ******************************************* start of reporterrors
   procedure ReportErrors;
   begin
     ErrorCount := 0;
     if NOT DateSet then
        begin
           MessageDLG('Error - No Valid Recording Date found',mtInformation,[mbOK],0);
           Inc(Errorcount);
        end;
     if NOT AnimalCodeOK then
        begin
           MessageDLG('Error - Animal No conversion',mtInformation,[mbOK],0);
           Inc(Errorcount);
        end;
     if NOT DailyYieldOK then
        begin
           MessageDLG('Error - Daily Yield',mtInformation,[mbOK],0);
           Inc(Errorcount);
        end;
     if NOT DailyBFatOK then
        begin
           MessageDLG('Error - Daily Butterfat',mtInformation,[mbOK],0);
           Inc(Errorcount);
        end;
     if NOT DailyProtOK then
        begin
           MessageDLG('Error - Daily Protein',mtInformation,[mbOK],0);
           Inc(Errorcount);
        end;
     if NOT CumYieldOK then
        begin
           MessageDLG('Error - Cumulative Yield',mtInformation,[mbOK],0);
           Inc(Errorcount);
        end;
     if NOT CumBFatOK then
        begin
           MessageDLG('Error - Cumulative Butterfat',mtInformation,[mbOK],0);
           Inc(Errorcount);
        end;
     if NOT CumProtOK then
        begin
           MessageDLG('Error - Cumulative Protein',mtInformation,[mbOK],0);
           Inc(Errorcount);
        end;
     if NOT Yield305OK then
        begin
           MessageDLG('Error - 305 Yield',mtInformation,[mbOK],0);
           Inc(Errorcount);
        end;
     if NOT BFat305OK then
        begin
           MessageDLG('Error - 305 Butterfat',mtInformation,[mbOK],0);
           Inc(Errorcount);
        end;
     if NOT Prot305OK then
        begin
           MessageDLG('Error - 305 Protein',mtInformation,[mbOK],0);
           Inc(Errorcount);
        end;
     if NOT NoOfRecOK then
        begin
           MessageDLG('Error - No of Recording',mtInformation,[mbOK],0);
           Inc(Errorcount);
        end;
     if NOT DaysInMilkOK then
        begin
           MessageDLG('Error - Days in Milk',mtInformation,[mbOK],0);
           Inc(Errorcount);
        end;
     if NOT SCCOK then
        begin
           MessageDLG('Error - S.C.C.',mtInformation,[mbOK],0);
           Inc(Errorcount);
        end;
   end;
// ************************************** end of Report Errors
var
   NatIDNum : string;

begin  // DoMilkRecording
   sbReview.Enabled := FALSE;
   DateSet      := FALSE;
   AnimalCodeOK := TRUE;
   DailyYieldOK := TRUE;
   DailyBFatOK  := TRUE;
   DailyProtOK  := TRUE;
   CumYieldOK   := TRUE;
   CumBFatOK    := TRUE;
   CumProtOK    := TRUE;
   Yield305OK   := TRUE;
   BFat305OK    := TRUE;
   Prot305OK    := TRUE;
   NoOfRecOK    := TRUE;
   DaysInMilkOK := TRUE;
   SCCOK        := TRUE;
   NoErrors     := TRUE;
   RecordingDate := 0;
   ThisDate.Text := '';
   LastRecordingDate := 0;
   LastDate.Text := '';
   // Checks for existing ID in MDT
   CheckRecordingOK;

   try

      // Using the TempCow file Strip all zeros and spaces from the AnimalNo
      TAnimals.First;
      while NOT TAnimals.EOF do
         begin
            TAnimals.Edit;
            TAnimals.FieldByName('ActualAnimalNo').Value := TAnimals.FieldByName('AnimalNo').Value;
            TAnimals.FieldByName('AnimalNo').Value := StripLeadingZeros(TAnimals.FieldByName('AnimalNo').Value);

            if ( FCountry = England ) then
               begin
                  NatIDNum := TAnimals.FieldByName('NatIDNum').Value;

                  while (Length(NatIdNum) > 0) and ( not (NatIdNum[1] in ['0'..'9']) ) do
                     begin
                        Delete(NatIdNum, 1,1);
                     end;

                  TAnimals.FieldByName('NatIDNum').Value := NatIDNum;



               end;

            TAnimals.Post;
            TAnimals.Next;
         end;

      if rgMilkRec.ItemIndex = 0 then
         begin
            // Delete quotes from the string
            TempStr := aDrive.Text;
            TempStr := WinData.StripSpaces(TempStr);
            if POS('"',TempStr) <> 0 then
               Delete ( TempStr,POS('"',TempStr),1);
            if POS('"',TempStr) <> 0 then
               Delete ( TempStr,POS('"',TempStr),1);
            if POS('''',TempStr) <> 0 then
               Delete ( TempStr,POS('''',TempStr),1);
            if POS('''',TempStr) <> 0 then
               Delete ( TempStr,POS('''',TempStr),1);
            aDrive.Text := TempStr;
            AssignFile(MyFile, aDrive.Text )
         end
      else
         begin
            // Delete quotes from the string
            TempStr := eMailDrive.Text;
            TempStr := WinData.StripSpaces(TempStr);
            if POS('"',TempStr) <> 0 then
               Delete ( TempStr,POS('"',TempStr),1);
            if POS('"',TempStr) <> 0 then
               Delete ( TempStr,POS('"',TempStr),1);
            if POS('''',TempStr) <> 0 then
               Delete ( TempStr,POS('''',TempStr),1);
            if POS('''',TempStr) <> 0 then
               Delete ( TempStr,POS('''',TempStr),1);
            eMailDrive.Text := TempStr;
            AssignFile(MyFile, eMailDrive.Text );
         end;

      if CheckDates then
         begin
            IDFound := False;
            // check for herdid(milkrecid)-currentid match -20/12/00 -kr
            if (CountryCode <> 'N') then // SP 29/01/01 If countrycode was N the it wouldn't locate ID
               begin
                  with MyQuery do
                     begin
                        Close;
                        SQL.Clear;
                        SQL.Add('SELECT MilkRecordingID FROM Owners WHERE ID = '+HerdNum.Value+'');
                        Open;
                        if (RecordCount > 0) then
                           begin
                              First;
                              while NOT EOF do
                                 begin
                                    if (CurrentID = FieldByName('MilkRecordingID').AsString) then
                                       IDFound := True;
                                    Next;
                                 end;
                           end;
                     end;
                 // if no match found  - 20/12/00 - kr
                if NOT IDFound then
                   begin
                      if (messagedlg('Is this the correct herd for this Milk Disk?',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
                         // assign currentid to owners file
                         begin
                            WinData.OwnerFile.Locate('ID',HerdNum.Value,[]);
                            WinData.OwnerFile.Edit;
                            WinData.OwnerFile.FieldByName('MilkRecordingID').AsString := CurrentID;
                            WinData.OwnerFile.Post;
                         end
                      else
                         begin
                            // get herdid
                            HerdNum.DropDown;
                            Abort;
                         end;
                   end
            else
               //
               end;

            // Get the Last Recording Date
            if (NOT GetLastRecording(False)) then
               exit;
            ThisDate.Text := FormatDateTime(cIrishDateStyle, RecordingDate);  // Set the display date
            DateSet := TRUE;
            Reset(MyFile);
            // Empty the Table
            MyTable.Close;
            MyTable.EmptyTable;
            MyTable.Open;

            // skip first line if scottish milk disk
            WinData.MainMilkTrans.Open;
            if (Countrycode = 'S') then
               begin
                  ReadLn(MyFile, Diskline); // First line contains info about herd. Skip it.
                  { Need to find the test date }

                  TempStr := Copy(DiskLine, Length(DiskLine) -11, 12);
                  RecordingDate := StrToDate(Copy(TempStr, 5, 2) + '/' + Copy(TempStr, 3, 2) + '/' +  Copy(TempStr, 1, 2));
                  ThisDate.Text := FormatDateTime(cIrishDateStyle, RecordingDate);  // Set the display date

//                Is there an earlier data entered ?
                  if WinData.MainMilkTrans.Locate('RecordingDate', RecordingDate, [] ) then
                     begin
                        MessageDlg('Milk File for '+ ThisDate.Text +' already exists in database',mtError,[mbOK],0);
                        Abort;
                     end;
//                Is there an later date already entered?
                  if ( LastRecordingDate > 0 ) and (LastRecordingDate > RecordingDate ) then
                     begin
                        MessageDlg('Unable to complete recording. Later milk recording date(s) have been found in the database',mtError,[mbOK],0);
                        Abort;
                     end;

                  while not eof(MyFile) do
                     begin
                        //Application.ProcessMessages;
                        ReadLn(MyFile,Diskline);
                        MyTable.Insert;

                        // Get the Test Date on current rec, if not same ignore
                        TempStr := Copy(DiskLine, TestDatePos, TestDateLen);
                        AnimalTestDate := StrToDate(Copy(TempStr, 5, 2) + '/' + Copy(TempStr, 3, 2) + '/' +  Copy(TempStr, 1, 2));
                        if AnimalTestDate = RecordingDate then
                           begin
                              try
                                 MyTable.FieldByName('DateOfRecording').AsDateTime := AnimalTestDate;
                              except
                                 MyTable.FieldByName('DateOfRecording').Clear;
                              end;

                              // Get the Animal Code - NOT ID
                              TempStr := Copy ( DiskLine, CowNoPos, CowNoLen );
                              TempStr := StripLeadingZeros(TempStr);
                              try
                                 MyTable.FieldByName('AnimalCode').Value := TempStr;
                              except
                                 AnimalCodeOK := FALSE;
                                 NoErrors := FALSE;
                              end;

                              // Get the Cumulative Yield
                              TempStr := Copy(DiskLine,CumYieldPos,CumYieldLen);
                              TempStr := WinData.StripSpaces(TempStr);
                              try
                                 if StrToFloat(TempStr) <> 0 then
                                    MyTable.FieldByName('CumYield').Value := StrToFloat(TempStr) / 10;
                              except
                                 CumYieldOK := FALSE;
                                 NoErrors := FALSE;
                              end;

                              // Get the Cumulative BFat
                              TempStr := Copy (DiskLine, CumBFatPercPos, CumBFatPercLen );
                              TempStr := WinData.StripSpaces(TempStr);
                              try
                                 if StrToFloat(TempStr) <> 0 then
                                    MyTable.FieldByName('CumBFatPerc').Value := (( ( StrToFloat(TempStr) / 10 ) / MyTable.FieldByName('CumYield').Value ) * 100);
                              except
                                 CumBFatOK := FALSE;
                                 NoErrors := FALSE;
                              end;

                              // Get the Cumulative Prot
                              TempStr := Copy (DiskLine, CumProtPercPos, CumProtPercLen );
                              TempStr := WinData.StripSpaces(TempStr);
                              try
                                 if StrToFloat(TempStr) <> 0 then
                                    MyTable.FieldByName('CumProtPerc').Value := (( ( StrToFloat(TempStr) / 10 ) / MyTable.FieldByName('CumYield').Value ) * 100);
                              except
                                 CumProtOK := FALSE;
                                 NoErrors := FALSE;
                              end;

                              // Get the Cumulative Lact
                              TempStr := Copy (DiskLine, CumLactPos , CumLactLen );
                              TempStr := WinData.StripSpaces(TempStr);
                              try
                                 if StrToFloat(TempStr) <> 0 then
                                    MyTable.FieldByName('CumLactPerc').Value := (( ( StrToFloat(TempStr) / 10 ) / MyTable.FieldByName('CumYield').Value ) * 100);
                              except
                                 CumProtOK := FALSE;
                                 NoErrors := FALSE;
                              end;

                              // Get the Daily Yield
                              TempStr := Copy (DiskLine, DailyYieldPos, DailyYieldLen );
                              TempStr := WinData.StripSpaces(TempStr);
                              try
                                 if StrToFloat(TempStr) <> 0 then
                                    MyTable.FieldByName('DailyYield').Value := StrToFloat(TempStr) / 10;
                              except
                                 DailyYieldOK := FALSE;
                                 NoErrors := FALSE;
                              end;

                              // Get the Daily BFat
                              TempStr := Copy(DiskLine,DailyBFatPercPos,DailyBFatPercLen);
                              TempStr := WinData.StripSpaces(TempStr);
                              try
                                 if StrToFloat(TempStr) <> 0 then
                                    MyTable.FieldByName('DailyBFatPerc').Value := StrToFloat(TempStr) / 100;
                              except
                                 DailyBFatOK := FALSE;
                                 NoErrors := FALSE;
                              end;

                              // Get the Daily Prot
                              TempStr := Copy(DiskLine,DailyProtPercPos,DailyProtPercLen);
                              TempStr := WinData.StripSpaces(TempStr);
                              try
                                 if StrToFloat(TempStr) <> 0 then
                                    MyTable.FieldByName('DailyProtPerc').Value := StrToFloat(TempStr) / 100;
                              except
                                 DailyProtOK := FALSE;
                                 NoErrors := FALSE;
                              end;

                              // Get the 305 Yield
                              TempStr := Copy (DiskLine, Yield305Pos, Yield305Len );
                              TempStr := WinData.StripSpaces(TempStr);
                              try
                                 // if theres a value store it else store the cumulative
                                 MyTable.FieldByName('Yield305').Value := StrToFloat(TempStr) / 10;
                              except
                                 Yield305OK := FALSE;
                                 NoErrors := FALSE;
                              end;

                              if MyTable.FieldByName('Yield305').Value > 0 then
                                 begin
                                    // Get the 305 BFat Perc
                                    TempStr := Copy (DiskLine, BFat305PercPos, BFat305PercLen );
                                    TempStr := WinData.StripSpaces(TempStr);
                                    TempFloat := StrToFloat(TempStr);
                                    try
                                       // if theres a value store it else store the cumulative
                                       if ( TempFloat > 0 ) then
                                          begin
                                             TempFloat := TempFloat/10;
                                             MyTable.FieldByName('BFat305Perc').Value := (( TempFloat / MyTable.FieldByName('Yield305').Value) * 100);
                                          end
                                       else
                                          MyTable.FieldByName('BFat305Perc').Value := MyTable.FieldByName('CumBFatPerc').Value;

                                    except
                                       BFat305OK := FALSE;
                                       NoErrors := FALSE;
                                    end;

                                    // Get the 305 Prot Perc
                                    TempStr := Copy (DiskLine, Prot305PercPos, Prot305PercLen );
                                    TempStr := WinData.StripSpaces(TempStr);
                                    TempFloat := StrToFloat(TempStr);
                                    try
                                       // if theres a value store it else store the cumulative
                                       if ( TempFloat > 0 ) then
                                          begin
                                             TempFloat := TempFloat/10;
                                             MyTable.FieldByName('Prot305Perc').Value := (( TempFloat / MyTable.FieldByName('Yield305').Value) * 100)
                                          end
                                       else
                                          MyTable.FieldByName('Prot305Perc').Value := MyTable.FieldByName('CumProtPerc').Value

                                    except
                                       Prot305OK := FALSE;
                                       NoErrors := FALSE;
                                    end;
                                 end;

                              // Get the Days In Milk
                              TempStr := Copy (DiskLine, DaysInMilkPos, DaysInMilkLen );
                              TempStr := WinData.StripSpaces(TempStr);
                              try
                                 MyTable.FieldByName('DaysInMilk').Value := StrToInt(TempStr);
                              except
                                 DaysInMilkOK := FALSE;
                                 NoErrors := FALSE;
                              end;

                              // Get the SCC
                              TempStr := Copy (DiskLine, SCCPos, SCCLen );
                              TempStr := WinData.StripSpaces(TempStr);
                              try
                                 MyTable.FieldByName('SCC').Value := StrToInt(TempStr);
                              except
                                 SCCOK := FALSE;
                                 NoErrors := FALSE;
                              end;
                              MyTable.FieldByName('Found').AsBoolean := False;
                              MyTable.Post;
                           end
                        else
                           begin
                              TempStr := Copy ( DiskLine, CowNoPos, CowNoLen );
                              TempStr := StripLeadingZeros(TempStr);
                              MessageDlg('Cannot complete recording for animal '+ TempStr + ' '+#13#10+#13#10+
                                         'The associated milk recording date '+ FormatDateTime(cIrishDateStyle, AnimalTestDate) +' does not correspond '+#13#10+
                                         'to the milk file recording date '+ThisDate.Text, mtWarning,[mbOK],0);
                           end;
                     end;
               end
            else
               begin
                  // Process the Milk Disk
                  while NOT EOF(MyFile) do
                     begin

                        ReadLn(MyFile,DiskLine);


                        // error on dsmember file only inserting 00 when cum % value is 0,
                        // insert extra 0 to change the value to 000
                        if DiskLine[57] = ',' then
                           Insert('0', DiskLine, 57);

                        // Checks the line doesn't ** to indicate an animals exclusion because
                        // it hasn't been registered  AND it is not blank
                        if (( Copy(DiskLine, 20, 2 ) <> '**' ) AND
                            ( Copy(DiskLine, 18, 2 ) <> '**' ) AND
                            (Length(Diskline) <> 0 )) then
                           begin
                              MyTable.Insert;
                              try
                                 MyTable.FieldByName('DateOfRecording').AsDateTime := RecordingDate;
                              except
                                 MyTable.FieldByName('DateOfRecording').Clear;
                              end;

                              // Get the Animal Code - NOT ID
                              TempStr := Copy ( DiskLine, CowNoPos, CowNoLen );
                              TempStr := StripLeadingZeros(TempStr);
                              try
                                 MyTable.FieldByName('AnimalCode').Value := TempStr;
                                 if (NMRAnimalList <> nil) then
                                    begin
                                       TempStr := NMRAnimalList.Values[Copy ( DiskLine, CowNoPos, CowNoLen )];
                                       if (Trim(TempStr) <> '') then
                                          begin
                                             MyTable.FieldByName('NatIDNum').Value := TempStr;
                                          end;
                                    end;
                              except
                                 AnimalCodeOK := FALSE;
                                 NoErrors     := FALSE;
                              end;

                              // Get the Daily Yield
                              TempStr := Copy (DiskLine, DailyYieldPos, DailyYieldLen );
                              TempStr := WinData.StripSpaces(TempStr);
                              try
                                 MyTable.FieldByName('DailyYield').Value := StrToFloat(TempStr)/10;
                              except
                                 DailyYieldOK := FALSE;
                                 NoErrors := FALSE;
                              end;

                              // Get the Daily BFat
                              TempStr := Copy(DiskLine,DailyBFatPercPos,DailyBFatPercLen);
                              TempStr := WinData.StripSpaces(TempStr);
                              try
                                 MyTable.FieldByName('DailyBFatPerc').Value := StrToFloat(TempStr)/100;
                              except
                                 DailyBFatOK := FALSE;
                                 NoErrors := FALSE;
                              end;

                              // Get the Daily Prot
                              TempStr := Copy(DiskLine,DailyProtPercPos,DailyProtPercLen);
                              TempStr := WinData.StripSpaces(TempStr);
                              try
                                 MyTable.FieldByName('DailyProtPerc').Value := StrToFloat(TempStr)/100;
                              except
                                 DailyProtOK := FALSE;
                                 NoErrors := FALSE;
                              end;

                              // Get the Cumulative Yield
                              TempStr := Copy(DiskLine, CumYieldPos, CumYieldLen);
                              TempStr := WinData.StripSpaces(TempStr);
                              try
                                 if (CountryCode = 'N') or (CountryCode = 'E') then
                                    MyTable.FieldByName('CumYield').Value := StrToFloat(TempStr)/10
                                 else
                                    MyTable.FieldByName('CumYield').Value := StrToFloat(TempStr);
                              except
                                 CumYieldOK := FALSE;
                                 NoErrors := FALSE;
                              end;

                              // Get the Cumulative BFat
                              TempStr := Copy (DiskLine, CumBFatPercPos, CumBFatPercLen );
                              TempStr := WinData.StripSpaces(TempStr);
                              try
                                 MyTable.FieldByName('CumBFatPerc').Value := StrToFloat(TempStr)/100;
                              except
                                 CumBFatOK := FALSE;
                                 NoErrors := FALSE;
                              end;

                              // Get the Cumulative Prot
                              TempStr := Copy (DiskLine, CumProtPercPos, CumProtPercLen );
                              TempStr := WinData.StripSpaces(TempStr);
                              try
                                 MyTable.FieldByName('CumProtPerc').Value := StrToFloat(TempStr)/100;
                              except
                                 CumProtOK := FALSE;
                                 NoErrors := FALSE;
                              end;



                              // Get the Days In Milk
                              TempStr := Copy (DiskLine, DaysInMilkPos, DaysInMilkLen );
                              TempStr := WinData.StripSpaces(TempStr);
                              try
                                 MyTable.FieldByName('DaysInMilk').Value := StrToInt(TempStr);
                              except
                                 DaysInMilkOK := FALSE;
                                 NoErrors := FALSE;
                              end;


                              // Get the 305 Yield
                              TempStr := Copy (DiskLine, Yield305Pos, Yield305Len );
                              TempStr := WinData.StripSpaces(TempStr);
                              try
                                 // if theres a value store it else store the cumulative
                                 if StrToFloat(TempStr) <> 0 then
                                    begin
                                       if CountryCode = 'N' then
                                          MyTable.FieldByName('Yield305').Value := StrToFloat(TempStr)/10
                                       else
                                          MyTable.FieldByName('Yield305').Value := StrToFloat(TempStr);
                                    end
                                 else if MyTable.FieldByName('DaysInMilk').Value <= 305 then
                                    MyTable.FieldByName('Yield305').Value := MyTable.FieldByName('CumYield').Value;

                              except
                                 Yield305OK := FALSE;
                                 NoErrors := FALSE;
                              end;

                              // Get the 305 BFat
                              TempStr := Copy (DiskLine, BFat305PercPos, BFat305PercLen );
                              TempStr := WinData.StripSpaces(TempStr);
                              try
                                 // if theres a value store it else store the cumulative
                                 if StrToFloat(TempStr) <> 0 then
                                    MyTable.FieldByName('BFat305Perc').Value := StrToFloat(TempStr)/100
                                 else
                                    MyTable.FieldByName('BFat305Perc').Value := MyTable.FieldByName('CumBFatPerc').Value;
                              except
                                 BFat305OK := FALSE;
                                 NoErrors := FALSE;
                              end;

                              // Get the 305 Prot
                              TempStr := Copy (DiskLine, Prot305PercPos, Prot305PercLen );
                              TempStr := WinData.StripSpaces(TempStr);
                              try
                                 // if theres a value store it else store the cumulative
                                 if StrToFloat(TempStr) <> 0 then
                                    MyTable.FieldByName('Prot305Perc').Value := StrToFloat(TempStr)/100
                                 else
                                    MyTable.FieldByName('Prot305Perc').Value := MyTable.FieldByName('CumProtPerc').Value;
                              except
                                 Prot305OK := FALSE;
                                 NoErrors := FALSE;
                              end;
                              if (CountryCode <> 'S') then
                                 begin
                                    // Get the No of Tests
                                    TempStr := Copy (DiskLine, NoOfTestsPos, NoOfTestsLen );
                                    TempStr := WinData.StripSpaces(TempStr);
                                    try
                                       MyTable.FieldByName('NoOfRecordings').Value := StrToInt(TempStr);
                                    except
                                       NoOfRecOK := FALSE;
                                       NoErrors := FALSE;
                                    end;
                                 end;

                              // Get the SCC
                              TempStr := Copy (DiskLine, SCCPos, SCCLen );
                              TempStr := WinData.StripSpaces(TempStr);
                              try
                                 MyTable.FieldByName('SCC').Value := StrToInt(TempStr);
                              except
                                 SCCOK := FALSE;
                                 NoErrors := FALSE;
                              end;
                              MyTable.FieldByName('Found').AsBoolean := False;
                              MyTable.Post;
                           end;
                     end;
               end;
            WinData.MainMilkTrans.Close;
            Application.ProcessMessages;
            CloseFile(MyFile);
            if ((FirstRecording) Or (RecordingDate > LastRecordingDate)) And
                (NoErrors) then
               begin
                  WinData.OwnerFile.Locate('HerdIdentity',HerdNum.Text,[]);
                  // Insert a new Recording Record
                  with WinData.MainMilkTrans do
                     begin
                        Open;
                        Insert;
                        FieldByName('RecordingDate').AsDateTime := RecordingDate;
                        FieldByName('MilkRecID').AsString := WinData.OwnerFile.FieldByName('MilkRecordingID').AsString;
                        if TidyUpDisk then
                           begin
                              FieldByName('Description').Value := 'Cumulative Update ' + FormatDateTime(cIrishDateStyle,RecordingDate);
                              FieldByName('NMRRecording').Value := FALSE;
                           end
                        else
                           begin
                              FieldByName('Description').Value := 'Milk Recording on ' + FormatDateTime(cIrishDateStyle,RecordingDate);
                              FieldByName('NMRRecording').Value := TRUE;
                           end;
                        Post;
                        Last;
                        MilkID := FieldByName('ID').Value;
                        MyQuery.SQL.Clear;
                        MyQuery.SQL.Add('UPDATE TempMilk SET MDTID=' + IntToStr(MilkId));
                        MyQuery.Prepare;
                        MyQuery.ExecSQL;
                        Close;
                     end;

                  // Check the Animals in MyTable against at the Animals File
                  CheckAnimals;
                  // update dry off - 21/12/00 - kr
                  if (CumDisc) then
                     begin
                        MyTable.First;
                        while NOT MyTable.EOF do
                           begin
                              // check if event exists
                              if NOT(WinData.CheckEvents.Locate('AnimalID;EventDate;EventType',
                                     VarArrayOf([MyTable.FieldByName('AnimalID').AsInteger,
                                                 DryDate,cDryOffEvent]),[])) then
                                 with WinData do
                                    try
                                       EventType := TDryOff;
                                       Events.Append;
                                       try
                                          // save to events.db
                                          EventsEventType.Value    := CDryOffEvent;
                                          EventsAnimalID.Value     := MyTable.FieldByName('AnimalID').AsInteger;
                                          EventsAnimalLactNo.Value := MyTable.FieldByName('LactNo').AsInteger;
                                          if LookUpDamSire.Locate('ID',MyTable.FieldByName('AnimalID').AsInteger,[]) then
                                             EventsHerdID.Value    := LookUpDamSire.FieldByName('HerdID').AsInteger;
                                          EventsEventDate.Value    := DryDate;
                                          EventsEventDesc.Value    := 'Drying Off';
                                          EventsICBFNotified.Value := False;
                                          EventsICBFAction.Value   := 'A';
                                       finally
                                          Events.Post;
                                       end;
                                       // post updates
                                       WinData.KingData.ApplyUpdates([PregDiag,Events]);
                                    except
                                       Events.Cancel;
                                    end;
                              MyTable.Next;
                           end;
                     end;
                  //if ( iNoNotFound = 0 ) then
                  sbExecRecord.Enabled := True;
               end
            else if ( RecordingDate = LastRecordingDate ) and ( NoErrors ) then
               MessageDLG('Recording Date''s are the same',mtInformation,[mbOK],0)
            else if NoErrors then
               MessageDLG('Last Recording Date is after this Recording Date',mtInformation,[mbOK],0)
            else
               begin
                  MyTable.Close;
                  MyTable.EmptyTable;
                  ReportErrors;
                  MessageDLG('Error on Milk Disk',mtWarning,[mbOK],0);
               end;
         end
      else
         begin
            if NOT MilkIDSet then
               begin
                  if MessageDLG('You need to set the Milk Recording ID' + #13 +
                                'Do you want to set it now' + #13#13 +
                                'ID from Milk Disk is ' + CurrentID,mtWarning,[mbYes,mbNo],0) = mrYes then
                     begin
                        if WinData.OwnerFile.Locate('ID',HerdNum.Value,[] ) then
                           WinData.CreateAndShowForm(TfHerdSetUp)
                        else
                           ShowMessage('Cannot locate this Herd');
                     end;
               end
            else
               MessageDLG('Cannot continue without a valid Date',mtWarning,[mbOK],0);
         end;
   except
      MyTable.Close;
      MyTable.EmptyTable;
      ReportErrors;
      MessageDLG('Error on Milk Disk',mtWarning,[mbOK],0);
   end;
end;

procedure TfMilkRec.DiskContentsGetCellProps(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor);
var
   OkID : Integer;
begin
   if ( Field.FieldName = 'CumBfatPerc' ) then
      TFloatField(Field).DisplayFormat := '#.##'
   else if  ( Field.FieldName = 'CumProtPerc' ) then
      TFloatField(Field).DisplayFormat := '#.##';

   if WinData.ICBFMilkRec then
      begin
         if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('CurrLact').AsBoolean then
            if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('LeftHerd').AsBoolean then
               AFont.Color := clRed   { Not Found }
            else if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('ExcludeHasCalved').AsBoolean then
               AFont.Color := clTeal
            else
               AFont.Color := clBlue;  { Found }
      end
   else
      begin
         OkID := (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('AnimalID').AsInteger;
         if (OkID = 0) then
             AFont.Color := clRed   { Not Found }
         else
             begin
                if (Sender as TrxDBGrid).DataSource.DataSet.FieldByName('ExcludeHasCalved').AsBoolean then
                   AFont.Color := clTeal
                else
                   AFont.Color := clBlue;  { Found }
             end;
      end;
end;

Function TfMilkRec.StripLeadingZeros ( ItemToStrip : String ) : String;
Var
   TestStr : String;
begin
   TestStr := WinData.StripAllSpaces(ItemToStrip);
   if Length(TestStr) > 0 then
      while TestStr[1] = '0' do
         begin
            // Stop Deleting a 1 Character - Animal must be number zero ??
            if Length(TestStr) > 1 then
               Delete ( TestStr, 1, 1 )
            else
                Break;  // Exit the while loop
         end;
   ReSult := TestStr;
end;

procedure TfMilkRec.bExecRecordClick(Sender: TObject);
var
   Reg : TRegistry;

   PrevDaysInMilk, NoOfMilkDaysUpTo305, DaysOver305 : Integer;
   PrevDailyYield, Prev305Yield, PrevDailyBFat,
   PrevDailyProt, CalcYieldTo305Days : Double;
   Do305YieldCalc : Boolean;
begin
   if WinData.ICBFMilkRec then
      CompleteMMRRecording
   else
      try
              // record the Animals that have a matching record using
              // the AnimalId Not the user entered Code
              MyQuery.SQL.Clear;
              MyQuery.SQL.Add('SELECT * FROM TempMilk');
              // Where clause MUST be the same as one used below
              MyQuery.SQL.Add('WHERE (AnimalID<>0)');
              MyQuery.SQL.Add('AND (ExcludeHasCalved=FALSE)');
              MyQuery.Open;

              if NOT TidyUpDisk then
                 begin
                   // move the Animals details that have a match with the Query into the transaction file
                   if ( CountryCode in (['S','E']) ) then
                      begin
                         MyTable.First;
                         while not MyTable.Eof do
                            begin
                               PrevDaysInMilk := 0;
                               PrevDailyYield := 0;
                               Prev305Yield   := 0;
                               PrevDailyBFat  := 0;
                               PrevDailyProt  := 0;

                               if ( MyTable.FieldByName('DaysInMilk').Value > 305 ) then
                                  begin
                                     QueryLastRecording.Close;
                                     QueryLastRecording.Params[0].AsInteger := MyTable.FieldByName('AnimalID').AsInteger;
                                     QueryLastRecording.Params[1].AsInteger := MyTable.FieldByName('LactNo').AsInteger;
                                     QueryLastRecording.Prepared := True;
                                     QueryLastRecording.Active := True;

                                     PrevDaysInMilk := QueryLastRecording.FieldByName('DaysInMilk').AsInteger;
                                     PrevDailyYield := QueryLastRecording.FieldByName('DailyYield').AsFloat;
                                     Prev305Yield   := QueryLastRecording.FieldByName('Yield305').AsFloat;
                                     PrevDailyBFat  := QueryLastRecording.FieldByName('DailyBFatPerc').AsFloat;
                                     PrevDailyProt  := QueryLastRecording.FieldByName('DailyProtPerc').AsFloat;

                                     QueryLastRecording.Close;

                                     Do305YieldCalc := ( PrevDaysInMilk < 305 ) and ( MyTable.FieldByName('DaysInMilk').AsInteger > 305 );
                                     if Do305YieldCalc then
                                        begin
                                           NoOfMilkDaysUpTo305 := 305 - PrevDaysInMilk;
                                           if MyTable.FieldByName('DailyYield').AsInteger > 0 then // Cow is still milking average between last MR Daily Yield and This MR Daily Yield
                                              CalcYieldTo305Days := Prev305Yield + (( ( PrevDailyYield + MyTable.FieldByName('DailyYield').AsInteger ) / 2 ) * NoOfMilkDaysUpTo305 )
                                           else // The cow must be dry, or has not been recorded, Use the Previous daily yield
                                              begin
                                                 DaysOver305 := MyTable.FieldByName('DaysInMilk').AsInteger - 305;
                                                 CalcYieldTo305Days := Prev305Yield + ( PrevDailyYield  * NoOfMilkDaysUpTo305 );
                                              end;

                                           MyTable.Edit;
                                           MyTable.FieldByName('Yield305').AsFloat := CalcYieldTo305Days;
                                           MyTable.FieldByName('DailyBFatPerc').AsFloat := PrevDailyBFat;
                                           MyTable.FieldByName('DailyProtPerc').AsFloat := PrevDailyProt;
                                           try
                                              MyTable.Post;
                                           except
                                              MyTable.Cancel;
                                              MessageDlg('305 Yield update failed',mtError,[mbOK],0);
                                           end;
                                        end
                                     else if ( MyTable.FieldByName('DaysInMilk').AsInteger > 305 ) then
                                        begin
                                           MyTable.Edit;
                                           MyTable.FieldByName('Yield305').AsFloat := Prev305Yield;
                                           MyTable.Post;
                                        end;
                                  end
                               else
                                  begin
                                     // set the value 305Yield = CumYield
                                     MyTable.Edit;
                                     MyTable.FieldByName('Yield305').AsFloat := MyTable.FieldByName('CumYield').AsFloat;
                                     MyTable.Post;
                                  end;
                               MyTable.Next;
                            end;
                         MyQuery.Close;
                         MyQuery.Open; // re-open MyQuery to query changed 305 yield data.
                      end;

                   TransQuery.SQL.Clear;
                   TransQuery.SQL.Add('INSERT INTO MilkDiskTrans');
                   TransQuery.SQL.Add('(ID, MDTID,AnimalID,AnimalCode,Lactno,HerdNumber,');
                   TransQuery.SQL.Add('DateOfRecording, DAilyYield, DailyBFatPerc,DailyProtPerc,');
                   TransQuery.SQL.Add('DailyLactPerc,SCC,CumYield,CumBFatPerc,CumProtPerc,');
                   TransQuery.SQL.Add('CumLactPerc,NoOfRecordings,DaysInMilk,');
                   TransQuery.SQL.Add('Yield305,BFat305Perc,Prot305Perc,Lact305Perc,NMRRecording)');
                   TransQuery.SQL.Add('SELECT ');
                   TransQuery.SQL.Add('ID, MDTID,AnimalID,AnimalCode,Lactno,HerdNumber,');
                   TransQuery.SQL.Add('DateOfRecording, DAilyYield, DailyBFatPerc,DailyProtPerc,');
                   TransQuery.SQL.Add('DailyLactPerc,SCC,CumYield,CumBFatPerc,CumProtPerc,');
                   TransQuery.SQL.Add('CumLactPerc,NoOfRecordings,DaysInMilk,');
                   TransQuery.SQL.Add('Yield305,BFat305Perc,Prot305Perc,Lact305Perc,NMRRecording');
                   TransQuery.SQL.Add('FROM TempMilk');
                   // Where clause MUST be the same as one used above
                   TransQuery.SQL.Add('WHERE (AnimalID<>0)');
                   TransQuery.SQL.Add('AND (ExcludeHasCalved=FALSE)');
                   TransQuery.ExecSQL;

                 end;

              // Update the Cumulative details for the Animals
              MyQuery.First;
              while NOT MyQuery.EOF do
                 with MilkDisk do
                    begin
                       // Locate the existing record for this Lactation
                       if Locate('AnimalID;LactNo',VarArrayOf([MyQuery.FieldByName('AnimalID').Value,MyQuery.FieldByName('LactNo').Value]),[] ) then
                          begin
                             Edit;

                             FieldByName('CumYield').Value := MyQuery.FieldByName('CumYield').Value;
                             FieldByName('CumProtPerc').Value := MyQuery.FieldByName('CumProtPerc').Value;
                             FieldByName('CumBFatPerc').Value := MyQuery.FieldByName('CumBFatPerc').Value;

                             FieldByName('SCC').Value := MyQuery.FieldByName('SCC').Value;
                             FieldByName('NoOfRecordings').Value := MyQuery.FieldByName('NoOfRecordings').Value;
                             FieldByName('DaysInMilk').Value := MyQuery.FieldByName('DaysInMilk').Value;

                             FieldByName('DailyYield').Value := MyQuery.FieldByName('DailyYield').Value;
                             FieldByName('DailyBFatPerc').Value := MyQuery.FieldByName('DailyBFatPerc').Value;
                             FieldByName('DailyProtPerc').Value := MyQuery.FieldByName('DailyProtPerc').Value;

                             FieldByName('CumYield').Value := MyQuery.FieldByName('CumYield').Value;
                             FieldByName('CumBFatPerc').Value := MyQuery.FieldByName('CumBFatPerc').Value;
                             FieldByName('CumProtPerc').Value := MyQuery.FieldByName('CumProtPerc').Value;

                             FieldByName('Yield305').Value := MyQuery.FieldByName('Yield305').Value;
                             FieldByName('BFatPerc305').Value := MyQuery.FieldByName('BFat305Perc').Value;
                             FieldByName('ProtPerc305').Value := MyQuery.FieldByName('Prot305Perc').Value;

                             Post;
                          end
                       else
                          // Insert a new record for this Lactation
                          begin
                             Insert;
                             FieldByName('AnimalID').Value := MyQuery.FieldByName('AnimalID').Value;
                             FieldByName('LactNo').Value   := MyQuery.FieldByName('LactNo').Value;

                             FieldByName('CumYield').Value := MyQuery.FieldByName('CumYield').Value;
                             FieldByName('CumProtPerc').Value := MyQuery.FieldByName('CumProtPerc').Value;
                             FieldByName('CumBFatPerc').Value := MyQuery.FieldByName('CumBFatPerc').Value;

                             FieldByName('SCC').Value := MyQuery.FieldByName('SCC').Value;
                             FieldByName('NoOfRecordings').Value := MyQuery.FieldByName('NoOfRecordings').Value;
                             FieldByName('DaysInMilk').Value := MyQuery.FieldByName('DaysInMilk').Value;

                             FieldByName('DailyYield').Value := MyQuery.FieldByName('DailyYield').Value;
                             FieldByName('DailyBFatPerc').Value := MyQuery.FieldByName('DailyBFatPerc').Value;
                             FieldByName('DailyProtPerc').Value := MyQuery.FieldByName('DailyProtPerc').Value;

                             FieldByName('CumYield').Value := MyQuery.FieldByName('CumYield').Value;
                             FieldByName('CumBFatPerc').Value := MyQuery.FieldByName('CumBFatPerc').Value;
                             FieldByName('CumProtPerc').Value := MyQuery.FieldByName('CumProtPerc').Value;

                             FieldByName('Yield305').Value := MyQuery.FieldByName('Yield305').Value;
                             FieldByName('BFatPerc305').Value := MyQuery.FieldByName('BFat305Perc').Value;
                             FieldByName('ProtPerc305').Value := MyQuery.FieldByName('Prot305Perc').Value;
                             Post;
                          end;
                       MyQuery.Next;
                    end;
              MilkDisk.FlushBuffers;

              Update305FromNMRFile;
              MilkID := 0;
              NoFound.Text := '0';
              NoNotFound.Text := '0';
              NoExcludeHasCalved.Text := '0';
              DiskContents.DataSource := nil;
              MessageDLG('Milk Recording Completed',mtinformation,[mbok],0);
           (*
           end
        else
           begin
              MessageDLG('Milk Recording Aborted',mtinformation,[mbok],0);
              CheckRecordingOK;
           end;
           *)

      finally
         sbExecRecord.Enabled := False;
      end;
   sbReview.Enabled := TRUE;

   // Store read value into registry for PDA/Diy scync purposes.
   Reg := TRegistry.Create;
   try
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      Reg.OpenKey('\Software\Kingswood\Herd\PDAMilkRec', True);
      Reg.WriteBool('MilkRecDone', True);
      Reg.CloseKey;
   finally
      FreeAndNil(Reg);
   end;


   MilkState := MFSaved;


end;

procedure TfMilkRec.bReviewClick(Sender: TObject);
begin
   CheckRecordingOK;
   uMilkDiskReview.CreateAndShow;
end;

procedure TfMilkRec.CheckRecordingOK;
begin
   // Make sure to delete the Main Record if recording is disguarded
   if (MilkID > 0) then
      with WinData.MainMilkTrans do
         begin
            Open;
            if Locate('ID',MilkId,[]) then
               Delete;
            Close;
         end;
end;

procedure TfMilkRec.FormCreate(Sender: TObject);
var
   NoOfHerds : Integer;
begin


   MilkState := MFNone;

   {
     if ( MessageDLG('Do you want to Backup your Data?',mtWarning,[mbYes,mbNo],0) = mrYes ) then
       if not TfmDataBackup.execute(daBackup) then
          MessageDLG('BackUp did not complete successfully - Contact Kingswood',mtwarning,[mbOK],0);
   }

   if Def.Definition.dUseDIYMilkRec then
      begin
         ToolButton6.Visible := True;
         sbDIYMilk.Visible := True;
      end
   else
      begin
         ToolButton6.Visible := False;
         sbDIYMilk.Visible := False;
      end;

   // Count the Number of Herds - exclude the NONE
   NoOfHerds := WinData.qHerdDefaults.RecordCount;
   if NoOfHerds <= 1 then
      begin
         lHerdIdentity.Hide;
         HerdNum.Hide;
      end;

   if WinData.ICBFMatchField = 'AnimalNo' then
      AnimalNumber1.Checked := True
   else
      NationalIdentityNumber1.Checked := True;

   // 29/01/2009 [V3.9 R5.8] /SP Additional Feature
   sbCISFileExport.Visible := WinData.SystemRegisteredCountry<>Ireland;
   tbSepCISFileExport.Visible := sbCISFileExport.Visible;

   // 29/01/2009 [V3.9 R5.8] /SP Additional Feature
   cbDownloadFile.Visible := WinData.SystemRegisteredCountry=NIreland;

end;

procedure TfMilkRec.FromDiskette1Click(Sender: TObject);
begin
   rgMilkRec.ItemIndex := 0;
   FromDiskette1.Checked := True;
end;

procedure TfMilkRec.FromEmail1Click(Sender: TObject);
begin
   rgMilkRec.ItemIndex := 1;
   FromEmail1.Checked := True;
   DirectoryEdit1.DoClick;
end;

procedure TfMilkRec.MilkDiskParameters1Click(Sender: TObject);
begin
   uSetUpMilkDisk.CreateAndShow;
end;

procedure TfMilkRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   // ensure you check the record before closing the form.
   CheckRecordingOK;
   case MilkState of
      MFRead : if MessageDlg('Milk Recording has not been saved, do you want save?',mtConfirmation,[mbYes, mbNo],0) = idYes then
                  bExecRecordClick(Sender);
      MFSaved,
      MFNone  : //
   end;
end;

procedure TfMilkRec.HerdNumChange(Sender: TObject);
begin
   // Disable the Record Button
   sbExecRecord.Enabled := False;
end;

procedure TfMilkRec.PadRight(Var St : String; Len : Integer);
begin
   while Length(St) < Len Do St := St + ' ';
end;

procedure TfMilkRec.PadLeft(Var St : String; Len : Integer);
begin
   while Length(St) < Len Do St := ' ' + St;
end;

function TfMilkRec.ConvertDSMember : Boolean;
var
   MyFile,
   m_File : TextFile;
   Date_Found : boolean;
   MR_Date : string[6];
   st,
   p_data_1,
   p_data_3,
   p_data_x : string;
   TempInt : Integer;
   p_buffer,
   m_buffer      : String;
   HerdID        : String;
   HadTest       : Boolean;
   datFileName,
   exeFileName : String;
   KeepTrying : Boolean;
   ExitRoutine : Boolean;
   ior : Integer;
   StartTime, TestTime : TTimeStamp;

   CowNum, Lactno : Integer;
   
   Yield,BFatPerc,ProtPerc,Yield305,BFatPerc305,ProtPerc305 : double;
   ReadL4Line : Boolean;
   ReadL5Line : Boolean;
   AnimalUpdateOk : TQuery;
   AnimalID : Integer;

   DaysInMilk : Integer;
   TempLine : String;

begin
   Result := FALSE;


   if FromDiskette1.Checked then
      begin
         exeFileName := 'A:\'+NMRFileNameExe;
         if FileExists(exeFileName) then
            begin
               CopyFile(PChar(exeFileName), PChar(ExtractFilePath(ParamStr(0)) + NMRFileNameExe), False);
               exeFileName := ExtractFilePath(ParamStr(0)) + NMRFileNameExe;
               datFileName := ExtractFilePath(ParamStr(0))+'DSMEMBER.DAT';
            end
         else
            begin
               MessageDlg('DsMember.exe file not found',mtError,[mbOK],0);
               Abort;
            end;
      end
   else
      begin
         if DsMemberOpenDialog.Execute then
            begin
               if FileExists( DsMemberOpenDialog.FileName ) and (UPPERCASE(ExtractFileName(DsMemberOpenDialog.FileName)) = UPPERCASE( NMRFileNameExe )) then
                  begin
                     exeFileName := DsMemberOpenDialog.FileName;
                     datFileName := ExtractFilePath(DsMemberOpenDialog.FileName)+'DSMEMBER.DAT';
                  end
               else
                  begin
                     MessageDlg('DsMember.exe file not found',mtError,[mbOK],0);
                     Abort;
                  end;
            end;
      end;

   if not FileExists(exeFileName) then
      Exit;

   if not (WinData.CallProg.DSMember(Handle, exeFileName)) then
      Exit;

   try
   if FileExists(datFileName) then
      begin
         NMRAnimalList := TStringList.Create;

         {$I-}
         AssignFile(MyFile, datFileName);
         ReSet (MyFile);		{ open new milk recording file }
         if ioresult <> 0 then
         {$I+}
            begin
               MessageDlg('Unable to open NMR file, contact Kingswood',mtError,[mbOK],0);
               Abort;
            end;
      end

   else
      begin
         MessageDlg('Unable to locate NMR file, contact Kingswood',mtError,[mbOK],0);
         Abort;
      end;

   { init. buffers }
   p_buffer := '';
   m_buffer := '';	padright (m_buffer, 255);
   p_data_1 := '';	padright (p_data_1, 255);
   p_data_3 := '';	padright (p_data_3, 255);
   p_data_x := '';	padright (p_data_x, 255);
   { switch dos access on }

//   AssignFile(MyFile, datFileName );
//   ReSet (MyFile);		{ open new milk recording file }
   {$I-}
   AssignFile(m_File, WinData.KingData.Directory + 'milkdata.DAT' );
   rewrite (m_File);		{ open new milk recording file }
   {$I+}

   { loop for whole file or until last milk recording date is found }
   Date_Found := false;
   while ((not eof (MyFile)) and (not Date_Found)) do
      begin
       	 readln (MyFile, p_buffer);
 	 p_buffer := WinData.StripSpaces(p_buffer);
	 if length (p_buffer) >= 2 then
            if (p_buffer[1] = 'H') and (p_buffer[2] = 'D') then
	       begin
	          { read data into buffer }
	          MR_Date := '';
                  MR_Date := Copy (p_buffer, 4, 6);
	          MR_Date := WinData.StripSpaces(MR_Date);
	          Date_Found := true;
	       end;
      end;

   NMRLactUpdate := TStringList.Create;
   AnimalUpdateOk := TQuery.Create(nil);
   try
      AnimalUpdateOk.DatabaseName := AliasName;
      AnimalUpdateOk.SQL.Clear;
      AnimalUpdateOk.SQL.Add('Select ID From Animals Where InHerd=True And AnimalDeleted = False And AnimalNo = :AAnimalNo And LactNo = :ALactNo');

      reset (MyFile);
      while (not eof (MyFile)) do
         begin
            readln (MyFile, p_buffer);
            if (Copy(p_buffer,1,2) = 'C1') then
               begin
                  NMRAnimalList.Values[ WinData.InsertZeros(copy(p_buffer,18,4), 5) ] := copy(p_buffer,26,12);
               end;
         end;

      reset (MyFile);
      while (not eof (MyFile)) do
         begin
            readln (MyFile, p_buffer);
            if (Copy(p_buffer,1,4) = 'L1,0') then
               begin
                  if copy(p_buffer,6,4) <> '' then
                     CowNum := StrToInt(copy(p_buffer,6,4));
                  if copy(p_buffer,11,2) <> '' then
                     LactNo := StrToInt(copy(p_buffer,11,2));

                  Yield305 := 0;
                  BFatPerc305 := 0;
                  ProtPerc305 := 0;
                  Yield := 0;
                  BFatPerc := 0;
                  ProtPerc := 0;


                  AnimalUpdateOk.Close;

                  {if CowNum = MatchedCowNum then
                     begin
                        AnimalUpdateOk.Params[0].AsString := CowNatIDNum;
                        AnimalUpdateOk.Params[1].AsInteger := LactNo;
                     end
                  else
                     begin}
                        AnimalUpdateOk.Params[0].AsString := IntToStr(CowNum);
                        AnimalUpdateOk.Params[1].AsInteger := LactNo;
                   //  end;

                  AnimalUpdateOk.Prepared := True;
                  AnimalUpdateOk.Active := True;
                  try
                     AnimalUpdateOk.First;
                     AnimalID := AnimalUpdateOk.FieldByName('ID').AsInteger;
                     if AnimalID = 411 then showmessage('411');
                     ReadL4Line := AnimalID > 0;
                  finally
                     AnimalUpdateOk.Active := False;
                  end;
               end;

            if ( ReadL4Line ) and (Copy(p_buffer,1,2) = 'L4') then
               begin
                  Yield305 := StrToFloat(copy(p_buffer,8,6));
                  BFatPerc305 :=StrToFloat(copy(p_buffer,15,5));
                  ProtPerc305 := StrToFloat(copy(p_buffer,22,5));
                  st := copy(p_buffer,36,4);
                  while (Length(st) > 1 ) and ( st[length(st)] = '0' ) do
                     Delete(st,Length(st),1);
                  NMRLactUpdate.Add(IntToStr(AnimalID)+','+IntToStr(LactNo)+','+FloatToStr(Yield305)+','+FloatToStr(BFatPerc305)+','+FloatToStr(ProtPerc305)+','+IntToStr(DaysInMilk));
                  ReadL4Line := False;
                  ReadL5Line := True;
               end
            else if ( ReadL5Line ) and (Copy(p_buffer,1,2) = 'L5') then
               begin
                  Yield := StrToFloat(copy(p_buffer,8,6));
                  BFatPerc := StrToFloat(copy(p_buffer,15,5));
                  ProtPerc := StrToFloat(copy(p_buffer,22,5));

                  st := copy(p_buffer,36,4);
                  while (Length(st) > 1 ) and ( st[length(st)] = '0' ) do
                     Delete(st,Length(st),1);
                  DaysInMilk := StrToInt(st);
                  // Remove 305 days in milk.

                  TempLine := NMRLactUpdate.Strings[NMRLactUpdate.Count-1];
                  while (templine[length(TempLine)] in (['0'..'9'])) do
                     Delete(templine, length(TempLine), 1);

//                  NMRLactUpdate.Strings[NMRLactUpdate.Count-1] := Copy( NMRLactUpdate.Strings[NMRLactUpdate.Count-1], 1, Length(NMRLactUpdate.Strings[NMRLactUpdate.Count-1])-5);
                  NMRLactUpdate.Strings[NMRLactUpdate.Count-1] := templine + FloatToStr(Yield)+','+FloatToStr(BFatPerc)+','+FloatToStr(ProtPerc)+','+IntToStr(DaysInMilk);
                  ReadL5Line := False;
               end
            else
               ReadL5Line := False;
         end;
   finally
      NMRLactUpdate.SaveToFile('C:\NMRLactUpdate.dat');
      NMRLactUpdate.Free;
      AnimalUpdateOk.Free;
   end;

   reset (MyFile);
   { loop for whole file }
   while (not eof (MyFile)) do
      begin
  	 readln (MyFile, p_buffer);
	 p_buffer := WinData.StripSpaces(p_buffer);
	 if length (p_buffer) >= 2 then
	    if (p_buffer[1] = 'S') and (p_buffer[2] = '0') then

	      { while it is not the end of the file and still reading statement
	       information records }
	       begin

                  // Store the Herd Milk Rec. ID
                  HerdID := '';
                  HerdID := copy (p_buffer, 7, 5);
                  HerdID := StripLeadingZeros(HerdID);
                  HerdID := WinData.StripSpaces(HerdID);
                  PadLeft(HerdID, 7);

                  while ( (not eof (MyFile)) and (p_buffer[1] = 'S') ) do
        	     begin
		        { read data into buffer }
                        HadTest := FALSE;
                        readln (MyFile, p_buffer);
		        p_buffer := WinData.StripSpaces (p_buffer);
		        padright (p_buffer, 80);

                        { check buffer contents }
                        case p_buffer[2] of
          		    '1' : p_data_1 := p_buffer;
	        	    '3' : p_data_3 := p_buffer;
		            'X' : p_data_x := p_buffer;
                        end;	  { end case }

        		{ if SX record and cow is in the herd then
		         update milk recording file
		        }

		        if ((p_buffer[2] = 'X') and (p_data_1[4] = '0')) then
		           begin
		              { pad buffers with spaces }
		              padright (p_data_1, 255);
		              padright (p_data_3, 255);
		              padright (p_data_x, 255);
		              m_buffer := '';

		              padright (m_buffer, 255);
                              // Insert the HerdID for every line

                              Move (HerdID[1], m_buffer[1], 7);
		              { move cow number to new format }
		              st := '';
		              st := copy (p_data_1, 6, 4);
		              st := StripLeadingZeros(st);
		              st := WinData.StripSpaces(st);
		              st := WinData.InsertZeros(st, 5);
		              move (st[1], m_buffer[18], 5);

       		              { move recording date to new format }
		              st := '';
		              st := copy (p_data_3, 4, 6);
		              St := WinData.StripSpaces(st);
		              if st = MR_Date then
		                 begin
                                    HadTest := TRUE;
                                    // Set the Year to Long format
                                    TempInt := StrToInt(Copy(St,1,2));
                                    if TempInt in [0..80] then
                                       St := '20' + St
                                    else
                                       St := '19' + St;
			            move (st[1], m_buffer[9], 8);
            			    { move test yield to new format }
			            st := '';
			            st := copy (p_data_3, 17, 4);
			            st := StripLeadingZeros(st);
			            st := WinData.StripSpaces(st);
			            st := WinData.InsertZeros(st, 4);
			            move (st[1], m_buffer[24], 4);
              			    { move test bfat% to new format }
			            st := '';
			            st := copy (p_data_3, 22, 4);
			            st := StripLeadingZeros(st);
			            st := WinData.StripSpaces(st);
			            st := WinData.InsertZeros(st, 3);
			            move (st[1], m_buffer[29], 3);
    			            { move test prot% to new format }
			            st := '';
			            st := copy (p_data_3, 27, 4);
			            st := StripLeadingZeros(st);
			            st := WinData.StripSpaces(st);
			            st := WinData.InsertZeros(st, 3);
			            move (st[1], m_buffer[33], 3);
      			            { move Lactose % new format }
			            st := '';
			            st := copy (p_data_3, 32, 4);
			            st := StripLeadingZeros(st);
			            st := WinData.StripSpaces(st);
			            st := WinData.InsertZeros(st, 3);
			            move (st[1], m_buffer[37], 3);
			            { move SCC to new format }
			            st := '';
			            st := copy (p_data_3, 47, 4);
			            st := StripLeadingZeros(st);
			            st := WinData.StripSpaces(st);
			            st := WinData.InsertZeros(st, 6);
			            move (st[1], m_buffer[41], 6);
 			            { move 0 to 305 figures }
			            st := '000000';
			            move (st[1], m_buffer[88], 6);
			            st := '000';
			            move (st[1], m_buffer[95], 3);
			            st := '000';
			            move (st[1], m_buffer[99], 3);
			            st := '00';
			            move (st[1], m_buffer[67], 2);
		                 end;

		              { move cum. yield to new format }
		              st := '';
		              st := copy (p_data_x, 9, 6);
		              st := StripLeadingZeros(st);
                              st := WinData.StripSpaces(st);
                              st := WinData.InsertZeros(st, 6);
		              move (st[1], m_buffer[48], 6);

		              { move days in milk to new format }
		              st := '';
		              st := copy (p_data_x, 4, 3);
		              st := StripLeadingZeros(st);
                              st := WinData.StripSpaces(st);
                              st := WinData.InsertZeros(st, 3);
		              move (st[1], m_buffer[70], 3);

		              { move cum. bfat% to new format }
		              st := '';
		              st := copy (p_data_x, 38, 4);
		              st := StripLeadingZeros(st);
                              st := WinData.StripSpaces(st);
                              st := WinData.InsertZeros(st, 3);
		              move (st[1], m_buffer[55], 3);

		              { move cum. prot% to new format }
		              st := '';
		              st := copy (p_data_x, 43, 3);
		              st := StripLeadingZeros(st);
                              st := WinData.StripSpaces(st);
                              st := WinData.InsertZeros(st, 3);
		              move (st[1], m_buffer[59], 3);

		              { write formatted milk recording data to milk rec. file }
		              if ( p_data_1[11] = '0' ) And HadTest then
		                 begin
                                    writeln (m_file, m_buffer);
                                    RESULT := TRUE;
                                 end;
		              p_data_1 := '';	padright (p_data_1, 255);
		              p_data_3 := '';	padright (p_data_3, 255);
		              p_data_x := '';	padright (p_data_x, 255);
		           end	  { end if }
		        else if (( p_buffer[2] = 'X' ) and ( p_data_1 [4] <> '0' )) then
		           begin
		              p_data_1 := '';	padright (p_data_1, 255);
		              p_data_3 := '';	padright (p_data_3, 255);
		              p_data_x := '';	padright (p_data_x, 255);
		           end;
                        { end while }
                     end;
	       end;
      end;
   finally
   { close off all data files }
   CloseFile (MyFile);
   CloseFile (m_file);
   end;
   DeleteFile(datFileName);
   EMailDrive.Text := WinData.KingData.Directory + 'milkdata.DAT';
   rgMilkRec.ItemIndex := 1;
end;

function TfMilkRec.CallNMRStream : Boolean;
var
   FileFound,
   TryAgain   : Boolean;
begin
//   Result := FALSE;
{   FileFound := FileExists('a:\dsmember.exe');
   TryAgain := False; // SP
   while TryAgain And ( NOT FileFound ) do
      begin
         if MessageDLG('Have you inserted the Milk Disk into the Floppy drive',mtInformation,[mbYes,mbNo],0) = mrYes then
            begin
               if NOT FileExists('a:\dsmember.exe') then
                  TryAgain := (MessageDLG('This disk does not contain a dsmember.exe file - do you want to retry',mtWarning,[mbYes,mbNo],0)= mrYes)
               else
                  FileFound := TRUE;
            end
         else
            TryAgain := (MessageDLG('Do you want to Exit',mtInformation,[mbYes,mbNo],0)= mrNo);
      end;
}
   //if FileFound then
      Result := ConvertDSMember;
end;

procedure TfMilkRec.sbDIYMilkClick(Sender: TObject);
begin
   // link to DIY milk recording program 31/5/00 - kr
   // 'C:\Kingswood Herd Management\diymilk.exe'
   // also try -  WinExec('<program path & name>',sw_show)
   // or       -  Execute(<filename>) - incl.FMXUtils
   // ERROR - 'directory controlled by other .NET file'
   // solve by recompiling either Herd or DIYMilk with IDENTICAL 'NET' directories
   // (for 'pdoxusers' file)
   try
      if FileExists('C:\Kingswood Herd Management\diymilk.exe') then
         ShellExecute(Handle,NIL,'diymilk.exe',NIL,
                      'C:\Kingswood Herd Management',sw_shownormal)
      else
         MessageDLG('The DIY Milk Recording program is not installed,'+#13+
                    'or cannot be found. Contact Kingswood.',mtError,[mbOK],0);
   except
      MessageDLG('Error Opening DIY Milk Recording. Contact Kingswood.',mtError,[mbOK],0);
   end;
end;

procedure TfMilkRec.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('MRec.htm');
end;

procedure TfMilkRec.dblcMDTChange(Sender: TObject);
begin
{   WinData.OwnerFile.Locate('HerdIdentity',HerdNum.Text,[]);
   if (dblcMDT.Text = '')  then
      begin
         MessageDLG('Please specify the correct last date',mtError,[mbOK],0);
         dblcMDT.SetFocus;
      end
   else
      begin
         if MessageDLG('Is '+dblcMDT.Text+' the correct last Milk Recording'+#13+
                       'for herd '+WinData.OwnerFile.FieldByName('HerdIdentity').AsString+'?',
                       mtConfirmation,[mbYes,mbNo],0) = mrYes then
            begin
               if WinData.MainMilkTrans.Locate('RecordingDate',StrToDate(dblcMDT.Text),[]) then
                  begin
                     WinData.MainMilkTrans.Edit;
                     WinData.MainMilkTrans.FieldByName('MilkRecID').AsString := WinData.OwnerFile.FieldByName('MilkRecordingID').AsString;
                     WinData.MainMilkTrans.Post;
                  end;
            end
         else
            begin
               dblcMDT.ResetField;
               dblcMDT.DropDown;
            end;
      end;
}end;

{ ------------------------------------------------- ICBF MMR -------------------------------------------------------- }


procedure TfMilkRec.ProcessMMRFile;                         { Read in MMR File }
var
   Buffer : String;
   i : Integer;
   CurrLact : Boolean;
   NotMatched : Boolean;
   NatIDNum : String;
   AnimalIsFemale : Boolean;
   WriteEBIValues : Boolean;
   DSAlreadyActive : Boolean;
begin
   GetOwnerData; // This sets the HerdID also calls function to set the file to use
   Reset(MilkFile);
   CurrLact := False;

   with MyQuery do
      begin
         SQL.Clear;
         SQL.Add('DELETE FROM '+MyTable.TableName+'');
         ExecSQL;

         SQL.Clear;
         SQL.Add('DELETE FROM '+TempMilkDisk.TableName+'');
         ExecSQL;
      end;

   MyTable.Open;

   with tAnimals do
      begin
         First;
         while NOT TAnimals.EOF do
            begin
               Edit;
               FieldByName('AnimalNo').Value := StripLeadingZeros(TAnimals.FieldByName('AnimalNo').Value);
               FieldByName('NatIDNum').AsString := WinData.StripAllNomNumAlpha(TAnimals.FieldByName('NatIDNum').AsString);
               Post;
               Next;
            end;
      end;

    MatchField := WinData.ICBFMatchField;
    if MatchField = 'AnimalNo' then
       CheckDuplicateAnimalNo;

   ShowProgressIndicator('Processing ICBF file, please wait...', 0, System.FileSize(MilkFile), 1);

   WriteEBIValues := True;

   try
      tCowExt.Active := True;
   except
      WriteEBIValues := False;
      MessageDlg('Unable to open CowExt Table - EBI Values cannot be saved at this time',mtError,[mbOK],0);
   end;

   try
      Update;

      while NOT EOF(MilkFile) do
         begin
            FillChar(Buffer,SizeOf(Buffer),0);
            ReadLn(MilkFile, Buffer);

            // NOTE: When Parsing do not count first field this is the Record Line ID
            // Loop through, find the animal code.
            if Copy(Buffer, 1, 3) = 'AID' then
               begin
                  CurrLact := True;
                  Parse(Buffer);
                  CurrAnimalCode := StripLeadingZeros(Parsefields[6]);
                  NatIDNum := WinData.StripAllNomNumAlpha(Parsefields[4]);
                  AnimalIsFemale := ( Trim(Parsefields[9]) = 'F' );
               end;

            // Locate all MMR's for the Animal Above.
            if Copy(Buffer, 1, 3) = 'MMR' then
               begin
                  MyTable.Append;
                  Buffer := Buffer+','; // The Parser will get the last value on a line if there's a comma proceeding it, insert one.
                  Parse(Buffer);

                  for i := 1 to ParseCount do
                     case i of
                        3 :  if Parsefields[i] <> '' then
                                MyTable.FieldByName('DateOfRecording').AsDateTime := ICBFStrToDate(ParseFields[i])
                             else
                                MyTable.FieldByName('DateOfRecording').AsDateTime := 0;
                        4 :  if ParseFields[i] <> '' then
                                MyTable.FieldByName('LactNo').AsInteger := StrToInt(ParseFields[i])
                             else
                                MyTable.FieldByName('LactNo').AsInteger := StrToInt(ParseFields[i]);
                        6 :  if ParseFields[i] <> '' then
                                MyTable.FieldByName('DailyYield').AsFloat := StrToFloat(ParseFields[i])
                             else
                                MyTable.FieldByName('DailyYield').AsFloat := 0.00;
                        7 :  if ParseFields[i] <> '' then
                                MyTable.FieldByName('DailyBFatPerc').AsFloat := StrToFloat(ParseFields[i])
                             else
                                MyTable.FieldByName('DailyBFatPerc').AsFloat := 0.00;
                        8 :  if ParseFields[i] <> '' then
                                MyTable.FieldByName('DailyProtPerc').AsFloat := StrToFloat(ParseFields[i])
                             else
                                MyTable.FieldByName('DailyProtPerc').AsFloat := 0.00;
                        9 :  if ParseFields[i] <> '' then
                                MyTable.FieldByName('DailyLactPerc').AsFloat := StrToFloat(ParseFields[i])
                             else
                                MyTable.FieldByName('DailyLactPerc').AsFloat := 0.00;
                        10 : if ParseFields[i] <> '' then
                                MyTable.FieldByName('SCC').AsFloat := StrToFloat(ParseFields[i])
                             else
                                MyTable.FieldByName('SCC').AsFloat := 0.00;
                        11 : if ParseFields[i] <> '' then
                                MyTable.FieldByName('DaysInMilk').AsInteger := StrToInt(ParseFields[i])
                             else
                                MyTable.FieldByName('DaysInMilk').AsInteger := 0;
                        12 : if ParseFields[i] <> '' then
                                MyTable.FieldByName('NoOfRecordings').Asinteger := StrToInt(ParseFields[i])
                             else
                                MyTable.FieldByName('NoOfRecordings').Asinteger := 0;
                     end;

                  MyTable.FieldByName('AnimalCode').AsString := CurrAnimalCode;
                  MyTable.FieldByName('NatIDNum').AsString := NatIDNum;

                  if MatchField <> 'AnimalNo' then // Locate with National Identity Number
                     CurrAnimalCode := NatIDNum;

                  if TAnimals.Locate(MatchField, CurrAnimalCode, [] ) then
                     begin
                        { UnMatchRecording is determined by ICBF LactNo greater than current lactation number.
                          REMEM: an ICBF lactation lower than current lactation is acceptable
                          because Milk history is to be read in.
                          }
                        NotMatched := MyTable.FieldByName('LactNo').AsInteger > TAnimals.FieldByName('LactNo').AsInteger;
                        if not NotMatched then
                           begin
                              MyTable.FieldByName('AnimalID').Value := TAnimals.FieldByName('ID').Value;
                              MyTable.FieldByName('AnimalCode').Value := TAnimals.FieldByName('AnimalNo').Value;
                              MyTable.FieldByName('SortAnimalCode').Value := TAnimals.FieldByName('SortAnimalNo').Value;

                              if WinData.CheckEvents.Locate('AnimalID;EventType', VarArrayOf([MyTable.FieldByName('AnimalID').AsInteger, CSaleDeathEvent]), []) then
                                 begin
                                    if WinData.CheckEvents.FieldByName('EventDate').AsDateTime < MyTable.FieldByName('DateOfRecording').AsDateTime then
                                       MyTable.FieldByName('LeftHerd').AsBoolean := True
                                    else
                                       MyTable.FieldByName('LeftHerd').AsBoolean := False;
                                 end
                              else
                                 MyTable.FieldByName('LeftHerd').AsBoolean := False;

                              if WinData.CheckEvents.Locate('AnimalId;AnimalLactNo;EventType', VarArrayOf([MyTable.FieldByName('AnimalID').AsInteger,
                                                                                                           MyTable.FieldByName('LactNo').AsInteger,
                                                                                                           CCalvingEvent]), [] ) then
                                 begin
                                    if WinData.CheckEvents.FieldByName('EventDate').AsDateTime > MyTable.FieldByName('DateOfRecording').AsDateTime then
                                       MyTable.FieldByName('ExcludeHasCalved').AsBoolean := True
                                    else
                                       MyTable.FieldByName('ExcludeHasCalved').AsBoolean := False;
                                 end
                              else
                                 MyTable.FieldByName('ExcludeHasCalved').AsBoolean := False;

                              if CurrLact then
                                 MyTable.FieldByName('CurrLact').AsBoolean := True
                              else
                                 MyTable.FieldByName('CurrLact').AsBoolean := False;

                              if MyTable.FieldByName('DailyYield').AsFloat > 0 then
                                 MyTable.Post
                              else
                                 MyTable.Cancel; // not a valid milk recording GL 11/06/2004
                           end
                        else
                           begin // store mis-match.
                              if not tICBFRec.Locate('AnimalID', TAnimals.FieldByName('ID').Value, []) then
                                 begin
                                    tICBFRec.Append;
                                    tICBFRec.FieldByName('AnimalID').Value := TAnimals.FieldByName('ID').Value;
                                    tICBFRec.FieldByName('AnimalNo').Value := TAnimals.FieldByName('AnimalNo').Value;
                                    tICBFRec.FieldByName('NatIDNum').Value := TAnimals.FieldByName('NatIDNum').Value;
                                    tICBFRec.FieldByName('LactNo').Value := TAnimals.FieldByName('LactNo').AsInteger;
                                    tICBFRec.FieldByName('ICBFLactNo').Value := MyTable.FieldByName('LactNo').AsInteger;
                                    tICBFRec.FieldByName('UpdateType').Value := 0;
                                    tICBFRec.Post;
                                 end;
                              MyTable.Cancel;
                           end;
                     end
                  else
                     begin
                        if ( not tICBFRec.Locate(MatchField, CurrAnimalCode, []) ) then
                           begin
                              tICBFRec.Append;
                              tICBFRec.FieldByName('AnimalNo').Value := MyTable.FieldByName('AnimalCode').AsString;
                              tICBFRec.FieldByName('NatIDNum').Value := MyTable.FieldByName('NatIDNum').AsString;
                              tICBFRec.FieldByName('UpdateType').Value := 1;
                              tICBFRec.Post;
                           end;
                        MyTable.Cancel;
                     end;

                  CurrLact := False;         //Set Current Lactation Status to FALSE
               end;

            if Copy(Buffer, 1, 3) = 'LAC' then
               begin
                  TempMilkDisk.Append;
                  Buffer := Buffer+',';
                  Parse(Buffer);
                  for i := 1 to ParseCount do
                     case i of
                        3 : if ParseFields[i] <> '' then
                               TempMilkDisk.FieldByName('LactNo').AsInteger := StrToInt(ParseFields[i])
                            else
                               TempMilkDisk.FieldByName('LactNo').AsInteger := 0;
                        6 : if ParseFields[i] <> '' then
                               TempMilkDisk.FieldByName('DryOffDate').AsDateTime := ICBFStrToDate(ParseFields[i])
                            else
                               TempMilkDisk.FieldByName('DryOffDate').AsDateTime := 0;
                        7 : if ParseFields[i] <> '' then
                               TempMilkDisk.FieldByName('DaysInMilk').AsInteger := StrToInt(ParseFields[i])
                            else
                               TempMilkDisk.FieldByName('DaysInMilk').AsInteger := 0;
                        9 : if ParseFields[i] <> '' then
                               TempMilkDisk.FieldByName('CumYield').AsFloat := StrToFloat(ParseFields[i])
                            else
                               TempMilkDisk.FieldByName('CumYield').AsFloat := 0.00;
                        10 : if ParseFields[i] <> '' then
                                TempMilkDisk.FieldByName('CumBFatPerc').AsFloat := StrToFloat(ParseFields[i])
                             else
                                TempMilkDisk.FieldByName('CumBFatPerc').AsFloat := 0.00;
                        11 : if ParseFields[i] <> '' then
                                TempMilkDisk.FieldByName('CumProtPerc').AsFloat := StrToFloat(ParseFields[i])
                             else
                                TempMilkDisk.FieldByName('CumProtPerc').AsFloat := 0.00;
                        12 : if ParseFields[i] <> '' then
                                TempMilkDisk.FieldByName('CumLactosePerc').AsFloat := StrToFloat(ParseFields[i])
                             else
                                TempMilkDisk.FieldByName('CumLactosePerc').AsFloat := 0.00;
                        13 : if ParseFields[i] <> '' then
                                TempMilkDisk.FieldByName('SCC').AsFloat := StrToFloat(ParseFields[i])
                             else
                                TempMilkDisk.FieldByName('SCC').AsFloat := 0.00;
                        14 : if ParseFields[i] <> '' then
                                TempMilkDisk.FieldByName('Yield305').AsFloat := StrToFloat(ParseFields[i])
                             else
                                TempMilkDisk.FieldByName('Yield305').AsFloat := 0.00;
                        15 : if ParseFields[i] <> '' then
                                TempMilkDisk.FieldByName('BFatPerc305').AsFloat := StrToFloat(ParseFields[i])
                             else
                                TempMilkDisk.FieldByName('BFatPerc305').AsFloat := 0.00;
                        16 : if ParseFields[i] <> '' then
                                TempMilkDisk.FieldByName('ProtPerc305').AsFloat := StrToFloat(ParseFields[i])
                             else
                                TempMilkDisk.FieldByName('ProtPerc305').AsFloat := 0.00;
                        17 : if ParseFields[i] <> '' then
                                TempMilkDisk.FieldByName('LactosePerc305').AsFloat := StrToFloat(ParseFields[i])
                             else
                                TempMilkDisk.FieldByName('LactosePerc305').AsFloat := 0.00;
                     end;

                     if TAnimals.Locate(MatchField, CurrAnimalCode,[]) then
                        begin
                           NotMatched := TempMilkDisk.FieldByName('LactNo').AsInteger > TAnimals.FieldByName('LactNo').AsInteger;
                           if not NotMatched then
                              begin
                                 TempMilkDisk.FieldByName('AnimalID').Value := TAnimals.FieldByName('ID').Value;
                                 { Convert Yield In KG's To %'s }
                                 if TempMilkDisk.FieldByName('CumYield').AsFloat > 0 then
                                    begin
                                       if TempMilkDisk.FieldByName('CumBFatPerc').AsFloat > 0 then
                                          TempMilkDisk.FieldByName('CumBFatPerc').AsFloat := (TempMilkDisk.FieldByName('CumBFatPerc').AsFloat / TempMilkDisk.FieldByName('CumYield').AsFloat) * 100;
                                       if TempMilkDisk.FieldByName('CumProtPerc').AsFloat > 0 then
                                          TempMilkDisk.FieldByName('CumProtPerc').AsFloat := (TempMilkDisk.FieldByName('CumProtPerc').AsFloat / TempMilkDisk.FieldByName('CumYield').AsFloat) * 100;
                                       if TempMilkDisk.FieldByName('CumLactosePerc').AsFloat > 0 then
                                          TempMilkDisk.FieldByName('CumLactosePerc').AsFloat := (TempMilkDisk.FieldByName('CumLactosePerc').AsFloat / TempMilkDisk.FieldByName('CumYield').AsFloat) * 100;
                                    end;

                                 if TempMilkDisk.FieldByName('Yield305').AsFloat > 0 then
                                    begin
                                       if TempMilkDisk.FieldByName('BFatPerc305').AsFloat > 0 then
                                          TempMilkDisk.FieldByName('BFatPerc305').AsFloat := (TempMilkDisk.FieldByName('BFatPerc305').AsFloat / TempMilkDisk.FieldByName('Yield305').AsFloat) * 100;
                                       if TempMilkDisk.FieldByName('ProtPerc305').AsFloat > 0 then
                                          TempMilkDisk.FieldByName('ProtPerc305').AsFloat := (TempMilkDisk.FieldByName('ProtPerc305').AsFloat / TempMilkDisk.FieldByName('Yield305').AsFloat) * 100;
                                       if TempMilkDisk.FieldByName('LactosePerc305').AsFloat > 0 then
                                          TempMilkDisk.FieldByName('LactosePerc305').AsFloat := (TempMilkDisk.FieldByName('LactosePerc305').AsFloat / TempMilkDisk.FieldByName('Yield305').AsFloat) * 100;
                                    end;
                                 { End Convert Yield }

                                 { The ICBF File is projecting All 305 Figures. For now 23/08/02 }
                                 { the program will take the total figures as the 305 figures    }
                                 { unless Days In Milk is >= 305 }
                                 if TempMilkDisk.FieldByName('DaysInMilk').AsInteger < 305 then
                                    begin
                                       TempMilkDisk.FieldByName('Yield305').AsFloat := TempMilkDisk.FieldByName('CumYield').AsFloat;
                                       TempMilkDisk.FieldByName('BFatPerc305').AsFloat := TempMilkDisk.FieldByName('CumBFatPerc').AsFloat;
                                       TempMilkDisk.FieldByName('ProtPerc305').AsFloat := TempMilkDisk.FieldByName('CumProtPerc').AsFloat;
                                       TempMilkDisk.FieldByName('LactosePerc305').AsFloat :=  TempMilkDisk.FieldByName('CumLactosePerc').AsFloat;
                                    end;

                                 if MatchField = 'AnimalNo' then
                                    TempMilkDisk.FieldByName('AnimalCode').AsString := CurrAnimalCode
                                 else
                                    TempMilkDisk.FieldByName('NatIDNum').AsString := CurrAnimalCode;
                                 TempMilkDisk.Post;
                              end
                           else
                              begin // store mis-match.
                                 if not tICBFRec.Locate('AnimalID', TAnimals.FieldByName('ID').Value, []) then
                                    begin
                                       tICBFRec.Append;
                                       tICBFRec.FieldByName('AnimalID').Value := TAnimals.FieldByName('ID').Value;
                                       tICBFRec.FieldByName('AnimalNo').Value := TAnimals.FieldByName('AnimalNo').Value;
                                       tICBFRec.FieldByName('NatIDNum').Value := TAnimals.FieldByName('NatIDNum').Value;
                                       tICBFRec.FieldByName('LactNo').Value := TAnimals.FieldByName('LactNo').AsInteger;
                                       tICBFRec.FieldByName('ICBFLactNo').Value := MyTable.FieldByName('LactNo').AsInteger;
                                       tICBFRec.FieldByName('UpdateType').Value := 0;
                                       tICBFRec.Post;
                                    end;
                                 TempMilkDisk.Cancel;
                              end;
                        end
                     else
                        TempMilkDisk.Cancel;
               end;

            if ( WriteEBIValues ) and ( Copy(Buffer, 1, 3) = 'EBI' ) and ( tCowExt <> nil ) then
               begin
                  if ( AnimalIsFemale ) then
                     begin
                        Buffer := Buffer + ',';
                        Parse(Buffer);

                        // Save EBI as we read in the file. EBI is not part of milk recording as such!
                        if TAnimals.Locate( MatchField, CurrAnimalCode, [] ) then // make sure animal is found in TAnimals!
                           begin
                              if tCowExt.Locate('AnimalID', TAnimals.FieldByName('ID').AsInteger, []) then
                                 tCowExt.Edit
                              else
                                 tCowExt.Append;
                              try
                                 if tCowExt.FieldByName('AnimalID').AsInteger <= 0 then // if insert
                                    tCowExt.FieldByName('AnimalID').Value := TAnimals.FieldByName('ID').AsInteger;
                                 tCowExt.FieldByName('EBI').Value := StrToFloat( ParseFields[ 4 ] );
                                 tCowExt.Post;
                              except
                                 tCowExt.Cancel;
                              end;
                           end;
                     end;
               end;
            ProgressIndicator.Position := FilePos(MilkFile);
         end;
   finally
      { Now Find the Latest MR Date in MyTable }
      MyQuery.SQL.Clear;
      MyQuery.SQL.Add('Select Max(DateOfRecording) RecDate From '+MyTable.TableName+'');
      MyQuery.Open;
      { Display Latest date in ThisDate.Text }
      ThisDate.Text := FormatDateTime(cIrishDateStyle, MyQuery.FieldByName('RecDate').AsDateTime);
      MyQuery.Close;
      CloseFile(MilkFile);
      uProgressIndicator.ProgressIndicator.Close;
      UpdateLactInfo;
   end;

end;                                                    { End Read in MMR File }

{------------------------------------------------------------------------------}

procedure TfMilkRec.GetOwnerData;                   { Locate BTE HerdNum       }
var                                                 { Match With HerdNum.Value }
   Buffer : String;
begin
   GetMilkRecID;

   AssignFile(MilkFile, MilkFileName);
   Reset(MilkFile);

   BTEHerdNo := '';

   while NOT EOF(MilkFile) do
      begin
         ReadLn(MilkFile, Buffer);
         if Copy(Buffer, 1, 3) = 'HRD' then
            begin
               Buffer := Buffer+','; // The Parser will get the last value on a line if there's a comma proceeding it, insert one.
               Parse(Buffer);
               BTEHerdNo := ParseFields[2];
               Break;
            end;
      end;

   if WinData.OwnerFile.Locate('HerdIdentity', BTEHerdNo,[]) then
      HerdNum.Value := IntToStr(WinData.OwnerFile.FieldByName('ID').AsInteger)
   else
      begin
         MessageDlg(Format('Herd identity number "%s" has not been found on the processed ICBF file.',[BTEHerdNo]),mtError,[mbOk],0);
         Abort;
      end;

end;                                                { End Locate BTE HerdNum   }

procedure TfMilkRec.DirectoryEdit1AfterDialog(Sender: TObject;
  var Name: String; var Action: Boolean);
begin
   if DirectoryExists(Name) then
      begin
         FileLocation := Name;
         WinData.MilkRecDir := IncludeTrailingBackslash( FileLocation );
         PopupMenu.Items[1].Checked := True;
         UpdateStatusBar;
      end
   else
      raise ErrorMsg.Create('Invalid Directory Selected');
end;

procedure TfMilkRec.GetMilkRecID;
begin
   with MyQuery do
      begin
         Close;
         SQL.Clear;
         SQL.Add('SELECT MilkRecordingID FROM Owners WHERE ID = '+HerdNum.Value+'');
         Open;

         if NOT ISEmpty then
            CurrentID := FieldByName('MilkRecordingID').AsString
         else
            begin
               MessageDlg('No Milk Recording ID found for this herd,'+#13+
                          'Milk Recording ID must be entered before processing Milk Recording',mtWarning,[mbYes,mbNo],0);

               if WinData.OwnerFile.Locate('ID',HerdNum.Value,[] ) then
                  begin
                     WinData.CreateAndShowForm(TfHerdSetUp);
                     GetMilkRecID;
                  end
               else
                  begin
                     MessageDlg('Herd not found, contact Kingswood',mtError,[mbOK],0);
                     Abort;
                  end;
            end
      end;
end;

procedure TfMilkRec.UpdateLactInfo;
var
   AutoViewErrorRpt, ViewErrorRpt : Boolean;
begin

   iNoExcludeHasCalved := 0;
   iNoFound := 0;
   iNoNotFound := 0;
   sbReview.Enabled := FALSE;

   ShowProgressIndicator('Updating lactation information, please wait...', 0, MyTable.RecordCount, 1);

   WinData.MainMilkTrans.Open;
   try
      with MyTable do
         begin

            if MyTable.IndexDefs.IndexOf('iDateOfRecording') > -1 then
               MyTable.IndexName := 'iDateOfRecording';

            First;
            while not(eof) do
               begin
                  Edit;
                  { Try find a recording date in MDT.db, If Recording Date doesn't exist, create new record... }
                  if NOT ( WinData.MainMilkTrans.Locate('RecordingDate', MyTable.FieldByName('DateOfRecording').AsDateTime, [] )) then
                     begin
                        WinData.MainMilkTrans.Append;
                        try
                           WinData.MainMilkTrans.FieldByName('RecordingDate').AsDateTime := MyTable.FieldByName('DateOfRecording').AsDateTime;
                           WinData.MainMilkTrans.FieldByName('MilkRecID').AsString := CurrentID;
                           WinData.MainMilkTrans.FieldByName('Description').Value := 'Milk Recording on ' + FormatDateTime(cIrishDateStyle,MyTable.FieldByName('DateOfRecording').AsDateTime);
                           WinData.MainMilkTrans.FieldByName('NMRRecording').Value := TRUE;
                           WinData.MainMilkTrans.Post;

                           MyTable.FieldByName('MDTID').Value := WinData.MainMilkTrans.FieldByName('ID').AsInteger;
                        except
                           on E : Exception do
                              WinData.HandleException(E, WinData.MainMilkTrans);
                        end;
                     end
                  else
                     { Otherwise assign new id to Animal record in TempMilk }
                     MyTable.FieldByName('MDTID').Value  := WinData.MainMilkTrans.FieldByName('ID').AsInteger;


                  if MyTable.FieldByName('CurrLact').AsBoolean then
                     begin
                        if MyTable.FieldByName('LeftHerd').AsBoolean then
                           Inc(iNoNotFound)
                        else if MyTable.FieldByName('ExcludeHasCalved').AsBoolean then
                           Inc(iNoExcludeHasCalved)
                        else
                           Inc(iNoFound);
                     end;
                  Post;
                  Next;
                  ProgressIndicator.Position := RecNo;
               end;
         end;

      ProgressIndicator.Position := 0;
      ProgressIndicator.Update;
      ProgressIndicator.Max := TempMilkDisk.RecordCount;

      with TempMilkDisk do
         begin
            First;
            While NOT EOF do
               begin
                  { First locate the Curr Lact Record and update Daily figures, also }
                  { update the milk record, with Cum and 305 figures. }

                  if MatchField = 'AnimalNo' then
                     MatchField := 'AnimalCode';

                  if MyTable.Locate(MatchField+';LactNo;CurrLact',VarArrayOf([TempMilkDisk.FieldByName(MatchField).AsString,
                                                                              TempMilkDisk.FieldByName('LactNo').AsInteger, True ]),[]) then
                     begin
                        MyTable.Edit;

                        try
                           MyTable.FieldByName('CumYield').Value        := TempMilkDisk.FieldByName('CumYield').Value;
                           MyTable.FieldByName('CumProtPerc').Value     := TempMilkDisk.FieldByName('CumProtPerc').Value;
                           MyTable.FieldByName('CumBFatPerc').Value     := TempMilkDisk.FieldByName('CumBFatPerc').Value;
                           MyTable.FieldByName('CumLactPerc').Value     := TempMilkDisk.FieldByName('CumLactosePerc').Value;

                           MyTable.FieldByName('Yield305').Value        := TempMilkDisk.FieldByName('Yield305').Value;
                           MyTable.FieldByName('BFat305Perc').Value     := TempMilkDisk.FieldByName('BFatPerc305').Value;
                           MyTable.FieldByName('Prot305Perc').Value     := TempMilkDisk.FieldByName('ProtPerc305').Value;
                           MyTable.FieldByName('Lact305Perc').Value     := TempMilkDisk.FieldByName('LactosePerc305').Value;
                           MyTable.Post;
                        except
                           on E : Exception do
                              WinData.HandleException(E, MyTable);
                        end;

                        TempMilkDisk.Edit;
                        try
                           TempMilkDisk.FieldByName('DailyYield').Value       := MyTable.FieldByName('DailyYield').Value;
                           TempMilkDisk.FieldByName('DailyBFatPerc').Value    := MyTable.FieldByName('DailyBFatPerc').Value;
                           TempMilkDisk.FieldByName('DailyProtPerc').Value    := MyTable.FieldByName('DailyProtPerc').Value;
                           TempMilkDisk.FieldByName('DailyLactosePerc').Value := MyTable.FieldByName('DailyLactPerc').Value;
                           TempMilkDisk.Post;
                        except
                           on E : Exception do
                              WinData.HandleException(E, TempMilkDisk);
                        end;

                     end;

                  if TempMilkDisk.FieldByName('DryOffDate').AsDateTime > 0 then
                     CreateDryOffEvent(TempMilkDisk.FieldByName('AnimalID').AsInteger,
                                       TempMilkDisk.FieldByName('LactNo').AsInteger,
                                       TempMilkDisk.FieldByName('DryOffDate').AsDateTime);
                  Next;
                  ProgressIndicator.Position := RecNo;
               end;
         end;

      // Fill the grid, only show the curr recording flaged using CurrLact Boolean
      qCurrLact.Open;

      NoFound.Text := IntToStr(iNoFound);
      NoNotFound.Text := IntToStr(iNoNotFound);
      NoExcludeHasCalved.Text := IntToStr(iNoExcludeHasCalved);

      DiskContents.DataSource := dsCurrLact;
      DiskContents.DataSource.DataSet.EnableControls;
      sbExecRecord.Enabled := True;


   finally
      WinData.MainMilkTrans.Close;
      ProgressIndicator.Close;
      Update;

      if tICBFRec.RecordCount > 0 then
         begin
            AutoViewErrorRpt := False;
            with TMilkRecErrors.Create(nil) do
               try
                  GenQuery.Params[0].AsInteger := 1;
                  GenQuery.Open;
                  try
                     if ( GenQuery.RecordCount > 0 ) then
                        begin


                           if MessageDlg('Some cows located on ICBF file could not be'+cCRLF+
                                         'matched with animals on the Herd Management System.'+cCRLF+cCRLF+
                                         'Click OK to preview these animals or Cancel to abort',mtWarning,[mbOK,mbCancel],0) = idOK then
                           begin
                              AutoViewErrorRpt := True;
                              GenQuery.First;

                              qrlHeading.Caption := 'Animals NOT Matched from ICBF Milk Disk';
                              qrlReportDesc.Lines.Clear;
                              qrlReportDesc.Lines.Add('The Cow(s) listed below are on the Milk Recording Diskette,');
                              qrlReportDesc.Lines.Add('but they do not appear to be on the Herd Management System.');
                              qrlReportDesc.Lines.Add('Check the cow no(s) and then search your Herd System for the animal(s).');
                              qrlReportDesc.Lines.Add('You should NOT complete the recording until you are satisfied that this is a');
                              qrlReportDesc.Lines.Add('Milk Recording Error.');
                              qrMilkErrors.Preview;
                           end;
                        end;
                  finally
                     GenQuery.Close;
                  end;

                  GenQuery.Params[0].AsInteger := 0;
                  GenQuery.Open;
                  try
                     if ( GenQuery.RecordCount > 0 ) then
                        begin
                           ViewErrorRpt := True;
                           if not AutoViewErrorRpt then
                              begin
                                 if MessageDlg('Some Cows cannot be recorded for this milk recording.'+cCRLF+
                                               'Their lactation number does match the ICBF lactation number.'+cCRLF+cCRLF+
                                               'Click OK to preview these animals or Cancel to abort',mtWarning,[mbOK,mbCancel],0) = idCancel then ViewErrorRpt := False;
                              end;

                           if ViewErrorRpt then
                              begin
                                 qrlHeading.Caption := 'Animal Lactation''s NOT Matched from ICBF Milk Disk';
                                 GenQuery.First;
                                 qrlHerdLactNo.Enabled := True;
                                 qrlICBFLactNo.Enabled := True;
                                 qrdblHerdLactNo.Enabled := True;
                                 qrdblICBFLactNo.Enabled := True;
                                 qrlReportDesc.Lines.Clear;
                                 qrlReportDesc.Lines.Add('The Cow(s) listed below are on the Herd Management System,');
                                 qrlReportDesc.Lines.Add('they cannot be recorded because their lactation number does ');
                                 qrlReportDesc.Lines.Add('match the ICBF lactation number.');
                                 qrMilkErrors.Preview;
                              end;

                        end;
                  finally
                     GenQuery.Close;
                  end;
               finally
                  Free;
                  SQLEmptyTable(tICBFRec.TableName);
               end;
         end;
   end;

end;

procedure TfMilkRec.CreateDryOffEvent(AID, LactNo: Integer; EDate: TDateTime);
var
   EHealth : THealthEvent;
begin
   // check for Drying off event for curr lact.
{
   if AID = 16 then
      ShowMessage('Animal:16');

   if NOT(WinData.CheckEvents.Locate('AnimalID;AnimalLactNo;EventDate;EventType',VarArrayOf([AID, LactNo, EDate, cDryOffEvent]),[])) then
      with WinData do
         begin
            EventType := TDryOff;
            Events.Append;
            try
               EventsEventType.Value    := CDryOffEvent;
               EventsAnimalID.Value     := AID;
               EventsAnimalLactNo.Value := LactNo;
               if LookUpDamSire.Locate('ID',AID,[]) then
                  EventsHerdID.Value    := LookUpDamSire.FieldByName('HerdID').AsInteger;
               EventsEventDate.Value    := EDate;
               EventsEventDesc.Value    := 'Drying Off';
               EventsICBFNotified.Value := False;
               EventsICBFAction.Value   := 'A';
               Events.Post;
               // post updates
               WinData.KingData.ApplyUpdates([Events]);
            except
               on E:Exception do
                  begin
                     Events.Cancel;
                     ShowMessage(E.Message + '  Animal:' +  IntToStr(AID));
                  end;
            end;
         end;  }

   if NOT(WinData.CheckEvents.Locate('AnimalID;AnimalLactNo;EventType',VarArrayOf([AID, LactNo, cDryOffEvent]),[])) then
      begin
         EHealth := THealthEvent.Create('HRec');
         try
             EHealth.Append;
             EHealth.EventType    := TDryOff;
             EHealth.AnimalID     := AID;
             EHealth.AnimalLactNo := LactNo;
             EHealth.AnimalHerdID := HerdLookup.GetHerdID(AID);
             EHealth.EventDate    := EDate;
             EHealth.Post;
         finally
            EHealth.Free;
         end;
      end;
end;

procedure TfMilkRec.CompleteMMRRecording;
begin
   try
      try
         ShowProgressIndicator('Completing milk recording, please wait...', 0, MyTable.RecordCount, 1);
         with MyTable do
            begin
               First;
               while not EOF do
                  begin
                     if not( MyTable.FieldByName('LeftHerd').AsBoolean ) or not( MyTable.FieldByName('ExcludeHasCalved').AsBoolean ) then
                        if WinData.MilkDiskTrans.Locate('AnimalID;LactNo;DateOfRecording', VarArrayOf([MyTable.FieldByName('AnimalID').AsInteger, MyTable.FieldByName('LactNo').AsInteger, MyTable.FieldByName('DateOfRecording').AsDateTime]), []) then
                           begin
                              WinData.MilkDiskTrans.Edit;

                              if (MyTable.FieldByName('SCC').AsInteger>0) then
                                 WinData.MilkDiskTrans.FieldByName('SCC').AsInteger               := MyTable.FieldByName('SCC').AsInteger;
                              if (MyTable.FieldByName('NoOfRecordings').AsInteger>0) then
                                 WinData.MilkDiskTrans.FieldByName('NoOfRecordings').AsInteger    := MyTable.FieldByName('NoOfRecordings').AsInteger;
                              if (MyTable.FieldByName('DaysInMilk').AsInteger>0) then
                                 WinData.MilkDiskTrans.FieldByName('DaysInMilk').AsInteger        := MyTable.FieldByName('DaysInMilk').AsInteger;

                              // Daily figures taken from TempMilk
                              if (MyTable.FieldByName('DailyYield').AsFloat>0) then
                                 WinData.MilkDiskTrans.FieldByName('DailyYield').AsFloat          := MyTable.FieldByName('DailyYield').AsFloat;
                              if (MyTable.FieldByName('DailyBFatPerc').AsFloat>0) then
                                 WinData.MilkDiskTrans.FieldByName('DailyBFatPerc').AsFloat       := MyTable.FieldByName('DailyBFatPerc').AsFloat;
                              if (MyTable.FieldByName('DailyProtPerc').AsFloat>0) then
                                 WinData.MilkDiskTrans.FieldByName('DailyProtPerc').AsFloat       := MyTable.FieldByName('DailyProtPerc').AsFloat;
                              if (MyTable.FieldByName('DailyLactPerc').AsFloat>0) then
                                 WinData.MilkDiskTrans.FieldByName('DailyLactPerc').AsFloat       := MyTable.FieldByName('DailyLactPerc').AsFloat;

                              // Cumulative figures
                              if (MyTable.FieldByName('CumYield').AsFloat>0) then
                                 WinData.MilkDiskTrans.FieldByName('CumYield').AsFloat            := MyTable.FieldByName('CumYield').AsFloat;
                              if (MyTable.FieldByName('CumBFatPerc').AsFloat>0) then
                                 WinData.MilkDiskTrans.FieldByName('CumBFatPerc').AsFloat         := MyTable.FieldByName('CumBFatPerc').AsFloat;
                              if (MyTable.FieldByName('CumProtPerc').AsFloat>0) then
                                 WinData.MilkDiskTrans.FieldByName('CumProtPerc').AsFloat         := MyTable.FieldByName('CumProtPerc').AsFloat;
                              if (MyTable.FieldByName('CumLactPerc').AsFloat>0) then
                                 WinData.MilkDiskTrans.FieldByName('CumLactPerc').AsFloat         := MyTable.FieldByName('CumLactPerc').AsFloat;

                              // 305 figures
                              if (MyTable.FieldByName('Yield305').AsFloat>0) then
                                 WinData.MilkDiskTrans.FieldByName('Yield305').AsFloat            := MyTable.FieldByName('Yield305').AsFloat;
                              if (MyTable.FieldByName('BFat305Perc').AsFloat>0) then
                                 WinData.MilkDiskTrans.FieldByName('BFat305Perc').AsFloat         := MyTable.FieldByName('BFat305Perc').AsFloat;
                              if (MyTable.FieldByName('Prot305Perc').AsFloat>0) then
                                 WinData.MilkDiskTrans.FieldByName('Prot305Perc').AsFloat         := MyTable.FieldByName('Prot305Perc').AsFloat;
                              if (MyTable.FieldByName('Lact305Perc').AsFloat>0) then
                                 WinData.MilkDiskTrans.FieldByName('Lact305Perc').AsFloat         := MyTable.FieldByName('Lact305Perc').AsFloat;

                              WinData.MilkDiskTrans.Post;
                           end
                        else
                           begin
                              WinData.MilkDiskTrans.Append;

                              WinData.MilkDiskTrans.FieldByName('MDTID').AsInteger             := MyTable.FieldByName('MDTID').AsInteger;
                              WinData.MilkDiskTrans.FieldByName('AnimalID').AsInteger          := MyTable.FieldByName('AnimalID').AsInteger;
                              WinData.MilkDiskTrans.FieldByName('AnimalCode').AsString         := MyTable.FieldByName('AnimalCode').AsString;
                              WinData.MilkDiskTrans.FieldByName('LactNo').AsInteger            := MyTable.FieldByName('LactNo').AsInteger;
                              WinData.MilkDiskTrans.FieldByName('DateOfRecording').AsDateTime  := MyTable.FieldByName('DateOfRecording').AsDateTime;

                              WinData.MilkDiskTrans.FieldByName('SCC').AsInteger               := MyTable.FieldByName('SCC').AsInteger;
                              WinData.MilkDiskTrans.FieldByName('NoOfRecordings').AsInteger    := MyTable.FieldByName('NoOfRecordings').AsInteger;
                              WinData.MilkDiskTrans.FieldByName('DaysInMilk').AsInteger        := MyTable.FieldByName('DaysInMilk').AsInteger;
                              WinData.MilkDiskTrans.FieldByName('NMRRecording').AsBoolean      := True;

                              // Daily figures taken from TempMilk
                              WinData.MilkDiskTrans.FieldByName('DailyYield').AsFloat          := MyTable.FieldByName('DailyYield').AsFloat;
                              WinData.MilkDiskTrans.FieldByName('DailyBFatPerc').AsFloat       := MyTable.FieldByName('DailyBFatPerc').AsFloat;
                              WinData.MilkDiskTrans.FieldByName('DailyProtPerc').AsFloat       := MyTable.FieldByName('DailyProtPerc').AsFloat;
                              WinData.MilkDiskTrans.FieldByName('DailyLactPerc').AsFloat       := MyTable.FieldByName('DailyLactPerc').AsFloat;

                              // Cumulative figures
                              WinData.MilkDiskTrans.FieldByName('CumYield').AsFloat            := MyTable.FieldByName('CumYield').AsFloat;
                              WinData.MilkDiskTrans.FieldByName('CumBFatPerc').AsFloat         := MyTable.FieldByName('CumBFatPerc').AsFloat;
                              WinData.MilkDiskTrans.FieldByName('CumProtPerc').AsFloat         := MyTable.FieldByName('CumProtPerc').AsFloat;
                              WinData.MilkDiskTrans.FieldByName('CumLactPerc').AsFloat         := MyTable.FieldByName('CumLactPerc').AsFloat;

                              // 305 figures
                              WinData.MilkDiskTrans.FieldByName('Yield305').AsFloat            := MyTable.FieldByName('Yield305').AsFloat;
                              WinData.MilkDiskTrans.FieldByName('BFat305Perc').AsFloat         := MyTable.FieldByName('BFat305Perc').AsFloat;
                              WinData.MilkDiskTrans.FieldByName('Prot305Perc').AsFloat         := MyTable.FieldByName('Prot305Perc').AsFloat;
                              WinData.MilkDiskTrans.FieldByName('Lact305Perc').AsFloat         := MyTable.FieldByName('Lact305Perc').AsFloat;

                              WinData.MilkDiskTrans.Post;
                           end;
                     Next;
                     ProgressIndicator.Position := RecNo;
                  end;
            end;

         ProgressIndicator.Position := 0;
         ProgressIndicator.Max := TempMilkDisk.RecordCount;
         with TempMilkDisk do
            begin
               First;
               While NOT EOF do
                  begin
                     if MilkDisk.Locate('AnimalID;LactNo',VarArrayOf([TempMilkDisk.FieldByName('AnimalID').Value,TempMilkDisk.FieldByName('LactNo').Value]),[] ) then
                        begin
                           MilkDisk.Edit;
                           MilkDisk.FieldByName('CumYield').Value := TempMilkDisk.FieldByName('CumYield').Value;
                           MilkDisk.FieldByName('CumProtPerc').Value := TempMilkDisk.FieldByName('CumProtPerc').Value;
                           MilkDisk.FieldByName('CumBFatPerc').Value := TempMilkDisk.FieldByName('CumBFatPerc').Value;

                           MilkDisk.FieldByName('SCC').Value := TempMilkDisk.FieldByName('SCC').Value;
                           MilkDisk.FieldByName('NoOfRecordings').Value := TempMilkDisk.FieldByName('NoOfRecordings').Value;
                           MilkDisk.FieldByName('DaysInMilk').Value := TempMilkDisk.FieldByName('DaysInMilk').Value;

                           MilkDisk.FieldByName('DailyYield').Value := TempMilkDisk.FieldByName('DailyYield').Value;
                           MilkDisk.FieldByName('DailyBFatPerc').Value := TempMilkDisk.FieldByName('DailyBFatPerc').Value;
                           MilkDisk.FieldByName('DailyProtPerc').Value := TempMilkDisk.FieldByName('DailyProtPerc').Value;

                           MilkDisk.FieldByName('Yield305').Value := TempMilkDisk.FieldByName('Yield305').Value;
                           MilkDisk.FieldByName('BFatPerc305').Value := TempMilkDisk.FieldByName('BFatPerc305').Value;
                           MilkDisk.FieldByName('ProtPerc305').Value := TempMilkDisk.FieldByName('ProtPerc305').Value;
                           MilkDisk.Post;
                        end
                     else
                        // Insert a new record for this Lactation
                        begin
                           MilkDisk.Insert;
                           MilkDisk.FieldByName('AnimalID').Value := TempMilkDisk.FieldByName('AnimalID').Value;
                           MilkDisk.FieldByName('LactNo').Value   := TempMilkDisk.FieldByName('LactNo').Value;


                           MilkDisk.FieldByName('SCC').Value := TempMilkDisk.FieldByName('SCC').Value;
                           MilkDisk.FieldByName('NoOfRecordings').Value := TempMilkDisk.FieldByName('NoOfRecordings').Value;
                           MilkDisk.FieldByName('DaysInMilk').Value := TempMilkDisk.FieldByName('DaysInMilk').Value;

                           MilkDisk.FieldByName('DailyYield').Value := TempMilkDisk.FieldByName('DailyYield').Value;
                           MilkDisk.FieldByName('DailyBFatPerc').Value := TempMilkDisk.FieldByName('DailyBFatPerc').Value;
                           MilkDisk.FieldByName('DailyProtPerc').Value := TempMilkDisk.FieldByName('DailyProtPerc').Value;

                           MilkDisk.FieldByName('CumYield').Value := TempMilkDisk.FieldByName('CumYield').Value;
                           MilkDisk.FieldByName('CumBFatPerc').Value := TempMilkDisk.FieldByName('CumBFatPerc').Value;
                           MilkDisk.FieldByName('CumProtPerc').Value := TempMilkDisk.FieldByName('CumProtPerc').Value;

                           MilkDisk.FieldByName('Yield305').Value := TempMilkDisk.FieldByName('Yield305').Value;
                           MilkDisk.FieldByName('BFatPerc305').Value := TempMilkDisk.FieldByName('BFatPerc305').Value;
                           MilkDisk.FieldByName('ProtPerc305').Value := TempMilkDisk.FieldByName('ProtPerc305').Value;
                           MilkDisk.Post;
                        end;
                     ProgressIndicator.Position := RecNo;
                     Next;
                  end;
            end;

            WinData.MilkDiskTrans.FlushBuffers;
            MilkDisk.FlushBuffers;

            // Save EBI Values
            if ( tCowExt <> nil ) then
               begin
                  WinData.KingData.ApplyUpdates([tCowExt]);
                  tCowExt.FlushBuffers;
                  DBIForceWrite(tCowExt);
               end;

         if ( FFileName <> '' ) then // rename attachment file.
            TFmFileAttachmentImport.MarkAttachmentAsRead(FFileName)
         else if FileExists(MilkFileName) then
            DeleteFile(MilkFileName, True);

         MessageDlg('Milk Recording Complete',mtInformation,[mbOK],0);
      except
         MessageDlg('Milk Recording Failed, close program reboot and try again',mtError,[mbOK],0);
      end;

   finally
      ProgressIndicator.Close;
      NoFound.Text := '0';
      NoNotFound.Text := '0';
      NoExcludeHasCalved.Text := '0';
      DiskContents.DataSource := nil;
   end;
end;

{ Parsing Routines }
function TfMilkRec.Getstr(n: byte): string;
begin
   Result := '';
   if N > NumFields then
      Exit;
   if ( n = 0 )then
     Result := FLine
   else if ( n > 0 ) then
      begin
         Dec(n); {0-based arrays!}
         if ( Index[n] > 0 ) then
            Result := copy(FLine, index[n], ct[n]);
      end;
end;

procedure TfMilkRec.Parse(const Line: string);
var
   i : byte;
   s: string;
   s2 : string;
begin
   Fline := Line;
   s:= line;
   NumFields := 0;
   i := pos(FieldSep, s);
   while i > 0 do
      begin
         s2 := copy (s,1,i -1);
         if NumFields = 0 then
            index[NumFields] := 1
         else
            index[NumFields] := pos(s2,fline);
         ct[NumFields] := length(s2);
         delete(s,1,i);
         i := pos(FieldSep, s);
         inc(NumFields);
     end;
end;

{ End Parsing Routines }
{
procedure TfMilkRec.EmptyTables;
begin
   TAnimals.Close;
   TAnimals.EmptyTable;

   MyTable.Close;
   MyTable.EmptyTable;

   TempMilkDisk.Close;
   TempMilkDisk.EmptyTable;
end;
}

procedure TfMilkRec.ADriveAfterDialog(Sender: TObject; var Name: String;
  var Action: Boolean);
begin
   if not FileExists( Name ) then
      raise Exception.Create('Unable to continue. No Milk Recording Files have been found'); // Trap execution here.
end;

procedure TfMilkRec.CheckDuplicateAnimalNo;
var
  NewRecordCount : Integer;
  I : Integer;
  AnimalToKeep : Integer;
  Index : Integer;
  DupAnimal : String;
begin
   with MyQuery do
      begin
         SQL.Clear;
         SQL.Add('SELECT DISTINCT( AnimalNo ), COUNT(AnimalNo)');
         SQL.Add('FROM TempCows ');
         SQL.Add('GROUP  BY AnimalNo');
         SQL.Add('HAVING COUNT(AnimalNo) > 1');
         Open;
         NewRecordCount := MyQuery.RecordCount;
         if (NewRecordCount > 0) then
            begin
               SetLength(ThisAnimalArray, NewRecordCount);
               MyQuery.First;
               Index := 0;
               while not Eof do
                  begin
                     ThisAnimalArray[Index] := MyQuery.FieldByName('AnimalNo').AsString;
                     Inc(Index);
                     Next;
                  end;

               for I := Low(ThisAnimalArray) to High(ThisAnimalArray) do
                  begin
                     //ThisAnimalArray[I] := MyQuery.FieldByName('AnimalNo').AsString;
                     { SP }
                     DupAnimal := ThisAnimalArray[I];
                     // Build array of duplicates, get animal id's from the sql.
                     qGetAnimal.SQL.Clear;
                     qGetAnimal.SQl.Add('Select ID from TempCows where AnimalNo = '''+DupAnimal+'''' );
                     qGetAnimal.Open;

                     NewRecordCount := qGetAnimal.RecordCount;
                     if (NewRecordCount > 0) then
                        begin
                           SetLength(DuplicateIDArray, NewRecordCount);
                           qGetAnimal.First;
                           while not qGetAnimal.eof do
                              begin
                                 DuplicateIDArray[qGetAnimal.RecNo-1] := qGetAnimal.FieldByName('ID').AsInteger;
                                 qGetAnimal.Next;
                              end;
                        end;
                     { Return ID of Animal to record. }
                     AnimalToKeep := uMilkRecDupHandler.ShowForm(DuplicateIDArray);
                     { SP }
                     qGetAnimal.SQL.Clear;
                     qGetAnimal.SQl.Add('Delete from TempCows where AnimalNo = :AnimalNo');
                     qGetAnimal.SQl.Add('And ID <> :ID ');
                     qGetAnimal.Params[0].AsString := MyQuery.FieldByName('AnimalNo').AsString;
                     qGetAnimal.Params[1].AsInteger := AnimalToKeep;
                     qGetAnimal.ExecSQL;

                     MyQuery.Next;
                  end;
            end;
      end;

end;

procedure TfMilkRec.DeleteOldNMRFile;
begin
   if FileExists('C:\Kingswood Herd Management\dsmember.dat') or FileExists('C:\Kingswood Herd Management\dsmember.exe') then
      begin
         if (messagedlg('A previous milk recording already exists, continuing will replace it,'+#13+
                        ' do you wish to continue?.',mtWarning,[mbNo,mbYes],0)=mrNo) then
            begin
               SysUtils.Abort;
            end
            else
               begin
                  // delete previous NMR file
                  DeleteFile('C:\Kingswood Herd Management\dsmember.dat');
                  DeleteFile('C:\Kingswood Herd Management\dsmember.exe');
               end;
      end;

end;

procedure TfMilkRec.AnimalNumber1Click(Sender: TObject);
begin
   WinData.ICBFMatchField := 'AnimalNo';
   AnimalNumber1.Checked := True;
   NationalIdentityNumber1.Checked := False;
end;


procedure TfMilkRec.NationalIdentityNumber1Click(Sender: TObject);
begin
   WinData.ICBFMatchField := 'NatIDNum';
   AnimalNumber1.Checked := False;
   NationalIdentityNumber1.Checked := True;
end;

procedure TfMilkRec.miUseICBFFormatClick(Sender: TObject);
begin
   miUseICBFFormat.Checked := not miUseICBFFormat.Checked;
   WinData.ICBFMMR := miUseICBFFormat.Checked;
   ICBFMatching1.Enabled := miUseICBFFormat.Checked;
   MilkDiskParameters1.Enabled := not miUseICBFFormat.Checked;
end;

procedure TfMilkRec.FormActivate(Sender: TObject);
var
   UseICBF : Boolean;
begin
   OnActivate := nil;
   UseICBF := WinData.ICBFMMR;
   miUseICBFFormat.Checked := UseICBF;
   ICBFMatching1.Enabled := UseICBF;
   MilkDiskParameters1.Enabled := not UseICBF;
   if UseICBF then
      sbRecord.Click;
end;

procedure TfMilkRec.Update305FromNMRFile;
var
   AnimalID, LactNo : Integer;
   Yield305, BFatPerc305, ProtPerc305, Yield, BFatPerc, ProtPerc : Double;
   tMilkDisk,tMilkDiskTrans : TTable;
   qMilkRecToUpdate : TQuery;
   MDTIDToUpdate : Integer;
   DaysInMilk, i : Integer;
   CumulativeUpdateAvailable : Boolean;
   DoCumulativeUpdate : Boolean;
begin
   if ( CountryCode in (['S','E']) ) then
      begin
         if FileExists('C:\NMRLactUpdate.dat') then
            begin
               NMRLactUpdate := TStringList.Create;
               NMRLactUpdate.LoadFromFile('C:\NMRLactUpdate.dat');

               tMilkDisk := TTable.Create(nil);
               tMilkDiskTrans := TTable.Create(nil);

               try
                  tMilkDisk.DatabaseName := AliasName;
                  tMilkDisk.TableName := 'MilkDisk';
                  tMilkDisk.Open;

                  tMilkDiskTrans.DatabaseName := AliasName;
                  tMilkDiskTrans.TableName := 'MilkDiskTrans';
                  tMilkDiskTrans.Open;

                  NMRLactUpdate.LoadFromFile('C:\NMRLactUpdate.dat');
                  FieldSep := ',';

                  for i := 0 to NMRLactUpdate.Count-1 do
                     begin
                        CumulativeUpdateAvailable := False;
                        Parse(NMRLactUpdate.Strings[i]+',');
                        if Parsefields[1] <> '' then
                           begin

                              AnimalID := StrToInt(Parsefields[1]);
                              LactNo := StrToInt(Parsefields[2]);
                              if Parsefields[3] <> '' then
                                 Yield305 := StrToFloat(Parsefields[3]);

                              if ( Yield305 > 0 ) then
                                 begin
                                    if Parsefields[4] <> '' then
                                       begin
                                          BFatPerc305 := StrToFloat(Parsefields[4]);
                                          if ( BFatPerc305 > 0 ) then
                                             BFatPerc305 := ((BFatPerc305 / Yield305) * 100);
                                       end;

                                    if Parsefields[5] <> '' then
                                       begin
                                          ProtPerc305  := StrToFloat(Parsefields[5]);
                                          if ( ProtPerc305 > 0 ) then
                                             ProtPerc305 := ((ProtPerc305 / Yield305) * 100);
                                       end;
                                    Yield305 := (Yield305 / 10);
                                 end;

                              if ParseCount = 6 then
                                 DaysInMilk := StrToInt(Parsefields[6])
                              else
                                 begin
                                    CumulativeUpdateAvailable := True;
                                    // Line contains Cum data.
                                    if Parsefields[6] <> '' then
                                       Yield := StrToFloat(Parsefields[6]);
                                    if ( Yield > 0 ) then
                                       begin
                                          if Parsefields[7] <> '' then
                                             begin
                                                BFatPerc := StrToFloat(Parsefields[7]);
                                                if ( BFatPerc > 0 ) then
                                                   BFatPerc := ((BFatPerc / Yield) * 100);
                                             end;

                                          if Parsefields[8] <> '' then
                                             begin
                                                ProtPerc  := StrToFloat(Parsefields[8]);
                                                if ( ProtPerc > 0 ) then
                                                   ProtPerc := ((ProtPerc / Yield) * 100);
                                             end;
                                          Yield := (Yield / 10);
                                       end;
                                    DaysInMilk := StrToInt(Parsefields[9]);
                                 end;
                           end;

                        if tMilkDisk.Locate('AnimalID;LactNo', VarArrayOf([AnimalID,LactNo]),[]) then
                           begin
                              tMilkDisk.Edit;
                              try
                                 tMilkDisk.FieldByName('Yield305').AsFloat := Yield305;
                                 tMilkDisk.FieldByName('BfatPerc305').AsFloat := BFatPerc305;
                                 tMilkDisk.FieldByName('ProtPerc305').AsFloat := ProtPerc305;
                                 if not CumulativeUpdateAvailable then
                                    begin
                                        // Use 305 Figures
                                       tMilkDisk.FieldByName('CumYield').AsFloat := Yield305;
                                       tMilkDisk.FieldByName('CumBfatPerc').AsFloat := BFatPerc305;
                                       tMilkDisk.FieldByName('CumProtPerc').AsFloat := ProtPerc305;
                                    end
                                 else
                                    begin
                                       tMilkDisk.FieldByName('CumYield').AsFloat := Yield;
                                       tMilkDisk.FieldByName('CumBfatPerc').AsFloat := BFatPerc;
                                       tMilkDisk.FieldByName('CumProtPerc').AsFloat := ProtPerc;
                                    end;
                                 tMilkDisk.FieldByName('DaysInMilk').AsInteger := DaysInMilk;
                              except
                                 tMilkDisk.Cancel;
                              end;
                           end;

                       MDTIDToUpdate := 0;
                       qMilkRecToUpdate := TQuery.Create(nil);
                       qMilkRecToUpdate.DatabaseName := AliasName;
                       qMilkRecToUpdate.SQL.Text := 'Select DateOfRecording, ID, LactNo, AnimalID, DaysInMilk From MilkDiskTrans Where (AnimalID = :AnimalID) and (LactNo = :LactNo) Order by DateOfRecording';
                       qMilkRecToUpdate.Params[0].AsInteger := AnimalID;
                       qMilkRecToUpdate.Params[1].AsInteger := LactNo;
                       qMilkRecToUpdate.Active := True;
                       try
                          qMilkRecToUpdate.Last;
                          DoCumulativeUpdate := True;
                          while (( qMilkRecToUpdate.bof ) and ( qMilkRecToUpdate.FieldByName('DaysInMilk').AsInteger >= 305 )) do
                             begin
                                MDTIDToUpdate :=  qMilkRecToUpdate.FieldByName('ID').AsInteger;
                                if tMilkDiskTrans.Locate('ID',MDTIDToUpdate ,[]) then
                                   begin
                                      tMilkDiskTrans.Edit;
                                      try
                                         tMilkDiskTrans.FieldByName('Yield305').AsFloat := Yield305;
                                         tMilkDiskTrans.FieldByName('Bfat305Perc').AsFloat := BFatPerc305;
                                         tMilkDiskTrans.FieldByName('Prot305Perc').AsFloat := ProtPerc305;
                                          if CumulativeUpdateAvailable then
                                             begin
                                                tMilkDiskTrans.FieldByName('CumYield').AsFloat := Yield;
                                                tMilkDiskTrans.FieldByName('CumBfatPerc').AsFloat := BFatPerc;
                                                tMilkDiskTrans.FieldByName('CumProtPerc').AsFloat := ProtPerc;
                                             end;
                                         tMilkDiskTrans.FieldByName('DaysInMilk').AsInteger := DaysInMilk;
                                         tMilkDiskTrans.Post;
                                      except
                                         tMilkDiskTrans.Cancel;
                                      end;
                                   end;
                                qMilkRecToUpdate.Prior;
                             end;
                       finally
                          qMilkRecToUpdate.Active := False;
                       end;

                     end;
               finally
                  DBIForceWrite(tMilkDisk);
                  DBIForceWrite(tMilkDiskTrans);
                  tMilkDisk.Close;
                  FreeAndNil(tMilkDisk);
                  tMilkDiskTrans.Close;
                  FreeAndNil(tMilkDiskTrans);
                  FreeAndNil(NMRLactUpdate);
               end;
            end;
      end;

end;

procedure TfMilkRec.UpdateStatusbar;
begin
   if WinData.ICBFMilkRec then
      begin
         StatusBar1.Panels[0].Text := 'ICBF Milk Recording';
         StatusBar1.Panels[1].Text := Format('Directory: %s',[FileLocation]);
         StatusBar1.Panels[2].Text := Format('File: %s',[ExtractFileName(MilkFileName)]);
         Update;
      end;
end;

class procedure TfMilkRec.ImportICBFFile(AFileName: string);
begin
   FFileName := AFileName;
   CreateAndShow(1);
end;

procedure TfMilkRec.sbCISFileExportClick(Sender: TObject);
begin
   // 29/01/2009 [V3.9 R5.8] /SP Additional Feature - New button for Creation of CIS file.
   TfmHUKIFarmEvents.InitializeExport(WinData.UserDefaultHerdID);
end;

procedure TfMilkRec.cbDownloadFileClick(Sender: TObject);
var
   MilkCompany : string;
begin
   // 29/01/2009 [V3.9 R5.8] /SP Additional Feature - New button for Link to Milk Company Website login page, allows user to download M/R files.

   HerdLookup.HerdOwnerData.HerdID := WinData.UserDefaultHerdID;
   GetRegValue(Reg_DefaultPath + 'Milk Recording\' + kRoutines.DataDir + '\' + HerdLookup.HerdOwnerData.HerdIdentity, 'Company', MilkCompany);
   if (MilkCompany = '') then
      begin
         MilkCompany := TfmkGetStringValue.GetItem('Milk Companies','Select Company',['NMR', 'United']);
         if MilkCompany <> '' then
            kRoutines.SetRegValue(Reg_DefaultPath + 'Milk Recording\' + kRoutines.DataDir + '\' + HerdLookup.HerdOwnerData.HerdIdentity, 'Company', MilkCompany);
      end;

   if (MilkCompany <> '') then
      begin
         if MilkCompany = 'NMR' then
            OpenUrl(cNMRURL)
         else if  MilkCompany = 'United' then
            OpenUrl(cUnitedDairiesURL);
      end
   else
      MessageDlg('No milk company has been selected.',mtInformation,[mbOK],0);
end;

procedure TfMilkRec.FormDestroy(Sender: TObject);
begin
   if ( NMRAnimalList <> nil ) then
      FreeAndNil(NMRAnimalList);
end;

end.

