
(*

  -----------------------------------------------------------------------------
  *****************************************************************************
  -----------------------------------------------------------------------------
  SP 22/11/2002:-

  DonorDamID brought now in print out.

  Donor Dam will be used as Dam, the receipient will be the Calved Dam.

  SP 22/11/2002.
  -----------------------------------------------------------------------------
  *****************************************************************************
  -----------------------------------------------------------------------------

  07/01/2009 [V3.9 R5.6] /SP Additional Feature - If Dam has not been served, and Sire is a NONE Herd Animal,
                                                assume ServiceType is "AI" for HKUI registration validation purposes.

  28/01/2009 [V3.9 R5.8] /SP Additional Feature - Allow user to Select AI Date while registering calves with HUK (formerly known as HUKI )

  29/01/2009 [V3.9 R5.8] /SP Additional Feature - Allow user to permanently remove calves from registration

  18/09/12 [V5.0 R9.9] /MK Bug Fix - AddErrorCode - 16 digit string value not allowed to be passed to an Integer value, try/except to fix this error.

  12/11/13 [V5.2 R5.3] /MK Additional Feature - Some calves were not registering because there is a limit of 30 characters allowed
                                                for the dam name with HUKI. HUKI said that if we fill the DamPrefix field in the XML
                                                with Herd Prefix then we could just show the dam name in the dam name field in the XML.

  22/01/16 [V5.5 R2.3] /MK Change - HUKI have a redirect problem with their URL so I need to change the URL to dairyfacts.co.uk.
*)

unit uHFSCalfReg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, ExtCtrls, DBTables, DB,
  DBCtrls, ComCtrls, RXLookup, RXCtrls, ToolWin,
  TB97Ctls, Menus, xml_generator, KRoutines, MSXML2_TLB, OleServer, ComObj,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxButtons, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfHFSCalfReg = class(TForm)
    CalfGrid: TRxDBGrid;
    StatusBar1: TStatusBar;
    MyQuery: TQuery;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    sbExit: TRxSpeedButton;
    ToolButton1: TToolButton;
    sbLoad: TRxSpeedButton;
    sbCreate: TRxSpeedButton;
    sbRemove: TRxSpeedButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    Panel2: TPanel;
    Label7: TLabel;
    Label2: TLabel;
    Herd: TRxDBLookupCombo;
    NoCalves: TEdit;
    ToolButton4: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    sbHelp: TToolbarButton97;
    pmRegister: TPopupMenu;
    RegisterCalvesOnly1: TMenuItem;
    RegisterPrintCalves1: TMenuItem;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    Label3: TLabel;
    HFSPinNo: TEdit;
    qPrintCalves: TQuery;
    LoginTimer: TTimer;
    sbNameSerialNos: TRxSpeedButton;
    ToolButton8: TToolButton;
    pRegCalves: TPanel;
    RegCalvesGridDBTableView: TcxGridDBTableView;
    RegCalvesGridLevel1: TcxGridLevel;
    RegCalvesGrid: TcxGrid;
    QueryRegCalves: TQuery;
    QueryRegCalvesID: TIntegerField;
    QueryRegCalvesCalfID: TIntegerField;
    QueryRegCalvesAcceptCode: TStringField;
    QueryRegCalvesBreedCode: TStringField;
    QueryRegCalvesHBN: TStringField;
    QueryRegCalvesRegDate: TDateTimeField;
    dsQueryRegCalves: TDataSource;
    N1: TMenuItem;
    ViewRegisteredCalves1: TMenuItem;
    Panel3: TPanel;
    cxButton1: TcxButton;
    RegCalvesGridDBTableViewCalfID: TcxGridDBColumn;
    RegCalvesGridDBTableViewAcceptCode: TcxGridDBColumn;
    RegCalvesGridDBTableViewBreedCode: TcxGridDBColumn;
    RegCalvesGridDBTableViewHBN: TcxGridDBColumn;
    RegCalvesGridDBTableViewRegDate: TcxGridDBColumn;
    RegCalvesGridDBTableViewCalfID2: TcxGridDBColumn;
    procedure ExitButtonClick(Sender: TObject);
    procedure LoadCalvesClick(Sender: TObject);
    procedure bCreateFileClick(Sender: TObject);
    procedure CalfGridDblClick(Sender: TObject);
    procedure bRemCalfClick(Sender: TObject);
    procedure HerdChange(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
    procedure RegisterCalvesOnly1Click(Sender: TObject);
    procedure RegisterPrintCalves1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LoginTimerTimer(Sender: TObject);
    procedure sbNameSerialNosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ViewRegisteredCalves1Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    LoginRequired : Boolean;
    HerdPrefix : String;
    HUKICalfReg,
    LookUpCalvings  : TTable;
    FFormShowing : Boolean;
    procedure GetCalves;
    procedure MarkAsRegistered;overload;
    procedure MarkAsRegistered(const EventID, CalfID : Integer);overload;
    procedure PostToHUKICalfReg(const CalfID : Integer; AcceptCode : String;
       const Breed, HBN : String);
    procedure PrintCalves;
    procedure OutputXML;
    function GetFileName(const IsReponse : Boolean=False) : String;
    procedure SendViaXMLHTTP;
    function GetBreedID(ACode : String) : Integer;
    function GetAIDateTime : TDateTime;
    procedure CheckAIDates;
  public
    { Public declarations }
    CalfTable : TTable;
    Calfsource : TDataSource;
  end;


{
var
  fCalfReg: TfCalfReg;
}

 procedure ShowForm;

implementation
uses
    GenTypesConst,
    DairyData,
    uPrintHUKICalfReg,
    uHerdSetUp,
    uHUKIRegistrationLogin,
    uHUKICalfRegErrorReview,
    uHUKINameSerialNoViewer,
    uConnect,
    KDBRoutines,
    uHUKISireDamListing, BDE, kGetDateTime, SQLHelper;


const

   cRegFileDir = 'HUKI Calf Registration';

{$R *.DFM}
procedure ShowForm;
begin
   try

      with TfHFSCalfReg.Create(nil) do
         try
            LoginRequired := True;
            HUKICalfReg := TTable.Create(nil);
            HUKICalfReg.DatabaseName := WinData.KingData.DatabaseName;
            HUKICalfReg.TableName := 'HUKICalfReg';
            HUKICalfReg.Open;

            CalfTable := TTable.Create(nil);
            CalfSource := TDataSource.Create(nil);
            with CalfTable do
               begin
                  DataBaseName := WinData.KingData.DatabaseName;
                  TableName := 'CalfReg';
                  TableType := ttParadox;

                  FieldDefs.Clear;
                  FieldDefs.Add('ID',ftAutoInc);
                  FieldDefs.Add('HerdPrefix',ftString,20,False);
                  FieldDefs.Add('HFSPin',ftString,15,False);
                  FieldDefs.Add('CalfDOB',ftDate,0,False);
                  FieldDefs.Add('DamID',ftInteger);
                  FieldDefs.Add('DamFullName',ftString,40,False);
                  FieldDefs.Add('DamNamePrefixExcluded',ftString,40,False);
                  FieldDefs.Add('DamHBN',ftString,20,False);
                  FieldDefs.Add('DamEarNo',ftString,20,False);
                  FieldDefs.Add('SerialNo',ftString,10);

                  FieldDefs.Add('SireID',ftInteger);
                  FieldDefs.Add('SireHBN',ftString,20,False);
                  FieldDefs.Add('SireFullName',ftString,40,False);
                  FieldDefs.Add('SemenObtainedFrom',ftString,40,False);

                  FieldDefs.Add('Sex',ftString,1,False);
                  FieldDefs.Add('MethodOfService',ftString,30,False);

                  FieldDefs.Add('ETFormNo',ftString,10,False);
                  FieldDefs.Add('ETRecipientEarNo',ftString,20,False);
                  FieldDefs.Add('DateOfService',ftDate,0,False);

                  FieldDefs.Add('CalfName',ftString,40,False);
                  FieldDefs.Add('CalfNamePrefixExcluded',ftString,40,False);
                  FieldDefs.Add('TwinDetails',ftString,3,False);

                  FieldDefs.Add('CalfEarNo',ftString,20,False);
                  FieldDefs.Add('CalfNo',ftString,15,False);
                  FieldDefs.Add('CalfBreedName',ftString,30,False);
                  FieldDefs.Add('CalfBreedCode',ftString,6,False);
                  FieldDefs.Add('RedMarker',ftString,3,False);
                  FieldDefs.Add('CalvingSurvey',ftString,30,False);
                  FieldDefs.Add('CalfColour'ftString,30,False);

                  FieldDefs.Add('EventID',ftInteger,0,False);
                  FieldDefs.Add('AnimalId',ftInteger,0,False);
                  FieldDefs.Add('LactNo',ftInteger,0,False);
                  FieldDefs.Add('Notified',ftBoolean,0,False);

                  FieldDefs.Add('Batch_Country',ftString,2);
                  FieldDefs.Add('EarTag_Prefix',ftString,10);
                  FieldDefs.Add('EarTag_Suffix',ftString,6);

                  FieldDefs.Add('ServiceType',ftString,2);
                  FieldDefs.Add('AIDate',ftDateTime);

                  FieldDefs.Add('SirePrefix',ftString,30);
                  FieldDefs.Add('SireSerialNo',ftString,4);
                  FieldDefs.Add('SireBreed',ftString,2);
                  FieldDefs.Add('SireHBNFlag',ftString,1);
                  FieldDefs.Add('SireSRCode',ftString,1);
                  FieldDefs.Add('SireEarMark',ftString,15);

                  FieldDefs.Add('DamPrefix',ftString,30);
                  FieldDefs.Add('DamSerialNo',ftString,4);
                  FieldDefs.Add('DamBreed',ftString,2);
                  FieldDefs.Add('DamHBNFlag',ftString,1);
                  FieldDefs.Add('DamSRCode',ftString,1);
                  FieldDefs.Add('DamEarMark',ftString,15);

                  FieldDefs.Add('ETNO',ftString,12);
                  FieldDefs.Add('Red',ftString,1);

                  FieldDefs.Add('Ignore',ftBoolean);
                  CreateTable;
                  Open;
               end;
            CalfSource.DataSet := CalfTable;
            CalfGrid.DataSource := CalfSource;
            ShowModal;
         finally
            if HUKICalfReg <> nil then
               begin
                  HUKICalfReg.Close;
                  FreeAndNil(HUKICalfReg);
               end;
            Free;
         end;
   except
      MessageDlg('Cannot create form, close program and reboot.'+#13+
                 'If problem persists contact Kingswood',mtError,[mbOk],0);
   end;
end;

procedure TfHFSCalfReg.ExitButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfHFSCalfReg.GetCalves;
var
   i : Integer;
begin
     MyQuery.SQL.Clear;
     MyQuery.SQL.Add('DELETE FROM CalfReg');
     MyQuery.ExecSQL;

     for i := 1 to 4 do
        begin
           MyQuery.SQL.Clear;
           MyQuery.SQL.Add('INSERT INTO CalfReg ( EventID, AnimalID, LactNo )');
           case i of
              1 : MyQuery.SQL.Add('SELECT EventID, ID1, AnimalLactNo');
              2 : MyQuery.SQL.Add('SELECT EventID, ID2, AnimalLactNo');
              3 : MyQuery.SQL.Add('SELECT EventID, ID3, AnimalLactNo');
              4 : MyQuery.SQL.Add('SELECT EventID, ID4, AnimalLactNo');
           end;
           MyQuery.SQL.Add('FROM Calvings C, Events E, Animals D');
           MyQuery.SQL.Add('WHERE (C.EventID=E.ID)');
           case i of
              1 : begin
                     MyQuery.SQL.Add('AND(C.ID1=D.ID)');
                     MyQuery.SQL.Add('AND(D.Breeding=TRUE)');  //SP 23/11/00 To exclude Non-Breeding animals
                     MyQuery.SQL.Add('AND(C.ID1HFSNotified=FALSE)');
                     MyQuery.SQL.Add('AND(C.ID1>0)');
                  end;
              2 : begin
                     MyQuery.SQL.Add('AND(C.ID2=D.ID)');
                     MyQuery.SQL.Add('AND(D.Breeding=TRUE)');  //SP 23/11/00 To exclude Non-Breeding animals
                     MyQuery.SQL.Add('AND(C.ID2HFSNotified=FALSE)');
                     MyQuery.SQL.Add('AND(C.ID2>0)');
                  end;
              3 : begin
                     MyQuery.SQL.Add('AND(C.ID3=D.ID)');
                     MyQuery.SQL.Add('AND(D.Breeding=TRUE)');  //SP 23/11/00 To exclude Non-Breeding animals
                     MyQuery.SQL.Add('AND(C.ID3HFSNotified=FALSE)');
                     MyQuery.SQL.Add('AND(C.ID3>0)');
                  end;
              4 : begin
                     MyQuery.SQL.Add('AND(C.ID4=D.ID)');
                     MyQuery.SQL.Add('AND(D.Breeding=TRUE)');   //SP 23/11/00 To exclude Non-Breeding animals
                     MyQuery.SQL.Add('AND(C.ID4HFSNotified=FALSE)');
                     MyQuery.SQL.Add('AND(C.ID4>0)');
                  end;
           end;
           MyQuery.ExecSQL;
        end;
        //sbPreview.Enabled := True; //SP
end;

procedure TfHFSCalfReg.LoadCalvesClick(Sender: TObject);
Var
   UsedAnimal     : Boolean;
   OriginalAnimal : TBookMark;
   DamId,
   SireID : Variant;
   DonorDamID,
   DamToUse : Integer;
   TwinDetails : String;
   x          : Integer;
   //HerdPIN    : String;
   NoMales,
   NoFemales,
   CurrentID,
   NoOfCalves : Integer;
   // First Pos is ID 2nd pos is sex 1 = Male 2 = Female
   Calf       : array [1..4,1..2] of Integer;
   HerdIdentifier : String;

   { }
   tTagNo : String;
   DamNamePrefixExcluded,
   CalfNamePrefixExcluded : String;
   RecipientTag : String;

   tempChar : Char;

begin
   Screen.Cursor := crHourGlass;
  try
  //   WinData.Breeds.Open;
//     WinData.GenLookUp.Open;

     // Get the Herd Prefix and HFS Pin
     if WinData.OwnerFile.Locate('ID',Herd.Value,[] ) then
        begin
            HerdPrefix := Trim(UPPERCASE(WinData.OwnerFile.FieldByName('HerdPreFix').AsString));

            if (HerdPrefix = '') then
               begin
                  MessageDlg('You must enter "Herd Prefix" before registering calves.',mtError,[mbOK],0);
                  uHerdSetUp.ShowTheForm(FALSE);
                  SysUtils.Abort;
               end;

            HFSPinNo.Text   := WinData.OwnerFile.FieldByName('HFSPin').AsString;

            HerdIdentifier := Trim(WinData.StripAllNomNumAlpha(WinData.OwnerFileHerdIdentifier.AsString));
            if (HerdIdentifier = '') then
               begin
                  MessageDlg('You must enter valid "Herd Designator" before registering calves',mtError,[mbOK],0);
                  uHerdSetUp.ShowTheForm(FALSE);
                  SysUtils.Abort;
               end
            else
               begin
                  for x := 1 to Length(HerdIdentifier) do
                     begin
                        if not(HerdIdentifier[x] in ['0'..'9']) then
                           begin
                              MessageDlg(Format('Your "Herd Designator" can only contain digits.'+#13#10+
                                         'The current Herd Designator "%s" is invalid.'+#13#10+
                                         'Please enter a Herd Designator containing only digits',[HerdIdentifier]),mtError,[mbOK],0);
                              uHerdSetUp.ShowTheForm(FALSE);
                              SysUtils.Abort;
                           end;
                     end;
               end;
        end;

     CalfTable.DisableControls;
     GetCalves;
     CalfTable.First;

     // Get Animals details for Registration
     while NOT CalfTable.EOF do
        try
           // find the Calfs Record
           UsedAnimal := FALSE;
           if WinData.LookUpDamSire.Locate('ID', CalfTable.FieldByName('AnimalID').AsInteger, [] ) then
              if UPPERCASE (WinData.LookUpDamSire.FieldByName('Sex').AsString) <> 'STEER' then
                 with CalfTable do
                    begin
                       UsedAnimal := TRUE;
                       Edit;
                       CurrentID := WinData.LookUpDamSire.FieldByName('ID').AsInteger;

                       FieldByName('Ignore').AsBoolean := False;
                       FieldByName('HerdPreFix').AsString := HerdPrefix;
                       //FieldByName('HFSPin').Value := HerdPIN;
                       FieldByName('CalfDOB').AsDateTime := WinData.LookUpDamSire.FieldByName('DateOfBirth').AsDateTime;
                       FieldByName('CalfName').ASString := WinData.LookUpDamSire.FieldByName('Name').ASString;
                       CalfNamePrefixExcluded := UPPERCASE(FieldByName('CalfName').ASString);
                       if Pos( HerdPrefix, CalfNamePrefixExcluded) > 0 then
                          begin
                             System.Delete(CalfNamePrefixExcluded, Pos( HerdPrefix, CalfNamePrefixExcluded), Length(HerdPrefix));
                             CalfNamePrefixExcluded := Trim(CalfNamePrefixExcluded);
                          end;

                       if Trim( CalfNamePrefixExcluded ) <> '' then
                          begin
                             tempChar := CalfNamePrefixExcluded[Length(CalfNamePrefixExcluded)];
                             while not(tempChar in ['a'..'z', 'A'..'Z']) do
                                begin
                                   if tempChar in ['0'..'9'] then
                                      FieldByName('SerialNo').AsString := tempChar + FieldByName('SerialNo').AsString;
                                   System.Delete(CalfNamePrefixExcluded, Length(CalfNamePrefixExcluded), 1);
                                   if Trim(CalfNamePrefixExcluded) <> '' then
                                      tempChar := CalfNamePrefixExcluded[Length(CalfNamePrefixExcluded)]
                                   else
                                      Break;
                                end;
                          end;

                       FieldByName('CalfNamePrefixExcluded').ASString := CalfNamePrefixExcluded;

                       FieldByName('CalfEarNo').ASString := WinData.LookUpDamSire.FieldByName('NatIDNum').ASString;

                       FieldByName('CalfNo').ASString := WinData.LookUpDamSire.FieldByName('AnimalNo').ASString;

                       // Get the breed of the calf
                       if WinData.Breeds.Locate('ID', WinData.LookUpDamSire.FieldByName('PrimaryBreed').AsInteger,[] ) then
                          begin
                             FieldByName('CalfBreedName').ASString := WinData.Breeds.FieldByName('Name').AsString;
                             FieldByName('CalfBreedCode').ASString := WinData.Breeds.FieldByName('Code').AsString;
                          end;

                       if WinData.GenLookup.Locate('ID',WinData.LookUpDamSire.FieldByName('Colour').ASINteger,[] ) then
                          begin
                             FieldByName('CalfColour').ASString := WinData.GenLookup.FieldByName('Description').ASString;
                             if UPPERCASE(FieldByName('CalfColour').ASString) = 'RED' then
                                FieldByName('Red').ASString := 'Y'
                             else
                                FieldByName('Red').ASString := 'N';
                          end
                       else
                          FieldByName('Red').ASString := 'N';

                       if ( Herd.Value <> '0' ) then
                          if WinData.LookUpDamSire.FieldByName('HerdId').AsString <> Herd.Value then
                             UsedAnimal := FALSE;

                       if WinData.LookUpDamSire.FieldByName('Sex').ASString = 'Female' then
                          FieldByName('Sex').ASString := 'F'
                       else
                          FieldByName('Sex').ASString := 'M';

                       OriginalAnimal := WinData.LookUpDamSire.GetBookmark;
                       if WinData.LookUpDamSire.FieldByName('DonorDamID').AsInteger > 0 then
                          begin
                             DamID := WinData.LookUpDamSire.FieldByName('DamID').ASInteger;
                             DonorDamID := WinData.LookUpDamSire.FieldByName('DonorDamID').ASInteger;
                             DamToUse := DonorDamID;
                          end
                       else
                          begin
                             DonorDamID := 0;
                             DamID := WinData.LookUpDamSire.FieldByName('DamID').ASInteger;

                             DamToUse := DamID;
                          end;

                       SireID := WinData.LookUpDamSire.FieldByName('SireID').ASInteger;

                       if WinData.LookUpDamSire.Locate('ID', DamID,[] ) then
                          begin
                             RecipientTag := WinData.LookUpDamSire.FieldByName('NatIDNum').AsString;
                          end;

                       if WinData.LookUpDamSire.Locate('ID', DamToUse,[] ) then
                          begin
                             FieldByName('DamID').AsInteger := WinData.LookUpDamSire.FieldByName('ID').AsInteger;

                             if WinData.LookUpDamSire.FieldByName('HerdBookNo').AsString <> '' then
                                FieldByName('DamHBN').AsString := PadLeft(WinData.LookUpDamSire.FieldByName('HerdBookNo').AsString,'0',12);
                             FieldByName('DamFullName').AsString := WinData.LookUpDamSire.FieldByName('Name').AsString;
                             DamNamePrefixExcluded := UPPERCASE(FieldByName('DamFullName').ASString);
                             if Pos( HerdPrefix, DamNamePrefixExcluded) > 0 then
                                begin
                                   System.Delete(DamNamePrefixExcluded, Pos( HerdPrefix, DamNamePrefixExcluded), Length(HerdPrefix));
                                   DamNamePrefixExcluded := Trim(DamNamePrefixExcluded);
                                end;

                             if Trim( DamNamePrefixExcluded ) <> '' then
                                begin
                                   tempChar := DamNamePrefixExcluded[Length(DamNamePrefixExcluded)];
                                   while not(tempChar in ['a'..'z', 'A'..'Z']) do
                                      begin
                                         if tempChar in ['0'..'9'] then
                                            FieldByName('DamSerialNo').AsString := tempChar + FieldByName('SerialNo').AsString;
                                         System.Delete(DamNamePrefixExcluded, Length(DamNamePrefixExcluded), 1);
                                         if Trim(DamNamePrefixExcluded) <> '' then
                                            tempChar := DamNamePrefixExcluded[Length(DamNamePrefixExcluded)]
                                         else
                                            Break;
                                      end;
                                end;

                             FieldByName('DamNamePrefixExcluded').AsString := DamNamePrefixExcluded;
                             FieldByName('DamEarNo').AsString := WinData.LookUpDamSire.FieldByName('NatIDNum').AsString;
                             FieldByName('DamEarMark').AsString := WinData.StripAllNomNumAlpha( WinData.LookUpDamSire.FieldByName('NatIDNum').AsString );
                             // Get the breed of the calf
                             if WinData.Breeds.Locate('ID', WinData.LookUpDamSire.FieldByName('PrimaryBreed').AsInteger,[] ) then
                                FieldByName('DamBreed').AsString := WinData.Breeds.FieldByName('PedigreeBreed').AsString;

                             // Get the Service for this Calf Lactation
                             if DonorDamID > 0 then
                                DamToUse := DamID; // check the service of receipient dam
                             WinData.CheckEvents.Filter := '(AnimalID = ' + VarToStr(DamToUse) + ') And (AnimalLactNo = ' + IntToStr(FieldbyName('LactNo').Value-1) + ') And (EventType = ' + IntToStr(CServiceEvent) + ')';
                             WinData.CheckEvents.Filtered := True;
                             if WinData.CheckEvents.FindLast then
                                begin
                                   FieldByName('DateOfService').AsDateTime := Windata.CheckEvents.FieldByName('EventDate').AsDateTime;
                                   FieldByName('AIDate').AsDateTime := FieldByName('DateOfService').AsDateTime;
                                   if WinData.LookUpServices.Locate('EventID',WinData.CheckEvents.FieldByName('ID').AsInteger,[] ) then
                                      if WinData.GenLookUp.Locate('ID',WinData.LookUpServices.FieldByName('ServiceType').ASInteger,[] ) then
                                         begin
                                            FieldByName('MethodOfService').AsString := WinData.GenLookUp.FieldByName('Description').AsString;
                                            FieldByName('ServiceType').AsString := WinData.GenLookUp.FieldByName('LookupCode').AsString;

                                            if FieldByName('ServiceType').AsString = 'ET' then
                                               begin
                                                  FieldByName('ETNO').AsString := TRIM(WinData.LookUpServices.FieldByName('ET1No').AsString);
                                                  FieldByName('ETRecipientEarNo').AsString := StripAllNomNumAlpha(RecipientTag);
                                               end
                                         end;
                                end
                             else
                                FieldByName('ServiceType').AsString := 'NS';

                             // Get the Calving
                             if LookUpCalvings.Locate('EventID',CalfTable.FieldbyName('EventID').AsInteger,[] ) then
                                begin
                                   if LookUpCalvings.FieldByName('ID1').Value <> NULL then
                                      Calf[1,1] := LookUpCalvings.FieldByName('ID1').Value
                                   else
                                      Calf[1,1] := 0;
                                   if LookUpCalvings.FieldByName('ID2').Value <> NULL then
                                      Calf[2,1] := LookUpCalvings.FieldByName('ID2').Value
                                   else
                                      Calf[2,1] := 0;
                                   if LookUpCalvings.FieldByName('ID3').Value <> NULL then
                                      Calf[3,1] := LookUpCalvings.FieldByName('ID3').Value
                                   else
                                      Calf[3,1] := 0;
                                   if LookUpCalvings.FieldByName('ID4').Value <> NULL then
                                      Calf[4,1] := LookUpCalvings.FieldByName('ID4').Value
                                   else
                                      Calf[4,1] := 0;
                                   NoOfCalves := 0;
                                   for x := 1 to 4 do
                                      if Calf[x,1] > 0 then
                                         Inc ( NoOfCalves );
                                   // Get the Sexes of the Calfs
                                   NoFemales := 0;
                                   NoMales := 0;
                                   for x := 1 to 4 do
                                      if Calf[x,1] > 0 then
                                         if CurrentID <> Calf[x,1] then
                                            if Windata.LookUpDamSire.Locate('ID',Calf[x,1],[] ) then
                                               begin
                                                  if UPPERCASE(WinData.LookUpDamSire.FieldByName('Sex').AsString) = 'FEMALE' then
                                                     begin
                                                        Calf[x,2] := 2;
                                                        Inc ( NoFemales );
                                                     end
                                                  else
                                                     begin
                                                        Calf[x,2] := 1;
                                                        Inc ( NoMales );
                                                     end;
                                               end;
                                   TwinDetails := '';
                                   if ( NoFemales = 1 ) And ( NoMales = 0 ) then
                                      TwinDetails := 'TH'
                                   else if ( NoMales = 1 ) And ( NoFemales = 0 ) then
                                      TwinDetails := 'TB'
                                   else if ( NoFemales = 2 ) And ( NoMales = 0 ) then
                                      TwinDetails := 'THH'
                                   else if ( NoMales = 2 ) And ( NoFemales = 0 ) then
                                      TwinDetails := 'TBB'
                                   else if ( NoFemales = 1 ) And ( NoMales = 1 ) then
                                      TwinDetails := 'THB';
                                   FieldByName('TwinDetails').AsString := TwinDetails;
                                   if WinData.GenLookUp.Locate('ID',LookUpCalvings.FieldByName('BirthType').AsInteger,[]) then
                                      FieldByName('CalvingSurvey').AsString := WinData.GenLookUp.FieldByName('Description').AsString;
                                end;

                             if WinData.LookUpDamSire.Locate('ID',SireID,[] ) then
                                begin
                                   FieldByName('SireID').AsInteger := WinData.LookUpDamSire.FieldByName('ID').AsInteger;
                                   if WinData.LookUpDamSire.FieldByName('HerdBookNo').AsString <> '' then
                                      FieldByName('SireHBN').AsString := PadLeft(WinData.LookUpDamSire.FieldByName('HerdBookNo').AsString,'0',12);
                                   FieldByName('SireFullName').AsString := WinData.LookUpDamSire.FieldByName('Name').AsString;
                                   FieldByName('SireEarMark').AsString := StripAllNomNumAlpha(WinData.LookUpDamSire.FieldByName('NatIDNum').AsString);
                                   // Get the breed of the calf
                                   if WinData.Breeds.Locate('ID', WinData.LookUpDamSire.FieldByName('PrimaryBreed').AsInteger,[] ) then
                                      FieldByName('SireBreed').AsString := WinData.Breeds.FieldByName('PedigreeBreed').AsString;
                                end;

                             if DonorDamID > 0 then
                                if WinData.LookUpDamSire.Locate('ID',DamID,[] ) then
                                   FieldByName('ETRecipientEarNo').AsString := StripAllNomNumAlpha(WinData.LookUpDamSire.FieldByName('NatIDNum').AsString);

                             if WinData.DefCountry(StrToInt(Herd.Value)) = Ireland then
                                FieldByName('Batch_Country').AsString := 'IR'
                             else
                                FieldByName('Batch_Country').AsString := 'UK';

                             tTagNo := Trim(WinData.StripAllNomNumAlpha(FieldByName('CalfEarNo').AsString));
                             if tTagNo <> '' then
                                begin
                                   if Pos(HerdIdentifier, tTagNo) > 0 then
                                      begin
                                         System.Delete(tTagNo, Pos(HerdIdentifier, tTagNo), Length(HerdIdentifier));
                                         if Copy(tTagNo,1,2) = 'IE' then
                                            begin
                                               System.Delete(tTagNo, 1,2);
                                               if ( Copy(HerdIdentifier, 1,2) <> 'IE' ) then
                                                  HerdIdentifier := 'IE' + HerdIdentifier;
                                            end
                                         else if Copy(tTagNo,1,3) = 'UK9' then
                                            begin
                                               System.Delete(tTagNo, 1,3);
                                               HerdIdentifier := 'UK9' + HerdIdentifier;
                                            end
                                         else if Copy(tTagNo,1,4) = 'UK 9' then
                                            begin
                                               System.Delete(tTagNo, 1,4);
                                               HerdIdentifier := 'UK9' + HerdIdentifier;
                                            end
                                         else if Copy(tTagNo,1,2) = 'UK' then
                                            begin
                                               System.Delete(tTagNo, 1,4);
                                               HerdIdentifier := 'UK' + HerdIdentifier;
                                            end;
                                      end;
                                   FieldByName('EarTag_Prefix').AsString := HerdIdentifier;
                                   FieldByName('EarTag_Suffix').AsString := tTagNo;
                                end;

                             WinData.LookUpDamSire.GotoBookmark(OriginalAnimal);
                             WinData.LookUpDamSire.FreeBookmark(OriginalAnimal);
                             Post;
                          end;
                    end;
           if UsedAnimal then
              CalfTable.Next
           else
              CalfTable.Delete;
        except
           on e : exception do
              begin
                 ShowMessage(E.Message + ' ---- '+ WinData.LookUpDamSire.FieldByName('Name').Value);
                 SysUtils.Abort;
              end;
        end;
  finally
    // WinData.Breeds.Close;
  //   WinData.GenLookUp.Close;
     CalfTable.Refresh;
     CalfTable.EnableControls;
     CalfGrid.SelectedRows.Clear;
     NoCalves.Text := IntToStr(CalfTable.RecordCount);
     Screen.Cursor := crDefault;
  end;
end;

procedure TfHFSCalfReg.bCreateFileClick(Sender: TObject);
{Var
   eMailDir : String;
   RegFile : TextFile;
   ItemCount : Integer;
   CurrDate,
   Buffer  : String;

   Function StripCommas ( StrToStrip : String ) : String;
   var
      i,
      LenOfStr : Integer;
      TempStr  : String;
   begin
      TempStr := StrToStrip;
      LenOfStr := Length ( TempStr );
      if LenOfStr > 0 then
         for i := 1 to LenOfStr do
            if TempStr[i] = ',' then
               Delete(TempStr,i,1);

      Result := TempStr;
   end;
 }
begin


{     CalfTable.First;
     // Only run if there are animals to register
     if CalfTable.RecordCount > 0 then
        begin
           // Create the File as REG + Todays Date + .CSV.
           try
              eMailDir := 'C:\Windows\DeskTop\HFS Registration e-mail';
              mkDir (eMailDir);
           except
              // Directory already exists
           end;

           try
              CurrDate := FormatDateTime('ddmmmyyyy',Now());

              eMailDir := eMailDir +  '\Reg' + CurrDate + '.CSV';
              AssignFile(RegFile, eMailDir );
              ReWrite(RegFile);
              ItemCount := 1;
              // Out put the Contents of the Grid to File.
              CalfTable.First;

              while ( NOT CalfTable.EOF ) do
                 begin
                    ItemCount := 1;
                    while ItemCount <= 20 do
                       begin
                          Buffer := '';
                          case ItemCount of
                             1  : Buffer := 'Herd Prefix';
                             2  : Buffer := 'HFS PIN Number';
                             3  : Buffer := 'Calf Birth Date';
                             4  : Buffer := 'Dam full Name';
                             5  : Buffer := 'Dam HBN';
                             6  : Buffer := 'Dam ear tag number';
                             7  : Buffer := 'Sire HBN';
                             8  : Buffer := 'Sire full name';
                             9  : Buffer := 'Semen Obtained from';
                             10 : Buffer := 'Sex of the Calf';
                             11 : Buffer := 'Method of service';
                             12 : Buffer := 'ET Collection form no.(ET1)';
                             13 : Buffer := 'Recipient ear tag no';
                             14 : Buffer := 'Date of service';
                             15 : Buffer := 'Calf full name';
                             16 : Buffer := 'Twin details';
                             17 : Buffer := 'Calf ear tag number';
                             18 : Buffer := 'Calf line number';
                             19 : Buffer := 'Red marker';
                             20 : Buffer := 'Calving survey';
                          end;

                          // Transfer the Calf details to File.
                          if ItemCount-1 in [0..1,3..12,14..19] then
                             Buffer := Buffer + ',' + StripCommas(CalfTable.Fields[ItemCount-1].AsString)
                          else if CalfTable.Fields[ItemCount-1].AsDateTime > 0 then
                             Buffer := Buffer + ',' + FormatDateTime('dd/mm/yyyy',CalfTable.Fields[ItemCount-1].AsDateTime)
                          else
                             Buffer := Buffer + ',' + ' ';
                          Inc(ItemCount);
                          // Write a Line
                          WriteLn(RegFile,Buffer);
                       end;
                       CalfTable.Next;
                       if NOT CalfTable.EOF then
                          begin
                             WriteLn(RegFile,' ');
                             WriteLn(RegFile,'NEXT CALF');
                             WriteLn(RegFile,' ');
                          end;
                 end;
              CloseFile(RegFile);
              MarkAsRegistered;
           except
              // directory already exists or Disk is Full
           end;
        end
     else
        MessageDLG('No Calves to Register',mtinformation,[mbOK],0); }
end;

procedure TfHFSCalfReg.MarkAsRegistered;
begin
   { Process all messages in Q. MenuForm will not redraw
     properly until all process have be completed.  }
   Application.ProcessMessages;
   if MessageDLG('Mark the Animals as Registered',mtWarning,[mbYes,MbNo],0) = mrYes then
      begin
         with MyQuery do
            begin
               SQL.Clear;
               SQL.Add('UPDATE CalfReg');
               SQL.Add('SET Notified=TRUE');
               ExecSQL;
               SQL.Clear;
               SQL.Add('SELECT * FROM CalfReg');
               SQL.Add('WHERE Notified=TRUE');
               Open;
               First;
               while NOT EOF do
                  begin
                     if LookUpCalvings.Locate('EventId',FieldByName('EventId').Value,[] ) then
                        begin
                           if ( LookUpCalvings.FieldByName('ID1').AsInteger = FieldByName('AnimalID').AsInteger ) then
                              begin
                                 LookUpCalvings.Edit;
                                 LookUpCalvings.FieldByName('ID1HFSNotified').AsBoolean := TRUE;
                                 LookUpCalvings.Post;
                              end;
                           if ( LookUpCalvings.FieldByName('ID2').AsInteger = FieldByName('AnimalID').AsInteger ) then
                              begin
                                 LookUpCalvings.Edit;
                                 LookUpCalvings.FieldByName('ID2HFSNotified').AsBoolean := TRUE;
                                 LookUpCalvings.Post;
                              end;
                           if ( LookUpCalvings.FieldByName('ID3').AsInteger = FieldByName('AnimalID').AsInteger ) then
                              begin
                                 LookUpCalvings.Edit;
                                 LookUpCalvings.FieldByName('ID3HFSNotified').AsBoolean := TRUE;
                                 LookUpCalvings.Post;
                              end;
                           if ( LookUpCalvings.FieldByName('ID4').AsInteger = FieldByName('AnimalID').AsInteger ) then
                              begin
                                 LookUpCalvings.Edit;
                                 LookUpCalvings.FieldByName('ID4HFSNotified').AsBoolean := TRUE;
                                 LookUpCalvings.Post;
                              end;
                        end;
                     Next;
                  end;
            end;
      end;
end;

procedure TfHFSCalfReg.CalfGridDblClick(Sender: TObject);
begin
   // if records available then show edit screen
   //uCalfRegEdit.ShowForm;
end;

procedure TfHFSCalfReg.bRemCalfClick(Sender: TObject);
var
  bFound : Boolean;
  i : Integer;
  LookupCalvings : TTable;
  IDArray : Array of Integer;
  procedure RegisterCalf;
  begin
     bFound := False;
     with CalfGrid.DataSource.Dataset do
        if LookUpCalvings.Locate('EventId', FieldByName('EventId').Value,[] ) then
           begin
              if ( LookUpCalvings.FieldByName('ID1').AsInteger = FieldByName('AnimalID').AsInteger ) then
                 try
                    LookUpCalvings.Edit;
                    LookUpCalvings.FieldByName('ID1HFSNotified').AsBoolean := TRUE;
                    LookUpCalvings.Post;
                    DbiSaveChanges(LookUpCalvings.Handle);
                    bFound := True;
                 except
                    LookUpCalvings.Cancel;
                    MessageDlg(cCalvingTableUpdateFailure,mtError,[mbOK],0);
                 end
              else if ( LookUpCalvings.FieldByName('ID2').AsInteger = FieldByName('AnimalID').AsInteger ) then
                 try
                    LookUpCalvings.Edit;
                    LookUpCalvings.FieldByName('ID2HFSNotified').AsBoolean := TRUE;
                    LookUpCalvings.Post;
                    DbiSaveChanges(LookUpCalvings.Handle);
                    bFound := True;
                 except
                    LookUpCalvings.Cancel;
                    MessageDlg(cCalvingTableUpdateFailure,mtError,[mbOK],0);
                 end
              else if ( LookUpCalvings.FieldByName('ID3').AsInteger = FieldByName('AnimalID').AsInteger ) then
                 try
                    LookUpCalvings.Edit;
                    LookUpCalvings.FieldByName('ID3HFSNotified').AsBoolean := TRUE;
                    LookUpCalvings.Post;
                    bFound := True;
                    DbiSaveChanges(LookUpCalvings.Handle);
                    bFound := True;
                 except
                    LookUpCalvings.Cancel;
                    MessageDlg(cCalvingTableUpdateFailure,mtError,[mbOK],0);
                 end
              else if ( LookUpCalvings.FieldByName('ID4').AsInteger = FieldByName('AnimalID').AsInteger ) then
                 try
                    LookUpCalvings.Edit;
                    LookUpCalvings.FieldByName('ID4HFSNotified').AsBoolean := TRUE;
                    LookUpCalvings.Post;
                    DbiSaveChanges(LookUpCalvings.Handle);
                    bFound := True;
                 except
                    LookUpCalvings.Cancel;
                    MessageDlg(cCalvingTableUpdateFailure,mtError,[mbOK],0);
                 end;

              // 29/01/2009 [V3.9 R5.8] /SP Additional Feature - Allow user to permanently remove calves from registration
              SetLength(IDArray, Length(IDArray)+1);
              if bFound then
                 begin
                    IDArray[Length(IDArray)-1] := CalfGrid.DataSource.Dataset.FieldByName('ID').AsInteger;
                 end;
           end;
  end;

begin
   if MessageDlg('Do you want to permanently remove calf record(s)?',mtConfirmation,[mbyes,mbNo],0) = idYes then
      begin

         // 29/01/2009 [V3.9 R5.8] /SP Additional Feature - Allow user to permanently remove calves from registration

         WinData.CreateTTable(  LookupCalvings, nil, '', WinData.Calvings.TableName);
         LookupCalvings.Active := True;
         try
            if CalfGrid.SelectedRows.Count > 0 then    // register all selected records.
               begin
                  for i := 0 to CalfGrid.SelectedRows.Count -1 do
                     begin
                        if CalfGrid.DataSource.DataSet.BookmarkValid(pointer(CalfGrid.SelectedRows.Items[i])) then
                           begin
                              CalfGrid.DataSource.DataSet.GotoBookmark(pointer(CalfGrid.SelectedRows.Items[i]));
                              RegisterCalf;
                           end;
                     end;
               end;
              with TQuery.Create(nil) do
                 try
                    DatabaseName := AliasName;
                    SQL.Add('Delete ');
                    SQL.Add(InsertFrom(['CalfReg']));
                    SQL.Add(InsertWhere(['ID'], [IntArrayToSQLInString(IDArray)], opIN));
                    ExecSQL;
                 finally
                    Free;
                 end;

              CalfGrid.SelectedRows.Clear;
              CalfGrid.DataSource.DataSet.Refresh;
              CalfGrid.DataSource.DataSet.First;
         finally
            LookupCalvings.Active := False;
            FreeAndNil(LookupCalvings);
         end;
      end
   else if CalfTable.RecordCount > 0 then
      begin
         CalfGrid.SelectedRows.Delete;
      end;
   NoCalves.Text := IntToStr( CalfTable.RecordCount );
end;

procedure TfHFSCalfReg.HerdChange(Sender: TObject);
begin
   if FFormShowing then
      LoadCalvesClick(Sender);
end;

procedure TfHFSCalfReg.Label1Click(Sender: TObject);
begin
   Messagedlg(' Calves can be registered with HUK on their'+#13+
              'Freephone telephone number : 0800 9808 565'+#13+
              '           between 8am and 5pm'+#13#13+
              'To do this a PIN number must first be obtained'+#13+
              '      by calling the IHFA on 023 33443 or'+#13+
              '            0800 980 8565',mtInformation,[mbOK],0);
end;

procedure TfHFSCalfReg.sbHelpClick(Sender: TObject);
begin
   WinData.HTMLHelp('hfsregrpt.htm');
end;

procedure TfHFSCalfReg.RegisterCalvesOnly1Click(Sender: TObject);
begin
   Update;

   if ( CalfTable.RecordCount <= 0 ) then
     begin
        MessageDlg('There are no records to be registered at this time.',mtInformation,[mbOK],0);
        Exit;
     end;


   CheckAIDates;
   bConnected := IsNetConnected;
   if not bConnected then
      ShowConnectForm(bConnected);

   if bConnected then
      begin
         if not LoginRequired then
            begin
               OutputXML;
            end
         else
            begin
               if not THUKIRegistrationLogin.CalfRegistrationLogin then
                  begin
                     Update;
                     MessageDlg('HUK Calf Registration login failed.',mtError,[mbOK],0);
                  end
               else
                  begin
                     Update;
                     LoginTimer.Enabled := True;
                     LoginRequired := False;
                     OutputXML;
                  end;
            end;
      end
   else
      MessageDlg(cINTERNET_CONNECTION_NOT_ESTABLISHED,mtError,[mbOK],0);

end;

procedure TfHFSCalfReg.PrintCalves;
begin
   try
      qPrintCalves.Open;
      try
         with TfPrintHUKICalfReg.Create(nil) do
            begin
               VerLabel.Caption    := 'Herd Management ' + HerdVerNo;
               lHerdPrefix.Caption := HerdPrefix;
               lHFSPinNo.Caption   := HFSPinNo.Text;
               lCount.Caption      := 'Number of Calves Registered: '+NoCalves.Text;
               QuickRep1.DataSet   := qPrintCalves;
               QuickRep1.Preview;
            end;
      except
        //
      end;
   finally
      qPrintCalves.Close;
      fPrintHUKICalfReg.Free;
   end;
end;

procedure TfHFSCalfReg.RegisterPrintCalves1Click(Sender: TObject);
begin
   PrintCalves;
   MarkAsRegistered;
end;

procedure TfHFSCalfReg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if QueryRegCalves.Active then
      QueryRegCalves.Active := False;
   MyQuery.Close;
   CalfTable.Close;
   CalfTable.DeleteTable;
   CalfTable.Free;
   CalfSource.Free;
end;

procedure TfHFSCalfReg.FormShow(Sender: TObject);
begin
   Update;   // Ensure the Form is Painted before Altering the Herd ID
   Herd.Value := IntToStr(WinData.UserDefaultHerdID);
   WinData.UpdateRecentReportUsage(cHUKIRegRep);
   {

   Messagedlg(' Calves can be registered with HUKI on their'+#13+
              'Freephone telephone number : 1800 553 653'+#13+
              '           between 8am and 5pm'+#13#13+
              'To do this a PIN number must first be obtained'+#13+
              '      by calling the IHFA on 023 33443 or'+#13+
              '            0800 980 8565',mtInformation,[mbOK],0);

   }
end;

procedure TfHFSCalfReg.OutputXML;

   function DateTimeToHUKIDateStrFormat(ADate : TDateTime) : String;
   var
      Year, Month, Day : ShortString;
   begin
      Result := '';
      if ADate > 0 then
         begin
            GetDate_Values(ADate, Year, Month, Day);
            Result := Year + PadLeft(Month, '0', 2) + PadLeft(Day, '0', 2);
         end;
   end;

var
   MyXMLHTTP     : IXMLHTTPRequest;
   MyDOMDocument : IXMLDOMDocument;
   XMLDOMNodeList : IXMLDOMNodeList;
   XMLDOMNode, CalfRegXMLDOMNode, AnimalXMLDOMNode, AnimalDetailXMLDOMNode : IXMLDOMNode;
   ProcInstr : IXMLDOMProcessingInstruction; // XML declaration

   XMLResponse : WideString;
   HUKIResponseValue : Integer;
   HUKIResponseText : String;
   FileRecCount, i, Len : Integer;
   f : string;
begin
   with CalfTable do
   begin
      CalfTable.First;
      while ( NOT CalfTable.EOF ) do
         begin
            if not(FieldByName('Ignore').AsBoolean) then
               SendViaXMLHTTP;
            CalfTable.Next;
         end;
   end;
   LoadCalvesClick(sbLoad);
end;

function TfHFSCalfReg.GetFileName(const IsReponse : Boolean=False) : String;
var
   i : Integer;
   bFileExists : Boolean;
   f : String;
begin
   ForceApplicationDirectories('HUKI Calf Registration');
   i := 1;
   repeat
      if IsReponse then
         f := Format(ApplicationPath+'HUKI Calf Registration\HUKICalfReg Response %s #%d.xml',[FormatDateTime('dd mm yy',Date), i])
      else
         f := Format(ApplicationPath+'HUKI Calf Registration\HUKICalfReg %s #%d.xml',[FormatDateTime('dd mm yy',Date), i]);
      bFileExists := FileExists(f);
      Inc(i);
   until
      bFileExists = False;
   Result := f;
end;

procedure TfHFSCalfReg.SendViaXMLHTTP;
   function DateTimeToHUKIDateStrFormat(ADate : TDateTime) : String;
   var
      Year, Month, Day : ShortString;
   begin
      Result := '';
      if ADate > 0 then
         begin
            GetDate_Values(ADate, Year, Month, Day);
            Result := Year + PadLeft(Month, '0', 2) + PadLeft(Day, '0', 2);
         end;
   end;
var
   MyXMLHTTP     : IXMLHTTPRequest;
   MyDOMDocument : IXMLDOMDocument;
   XMLDOMNodeList : IXMLDOMNodeList;
   XMLDOMNode, CalfRegXMLDOMNode, AnimalXMLDOMNode, AnimalDetailXMLDOMNode : IXMLDOMNode;
   ProcInstr : IXMLDOMProcessingInstruction; // XML declaration
   XMLResponse : WideString;
   HUKIResponseValue : Integer;
   HUKIResponseText : String;
   AcceptCode, Breed, HBN : String;
   FileRecCount, i, Len : Integer;
   f : string;
   CalfAnimalNo : String;
   CalfTagNumber : String;
begin

   MyDOMDocument := CreateOleObject('MSXML2.DOMDocument') as IXMLDOMDocument;
   ProcInstr := MyDOMDocument.createProcessingInstruction('xml', 'version="1.0" encoding="UTF-8"'); // encoding="UTF-8"');
   MyDOMDocument.appendChild(ProcInstr);// Add XML Declaration
   CalfRegXMLDOMNode := MyDOMDocument.createElement('CalfRegistration'); // Create Root Node
   MyDOMDocument.appendChild(CalfRegXMLDOMNode); // Add Root Node

   with CalfTable do
     begin
        CalfAnimalNo := FieldByName('CalfNo').AsString;
        CalfTagNumber := FieldByName('CalfEarNo').AsString;

        AnimalXMLDOMNode := MyDOMDocument.createElement('Animal'); // Create Animal Node
        CalfRegXMLDOMNode.appendChild(AnimalXMLDOMNode); // Add Animal Node

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('DOB');
        if DateTimeToHUKIDateStrFormat(FieldByName('CalfDOB').AsDateTime) <> '' then
           AnimalDetailXMLDOMNode.text := DateTimeToHUKIDateStrFormat(FieldByName('CalfDOB').AsDateTime);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('Name');
        if TRIM(FieldByName('CalfNamePrefixExcluded').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := Trim(FieldByName('CalfNamePrefixExcluded').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('SerialNo');
        if TRIM(FieldByName('SerialNo').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := Trim(FieldByName('SerialNo').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('EarTagPrefix');
        if TRIM(FieldByName('EarTag_Prefix').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := Trim(FieldByName('EarTag_Prefix').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('EarTagSuffix');
        if TRIM(FieldByName('EarTag_Suffix').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := Trim(FieldByName('EarTag_Suffix').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('LineNo');
        if TRIM(CalfAnimalNo) <> '' then
           AnimalDetailXMLDOMNode.text := Trim(CalfAnimalNo);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('Service');
        if TRIM(FieldByName('ServiceType').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := Trim(FieldByName('ServiceType').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('AIDate');
        if DateTimeToHUKIDateStrFormat(FieldByName('AIDate').AsDateTime) <> '' then
           AnimalDetailXMLDOMNode.text := DateTimeToHUKIDateStrFormat(FieldByName('AIDate').AsDateTime);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('ETNo');
        if TRIM(FieldByName('ETNo').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := TRIM(FieldByName('ETNo').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('ETEarmark');
        if TRIM(FieldByName('ETRecipientEarNo').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := TRIM(FieldByName('ETRecipientEarNo').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('Sex');
        if TRIM(FieldByName('Sex').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := Trim(FieldByName('Sex').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('Twin');
        if TRIM(FieldByName('TwinDetails').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := TRIM(FieldByName('TwinDetails').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('Calving');
        AnimalDetailXMLDOMNode.text := '';
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('Red');
        if TRIM(FieldByName('Red').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := FieldByName('Red').AsString;
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('SirePrefix');
        if TRIM(FieldByName('SirePrefix').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := TRIM(FieldByName('SirePrefix').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('SireName');
        if TRIM(FieldByName('SireFullName').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := TRIM(FieldByName('SireFullName').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('SireSerialNo');
        if TRIM(FieldByName('SireSerialNo').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := TRIM(FieldByName('SireSerialNo').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('SireHBN');
        if TRIM(FieldByName('SireHBN').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := TRIM(FieldByName('SireHBN').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('SireBreed');
        if TRIM(FieldByName('SireBreed').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := TRIM(FieldByName('SireBreed').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('SireHBNFlag');
        if TRIM(FieldByName('SireHBNFlag').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := TRIM(FieldByName('SireHBNFlag').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('SireSRCode');
        if TRIM(FieldByName('SireSRCode').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := TRIM(FieldByName('SireSRCode').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('SireEarMark');
        if TRIM(FieldByName('SireEarMark').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := TRIM(FieldByName('SireEarMark').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('DamPrefix');
        if ( TRIM(FieldByName('DamNamePrefixExcluded').AsString) <> '' ) then
           AnimalDetailXMLDOMNode.text := TRIM(FieldByName('HerdPrefix').AsString)
        else if TRIM(FieldByName('DamPrefix').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := TRIM(FieldByName('DamPrefix').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('DamName');
        if ( TRIM(FieldByName('DamNamePrefixExcluded').AsString) <> '' ) then
           AnimalDetailXMLDOMNode.text := TRIM(FieldByName('DamNamePrefixExcluded').AsString)
        else if ( TRIM(FieldByName('DamFullName').AsString) <> '' ) then
           AnimalDetailXMLDOMNode.text := TRIM(FieldByName('DamFullName').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('DamSerialNo');
        if TRIM(FieldByName('DamSerialNo').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := TRIM(FieldByName('DamSerialNo').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('DamHBN');
        if TRIM(FieldByName('DamHBN').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := TRIM(FieldByName('DamHBN').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('DamBreed');
        if TRIM(FieldByName('DamBreed').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := TRIM(FieldByName('DamBreed').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('DamHBNFlag');
        if TRIM(FieldByName('DamHBNFlag').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := TRIM(FieldByName('DamHBNFlag').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('DamSRCode');
        if TRIM(FieldByName('DamSRCode').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := TRIM(FieldByName('DamSRCode').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('DamEarmark');
        if TRIM(FieldByName('DamEarMark').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := TRIM(FieldByName('DamEarMark').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('IgnoreErrors');
        AnimalDetailXMLDOMNode.text := '0';
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('Passport');
        AnimalDetailXMLDOMNode.text := 'N';
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('Pedigree');
        AnimalDetailXMLDOMNode.text := 'Y';
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('CPH'); // ?????
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('CPHSuffix');
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('CPHAlt'); // ?????
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('CPHAltSuffix');
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('BatchCountry');
        if TRIM(FieldByName('Batch_Country').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := Trim(FieldByName('Batch_Country').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('BCMSBreed'); // ?????
        if TRIM(FieldByName('CalfBreedCode').AsString) <> '' then
           AnimalDetailXMLDOMNode.text := Trim(FieldByName('CalfBreedCode').AsString);
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);

        AnimalDetailXMLDOMNode := MyDOMDocument.createElement('ElectronicID'); // ?????
        AnimalXMLDOMNode.appendChild(AnimalDetailXMLDOMNode);
     end;

   MyXMLHTTP := CreateOleObject('MSXML2.XMLHTTP.3.0') as IXMLHTTPRequest;
// Test Server   MyXMLHTTP.open('POST', 'http://195.153.22.94/CalfRegistration/AddAnimalXML.asp', FALSE, EmptyParam, EmptyParam);
   MyXMLHTTP.open('POST', 'http://'+HUKINewServerIPAdd+'/CalfRegistration/AddAnimalXML.asp', FALSE, EmptyParam, EmptyParam);
   MyXMLHTTP.Send(MyDOMDocument);

   if ( MyXMLHTTP.Status = 200 ) then
      begin
         XMLResponse := MyXMLHTTP.responseText;
      end
   else
      begin
         ShowMessage('Error: ' + IntToStr( MyXMLHTTP.Status ) + ' - ' + MyXMLHTTP.statusText);
         SysUtils.Abort;
      end;

   HUKIResponseValue := -1;
   HUKIResponseText := '';

   f := GetFileName;
   MyDOMDocument.Save(f);

   if XMLResponse <> '' then
      begin
         MyDOMDocument.loadXML(XMLResponse);
         f := GetFileName(True);
         MyDOMDocument.Save(f);


         if MyDOMDocument.documentElement <> nil then
            begin
               if ( MyDOMDocument.documentElement.childNodes.Get_length > 0 ) then
                  begin
                     for i := 0 to MyDOMDocument.documentElement.childNodes.Get_length-1 do
                        begin
                           if MyDOMDocument.documentElement.childNodes[i].Get_nodeName = 'RC' then
                              begin
                                 XMLDOMNode := MyDOMDocument.documentElement.childNodes[i].attributes.getNamedItem('VALUE');
                                 try
                                    HUKIResponseValue := StrToInt(XMLDOMNode.text);
                                 except
                                 end;
                              end
                           else if MyDOMDocument.documentElement.childNodes[i].Get_nodeName = 'STRMSG' then
                              begin
                                 XMLDOMNode := MyDOMDocument.documentElement.childNodes[i].attributes.getNamedItem('VALUE');
                                 try
                                    HUKIResponseText := XMLDOMNode.text;
                                 except
                                 end;
                              end
                           else if MyDOMDocument.documentElement.childNodes[i].Get_nodeName = 'BreedCode' then
                              begin
                                 XMLDOMNode := MyDOMDocument.documentElement.childNodes[i];
                                 try
                                    Breed := Trim(XMLDOMNode.text);
                                 except
                                 end;
                              end
                           else if MyDOMDocument.documentElement.childNodes[i].Get_nodeName = 'HBN' then
                              begin
                                 XMLDOMNode := MyDOMDocument.documentElement.childNodes[i];
                                 try
                                    HBN := Trim(XMLDOMNode.text);
                                 except
                                 end;
                              end
                           else if MyDOMDocument.documentElement.childNodes[i].Get_nodeName = 'ACCEPTCODE' then
                              begin
                                 XMLDOMNode := MyDOMDocument.documentElement.childNodes[i].attributes.getNamedItem('VALUE');
                                 try
                                    AcceptCode := XMLDOMNode.text;
                                 except
                                 end;
                              end;
                        end;
                  end;

               XMLDOMNode := MyDOMDocument.documentElement;
               XMLDOMNodeList := XMLDOMNode.selectNodes('ERROR');
               if XMLDOMNodeList.length > 0 then
                  begin
                     fmHUKICalfRegErrorReview := TfmHUKICalfRegErrorReview.Create(nil);
                     fmHUKICalfRegErrorReview.AddAnimalID(CalfAnimalNo, CalfTagNumber, CalfTable.FieldByName('DamID').asInteger, CalfTable.FieldByName('SireID').AsInteger);
                     Len := XMLDOMNodeList.Get_length;
                     for i := 0 to Len - 1 do begin
                       if XMLDOMNodeList.item[i].nodeName = 'ERROR' then
                          //   18/09/12 [V5.0 R9.9] /MK Bug Fix - 16 digit string value not allowed to be passed to an Integer value, try/except to fix this error.
                          try
                             fmHUKICalfRegErrorReview.AddError(StrToInt(XMLDOMNodeList.item[i].childNodes.item[0].text),XMLDOMNodeList.item[i].childNodes.item[1].text);
                          except

                          end;
                     end;

                     if fmHUKICalfRegErrorReview.mdHUKIErrors.RecordCount > 0 then
                        begin
                           MessageDlg('There have been errors registering animal "'+ CalfTagNumber +'"'+#13#10+#13#10+
                                      'Click OK to review these errors.',mtWarning,[mbOK],0);
                           fmHUKICalfRegErrorReview.ShowModal;
                        end;
                   end
               else
                  begin
                     MarkAsRegistered( CalfTable.FieldByName('EventID').AsInteger, CalfTable.FieldByName('AnimalID').AsInteger );
                     PostToHUKICalfReg(CalfTable.FieldByName('AnimalID').AsInteger, AcceptCode, Breed, HBN);
                     if TRIM(CalfAnimalNo) <> '' then
                        MessageDlg( CalfAnimalNo + ' / ' + CalfTagNumber +' - Successfully registered',mtInformation,[mbOK],0)
                     else
                        MessageDlg( CalfTagNumber +' - Successfully registered',mtInformation,[mbOK],0)
                  end;
            end
         else
            MessageDlg('IXMLHTTPRequest.responseText - Missing IXMLDOMDocument.documentElement.',mtError,[mbOK],0);
      end
   else
      begin
         MessageDlg('IXMLHTTPRequest.Response - Missing Data Packet.',mtError,[mbOK],0);
      end;
end;

procedure TfHFSCalfReg.LoginTimerTimer(Sender: TObject);
begin
   LoginTimer.Enabled := False;
   LoginRequired := True;
end;

procedure TfHFSCalfReg.MarkAsRegistered(const EventID, CalfID : Integer);
begin
   { Process all messages in Q. MenuForm will not redraw
     properly until all process have be completed.  }
   if LookUpCalvings.Locate('EventId',EventId,[] ) then
      begin
         if ( LookUpCalvings.FieldByName('ID1').AsInteger = CalfID ) then
            begin
               LookUpCalvings.Edit;
               LookUpCalvings.FieldByName('ID1HFSNotified').AsBoolean := TRUE;
               LookUpCalvings.Post;
            end
         else if ( LookUpCalvings.FieldByName('ID2').AsInteger = CalfID ) then
            begin
               LookUpCalvings.Edit;
               LookUpCalvings.FieldByName('ID2HFSNotified').AsBoolean := TRUE;
               LookUpCalvings.Post;
            end
         else if ( LookUpCalvings.FieldByName('ID3').AsInteger = CalfID ) then
            begin
               LookUpCalvings.Edit;
               LookUpCalvings.FieldByName('ID3HFSNotified').AsBoolean := TRUE;
               LookUpCalvings.Post;
            end
         else if ( LookUpCalvings.FieldByName('ID4').AsInteger = CalfID ) then
            begin
               LookUpCalvings.Edit;
               LookUpCalvings.FieldByName('ID4HFSNotified').AsBoolean := TRUE;
               LookUpCalvings.Post;
            end;
      end;
end;

procedure TfHFSCalfReg.PostToHUKICalfReg(const CalfID : Integer; AcceptCode : String;
  const Breed, HBN : String);
var
   HUKIBreedID : Integer;
   tHBN : String;
begin

//   ShowMessage('Calf ID: '+IntToStr(CalfID) + ', Accept Code: '+ AcceptCode +', Breed Code: ' + Breed +', HerdBook No: ' + HBN);

   HUKICalfReg.Append;
   HUKICalfReg.FieldByName('CalfID').AsInteger := CalfID;
   HUKICalfReg.FieldByName('AcceptCode').AsString := AcceptCode;
   HUKICalfReg.FieldByName('BreedCode').AsString := Breed;
   HUKICalfReg.FieldByName('HBN').AsString := HBN;
   HUKICalfReg.FieldByName('RegDate').AsDateTime := Date;
   HUKICalfReg.Post;
   DBIForceWrite(HUKICalfReg);

   // Update Animal Table.

   if WinData.AnimalFileByID.Locate('ID',CalfID,[]) then
      begin

         if ( HBN <> '' ) then
            begin
               WinData.AnimalFileByID.Edit;
               try
                  tHBN := HBN;
                  while Length(tHBN) > 0 do
                     begin
                        if Copy(tHBN, 1, 1) = '0' then
                           Delete(tHBN, 1, 1)
                        else
                           Break;
                     end;

                  WinData.AnimalFileByIDHerdBookNo.AsString :=  tHBN;
                  WinData.AnimalFileByID.Post;
               except
                  WinData.AnimalFileByID.Cancel;
                  MessageDlg('Animals.HerdBookNo update failed.',mtError,[mbOK],0);
               end;
            end;

         if ( Breed <> '' ) then
            begin
               HUKIBreedID := GetBreedID(Breed);

               if HUKIBreedID <> WinData.AnimalFileByIDPrimaryBreed.AsInteger then
                  begin
                     WinData.AnimalFileByID.Edit;
                     try
                        WinData.AnimalFileByIDPrimaryBreed.AsInteger := HUKIBreedID;
                        WinData.AnimalFileByID.Post;
                     except
                        WinData.AnimalFileByID.Cancel;
                        MessageDlg('Animals.Breed update failed.',mtError,[mbOK],0);
                     end;
                  end;
            end;
      end;
end;

function TfHFSCalfReg.GetBreedID(ACode: String): Integer;
begin
   Result := 0;
   if WinData.Breeds.Locate('PedigreeBreed', ACode, []) then
      Result := WinData.BreedsID.AsInteger
   else
      begin
         MessageDlg('Pedigree breed code %s was not found in the breed database',mtwarning,[mbOK],0); // might show error message ***
      end;
end;

procedure TfHFSCalfReg.sbNameSerialNosClick(Sender: TObject);
{var
   MyXMLHTTP     : IXMLHTTPRequest;
   XMLResponse : String;}
var
   LogIn : Boolean;
begin
   LogIn := LoginRequired;
   TfmHUKINameSerialNoViewer.ShowForm(LogIn);
(*   if LoginRequired then
      begin
         if not THUKIRegistrationLogin.CalfRegistrationLogin then
            begin
               Update;
               MessageDlg('HUK Calf Registration login failed.',mtError,[mbOK],0);
            end
         else
            begin
               LoginTimer.Enabled := True;
               LoginRequired := False;
            end;
      end;

   if not LoginRequired then // logged on
      begin
         MyXMLHTTP := CreateOleObject('MSXML2.XMLHTTP.3.0') as IXMLHTTPRequest;
// Test Server         MyXMLHTTP.open('POST', 'http://195.153.22.94/CalfRegistration/MaxSerNoList.asp', FALSE, EmptyParam, EmptyParam);
         MyXMLHTTP.open('POST', 'http://'+HUKIServerIPAdd+'/CalfRegistration/MaxSerNoList.asp', FALSE, EmptyParam, EmptyParam);

         MyXMLHTTP.Send(EmptyParam);

         if ( MyXMLHTTP.Status = 200 ) then
            begin
               XMLResponse := MyXMLHTTP.responseText;
            end
         else
            begin
               ShowMessage('Error: ' + IntToStr( MyXMLHTTP.Status ) + ' - ' + MyXMLHTTP.statusText);
               SysUtils.Abort;
            end;

         if XMLResponse <> '' then
            begin
               TfmHUKINameSerialNoViewer.ShowForm(XMLResponse);
            end
         else
            ShowMessage('Unexpected response from HUK Server.');
      end;
      *)
end;


procedure TfHFSCalfReg.FormCreate(Sender: TObject);
begin
   FFormShowing := False;
   // delete previously download xml data.
   if Fileexists(ApplicationPath + 'HUKI Download Files\DamListing.xml') then
      Deletefile(ApplicationPath + 'HUKI Download Files\DamListing.xml');
   if Fileexists(ApplicationPath + 'HUKI Download Files\SireListing.xml') then
      Deletefile(ApplicationPath + 'HUKI Download Files\SireListing.xml');

   WinData.CreateTTable(LookUpCalvings,nil,'','Calvings.db');
   LookUpCalvings.Active := True;

end;

procedure TfHFSCalfReg.FormDestroy(Sender: TObject);
begin
   LookUpCalvings.Active := False;
   FreeAndNil(LookUpCalvings);

end;

function TfHFSCalfReg.GetAIDateTime: TDateTime;
begin
   Result := TfmkGetDateTime.GetDateTime('AI Service Date', 'Enter Service Date:');
end;

procedure TfHFSCalfReg.FormActivate(Sender: TObject);
begin
   Update;
   sbLoad.Click;
end;

procedure TfHFSCalfReg.CheckAIDates;
var
   ServiceFound : Boolean;
   PromptForAIServeDate : Boolean;
   AIDateTime : TDateTime;
begin

   with CalfTable do
      begin
         // 07/01/2009 [V3.9 R5.6] /SP Additional Feature - If Dam has not been served, and Sire is a NONE Herd Animal,
         //                                               assume ServiceType is "AI" for HUK registration validation purposes.
         First;
         while not eof do
            begin
               ServiceFound := (FieldByName('AIDate').AsDateTime>0);
               if not ServiceFound then
                  begin
                     if WinData.LookUpDamSire.Locate('ID',FieldByName('SireID').AsInteger,[] ) then
                        begin
                           if WinData.LookUpDamSire.FieldByName('HerdID').AsInteger = WinData.NONEHerdID then
                              begin

                                 // 28/01/2009 [V3.9 R5.8] /SP Additional Feature - Allow user to Select AI Date while registering calves with HUK (formerly known as HUKI )
                                 PromptForAIServeDate := True;
                                 // HUKI require a service date if the Service Type was Artificial Insemination "AI"
                                 // Prompt user for
                                 MessageDlg(Format('No service date has been found for dam: "%s". '+cCRLF+'A service date must be entered before this calf '+
                                            'can be registered with HUK.'+cCRLF+'Please enter service date.',[FieldByName('DamEarNo').AsString]),mtInformation,[mbOK],0);

                                 while PromptForAIServeDate do
                                    begin
                                       AIDateTime := GetAIDateTime;
                                       if ( AIDateTime <= 0 ) then
                                          begin
                                             PromptForAIServeDate := (MessageDlg(Format('Are you sure you want to skip registration for calf: "%s"',[FieldByName('CalfEarNo').AsString]),mtConfirmation,[mbYes,mbNo],0) = idNo);
                                             if not PromptForAIServeDate then
                                                {begin
                                                   MessageDlg('Please enter service date.',mtInformation,[mbOK],0);
                                                end
                                             else}
                                                begin
                                                   MessageDlg(Format('Calf "%s" will be ignored.',[FieldByName('CalfEarNo').AsString]),mtInformation,[mbOK],0);
                                                   Edit;
                                                   FieldByName('Ignore').AsBoolean := True;
                                                   Post;
                                                end;
                                          end
                                       else
                                          begin
                                             if (AIDateTime >= FieldByName('CalfDOB').AsDateTime) then
                                                begin
                                                   MessageDlg(Format('Service date cannot be after calf''s date of birth: "%s"',[FormatDate(FieldByName('CalfDOB').AsDateTime,dsIrish)]),mtError,[mbOK],0);
                                                end
                                             else
                                                begin
                                                   PromptForAIServeDate := False;
                                                   Edit;
                                                   FieldByName('ServiceType').AsString := 'AI';
                                                   FieldByName('AIDate').AsDateTime := AIDateTime;
                                                   FieldByName('DateOfService').AsDateTime := FieldByName('AIDate').AsDateTime;
                                                   Post;
                                                end;
                                          end;
                                    end;
                              end;
                        end;
                  end;
               Next;
            end;
   end;
end;

procedure TfHFSCalfReg.ViewRegisteredCalves1Click(Sender: TObject);
begin
   Screen.Cursor := crHourGlass;
   try
      QueryRegCalves.Active := true;
      pRegCalves.show;
   finally
      Screen.Cursor := crDefault;
   end;
end;

procedure TfHFSCalfReg.cxButton1Click(Sender: TObject);
begin
   QueryRegCalves.Active := False;
   pRegCalves.Hide;
end;

end.
